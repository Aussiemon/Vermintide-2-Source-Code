﻿-- chunkname: @levels/honduras_dlcs/morris/level_settings_morris.lua

require("levels/honduras_dlcs/morris/deus_level_settings")
require("scripts/settings/dlcs/morris/deus_journey_settings")

local theme_packages_lookup = {
	belakor = "resource_packages/levels/dlcs/morris/belakor_common",
	khorne = "resource_packages/levels/dlcs/morris/khorne_common",
	nurgle = "resource_packages/levels/dlcs/morris/nurgle_common",
	slaanesh = "resource_packages/levels/dlcs/morris/slaanesh_common",
	tzeentch = "resource_packages/levels/dlcs/morris/tzeentch_common",
	wastes = "resource_packages/levels/dlcs/morris/wastes_common",
}

LevelSettings.morris_hub = {
	ambient_sound_event = "silent_default_world_sound",
	conflict_settings = "inn_level",
	default_surface_material = "dirt",
	display_name = "morris_hub_name",
	environment_state = "exterior",
	game_mode = "inn_deus",
	has_multiple_loading_images = true,
	hub_level = true,
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_inn_level",
	level_name = "levels/honduras_dlcs/morris/morris_hub/world",
	load_no_enemies = false,
	loading_ui_package_name = "morris/deus_loading_screen_1",
	mechanism = "deus",
	no_bots_allowed = true,
	no_nav_mesh = false,
	no_terror_events = true,
	player_aux_bus_name = "environment_reverb_outside",
	skip_generate_spawns = true,
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/levels/inn_dependencies",
		"resource_packages/levels/dlcs/morris/morris_hub",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	loot_objectives = {},
	pickup_settings = {
		{
			primary = {
				ammo = 5,
				deus_potions = 3,
			},
		},
	},
}
LevelSettings.dlc_morris_map = {
	ambient_sound_event = "silent_default_world_sound",
	conflict_settings = "disabled",
	disable_percentage_completed = true,
	display_name = "deus_map",
	environment_state = "exterior",
	game_mode = "map_deus",
	knocked_down_setting = "knocked_down",
	level_image = "level_image_any",
	level_name = "levels/honduras_dlcs/morris/map_scene/world",
	load_no_enemies = true,
	loading_bg_image = "loading_screen_1",
	loading_ui_package_name = "morris/deus_loading_screen_2",
	mechanism = "deus",
	music_won_state = "explore",
	no_nav_mesh = true,
	no_terror_events = true,
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/levels/dlcs/morris/map",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	override_dialogue_settings = {
		dialogue_level_start_delay = 0,
	},
}

for level_key, settings in pairs(DEUS_SHRINE_LEVEL_SETTINGS) do
	local settings_clone = table.clone(LevelSettings.dlc_morris_map)

	for setting_key, setting in pairs(settings) do
		settings_clone[setting_key] = setting
	end

	LevelSettings[level_key] = settings_clone
end

for level_key, settings in pairs(DEUS_LEVEL_SETTINGS) do
	for _, theme_name in ipairs(settings.themes) do
		for _, path in ipairs(settings.paths) do
			local settings_clone = table.clone(settings)
			local permutation_name = theme_name .. "_path" .. path
			local permutation_key, level_name

			if settings.overridden_level_name then
				fassert(settings.overridden_level_key, "If a morris level settings has an overridden_level_name, it also must have a overriden_level_key")

				permutation_key = settings.overridden_level_key
				level_name = settings.overridden_level_name
			else
				permutation_key = level_key .. "_" .. permutation_name
				level_name = "levels/honduras_dlcs/morris/" .. level_key .. "/generated/" .. permutation_name .. "/world"
			end

			settings_clone.level_name = level_name
			settings_clone.theme = theme_name
			settings_clone.display_name = level_key .. "_title"
			settings_clone.description_text = level_key .. "_desc"
			settings_clone.level_key = permutation_key
			settings_clone.level_image = "level_icon_weaves"
			settings_clone.loading_ui_package_name = settings_clone.loading_ui_package_name or "morris/deus_loading_screen_1"
			settings_clone.music_won_state = settings_clone.music_won_state
			settings_clone.game_mode = "deus"
			settings_clone.mechanism = "deus"
			settings_clone.disable_percentage_completed = true
			settings_clone.act = "deus_act"
			settings_clone.act_presentation_order = 1
			settings_clone.act_unlock_order = 0
			settings_clone.unlockable = true
			settings_clone.dlc_name = "morris"
			settings_clone.level_id = permutation_key
			settings_clone.ommit_from_lobby_browser = true
			settings_clone.allowed_locked_director_functions = {
				beastmen = true,
			}
			settings_clone.disable_quickplay = true

			local base_level_name = settings.base_level_name
			local packages = settings_clone.packages

			if not settings.do_not_add_default_packages then
				packages[#packages + 1] = theme_packages_lookup[theme_name]
				packages[#packages + 1] = string.format("resource_packages/levels/dlcs/morris/%s/%s_common", base_level_name, theme_name)
				packages[#packages + 1] = string.format("resource_packages/levels/dlcs/morris/%s/%s", level_key, permutation_name)
			end

			LevelSettings[permutation_key] = settings_clone
		end
	end
end

for journey_name, settings in pairs(DeusJourneySettings) do
	local default_settings = {
		ambient_sound_event = "silent_default_world_sound",
		conflict_settings = "disabled",
		disable_percentage_completed = true,
		environment_state = "exterior",
		game_mode = "deus",
		knocked_down_setting = "knocked_down",
		level_name = "levels/honduras_dlcs/morris/map_scene/world",
		load_no_enemies = true,
		loading_bg_image = "loading_screen_1",
		loading_ui_package_name = "morris/deus_loading_screen_1",
		no_nav_mesh = true,
		no_terror_events = true,
		player_aux_bus_name = "environment_reverb_outside",
		source_aux_bus_name = "environment_reverb_outside_source",
		unlockable = true,
		packages = {
			"resource_packages/levels/dlcs/morris/map",
		},
		level_particle_effects = {},
		level_screen_effects = {},
		locations = {},
	}

	table.merge(default_settings, settings)

	LevelSettings[journey_name] = default_settings
end

return LevelSettings
