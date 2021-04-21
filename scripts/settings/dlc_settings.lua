DLCSettings = DLCSettings or {
	store = {
		package_name = "resource_packages/dlcs/store",
		additional_settings = {
			common = "scripts/settings/dlcs/store/store_common_settings",
			ui = "scripts/settings/dlcs/store/store_ui_settings",
			currencies = "scripts/settings/dlcs/store/currencies",
			equipment = "scripts/settings/dlcs/store/store_equipment_settings"
		}
	},
	eight_ball = {
		package_name = "resource_packages/dlcs/eight_ball",
		additional_settings = {
			common = "scripts/settings/dlcs/eight_ball/eight_ball_common_settings",
			equipment = "scripts/settings/dlcs/eight_ball/eight_ball_equipment_settings"
		}
	},
	bogenhafen = {
		package_name = "resource_packages/dlcs/bogenhafen",
		additional_settings = {
			common = "scripts/settings/dlcs/bogenhafen/bogenhafen_common_settings",
			sound = "scripts/settings/dlcs/bogenhafen/bogenhafen_sound_settings",
			level = "scripts/settings/dlcs/bogenhafen/bogenhafen_level_settings"
		}
	},
	morris = {
		platform_specific = "resource_packages/dlcs/morris_platform_specific",
		package_name = "resource_packages/dlcs/morris",
		additional_settings = {
			level = "scripts/settings/dlcs/morris/morris_level_settings",
			ai = "scripts/settings/dlcs/morris/morris_ai_settings",
			journey_settings = "scripts/settings/dlcs/morris/deus_journey_settings",
			buff = "scripts/settings/dlcs/morris/morris_buff_settings",
			common = "scripts/settings/dlcs/morris/morris_common_settings",
			sound = "scripts/settings/dlcs/morris/morris_sound_settings",
			achievements = "scripts/settings/dlcs/morris/morris_achievements_settings",
			challenges = "scripts/settings/dlcs/morris/morris_ingame_challenge",
			equipment = "scripts/settings/dlcs/morris/morris_equipment_settings",
			pickups = "scripts/settings/dlcs/morris/morris_pickups_settings",
			imgui = "scripts/settings/dlcs/morris/morris_imgui",
			ui = "scripts/settings/dlcs/morris/morris_ui_settings",
			backend = "scripts/settings/dlcs/morris/morris_backend_settings"
		}
	},
	holly = {
		package_name = "resource_packages/dlcs/holly",
		additional_settings = {
			common = "scripts/settings/dlcs/holly/holly_common_settings",
			achievements = "scripts/settings/dlcs/holly/holly_achievements_settings",
			sound = "scripts/settings/dlcs/holly/holly_sound_settings",
			level = "scripts/settings/dlcs/holly/holly_level_settings"
		}
	},
	celebrate = {
		package_name = "resource_packages/dlcs/celebrate",
		additional_settings = {
			equipment = "scripts/settings/dlcs/celebrate/celebrate_equipment_settings",
			common = "scripts/settings/dlcs/celebrate/celebrate_common_settings",
			pickups = "scripts/settings/dlcs/celebrate/celebrate_pickups_settings",
			buff = "scripts/settings/dlcs/celebrate/celebrate_buff_settings",
			sound = "scripts/settings/dlcs/celebrate/celebrate_sound_settings",
			level = "scripts/settings/dlcs/celebrate/celebrate_level_settings"
		}
	},
	penny_part_1 = {
		package_name = "resource_packages/dlcs/penny_part_1",
		additional_settings = {
			common = "scripts/settings/dlcs/penny/penny_common_settings_part_1",
			achievements = "scripts/settings/dlcs/penny/penny_achievements_settings_part_1",
			sound = "scripts/settings/dlcs/penny/penny_sound_settings_part_1",
			level = "scripts/settings/dlcs/penny/penny_level_settings_part_1"
		}
	},
	penny_part_2 = {
		package_name = "resource_packages/dlcs/penny_part_2",
		additional_settings = {
			common = "scripts/settings/dlcs/penny/penny_common_settings_part_2",
			ai = "scripts/settings/dlcs/penny/penny_ai_settings_part_2",
			sound = "scripts/settings/dlcs/penny/penny_sound_settings_part_2",
			achievements = "scripts/settings/dlcs/penny/penny_achievements_settings_part_2",
			level = "scripts/settings/dlcs/penny/penny_level_settings_part_2"
		}
	},
	penny_part_3 = {
		package_name = "resource_packages/dlcs/penny_part_3",
		additional_settings = {
			common = "scripts/settings/dlcs/penny/penny_common_settings_part_3",
			ai = "scripts/settings/dlcs/penny/penny_ai_settings_part_3",
			sound = "scripts/settings/dlcs/penny/penny_sound_settings_part_3",
			buff = "scripts/settings/dlcs/penny/penny_buff_settings_part_3",
			achievements = "scripts/settings/dlcs/penny/penny_achievements_settings_part_3",
			level = "scripts/settings/dlcs/penny/penny_level_settings_part_3"
		}
	},
	steak = {
		package_name = "resource_packages/dlcs/steak",
		additional_settings = {
			common = "scripts/settings/dlcs/steak/steak_common_settings",
			ai = "scripts/settings/dlcs/steak/steak_ai_settings",
			unit_variation = "scripts/settings/dlcs/steak/steak_unit_variation_settings",
			pickups = "scripts/settings/dlcs/steak/steak_pickups_settings",
			sound = "scripts/settings/dlcs/steak/steak_sound_settings",
			achievements = "scripts/settings/dlcs/steak/steak_achievements_settings",
			level = "scripts/settings/dlcs/steak/steak_level_settings"
		}
	},
	scorpion = {
		package_name = "resource_packages/dlcs/scorpion",
		level_settings = "levels/honduras_dlcs/scorpion/level_settings_scorpion",
		manager_settings = {},
		additional_settings = {
			common = "scripts/settings/dlcs/scorpion/scorpion_common_settings",
			conflict = "scripts/settings/dlcs/scorpion/scorpion_conflict_settings",
			equipment = "scripts/settings/dlcs/scorpion/scorpion_equipment_settings",
			pickups = "scripts/settings/dlcs/scorpion/scorpion_pickup_settings",
			sound = "scripts/settings/dlcs/scorpion/scorpion_sound_settings",
			achievements = "scripts/settings/dlcs/scorpion/scorpion_achievements_settings",
			ui = "scripts/settings/dlcs/scorpion/scorpion_ui_settings",
			backend = "scripts/settings/dlcs/scorpion/scorpion_backend_settings"
		}
	},
	gecko = {
		package_name = "resource_packages/dlcs/gecko",
		additional_settings = {
			common = "scripts/settings/dlcs/gecko/gecko_common_settings",
			achievements = "scripts/settings/dlcs/gecko/gecko_achievements_settings",
			equipment = "scripts/settings/dlcs/gecko/gecko_equipment_settings",
			ui = "scripts/settings/dlcs/gecko/gecko_ui_settings"
		}
	},
	paperweight = {
		package_name = "resource_packages/dlcs/paperweight",
		additional_settings = {
			equipment = "scripts/settings/dlcs/paperweight/paperweight_equipment_settings",
			achievements = "scripts/settings/dlcs/paperweight/paperweight_achievements_settings"
		}
	},
	anvil = {
		package_name = "resource_packages/dlcs/anvil",
		additional_settings = {
			equipment = "scripts/settings/dlcs/anvil/anvil_equipment_settings",
			common = "scripts/settings/dlcs/anvil/anvil_common_settings",
			pickups = "scripts/settings/dlcs/anvil/anvil_pickup_settings"
		}
	},
	belladonna = {
		ingame_package_name = "resource_packages/dlcs/belladonna_ingame",
		package_name = "resource_packages/dlcs/belladonna",
		additional_settings = {
			common = "scripts/settings/dlcs/belladonna/belladonna_common_settings",
			ai = "scripts/settings/dlcs/belladonna/belladonna_ai_settings",
			unit_variation = "scripts/settings/dlcs/belladonna/belladonna_unit_variation_settings",
			buff = "scripts/settings/dlcs/belladonna/belladonna_buff_settings",
			gibs = "scripts/settings/dlcs/belladonna/belladonna_gib_settings",
			achievements = "scripts/settings/dlcs/belladonna/belladonna_achievements_settings",
			equipment = "scripts/settings/dlcs/belladonna/belladonna_equipment_settings",
			sound = "scripts/settings/dlcs/belladonna/belladonna_sound_settings"
		}
	},
	mutators_batch_01 = {
		package_name = "resource_packages/dlcs/mutators_batch_01",
		additional_settings = {
			common = "scripts/settings/dlcs/mutators_batch_01/mutators_batch_01_common_settings",
			equipment = "scripts/settings/dlcs/mutators_batch_01/mutators_batch_01_equipment_settings",
			buff = "scripts/settings/dlcs/mutators_batch_01/mutators_batch_01_buff_settings"
		}
	},
	mutators_batch_02 = {
		package_name = "resource_packages/dlcs/mutators_batch_02",
		additional_settings = {
			equipment = "scripts/settings/dlcs/mutators_batch_02/mutators_batch_02_equipment_settings",
			ai = "scripts/settings/dlcs/mutators_batch_02/mutators_batch_02_ai_settings",
			common = "scripts/settings/dlcs/mutators_batch_02/mutators_batch_02_common_settings",
			buff = "scripts/settings/dlcs/mutators_batch_02/mutators_batch_02_buff_settings",
			pickups = "scripts/settings/dlcs/mutators_batch_02/mutators_batch_02_pickups_settings"
		}
	},
	mutators_batch_04 = {
		package_name = "resource_packages/dlcs/mutators_batch_04",
		additional_settings = {
			common = "scripts/settings/dlcs/mutators_batch_04/mutators_batch_04_common_settings"
		}
	},
	lake = {
		package_name = "resource_packages/dlcs/lake",
		additional_settings = {
			equipment = "scripts/settings/dlcs/lake/lake_equipment_settings",
			ai = "scripts/settings/dlcs/lake/lake_ai_settings",
			common = "scripts/settings/dlcs/lake/lake_common_settings",
			buff = "scripts/settings/dlcs/lake/buff_settings_lake",
			achievements = "scripts/settings/dlcs/lake/lake_achievements_settings"
		}
	},
	cog = {
		package_name = "resource_packages/dlcs/cog",
		additional_settings = {
			equipment = "scripts/settings/dlcs/cog/cog_equipment_settings",
			ai = "scripts/settings/dlcs/cog/cog_ai_settings",
			common = "scripts/settings/dlcs/cog/cog_common_settings",
			buff = "scripts/settings/dlcs/cog/buff_settings_cog",
			sound = "scripts/settings/dlcs/cog/cog_sound_settings",
			achievements = "scripts/settings/dlcs/cog/cog_achievements_settings"
		}
	}
}

return
