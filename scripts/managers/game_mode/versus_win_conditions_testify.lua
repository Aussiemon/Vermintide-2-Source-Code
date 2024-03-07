-- chunkname: @scripts/managers/game_mode/versus_win_conditions_testify.lua

local VersusWinConditionsTestify = {
	versus_party_won_early = function (versus_win_conditions)
		return versus_win_conditions.party_won_early
	end,
}

return VersusWinConditionsTestify
