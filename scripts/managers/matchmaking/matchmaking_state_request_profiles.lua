MatchmakingStateRequestProfiles = class(MatchmakingStateRequestProfiles)
MatchmakingStateRequestProfiles.NAME = "MatchmakingStateRequestProfiles"

MatchmakingStateRequestProfiles.init = function (self, params)
	self._matchmaking_manager = params.matchmaking_manager
end

MatchmakingStateRequestProfiles.destroy = function (self)
	return
end

MatchmakingStateRequestProfiles.on_enter = function (self, state_context)
	self.state_context = state_context
	self.search_config = state_context.search_config
	self._matchmaking_manager.debug.profiles_data = {}
	self.lobby_client = state_context.lobby_client

	self:_request_profiles_data()

	self.state_context.profiles_data = nil
	self.profiles_data = {}

	self._matchmaking_manager:send_system_chat_message("matchmaking_status_requesting_profiles")
end

MatchmakingStateRequestProfiles.on_exit = function (self)
	return
end

MatchmakingStateRequestProfiles.update = function (self, dt, t)
	if self._reply_timer then
		self._reply_timer = self._reply_timer - dt

		if self._reply_timer < 0 then
			mm_printf("NO REPLY WHEN REQUESTING PROFILES DATA")

			if self.search_config == nil then
				self._matchmaking_manager:cancel_matchmaking()
			else
				local matchmaking_type = self.search_config.matchmaking_type
				self._next_state = MatchmakingStateSearchGame
			end
		end
	end

	if self._next_state then
		return self._next_state, self.state_context
	end

	return nil
end

MatchmakingStateRequestProfiles._request_profiles_data = function (self)
	local host = self.lobby_client:lobby_host()

	RPC.rpc_matchmaking_request_profiles_data(PEER_ID_TO_CHANNEL[host])

	self._reply_timer = MatchmakingSettings.REQUEST_PROFILES_REPLY_TIME
	self._matchmaking_manager.debug.text = "requesting_profiles_data"
end

MatchmakingStateRequestProfiles.rpc_matchmaking_request_profiles_data_reply = function (self, channel_id, profile_array, player_id_array)
	self._reply_timer = nil

	self:_update_profiles_data(profile_array, player_id_array)

	self._next_state = MatchmakingStateJoinGame
	self._matchmaking_manager.debug.text = "profiles_data_received"

	mm_printf("PROFILES DATA REPLY BY %s REPLY wh:%s | we:%s | dr:%s | bw:%s | es:%s", channel_id, profile_array[1], profile_array[2], profile_array[3], profile_array[4], profile_array[5])
end

MatchmakingStateRequestProfiles._update_profiles_data = function (self, profile_array, player_id_array)
	ProfileSynchronizer.unpack_lobby_profile_slots(profile_array, player_id_array, self.profiles_data)

	self.state_context.profiles_data = self.profiles_data
	self._matchmaking_manager.debug.profiles_data = self.profiles_data
end
