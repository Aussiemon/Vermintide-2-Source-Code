require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTBotInventorySwitchAction = class(BTBotInventorySwitchAction, BTNode)
BTBotInventorySwitchAction.init = function (self, ...)
	BTBotInventorySwitchAction.super.init(self, ...)

	return 
end
BTBotInventorySwitchAction.name = "BTBotInventorySwitchAction"
BTBotInventorySwitchAction.enter = function (self, unit, blackboard, t)
	blackboard.node_timer = t
	blackboard.wanted_slot = self._tree_node.action_data.wanted_slot

	return 
end
BTBotInventorySwitchAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.wanted_slot = nil

	return 
end
BTBotInventorySwitchAction.run = function (self, unit, blackboard, t, dt)
	local wanted_slot = blackboard.wanted_slot
	local inventory_ext = blackboard.inventory_extension
	local input_extension = blackboard.input_extension

	if inventory_ext.equipment(inventory_ext).wielded_slot == wanted_slot then
		return "done"
	elseif blackboard.node_timer + 0.3 < t then
		blackboard.node_timer = t

		return "running", "evaluate"
	else
		input_extension.wield(input_extension, wanted_slot)

		return "running"
	end

	return 
end

return 
