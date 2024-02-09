-- chunkname: @scripts/managers/game_mode/mechanisms/player_hosted_slot_reservation_handler.lua

PlayerHostedSlotReservationHandler = class(PlayerHostedSlotReservationHandler)

PlayerHostedSlotReservationHandler.init = function (self, party_settings)
	self:_setup_slots(party_settings)

	self._peer_id_to_party_id = {}
	self._group_leaders = {}
end

PlayerHostedSlotReservationHandler._setup_slots = function (self, party_settings)
	self._max_party_slots = 0
	self._num_slots_total = 0
	self._occupied_slots = {}

	for party_name, party_data in pairs(party_settings) do
		if party_data.game_participating then
			local party_id = party_data.party_id

			self._occupied_slots[party_id] = 0

			local num_slots = party_data.num_slots

			self._num_slots_total = self._num_slots_total + num_slots

			if num_slots > self._max_party_slots then
				self._max_party_slots = num_slots
			end
		end
	end
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
	local parties = Managers.party:parties()
	local num_to_reserve = #peers_to_reserve
	local max_free_slots = 0

	for party_id, num_occupied_slots in ipairs(self._occupied_slots) do
		local free_slots = parties[party_id].num_slots - num_occupied_slots

		if num_to_reserve <= free_slots and max_free_slots < free_slots then
			selected_party_id = party_id
			max_free_slots = free_slots
		end
	end

	if selected_party_id then
		for _, peer_id in ipairs(peers_to_reserve) do
			self._peer_id_to_party_id[peer_id] = selected_party_id
		end

		self._occupied_slots[selected_party_id] = self._occupied_slots[selected_party_id] + #peers_to_reserve
		reserved = true
		self._group_leaders[group_leader_peer_id] = table.set(peers_to_reserve)
	end

	self:_update_reservations()

	return reserved, selected_party_id
end

PlayerHostedSlotReservationHandler._update_reservations = function (self)
	local parties = Managers.party:parties()
	local reserved_slots = 0
	local start_bit = 0

	for party_id, num_occupied_slots in ipairs(self._occupied_slots) do
		local num_slots = parties[party_id].num_slots

		for i = 1, num_occupied_slots do
			reserved_slots = bit.bor(reserved_slots, bit.lshift(1, start_bit + (i - 1)))
		end

		start_bit = start_bit + num_slots
	end

	local lobby = Managers.state.network:lobby()
	local lobby_data = lobby.lobby_data_table

	lobby_data.reserved_slots_mask = reserved_slots

	lobby:set_lobby_data(lobby_data)
end

PlayerHostedSlotReservationHandler.remove_peer_reservations = function (self, peer_id, force_remove_peers)
	local peers_to_remove = self._group_leaders[peer_id]

	if peers_to_remove then
		if not force_remove_peers then
			local lobby = Managers.state.network:lobby()
			local lobby_members = lobby:members()
			local members = lobby_members:get_members()

			for _, member_peer_id in ipairs(members) do
				if peer_id ~= member_peer_id then
					peers_to_remove[member_peer_id] = nil
				end
			end
		end

		for peer_id, _ in pairs(peers_to_remove) do
			self:remove_peer_reservation(peer_id)
		end
	else
		self:remove_peer_reservation(peer_id)
	end

	self._group_leaders[peer_id] = nil

	self:_update_reservations()
end

PlayerHostedSlotReservationHandler.remove_peer_reservation = function (self, peer_id)
	local peer_party_id = self._peer_id_to_party_id[peer_id]

	if not peer_party_id then
		Application.warning(string.format("[PlayerHostedSlotReservationHandler] No reserved slot was found for peer %q", peer_id))

		return
	else
		self._occupied_slots[peer_party_id] = self._occupied_slots[peer_party_id] - 1
		self._peer_id_to_party_id[peer_id] = nil
	end
end

PlayerHostedSlotReservationHandler.party_id = function (self, peer_id)
	local peer_party_id = self._peer_id_to_party_id[peer_id]

	return peer_party_id
end

PlayerHostedSlotReservationHandler.all_teams_have_members = function (self)
	local party_manager = Managers.party

	for party_id, num_occupied_slots in ipairs(self._occupied_slots) do
		if party_manager:is_game_participating(party_id) and num_occupied_slots == 0 then
			return false
		end
	end

	return true
end

PlayerHostedSlotReservationHandler.get_group_leaders = function (self)
	return table.keys(self._group_leaders)
end
