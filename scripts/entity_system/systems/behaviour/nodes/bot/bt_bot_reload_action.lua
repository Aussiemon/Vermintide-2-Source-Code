require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTBotReloadAction = class(BTBotReloadAction, BTNode)

BTBotReloadAction.init = function (self, ...)
	BTBotReloadAction.super.init(self, ...)
end

BTBotReloadAction.name = "BTBotReloadAction"

BTBotReloadAction.enter = function (self, unit, blackboard, t)
	blackboard.reloading = true
end

BTBotReloadAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.reloading = false
end

BTBotReloadAction.run = function (self, unit, blackboard, t, dt)
	local input_extension = blackboard.input_extension

	input_extension:weapon_reload()

	return "running", "evaluate"
end
