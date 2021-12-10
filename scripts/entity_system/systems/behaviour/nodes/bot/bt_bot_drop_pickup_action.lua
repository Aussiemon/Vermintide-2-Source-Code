require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTBotDropPickupAction = class(BTBotDropPickupAction, BTNode)

BTBotDropPickupAction.init = function (self, ...)
	BTBotDropPickupAction.super.init(self, ...)
end

BTBotDropPickupAction.name = "BTBotDropPickupAction"

BTBotDropPickupAction.enter = function (self, unit, blackboard, t)
	local inventory_extension = blackboard.inventory_extension
	local wielded_slot_name = inventory_extension:get_wielded_slot_name()
	local slot_data = inventory_extension:get_slot_data(wielded_slot_name)
	local item_data = slot_data.item_data
	local item_template = BackendUtils.get_item_template(item_data)
	local _, right_hand_weapon_extension, left_hand_weapon_extension = CharacterStateHelper.get_item_data_and_weapon_extensions(inventory_extension)
	local _, current_action_extension, _ = CharacterStateHelper.get_current_action_data(left_hand_weapon_extension, right_hand_weapon_extension)
	local weapon_extension = AiUtils.get_bot_weapon_extension(blackboard)
	blackboard.drop = {
		weapon_extension = weapon_extension,
		wielded_item_template = item_template
	}
end

BTBotDropPickupAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.drop = nil
end

BTBotDropPickupAction.run = function (self, unit, blackboard, t, dt)
	local drop_blackboard = blackboard.drop
	local weapon_extension = drop_blackboard.weapon_extension
	local wielded_item_template = drop_blackboard.wielded_item_template
	local attack_input = "hold_attack"
	local attack_meta_data = wielded_item_template.attack_meta_data[attack_input]

	weapon_extension:request_bot_attack_action(attack_input, wielded_item_template.actions, wielded_item_template.name, attack_meta_data.attack_chain)

	return "running"
end

return
