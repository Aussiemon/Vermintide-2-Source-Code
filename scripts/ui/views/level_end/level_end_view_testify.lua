local LevelEndViewTestify = {
	close_level_end_screen = function (_, level_end_view)
		level_end_view:exit_to_game()
	end
}

return LevelEndViewTestify
