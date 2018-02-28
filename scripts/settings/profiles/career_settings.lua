require("scripts/unit_extensions/default_player_unit/careers/career_ability_settings")

CareerActionNames = {
	bright_wizard = {
		"action_career_bw_1"
	},
	dwarf_ranger = {
		"action_career_dr_3"
	},
	empire_soldier = {},
	witch_hunter = {
		"action_career_wh_2"
	},
	wood_elf = {
		"action_career_we_3"
	}
}
CareerSettings = {
	dr_ironbreaker = {
		profile_name = "dwarf_ranger",
		display_name = "dr_ironbreaker",
		name = "dr_ironbreaker",
		character_selection_image = "career_dwarf_ironbreaker",
		preview_animation = "career_select_01",
		icon = "icons_placeholder",
		talent_tree_index = 1,
		description = "bardin_1_desc",
		base_skin = "skin_dr_ironbreaker",
		preview_wield_slot = "melee",
		playfab_name = "dr_1",
		portrait_image = "unit_frame_portrait_bardin_ironbreaker",
		sound_character = "dwarf_ironbreaker",
		sort_order = 2,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.dr_1,
		passive_ability = PassiveAbilitySettings.dr_1,
		attributes = {
			movement_speed = 10,
			base_critical_strike_chance = 0.05,
			max_hp = 150,
			max_hp_kd = 300,
			attack_speed_speed = 10
		},
		video = {
			material_name = "bardin_ironbreaker_video",
			resource = "video/career_videos/bardin_ironbreaker_video"
		},
		preview_items = {
			"dr_shield_hammer",
			"ironbreaker_hat_0000"
		},
		is_unlocked_function = function (hero_name, hero_level)
			if Development.parameter("unlock_all_careers") then
				return true
			end

			return ProgressionUnlocks.is_unlocked_for_profile("dr_ironbreaker", hero_name, hero_level)
		end,
		unlocked_at_level_function = function (hero_name)
			if Development.parameter("unlock_all_careers") then
				return 1
			end

			local template = ProgressionUnlocks.get_profile_unlock("dr_ironbreaker", hero_name)

			return template.level_requirement
		end,
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	dr_slayer = {
		profile_name = "dwarf_ranger",
		display_name = "dr_slayer",
		name = "dr_slayer",
		character_selection_image = "career_dwarf_slayer",
		preview_animation = "career_select_02",
		icon = "icons_placeholder",
		talent_tree_index = 2,
		description = "bardin_2_desc",
		base_skin = "skin_dr_slayer",
		preview_wield_slot = "melee",
		playfab_name = "dr_2",
		portrait_image = "unit_frame_portrait_bardin_slayer",
		sound_character = "dwarf_slayer",
		sort_order = 3,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.dr_2,
		passive_ability = PassiveAbilitySettings.dr_2,
		attributes = {
			max_hp = 100,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05,
			movement_speed = 9
		},
		video = {
			material_name = "bardin_slayer_video",
			resource = "video/career_videos/bardin_slayer_video"
		},
		preview_items = {
			"dr_dual_wield_axes",
			"slayer_hat_0000"
		},
		is_unlocked_function = function (hero_name, hero_level)
			if Development.parameter("unlock_all_careers") then
				return true
			end

			return ProgressionUnlocks.is_unlocked_for_profile("dr_slayer", hero_name, hero_level)
		end,
		unlocked_at_level_function = function (hero_name)
			if Development.parameter("unlock_all_careers") then
				return 1
			end

			local template = ProgressionUnlocks.get_profile_unlock("dr_slayer", hero_name)

			return template.level_requirement
		end,
		loadout_equipment_slots = {
			"melee",
			"melee",
			"necklace",
			"ring",
			"trinket"
		}
	},
	dr_ranger = {
		profile_name = "dwarf_ranger",
		display_name = "dr_ranger",
		name = "dr_ranger",
		character_selection_image = "career_dwarf_ranger",
		preview_animation = "career_select_03",
		icon = "icons_placeholder",
		talent_tree_index = 3,
		description = "bardin_3_desc",
		base_skin = "skin_dr_ranger",
		preview_wield_slot = "ranged",
		playfab_name = "dr_3",
		portrait_image = "unit_frame_portrait_bardin_ranger",
		sound_character = "dwarf_ranger",
		sort_order = 1,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.dr_3,
		passive_ability = PassiveAbilitySettings.dr_3,
		attributes = {
			max_hp = 100,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05,
			movement_speed = 8
		},
		video = {
			material_name = "out",
			resource = "video/career_videos/out"
		},
		preview_items = {
			"dr_crossbow",
			"ranger_hat_0000"
		},
		is_unlocked_function = function (hero_name, hero_level)
			if Development.parameter("unlock_all_careers") then
				return true
			end

			return ProgressionUnlocks.is_unlocked_for_profile("dr_ranger", hero_name, hero_level)
		end,
		unlocked_at_level_function = function (hero_name)
			if Development.parameter("unlock_all_careers") then
				return 1
			end

			local template = ProgressionUnlocks.get_profile_unlock("dr_ranger", hero_name)

			return template.level_requirement
		end,
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	es_huntsman = {
		profile_name = "empire_soldier",
		display_name = "es_huntsman",
		name = "es_huntsman",
		character_selection_image = "career_emperor_poacher",
		preview_animation = "career_select_03",
		icon = "icons_placeholder",
		talent_tree_index = 1,
		description = "markus_1_desc",
		base_skin = "skin_es_huntsman",
		preview_wield_slot = "ranged",
		playfab_name = "es_1",
		portrait_image = "unit_frame_portrait_kruber_huntsman",
		sound_character = "emperor_poacher",
		sort_order = 2,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.es_1,
		passive_ability = PassiveAbilitySettings.es_1,
		attributes = {
			max_hp = 100,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "out",
			resource = "video/career_videos/out"
		},
		preview_items = {
			"es_handgun",
			"huntsman_hat_0000"
		},
		is_unlocked_function = function (hero_name, hero_level)
			if Development.parameter("unlock_all_careers") then
				return true
			end

			return ProgressionUnlocks.is_unlocked_for_profile("es_huntsman", hero_name, hero_level)
		end,
		unlocked_at_level_function = function (hero_name)
			if Development.parameter("unlock_all_careers") then
				return 1
			end

			local template = ProgressionUnlocks.get_profile_unlock("es_huntsman", hero_name)

			return template.level_requirement
		end,
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	es_knight = {
		profile_name = "empire_soldier",
		display_name = "es_knight",
		name = "es_knight",
		character_selection_image = "career_emperor_full_plate",
		preview_animation = "career_select_02",
		icon = "icons_placeholder",
		talent_tree_index = 2,
		description = "markus_2_desc",
		base_skin = "skin_es_knight",
		preview_wield_slot = "melee",
		playfab_name = "es_2",
		portrait_image = "unit_frame_portrait_kruber_knight",
		sound_character = "emperor_full_plate",
		sort_order = 3,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.es_2,
		passive_ability = PassiveAbilitySettings.es_2,
		attributes = {
			max_hp = 150,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "es_knight",
			resource = "video/career_videos/es_knight"
		},
		preview_items = {
			"es_sword_shield",
			"knight_hat_0000"
		},
		is_unlocked_function = function (hero_name, hero_level)
			if Development.parameter("unlock_all_careers") then
				return true
			end

			return ProgressionUnlocks.is_unlocked_for_profile("es_knight", hero_name, hero_level)
		end,
		unlocked_at_level_function = function (hero_name)
			if Development.parameter("unlock_all_careers") then
				return 1
			end

			local template = ProgressionUnlocks.get_profile_unlock("es_knight", hero_name)

			return template.level_requirement
		end,
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	es_mercenary = {
		profile_name = "empire_soldier",
		display_name = "es_mercenary",
		name = "es_mercenary",
		character_selection_image = "career_emperor_normal",
		preview_animation = "career_select_01",
		icon = "icons_placeholder",
		talent_tree_index = 3,
		description = "markus_3_desc",
		base_skin = "skin_es_mercenary",
		preview_wield_slot = "melee",
		playfab_name = "es_3",
		portrait_image = "unit_frame_portrait_kruber_mercenary",
		sound_character = "emperor_normal",
		sort_order = 1,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.es_3,
		passive_ability = PassiveAbilitySettings.es_3,
		attributes = {
			max_hp = 125,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "out",
			resource = "video/career_videos/out"
		},
		preview_items = {
			"es_halberd",
			"mercenary_hat_0000"
		},
		is_unlocked_function = function (hero_name, hero_level)
			if Development.parameter("unlock_all_careers") then
				return true
			end

			return ProgressionUnlocks.is_unlocked_for_profile("es_mercenary", hero_name, hero_level)
		end,
		unlocked_at_level_function = function (hero_name)
			if Development.parameter("unlock_all_careers") then
				return 1
			end

			local template = ProgressionUnlocks.get_profile_unlock("es_mercenary", hero_name)

			return template.level_requirement
		end,
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	we_shade = {
		profile_name = "wood_elf",
		display_name = "we_shade",
		name = "we_shade",
		character_selection_image = "career_wood_elf_shade",
		preview_animation = "career_select_01",
		icon = "icons_placeholder",
		talent_tree_index = 1,
		description = "kerillian_1_desc",
		base_skin = "skin_ww_shade",
		preview_wield_slot = "melee",
		playfab_name = "we_1",
		portrait_image = "unit_frame_portrait_kerillian_shade",
		sound_character = "wood_elf_shade",
		sort_order = 3,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.we_1,
		passive_ability = PassiveAbilitySettings.we_1,
		attributes = {
			max_hp = 100,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.1
		},
		video = {
			material_name = "ww_shade",
			resource = "video/career_videos/ww_shade"
		},
		preview_items = {
			"we_dual_wield_sword_dagger",
			"shade_hat_0000"
		},
		is_unlocked_function = function (hero_name, hero_level)
			if Development.parameter("unlock_all_careers") then
				return true
			end

			return ProgressionUnlocks.is_unlocked_for_profile("we_shade", hero_name, hero_level)
		end,
		unlocked_at_level_function = function (hero_name)
			if Development.parameter("unlock_all_careers") then
				return 1
			end

			local template = ProgressionUnlocks.get_profile_unlock("we_shade", hero_name)

			return template.level_requirement
		end,
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	we_maidenguard = {
		profile_name = "wood_elf",
		display_name = "we_maidenguard",
		name = "we_maidenguard",
		character_selection_image = "career_wood_elf_maiden",
		preview_animation = "career_select_03",
		icon = "icons_placeholder",
		talent_tree_index = 2,
		description = "kerillian_2_desc",
		base_skin = "skin_ww_maidenguard",
		preview_wield_slot = "melee",
		playfab_name = "we_2",
		portrait_image = "unit_frame_portrait_kerillian_maidenguard",
		sound_character = "wood_elf_maiden",
		sort_order = 2,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.we_2,
		passive_ability = PassiveAbilitySettings.we_2,
		attributes = {
			max_hp = 125,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "out",
			resource = "video/career_videos/out"
		},
		preview_items = {
			"we_spear",
			"maidenguard_hat_0000"
		},
		is_unlocked_function = function (hero_name, hero_level)
			if Development.parameter("unlock_all_careers") then
				return true
			end

			return ProgressionUnlocks.is_unlocked_for_profile("we_maidenguard", hero_name, hero_level)
		end,
		unlocked_at_level_function = function (hero_name)
			if Development.parameter("unlock_all_careers") then
				return 1
			end

			local template = ProgressionUnlocks.get_profile_unlock("we_maidenguard", hero_name)

			return template.level_requirement
		end,
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	we_waywatcher = {
		profile_name = "wood_elf",
		display_name = "we_waywatcher",
		name = "we_waywatcher",
		character_selection_image = "career_wood_elf_waywatcher",
		preview_animation = "career_select_02",
		icon = "icons_placeholder",
		talent_tree_index = 3,
		description = "kerillian_3_desc",
		base_skin = "skin_ww_waywatcher",
		preview_wield_slot = "ranged",
		playfab_name = "we_3",
		portrait_image = "unit_frame_portrait_kerillian_waywatcher",
		sound_character = "wood_elf_waywatcher",
		sort_order = 1,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.we_3,
		passive_ability = PassiveAbilitySettings.we_3,
		attributes = {
			max_hp = 100,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "out",
			resource = "video/career_videos/out"
		},
		preview_items = {
			"we_longbow",
			"waywatcher_hat_0000"
		},
		is_unlocked_function = function (hero_name, hero_level)
			if Development.parameter("unlock_all_careers") then
				return true
			end

			return ProgressionUnlocks.is_unlocked_for_profile("we_waywatcher", hero_name, hero_level)
		end,
		unlocked_at_level_function = function (hero_name)
			if Development.parameter("unlock_all_careers") then
				return 1
			end

			local template = ProgressionUnlocks.get_profile_unlock("we_waywatcher", hero_name)

			return template.level_requirement
		end,
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	wh_zealot = {
		profile_name = "witch_hunter",
		display_name = "wh_zealot",
		name = "wh_zealot",
		character_selection_image = "career_witch_hunter_zealot",
		preview_animation = "career_select_03",
		icon = "icons_placeholder",
		talent_tree_index = 1,
		description = "victor_1_desc",
		base_skin = "skin_wh_zealot",
		preview_wield_slot = "melee",
		playfab_name = "wh_1",
		portrait_image = "unit_frame_portrait_victor_zealot",
		sound_character = "witch_hunter_zealot",
		sort_order = 3,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.wh_1,
		passive_ability = PassiveAbilitySettings.wh_1,
		attributes = {
			max_hp = 150,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "out",
			resource = "video/career_videos/out"
		},
		preview_items = {
			"es_1h_flail",
			"zealot_hat_0000"
		},
		is_unlocked_function = function (hero_name, hero_level)
			if Development.parameter("unlock_all_careers") then
				return true
			end

			return ProgressionUnlocks.is_unlocked_for_profile("wh_zealot", hero_name, hero_level)
		end,
		unlocked_at_level_function = function (hero_name)
			if Development.parameter("unlock_all_careers") then
				return 1
			end

			local template = ProgressionUnlocks.get_profile_unlock("wh_zealot", hero_name)

			return template.level_requirement
		end,
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	wh_bountyhunter = {
		profile_name = "witch_hunter",
		display_name = "wh_bountyhunter",
		name = "wh_bountyhunter",
		character_selection_image = "career_witch_hunter_bounty_hunter",
		preview_animation = "career_select_02",
		icon = "icons_placeholder",
		talent_tree_index = 2,
		description = "victor_2_desc",
		base_skin = "skin_wh_bountyhunter",
		preview_wield_slot = "ranged",
		playfab_name = "wh_2",
		portrait_image = "unit_frame_portrait_victor_bountyhunter",
		sound_character = "witch_hunter_bounty_hunter",
		sort_order = 2,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.wh_2,
		passive_ability = PassiveAbilitySettings.wh_2,
		attributes = {
			max_hp = 100,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "out",
			resource = "video/career_videos/out"
		},
		preview_items = {
			"wh_repeating_pistols",
			"bountyhunter_hat_0000"
		},
		is_unlocked_function = function (hero_name, hero_level)
			if Development.parameter("unlock_all_careers") then
				return true
			end

			return ProgressionUnlocks.is_unlocked_for_profile("wh_bountyhunter", hero_name, hero_level)
		end,
		unlocked_at_level_function = function (hero_name)
			if Development.parameter("unlock_all_careers") then
				return 1
			end

			local template = ProgressionUnlocks.get_profile_unlock("wh_bountyhunter", hero_name)

			return template.level_requirement
		end,
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	wh_captain = {
		profile_name = "witch_hunter",
		display_name = "wh_captain",
		name = "wh_captain",
		character_selection_image = "career_witch_hunter_captain",
		preview_animation = "career_select_01",
		icon = "icons_placeholder",
		talent_tree_index = 3,
		description = "victor_3_desc",
		base_skin = "skin_wh_captain",
		preview_wield_slot = "melee",
		playfab_name = "wh_3",
		portrait_image = "unit_frame_portrait_victor_captain",
		sound_character = "witch_hunter_captain",
		sort_order = 1,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.wh_3,
		passive_ability = PassiveAbilitySettings.wh_3,
		attributes = {
			max_hp = 100,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "out",
			resource = "video/career_videos/out"
		},
		preview_items = {
			"wh_fencing_sword",
			"witchhunter_hat_0000"
		},
		is_unlocked_function = function (hero_name, hero_level)
			if Development.parameter("unlock_all_careers") then
				return true
			end

			return ProgressionUnlocks.is_unlocked_for_profile("wh_captain", hero_name, hero_level)
		end,
		unlocked_at_level_function = function (hero_name)
			if Development.parameter("unlock_all_careers") then
				return 1
			end

			local template = ProgressionUnlocks.get_profile_unlock("wh_captain", hero_name)

			return template.level_requirement
		end,
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	bw_scholar = {
		profile_name = "bright_wizard",
		display_name = "bw_scholar",
		name = "bw_scholar",
		character_selection_image = "career_bright_wizard_sniper",
		preview_animation = "career_select_03",
		icon = "icons_placeholder",
		talent_tree_index = 1,
		description = "sienna_1_desc",
		base_skin = "skin_bw_scholar",
		preview_wield_slot = "ranged",
		playfab_name = "bw_1",
		portrait_image = "unit_frame_portrait_sienna_scholar",
		sound_character = "bright_wizard_sniper",
		sort_order = 2,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.bw_1,
		passive_ability = PassiveAbilitySettings.bw_1,
		attributes = {
			max_hp = 100,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "out",
			resource = "video/career_videos/out"
		},
		preview_items = {
			"bw_skullstaff_spear",
			"scholar_hat_0000"
		},
		is_unlocked_function = function (hero_name, hero_level)
			if Development.parameter("unlock_all_careers") then
				return true
			end

			return ProgressionUnlocks.is_unlocked_for_profile("bw_scholar", hero_name, hero_level)
		end,
		unlocked_at_level_function = function (hero_name)
			if Development.parameter("unlock_all_careers") then
				return 1
			end

			local template = ProgressionUnlocks.get_profile_unlock("bw_scholar", hero_name)

			return template.level_requirement
		end,
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	bw_adept = {
		profile_name = "bright_wizard",
		display_name = "bw_adept",
		name = "bw_adept",
		character_selection_image = "career_bright_wizard_boomer",
		preview_animation = "career_select_02",
		icon = "icons_placeholder",
		talent_tree_index = 2,
		description = "sienna_2_desc",
		base_skin = "skin_bw_adept",
		preview_wield_slot = "ranged",
		playfab_name = "bw_2",
		portrait_image = "unit_frame_portrait_sienna_adept",
		sound_character = "bright_wizard_boomer",
		sort_order = 1,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.bw_2,
		passive_ability = PassiveAbilitySettings.bw_2,
		attributes = {
			max_hp = 100,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "out",
			resource = "video/career_videos/out"
		},
		preview_items = {
			"bw_skullstaff_fireball",
			"adept_hat_0000"
		},
		is_unlocked_function = function (hero_name, hero_level)
			if Development.parameter("unlock_all_careers") then
				return true
			end

			return ProgressionUnlocks.is_unlocked_for_profile("bw_adept", hero_name, hero_level)
		end,
		unlocked_at_level_function = function (hero_name)
			if Development.parameter("unlock_all_careers") then
				return 1
			end

			local template = ProgressionUnlocks.get_profile_unlock("bw_adept", hero_name)

			return template.level_requirement
		end,
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	bw_unchained = {
		profile_name = "bright_wizard",
		display_name = "bw_unchained",
		name = "bw_unchained",
		character_selection_image = "career_bright_wizard_melee",
		preview_animation = "career_select_01",
		icon = "icons_placeholder",
		talent_tree_index = 3,
		description = "sienna_3_desc",
		base_skin = "skin_bw_unchained",
		preview_wield_slot = "melee",
		playfab_name = "bw_3",
		portrait_image = "unit_frame_portrait_sienna_unchained",
		sound_character = "bright_wizard_melee",
		sort_order = 3,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.bw_3,
		passive_ability = PassiveAbilitySettings.bw_3,
		attributes = {
			max_hp = 150,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "out",
			resource = "video/career_videos/out"
		},
		preview_items = {
			"bw_flame_sword",
			"unchained_hat_0000"
		},
		is_unlocked_function = function (hero_name, hero_level)
			if Development.parameter("unlock_all_careers") then
				return true
			end

			return ProgressionUnlocks.is_unlocked_for_profile("bw_unchained", hero_name, hero_level)
		end,
		unlocked_at_level_function = function (hero_name)
			if Development.parameter("unlock_all_careers") then
				return 1
			end

			local template = ProgressionUnlocks.get_profile_unlock("bw_unchained", hero_name)

			return template.level_requirement
		end,
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	empire_soldier_tutorial = {
		profile_name = "empire_soldier",
		display_name = "empire_soldier_tutorial",
		name = "empire_soldier_tutorial",
		character_selection_image = "career_emperor_full_plate",
		preview_animation = "career_select_02",
		icon = "icons_placeholder",
		description = "markus_2_desc",
		base_skin = "skin_es_knight",
		preview_wield_slot = "melee",
		portrait_image = "unit_frame_portrait_kruber_knight",
		sound_character = "emperor_full_plate",
		sort_order = 1,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.es_2,
		passive_ability = PassiveAbilitySettings.es_2,
		attributes = {
			max_hp = 150,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "out",
			resource = "video/career_videos/out"
		},
		preview_items = {
			"es_sword_shield",
			"knight_hat_0000"
		},
		is_unlocked_function = function (hero_name, hero_level)
			return true
		end,
		unlocked_at_level_function = function (hero_name)
			return 1
		end,
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	}
}

if script_data.honduras_demo then
	CareerSettings.we_shade.preview_items = {
		"we_spear",
		"shade_hat_0000"
	}
	CareerSettings.we_shade.preview_animation = "career_select_03"
	CareerSettings.es_knight.preview_items = {
		"es_2h_hammer",
		"knight_hat_0000"
	}
	CareerSettings.es_knight.preview_animation = nil
end

return 
