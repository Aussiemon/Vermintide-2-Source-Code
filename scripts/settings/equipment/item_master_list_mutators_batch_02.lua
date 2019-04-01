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
		can_wield = {
			"bw_scholar",
			"bw_adept",
			"bw_unchained",
			"we_shade",
			"we_maidenguard",
			"we_waywatcher",
			"dr_ironbreaker",
			"dr_slayer",
			"dr_ranger",
			"wh_zealot",
			"wh_bountyhunter",
			"wh_captain",
			"es_huntsman",
			"es_knight",
			"es_mercenary"
		}
	}
}

table.merge_recursive(ItemMasterList, item_master_list)

return
