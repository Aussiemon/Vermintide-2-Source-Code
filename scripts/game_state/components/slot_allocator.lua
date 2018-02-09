SlotAllocator = class(SlotAllocator)
SlotAllocator.INVALID_PEER = "0"
SlotAllocator.INVALID_OWNER = "0:0"
SlotAllocator.DEBUG = false

function sa_printf(...)
	if SlotAllocator.DEBUG then
		print("[SlotAllocator] " .. string.format(...))
	end

	return 
end

SlotAllocator.init = function (self, is_server, lobby, num_profiles)
	sa_printf("Create SlotAllocator")

	self._is_server = is_server
	self._lobby = lobby
	self._profiles = {}

	for ii = 1, num_profiles, 1 do
		self._profiles[ii] = {
			local_player_index = 0,
			peer_id = SlotAllocator.INVALID_PEER
		}
	end

	return 
end
SlotAllocator.num_slots = function (self)
	return #self._profiles
end
SlotAllocator.allocate_slot = function (self, profile_index, peer_id, local_player_index)
	assert(self._is_server)
	sa_printf("Allocate slot %d for %s:%d", profile_index, peer_id, local_player_index)

	local profile_table = self._profiles[profile_index]
	profile_table.peer_id = peer_id
	profile_table.local_player_index = local_player_index

	self._update_lobby_data(self)

	return 
end
SlotAllocator.free_slot = function (self, profile_index)
	assert(self._is_server)
	sa_printf("Free slot %d", profile_index)

	local profile_table = self._profiles[profile_index]
	profile_table.peer_id = SlotAllocator.INVALID_PEER
	profile_table.local_player_index = 0

	self._update_lobby_data(self)

	return 
end
SlotAllocator.free_peer_slots = function (self, peer_id, local_player_index)
	assert(self._is_server)

	for profile_index = 1, #self._profiles, 1 do
		local profile_table = self._profiles[profile_index]

		if profile_table.peer_id == peer_id and profile_table.local_player_index == local_player_index then
			sa_printf("Free slot %d", profile_index)

			profile_table.peer_id = SlotAllocator.INVALID_PEER
			profile_table.local_player_index = 0
		end
	end

	self._update_lobby_data(self)

	return 
end
SlotAllocator.owner = function (self, profile_index)
	if self._is_server then
		local profile = self._profiles[profile_index]
		local owner_peer_id = profile.peer_id

		if owner_peer_id ~= SlotAllocator.INVALID_PEER then
			return owner_peer_id, profile.local_player_index
		end
	else
		local lobby_data = self._lobby:get_stored_lobby_data()

		return SlotAllocator.owner_in_lobby(profile_index, lobby_data)
	end

	return 
end
SlotAllocator.owner_in_lobby = function (profile_index, lobby_data)
	local slot_name = SlotAllocator._slot_name(profile_index)
	local owner = lobby_data[slot_name]

	if owner == nil then
		return 
	end

	local peer_id, local_player_index = SlotAllocator._split_lobby_entry(owner)

	if peer_id ~= SlotAllocator.INVALID_PEER and peer_id ~= nil then
		return peer_id, local_player_index
	end

	return 
end
SlotAllocator.is_free = function (self, profile_index)
	if self._is_server then
		return self._profiles[profile_index].peer_id == SlotAllocator.INVALID_PEER
	else
		local lobby_data = self._lobby:get_stored_lobby_data()

		return SlotAllocator.is_free_in_lobby(profile_index, lobby_data)
	end

	return 
end
SlotAllocator.is_free_in_lobby = function (profile_index, lobby_data)
	local slot_name = SlotAllocator._slot_name(profile_index)
	local owner = lobby_data[slot_name]

	return owner == SlotAllocator.INVALID_OWNER or owner == nil
end
SlotAllocator.pack_for_transmission = function (self)
	local peers = {}
	local player_indices = {}

	for profile_index = 1, #self._profiles, 1 do
		local profile = self._profiles[profile_index]
		local peer = profile.peer_id
		local index = profile.local_player_index
		peers[#peers + 1] = peer
		player_indices[#player_indices + 1] = index

		sa_printf("Packing slot %d as %s:%d", profile_index, peer, index)
	end

	return peers, player_indices
end
SlotAllocator.unpack_after_transmission = function (peer_ids, player_indices, lobby_data)
	assert(#peer_ids == #player_indices)

	for profile_index = 1, #peer_ids, 1 do
		local slot_name = SlotAllocator._slot_name(profile_index)
		local peer_id = peer_ids[profile_index]
		local local_player_index = player_indices[profile_index]
		lobby_data[slot_name] = SlotAllocator._join_lobby_entry(peer_id, local_player_index)

		sa_printf("Unpacking slot %d as %s:%d", profile_index, peer_id, local_player_index)
	end

	return 
end
SlotAllocator._join_lobby_entry = function (peer_id, local_player_index)
	return string.format("%s:%d", peer_id, local_player_index)
end
SlotAllocator._split_lobby_entry = function (entry)
	local split_point = string.find(entry, ":")
	local peer_id = entry.sub(entry, 1, split_point - 1)
	local local_player_index = tonumber(entry.sub(entry, split_point + 1))

	return peer_id, local_player_index
end
SlotAllocator._lobby_data_row = function (self, profile_index)
	local profile_data = self._profiles[profile_index]
	local key = SlotAllocator._slot_name(profile_index)
	local value = SlotAllocator._join_lobby_entry(profile_data.peer_id, profile_data.local_player_index)

	return key, value
end
SlotAllocator._slot_name = function (profile_index)
	return string.format("player_slot_%d", profile_index)
end
SlotAllocator._update_lobby_data = function (self)
	assert(self._is_server)

	local lobby = self._lobby
	local lobby_data = lobby.get_stored_lobby_data(lobby)

	for profile_index = 1, #self._profiles, 1 do
		local key, value = self._lobby_data_row(self, profile_index)

		sa_printf("Write lobby data %s = %s", key, value)

		lobby_data[key] = value
	end

	lobby.set_lobby_data(lobby, lobby_data)

	return 
end

return 
