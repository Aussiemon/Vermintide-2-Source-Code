-- chunkname: @scripts/ui/views/level_end/level_end_view_weave_testify.lua

local LevelEndViewWeaveTestify = {
	make_game_ready_for_next_weave = function (level_end_view_weave)
		if not level_end_view_weave._started_exit then
			level_end_view_weave:exit_to_game()
		end

		return Testify.RETRY
	end,
}

return LevelEndViewWeaveTestify
