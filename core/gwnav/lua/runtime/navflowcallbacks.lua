require("core/gwnav/lua/safe_require")

GwNavFlowCallbacks = safe_require_guard()
local NavRoute = safe_require("core/gwnav/lua/runtime/navroute")
local NavWorld = safe_require("core/gwnav/lua/runtime/navworld")
local NavBot = safe_require("core/gwnav/lua/runtime/navbot")
local NavBoxObstacle = safe_require("core/gwnav/lua/runtime/navboxobstacle")
local NavCylinderObstacle = safe_require("core/gwnav/lua/runtime/navcylinderobstacle")
local Unit = stingray.Unit
local Vector3 = stingray.Vector3
local Vector3Box = stingray.Vector3Box
local Matrix4x4 = stingray.Matrix4x4
local routes = {}

GwNavFlowCallbacks.create_navworld = function (t)
	NavWorld(Unit.world(t.unit), Unit.level(t.unit))
end

GwNavFlowCallbacks.destroy_navworld = function (t)
	local world = NavWorld.get_navworld(Unit.level(t.unit))

	world:shutdown()
end

GwNavFlowCallbacks.update_navworld = function (t)
	local world = NavWorld.get_navworld(Unit.level(t.unit))

	world:update(t.delta_time)
end

GwNavFlowCallbacks.add_navmesh = function (t)
	local world = NavWorld.get_navworld(Unit.level(t.unit))

	world:add_navdata(t.name)
end

GwNavFlowCallbacks.create_navbot = function (t)
	local world = NavWorld.get_navworld(Unit.level(t.unit))

	if t.bot_configuration ~= nil then
		world:init_bot_from_unit(t.unit, t.bot_configuration)
	else
		world:init_bot(t.unit)
	end
end

GwNavFlowCallbacks.destroy_navbot = function (t)
	local bot = NavBot.get_navbot(t.unit)

	if bot then
		bot:shutdown()
	end
end

GwNavFlowCallbacks.navbot_velocity = function (t)
	local bot = NavBot.get_navbot(t.unit)

	if bot then
		t.input_velocity = bot:velocity()
	else
		t.input_velocity = Vector3(0, 0, 0)
	end

	return t
end

GwNavFlowCallbacks.navbot_output_velocity = function (t)
	local bot = NavBot.get_navbot(t.unit)

	if bot then
		t.output_velocity = bot:output_velocity()
	else
		t.output_velocity = Vector3(0, 0, 0)
	end

	return t
end

GwNavFlowCallbacks.navbot_local_output_velocity = function (t)
	local bot = NavBot.get_navbot(t.unit)

	if bot then
		t.local_output_velocity = Matrix4x4.transform_without_translation(Matrix4x4.inverse(Unit.local_pose(t.unit, 1)), bot:output_velocity())
	else
		t.local_output_velocity = Vector3(0, 0, 0)
	end

	return t
end

GwNavFlowCallbacks.navbot_destination = function (t)
	local bot = NavBot.get_navbot(t.unit)

	if bot then
		t.destination = bot.destination:unbox()
	else
		t.destination = Vector3(0, 0, 0)
	end

	return t
end

GwNavFlowCallbacks.set_navbot_destination = function (t)
	local bot = NavBot.get_navbot(t.unit)

	if bot then
		bot:set_destination(t.destination)
	end
end

GwNavFlowCallbacks.navbot_move_unit = function (t)
	local bot = NavBot.get_navbot(t.unit)

	if bot then
		bot:move_unit(t.delta_time)
	end
end

GwNavFlowCallbacks.navbot_move_unit_with_mover = function (t)
	local bot = NavBot.get_navbot(t.unit)

	if bot then
		bot:move_unit_with_mover(t.delta_time, t.gravity)
	end
end

GwNavFlowCallbacks.set_navbot_route = function (t)
	local route = routes[t.id]

	if route then
		local bot = NavBot.get_navbot(t.unit)

		if bot then
			bot:set_route(route:positions())
		end
	end
end

GwNavFlowCallbacks.navbot_set_layer_cost_multiplier = function (t)
	local bot = NavBot.get_navbot(t.unit)

	if bot then
		bot:set_layer_cost_multiplier(t.layer, t.cost)
	end
end

GwNavFlowCallbacks.navbot_allow_layer = function (t)
	local bot = NavBot.get_navbot(t.unit)

	if bot then
		bot:allow_layer(t.layer)
	end
end

GwNavFlowCallbacks.navbot_forbid_layer = function (t)
	local bot = NavBot.get_navbot(t.unit)

	if bot then
		bot:forbid_layer(t.layer)
	end
end

GwNavFlowCallbacks.create_route = function (t)
	t.route_id = tostring(#routes + 1)
	routes[t.route_id] = NavRoute()

	return t
end

GwNavFlowCallbacks.add_position_to_route = function (t)
	local route = routes[t.route_id]

	if route then
		route:add_position(Unit.local_position(t.unit, 1))
	end
end

GwNavFlowCallbacks.navboxobstacle_create = function (t)
	local world = NavWorld.get_navworld(Unit.level(t.world_unit))

	world:add_boxobstacle(t.obstacle_unit)
end

GwNavFlowCallbacks.navboxobstacle_destroy = function (t)
	local box = NavBoxObstacle.get_navboxstacle(t.obstacle_unit)

	if box then
		box:shutdown()
	end
end

GwNavFlowCallbacks.cylinderobstacle_create = function (t)
	local world = NavWorld.get_navworld(Unit.level(t.world_unit))

	world:add_cylinderobstacle(t.obstacle_unit)
end

GwNavFlowCallbacks.cylinderobstacle_destroy = function (t)
	local cylinder = NavCylinderObstacle.get_navcylinderostacle(t.obstacle_unit)

	if cylinder then
		cylinder:shutdown()
	end
end

return GwNavFlowCallbacks
