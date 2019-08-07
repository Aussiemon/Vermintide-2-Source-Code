local settings = DLCSettings.scorpion
settings.ingame_hud_components = {
	{
		use_hud_scale = true,
		class_name = "WeaveProgressUI",
		filename = "scripts/ui/hud_ui/weave_progress_ui",
		visibility_groups = {
			"game_mode_disable_hud",
			"dead",
			"alive"
		},
		validation_function = function ()
			local game_mechanism = Managers.mechanism:game_mechanism()

			return game_mechanism:get_state() == "weave"
		end
	},
	{
		use_hud_scale = true,
		class_name = "WeaveTimerUI",
		filename = "scripts/ui/hud_ui/weave_timer_ui",
		visibility_groups = {
			"game_mode_disable_hud",
			"dead",
			"alive"
		},
		validation_function = function ()
			local game_mechanism = Managers.mechanism:game_mechanism()

			return game_mechanism:get_state() == "weave"
		end
	}
}

return
