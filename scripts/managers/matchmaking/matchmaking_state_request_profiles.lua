-- chunkname: @scripts/managers/matchmaking/matchmaking_state_request_profiles.lua

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

	local pop_chat = true

	Managers.chat:add_local_system_message(PEER_ID_TO_CHANNEL[Network.peer_id], Localize("matchmaking_status_requesting_profiles"), pop_chat)
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
				local search_config = self.search_config

				if search_config and search_config.dedicated_server and search_config.join_method == "party" then
					if search_config.aws then
						self._next_state = MatchmakingStateFlexmatchHost
					else
						self._next_state = MatchmakingStateReserveLobby
					end
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

	RPC.rpc_matchmaking_request_profiles_data(PEER_ID_TO_CHANNEL[host])

	self._reply_timer = MatchmakingSettings.REQUEST_PROFILES_REPLY_TIME
	self._matchmaking_manager.debug.text = "requesting_profiles_data"
end

MatchmakingStateRequestProfiles.rpc_matchmaking_request_profiles_data_reply = function (self, channel_id, peer_ids_by_party, profile_indices_by_party, party_id)
	self._reply_timer = nil

	self:_update_profiles_data(peer_ids_by_party, profile_indices_by_party, party_id)

	self._next_state = MatchmakingStateJoinGame
	self._matchmaking_manager.debug.text = "profiles_data_received"
end

MatchmakingStateRequestProfiles._update_profiles_data = function (self, peer_ids_by_party, profile_indices_by_party, party_id)
	self.profiles_data = ProfileSynchronizer.join_reservation_data_arrays(peer_ids_by_party, profile_indices_by_party)
	self.state_context.profiles_data = self.profiles_data
	self.state_context.reserved_party_id = party_id
	self._matchmaking_manager.debug.profiles_data = self.profiles_data
end
