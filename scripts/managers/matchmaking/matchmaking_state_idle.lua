MatchmakingStateIdle = class(MatchmakingStateIdle)
MatchmakingStateIdle.NAME = "MatchmakingStateIdle"
MatchmakingStateIdle.init = function (self, params)
	self.lobby = params.lobby

	return 
end
MatchmakingStateIdle.destroy = function (self)
	return 
end
MatchmakingStateIdle.on_enter = function (self, state_context)
	self.state_context = state_context

	return 
end
MatchmakingStateIdle.on_exit = function (self)
	return 
end
MatchmakingStateIdle.update = function (self, dt, t)
	return nil
end

return 
