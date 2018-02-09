require("scripts/settings/difficulty_settings")
require("foundation/scripts/util/error")

GameModeSettings = GameModeSettings or {}
GameModeSettings.base = {
	class_name = "GameModeBase",
	visible = false,
	object_sets = {}
}
GameModeSettings.adventure = table.clone(GameModeSettings.base)
GameModeSettings.adventure.key = "adventure"
GameModeSettings.adventure.class_name = "GameModeAdventure"
GameModeSettings.adventure.display_name = "dlc1_2_map_game_mode_adventure"
GameModeSettings.adventure.description_text = "game_mode_description_adventure"
GameModeSettings.adventure.object_sets = {
	gm_sp = true
}
GameModeSettings.adventure.lose_condition_time = 4
GameModeSettings.adventure.playable = true
GameModeSettings.adventure.difficulties = DefaultDifficulties
GameModeSettings.survival = table.clone(GameModeSettings.base)
GameModeSettings.survival.key = "survival"
GameModeSettings.survival.class_name = "GameModeSurvival"
GameModeSettings.survival.display_name = "dlc1_2_map_game_mode_survival"
GameModeSettings.survival.description_text = "game_mode_description_survival"
GameModeSettings.survival.object_sets = {
	gm_sp = true
}
GameModeSettings.survival.lose_condition_time = 4
GameModeSettings.survival.lose_experience = 50
GameModeSettings.survival.map_screen_texture = "map_last_stand"
GameModeSettings.survival.playable = true
GameModeSettings.survival.difficulties = SurvivalDifficulties
GameModeSettings.survival.required_act_unlocked = "act_1"
GameModeSettings.tutorial = table.clone(GameModeSettings.base)
GameModeSettings.tutorial.key = "tutorial"
GameModeSettings.tutorial.private_only = true
GameModeSettings.tutorial.display_name = "tutorial_no_localization"
GameModeSettings.tutorial.class_name = "GameModeTutorial"
GameModeSettings.tutorial.object_sets = {
	gm_sp = true
}
GameModeSettings.tutorial.lose_condition_time = 4
GameModeSettings.demo = table.clone(GameModeSettings.base)
GameModeSettings.demo.key = "demo"
GameModeSettings.demo.private_only = true
GameModeSettings.demo.display_name = "demo_no_localization"
GameModeSettings.demo.class_name = "GameModeDemo"
GameModeSettings.demo.object_sets = {
	gm_sp = true
}
GameModeSettings.demo.lose_condition_time = 4
GameModeSettings.inn = table.clone(GameModeSettings.base)
GameModeSettings.inn.key = "inn"
GameModeSettings.inn.disable_difficulty_spawning_items = true
GameModeSettings.inn.class_name = "GameModeInn"
GameModeSettings.inn.display_name = "gm_bulldozer_inn"

for table_key, settings in pairs(GameModeSettings) do
	if table_key ~= "base" then
		fassert(settings.key, "[GameModeSettings] game mode %q is missing parameter \"key\".", table_key)
		fassert(settings.display_name, "[GameModeSettings] game mode %q is missing parameter \"display_name\".", table_key)
	end
end

return 
