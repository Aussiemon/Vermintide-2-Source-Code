require("scripts/settings/game_mode_settings")

WARM_CAMERA_BACKLIGHT = {
	intensity = 0,
	falloff_exponent = 1,
	end_falloff = 20,
	start_falloff = 2,
	color = Vector3Box(1, 0.8, 0.6)
}
COLD_CAMERA_BACKLIGHT = {
	intensity = 0.03,
	falloff_exponent = 1,
	end_falloff = 2,
	start_falloff = 0,
	color = Vector3Box(0.9, 0.7, 0.6)
}

dofile("scripts/settings/level_settings_honduras")
dofile("scripts/settings/dlc_settings")

for _, dlc in pairs(DLCSettings) do
	local level_settings = dlc.level_settings

	if level_settings then
		dofile(level_settings)
	end
end

local DEFAULT_TIP_LIST = {
	"tip_1",
	"tip_2",
	"tip_3",
	"tip_4",
	"tip_5",
	"tip_6",
	"tip_7",
	"tip_8",
	"tip_9"
}
LevelSettings = LevelSettings or {}
local default_start_level = (Development.parameter("gdc") and "magnus") or "inn_level"
LevelSettings.default_start_level = default_start_level
LevelSettings.editor_level = {
	conflict_settings = "level_editor",
	display_name = "level_editor",
	package_name = "resource_packages/levels/debug/whitebox",
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	ambient_sound_event = "silent_default_world_sound",
	level_name = "__level_editor_test",
	loading_ui_package_name = "loading_screen_1",
	level_image = "level_image_any",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	map_settings = {
		area = "world",
		sorting = 0
	}
}
LevelSettings.inn_level = {
	ambient_sound_event = "silent_default_world_sound",
	player_aux_bus_name = "environment_reverb_outside",
	package_name = "resource_packages/levels/inn",
	environment_state = "interior",
	no_bots_allowed = true,
	display_name = "level_name_keep",
	conflict_settings = "disabled",
	has_multiple_loading_images = true,
	level_image = "level_image_any",
	load_no_enemies = true,
	loading_ui_package_name = "loading_screen_15",
	knocked_down_setting = "knocked_down",
	level_name = "levels/inn/world",
	no_nav_mesh = false,
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	map_settings = {
		area = "world",
		sorting = 0
	},
	locations = {
		"location_keep_armoury",
		"location_keep_bardins_room",
		"location_keep_waystone",
		"location_keep_courtyard",
		"location_keep_forge",
		"location_keep_kerillians_room",
		"location_keep_krubers_room",
		"location_keep_saltzpyres_room",
		"location_keep_siennas_room",
		"location_keep_olesyas_room",
		"location_keep_lohners_room",
		"location_keep_study",
		"location_keep_mysterious_tower"
	},
	loot_objectives = {
		grimoire = 0,
		tome = 0
	},
	pickup_settings = {
		{
			primary = {
				grenades = 5,
				ammo = 2,
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4
				}
			}
		}
	}
}
LevelSettings.whitebox_old = {
	level_image = "level_image_any",
	display_name = "level_whitebox",
	knocked_down_setting = "knocked_down",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	package_name = "resource_packages/levels/debug/whitebox",
	ambient_sound_event = "silent_default_world_sound",
	boss_spawning_method = "hand_placed",
	loading_ui_package_name = "loading_screen_1",
	conflict_settings = "code_test",
	level_name = "levels/debug/whitebox/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	boss_events = {
		safe_dist = 90,
		recurring_distance = 200,
		padding_dist = 100,
		events = {
			"event_patrol",
			"event_boss",
			"nothing"
		},
		event_lookup = {
			event_boss = {
				"boss_event_rat_ogre"
			}
		},
		spline_patrol_events = {
			"boss_event_spline_patrol"
		}
	},
	boss_events = {
		safe_dist = 50,
		recurring_distance = 300,
		padding_dist = 100
	},
	rare_events = {
		safe_dist = 50,
		recurring_distance = 1500,
		padding_dist = 100
	},
	map_settings = {
		area = "world",
		sorting = 0
	}
}
LevelSettings.whitebox_basic = {
	display_name = "level_whitebox_basic",
	package_name = "resource_packages/levels/debug/whitebox_basic",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	level_name = "levels/debug/whitebox_basic/world",
	level_image = "level_image_any",
	conflict_settings = "disabled",
	loading_ui_package_name = "loading_screen_1",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	map_settings = {
		sorting = 0,
		icon = "level_location_long_icon_02",
		area = "world"
	}
}
LevelSettings.whitebox_zones = {
	display_name = "level_whitebox_zones",
	package_name = "resource_packages/levels/debug/whitebox_zones",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	level_name = "levels/debug/whitebox_zones/world",
	level_image = "level_image_any",
	loading_ui_package_name = "loading_screen_1",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	map_settings = {
		sorting = 0,
		icon = "level_location_long_icon_02",
		area = "world"
	}
}
LevelSettings.whitebox_ta = {
	package_name = "resource_packages/levels/debug/whitebox_ta",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	level_name = "levels/debug/whitebox_ta/world",
	level_image = "level_image_any",
	loading_ui_package_name = "loading_screen_1",
	display_name = "level_whitebox_ta",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	map_settings = {
		sorting = 0,
		icon = "level_location_long_icon_02",
		area = "world"
	},
	pickup_settings = {
		{
			ammo = 10,
			grenades = 10,
			healing = 10,
			potions = 10
		}
	}
}
LevelSettings.whitebox_empty = {
	display_name = "level_whitebox_empty",
	package_name = "resource_packages/levels/debug/whitebox_empty",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	level_name = "levels/debug/whitebox_empty/world",
	level_image = "level_image_any",
	loading_ui_package_name = "loading_screen_1",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	map_settings = {
		sorting = 0,
		icon = "level_location_long_icon_02",
		area = "world"
	}
}
LevelSettings.whitebox_ai = {
	ambient_sound_event = "silent_default_world_sound",
	display_name = "level_whitebox_ai",
	player_aux_bus_name = "environment_reverb_outside",
	music_won_state = "won_boat",
	environment_state = "exterior",
	package_name = "resource_packages/levels/debug/whitebox_ai",
	level_image = "level_image_any",
	use_mini_patrols = true,
	loading_ui_package_name = "loading_screen_1",
	knocked_down_setting = "knocked_down",
	level_name = "levels/debug/whitebox_ai/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		{
			primary = {
				ammo = 2,
				grenades = 4,
				healing = 6,
				potions = 8
			},
			secondary = {
				healing = {
					first_aid_kit = 6
				}
			}
		}
	},
	locations = {},
	map_settings = {
		sorting = 0,
		icon = "level_location_long_icon_02",
		area = "world",
		wwise_events = {
			"nik_map_brief_magnus_tower_01",
			"nik_map_brief_magnus_tower_02"
		}
	}
}
LevelSettings.whitebox_crossroads = {
	ambient_sound_event = "silent_default_world_sound",
	map_sorting = 0,
	music_won_state = "won_boat",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	package_name = "resource_packages/levels/debug/whitebox_crossroads",
	display_name = "level_whitebox_crossroads",
	use_mini_patrols = true,
	level_image = "level_image_any",
	boss_spawning_method = "hand_placed",
	loading_ui_package_name = "loading_screen_1",
	knocked_down_setting = "knocked_down",
	level_name = "levels/debug/whitebox_crossroads/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		{
			ammo = 8,
			lorebook_pages = 0,
			potions = 10,
			grenades = 9,
			healing = 14
		},
		{
			ammo = 8,
			lorebook_pages = 0,
			potions = 10,
			grenades = 9,
			healing = 15
		},
		{
			ammo = 8,
			lorebook_pages = 0,
			potions = 10,
			grenades = 9,
			healing = 10
		},
		{
			ammo = 8,
			lorebook_pages = 0,
			potions = 10,
			grenades = 9,
			healing = 10
		},
		{
			ammo = 8,
			lorebook_pages = 0,
			potions = 10,
			grenades = 9,
			healing = 10
		}
	},
	locations = {},
	map_settings = {
		sorting = 0,
		icon = "level_location_long_icon_02",
		area = "world",
		wwise_events = {
			"nik_map_brief_magnus_tower_01",
			"nik_map_brief_magnus_tower_02"
		}
	}
}
LevelSettings.whitebox_patrols = {
	ambient_sound_event = "silent_default_world_sound",
	map_sorting = 0,
	music_won_state = "won_boat",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	package_name = "resource_packages/levels/debug/whitebox_patrols",
	display_name = "level_whitebox_patrols",
	use_mini_patrols = true,
	level_image = "level_image_any",
	boss_spawning_method = "hand_placed",
	loading_ui_package_name = "loading_screen_1",
	knocked_down_setting = "knocked_down",
	level_name = "levels/debug/whitebox_patrols/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		{
			ammo = 8,
			lorebook_pages = 0,
			potions = 10,
			grenades = 9,
			healing = 14
		},
		{
			ammo = 8,
			lorebook_pages = 0,
			potions = 10,
			grenades = 9,
			healing = 15
		},
		{
			ammo = 8,
			lorebook_pages = 0,
			potions = 10,
			grenades = 9,
			healing = 10
		},
		{
			ammo = 8,
			lorebook_pages = 0,
			potions = 10,
			grenades = 9,
			healing = 10
		},
		{
			ammo = 8,
			lorebook_pages = 0,
			potions = 10,
			grenades = 9,
			healing = 10
		}
	},
	locations = {},
	map_settings = {
		sorting = 0,
		icon = "level_location_long_icon_02",
		area = "world",
		wwise_events = {
			"nik_map_brief_magnus_tower_01",
			"nik_map_brief_magnus_tower_02"
		}
	}
}
LevelSettings.whitebox_bosses = {
	ambient_sound_event = "silent_default_world_sound",
	map_sorting = 0,
	music_won_state = "won_boat",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	package_name = "resource_packages/levels/debug/whitebox_bosses",
	display_name = "level_whitebox_bosses",
	use_mini_patrols = true,
	level_image = "level_image_any",
	boss_spawning_method = "hand_placed",
	loading_ui_package_name = "loading_screen_1",
	knocked_down_setting = "knocked_down",
	level_name = "levels/debug/whitebox_bosses/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		{
			ammo = 8,
			lorebook_pages = 0,
			potions = 10,
			grenades = 9,
			healing = 14
		},
		{
			ammo = 8,
			lorebook_pages = 0,
			potions = 10,
			grenades = 9,
			healing = 15
		},
		{
			ammo = 8,
			lorebook_pages = 0,
			potions = 10,
			grenades = 9,
			healing = 10
		},
		{
			ammo = 8,
			lorebook_pages = 0,
			potions = 10,
			grenades = 9,
			healing = 10
		},
		{
			ammo = 8,
			lorebook_pages = 0,
			potions = 10,
			grenades = 9,
			healing = 10
		}
	},
	locations = {
		"Greyseer_stormfiend_boss",
		"Warcamp_exalted_champion",
		"Chaos_exalted_sorcerer",
		"Catacombs_end_event",
		"Skaven_warlord"
	},
	map_settings = {
		sorting = 0,
		icon = "level_location_long_icon_02",
		area = "world",
		wwise_events = {
			"nik_map_brief_magnus_tower_01",
			"nik_map_brief_magnus_tower_02"
		}
	}
}
LevelSettings.whitebox_climb = {
	display_name = "level_whitebox_climb",
	package_name = "resource_packages/levels/debug/whitebox_climb",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	level_name = "levels/debug/whitebox_climb/world",
	level_image = "level_image_any",
	destroy_los_distance_squared = 40000,
	loading_ui_package_name = "loading_screen_1",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	map_settings = {
		sorting = 0,
		icon = "level_location_long_icon_02",
		area = "helmgart"
	}
}
LevelSettings.whitebox_tutorial = {
	display_name = "level_whitebox_tutorial",
	package_name = "resource_packages/levels/debug/whitebox_tutorial",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	level_name = "levels/debug/whitebox_tutorial/world",
	level_image = "level_image_any",
	loading_ui_package_name = "loading_screen_1",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_whitebox_MISSIONS",
		"location_whitebox_HORSE"
	},
	map_settings = {
		sorting = 0,
		icon = "level_location_long_icon_02",
		area = "helmgart"
	}
}
LevelSettings.whitebox_profiling = {
	display_name = "level_whitebox_profiling",
	package_name = "resource_packages/levels/debug/whitebox_profiling",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	level_name = "levels/debug/whitebox_profiling/world",
	level_image = "level_image_any",
	loading_ui_package_name = "loading_screen_1",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	map_settings = {
		sorting = 0,
		icon = "level_location_long_icon_02",
		area = "helmgart"
	}
}
LevelSettings.storm_vermin_patrol_test = {
	display_name = "level_storm_vermin_patrol_test",
	package_name = "resource_packages/levels/debug/storm_vermin_patrol_test",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	level_name = "levels/debug/storm_vermin_patrol_test/world",
	level_image = "level_image_any",
	loading_ui_package_name = "loading_screen_1",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	map_settings = {
		sorting = 0,
		icon = "level_location_long_icon_02",
		area = "helmgart"
	}
}
LevelSettings.umbratest = {
	display_name = "Umbratest",
	package_name = "resource_packages/levels/debug/umbratest",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	level_name = "levels/debug/umbratest/world",
	level_image = "level_image_any",
	loading_ui_package_name = "loading_screen_1",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	map_settings = {
		sorting = 2,
		icon = "level_location_dlc_icon_01",
		area = "world"
	}
}
LevelSettings.cutscene_test = {
	aux_bus_name = "environment_reverb_outside",
	level_name = "levels/debug/cutscene_test/world",
	display_name = "Cutscene_Test",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "level_image_any",
	package_name = "resource_packages/levels/debug/cutscene_test",
	loading_ui_package_name = "loading_screen_1",
	ambient_sound_event = "silent_default_world_sound",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	map_settings = {
		sorting = 2,
		icon = "level_location_dlc_icon_01",
		area = "world"
	}
}
LevelSettings.vector_field_test = {
	aux_bus_name = "environment_reverb_outside",
	level_name = "levels/debug/vector_field_test/world",
	display_name = "Cutscene_Test",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "level_image_any",
	package_name = "resource_packages/levels/debug/vector_field_test",
	loading_ui_package_name = "loading_screen_1",
	ambient_sound_event = "silent_default_world_sound",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	map_settings = {
		sorting = 2,
		icon = "level_location_dlc_icon_01",
		area = "world"
	}
}
LevelSettings.ai_benchmark = {
	display_name = "GDC_AUTODESK_PRESENTATION",
	package_name = "resource_packages/levels/benchmark/ai_benchmark",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	level_name = "levels/debug/ai_benchmark/world",
	conflict_settings = "event_level_with_roaming_no_specials",
	loading_ui_package_name = "loading_screen_1",
	level_image = "level_image_any",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	map_settings = {
		sorting = 2,
		icon = "level_location_dlc_icon_01",
		area = "world"
	}
}
LevelSettings.ai_benchmark_cycle = {
	map_sorting = 0,
	display_name = "AI_BENCHMARK_CYCLE",
	package_name = "resource_packages/levels/benchmark/ai_benchmark_cycle",
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	ambient_sound_event = "silent_default_world_sound",
	level_name = "levels/debug/ai_benchmark_cycle/world",
	level_image = "level_image_any",
	loading_ui_package_name = "loading_screen_1",
	source_aux_bus_name = "environment_reverb_outside_source",
	conflict_settings = "event_level_with_roaming_no_specials",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	map_settings = {
		sorting = 2,
		icon = "level_location_dlc_icon_01",
		area = "world"
	}
}

local function check_event_overrides(override_data, override_table_name, level_name)
	if override_data and (override_data.events or override_data.event_lookup) then
		fassert(override_data.events, "LevelSettings '%s' is overriding 'event_lookup' table, but is missing a 'events' table.", level_name)
		fassert(override_data.event_lookup, "LevelSettings '%s' is overriding 'events' table, but is missing a 'event_lookup' table.", level_name)

		local event_lookup = override_data.event_lookup
		local events = override_data.events

		for i = 1, #events, 1 do
			local event_kind = events[i]
			local event_list = event_lookup[event_kind]

			print("event_kind", override_table_name, event_kind, event_list)

			if event_kind ~= "nothing" then
				if event_list then
				else
					fassert(false, "LevelSettings '%s' is overridng the '%s.event' table. It points to an event of kind '%s'. That must be defined in the '%s.event_lookup' table.", level_name, override_table_name, event_kind, override_table_name)
				end
			end
		end
	end
end

for level_key, level_data in pairs(LevelSettings) do
	if level_data.display_name then
		level_data.level_id = level_key
		level_data.game_mode = level_data.game_mode or "adventure"
		level_data.act_unlock_order = level_data.act_unlock_order or 0

		check_event_overrides(level_data.boss_events, "boss_events", level_data.display_name)
		check_event_overrides(level_data.rare_events, "rare_events", level_data.display_name)

		if level_data.game_mode == "adventure" then
			level_data.loot_objectives = level_data.loot_objectives or {
				grimoire = 2,
				tome = 3
			}
		end
	end
end

LevelSettingsMeta = LevelSettingsMeta or {}

LevelSettingsMeta.__index = function (table, key)
	Application.error(string.format("LevelSettings has no level %q\n", tostring(key)))
	Application.error("Maybe you were looking for one of these:")

	for key, value in pairs(LevelSettings) do
		Application.error(key)
	end

	error("")
end

setmetatable(LevelSettings, LevelSettingsMeta)
dofile("scripts/settings/level_unlock_settings")

return
