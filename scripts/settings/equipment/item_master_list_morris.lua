require("scripts/settings/dlcs/morris/tweak_data/buff_tweak_data")

local item_master_list = {
	dr_deus_01 = {
		ammo_unit = "units/weapons/player/wpn_dr_deus_projectile_01/wpn_dr_deus_projectile_01",
		display_name = "dr_deus_01_name",
		slot_type = "ranged",
		skin_combination_table = "dr_deus_01_skins",
		left_hand_unit = "units/weapons/player/wpn_dr_deus_01/wpn_dr_deus_01",
		ammo_unit_3p = "units/weapons/player/wpn_dr_deus_projectile_01/wpn_dr_deus_projectile_01_3p",
		hud_icon = "weapon_generic_icon_crossbow",
		item_type = "dr_deus_01",
		trait_table_name = "ranged_ammo",
		description = "dr_deus_01_description",
		rarity = "plentiful",
		inventory_icon = "icon_wpn_dw_trollhammer_t1",
		has_power_level = true,
		template = "dr_deus_01_template_1",
		property_table_name = "ranged",
		required_dlc = "grass",
		can_wield = {
			"dr_ironbreaker"
		}
	},
	dr_deus_01_skin = {
		description = "dr_deus_01_skin_01_description",
		rarity = "plentiful",
		display_name = "dr_deus_01_skin_01_name",
		base_skin_item = true,
		slot_type = "weapon_skin",
		information_text = "information_weapon_skin",
		item_type = "weapon_skin",
		matching_item_key = "dr_deus_01",
		can_wield = {
			"dr_ironbreaker"
		}
	},
	dr_deus_01_skin_02 = {
		description = "dr_deus_01_skin_02_description",
		ammo_unit = "units/weapons/player/wpn_dr_deus_projectile_02/wpn_dr_deus_projectile_02",
		display_name = "dr_deus_01_skin_02_name",
		hud_icon = "weapon_generic_icon_crossbow",
		inventory_icon = "icon_wpn_dw_trollhammer_t2",
		slot_type = "weapon_skin",
		information_text = "information_weapon_skin",
		rarity = "exotic",
		ammo_unit_3p = "units/weapons/player/wpn_dr_deus_projectile_02/wpn_dr_deus_projectile_02_3p",
		template = "dr_deus_01_template_1",
		display_unit = "units/weapons/weapon_display/display_drakegun",
		item_type = "weapon_skin",
		left_hand_unit = "units/weapons/player/wpn_dr_deus_02/wpn_dr_deus_02",
		required_dlc = "grass",
		matching_item_key = "dr_deus_01",
		can_wield = {
			"dr_ironbreaker"
		}
	},
	dr_deus_01_skin_03 = {
		description = "dr_deus_01_skin_02_description",
		ammo_unit = "units/weapons/player/wpn_dr_deus_projectile_03/wpn_dr_deus_projectile_03",
		display_name = "dr_deus_01_skin_02_name",
		hud_icon = "weapon_generic_icon_crossbow",
		inventory_icon = "icon_wpn_dw_trollhammer_t3",
		slot_type = "weapon_skin",
		information_text = "information_weapon_skin",
		rarity = "exotic",
		ammo_unit_3p = "units/weapons/player/wpn_dr_deus_projectile_03/wpn_dr_deus_projectile_03_3p",
		template = "dr_deus_01_template_1",
		display_unit = "units/weapons/weapon_display/display_drakegun",
		item_type = "weapon_skin",
		left_hand_unit = "units/weapons/player/wpn_dr_deus_03/wpn_dr_deus_03",
		required_dlc = "grass",
		matching_item_key = "dr_deus_01",
		can_wield = {
			"dr_ironbreaker"
		}
	},
	dr_deus_01_skin_01_runed = {
		description = "dr_deus_01_skin_01_runed_description",
		ammo_unit = "units/weapons/player/wpn_dr_deus_projectile_01/wpn_dr_deus_projectile_01",
		display_name = "dr_deus_01_skin_01_runed_name",
		hud_icon = "weapon_generic_icon_crossbow",
		inventory_icon = "icon_wpn_dw_trollhammer_t1_runed",
		slot_type = "weapon_skin",
		information_text = "information_weapon_skin",
		rarity = "unique",
		ammo_unit_3p = "units/weapons/player/wpn_dr_deus_projectile_01/wpn_dr_deus_projectile_01_3p",
		template = "dr_deus_01_template_1",
		display_unit = "units/weapons/weapon_display/display_drakegun",
		item_type = "weapon_skin",
		left_hand_unit = "units/weapons/player/wpn_dr_deus_01/wpn_dr_deus_01_runed",
		required_dlc = "grass",
		matching_item_key = "dr_deus_01",
		can_wield = {
			"dr_ironbreaker"
		}
	},
	dr_deus_01_skin_02_runed = {
		description = "dr_deus_01_skin_02_runed_description",
		ammo_unit = "units/weapons/player/wpn_dr_deus_projectile_02/wpn_dr_deus_projectile_02",
		display_name = "dr_deus_01_skin_02_runed_name",
		hud_icon = "weapon_generic_icon_crossbow",
		inventory_icon = "icon_wpn_dw_trollhammer_t2_runed",
		slot_type = "weapon_skin",
		information_text = "information_weapon_skin",
		rarity = "unique",
		ammo_unit_3p = "units/weapons/player/wpn_dr_deus_projectile_02/wpn_dr_deus_projectile_02_3p",
		template = "dr_deus_01_template_1",
		display_unit = "units/weapons/weapon_display/display_drakegun",
		item_type = "weapon_skin",
		left_hand_unit = "units/weapons/player/wpn_dr_deus_02/wpn_dr_deus_02_runed",
		required_dlc = "grass",
		matching_item_key = "dr_deus_01",
		can_wield = {
			"dr_ironbreaker"
		}
	},
	dr_deus_01_skin_03_runed = {
		description = "dr_deus_01_skin_02_runed_description",
		ammo_unit = "units/weapons/player/wpn_dr_deus_projectile_03/wpn_dr_deus_projectile_03",
		display_name = "dr_deus_01_skin_02_runed_name",
		hud_icon = "weapon_generic_icon_crossbow",
		inventory_icon = "icon_wpn_dw_trollhammer_t3_runed",
		slot_type = "weapon_skin",
		information_text = "information_weapon_skin",
		rarity = "unique",
		ammo_unit_3p = "units/weapons/player/wpn_dr_deus_projectile_03/wpn_dr_deus_projectile_03_3p",
		template = "dr_deus_01_template_1",
		display_unit = "units/weapons/weapon_display/display_drakegun",
		item_type = "weapon_skin",
		left_hand_unit = "units/weapons/player/wpn_dr_deus_03/wpn_dr_deus_03_runed",
		required_dlc = "grass",
		matching_item_key = "dr_deus_01",
		can_wield = {
			"dr_ironbreaker"
		}
	},
	dr_deus_01_skin_magic = {
		description = "dr_deus_01_magic_description",
		rarity = "magic",
		template = "dr_deus_01_template_1",
		slot_type = "weapon_skin",
		inventory_icon = "icon_wpn_dw_trollhammer_t1",
		left_hand_unit = "units/weapons/player/wpn_dr_deus_01/wpn_dr_deus_01_magic",
		required_dlc = "grass",
		hud_icon = "weapon_generic_icon_staff_3",
		item_type = "weapon_skin",
		matching_item_key = "dr_deus_01",
		can_wield = {
			"dr_ironbreaker",
			"dr_engineer"
		}
	},
	dr_deus_02_skin_magic = {
		description = "dr_deus_01_magic_description",
		rarity = "magic",
		template = "dr_deus_01_template_1",
		slot_type = "weapon_skin",
		inventory_icon = "icon_wpn_dw_trollhammer_t2",
		left_hand_unit = "units/weapons/player/wpn_dr_deus_02/wpn_dr_deus_02_magic",
		required_dlc = "grass",
		hud_icon = "weapon_generic_icon_staff_3",
		item_type = "weapon_skin",
		matching_item_key = "dr_deus_01",
		can_wield = {
			"dr_ironbreaker",
			"dr_engineer"
		}
	},
	dr_deus_01_skin_01 = {
		description = "dr_deus_01_skin_01_description",
		rarity = "plentiful",
		display_name = "dr_deus_01_skin_01_name",
		slot_type = "weapon_skin",
		inventory_icon = "icon_wpn_dw_trollhammer_t1",
		left_hand_unit = "units/weapons/player/wpn_dr_deus_01/wpn_dr_deus_01",
		template = "dr_deus_01_template_1",
		required_dlc = "grass",
		hud_icon = "weapon_generic_icon_staff_3",
		item_type = "weapon_skin",
		matching_item_key = "dr_deus_01",
		can_wield = {
			"dr_ironbreaker",
			"dr_engineer"
		}
	},
	dr_deus_01_magic = {
		template = "dr_deus_01_template_1",
		ammo_unit = "units/weapons/player/wpn_dr_deus_projectile_02/wpn_dr_deus_projectile_02",
		display_name = "dr_deus_01_magic_name",
		slot_type = "ranged",
		left_hand_unit = "units/weapons/player/wpn_dr_deus_02/wpn_dr_deus_02_magic",
		ammo_unit_3p = "units/weapons/player/wpn_dr_deus_projectile_02/wpn_dr_deus_projectile_02_3p",
		hud_icon = "weapon_generic_icon_bow",
		item_type = "dr_deus_01",
		trait_table_name = "ranged_ammo",
		description = "dr_deus_01_magic_description",
		rarity = "magic",
		inventory_icon = "icon_wpn_dw_trollhammer_t2_magic",
		has_power_level = true,
		property_table_name = "ranged",
		required_unlock_item = "dr_deus_01",
		required_dlc = "grass",
		can_wield = {
			"dr_ironbreaker"
		}
	},
	es_deus_01 = {
		description = "es_deus_01_description",
		rarity = "plentiful",
		right_hand_unit = "units/weapons/player/wpn_es_deus_spear_01/wpn_es_deus_spear_01",
		hud_icon = "weapon_generic_icon_falken",
		inventory_icon = "icon_wpn_empire_spearshield_t1",
		left_hand_unit = "units/weapons/player/wpn_empire_shield_02/wpn_emp_shield_02",
		display_name = "es_deus_01_name",
		slot_type = "melee",
		has_power_level = true,
		template = "es_deus_01_template",
		property_table_name = "melee",
		item_type = "es_deus_01",
		skin_combination_table = "es_deus_01_skins",
		trait_table_name = "melee",
		required_dlc = "grass",
		can_wield = {
			"es_huntsman",
			"es_knight",
			"es_mercenary"
		}
	},
	es_deus_01_skin = {
		description = "es_deus_01_skin_01_description",
		rarity = "plentiful",
		display_name = "es_deus_01_skin_01_name",
		base_skin_item = true,
		slot_type = "weapon_skin",
		information_text = "information_weapon_skin",
		item_type = "weapon_skin",
		matching_item_key = "es_deus_01",
		can_wield = {
			"es_huntsman",
			"es_knight",
			"es_mercenary"
		}
	},
	es_deus_01_skin_01 = {
		description = "es_deus_01_skin_01_description",
		rarity = "plentiful",
		right_hand_unit = "units/weapons/player/wpn_es_deus_spear_01/wpn_es_deus_spear_01",
		hud_icon = "weapon_generic_icon_staff_3",
		inventory_icon = "icon_wpn_empire_spearshield_t1",
		left_hand_unit = "units/weapons/player/wpn_empire_shield_02/wpn_emp_shield_02",
		template = "es_deus_01_template",
		display_name = "es_deus_01_skin_01_name",
		slot_type = "weapon_skin",
		required_dlc = "grass",
		item_type = "weapon_skin",
		matching_item_key = "es_deus_01",
		can_wield = {
			"es_huntsman",
			"es_knight",
			"es_mercenary"
		}
	},
	es_deus_01_skin_02 = {
		description = "es_deus_01_skin_02_description",
		rarity = "exotic",
		right_hand_unit = "units/weapons/player/wpn_es_deus_spear_02/wpn_es_deus_spear_02",
		hud_icon = "weapon_generic_iweapon_generic_icon_falkencon_bow",
		inventory_icon = "icon_wpn_empire_spearshield_t2",
		left_hand_unit = "units/weapons/player/wpn_es_deus_shield_02/wpn_es_deus_shield_02",
		information_text = "information_weapon_skin",
		template = "es_deus_01_template",
		display_name = "es_deus_01_skin_02_name",
		slot_type = "weapon_skin",
		display_unit = "units/weapons/weapon_display/display_shield_sword",
		item_type = "weapon_skin",
		required_dlc = "grass",
		matching_item_key = "es_deus_01",
		can_wield = {
			"es_huntsman",
			"es_knight",
			"es_mercenary"
		}
	},
	es_deus_01_skin_03 = {
		description = "es_deus_01_skin_03_description",
		rarity = "exotic",
		right_hand_unit = "units/weapons/player/wpn_es_deus_spear_03/wpn_es_deus_spear_03",
		hud_icon = "weapon_generic_iweapon_generic_icon_falkencon_bow",
		inventory_icon = "icon_wpn_empire_spearshield_t3",
		left_hand_unit = "units/weapons/player/wpn_es_deus_shield_03/wpn_es_deus_shield_03",
		information_text = "information_weapon_skin",
		template = "es_deus_01_template",
		display_name = "es_deus_01_skin_03_name",
		slot_type = "weapon_skin",
		display_unit = "units/weapons/weapon_display/display_shield_sword",
		item_type = "weapon_skin",
		required_dlc = "grass",
		matching_item_key = "es_deus_01",
		can_wield = {
			"es_huntsman",
			"es_knight",
			"es_mercenary"
		}
	},
	es_deus_01_skin_01_runed = {
		description = "es_deus_01_skin_01_runed_description",
		rarity = "unique",
		right_hand_unit = "units/weapons/player/wpn_es_deus_spear_01/wpn_es_deus_spear_01_runed",
		hud_icon = "weapon_generic_icon_falken",
		inventory_icon = "icon_wpn_empire_spearshield_t1_runed",
		left_hand_unit = "units/weapons/player/wpn_empire_shield_02/wpn_emp_shield_02_runed_01",
		information_text = "information_weapon_skin",
		template = "es_deus_01_template",
		display_name = "es_deus_01_skin_01_runed_name",
		slot_type = "weapon_skin",
		display_unit = "units/weapons/weapon_display/display_shield_sword",
		item_type = "weapon_skin",
		required_dlc = "grass",
		matching_item_key = "es_deus_01",
		can_wield = {
			"es_huntsman",
			"es_knight",
			"es_mercenary"
		}
	},
	es_deus_01_skin_02_runed = {
		description = "es_deus_01_skin_02_runed_description",
		rarity = "unique",
		right_hand_unit = "units/weapons/player/wpn_es_deus_spear_02/wpn_es_deus_spear_02_runed",
		hud_icon = "weapon_generic_icon_falken",
		inventory_icon = "icon_wpn_empire_spearshield_t2_runed",
		left_hand_unit = "units/weapons/player/wpn_es_deus_shield_02/wpn_es_deus_shield_02_runed",
		information_text = "information_weapon_skin",
		template = "es_deus_01_template",
		display_name = "es_deus_01_skin_02_runed_name",
		slot_type = "weapon_skin",
		display_unit = "units/weapons/weapon_display/display_shield_sword",
		item_type = "weapon_skin",
		required_dlc = "grass",
		matching_item_key = "es_deus_01",
		can_wield = {
			"es_huntsman",
			"es_knight",
			"es_mercenary"
		}
	},
	es_deus_01_skin_03_runed = {
		description = "es_deus_01_skin_03_runed_description",
		rarity = "unique",
		right_hand_unit = "units/weapons/player/wpn_es_deus_spear_03/wpn_es_deus_spear_03_runed",
		hud_icon = "weapon_generic_icon_falken",
		inventory_icon = "icon_wpn_empire_spearshield_t3_runed",
		left_hand_unit = "units/weapons/player/wpn_es_deus_shield_03/wpn_es_deus_shield_03_runed",
		information_text = "information_weapon_skin",
		template = "es_deus_01_template",
		display_name = "es_deus_01_skin_03_runed_name",
		slot_type = "weapon_skin",
		display_unit = "units/weapons/weapon_display/display_shield_sword",
		item_type = "weapon_skin",
		required_dlc = "grass",
		matching_item_key = "es_deus_01",
		can_wield = {
			"es_huntsman",
			"es_knight",
			"es_mercenary"
		}
	},
	es_deus_01_skin_magic = {
		description = "es_deus_01_magic_description",
		rarity = "magic",
		right_hand_unit = "units/weapons/player/wpn_es_deus_spear_01/wpn_es_deus_spear_01_magic",
		hud_icon = "weapon_generic_icon_staff_3",
		inventory_icon = "icon_wpn_empire_spearshield_t1",
		left_hand_unit = "units/weapons/player/wpn_es_deus_shield_02/wpn_es_deus_shield_02_magic_3p",
		template = "es_deus_01_template",
		slot_type = "weapon_skin",
		required_dlc = "grass",
		item_type = "weapon_skin",
		matching_item_key = "es_deus_01",
		can_wield = {
			"es_huntsman",
			"es_knight",
			"es_mercenary"
		}
	},
	es_deus_02_skin_magic = {
		description = "es_deus_01_magic_description",
		rarity = "magic",
		right_hand_unit = "units/weapons/player/wpn_es_deus_spear_02/wpn_es_deus_spear_02_magic",
		hud_icon = "weapon_generic_icon_staff_3",
		inventory_icon = "icon_wpn_empire_spearshield_t1",
		left_hand_unit = "units/weapons/player/wpn_es_deus_shield_02/wpn_es_deus_shield_02_magic",
		template = "es_deus_01_template",
		slot_type = "weapon_skin",
		required_dlc = "grass",
		item_type = "weapon_skin",
		matching_item_key = "es_deus_01",
		can_wield = {
			"es_huntsman",
			"es_knight",
			"es_mercenary"
		}
	},
	es_deus_01_magic = {
		description = "es_deus_01_magic_description",
		rarity = "magic",
		right_hand_unit = "units/weapons/player/wpn_es_deus_spear_02/wpn_es_deus_spear_02_magic",
		hud_icon = "weapon_generic_icon_bow",
		inventory_icon = "icon_wpn_empire_spearshield_t1_magic",
		slot_type = "melee",
		trait_table_name = "melee",
		display_name = "es_deus_01_magic_name",
		has_power_level = true,
		template = "es_deus_01_template",
		property_table_name = "melee",
		item_type = "es_deus_01",
		left_hand_unit = "units/weapons/player/wpn_es_deus_shield_02/wpn_es_deus_shield_02_magic",
		required_unlock_item = "es_deus_01",
		required_dlc = "grass",
		can_wield = {
			"es_huntsman",
			"es_knight",
			"es_mercenary"
		}
	},
	we_deus_01 = {
		ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_01",
		display_name = "we_deus_01_name",
		slot_type = "ranged",
		skin_combination_table = "we_deus_01_skins",
		left_hand_unit = "units/weapons/player/wpn_we_deus_01/wpn_we_deus_01",
		ammo_unit_3p = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_01_3p",
		hud_icon = "weapon_generic_icon_bow",
		item_type = "we_deus_01",
		trait_table_name = "ranged_energy",
		description = "we_deus_01_description",
		rarity = "plentiful",
		inventory_icon = "icon_wpn_we_moonfire_t1",
		has_power_level = true,
		template = "we_deus_01_template_1",
		property_table_name = "ranged",
		required_dlc = "grass",
		can_wield = {
			"we_shade",
			"we_maidenguard",
			"we_waywatcher"
		}
	},
	we_deus_01_skin = {
		description = "we_deus_01_skin_01_description",
		rarity = "plentiful",
		display_name = "we_deus_01_skin_01_name",
		base_skin_item = true,
		slot_type = "weapon_skin",
		information_text = "information_weapon_skin",
		item_type = "weapon_skin",
		matching_item_key = "we_deus_01",
		can_wield = {
			"we_shade",
			"we_maidenguard",
			"we_waywatcher"
		}
	},
	we_deus_01_skin_01 = {
		description = "we_deus_01_skin_01_description",
		rarity = "plentiful",
		display_name = "we_deus_01_skin_01_name",
		slot_type = "weapon_skin",
		inventory_icon = "icon_wpn_we_moonfire_t1",
		left_hand_unit = "units/weapons/player/wpn_we_deus_01/wpn_we_deus_01",
		template = "we_deus_01_template_1",
		required_dlc = "grass",
		hud_icon = "weapon_generic_icon_bow",
		item_type = "weapon_skin",
		matching_item_key = "we_deus_01",
		can_wield = {
			"we_shade",
			"we_maidenguard",
			"we_waywatcher",
			"we_thornsister"
		}
	},
	we_deus_01_skin_02 = {
		description = "we_deus_01_skin_02_description",
		ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_02",
		display_name = "we_deus_01_skin_02_name",
		hud_icon = "weapon_generic_icon_bow",
		inventory_icon = "icon_wpn_we_moonfire_t2",
		slot_type = "weapon_skin",
		information_text = "information_weapon_skin",
		rarity = "exotic",
		ammo_unit_3p = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_02_3p",
		template = "we_deus_01_template_1",
		display_unit = "units/weapons/weapon_display/display_bow",
		item_type = "weapon_skin",
		left_hand_unit = "units/weapons/player/wpn_we_deus_02/wpn_we_deus_02",
		required_dlc = "grass",
		matching_item_key = "we_deus_01",
		can_wield = {
			"we_shade",
			"we_maidenguard",
			"we_waywatcher"
		}
	},
	we_deus_01_skin_01_runed = {
		description = "we_deus_01_skin_01_runed_description",
		ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_01",
		display_name = "we_deus_01_skin_01_runed_name",
		hud_icon = "weapon_generic_icon_bow",
		inventory_icon = "icon_wpn_we_moonfire_t1_runed",
		slot_type = "weapon_skin",
		information_text = "information_weapon_skin",
		rarity = "unique",
		ammo_unit_3p = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_01_3p",
		template = "we_deus_01_template_1",
		display_unit = "units/weapons/weapon_display/display_bow",
		item_type = "weapon_skin",
		left_hand_unit = "units/weapons/player/wpn_we_deus_01/wpn_we_deus_01_runed",
		required_dlc = "grass",
		matching_item_key = "we_deus_01",
		can_wield = {
			"we_shade",
			"we_maidenguard",
			"we_waywatcher"
		}
	},
	we_deus_01_skin_02_runed = {
		description = "we_deus_01_skin_02_runed_description",
		ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_02",
		display_name = "we_deus_01_skin_02_runed_name",
		hud_icon = "weapon_generic_icon_bow",
		inventory_icon = "icon_wpn_we_moonfire_t2_runed",
		slot_type = "weapon_skin",
		information_text = "information_weapon_skin",
		rarity = "unique",
		ammo_unit_3p = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_02_3p",
		template = "we_deus_01_template_1",
		display_unit = "units/weapons/weapon_display/display_bow",
		item_type = "weapon_skin",
		left_hand_unit = "units/weapons/player/wpn_we_deus_01/wpn_we_deus_02_runed",
		required_dlc = "grass",
		matching_item_key = "we_deus_01",
		can_wield = {
			"we_shade",
			"we_maidenguard",
			"we_waywatcher"
		}
	},
	we_deus_01_skin_magic = {
		description = "we_deus_01_description",
		rarity = "magic",
		template = "we_deus_01_template_1",
		slot_type = "weapon_skin",
		inventory_icon = "icon_wpn_we_moonfire_t1",
		left_hand_unit = "units/weapons/player/wpn_we_deus_01/wpn_we_deus_01_magic",
		required_dlc = "grass",
		hud_icon = "weapon_generic_icon_bow",
		item_type = "weapon_skin",
		matching_item_key = "we_deus_01",
		can_wield = {
			"we_shade",
			"we_maidenguard",
			"we_waywatcher",
			"we_thornsister"
		}
	},
	we_deus_01_magic = {
		template = "we_deus_01_template_1",
		ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_01",
		display_name = "we_deus_01_magic_name",
		slot_type = "ranged",
		left_hand_unit = "units/weapons/player/wpn_we_deus_01/wpn_we_deus_01_magic",
		ammo_unit_3p = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_01_3p",
		hud_icon = "weapon_generic_icon_bow",
		item_type = "we_deus_01",
		trait_table_name = "ranged_energy",
		description = "we_deus_01_magic_description",
		rarity = "magic",
		inventory_icon = "icon_wpn_we_moonfire_t1_magic",
		has_power_level = true,
		property_table_name = "ranged",
		required_unlock_item = "we_deus_01",
		required_dlc = "grass",
		can_wield = {
			"we_shade",
			"we_maidenguard",
			"we_waywatcher"
		}
	},
	we_deus_02_skin_magic = {
		description = "we_deus_01_magic_description",
		ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_02",
		display_name = "we_deus_01_magic_name",
		hud_icon = "weapon_generic_icon_bow",
		inventory_icon = "icon_wpn_we_moonfire_t2_magic",
		left_hand_unit = "units/weapons/player/wpn_we_deus_02/wpn_we_deus_02_magic",
		rarity = "magic",
		slot_type = "weapon_skin",
		ammo_unit_3p = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_02_3p",
		template = "we_deus_01_template_1",
		required_dlc = "grass",
		item_type = "weapon_skin",
		required_unlock_item = "we_deus_01",
		matching_item_key = "we_deus_01",
		can_wield = {
			"we_shade",
			"we_maidenguard",
			"we_waywatcher"
		}
	},
	we_deus_01_skin_03 = {
		description = "we_deus_01_skin_03_description",
		ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_01",
		display_name = "we_deus_01_skin_03_name",
		hud_icon = "weapon_generic_icon_bow",
		inventory_icon = "icon_wpn_we_moonfire_t3",
		slot_type = "weapon_skin",
		information_text = "information_weapon_skin",
		rarity = "exotic",
		ammo_unit_3p = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_01_3p",
		template = "we_deus_01_template_1",
		display_unit = "units/weapons/weapon_display/display_bow",
		item_type = "weapon_skin",
		left_hand_unit = "units/weapons/player/wpn_we_deus_03/wpn_we_deus_03",
		required_dlc = "grass",
		matching_item_key = "we_deus_01",
		can_wield = {
			"we_shade",
			"we_maidenguard",
			"we_waywatcher"
		}
	},
	we_deus_01_skin_03_runed = {
		description = "we_deus_01_skin_03_runed_description",
		ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_01",
		display_name = "we_deus_01_skin_03_runed_name",
		hud_icon = "weapon_generic_icon_bow",
		inventory_icon = "icon_wpn_we_moonfire_t3_runed",
		slot_type = "weapon_skin",
		information_text = "information_weapon_skin",
		rarity = "unique",
		ammo_unit_3p = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_01_3p",
		template = "we_deus_01_template_1",
		display_unit = "units/weapons/weapon_display/display_bow",
		item_type = "weapon_skin",
		left_hand_unit = "units/weapons/player/wpn_we_deus_03/wpn_we_deus_03_runed",
		required_dlc = "grass",
		matching_item_key = "we_deus_01",
		can_wield = {
			"we_shade",
			"we_maidenguard",
			"we_waywatcher"
		}
	},
	bw_deus_01 = {
		description = "bw_deus_01_description",
		rarity = "plentiful",
		right_hand_unit = "units/weapons/player/wpn_bw_deus_01/wpn_bw_deus_01",
		hud_icon = "weapon_generic_icon_staff_5",
		inventory_icon = "icon_wpn_brw_magmastaff_t1",
		slot_type = "ranged",
		display_name = "bw_deus_01_name",
		left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
		has_power_level = true,
		template = "bw_deus_01_template_1",
		property_table_name = "ranged",
		item_type = "bw_deus_01",
		skin_combination_table = "bw_deus_01_skins",
		trait_table_name = "ranged_heat",
		required_dlc = "grass",
		can_wield = {
			"bw_scholar",
			"bw_adept",
			"bw_unchained"
		}
	},
	bw_deus_01_skin = {
		description = "bw_deus_01_skin_01_description",
		rarity = "plentiful",
		display_name = "bw_deus_01_skin_01_name",
		base_skin_item = true,
		slot_type = "weapon_skin",
		information_text = "information_weapon_skin",
		item_type = "weapon_skin",
		matching_item_key = "bw_deus_01",
		can_wield = {
			"bw_scholar",
			"bw_adept",
			"bw_unchained"
		}
	},
	bw_deus_01_skin_01 = {
		description = "bw_deus_01_skin_01_description",
		rarity = "plentiful",
		right_hand_unit = "units/weapons/player/wpn_bw_deus_01/wpn_bw_deus_01",
		hud_icon = "weapon_generic_icon_staff_3",
		inventory_icon = "icon_wpn_brw_magmastaff_t1",
		left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
		template = "bw_deus_01_template",
		display_name = "bw_deus_01_skin_01_name",
		slot_type = "weapon_skin",
		required_dlc = "grass",
		item_type = "weapon_skin",
		matching_item_key = "bw_deus_01",
		can_wield = {
			"bw_scholar",
			"bw_adept",
			"bw_unchained"
		}
	},
	bw_deus_01_skin_02 = {
		description = "bw_deus_01_skin_02_description",
		rarity = "exotic",
		right_hand_unit = "units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02",
		inventory_icon = "icon_wpn_brw_magmastaff_t2",
		slot_type = "weapon_skin",
		information_text = "information_weapon_skin",
		hud_icon = "weapon_generic_icon_staff_5",
		display_name = "bw_deus_01_skin_02_name",
		template = "bw_deus_01_template_1",
		display_unit = "units/weapons/weapon_display/display_staff",
		item_type = "weapon_skin",
		left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
		required_dlc = "grass",
		matching_item_key = "bw_deus_01",
		can_wield = {
			"bw_scholar",
			"bw_adept",
			"bw_unchained"
		},
		right_hand_unit_override = {
			bw_necromancer = "units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_baelfire"
		}
	},
	bw_deus_01_skin_01_runed = {
		description = "bw_deus_01_skin_01_runed_description",
		rarity = "unique",
		right_hand_unit = "units/weapons/player/wpn_bw_deus_01/wpn_bw_deus_01_runed",
		hud_icon = "weapon_generic_icon_staff_5",
		inventory_icon = "icon_wpn_brw_magmastaff_t1_runed",
		left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
		information_text = "information_weapon_skin",
		template = "bw_deus_01_template_1",
		display_name = "bw_deus_01_skin_01_runed_name",
		slot_type = "weapon_skin",
		display_unit = "units/weapons/weapon_display/display_staff",
		item_type = "weapon_skin",
		required_dlc = "grass",
		matching_item_key = "bw_deus_01",
		can_wield = {
			"bw_scholar",
			"bw_adept",
			"bw_unchained"
		}
	},
	bw_deus_01_skin_02_runed = {
		description = "bw_deus_01_skin_02_runed_description",
		rarity = "unique",
		right_hand_unit = "units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_runed",
		inventory_icon = "icon_wpn_brw_magmastaff_t2_runed",
		slot_type = "weapon_skin",
		information_text = "information_weapon_skin",
		hud_icon = "weapon_generic_icon_staff_5",
		display_name = "bw_deus_01_skin_02_runed_name",
		template = "bw_deus_01_template_1",
		display_unit = "units/weapons/weapon_display/display_staff",
		item_type = "weapon_skin",
		left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
		required_dlc = "grass",
		matching_item_key = "bw_deus_01",
		can_wield = {
			"bw_scholar",
			"bw_adept",
			"bw_unchained"
		},
		right_hand_unit_override = {
			bw_necromancer = "units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_runed_baelfire"
		}
	},
	bw_deus_01_skin_magic = {
		description = "bw_deus_01_magic_description",
		rarity = "magic",
		right_hand_unit = "units/weapons/player/wpn_bw_deus_01/wpn_bw_deus_01_magic",
		hud_icon = "weapon_generic_icon_staff_3",
		inventory_icon = "icon_wpn_brw_magmastaff_t1",
		left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
		template = "bw_deus_01_template",
		slot_type = "weapon_skin",
		required_dlc = "grass",
		item_type = "weapon_skin",
		matching_item_key = "bw_deus_01",
		can_wield = {
			"bw_scholar",
			"bw_adept",
			"bw_unchained"
		}
	},
	bw_deus_02_skin_magic = {
		description = "bw_deus_01_magic_description",
		rarity = "magic",
		right_hand_unit = "units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_magic",
		left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
		inventory_icon = "icon_wpn_brw_magmastaff_t2",
		slot_type = "weapon_skin",
		hud_icon = "weapon_generic_icon_staff_3",
		required_dlc = "grass",
		template = "bw_deus_01_template",
		item_type = "weapon_skin",
		matching_item_key = "bw_deus_01",
		can_wield = {
			"bw_scholar",
			"bw_adept",
			"bw_unchained"
		},
		right_hand_unit_override = {
			bw_necromancer = "units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_magic_baelfire"
		}
	},
	bw_deus_01_magic = {
		slot_type = "ranged",
		display_name = "bw_deus_01_magic_name",
		left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
		hud_icon = "weapon_generic_icon_staff_5",
		item_type = "bw_deus_01",
		trait_table_name = "ranged_heat",
		description = "bw_deus_01_magic_description",
		rarity = "magic",
		right_hand_unit = "units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_magic",
		inventory_icon = "icon_wpn_brw_magmastaff_t2_magic",
		has_power_level = true,
		template = "bw_deus_01_template_1",
		property_table_name = "ranged",
		required_unlock_item = "bw_deus_01",
		required_dlc = "grass",
		can_wield = {
			"bw_scholar",
			"bw_adept",
			"bw_unchained"
		},
		right_hand_unit_override = {
			bw_necromancer = "units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_magic_baelfire"
		}
	},
	bw_deus_01_skin_03 = {
		description = "bw_deus_01_skin_03_description",
		rarity = "exotic",
		right_hand_unit = "units/weapons/player/wpn_bw_deus_03/wpn_bw_deus_03",
		hud_icon = "weapon_generic_icon_staff_5",
		inventory_icon = "icon_wpn_brw_magmastaff_t3",
		left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
		information_text = "information_weapon_skin",
		template = "bw_deus_01_template_1",
		display_name = "bw_deus_01_skin_03_name",
		slot_type = "weapon_skin",
		display_unit = "units/weapons/weapon_display/display_staff",
		item_type = "weapon_skin",
		required_dlc = "grass",
		matching_item_key = "bw_deus_01",
		can_wield = {
			"bw_scholar",
			"bw_adept",
			"bw_unchained"
		}
	},
	bw_deus_01_skin_03_runed = {
		description = "bw_deus_01_skin_03_runed_description",
		rarity = "unique",
		right_hand_unit = "units/weapons/player/wpn_bw_deus_03/wpn_bw_deus_03_runed",
		hud_icon = "weapon_generic_icon_staff_5",
		inventory_icon = "icon_wpn_brw_magmastaff_t3_runed",
		left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
		information_text = "information_weapon_skin",
		template = "bw_deus_01_template_1",
		display_name = "bw_deus_01_skin_03_runed_name",
		slot_type = "weapon_skin",
		display_unit = "units/weapons/weapon_display/display_staff",
		item_type = "weapon_skin",
		required_dlc = "grass",
		matching_item_key = "bw_deus_01",
		can_wield = {
			"bw_scholar",
			"bw_adept",
			"bw_unchained"
		}
	},
	wh_deus_01 = {
		description = "wh_deus_01_description",
		rarity = "plentiful",
		right_hand_unit = "units/weapons/player/wpn_wh_deus_01/wpn_wh_deus_01",
		hud_icon = "weapon_generic_icon_fencing_sword",
		inventory_icon = "icon_wpn_emp_duckfoot_t1",
		slot_type = "ranged",
		display_name = "wh_deus_01_name",
		left_hand_unit = "units/weapons/player/wpn_wh_deus_01/wpn_wh_deus_01",
		has_power_level = true,
		template = "wh_deus_01_template_1",
		property_table_name = "ranged",
		item_type = "wh_deus_01",
		skin_combination_table = "wh_deus_01_skins",
		trait_table_name = "ranged_ammo",
		required_dlc = "grass",
		can_wield = {
			"wh_bountyhunter",
			"wh_captain",
			"wh_zealot"
		}
	},
	wh_deus_01_skin = {
		description = "wh_deus_01_skin_01_description",
		rarity = "plentiful",
		display_name = "wh_deus_01_skin_01_name",
		base_skin_item = true,
		slot_type = "weapon_skin",
		information_text = "information_weapon_skin",
		item_type = "weapon_skin",
		matching_item_key = "wh_deus_01",
		can_wield = {
			"wh_bountyhunter",
			"wh_captain",
			"wh_zealot"
		}
	},
	wh_deus_01_skin_01 = {
		description = "wh_deus_01_skin_01_description",
		rarity = "plentiful",
		right_hand_unit = "units/weapons/player/wpn_wh_deus_01/wpn_wh_deus_01",
		hud_icon = "weapon_generic_icon_bow",
		inventory_icon = "icon_wpn_emp_duckfoot_t1",
		left_hand_unit = "units/weapons/player/wpn_wh_deus_01/wpn_wh_deus_01",
		template = "wh_deus_01_template_1",
		display_name = "wh_deus_01_skin_01_name",
		slot_type = "weapon_skin",
		required_dlc = "grass",
		item_type = "weapon_skin",
		matching_item_key = "wh_deus_01",
		can_wield = {
			"wh_bountyhunter",
			"wh_captain",
			"wh_zealot"
		}
	},
	wh_deus_01_skin_02 = {
		description = "wh_deus_01_skin_02_description",
		rarity = "exotic",
		right_hand_unit = "units/weapons/player/wpn_wh_deus_02/wpn_wh_deus_02",
		hud_icon = "weapon_generic_icon_bow",
		inventory_icon = "icon_wpn_emp_duckfoot_t2",
		left_hand_unit = "units/weapons/player/wpn_wh_deus_02/wpn_wh_deus_02",
		information_text = "information_weapon_skin",
		template = "wh_deus_01_template_1",
		display_name = "wh_deus_01_skin_02_name",
		slot_type = "weapon_skin",
		display_unit = "units/weapons/weapon_display/display_pistols",
		item_type = "weapon_skin",
		required_dlc = "grass",
		matching_item_key = "wh_deus_01",
		can_wield = {
			"wh_bountyhunter",
			"wh_captain",
			"wh_zealot"
		}
	},
	wh_deus_01_skin_01_runed = {
		description = "wh_deus_01_skin_01_runed_description",
		rarity = "unique",
		right_hand_unit = "units/weapons/player/wpn_wh_deus_01/wpn_wh_deus_01_runed",
		hud_icon = "weapon_generic_icon_bow",
		inventory_icon = "icon_wpn_emp_duckfoot_t1_runed",
		left_hand_unit = "units/weapons/player/wpn_wh_deus_01/wpn_wh_deus_01_runed",
		information_text = "information_weapon_skin",
		template = "wh_deus_01_template_1",
		display_name = "wh_deus_01_skin_01_runed_name",
		slot_type = "weapon_skin",
		display_unit = "units/weapons/weapon_display/display_pistols",
		item_type = "weapon_skin",
		required_dlc = "grass",
		matching_item_key = "wh_deus_01",
		can_wield = {
			"wh_bountyhunter",
			"wh_captain",
			"wh_zealot"
		}
	},
	wh_deus_01_skin_02_runed = {
		description = "wh_deus_01_skin_02_runed_description",
		rarity = "unique",
		right_hand_unit = "units/weapons/player/wpn_wh_deus_02/wpn_wh_deus_02_runed",
		hud_icon = "weapon_generic_icon_bow",
		inventory_icon = "icon_wpn_emp_duckfoot_t2_runed",
		left_hand_unit = "units/weapons/player/wpn_wh_deus_02/wpn_wh_deus_02_runed",
		information_text = "information_weapon_skin",
		template = "wh_deus_01_template_1",
		display_name = "wh_deus_01_skin_02_runed_name",
		slot_type = "weapon_skin",
		display_unit = "units/weapons/weapon_display/display_pistols",
		item_type = "weapon_skin",
		required_dlc = "grass",
		matching_item_key = "wh_deus_01",
		can_wield = {
			"wh_bountyhunter",
			"wh_captain",
			"wh_zealot"
		}
	},
	wh_deus_01_magic = {
		description = "wh_deus_01_magic_description",
		rarity = "magic",
		right_hand_unit = "units/weapons/player/wpn_wh_deus_02/wpn_wh_deus_02_magic",
		trait_table_name = "ranged_ammo",
		inventory_icon = "icon_wpn_emp_duckfoot_t2_magic",
		slot_type = "ranged",
		hud_icon = "weapon_generic_icon_bow",
		template = "wh_deus_01_template_1",
		display_name = "wh_deus_01_magic_name",
		has_power_level = true,
		property_table_name = "ranged",
		item_type = "wh_deus_01",
		left_hand_unit = "units/weapons/player/wpn_wh_deus_02/wpn_wh_deus_02_magic",
		required_unlock_item = "wh_deus_01",
		required_dlc = "grass",
		can_wield = {
			"wh_bountyhunter",
			"wh_captain",
			"wh_zealot"
		}
	},
	wh_deus_01_skin_03 = {
		description = "wh_deus_01_skin_03_description",
		rarity = "exotic",
		right_hand_unit = "units/weapons/player/wpn_wh_deus_03/wpn_wh_deus_03",
		hud_icon = "weapon_generic_icon_bow",
		inventory_icon = "icon_wpn_emp_duckfoot_t3",
		left_hand_unit = "units/weapons/player/wpn_wh_deus_03/wpn_wh_deus_03",
		information_text = "information_weapon_skin",
		template = "wh_deus_01_template_1",
		display_name = "wh_deus_01_skin_03_name",
		slot_type = "weapon_skin",
		display_unit = "units/weapons/weapon_display/display_pistols",
		item_type = "weapon_skin",
		required_dlc = "grass",
		matching_item_key = "wh_deus_01",
		can_wield = {
			"wh_bountyhunter",
			"wh_captain",
			"wh_zealot"
		}
	},
	wh_deus_01_skin_03_runed = {
		description = "wh_deus_01_skin_03_runed_description",
		rarity = "unique",
		right_hand_unit = "units/weapons/player/wpn_wh_deus_03/wpn_wh_deus_03_runed",
		hud_icon = "weapon_generic_icon_bow",
		inventory_icon = "icon_wpn_emp_duckfoot_t3_runed",
		left_hand_unit = "units/weapons/player/wpn_wh_deus_03/wpn_wh_deus_03_runed",
		information_text = "information_weapon_skin",
		template = "wh_deus_01_template_1",
		display_name = "wh_deus_01_skin_03_runed_name",
		slot_type = "weapon_skin",
		display_unit = "units/weapons/weapon_display/display_pistols",
		item_type = "weapon_skin",
		required_dlc = "grass",
		matching_item_key = "wh_deus_01",
		can_wield = {
			"wh_bountyhunter",
			"wh_captain",
			"wh_zealot"
		}
	},
	wh_deus_02_skin_magic = {
		description = "wh_deus_01_magic_desciption",
		rarity = "magic",
		right_hand_unit = "units/weapons/player/wpn_wh_deus_02/wpn_wh_deus_02_magic",
		hud_icon = "weapon_generic_icon_bow",
		inventory_icon = "icon_wpn_emp_duckfoot_t1",
		left_hand_unit = "units/weapons/player/wpn_wh_deus_02/wpn_wh_deus_02_magic",
		template = "wh_deus_01_template_1",
		slot_type = "weapon_skin",
		required_dlc = "grass",
		item_type = "weapon_skin",
		matching_item_key = "wh_deus_01",
		can_wield = {
			"wh_bountyhunter",
			"wh_captain",
			"wh_zealot"
		}
	},
	wh_deus_01_skin_magic = {
		description = "wh_deus_01_magic_desciption",
		rarity = "magic",
		right_hand_unit = "units/weapons/player/wpn_wh_deus_01/wpn_wh_deus_01_magic",
		hud_icon = "weapon_generic_icon_bow",
		inventory_icon = "icon_wpn_emp_duckfoot_t1",
		left_hand_unit = "units/weapons/player/wpn_wh_deus_01/wpn_wh_deus_01_magic",
		template = "wh_deus_01_template_1",
		slot_type = "weapon_skin",
		required_dlc = "grass",
		item_type = "weapon_skin",
		matching_item_key = "wh_deus_01",
		can_wield = {
			"wh_bountyhunter",
			"wh_captain",
			"wh_zealot"
		}
	},
	wpn_deus_relic_01 = {
		temporary_template = "deus_relic",
		right_hand_unit = "units/weapons/player/wpn_deus_relic_01/wpn_deus_relic_01",
		rarity = "plentiful",
		inventory_icon = "icons_placeholder",
		slot_type = "healthkit",
		gamepad_hud_icon = "options_button_icon_event",
		hud_icon = "options_button_icon_event",
		item_type = "inventory_item",
		can_wield = CanWieldAllItemTemplates
	},
	potion_liquid_bravado_01 = {
		description = "description_potion_liquid_bravado_01",
		temporary_template = "liquid_bravado_potion",
		slot_type = "potion",
		item_received_icon = "killfeed_icon_deuspotion",
		inventory_icon = "icons_placeholder",
		left_hand_unit = "units/weapons/player/wpn_deus_potion_01/wpn_deus_potion_01",
		description_type = "potion",
		gamepad_hud_icon = "hud_inventory_icon_deuspotion_LiquidBravado_02",
		hud_icon = "hud_inventory_icon_deuspotion_LiquidBravado",
		rarity = "plentiful",
		item_type = "potion",
		can_wield = CanWieldAllItemTemplates,
		description_values = {
			{
				value_type = "time",
				value = MorrisBuffTweakData.liquid_bravado_potion.duration
			}
		}
	},
	potion_vampiric_draught_01 = {
		description = "description_potion_vampiric_draught_01",
		temporary_template = "vampiric_draught_potion",
		slot_type = "potion",
		item_received_icon = "killfeed_icon_deuspotion",
		inventory_icon = "icons_placeholder",
		left_hand_unit = "units/weapons/player/wpn_deus_potion_01/wpn_deus_potion_01",
		description_type = "potion",
		gamepad_hud_icon = "hud_inventory_icon_deuspotion_VampiricDraught_02",
		hud_icon = "hud_inventory_icon_deuspotion_VampiricDraught",
		rarity = "plentiful",
		item_type = "potion",
		can_wield = CanWieldAllItemTemplates,
		description_values = {
			{
				value_type = "time",
				value = MorrisBuffTweakData.vampiric_draught_potion.duration
			}
		}
	},
	potion_moot_milk_01 = {
		description = "description_potion_moot_milk_01",
		temporary_template = "moot_milk_potion",
		slot_type = "potion",
		item_received_icon = "killfeed_icon_deuspotion",
		inventory_icon = "icons_placeholder",
		left_hand_unit = "units/weapons/player/wpn_deus_potion_01/wpn_deus_potion_01",
		description_type = "potion",
		gamepad_hud_icon = "hud_inventory_icon_deuspotion_MootMilk_02",
		hud_icon = "hud_inventory_icon_deuspotion_MootMilk",
		rarity = "plentiful",
		item_type = "potion",
		can_wield = CanWieldAllItemTemplates,
		description_values = {
			{
				value_type = "time",
				value = MorrisBuffTweakData.moot_milk_potion.duration
			}
		}
	},
	potion_friendly_murderer_01 = {
		description = "description_potion_friendly_murderer_01",
		temporary_template = "friendly_murderer_potion",
		slot_type = "potion",
		item_received_icon = "killfeed_icon_deuspotion",
		inventory_icon = "icons_placeholder",
		left_hand_unit = "units/weapons/player/wpn_deus_potion_01/wpn_deus_potion_01",
		description_type = "potion",
		gamepad_hud_icon = "hud_inventory_icon_deuspotion_FriendlyMurderer_02",
		hud_icon = "hud_inventory_icon_deuspotion_FriendlyMurderer",
		rarity = "plentiful",
		item_type = "potion",
		can_wield = CanWieldAllItemTemplates,
		description_values = {
			{
				value_type = "time",
				value = MorrisBuffTweakData.friendly_murderer_potion.duration
			}
		}
	},
	potion_killer_in_the_shadows_01 = {
		description = "description_potion_killer_in_the_shadows_01",
		temporary_template = "killer_in_the_shadows_potion",
		slot_type = "potion",
		item_received_icon = "killfeed_icon_deuspotion",
		inventory_icon = "icons_placeholder",
		left_hand_unit = "units/weapons/player/wpn_deus_potion_01/wpn_deus_potion_01",
		description_type = "potion",
		gamepad_hud_icon = "hud_inventory_icon_deuspotion_KillerInTheShadows_02",
		hud_icon = "hud_inventory_icon_deuspotion_KillerInTheShadows",
		rarity = "plentiful",
		item_type = "potion",
		can_wield = CanWieldAllItemTemplates,
		description_values = {
			{
				value_type = "time",
				value = MorrisBuffTweakData.killer_in_the_shadows_potion.duration
			}
		}
	},
	potion_pockets_full_of_bombs_01 = {
		description = "description_potion_pockets_full_of_bombs_01",
		temporary_template = "pockets_full_of_bombs_potion",
		slot_type = "potion",
		item_received_icon = "killfeed_icon_deuspotion",
		inventory_icon = "icons_placeholder",
		left_hand_unit = "units/weapons/player/wpn_deus_potion_01/wpn_deus_potion_01",
		description_type = "potion",
		gamepad_hud_icon = "hud_inventory_icon_deuspotion_PocketsFullOfBombs_02",
		hud_icon = "hud_inventory_icon_deuspotion_PocketsFullOfBombs",
		rarity = "plentiful",
		item_type = "potion",
		can_wield = CanWieldAllItemTemplates,
		description_values = {
			{
				value_type = "time",
				value = MorrisBuffTweakData.pockets_full_of_bombs_potion.duration
			}
		}
	},
	potion_hold_my_beer_01 = {
		description = "description_potion_hold_my_beer_01",
		temporary_template = "hold_my_beer_potion",
		slot_type = "potion",
		item_received_icon = "killfeed_icon_deuspotion",
		inventory_icon = "icons_placeholder",
		left_hand_unit = "units/weapons/player/wpn_deus_potion_01/wpn_deus_potion_01",
		description_type = "potion",
		gamepad_hud_icon = "hud_inventory_icon_deuspotion_HoldMyBeer_02",
		hud_icon = "hud_inventory_icon_deuspotion_HoldMyBeer",
		rarity = "plentiful",
		item_type = "potion",
		can_wield = CanWieldAllItemTemplates,
		description_values = {
			{
				value_type = "time",
				value = MorrisBuffTweakData.hold_my_beer_potion.duration
			}
		}
	},
	potion_poison_proof_01 = {
		description = "description_potion_poison_proof_01",
		temporary_template = "poison_proof_potion",
		slot_type = "potion",
		item_received_icon = "killfeed_icon_deuspotion",
		inventory_icon = "icons_placeholder",
		left_hand_unit = "units/weapons/player/wpn_deus_potion_01/wpn_deus_potion_01",
		description_type = "potion",
		gamepad_hud_icon = "hud_inventory_icon_deuspotion_PoisonProof_02",
		hud_icon = "hud_inventory_icon_deuspotion_PoisonProof",
		rarity = "plentiful",
		item_type = "potion",
		can_wield = CanWieldAllItemTemplates,
		description_values = {
			{
				value_type = "time",
				value = MorrisBuffTweakData.poison_proof_potion.duration
			}
		}
	},
	deus_rally_flag = {
		description = "description_deus_rally_flag_01",
		temporary_template = "deus_rally_flag",
		slot_type = "potion",
		item_received_icon = "killfeed_icon_jadecenser",
		inventory_icon = "hud_inventory_icon_jadecenser",
		left_hand_unit = "units/weapons/player/wpn_deus_folded_rally_flag_01/wpn_deus_folded_rally_flag_01",
		description_type = "potion",
		rarity = "plentiful",
		gamepad_hud_icon = "hud_inventory_icon_jadecenser_02",
		hud_icon = "hud_inventory_icon_jadecenser",
		item_type = "potion",
		can_wield = CanWieldAllItemTemplates
	},
	holy_hand_grenade = {
		description = "description_deus_holy_hand_grenade",
		temporary_template = "holy_hand_grenade",
		right_hand_unit = "units/weapons/player/wpn_emp_holy_hand_grenade_01_t1/wpn_emp_holy_hand_grenade_01_t1",
		inventory_icon = "hud_inventory_icon_holybomb",
		left_hand_unit = "units/weapons/player/wpn_emp_holy_hand_grenade_01_t1/wpn_emp_holy_hand_grenade_lighter_01_t1",
		item_received_icon = "killfeed_icon_holybomb",
		slot_type = "grenade",
		description_type = "grenade",
		gamepad_hud_icon = "hud_inventory_icon_holybomb_02",
		hud_icon = "hud_inventory_icon_holybomb",
		rarity = "plentiful",
		item_type = "grenade",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_khorne = {
		description = "frame_deus_portrait_khorne_description",
		temporary_template = "frame_deus_portrait_khorne",
		display_name = "frame_deus_portrait_khorne_name",
		hud_icon = "deus_portrait_khorne",
		inventory_icon = "deus_icon_portrait_khorne",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_lileath_1 = {
		description = "frame_deus_portrait_lileath_1_description",
		temporary_template = "frame_deus_portrait_lileath_1",
		display_name = "frame_deus_portrait_lileath_1_name",
		hud_icon = "deus_portrait_lileath_1",
		inventory_icon = "deus_icon_portrait_lileath_1",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_lileath_2 = {
		description = "frame_deus_portrait_lileath_2_description",
		temporary_template = "frame_deus_portrait_lileath_2",
		display_name = "frame_deus_portrait_lileath_2_name",
		hud_icon = "deus_portrait_lileath_2",
		inventory_icon = "deus_icon_portrait_lileath_2",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_lileath_3 = {
		description = "frame_deus_portrait_lileath_3_description",
		temporary_template = "frame_deus_portrait_lileath_3",
		display_name = "frame_deus_portrait_lileath_3_name",
		hud_icon = "deus_portrait_lileath_3",
		inventory_icon = "deus_icon_portrait_lileath_3",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_myrmidia_1 = {
		description = "frame_deus_portrait_myrmidia_1_description",
		temporary_template = "frame_deus_portrait_myrmidia_1",
		display_name = "frame_deus_portrait_myrmidia_1_name",
		hud_icon = "deus_portrait_myrmidia_1",
		inventory_icon = "deus_icon_portrait_myrmidia_1",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_myrmidia_2 = {
		description = "frame_deus_portrait_myrmidia_2_description",
		temporary_template = "frame_deus_portrait_myrmidia_2",
		display_name = "frame_deus_portrait_myrmidia_2_name",
		hud_icon = "deus_portrait_myrmidia_2",
		inventory_icon = "deus_icon_portrait_myrmidia_2",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_myrmidia_3 = {
		description = "frame_deus_portrait_myrmidia_3_description",
		temporary_template = "frame_deus_portrait_myrmidia_3",
		display_name = "frame_deus_portrait_myrmidia_3_name",
		hud_icon = "deus_portrait_myrmidia_3",
		inventory_icon = "deus_icon_portrait_myrmidia_3",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_nurgle = {
		description = "frame_deus_portrait_nurgle_description",
		temporary_template = "frame_deus_portrait_nurgle",
		display_name = "frame_deus_portrait_nurgle_name",
		hud_icon = "deus_portrait_nurgle",
		inventory_icon = "deus_icon_portrait_nurgle",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_sigmar_1 = {
		description = "frame_deus_portrait_sigmar_1_description",
		temporary_template = "frame_deus_portrait_sigmar_1",
		display_name = "frame_deus_portrait_sigmar_1_name",
		hud_icon = "deus_portrait_sigmar_1",
		inventory_icon = "deus_icon_portrait_sigmar_1",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_sigmar_2 = {
		description = "frame_deus_portrait_sigmar_2_description",
		temporary_template = "frame_deus_portrait_sigmar_2",
		display_name = "frame_deus_portrait_sigmar_2_name",
		hud_icon = "deus_portrait_sigmar_2",
		inventory_icon = "deus_icon_portrait_sigmar_2",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_sigmar_3 = {
		description = "frame_deus_portrait_sigmar_3_description",
		temporary_template = "frame_deus_portrait_sigmar_3",
		display_name = "frame_deus_portrait_sigmar_3_name",
		hud_icon = "deus_portrait_sigmar_3",
		inventory_icon = "deus_icon_portrait_sigmar_3",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_slaanesh = {
		description = "frame_deus_portrait_slaanesh_description",
		temporary_template = "frame_deus_portrait_slaanesh",
		display_name = "frame_deus_portrait_slaanesh_name",
		hud_icon = "deus_portrait_slaanesh",
		inventory_icon = "deus_icon_portrait_slaanesh",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_taal_1 = {
		description = "frame_deus_portrait_taal_1_description",
		temporary_template = "frame_deus_portrait_taal_1",
		display_name = "frame_deus_portrait_taal_1_name",
		hud_icon = "deus_portrait_taal_1",
		inventory_icon = "deus_icon_portrait_taal_1",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_taal_2 = {
		description = "frame_deus_portrait_taal_2_description",
		temporary_template = "frame_deus_portrait_taal_2",
		display_name = "frame_deus_portrait_taal_2_name",
		hud_icon = "deus_portrait_taal_2",
		inventory_icon = "deus_icon_portrait_taal_2",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_taal_3 = {
		description = "frame_deus_portrait_taal_3_description",
		temporary_template = "frame_deus_portrait_taal_3",
		display_name = "frame_deus_portrait_taal_3_name",
		hud_icon = "deus_portrait_taal_3",
		inventory_icon = "deus_icon_portrait_taal_3",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_tzeentch = {
		description = "frame_deus_portrait_tzeentch_description",
		temporary_template = "frame_deus_portrait_tzeentch",
		display_name = "frame_deus_portrait_tzeentch_name",
		hud_icon = "deus_portrait_tzeentch",
		inventory_icon = "deus_icon_portrait_tzeentch",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_valaya_1 = {
		description = "frame_deus_portrait_valaya_1_description",
		temporary_template = "frame_deus_portrait_valaya_1",
		display_name = "frame_deus_portrait_valaya_1_name",
		hud_icon = "deus_portrait_valaya_1",
		inventory_icon = "deus_icon_portrait_valaya_1",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_valaya_2 = {
		description = "frame_deus_portrait_valaya_2_description",
		temporary_template = "frame_deus_portrait_valaya_2",
		display_name = "frame_deus_portrait_valaya_2_name",
		hud_icon = "deus_portrait_valaya_2",
		inventory_icon = "deus_icon_portrait_valaya_2",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_valaya_3 = {
		description = "frame_deus_portrait_valaya_3_description",
		temporary_template = "frame_deus_portrait_valaya_3",
		display_name = "frame_deus_portrait_valaya_3_name",
		hud_icon = "deus_portrait_valaya_3",
		inventory_icon = "deus_icon_portrait_valaya_3",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_citadel = {
		description = "frame_deus_portrait_citadel_description",
		temporary_template = "frame_deus_portrait_citadel",
		display_name = "frame_deus_portrait_citadel_name",
		hud_icon = "deus_portrait_citadel",
		inventory_icon = "deus_icon_portrait_citadel",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_chaos_gods = {
		description = "frame_deus_portrait_chaos_gods_description",
		temporary_template = "frame_deus_portrait_chaos_gods",
		display_name = "frame_deus_portrait_chaos_gods_name",
		hud_icon = "deus_portrait_dlc",
		inventory_icon = "deus_icon_portrait_dlc",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		required_dlc = "grass",
		can_wield = CanWieldAllItemTemplates
	},
	shilling_bag_grass = {
		description = "shilling_bag_100_description",
		rarity = "common",
		display_name = "shilling_bag_100_name",
		inventory_icon = "icon_shillings_06",
		slot_type = "chips",
		information_text = "information_text_shilling",
		item_type = "chips",
		can_wield = CanWieldAllItemTemplates,
		bundle = {
			BundledVirtualCurrencies = {
				SM = 150
			}
		}
	}
}

table.merge(ItemMasterList, item_master_list)

if DLCSettings.cog then
	UpdateItemMasterList({
		"dr_deus_01",
		"dr_deus_01_magic"
	}, "dr_engineer")
end
