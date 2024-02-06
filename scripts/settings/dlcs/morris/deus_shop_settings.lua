-- chunkname: @scripts/settings/dlcs/morris/deus_shop_settings.lua

DeusShopSettings = DeusShopSettings or {
	heal_amount = 0.1,
	heal_cost = 10,
	shop_types = {
		shop_strife = {
			max_discounts = 0,
			power_up_count = 4,
			power_up_discount = 0.5,
			twitch_icon = "twitch_icon_shrine",
			blessings = {
				"blessing_of_grimnir",
				"blessing_holy_hand_grenade",
				"blessing_of_power",
			},
		},
		shop_harmony = {
			max_discounts = 0,
			power_up_count = 4,
			power_up_discount = 0.5,
			twitch_icon = "twitch_icon_shrine",
			blessings = {
				"blessing_of_shallya",
				"blessing_of_isha",
				"blessing_rally_flag",
			},
		},
		shop_fortune = {
			max_discounts = 0,
			power_up_count = 4,
			power_up_discount = 0.5,
			twitch_icon = "twitch_icon_shrine",
			blessings = {
				"blessing_of_ranald",
				"blessing_of_abundance",
			},
		},
	},
}
