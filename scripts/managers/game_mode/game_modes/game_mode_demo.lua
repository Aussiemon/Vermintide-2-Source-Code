require("scripts/managers/game_mode/game_modes/game_mode_base")

script_data.disable_gamemode_end = script_data.disable_gamemode_end or Development.parameter("disable_gamemode_end")
GameModeDemo = class(GameModeDemo, GameModeBase)
local COMPLETE_LEVEL_VAR = false
local FAIL_LEVEL_VAR = false
GameModeDemo.init = function (self, settings, world, ...)
	GameModeDemo.super.init(self, settings, world, ...)

	self.about_to_lose = false
	self.lost_condition_timer = nil

	return 
end
GameModeDemo.evaluate_end_conditions = function (self, round_started, dt, t)
	local spawn_manager = Managers.state.spawn
	local humans_dead = spawn_manager.all_humans_dead(spawn_manager)
	local players_disabled = spawn_manager.all_players_disabled(spawn_manager)
	local lost = humans_dead or players_disabled or self._level_failed or self._is_time_up(self)

	if self._level_completed or lost then
		self.complete_level(self)

		COMPLETE_LEVEL_VAR = false
		FAIL_LEVEL_VAR = false
	end

	return 
end
GameModeDemo.complete_level = function (self)
	if self._transition ~= "demo_completed" then
		self._transition = "demo_completed"

		Managers.music:trigger_event("Play_stinger_ending_demo")
		Managers.time:set_global_time_scale(1)

		local world = self._world
		local wwise_world = Managers.world:wwise_world(world)

		WwiseWorld.set_global_parameter(wwise_world, "demo_slowmo", 0)
	end

	return 
end
GameModeDemo.wanted_transition = function (self)
	return self._transition
end
GameModeDemo.COMPLETE_LEVEL = function (self)
	COMPLETE_LEVEL_VAR = true

	return 
end
GameModeDemo.FAIL_LEVEL = function (self)
	FAIL_LEVEL_VAR = true

	return 
end

return 
