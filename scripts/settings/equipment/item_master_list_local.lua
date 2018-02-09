ItemMasterList = ItemMasterList or {}
ItemMasterList.dwarf_explosive_barrel = {
	slot_type = "healthkit",
	temporary_template = "dwarf_explosive_barrel",
	inventory_icon = "menu_inventory_screen_icons_default",
	item_type = "explosive_inventory_item",
	left_hand_unit = "units/weapons/player/wpn_dwarf_barrel_01/wpn_dwarf_barrel_01",
	hud_icon = "consumables_icon_defence",
	can_wield = {
		"bright_wizard",
		"dwarf_ranger",
		"empire_soldier",
		"witch_hunter",
		"wood_elf"
	}
}
ItemMasterList.lamp_oil = {
	slot_type = "healthkit",
	temporary_template = "lamp_oil",
	inventory_icon = "menu_inventory_screen_icons_default",
	item_type = "inventory_item",
	left_hand_unit = "units/weapons/player/wpn_oil_jug_01/wpn_oil_jug_01",
	hud_icon = "consumables_icon_defence",
	can_wield = {
		"bright_wizard",
		"dwarf_ranger",
		"empire_soldier",
		"witch_hunter",
		"wood_elf"
	}
}
ItemMasterList.drachenfels_statue = {
	slot_type = "healthkit",
	temporary_template = "drachenfels_statue",
	inventory_icon = "menu_inventory_screen_icons_default",
	item_type = "inventory_item",
	left_hand_unit = "units/weapons/player/pup_drachenfels_statue/wpn_drachenfels_statue",
	hud_icon = "consumables_icon_defence",
	can_wield = {
		"bright_wizard",
		"dwarf_ranger",
		"empire_soldier",
		"witch_hunter",
		"wood_elf"
	}
}
ItemMasterList.wpn_cannon_ball_01 = {
	slot_type = "healthkit",
	temporary_template = "cannon_ball",
	inventory_icon = "menu_inventory_screen_icons_default",
	item_type = "inventory_item",
	left_hand_unit = "units/weapons/player/wpn_cannon_ball_01/wpn_cannon_ball_01",
	hud_icon = "consumables_icon_defence",
	can_wield = {
		"bright_wizard",
		"dwarf_ranger",
		"empire_soldier",
		"witch_hunter",
		"wood_elf"
	}
}
ItemMasterList.healthkit_first_aid_kit_01 = {
	description = "description_healthkit_first_aid_kit_01",
	rarity = "common",
	temporary_template = "first_aid_kit_02",
	slot_type = "healthkit",
	inventory_icon = "menu_inventory_screen_icons_default",
	left_hand_unit = "units/weapons/player/wpn_first_aid_kit_02/wpn_first_aid_kit_02",
	description_type = "healthkit",
	hud_icon = "hud_inventory_icon_heal_01",
	item_type = "healthkit",
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
ItemMasterList.wpn_grimoire_01 = {
	description = "description_wpn_grimoire_01",
	temporary_template = "wpn_grimoire_01",
	left_hand_unit = "units/weapons/player/wpn_grimoire_01/wpn_grimoire_01",
	inventory_icon = "menu_inventory_screen_icons_default",
	slot_type = "potion",
	description_type = "potion",
	hud_icon = "hud_inventory_icon_grimoire",
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
}
ItemMasterList.wpn_side_objective_tome_01 = {
	description = "description_wpn_side_objective_tome_01",
	temporary_template = "wpn_side_objective_tome_01",
	left_hand_unit = "units/weapons/player/wpn_side_objective_tome/wpn_side_objective_tome_01",
	inventory_icon = "menu_inventory_screen_icons_default",
	slot_type = "healthkit",
	description_type = "healthkit",
	hud_icon = "hud_inventory_icon_tome",
	item_type = "healthkit",
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
ItemMasterList.potion_healing_draught_01 = {
	description = "description_potion_healing_draught_01",
	rarity = "common",
	temporary_template = "healing_draught",
	slot_type = "healthkit",
	inventory_icon = "menu_inventory_screen_icons_default",
	left_hand_unit = "units/weapons/player/wpn_potion_01/wpn_potion_healing_01",
	description_type = "healthkit",
	hud_icon = "hud_inventory_icon_heal_02",
	item_type = "healthkit",
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
ItemMasterList.grenade_frag_01 = {
	description = "description_grenade_frag_01",
	temporary_template = "frag_grenade_t1",
	right_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_01_t1",
	inventory_icon = "menu_inventory_screen_icons_default",
	left_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_lighter_01_t1",
	rarity = "common",
	slot_type = "grenade",
	description_type = "grenade",
	hud_icon = "hud_inventory_icon_bomb",
	item_type = "grenade",
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
ItemMasterList.grenade_frag_02 = {
	description = "description_grenade_frag_02",
	temporary_template = "frag_grenade_t2",
	right_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t2/wpn_emp_grenade_01_t2",
	inventory_icon = "menu_inventory_screen_icons_default",
	left_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t2/wpn_emp_grenade_lighter_01_t2",
	rarity = "common",
	slot_type = "grenade",
	description_type = "grenade",
	hud_icon = "hud_inventory_icon_bomb",
	item_type = "grenade",
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
ItemMasterList.grenade_smoke_01 = {
	description = "description_grenade_smoke_01",
	temporary_template = "smoke_grenade_t1",
	right_hand_unit = "units/weapons/player/wpn_emp_grenade_02_t1/wpn_emp_grenade_02_t1",
	inventory_icon = "menu_inventory_screen_icons_default",
	left_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_lighter_01_t1",
	rarity = "common",
	slot_type = "grenade",
	description_type = "grenade",
	hud_icon = "hud_inventory_icon_bomb",
	item_type = "grenade",
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
ItemMasterList.grenade_smoke_02 = {
	description = "description_grenade_smoke_02",
	temporary_template = "smoke_grenade_t2",
	right_hand_unit = "units/weapons/player/wpn_emp_grenade_02_t2/wpn_emp_grenade_02_t2",
	inventory_icon = "menu_inventory_screen_icons_default",
	left_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t2/wpn_emp_grenade_lighter_01_t2",
	rarity = "common",
	slot_type = "grenade",
	description_type = "grenade",
	hud_icon = "hud_inventory_icon_bomb",
	item_type = "grenade",
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
ItemMasterList.grenade_fire_01 = {
	description = "description_grenade_fire_01",
	temporary_template = "fire_grenade_t1",
	right_hand_unit = "units/weapons/player/wpn_emp_grenade_03_t1/wpn_emp_grenade_03_t1",
	inventory_icon = "menu_inventory_screen_icons_default",
	left_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_lighter_01_t1",
	rarity = "common",
	slot_type = "grenade",
	description_type = "grenade",
	hud_icon = "hud_inventory_icon_bomb_2",
	item_type = "grenade",
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
ItemMasterList.grenade_fire_02 = {
	description = "description_grenade_fire_02",
	temporary_template = "fire_grenade_t2",
	right_hand_unit = "units/weapons/player/wpn_emp_grenade_03_t2/wpn_emp_grenade_03_t2",
	inventory_icon = "menu_inventory_screen_icons_default",
	left_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t2/wpn_emp_grenade_lighter_01_t2",
	rarity = "common",
	slot_type = "grenade",
	description_type = "grenade",
	hud_icon = "hud_inventory_icon_bomb_2",
	item_type = "grenade",
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
ItemMasterList.grain_sack = {
	slot_type = "healthkit",
	temporary_template = "sack",
	inventory_icon = "menu_inventory_screen_icons_default",
	item_type = "inventory_item",
	left_hand_unit = "units/weapons/player/wpn_sacks/wpn_sacks_01",
	hud_icon = "consumables_icon_defence",
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
ItemMasterList.door_stick = {
	temporary_template = "door_stick",
	right_hand_unit = "units/gameplay/timed_door_base_02/wpn_timed_door_stick",
	inventory_icon = "menu_inventory_screen_icons_default",
	item_type = "inventory_item",
	slot_type = "healthkit",
	hud_icon = "consumables_icon_defence",
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
ItemMasterList.explosive_barrel = {
	slot_type = "healthkit",
	temporary_template = "explosive_barrel",
	inventory_icon = "menu_inventory_screen_icons_default",
	item_type = "explosive_inventory_item",
	left_hand_unit = "units/weapons/player/wpn_explosive_barrel/wpn_explosive_barrel_01",
	hud_icon = "consumables_icon_defence",
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
ItemMasterList.explosive_barrel_objective = {
	slot_type = "healthkit",
	temporary_template = "explosive_barrel_objective",
	inventory_icon = "menu_inventory_screen_icons_default",
	item_type = "explosive_inventory_item",
	left_hand_unit = "units/weapons/player/wpn_explosive_barrel/wpn_gun_powder_barrel_01",
	hud_icon = "consumables_icon_defence",
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
ItemMasterList.beer_barrel = {
	left_hand_unit = "units/weapons/player/wpn_explosive_barrel/wpn_explosive_barrel_01",
	inventory_icon = "menu_inventory_screen_icons_default",
	hud_icon = "consumables_icon_defence",
	item_type = "inventory_item",
	slot_type = "healthkit",
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
ItemMasterList.torch = {
	temporary_template = "torch",
	right_hand_unit = "units/weapons/player/wpn_torch/wpn_torch",
	inventory_icon = "menu_inventory_screen_icons_default",
	item_type = "inventory_item",
	slot_type = "healthkit",
	hud_icon = "consumables_icon_defence",
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
ItemMasterList.packmaster_claw = {
	temporary_template = "packmaster_claw",
	right_hand_unit = "units/weapons/player/wpn_packmaster_claw/wpn_packmaster_claw",
	item_type = "inventory_item",
	slot_type = "slot_packmaster_claw",
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
ItemMasterList.potion_damage_boost_01 = {
	description = "description_potion_damage_boost_01",
	rarity = "common",
	temporary_template = "damage_boost_potion",
	slot_type = "potion",
	inventory_icon = "menu_inventory_screen_icons_default",
	left_hand_unit = "units/weapons/player/wpn_potion_01/wpn_potion_strenght_01",
	description_type = "potion",
	hud_icon = "hud_inventory_icon_potion_2",
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
}
ItemMasterList.potion_speed_boost_01 = {
	description = "description_potion_speed_boost_01",
	temporary_template = "speed_boost_potion",
	left_hand_unit = "units/weapons/player/wpn_potion_01/wpn_potion_speed_01",
	inventory_icon = "menu_inventory_screen_icons_default",
	slot_type = "potion",
	description_type = "potion",
	hud_icon = "hud_inventory_icon_potion",
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
}
ItemMasterList.potion_cooldown_reduction_01 = {
	description = "description_potion_cooldown_reduction_01",
	temporary_template = "cooldown_reduction_potion",
	left_hand_unit = "units/weapons/player/wpn_potion_01/wpn_potion_extra_01",
	inventory_icon = "menu_inventory_screen_icons_default",
	slot_type = "potion",
	description_type = "potion",
	hud_icon = "hud_inventory_icon_potion",
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
}
ItemMasterList.bardin_ranger_career_skill_weapon = {
	template = "bardin_ranger_career_skill_weapon",
	right_hand_unit = "units/weapons/player/wpn_emp_grenade_02_t2/wpn_emp_grenade_02_t2",
	can_wield = {}
}
ItemMasterList.kerillian_waywatcher_career_skill_weapon = {
	slot_to_use = "ranged",
	template = "kerillian_waywatcher_career_skill_weapon",
	left_hand_unit = "units/weapons/player/wpn_we_bow_01_t1/wpn_we_bow_01_t1",
	use_slot_unit = true,
	can_wield = {}
}
ItemMasterList.sienna_scholar_career_skill_weapon = {
	slot_to_use = "ranged",
	right_hand_unit = "units/weapons/player/wpn_brw_staff_05/wpn_brw_staff_05",
	template = "sienna_scholar_career_skill_weapon",
	left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
	use_slot_unit = true,
	can_wield = {}
}
ItemMasterList.victor_bountyhunter_career_skill_weapon = {
	template = "victor_bountyhunter_career_skill_weapon",
	left_hand_unit = "units/weapons/player/wpn_emp_shotgun/wpn_emp_shotgun",
	can_wield = {}
}
ItemMasterList.markus_huntsman_career_skill_weapon = {
	template = "markus_huntsman_career_skill_weapon",
	right_hand_unit = "units/weapons/player/wpn_emp_grenade_02_t2/wpn_emp_grenade_02_t2",
	can_wield = {}
}
ItemMasterList.sienna_adept_career_skill_weapon = {
	right_hand_unit = "units/weapons/player/wpn_emp_grenade_02_t1/wpn_emp_grenade_02_t1",
	left_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_lighter_01_t1",
	template = "sienna_adept_career_skill_weapon",
	can_wield = {}
}
ItemMasterList.training_dummy = {
	slot_type = "healthkit",
	temporary_template = "training_dummy",
	inventory_icon = "menu_inventory_screen_icons_default",
	item_type = "inventory_item",
	left_hand_unit = "units/gameplay/training_dummy/wpn_training_dummy",
	hud_icon = "consumables_icon_defence",
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
ItemMasterList.training_dummy_armored = {
	slot_type = "healthkit",
	temporary_template = "training_dummy_armored",
	inventory_icon = "menu_inventory_screen_icons_default",
	item_type = "inventory_item",
	left_hand_unit = "units/gameplay/training_dummy/wpn_training_dummy_armored",
	hud_icon = "consumables_icon_defence",
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

return 
