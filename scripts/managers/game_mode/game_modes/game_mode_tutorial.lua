require("scripts/managers/game_mode/game_modes/game_mode_base")

script_data.disable_gamemode_end = script_data.disable_gamemode_end or Development.parameter("disable_gamemode_end")
GameModeTutorial = class(GameModeTutorial, GameModeBase)
local COMPLETE_LEVEL_VAR = false
local FAIL_LEVEL_VAR = false
GameModeTutorial.init = function (self, settings, world, ...)
	GameModeTutorial.super.init(self, settings, world, ...)

	self.about_to_lose = false
	self.lost_condition_timer = nil
	self._hud_disabled = false

	return 
end
GameModeTutorial.evaluate_end_conditions = function (self, round_started, dt, t)
	if COMPLETE_LEVEL_VAR then
		self.complete_level(self)

		COMPLETE_LEVEL_VAR = false
	end

	return 
end
GameModeTutorial.complete_level = function (self)
	self._transition = "finish_tutorial"

	StatisticsUtil.register_complete_tutorial(Managers.state.game_mode.statistics_db)

	return 
end
GameModeTutorial.wanted_transition = function (self)
	return self._transition
end
GameModeTutorial.COMPLETE_LEVEL = function (self)
	COMPLETE_LEVEL_VAR = true

	return 
end
GameModeTutorial.game_mode_hud_disabled = function (self)
	return self._hud_disabled
end
GameModeTutorial.disable_hud = function (self, disable)
	self._hud_disabled = disable

	return 
end
GameModeTutorial.FAIL_LEVEL = function (self)
	FAIL_LEVEL_VAR = true

	return 
end

return 
