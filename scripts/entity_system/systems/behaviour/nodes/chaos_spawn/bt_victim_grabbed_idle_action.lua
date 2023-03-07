require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTVictimGrabbedIdleAction = class(BTVictimGrabbedIdleAction, BTNode)
BTVictimGrabbedIdleAction.name = "BTVictimGrabbedIdleAction"

BTVictimGrabbedIdleAction.init = function (self, ...)
	BTVictimGrabbedIdleAction.super.init(self, ...)
end

BTVictimGrabbedIdleAction.enter = function (self, unit, blackboard, t)
	local network_manager = Managers.state.network
	local animation = "idle_grabbed"
	local action = self._tree_node.action_data
	blackboard.action = action

	if blackboard.move_state ~= "idle" then
		network_manager:anim_event(unit, animation)

		blackboard.move_state = "idle"
	end

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())
	StatusUtils.set_grabbed_by_chaos_spawn_status_network(blackboard.victim_grabbed, "idle")

	blackboard.grabbed_state = "idle"
end

BTVictimGrabbedIdleAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.navigation_extension:set_enabled(true)
end

local Unit_alive = Unit.alive

BTVictimGrabbedIdleAction.run = function (self, unit, blackboard, t, dt)
	local target_unit = blackboard.target_unit

	if Unit_alive(target_unit) then
		local rot = LocomotionUtils.rotation_towards_unit_flat(unit, target_unit)

		blackboard.locomotion_extension:set_wanted_rotation(rot)
	end

	return "running"
end
