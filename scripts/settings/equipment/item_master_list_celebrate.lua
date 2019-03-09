local item_master_list = {
	wpn_beer_bottle = {
		description = "wpn_beer_bottle",
		temporary_template = "beer_bottle",
		right_hand_unit = "units/weapons/player/wpn_ale/wpn_ale",
		inventory_icon = "icons_placeholder",
		slot_type = "potion",
		description_type = "beer_bottle",
		rarity = "plentiful",
		gamepad_hud_icon = "icons_placeholder",
		hud_icon = "icons_placeholder",
		item_type = "potion",
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
	},
	frame_celebration_01 = {
		description = "frame_celebration_01_description",
		temporary_template = "frame_celebration_01",
		display_name = "frame_celebration_01_name",
		hud_icon = "unit_frame_02",
		inventory_icon = "icon_portrait_frame_celebration_1",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
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
	},
	frame_celebration_02 = {
		description = "frame_celebration_02_description",
		temporary_template = "frame_celebration_02",
		display_name = "frame_celebration_02_name",
		hud_icon = "unit_frame_02",
		inventory_icon = "icon_portrait_frame_celebration_2",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
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
	},
	frame_celebration_03 = {
		description = "frame_celebration_03_description",
		temporary_template = "frame_celebration_03",
		display_name = "frame_celebration_03_name",
		hud_icon = "unit_frame_02",
		inventory_icon = "icon_portrait_frame_celebration_3",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
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
