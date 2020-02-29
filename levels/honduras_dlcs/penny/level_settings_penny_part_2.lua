LevelSettings.dlc_bastion = {
	act_unlock_order = 1,
	display_name = "level_name_dlc_bastion",
	package_name = "resource_packages/levels/dlcs/penny/dlc_bastion",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	act = "act_penny",
	loading_ui_package_name = "loading_screen_25",
	unlockable = true,
	level_image = "level_image_bastion",
	use_mini_patrols = false,
	act_presentation_order = 2,
	description_text = "nik_bastion_briefing_02",
	boss_spawning_method = "hand_placed",
	dlc_name = "penny",
	default_surface_material = "stone",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras_dlcs/penny/dlc_bastion/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 2,
				painting_scrap = 3,
				potions = 4,
				grenades = 4,
				healing = {
					first_aid_kit = 3,
					healing_draught = 4
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3
				}
			},
			secondary = {
				ammo = 3,
				grenades = 2,
				healing = 2,
				potions = 2
			}
		},
		normal = {
			primary = {
				ammo = 4,
				painting_scrap = 3,
				potions = 6,
				grenades = 6,
				healing = {
					first_aid_kit = 5,
					healing_draught = 7
				},
				level_events = {
					explosive_barrel = 5,
					lamp_oil = 5
				}
			},
			secondary = {
				ammo = 3,
				grenades = 3,
				healing = 2,
				potions = 2
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_bastion_briefing_01",
		"nik_bastion_briefing_02"
	},
	locations = {
		"location_bastion_intro",
		"location_bastion_jailer",
		"location_bastion_warrens",
		"location_bastion_old_dungeon",
		"location_bastion_cave",
		"location_bastion_cells",
		"location_bastion_cellblock",
		"location_bastion_storage",
		"location_bastion_courtyard",
		"location_bastion_auditorium",
		"location_bastion_ritual",
		"location_bastion_tower"
	},
	mission_selection_offset = {
		2,
		0,
		0
	}
}

return
