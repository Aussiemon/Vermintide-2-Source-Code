require("scripts/managers/game_mode/game_modes/game_mode_base")

script_data.disable_gamemode_end = script_data.disable_gamemode_end or Development.parameter("disable_gamemode_end")
GameModeAdventure = class(GameModeAdventure, GameModeBase)

GameModeAdventure.init = function (self, settings, world, ...)
	GameModeAdventure.super.init(self, settings, world, ...)

	self.about_to_lose = false
	self.lost_condition_timer = nil
end

GameModeAdventure.evaluate_end_conditions = function (self, round_started, dt, t, mutator_handler)
	if script_data.disable_gamemode_end then
		return false
	end

	local spawn_manager = Managers.state.spawn
	local humans_dead = spawn_manager:all_humans_dead()
	local players_disabled = spawn_manager:all_players_disabled()
	local mutator_lost, mutator_lost_delay = mutator_handler:evaluate_lose_conditions()
	local lost = not self._lose_condition_disabled and (mutator_lost or humans_dead or players_disabled or self._level_failed or self:_is_time_up())

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

	if lost then
		self.about_to_lose = true

		if mutator_lost and mutator_lost_delay then
			self.lost_condition_timer = t + mutator_lost_delay
		elseif humans_dead then
			self.lost_condition_timer = t + GameModeSettings.adventure.lose_condition_time_dead
		else
			self.lost_condition_timer = t + GameModeSettings.adventure.lose_condition_time
		end
	elseif self._level_completed then
		return true, "won"
	else
		return false
	end
end

return
