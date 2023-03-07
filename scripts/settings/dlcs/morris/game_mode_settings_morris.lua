GameModeSettings.deus = table.clone(GameModeSettings.base)
GameModeSettings.deus.key = "deus"
GameModeSettings.deus.class_name = "GameModeDeus"
GameModeSettings.deus.display_name = "gm_morris_deus"
GameModeSettings.deus.description_text = "game_mode_description_deus"
GameModeSettings.deus.object_sets = {
	gm_sp = true
}
GameModeSettings.deus.lose_condition_time_dead = 4
GameModeSettings.deus.lose_condition_time = 10
GameModeSettings.deus.playable = true
GameModeSettings.deus.difficulties = DefaultDifficulties
GameModeSettings.deus.end_mission_rewards = true
GameModeSettings.deus.hud_component_list_path = "scripts/ui/hud_ui/component_list_definitions/hud_component_list_deus"
GameModeSettings.deus.hud_ui_settings = {
	killfeed_offset = true
}
GameModeSettings.deus.use_keep_decorations = true
GameModeSettings.deus.disable_difficulty_check = true
GameModeSettings.inn_deus = table.clone(GameModeSettings.base)
GameModeSettings.inn_deus.key = "inn_deus"
GameModeSettings.inn_deus.disable_difficulty_spawning_items = true
GameModeSettings.inn_deus.class_name = "GameModeInnDeus"
GameModeSettings.inn_deus.display_name = "gm_morris_inn_deus"
GameModeSettings.inn_deus.player_damage_forbidden = true
GameModeSettings.inn_deus.cap_power_level = false
GameModeSettings.inn_deus.end_mission_rewards = false
GameModeSettings.inn_deus.hide_difficulty = true
GameModeSettings.inn_deus.skip_level_end_view = true
GameModeSettings.inn_deus.hud_component_list_path = "scripts/ui/hud_ui/component_list_definitions/hud_component_list_inn_deus"
GameModeSettings.inn_deus.hud_ui_settings = {
	killfeed_offset = true
}
GameModeSettings.inn_deus.use_keep_decorations = true
GameModeSettings.inn_deus.social_wheel_by_side = {
	heroes = "general"
}
GameModeSettings.map_deus = table.clone(GameModeSettings.base)
GameModeSettings.map_deus.key = "map_deus"
GameModeSettings.map_deus.class_name = "GameModeMapDeus"
GameModeSettings.map_deus.display_name = "gm_morris_map_deus"
GameModeSettings.map_deus.disable_difficulty_spawning_items = true
GameModeSettings.map_deus.player_damage_forbidden = true
GameModeSettings.map_deus.cap_power_level = false
GameModeSettings.map_deus.allow_unspawned_players_in_tab_menu = true
GameModeSettings.map_deus.end_mission_rewards = true
GameModeSettings.map_deus.hide_difficulty = true
GameModeSettings.map_deus.use_keep_decorations = true
GameModeSettings.map_deus.skip_level_end_view = true
GameModeSettings.map_deus.hud_component_list_path = "scripts/ui/hud_ui/component_list_definitions/hud_component_list_map_deus"
GameModeSettings.map_deus.social_wheel_by_side = {
	heroes = "general"
}
