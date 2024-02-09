﻿-- chunkname: @scripts/managers/matchmaking/matchmaking_state_party_joins.lua

MatchmakingStatePartyJoins = class(MatchmakingStatePartyJoins)
MatchmakingStatePartyJoins.NAME = "MatchmakingStatePartyJoins"
MatchmakingStatePartyJoins.TIMEOUT = 30

MatchmakingStatePartyJoins.init = function (self, params)
	self._time = 0
	self._peer_id = params.peer_id
	self._disconnected_peers = {}

	Managers.state.event:register(self, "friend_party_peer_left", "on_friend_party_peer_left")
end

MatchmakingStatePartyJoins.terminate = function (self)
	local lobby = self._state_context.reserved_lobby

	if lobby ~= nil then
		lobby:destroy()

		self._state_context.reserved_lobby = nil
	end
end

MatchmakingStatePartyJoins.destroy = function (self)
	return
end

MatchmakingStatePartyJoins.on_enter = function (self, state_context)
	self._state_context = state_context
	self._peer_failed_to_follow = false

	local reserved_lobby = state_context.reserved_lobby
	local join_lobby_data = state_context.join_lobby_data
	local search_config = state_context.search_config
	local party_members = search_config.party_members
	local lobby_type, lobby_to_join

	if reserved_lobby:is_dedicated_server() then
		lobby_type = "server"
		lobby_to_join = join_lobby_data.server_info.ip_port
	else
		lobby_type = "lobby"
		lobby_to_join = join_lobby_data.id
	end

	local lobby_index = NetworkLookup.lobby_type[lobby_type]

	for _, peer_id in ipairs(party_members) do
		if peer_id ~= self._peer_id then
			mm_printf("Telling " .. peer_id .. " to follow to " .. lobby_type .. " " .. lobby_to_join)

			if string.match(lobby_to_join, "127.0.0.1") then
				mm_printf("Seems like you are trying to follow a client on the same computer as the dedicated server is located. It cannot be done. -> Fail")

				self._peer_failed_to_follow = true

				error("Seems like you are trying to follow a client on the same computer as the dedicated server is located. It cannot be done. -> Fail")
			else
				local channel_id = PEER_ID_TO_CHANNEL[peer_id]

				if channel_id then
					RPC.rpc_follow_to_lobby(channel_id, lobby_index, lobby_to_join)
				else
					print("Error: could not find channel to client following me(as a host) into a lobby")
				end
			end
		end
	end

	mm_printf("Wait for %d clients to leave party lobby", #party_members - 1)
end

MatchmakingStatePartyJoins.on_exit = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		event_manager:unregister("friend_party_peer_left", self)
	end

	local mechanism = Managers.mechanism:game_mechanism()
	local server_id = mechanism and mechanism.get_server_id and mechanism:get_server_id()

	if server_id then
		print("JOINING MATCH. SERVER NAME: " .. server_id)
	end
end

MatchmakingStatePartyJoins.update = function (self, dt, t)
	self._time = self._time + dt

	if self:_all_clients_have_left_lobby() then
		mm_printf("Clients have left the party lobby")

		if Managers.mechanism:current_mechanism_name() == "versus" then
			self._state_context.profiles_data = {}

			return MatchmakingStateJoinGame, self._state_context
		end

		return MatchmakingStateRequestProfiles, self._state_context
	end

	if self._time > MatchmakingStatePartyJoins.TIMEOUT or self._peer_failed_to_follow then
		mm_printf("Timeout while waiting for clients to leave party lobby")

		return MatchmakingStateIdle, self._state_context
	end
end

MatchmakingStatePartyJoins.on_friend_party_peer_left = function (self, peer_id)
	self._disconnected_peers[peer_id] = true
end

MatchmakingStatePartyJoins._all_clients_have_left_lobby = function (self)
	local search_config = self._state_context.search_config
	local party_members = search_config.party_members

	for _, peer_id in ipairs(party_members) do
		if not self._disconnected_peers[peer_id] and peer_id ~= self._peer_id then
			return false
		end
	end

	return true
end
