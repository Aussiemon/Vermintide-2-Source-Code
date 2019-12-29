LevelSettings.dlc_portals = {
	act_unlock_order = 0,
	display_name = "level_name_dlc_portals",
	package_name = "resource_packages/levels/dlcs/penny/dlc_portals",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	act = "act_penny",
	loading_ui_package_name = "loading_screen_27",
	unlockable = true,
	level_image = "level_image_portals",
	use_mini_patrols = false,
	act_presentation_order = 1,
	description_text = "nik_portals_briefing_02",
	boss_spawning_method = "hand_placed",
	dlc_name = "penny",
	default_surface_material = "stone",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras_dlcs/penny/dlc_portals/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 8,
				painting_scrap = 3,
				potions = 8,
				grenades = 8,
				healing = {
					first_aid_kit = 7,
					healing_draught = 7
				},
				level_events = {
					explosive_barrel = 5,
					lamp_oil = 6
				}
			},
			secondary = {
				ammo = 10,
				grenades = 8,
				healing = 15,
				potions = 10
			}
		},
		normal = {
			primary = {
				ammo = 10,
				painting_scrap = 3,
				potions = 10,
				grenades = 10,
				healing = {
					first_aid_kit = 10,
					healing_draught = 12
				},
				level_events = {
					explosive_barrel = 6,
					lamp_oil = 7
				}
			},
			secondary = {
				ammo = 12,
				grenades = 10,
				healing = 24,
				potions = 12
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_portals_briefing_01",
		"nik_portals_briefing_02"
	},
	locations = {
		"dlc1_4_location_portals_outlook",
		"dlc1_4_location_portals_cliffside",
		"dlc1_4_location_portals_portal_a",
		"dlc1_4_location_portals_grave",
		"dlc1_4_location_portals_camp_a",
		"dlc1_4_location_portals_portal_b",
		"dlc1_4_location_portals_camp_b",
		"dlc1_4_location_portals_portal_c",
		"penny_location_portals_village",
		"penny_location_portals_village_vineyard",
		"penny_location_portals_village_town_square",
		"penny_location_portals_village_farmer",
		"location_portals_village_garden",
		"penny_location_portals_village_west_wall",
		"penny_location_portals_village_bridge_gate",
		"penny_location_portals_village_fish_shop",
		"penny_location_portals_village_pottery",
		"penny_location_portals_village_gate_house",
		"penny_location_portals_village_tavern",
		"penny_location_portals_village_watermill",
		"penny_location_portals_village_washery",
		"penny_location_portals_village_winery",
		"penny_location_portals_village_wine_cellar",
		"penny_location_portals_village_temple_yard",
		"penny_location_portals_village_temple",
		"penny_location_portals_mountain_climb",
		"penny_location_portals_mountain_old_cabin",
		"penny_location_portals_mountain_shortcut",
		"penny_location_portals_drachenfels_road",
		"penny_location_portals_drachenfels_yard_gate"
	},
	mission_selection_offset = {
		-246,
		0,
		0
	}
}

return
