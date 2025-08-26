-- chunkname: @levels/honduras_dlcs/dwarf_fest/level_settings_dwarf_fest.lua

LevelSettings.dlc_dwarf_fest = {
	act = "act_celebrate",
	act_presentation_order = 1,
	act_unlock_order = 0,
	ambient_sound_event = "silent_default_world_sound",
	boss_spawning_method = "hand_placed",
	climate_type = "",
	default_surface_material = "dirt",
	description_text = "nik_loading_screen_dlc_pit_01",
	display_name = "level_name_dlc_dwarf_fest",
	dlc_name = "celebrate",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "level_image_dlc_dwarf_fest",
	level_name = "levels/honduras_dlcs/dwarf_fest/level/world",
	loading_ui_package_name = "loading_screen_dwarf_fest",
	not_quickplayable = true,
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	use_mini_patrols = true,
	packages = {
		"resource_packages/levels/dlcs/dwarf_fest/dlc_dwarf_fest",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		{
			primary = {
				ammo = 6,
				grenades = 5,
				painting_scrap = 3,
				potions = 5,
				healing = {
					first_aid_kit = 5,
					healing_draught = 5,
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3,
				},
			},
			secondary = {
				ammo = 7,
				grenades = 7,
				healing = 6,
				potions = 7,
			},
		},
		normal = {
			primary = {
				ammo = 8,
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
				grenades = 8,
				healing = 8,
				potions = 8,
			},
		},
	},
	loading_screen_wwise_events = {
		"nco_dal_loading_screen_a_01",
		"nco_dal_loading_screen_a_02",
	},
	override_dialogue_settings = {
		default_hear_distance = 10,
		dialogue_level_start_delay = 120,
		max_view_distance = 50,
		story_start_delay = 90,
		story_tick_time = 10,
	},
	mission_givers = {
		{
			dialogue_profile = "npc_cousin",
			faction = "player",
		},
		{
			dialogue_profile = "npc_dwarf_revellers",
			faction = "player",
		},
	},
	loot_objectives = {},
	locations = {
		"location_dwarf_fest_intro_cavern",
		"location_dwarf_fest_grand_statues",
		"location_dwarf_fest_entrance_gate",
		"location_dwarf_fest_entrance_hallways",
		"location_dwarf_fest_construction_site",
		"location_dwarf_fest_waterflow_caves",
		"location_dwarf_fest_waterflow_hall",
		"location_dwarf_fest_waterwheel_hall",
		"location_dwarf_fest_cog_cavern",
		"location_dwarf_fest_upper_hallways",
		"location_dwarf_fest_hall_of_heroes",
		"location_dwarf_fest_exit_area",
	},
}
