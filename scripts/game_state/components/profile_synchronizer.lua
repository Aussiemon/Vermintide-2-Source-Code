require("scripts/game_state/components/inventory_package_synchronizer")
require("scripts/game_state/components/inventory_package_synchronizer_client")
require("scripts/settings/profiles/sp_profiles")

local NUM_PROFILES = #SPProfiles
local network_printf = printf

local function inventory_map_to_network_array(inventory_map, destination)
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

ProfileSynchronizer = class(ProfileSynchronizer)

ProfileSynchronizer.init = function (self, is_server, lobby_object, network_handler)
	local profile_owners = {}

	for i = 1, NUM_PROFILES, 1 do
		profile_owners[i] = {}
	end

	self._profile_owners = profile_owners
	self._is_server = is_server

	if is_server then
		self._lobby_host = lobby_object
		self._inventory_package_synchronizer_server = InventoryPackageSynchronizer:new()
		self._network_server = network_handler
		self._slot_allocator = self._network_server.slot_allocator
		self._server_peer_id = Network.peer_id()
	else
		self._lobby_client = lobby_object
		self._server_peer_id = self._lobby_client:lobby_host()
	end

	self._inventory_package_synchronizer = InventoryPackageSynchronizerClient:new(is_server)
	self._peer_id = Network.peer_id()
	self._inventory_sync_id = 0
	self._client_sync_id = 0
	self._client_sync_id_map = {}
	self._loaded_peers = {}
	self._all_synced = false
	self._player_manager = Managers.player
	self._hot_join_synced_peers = {}
end

ProfileSynchronizer.dump = function (self)
	local s = "ProfileSynchronizer:\n"

	for index, owners in pairs(self._profile_owners) do
		for i = 1, #owners, 1 do
			local owner_table = owners[i]
			s = s .. string.format("%d: %s (%d)\n", index, owner_table.peer_id, owner_table.local_player_id)
		end
	end

	print(s)
end

local RPCS = {
	"rpc_server_assign_peer_to_profile",
	"rpc_server_unassign_peer_to_profile",
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

	local my_peer_id = Network.peer_id()

	for peer_id, _ in pairs(self._hot_join_synced_peers) do
		if peer_id ~= my_peer_id then
			RPC[rpc](peer_id, ...)
		end
	end
end

ProfileSynchronizer.update = function (self)
	self._inventory_package_synchronizer:update()

	local was_synced = self._all_synced
	local all_synced = (next(self._loaded_peers) and true) or false

	for _, peer_table in pairs(self._loaded_peers) do
		for _, is_synced in pairs(peer_table) do
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
end

ProfileSynchronizer._create_owner_table = function (self, peer_id, local_player_id, career_index)
	return {
		peer_id = peer_id,
		local_player_id = local_player_id,
		career_index = career_index
	}
end

local IS_LOCAL_CALL = "is_local_call"

ProfileSynchronizer._assign_peer_to_profile = function (self, peer_id, local_player_id, profile_index, career_index)
	fassert(self._is_server)
	fassert(profile_index)
	printf("Assigning peer(%s:%s) to profile(%s) career(%s)", peer_id, local_player_id, profile_index, career_index)

	local previous_profile_index, previous_career_index = self:profile_by_peer(peer_id, local_player_id)

	if previous_profile_index then
		self:unassign_peer_to_profile(peer_id, local_player_id, previous_profile_index, previous_career_index)
	end

	self:rpc_server_assign_peer_to_profile(IS_LOCAL_CALL, peer_id, local_player_id, profile_index, career_index)
	self:_send_rpc_lobby_clients("rpc_server_assign_peer_to_profile", peer_id, local_player_id, profile_index, career_index)
end

ProfileSynchronizer.unassign_peer_to_profile = function (self, peer_id, local_player_id, profile_index, career_index)
	local slot = nil
	local owners = self._profile_owners[profile_index]

	for i, owner_table in ipairs(owners) do
		if owner_table.peer_id == peer_id and owner_table.local_player_id == local_player_id then
			slot = i
		end
	end

	table.remove(owners, slot)

	if self._is_server then
		local hero_profile_index = GetHeroAffiliationIndex(profile_index)

		if hero_profile_index then
			local is_human_player = self:is_human_player(peer_id, local_player_id)

			if is_human_player then
				self._slot_allocator:free_slot(hero_profile_index)
			end
		end

		self:_send_rpc_lobby_clients("rpc_server_unassign_peer_to_profile", peer_id, local_player_id, profile_index, career_index)
	end
end

ProfileSynchronizer._unassign_all_peers_profiles = function (self, peer_id)
	for profile_index, profile_owners in pairs(self._profile_owners) do
		for _, owner_table in ipairs(profile_owners) do
			local owner_peer_id = owner_table.peer_id

			if owner_peer_id == peer_id then
				local owner_local_player_id = owner_table.local_player_id
				local career_index = owner_table.career_index

				self:unassign_peer_to_profile(owner_peer_id, owner_local_player_id, profile_index, career_index)
			end
		end
	end
end

ProfileSynchronizer.all_synced = function (self)
	return self._all_synced
end

ProfileSynchronizer.owners = function (self, profile_index)
	return self._profile_owners[profile_index]
end

ProfileSynchronizer.profile_reserver_peer_id = function (self, profile_index)
	return self._slot_allocator:owner(profile_index)
end

ProfileSynchronizer.hot_join_sync = function (self, peer_id, local_ids)
	local profile_owners = self._profile_owners
	local network_transmit = self._network_transmit
	local sent_assign_message = false

	for i = 1, NUM_PROFILES, 1 do
		local owners = profile_owners[i]

		for _, owner_table in ipairs(owners) do
			if owner_table then
				local owner_peer_id = owner_table.peer_id
				local owner_local_player_id = owner_table.local_player_id
				local career_index = owner_table.career_index

				network_transmit:send_rpc("rpc_server_assign_peer_to_profile", peer_id, owner_peer_id, owner_local_player_id, i, career_index)

				sent_assign_message = true
			end
		end
	end

	self:_set_inventory_packages_for_peer(peer_id, self._inventory_sync_id)

	local peer_table = self._loaded_peers[peer_id]

	for _, local_player_id in pairs(local_ids) do
		peer_table[local_player_id] = not sent_assign_message
	end

	self._loaded_peers[peer_id] = peer_table
	self._all_synced = false
end

ProfileSynchronizer.peer_entered_session = function (self, peer_id, local_player_id)
	self._hot_join_synced_peers[peer_id] = true
	local peer_table = self._loaded_peers[peer_id] or {}
	peer_table[local_player_id] = false
	self._loaded_peers[peer_id] = peer_table
	self._all_synced = false
end

ProfileSynchronizer.peer_left_session = function (self, peer_id)
	self._hot_join_synced_peers[peer_id] = nil
	self._loaded_peers[peer_id] = nil

	self:_unassign_all_peers_profiles(peer_id)
	self._inventory_package_synchronizer_server:clear_inventory_list(peer_id)
end

ProfileSynchronizer.peer_already_added = function (self, peer_id)
	return not not self._hot_join_synced_peers[peer_id]
end

local TEMP_PEERS = {}

ProfileSynchronizer._profile_select_inventory = function (self, profile_index, inventory_list, inventory_list_first_person, sender, local_player_id, client_sync_id)
	self._inventory_package_synchronizer_server:set_inventory_list(sender, local_player_id, profile_index, inventory_list, inventory_list_first_person)
	table.clear(inventory_list)
	table.clear(inventory_list_first_person)
	assert(self._is_server, "profile_select_inventory called not on server, wtf?")

	local inventory_sync_id = self._inventory_sync_id + 1
	self._inventory_sync_id = inventory_sync_id
	local my_peer_id = self._peer_id

	table.clear(TEMP_PEERS)

	for peer_id, _ in pairs(self._hot_join_synced_peers) do
		TEMP_PEERS[peer_id] = true
	end

	if DEDICATED_SERVER and not TEMP_PEERS[my_peer_id] then
		TEMP_PEERS[my_peer_id] = true
	end

	local network_transmit = self._network_transmit

	for owned_peer_id, _ in pairs(TEMP_PEERS) do
		self:_set_inventory_packages_for_peer(owned_peer_id, inventory_sync_id)

		if NO_CLIENT_SYNC_ID < client_sync_id and owned_peer_id == sender then
			network_transmit:send_rpc("rpc_server_set_inventory_sync_id", owned_peer_id, client_sync_id, inventory_sync_id)
		end
	end

	for _, peer_table in pairs(self._loaded_peers) do
		for loaded_local_player_id, _ in pairs(peer_table) do
			peer_table[loaded_local_player_id] = false
		end
	end

	self._all_synced = false
end

ProfileSynchronizer._set_inventory_packages_for_peer = function (self, peer_id, inventory_sync_id)
	local inventory_package_map = self._inventory_package_synchronizer_server:get_complete_package_map_for_peer(peer_id)
	local temporary_inventory_array = FrameTable.alloc_table()

	inventory_map_to_network_array(inventory_package_map, temporary_inventory_array)
	self._network_transmit:send_rpc("rpc_server_set_inventory_packages", peer_id, inventory_sync_id, temporary_inventory_array)
	network_printf("[NETWORK] send_rpc(rpc_server_set_inventory_packages) peer_id:%s inventory_sync_id:%d my_peer_id:%s", peer_id, inventory_sync_id, self._peer_id)
end

ProfileSynchronizer.select_profile = function (self, peer_id, local_player_id, profile_index, career_index)
	fassert(self._is_server, "Should only be called on server.")
	self:_assign_peer_to_profile(peer_id, local_player_id, profile_index, career_index)
end

ProfileSynchronizer.get_first_free_profile = function (self)
	local career_index = 1
	local profiles = SPProfiles

	for profile_index = 1, #profiles, 1 do
		if table.is_empty(self._profile_owners[profile_index]) then
			return profile_index, career_index
		end
	end

	table.dump(self._profile_owners, "profile owners", 2)
	fassert(false, "Trying to get free profile when there are no free profiles.")
end

ProfileSynchronizer.profile_career_exists = function (self, profile_index, career_index)
	local profile = SPProfiles[profile_index]
	local careers = profile and profile.careers
	local career = careers and careers[career_index]

	return career ~= nil
end

ProfileSynchronizer.profile_career_unlocked = function (self, profile_index, career_index)
	local profile = SPProfiles[profile_index]
	local careers = profile and profile.careers
	local career = careers and careers[career_index]

	return career and career.is_unlocked_function(profile.display_name, ExperienceSettings.max_level)
end

ProfileSynchronizer.is_human_player = function (self, peer_id, local_player_id)
	local player = self._player_manager:player(peer_id, local_player_id)

	return not player or player:is_player_controlled()
end

ProfileSynchronizer.profile_by_peer = function (self, peer_id, local_player_id)
	local profile_owners = self._profile_owners

	for i = 1, NUM_PROFILES, 1 do
		local owners = profile_owners[i]

		for _, owner_table in ipairs(owners) do
			if owner_table.peer_id == peer_id and owner_table.local_player_id == local_player_id then
				return i, owner_table.career_index
			end
		end
	end
end

ProfileSynchronizer.resync_loadout = function (self, profile_index, career_index, player)
	CosmeticUtils.sync_local_player_cosmetics(profile_index, career_index)

	local local_player_id = (player and player:local_player_id()) or 1
	local inventory_list, inventory_list_first_person = self._inventory_package_synchronizer:build_inventory_lists(profile_index, career_index)
	local network_inventory_list = FrameTable.alloc_table()
	local network_inventory_list_first_person = FrameTable.alloc_table()

	inventory_map_to_network_array(inventory_list, network_inventory_list)
	inventory_map_to_network_array(inventory_list_first_person, network_inventory_list_first_person)

	self._client_sync_id = self._client_sync_id + 1
	local client_sync_id = self._client_sync_id

	self._network_transmit:send_rpc_server("rpc_client_select_inventory", local_player_id, network_inventory_list, network_inventory_list_first_person, client_sync_id)

	return client_sync_id
end

ProfileSynchronizer.all_clients_have_loaded_sync_id = function (self, client_sync_id)
	local inventory_sync_id = self._client_sync_id_map[client_sync_id]

	if not inventory_sync_id then
		return false
	end

	local all_have_loaded = inventory_sync_id <= self.last_inventory_sync_id

	return all_have_loaded
end

ProfileSynchronizer.is_only_owner = function (self, peer_id, local_player_id, profile_index)
	local peer_profile_index = self:profile_by_peer(peer_id, local_player_id)

	if peer_profile_index ~= profile_index then
		return false
	end

	local owners = self._profile_owners[profile_index]

	for i = 1, #owners, 1 do
		local owner_table = owners[i]
		local owner_peer_id = owner_table.peer_id
		local owner_local_player_id = owner_table.local_player_id

		if peer_id ~= owner_peer_id or owner_local_player_id ~= local_player_id then
			return false
		end
	end

	return true
end

ProfileSynchronizer._is_hero_profile = function (self, profile_index)
	local profile = SPProfiles[profile_index]

	return profile.affiliation == "heroes"
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

ProfileSynchronizer.rpc_server_assign_peer_to_profile = function (self, sender, peer_id, local_player_id, profile_index, career_index)
	if sender ~= IS_LOCAL_CALL and sender ~= self._server_peer_id then
		return
	end

	printf("ProfileSynchronizer:rpc_server_assign_peer_to_profile() peer_id(%s) local_player_id(%s) profile_index(%s) career_index(%s)", peer_id, local_player_id, profile_index, career_index)
	fassert(not self._is_server or sender == IS_LOCAL_CALL, "rpc_server_assign_peer_to_profile was sent by another peer when we're server!")
	fassert(peer_id and local_player_id, "Sanity check.")

	local profile_owners = self._profile_owners[profile_index]
	profile_owners[#profile_owners + 1] = self:_create_owner_table(peer_id, local_player_id, career_index)

	if self._is_server then
		local is_hero_profile = self:_is_hero_profile(profile_index)

		if is_hero_profile then
			local hero_profile_index = GetHeroAffiliationIndex(profile_index)

			fassert(hero_profile_index, "sanity check.")

			local is_human_player = self:is_human_player(peer_id, local_player_id) or false

			if is_human_player then
				self._slot_allocator:allocate_slot(hero_profile_index, peer_id, local_player_id)
			else
				self._slot_allocator:free_slot(hero_profile_index)
			end
		end
	end

	if self._is_server then
		local matchmaking_manager = Managers.matchmaking

		if matchmaking_manager then
			matchmaking_manager:update_profiles_data_on_clients()
		end
	end

	if peer_id == self._peer_id then
		self:_update_backend_selected_career(profile_index, career_index)
		CosmeticUtils.sync_local_player_cosmetics(profile_index, career_index)

		local inventory_list, inventory_list_first_person = self._inventory_package_synchronizer:build_inventory_lists(profile_index, career_index)
		local network_inventory_list = FrameTable.alloc_table()
		local network_inventory_list_first_person = FrameTable.alloc_table()

		inventory_map_to_network_array(inventory_list, network_inventory_list)
		inventory_map_to_network_array(inventory_list_first_person, network_inventory_list_first_person)
		table.dump(inventory_list, "inventory_list")
		table.dump(inventory_list_first_person, "inventory_list_first_person")
		self._network_transmit:send_rpc_server("rpc_client_select_inventory", local_player_id, network_inventory_list, network_inventory_list_first_person, NO_CLIENT_SYNC_ID)
	end

	local status = Managers.party:get_player_status(peer_id, local_player_id)
	status.profile_index = profile_index
	status.career_index = career_index
	status.profile_id = SPProfiles[profile_index].display_name

	for _, peer_table in pairs(self._loaded_peers) do
		for loaded_local_player_id, _ in pairs(peer_table) do
			peer_table[loaded_local_player_id] = false
		end
	end

	self._all_synced = false
end

ProfileSynchronizer._update_backend_selected_career = function (self, profile_index, career_index)
	local profile_settings = SPProfiles[profile_index]
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local hero_name = profile_settings.display_name

	hero_attributes:set(hero_name, "career", career_index)
end

ProfileSynchronizer.rpc_server_unassign_peer_to_profile = function (self, sender, peer_id, local_player_id, profile_index, career_index)
	if sender ~= self._server_peer_id then
		return
	end

	self:unassign_peer_to_profile(peer_id, local_player_id, profile_index, career_index)
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

ProfileSynchronizer.rpc_server_inventory_all_synced = function (self, sender, inventory_sync_id)
	if sender ~= self._server_peer_id then
		return
	end

	self.last_inventory_sync_id = inventory_sync_id
end

ProfileSynchronizer.rpc_server_set_inventory_sync_id = function (self, sender, client_sync_id, inventory_sync_id)
	if sender ~= self._server_peer_id then
		return
	end

	self._client_sync_id_map[client_sync_id] = inventory_sync_id
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

	for index, profile_owners in pairs(self._profile_owners) do
		for _, owner_table in ipairs(profile_owners) do
			x = margin

			Gui.text(self._gui, tostring(index), font, text_height, font_material, Vector3(x, y, 0), text_color)

			x = x + profile_width

			Gui.text(self._gui, string.format("%s:%d", owner_table.peer_id, owner_table.local_player_id), font, text_height, font_material, Vector3(x, y, 0), text_color)

			x = x + owner_width
			y = y - row_height
		end
	end
end

return
