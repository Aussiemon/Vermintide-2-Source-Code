LevelSettings = LevelSettings or {}
LevelSettings.dlc_dwarf_interior = {
	level_name = "levels/dlc_dwarf_interior/world",
	display_name = "dlc1_5_dwarf_interior",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	loading_ui_package_name = "resource_packages/loading_screens/loading_bg_dlc_dwarf_interior",
	loading_bg_image = "loading_screen_dlc_dwarf_interior",
	required_act_completed = "prologue",
	level_image = "level_image_dlc_dwarf_interior",
	boss_spawning_method = "hand_placed",
	default_surface_material = "stone",
	knocked_down_setting = "knocked_down",
	package_name = "resource_packages/levels/dlc_dwarf/dlc_dwarf_interior",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	camera_backlight = COLD_CAMERA_BACKLIGHT,
	loading_screen_wwise_events = {
		"nik_loading_screen_dwarf_int_01",
		"nik_loading_screen_dwarf_int_02"
	},
	pickup_settings = {
		{
			ammo = 8,
			lorebook_pages = 0,
			potions = 10,
			grenades = 8,
			healing = 16
		},
		{
			ammo = 8,
			lorebook_pages = 0,
			potions = 10,
			grenades = 8,
			healing = 17
		},
		{
			ammo = 8,
			lorebook_pages = 0,
			potions = 10,
			grenades = 8,
			healing = 12
		},
		{
			ammo = 8,
			lorebook_pages = 0,
			potions = 10,
			grenades = 8,
			healing = 12
		},
		{
			ammo = 8,
			lorebook_pages = 0,
			potions = 10,
			grenades = 8,
			healing = 12
		}
	},
	locations = {
		"dlc1_5_dwarf_interior_location_bar_street_01",
		"dlc1_5_dwarf_interior_location_bar_street_02",
		"dlc1_5_dwarf_interior_location_brewery",
		"dlc1_5_dwarf_interior_location_great_hall_back",
		"dlc1_5_dwarf_interior_location_great_hall_downstairs",
		"dlc1_5_dwarf_interior_location_great_hall_upstairs",
		"dlc1_5_dwarf_interior_location_labyrinth",
		"dlc1_5_dwarf_interior_location_large_chasm_bridge",
		"dlc1_5_dwarf_interior_location_large_chasm_join_paths",
		"dlc1_5_dwarf_interior_location_railway",
		"dlc1_5_dwarf_interior_location_separating_paths",
		"dlc1_5_dwarf_interior_location_start",
		"dlc1_5_dwarf_interior_location_storage",
		"dlc1_5_dwarf_interior_location_temple_of_valaya"
	},
	mini_patrol = {
		composition = false
	},
	map_settings = {
		area = "dwarfs",
		sorting = 23,
		icon = "level_location_dlc_icon_dwarf_interior",
		wwise_events = {
			"nik_map_brief_dwarf_int_01",
			"nik_map_brief_dwarf_int_02"
		},
		area_position = {
			-460,
			35
		}
	},
	quest_settings = {
		level = true,
		tome = true,
		grimoire = true,
		ogre = true
	}
}
LevelSettings.dlc_dwarf_exterior = {
	level_name = "levels/dlc_dwarf_exterior/world",
	display_name = "dlc1_5_dwarf_exterior",
	climate_type = "snow",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	loading_ui_package_name = "resource_packages/loading_screens/loading_bg_dlc_dwarf_exterior",
	loading_bg_image = "loading_screen_dlc_dwarf_exterior",
	level_image = "level_image_dlc_dwarf_exterior",
	required_act_completed = "prologue",
	boss_spawning_method = "hand_placed",
	default_surface_material = "mud",
	knocked_down_setting = "knocked_down",
	package_name = "resource_packages/levels/dlc_dwarf/dlc_dwarf_exterior",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	camera_backlight = COLD_CAMERA_BACKLIGHT,
	loading_screen_wwise_events = {
		"nik_loading_screen_dwarf_ext_01",
		"nik_loading_screen_dwarf_ext_02"
	},
	pickup_settings = {
		{
			ammo = 10,
			lorebook_pages = 0,
			potions = 10,
			grenades = 8,
			healing = 14
		},
		{
			ammo = 10,
			lorebook_pages = 0,
			potions = 10,
			grenades = 8,
			healing = 15
		},
		{
			ammo = 10,
			lorebook_pages = 0,
			potions = 10,
			grenades = 8,
			healing = 12
		},
		{
			ammo = 10,
			lorebook_pages = 0,
			potions = 10,
			grenades = 8,
			healing = 12
		},
		{
			ammo = 10,
			lorebook_pages = 0,
			potions = 10,
			grenades = 8,
			healing = 12
		}
	},
	locations = {
		"dlc1_5_dwarf_exterior_location_forest_outskirts",
		"dlc1_5_dwarf_exterior_location_secret_path",
		"dlc1_5_dwarf_exterior_location_main_road",
		"dlc1_5_dwarf_exterior_location_dwarf_guard_post",
		"dlc1_5_dwarf_exterior_location_wilderness",
		"dlc1_5_dwarf_exterior_location_frozen_lake",
		"dlc1_5_dwarf_exterior_location_frozen_stream",
		"dlc1_5_dwarf_exterior_location_mining_path",
		"dlc1_5_dwarf_exterior_location_railyard",
		"dlc1_5_dwarf_exterior_location_hidden_cave",
		"dlc1_5_dwarf_exterior_location_chamber_area"
	},
	mini_patrol = {
		composition = false
	},
	map_settings = {
		area = "dwarfs",
		sorting = 24,
		icon = "level_location_dlc_icon_dwarf_exterior",
		wwise_events = {
			"nik_map_brief_dwarf_ext_01",
			"nik_map_brief_dwarf_ext_02"
		},
		area_position = {
			250,
			-70
		}
	},
	quest_settings = {
		level = true,
		tome = true,
		grimoire = true,
		ogre = true
	}
}
LevelSettings.dlc_dwarf_beacons = {
	level_name = "levels/dlc_dwarf_beacons/world",
	display_name = "dlc1_5_dwarf_beacons",
	climate_type = "snow",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	loading_ui_package_name = "resource_packages/loading_screens/loading_bg_dlc_dwarf_beacons",
	loading_bg_image = "loading_screen_dlc_dwarf_beacons",
	level_image = "level_image_dlc_beacons",
	required_act_completed = "prologue",
	boss_spawning_method = "hand_placed",
	default_surface_material = "snow",
	knocked_down_setting = "knocked_down",
	package_name = "resource_packages/levels/dlc_dwarf/dlc_dwarf_beacons",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	camera_backlight = COLD_CAMERA_BACKLIGHT,
	loading_screen_wwise_events = {
		"nik_loading_screen_beacons_01",
		"nik_loading_screen_beacons_02"
	},
	pickup_settings = {
		{
			ammo = 5,
			lorebook_pages = 0,
			potions = 5,
			grenades = 4,
			healing = 9
		},
		{
			ammo = 5,
			lorebook_pages = 0,
			potions = 5,
			grenades = 4,
			healing = 8
		},
		{
			ammo = 5,
			lorebook_pages = 0,
			potions = 5,
			grenades = 4,
			healing = 7
		},
		{
			ammo = 5,
			lorebook_pages = 0,
			potions = 5,
			grenades = 4,
			healing = 7
		},
		{
			ammo = 5,
			lorebook_pages = 0,
			potions = 5,
			grenades = 4,
			healing = 6
		}
	},
	locations = {
		"dlc_1_5_location_beacons_town",
		"dlc_1_5_location_beacons_icecave",
		"dlc_1_5_location_beacons_iceriver",
		"dlc_1_5_location_beacons_firstforest",
		"dlc_1_5_location_beacons_stair",
		"dlc_1_5_location_beacons_beacon"
	},
	mini_patrol = {
		composition = false
	},
	map_settings = {
		area = "dwarfs",
		sorting = 25,
		icon = "level_location_dlc_icon_dwarf_beacon",
		wwise_events = {
			"nik_map_brief_beacons_01",
			"nik_map_brief_beacons_02"
		},
		area_position = {
			-285,
			-290
		}
	},
	quest_settings = {
		level = true,
		tome = true,
		grimoire = true,
		ogre = true
	}
}

return 
