﻿-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bot/bt_bot_inventory_switch_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTBotInventorySwitchAction = class(BTBotInventorySwitchAction, BTNode)

BTBotInventorySwitchAction.init = function (self, ...)
	BTBotInventorySwitchAction.super.init(self, ...)
end

BTBotInventorySwitchAction.name = "BTBotInventorySwitchAction"

BTBotInventorySwitchAction.enter = function (self, unit, blackboard, t)
	blackboard.node_timer = t

	local action_data = self._tree_node.action_data

	if action_data.wanted_slot_key then
		blackboard.wanted_slot = blackboard[action_data.wanted_slot_key]
	else
		blackboard.wanted_slot = self._tree_node.action_data.wanted_slot
	end
end

BTBotInventorySwitchAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.wanted_slot = nil
end

BTBotInventorySwitchAction.run = function (self, unit, blackboard, t, dt)
	local wanted_slot = blackboard.wanted_slot

	if wanted_slot == nil then
		return "failed"
	end

	local inventory_ext = blackboard.inventory_extension
	local input_extension = blackboard.input_extension

	if inventory_ext:equipment().wielded_slot == wanted_slot then
		return "done"
	elseif t > blackboard.node_timer + 0.3 then
		blackboard.node_timer = t

		return "running", "evaluate"
	else
		input_extension:wield(wanted_slot)

		return "running"
	end
end
