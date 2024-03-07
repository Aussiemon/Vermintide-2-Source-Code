-- chunkname: @scripts/managers/game_mode/mechanisms/versus_game_server_slot_reservation_handler.lua

VersusGameServerSlotReservationHandler = class(VersusGameServerSlotReservationHandler)

VersusGameServerSlotReservationHandler.init = function (self, parties)
	fassert(DEDICATED_SERVER, "[VersusGameServerSlotReservationHandler] Should only be initialized on a dedicated server.")

	local num_slot_override = script_data.dedicated_server_reservation_slots

	if num_slot_override then
		printf("Modifying party definitions, num_players: %s", tostring(num_slot_override))

		num_slot_override = string.split(num_slot_override, ",")
	end

	local party_manager = Managers.party

	self._party_manager = party_manager
	self._num_slots_total = 0
	self._num_slots_reserved = 0
	self._max_party_slots = 0
	self._reserved_peers = {}

	for party_id = 1, #parties do
		local party = parties[party_id]
		local party_slots = {}
		local num_slots = num_slot_override and tonumber(num_slot_override[party_id]) or party.num_slots

		self._num_slots_total = self._num_slots_total + num_slots

		for i = 1, num_slots do
			party_slots[i] = {
				reserved = false,
			}
		end

		self._reserved_peers[party_id] = party_slots

		if num_slots > self._max_party_slots then
			self._max_party_slots = num_slots
		end
	end
end

VersusGameServerSlotReservationHandler.destroy = function (self)
	return
end

VersusGameServerSlotReservationHandler.send_rpc_to_all_reserving_clients = function (self, rpc_name, ...)
	local reserved_peers = self._reserved_peers

	for party_id = 1, #reserved_peers do
		local party_slots = reserved_peers[party_id]

		for _, slot in ipairs(party_slots) do
			local peer_id = slot.peer_id

			if peer_id and slot.reserver then
				local channel_id = PEER_ID_TO_CHANNEL[peer_id]

				if channel_id then
					RPC[rpc_name](channel_id, ...)
				end
			end
		end
	end
end

VersusGameServerSlotReservationHandler.send_slot_update_to_clients = function (self)
	local reserved_peers = self._reserved_peers

	for party_id = 1, #reserved_peers do
		local party_slots = reserved_peers[party_id]

		for _, slot in ipairs(party_slots) do
			local peer_id = slot.peer_id

			if peer_id and slot.reserver then
				local channel_id = PEER_ID_TO_CHANNEL[peer_id]

				if channel_id then
					RPC.rpc_reserved_slots_count(channel_id, self._num_slots_reserved, self._num_slots_total)
				end
			end
		end
	end

	self:_send_peer_updates_to_clients()
end

VersusGameServerSlotReservationHandler.num_slots_total = function (self)
	return self._num_slots_total
end

VersusGameServerSlotReservationHandler.max_party_slots = function (self)
	return self._max_party_slots
end

VersusGameServerSlotReservationHandler._send_peer_updates_to_clients = function (self)
	local data = {}
	local reservers = {}
	local reserved_peers = self._reserved_peers

	for party_id = 1, #reserved_peers do
		local party_slots = reserved_peers[party_id]
		local party_data = {
			slot_state = {},
			party_members = {},
		}

		data[party_id] = party_data

		local slot_state = party_data.slot_state
		local party_members = party_data.party_members

		for i = 1, #party_slots do
			local slot = party_slots[i]

			if slot.reserved then
				local name = Managers.game_server:peer_name(slot.peer_id)

				party_members[i] = name
				slot_state[i] = slot.reserver and 3 or 2
			else
				party_members[i] = "-"
				slot_state[i] = 1
			end

			if slot.peer_id and slot.reserver then
				reservers[#reservers + 1] = slot.peer_id
			end
		end
	end

	for i = 1, #reservers do
		local peer_id = reservers[i]
		local channel_id = PEER_ID_TO_CHANNEL[peer_id]

		if channel_id then
			for party_id, party_slots in pairs(reserved_peers) do
				local party_data = data[party_id]
				local server_name = Managers.game_server:server_name()

				RPC.rpc_party_slots_status(channel_id, server_name, party_id, party_data.party_members, party_data.slot_state)
			end
		end
	end
end

VersusGameServerSlotReservationHandler.try_reserve_slots = function (self, reserver, peers, invitee, unit_test)
	local party_id = self:_find_fitting_party(peers, invitee)

	if party_id then
		self:_assign_peers_to_party(reserver, party_id, peers, invitee)
	elseif self:_is_state_waiting_for_fully_reserved() and not invitee then
		local sucessfully_added_party = self:_try_add_friend_party(peers, reserver)

		if not sucessfully_added_party then
			return false
		end
	else
		return false
	end

	self._num_slots_reserved = self._num_slots_reserved + #peers

	if not unit_test then
		self:send_slot_update_to_clients()
	end

	self:_update_lobby_reservations()

	return true
end

VersusGameServerSlotReservationHandler._find_fitting_party = function (self, peers, invitee)
	local num_peers = #peers
	local settings = GameModeSettings.versus
	local party_id

	if invitee then
		party_id = self:_can_join_invitee_party(invitee, num_peers)
	elseif settings.fill_party_distribution == settings.party_fill_method.fill_first_party then
		party_id = self:_find_party_with_most_peers_and_enough_room(num_peers)
	elseif settings.fill_party_distribution == settings.party_fill_method.distribute_party_even then
		party_id = self:_find_party_with_least_peers_and_enough_room(num_peers)
	end

	return party_id
end

VersusGameServerSlotReservationHandler.unreserve_slot = function (self, peer_id, unit_test, remove_safe)
	local party_slots, slot_index, party_id = self:_find_party_and_index_from_peer_id(peer_id, remove_safe)

	if not slot_index then
		return
	end

	self:_unreserve_slot_delayed(peer_id, party_slots, slot_index, remove_safe, unit_test)
	self._party_manager:server_remove_friend_party_peer(peer_id)
end

VersusGameServerSlotReservationHandler._assign_peers_to_party = function (self, reserver, party_id, peers, invitee)
	self:_reserve_slots_in_party(party_id, peers, reserver)

	if invitee then
		self._party_manager:server_add_friend_party_peer_from_invitee(reserver, invitee)
	else
		self._party_manager:server_create_friend_party(peers, reserver)
	end
end

VersusGameServerSlotReservationHandler._unreserve_slot_delayed = function (self, peer_id, remove_safe, unit_test)
	local party_slots, slot_index = self:_find_party_and_index_from_peer_id(peer_id, remove_safe)

	self._num_slots_reserved = self._num_slots_reserved - 1

	self:_unreserve_party_slot(party_slots, slot_index, peer_id, unit_test)
	self:_update_lobby_reservations()

	if not unit_test then
		self:send_slot_update_to_clients()
	end
end

VersusGameServerSlotReservationHandler.is_fully_reserved = function (self)
	local spectator_party = self._party_manager:get_party_from_name("spectators")
	local spectator_party_id = spectator_party and spectator_party.party_id
	local reserved_peers = self._reserved_peers

	for party_id = 1, #reserved_peers do
		if party_id ~= spectator_party_id then
			local num_unreserved_slots = self:_num_unreserved_slots(party_id)

			if num_unreserved_slots > 0 then
				return false
			end
		end
	end

	return true
end

VersusGameServerSlotReservationHandler.is_empty = function (self)
	local spectator_party = self._party_manager:get_party_from_name("spectators")
	local spectator_party_id = spectator_party and spectator_party.party_id
	local reserved_peers = self._reserved_peers

	for party_id = 1, #reserved_peers do
		local party_slots = reserved_peers[party_id]

		if party_id ~= spectator_party_id then
			for _, slot in ipairs(party_slots) do
				if slot.reserved then
					return false
				end
			end
		end
	end

	return true
end

VersusGameServerSlotReservationHandler.reservers = function (self)
	local reservers = {}
	local reserved_peers = self._reserved_peers

	for party_id = 1, #reserved_peers do
		local party_slots = reserved_peers[party_id]

		for slot_index = 1, #party_slots do
			local slot = party_slots[slot_index]

			if slot.reserver then
				reservers[#reservers + 1] = slot.peer_id
			end
		end
	end

	return reservers
end

VersusGameServerSlotReservationHandler.is_all_reserved_peers_joined = function (self, members_map)
	local reserved_peers = self._reserved_peers

	for party_id = 1, #reserved_peers do
		local party_slots = reserved_peers[party_id]

		for slot_id = 1, #party_slots do
			local slot = party_slots[slot_id]
			local peer_id = slot.peer_id

			if peer_id and not members_map[peer_id] then
				return false
			end
		end
	end

	return true
end

VersusGameServerSlotReservationHandler.party_id = function (self, peer_id)
	local reserved_peers = self._reserved_peers

	for party_id = 1, #reserved_peers do
		local party_slots = reserved_peers[party_id]

		for slot_id = 1, #party_slots do
			local slot = party_slots[slot_id]

			if slot.peer_id == peer_id then
				return party_id
			end
		end
	end

	return nil
end

VersusGameServerSlotReservationHandler._can_join_invitee_party = function (self, peer_id, num_joining)
	local party_id = self:party_id(peer_id)

	if not party_id then
		return false
	end

	if self:_can_join_specified_party(party_id, num_joining) then
		return party_id
	end
end

VersusGameServerSlotReservationHandler._can_join_specified_party = function (self, party_id, num_joining)
	local num_unreserved_slots = self:_num_unreserved_slots(party_id)

	if num_joining <= num_unreserved_slots then
		return true
	end

	return false
end

VersusGameServerSlotReservationHandler.dump = function (self)
	print("-------------[VersusGameServerSlotReservationHandler]-------------")

	local reserved_peers = self._reserved_peers

	for party_id = 1, #reserved_peers do
		printf("party_id[%s]", party_id)

		local party_slots = reserved_peers[party_id]

		for slot_index = 1, #party_slots do
			local slot = party_slots[slot_index]

			printf("  [%u] taken-%s peer_id-%s reserver-%s", slot_index, slot.reserved, slot.peer_id, slot.reserver)
		end
	end

	print("-------------[VersusGameServerSlotReservationHandler]-------------")
end

VersusGameServerSlotReservationHandler._print_reservations = function (self)
	local result = "Reservations: "
	local details = "\n"
	local reserved_peers = self._reserved_peers

	for party_id = 1, #reserved_peers do
		local party_slots = reserved_peers[party_id]

		details = string.format("%sParty %d\n", details, party_id)

		local party_result = "["

		for i = 1, #party_slots do
			local slot = party_slots[i]

			if slot.reserved then
				local name = Managers.game_server:peer_name(slot.peer_id)

				if slot.reserver then
					party_result = party_result .. "L"
					details = string.format("%sL %s (%s)\n", details, slot.peer_id, name)
				else
					party_result = party_result .. "C"
					details = string.format("%sC %s (%s)\n", details, slot.peer_id, name)
				end
			else
				party_result = party_result .. "-"
				details = string.format("%s  empty\n", details)
			end
		end

		party_result = party_result .. "] "
		result = result .. party_result
	end

	cprint(result .. details)
end

VersusGameServerSlotReservationHandler._find_party_with_least_peers_and_enough_room = function (self, num_peers)
	local best_party
	local most_free_slots = 0
	local spectator_party = self._party_manager:get_party_from_name("spectators")
	local spectator_party_id = spectator_party and spectator_party.party_id

	print("_find_party_with_least_peers_and_enough_room ------------------------------------>")

	local reserved_peers = self._reserved_peers

	for party_id = 1, #reserved_peers do
		if party_id ~= spectator_party_id then
			local num_unreserved_slots = self:_num_unreserved_slots(party_id)
			local party_slots = reserved_peers[party_id]

			print("party_id:", party_id, party_slots, num_unreserved_slots)

			if num_peers <= num_unreserved_slots and most_free_slots < num_unreserved_slots then
				best_party = party_id
				most_free_slots = num_unreserved_slots

				printf("found party! best_party: %s most_free_slots: %s, ", tostring(best_party), tostring(most_free_slots))
			end
		end
	end

	if best_party then
		print("party found!", best_party)

		return best_party
	end

	if spectator_party_id then
		local num_unreserved_slots = self:_num_unreserved_slots(spectator_party_id)

		if num_peers <= num_unreserved_slots then
			print("spectator is best party", best_party)

			return spectator_party_id
		end
	end

	print("No party found!")

	return false
end

VersusGameServerSlotReservationHandler._find_party_with_most_peers_and_enough_room = function (self, num_peers)
	local best_party
	local least_free_slots = math.huge
	local spectator_party = self._party_manager:get_party_from_name("spectators")
	local spectator_party_id = spectator_party and spectator_party.party_id

	print("_find_party_with_most_peers_and_enough_room ------------------------------------>")

	local reserved_peers = self._reserved_peers

	for party_id = 1, #reserved_peers do
		if party_id ~= spectator_party_id then
			local num_unreserved_slots = self:_num_unreserved_slots(party_id)
			local party_slots = reserved_peers[party_id]

			print("party_id:", party_id, party_slots, num_unreserved_slots)

			if num_peers <= num_unreserved_slots and num_unreserved_slots < least_free_slots then
				best_party = party_id
				least_free_slots = num_unreserved_slots

				printf("found party! best_party: %s least_free_slots: %s, ", tostring(best_party), tostring(least_free_slots))
			end
		end
	end

	if best_party then
		print("party found!", best_party)

		return best_party
	end

	if spectator_party_id then
		local num_unreserved_slots = self:_num_unreserved_slots(spectator_party_id)

		if num_peers <= num_unreserved_slots then
			print("spectator is best party", best_party)

			return spectator_party_id
		end
	end

	print("No party found!")

	return false
end

VersusGameServerSlotReservationHandler._num_unreserved_slots = function (self, party_id)
	local party_slots = self._reserved_peers[party_id]
	local unreserved_slots = 0

	for slot_index = 1, #party_slots do
		if self:_party_slot_is_empty(party_slots, slot_index) then
			unreserved_slots = unreserved_slots + 1
		end
	end

	return unreserved_slots
end

VersusGameServerSlotReservationHandler._reserve_slots_in_party = function (self, party_id, peers, reserver)
	local party_slots = self._reserved_peers[party_id]

	for i = 1, #peers do
		local peer_id = peers[i]
		local is_reserver = reserver == peer_id
		local reserved = false

		for j = 1, #party_slots do
			if self:_party_slot_is_empty(party_slots, j) then
				self:_reserve_slot(party_slots, j, peer_id, is_reserver)

				reserved = true

				break
			end
		end

		self:_dump_assert(reserved, "Failed reserving slot in party")
	end

	self:_print_reservations()
end

VersusGameServerSlotReservationHandler._num_reserved_slots_per_party = function (self)
	local num_reserved_slots_per_party = {}

	for party_id = 1, #self._reserved_peers - 1 do
		local party = self._reserved_peers[party_id]

		num_reserved_slots_per_party[party_id] = 0

		for slot_id = 1, #party do
			if party[slot_id].reserved then
				num_reserved_slots_per_party[party_id] = num_reserved_slots_per_party[party_id] + 1
			end
		end
	end

	return num_reserved_slots_per_party
end

VersusGameServerSlotReservationHandler._party_slot_is_empty = function (self, party_slots, index)
	local is_empty = not party_slots[index].reserved

	return is_empty
end

VersusGameServerSlotReservationHandler._reserve_slot = function (self, party_slots, index, peer_id, is_reserver)
	local slot = party_slots[index]

	self:_dump_assert(not slot.reserved, "Trying to reserve already reserved slot")

	slot.reserved = true
	slot.peer_id = peer_id
	slot.reserver = is_reserver

	Managers.state.event:trigger("game_server_reserve_party_slot", index, peer_id, is_reserver)
end

VersusGameServerSlotReservationHandler._unreserve_party_slot = function (self, party_slots, slot_index, peer_id, unit_test)
	local slot = party_slots[slot_index]

	self:_dump_assert(slot.reserved, "Trying to unreserve slot that was not reserved")

	slot.reserved = false
	slot.peer_id = nil
	party_slots[slot_index] = slot

	if not unit_test then
		Managers.state.event:trigger("game_server_unreserve_party_slot", slot_index, peer_id)
	end

	slot.reserver = nil

	self:_print_reservations()
end

VersusGameServerSlotReservationHandler._find_party_and_index_from_peer_id = function (self, peer_id, ignore_assert)
	local reserved_peers = self._reserved_peers

	for party_id = 1, #reserved_peers do
		local party_slots = reserved_peers[party_id]

		for slot_index = 1, #party_slots do
			local slot = party_slots[slot_index]

			if slot.peer_id == peer_id then
				return party_slots, slot_index, party_id
			end
		end
	end

	if not ignore_assert then
		self:_dump_assert(false, "Did not find peer (%s) in reserved slots.", peer_id)
	end
end

VersusGameServerSlotReservationHandler.get_peer_id = function (self, party_id, slot_index)
	local reserved_peers = self._reserved_peers
	local party_slots = reserved_peers[party_id]

	return party_slots[slot_index]
end

VersusGameServerSlotReservationHandler._dump_assert = function (self, condition, string, ...)
	if not condition then
		self:dump()
		ferror(string, ...)
	end
end

VersusGameServerSlotReservationHandler.should_run_tutorial = function (self)
	return false, nil
end

VersusGameServerSlotReservationHandler.set_party_size = function (self, party_id, new_party_size)
	local party_slots = self._reserved_peers[party_id]
	local total_slots = #party_slots
	local unreserved_slots = self:_num_unreserved_slots(party_id)
	local reserved_slots = total_slots - unreserved_slots

	if new_party_size < reserved_slots then
		return false, "New size smaller than number of players in party"
	end

	if total_slots == new_party_size then
		return true
	end

	if new_party_size < total_slots then
		for i = new_party_size + 1, total_slots do
			party_slots[i] = nil
		end
	else
		for i = total_slots + 1, new_party_size do
			party_slots[i] = {
				reserved = false,
			}
		end
	end

	self:send_slot_update_to_clients()
	self:_print_reservations()

	return true
end

VersusGameServerSlotReservationHandler.swap_players = function (self, first_player_peer_id, second_player_peer_id)
	if not first_player_peer_id or not second_player_peer_id or first_player_peer_id == second_player_peer_id then
		return false
	end

	if not first_player_peer_id then
		return false, "Missing first player peer id"
	end

	if not second_player_peer_id then
		return false, "Missing second player peer id"
	end

	if first_player_peer_id == second_player_peer_id then
		return false, "First player peer id and second player peer id needs to be unique"
	end

	local ignore_assert = true
	local first_party, slot_id_1 = self:_find_party_and_index_from_peer_id(first_player_peer_id, ignore_assert)
	local second_party, slot_id_2 = self:_find_party_and_index_from_peer_id(second_player_peer_id, ignore_assert)

	if not first_party then
		return false, "Failed to find first player"
	end

	if not second_party then
		return false, "Failed to find second player"
	end

	local first_slot = first_party[slot_id_1]
	local second_slot = second_party[slot_id_2]

	first_party[slot_id_1] = second_slot
	second_party[slot_id_2] = first_slot

	self:send_slot_update_to_clients()
	self:_print_reservations()
	self:_update_lobby_reservations()

	return true
end

VersusGameServerSlotReservationHandler.move_player = function (self, peer_id, party_id, ignore_assert)
	local unreserved_slots = self:_num_unreserved_slots(party_id)

	if unreserved_slots < 1 then
		return false
	end

	local current_party, slot_id = self:_find_party_and_index_from_peer_id(peer_id, ignore_assert)

	if not current_party then
		return false, "Failed to find peer"
	end

	if current_party.party_id == party_id then
		return true
	end

	local selected_slot = self:find_empty_slot_in_party(party_id)

	if not selected_slot then
		return false, "Failed to find empty slot"
	end

	local party_slots = self._reserved_peers[party_id]

	party_slots[selected_slot] = current_party[slot_id]
	current_party[slot_id] = {
		reserved = false,
	}

	self:send_slot_update_to_clients()
	self:_print_reservations()
	self:_update_lobby_reservations()

	return true
end

VersusGameServerSlotReservationHandler.find_empty_slot_in_party = function (self, party_id)
	local party_slots = self._reserved_peers[party_id]

	for i = 1, #party_slots do
		if party_slots[i].reserved == false then
			return i
		end
	end
end

VersusGameServerSlotReservationHandler._update_lobby_reservations = function (self)
	local reserved_slots = 0
	local start_bit = 0
	local reserved_peers = self._reserved_peers

	for party_id = 1, #reserved_peers do
		local party_data = reserved_peers[party_id]
		local num_slots = #party_data
		local occupied_slots = 0

		for i = 1, num_slots do
			local slot = party_data[i]

			if slot.reserved then
				occupied_slots = occupied_slots + 1
			end
		end

		for i = 1, occupied_slots do
			reserved_slots = bit.bor(reserved_slots, bit.lshift(1, start_bit + (i - 1)))
		end

		start_bit = start_bit + num_slots
	end

	local lobby = Managers.matchmaking.lobby
	local lobby_data = lobby:get_stored_lobby_data()

	lobby_data.reserved_slots_mask = reserved_slots

	lobby:set_lobby_data(lobby_data)
end

VersusGameServerSlotReservationHandler.try_balance_teams = function (self)
	local teams = self._reserved_peers
	local num_teams = #teams - 1

	self:_redistribute_parties_evenly(teams, num_teams)

	return self:is_evenly_distributed()
end

VersusGameServerSlotReservationHandler.is_evenly_distributed = function (self)
	local settings = GameModeSettings.inn_vs.auto_force_start
	local num_reserved_slots_per_party = self:_num_reserved_slots_per_party()
	local team_disparity = math.abs(num_reserved_slots_per_party[1] - num_reserved_slots_per_party[2])
	local _, smallest_team_size = table.min(num_reserved_slots_per_party)

	return team_disparity <= settings.max_team_disparity and smallest_team_size >= settings.min_team_size
end

VersusGameServerSlotReservationHandler._try_add_friend_party = function (self, peers, reserver)
	local reserved_peers = self._reserved_peers
	local num_peers = #peers

	if not Managers.party:server_has_room_for_friend_party(reserved_peers, num_peers) then
		local parties_to_kick = Managers.party:can_kick_to_fill_server(reserved_peers, num_peers)

		if not parties_to_kick then
			return false
		else
			for i = 1, #parties_to_kick do
				local party_to_kick = parties_to_kick[i]

				for peer_i = #party_to_kick.peers, 1, -1 do
					local peer_to_kick = party_to_kick.peers[peer_i]

					self:unreserve_slot(peer_to_kick)

					local network_server = Managers.mechanism:network_handler()

					network_server:force_disconnect_client_by_peer_id(peer_to_kick)
					print("Force disconnected")
				end
			end
		end
	end

	self._party_manager:server_create_friend_party(peers, reserver)
	self:_redistribute_parties_evenly()

	return true
end

VersusGameServerSlotReservationHandler._redistribute_parties_evenly = function (self)
	local reserved_peers = self._reserved_peers
	local friend_parties_sorted = self._party_manager:server_get_friend_parties_sorted()

	for party_id = 1, #reserved_peers do
		local party_slots = reserved_peers[party_id]

		for i = 1, #party_slots do
			local slot = party_slots[i]

			if slot.reserved then
				slot.reserved = false
				slot.peer_id = nil
				slot.reserver = nil
			end
		end
	end

	for i = 1, #friend_parties_sorted do
		local most_free_slots, most_free_slots_team_id, most_total_slots = 0, nil, 0

		for party_id = 1, #reserved_peers do
			local party_slots = reserved_peers[party_id]
			local num_total_slots = #party_slots
			local num_free_slots = self:_num_unreserved_slots(party_id)

			if most_free_slots < num_free_slots or num_free_slots == most_free_slots and num_total_slots < most_total_slots then
				most_free_slots = num_free_slots
				most_free_slots_team_id = party_id
				most_total_slots = num_total_slots
			end
		end

		local friend_party = friend_parties_sorted[i]

		self:_reserve_slots_in_party(most_free_slots_team_id, friend_party.peers, friend_party.leader)
	end

	self:_print_reservations()
end

VersusGameServerSlotReservationHandler.get_num_unreserved_slots_per_party = function (self)
	local num_unreserved_slots = {}
	local reserved_peers = self._reserved_peers

	for party_id = 1, #reserved_peers do
		num_unreserved_slots[party_id] = self:_num_unreserved_slots(party_id)
	end

	local unreserved_slots_total = 0

	for party_id = 1, #num_unreserved_slots do
		unreserved_slots_total = unreserved_slots_total + num_unreserved_slots[party_id]
	end

	return num_unreserved_slots, unreserved_slots_total
end

VersusGameServerSlotReservationHandler._is_state_waiting_for_fully_reserved = function (self)
	local game_mode_manager = Managers.state.game_mode
	local game_mode = game_mode_manager and game_mode_manager:game_mode()
	local game_mode_state = game_mode and game_mode:game_mode_state()

	return game_mode_state == "dedicated_server_waiting_for_fully_reserved"
end
