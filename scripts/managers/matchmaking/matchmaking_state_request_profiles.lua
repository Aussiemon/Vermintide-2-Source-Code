MatchmakingStateRequestProfiles = class(MatchmakingStateRequestProfiles)
MatchmakingStateRequestProfiles.NAME = "MatchmakingStateRequestProfiles"

MatchmakingStateRequestProfiles.init = function (self, params)
	self._matchmaking_manager = params.matchmaking_manager
	self._handshaker_client = params.handshaker_client
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
				local game_mode = self.search_config.game_mode

				if game_mode == "weave_find_group" then
					self._next_state = MatchmakingStateSearchForWeaveGroup
				else
					self._next_state = MatchmakingStateSearchGame
				end
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

	self._handshaker_client:send_rpc_to_host("rpc_matchmaking_request_profiles_data")

	self._reply_timer = MatchmakingSettings.REQUEST_PROFILES_REPLY_TIME
	self._matchmaking_manager.debug.text = "requesting_profiles_data"
end

MatchmakingStateRequestProfiles.rpc_matchmaking_request_profiles_data_reply = function (self, sender, client_cookie, host_cookie, profile_array, player_id_array)
	if not self._handshaker_client:validate_cookies(client_cookie, host_cookie) then
		return
	end

	self._reply_timer = nil

	self:_update_profiles_data(profile_array, player_id_array)

	self._next_state = MatchmakingStateJoinGame
	self._matchmaking_manager.debug.text = "profiles_data_received"

	mm_printf("PROFILES DATA REPLY BY %s REPLY wh:%s | we:%s | dr:%s | bw:%s | es:%s", sender, profile_array[1], profile_array[2], profile_array[3], profile_array[4], profile_array[5])
end

MatchmakingStateRequestProfiles.rpc_matchmaking_update_profiles_data = function (self, sender, client_cookie, host_cookie, profile_array, player_id_array)
	if not self._handshaker_client:validate_cookies(client_cookie, host_cookie) then
		return
	end

	self:_update_profiles_data(profile_array, player_id_array)

	if self.popup_id then
		self.popup_join_lobby_handler:update_lobby_data(self.profiles_data)
	end
end

MatchmakingStateRequestProfiles._update_profiles_data = function (self, profile_array, player_id_array)
	SlotAllocator.unpack_after_transmission(profile_array, player_id_array, self.profiles_data)

	self.state_context.profiles_data = self.profiles_data
	self._matchmaking_manager.debug.profiles_data = self.profiles_data
end

return
