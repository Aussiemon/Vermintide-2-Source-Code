-- chunkname: @scripts/managers/game_mode/game_modes/game_mode_demo.lua

require("scripts/managers/game_mode/game_modes/game_mode_base")

script_data.disable_gamemode_end = script_data.disable_gamemode_end or Development.parameter("disable_gamemode_end")
GameModeDemo = class(GameModeDemo, GameModeBase)

local COMPLETE_LEVEL_VAR = false
local FAIL_LEVEL_VAR = false

GameModeDemo.init = function (self, settings, world, ...)
	GameModeDemo.super.init(self, settings, world, ...)
end

GameModeDemo.evaluate_end_conditions = function (self, round_started, dt, t)
	local ignore_bots = true
	local humans_dead = GameModeHelper.side_is_dead("heroes", ignore_bots)
	local players_disabled = GameModeHelper.side_is_disabled("heroes")
	local lost = humans_dead or players_disabled or self._level_failed or self:_is_time_up()

	if self._level_completed or lost or self:update_end_level_areas() then
		self:complete_level()

		COMPLETE_LEVEL_VAR = false
		FAIL_LEVEL_VAR = false
	end
end

GameModeDemo.complete_level = function (self)
	if self._transition ~= "demo_completed" then
		if script_data.disable_video_player then
			self._transition = "return_to_demo_title_screen"
		else
			self._transition = "demo_completed"
		end

		Managers.music:trigger_event("Play_stinger_ending_demo")
		Managers.time:set_global_time_scale(1)

		local world = self._world
		local wwise_world = Managers.world:wwise_world(world)

		WwiseWorld.set_global_parameter(wwise_world, "demo_slowmo", 0)
	end
end

GameModeDemo.ended = function (self, reason)
	local all_peers_ingame = self._network_server:are_all_peers_ingame()

	if not all_peers_ingame then
		self._network_server:disconnect_joining_peers()
	end
end

GameModeDemo.wanted_transition = function (self)
	return self._transition
end

GameModeDemo.COMPLETE_LEVEL = function (self)
	COMPLETE_LEVEL_VAR = true
end

GameModeDemo.FAIL_LEVEL = function (self)
	FAIL_LEVEL_VAR = true
end
