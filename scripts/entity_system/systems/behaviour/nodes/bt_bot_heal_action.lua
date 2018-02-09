require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTBotHealAction = class(BTBotHealAction, BTNode)
BTBotHealAction.init = function (self, ...)
	BTBotHealAction.super.init(self, ...)

	return 
end
BTBotHealAction.name = "BTBotHealAction"
BTBotHealAction.enter = function (self, unit, blackboard, t)
	local health_extension = blackboard.health_extension
	local health_percent = health_extension.current_health_percent(health_extension)
	blackboard.starting_health_percent = health_percent
	blackboard.is_healing_self = true

	return 
end
BTBotHealAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.force_use_health_pickup = nil
	blackboard.starting_health_percent = nil
	blackboard.is_healing_self = false

	return 
end
BTBotHealAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.force_use_health_pickup then
		local health_extension = blackboard.health_extension
		local health_percent = health_extension.current_health_percent(health_extension)

		if blackboard.starting_health_percent < health_percent then
			return "done"
		end
	end

	blackboard.input_extension:hold_attack()

	return "running"
end

return 
