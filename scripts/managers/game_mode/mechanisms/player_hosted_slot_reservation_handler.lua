-- chunkname: @scripts/managers/game_mode/mechanisms/player_hosted_slot_reservation_handler.lua

PlayerHostedSlotReservationHandler = class(PlayerHostedSlotReservationHandler)

local VERBOSE_LOG = true
local empty_party_slot = {
	reserved = false,
}

PlayerHostedSlotReservationHandler.init = function (self, mechanism_manager, party_settings)
	self._group_leaders = {}

	self:update_slot_settings(party_settings)

	self._party_manager = Managers.party
	self._pending_peer_informations = {}

	Managers.persistent_event:register(self, "network_match_changed", "_on_network_match_changed")
	Managers.persistent_event:register(self, "network_match_terminated", "_on_network_match_terminated")
	Managers.persistent_event:register(self, "new_network_match_synced", "_on_new_network_match_synced")
	printf("[PlayerHostedSlotReservationHandler] Created")

	self._synced = false

	local network_handler = mechanism_manager:network_handler()

	if network_handler then
		self:request_slot_reservation_sync()

		if network_handler.is_server then
			self:try_reserve_slots(Network.peer_id(), network_handler:active_peers())
		end
	end

	self._dangling_peers = {}
end

PlayerHostedSlotReservationHandler.update_slot_settings = function (self, party_settings)
	self._max_party_slots = 0
	self._num_slots_total = 0
	self._peer_id_to_party_id = self._peer_id_to_party_id or {}
	self._reserved_peers = self._reserved_peers or {}

	for _, party_data in pairs(party_settings) do
		if party_data.game_participating then
			local party_id = party_data.party_id
			local num_slots = party_data.num_slots

			self:_expand(party_id, num_slots)

			for i = 1, #self._reserved_peers[party_id] do
				local slot_data = self._reserved_peers[party_id][i]

				if slot_data and slot_data.reserved then
					self._peer_id_to_party_id[slot_data.peer_id] = party_id
				end
			end
		end
	end

	local dangling_peers = {}

	for party_id = #party_settings + 1, #self._reserved_peers do
		local party_data = self._reserved_peers[party_id]

		for slot_i = 1, #party_data do
			local slot_data = party_data[slot_i]

			if slot_data.reserved then
				local peer_id = slot_data.peer_id

				dangling_peers[#dangling_peers + 1] = peer_id
			end
		end
	end

	local num_dangling = #dangling_peers

	for i = 1, num_dangling do
		local peer_id = dangling_peers[i]
		local found = false

		for party_id = 1, #party_settings do
			local party_data = self._reserved_peers[party_id]

			for slot_i = 1, #party_data do
				local slot_data = party_data[slot_i]

				if not slot_data.reserved then
					local skip_sync = i < num_dangling

					self:move_player(peer_id, party_id, skip_sync)

					found = true

					break
				end
			end

			if found then
				break
			end
		end
	end

	for party_id = #party_settings + 1, #self._reserved_peers do
		assert(table.is_empty(table.select_array(self._reserved_peers, function (_, slot_data)
			return slot_data.peer_id
		end)), "[PlayerHostedSlotReservationHandler] Dangling peers remain in the slot reservation handler")

		self._reserved_peers[party_id] = nil
		self._num_slots_per_party[party_id] = nil

		if VERBOSE_LOG then
			printf("[PlayerHostedSlotReservationHandler] Shrinking reserved peers. Removing party %s", party_id)
		end
	end
end

PlayerHostedSlotReservationHandler._recalculate_slots = function (self)
	self._num_slots_total = 0
	self._max_party_slots = 0
	self._num_slots_per_party = {}

	local reserved_peers = self._reserved_peers

	for party_id = 1, #reserved_peers do
		local party_data = reserved_peers[party_id]
		local num_slots = #party_data

		self._num_slots_total = self._num_slots_total + num_slots
		self._num_slots_per_party[party_id] = num_slots

		if num_slots > self._max_party_slots then
			self._max_party_slots = num_slots
		end
	end
end

PlayerHostedSlotReservationHandler._expand = function (self, min_party_id, min_wanted_slots)
	local reserved_peers = self._reserved_peers

	for i = #reserved_peers + 1, min_party_id do
		if VERBOSE_LOG then
			printf("[PlayerHostedSlotReservationHandler] Expanding. Adding party %s", i)
		end

		reserved_peers[i] = {}
	end

	local party_data = reserved_peers[min_party_id]

	for i = #party_data + 1, min_wanted_slots do
		if VERBOSE_LOG then
			printf("[PlayerHostedSlotReservationHandler] Expanding. Adding slot %s in party %s", i, min_party_id)
		end

		party_data[i] = table.clone(empty_party_slot)
	end

	self:_recalculate_slots()
end

PlayerHostedSlotReservationHandler.handle_dangling_peers = function (self)
	if table.is_empty(self._dangling_peers) then
		return
	end

	local network_server = Managers.mechanism:network_handler()
	local t = Managers.time:time("main")

	for peer_id, force_disconnect_at_t in pairs(self._dangling_peers) do
		if force_disconnect_at_t < t then
			network_server:force_disconnect_client_by_peer_id(peer_id)

			self._dangling_peers[peer_id] = nil
		end
	end
end

PlayerHostedSlotReservationHandler.shrink = function (self)
	local force_disconnect_at_t = Managers.time:time("main") + 2

	for party_id, slots in pairs(self._reserved_peers) do
		for slot_id, slot_data in pairs(slots) do
			if slot_data.reserved and slot_data.friend_party_leader ~= Network.peer_id() then
				local peer_id = slot_data.peer_id

				self:_remove_peer_reservation(peer_id)

				self._dangling_peers[peer_id] = force_disconnect_at_t
			end
		end
	end

	self:update_slot_settings({
		self._party_manager:parties()[1],
	})
end

PlayerHostedSlotReservationHandler.num_slots_total = function (self)
	return self._num_slots_total
end

PlayerHostedSlotReservationHandler.max_party_slots = function (self)
	return self._max_party_slots
end

PlayerHostedSlotReservationHandler.try_reserve_slots = function (self, group_leader_peer_id, peers_to_reserve, invitee)
	local reserved = false
	local selected_party_id

	if table.is_empty(peers_to_reserve) then
		printf("[PlayerHostedSlotReservationHandler] Tried to reserve slots for peer %s, but no peers were provided", group_leader_peer_id)

		return reserved, selected_party_id
	end

	if invitee then
		group_leader_peer_id = invitee
	end

	local filtered_peers_to_reserve = self:_filter_already_reserved_peers(peers_to_reserve)

	if table.is_empty(filtered_peers_to_reserve) then
		reserved = true
		selected_party_id = self._peer_id_to_party_id[group_leader_peer_id]

		printf("[PlayerHostedSlotReservationHandler] Attempted to reserve peers (%s), but they were already in party %s", table.concat(peers_to_reserve, ", "), selected_party_id)

		return reserved, selected_party_id
	end

	local num_to_reserve = #filtered_peers_to_reserve
	local max_free_slots = 0

	for party_id, _ in ipairs(self._reserved_peers) do
		local free_slots = self:_num_free_slots_in_party(party_id)

		if num_to_reserve <= free_slots and max_free_slots < free_slots then
			selected_party_id = party_id
			max_free_slots = free_slots
		end
	end

	if selected_party_id then
		if Managers.mechanism:game_mechanism():is_hosting_versus_custom_game() then
			if invitee then
				self._party_manager:server_add_friend_party_peer_from_invitee(group_leader_peer_id, invitee)
			else
				self._party_manager:server_create_friend_party(peers_to_reserve, group_leader_peer_id)
			end

			self._party_manager:sync_friend_party_ids()
		end

		local friend_party_id = self._party_manager:get_friend_party_id_from_peer(group_leader_peer_id)

		for i = 1, #filtered_peers_to_reserve do
			for slot_id, slot_data in pairs(self._reserved_peers[selected_party_id]) do
				local peer_id = filtered_peers_to_reserve[i]

				if not slot_data.reserved then
					self:_write_party_slot(slot_data, peer_id, friend_party_id, group_leader_peer_id, selected_party_id)

					break
				end
			end
		end

		reserved = true
	else
		printf("[PlayerHostedSlotReservationHandler] Failed to reserve slot for peers (%s).", table.concat(filtered_peers_to_reserve))
		table.dump(self._reserved_peers, "Reserved Peers", 2)
	end

	if reserved then
		self:_update_reservations()
	end

	return reserved, selected_party_id
end

PlayerHostedSlotReservationHandler._filter_already_reserved_peers = function (self, peers)
	local copy

	for i = #peers, 1, -1 do
		if self:has_reservation(peers[i]) then
			copy = copy or table.shallow_copy(peers, true)

			table.remove(copy, i)
		end
	end

	return copy or peers
end

PlayerHostedSlotReservationHandler._num_free_slots_in_party = function (self, party_id)
	local num_free_slots = 0

	for slot_id, slot_data in pairs(self._reserved_peers[party_id]) do
		if not slot_data.reserved then
			num_free_slots = num_free_slots + 1
		end
	end

	return num_free_slots
end

PlayerHostedSlotReservationHandler._update_reservations = function (self)
	local reserved_slots = 0
	local start_bit = 0
	local printable_value = ""

	for party_id, slots in ipairs(self._reserved_peers) do
		local num_slots = self._num_slots_per_party[party_id]
		local num_peers = num_slots - self:_num_free_slots_in_party(party_id)

		for i = 1, num_peers do
			reserved_slots = bit.bor(reserved_slots, bit.lshift(1, start_bit + (i - 1)))
			printable_value = printable_value .. "1"
		end

		for i = num_peers + 1, num_slots do
			printable_value = printable_value .. "0"
		end

		start_bit = start_bit + num_slots
	end

	print("[PlayerHostedSlotReservationHandler] updating reservations. slots:", printable_value, reserved_slots)

	local network_manager = Managers.state.network

	if network_manager then
		self._dirty_reserved_slots = nil

		local lobby = network_manager:lobby()

		self:_update_lobby_data(lobby, reserved_slots)

		self._lobby_data_sync_requested = true
	else
		self._dirty_reserved_slots = reserved_slots
	end

	self:_send_peer_updates_to_clients()
end

PlayerHostedSlotReservationHandler.remove_peer_reservations = function (self, peer_id, force_remove_peers)
	local peers_to_remove = self._group_leaders[peer_id]

	if peers_to_remove then
		if not force_remove_peers then
			local leader_peer_id = peer_id

			for remove_peer_id in pairs(peers_to_remove) do
				if remove_peer_id ~= leader_peer_id then
					if PEER_ID_TO_CHANNEL[remove_peer_id] then
						peers_to_remove[remove_peer_id] = nil
					else
						printf("[PlayerHostedSlotReservationHandler] Removing peer %s since they are in a party with peer %s and we don't have a connection to them.", remove_peer_id, leader_peer_id)
					end
				end
			end
		end

		for peer_id, _ in pairs(peers_to_remove) do
			self:_remove_peer_reservation(peer_id)
		end
	else
		self:_remove_peer_reservation(peer_id)
	end

	self:_update_reservations()
end

PlayerHostedSlotReservationHandler.network_context_created = function (self, lobby, server_peer_id, own_peer_id, is_server, network_handler)
	if not is_server then
		self._dirty_reserved_slots = nil
	elseif self._dirty_reserved_slots then
		self:_update_lobby_data(lobby, self._dirty_reserved_slots)

		self._dirty_reserved_slots = nil
	end
end

PlayerHostedSlotReservationHandler._update_lobby_data = function (self, lobby, reserved_slots)
	local lobby_data = lobby.lobby_data_table

	lobby_data.reserved_slots_mask = reserved_slots

	lobby:set_lobby_data(lobby_data)
end

PlayerHostedSlotReservationHandler._remove_peer_reservation = function (self, peer_id)
	local peer_party_id = self._peer_id_to_party_id[peer_id]

	if self._dangling_peers[peer_id] then
		self._dangling_peers[peer_id] = nil

		return
	elseif not peer_party_id then
		Application.warning(string.format("[PlayerHostedSlotReservationHandler] No reserved slot was found for peer %q", peer_id))

		return
	else
		local removed_peer = false
		local party_slots = self._reserved_peers[peer_party_id]

		for i = 1, #party_slots do
			if party_slots[i].peer_id == peer_id then
				self:_clear_party_slot(party_slots[i])

				removed_peer = true

				break
			end
		end

		print("[PlayerHostedSlotReservationHandler] Removing reserved peer %s", peer_id)

		local mechanism = Managers.mechanism:game_mechanism()
		local is_hosting = mechanism.is_hosting_versus_custom_game and mechanism:is_hosting_versus_custom_game()

		if is_hosting and removed_peer then
			self._party_manager:server_remove_friend_party_peer(peer_id)
		elseif not removed_peer then
			Crashify.print_exception("[PlayerHostedSlotReservationHandler]", "Tried removing peer %s but was not reserved to begin with", peer_id)
		end

		self._peer_id_to_party_id[peer_id] = nil

		if self._group_leaders[peer_id] then
			local next_leader = table.find_func(self._group_leaders[peer_id], function (other_peer)
				return other_peer ~= peer_id
			end)

			if next_leader then
				self._group_leaders[next_leader] = self._group_leaders[peer_id]
			end
		end

		self._group_leaders[peer_id] = nil
	end
end

PlayerHostedSlotReservationHandler.party_id = function (self, peer_id)
	local peer_party_id = self._peer_id_to_party_id[peer_id]

	return peer_party_id
end

PlayerHostedSlotReservationHandler.all_teams_have_members = function (self)
	local party_manager = Managers.party

	for party_id, slot_data in ipairs(self._reserved_peers) do
		if party_manager:is_game_participating(party_id) then
			local num_slots = self._num_slots_per_party[party_id]
			local num_free_slots = self:_num_free_slots_in_party(party_id)

			if num_slots == num_free_slots then
				return false
			end
		end
	end

	return true
end

PlayerHostedSlotReservationHandler.get_group_leaders = function (self)
	return table.keys(self._group_leaders)
end

PlayerHostedSlotReservationHandler.get_leader_from_peer = function (self, peer_id)
	for leader_peer, peers in pairs(self._group_leaders) do
		if peers[peer_id] then
			return leader_peer
		end
	end
end

PlayerHostedSlotReservationHandler.peers = function (self)
	return table.keys(self._peer_id_to_party_id)
end

PlayerHostedSlotReservationHandler.peers_by_party = function (self, party_id)
	return table.keys(table.filter(self._peer_id_to_party_id, function (peer_party_id)
		return party_id == peer_party_id
	end))
end

PlayerHostedSlotReservationHandler.party_id_by_peer = function (self, peer_id)
	return self._peer_id_to_party_id[peer_id]
end

PlayerHostedSlotReservationHandler.update_slots = function (self, reserved_peers, reserved_peers_party_ids, friend_party_ids, party_leaders)
	self._synced = true

	for party_id = 1, #self._reserved_peers do
		local party_data = self._reserved_peers[party_id]

		for slot_id = 1, #party_data do
			self:_clear_party_slot(party_data[slot_id])
		end
	end

	table.clear(self._group_leaders)
	table.clear(self._peer_id_to_party_id)

	if VERBOSE_LOG then
		printf("[PlayerHostedSlotReservationHandler] Updating slots (%s) (%s)", table.concat(reserved_peers, ", "), table.concat(reserved_peers_party_ids, ", "))
	end

	assert(table.find(reserved_peers, Network.peer_id()), "[PlayerHostedSlotReservationHandler] Missing self in reservation handler")

	for i = 1, #reserved_peers do
		local peer_id = reserved_peers[i]
		local party_id = reserved_peers_party_ids[i]
		local friend_party_id = friend_party_ids[i]
		local party_leader = party_leaders[i]
		local found = false
		local party_data = self._reserved_peers[party_id]

		if party_data then
			for slot_id = 1, #party_data do
				local slot_data = party_data[slot_id]

				if not slot_data.reserved then
					self:_write_party_slot(slot_data, peer_id, friend_party_id, party_leader, party_id)

					found = true

					break
				end
			end
		end

		if not found then
			self:_expand(party_id, party_data and #party_data + 1 or 1)

			party_data = self._reserved_peers[party_id]

			self:_write_party_slot(party_data[#party_data], peer_id, friend_party_id, party_leader, party_id)
		end
	end

	if Managers.mechanism:is_server() then
		if VERBOSE_LOG then
			local formatted = table.concat(table.select_array(self._reserved_peers, function (_, slots)
				return table.concat(table.select_array(slots, function (_, slot)
					return slot.peer_id
				end), ", ")
			end), " | ")

			printf("[PlayerHostedSlotReservationHandler] Sending update to clients (%s)", formatted)
		end

		local network_handler = Managers.mechanism:network_handler()
		local match_handler = network_handler:get_match_handler()

		match_handler:send_rpc_down_if("rpc_sync_vs_custom_game_slot_data", function (peer_id)
			return table.find(reserved_peers, peer_id)
		end, reserved_peers, reserved_peers_party_ids, friend_party_ids, party_leaders)
	end
end

PlayerHostedSlotReservationHandler.party_peers = function (self, party_id)
	return table.keys_if(self._peer_id_to_party_id, nil, function (_, peer_party_id)
		return party_id == peer_party_id
	end)
end

PlayerHostedSlotReservationHandler.player_joined_party = function (self, peer_id, local_player_id, party_id, slot_id, is_bot)
	if is_bot or party_id == 0 then
		return
	end

	local previous_party_id = self._peer_id_to_party_id[peer_id]
	local joined_party = Managers.party:get_party(party_id)

	if previous_party_id and not joined_party.game_participating then
		self:_remove_peer_reservation(peer_id)

		return
	end

	if not previous_party_id or previous_party_id == party_id then
		return
	end

	self:move_player(peer_id, party_id)
end

PlayerHostedSlotReservationHandler.request_party_change = function (self, wanted_party_id)
	local peer_id = Network.peer_id()
	local network_transmit = Managers.state.network.network_transmit

	network_transmit:send_rpc_server("rpc_slot_reservation_request_party_change", peer_id, wanted_party_id)
end

PlayerHostedSlotReservationHandler.slot_reservation_sync_requested = function (self, requester_peer_id)
	local reserved_peers, party_ids, friend_party_ids, party_leaders = self:_build_slot_info()

	if not table.find(reserved_peers, requester_peer_id) then
		printf("[PlayerHostedSlotReservationHandler] Non reserved peer %s requested a slot reservation sync.")

		return
	end

	local network_handler = Managers.mechanism:network_handler()
	local match_handler = network_handler:get_match_handler()

	match_handler:send_rpc("rpc_sync_vs_custom_game_slot_data", requester_peer_id, reserved_peers, party_ids, friend_party_ids, party_leaders)
end

PlayerHostedSlotReservationHandler.request_slot_reservation_sync = function (self)
	local network_handler = Managers.mechanism:network_handler()
	local match_handler = network_handler:get_match_handler()

	match_handler:send_rpc_up("rpc_request_slot_reservation_sync")
end

PlayerHostedSlotReservationHandler._send_peer_updates_to_clients = function (self)
	local network_handler = Managers.mechanism:network_handler()

	if not network_handler then
		return
	end

	local match_handler = network_handler:get_match_handler()
	local is_match_host = match_handler:query_peer_data(Network.peer_id(), "is_match_owner")

	if not is_match_host then
		return
	end

	local reserved_peers, party_ids, friend_party_ids, party_leaders = self:_build_slot_info()

	self:update_slots(reserved_peers, party_ids, friend_party_ids, party_leaders)
end

local reserved_peers_scratch = {}
local party_ids_scratch = {}
local friend_party_ids_scratch = {}
local party_leader_scratch = {}

PlayerHostedSlotReservationHandler._build_slot_info = function (self)
	table.clear(reserved_peers_scratch)
	table.clear(party_ids_scratch)
	table.clear(friend_party_ids_scratch)
	table.clear(party_leader_scratch)

	local idx = 1

	for i = 1, #self._reserved_peers do
		local slots = self._reserved_peers[i]

		for j = 1, #slots do
			local slot_data = slots[j]

			if slot_data.reserved then
				reserved_peers_scratch[idx] = slot_data.peer_id
				party_ids_scratch[idx] = i
				friend_party_ids_scratch[idx] = slot_data.friend_party_id or 1
				party_leader_scratch[idx] = slot_data.friend_party_leader or ""
				idx = idx + 1
			end
		end
	end

	return reserved_peers_scratch, party_ids_scratch, friend_party_ids_scratch, party_leader_scratch
end

PlayerHostedSlotReservationHandler.get_peer_reserved_indices = function (self, peer_id)
	local reserved_slots = self._reserved_peers

	for party_id = 1, #reserved_slots do
		local party_slots = reserved_slots[party_id]

		for slot_id = 1, #party_slots do
			local slot_data = party_slots[slot_id]

			if slot_data.peer_id == peer_id then
				return party_id, slot_id
			end
		end
	end
end

PlayerHostedSlotReservationHandler._get_peer_slot_data = function (self, peer_id)
	local reserved_slots = self._reserved_peers

	for party_id = 1, #reserved_slots do
		local party_slots = reserved_slots[party_id]

		for slot_id = 1, #party_slots do
			local slot_data = party_slots[slot_id]

			if slot_data.peer_id == peer_id then
				return slot_data
			end
		end
	end
end

PlayerHostedSlotReservationHandler.move_player = function (self, peer_id, party_id, skip_update)
	local unreserved_slots = self:_num_free_slots_in_party(party_id)

	if unreserved_slots < 1 then
		return false
	end

	local previous_party_id = self._peer_id_to_party_id[peer_id]

	if not previous_party_id then
		return false, "Failed to find peer"
	end

	if previous_party_id == party_id then
		return true
	end

	local switched_party = false
	local old_party_slots = self._reserved_peers[previous_party_id]
	local new_party_slots = self._reserved_peers[party_id]

	for old_slot_id, old_slot_data in pairs(old_party_slots) do
		if old_slot_data.peer_id == peer_id then
			for new_slot_id, new_slot_data in pairs(new_party_slots) do
				if not new_slot_data.reserved then
					local friend_party_id, friend_party_leader = old_slot_data.friend_party_id, old_slot_data.friend_party_leader

					self:_write_party_slot(new_slot_data, peer_id, friend_party_id, friend_party_leader, party_id)
					self:_clear_party_slot(old_slot_data)

					switched_party = true

					break
				end
			end

			break
		end
	end

	if not switched_party then
		Crashify.print_exception("[PlayerHostedSlotReservationHandler]", "Tried removing peer %s but was not reserved to begin with", peer_id)
	end

	if not skip_update then
		self:_update_reservations()
	end

	return true
end

PlayerHostedSlotReservationHandler.poll_sync_lobby_data_required = function (self)
	if self._lobby_data_sync_requested then
		self._lobby_data_sync_requested = false

		return true
	end

	return false
end

PlayerHostedSlotReservationHandler.remote_client_disconnected = function (self, peer_id)
	self:remove_peer_reservations(peer_id)

	self._pending_peer_informations[peer_id] = nil
end

PlayerHostedSlotReservationHandler.has_reservation = function (self, peer_id)
	return self._peer_id_to_party_id[peer_id]
end

PlayerHostedSlotReservationHandler.handle_slot_reservation_for_connecting_peer = function (self, peer_state, dt)
	local peer_id = peer_state.peer_id
	local send_request = false
	local info = self._pending_peer_informations[peer_id]

	if not info then
		info = {
			resend_timer = 3,
			reserved = false,
			status = SlotReservationConnectStatus.PENDING,
			peers = {},
		}
		self._pending_peer_informations[peer_id] = info
		send_request = true
	else
		info.resend_timer = info.resend_timer - dt
	end

	if info.status == SlotReservationConnectStatus.PENDING and info.resend_timer < 0 then
		send_request = true
		info.resend_timer = 3
	end

	if send_request then
		printf("[PlayerHostedSlotReservationHandler] Requesting reservation info from peer '%s'", peer_id)

		local channel_id = PEER_ID_TO_CHANNEL[peer_id]

		RPC.rpc_slot_reservation_request_peers(channel_id)
	end

	return info.status
end

PlayerHostedSlotReservationHandler.connecting_slot_reservation_info_received = function (self, peer_id, peers, group_leader)
	local info = self._pending_peer_informations[peer_id]

	if info.status ~= SlotReservationConnectStatus.PENDING then
		printf("[PlayerHostedSlotReservationHandler]", "Received slot reservation info from already handled peer '%s'.", peer_id)

		return
	end

	for i = 1, #peers do
		local other_peer = peers[i]

		self._pending_peer_informations[other_peer] = info
		info.peers[i] = other_peer
	end

	local matchmaking_manager = Managers.matchmaking

	if not matchmaking_manager or not matchmaking_manager:is_in_versus_custom_game_lobby() then
		group_leader = Network.peer_id()
	end

	local success = self:try_reserve_slots(group_leader, info.peers)

	printf("[PlayerHostedSlotReservationHandler] Peer info from peer '%s' received. (%s) joining. Success: %s", peer_id, table.concat(peers, ","), success)

	if success then
		info.reserved = true
		info.status = SlotReservationConnectStatus.SUCCEEDED
	else
		info.status = SlotReservationConnectStatus.FAILED
	end
end

PlayerHostedSlotReservationHandler._change_leader = function (self, peer_id, leader_peer_id)
	local previous_leader = self:get_leader_from_peer(peer_id)

	if previous_leader then
		self._group_leaders[previous_leader][peer_id] = nil

		if table.is_empty(self._group_leaders[previous_leader]) then
			self._group_leaders[previous_leader] = nil
		end
	end

	self._group_leaders[leader_peer_id] = self._group_leaders[leader_peer_id] or {}
	self._group_leaders[leader_peer_id][peer_id] = true
end

PlayerHostedSlotReservationHandler._clear_party_slot = function (self, party_slot)
	if VERBOSE_LOG and party_slot.peer_id then
		printf("[PlayerHostedSlotReservationHandler] Clearing peer %s from party %s (friend party %s leader %s)", party_slot.peer_id, party_slot.party_id, party_slot.friend_party_id, party_slot.friend_party_leader)
	end

	party_slot.reserved = false
	party_slot.peer_id = nil
	party_slot.friend_party_id = nil
	party_slot.friend_party_leader = nil
	party_slot.party_id = nil
end

PlayerHostedSlotReservationHandler._write_party_slot = function (self, party_slot, peer_id, friend_party_id, friend_party_leader, party_id)
	party_slot.reserved = true
	party_slot.peer_id = peer_id
	party_slot.friend_party_id = friend_party_id
	party_slot.friend_party_leader = friend_party_leader
	party_slot.party_id = party_id
	self._group_leaders[friend_party_leader] = self._group_leaders[friend_party_leader] or {}
	self._group_leaders[friend_party_leader][peer_id] = true
	self._peer_id_to_party_id[peer_id] = party_id

	if VERBOSE_LOG then
		printf("[PlayerHostedSlotReservationHandler] Reserving peer %s to party %s (friend party %s leader %s)", peer_id, party_id, friend_party_id, friend_party_leader)
	end
end

PlayerHostedSlotReservationHandler._clear_non_session_peers = function (self)
	local my_peer_id = Network.peer_id()
	local my_slot_data = self._synced and self:_get_peer_slot_data(my_peer_id)
	local leader = my_slot_data and my_slot_data.friend_party_leader or my_peer_id
	local reserved_peers = self._reserved_peers

	for party_id = 1, #reserved_peers do
		local party_data = reserved_peers[party_id]

		for slot_id = 1, #party_data do
			local slot_data = party_data[slot_id]

			if slot_data.peer_id and slot_data.friend_party_leader ~= leader then
				self:_remove_peer_reservation(slot_data.peer_id)
			end
		end
	end
end

PlayerHostedSlotReservationHandler._on_network_match_changed = function (self, new_match_owner_peer_id)
	if not new_match_owner_peer_id then
		self:_clear_non_session_peers()
		self:update_slot_settings({
			self._party_manager:parties()[1],
		})
	end
end

PlayerHostedSlotReservationHandler._on_network_match_terminated = function (self)
	self._synced = false

	self:_clear_non_session_peers()
end

PlayerHostedSlotReservationHandler._on_new_network_match_synced = function (self, is_server, peer_id)
	if is_server then
		local network_handler = Managers.mechanism:network_handler()

		self:try_reserve_slots(peer_id, network_handler and network_handler:active_peers() or {
			peer_id,
		})
	else
		self:request_slot_reservation_sync()
	end
end

PlayerHostedSlotReservationHandler.destroy = function (self)
	Managers.persistent_event:unregister("network_match_changed", self)
	Managers.persistent_event:unregister("network_match_terminated", self)
	Managers.persistent_event:unregister("new_network_match_synced", self)
end
