-- chunkname: @scripts/managers/matchmaking/matchmaking_state_friend_client.lua

MatchmakingStateFriendClient = class(MatchmakingStateFriendClient)
MatchmakingStateFriendClient.NAME = "MatchmakingStateFriendClient"

MatchmakingStateFriendClient.init = function (self, params)
	self.matchmaking_manager = params.matchmaking_manager
	self.wwise_world = params.wwise_world
	self.lobby = params.lobby
	self.network_transmit = params.network_transmit
	self._network_options = params.network_options
	self.params = params
	self._request_timer = 0
	self._lobby = params.lobby
end

MatchmakingStateFriendClient.destroy = function (self)
	self:_cleanup()
end

MatchmakingStateFriendClient.on_enter = function (self, state_context)
	self._game_server_data = nil
	self._state_context = state_context
	self._is_versus = state_context.mechanism == "versus"

	if self._is_versus then
		self:_sync_player_data()
	end
end

MatchmakingStateFriendClient._sync_player_data = function (self)
	local player = Managers.player:local_player()
	local name = player:name()
	local career_name = player:career_name()
	local profile_id = player:profile_index()
	local career_id = player:career_index()
	local party_id = self._state_context.party_id
	local slots = {
		"slot_frame",
		"slot_melee",
		"slot_ranged",
	}
	local items_interface = Managers.backend:get_interface("items")
	local versus_interface = Managers.backend:get_interface("versus")
	local slot_data = {}

	print("========================================")

	for _, slot_name in pairs(slots) do
		local item_id = versus_interface:get_loadout_item_id(career_name, slot_name)
		local item_key = items_interface:get_key(item_id)

		print(slot_name, item_key)

		slot_data[slot_name] = NetworkLookup.item_names[item_key]
	end

	print("----------------------------------------")
	table.dump(slot_data, "SLOT_SYNC_DATA", 2)
	print("========================================")

	local do_full_sync = true
	local fake_party_id = 0
	local peer_id = Network.peer_id()
	local host = self.lobby:lobby_host()

	self.network_transmit:send_rpc("rpc_matchmaking_sync_player_data", host, peer_id, name, profile_id, career_id, slot_data.slot_frame, slot_data.slot_melee, slot_data.slot_ranged, fake_party_id, do_full_sync)
end

MatchmakingStateFriendClient._start_lobby_search = function (self)
	if not self._lobby_finder then
		self._lobby_finder = ServerSearchUtils.trigger_lobby_finder_search(self._network_options, 0, {
			filters = {
				mechanism = {
					comparison = "equal",
					value = "versus",
				},
				matchmaking = {
					comparison = "not_equal",
					value = "false",
				},
				game_state = {
					comparison = "equal",
					value = "party_lobby",
				},
			},
		})
	end
end

MatchmakingStateFriendClient.on_exit = function (self)
	local mechanism = Managers.mechanism:game_mechanism()
	local server_id = mechanism and mechanism.get_server_id and mechanism:get_server_id()

	if server_id then
		print("JOINING MATCH. SERVER NAME: " .. server_id)
	end

	self:_cleanup()
end

MatchmakingStateFriendClient._cleanup = function (self)
	if self._lobby_finder then
		self._lobby_finder:destroy()

		self._lobby_finder = nil
	end
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

MatchmakingStateFriendClient._update_lobby_finder = function (self, dt, t)
	if self._lobby_update_timer then
		fassert(not self._lobby_finder:is_refreshing(), "")

		if t > self._lobby_update_timer then
			self._lobby_finder:refresh()

			self._lobby_update_timer = nil
		else
			return
		end
	end

	self._lobby_finder:update(dt)

	if self._lobby_finder:is_refreshing() then
		return
	end

	local lobbies = self._lobby_finder:lobbies()
	local num_players_matchmaking

	if #lobbies > 0 then
		num_players_matchmaking = 0

		for i = 1, #lobbies do
			local lobby = lobbies[i]
			local num_players = tonumber(lobby.num_players)

			if lobby.matchmaking ~= "false" then
				num_players_matchmaking = num_players_matchmaking + num_players
			end
		end
	else
		local lobby_data = self._lobby:get_stored_lobby_data()

		num_players_matchmaking = lobby_data.num_players or 1
	end

	Managers.state.event:trigger("matchmaking_num_players_in_matchmaking", "versus", num_players_matchmaking)

	self._lobby_update_timer = t + 10
end

MatchmakingStateFriendClient.get_transition = function (self)
	if self._game_server_data then
		return "join_server", self._game_server_data
	end
end

MatchmakingStateFriendClient.rpc_matchmaking_broadcast_game_server_ip_address = function (self, channel_id, ip_address)
	self._game_server_data = {
		server_info = {
			ip_port = ip_address,
		},
	}
end
