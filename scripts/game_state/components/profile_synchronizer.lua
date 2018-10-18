require("scripts/game_state/components/inventory_package_synchronizer")
require("scripts/game_state/components/inventory_package_synchronizer_client")
require("scripts/settings/profiles/sp_profiles")

local NUM_PROFILES = #SPProfiles
local profile_printf = printf
local network_printf = printf
local BOT_PEER_IDS_TABLE = {
	[1001] = true,
	[1002] = true,
	[1003] = true,
	[1004] = true,
	[1005] = true
}
ProfileSynchronizer = class(ProfileSynchronizer)

ProfileSynchronizer.init = function (self, is_server, lobby_host, network_server)
	local profile_owners = {}

	for i = 1, NUM_PROFILES, 1 do
		profile_owners[i] = StrictNil
	end

	profile_owners[0] = StrictNil
	self._profile_owners = MakeTableStrict(profile_owners)

	if is_server then
		self._lobby_host = lobby_host
		self._is_server = is_server
		self._inventory_package_synchronizer_server = InventoryPackageSynchronizer:new()
		self._network_server = network_server
		self._slot_allocator = self._network_server.slot_allocator
	end

	self._inventory_package_synchronizer = InventoryPackageSynchronizerClient:new(is_server)
	self._peer_id = Network.peer_id()
	self._inventory_sync_id = 0
	self._client_sync_id = 0
	self._client_sync_id_map = {}
	self._loaded_peers = {}
	self._request_result = nil
	self._request_local_player_id = nil
	self._all_synced = false
	self._player_manager = Managers.player
	self._reserved_profiles = {}
	self._hot_join_synced_peers = {}
end

ProfileSynchronizer.dump = function (self)
	local s = "ProfileSynchronizer:\n"

	for index, owner_table in pairs(self._profile_owners) do
		s = s .. string.format("%d: %s (%d)\n", index, owner_table.peer_id, owner_table.local_player_id)
	end

	print(s)
end

local REQUEST_RESULTS = {
	"success",
	"failure",
	success = 1,
	failure = 2
}
local RPCS = {
	"rpc_server_mark_profile_used",
	"rpc_client_request_mark_profile",
	"rpc_server_request_mark_profile_result",
	"rpc_client_select_inventory",
	"rpc_server_set_inventory_sync_id",
	"rpc_client_inventory_map_loaded",
	"rpc_server_inventory_all_synced"
}
local NO_CLIENT_SYNC_ID = 0

ProfileSynchronizer.register_rpcs = function (self, network_event_delegate, network_transmit)
	network_event_delegate:register(self, unpack(RPCS))

	self._network_event_delegate = network_event_delegate
	self._network_transmit = network_transmit

	self._inventory_package_synchronizer:register_rpc(network_transmit, network_event_delegate)
end

ProfileSynchronizer.unregister_network_events = function (self)
	if self._network_event_delegate then
		self._network_event_delegate:unregister(self)

		self._network_event_delegate = nil
	end

	self._network_transmit = nil

	self._inventory_package_synchronizer:unregister()
end

ProfileSynchronizer.destroy = function (self)
	self:unregister_network_events()
	self._inventory_package_synchronizer:destroy()

	self._inventory_package_synchronizer = nil
	self._inventory_package_synchronizer_server = nil

	GarbageLeakDetector.register_object(self, "Profile Synchronizer")

	if self._gui ~= nil then
		World.destroy_gui(Application.debug_world(), self._gui)

		self._gui = nil
	end
end

ProfileSynchronizer.inventory_package_synchronizer = function (self)
	return self._inventory_package_synchronizer
end

ProfileSynchronizer._send_rpc_lobby_clients = function (self, rpc, ...)
	fassert(self._is_server, "Trying to send rpc to lobby clients without being lobby host.")

	local members = self._lobby_host:members()

	if not members then
		return
	end

	for _, peer_id in ipairs(members:get_members()) do
		if peer_id ~= Network.peer_id() and self._hot_join_synced_peers[peer_id] then
			RPC[rpc](peer_id, ...)
		end
	end
end

ProfileSynchronizer.update = function (self)
	self._inventory_package_synchronizer:update()

	local was_synced = self._all_synced
	local all_synced = (next(self._loaded_peers) and true) or false

	for peer_id, peer_table in pairs(self._loaded_peers) do
		for local_player_id, is_synced in pairs(peer_table) do
			if not is_synced then
				all_synced = false

				break
			end
		end
	end

	if all_synced and not was_synced and self._is_server then
		self._network_transmit:send_rpc_server("rpc_server_inventory_all_synced", self._inventory_sync_id)
		self:_send_rpc_lobby_clients("rpc_server_inventory_all_synced", self._inventory_sync_id)
	end

	self._all_synced = all_synced

	if Development.parameter("network_draw_profile_synchronizer") then
		self:_draw_state()
	end
end

local inventory_map_to_network_array = nil
local EMPTY_TABLE = {}
local NO_PEER = "0"
local NO_LOCAL_PLAYER_ID = 0
local IS_LOCAL_CALL = "is_local_call"

ProfileSynchronizer.set_profile_peer_id = function (self, profile_index, peer_id, local_player_id)
	assert(self._is_server)
	assert(profile_index)
	assert((peer_id and local_player_id) or (not peer_id and not local_player_id), "Missing local_player_id despite assigning to peer.")

	local new_profile_index, previous_profile_index = nil

	if peer_id then
		new_profile_index = profile_index
		previous_profile_index = self:profile_by_peer(peer_id, local_player_id)

		profile_printf("[ProfileSynchronizer] set_profile_peer_id from profile %s to %s for peer id %s:%i", tostring(previous_profile_index), tostring(new_profile_index), peer_id, local_player_id)
	else
		new_profile_index = nil
		previous_profile_index = profile_index
		local previous_owner = self._profile_owners[previous_profile_index]
		local peer_table = self._loaded_peers[previous_owner.peer_id]

		if peer_table then
			peer_table[previous_owner.local_player_id] = nil

			if table.is_empty(peer_table) then
				self._loaded_peers[previous_owner.peer_id] = nil
			end

			profile_printf("[ProfileSynchronizer] set_profile_peer_id %s is no longer owned by %s:%i", tostring(previous_profile_index), (previous_owner and previous_owner.peer_id) or "<none>", (previous_owner and previous_owner.local_player_id) or 0)
		end
	end

	if previous_profile_index then
		local sender = nil

		self:_profile_select_inventory(previous_profile_index, EMPTY_TABLE, EMPTY_TABLE, sender, local_player_id, NO_CLIENT_SYNC_ID)
	end

	local transmit_peer_id = peer_id or NO_PEER
	local transmit_local_player_id = local_player_id or NO_LOCAL_PLAYER_ID

	self:rpc_server_mark_profile_used(IS_LOCAL_CALL, transmit_peer_id, transmit_local_player_id, previous_profile_index or 0, new_profile_index or 0)
	self:_send_rpc_lobby_clients("rpc_server_mark_profile_used", transmit_peer_id, transmit_local_player_id, previous_profile_index or 0, new_profile_index or 0)

	if peer_id then
		local peer_table = self._loaded_peers[peer_id] or {}
		peer_table[local_player_id] = false
		self._loaded_peers[peer_id] = peer_table
	end

	self._all_synced = false
end

ProfileSynchronizer.all_synced = function (self)
	return self._all_synced
end

ProfileSynchronizer.clear_ownership = function (self, profile_index)
	self._profile_owners[profile_index] = nil
end

ProfileSynchronizer.owner = function (self, profile_index)
	return self._profile_owners[profile_index]
end

ProfileSynchronizer.owner_peer_id_local_player_id = function (self, profile_index)
	local owner = self:owner(profile_index)

	return owner.peer_id, owner.local_player_id
end

ProfileSynchronizer.profile_by_peer = function (self, peer_id, local_player_id)
	for index, owner_table in pairs(self._profile_owners) do
		if owner_table.peer_id == peer_id and owner_table.local_player_id == local_player_id then
			return index
		end
	end
end

ProfileSynchronizer.owned_profiles = function (self, table_to_fill)
	local owned_profiles = table_to_fill

	for index, owner_table in pairs(self._profile_owners) do
		if owner_table ~= nil then
			owned_profiles[#owned_profiles + 1] = index
		end
	end

	return owned_profiles
end

ProfileSynchronizer.hot_join_sync = function (self, peer_id, local_ids)
	local profile_owners = self._profile_owners
	local network_transmit = self._network_transmit
	local player_manager = self._player_manager
	local self_peer_id = Network.peer_id()

	for i = 1, NUM_PROFILES, 1 do
		local owner_table = profile_owners[i]

		if owner_table then
			local owner_peer_id = owner_table.peer_id
			local owner_local_player_id = owner_table.local_player_id

			if owner_peer_id ~= peer_id then
				if self_peer_id == peer_id then
					self:rpc_server_mark_profile_used(IS_LOCAL_CALL, owner_peer_id, owner_local_player_id, 0, i)
				else
					network_transmit:send_rpc("rpc_server_mark_profile_used", peer_id, owner_peer_id, owner_local_player_id, 0, i)
				end
			end
		elseif self_peer_id == peer_id then
			self:rpc_server_mark_profile_used(IS_LOCAL_CALL, NO_PEER, NO_LOCAL_PLAYER_ID, 0, i)
		else
			network_transmit:send_rpc("rpc_server_mark_profile_used", peer_id, NO_PEER, NO_LOCAL_PLAYER_ID, 0, i)
		end
	end

	self._all_synced = false
	local peer_table = self._loaded_peers[peer_id] or {}

	for _, local_player_id in pairs(local_ids) do
		peer_table[local_player_id] = false
	end

	self._loaded_peers[peer_id] = peer_table
end

ProfileSynchronizer.peer_entered_session = function (self, peer_id)
	self._hot_join_synced_peers[peer_id] = true
end

ProfileSynchronizer.peer_left_session = function (self, peer_id)
	self._hot_join_synced_peers[peer_id] = nil
end

function inventory_map_to_network_array(inventory_map, destination)
	local inventory_packages_lut = NetworkLookup.inventory_packages
	local destination_n = 0

	for inventory_package_name, _ in pairs(inventory_map) do
		local value = inventory_packages_lut[inventory_package_name]

		assert(value, "No existing inventory package for attempted name %q", inventory_package_name)

		destination_n = destination_n + 1
		destination[destination_n] = value
	end

	return destination_n
end

ProfileSynchronizer.rpc_server_mark_profile_used = function (self, sender, peer_id, local_player_id, previous_profile_index, profile_index)
	fassert(not self._is_server or sender == IS_LOCAL_CALL, "rpc_server_mark_profile_used was sent by another peer when we're server!")

	if peer_id == NO_PEER then
		peer_id = nil
	end

	if local_player_id == NO_LOCAL_PLAYER_ID then
		local_player_id = nil
	end

	assert((peer_id and local_player_id) or (not peer_id and not local_player_id))

	if previous_profile_index ~= 0 then
		local previous_owner = self._profile_owners[previous_profile_index]

		if previous_owner and (peer_id == nil or previous_owner.peer_id == peer_id) and (local_player_id == nil or previous_owner.local_player_id == local_player_id) then
			self._profile_owners[previous_profile_index] = nil

			if self._is_server then
				self._slot_allocator:free_slot(previous_profile_index)
			end
		end
	end

	if profile_index ~= 0 then
		if peer_id then
			self._profile_owners[profile_index] = {
				peer_id = peer_id,
				local_player_id = local_player_id
			}

			if self._is_server then
				local owner_table = self._profile_owners[profile_index]
				local is_human_player = (owner_table and self:is_human_player(owner_table.peer_id, owner_table.local_player_id)) or nil

				if is_human_player then
					self._slot_allocator:allocate_slot(profile_index, peer_id, local_player_id)
				else
					self._slot_allocator:free_slot(profile_index)
				end
			end
		else
			self._profile_owners[profile_index] = nil

			if self._is_server then
				self._slot_allocator:free_slot(profile_index)
			end
		end
	end

	profile_printf("[ProfileSynchronizer] rpc_server_mark_profile_used [peer_id %s:%i, previous profile %s, profile %s]", tostring(peer_id), local_player_id or NO_LOCAL_PLAYER_ID, tostring(previous_profile_index), tostring(profile_index))

	if self._is_server then
		local matchmaking_manager = Managers.matchmaking

		if matchmaking_manager then
			matchmaking_manager:update_profiles_data_on_clients()
		end
	end

	if peer_id == self._peer_id then
		local profile = SPProfiles[profile_index]
		local hero_name = profile.display_name
		local hero_attributes = Managers.backend:get_interface("hero_attributes")
		local career_index = hero_attributes:get(hero_name, "career")
		local inventory_list, inventory_list_first_person = self._inventory_package_synchronizer:build_inventory_lists(profile_index, career_index)
		local network_inventory_list = FrameTable.alloc_table()
		local network_inventory_list_first_person = FrameTable.alloc_table()

		inventory_map_to_network_array(inventory_list, network_inventory_list)
		inventory_map_to_network_array(inventory_list_first_person, network_inventory_list_first_person)
		self._network_transmit:send_rpc_server("rpc_client_select_inventory", local_player_id, network_inventory_list, network_inventory_list_first_person, NO_CLIENT_SYNC_ID)
	end
end

local inventory_list = {}
local inventory_list_first_person = {}

ProfileSynchronizer.rpc_client_select_inventory = function (self, sender, local_player_id, network_inventory_list, network_inventory_list_first_person, client_sync_id)
	local profile_index = self:profile_by_peer(sender, local_player_id)

	if profile_index then
		for i, package_id in ipairs(network_inventory_list) do
			inventory_list[i] = NetworkLookup.inventory_packages[package_id]
		end

		for i, package_id in ipairs(network_inventory_list_first_person) do
			inventory_list_first_person[i] = NetworkLookup.inventory_packages[package_id]
		end

		self:_profile_select_inventory(profile_index, inventory_list, inventory_list_first_person, sender, local_player_id, client_sync_id)
	end
end

local TEMP_PROFILE_INDICES = {}
local TEMP_PEERS = {}

ProfileSynchronizer._profile_select_inventory = function (self, profile_index, inventory_list, inventory_list_first_person, sender, local_player_id, client_sync_id)
	local network_transmit = self._network_transmit
	local inventory_package_synchronizer_server = self._inventory_package_synchronizer_server

	inventory_package_synchronizer_server:set_inventory_list(profile_index, inventory_list, inventory_list_first_person)
	table.clear(inventory_list)
	table.clear(inventory_list_first_person)
	assert(self._is_server, "profile_select_inventory called not on server, wtf?")

	local inventory_sync_id = self._inventory_sync_id + 1
	self._inventory_sync_id = inventory_sync_id
	local my_peer_id = self._peer_id
	local player_manager = self._player_manager

	table.clear(TEMP_PEERS)

	for _, owner_table in pairs(self._profile_owners) do
		TEMP_PEERS[owner_table.peer_id] = true
	end

	if DEDICATED_SERVER and not TEMP_PEERS[my_peer_id] then
		TEMP_PEERS[my_peer_id] = true
	end

	for owned_peer_id, _ in pairs(TEMP_PEERS) do
		for index, owner_table in pairs(self._profile_owners) do
			if owner_table.peer_id == owned_peer_id then
				TEMP_PROFILE_INDICES[index] = true
			end
		end

		local inventory_package_map = inventory_package_synchronizer_server:get_complete_package_map_for_profile(TEMP_PROFILE_INDICES)

		table.clear(TEMP_PROFILE_INDICES)

		local temporary_inventory_array = FrameTable.alloc_table()

		inventory_map_to_network_array(inventory_package_map, temporary_inventory_array)

		if client_sync_id > 0 and owned_peer_id == sender then
			network_transmit:send_rpc("rpc_server_set_inventory_sync_id", owned_peer_id, client_sync_id, inventory_sync_id)
		end

		network_transmit:send_rpc("rpc_server_set_inventory_packages", owned_peer_id, inventory_sync_id, temporary_inventory_array)
		network_printf("[NETWORK] send_rpc(rpc_server_set_inventory_packages) owned_peer_id:%s inventory_sync_id:%d my_peer_id:%s", owned_peer_id, inventory_sync_id, my_peer_id)
	end

	for peer_id, peer_table in pairs(self._loaded_peers) do
		for local_player_id, _ in pairs(peer_table) do
			peer_table[local_player_id] = false
		end
	end

	self._all_synced = false
end

ProfileSynchronizer.rpc_client_inventory_map_loaded = function (self, sender, inventory_sync_id)
	if inventory_sync_id == self._inventory_sync_id then
		local peer_table = self._loaded_peers[sender]

		if peer_table == nil then
			peer_table = {}
			self._loaded_peers[sender] = peer_table
		end

		for local_player_id, _ in pairs(peer_table) do
			peer_table[local_player_id] = true
		end
	end
end

ProfileSynchronizer.request_select_profile = function (self, profile_index, local_player_id)
	assert(not self._has_pending_request)

	local network_manager = Managers.state.network
	local game_session = network_manager:game()

	if game_session then
		self._has_pending_request = true

		self._network_transmit:send_rpc_server("rpc_client_request_mark_profile", profile_index, local_player_id)
	end
end

ProfileSynchronizer.get_first_free_profile = function (self)
	local ProfilePriority = ProfilePriority

	for i = 1, NUM_PROFILES, 1 do
		local prioritized_profile_id = ProfilePriority[i]

		if not self._profile_owners[prioritized_profile_id] then
			return prioritized_profile_id
		end
	end

	table.dump(self._profile_owners, "profile owners", 2)
	fassert(false, "Trying to get free profile when there are no free profiles.")
end

ProfileSynchronizer.rpc_client_request_mark_profile = function (self, sender, profile_index, local_player_id)
	local profile_owner = self._profile_owners[profile_index]
	local owned_by_another = profile_owner and profile_owner.peer_id ~= sender

	if owned_by_another then
		local result = REQUEST_RESULTS.failure

		self._network_transmit:send_rpc("rpc_server_request_mark_profile_result", sender, profile_index, result, local_player_id)
	else
		local result = REQUEST_RESULTS.success

		self._network_transmit:send_rpc("rpc_server_request_mark_profile_result", sender, profile_index, result, local_player_id)

		self._reserved_profiles[profile_index] = nil

		self:set_profile_peer_id(profile_index, sender, local_player_id)
	end
end

ProfileSynchronizer.rpc_server_request_mark_profile_result = function (self, sender, profile_index, result, local_player_id)
	self._request_local_player_id = local_player_id
	self._request_result = REQUEST_RESULTS[result]
	self._has_pending_request = false
end

ProfileSynchronizer.has_pending_request = function (self)
	return self._has_pending_request
end

ProfileSynchronizer.profile_request_result = function (self)
	return self._request_result, self._request_local_player_id
end

ProfileSynchronizer.clear_profile_request_result = function (self)
	self._request_result = nil
	self._request_local_player_id = nil
end

ProfileSynchronizer.is_human_player = function (self, peer_id, local_player_id)
	local player = self._player_manager:player(peer_id, local_player_id)

	return not player or player:is_player_controlled()
end

ProfileSynchronizer.reserve_profile = function (self, profile_index, peer_id, local_player_id)
	fassert(not self._reserved_profiles[profile_index], "Trying to reserve already reserved profile index")
	profile_printf("[ProfileSynchronizer] reserve_profile %i [peer_id %s:%i]", profile_index, peer_id, local_player_id)

	self._reserved_profiles[profile_index] = {
		peer_id = peer_id,
		local_player_id = local_player_id
	}
end

ProfileSynchronizer.unreserve_profile = function (self, profile_index, peer_id, local_player_id)
	local existing_reservation = self._reserved_profiles[profile_index]

	fassert(existing_reservation and existing_reservation.peer_id == peer_id and existing_reservation.local_player_id == local_player_id, "Profile slot unreserve mismatch")
	profile_printf("[ProfileSynchronizer] unreserve_profile %i [peer_id %s:%i]", profile_index, peer_id, local_player_id)

	self._reserved_profiles[profile_index] = nil
end

ProfileSynchronizer.owner_type = function (self, profile_index)
	if self._reserved_profiles[profile_index] then
		return "human", "reserved"
	end

	local owner_table = self._profile_owners[profile_index]

	if owner_table and self:is_human_player(owner_table.peer_id, owner_table.local_player_id) then
		return "human"
	elseif owner_table then
		return "bot"
	else
		return "available"
	end
end

ProfileSynchronizer.resync_loadout = function (self, profile_index, career_index, player)
	local inventory_list, inventory_list_first_person = self._inventory_package_synchronizer:build_inventory_lists(profile_index, career_index)
	local network_inventory_list = FrameTable.alloc_table()
	local network_inventory_list_first_person = FrameTable.alloc_table()

	inventory_map_to_network_array(inventory_list, network_inventory_list)
	inventory_map_to_network_array(inventory_list_first_person, network_inventory_list_first_person)

	self._client_sync_id = self._client_sync_id + 1
	local client_sync_id = self._client_sync_id

	self._network_transmit:send_rpc_server("rpc_client_select_inventory", player:local_player_id(), network_inventory_list, network_inventory_list_first_person, client_sync_id)

	return client_sync_id
end

ProfileSynchronizer.rpc_server_set_inventory_sync_id = function (self, sender, client_sync_id, inventory_sync_id)
	self._client_sync_id_map[client_sync_id] = inventory_sync_id
end

ProfileSynchronizer.rpc_server_inventory_all_synced = function (self, sender, inventory_sync_id)
	self.last_inventory_sync_id = inventory_sync_id
end

ProfileSynchronizer.all_clients_have_loaded_sync_id = function (self, client_sync_id)
	local inventory_sync_id = self._client_sync_id_map[client_sync_id]

	if not inventory_sync_id then
		return false
	end

	local all_have_loaded = inventory_sync_id <= self.last_inventory_sync_id

	return all_have_loaded
end

ProfileSynchronizer._draw_state = function (self)
	if DEDICATED_SERVER then
		return
	end

	local font = "foundation/fonts/debug"
	local font_material = "debug"
	local text_height = 20
	local row_height = 20
	local margin = 32
	local profile_width = 84
	local owner_width = 196
	local state_width = 96
	local background_color = Color(128, 0, 0, 0)
	local text_color = Color(255, 255, 255, 255)
	local _, height = Gui.resolution()
	local y = height - margin - text_height
	local world = Application.debug_world()

	if self._gui == nil then
		self._gui = World.create_screen_gui(world, "immediate", "material", font)
	end

	Gui.rect(self._gui, Vector2(0, 0), Vector2(margin * 2 + profile_width + owner_width + state_width, height), background_color)

	local x = margin

	Gui.text(self._gui, "Profile", font, text_height, font_material, Vector3(x, y, 0), text_color)

	x = x + profile_width

	Gui.text(self._gui, "Owner", font, text_height, font_material, Vector3(x, y, 0), text_color)

	x = x + owner_width

	Gui.text(self._gui, "Type", font, text_height, font_material, Vector3(x, y, 0), text_color)

	y = y - 4

	Gui.rect(self._gui, Vector2(margin, y), Vector2(profile_width + owner_width + state_width, 1), text_color)

	y = y - row_height

	for index, owner_table in pairs(self._profile_owners) do
		x = margin

		Gui.text(self._gui, tostring(index), font, text_height, font_material, Vector3(x, y, 0), text_color)

		x = x + profile_width

		Gui.text(self._gui, string.format("%s:%d", owner_table.peer_id, owner_table.local_player_id), font, text_height, font_material, Vector3(x, y, 0), text_color)

		x = x + owner_width
		local owner_type, reserved = self:owner_type(index)

		if reserved ~= nil then
			owner_type = reserved
		end

		Gui.text(self._gui, owner_type, font, text_height, font_material, Vector3(x, y, 0), text_color)

		y = y - row_height
	end
end

return
