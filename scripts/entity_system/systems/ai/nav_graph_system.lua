-- chunkname: @scripts/entity_system/systems/ai/nav_graph_system.lua

NavGraphSystem = class(NavGraphSystem, ExtensionSystemBase)

local WANTED_LEDGELATOR_VERSION = "2017.MAY.05.05"
local extensions = {
	"NavGraphConnectorExtension",
	"LevelUnitSmartObjectExtension",
	"DynamicUnitSmartObjectExtension",
	"DarkPactClimbingExtension",
}

script_data.nav_mesh_debug = script_data.nav_mesh_debug or Development.parameter("nav_mesh_debug")
use_simple_jump_units = true

NavGraphSystem.init = function (self, context, system_name)
	local entity_manager = context.entity_manager

	entity_manager:register_system(self, system_name, extensions)

	self.entity_manager = entity_manager
	self.world = context.world
	self._is_server = context.is_server
	self._stored_jump_data = {}
	self.unit_extension_data = {}
	self._use_level_jumps = Managers.state.game_mode:setting("use_level_jumps")

	if self._use_level_jumps then
		self.level_jumps = {}
		self._jumps_are_shown = false
		self._level_jumps_ready = false
		self.jumps_broadphase_max_dist = 25
		self.jumps_broadphase = Broadphase(self.jumps_broadphase_max_dist, 2048)
	end

	local ai_system = Managers.state.entity:system("ai_system")

	self.nav_world = ai_system:nav_world()

	local version
	local level_settings = LevelHelper:current_level_settings(self.world)
	local level_path = level_settings.level_name

	if LEVEL_EDITOR_TEST then
		level_path = Application.get_data("LevelEditor", "level_resource_name")
	end

	local num_nested_levels = LevelResource.nested_level_count(level_path)

	if num_nested_levels > 0 then
		level_path = LevelResource.nested_level_resource_name(level_path, 0)
	end

	if level_settings.no_nav_mesh then
		self.ledgelator_version = WANTED_LEDGELATOR_VERSION
		self.smart_objects = {}
		self.no_nav_mesh = true
	elseif level_path then
		local smart_object_path = level_path .. "_smartobjects"
		local ledge_path = level_path .. "_ledges"

		if Application.can_get("lua", smart_object_path) then
			local smart_objects = require(smart_object_path)

			self.smart_objects, self.smart_object_count, version = smart_objects.smart_objects, smart_objects.smart_object_count, smart_objects.version
			self.ledgelator_version = smart_objects.ledgelator_version

			if self.smart_objects == nil then
				self.smart_objects = smart_objects
			end

			package.loaded[smart_object_path] = nil
			package.load_order[#package.load_order] = nil
		elseif Application.can_get("lua", ledge_path) then
			self.smart_objects = require(ledge_path)
			package.loaded[ledge_path] = nil
			package.load_order[#package.load_order] = nil
		else
			self.smart_objects = {}
		end

		printf("Nav graph ledgelator version: Found version=%s Wanted version=%s", tostring(self.ledgelator_version), WANTED_LEDGELATOR_VERSION)
	end

	self.fallback_smart_object_index = 0
	self.smart_object_types = {}
	self.smart_object_data = {}
	self.smart_object_ids = {}
	self.line_object = World.create_line_object(self.world)
	self.initialized_unit_nav_graphs = {}
	self.dynamic_smart_object_index = 1
end

NavGraphSystem.destroy = function (self)
	World.destroy_line_object(self.world, self.line_object)

	self.line_object = nil
	self.initialized_unit_nav_graphs = nil
end

local control_points = {}
local BROADPHASE_RESULTS = {}

NavGraphSystem.init_nav_graphs = function (self, unit, smart_object_id, extension)
	local nav_world = self.nav_world
	local smart_objects = self.smart_objects
	local debug_color = Colors.get("orange")
	local smart_object_unit_data = smart_objects[smart_object_id]
	local use_for_versus = Unit.get_data(unit, "ledge_enabled_vs")
	local count = 0
	local num_smart_objects_in_unit = #smart_object_unit_data

	for i = 1, num_smart_objects_in_unit do
		local smart_object_data = smart_object_unit_data[i]
		local smart_object_type = smart_object_data.smart_object_type or "ledges"
		local layer_id = LAYER_ID_MAPPING[smart_object_type]

		control_points[1] = Vector3Aux.unbox(smart_object_data.pos1)
		control_points[2] = Vector3Aux.unbox(smart_object_data.pos2)

		local is_bidirectional = true

		if smart_object_unit_data.is_one_way or smart_object_type ~= "teleporters" and math.abs(control_points[1].z - control_points[2].z) > SmartObjectSettings.jump_up_max_height then
			is_bidirectional = false
		end

		smart_object_data.data.is_bidirectional = is_bidirectional

		local smart_object_index = smart_object_data.smart_object_index

		self.smart_object_types[smart_object_index] = smart_object_type
		self.smart_object_data[smart_object_index] = smart_object_data.data

		local navgraph = GwNavGraph.create(nav_world, is_bidirectional, control_points, debug_color, layer_id, smart_object_index)

		if not use_for_versus and not script_data.disable_crowd_dispersion then
			GwNavWorld.register_all_navgraphedges_for_crowd_dispersion(nav_world, navgraph, 1, 100)
		end

		GwNavGraph.add_to_database(navgraph)

		extension.navgraphs[#extension.navgraphs + 1] = navgraph
	end

	if self._use_level_jumps and use_for_versus then
		local first_unit_data = smart_object_unit_data[1]

		self:spawn_versus_jump_unit(first_unit_data)

		local smart_object_type = first_unit_data.smart_object_type or "ledges"

		if first_unit_data.data.is_bidirectional and (smart_object_type == "jumps" or smart_object_type == "ledges_with_fence") and not first_unit_data.data.is_on_small_fence then
			self:spawn_versus_jump_unit(first_unit_data, true)
		end
	end

	self.initialized_unit_nav_graphs[unit] = true
end

local jump_unit_offset_z = 1.1

NavGraphSystem.spawn_versus_jump_unit = function (self, jump_object_data, swap)
	local ledge_position = jump_object_data.data.ledge_position

	ledge_position = ledge_position and Vector3Aux.unbox(ledge_position)

	local position1 = Vector3Aux.unbox(jump_object_data.pos1) + Vector3(0, 0, jump_unit_offset_z)
	local position2 = Vector3Aux.unbox(jump_object_data.pos2) + Vector3(0, 0, jump_unit_offset_z)
	local unit_jump_data = {
		jump_object_data = jump_object_data,
	}
	local center_position

	if ledge_position then
		center_position = ledge_position
	else
		center_position = (position1 + position2) / 2
	end

	local direction, spawn_position

	if swap then
		direction = Vector3.normalize(center_position - position1)
		spawn_position = position1
		unit_jump_data.swap_entrance_exit = true
	else
		direction = Vector3.normalize(center_position - position2)
		spawn_position = position2
	end

	local right = Vector3.normalize(Vector3.cross(direction, Vector3.up()))
	local up = Vector3.normalize(Vector3.cross(right, direction))
	local rotation = Quaternion.look(direction, up)

	if self._is_server then
		local extension_init_data = {
			nav_graph_system = {
				smart_object_index = jump_object_data.smart_object_index,
				swap = swap,
			},
		}
		local jump_unit = Managers.state.unit_spawner:spawn_network_unit("units/test_unit/jump_marker_ground_pactsworn", "versus_dark_pact_climbing_interaction_unit", extension_init_data, spawn_position, rotation)
		local node_id = Unit.node(jump_unit, "c_interaction")

		Unit.set_local_scale(jump_unit, node_id, Vector3(1, 2, 1))

		self.level_jumps[jump_unit] = unit_jump_data
	else
		local storage = self._stored_jump_data[jump_object_data.smart_object_index]

		if not storage then
			storage = {}
			self._stored_jump_data[jump_object_data.smart_object_index] = storage
		end

		local index = not swap and 1 or 2

		storage[index] = unit_jump_data
	end
end

NavGraphSystem.level_jump_units = function (self)
	return self._level_jumps_ready and self.level_jumps
end

NavGraphSystem.show_all_jump_units = function (self, show)
	if not self._use_level_jumps or self._jumps_are_shown == show then
		return
	end

	for unit, _ in pairs(self.level_jumps) do
		Unit.set_unit_visibility(unit, show)
		ScriptUnit.extension(unit, "interactable_system"):set_enabled(show)
	end

	self._jumps_are_shown = show
end

NavGraphSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = {
		navgraphs = {},
	}
	local input = {}

	ScriptUnit.set_extension(unit, "nav_graph_system", extension, input)

	self.unit_extension_data[unit] = extension

	if extension_name == "NavGraphConnectorExtension" then
		local smart_object_id = Unit.get_data(unit, "smart_object_id") or Unit.get_data(unit, "ledge_id")

		if smart_object_id and self.smart_objects[smart_object_id] and not self.no_nav_mesh and (not Unit.has_data(unit, "enabled_on_spawn") or Unit.get_data(unit, "enabled_on_spawn") == true) then
			self:init_nav_graphs(unit, smart_object_id, extension)
		end
	end

	if extension_name == "LevelUnitSmartObjectExtension" then
		local smart_object_id = self:_level_unit_smart_object_id(unit)
		local smart_object = self:smart_object_from_unit_data(unit, smart_object_id)

		self.smart_objects[smart_object_id] = smart_object
		self.smart_object_ids[unit] = smart_object_id

		if not self.no_nav_mesh then
			self:init_nav_graphs(unit, smart_object_id, extension)
		end
	end

	if extension_name == "DynamicUnitSmartObjectExtension" then
		local smart_object_id = self:_dynamic_unit_smart_object_id(unit)
		local smart_object = self:smart_object_from_unit_data(unit, smart_object_id)

		self.smart_objects[smart_object_id] = smart_object
		self.smart_object_ids[unit] = smart_object_id

		if not self.no_nav_mesh then
			local function safe_navigation_callback()
				self:init_nav_graphs(unit, smart_object_id, extension)
			end

			local ai_navigation_system = Managers.state.entity:system("ai_navigation_system")

			ai_navigation_system:add_safe_navigation_callback(safe_navigation_callback)
		end
	end

	if extension_name == "DarkPactClimbingExtension" then
		local smart_object_index = extension_init_data.smart_object_index
		local swap = extension_init_data.swap

		extension.smart_object_index = smart_object_index
		extension.swap = swap

		if self._is_server then
			return extension
		end

		local storage = self._stored_jump_data[smart_object_index]
		local index = not swap and 1 or 2
		local jump_data = storage[index]

		self.level_jumps[unit] = jump_data
	end

	return extension
end

NavGraphSystem.on_remove_extension = function (self, unit, extension_name)
	NavGraphSystem.super.on_remove_extension(self, unit, extension_name)

	if extension_name == "DynamicUnitSmartObjectExtension" then
		local id = self.smart_object_ids[unit]

		self.smart_objects[id] = nil
		self.smart_object_ids[unit] = nil

		self:remove_nav_graph(unit)
	end
end

NavGraphSystem.extensions_ready = function (self, world, unit, extension_name)
	if extension_name == "DarkPactClimbingExtension" then
		self._level_jumps_ready = true
	end
end

NavGraphSystem._level_unit_smart_object_id = function (self, unit)
	local level = LevelHelper:current_level(self.world)
	local unit_level_id = Level.unit_index(level, unit)
	local smart_object_id = 10000 + unit_level_id

	fassert(not self.smart_objects[smart_object_id], "Smart Object with id %s already registered!", smart_object_id)

	return smart_object_id
end

NavGraphSystem._dynamic_unit_smart_object_id = function (self, unit)
	local smart_object_id = 1000000 + self.dynamic_smart_object_index

	fassert(not self.smart_objects[smart_object_id], "Smart Object with id %s already registered!", smart_object_id)

	self.dynamic_smart_object_index = self.dynamic_smart_object_index + 1

	return smart_object_id
end

NavGraphSystem.queue_add_nav_graph_from_flow = function (self, unit)
	local extension = self.unit_extension_data[unit]

	fassert(extension, "Tried to add nav graph from flow for a unit without nav graph extension. %s", unit)

	self.nav_graphs_units_to_add = self.nav_graphs_units_to_add or {}
	self.nav_graphs_units_to_add[#self.nav_graphs_units_to_add + 1] = unit
end

NavGraphSystem.queue_remove_nav_graph_from_flow = function (self, unit)
	local extension = self.unit_extension_data[unit]

	fassert(extension, "Tried to remove nav graph from flow for a unit without nav graph extension. %s", unit)

	self.nav_graphs_units_to_remove = self.nav_graphs_units_to_remove or {}
	self.nav_graphs_units_to_remove[#self.nav_graphs_units_to_remove + 1] = unit
end

NavGraphSystem.add_nav_graph = function (self, unit)
	local extension = self.unit_extension_data[unit]

	fassert(extension, "Tried to add nav graph from flow for a unit without nav graph extension. %s", unit)

	if extension.nav_graph_removed then
		local navgraphs = extension.navgraphs

		for i = 1, #navgraphs do
			local navgraph = navgraphs[i]

			GwNavGraph.add_to_database(navgraph)
			printf("[NavGraphSystem] Adding navgraph(s) for [%q]", tostring(unit))
		end

		extension.nav_graph_removed = false
	end
end

NavGraphSystem.remove_nav_graph = function (self, unit)
	local extension = self.unit_extension_data[unit]

	fassert(extension, "Tried to remove nav graph from flow for a unit without nav graph extension. %s", unit)

	if not extension.nav_graph_removed then
		local navgraphs = extension.navgraphs

		for i = 1, #navgraphs do
			local navgraph = navgraphs[i]

			GwNavGraph.remove_from_database(navgraph)
			printf("[NavGraphSystem] Removing navgraph(s) for [%q]", tostring(unit))
		end

		extension.nav_graph_removed = true
	end
end

NavGraphSystem.init_nav_graph_from_flow = function (self, unit)
	local extension = self.unit_extension_data[unit]

	fassert(extension, "Tried to init nav graph from flow for a unit without nav graph extension. %s", unit)

	local valid_script_data = Unit.has_data(unit, "enabled_on_spawn") and Unit.get_data(unit, "enabled_on_spawn") == false

	fassert(valid_script_data, "Tried to init nav graph from flow for a unit without script data \"enabled_on_spawn\" set to false. %s", unit)
	fassert(not self.initialized_unit_nav_graphs[unit], "Tried to init nav graph from flow for a unit but the nav graph has already been initialized. %s", unit)

	local smart_object_id = Unit.get_data(unit, "smart_object_id") or Unit.get_data(unit, "ledge_id")

	if smart_object_id and self.smart_objects[smart_object_id] and not self.no_nav_mesh then
		self:init_nav_graphs(unit, smart_object_id, extension)
	end
end

NavGraphSystem.smart_object_from_unit_data = function (self, unit, smart_object_id)
	local smart_object = {}
	local i = 0

	while Unit.has_data(unit, "smart_objects", i) do
		local entrance_position, exit_position
		local smart_object_type = Unit.get_data(unit, "smart_objects", i, "type")
		local is_one_way = Unit.get_data(unit, "smart_objects", i, "is_one_way")

		if Unit.has_data(unit, "smart_objects", i, "entrance_node") then
			local entrance_node = Unit.get_data(unit, "smart_objects", i, "entrance_node")
			local exit_node = Unit.get_data(unit, "smart_objects", i, "exit_node")
			local nav_world = self.nav_world
			local above = 0.5
			local below = 0.5
			local horizontal = 0.5
			local distance_from_border = 0.1
			local entrance_node_index = Unit.node(unit, entrance_node)

			entrance_position = Unit.world_position(unit, entrance_node_index)

			local success, z = GwNavQueries.triangle_from_position(nav_world, entrance_position, above, below)

			if success then
				entrance_position.z = z
			else
				local nav_mesh_entrance_position = GwNavQueries.inside_position_from_outside_position(nav_world, entrance_position, above, below, horizontal, distance_from_border)

				fassert(nav_mesh_entrance_position, "[NavGraphSystem] While creating smart object of type %q could not find nav mesh for entrance position at %s.", smart_object_type, entrance_position)

				entrance_position = nav_mesh_entrance_position
			end

			local exit_node_index = Unit.node(unit, exit_node)

			exit_position = Unit.world_position(unit, exit_node_index)

			local success, z = GwNavQueries.triangle_from_position(nav_world, exit_position, above, below)

			if success then
				exit_position.z = z
			else
				local nav_mesh_exit_position = GwNavQueries.inside_position_from_outside_position(nav_world, exit_position, above, below, horizontal, distance_from_border)

				fassert(nav_mesh_exit_position, "[NavGraphSystem] While creating smart object of type %q could not find nav mesh for exit position at %s.", smart_object_type, exit_position)

				exit_position = nav_mesh_exit_position
			end
		else
			local node = Unit.get_data(unit, "smart_objects", i, "node")
			local entrance_offset_x = Unit.get_data(unit, "smart_objects", i, "entrance", "offset_x")
			local entrance_offset_y = Unit.get_data(unit, "smart_objects", i, "entrance", "offset_y")
			local entrance_offset_z = Unit.get_data(unit, "smart_objects", i, "entrance", "offset_z")
			local exit_offset_x = Unit.get_data(unit, "smart_objects", i, "exit", "offset_x")
			local exit_offset_y = Unit.get_data(unit, "smart_objects", i, "exit", "offset_y")
			local exit_offset_z = Unit.get_data(unit, "smart_objects", i, "exit", "offset_z")
			local node_index = Unit.node(unit, node)
			local position = Unit.world_position(unit, node_index)
			local rotation = Unit.world_rotation(unit, node_index)
			local right = Quaternion.right(rotation)
			local forward = Quaternion.forward(rotation)
			local up = Quaternion.up(rotation)

			entrance_position = position + right * entrance_offset_x + forward * entrance_offset_y + up * entrance_offset_z
			exit_position = position + right * exit_offset_x + forward * exit_offset_y + up * exit_offset_z
		end

		i = i + 1
		smart_object[i] = {
			data = {
				unit = unit,
			},
			smart_object_type = smart_object_type,
			smart_object_index = smart_object_id,
			pos1 = Vector3Aux.box(nil, entrance_position),
			pos2 = Vector3Aux.box(nil, exit_position),
			is_one_way = is_one_way,
		}
	end

	return smart_object
end

NavGraphSystem.on_remove_extension = function (self, unit, extension_name)
	ScriptUnit.remove_extension(unit, self.NAME)

	local extension = self.unit_extension_data[unit]

	for i = 1, #extension.navgraphs do
		local navgraph = extension.navgraphs[i]

		GwNavGraph.destroy(navgraph)
	end

	self.unit_extension_data[unit] = nil
end

NavGraphSystem.update = function (self, context, t, dt)
	if self.nav_graphs_units_to_add then
		for i = 1, #self.nav_graphs_units_to_add do
			local nav_graphs_unit_to_add = self.nav_graphs_units_to_add[i]

			self:add_nav_graph(nav_graphs_unit_to_add)
		end

		self.nav_graphs_units_to_add = nil
	elseif self.nav_graphs_units_to_remove then
		for i = 1, #self.nav_graphs_units_to_remove do
			local nav_graphs_unit_to_remove = self.nav_graphs_units_to_remove[i]

			self:remove_nav_graph(nav_graphs_unit_to_remove)
		end

		self.nav_graphs_units_to_remove = nil
	end
end

NavGraphSystem.hot_join_sync = function (self, sender)
	return
end

NavGraphSystem.get_smart_object_type = function (self, smart_object_id)
	return self.smart_object_types[smart_object_id]
end

NavGraphSystem.get_smart_object_data = function (self, smart_object_id)
	return self.smart_object_data[smart_object_id]
end

NavGraphSystem.get_smart_objects = function (self, smart_object_id)
	return self.smart_objects[smart_object_id]
end

NavGraphSystem.get_smart_object_id = function (self, unit)
	return self.smart_object_ids[unit]
end

NavGraphSystem.has_nav_graph = function (self, unit)
	local nav_graph_extension = self.unit_extension_data[unit]

	if nav_graph_extension then
		return true, not nav_graph_extension.nav_graph_removed
	else
		return false, false
	end
end
