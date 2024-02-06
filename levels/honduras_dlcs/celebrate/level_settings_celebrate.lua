-- chunkname: @levels/honduras_dlcs/celebrate/level_settings_celebrate.lua

LevelSettings.dlc_celebrate_crawl = {
	act = "act_celebrate",
	act_presentation_order = 1,
	act_unlock_order = 0,
	ambient_sound_event = "silent_default_world_sound",
	boss_spawning_method = "hand_placed",
	climate_type = "",
	default_surface_material = "dirt",
	description_text = "nik_loading_screen_dlc_pit_01",
	display_name = "level_name_crawl",
	dlc_name = "celebrate",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_celebrate_crawl",
	level_name = "levels/honduras_dlcs/celebrate/crawl/world",
	loading_ui_package_name = "loading_screen_22",
	not_quickplayable = true,
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	use_mini_patrols = true,
	packages = {
		"resource_packages/levels/dlcs/celebrate/crawl",
		"resource_packages/dlcs/celebrate_ingame",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_crawl_start",
		"location_crawl_boulevard",
		"location_crawl_park",
		"location_crawl_the_collapse",
		"location_crawl_tunnel",
		"location_crawl_tower_stairs",
		"location_crawl_pub_02",
		"location_crawl_pub_district_streets",
		"location_crawl_pub_district_square",
		"location_crawl_pub_03_outdoors",
		"location_crawl_pub_03_indoors",
		"location_crawl_cellars",
		"location_crawl_portal_area",
	},
	pickup_settings = {
		{
			primary = {
				ammo = 6,
				grenades = 4,
				painting_scrap = 3,
				potions = 4,
				healing = {
					first_aid_kit = 3,
					healing_draught = 5,
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3,
				},
			},
			secondary = {
				ammo = 5,
				grenades = 5,
				healing = 5,
				potions = 5,
			},
		},
		normal = {
			primary = {
				ammo = 6,
				grenades = 6,
				painting_scrap = 3,
				potions = 6,
				healing = {
					first_aid_kit = 6,
					healing_draught = 8,
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3,
				},
			},
			secondary = {
				ammo = 8,
				grenades = 10,
				healing = 12,
				potions = 10,
			},
		},
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_crawl_01",
		"nik_loading_screen_crawl_02",
		dr_engineer = {
			"pdr_de_loading_screen_crawl_01",
			"pdr_de_loading_screen_crawl_02",
		},
		we_thornsister = {
			"pwe_st_loading_screen_crawl_01",
			"pwe_st_loading_screen_crawl_02",
		},
		es_questingknight = {
			"pes_gk_loading_screen_crawl_01",
			"pes_gk_loading_screen_crawl_02",
		},
		wh_priest = {
			"pwh_wp_loading_screen_crawl_01",
			"pwh_wp_loading_screen_crawl_02",
		},
		bw_necromancer = {
			"pbw_nm_loading_screen_crawl_01",
			"pbw_nm_loading_screen_crawl_02",
		},
	},
	override_dialogue_settings = {
		default_hear_distance = 10,
		dialogue_level_start_delay = 120,
		max_view_distance = 50,
		story_start_delay = 90,
		story_tick_time = 10,
	},
	loot_objectives = {},
}
