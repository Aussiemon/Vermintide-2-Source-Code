require("scripts/managers/game_mode/game_modes/game_mode_base")

script_data.disable_gamemode_end = script_data.disable_gamemode_end or Development.parameter("disable_gamemode_end")
GameModeAdventure = class(GameModeAdventure, GameModeBase)
local COMPLETE_LEVEL_VAR = false
local FAIL_LEVEL_VAR = false

GameModeAdventure.init = function (self, settings, world, ...)
	GameModeAdventure.super.init(self, settings, world, ...)

	self.about_to_lose = false
	self.lost_condition_timer = nil
end

GameModeAdventure.evaluate_end_conditions = function (self, round_started, dt, t)
	if script_data.disable_gamemode_end then
		return false
	end

	local spawn_manager = Managers.state.spawn
	local humans_dead = spawn_manager:all_humans_dead()
	local players_disabled = spawn_manager:all_players_disabled()
	local lost = not self._lose_condition_disabled and (humans_dead or players_disabled or self._level_failed or self:_is_time_up())

	if self.about_to_lose then
		if lost then
			if self.lost_condition_timer < t then
				return true, "lost"
			else
				return false
			end
		else
			self.about_to_lose = nil
			self.lost_condition_timer = nil
		end
	end

	if COMPLETE_LEVEL_VAR then
		COMPLETE_LEVEL_VAR = false

		return true, "won"
	end

	if FAIL_LEVEL_VAR then
		FAIL_LEVEL_VAR = false

		return true, "lost"
	end

	if lost then
		self.about_to_lose = true

		if humans_dead then
			self.lost_condition_timer = t + GameModeSettings.adventure.lose_condition_time_dead
		else
			self.lost_condition_timer = t + GameModeSettings.adventure.lose_condition_time
		end
	elseif self._level_completed and not self.level_complete_timer then
		self.level_complete_timer = t + 0.4

		return false
	elseif self._level_completed and self.level_complete_timer <= t then
		self.level_complete_timer = nil

		return true, "won"
	else
		return false
	end
end

GameModeAdventure.complete_level = function (self, level_key)
	COMPLETE_LEVEL_VAR = true
end

GameModeAdventure.FAIL_LEVEL = function (self)
	FAIL_LEVEL_VAR = true
end

return
