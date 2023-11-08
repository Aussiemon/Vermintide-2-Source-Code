local GameModeVersusTestify = {}

GameModeVersusTestify.versus_has_lost = function (game_mode_versus)
	return game_mode_versus.about_to_lose
end

return GameModeVersusTestify
