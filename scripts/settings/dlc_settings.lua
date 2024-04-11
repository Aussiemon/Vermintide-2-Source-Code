-- chunkname: @scripts/settings/dlc_settings.lua

DLCSettings = DLCSettings or {
	store = {
		localization = "localization/store",
		package_name = "resource_packages/dlcs/store",
		additional_settings = {
			common = "scripts/settings/dlcs/store/store_common_settings",
			currencies = "scripts/settings/dlcs/store/currencies",
			equipment = "scripts/settings/dlcs/store/store_equipment_settings",
			ui = "scripts/settings/dlcs/store/store_ui_settings",
		},
	},
	eight_ball = {
		localization = "localization/eight_ball",
		package_name = "resource_packages/dlcs/eight_ball",
		additional_settings = {
			common = "scripts/settings/dlcs/eight_ball/eight_ball_common_settings",
			equipment = "scripts/settings/dlcs/eight_ball/eight_ball_equipment_settings",
		},
	},
	bogenhafen = {
		package_name = "resource_packages/dlcs/bogenhafen",
		additional_settings = {
			common = "scripts/settings/dlcs/bogenhafen/bogenhafen_common_settings",
			level = "scripts/settings/dlcs/bogenhafen/bogenhafen_level_settings",
			sound = "scripts/settings/dlcs/bogenhafen/bogenhafen_sound_settings",
		},
	},
	morris = {
		package_name = "resource_packages/dlcs/morris",
		platform_specific = "resource_packages/dlcs/morris_platform_specific",
		additional_settings = {
			achievements = "scripts/settings/dlcs/morris/morris_achievements_settings",
			ai = "scripts/settings/dlcs/morris/morris_ai_settings",
			backend = "scripts/settings/dlcs/morris/morris_backend_settings",
			buff = "scripts/settings/dlcs/morris/morris_buff_settings",
			challenges = "scripts/settings/dlcs/morris/morris_ingame_challenge",
			common = "scripts/settings/dlcs/morris/morris_common_settings",
			equipment = "scripts/settings/dlcs/morris/morris_equipment_settings",
			imgui = "scripts/settings/dlcs/morris/morris_imgui",
			journey_settings = "scripts/settings/dlcs/morris/deus_journey_settings",
			level = "scripts/settings/dlcs/morris/morris_level_settings",
			pickups = "scripts/settings/dlcs/morris/morris_pickups_settings",
			sound = "scripts/settings/dlcs/morris/morris_sound_settings",
			ui = "scripts/settings/dlcs/morris/morris_ui_settings",
		},
	},
	holly = {
		package_name = "resource_packages/dlcs/holly",
		additional_settings = {
			achievements = "scripts/settings/dlcs/holly/holly_achievements_settings",
			common = "scripts/settings/dlcs/holly/holly_common_settings",
			level = "scripts/settings/dlcs/holly/holly_level_settings",
			sound = "scripts/settings/dlcs/holly/holly_sound_settings",
		},
	},
	celebrate = {
		package_name = "resource_packages/dlcs/celebrate",
		additional_settings = {
			buff = "scripts/settings/dlcs/celebrate/celebrate_buff_settings",
			common = "scripts/settings/dlcs/celebrate/celebrate_common_settings",
			equipment = "scripts/settings/dlcs/celebrate/celebrate_equipment_settings",
			level = "scripts/settings/dlcs/celebrate/celebrate_level_settings",
			pickups = "scripts/settings/dlcs/celebrate/celebrate_pickups_settings",
			sound = "scripts/settings/dlcs/celebrate/celebrate_sound_settings",
		},
	},
	penny_part_1 = {
		package_name = "resource_packages/dlcs/penny_part_1",
		additional_settings = {
			achievements = "scripts/settings/dlcs/penny/penny_achievements_settings_part_1",
			common = "scripts/settings/dlcs/penny/penny_common_settings_part_1",
			level = "scripts/settings/dlcs/penny/penny_level_settings_part_1",
			sound = "scripts/settings/dlcs/penny/penny_sound_settings_part_1",
		},
	},
	penny_part_2 = {
		package_name = "resource_packages/dlcs/penny_part_2",
		additional_settings = {
			achievements = "scripts/settings/dlcs/penny/penny_achievements_settings_part_2",
			ai = "scripts/settings/dlcs/penny/penny_ai_settings_part_2",
			common = "scripts/settings/dlcs/penny/penny_common_settings_part_2",
			level = "scripts/settings/dlcs/penny/penny_level_settings_part_2",
			sound = "scripts/settings/dlcs/penny/penny_sound_settings_part_2",
		},
	},
	penny_part_3 = {
		package_name = "resource_packages/dlcs/penny_part_3",
		additional_settings = {
			achievements = "scripts/settings/dlcs/penny/penny_achievements_settings_part_3",
			ai = "scripts/settings/dlcs/penny/penny_ai_settings_part_3",
			buff = "scripts/settings/dlcs/penny/penny_buff_settings_part_3",
			common = "scripts/settings/dlcs/penny/penny_common_settings_part_3",
			level = "scripts/settings/dlcs/penny/penny_level_settings_part_3",
			sound = "scripts/settings/dlcs/penny/penny_sound_settings_part_3",
		},
	},
	steak = {
		package_name = "resource_packages/dlcs/steak",
		additional_settings = {
			achievements = "scripts/settings/dlcs/steak/steak_achievements_settings",
			ai = "scripts/settings/dlcs/steak/steak_ai_settings",
			common = "scripts/settings/dlcs/steak/steak_common_settings",
			level = "scripts/settings/dlcs/steak/steak_level_settings",
			pickups = "scripts/settings/dlcs/steak/steak_pickups_settings",
			sound = "scripts/settings/dlcs/steak/steak_sound_settings",
			unit_variation = "scripts/settings/dlcs/steak/steak_unit_variation_settings",
		},
	},
	scorpion = {
		level_settings = "levels/honduras_dlcs/scorpion/level_settings_scorpion",
		package_name = "resource_packages/dlcs/scorpion",
		manager_settings = {},
		additional_settings = {
			achievements = "scripts/settings/dlcs/scorpion/scorpion_achievements_settings",
			backend = "scripts/settings/dlcs/scorpion/scorpion_backend_settings",
			common = "scripts/settings/dlcs/scorpion/scorpion_common_settings",
			conflict = "scripts/settings/dlcs/scorpion/scorpion_conflict_settings",
			equipment = "scripts/settings/dlcs/scorpion/scorpion_equipment_settings",
			pickups = "scripts/settings/dlcs/scorpion/scorpion_pickup_settings",
			sound = "scripts/settings/dlcs/scorpion/scorpion_sound_settings",
			ui = "scripts/settings/dlcs/scorpion/scorpion_ui_settings",
		},
	},
	gecko = {
		package_name = "resource_packages/dlcs/gecko",
		additional_settings = {
			achievements = "scripts/settings/dlcs/gecko/gecko_achievements_settings",
			common = "scripts/settings/dlcs/gecko/gecko_common_settings",
			equipment = "scripts/settings/dlcs/gecko/gecko_equipment_settings",
			ui = "scripts/settings/dlcs/gecko/gecko_ui_settings",
		},
	},
	paperweight = {
		package_name = "resource_packages/dlcs/paperweight",
		additional_settings = {
			achievements = "scripts/settings/dlcs/paperweight/paperweight_achievements_settings",
			equipment = "scripts/settings/dlcs/paperweight/paperweight_equipment_settings",
		},
	},
	anvil = {
		package_name = "resource_packages/dlcs/anvil",
		additional_settings = {
			common = "scripts/settings/dlcs/anvil/anvil_common_settings",
			equipment = "scripts/settings/dlcs/anvil/anvil_equipment_settings",
			pickups = "scripts/settings/dlcs/anvil/anvil_pickup_settings",
		},
	},
	belladonna = {
		ingame_package_name = "resource_packages/dlcs/belladonna_ingame",
		package_name = "resource_packages/dlcs/belladonna",
		additional_settings = {
			achievements = "scripts/settings/dlcs/belladonna/belladonna_achievements_settings",
			ai = "scripts/settings/dlcs/belladonna/belladonna_ai_settings",
			buff = "scripts/settings/dlcs/belladonna/belladonna_buff_settings",
			common = "scripts/settings/dlcs/belladonna/belladonna_common_settings",
			equipment = "scripts/settings/dlcs/belladonna/belladonna_equipment_settings",
			gibs = "scripts/settings/dlcs/belladonna/belladonna_gib_settings",
			sound = "scripts/settings/dlcs/belladonna/belladonna_sound_settings",
			unit_variation = "scripts/settings/dlcs/belladonna/belladonna_unit_variation_settings",
		},
	},
	mutators_batch_01 = {
		localization = "localization/mutators_01",
		package_name = "resource_packages/dlcs/mutators_batch_01",
		additional_settings = {
			buff = "scripts/settings/dlcs/mutators_batch_01/mutators_batch_01_buff_settings",
			common = "scripts/settings/dlcs/mutators_batch_01/mutators_batch_01_common_settings",
			equipment = "scripts/settings/dlcs/mutators_batch_01/mutators_batch_01_equipment_settings",
		},
	},
	mutators_batch_02 = {
		localization = "localization/mutators_02",
		package_name = "resource_packages/dlcs/mutators_batch_02",
		additional_settings = {
			ai = "scripts/settings/dlcs/mutators_batch_02/mutators_batch_02_ai_settings",
			buff = "scripts/settings/dlcs/mutators_batch_02/mutators_batch_02_buff_settings",
			common = "scripts/settings/dlcs/mutators_batch_02/mutators_batch_02_common_settings",
			equipment = "scripts/settings/dlcs/mutators_batch_02/mutators_batch_02_equipment_settings",
			pickups = "scripts/settings/dlcs/mutators_batch_02/mutators_batch_02_pickups_settings",
		},
	},
	mutators_batch_04 = {
		package_name = "resource_packages/dlcs/mutators_batch_04",
		additional_settings = {
			common = "scripts/settings/dlcs/mutators_batch_04/mutators_batch_04_common_settings",
		},
	},
	lake = {
		localization = "localization/lake",
		package_name = "resource_packages/dlcs/lake",
		additional_settings = {
			achievements = "scripts/settings/dlcs/lake/lake_achievements_settings",
			ai = "scripts/settings/dlcs/lake/lake_ai_settings",
			buff = "scripts/settings/dlcs/lake/buff_settings_lake",
			common = "scripts/settings/dlcs/lake/lake_common_settings",
			equipment = "scripts/settings/dlcs/lake/lake_equipment_settings",
		},
	},
	cog = {
		localization = "localization/cog",
		package_name = "resource_packages/dlcs/cog",
		additional_settings = {
			achievements = "scripts/settings/dlcs/cog/cog_achievements_settings",
			ai = "scripts/settings/dlcs/cog/cog_ai_settings",
			buff = "scripts/settings/dlcs/cog/buff_settings_cog",
			common = "scripts/settings/dlcs/cog/cog_common_settings",
			equipment = "scripts/settings/dlcs/cog/cog_equipment_settings",
			sound = "scripts/settings/dlcs/cog/cog_sound_settings",
		},
	},
	woods = {
		localization = "localization/woods",
		package_name = "resource_packages/dlcs/woods",
		additional_settings = {
			achievements = "scripts/settings/dlcs/woods/woods_achievements_settings",
			ai = "scripts/settings/dlcs/woods/woods_ai_settings",
			buff = "scripts/settings/dlcs/woods/buff_settings_woods",
			common = "scripts/settings/dlcs/woods/woods_common_settings",
			equipment = "scripts/settings/dlcs/woods/woods_equipment_settings",
			sound = "scripts/settings/dlcs/woods/woods_sound_settings",
		},
	},
	bless = {
		localization = "localization/bless",
		package_name = "resource_packages/dlcs/bless",
		additional_settings = {
			achievements = "scripts/settings/dlcs/bless/bless_achievements_settings",
			ai = "scripts/settings/dlcs/bless/bless_ai_settings",
			buff = "scripts/settings/dlcs/bless/buff_settings_bless",
			common = "scripts/settings/dlcs/bless/bless_common_settings",
			equipment = "scripts/settings/dlcs/bless/bless_equipment_settings",
			sound = "scripts/settings/dlcs/bless/bless_sound_settings",
			ui = "scripts/settings/dlcs/bless/bless_ui_settings",
		},
	},
	shovel = {
		localization = "localization/shovel",
		package_name = "resource_packages/dlcs/shovel",
		additional_settings = {
			achievements = "scripts/settings/dlcs/shovel/shovel_achievements_settings",
			ai = "scripts/settings/dlcs/shovel/shovel_ai_settings",
			buff = "scripts/settings/dlcs/shovel/buff_settings_shovel",
			common = "scripts/settings/dlcs/shovel/shovel_common_settings",
			equipment = "scripts/settings/dlcs/shovel/shovel_equipment_settings",
			sound = "scripts/settings/dlcs/shovel/shovel_sound_settings",
		},
	},
	grudge_marks = {
		package_name = "resource_packages/dlcs/grudge_marks",
		additional_settings = {
			achievements = "scripts/settings/dlcs/grudge_marks/grudge_marks_achievements_settings",
			buff = "scripts/settings/dlcs/grudge_marks/buff_settings_grudge_marks",
			common = "scripts/settings/dlcs/grudge_marks/grudge_marks_common_settings",
			sound = "scripts/settings/dlcs/grudge_marks/grudge_marks_sound_settings",
		},
	},
	belakor = {
		localization = "localization/belakor",
		package_name = "resource_packages/dlcs/belakor",
		additional_settings = {
			achievements = "scripts/settings/dlcs/belakor/belakor_achievements_settings",
			ai = "scripts/settings/dlcs/belakor/belakor_ai_settings",
			buff = "scripts/settings/dlcs/belakor/belakor_buff_settings",
			challenges = "scripts/settings/dlcs/belakor/belakor_ingame_challenge_settings",
			common = "scripts/settings/dlcs/belakor/belakor_common_settings",
			equipment = "scripts/settings/dlcs/belakor/belakor_equipment_settings",
			pickups = "scripts/settings/dlcs/belakor/belakor_pickup_settings",
			sound = "scripts/settings/dlcs/belakor/belakor_sound_settings",
			ui = "scripts/settings/dlcs/belakor/belakor_ui_settings",
		},
	},
	geheimnisnacht_2021 = {
		localization = "localization/geheimnisnacht_2023",
		package_name = "resource_packages/dlcs/geheimnisnacht_2021",
		additional_settings = {
			ai = "scripts/settings/dlcs/geheimnisnacht_2021/geheimnisnacht_2021_ai_settings",
			buff = "scripts/settings/dlcs/geheimnisnacht_2021/buff_settings_geheimnisnacht_2021",
			common = "scripts/settings/dlcs/geheimnisnacht_2021/geheimnisnacht_2021_common_settings",
			quest = "scripts/settings/dlcs/geheimnisnacht_2021/geheimnisnacht_2021_quest_settings",
		},
	},
	skulls_2023 = {
		localization = "localization/skulls_2023",
		package_name = "resource_packages/dlcs/skulls_2023",
		additional_settings = {
			buff = "scripts/settings/dlcs/skulls_2023/buff_settings_skulls_2023",
			common = "scripts/settings/dlcs/skulls_2023/skulls_2023_common_settings",
			quest = "scripts/settings/dlcs/skulls_2023/skulls_2023_quest_settings",
		},
	},
	fall_collection_2021 = {
		package_name = "resource_packages/dlcs/fall_collection_2021",
		additional_settings = {
			common = "scripts/settings/dlcs/fall_collection_2021/fall_collection_2021_common_settings",
		},
	},
	carousel = {
		level_settings = "levels/honduras_dlcs/carousel/level_settings_carousel",
		localization = "localization/carousel",
		package_name = "resource_packages/dlcs/carousel",
		additional_settings = {
			backend = "scripts/settings/dlcs/carousel/carousel_backend_settings",
			badges = "scripts/settings/dlcs/carousel/carousel_badge_definitions",
			buff = "scripts/settings/dlcs/carousel/carousel_buff_settings",
			character_states = "scripts/settings/dlcs/carousel/carousel_character_state_settings",
			common = "scripts/settings/dlcs/carousel/carousel_common_settings",
			equipment = "scripts/settings/dlcs/carousel/carousel_equipment_settings",
			experience = "scripts/settings/dlcs/carousel/carousel_experience_settings",
			game_object_initializers = "scripts/settings/dlcs/carousel/carousel_game_object_initializers",
			game_object_templates = "scripts/settings/dlcs/carousel/carousel_game_object_templates",
			sound = "scripts/settings/dlcs/carousel/carousel_sound_settings",
			ui = "scripts/settings/dlcs/carousel/carousel_ui_settings",
		},
	},
	gotwf = {
		localization = "localization/gotwf_balance",
		package_name = "resource_packages/dlcs/gotwf",
		additional_settings = {
			common = "scripts/settings/dlcs/gotwf/gotwf_common_settings",
			ui = "scripts/settings/dlcs/gotwf/gotwf_ui_settings",
		},
	},
	cosmetics_2022_q1 = {
		localization = "localization/cosmetics_2022_q1",
		package_name = "resource_packages/dlcs/cosmetics_2022_q1",
		additional_settings = {
			common = "scripts/settings/dlcs/cosmetics_2022_q1/cosmetics_2022_q1_common_settings",
			equipment = "scripts/settings/dlcs/cosmetics_2022_q1/cosmetics_2022_q1_equipment_settings",
		},
	},
	cosmetics_2022_q2 = {
		localization = "localization/cosmetics_2022_q2",
		package_name = "resource_packages/dlcs/cosmetics_2022_q2",
		additional_settings = {
			common = "scripts/settings/dlcs/cosmetics_2022_q2/cosmetics_2022_q2_common_settings",
			equipment = "scripts/settings/dlcs/cosmetics_2022_q2/cosmetics_2022_q2_equipment_settings",
		},
	},
	cosmetics_2022_q3 = {
		localization = "localization/cosmetics_2022_q3",
		package_name = "resource_packages/dlcs/cosmetics_2022_q3",
		additional_settings = {
			common = "scripts/settings/dlcs/cosmetics_2022_q3/cosmetics_2022_q3_common_settings",
			equipment = "scripts/settings/dlcs/cosmetics_2022_q3/cosmetics_2022_q3_equipment_settings",
		},
	},
	wizards_part_1 = {
		localization = "localization/wizards_trail",
		package_name = "resource_packages/dlcs/wizards_part_1",
		additional_settings = {
			achievements = "scripts/settings/dlcs/wizards/wizards_achievements_settings_part_1",
			common = "scripts/settings/dlcs/wizards/wizards_common_settings_part_1",
			level = "scripts/settings/dlcs/wizards/wizards_level_settings_part_1",
			sound = "scripts/settings/dlcs/wizards/wizards_sound_settings_part_1",
		},
	},
	wizards_part_2 = {
		localization = "localization/wizards_tower",
		package_name = "resource_packages/dlcs/wizards_part_2",
		additional_settings = {
			achievements = "scripts/settings/dlcs/wizards/wizards_achievements_settings_part_2",
			ai = "scripts/settings/dlcs/wizards/wizards_ai_settings_part_2",
			buff = "scripts/settings/dlcs/wizards/wizards_buff_settings_part_2",
			common = "scripts/settings/dlcs/wizards/wizards_common_settings_part_2",
			level = "scripts/settings/dlcs/wizards/wizards_level_settings_part_2",
			sound = "scripts/settings/dlcs/wizards/wizards_sound_settings_part_2",
		},
	},
	karak_azgaraz_part_1 = {
		localization = "localization/karak_azgaraz",
		package_name = "resource_packages/dlcs/karak_azgaraz_part_1",
		additional_settings = {
			achievements = "scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_achievement_settings_part_1",
			ai = "scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_ai_settings_part_1",
			common = "scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_common_settings_part_1",
			level = "scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_level_settings_part_1",
			sound = "scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_sound_settings_part_1",
		},
	},
	karak_azgaraz_part_2 = {
		package_name = "resource_packages/dlcs/karak_azgaraz_part_2",
		additional_settings = {
			achievements = "scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_achievement_settings_part_2",
			ai = "scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_ai_settings_part_2",
			common = "scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_common_settings_part_2",
			level = "scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_level_settings_part_2",
			sound = "scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_sound_settings_part_2",
		},
	},
	karak_azgaraz_part_3 = {
		package_name = "resource_packages/dlcs/karak_azgaraz_part_3",
		additional_settings = {
			achievements = "scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_achievement_settings_part_3",
			ai = "scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_ai_settings_part_3",
			common = "scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_common_settings_part_3",
			level = "scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_level_settings_part_3",
			sound = "scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_sound_settings_part_3",
		},
	},
	karak_azgaraz_part_4 = {
		localization = "localization/whaling_village",
		package_name = "resource_packages/dlcs/karak_azgaraz_part_4",
		additional_settings = {
			achievements = "scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_achievement_settings_part_4",
			ai = "scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_ai_settings_part_4",
			common = "scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_common_settings_part_4",
			level = "scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_level_settings_part_4",
			sound = "scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_sound_settings_part_4",
		},
	},
	cosmetics_2023_q1 = {
		localization = "localization/cosmetics_2023_q1",
		package_name = "resource_packages/dlcs/cosmetics_2023_q1",
		additional_settings = {
			common = "scripts/settings/dlcs/cosmetics_2023_q1/cosmetics_2023_q1_common_settings",
			equipment = "scripts/settings/dlcs/cosmetics_2023_q1/cosmetics_2023_q1_equipment_settings",
		},
	},
	cosmetics_2023_q2 = {
		localization = "localization/cosmetics_2023_q2",
		package_name = "resource_packages/dlcs/cosmetics_2023_q2",
		additional_settings = {
			common = "scripts/settings/dlcs/cosmetics_2023_q2/cosmetics_2023_q2_common_settings",
			equipment = "scripts/settings/dlcs/cosmetics_2023_q2/cosmetics_2023_q2_equipment_settings",
		},
	},
	cosmetics_2023_q4 = {
		localization = "localization/cosmetics_2023_q4",
		package_name = "resource_packages/dlcs/cosmetics_2023_q4",
		additional_settings = {
			common = "scripts/settings/dlcs/cosmetics_2023_q4/cosmetics_2023_q4_common_settings",
			equipment = "scripts/settings/dlcs/cosmetics_2023_q4/cosmetics_2023_q4_equipment_settings",
		},
	},
	menu_cinematics = {
		localization = "localization/menu_cinematics",
		package_name = "resource_packages/menu_cinematics",
		additional_settings = {
			ui = "scripts/settings/menu_cinematics_ui_settings",
		},
	},
	crawl_2023 = {
		localization = "localization/crawl_2023",
	},
	premium_career_bundle = {
		localization = "localization/cosmetics_2024_q1",
		package_name = "resource_packages/dlcs/premium_career_bundle",
		additional_settings = {
			common = "scripts/settings/dlcs/premium_career_bundle/premium_career_bundle_common_settings",
		},
	},
}
