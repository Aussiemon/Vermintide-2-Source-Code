-- chunkname: @scripts/unit_extensions/generic/linker_transportation_extension.lua

require("scripts/helpers/navigation_utils")

LinkerTransportationExtension = class(LinkerTransportationExtension)

local UPDATE_INTERVAL_OOBB_NO_HUMANS_INSIDE = 1
local UPDATE_INTERVAL_OOBB_HUMANS_INSIDE = 0.05
local STORY_STATES = {
	"stopped_beginning",
	"moving_forward",
	"moving_backward",
	"stopped_end",
}

for i, state in ipairs(STORY_STATES) do
	STORY_STATES[state] = i
end

local unit_alive = Unit.alive

LinkerTransportationExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.world = extension_init_context.world
	self.is_server = Managers.player.is_server

	local story_name = Unit.get_data(unit, "transportation_data", "story_name")
	local story_teller = World.storyteller(self.world)
	local level = LevelHelper:current_level(self.world)

	self._bot_slots_offset = {
		0,
		1,
		-1,
	}
	self._bot_slots = {}
	self.story_teller = story_teller

	local story_id = story_teller:play_level_story(level, story_name)

	self.story_id = story_id

	story_teller:set_speed(story_id, 0)

	self.story_state = "stopped_beginning"
	self.current_story_time = 0
	self.auto_exit = Unit.get_data(unit, "transportation_data", "auto_exit")
	self.teleport_on_enter = Unit.get_data(unit, "transportation_data", "teleport_on_enter")
	self.teleport_on_exit = Unit.get_data(unit, "transportation_data", "teleport_on_exit")
	self.takes_party = Unit.get_data(unit, "transportation_data", "takes_party")
	self.return_to_start = Unit.get_data(unit, "transportation_data", "return_to_start")
	self.transported_units = {}
	self.transported_ai_units = {}
	self._transported_generic_units = {}
	self.has_nav_obstacles = false

	local bounding_box_mesh_name = Unit.get_data(unit, "transportation_data", "bounding_box_mesh")

	if bounding_box_mesh_name ~= "" then
		local mesh = Unit.mesh(unit, bounding_box_mesh_name)
		local _, size = Mesh.box(mesh)
		local max_extent = math.max(size.x, size.y, size.z)

		self.oobb_mesh_max_extent = max_extent
		self.oobb_mesh = mesh
		self.oobb_next_update = 0
		self.units_inside_oobb = {
			human = {
				count = 0,
				units = {},
			},
			bot = {
				count = 0,
				units = {},
			},
			ai = {
				count = 0,
				units = {},
			},
		}
	end

	self._transporting = false
	self._movement_delta = Vector3Box(0, 0, 0)
	self._rotation_delta = QuaternionBox(Quaternion.identity())
	self._old_position = Vector3Box(Unit.world_position(unit, 0))
	self._old_rotation = QuaternionBox(Unit.world_rotation(unit, 0))
	self._unlink_after_update = false
	self._side = Managers.state.side:get_side_from_name("heroes")

	Managers.state.event:register(self, "new_player_unit", "on_player_unit_spawned")
	Managers.state.event:register(self, "pickup_spawned", "on_pickup_spawned")
	Managers.state.event:register(self, "sister_wall_spawned", "on_sister_wall_spawned")

	self._queued_ai_units_to_remove = {}
	self._nearby_pickup_cache = {}
end

LinkerTransportationExtension.extensions_ready = function (self)
	return
end

LinkerTransportationExtension.movement_delta = function (self)
	return self._movement_delta:unbox(), self._rotation_delta:unbox()
end

LinkerTransportationExtension.register_navmesh_units = function (self, start_unit, end_unit)
	local nav_world = GLOBAL_AI_NAVWORLD
	local obstacle_start, transform_start = NavigationUtils.create_exclusive_box_obstacle_from_unit_data(nav_world, start_unit)

	GwNavBoxObstacle.add_to_world(obstacle_start)
	GwNavBoxObstacle.set_transform(obstacle_start, transform_start)

	local obstacle_end, transform_end = NavigationUtils.create_exclusive_box_obstacle_from_unit_data(nav_world, end_unit)

	GwNavBoxObstacle.add_to_world(obstacle_end)
	GwNavBoxObstacle.set_transform(obstacle_end, transform_end)

	self.nav_obstacle_start = obstacle_start
	self.nav_obstacle_end = obstacle_end
	self.has_nav_obstacles = true

	self:update_nav_obstacles()
end

LinkerTransportationExtension.interacted_with = function (self, interactor_unit)
	if self.story_state == "stopped_beginning" then
		self.story_state = "moving_forward"

		Unit.flow_event(self.unit, "lua_transportation_story_started")
	end

	self:update_nav_obstacles()

	local transported_units = self.transported_units
	local num_transported_units = #transported_units

	if num_transported_units > 0 then
		self:_unlink_all_transported_units()
	else
		self:_link_all_transported_units(interactor_unit)
	end
end

LinkerTransportationExtension.hot_join_sync = function (self, peer)
	local network_manager = Managers.state.network
	local level_id = Level.unit_index(LevelHelper:current_level(self.world), self.unit)
	local state = self.story_state
	local story_time = self.current_story_time
	local channel_id = PEER_ID_TO_CHANNEL[peer]

	if self._transporting then
		local interactor_unit

		for i, unit in ipairs(self.transported_units) do
			if Unit.alive(unit) then
				interactor_unit = unit

				break
			end
		end

		if interactor_unit then
			local interactor_unit_id = network_manager:unit_game_object_id(interactor_unit)

			RPC.rpc_hot_join_sync_linker_transporting(channel_id, level_id, interactor_unit_id)
		end
	end

	RPC.rpc_hot_join_sync_linker_transport_state(channel_id, level_id, STORY_STATES[state], story_time)

	local transported_generic_units = self._transported_generic_units

	if not table.is_empty(transported_generic_units) then
		local all_go_ids, all_matrices, all_is_level_unit_arr = {}, {}, {}
		local num_transported_generic_units = 0

		for generic_unit, matrix in pairs(transported_generic_units) do
			local go_id, is_level_unit = network_manager:game_object_or_level_id(generic_unit)

			if go_id then
				num_transported_generic_units = num_transported_generic_units + 1
				all_go_ids[num_transported_generic_units] = go_id
				all_matrices[num_transported_generic_units] = matrix:unbox()
				all_is_level_unit_arr[num_transported_generic_units] = is_level_unit
			end
		end

		local rpc_limit = table.min({
			Network.type_info("game_object_id_array").max_size,
			Network.type_info("position_array").max_size,
			Network.type_info("rotation_array").max_size,
			Network.type_info("bool_array").max_size,
		})
		local num_rpcs = math.ceil(num_transported_generic_units / rpc_limit)

		for rpc_i = 1, num_rpcs do
			local game_object_ids = {}
			local positions = {}
			local rotations = {}
			local is_level_unit_arr = {}
			local from_index, to_index = (rpc_i - 1) * rpc_limit + 1, math.min(rpc_i * rpc_limit, num_transported_generic_units)
			local idx = 0

			for i = from_index, to_index do
				local go_id = all_go_ids[i]
				local is_level_unit = all_is_level_unit_arr[i]
				local matrix = all_matrices[i]

				idx = idx + 1
				game_object_ids[idx] = go_id
				is_level_unit_arr[idx] = is_level_unit
				positions[idx] = Matrix4x4.translation(matrix)
				rotations[idx] = Matrix4x4.rotation(matrix)
			end

			RPC.rpc_hot_join_sync_linker_transport_generic_units(channel_id, level_id, game_object_ids, is_level_unit_arr, positions, rotations)
		end
	end
end

LinkerTransportationExtension.rpc_hot_join_sync_linker_transporting = function (self, interactor_unit_id)
	local interactor_unit = Managers.state.network.unit_storage:unit(interactor_unit_id)

	self:interacted_with(interactor_unit)
end

LinkerTransportationExtension.rpc_hot_join_sync_linker_transport_state = function (self, state_id, story_time)
	self.story_state = STORY_STATES[state_id]
	self.current_story_time = story_time

	self:update_nav_obstacles()
end

LinkerTransportationExtension._link_all_transported_units = function (self, interactor_unit)
	assert(not self._transporting, "Trying to link units before unlinking.")

	self._transporting = true

	if self.is_server then
		Managers.state.event:trigger("event_delay_pacing", true)
	end

	local transported_units = self.transported_units

	if Unit.alive(interactor_unit) then
		transported_units[1] = interactor_unit

		self:_link_transported_unit(interactor_unit)
	end

	if self.takes_party then
		local player_and_bot_units = self._side.PLAYER_AND_BOT_UNITS
		local num_transported_ai_units = 0
		local transported_ai_units = self.transported_ai_units

		for i = 1, #player_and_bot_units do
			local unit = player_and_bot_units[i]

			if unit_alive(unit) then
				if unit ~= interactor_unit then
					self:_try_link_player(unit, false)
				end

				if self.is_server then
					local commander_extension = ScriptUnit.extension(unit, "ai_commander_system")

					if commander_extension then
						local pets = commander_extension:get_controlled_units()

						for pet_unit in pairs(pets) do
							num_transported_ai_units = num_transported_ai_units + 1
							transported_ai_units[pet_unit] = num_transported_ai_units

							self:add_transporting_ai_unit(pet_unit, num_transported_ai_units)
						end
					end
				end
			end
		end

		if self.is_server and num_transported_ai_units > 0 then
			local unit_storage = Managers.state.network.unit_storage
			local units_to_sync = Script.new_array(num_transported_ai_units)
			local slots_to_sync = Script.new_array(num_transported_ai_units)
			local unit_idx = 0

			for ai_unit, slot_id in pairs(transported_ai_units) do
				unit_idx = unit_idx + 1
				units_to_sync[unit_idx] = unit_storage:go_id(ai_unit)
				slots_to_sync[unit_idx] = slot_id
			end

			local level_id = Level.unit_index(LevelHelper:current_level(self.world), self.unit)

			Managers.state.network.network_transmit:send_rpc_clients("rpc_add_transporting_ai_units", level_id, units_to_sync, slots_to_sync)
		end
	end

	local units, n = self:_get_inside_generic_units()

	for i = 1, n do
		self:add_transporting_generic_unit(units[i], nil, true)
	end

	Unit.flow_event(self.unit, "activate_collision")
end

LinkerTransportationExtension._try_link_player = function (self, unit, skip_inside_check)
	local status_ext = ScriptUnit.extension(unit, "status_system")
	local player = Managers.player:owner(unit)
	local is_dead = status_ext:is_dead()
	local is_inside_transportation_unit = self:_is_inside_transportation_unit(unit)
	local is_disabled = status_ext:is_disabled()
	local transported_units = self.transported_units

	if not is_dead and (is_inside_transportation_unit or skip_inside_check) then
		transported_units[#transported_units + 1] = unit

		self:_link_transported_unit(unit)
	elseif self:_is_bot(player) and not is_disabled then
		transported_units[#transported_units + 1] = player.player_unit

		self:_link_transported_unit(player.player_unit, true)
	elseif player.local_player and not is_dead and not is_disabled and not is_inside_transportation_unit then
		transported_units[#transported_units + 1] = player.player_unit

		self:_link_transported_unit(player.player_unit, true)
	end
end

LinkerTransportationExtension._is_inside_transportation_unit = function (self, unit, size_modifier)
	local oobb_mesh = self.oobb_mesh
	local oobb_pose, oobb_size = Mesh.box(oobb_mesh)
	local unit_pos = Unit.world_position(unit, 0)

	if size_modifier then
		oobb_size[1] = oobb_size[1] + size_modifier
		oobb_size[2] = oobb_size[2] + size_modifier
		oobb_size[3] = oobb_size[3] + size_modifier
	end

	return math.point_is_inside_oobb(unit_pos, oobb_pose, oobb_size)
end

LinkerTransportationExtension._is_bot = function (self, player)
	if self.is_server then
		return player.bot_player
	elseif player._player_controlled or player.local_player then
		return false
	else
		return true
	end
end

LinkerTransportationExtension.update_units_inside_oobb = function (self)
	local unit = self.unit
	local oobb_mesh = self.oobb_mesh
	local oobb_pose, oobb_size = Mesh.box(oobb_mesh)
	local units_inside_oobb = self.units_inside_oobb

	for _, data in pairs(units_inside_oobb) do
		for u, _ in pairs(data.units) do
			if not HEALTH_ALIVE[u] then
				data.units[u] = nil
				data.count = data.count - 1
			end
		end
	end

	local location = FrameTable.alloc_table()

	location.human = {}
	location.ai = {}

	local players = Managers.player:players()

	for _, player in pairs(players) do
		if not self:_is_bot(player) then
			local u = player.player_unit

			if HEALTH_ALIVE[u] then
				local u_pos = Unit.world_position(u, 0)
				local is_inside = math.point_is_inside_oobb(u_pos, oobb_pose, oobb_size)

				location.human[u] = is_inside
			end
		end
	end

	local ai_system = Managers.state.entity:system("ai_system")
	local ai_broadphase = ai_system.broadphase
	local position = Unit.world_position(unit, 0)
	local nearby_ai_units = FrameTable.alloc_table()
	local num_nearby_ai_units = Broadphase.query(ai_broadphase, position, self.oobb_mesh_max_extent + 1, nearby_ai_units)

	for i = 1, num_nearby_ai_units do
		local u = nearby_ai_units[i]

		if HEALTH_ALIVE[u] then
			local u_pos = Unit.world_position(u, 0)
			local is_inside = math.point_is_inside_oobb(u_pos, oobb_pose, oobb_size)

			location.ai[u] = is_inside
		end
	end

	for type, units in pairs(location) do
		for u, is_inside in pairs(units) do
			local oobb_data = units_inside_oobb[type]

			if is_inside and not oobb_data.units[u] then
				oobb_data.units[u] = true
				oobb_data.count = oobb_data.count + 1
			elseif not is_inside and oobb_data.units[u] then
				oobb_data.units[u] = nil
				oobb_data.count = oobb_data.count - 1
			end
		end
	end

	for u, is_inside in pairs(location.human) do
		local status_extension = ScriptUnit.extension(u, "status_system")
		local arg = is_inside and unit or nil

		status_extension:set_inside_transport_unit(arg)
	end
end

LinkerTransportationExtension.update_nav_obstacles = function (self)
	if not self.has_nav_obstacles then
		return
	end

	local story_state = self.story_state
	local obstacle_start = self.nav_obstacle_start
	local obstacle_end = self.nav_obstacle_end

	if story_state == "stopped_beginning" then
		GwNavBoxObstacle.set_does_trigger_tagvolume(obstacle_start, false)
		GwNavBoxObstacle.set_does_trigger_tagvolume(obstacle_end, true)
	elseif story_state == "moving_forward" then
		GwNavBoxObstacle.set_does_trigger_tagvolume(obstacle_start, true)
		GwNavBoxObstacle.set_does_trigger_tagvolume(obstacle_end, true)
	elseif story_state == "stopped_end" then
		GwNavBoxObstacle.set_does_trigger_tagvolume(obstacle_start, true)
		GwNavBoxObstacle.set_does_trigger_tagvolume(obstacle_end, false)
	elseif story_state == "moving_backward" then
		GwNavBoxObstacle.set_does_trigger_tagvolume(obstacle_start, true)
		GwNavBoxObstacle.set_does_trigger_tagvolume(obstacle_end, true)
	end
end

LinkerTransportationExtension.update = function (self, unit, input, dt, context, t)
	local story_teller = self.story_teller
	local story_id = self.story_id
	local story_length = story_teller:length(story_id)
	local current_time = self.current_story_time
	local new_time = current_time

	if self.story_state == "moving_forward" then
		new_time = current_time + dt

		self:_update_local_player_position()

		if story_length <= new_time then
			new_time = story_length
			self.story_state = "stopped_end"

			if self.auto_exit then
				self:update_nav_obstacles()

				self._unlink_after_update = true
			end

			Unit.flow_event(self.unit, "lua_transportation_story_stopped")
		end
	elseif self.story_state == "stopped_end" then
		local units_inside_oobb = self.units_inside_oobb

		if self.return_to_start and units_inside_oobb and units_inside_oobb.human.count == 0 and units_inside_oobb.bot.count == 0 then
			self.story_state = "moving_backward"

			self:update_nav_obstacles()
			Unit.flow_event(self.unit, "lua_transportation_story_started")
		end
	elseif self.story_state == "moving_backward" then
		new_time = current_time - dt

		if new_time <= 0 then
			new_time = 0
			self.story_state = "stopped_beginning"

			self:update_nav_obstacles()
			Unit.flow_event(self.unit, "lua_transportation_story_stopped")
		end
	end

	story_teller:set_time(story_id, new_time)

	self.current_story_time = new_time

	local units_inside_oobb = self.units_inside_oobb

	if units_inside_oobb and t >= self.oobb_next_update then
		self:update_units_inside_oobb()

		local update_interval = units_inside_oobb.human.count > 0 and UPDATE_INTERVAL_OOBB_HUMANS_INSIDE or UPDATE_INTERVAL_OOBB_NO_HUMANS_INSIDE

		self.oobb_next_update = t + update_interval
	end

	self:_update_queued_removals(t)
end

LinkerTransportationExtension.post_update = function (self, unit, input, dt, context, t)
	local old_pos = self._old_position:unbox()
	local new_pos = Unit.world_position(unit, 0)
	local delta = new_pos - old_pos

	self._movement_delta:store(delta)

	local new_rot = Unit.world_rotation(unit, 0)
	local old_rot = self._old_rotation:unbox()
	local rot_delta = Quaternion.multiply(new_rot, Quaternion.inverse(old_rot))

	self._rotation_delta:store(rot_delta)
	self._old_position:store(new_pos)
	self._old_rotation:store(new_rot)

	if self._unlink_after_update then
		self._unlink_after_update = false
		self._unlink_after_update2 = true
	elseif self._unlink_after_update2 then
		self._unlink_after_update2 = false
		self._unlink_after_update3 = true
	elseif self._unlink_after_update3 then
		self._unlink_after_update3 = false

		self:_unlink_all_transported_units()
	end

	if self.story_state == "moving_forward" then
		self:_update_transported_ai_positions()
		self:_update_transported_generic_unit_positions()
	end
end

LinkerTransportationExtension._update_local_player_position = function (self)
	local player_manager = Managers.player
	local transported_units = self.transported_units
	local num_transported_units = #transported_units

	for i = 1, num_transported_units do
		repeat
			local unit = transported_units[i]

			if not Unit.alive(unit) then
				break
			end

			local unit_owner = player_manager:owner(unit)

			if not unit_owner or not unit_owner.local_player then
				break
			end

			local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
			local platform_unit = locomotion_extension:get_moving_platform()

			if platform_unit ~= self.unit then
				break
			end

			local is_inside_transportation_unit = self:_is_inside_transportation_unit(unit, 1)

			if not is_inside_transportation_unit then
				local index = table.find(self._bot_slots, unit)

				if index == nil then
					index = math.random(1, 4)
				end

				local position = self:_get_position_from_index(index)
				local current_rotation = locomotion_extension:current_rotation()

				locomotion_extension:teleport_to(position, current_rotation)
			end
		until true
	end
end

LinkerTransportationExtension.is_stationary = function (self)
	return self.story_state == "stopped_beginning" or self.story_state == "stopped_end"
end

LinkerTransportationExtension.can_interact = function (self, interactor_unit)
	return self.story_state == "stopped_beginning" and #self.transported_units == 0 or self.story_state == "stopped_end" and not self.auto_exit and self.transported_units[1] == interactor_unit
end

LinkerTransportationExtension.destroy = function (self)
	if Managers.state.event then
		Managers.state.event:unregister("new_player_unit", self)
		Managers.state.event:unregister("pickup_spawned", self)
	end

	if self._transporting and self.is_server then
		Managers.state.event:trigger("event_delay_pacing", false)
	end

	if self.has_nav_obstacles then
		GwNavBoxObstacle.destroy(self.nav_obstacle_start)

		self.nav_obstacle_start = nil

		GwNavBoxObstacle.destroy(self.nav_obstacle_end)

		self.nav_obstacle_end = nil
	end

	if self.units_inside_oobb then
		local human_players = self.units_inside_oobb.human.units

		for player_unit, _ in pairs(human_players) do
			if unit_alive(player_unit) then
				local status_extension = ScriptUnit.extension(player_unit, "status_system")

				status_extension:set_inside_transport_unit(nil)
			end
		end

		self.units_inside_oobb = nil
	end

	self.transported_units = nil
	self.oobb_mesh = nil
end

LinkerTransportationExtension._unlink_all_transported_units = function (self)
	assert(self._transporting, "Trying to unlink units before linking.")

	self._transporting = false

	self:_update_transported_ai_positions()
	self:_update_transported_generic_unit_positions()

	if self.is_server then
		Managers.state.event:trigger("event_delay_pacing", false)
	end

	local transported_units = self.transported_units
	local num_transported_units = #transported_units

	for i = 1, num_transported_units do
		local transported_unit = transported_units[i]

		transported_units[i] = nil

		if unit_alive(transported_unit) then
			self:_unlink_transported_unit(transported_unit)
		end
	end

	for ai_unit in pairs(self.transported_ai_units) do
		if unit_alive(ai_unit) then
			self:queue_ai_transport_unit_for_removal(ai_unit)
		end
	end

	table.clear(self.transported_ai_units)
	table.clear(self._transported_generic_units)
	Unit.flow_event(self.unit, "deactivate_collision")
end

LinkerTransportationExtension._unlink_transported_unit = function (self, unit_to_unlink)
	local unit = self.unit
	local locomotion_extension = ScriptUnit.extension(unit_to_unlink, "locomotion_system")
	local status_extension = ScriptUnit.extension(unit_to_unlink, "status_system")
	local player_manager = Managers.player
	local player = player_manager:owner(unit_to_unlink)
	local index = table.find(self._bot_slots, unit_to_unlink)

	if index then
		table.remove(self._bot_slots, index)
	end

	status_extension:set_using_transport(false)

	if player and (player.local_player or player.bot_player) then
		locomotion_extension:set_on_moving_platform(nil)

		if self.teleport_on_exit then
			local end_position = Unit.world_position(unit, Unit.node(unit, "g_end"))
			local current_rotation = locomotion_extension:current_rotation()

			locomotion_extension:teleport_to(end_position, current_rotation)
		end
	end
end

LinkerTransportationExtension._get_position_from_index = function (self, index)
	local unit = self.unit
	local position

	if Unit.has_node(unit, "elevator_slot_0" .. index) then
		local node = Unit.node(unit, "elevator_slot_0" .. index)

		position = Unit.world_position(unit, node)
	end

	return position
end

LinkerTransportationExtension._link_transported_unit = function (self, unit_to_link, teleport_on_enter)
	local unit = self.unit
	local player_manager = Managers.player
	local player = player_manager:owner(unit_to_link)
	local unit_side = Managers.state.side.side_by_unit[unit_to_link]

	if unit_side.side_id ~= self._side.side_id then
		local status_extension = ScriptUnit.extension(unit_to_link, "status_system")

		status_extension:set_using_transport(true)
	end

	local locomotion_extension = ScriptUnit.extension(unit_to_link, "locomotion_system")

	if teleport_on_enter or self.teleport_on_enter then
		local index = #self._bot_slots + 1

		self._bot_slots[index] = unit_to_link

		local position = self:_get_position_from_index(index)

		if not player.remote then
			local current_rotation = locomotion_extension:current_rotation()

			locomotion_extension:teleport_to(position, current_rotation)
		end
	end

	if not player.remote then
		locomotion_extension:set_on_moving_platform(unit)
	end
end

LinkerTransportationExtension.assign_position_to_bot = function (self)
	return Unit.world_position(self.unit, 0)
end

local AI_SLOT_SIZE = 0.5

LinkerTransportationExtension.get_ai_slot = function (self, slot_id)
	local unit = self.unit

	if not self._ai_slot_offsets then
		local groups = {}
		local max_group_size_sq = 100
		local max_z_diff = 0.1
		local node_i = 1

		while Unit.has_node(unit, "elevator_slot_0" .. node_i) do
			local node = Unit.node(unit, "elevator_slot_0" .. node_i)
			local position = Unit.local_position(unit, node)
			local selected_group_index

			for group_i = 1, #groups do
				local group_pos = groups[group_i].center:unbox()

				if max_z_diff > math.abs(group_pos[3] - position[3]) and max_group_size_sq > Vector3.distance_squared(Vector3.flat(group_pos), Vector3.flat(position)) then
					selected_group_index = group_i

					break
				end
			end

			selected_group_index = selected_group_index or #groups + 1

			local group = groups[selected_group_index]

			if group then
				table.insert(group.positions, Vector3Box(position))

				local center = Vector3.zero()

				for i = 1, #group.positions do
					center = center + group.positions[i]:unbox()
				end

				group.center:store(center / #group.positions)
				group.min:store(Vector3.min(group.min:unbox(), position))
				group.max:store(Vector3.max(group.max:unbox(), position))
			else
				group = {
					positions = {
						Vector3Box(position),
					},
					center = Vector3Box(position),
					min = Vector3Box(position),
					max = Vector3Box(position),
				}
				groups[selected_group_index] = group
			end

			node_i = node_i + 1
		end

		self._ai_slot_offsets = groups

		for i = 1, #groups do
			local group = groups[i]
			local min, max = group.min:unbox(), group.max:unbox()
			local box_shrink = 0.7
			local center = Vector3.lerp(min, max, 0.5)
			local from_center = Vector3.normalize(max - center) * box_shrink

			min = min + from_center
			max = max - from_center

			local size = max - min
			local slots_x = size.x > 0 and math.ceil(size.x / AI_SLOT_SIZE) or 1
			local slots_y = size.y > 0 and math.ceil(size.y / AI_SLOT_SIZE) or 1

			group.num_slots_x = slots_x
			group.num_slots_y = slots_y
			group.offset_start = Vector3Box(min)
		end
	end

	local group = self._ai_slot_offsets[math.index_wrapper(slot_id, #self._ai_slot_offsets)]
	local offset_start = group.offset_start:unbox()
	local slot_x = math.ceil(slot_id / #self._ai_slot_offsets) % group.num_slots_x
	local slot_y = math.floor(slot_id / group.num_slots_x) % group.num_slots_y
	local pose = Unit.world_pose(unit, 0)
	local position = Matrix4x4.transform(pose, offset_start + Vector3(slot_x * AI_SLOT_SIZE, slot_y * AI_SLOT_SIZE, 0))

	return position
end

LinkerTransportationExtension.add_transporting_ai_unit = function (self, unit, slot_id)
	if self.is_server then
		local blackboard = BLACKBOARDS[unit]

		if blackboard then
			blackboard.is_transported = self
			blackboard.transport_slot_id = slot_id
		end
	end

	self.transported_ai_units[unit] = slot_id
	self._queued_ai_units_to_remove[unit] = nil
end

LinkerTransportationExtension.add_transporting_generic_unit = function (self, generic_unit, optional_pose, skip_sync)
	local relative_pose = optional_pose or Matrix4x4.multiply(Unit.world_pose(generic_unit, 0), Matrix4x4.inverse(Unit.world_pose(self.unit, 0)))

	self._transported_generic_units[generic_unit] = Matrix4x4Box(relative_pose)

	if self.is_server then
		local level_id = Level.unit_index(LevelHelper:current_level(self.world), self.unit)
		local generic_unit_id, is_level_unit = Managers.state.network:game_object_or_level_id(generic_unit)

		Managers.state.network.network_transmit:send_rpc_clients("rpc_add_transporting_generic_unit", level_id, generic_unit_id, is_level_unit, Matrix4x4.translation(relative_pose), Matrix4x4.rotation(relative_pose))
	end
end

LinkerTransportationExtension._client_predict_transport_generic_unit = function (self, unit)
	if not self._transported_generic_units[unit] then
		self:add_transporting_generic_unit(unit, nil, true)
	end
end

LinkerTransportationExtension.queue_ai_transport_unit_for_removal = function (self, unit)
	if self.is_server then
		self._queued_ai_units_to_remove[unit] = true
	else
		self:remove_transporting_ai_unit(unit)
	end
end

LinkerTransportationExtension._update_queued_removals = function (self, t)
	local next_unit = next(self._queued_ai_units_to_remove, self._last_checked_queued_removal)

	self._last_checked_queued_removal = next_unit

	if next_unit then
		if not ALIVE[next_unit] then
			self:remove_transporting_ai_unit(next_unit)

			self._queued_ai_units_to_remove[next_unit] = nil

			return
		end

		local blackboard = BLACKBOARDS[next_unit]
		local slot_pos = self:get_ai_slot(blackboard.transport_slot_id)
		local success = GwNavQueries.triangle_from_position(GLOBAL_AI_NAVWORLD, slot_pos, 1, 1)

		if success then
			self:remove_transporting_ai_unit(next_unit)

			self._queued_ai_units_to_remove[next_unit] = nil

			return
		end
	end
end

LinkerTransportationExtension.remove_transporting_ai_unit = function (self, unit)
	if self.is_server then
		local blackboard = BLACKBOARDS[unit]

		if blackboard then
			blackboard.is_transported = nil
			blackboard.transport_slot_id = nil
		end
	end

	self.transported_ai_units[unit] = nil
end

LinkerTransportationExtension._update_transported_ai_positions = function (self)
	for ai_unit, slot_id in pairs(self.transported_ai_units) do
		if ALIVE[ai_unit] then
			local slot_position = self:get_ai_slot(slot_id)
			local locomotion_ext = ScriptUnit.has_extension(ai_unit, "locomotion_system")

			if locomotion_ext then
				local rotation = Unit.world_rotation(ai_unit, 0)
				local velocity = slot_position - POSITION_LOOKUP[ai_unit]

				locomotion_ext:teleport_to(slot_position, rotation, velocity, true)
			else
				Unit.set_local_position(ai_unit, 0, slot_position)
			end
		else
			self.transported_ai_units[ai_unit] = nil
		end
	end
end

LinkerTransportationExtension._update_transported_generic_unit_positions = function (self)
	local boat_pose = Unit.world_pose(self.unit, 0)

	for generic_unit, relative_pose_boxed in pairs(self._transported_generic_units) do
		if Unit.alive(generic_unit) then
			local wanted_pose = Matrix4x4.multiply(relative_pose_boxed:unbox(), boat_pose)

			self:_move_generic_unit(generic_unit, wanted_pose)
		else
			self._transported_generic_units[generic_unit] = nil
		end
	end
end

LinkerTransportationExtension._move_generic_unit = function (self, generic_unit, wanted_pose)
	local is_pickup = ScriptUnit.has_extension(generic_unit, "pickup_system")

	if is_pickup then
		local pickup_system = Managers.state.entity:system("pickup_system")

		pickup_system:move_pickup_local_pose(generic_unit, wanted_pose)

		return
	end

	local prop_extension = ScriptUnit.has_extension(generic_unit, "props_system")

	if prop_extension then
		if prop_extension.move_prop then
			prop_extension:move_prop(wanted_pose)
		end

		return
	end

	local wanted_position = Matrix4x4.translation(wanted_pose)
	local wanted_rotation = Matrix4x4.rotation(wanted_pose)

	Unit.set_local_position(generic_unit, 0, wanted_position)
	Unit.set_local_rotation(generic_unit, 0, wanted_rotation)
end

LinkerTransportationExtension.on_player_unit_spawned = function (self, player, unit, unique_id)
	local unit_side = Managers.state.side.side_by_unit[unit]

	if unit_side ~= self._side then
		return
	end

	if self._transporting then
		local skip_inside_check = player.remote

		self:_try_link_player(unit, skip_inside_check)
	end
end

LinkerTransportationExtension.on_pickup_spawned = function (self, pickup_unit)
	if self._reference_teleport_unit then
		self:teleport_non_character_elevator_units(self._reference_teleport_unit)

		return
	end

	if self._transporting then
		local is_inside = self:_is_inside_transportation_unit(pickup_unit)

		if is_inside then
			if self.is_server then
				self:add_transporting_generic_unit(pickup_unit, nil, false)
			else
				self:_client_predict_transport_generic_unit(pickup_unit)
			end
		end
	end
end

LinkerTransportationExtension.on_sister_wall_spawned = function (self, sister_wall_unit)
	if self._reference_teleport_unit then
		self:teleport_non_character_elevator_units(self._reference_teleport_unit)

		return
	end

	if self._transporting then
		local is_inside = self:_is_inside_transportation_unit(sister_wall_unit)

		if is_inside then
			if self.is_server then
				self:add_transporting_generic_unit(sister_wall_unit, nil, false)
			else
				self:_client_predict_transport_generic_unit(sister_wall_unit)
			end
		end
	end
end

local _get_inside_generic_units_scratch = {}

LinkerTransportationExtension._get_inside_generic_units = function (self)
	table.clear(_get_inside_generic_units_scratch)

	local num_units = 0
	local pickup_system = Managers.state.entity:system("pickup_system")
	local boat_pos = Unit.world_position(self.unit, 0)
	local nearby_pickups = self._nearby_pickup_cache
	local num_nearby_pickups = pickup_system:get_pickups(boat_pos, self.oobb_mesh_max_extent + 1, nearby_pickups)

	for i = 1, num_nearby_pickups do
		local pickup_unit = nearby_pickups[i]
		local is_inside = self:_is_inside_transportation_unit(pickup_unit)

		if is_inside then
			num_units = num_units + 1
			_get_inside_generic_units_scratch[num_units] = pickup_unit
		end
	end

	local thorn_sister_walls = Managers.state.entity:get_entities("ThornSisterWallExtension")

	for wall_unit, extension in pairs(thorn_sister_walls) do
		local is_inside = self:_is_inside_transportation_unit(wall_unit)

		if is_inside then
			num_units = num_units + 1
			_get_inside_generic_units_scratch[num_units] = wall_unit
		end
	end

	local active_respawn_datas = Managers.state.game_mode:game_mode():get_available_and_active_respawn_units()

	for i = 1, #active_respawn_datas do
		local respawn_unit = active_respawn_datas[i].unit
		local is_inside = self:_is_inside_transportation_unit(respawn_unit)

		if is_inside then
			num_units = num_units + 1
			_get_inside_generic_units_scratch[num_units] = respawn_unit
		end
	end

	return _get_inside_generic_units_scratch, num_units
end

LinkerTransportationExtension.teleport_non_character_elevator_units = function (self, reference_unit)
	self._reference_teleport_unit = reference_unit
	self._reference_teleport_seed = self._reference_teleport_seed or Managers.mechanism:get_level_seed()

	local function safe_navigation_callback()
		local reference_pos = Unit.local_position(reference_unit, 0)
		local radius = 3
		local max_tries = 3
		local units, n = self:_get_inside_generic_units()

		table.sort(units, function (a, b)
			local go_id_a = Managers.state.unit_storage:go_id(a) or HashUtils.fnv32_hash(tostring(a))
			local go_id_b = Managers.state.unit_storage:go_id(b) or HashUtils.fnv32_hash(tostring(b))

			return go_id_a < go_id_b
		end)

		for i = 1, n do
			local unit = units[i]
			local tries = 1

			while tries <= max_tries do
				local seed, x, y = math.get_uniformly_random_point_inside_sector_seeded(self._reference_teleport_seed, 0, radius, 0, math.tau)

				self._reference_teleport_seed = seed

				local pos = reference_pos + Vector3(x, y)
				local success, altitude = GwNavQueries.triangle_from_position(GLOBAL_AI_NAVWORLD, pos, 1, 1)

				if success then
					pos = Vector3(pos.x, pos.y, altitude)
				else
					pos = reference_pos
				end

				local pose = Matrix4x4.from_quaternion_position_scale(pos, Unit.local_rotation(unit, 0), Unit.local_scale(unit, 0))

				self:_move_generic_unit(unit, pose)

				self._transported_generic_units[unit] = nil
			end
		end
	end

	local ai_navigation_system = Managers.state.entity:system("ai_navigation_system")

	ai_navigation_system:add_safe_navigation_callback(safe_navigation_callback)
end
