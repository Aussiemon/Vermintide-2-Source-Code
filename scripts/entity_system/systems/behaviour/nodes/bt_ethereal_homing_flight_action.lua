-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_ethereal_homing_flight_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTEtherealHomingFlightAction = class(BTEtherealHomingFlightAction, BTNode)

BTEtherealHomingFlightAction.init = function (self, ...)
	BTEtherealHomingFlightAction.super.init(self, ...)
end

BTEtherealHomingFlightAction.name = "BTEtherealHomingFlightAction"

BTEtherealHomingFlightAction.enter = function (self)
	self._ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
end

BTEtherealHomingFlightAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local old_target_unit = blackboard.homing_target_unit

	if old_target_unit then
		self._ai_bot_group_system:ranged_attack_ended(unit, old_target_unit, "shadow_skull")

		blackboard.homing_target_unit = nil
	end
end

BTEtherealHomingFlightAction.run = function (self, unit, blackboard, t, dt, bt_name)
	if not blackboard.bot_target_delay then
		blackboard.bot_target_delay = t + 6
	elseif t > blackboard.bot_target_delay and not blackboard.is_target then
		blackboard.is_target = true
	end

	local old_target_unit = blackboard.homing_target_unit
	local new_target_unit = blackboard.target_unit

	if new_target_unit ~= old_target_unit then
		local ai_bot_group_system = self._ai_bot_group_system

		if old_target_unit then
			ai_bot_group_system:ranged_attack_ended(unit, old_target_unit, "shadow_skull")
		end

		if new_target_unit and blackboard.is_target then
			ai_bot_group_system:ranged_attack_started(unit, new_target_unit, "shadow_skull")

			blackboard.homing_target_unit = new_target_unit
		end
	end

	return "running"
end
