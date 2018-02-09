require("core/gwnav/lua/safe_require")

local NavWorld = safe_require_guard()
local NavClass = safe_require("core/gwnav/lua/runtime/navclass")
NavWorld = NavClass(NavWorld)
local NavHelpers = safe_require("core/gwnav/lua/runtime/navhelpers")
local NavBot = safe_require("core/gwnav/lua/runtime/navbot")
local NavBoxObstacle = safe_require("core/gwnav/lua/runtime/navboxobstacle")
local NavCylinderObstacle = safe_require("core/gwnav/lua/runtime/navcylinderobstacle")
local NavGraph = safe_require("core/gwnav/lua/runtime/navgraph")
local NavTagVolume = safe_require("core/gwnav/lua/runtime/navtagvolume")
local NavBotConfiguration = safe_require("core/gwnav/lua/runtime/navbotconfiguration")
local Math = stingray.Math
local Vector2 = stingray.Vector2
local Vector3 = stingray.Vector3
local Vector3Box = stingray.Vector3Box
local Matrix4x4 = stingray.Matrix4x4
local Matrix4x4Box = stingray.Matrix4x4Box
local Quaternion = stingray.Quaternion
local QuaternionBox = stingray.QuaternionBox
local Gui = stingray.Gui
local World = stingray.World
local Unit = stingray.Unit
local Camera = stingray.Camera
local Color = stingray.Color
local LineObject = stingray.LineObject
local Level = stingray.Level
local Script = stingray.Script
local GwNavWorld = stingray.GwNavWorld
local GwNavBot = stingray.GwNavBot
local GwNavQueries = stingray.GwNavQueries
local GwNavAStar = stingray.GwNavAStar
local GwNavTagVolume = stingray.GwNavTagVolume
local GwNavBoxObstacle = stingray.GwNavBoxObstacle
local GwNavCylinderObstacle = stingray.GwNavCylinderObstacle
local GwNavGraph = stingray.GwNavGraph
local GwNavTraversal = stingray.GwNavTraversal
local _navworlds = {}
NavWorld.get_navworld = function (level)
	return _navworlds[level]
end
NavWorld.init = function (self, world, level)
	self.world = world
	self.level = level
	self.transform = Matrix4x4Box(Level.pose(level))
	self.bot_configurations = {}
	self.bots = {}
	self.navgraphs = {}
	self.navtagvolumes = {}
	self.navboxobstacles = {}
	self.navcylinderobstacles = {}
	self.smartobject_types = {}
	self.markers = {}
	self.gwnavworld = GwNavWorld.create(self.transform:unbox())
	self.render_mesh = false
	local visualdebug_server_port = 4888
	local bot_units = {}

	for ku, unit in pairs(Level.units(level)) do
		if Unit.alive(unit) and Unit.has_data(unit, "GwNavWorld") then
			self.init_fromnavworldunit(self, unit)
			GwNavWorld.init_visual_debug_server(self.gwnavworld, visualdebug_server_port)
		elseif Unit.alive(unit) and Unit.has_data(unit, "GwNavBotConfiguration") then
			self.init_bot_configuration(self, unit)
		elseif Unit.alive(unit) and Unit.has_data(unit, "GwNavGraphConnector") then
			self.init_graph_connector(self, unit)
		elseif Unit.alive(unit) and Unit.has_data(unit, "GwNavTagBox") then
			self.init_tagbox(self, unit)
		elseif Unit.alive(unit) and Unit.has_data(unit, "GwNavBoxObstacle") then
			self.add_boxobstacle(self, unit)
		elseif Unit.alive(unit) and Unit.has_data(unit, "GwNavCylinderObstacle") then
			self.add_cylinderobstacle(self, unit)
		elseif Unit.alive(unit) and Unit.has_data(unit, "GwNavMarker") then
			self.init_navmarker(self, unit)
		elseif Unit.alive(unit) and Unit.has_data(unit, "GwNavBot") then
			bot_units[#bot_units + 1] = unit
		end
	end

	for ku, unit in pairs(bot_units) do
		self.init_bot(self, unit)
	end

	_navworlds[level] = self

	return 
end
NavWorld.add_navdata = function (self, resource_name)
	self.navdata = GwNavWorld.add_navdata(self.gwnavworld, resource_name)

	return 
end
NavWorld.init_bot = function (self, unit)
	local configuration_name = Unit.get_data(unit, "GwNavBot", "configuration_name")
	local bot_configuration = self.bot_configurations[configuration_name]

	if bot_configuration then
		return NavBot(self, unit, bot_configuration)
	end

	return nil
end
NavWorld.init_bot_from_unit = function (self, unit, configuration_unit)
	local configuration_name = Unit.get_data(configuration_unit, "GwNavBotConfiguration", "configuration_name")
	local bot_configuration = self.bot_configurations[configuration_name]

	if bot_configuration then
		return NavBot(self, unit, bot_configuration)
	end

	return nil
end
NavWorld.get_navbot = function (self, unit)
	return self.bots[unit]
end
NavWorld.init_navmarker = function (self, unit)
	self.markers[#self.markers + 1] = unit

	return 
end
NavWorld.set_smartobject_cost_multiplier = function (self, smartobject_id, cost_multiplier, smartobject_type)
	self.smartobject_types[smartobject_id] = smartobject_type

	GwNavWorld.set_smartobject_cost_multiplier(self.gwnavworld, smartobject_id, cost_multiplier)

	return 
end
NavWorld.unset_smartobject = function (self, smartobject_id)
	GwNavWorld.unset_smartobject(self.gwnavworld, smartobject_id)

	return 
end
NavWorld.allow_smartobject = function (self, smartobject_id)
	GwNavWorld.allow_smartobject(self.gwnavworld, smartobject_id)

	return 
end
NavWorld.forbid_smartobject = function (self, smartobject_id)
	GwNavWorld.forbid_smartobject(self.gwnavworld, smartobject_id)

	return 
end
NavWorld.get_smartobject_type = function (self, smartobject_id)
	return self.smartobject_types[smartobject_id]
end
NavWorld.set_dynamicnavmesh_budget = function (self, budget)
	GwNavWorld.set_dynamicnavmesh_budget(self.gwnavworld, budget)

	return 
end
NavWorld.set_pathfinder_budget_in_ms = function (self, budget)
	GwNavWorld.set_pathfinder_budget(self.gwnavworld, budget)

	return 
end
NavWorld.init_fromnavworldunit = function (self, unit)
	if Unit.has_data(unit, "GwNavWorld", "dynamicnavmesh_budget") then
		self.set_dynamicnavmesh_budget(self, Unit.get_data(unit, "GwNavWorld", "dynamicnavmesh_budget"))
	end

	if Unit.has_data(unit, "GwNavWorld", "pathfinder_budget") then
		self.set_pathfinder_budget_in(self, Unit.get_data(unit, "GwNavWorld", "pathfinder_budget"))
	end

	if Unit.has_data(unit, "GwNavWorld", "render_navdata") then
		self.render_mesh = Unit.get_data(unit, "GwNavWorld", "render_navdata")
	end

	if Unit.has_data(unit, "GwNavWorld", "enable_crowd_dispersion_navtag") then
		self.set_pathvariety_mode(self, Unit.get_data(unit, "GwNavWorld", "enable_crowd_dispersion_navtag"))
	end

	return 
end
NavWorld.init_bot_configuration = function (self, unit)
	local configuration_name = Unit.get_data(unit, "GwNavBotConfiguration", "configuration_name")
	self.bot_configurations[configuration_name] = NavBotConfiguration(unit)

	return 
end
NavWorld.init_graph_connector = function (self, unit)
	local sampling_step = math.max(1, NavHelpers.unit_script_data(unit, 1, "GwNavGraphConnector", "sampling_step"))
	local unitPos = Matrix4x4.transform(self.transform:unbox(), Unit.world_position(unit, 1))
	local unitRot = Unit.world_rotation(unit, 1)
	local unitScale = Unit.local_scale(unit, 1)
	local forward = Quaternion.forward(unitRot)
	local right = Quaternion.right(unitRot)
	local up = Quaternion.up(unitRot)
	local down_up = NavHelpers.unit_script_data(unit, true, "GwNavGraphConnector", "down_up")
	local up_down = NavHelpers.unit_script_data(unit, true, "GwNavGraphConnector", "up_down")
	local bidirectional_edges = down_up and up_down
	local half_subdivision_count = math.floor((unitScale[1]*0.5)/sampling_step)
	local current_vertex_left_offset = half_subdivision_count*sampling_step
	local sub_graph_count = half_subdivision_count*2 + 1
	local is_exclusive, color, layer_id, smartobject_id, user_data_id = NavHelpers.get_layer_and_smartobject(unit, "GwNavGraphConnector")

	if is_exclusive then
		error("NavGraph should not have exclusive navtag it will be ignored")
	elseif smartobject_id == -1 then
		print_warning("NavGraph should be associated to a smartobject id, it will be defaulted to 0")

		smartobject_id = 0
	end

	if 0 <= smartobject_id then
		self.set_smartobject_cost_multiplier(self, smartobject_id, 1, "Jump")
	end

	local temp_a = unitPos
	local temp_b = unitPos - forward*unitScale[2] + up*unitScale[3]

	for i = 1, sub_graph_count, 1 do
		local control_points = {}
		local start_idx = 1
		local down_idx = 2

		if bidirectional_edges == false and up_down == true then
			start_idx = 2
			down_idx = 1
		end

		control_points[start_idx] = temp_a - right*current_vertex_left_offset
		control_points[down_idx] = temp_b - right*current_vertex_left_offset
		local navgraph = NavGraph(self.gwnavworld, bidirectional_edges, control_points, color, layer_id, smartobject_id, user_data_id)
		self.navgraphs[#self.navgraphs + 1] = navgraph

		self.navgraphs[#self.navgraphs]:add_to_database()

		current_vertex_left_offset = current_vertex_left_offset - sampling_step
	end

	return 
end
NavWorld.init_tagbox = function (self, unit)
	local extent_x = NavHelpers.unit_script_data(unit, 1, "GwNavTagBox", "half_extent", "x")
	local extent_y = NavHelpers.unit_script_data(unit, 1, "GwNavTagBox", "half_extent", "y")
	local extent_z = NavHelpers.unit_script_data(unit, 1, "GwNavTagBox", "half_extent", "z")
	local local_center = Vector3(NavHelpers.unit_script_data(unit, 0, "GwNavTagBox", "offset", "x"), NavHelpers.unit_script_data(unit, 0, "GwNavTagBox", "offset", "y"), NavHelpers.unit_script_data(unit, 0, "GwNavTagBox", "offset", "z"))
	local is_exclusive, color, layer_id, smartobject_id = NavHelpers.get_layer_and_smartobject(unit, "GwNavTagBox")
	local unitPos = Unit.world_position(unit, 1) + local_center
	local unitRot = Unit.world_rotation(unit, 1)
	local forward = Quaternion.forward(unitRot)
	local right = Quaternion.right(unitRot)
	local up = Quaternion.up(unitRot)
	local point_table = {
		(unitPos + forward*extent_x) - right*extent_y,
		unitPos + forward*extent_x + right*extent_y,
		unitPos - forward*extent_x + right*extent_y,
		unitPos - forward*extent_x - right*extent_y
	}
	local alt_min = unitPos[3] - extent_z
	local alt_max = unitPos[3] + extent_z
	self.navtagvolumes[#self.navtagvolumes + 1] = NavTagVolume(self.gwnavworld, point_table, alt_min, alt_max, is_exclusive, color, layer_id, smartobject_id)

	self.navtagvolumes[#self.navtagvolumes]:add_to_world()

	return 
end
NavWorld.add_boxobstacle = function (self, unit)
	self.navboxobstacles[unit] = NavBoxObstacle(self, unit)

	self.navboxobstacles[unit]:add_to_world()

	return 
end
NavWorld.remove_boxobstacle = function (self, unit)
	if self.navboxobstacles[unit] then
		self.navboxobstacles[unit]:remove_from_world()

		self.navboxobstacles[unit] = nil
	end

	return 
end
NavWorld.add_cylinderobstacle = function (self, unit)
	self.navcylinderobstacles[unit] = NavCylinderObstacle(self, unit)

	self.navcylinderobstacles[unit]:add_to_world()

	return 
end
NavWorld.remove_cylinderobstacle = function (self, unit)
	if self.navcylinderobstacles[unit] then
		self.navcylinderobstacles[unit]:remove_from_world()

		self.navcylinderobstacles[unit] = nil
	end

	return 
end
NavWorld.add_bot = function (self, bot)
	self.bots[bot.unit] = bot

	return 
end
NavWorld.remove_bot = function (self, bot)
	self.bots[bot.unit] = nil

	return 
end
NavWorld.force_all_bots_to_repath = function (self)
	for kb, bot in pairs(self.bots) do
		bot.force_repath(bot)
	end

	return 
end
NavWorld.update = function (self, dt)
	if dt <= 0 then
		dt = 0.001
	end

	for kb, bot in pairs(self.bots) do
		bot.update(bot, dt)
	end

	for kb, box in pairs(self.navboxobstacles) do
		box.update(box, dt)
	end

	for kc, cylinder in pairs(self.navcylinderobstacles) do
		cylinder.update(cylinder, dt)
	end

	GwNavWorld.update(self.gwnavworld, dt)

	return 
end
NavWorld.shutdown = function (self)
	self.markers = {}

	self.clear_bot_configuration(self)
	self.clear_bots(self)
	self.clear_navgraphs(self)
	self.clear_tagboxes(self)
	self.clear_boxobstacles(self)
	self.clear_cylinderobstacles(self)
	GwNavWorld.remove_navdata(self.gwnavworld, self.navdata)

	self.navdata = nil

	GwNavWorld.destroy(self.gwnavworld)

	self.gwnavworld = nil
	_navworlds[self.level] = nil

	return 
end
NavWorld.clear_bot_configuration = function (self)
	for kc, configuration in pairs(self.bot_configurations) do
		configuration.shutdown(configuration)
	end

	self.bot_configurations = {}

	return 
end
NavWorld.clear_navgraphs = function (self)
	for kg, graph in pairs(self.navgraphs) do
		graph.shutdown(graph)
	end

	self.navgraphs = {}

	return 
end
NavWorld.clear_tagboxes = function (self)
	for kn, volume in pairs(self.navtagvolumes) do
		volume.remove_from_world(volume)
		volume.shutdown(volume)
	end

	self.navtagvolumes = {}

	return 
end
NavWorld.clear_boxobstacles = function (self)
	for kb, box in pairs(self.navboxobstacles) do
		box.remove_from_world(box)
		box.shutdown(box)
	end

	self.navboxobstacles = {}

	return 
end
NavWorld.clear_cylinderobstacles = function (self)
	for kc, cylinder in pairs(self.navcylinderobstacles) do
		cylinder.remove_from_world(cylinder)
		cylinder.shutdown(cylinder)
	end

	self.navcylinderobstacles = {}

	return 
end
NavWorld.clear_bots = function (self)
	for kb, bot in pairs(self.bots) do
		bot.shutdown(bot)
	end

	self.bots = {}

	return 
end
NavWorld.debug_draw = function (self, gui, line_object)
	if self.render_mesh == false then
		return 
	end

	GwNavWorld.build_database_visual_representation(self.gwnavworld)

	local tile_count = GwNavWorld.database_tile_count(self.gwnavworld)
	local black = Color(255, 0, 0, 0)

	for tile = 1, tile_count, 1 do
		local triangle_count = GwNavWorld.database_tile_triangle_count(self.gwnavworld, tile)

		for i = 1, triangle_count, 1 do
			local temp_size = Script.temp_byte_count()
			local a, b, c, tri_color = GwNavWorld.database_triangle(self.gwnavworld, tile, i)

			if a ~= nil then
				Gui.triangle(gui, a, b, c, 1, tri_color)
				LineObject.add_line(line_object, black, a, b)
				LineObject.add_line(line_object, black, b, c)
				LineObject.add_line(line_object, black, c, a)
			end

			Script.set_temp_byte_count(temp_size)
		end
	end

	return 
end
NavWorld.visual_debug_camera = function (self, camera)
	local pos = Camera.world_position(camera)
	local camera_pose = Camera.world_pose(camera)
	local forward = Matrix4x4.forward(camera_pose)
	local up = Matrix4x4.up(camera_pose)

	GwNavWorld.set_visual_debug_camera_transform(self.gwnavworld, pos, pos + forward, up)

	return 
end

return NavWorld
