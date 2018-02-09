MatchmakingStateFriendClient = class(MatchmakingStateFriendClient)
MatchmakingStateFriendClient.NAME = "MatchmakingStateFriendClient"
local fake_input_service = {
	get = function ()
		return 
	end,
	has = function ()
		return 
	end
}
MatchmakingStateFriendClient.init = function (self, params)
	self.matchmaking_manager = params.matchmaking_manager
	self.handshaker_client = params.handshaker_client
	self.wwise_world = params.wwise_world

	return 
end
MatchmakingStateFriendClient.destroy = function (self)
	return 
end
MatchmakingStateFriendClient.on_enter = function (self, state_context)
	self.request_data_done = false
	self._game_server_data = nil

	return 
end
MatchmakingStateFriendClient.on_exit = function (self)
	return 
end
MatchmakingStateFriendClient.update = function (self, dt, t)
	if not Managers.state.game_mode or Managers.state.game_mode:level_key() ~= "inn_level" then
		return 
	end

	local gamepad_active_last_frame = self._gamepad_active_last_frame
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if self.handshaker_client:handshake_done() and not self.request_data_done then
		self.request_data_done = true
	end

	self._gamepad_active_last_frame = gamepad_active

	return 
end
MatchmakingStateFriendClient.get_transition = function (self)
	if self._game_server_data then
		return "join_server", self._game_server_data
	end

	return 
end
MatchmakingStateFriendClient.rpc_matchmaking_broadcast_game_server_ip_address = function (self, sender, client_cookie, host_cookie, ip_address)
	if not self.handshaker_client:validate_cookies(client_cookie, host_cookie) then
		return 
	end

	self._game_server_data = {
		server_info = {
			ip_port = ip_address
		}
	}

	return 
end

return 
