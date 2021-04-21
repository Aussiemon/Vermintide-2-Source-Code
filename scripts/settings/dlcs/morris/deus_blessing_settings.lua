require("scripts/settings/dlcs/morris/deus_cost_settings")

DeusBlessingSettings = DeusBlessingSettings or {
	blessing_of_power = {
		description = "blessing_of_power_desc",
		lifetime = 1,
		display_name = "blessing_of_power_name",
		icon = "blessing_power_01",
		shop_icon = "blessing_power_02",
		mutators = {
			"blessing_of_power"
		}
	},
	blessing_of_shallya = {
		description = "blessing_of_shallya_desc",
		lifetime = 1,
		display_name = "blessing_of_shallya_name",
		icon = "blessing_shallya_01",
		shop_icon = "blessing_shallya_02",
		mutators = {
			"blessing_of_shallya"
		}
	},
	blessing_of_grimnir = {
		description = "blessing_of_grimnir_desc",
		lifetime = 1,
		display_name = "blessing_of_grimnir_name",
		icon = "blessing_grimnir_01",
		shop_icon = "blessing_grimnir_02",
		mutators = {
			"blessing_of_grimnir"
		}
	},
	blessing_of_isha = {
		description = "blessing_of_isha_desc",
		display_name = "blessing_of_isha_name",
		is_permanent = true,
		icon = "blessing_isha_01",
		shop_icon = "blessing_isha_02",
		mutators = {
			"blessing_of_isha"
		}
	},
	blessing_of_ranald = {
		description = "blessing_of_ranald_desc",
		lifetime = 1,
		display_name = "blessing_of_ranald_name",
		icon = "blessing_ranald_01",
		shop_icon = "blessing_ranald_02",
		mutators = {
			"blessing_of_ranald"
		}
	},
	blessing_of_abundance = {
		description = "blessing_of_abundance_desc",
		lifetime = 1,
		display_name = "blessing_of_abundance_name",
		icon = "blessing_abundance_01",
		shop_icon = "blessing_abundance_02",
		mutators = {
			"blessing_of_abundance"
		}
	},
	blessing_holy_hand_grenade = {
		description = "blessing_holy_hand_grenade_desc",
		lifetime = 1,
		display_name = "blessing_holy_hand_grenade_name",
		icon = "blessing_holygrenade_01",
		shop_icon = "blessing_holygrenade_02",
		grant_item = {
			item_name = "holy_hand_grenade",
			slot_name = "slot_grenade"
		}
	},
	blessing_rally_flag = {
		description = "blessing_rally_flag_desc",
		lifetime = 1,
		display_name = "blessing_rally_flag_name",
		icon = "blessing_jadecenser_01",
		shop_icon = "blessing_jadecenser_02",
		grant_item = {
			item_name = "deus_rally_flag",
			slot_name = "slot_healthkit"
		}
	}
}

return
