require("scripts/managers/game_mode/game_modes/game_mode_base")

local COMPLETE_LEVEL_VAR = false
local FAIL_LEVEL_VAR = false
GameModeInn = class(GameModeInn, GameModeBase)
GameModeInn.init = function (self, settings, world, ...)
	GameModeInn.super.init(self, settings, world, ...)

	return 
end
GameModeInn.evaluate_end_conditions = function (self, round_started)
	if COMPLETE_LEVEL_VAR then
		COMPLETE_LEVEL_VAR = false

		return true, "won"
	end

	if self._is_time_up(self) then
		return true, "reload"
	end

	if FAIL_LEVEL_VAR then
		FAIL_LEVEL_VAR = false

		return true, "lost"
	end

	if self._level_completed then
		return true, "start_game"
	else
		return false
	end

	return 
end
GameModeInn.COMPLETE_LEVEL = function (self)
	COMPLETE_LEVEL_VAR = true

	return 
end
GameModeInn.FAIL_LEVEL = function (self)
	FAIL_LEVEL_VAR = true

	return 
end

return 
