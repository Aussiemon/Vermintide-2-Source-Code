require("scripts/utils/ai_debugger")
require("scripts/helpers/level_helper")
require("scripts/helpers/network_utils")

VISUAL_DEBUGGING_ENABLED = VISUAL_DEBUGGING_ENABLED or false
GLOBAL_AI_NAVWORLD = GLOBAL_AI_NAVWORLD or {}
AISystem = class(AISystem, ExtensionSystemBase)
local script_data = script_data
local POSITION_LOOKUP = POSITION_LOOKUP
local Vector3_distance = Vector3.distance
local Vector3_dot = Vector3.dot
local Vector3_normalize = Vector3.normalize
local sqrt = math.sqrt
local unit_alive = Unit.alive
script_data.disable_ai_perception = script_data.disable_ai_perception or Development.parameter("disable_ai_perception")
local ai_trees_created = false
local NAV_COST_MAP_MAX_VOLUMES = 1024
local NAV_COST_MAP_MAX_COST_MAPS = 128
local NAV_COST_MAP_RECOMPUTATION_INTERVAL = 0.5
local RPCS = {
	"rpc_alert_enemies_within_range",
	"rpc_set_allowed_nav_layer",
	"rpc_change_tentacle_state",
	"rpc_sync_tentacle_path",
	"rpc_set_ward_state",
	"rpc_set_hit_reaction_template",
	"rpc_set_corruptor_beam_state"
}
local extensions = {
	"AISimpleExtension",
	"AiHuskBaseExtension",
	"PlayerBotBase"
}
AISystem.init = function (self, context, name)
	AISystem.super.init(self, context, name, extensions)

	self.broadphase = Broadphase(50, 128)
	self._behavior_trees = {}
	self.group_blackboard = {
		rats_currently_moving_to_ip = 0,
		special_targets = {},
		disabled_by_special = {},
		broadphase = self.broadphase,
		slots = {},
		slots_cleared = {}
	}

	self.create_all_trees(self)

	local nav_world = GwNavWorld.create(Matrix4x4.identity())
	self._nav_world = nav_world
	GLOBAL_AI_NAVWORLD = nav_world

	if PLATFORM ~= Application.WIN32 then
		GwNavWorld.set_pathfinder_budget(nav_world, 0.0045)
	end

	if not script_data.disable_crowd_dispersion then
		GwNavWorld.enable_crowd_dispersion(nav_world)
	end

	if script_data.debug_enabled and script_data.navigation_visual_debug_enabled and not VISUAL_DEBUGGING_ENABLED then
		VISUAL_DEBUGGING_ENABLED = true

		GwNavWorld.init_visual_debug_server(nav_world, 4888)
	end

	if not script_data.navigation_thread_disabled then
		GwNavWorld.init_async_update(nav_world)
	end

	local level_settings = LevelHelper:current_level_settings()
	local level_name = level_settings.level_name

	if LEVEL_EDITOR_TEST then
		level_name = Application.get_data("LevelEditor", "level_resource_name")
	end

	if not level_settings.no_nav_mesh then
		self._nav_data = GwNavWorld.add_navdata(nav_world, level_name)

		if script_data.debug_enabled then
			self.ai_debugger = AIDebugger:new(context.world, nav_world, self.group_blackboard, self.is_server, context.free_flight_manager)
		end
	end

	self._nav_cost_map_id_data = {
		size = 0,
		current_id = 1,
		ids = Script.new_array(NAV_COST_MAP_MAX_COST_MAPS),
		max_size = NAV_COST_MAP_MAX_COST_MAPS
	}
	self._nav_cost_map_volume_id_data = {
		size = 0,
		current_id = 1,
		ids = Script.new_array(NAV_COST_MAP_MAX_VOLUMES),
		max_size = NAV_COST_MAP_MAX_VOLUMES
	}
	self._nav_cost_maps_data = Script.new_array(NAV_COST_MAP_MAX_COST_MAPS)
	self._should_recompute_nav_cost_maps = false
	self._previous_nav_cost_map_recomputation_t = 0
	self.unit_extension_data = {}
	self.blackboards = BLACKBOARDS
	self.ai_blackboard_updates = {}
	self.ai_blackboard_prioritized_updates = {}
	self.ai_update_index = 1
	self._units_to_destroy = {}
	self.ai_units_alive = {}
	self.ai_units_perception_continuous = {}
	self.ai_units_perception = {}
	self.ai_units_perception_prioritized = {}
	self.num_perception_units = 0
	self.number_ordinary_aggroed_enemies = 0
	self.number_special_aggored_enemies = 0
	self.start_prio_index = 1
	local network_event_delegate = context.network_event_delegate
	self._network_event_delegate = network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	if not self.is_server then
		self._initialize_client_traverse_logic(self, nav_world)
	end

	self._hot_join_sync_units = {}

	for layer_name, _ in pairs(NAV_TAG_VOLUME_LAYER_COST_AI) do
		NAV_TAG_VOLUME_LAYER_COST_AI[layer_name] = 1
	end

	for layer_name, _ in pairs(NAV_TAG_VOLUME_LAYER_COST_BOTS) do
		NAV_TAG_VOLUME_LAYER_COST_BOTS[layer_name] = 1
	end

	return 
end
AISystem.get_nav_cost_maps_data = function (self)
	return self._nav_cost_maps_data, NAV_COST_MAP_MAX_COST_MAPS
end
AISystem.create_nav_cost_map = function (self, cost_layer, num_volumes_guess)
	local cost_map_id_data = self._nav_cost_map_id_data
	local cost_map_id = cost_map_id_data.current_id
	local cost_map_ids = cost_map_id_data.ids
	local cost_map_ids_size = cost_map_id_data.size
	local cost_map_ids_max_size = cost_map_id_data.max_size
	local cost_map_layer_id = NAV_COST_MAP_LAYER_ID_MAPPING[cost_layer]

	fassert(cost_map_ids_size < cost_map_ids_max_size, "Error! Too many Nav Cost Maps!")

	while cost_map_ids[cost_map_id] do
		cost_map_id = cost_map_id%cost_map_ids_max_size + 1
	end

	local nav_world = self._nav_world
	self._nav_cost_maps_data[cost_map_id] = {
		recompute = false,
		cost_map = GwNavCostMap.create(nav_world, cost_map_layer_id),
		volumes = Script.new_map(num_volumes_guess)
	}
	cost_map_id_data.size = cost_map_ids_size + 1
	cost_map_id_data.current_id = cost_map_id
	cost_map_ids[cost_map_id] = true

	return cost_map_id
end
AISystem.destroy_nav_cost_map = function (self, cost_map_id)
	local cost_map_id_data = self._nav_cost_map_id_data
	local cost_map_ids_size = cost_map_id_data.size
	local cost_map_ids = cost_map_id_data.ids
	local cost_map_data = self._nav_cost_maps_data[cost_map_id]

	fassert(cost_map_data, "Error! Trying to Destroy Unknown Nav Cost Map!")

	local volumes = cost_map_data.volumes

	fassert(table.is_empty(volumes), "Error! You must remove associated Nav Cost Map Volumes before destroying the Nav Cost Map!")
	GwNavCostMap.destroy(cost_map_data.cost_map)

	self._nav_cost_maps_data[cost_map_id] = nil
	cost_map_ids[cost_map_id] = false
	cost_map_id_data.size = cost_map_ids_size - 1
	self._should_recompute_nav_cost_maps = true

	return 
end
AISystem.add_nav_cost_map_box_volume = function (self, transform, scale_vector, cost_map_id)
	local volume_id_data = self._nav_cost_map_volume_id_data
	local volume_id = volume_id_data.current_id
	local volume_ids = volume_id_data.ids
	local volume_ids_size = volume_id_data.size
	local volume_ids_max_size = volume_id_data.max_size

	fassert(volume_ids_size < volume_ids_max_size, "Error! Too many Nav Cost Map Volumes!")

	while volume_ids[volume_id] do
		volume_id = volume_id%volume_ids_max_size + 1
	end

	local cost_map_data = self._nav_cost_maps_data[cost_map_id]

	fassert(cost_map_data ~= nil, "Error! Trying to Add Volume to Unknown Nav Cost Map!")

	local cost_map = cost_map_data.cost_map
	local volume = GwNavCostMap.create_box_volume(transform, scale_vector)

	GwNavCostMap.add_volume(cost_map, volume)

	cost_map_data.recompute = true
	cost_map_data.volumes[volume_id] = volume
	volume_id_data.size = volume_ids_size + 1
	volume_id_data.current_id = volume_id
	volume_ids[volume_id] = true
	self._should_recompute_nav_cost_maps = true

	return volume_id
end
AISystem.add_nav_cost_map_sphere_volume = function (self, position, radius, cost_map_id)
	local volume_id_data = self._nav_cost_map_volume_id_data
	local volume_id = volume_id_data.current_id
	local volume_ids = volume_id_data.ids
	local volume_ids_size = volume_id_data.size
	local volume_ids_max_size = volume_id_data.max_size

	fassert(volume_ids_size < volume_ids_max_size, "Error! Too many Nav Cost Map Volumes!")

	while volume_ids[volume_id] do
		volume_id = volume_id%volume_ids_max_size + 1
	end

	local cost_map_data = self._nav_cost_maps_data[cost_map_id]

	fassert(cost_map_data ~= nil, "Error! Trying to Add Volume to Unknown Nav Cost Map!")

	local cost_map = cost_map_data.cost_map
	local volume = GwNavCostMap.create_sphere_volume(position, radius)

	GwNavCostMap.add_volume(cost_map, volume)

	cost_map_data.recompute = true
	cost_map_data.volumes[volume_id] = volume
	volume_id_data.size = volume_ids_size + 1
	volume_id_data.current_id = volume_id
	volume_ids[volume_id] = true
	self._should_recompute_nav_cost_maps = true

	return volume_id
end
AISystem.set_nav_cost_map_volume_transform = function (self, volume_id, cost_map_id, transform)
	local volume_id_data = self._nav_cost_map_volume_id_data
	local volume_ids = volume_id_data.ids

	fassert(volume_ids[volume_id], "Error! Trying to Set Transform for Unknown Nav Cost Map Volume!")

	local cost_map_data = self._nav_cost_maps_data[cost_map_id]

	fassert(cost_map_data ~= nil, "Error! Trying to Set Transform for Volume from Unknown Nav Cost Map!")

	local volumes = cost_map_data.volumes
	local volume = volumes[volume_id]

	GwNavCostMap.set_volume_transform(volume, transform)

	local cost_map = cost_map_data.cost_map
	cost_map_data.recompute = true
	self._should_recompute_nav_cost_maps = true

	return 
end
AISystem.set_nav_cost_map_volume_scale = function (self, volume_id, cost_map_id, scale)
	local volume_id_data = self._nav_cost_map_volume_id_data
	local volume_ids = volume_id_data.ids

	fassert(volume_ids[volume_id], "Error! Trying to Set Scale for Unknown Nav Cost Map Volume!")

	local cost_map_data = self._nav_cost_maps_data[cost_map_id]

	fassert(cost_map_data ~= nil, "Error! Trying to Set Scale for Volume from Unknown Nav Cost Map!")

	local volumes = cost_map_data.volumes
	local volume = volumes[volume_id]

	GwNavCostMap.set_volume_scale(volume, scale)

	local cost_map = cost_map_data.cost_map
	cost_map_data.recompute = true
	self._should_recompute_nav_cost_maps = true

	return 
end
AISystem.remove_nav_cost_map_volume = function (self, volume_id, cost_map_id)
	local volume_id_data = self._nav_cost_map_volume_id_data
	local volume_id_size = volume_id_data.size
	local volume_ids = volume_id_data.ids

	fassert(volume_ids[volume_id], "Error! Trying to Remove Unknown Nav Cost Map Volume!")

	local cost_map_data = self._nav_cost_maps_data[cost_map_id]

	fassert(cost_map_data ~= nil, "Error! Trying to Remove Volume from Unknown Nav Cost Map!")

	local volumes = cost_map_data.volumes
	local volume = volumes[volume_id]
	local cost_map = cost_map_data.cost_map

	GwNavCostMap.remove_volume(cost_map, volume)
	GwNavCostMap.destroy_volume(volume)

	cost_map_data.recompute = true
	cost_map_data.volumes[volume_id] = nil
	volume_ids[volume_id] = false
	volume_id_data.size = volume_id_size - 1
	self._should_recompute_nav_cost_maps = true

	return 
end
AISystem._recompute_nav_cost_maps = function (self)
	local nav_cost_maps_data = self._nav_cost_maps_data

	for i = 1, NAV_COST_MAP_MAX_COST_MAPS, 1 do
		local cost_map_data = nav_cost_maps_data[i]

		if cost_map_data and cost_map_data.recompute then
			local cost_map = cost_map_data.cost_map

			GwNavCostMap.recompute(cost_map)

			cost_map_data.recompute = false
		end
	end

	return 
end
AISystem._initialize_client_traverse_logic = function (self, nav_world)
	local nav_tag_layer_costs = {
		bot_poison_wind = 1,
		bot_ratling_gun_fire = 1,
		fire_grenade = 1
	}

	table.merge(nav_tag_layer_costs, NAV_TAG_VOLUME_LAYER_COST_AI)

	local navtag_layer_cost_table = GwNavTagLayerCostTable.create()
	self._navtag_layer_cost_table = navtag_layer_cost_table

	AiUtils.initialize_cost_table(navtag_layer_cost_table, nav_tag_layer_costs)

	local nav_cost_map_cost_table = GwNavCostMap.create_tag_cost_table()
	self._nav_cost_map_cost_table = nav_cost_map_cost_table

	AiUtils.initialize_nav_cost_map_cost_table(nav_cost_map_cost_table, nil, 1)

	self._traverse_logic = GwNavTraverseLogic.create(nav_world, nav_cost_map_cost_table)

	GwNavTraverseLogic.set_navtag_layer_cost_table(self._traverse_logic, navtag_layer_cost_table)

	return 
end
AISystem.destroy = function (self)
	AISystem.super.destroy(self)

	if self.ai_debugger then
		self.ai_debugger:destroy()
	end

	self.broadphase = nil
	local nav_cost_maps_data = self._nav_cost_maps_data

	for i = 1, NAV_COST_MAP_MAX_COST_MAPS, 1 do
		local cost_map_data = nav_cost_maps_data[i]

		if cost_map_data then
			local cost_map = cost_map_data.cost_map

			GwNavCostMap.destroy(cost_map)
		end
	end

	self._nav_cost_maps_data = nil

	if self._nav_data then
		GwNavWorld.remove_navdata(nil, self._nav_data)
	end

	GwNavWorld.destroy(self._nav_world)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil

	if not self.is_server and self._traverse_logic ~= nil then
		GwNavTagLayerCostTable.destroy(self._navtag_layer_cost_table)
		GwNavCostMap.destroy_tag_cost_table(self._nav_cost_map_cost_table)
		GwNavTraverseLogic.destroy(self._traverse_logic)
	end

	return 
end
AISystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = AISystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)
	self.unit_extension_data[unit] = extension

	if not extension.is_husk then
		if not extension.is_bot then
			self.ai_blackboard_updates[#self.ai_blackboard_updates + 1] = unit
		end

		local blackboard = extension.blackboard(extension)
		self.blackboards[unit] = blackboard

		self.set_default_blackboard_values(self, unit, blackboard)
	end

	if extension_name == "AISimpleExtension" then
		self.ai_units_alive[unit] = extension
		local breed = extension._breed

		if breed.perception_continuous then
			self.ai_units_perception_continuous[unit] = extension
		else
			self.ai_units_perception[unit] = extension
		end

		if breed.immediate_threat then
			AiUtils.activate_unit(extension._blackboard)
		end

		local sync_func = breed.hot_join_sync

		if sync_func then
			self._hot_join_sync_units[unit] = sync_func
		end

		self.num_perception_units = self.num_perception_units + 1
	end

	return extension
end
AISystem.use_perception_continuous = function (self, unit, set)
	local extension = self.ai_units_alive[unit]

	if set then
		self.ai_units_perception_continuous[unit] = extension
		self.ai_units_perception[unit] = nil
	else
		self.ai_units_perception_continuous[unit] = nil
		self.ai_units_perception[unit] = extension
	end

	return 
end
AISystem.set_default_blackboard_values = function (self, unit, blackboard)
	blackboard.destination_dist = 0
	blackboard.current_health_percent = 1
	blackboard.have_slot = 0
	blackboard.wait_slot_distance = math.huge
	blackboard.target_dist = math.huge
	blackboard.target_dist_z = math.huge
	blackboard.target_dist_xy_sq = math.huge
	blackboard.ally_distance = math.huge
	blackboard.slot_dist_z = math.huge
	blackboard.move_speed = 0
	blackboard.total_slots_count = 0
	blackboard.total_occupied_slots = 0
	blackboard.target_speed_away = 0
	blackboard.target_speed_away_small_sample = 0

	return 
end
AISystem.on_remove_extension = function (self, unit, extension_name)
	self.on_freeze_extension(self, unit, extension_name)

	if self._hot_join_sync_units[unit] then
		self._hot_join_sync_units[unit] = nil
	end

	self.blackboards[unit] = nil

	AISystem.super.on_remove_extension(self, unit, extension_name)

	return 
end
AISystem.on_freeze_extension = function (self, unit, extension_name)
	if self.unit_extension_data[unit] == nil then
		return 
	end

	self.unit_extension_data[unit] = nil
	local ai_blackboard_updates = self.ai_blackboard_updates
	local ai_blackboard_updates_n = #ai_blackboard_updates
	local ai_blackboard_prioritized_updates = self.ai_blackboard_prioritized_updates
	local ai_blackboard_prioritized_updates_n = #ai_blackboard_prioritized_updates

	for i = 1, ai_blackboard_updates_n, 1 do
		if ai_blackboard_updates[i] == unit then
			ai_blackboard_updates[i] = ai_blackboard_updates[ai_blackboard_updates_n]
			ai_blackboard_updates[ai_blackboard_updates_n] = nil
		end
	end

	for i = 1, ai_blackboard_prioritized_updates_n, 1 do
		if ai_blackboard_prioritized_updates[i] == unit then
			ai_blackboard_prioritized_updates[i] = ai_blackboard_prioritized_updates[ai_blackboard_prioritized_updates_n]
			ai_blackboard_prioritized_updates[ai_blackboard_prioritized_updates_n] = nil
		end
	end

	self.ai_units_alive[unit] = nil
	self.ai_units_perception[unit] = nil
	self.ai_units_perception_continuous[unit] = nil
	self.ai_units_perception_prioritized[unit] = nil

	if extension_name == "AISimpleExtension" then
		self.num_perception_units = self.num_perception_units - 1
	end

	return 
end
AISystem.register_prioritized_perception_unit_update = function (self, unit, ai_extension)
	self.ai_units_perception_prioritized[unit] = ai_extension

	return 
end
AISystem.update = function (self, context, t)
	local dt = context.dt

	if not ai_trees_created then
		self.create_all_trees(self)
	end

	Profiler.start("PlayerBotBase")
	self.update_extension(self, "PlayerBotBase", dt, context, t)
	Profiler.stop("PlayerBotBase")
	Profiler.start("AiHuskBaseExtension")
	self.update_extension(self, "AiHuskBaseExtension", dt, context, t)
	Profiler.stop("AiHuskBaseExtension")
	Profiler.start("NavCostMap Recomputation")

	if self._should_recompute_nav_cost_maps and self._previous_nav_cost_map_recomputation_t + NAV_COST_MAP_RECOMPUTATION_INTERVAL < t then
		self._recompute_nav_cost_maps(self)

		self._should_recompute_nav_cost_maps = false
		self._previous_nav_cost_map_recomputation_t = t
	end

	Profiler.stop("NavCostMap Recomputation")
	Profiler.start("AISimpleExtension")
	self.update_alive(self)
	self.update_perception(self, t, dt)
	self.update_brains(self, t, dt)
	self.update_game_objects(self)
	self.update_broadphase(self)

	if script_data.debug_enabled then
		Profiler.start("update_debug")
		self.update_debug_unit(self, t)
		self.update_debug_draw(self, t)
		Profiler.stop("update_debug")
	end

	Profiler.stop("AISimpleExtension")

	for id, unit in pairs(self._units_to_destroy) do
		local extension = self.ai_units_alive[unit]

		Managers.state.conflict:destroy_unit(unit, extension._blackboard, "intentionally_destroyed")

		self._units_to_destroy[id] = nil
	end

	return 
end
AISystem.physics_async_update = function (self, context, t)
	local dt = context.dt

	Profiler.start("update blackboards")
	self.update_ai_blackboards_prioritized(self, t, dt)
	self.update_ai_blackboards(self, t, dt)
	Profiler.stop("update blackboards")

	return 
end
AISystem.update_alive = function (self)
	Profiler.start("update_alive")

	for unit, extension in pairs(self.ai_units_alive) do
		local is_alive = extension._health_extension == nil or extension._health_extension:is_alive()

		if not is_alive then
			self.ai_units_alive[unit] = nil
			self.ai_units_perception[unit] = nil
			self.ai_units_perception_continuous[unit] = nil
			self.ai_units_perception_prioritized[unit] = nil
		end
	end

	Profiler.stop("update_alive")

	return 
end
AISystem._update_taunt = function (self, t, blackboard)
	local taunt_end_time = blackboard.taunt_end_time
	local taunt_unit = blackboard.taunt_unit

	if taunt_end_time and (taunt_end_time < t or not Unit.alive(taunt_unit)) then
		blackboard.taunt_unit = nil
		blackboard.taunt_end_time = nil
	elseif taunt_end_time then
		blackboard.target_unit = blackboard.taunt_unit
	end

	return 
end
AISystem.update_perception = function (self, t, dt)
	if script_data.disable_ai_perception then
		return 
	end

	Profiler.start("update_perception")

	local PerceptionUtils = PerceptionUtils
	local ai_units_perception = self.ai_units_perception

	Profiler.start("continuous")

	for unit, extension in pairs(self.ai_units_perception_continuous) do
		local blackboard = extension._blackboard
		local breed = extension._breed
		local perception_continuous_name = breed.perception_continuous
		local perception_function = PerceptionUtils[perception_continuous_name]

		Profiler.start(perception_continuous_name)

		local needs_perception = perception_function(unit, blackboard, breed, t, dt)
		ai_units_perception[unit] = (needs_perception and extension) or nil

		self._update_taunt(self, t, blackboard)
		Profiler.stop(perception_continuous_name)
	end

	Profiler.stop("continuous")
	Profiler.start("prioritized perception")

	local ai_units_perception_prioritized = self.ai_units_perception_prioritized

	for unit, extension in pairs(ai_units_perception_prioritized) do
		local blackboard = extension._blackboard
		local breed = extension._breed
		local target_selection_func_name = extension._target_selection_func_name
		local perception_func_name = extension._perception_func_name
		local perception_function = PerceptionUtils[perception_func_name]
		local target_selection_function = PerceptionUtils[target_selection_func_name]

		Profiler.start(target_selection_func_name)
		perception_function(unit, blackboard, breed, target_selection_function, t, dt)
		self._update_taunt(self, t, blackboard)
		Profiler.stop(target_selection_func_name)

		ai_units_perception_prioritized[unit] = nil
	end

	Profiler.stop("prioritized perception")
	Profiler.start("perception")

	local current_perception_unit = self.current_perception_unit
	current_perception_unit = (self.ai_units_perception[current_perception_unit] ~= nil and current_perception_unit) or nil
	local TIME_BETWEEN_UPDATE = 1
	local num_perception_units = self.num_perception_units
	local num_to_update = math.ceil((num_perception_units*dt)/TIME_BETWEEN_UPDATE)

	for i = 1, num_to_update, 1 do
		current_perception_unit = next(ai_units_perception, current_perception_unit)

		if current_perception_unit == nil then
			break
		end

		local extension = ai_units_perception[current_perception_unit]
		local blackboard = extension._blackboard
		local breed = extension._breed
		local target_selection_func_name = extension._target_selection_func_name
		local perception_func_name = extension._perception_func_name
		local perception_function = PerceptionUtils[perception_func_name]
		local target_selection_function = PerceptionUtils[target_selection_func_name]

		Profiler.start(target_selection_func_name)
		perception_function(current_perception_unit, blackboard, breed, target_selection_function, t, dt)
		self._update_taunt(self, t, blackboard)
		Profiler.stop(target_selection_func_name)
	end

	Profiler.stop("perception")

	self.current_perception_unit = current_perception_unit

	if script_data.debug_ai_perception then
		local debug_unit = script_data.debug_unit

		if unit_alive(debug_unit) then
			local gui = self.ai_debugger and self.ai_debugger.screen_gui
			local ai_ext = self.ai_units_alive[debug_unit]

			if ai_ext then
				local y = PerceptionUtils.debug_ai_perception(debug_unit, ai_ext, ai_ext._blackboard, t, gui, 0, 0)

				if self.ai_units_perception_continuous[debug_unit] then
					PerceptionUtils.debug_rat_ogre_perception(gui, t, 0, y, ai_ext._blackboard)
				end
			end
		end
	end

	Profiler.stop("update_perception")

	return 
end
AISystem.update_brains = function (self, t, dt)
	local number_ordinary_aggroed_enemies = 0
	local number_special_aggored_enemies = 0
	local Profiler_start = Profiler.start
	local Profiler_stop = Profiler.stop

	Profiler.start("update_brains")

	for unit, extension in pairs(self.ai_units_alive) do
		local bt = extension._brain._bt
		local blackboard = extension._blackboard
		local result = bt.root(bt):evaluate(unit, blackboard, t, dt)
		local breed = blackboard.breed

		if breed.special then
			if blackboard.target_unit then
				number_special_aggored_enemies = number_special_aggored_enemies + 1
			end
		elseif blackboard.target_unit and blackboard.confirmed_player_sighting then
			number_ordinary_aggroed_enemies = number_ordinary_aggroed_enemies + 1
		end
	end

	Profiler.stop("update_brains")

	self.number_ordinary_aggroed_enemies = number_ordinary_aggroed_enemies
	self.number_special_aggored_enemies = number_special_aggored_enemies

	return 
end
AISystem.update_game_objects = function (self)
	Profiler.start("update_game_objects")

	local game = Managers.state.network:game()
	local NetworkLookup_bt_action_names = NetworkLookup.bt_action_names
	local GameSession_set_game_object_field = GameSession.set_game_object_field
	local unit_storage = Managers.state.unit_storage

	for unit, extension in pairs(self.ai_units_alive) do
		local game_object_id = unit_storage.go_id(unit_storage, unit)
		local action_name = extension.current_action_name(extension)
		local action_id = NetworkLookup_bt_action_names[action_name]

		GameSession_set_game_object_field(game, game_object_id, "bt_action_name", action_id)
	end

	Profiler.stop("update_game_objects")

	return 
end
AISystem.update_broadphase = function (self)
	Profiler.start("update_broadphase")

	local POSITION_LOOKUP = POSITION_LOOKUP
	local broadphase = self.broadphase

	for unit, extension in pairs(self.ai_units_alive) do
		local broadphase_id = extension.broadphase_id

		if broadphase_id then
			local position = POSITION_LOOKUP[unit]

			Broadphase.move(broadphase, extension.broadphase_id, position)
		end
	end

	Profiler.stop("update_broadphase")

	return 
end
AISystem.update_debug_unit = function (self, t)
	local unit = script_data.debug_unit

	if not unit_alive(unit) then
		return 
	end

	local extension = self.ai_units_alive[unit]

	if extension == nil then
		return 
	end

	local blackboard = extension._blackboard
	local leaf_node = extension._brain._bt:root()

	while leaf_node and leaf_node.current_running_child(leaf_node, blackboard) do
		leaf_node = leaf_node.current_running_child(leaf_node, blackboard)
	end

	local btnode_name = (leaf_node and leaf_node.id(leaf_node)) or "unknown_node"
	blackboard.btnode_name = btnode_name
	local breed = extension._breed
	local debug_flag = breed.debug_flag

	if not script_data[debug_flag] then
		if debug_flag then
			Debug.text("Enable debug setting %q for additional debugging of ai unit", debug_flag)
		end

		return 
	end

	local debug_class = breed.debug_class

	debug_class.update(unit, blackboard, t)

	return 
end
AISystem.update_debug_draw = function (self, t)
	if script_data.debug_behaviour_trees then
		for unit, extension in pairs(self.ai_units_alive) do
			local brain = extension._brain

			brain.debug_draw_behaviours(brain)
		end
	end

	if script_data.debug_ai_targets then
		local debug_sphere_position = nil

		for unit, extension in pairs(self.ai_units_alive) do
			local blackboard = extension._blackboard
			local enemy = blackboard.target_unit

			if unit_alive(enemy) then
				local ai_pos = Unit.local_position(unit, 0) + Vector3.up()*2

				QuickDrawer:line(ai_pos, Unit.world_position(enemy, 0) + Vector3(0, 0, 1.5), Color(125, 255, 0, 0))
				QuickDrawer:box(Unit.world_pose(enemy, 0), Vector3(0.5, 0.5, 1.5), Color(125, 255, 0, 0))
			end
		end
	end

	if script_data.debug_stagger then
		for unit, extension in pairs(self.ai_units_alive) do
			local blackboard = extension._blackboard
			local stagger_immunity = blackboard.stagger_immunity

			if not stagger_immunity then
			else
				local color = Managers.state.debug:color(unit)
				local x, y, z, w = Quaternion.to_elements(color)
				local color_vector = Vector3(y, z, w)
				local viewport_name = "player_1"
				local head_node = Unit.node(unit, "c_head")

				Managers.state.debug_text:clear_unit_text(unit, "stagger_immunity")

				local health_percent = blackboard.current_health_percent
				local health = "health:" .. health_percent
				local health_threshold = stagger_immunity.health_threshold
				local index = 1

				Managers.state.debug_text:output_unit_text(health, 0.2, unit, head_node, Vector3.up()*0.2*index, 0.1, "stagger_immunity", color_vector, viewport_name)

				index = index + 1

				if health_threshold < health_percent then
					Managers.state.debug_text:output_unit_text("damage left:" .. health_percent - health_threshold, 0.2, unit, head_node, Vector3.up()*0.2*index, 0.1, "stagger_immunity", color_vector, viewport_name)

					index = index + 1

					Managers.state.debug_text:output_unit_text("STAGGER_IMMUNE:HIGH_HEALTH", 0.2, unit, head_node, Vector3.up()*0.2*index, 0.1, "stagger_immunity", color_vector, viewport_name)

					index = index + 1
				else
					local action = blackboard.action
					local ignore_staggers = action and action.ignore_staggers

					if ignore_staggers then
						local ignore_stagger_info = action.name .. ": "

						for i = 1, 7, 1 do
							local ignore_stagger_value = (type(ignore_staggers[i]) == "table" and tostring(ignore_staggers[i].health.min < health_percent and health_percent <= ignore_staggers[i].health.max)) or tostring(ignore_staggers[i])
							ignore_stagger_info = ignore_stagger_info .. "[" .. ignore_stagger_value .. "]"
						end

						Managers.state.debug_text:output_unit_text(ignore_stagger_info, 0.2, unit, head_node, Vector3.up()*0.2*index, 0.1, "stagger_immunity", color_vector, viewport_name)

						index = index + 1
					end

					local stagger_immune = false

					if stagger_immunity.stagger_immune_at then
						stagger_immune = t < stagger_immunity.stagger_immune_at + stagger_immunity.time and 0 < stagger_immunity.debug_damage_left

						if stagger_immune then
							local time_left = math.round_with_precision((stagger_immunity.stagger_immune_at + stagger_immunity.time) - t, 2)

							Managers.state.debug_text:output_unit_text("time left:" .. time_left, 0.2, unit, head_node, Vector3.up()*0.2*index, 0.1, "stagger_immunity", color_vector, viewport_name)

							index = index + 1

							Managers.state.debug_text:output_unit_text("damage left:" .. stagger_immunity.debug_damage_left, 0.2, unit, head_node, Vector3.up()*0.2*index, 0.1, "stagger_immunity", color_vector, viewport_name)

							index = index + 1

							Managers.state.debug_text:output_unit_text("STAGGER_IMMUNE:HITS", 0.2, unit, head_node, Vector3.up()*0.2*index, 0.1, "stagger_immunity", color_vector, viewport_name)

							index = index + 1
						end
					end

					if not stagger_immune then
						local hits_until_stagger_immunity = "hits_until_stagger_immunity:" .. stagger_immunity.num_attacks - (stagger_immunity.num_hits or 0)

						Managers.state.debug_text:output_unit_text(hits_until_stagger_immunity, 0.2, unit, head_node, Vector3.up()*0.2*index, 0.1, "stagger_immunity", color_vector, viewport_name)

						index = index + 1
					end
				end
			end
		end
	end

	return 
end
local PRIORITIZED_DISTANCE = 10

local function update_blackboard(unit, blackboard, t, dt)
	assert(blackboard)

	local POSITION_LOOKUP = POSITION_LOOKUP

	for _, action_data in pairs(blackboard.utility_actions) do
		action_data.time_since_last = t - action_data.last_time
		action_data.time_since_last_done = t - action_data.last_done_time
	end

	if blackboard.is_in_attack_cooldown then
		blackboard.is_in_attack_cooldown = t < blackboard.attack_cooldown_at
	end

	local ai_base_extension = ScriptUnit.extension(unit, "ai_system")

	ai_base_extension.update_stagger_count(ai_base_extension)

	local health_extension = ScriptUnit.has_extension(unit, "health_system")

	if health_extension then
		blackboard.current_health_percent = health_extension.current_health_percent(health_extension)
	end

	local current_position = POSITION_LOOKUP[unit]
	local navigation_extension = blackboard.navigation_extension

	if navigation_extension then
		blackboard.destination_dist = navigation_extension.distance_to_destination(navigation_extension, current_position)
	end

	local ai_slot_system = Managers.state.entity:system("ai_slot_system")
	blackboard.have_slot = (ai_slot_system.ai_unit_have_slot(ai_slot_system, unit) and 1) or 0
	blackboard.wait_slot_distance = ai_slot_system.ai_unit_wait_slot_distance(ai_slot_system, unit)
	blackboard.total_slots_count = ai_slot_system.num_total_enemies
	blackboard.total_occupied_slots = ai_slot_system.num_occupied_slots
	local target_unit = blackboard.target_unit
	local target_alive = unit_alive(target_unit)
	local breed = blackboard.breed

	if breed.wake_up_push and target_alive and 0 < blackboard.stagger then
		blackboard.wake_up_push = 0
	end

	if breed.using_combo then
		if target_alive then
			local last_combo_t = Unit.get_data(target_unit, "last_combo_t")

			if last_combo_t then
				blackboard.time_since_last_combo = t - last_combo_t
			else
				blackboard.time_since_last_combo = 9999
			end
		else
			blackboard.time_since_last_combo = 9999
		end
	end

	if target_alive and breed.has_running_attack then
		local target_locomotion = ScriptUnit.has_extension(target_unit, "locomotion_system")

		if target_locomotion then
			if target_locomotion.average_velocity then
				blackboard.target_speed_away = Vector3_dot(target_locomotion.average_velocity(target_locomotion), Vector3_normalize(POSITION_LOOKUP[target_unit] - current_position))
			else
				blackboard.target_speed_away = 0
			end

			if target_locomotion.small_sample_size_average_velocity then
				blackboard.target_speed_away_small_sample = Vector3_dot(target_locomotion.small_sample_size_average_velocity(target_locomotion), Vector3_normalize(POSITION_LOOKUP[target_unit] - current_position))
			else
				blackboard.target_speed_away_small_sample = 0
			end
		else
			blackboard.target_speed_away = 0
			blackboard.target_speed_away_small_sample = 0
		end
	else
		blackboard.target_speed_away = 0
		blackboard.target_speed_away_small_sample = 0
	end

	local active_node = blackboard.active_node
	local active_node_name = active_node and active_node.name
	blackboard.is_following_target = active_node_name and active_node_name == "BTClanRatFollowAction"
	local locomotion_extension = blackboard.locomotion_extension
	blackboard.is_falling = locomotion_extension and locomotion_extension.is_falling(locomotion_extension)
	blackboard.move_speed = locomotion_extension and locomotion_extension.move_speed

	if blackboard.next_smart_object_data then
		local smart_object_type = blackboard.next_smart_object_data.smart_object_type

		if smart_object_type == "doors" or smart_object_type == "planks" then
			local door_system = blackboard.door_system or Managers.state.entity:system("door_system")
			local door_unit = blackboard.next_smart_object_data.smart_object_data.unit
			local door_is_open = door_system.unit_extension_data[door_unit].current_state ~= "closed"
			blackboard.next_smart_object_data.disabled = door_is_open
		end
	end

	if breed.run_on_update then
		breed.run_on_update(unit, blackboard, t, dt)
	end

	if target_alive then
		local unit_position = POSITION_LOOKUP[unit]
		local target_position = POSITION_LOOKUP[target_unit]
		local offset = target_position - unit_position
		local z = offset.z
		local x = offset.x
		local y = offset.y
		local flat_sq = x*x + y*y
		blackboard.target_dist_z = z
		blackboard.target_dist_xy_sq = flat_sq
		local target_dist = sqrt(flat_sq + z*z)
		local inside_priority_distance = target_dist < PRIORITIZED_DISTANCE
		blackboard.target_dist = target_dist
		local slot_pos = ai_slot_system.ai_unit_slot_position(ai_slot_system, unit) or current_position
		local slot_dist = slot_pos.z - current_position.z
		blackboard.slot_dist_z = slot_dist

		return inside_priority_distance
	else
		blackboard.target_unit = nil
		blackboard.target_dist = math.huge
		blackboard.target_dist_z = math.huge
		blackboard.target_dist_xy_sq = math.huge
		blackboard.slot_dist_z = math.huge
	end

	return false
end

local MAX_PRIO_UPDATES_PER_FRAME = (PLATFORM == "win32" and 40) or 20
AISystem.update_ai_blackboards_prioritized = function (self, t, dt)
	Profiler.start("prio")

	local ai_blackboard_updates = self.ai_blackboard_updates
	local num_normal = #ai_blackboard_updates
	local prio_updates = self.ai_blackboard_prioritized_updates
	local num_prio = #prio_updates
	local blackboards = self.blackboards
	local index = self.start_prio_index
	local loops = MAX_PRIO_UPDATES_PER_FRAME

	if num_prio < loops then
		loops = num_prio
		index = 1
	end

	local i = 1

	while i <= loops do
		if num_prio < index then
			index = 1
		end

		local unit = prio_updates[index]
		local blackboard = blackboards[unit]
		local inside_priority_distance = update_blackboard(unit, blackboard, t, dt)

		if not inside_priority_distance then
			prio_updates[index] = prio_updates[num_prio]
			prio_updates[num_prio] = nil
			ai_blackboard_updates[num_normal + 1] = unit
			num_normal = num_normal + 1
			num_prio = num_prio - 1
		else
			index = index + 1
		end

		i = i + 1
	end

	self.start_prio_index = index

	Profiler.stop("prio")

	return 
end
local AI_UPDATES_PER_FRAME = 2
AISystem.update_ai_blackboards = function (self, t, dt)
	Profiler.start("nonprio")

	local ai_blackboard_updates = self.ai_blackboard_updates
	local ai_blackboard_updates_n = #ai_blackboard_updates
	local ai_blackboard_prioritized_updates = self.ai_blackboard_prioritized_updates
	local ai_blackboard_prioritized_updates_n = #ai_blackboard_prioritized_updates
	local blackboards = self.blackboards
	local ai_updates_this_frame = 0
	local index = self.ai_update_index

	if ai_blackboard_updates_n < index then
		index = 1
	end

	while index <= ai_blackboard_updates_n do
		local unit = ai_blackboard_updates[index]
		local blackboard = blackboards[unit]
		local inside_priority_distance = update_blackboard(unit, blackboard, t, dt)

		if inside_priority_distance then
			ai_blackboard_updates[index] = ai_blackboard_updates[ai_blackboard_updates_n]
			ai_blackboard_updates[ai_blackboard_updates_n] = nil
			ai_blackboard_prioritized_updates[ai_blackboard_prioritized_updates_n + 1] = unit
			ai_blackboard_updates_n = #ai_blackboard_updates
			ai_blackboard_prioritized_updates_n = #ai_blackboard_prioritized_updates
		else
			index = index + 1
		end

		ai_updates_this_frame = ai_updates_this_frame + 1

		if AI_UPDATES_PER_FRAME <= ai_updates_this_frame then
			break
		end
	end

	self.ai_update_index = index

	Profiler.stop("nonprio")

	return 
end
AISystem.nav_world = function (self)
	return self._nav_world
end
AISystem.client_traverse_logic = function (self)
	return self._traverse_logic
end
AISystem.get_tri_on_navmesh = function (self, pos)
	return GwNavQueries.triangle_from_position(self._nav_world, pos, 30, 30)
end
AISystem.set_allowed_layer = function (self, layer_name, allowed)
	if self.is_server then
		local entity_manager = Managers.state.entity
		local nav_world = self._nav_world
		local layer_id = LAYER_ID_MAPPING[layer_name]
		NAV_TAG_VOLUME_LAYER_COST_AI[layer_name] = (allowed and 1) or 0
		NAV_TAG_VOLUME_LAYER_COST_BOTS[layer_name] = (allowed and 1) or 0
		local ai_extensions = entity_manager.get_entities(entity_manager, "AINavigationExtension")

		for _, extension in pairs(ai_extensions) do
			extension.allow_layer(extension, layer_name, allowed)

			if not allowed then
				local unit = extension._unit

				if Unit.alive(unit) then
					local unit_position = POSITION_LOOKUP[unit]

					if NavTagVolumeUtils.inside_nav_tag_layer(nav_world, unit_position, 0.5, 0.5, layer_name) then
						AiUtils.kill_unit(unit, nil, nil, "inside_forbidden_tag_volume", Vector3(0, 0, 0))
					else
						local destination_position = extension.destination(extension)

						if NavTagVolumeUtils.inside_nav_tag_layer(nav_world, destination_position, 0.5, 0.5, layer_name) then
							extension.reset_destination(extension)
						end
					end
				end
			end
		end

		local bot_nav_transition_manager = Managers.state.bot_nav_transition

		bot_nav_transition_manager.allow_layer(bot_nav_transition_manager, layer_name, allowed)
		Managers.state.entity:system("ai_slot_system"):set_allowed_layer(layer_name, allowed)
		Managers.state.entity:system("ai_group_system"):set_allowed_layer(layer_name, allowed)
		self.network_transmit:send_rpc_clients("rpc_set_allowed_nav_layer", layer_id, allowed)
	end

	return 
end
AISystem.alert_enemies_within_range = function (self, unit, position, radius)
	if not NetworkUtils.network_safe_position(position) then
		Application.warning("Trying to alert enemies outside of safe network position")

		return 
	end

	if self.is_server then
		PerceptionUtils.alert_enemies_within_range(self.world, unit, true, position, radius)
	else
		local unit_id = Managers.state.unit_storage:go_id(unit)

		self.network_transmit:send_rpc_server("rpc_alert_enemies_within_range", unit_id, position, radius)
	end

	return 
end
AISystem.rpc_alert_enemies_within_range = function (self, peer_id, unit_id, position, radius)
	local unit = Managers.state.unit_storage:unit(unit_id)

	self.alert_enemies_within_range(self, unit, position, radius)

	return 
end
AISystem.rpc_set_ward_state = function (self, peer_id, unit_id, state)
	local unit = Managers.state.unit_storage:unit(unit_id)

	AiUtils.stormvermin_champion_set_ward_state(unit, state, false)

	return 
end
AISystem.rpc_set_hit_reaction_template = function (self, peer_id, unit_id, hit_effect_template)
	local unit = Managers.state.unit_storage:unit(unit_id)
	local hit_reaction_extension = ScriptUnit.extension(unit, "hit_reaction_system")

	hit_reaction_extension.set_hit_effect_template_id(hit_reaction_extension, hit_effect_template)

	return 
end
AISystem.rpc_change_tentacle_state = function (self, peer_id, tentacle_unit_id, target_unit_id, tentacle_template_id, tentacle_reach_dist, server_time)
	local tentacle_unit = Managers.state.unit_storage:unit(tentacle_unit_id)
	local target_unit = Managers.state.unit_storage:unit(target_unit_id)
	local template_name = NetworkLookup.tentacle_template[tentacle_template_id]
	local tentacle_extension = ScriptUnit.has_extension(tentacle_unit, "ai_supplementary_system")

	if tentacle_extension then
		tentacle_extension.set_target(tentacle_extension, template_name, target_unit, tentacle_reach_dist)
		tentacle_extension.set_server_time(tentacle_extension, server_time)
	end

	return 
end
AISystem.rpc_sync_tentacle_path = function (self, peer_id, tentacle_unit_id, point_array)
	local tentacle_unit = Managers.state.unit_storage:unit(tentacle_unit_id)
	local tentacle_extension = ScriptUnit.has_extension(tentacle_unit, "ai_supplementary_system")

	if tentacle_extension then
		tentacle_extension.set_astar_points(tentacle_extension, point_array)
	end

	return 
end
AISystem.rpc_set_corruptor_beam_state = function (self, peer_id, unit_id, state, target_unit_id)
	local unit = Managers.state.unit_storage:unit(unit_id)
	local target_unit = Managers.state.unit_storage:unit(target_unit_id)
	local corruptor_beam_extension = ScriptUnit.has_extension(unit, "ai_beam_effect_system")

	if unit and corruptor_beam_extension then
		corruptor_beam_extension.set_state(corruptor_beam_extension, state, Managers.player:is_player_unit(target_unit) and target_unit)
	end

	return 
end
AISystem.rpc_set_allowed_nav_layer = function (self, peer_id, layer_id, allowed)
	local layer_name = LAYER_ID_MAPPING[layer_id]
	NAV_TAG_VOLUME_LAYER_COST_AI[layer_name] = (allowed and 1) or 0
	NAV_TAG_VOLUME_LAYER_COST_BOTS[layer_name] = (allowed and 1) or 0

	if allowed then
		GwNavTagLayerCostTable.allow_layer(self._navtag_layer_cost_table, layer_id)
	else
		GwNavTagLayerCostTable.forbid_layer(self._navtag_layer_cost_table, layer_id)
	end

	return 
end
AISystem.hot_join_sync = function (self, sender)
	local size = #LAYER_ID_MAPPING

	for i = NavTagVolumeStartLayer, size, 1 do
		local layer_name = LAYER_ID_MAPPING[i]
		local allowed = 0 < NAV_TAG_VOLUME_LAYER_COST_AI[layer_name]

		self.network_transmit:send_rpc("rpc_set_allowed_nav_layer", sender, i, allowed)
	end

	for unit, func in pairs(self._hot_join_sync_units) do
		func(sender, unit)
	end

	return 
end
AISystem.create_all_trees = function (self)
	ai_trees_created = true

	for tree_name, root in pairs(BreedBehaviors) do
		local tree = BehaviorTree:new(root, tree_name)
		self._behavior_trees[tree_name] = tree
	end

	for tree_name, root in pairs(BotBehaviors) do
		local tree = BehaviorTree:new(root, tree_name)
		self._behavior_trees[tree_name] = tree
	end

	return 
end
AISystem.behavior_tree = function (self, tree_name)
	return self._behavior_trees[tree_name]
end
AISystem.register_unit_for_destruction = function (self, unit)
	self._units_to_destroy[unit] = unit

	return 
end

return 
