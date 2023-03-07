require("scripts/settings/difficulty_settings")
require("foundation/scripts/util/error")

GameModeSettings = GameModeSettings or {}
GameModeSettings.base = {
	cap_power_level = true,
	class_name = "GameModeBase",
	use_level_progress = true,
	visible = false,
	use_story_lines = true,
	object_sets = {},
	game_mode_states = {
		"initial_state"
	},
	social_wheel_by_side = {
		heroes = "general"
	}
}
GameModeSettings.adventure = table.clone(GameModeSettings.base)
GameModeSettings.adventure.key = "adventure"
GameModeSettings.adventure.class_name = "GameModeAdventure"
GameModeSettings.adventure.display_name = "dlc1_2_map_game_mode_adventure"
GameModeSettings.adventure.description_text = "game_mode_description_adventure"
GameModeSettings.adventure.object_sets = {
	adventure = true,
	gm_sp = true
}
GameModeSettings.adventure.lose_condition_time_dead = 4
GameModeSettings.adventure.lose_condition_time = 10
GameModeSettings.adventure.playable = true
GameModeSettings.adventure.difficulties = DefaultDifficulties
GameModeSettings.adventure.end_mission_rewards = true
GameModeSettings.adventure.hud_component_list_path = "scripts/ui/hud_ui/component_list_definitions/hud_component_list_adventure"
GameModeSettings.adventure.use_keep_decorations = true
GameModeSettings.adventure.ping_mode = {
	world_markers = false,
	outlines = {
		item = true,
		unit = true
	}
}
GameModeSettings.survival = table.clone(GameModeSettings.base)
GameModeSettings.survival.key = "survival"
GameModeSettings.survival.class_name = "GameModeSurvival"
GameModeSettings.survival.display_name = "dlc1_2_map_game_mode_survival"
GameModeSettings.survival.description_text = "game_mode_description_survival"
GameModeSettings.survival.object_sets = {
	gm_sp = true
}
GameModeSettings.survival.lose_condition_time_dead = 4
GameModeSettings.survival.lose_condition_time = 10
GameModeSettings.survival.lose_experience = 50
GameModeSettings.survival.map_screen_texture = "map_last_stand"
GameModeSettings.survival.playable = true
GameModeSettings.survival.difficulties = SurvivalDifficulties
GameModeSettings.survival.required_act_unlocked = "act_1"
GameModeSettings.survival.end_mission_rewards = true
GameModeSettings.survival.hud_component_list_path = "scripts/ui/hud_ui/component_list_definitions/hud_component_list_adventure"
GameModeSettings.survival.use_keep_decorations = true
GameModeSettings.survival.ping_mode = {
	world_markers = false,
	outlines = {
		item = true,
		unit = true
	}
}
GameModeSettings.tutorial = table.clone(GameModeSettings.base)
GameModeSettings.tutorial.key = "tutorial"
GameModeSettings.tutorial.private_only = true
GameModeSettings.tutorial.display_name = "tutorial_no_localization"
GameModeSettings.tutorial.class_name = "GameModeTutorial"
GameModeSettings.tutorial.object_sets = {
	gm_sp = true
}
GameModeSettings.tutorial.lose_condition_time_dead = 4
GameModeSettings.tutorial.lose_condition_time = 10
GameModeSettings.tutorial.end_mission_rewards = true
GameModeSettings.tutorial.hud_component_list_path = "scripts/ui/hud_ui/component_list_definitions/hud_component_list_adventure"
GameModeSettings.tutorial.use_keep_decorations = true
GameModeSettings.demo = table.clone(GameModeSettings.base)
GameModeSettings.demo.key = "demo"
GameModeSettings.demo.private_only = true
GameModeSettings.demo.display_name = "demo_no_localization"
GameModeSettings.demo.class_name = "GameModeDemo"
GameModeSettings.demo.object_sets = {
	gm_sp = true
}
GameModeSettings.demo.lose_condition_time_dead = 4
GameModeSettings.demo.lose_condition_time = 10
GameModeSettings.demo.end_mission_rewards = true
GameModeSettings.demo.use_keep_decorations = true
GameModeSettings.demo.hud_component_list_path = "scripts/ui/hud_ui/component_list_definitions/hud_component_list_adventure"
GameModeSettings.inn = table.clone(GameModeSettings.base)
GameModeSettings.inn.key = "inn"
GameModeSettings.inn.disable_difficulty_spawning_items = true
GameModeSettings.inn.class_name = "GameModeInn"
GameModeSettings.inn.display_name = "gm_bulldozer_inn"
GameModeSettings.inn.player_damage_forbidden = true
GameModeSettings.inn.cap_power_level = false
GameModeSettings.inn.end_mission_rewards = false
GameModeSettings.inn.hide_difficulty = true
GameModeSettings.inn.hud_component_list_path = "scripts/ui/hud_ui/component_list_definitions/hud_component_list_adventure"
GameModeSettings.inn.use_keep_decorations = true
GameModeSettings.inn.social_wheel_by_side = {
	heroes = "general"
}
GameModeSettings.inn.ping_mode = {
	world_markers = false,
	outlines = {
		item = true,
		unit = true
	}
}
GameModeSettings.weave = table.clone(GameModeSettings.base)
GameModeSettings.weave.key = "weave"
GameModeSettings.weave.class_name = "GameModeWeave"
GameModeSettings.weave.display_name = "map_game_mode_name_weave"
GameModeSettings.weave.description_text = "game_mode_description_weave"
GameModeSettings.weave.hide_difficulty = true
GameModeSettings.weave.object_sets = {
	gm_sp = true
}
GameModeSettings.weave.lose_condition_time_dead = 4
GameModeSettings.weave.lose_condition_time = 10
GameModeSettings.weave.lose_condition_time_time_up = 6
GameModeSettings.weave.playable = true
GameModeSettings.weave.hud_component_list_path = "scripts/ui/hud_ui/component_list_definitions/hud_component_list_adventure"
GameModeSettings.weave.difficulties = {
	"normal",
	"hard",
	"harder",
	"hardest",
	"cataclysm",
	"cataclysm_2",
	"cataclysm_3"
}
GameModeSettings.weave.ping_mode = {
	world_markers = false,
	outlines = {
		item = true,
		unit = true
	}
}
GameModeSettings.weave.bots_disabled = true
GameModeSettings.weave.end_mission_rewards = true
GameModeSettings.weave.disable_difficulty_spawning_items = true
GameModeSettings.weave.hud_ui_settings = {
	killfeed_offset = true
}

DLCUtils.require("game_mode")

for table_key, settings in pairs(GameModeSettings) do
	if table_key ~= "base" then
		fassert(settings.key, "[GameModeSettings] game mode %q is missing parameter \"key\".", table_key)
		fassert(settings.display_name, "[GameModeSettings] game mode %q is missing parameter \"display_name\".", table_key)
	end
end
