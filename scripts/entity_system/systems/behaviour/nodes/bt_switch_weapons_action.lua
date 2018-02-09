require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTSwitchWeaponsAction = class(BTSwitchWeaponsAction, BTNode)
BTSwitchWeaponsAction.name = "BTSwitchWeaponsAction"
BTSwitchWeaponsAction.init = function (self, ...)
	BTSwitchWeaponsAction.super.init(self, ...)

	return 
end
BTSwitchWeaponsAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.active_node = BTSwitchWeaponsAction

	blackboard.navigation_extension:stop()

	local ai_inventory_ext = ScriptUnit.has_extension(unit, "ai_inventory_system")
	local wanted_set = blackboard.switching_weapons

	ai_inventory_ext.wield_item_set(ai_inventory_ext, wanted_set)

	blackboard.inventory_item_set = wanted_set
	blackboard.switching_done_time = t + 0.75

	return 
end
BTSwitchWeaponsAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.switching_weapons = false

	return 
end
BTSwitchWeaponsAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.switching_done_time < t then
		return "done"
	end

	return "running"
end

return 
