-- chunkname: @scripts/managers/game_mode/game_modes/game_mode_versus_testify.lua

local GameModeVersusTestify = {
	versus_has_lost = function (game_mode_versus)
		return game_mode_versus.about_to_lose
	end,
}

return GameModeVersusTestify
