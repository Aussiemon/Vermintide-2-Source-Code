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
	return
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

MatchmakingStateFriendClient.on_exit = function (self)
	local mechanism = Managers.mechanism:game_mechanism()
	local server_id = mechanism and mechanism.get_server_id and mechanism:get_server_id()

	if server_id then
		print("JOINING MATCH. SERVER NAME: " .. server_id)
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
