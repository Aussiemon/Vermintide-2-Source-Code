NavGraphSystem = class(NavGraphSystem, ExtensionSystemBase)
local WANTED_LEDGELATOR_VERSION = "2017.MAY.05.05"
local extensions = {
	"NavGraphConnectorExtension",
	"LevelUnitSmartObjectExtension"
}
script_data.nav_mesh_debug = script_data.nav_mesh_debug or Development.parameter("nav_mesh_debug")

NavGraphSystem.init = function (self, context, system_name)
	local entity_manager = context.entity_manager

	entity_manager:register_system(self, system_name, extensions)

	self.entity_manager = entity_manager
	self.world = context.world
	self.unit_extension_data = {}
	local ai_system = Managers.state.entity:system("ai_system")
	self.nav_world = ai_system:nav_world()
	local version = nil
	local level_settings = LevelHelper:current_level_settings(self.world)
	local level_name = level_settings.level_name

	if LEVEL_EDITOR_TEST then
		level_name = Application.get_data("LevelEditor", "level_resource_name")
	end

	if level_settings.no_nav_mesh then
		self.ledgelator_version = WANTED_LEDGELATOR_VERSION
		self.smart_objects = {}
		self.no_nav_mesh = true
	elseif level_name then
		local smart_object_path = level_name .. "_smartobjects"
		local ledge_path = level_name .. "_ledges"

		if Application.can_get("lua", smart_object_path) then
			local smart_objects = require(smart_object_path)
			version = smart_objects.version
			self.smart_object_count = smart_objects.smart_object_count
			self.smart_objects = smart_objects.smart_objects
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
end

NavGraphSystem.destroy = function (self)
	World.destroy_line_object(self.world, self.line_object)

	self.line_object = nil
	self.initialized_unit_nav_graphs = nil
end

local control_points = {}

NavGraphSystem.init_nav_graphs = function (self, unit, smart_object_id, extension)
	local nav_world = self.nav_world
	local level = LevelHelper:current_level(self.world)
	local unit_level_id = Level.unit_index(level, unit)
	local smart_objects = self.smart_objects
	local debug_color = Colors.get("orange")
	local smart_object_unit_data = smart_objects[smart_object_id]

	for smart_object, smart_object_data in pairs(smart_object_unit_data) do
		local smart_object_type = smart_object_data.smart_object_type or "ledges"
		local layer_id = LAYER_ID_MAPPING[smart_object_type]
		control_points[1] = Vector3Aux.unbox(smart_object_data.pos1)
		control_points[2] = Vector3Aux.unbox(smart_object_data.pos2)
		local is_bidirectional = true

		if smart_object_unit_data.is_one_way or (smart_object_type ~= "teleporter" and SmartObjectSettings.jump_up_max_height < math.abs(control_points[1].z - control_points[2].z)) then
			is_bidirectional = false
		end

		smart_object_data.data.is_bidirectional = is_bidirectional
		local smart_object_index = smart_object_data.smart_object_index
		self.smart_object_types[smart_object_index] = smart_object_type
		self.smart_object_data[smart_object_index] = smart_object_data.data
		local navgraph = GwNavGraph.create(nav_world, is_bidirectional, control_points, debug_color, layer_id, smart_object_index)

		GwNavGraph.add_to_database(navgraph)

		if not script_data.disable_crowd_dispersion then
			GwNavWorld.register_all_navgraphedges_for_crowd_dispersion(nav_world, navgraph, 1, 100)
		end

		extension.navgraphs[#extension.navgraphs + 1] = navgraph

		if Development.parameter("visualize_ledges") then
			local drawer = Managers.state.debug:drawer({
				mode = "retained",
				name = "NavGraphConnectorExtension"
			})
			local debug_color_fail = Colors.get("red")

			if smart_object_type == "ledges" or smart_object_type == "ledges_with_fence" then
				if smart_object_data.data.ledge_position1 then
					drawer:line(control_points[1], Vector3Aux.unbox(smart_object_data.data.ledge_position1), debug_color)
					drawer:line(Vector3Aux.unbox(smart_object_data.data.ledge_position1), Vector3Aux.unbox(smart_object_data.data.ledge_position2), debug_color)
					drawer:line(control_points[2], Vector3Aux.unbox(smart_object_data.data.ledge_position2), debug_color)
				else
					drawer:line(control_points[1], Vector3Aux.unbox(smart_object_data.data.ledge_position), debug_color)
					drawer:line(control_points[2], Vector3Aux.unbox(smart_object_data.data.ledge_position), debug_color)
				end

				if not smart_object_data.data.is_bidirectional then
					drawer:vector(control_points[1], Vector3.up(), debug_color)
				end
			elseif smart_object_type == "jumps" then
				drawer:line(control_points[1], control_points[2], Colors.get("aqua_marine"))
			else
				drawer:line(control_points[1], control_points[2], debug_color)
			end

			local is_position_on_navmesh = GwNavQueries.triangle_from_position(nav_world, control_points[1])

			if is_position_on_navmesh then
				drawer:sphere(control_points[1], 0.05, debug_color)
			else
				drawer:sphere(control_points[1], 0.05, debug_color_fail)
			end

			is_position_on_navmesh = GwNavQueries.triangle_from_position(nav_world, control_points[2])

			if is_position_on_navmesh then
				drawer:sphere(control_points[2], 0.05, debug_color)
			else
				drawer:sphere(control_points[2], 0.05, debug_color_fail)
			end
		end
	end

	self.initialized_unit_nav_graphs[unit] = true
end

NavGraphSystem.on_add_extension = function (self, world, unit, extension_name)
	local extension = {
		navgraphs = {}
	}
	local input = {}

	ScriptUnit.set_extension(unit, "nav_graph_system", extension, input)

	self.unit_extension_data[unit] = extension

	if extension_name == "NavGraphConnectorExtension" then
		local smart_object_id = Unit.get_data(unit, "smart_object_id") or Unit.get_data(unit, "ledge_id")

		if smart_object_id and self.smart_objects[smart_object_id] then
			if not self.no_nav_mesh and (not Unit.has_data(unit, "enabled_on_spawn") or Unit.get_data(unit, "enabled_on_spawn") == true) then
				self:init_nav_graphs(unit, smart_object_id, extension)
			end
		elseif Development.parameter("visualize_ledges") then
			local drawer = Managers.state.debug:drawer({
				mode = "retained",
				name = "NavGraphConnectorExtension"
			})
			local pose, half_extents = Unit.box(unit)

			drawer:box(pose, half_extents + Vector3(0.01, 0.01, 0.01), Colors.get("red"))
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

	return extension
end

NavGraphSystem._level_unit_smart_object_id = function (self, unit)
	local level = LevelHelper:current_level(self.world)
	local unit_level_id = Level.unit_index(level, unit)
	local smart_object_id = 10000 + unit_level_id

	fassert(not self.smart_objects[smart_object_id], "Smart Object with id %s already registered!", smart_object_id)

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

		for i, navgraph in ipairs(navgraphs) do
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

		for i, navgraph in ipairs(navgraphs) do
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
		local entrance_position, exit_position = nil
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
				local entrance_position = GwNavQueries.inside_position_from_outside_position(nav_world, entrance_position, above, below, horizontal, distance_from_border)

				fassert(entrance_position, "[NavGraphSystem] While creating smart object of type %q could not find nav mesh for entrance position at %s.", smart_object_type, entrance_position)
			end

			local exit_node_index = Unit.node(unit, exit_node)
			exit_position = Unit.world_position(unit, exit_node_index)
			local success, z = GwNavQueries.triangle_from_position(nav_world, exit_position, above, below)

			if success then
				exit_position.z = z
			else
				local exit_position = GwNavQueries.inside_position_from_outside_position(nav_world, exit_position, above, below, horizontal, distance_from_border)

				fassert(exit_position, "[NavGraphSystem] While creating smart object of type %q could not find nav mesh for exit position at %s.", smart_object_type, entrance_position)
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
				unit = unit
			},
			smart_object_type = smart_object_type,
			smart_object_index = smart_object_id,
			pos1 = Vector3Aux.box(nil, entrance_position),
			pos2 = Vector3Aux.box(nil, exit_position),
			is_one_way = is_one_way
		}
	end

	return smart_object
end

NavGraphSystem.on_remove_extension = function (self, unit, extension_name)
	ScriptUnit.remove_extension(unit, self.NAME)

	local extension = self.unit_extension_data[unit]

	for i = 1, #extension.navgraphs, 1 do
		local navgraph = extension.navgraphs[i]

		GwNavGraph.destroy(navgraph)
	end

	self.unit_extension_data[unit] = nil
end

NavGraphSystem.update = function (self, context, t, dt)
	if self._nav_mesh_debug or script_data.nav_mesh_debug then
		self._nav_mesh_debug = script_data.nav_mesh_debug
		local ai_system = Managers.state.entity:system("ai_system")
		local nav_cost_maps_data, nav_cost_maps_count = ai_system:get_nav_cost_maps_data()

		NavigationUtils.debug_draw_nav_mesh(self.nav_world, nav_cost_maps_data, nav_cost_maps_count, self.world, self.line_object)

		if not script_data.nav_mesh_debug then
			LineObject.reset(self.line_object)
			LineObject.dispatch(self.world, self.line_object)
		end
	end

	if self.nav_graphs_units_to_add then
		for i = 1, #self.nav_graphs_units_to_add, 1 do
			local nav_graphs_unit_to_add = self.nav_graphs_units_to_add[i]

			self:add_nav_graph(nav_graphs_unit_to_add)
		end

		self.nav_graphs_units_to_add = nil
	elseif self.nav_graphs_units_to_remove then
		for i = 1, #self.nav_graphs_units_to_remove, 1 do
			local nav_graphs_unit_to_remove = self.nav_graphs_units_to_remove[i]

			self:remove_nav_graph(nav_graphs_unit_to_remove)
		end

		self.nav_graphs_units_to_remove = nil
	end

	if not LEVEL_EDITOR_TEST and self.ledgelator_version ~= WANTED_LEDGELATOR_VERSION and math.floor(t) % 10 > 3 then
		Debug.text("WARNING: Using old smart objects. Found version=%s Wanted version=%s", tostring(self.ledgelator_version), WANTED_LEDGELATOR_VERSION)
		Debug.text("Re-generate and save from level editor, then run generate_resource_packages.bat")
	end
end

NavGraphSystem.hot_join_sync = function (self, sender)
	return
end

NavGraphSystem.get_smart_object_type = function (self, smart_object_id)
	if self.smart_object_types[smart_object_id] == nil then
		slot2 = 1
	end

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

return
