local item_master_list = {
	mutator_statue_01 = {
		temporary_template = "mutator_statue_01",
		slot_type = "healthkit",
		rarity = "plentiful",
		inventory_icon = "icons_placeholder",
		left_hand_unit = "units/weapons/player/pup_mutator_statue_01/wpn_mutator_statue_01",
		gamepad_hud_icon = "consumables_icon_defence",
		hud_icon = "consumables_icon_defence",
		item_type = "inventory_item",
		can_wield = CanWieldAllItemTemplates
	}
}

table.merge_recursive(ItemMasterList, item_master_list)
