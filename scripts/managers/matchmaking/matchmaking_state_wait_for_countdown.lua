MatchmakingStateWaitForCountdown = class(MatchmakingStateWaitForCountdown)
MatchmakingStateWaitForCountdown.NAME = "MatchmakingStateWaitForCountdown"
MatchmakingStateWaitForCountdown.init = function (self, params)
	return 
end
MatchmakingStateWaitForCountdown.destroy = function (self)
	return 
end
MatchmakingStateWaitForCountdown.on_enter = function (self, state_context)
	self._state_context = state_context

	return 
end
MatchmakingStateWaitForCountdown.on_exit = function (self)
	Managers.matchmaking:activate_waystone_portal(false)

	return 
end
MatchmakingStateWaitForCountdown.update = function (self, dt, t)
	local manager = Managers.matchmaking

	if manager.countdown_has_finished then
		manager.countdown_has_finished = false

		return MatchmakingStateStartGame, self._state_context
	end

	return nil
end

return 
