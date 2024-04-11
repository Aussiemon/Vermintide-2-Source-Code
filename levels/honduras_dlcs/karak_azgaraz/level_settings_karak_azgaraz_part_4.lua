-- chunkname: @levels/honduras_dlcs/karak_azgaraz/level_settings_karak_azgaraz_part_4.lua

LevelSettings.dlc_dwarf_whaling = {
	act = "act_karak_azgaraz",
	act_presentation_order = 4,
	act_unlock_order = 3,
	ambient_sound_event = "silent_default_world_sound",
	boss_spawning_method = "hand_placed",
	description_text = "nik_dlc_dwarf_whaling_loading_screen_01",
	display_name = "dwarf_whaling",
	dlc_name = "karak_azgaraz_part_4",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "dlc_whaling_village",
	level_name = "levels/honduras_dlcs/karak_azgaraz/dwarf_whaling/world",
	loading_ui_package_name = "loading_screen_dwarf_4",
	no_terror_events = false,
	player_aux_bus_name = "environment_reverb_outside",
	small_level_image = "dlc_whaling_village_small_image",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	use_mini_patrols = true,
	packages = {
		"resource_packages/levels/dlcs/karak_azgaraz/dlc_dwarf_whaling",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"dlc_1_5_location_whaling_shipwreck",
		"dlc_1_5_location_whaling_skaven",
		"dlc_1_5_location_whaling_harbor",
		"dlc_1_5_location_whaling_lower",
		"dlc_1_5_location_whaling_upper",
		"dlc_1_5_location_whaling_event",
		"dlc_1_5_location_whaling_slope",
	},
	pickup_settings = {
		default = {
			primary = {
				ammo = 8,
				grenades = 6,
				painting_scrap = 3,
				potions = 4,
				healing = {
					first_aid_kit = 6,
					healing_draught = 8,
				},
				level_events = {
					explosive_barrel = 2,
					lamp_oil = 0,
				},
			},
			secondary = {
				ammo = 10,
				grenades = 8,
				healing = 10,
				potions = 8,
			},
		},
		normal = {
			primary = {
				ammo = 10,
				grenades = 8,
				painting_scrap = 3,
				potions = 6,
				healing = {
					first_aid_kit = 8,
					healing_draught = 10,
				},
				level_events = {
					explosive_barrel = 2,
					lamp_oil = 0,
				},
			},
			secondary = {
				ammo = 10,
				grenades = 8,
				healing = 12,
				potions = 10,
			},
		},
	},
	loading_screen_wwise_events = {
		"pes_village_00_loading_screen_a_01",
		"pes_village_00_loading_screen_a_02",
	},
}
