MatchmakingStateFriendClient = class(MatchmakingStateFriendClient)
MatchmakingStateFriendClient.NAME = "MatchmakingStateFriendClient"

MatchmakingStateFriendClient.init = function (self, params)
	self.matchmaking_manager = params.matchmaking_manager
	self.wwise_world = params.wwise_world
end

MatchmakingStateFriendClient.destroy = function (self)
	return
end

MatchmakingStateFriendClient.on_enter = function (self, state_context)
	self._game_server_data = nil
end

MatchmakingStateFriendClient.on_exit = function (self)
	return
end

MatchmakingStateFriendClient.update = function (self, dt, t)
	if not Managers.state.game_mode then
		return
	end

	local level_key = Managers.state.game_mode:level_key()
	local level_settings = LevelSettings[level_key]

	if not level_settings.hub_level then
		return
	end

	local gamepad_active_last_frame = self._gamepad_active_last_frame
	local gamepad_active = Managers.input:is_device_active("gamepad")
	self._gamepad_active_last_frame = gamepad_active
end

MatchmakingStateFriendClient.get_transition = function (self)
	if self._game_server_data then
		return "join_server", self._game_server_data
	end
end

MatchmakingStateFriendClient.rpc_matchmaking_broadcast_game_server_ip_address = function (self, channel_id, ip_address)
	self._game_server_data = {
		server_info = {
			ip_port = ip_address
		}
	}
end

return
