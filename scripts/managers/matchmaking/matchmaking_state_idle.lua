MatchmakingStateIdle = class(MatchmakingStateIdle)
MatchmakingStateIdle.NAME = "MatchmakingStateIdle"

MatchmakingStateIdle.init = function (self, params, reason)
	self.lobby = params.lobby
	self.reason = reason
end

MatchmakingStateIdle.destroy = function (self)
	return
end

MatchmakingStateIdle.on_enter = function (self, state_context)
	self.state_context = state_context
end

MatchmakingStateIdle.on_exit = function (self)
	self.reason = nil
end

MatchmakingStateIdle.update = function (self, dt, t)
	return nil
end
