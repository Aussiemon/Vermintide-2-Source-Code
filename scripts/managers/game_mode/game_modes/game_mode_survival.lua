require("scripts/managers/game_mode/game_modes/game_mode_base")

script_data.disable_gamemode_end = script_data.disable_gamemode_end or Development.parameter("disable_gamemode_end")
GameModeSurvival = class(GameModeSurvival, GameModeBase)
local COMPLETE_LEVEL_VAR = false
local FAIL_LEVEL_VAR = false
GameModeSurvival.init = function (self, settings, world, ...)
	GameModeSurvival.super.init(self, settings, world, ...)

	self.about_to_lose = false
	self.lost_condition_timer = nil

	return 
end
GameModeSurvival.evaluate_end_conditions = function (self, round_started, dt, t)
	if script_data.disable_gamemode_end then
		return false
	end

	local spawn_manager = Managers.state.spawn
	local humans_dead = spawn_manager.all_humans_dead(spawn_manager)
	local players_disabled = spawn_manager.all_players_disabled(spawn_manager)
	local lost = not self._lose_condition_disabled and (humans_dead or players_disabled or self._level_failed or self._is_time_up(self))

	if self.about_to_lose then
		if lost then
			if self.lost_condition_timer < t then
				local mission_system = Managers.state.entity:system("mission_system")
				local active_missions, completed_missions = mission_system.get_missions(mission_system)

				if active_missions then
					local mission_data = active_missions.survival_wave

					if mission_data then
						local wave_completed = mission_data.wave_completed
						local starting_wave = mission_data.starting_wave
						local end_reason = (0 < wave_completed - starting_wave and "won") or "lost"

						return true, end_reason
					end

					return true, "lost"
				end
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
		self.lost_condition_timer = t + GameModeSettings.adventure.lose_condition_time
	elseif self._level_completed and not self.level_complete_timer then
		self.level_complete_timer = t + 0.4

		return false
	elseif self._level_completed and self.level_complete_timer <= t then
		self.level_complete_timer = nil

		return true, "won"
	else
		return false
	end

	return 
end

function COMPLETE_LEVEL()
	COMPLETE_LEVEL_VAR = true

	return 
end

function FAIL_LEVEL()
	FAIL_LEVEL_VAR = true

	return 
end

return 
