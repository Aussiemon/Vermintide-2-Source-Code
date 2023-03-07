require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTHomingFlightAction = class(BTHomingFlightAction, BTNode)

BTHomingFlightAction.init = function (self, ...)
	BTHomingFlightAction.super.init(self, ...)
end

BTHomingFlightAction.name = "BTHomingFlightAction"

BTHomingFlightAction.enter = function (self)
	self._ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
end

BTHomingFlightAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local old_target_unit = blackboard.homing_target_unit

	if old_target_unit then
		self._ai_bot_group_system:ranged_attack_ended(unit, old_target_unit, "shadow_skull")

		blackboard.homing_target_unit = nil
	end
end

BTHomingFlightAction.run = function (self, unit, blackboard, t, dt, bt_name)
	local old_target_unit = blackboard.homing_target_unit
	local new_target_unit = blackboard.target_unit

	if new_target_unit ~= old_target_unit then
		local ai_bot_group_system = self._ai_bot_group_system

		if old_target_unit then
			ai_bot_group_system:ranged_attack_ended(unit, old_target_unit, "shadow_skull")
		end

		if new_target_unit then
			ai_bot_group_system:ranged_attack_started(unit, new_target_unit, "shadow_skull")
		end

		blackboard.homing_target_unit = new_target_unit
	end

	return "running"
end
