MatchmakingStateDedicatedServer = class(MatchmakingStateDedicatedServer)
MatchmakingStateDedicatedServer.NAME = "MatchmakingStateDedicatedServer"
MatchmakingStateDedicatedServer.init = function (self, params)
	self._game_server = params.lobby
	self._network_transmit = params.network_transmit
	self._handshaker_host = params.handshaker_host

	return 
end
MatchmakingStateDedicatedServer.destroy = function (self)
	return 
end
MatchmakingStateDedicatedServer.on_enter = function (self, state_context)
	self._state_context = state_context

	return 
end
MatchmakingStateDedicatedServer.on_exit = function (self)
	return 
end
MatchmakingStateDedicatedServer.update = function (self, dt, t)
	return 
end
MatchmakingStateDedicatedServer.rpc_matchmaking_game_server_request_ownership = function (self, sender, client_cookie, host_cookie)
	if not self._handshaker_host:validate_cookies(sender, client_cookie, host_cookie) then
		return 
	end

	local leader_peer_id = Managers.party:leader()

	if leader_peer_id then
		self._handshaker_host:send_rpc_to_client("rpc_matchmaking_game_server_ownership_denied", sender)

		return 
	end

	Managers.game_server:set_leader_peer_id(sender)
	self._handshaker_host:send_rpc_to_client("rpc_matchmaking_game_server_ownership_allowed", sender)

	return 
end
MatchmakingStateDedicatedServer.rpc_matchmaking_game_server_start_game = function (self, sender, client_cookie, host_cookie, level_key_id, game_mode_id, difficulty_id, private_game)
	if not self._handshaker_host:validate_cookies(sender, client_cookie, host_cookie) then
		return 
	end

	local level_key = NetworkLookup.level_keys[level_key_id]
	local game_mode = NetworkLookup.game_modes[game_mode_id]
	local difficulty = NetworkLookup.difficulties[difficulty_id]

	Managers.game_server:set_start_game_params(sender, level_key, game_mode, difficulty, private_game)

	return 
end

return 
