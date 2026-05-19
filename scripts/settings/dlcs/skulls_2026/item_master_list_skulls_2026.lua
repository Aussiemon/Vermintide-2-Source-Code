-- chunkname: @scripts/settings/dlcs/skulls_2026/item_master_list_skulls_2026.lua

ItemMasterList.dw_crossbow_skin_02_runed_04 = {
	hud_icon = "weapon_generic_icon_staff_3",
	information_text = "information_weapon_skin",
	item_type = "weapon_skin",
	matching_item_key = "dr_crossbow",
	rarity = "unique",
	slot_type = "weapon_skin",
	template = "crossbow_template_1",
	can_wield = {
		"dr_ironbreaker",
		"dr_ranger",
	},
}
ItemMasterList.we_longbow_skin_05_runed_04 = {
	hud_icon = "weapon_generic_icon_staff_3",
	information_text = "information_weapon_skin",
	item_type = "weapon_skin",
	matching_item_key = "we_longbow",
	rarity = "unique",
	slot_type = "weapon_skin",
	template = "longbow_template_1",
	can_wield = {
		"we_shade",
		"we_maidenguard",
		"we_waywatcher",
	},
}
ItemMasterList.es_blunderbuss_skin_04_runed_04 = {
	hud_icon = "weapon_generic_icon_staff_3",
	information_text = "information_weapon_skin",
	item_type = "weapon_skin",
	matching_item_key = "es_blunderbuss",
	rarity = "unique",
	slot_type = "weapon_skin",
	template = "blunderbuss_template_1",
	can_wield = {
		"es_huntsman",
		"es_knight",
		"es_mercenary",
	},
}
ItemMasterList.es_1h_flail_skin_05_runed_04 = {
	hud_icon = "weapon_generic_icon_mace",
	information_text = "information_weapon_skin",
	item_type = "weapon_skin",
	matching_item_key = "es_1h_flail",
	rarity = "unique",
	slot_type = "weapon_skin",
	template = "one_handed_flail_template_1",
	can_wield = {
		"wh_zealot",
		"wh_captain",
		"wh_bountyhunter",
	},
}
ItemMasterList.bw_dagger_skin_05_runed_04 = {
	hud_icon = "weapon_generic_icon_daggers",
	information_text = "information_weapon_skin",
	item_type = "weapon_skin",
	matching_item_key = "bw_dagger",
	rarity = "unique",
	slot_type = "weapon_skin",
	template = "one_handed_daggers_template_1",
	can_wield = {
		"bw_scholar",
		"bw_adept",
		"bw_unchained",
	},
}
ItemMasterList.frame_skulls_2026 = {
	description = "frame_skulls_2026_description",
	display_name = "frame_skulls_2026_name",
	display_unit = "units/weapons/weapon_display/display_portrait_frame",
	hud_icon = "unit_frame_02",
	information_text = "information_text_frame",
	inventory_icon = "icon_portrait_frame_skulls_2026",
	item_type = "frame",
	rarity = "promo",
	slot_type = "frame",
	temporary_template = "frame_skulls_2026",
	can_wield = CanWieldAllItemTemplates,
	events = {
		"skulls",
		"dwarf_fest",
	},
}
