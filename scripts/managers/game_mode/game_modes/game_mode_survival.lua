-- chunkname: @scripts/managers/game_mode/game_modes/game_mode_survival.lua

require("scripts/managers/game_mode/game_modes/game_mode_base")

script_data.disable_gamemode_end = script_data.disable_gamemode_end or Development.parameter("disable_gamemode_end")
GameModeSurvival = class(GameModeSurvival, GameModeBase)

local COMPLETE_LEVEL_VAR = false
local FAIL_LEVEL_VAR = false

GameModeSurvival.init = function (self, settings, world, ...)
	GameModeSurvival.super.init(self, settings, world, ...)

	self.about_to_lose = false
	self.lost_condition_timer = nil
end

GameModeSurvival.evaluate_end_conditions = function (self, round_started, dt, t)
	if script_data.disable_gamemode_end then
		return false
	end

	local ignore_bots = true
	local humans_dead = GameModeHelper.side_is_dead("heroes", ignore_bots)
	local players_disabled = GameModeHelper.side_is_disabled("heroes")
	local lost = not self._lose_condition_disabled and (humans_dead or players_disabled or self._level_failed or self:_is_time_up())

	if self.about_to_lose then
		if lost then
			if t > self.lost_condition_timer then
				local mission_system = Managers.state.entity:system("mission_system")
				local active_missions, completed_missions = mission_system:get_missions()

				if active_missions then
					local mission_data = active_missions.survival_wave

					if mission_data then
						local wave_completed = mission_data.wave_completed
						local starting_wave = mission_data.starting_wave
						local end_reason = wave_completed - starting_wave > 0 and "won" or "lost"

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

		if humans_dead then
			self.lost_condition_timer = t + GameModeSettings.survival.lose_condition_time_dead
		else
			self.lost_condition_timer = t + GameModeSettings.survival.lose_condition_time
		end
	elseif self._level_completed or self:update_end_level_areas() then
		return true, "won"
	else
		return false
	end
end

GameModeSurvival.ended = function (self, reason)
	local all_peers_ingame = self._network_server:are_all_peers_ingame()

	if not all_peers_ingame then
		self._network_server:disconnect_joining_peers()
	end
end

function COMPLETE_LEVEL()
	COMPLETE_LEVEL_VAR = true
end

function FAIL_LEVEL()
	FAIL_LEVEL_VAR = true
end
