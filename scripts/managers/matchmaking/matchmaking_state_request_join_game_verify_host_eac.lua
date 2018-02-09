MatchmakingStateRequestJoinGameVerifyHostEAC = class(MatchmakingStateRequestJoinGameVerifyHostEAC)
MatchmakingStateRequestJoinGameVerifyHostEAC.NAME = "MatchmakingStateRequestJoinGameVerifyHostEAC"
MatchmakingStateRequestJoinGameVerifyHostEAC.init = function (self, params)
	self._lobby = params.lobby
	self._matchmaking_manager = params.matchmaking_manager

	return 
end
MatchmakingStateRequestJoinGameVerifyHostEAC.destroy = function (self)
	return 
end
MatchmakingStateRequestJoinGameVerifyHostEAC.on_enter = function (self, state_context)
	self.state_context = state_context
	self.search_config = state_context.search_config

	if Managers.eac:enabled() then
		self._join_lobby_data = state_context.join_lobby_data
		local host = self._join_lobby_data.host
		self._host_request_id = Managers.eac:query_authorized(host, callback(self, "cb_eac_auth_host"))

		self._matchmaking_manager:send_system_chat_message("matchmaking_status_eac_auth_host")
	else
		self._matching_authorization = true
	end

	return 
end
MatchmakingStateRequestJoinGameVerifyHostEAC.on_exit = function (self)
	self._host_request_id = nil

	return 
end
MatchmakingStateRequestJoinGameVerifyHostEAC.update = function (self, dt, t)
	self._match_authorization(self)

	if self._matching_authorization ~= nil then
		if self._matching_authorization then
			return MatchmakingStateRequestJoinGame, self.state_context
		else
			return MatchmakingStateSearchGame, self.state_context
		end
	end

	return 
end
MatchmakingStateRequestJoinGameVerifyHostEAC._match_authorization = function (self)
	if self._host_eac_authorized == nil then
		return 
	end

	local authorized = Managers.eac:authorized()
	self._matching_authorization = authorized == self._host_eac_authorized

	return 
end
MatchmakingStateRequestJoinGameVerifyHostEAC.cb_eac_auth_host = function (self, info)
	if self._host_request_id ~= info.request_id then
		mm_printf("Got wrong request id (%s) (%s)", tostring(self._host_request_id), tostring(info.request_id))

		return 
	end

	mm_printf("Host eac auth (%s)", tostring(info.authorized))

	self._host_eac_authorized = info.authorized

	return 
end

return 
