-- chunkname: @scripts/managers/network/party_manager.lua

require("scripts/helpers/player_utils")

PartyManager = class(PartyManager)

local rpcs = {
	"rpc_request_join_party",
	"rpc_reset_party_data",
	"rpc_peer_assigned_to_party",
	"rpc_remove_peer_from_party",
	"rpc_set_client_friend_party",
}

local function debug_printf(format, ...)
	printf("[PartyManager] " .. format, ...)
end

PartyManager.init = function (self)
	self._leader = nil
	self._hot_join_synced_peers = {}

	self:clear_parties()

	if DEDICATED_SERVER then
		self._friend_parties = {}
		self._friend_party_lookup = {}
	else
		self._client_friend_party = {}
	end
end

PartyManager.destroy = function (self)
	if self._gui then
		local world = Application.debug_world()

		World.destroy_gui(world, self._gui)

		self._gui = nil
	end
end

PartyManager._free_lobby = function (self)
	if self._party_lobby_or_data ~= nil then
		debug_printf("Party lobby has been freed")

		if type(self._party_lobby_or_data) == "userdata" then
			LobbyInternal.leave_lobby(self._party_lobby_or_data)
		end

		self._party_lobby_or_data = nil
	end
end

PartyManager.reset = function ()
	debug_printf("reset")

	if Managers.party then
		Managers.party:destroy()
	end

	Managers.party = PartyManager:new()
end

PartyManager.set_leader = function (self, peer_id)
	if peer_id == nil then
		debug_printf("Cleared leader")
	else
		debug_printf("Leader set to %q", peer_id)
	end

	self._leader = peer_id
end

PartyManager.leader = function (self)
	return self._leader
end

PartyManager.is_leader = function (self, peer_id)
	return peer_id == self._leader
end

PartyManager.has_party_lobby = function (self)
	return self._party_lobby_or_data ~= nil
end

PartyManager.store_lobby = function (self, lobby_or_data)
	debug_printf("Party lobby has been stored '%s'", lobby_or_data)
	self:_free_lobby()

	self._party_lobby_or_data = lobby_or_data
end

PartyManager.steal_lobby = function (self)
	debug_printf("Party lobby has been stolen!")

	local lobby = self._party_lobby_or_data

	self._party_lobby_or_data = nil

	return lobby
end

PartyManager.clear_parties = function (self, sync_to_clients)
	debug_printf("Clear parties. sync_to_clients: %q", sync_to_clients)

	self._player_statuses = {}
	self._parties = {}
	self._game_participating_parties = {}
	self._party_by_name = {}
	self._num_parties = 0
	self._num_game_participating_parties = 0
	self._undecided_party = self:_register_party({
		game_participating = false,
		name = "undecided",
		num_open_slots = 0,
		num_slots = 16,
		party_id = 0,
		tags = {},
	})
	self._parties[0] = self._undecided_party
	self._cleared = true

	if sync_to_clients then
		self:_send_rpc_to_clients("rpc_reset_party_data")
	end
end

PartyManager.gather_party_members = function (self)
	local members = {}
	local party = self:get_local_player_party()

	if not party then
		return members
	end

	local occupied_slots = party.occupied_slots

	for slot_id, player_data in ipairs(occupied_slots) do
		members[#members + 1] = {
			peer_id = player_data.peer_id,
			local_player_id = player_data.local_player_id,
		}
	end

	return members
end

PartyManager._register_party = function (self, def)
	debug_printf("Register party. party_id: %q | name: %q | num_slots: %q", def.party_id, def.name, def.num_slots)

	local num_slots = def.num_slots
	local slots = {}
	local slots_data = {}

	for j = 1, num_slots do
		slots[j] = {
			game_mode_data = {},
		}
		slots_data[j] = {
			slot_id = j,
		}
	end

	local party = {
		num_bots = 0,
		num_used_slots = 0,
		party_id = def.party_id,
		name = def.name,
		game_participating = def.game_participating == nil and true or def.game_participating,
		num_open_slots = num_slots,
		num_slots = num_slots,
		slots = slots,
		occupied_slots = {},
		bot_add_order = {},
		slots_data = slots_data,
	}

	return party
end

PartyManager.max_party_members = function (self, party_definitions)
	local max_party_members = 0

	for _, party_def in pairs(party_definitions) do
		local num_slots = party_def.num_slots
		local game_participating = party_def.game_participating ~= false

		if game_participating and max_party_members < num_slots then
			max_party_members = num_slots
		end
	end

	return max_party_members
end

PartyManager.register_parties = function (self, party_definitions)
	debug_printf("Register parties")

	for party_name, def in pairs(party_definitions) do
		local party_id = def.party_id

		fassert(party_id ~= 0, "This party id is reserved for undecided party.")

		local party = self:_register_party(def)

		self._parties[party_id] = party
		self._party_by_name[party_name] = party
		self._num_parties = self._num_parties + 1

		if party.game_participating then
			self._num_game_participating_parties = self._num_game_participating_parties + 1
			self._game_participating_parties[party_id] = party
		end
	end

	local consecutive_game_participating = true

	for i = 1, self._num_parties do
		local party = self._parties[i]

		if party.game_participating then
			assert(consecutive_game_participating, "Game participating parties may not be separated by non participating ones.")
		else
			consecutive_game_participating = false
		end
	end

	self._cleared = false
end

PartyManager.cleared = function (self)
	return self._cleared
end

PartyManager._create_player_status = function (self, peer_id, local_player_id, is_bot)
	local unique_id = PlayerUtils.unique_player_id(peer_id, local_player_id)
	local statuses = self._player_statuses
	local status = {
		score = 0,
		peer_id = peer_id,
		local_player_id = local_player_id,
		unique_id = unique_id,
		is_bot = is_bot,
		is_player = not is_bot,
		game_mode_data = {},
	}

	fassert(not statuses[unique_id], "Player already connected peer_id=%s local_player_id%s", peer_id, local_player_id)

	statuses[unique_id] = status

	return status
end

PartyManager.register_player = function (self, player, unique_id)
	local status = self._player_statuses[unique_id]

	if not status then
		local peer_id = player:network_id()
		local local_player_id = player:local_player_id()

		status = self:_create_player_status(peer_id, local_player_id, false)
	end

	status.player = player
end

PartyManager.set_selected_profile = function (self, peer_id, local_player_id, profile_index, career_index)
	local status = self:get_player_status(peer_id, local_player_id)

	status.selected_profile_index = profile_index
	status.selected_career_index = career_index
	status.profile_index = profile_index
	status.career_index = career_index
end

PartyManager.cleanup_game_mode_data = function (self)
	for unique_id, status in pairs(self._player_statuses) do
		status.game_mode_data = {}
	end
end

PartyManager.register_rpcs = function (self, network_event_delegate)
	self._network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(rpcs))
end

PartyManager.unregister_rpcs = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil
end

PartyManager.update = function (self, t, dt)
	return
end

PartyManager.get_local_player_party = function (self)
	local player = Managers.player:local_player()

	if player then
		return self:get_party_from_unique_id(player:unique_id())
	end
end

PartyManager.get_party = function (self, party_id)
	return self._parties[party_id]
end

PartyManager.parties = function (self)
	return self._parties
end

PartyManager.game_participating_parties = function (self)
	return self._game_participating_parties
end

PartyManager.get_party_composition = function (self)
	local party_composition = {}

	for party_id, party in ipairs(self._parties) do
		local occupied_slots = party.occupied_slots

		for _, occupied_slot in ipairs(occupied_slots) do
			party_composition[occupied_slot.unique_id] = party.party_id
		end
	end

	return party_composition
end

PartyManager._slot_empty_in_party = function (self, party_id, slot_id)
	local party = self._parties[party_id]
	local status = party.slots[slot_id]
	local peer_id = status.peer_id

	return peer_id == nil
end

PartyManager.request_join_party = function (self, peer_id, local_player_id, party_id, optional_slot_id, optional_bot_player)
	if self._is_server then
		local party = self._parties[party_id]
		local slot_empty = true

		if optional_slot_id then
			slot_empty = self:_slot_empty_in_party(party_id, optional_slot_id)
		end

		if slot_empty then
			local mechanism_slot_id = Managers.mechanism:preferred_slot_id(party_id, peer_id, local_player_id)

			if mechanism_slot_id then
				if self:is_slot_bot(party, mechanism_slot_id) then
					local bot_peer_id, bot_local_player_id = self:slot_peer_id(party, mechanism_slot_id)
					local status = Managers.party:get_player_status(bot_peer_id, bot_local_player_id)

					self:remove_peer_from_party(status.peer_id, status.local_player_id, status.party_id)

					optional_slot_id = mechanism_slot_id
				elseif self:is_slot_empty(party, mechanism_slot_id) then
					optional_slot_id = mechanism_slot_id
				end
			end

			local is_bot = false

			if party.num_used_slots < party.num_slots then
				self:assign_peer_to_party(peer_id, local_player_id, party_id, optional_slot_id, is_bot)
			elseif party.num_bots > 0 then
				local status

				if optional_bot_player then
					local bot_peer_id = optional_bot_player:network_id()
					local bot_local_player_id = optional_bot_player:local_player_id()

					status = Managers.party:get_player_status(bot_peer_id, bot_local_player_id)
				else
					status = self:get_last_added_bot_for_party(party_id)
				end

				self:remove_peer_from_party(status.peer_id, status.local_player_id, status.party_id)
				self:assign_peer_to_party(peer_id, local_player_id, party_id, optional_slot_id, is_bot)
			end
		end
	else
		debug_printf("Sending request join party")

		optional_slot_id = optional_slot_id or NetworkConstants.INVALID_PARTY_SLOT_ID

		local channel_id = PEER_ID_TO_CHANNEL[self._server_peer_id]

		RPC.rpc_request_join_party(channel_id, peer_id, local_player_id, party_id, optional_slot_id)
	end
end

PartyManager.get_player_status = function (self, peer_id, local_player_id)
	local unique_id = PlayerUtils.unique_player_id(peer_id, local_player_id)
	local status = self._player_statuses[unique_id]

	return status
end

PartyManager.get_status_from_unique_id = function (self, unique_id)
	return self._player_statuses[unique_id]
end

PartyManager.get_party_from_player_id = function (self, peer_id, local_player_id)
	local unique_id = PlayerUtils.unique_player_id(peer_id, local_player_id)
	local status = self._player_statuses[unique_id]

	if status then
		local party_id = status.party_id

		return self._parties[party_id], party_id
	end
end

PartyManager.get_party_from_unique_id = function (self, unique_id)
	local status = self._player_statuses[unique_id]

	if status then
		local party_id = status.party_id

		return self._parties[party_id], party_id
	end
end

PartyManager.get_party_from_name = function (self, party_name)
	local parties = self._parties

	for i = 0, #parties do
		local party = parties[i]

		if party.name == party_name then
			return party
		end
	end
end

function update_status_profile_index(player_status)
	local state = Managers.state

	if not state then
		return
	end

	local network = state.network

	if not network then
		return
	end

	local profile_synchronizer = network.profile_synchronizer

	if not profile_synchronizer then
		return
	end

	local profile_index, career_index = profile_synchronizer:profile_by_peer(player_status.peer_id, player_status.local_player_id)

	player_status.profile_index = profile_index
	player_status.career_index = career_index
	player_status.profile_id = profile_index and SPProfiles[profile_index].display_name
end

PartyManager.get_num_parties = function (self)
	return self._num_parties
end

PartyManager.get_num_game_participating_parties = function (self)
	return self._num_game_participating_parties
end

PartyManager.is_game_participating = function (self, party_id)
	return self._parties[party_id].game_participating
end

PartyManager.assign_peer_to_party = function (self, peer_id, local_player_id, wanted_party_id, optional_slot_id, is_bot)
	is_bot = not not is_bot

	local unique_id = PlayerUtils.unique_player_id(peer_id, local_player_id)
	local existing_player = true
	local player_status = self._player_statuses[unique_id]

	if not player_status then
		player_status = self:_create_player_status(peer_id, local_player_id, is_bot)
		existing_player = false
	end

	local old_party_id

	if existing_player and player_status.party_id then
		old_party_id = player_status.party_id

		local old_party = self._parties[old_party_id]
		local old_slot_id = player_status.slot_id
		local old_is_bot = player_status.is_bot

		self:_clear_slot_in_party(old_party, old_slot_id, old_is_bot)
	end

	update_status_profile_index(player_status)

	local party = wanted_party_id and self._parties[wanted_party_id] or self._undecided_party
	local party_id = wanted_party_id or 0

	debug_printf("Player (%s:%d) was put into party %s (%d)", peer_id, local_player_id, party.name, party_id)

	local slot_id = optional_slot_id or self:find_first_empty_slot_id(party)

	if PartyManager._find_slot_index(party, slot_id) then
		slot_id = nil
	end

	party.slots[slot_id] = player_status
	party.occupied_slots[#party.occupied_slots + 1] = player_status
	player_status.party_id = party_id
	player_status.slot_id = slot_id
	party.num_used_slots = party.num_used_slots + 1
	party.num_open_slots = party.num_slots - party.num_used_slots

	if is_bot then
		party.num_bots = party.num_bots + 1
		party.bot_add_order[party.num_bots] = slot_id
	end

	if self._is_server then
		debug_printf("Sending 'rpc_peer_assigned_to_party'")
		self:_send_rpc_to_clients("rpc_peer_assigned_to_party", peer_id, local_player_id, party_id, slot_id, is_bot)
	end

	local player = Managers.player:player(peer_id, local_player_id)
	local is_local_player = player and player.local_player

	Managers.state.event:trigger("player_party_changed", player, is_local_player, old_party_id, party_id)

	if Managers.state.game_mode then
		Managers.state.game_mode:player_joined_party(peer_id, local_player_id, party_id, slot_id, old_party_id)
	end

	if Managers.state.event then
		Managers.state.event:trigger("on_player_joined_party", peer_id, local_player_id, party_id, slot_id)
	end

	Managers.mechanism:player_joined_party(peer_id, local_player_id, party_id, slot_id)

	return player_status
end

PartyManager.remove_peer_from_party = function (self, peer_id, local_player_id, party_id)
	local player_status = self:get_player_status(peer_id, local_player_id)

	if not player_status then
		return
	end

	local party = self._parties[party_id]
	local slot_id = player_status.slot_id
	local old_slot_data = party.slots[slot_id]

	if self._is_server then
		self:_send_rpc_to_clients("rpc_remove_peer_from_party", peer_id, local_player_id, party_id)
	end

	self:_clear_slot_in_party(party, player_status.slot_id, player_status.is_bot)

	if Managers.state.game_mode then
		Managers.state.game_mode:player_left_party(peer_id, local_player_id, party_id, slot_id, old_slot_data)
	end

	if Managers.state.event then
		local slot_id = player_status.slot_id

		Managers.state.event:trigger("on_player_left_party", peer_id, local_player_id, party_id, slot_id)
	end

	player_status.party_id = nil
	player_status.slot_id = nil
end

local player_statuses = {}

PartyManager.get_players_in_party = function (self, party_id)
	table.clear(player_statuses)

	local index = 0

	for unique_id, status in pairs(self._player_statuses) do
		if status.party_id == party_id then
			index = index + 1
			player_statuses[index] = status
		end
	end

	return player_statuses, index
end

PartyManager._find_slot_index = function (party, slot_id)
	local slot_index
	local occupied_slots = party.occupied_slots

	for i = 1, #occupied_slots do
		local status = occupied_slots[i]

		if status.slot_id == slot_id then
			slot_index = i

			break
		end
	end

	return slot_index
end

PartyManager._clear_slot_in_party = function (self, party, slot_id, is_bot)
	party.slots[slot_id] = {}

	local slot_index = PartyManager._find_slot_index(party, slot_id)

	fassert(slot_index ~= nil, "could not find player status in occupied_slots")

	local occupied_slots = party.occupied_slots
	local num_used_slots = party.num_used_slots
	local last = occupied_slots[num_used_slots]

	occupied_slots[slot_index] = last
	occupied_slots[num_used_slots] = nil
	party.num_used_slots = num_used_slots - 1
	party.num_open_slots = party.num_slots - party.num_used_slots

	if is_bot then
		party.num_bots = party.num_bots - 1

		local add_order = table.find(party.bot_add_order, slot_id)

		table.remove(party.bot_add_order, add_order)
	end
end

PartyManager.is_slot_empty = function (self, party, slot_id)
	local slots = party.slots

	return slots[slot_id] == nil or slots[slot_id].peer_id == nil
end

PartyManager.is_slot_bot = function (self, party, slot_id)
	local slot = party.slots[slot_id]

	return slot and slot.is_bot
end

PartyManager.slot_peer_id = function (self, party, slot_id)
	local slot = party.slots[slot_id]

	if slot then
		return slot.peer_id, slot.local_player_id
	end

	return nil, nil
end

PartyManager.find_first_empty_slot_id = function (self, party)
	local num_slots = party.num_slots

	for i = 1, num_slots do
		if self:is_slot_empty(party, i) then
			return i
		end
	end

	ferror("No empty slot in party %s", party.name)
end

PartyManager.get_least_filled_party = function (self, ignore_bots, ignore_none_game_participating_party)
	local parties = self._parties

	fassert(#parties > 1, "parties has not been initialized yet")

	local best_party_id = 0
	local count = math.huge

	for i = 1, #parties do
		local party = parties[i]

		if not ignore_none_game_participating_party or party.game_participating then
			local num_used_slots = party.num_used_slots

			if ignore_bots then
				num_used_slots = num_used_slots - party.num_bots
			end

			if num_used_slots < count then
				best_party_id = i
				count = num_used_slots
			end
		end
	end

	return parties[best_party_id], best_party_id
end

PartyManager.is_party_full = function (self, party_id)
	local party = self._parties[party_id]
	local num_open_slots = party.num_open_slots + party.num_bots

	return num_open_slots == 0
end

PartyManager.is_player_in_party = function (self, unique_id, party_id)
	local party = self._parties[party_id]
	local player_status = self._player_statuses[unique_id]

	return party_id == player_status.party_id
end

PartyManager.get_last_added_bot_for_party = function (self, party_id)
	local party = self._parties[party_id]
	local slot_id = party.bot_add_order[party.num_bots]
	local status = party.slots[slot_id]

	return status
end

PartyManager.hot_join_sync = function (self, peer_id)
	local parties = self._parties
	local channel_id = PEER_ID_TO_CHANNEL[peer_id]

	for party_id = 0, #parties do
		local party = parties[party_id]
		local occupied_slots = party.occupied_slots

		for i = 1, #occupied_slots do
			local status = occupied_slots[i]
			local slot_peer_id = status.peer_id
			local slot_local_player_id = status.local_player_id
			local is_bot = status.is_bot
			local slot_id = status.slot_id

			RPC.rpc_peer_assigned_to_party(channel_id, slot_peer_id, slot_local_player_id, party_id, slot_id, is_bot)
		end
	end
end

PartyManager._send_rpc_to_clients = function (self, rpc_name, ...)
	local rpc = RPC[rpc_name]
	local server_peer_id = self._server_peer_id

	for peer_id, synced in pairs(self._hot_join_synced_peers) do
		if peer_id ~= server_peer_id and synced then
			local channel_id = PEER_ID_TO_CHANNEL[peer_id]

			rpc(channel_id, ...)
		end
	end
end

PartyManager.network_context_created = function (self, lobby, server_peer_id, own_peer_id)
	debug_printf("network_context_created (server_peer_id=%s, own_peer_id=%s)", server_peer_id, own_peer_id)

	self._lobby = lobby
	self._server_peer_id = server_peer_id
	self._peer_id = own_peer_id

	local is_server = server_peer_id == own_peer_id

	self._is_server = is_server
end

PartyManager.parties_by_name = function (self)
	return self._party_by_name
end

PartyManager.network_context_destroyed = function (self)
	debug_printf("network_context_created")

	self._lobby = nil
	self._server_peer_id = nil
	self._peer_id = nil
	self._is_server = nil
	self._hot_join_synced_peers = {}

	self:clear_parties()
end

PartyManager.server_peer_hot_join_synced = function (self, peer_id)
	self._hot_join_synced_peers[peer_id] = true
end

PartyManager.server_peer_left_session = function (self, peer_id, approved_for_joining, peer_state)
	self._hot_join_synced_peers[peer_id] = false

	local parties = self._parties

	for party_id = 0, #parties do
		local party = parties[party_id]
		local slots = party.slots
		local num_slots = party.num_slots

		for i = 1, num_slots do
			local status = slots[i]

			if status.peer_id == peer_id then
				self:remove_peer_from_party(status.peer_id, status.local_player_id, party_id)
			end
		end
	end

	Managers.state.event:trigger("friend_party_peer_left", peer_id, approved_for_joining, peer_state)
end

PartyManager.rpc_request_join_party = function (self, channel_id, peer_id, local_player_id, party_id, optional_slot_id)
	printf("Recieved join party request from %s - %s party_id(%s)", peer_id, local_player_id, party_id)

	if optional_slot_id == NetworkConstants.INVALID_PARTY_SLOT_ID then
		optional_slot_id = nil
	end

	self:request_join_party(peer_id, local_player_id, party_id, optional_slot_id)
end

PartyManager.rpc_peer_assigned_to_party = function (self, channel_id, peer_id, local_player_id, party_id, slot_id, is_bot)
	debug_printf("rpc_peer_assigned_to_party. channel_id: %q | peer_id: %q | local_player_id: %q | party_id: %q | slot_id: %q | is_bot: %q", channel_id, peer_id, local_player_id, party_id, slot_id, is_bot)
	self:assign_peer_to_party(peer_id, local_player_id, party_id, slot_id, is_bot)
end

PartyManager.rpc_remove_peer_from_party = function (self, channel_id, peer_id, local_player_id, party_id)
	debug_printf("rpc_remove_peer_from_party. channel_id: %q | peer_id: %q | local_player_id: %q | party_id: %q", channel_id, peer_id, local_player_id, party_id)
	self:remove_peer_from_party(peer_id, local_player_id, party_id)
end

PartyManager.rpc_set_client_friend_party = function (self, channel_id, peers)
	for i = 1, #peers do
		if peers[i] == "" then
			peers[i] = nil
		end
	end

	self:_client_set_friend_party(peers)
end

PartyManager.rpc_reset_party_data = function (self)
	self:clear_parties()
	Managers.mechanism:setup_mechanism_parties()
end

PartyManager._draw_debug = function (self, t)
	local font = "materials/fonts/arial"
	local font_material = "arial"
	local text_height = 20
	local row_height = 20
	local margin = 32
	local peer_width = 180
	local state_width = 160
	local profile_width = 90
	local win_width = 2 * margin + peer_width + state_width + profile_width
	local is_server = Managers.player.is_server
	local background_color = Color(128, 0, 0, 0)
	local text_color = Color(255, 255, 255, 255)
	local text_color2 = Color(255, 128, 255, 255)
	local party_header_color = Color(255, 155, 155, 255)
	local game_mode_color = Color(255, 155, 255, 155)
	local mechanism_color = Color(255, 55, 155, 156)
	local server_color = is_server and Color(255, 255, 255, 0) or Color(255, 55, 126, 255)
	local width, height = Gui.resolution()
	local y = height - margin - text_height
	local win_start_x = width - win_width

	if self._gui == nil then
		local world = Application.debug_world()

		self._gui = World.create_screen_gui(world, "immediate", "material", "materials/fonts/gw_fonts")
	end

	Gui.rect(self._gui, Vector2(win_start_x, 0), Vector2(win_width, height), background_color)

	local server_text = is_server and "(Server)" or "(Client)"

	Gui.text(self._gui, server_text, font, text_height, font_material, Vector3(win_start_x + win_width - 80, y, 0), server_color)

	local mechanism_key = Managers.mechanism:current_mechanism_name()
	local mechanism_state = Managers.mechanism:game_mechanism():get_state()
	local info1 = string.format("Mechanism:'%s', state:'%s'", mechanism_key, mechanism_state)

	Gui.text(self._gui, info1, font, text_height, font_material, Vector3(win_start_x + margin, y, 0), mechanism_color)

	y = y - row_height

	local game_mode = Managers.state.game_mode:game_mode()
	local game_mode_name = game_mode and game_mode:settings().key or "none"
	local level_seed = Managers.mechanism:get_level_seed()
	local info2 = string.format("Game mode: '%s', seed: %s", game_mode_name, tostring(level_seed))

	Gui.text(self._gui, info2, font, text_height, font_material, Vector3(win_start_x + margin, y, 0), game_mode_color)

	y = y - row_height

	local info3 = string.format("    state: '%s' max: %s", game_mode:game_mode_state(), Managers.lobby._network_options.max_members)

	Gui.text(self._gui, info3, font, text_height, font_material, Vector3(win_start_x + margin, y, 0), game_mode_color)

	y = y - row_height * 2

	local mechanism = Managers.mechanism:game_mechanism()

	if mechanism.win_conditions then
		local game_mode_manager = Managers.state.game_mode
		local game_mode = game_mode_manager:game_mode()

		if game_mode.round_id then
			local win_conditions = mechanism:win_conditions()
			local current_set = mechanism:get_current_set()
			local num_sets = mechanism:num_sets()
			local num_rounds_played = mechanism:total_rounds_started()
			local info = string.format("Set: %s/%s --> round: %d/2, round_id: %d", current_set, num_sets, tostring(game_mode:round_id() or -1), num_rounds_played)

			Gui.text(self._gui, info, font, text_height, font_material, Vector3(win_start_x + margin, y, 0), game_mode_color)

			y = y - row_height

			local small_txt_height = 14

			for set_id = 1, num_sets do
				y = y - small_txt_height / 2

				local current_set_string = set_id == current_set and "(current set)" or ""
				local set_string = string.format("Set %s  %s", set_id, current_set_string)

				Gui.text(self._gui, set_string, font, small_txt_height, font_material, Vector3(win_start_x + margin, y, 0), Color(255, 220, 200, 0))

				y = y - small_txt_height - 4

				for party_id = 1, 2 do
					local set_data = win_conditions:set_data(party_id)
					local data = set_data[set_id]

					if data then
						local dist_str = ""

						if data.distance_traveled > 0 then
							dist_str = string.format("dist: %.1f%%", data.distance_traveled * 100)
						end

						local info = string.format("Party %s -> Score: %s/%s(%s) %s", party_id, data.claimed_points, tostring(data.max_points), data.unclaimed_points, dist_str)

						Gui.text(self._gui, info, font, small_txt_height, font_material, Vector3(win_start_x + margin, y, 0), game_mode_color)
					end

					y = y - small_txt_height - 4
				end
			end

			y = y - small_txt_height - 4
		end
	end

	local parties = self._parties

	for i = 0, #parties do
		local party = parties[i]
		local x = win_start_x + margin

		Gui.text(self._gui, "Party " .. tostring(party.party_id), font, text_height, font_material, Vector3(x, y, 0), party_header_color)

		x = x + peer_width

		local side = Managers.state.side.side_by_party[party]
		local num_units = side and side._num_units or 0
		local num_enemy_units = side and side._num_enemy_units or 0

		Gui.text(self._gui, string.format("(%d/%d) units(%d) enemies(%d)", party.num_used_slots, party.num_slots, num_units, num_enemy_units), font, text_height, font_material, Vector3(x, y, 0), party_header_color)

		y = y - row_height
		x = win_start_x + margin

		Gui.text(self._gui, "Peer", font, text_height, font_material, Vector3(x, y, 0), text_color)

		x = x + peer_width

		Gui.text(self._gui, "State", font, text_height, font_material, Vector3(x, y, 0), text_color)

		x = x + state_width

		Gui.text(self._gui, "Info", font, text_height, font_material, Vector3(x, y, 0), text_color)

		y = y - 4

		Gui.rect(self._gui, Vector2(win_start_x + margin, y), Vector2(peer_width + state_width + profile_width, 1), text_color)

		y = y - row_height

		local occupied_slots = party.occupied_slots

		for i = 1, #occupied_slots do
			local status = occupied_slots[i]
			local data = status.game_mode_data
			local timer = data.spawn_state == "w8_to_spawn" and status.game_mode_data.spawn_timer and string.format("%.1f", status.game_mode_data.spawn_timer - t) or ""
			local state = string.format("%s %s", status.game_mode_data.spawn_state or "?", timer)
			local peer = status.peer_id
			local profile_id = status.profile_id
			local profile_index = status.profile_index
			local career_index = status.career_index
			local row2_text = string.format("P/C: %s-%s/%s", tostring(profile_id), tostring(profile_index), tostring(career_index))
			local info = "-"
			local player_controlled = "?"
			local player = status.player

			if player then
				player_controlled = player:is_player_controlled() and "P" or "B"
				info = "1"

				local player_unit = player.player_unit
				local breed

				if player_unit then
					breed = Unit.get_data(player_unit, "breed")
					info = breed and breed.hit_zones_lookup ~= nil and "L" or "2"
				else
					info = next(player.owned_units) and "P" or "?"
				end
			end

			info = player_controlled .. info
			x = win_start_x + margin

			Gui.text(self._gui, peer, font, text_height, font_material, Vector3(x, y, 0), text_color)

			x = x + peer_width

			Gui.text(self._gui, tostring(state), font, text_height, font_material, Vector3(x, y, 0), text_color)

			x = x + state_width

			Gui.text(self._gui, info, font, text_height, font_material, Vector3(x, y, 0), text_color)

			y = y - row_height
			x = win_start_x + margin

			Gui.text(self._gui, tostring(row2_text), font, text_height, font_material, Vector3(x, y, 0), text_color2)

			y = y - row_height
		end

		y = y - row_height * 2
	end
end

PartyManager.any_party_has_free_slots = function (self, num_slots)
	num_slots = num_slots or 1

	local parties = self._parties

	for i = 1, #parties do
		local party = parties[i]
		local num_open_slots = party.num_open_slots + party.num_bots

		if num_slots <= num_open_slots then
			return true
		end
	end

	return false
end

PartyManager.server_update_all_client_friend_parties = function (self)
	for friend_party_id, friend_party in pairs(self._friend_parties) do
		self:_server_set_client_friend_party(friend_party_id)
	end
end

PartyManager.server_create_friend_party = function (self, peers, leader, override_party_id)
	if peers[1] ~= leader then
		for i = 1, #peers do
			if peers[i] == leader then
				peers[i] = peers[1]
				peers[1] = leader

				break
			end
		end
	end

	local friend_party_id = override_party_id or self:_server_generate_friend_party_id()

	self._friend_parties[friend_party_id] = {
		leader = leader,
		peers = peers,
		num_peers = #peers,
	}

	for i = 1, #peers do
		self._friend_party_lookup[peers[i]] = friend_party_id
	end
end

PartyManager.server_remove_friend_party_peer = function (self, peer_id)
	local friend_party_id = self._friend_party_lookup[peer_id]

	self._friend_party_lookup[peer_id] = nil

	if not friend_party_id then
		return
	end

	local party = self._friend_parties[friend_party_id]

	assert(party, "[Party Manager: server_remove_friend_party_peer] tried to remove friend party peer " .. peer_id .. " from non-existant party with id " .. friend_party_id)

	if party.num_peers == 1 then
		self:_server_remove_friend_party(friend_party_id)

		return
	end

	for i = 1, party.num_peers do
		if party.peers[i] == peer_id then
			table.swap_delete(party.peers, i)

			break
		end
	end

	party.num_peers = party.num_peers - 1
	party.leader = party.peers[1]
end

PartyManager.server_add_friend_party_peer = function (self, friend_party_id, peer_id)
	local friend_party = self._friend_parties[friend_party_id]

	friend_party.num_peers = friend_party.num_peers + 1
	friend_party.peers[friend_party.num_peers] = peer_id
end

PartyManager.server_add_friend_party_peer_from_invitee = function (self, peer_id, invitee)
	local friend_party_id = self._friend_party_lookup[invitee]

	if friend_party_id then
		self:server_add_friend_party_peer(friend_party_id, peer_id)
	end
end

PartyManager.server_get_friend_party_id_from_peer = function (self, peer_id)
	return self._friend_party_lookup[peer_id]
end

PartyManager.server_get_friend_party = function (self, friend_party_id)
	return self._friend_parties[friend_party_id]
end

PartyManager.server_get_friend_parties_sorted = function (self)
	local friend_parties_sorted = {}
	local i = 1

	for _, friend_party in pairs(self._friend_parties) do
		friend_parties_sorted[i] = friend_party
		i = i + 1
	end

	table.sort(friend_parties_sorted, function (a, b)
		return a.num_peers > b.num_peers
	end)

	return friend_parties_sorted
end

PartyManager.server_has_room_for_friend_party = function (self, reserved_slots, num_peers)
	local num_parties = #self:parties()
	local fake_friend_party = FrameTable.alloc_table()

	fake_friend_party.num_peers = num_peers

	local friend_parties = table.values(self._friend_parties, FrameTable.alloc_table())

	friend_parties[#friend_parties + 1] = fake_friend_party

	table.sort(friend_parties, function (a, b)
		return a.num_peers > b.num_peers
	end)

	local party_count = Script.new_array(num_parties)

	table.fill(party_count, num_parties, 0)

	for i = 1, #friend_parties do
		local friend_party = friend_parties[i]
		local best_party_id, most_room = nil, 0

		for party_id = 1, num_parties do
			if self:is_game_participating(party_id) then
				local room = #reserved_slots[party_id] - party_count[party_id]

				if most_room < room then
					best_party_id = party_id
					most_room = room
				end
			end
		end

		if not best_party_id then
			return false
		end

		party_count[best_party_id] = party_count[best_party_id] + friend_party.num_peers

		if party_count[best_party_id] > #reserved_slots[best_party_id] then
			return false
		end
	end

	return true
end

PartyManager.can_kick_to_fill_server = function (self, reserved_slots, num_peers)
	local num_parties = #self:parties()
	local fake_friend_party = FrameTable.alloc_table()

	fake_friend_party.num_peers = num_peers

	local friend_parties = table.values(self._friend_parties, FrameTable.alloc_table())

	friend_parties[#friend_parties + 1] = fake_friend_party

	table.sort(friend_parties, function (a, b)
		return a.num_peers > b.num_peers
	end)

	local party_count = Script.new_array(num_parties)

	table.fill(party_count, num_parties, 0)

	local parties_to_kick = FrameTable.alloc_table()

	for i = 1, #friend_parties do
		local best_party_id, most_room = nil, 0

		for party_id = 1, num_parties do
			if self:is_game_participating(party_id) then
				local room = #reserved_slots[party_id] - party_count[party_id]

				if most_room < room then
					best_party_id = party_id
					most_room = room
				end
			end
		end

		local friend_party = friend_parties[i]
		local num_party_members = friend_party.num_peers

		if most_room < num_party_members then
			if friend_party == fake_friend_party then
				return false
			end

			parties_to_kick[#parties_to_kick + 1] = friend_party
		else
			party_count[best_party_id] = party_count[best_party_id] + num_party_members
		end
	end

	for party_id = 1, num_parties do
		if self:is_game_participating(party_id) and party_count[party_id] ~= #reserved_slots[party_id] then
			return false
		end
	end

	return parties_to_kick
end

PartyManager._server_generate_friend_party_id = function (self)
	if not self._num_friend_party_ids then
		self._num_friend_party_ids = 0
	end

	self._num_friend_party_ids = self._num_friend_party_ids + 1

	return self._num_friend_party_ids
end

PartyManager._server_remove_friend_party = function (self, friend_party_id)
	self._friend_parties[friend_party_id] = nil
end

PartyManager._server_set_client_friend_party = function (self, friend_party_id)
	local friend_party = self._friend_parties[friend_party_id]

	assert(friend_party, "[Party Manager:server_update_client_friend_parties()] tried to update client friend parties of nonexistant friend party id " .. friend_party_id)

	local max_friend_party_size = 4
	local friend_party_peers = Script.new_array(max_friend_party_size)
	local peers = friend_party.peers
	local num_party_peers = #peers

	if max_friend_party_size < num_party_peers then
		table.dump(peers, "friend party peers")
		Crashify.print_exception("[PartyManager]", "Friend party stragglers found. Party size: %s", num_party_peers)
	end

	for i = 1, num_party_peers do
		local peer = peers[i]

		if PEER_ID_TO_CHANNEL[peer] then
			local next_idx = #friend_party_peers + 1

			if max_friend_party_size < next_idx then
				print("Too many peers in the same party:", peer)
			else
				friend_party_peers[next_idx] = peers[i]
			end
		end
	end

	for i = #friend_party_peers + 1, max_friend_party_size do
		friend_party_peers[i] = ""
	end

	self:_server_send_rpc_to_friend_party("rpc_set_client_friend_party", friend_party_id, friend_party_peers)
end

PartyManager._server_send_rpc_to_friend_party = function (self, rpc_name, friend_party_id, ...)
	local friend_party = self._friend_parties[friend_party_id]

	for _, peer_id in pairs(friend_party.peers) do
		local channel_id = PEER_ID_TO_CHANNEL[peer_id]

		if channel_id then
			RPC[rpc_name](channel_id, ...)
		end
	end
end

PartyManager._client_set_friend_party = function (self, peers)
	self._client_friend_party = peers
end

PartyManager.client_get_friend_party = function (self)
	return self._client_friend_party
end

PartyManager.client_is_friend_party_leader = function (self, peer_id)
	return self._client_friend_party and self._client_friend_party[1] == peer_id
end
