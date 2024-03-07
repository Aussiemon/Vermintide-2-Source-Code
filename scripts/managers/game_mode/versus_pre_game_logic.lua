-- chunkname: @scripts/managers/game_mode/versus_pre_game_logic.lua

local RPCS = {
	"rpc_pre_game_request_ready",
	"rpc_pre_game_set_player_ready",
	"rpc_pre_game_select_character",
	"rpc_change_pre_game_seach_state",
}

VersusPreGameLogic = class(VersusPreGameLogic)

VersusPreGameLogic.init = function (self, is_server, network_server)
	self._is_server = is_server
	self._network_server = network_server
	self._peer_ready_states = {}
	self._ready_request_ids = {}
	self._search_state_info = ""

	self:_fill_peer_ready_states(self._peer_ready_states)

	self._owner_peer_id = Network.peer_id()
end

VersusPreGameLogic.register_rpcs = function (self, network_event_delegate, network_transmit)
	network_event_delegate:register(self, unpack(RPCS))

	self._network_event_delegate = network_event_delegate
	self._network_transmit = network_transmit
end

VersusPreGameLogic.unregister_rpcs = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil
	self._network_transmit = nil
end

VersusPreGameLogic.can_peer_change_ready_state = function (self, peer_id, local_player_id)
	return true
end

VersusPreGameLogic.is_peer_ready = function (self, peer_id, local_player_id)
	return self._peer_ready_states[peer_id][local_player_id].ready
end

local auto_ready = false

VersusPreGameLogic.all_peers_ready = function (self)
	local all_ready = true

	if auto_ready then
		return true
	end

	local peer_ready_states = self._peer_ready_states

	if table.is_empty(peer_ready_states) then
		all_ready = false
	end

	for _, player_states in pairs(peer_ready_states) do
		for _, player_state in pairs(player_states) do
			if not player_state.ready then
				all_ready = false

				break
			end
		end
	end

	return all_ready
end

VersusPreGameLogic.character_info = function (self, peer_id, local_player_id)
	local player_state = self._peer_ready_states[peer_id][local_player_id]
	local profile_index = player_state.profile_index
	local career_index = player_state.career_index
	local melee_name = player_state.melee_name
	local ranged_name = player_state.ranged_name

	return profile_index, career_index, melee_name, ranged_name
end

VersusPreGameLogic.player_joined_party = function (self, peer_id, local_player_id, party_id)
	print("VersusPreGameLogic player_joined_party:", peer_id, local_player_id, party_id)

	local peer_ready_states = self._peer_ready_states

	self:_add_player_state(peer_ready_states, peer_id, local_player_id)
end

VersusPreGameLogic.player_left_party = function (self, peer_id, local_player_id, party_id)
	print("VersusPreGameLogic player_left_party:", peer_id, local_player_id, party_id)

	local peer_ready_states = self._peer_ready_states

	self:_remove_player_state(peer_ready_states, peer_id, local_player_id)
end

VersusPreGameLogic.request_ready = function (self, local_player_id, is_ready)
	local_player_id = self._local_player_id or local_player_id
	self._local_player_id = local_player_id

	if not Network.game_session() then
		Crashify.print_exception("VersusPreGameLogic", "Tried to ready up whithout game_session")

		return
	end

	local own_peer_id = self._owner_peer_id

	self._ready_request_ids[local_player_id] = (self._ready_request_ids[local_player_id] or 0) % NetworkConstants.READY_REQUEST_ID_MAX + 1

	local ready_request_id = self._ready_request_ids[local_player_id]

	if self._is_server then
		self:_handle_ready_request(own_peer_id, local_player_id, is_ready, ready_request_id)

		if not is_ready then
			Managers.mechanism:game_mechanism():reset_dedicated_slots_count()
			Managers.matchmaking:cancel_matchmaking()
		end
	else
		self:_set_player_ready(own_peer_id, local_player_id, is_ready, ready_request_id)
		self._network_transmit:send_rpc_server("rpc_pre_game_request_ready", local_player_id, is_ready, ready_request_id)
	end
end

VersusPreGameLogic.failed_to_find_dedicated_server = function (self, fail_reason)
	self:request_ready(nil, false)
	Managers.state.event:trigger("show_pre_game_view_popup", fail_reason)
end

VersusPreGameLogic.request_force_start_server = function (self)
	print("force starting server")

	local mechanism = Managers.mechanism:game_mechanism()
	local force_start = mechanism.force_start_dedicated_server

	if force_start then
		mechanism:force_start_dedicated_server()
	end
end

VersusPreGameLogic.request_switch_level = function (self, level_key)
	local mechanism = Managers.mechanism:game_mechanism()
	local switch_level = mechanism.switch_level_dedicated_server

	if switch_level then
		mechanism:switch_level_dedicated_server(level_key)
	end
end

VersusPreGameLogic.select_character = function (self, peer_id, local_player_id, profile_index, career_index, melee_item, ranged_item)
	local melee_name

	if melee_item then
		melee_name = melee_item.key
	end

	local ranged_name

	if ranged_item then
		ranged_name = ranged_item.key
	end

	self:_select_character(peer_id, local_player_id, profile_index, career_index, melee_name, ranged_name)

	local melee_name_id = NetworkLookup.item_names[melee_name or "n/a"]
	local ranged_name_id = NetworkLookup.item_names[ranged_name or "n/a"]

	if self._is_server then
		self._network_transmit:send_rpc_clients("rpc_pre_game_select_character", peer_id, local_player_id, profile_index, career_index, melee_name_id, ranged_name_id)
	else
		self._network_transmit:send_rpc_server("rpc_pre_game_select_character", peer_id, local_player_id, profile_index, career_index, melee_name_id, ranged_name_id)
	end

	Managers.backend:commit()
end

VersusPreGameLogic.can_toggle_local_match = function (self)
	if not self._is_server then
		return false
	end

	if self:is_local_match() then
		local lobby_host = self._network_server.lobby_host
		local lobby_members = lobby_host:members():get_members()
		local num_members = #lobby_members

		if num_members > Managers.mechanism:max_party_members() then
			return false
		end
	end

	return true
end

VersusPreGameLogic.can_toggle_public_private_lobby = function (self)
	if not self._is_server then
		return false
	end

	if self:is_local_match() then
		return true
	end

	return false
end

VersusPreGameLogic.can_toggle_dedicated_servers_or_player_hosted_search = function (self)
	if not self._is_server then
		return false
	end

	if self:is_local_match() then
		return false
	end

	return true
end

VersusPreGameLogic.is_local_match = function (self)
	return Managers.mechanism:game_mechanism():is_local_match()
end

VersusPreGameLogic.set_local_match = function (self, local_match)
	Managers.mechanism:game_mechanism():set_local_match(local_match)
end

VersusPreGameLogic.is_private_lobby = function (self)
	return Managers.mechanism:game_mechanism():is_private_lobby()
end

VersusPreGameLogic.set_private_lobby = function (self, private_lobby)
	Managers.mechanism:game_mechanism():set_private_lobby(private_lobby)
end

VersusPreGameLogic.using_dedicated_servers_search = function (self)
	return Managers.mechanism:game_mechanism():using_dedicated_servers()
end

VersusPreGameLogic.using_player_hosted_search = function (self)
	return Managers.mechanism:game_mechanism():using_player_hosted()
end

VersusPreGameLogic.set_dedicated_or_player_hosted_search = function (self, use_dedicated_servers, use_dedicated_aws_servers, use_player_hosted)
	return Managers.mechanism:game_mechanism():set_dedicated_or_player_hosted_search(use_dedicated_servers, use_dedicated_aws_servers, use_player_hosted)
end

VersusPreGameLogic.hot_join_sync = function (self, sender)
	local channel_id = PEER_ID_TO_CHANNEL[sender]

	for peer_id, player_states in pairs(self._peer_ready_states) do
		for local_player_id, player_state in pairs(player_states) do
			local ready = player_state.ready
			local request_id = player_state.request_id

			RPC.rpc_pre_game_set_player_ready(channel_id, peer_id, local_player_id, ready, request_id)

			local profile_index = player_state.profile_index

			if profile_index then
				local career_index = player_state.career_index
				local melee_name = player_state.melee_name
				local ranged_name = player_state.ranged_name
				local melee_name_id = NetworkLookup.item_names[melee_name or "n/a"]
				local ranged_name_id = NetworkLookup.item_names[ranged_name or "n/a"]

				RPC.rpc_pre_game_select_character(channel_id, peer_id, local_player_id, profile_index, career_index, melee_name_id, ranged_name_id)
			end
		end
	end
end

VersusPreGameLogic._fill_peer_ready_states = function (self, peer_ready_states)
	local parties = Managers.party:parties()

	for i = 0, #parties do
		local party = parties[i]
		local occupied_slots = party.occupied_slots

		for j = 1, #occupied_slots do
			local status = occupied_slots[j]
			local peer_id, local_player_id = status.peer_id, status.local_player_id

			self:_add_player_state(peer_ready_states, peer_id, local_player_id)
		end
	end
end

VersusPreGameLogic._add_player_state = function (self, peer_ready_states, peer_id, local_player_id)
	if not peer_ready_states[peer_id] then
		peer_ready_states[peer_id] = {}
	end

	local player_states = peer_ready_states[peer_id]

	if not player_states[local_player_id] then
		player_states[local_player_id] = {}
	end

	local player_state = player_states[local_player_id]

	player_state.ready = false
	player_state.request_id = 1
end

VersusPreGameLogic._remove_player_state = function (self, peer_ready_states, peer_id, local_player_id)
	local player_states = peer_ready_states[peer_id]

	player_states[local_player_id] = nil

	if table.is_empty(player_states) then
		peer_ready_states[peer_id] = nil
	end
end

VersusPreGameLogic._handle_ready_request = function (self, peer_id, local_player_id, is_ready, request_id)
	if not self:can_peer_change_ready_state(peer_id, local_player_id) then
		local player_state = self._peer_ready_states[peer_id][local_player_id]

		is_ready = player_state.ready
	end

	self:_set_player_ready(peer_id, local_player_id, is_ready, request_id)
end

VersusPreGameLogic.set_all_players_ready = function (self, is_ready)
	for peer_id, player_states in pairs(self._peer_ready_states) do
		for local_player_id, player_state in pairs(player_states) do
			self._ready_request_ids[local_player_id] = (self._ready_request_ids[local_player_id] or 0) % NetworkConstants.READY_REQUEST_ID_MAX + 1

			local ready_request_id = self._ready_request_ids[local_player_id]

			self:_set_player_ready(peer_id, local_player_id, is_ready, -1)
		end
	end
end

VersusPreGameLogic._set_player_ready = function (self, peer_id, local_player_id, is_ready, request_id)
	if not self:peer_in_ready_states(peer_id, local_player_id) then
		self:_add_player_state(self._peer_ready_states, peer_id, local_player_id)
	end

	local player_state = self._peer_ready_states[peer_id][local_player_id]

	player_state.ready = is_ready
	player_state.request_id = request_id

	if self._is_server then
		self._network_transmit:send_rpc_clients("rpc_pre_game_set_player_ready", peer_id, local_player_id, is_ready, request_id)
	end
end

VersusPreGameLogic._select_character = function (self, peer_id, local_player_id, profile_index, career_index, melee_name, ranged_name)
	local player_state = self._peer_ready_states[peer_id][local_player_id]

	player_state.profile_index = profile_index
	player_state.career_index = career_index
	player_state.melee_name = melee_name
	player_state.ranged_name = ranged_name

	local player_party_status = Managers.party:get_status_from_unique_id(peer_id .. ":" .. local_player_id)

	player_party_status.preferred_profile_index = profile_index
	player_party_status.preferred_career_index = career_index
end

VersusPreGameLogic.peer_in_ready_states = function (self, peer_id, local_player_id)
	local peer = self._peer_ready_states[peer_id]

	if not peer then
		return false
	end

	return peer[local_player_id] ~= nil
end

local SEARCH_STATES = {
	"idle",
	"joined_dedicated_server",
	"searching_for_dedicated_server",
	"force_starting_dedicated_server",
	"searching_for_player_hosted_game",
}

for i = 1, #SEARCH_STATES do
	local state_name = SEARCH_STATES[i]

	SEARCH_STATES[state_name] = i
end

VersusPreGameLogic.search_state_info = function (self)
	return self._search_state_info
end

VersusPreGameLogic.change_pre_game_search_state = function (self, state_name)
	self._search_state_info = state_name

	if self._is_server then
		local state_name_id = SEARCH_STATES[state_name]

		self._network_transmit:send_rpc_clients("rpc_change_pre_game_seach_state", state_name_id)
	end
end

VersusPreGameLogic.rpc_change_pre_game_seach_state = function (self, channel_id, state_name_id)
	fassert(not self._is_server, "Should only appear on the clients.")

	local state_name = SEARCH_STATES[state_name_id]

	self:change_pre_game_search_state(state_name)
end

VersusPreGameLogic.rpc_pre_game_request_ready = function (self, channel_id, local_player_id, is_ready, ready_request_id)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	self:_handle_ready_request(peer_id, local_player_id, is_ready, ready_request_id)
end

VersusPreGameLogic.rpc_pre_game_set_player_ready = function (self, channel_id, peer_id, local_player_id, is_ready, ready_request_id)
	local own_peer_id = self._owner_peer_id
	local current_ready_request_id = self._ready_request_ids[local_player_id]

	if peer_id == own_peer_id and ready_request_id ~= current_ready_request_id and ready_request_id ~= -1 then
		return
	end

	self:_set_player_ready(peer_id, local_player_id, is_ready, ready_request_id)
end

VersusPreGameLogic.rpc_pre_game_select_character = function (self, channel_id, peer_id, local_player_id, profile_index, career_index, melee_name_id, ranged_name_id)
	local melee_name = NetworkLookup.item_names[melee_name_id]

	if melee_name == "n/a" then
		melee_name = nil
	end

	local ranged_name = NetworkLookup.item_names[ranged_name_id]

	if ranged_name == "n/a" then
		ranged_name = nil
	end

	print("rpc_pre_game_select_character", peer_id, local_player_id, melee_name, ranged_name)
	self:_select_character(peer_id, local_player_id, profile_index, career_index, melee_name, ranged_name)

	if self._is_server then
		local sender_peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self._network_transmit:send_rpc_clients_except("rpc_pre_game_select_character", sender_peer_id, peer_id, local_player_id, profile_index, career_index, melee_name_id, ranged_name_id)
	end
end
