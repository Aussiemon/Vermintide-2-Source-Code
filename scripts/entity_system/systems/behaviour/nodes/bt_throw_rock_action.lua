-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_throw_rock_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTThrowRockAction = class(BTThrowRockAction, BTNode)

BTThrowRockAction.init = function (self, ...)
	BTThrowRockAction.super.init(self, ...)
end

BTThrowRockAction.name = "BTThrowRockAction"

BTThrowRockAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data

	Managers.state.network:anim_event(unit, action.attack_anim)

	blackboard.attack_cooldown = t + action.cooldown
end

BTThrowRockAction.leave = function (self, unit, blackboard, t, reason, destroy)
	print("BTThrowRockAction LEAVE")

	blackboard.running_attack_action = nil
end

BTThrowRockAction.run = function (self, unit, blackboard, t, dt)
	local rot = LocomotionUtils.rotation_towards_unit(unit, blackboard.target_unit)
	local locomotion = blackboard.locomotion_extension

	locomotion:set_wanted_rotation(rot)

	if t > blackboard.attack_cooldown then
		blackboard.running_attack_action = nil
	end
end
