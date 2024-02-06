-- chunkname: @scripts/ui/views/level_end/level_end_view_testify.lua

local LevelEndViewTestify = {
	close_level_end_screen = function (level_end_view)
		level_end_view:exit_to_game()
	end,
}

return LevelEndViewTestify
