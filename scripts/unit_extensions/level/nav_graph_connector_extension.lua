local ledges = require("scripts/settings/ledges")
NavGraphConnectorExtension = class(NavGraphConnectorExtension)
NavGraphConnectorExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.world = extension_init_context.world
	self.unit = unit
	self.nav_world = extension_init_data.nav_world or Managers.state.entity:system("ai_system"):nav_world()
	self.is_server = Managers.player.is_server
	self.navgraphs = {}
	local ledge_id = Unit.get_data(unit, "ledge_id")

	if ledge_id and ledges[ledge_id] then
		self.init_nav_graphs(self, ledge_id)
	else
		local drawer = Managers.state.debug:drawer({
			mode = "retained",
			name = "NavGraphConnectorExtension"
		})
		local pose, half_extents = Unit.box(unit)

		drawer.box(drawer, pose, half_extents*1.1, Colors.get("purple"))
	end

	return 
end
local control_points = {}
local idx = 0
NavGraphConnectorExtension.init_nav_graphs = function (self, ledge_id)
	local unit = self.unit
	local world = self.world
	local nav_world = self.nav_world
	local level = LevelHelper:current_level(world)
	local unit_level_id = Level.unit_index(level, unit)
	local smartobject_idx = unit_level_id
	local bidirectional_edges = true
	local layer_idx = 0
	idx = idx + 1
	local ledge_data = ledges[ledge_id]

	for smart_object, smart_object_data in pairs(ledge_data) do
		control_points[1] = Vector3Aux.unbox(smart_object_data.ground_pos)
		control_points[2] = Vector3Aux.unbox(smart_object_data.ledge_pos)
		local navgraph = GwNavGraph.create(nav_world, bidirectional_edges, control_points, debug_color, layer_idx, smartobject_idx)

		GwNavGraph.add_to_database(navgraph)

		self.navgraphs[#self.navgraphs + 1] = navgraph

		if Development.parameter("visualize_ledges") then
			local drawer = Managers.state.debug:drawer({
				mode = "retained",
				name = "NavGraphConnectorExtension"
			})
			local debug_color = Colors.get("dark_orange")
			local debug_color_fail = Colors.get("red")

			drawer.line(drawer, control_points[1], control_points[2], debug_color)

			local is_position_on_navmesh = GwNavQueries.triangle_from_position(nav_world, control_points[1])

			if is_position_on_navmesh then
				drawer.sphere(drawer, control_points[1], 0.05, debug_color)
			else
				drawer.sphere(drawer, control_points[1], 0.05, debug_color_fail)
			end

			is_position_on_navmesh = GwNavQueries.triangle_from_position(nav_world, control_points[2])

			if is_position_on_navmesh then
				drawer.sphere(drawer, control_points[2], 0.05, debug_color)
			else
				drawer.sphere(drawer, control_points[2], 0.05, debug_color_fail)
			end
		end
	end

	return 
end
NavGraphConnectorExtension.extensions_ready = function (self)
	return 
end
NavGraphConnectorExtension.destroy = function (self)
	for i = 1, #self.navgraphs, 1 do
		local navgraph = self.navgraphs[i]

		GwNavGraph.remove_from_database(navgraph)
		GwNavGraph.destroy(navgraph)
	end

	return 
end
NavGraphConnectorExtension.update = function (self, unit, input, dt, context, t)
	return 
end

return 
