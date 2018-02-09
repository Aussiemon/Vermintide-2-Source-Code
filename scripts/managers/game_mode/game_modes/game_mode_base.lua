GameModeBase = class(GameModeBase)
GameModeBase.init = function (self, settings, world, network_server, level_transition_handler)
	self._network_server = network_server
	self._settings = settings
	self._world = world
	self._level_transition_handler = level_transition_handler
	self._level_completed = false
	self._level_failed = false
	self._lose_condition_disabled = false

	return 
end
GameModeBase.settings = function (self)
	return self._settings
end
GameModeBase.fail_level = function (self)
	self._level_failed = true

	return 
end
GameModeBase._is_time_up = function (self)
	if LEVEL_EDITOR_TEST then
		return false
	end

	local network_time = Managers.state.network:network_time()
	local max_time = NetworkConstants.clock_time.max
	local time_up = 0.9 < network_time/max_time

	return time_up
end
GameModeBase.disable_lose_condition = function (self)
	self._lose_condition_disabled = true

	return 
end
GameModeBase.level_completed = function (self)
	return self._level_completed
end
GameModeBase.complete_level = function (self)
	self._level_completed = true

	return 
end
GameModeBase.evaluate_end_conditions = function (self)
	return false, nil
end
GameModeBase.object_sets = function (self)
	return self._settings.object_sets
end
GameModeBase.wanted_transition = function (self)
	return 
end
GameModeBase.hot_join_sync = function (self, sender)
	return 
end

return 
