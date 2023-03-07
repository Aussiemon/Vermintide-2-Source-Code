require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTVortexSpawnAction = class(BTVortexSpawnAction, BTNode)

BTVortexSpawnAction.init = function (self, ...)
	BTVortexSpawnAction.super.init(self, ...)
end

BTVortexSpawnAction.name = "BTVortexSpawnAction"

BTVortexSpawnAction.enter = function (self, unit, blackboard, t)
	local current_position = POSITION_LOOKUP[unit]
	local nav_world = blackboard.nav_world
	local is_position_on_navmesh = GwNavQueries.triangle_from_position(nav_world, current_position, 0.5, 0.5)

	if not is_position_on_navmesh then
		local conflict_director = Managers.state.conflict

		conflict_director:destroy_unit(unit, blackboard, "no_navmesh")
	end
end

BTVortexSpawnAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.spawn = false
end

BTVortexSpawnAction.run = function (self, unit, blackboard, t, dt)
	return "done"
end
