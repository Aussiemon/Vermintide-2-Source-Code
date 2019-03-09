DLCSettings.social_wheel.hud_components = {
	social_wheel_ui = {
		class_name = "SocialWheelUI",
		filename = "scripts/ui/social_wheel_ui",
		visibility_groups = {
			"alive",
			"realism"
		},
		validation_function = function (context, is_in_inn)
			local game_mode_key = Managers.state.game_mode:game_mode_key()

			return game_mode_key ~= "tutorial"
		end
	}
}

return
