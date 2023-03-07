require("scripts/settings/profiles/sp_profiles")

local NUM_HERO_PROFILES = #PROFILES_BY_AFFILIATION.heroes
local PACKAGE_MANAGER_REFERENCE_NAME = "ProfileSynchronizer"
local global_printf = printf

local function dprintf(...)
	if script_data.profile_synchronizer_debug_logging then
		local message = sprintf(...)

		global_printf("[ProfileSynchronizer] %s", message)
	end
end

local function printf(...)
	local message = sprintf(...)

	global_printf("[ProfileSynchronizer] %s", message)
end

local function join_lobby_entry(peer_id, local_player_index)
	return string.format("%s:%d", peer_id, local_player_index)
end

local function lobby_slot_name(profile_index)
	return string.format("player_slot_%d", profile_index)
end

local function split_lobby_entry(entry)
	local split_point = string.find(entry, ":")
	local peer_id = entry:sub(1, split_point - 1)
	local local_player_index = tonumber(entry:sub(split_point + 1))

	return peer_id, local_player_index
end

local function profile_packages(profile_index, career_index, is_first_person)
	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career = careers[career_index]
	local career_name = career.name
	local slots_n = #InventorySettings.slots
	local packages_list = {}

	for i = 1, slots_n do
		repeat
			local slot = InventorySettings.slots[i]
			local slot_name = slot.name
			local slot_category = slot.category
			local item = BackendUtils.get_loadout_item(career_name, slot_name)

			if not item then
				break
			end

			local item_data = item.data
			local backend_id = item.backend_id
			local item_template = BackendUtils.get_item_template(item_data, backend_id)
			local item_units = BackendUtils.get_item_units(item_data, backend_id)

			if slot_category == "weapon" then
				local weapon_packages = WeaponUtils.get_weapon_packages(item_template, item_units, is_first_person)

				for j = 1, #weapon_packages do
					local package_name = weapon_packages[j]
					packages_list[package_name] = false
				end
			else
				if slot_category == "attachment" then
					if item_units.unit then
						packages_list[item_units.unit] = false
					end

					local material_changes = item_template.character_material_changes

					if material_changes then
						packages_list[material_changes.package_name] = false
					end

					break
				end

				if slot_category == "cosmetic" then
					break
				end

				error("ProfileSynchronizer unknown slot_category: " .. slot_category)
			end
		until true
	end

	local base_skin_name = career.base_skin
	local skin_item = BackendUtils.get_loadout_item(career_name, "slot_skin")
	local skin_name = skin_item and skin_item.data.name or base_skin_name
	local skin_packages = CosmeticsUtils.retrieve_skin_packages(skin_name, is_first_person)

	for i = 1, #skin_packages do
		local package_name = skin_packages[i]
		packages_list[package_name] = false
	end

	if career.package_name then
		packages_list[career.package_name] = false
	end

	if career.talent_packages then
		local talent_interface = Managers.backend:get_talents_interface()
		local talent_ids = talent_interface:get_talent_ids(career_name)

		career.talent_packages(talent_ids, packages_list, is_first_person)
	end

	packages_list[career.package_name] = false

	return packages_list
end

local function build_inventory_lists(profile_index, career_index)
	if not profile_index or profile_index == 0 then
		return {}, {}
	end

	local inventory_list = profile_packages(profile_index, career_index, false)
	local inventory_list_first_player = profile_packages(profile_index, career_index, true)

	return inventory_list, inventory_list_first_player
end

local function update_inventory_data(state, peer_id, local_player_id, profile_index, career_index)
	local inventory_list, inventory_list_first_person = build_inventory_lists(profile_index, career_index)
	local inventory_id = math.random_seed()

	state:set_inventory_data(peer_id, local_player_id, {
		inventory_id = inventory_id,
		first_person = inventory_list_first_person,
		third_person = inventory_list
	})

	return inventory_id
end

local function are_all_synced_for_peer(state, peer_id, local_player_id, ignore_loading_peers)
	local inventory_data = state:get_inventory_data(peer_id, local_player_id)
	local inventory_id = inventory_data.inventory_id

	if inventory_id == 0 then
		return false
	end

	local peers_with_full_profiles = state:get_peers_with_full_profiles()

	for _, other_peer in ipairs(peers_with_full_profiles) do
		local other_peer_id = other_peer.peer_id

		if not ignore_loading_peers or state:is_peer_ingame(other_peer_id) then
			local loaded_inventory_id = state:get_loaded_inventory_id(other_peer_id, peer_id, local_player_id)

			if inventory_id ~= loaded_inventory_id then
				return false
			end
		end
	end

	return true
end

local function are_all_synced(state, ignore_loading_peers)
	local peers_with_full_profiles = state:get_peers_with_full_profiles()

	for _, peer in ipairs(peers_with_full_profiles) do
		local peer_id = peer.peer_id
		local local_player_id = peer.local_player_id
		local peer_all_synced = are_all_synced_for_peer(state, peer_id, local_player_id, ignore_loading_peers)

		if not peer_all_synced then
			return false
		end
	end

	return true
end

local missing_packages = {}
local all_needed_packages = {}
local packages_to_remove = {}

local function update_local_packages(state)
	local package_manager = Managers.package
	local own_peer_id = state:get_own_peer_id()
	local loaded_or_loading_packages = state:get_loaded_or_loading_packages()

	table.clear(missing_packages)
	table.clear(all_needed_packages)
	table.clear(packages_to_remove)

	local peers_with_full_profiles = state:get_peers_with_full_profiles()

	for _, peer in ipairs(peers_with_full_profiles) do
		local peer_id = peer.peer_id
		local local_player_id = peer.local_player_id
		local inventory_data = state:get_inventory_data(peer_id, local_player_id)

		if inventory_data then
			local is_owner = peer_id == own_peer_id
			local needed_packages = is_owner and inventory_data.first_person or inventory_data.third_person

			for needed_package, _ in pairs(needed_packages) do
				all_needed_packages[needed_package] = true
			end

			local loaded_inventory_id = state:get_loaded_inventory_id(own_peer_id, peer_id, local_player_id)

			if loaded_inventory_id ~= inventory_data.inventory_id then
				local all_loaded = true

				for needed_package, _ in pairs(needed_packages) do
					if not package_manager:has_loaded(needed_package, PACKAGE_MANAGER_REFERENCE_NAME) then
						missing_packages[needed_package] = true
						all_loaded = false
					end
				end

				if all_loaded then
					state:set_own_loaded_inventory_id(peer_id, local_player_id, inventory_data.inventory_id)
				end
			end
		end
	end

	for missing_package, _ in pairs(missing_packages) do
		if not package_manager:is_loading(missing_package) then
			local async = true
			loaded_or_loading_packages[missing_package] = true

			package_manager:load(missing_package, PACKAGE_MANAGER_REFERENCE_NAME, nil, async)
		end
	end

	for package, _ in pairs(loaded_or_loading_packages) do
		packages_to_remove[package] = true
	end

	for needed_package, _ in pairs(all_needed_packages) do
		packages_to_remove[needed_package] = nil
	end

	for package_to_remove, _ in pairs(packages_to_remove) do
		if package_manager:can_unload(package_to_remove) then
			package_manager:unload(package_to_remove, PACKAGE_MANAGER_REFERENCE_NAME)

			loaded_or_loading_packages[package_to_remove] = nil
		end
	end

	state:set_loaded_or_loading_packages(loaded_or_loading_packages)
end

local function unload_all_packages(state)
	local loaded_or_loading_packages = state:get_loaded_or_loading_packages()
	local package_manager = Managers.package

	for package_name, _ in pairs(loaded_or_loading_packages) do
		package_manager:unload(package_name, PACKAGE_MANAGER_REFERENCE_NAME)
	end
end

ProfileSynchronizer = class(ProfileSynchronizer)

ProfileSynchronizer.init = function (self, is_server, lobby_object, network_state)
	self._state = network_state
	self._lobby = lobby_object
	self._cached_all_synced_for_peer = {
		ingame = {},
		any = {}
	}
end

local RPCS = {
	"rpc_assign_peer_to_profile"
}

ProfileSynchronizer.register_rpcs = function (self, network_event_delegate, network_transmit)
	self._network_event_delegate = network_event_delegate

	self._network_event_delegate:register(self, unpack(RPCS))
end

ProfileSynchronizer.unregister_network_events = function (self)
	self._network_event_delegate:unregister(self)
end

ProfileSynchronizer.destroy = function (self)
	unload_all_packages(self._state)
end

ProfileSynchronizer.update = function (self)
	update_local_packages(self._state)
end

ProfileSynchronizer.hot_join_sync = function (self, peer_id)
	fassert(self._state:is_server(), "only for the server")
	printf("Peer %s entered session", peer_id)
	printf("Running hot_join_sync for peer %s", peer_id)

	local channel_id = PEER_ID_TO_CHANNEL[peer_id]
	local peers_with_full_profiles = self._state:get_peers_with_full_profiles()

	for _, other_peer in ipairs(peers_with_full_profiles) do
		local other_peer_id = other_peer.peer_id
		local other_local_player_id = other_peer.local_player_id
		local other_profile_index = other_peer.profile_index
		local other_career_index = other_peer.career_index
		local other_is_bot = other_peer.is_bot

		RPC.rpc_assign_peer_to_profile(channel_id, other_peer_id, other_local_player_id, other_profile_index, other_career_index, other_is_bot)
	end
end

ProfileSynchronizer.clear_peer_data = function (self, peer_id)
	fassert(self._state:is_server(), "only for the server")
	printf("Peer %s left session", peer_id)
	self:_unassign_profiles_of_peer(peer_id)
	self:_clear_profile_index_reservation(peer_id)
	self:_sync_lobby_data()
end

ProfileSynchronizer.get_profile_index_reservation = function (self, profile_index)
	local peer_id = self._state:get_profile_index_reservation(profile_index)

	return peer_id
end

ProfileSynchronizer.try_reserve_profile_for_peer = function (self, peer_id, profile_index)
	fassert(self._state:is_server(), "Should only be called on server.")

	local reserver_peer = self._state:get_profile_index_reservation(profile_index)

	if reserver_peer == peer_id then
		return true
	end

	if reserver_peer == nil then
		printf("Reserving profile index %d to peer %s", profile_index, peer_id)
		self:_clear_profile_index_reservation(peer_id)
		self._state:set_profile_index_reservation(profile_index, peer_id)
		self:_sync_lobby_data()

		return true
	end

	return false
end

ProfileSynchronizer.clear_profile_index_reservation = function (self, peer_id)
	self:_clear_profile_index_reservation(peer_id)
	self:_sync_lobby_data()
end

ProfileSynchronizer.profile_by_peer = function (self, peer_id, local_player_id)
	local peers_with_full_profiles = self._state:get_peers_with_full_profiles()

	for _, other_peer in ipairs(peers_with_full_profiles) do
		local other_peer_id = other_peer.peer_id
		local other_local_player_id = other_peer.local_player_id

		if other_peer_id == peer_id and other_local_player_id == local_player_id then
			local other_profile_index = other_peer.profile_index
			local other_career_index = other_peer.career_index

			return other_profile_index, other_career_index
		end
	end

	return nil, nil
end

ProfileSynchronizer.get_peers_with_full_profiles = function (self)
	return self._state:get_peers_with_full_profiles()
end

ProfileSynchronizer.assign_full_profile = function (self, peer_id, local_player_id, profile_index, career_index, is_bot)
	local state = self._state

	fassert(state:is_server(), "Should only be called on server.")
	printf("Assigning peer(%s:%s) to profile(%s) career(%s)", peer_id, local_player_id, profile_index, career_index)
	self:_unassign_profiles_of_peer(peer_id, local_player_id)

	local status = Managers.party:get_player_status(peer_id, local_player_id)

	self:_assign_peer_to_profile(peer_id, local_player_id, profile_index, career_index, is_bot, status)

	local own_peer_id = state:get_own_peer_id()
	local peers = state:get_peers()

	for _, other_peer_id in ipairs(peers) do
		if other_peer_id ~= own_peer_id then
			local other_channel_id = PEER_ID_TO_CHANNEL[other_peer_id]

			RPC.rpc_assign_peer_to_profile(other_channel_id, peer_id, local_player_id, profile_index, career_index, is_bot)
		end
	end
end

ProfileSynchronizer.unassign_profiles_of_peer = function (self, peer_id, optional_local_player_id)
	self:_unassign_profiles_of_peer(peer_id, optional_local_player_id)
end

ProfileSynchronizer.get_first_free_profile = function (self)
	local career_index = 1

	for profile_index = 1, NUM_HERO_PROFILES do
		local profile_reserver_peer_id = self._state:get_profile_index_reservation(profile_index)

		if not profile_reserver_peer_id then
			return profile_index, career_index
		end
	end

	fassert(false, "Trying to get free profile when there are no free profiles.")
end

ProfileSynchronizer.is_profile_in_use = function (self, profile_index)
	local peers_with_full_profiles = self._state:get_peers_with_full_profiles()

	for _, peer in ipairs(peers_with_full_profiles) do
		if peer.profile_index == profile_index then
			return true
		end
	end

	return false
end

ProfileSynchronizer.all_synced = function (self)
	local current_revision = self._state:get_revision()

	if self._cached_all_synced_revision ~= current_revision then
		local ignore_loading_peers = false
		self._cached_all_synced = are_all_synced(self._state, ignore_loading_peers)
		self._cached_all_synced_revision = current_revision
	end

	return self._cached_all_synced
end

ProfileSynchronizer.all_synced_for_peer = function (self, peer_id, local_player_id)
	local ignore_loading_peers = false

	return self:_all_synced_for_peer(peer_id, local_player_id, ignore_loading_peers)
end

ProfileSynchronizer.all_ingame_synced_for_peer = function (self, peer_id, local_player_id)
	local ignore_loading_peers = true

	return self:_all_synced_for_peer(peer_id, local_player_id, ignore_loading_peers)
end

ProfileSynchronizer._all_synced_for_peer = function (self, peer_id, local_player_id, ignore_loading_peers)
	local current_revision = self._state:get_revision()
	local cache_type = ignore_loading_peers and "ingame" or "any"
	local cache_for_peer = self._cached_all_synced_for_peer[cache_type][peer_id]
	local cached_data = cache_for_peer and cache_for_peer[local_player_id]
	local cached_data_revision_key = 1
	local cached_data_result_key = 2

	if not cached_data or cached_data[cached_data_revision_key] ~= current_revision then
		local result = are_all_synced_for_peer(self._state, peer_id, local_player_id, ignore_loading_peers)
		cached_data = {
			current_revision,
			result
		}
		cache_for_peer = cache_for_peer or {}
		cache_for_peer[local_player_id] = cached_data
		self._cached_all_synced_for_peer[cache_type][peer_id] = cache_for_peer
	end

	return cached_data[cached_data_result_key]
end

ProfileSynchronizer.is_peer_all_synced = function (self, peer_id)
	local peers_with_full_profiles = self._state:get_peers_with_full_profiles()

	for _, other_peer in ipairs(peers_with_full_profiles) do
		local other_peer_id = other_peer.peer_id
		local other_local_player_id = other_peer.local_player_id
		local other_inventory_data = self._state:get_inventory_data(other_peer_id, other_local_player_id)
		local loaded_inventory_id = self._state:get_loaded_inventory_id(peer_id, other_peer_id, other_local_player_id)

		if other_inventory_data.inventory_id ~= loaded_inventory_id then
			return false
		end
	end

	return true
end

ProfileSynchronizer.resync_loadout = function (self, peer_id, local_player_id)
	printf("Resyncing loadout of peer(%s:%s)", peer_id, local_player_id)

	local profile_index, career_index = self:profile_by_peer(peer_id, local_player_id)

	update_inventory_data(self._state, peer_id, local_player_id, profile_index, career_index)
end

ProfileSynchronizer.rpc_assign_peer_to_profile = function (self, channel_id, peer_id, local_player_id, profile_index, career_index, is_bot)
	printf("rpc_assign_peer_to_profile peer_id:%s local_player_id:%d profile_index:%d career_index:%d is_bot:%s", peer_id, local_player_id, profile_index, career_index, is_bot and "true" or "false")

	local status = Managers.party:get_player_status(peer_id, local_player_id)

	if not status then
		printf("rpc_assign_peer_to_profile called without status available in party manager. Ignoring it")

		return
	end

	self:_assign_peer_to_profile(peer_id, local_player_id, profile_index, career_index, is_bot, status)
end

ProfileSynchronizer._clear_profile_index_reservation = function (self, peer_id)
	for profile_index = 1, NUM_HERO_PROFILES do
		local profile_reserver_peer_id = self._state:get_profile_index_reservation(profile_index)

		if profile_reserver_peer_id == peer_id then
			self._state:set_profile_index_reservation(profile_index, "")
		end
	end
end

ProfileSynchronizer._unassign_profiles_of_peer = function (self, peer_id, optional_local_player_id)
	local peers_with_full_profiles = self._state:get_peers_with_full_profiles()

	for _, other_peer in ipairs(peers_with_full_profiles) do
		local other_peer_id = other_peer.peer_id
		local other_local_player_id = other_peer.local_player_id

		if other_peer_id == peer_id and (not optional_local_player_id or optional_local_player_id == other_local_player_id) then
			self._state:delete_profile_data(peer_id, optional_local_player_id or 1)
		end
	end
end

ProfileSynchronizer._assign_peer_to_profile = function (self, peer_id, local_player_id, profile_index, career_index, is_bot)
	self._state:set_profile(peer_id, local_player_id, profile_index, career_index, is_bot)

	local status = Managers.party:get_player_status(peer_id, local_player_id)
	status.profile_index = profile_index
	status.career_index = career_index
	status.selected_profile_index = profile_index
	status.selected_career_index = career_index
	status.profile_id = SPProfiles[profile_index].display_name

	Managers.mechanism:profile_changed(peer_id, local_player_id, profile_index, career_index)

	if Managers.state and Managers.state.game_mode then
		Managers.state.game_mode:profile_changed(peer_id, local_player_id, profile_index, career_index)
	end

	if peer_id == self._state:get_own_peer_id() then
		if profile_index ~= FindProfileIndex("spectator") then
			local profile_settings = SPProfiles[profile_index]
			local hero_attributes = Managers.backend:get_interface("hero_attributes")
			local hero_name = profile_settings.display_name

			hero_attributes:set(hero_name, "career", career_index)
		end

		update_inventory_data(self._state, peer_id, local_player_id, profile_index, career_index)
	end
end

local INVALID_PEER = "0"
local INVALID_OWNER = "0:0"

ProfileSynchronizer._sync_lobby_data = function (self)
	fassert(self._state:is_server(), "Should only be called on server.")

	local lobby_data = self._lobby:get_stored_lobby_data()

	for profile_index = 1, NUM_HERO_PROFILES do
		local peer_id = self._state:get_profile_index_reservation(profile_index)
		local key = lobby_slot_name(profile_index)

		if not peer_id then
			lobby_data[key] = INVALID_OWNER
		else
			local local_player_id = 1
			lobby_data[key] = join_lobby_entry(peer_id, local_player_id)
		end
	end

	self._lobby:set_lobby_data(lobby_data)
end

ProfileSynchronizer.get_packed_lobby_profile_slots = function (self)
	local peers = {}
	local player_indices = {}

	for profile_index = 1, NUM_HERO_PROFILES do
		local peer_id = self._state:get_profile_index_reservation(profile_index)

		if not peer_id or peer_id == "" then
			peers[#peers + 1] = INVALID_PEER
			player_indices[#player_indices + 1] = 0
		else
			peers[#peers + 1] = peer_id
			player_indices[#player_indices + 1] = 1
		end
	end

	fassert(#peers == #player_indices)

	return peers, player_indices
end

ProfileSynchronizer.set_own_actually_ingame = function (self, actually_ingame)
	self._state:set_own_actually_ingame(actually_ingame)
end

ProfileSynchronizer.others_actually_ingame = function (self)
	local network_state = self._state
	local own_peer_id = network_state:get_own_peer_id()
	local peers_with_full_profiles = self:get_peers_with_full_profiles()

	for _, peer in ipairs(peers_with_full_profiles) do
		local peer_id = peer.peer_id

		if own_peer_id ~= peer_id and not network_state:get_actually_ingame(peer_id) then
			return false
		end
	end

	return true
end

ProfileSynchronizer.is_free_in_lobby = function (profile_index, lobby_data)
	local slot_name = lobby_slot_name(profile_index)
	local owner = lobby_data[slot_name]

	return owner == INVALID_OWNER or owner == nil
end

ProfileSynchronizer.unpack_lobby_profile_slots = function (peer_ids, player_indices, lobby_data)
	assert(#peer_ids == #player_indices)

	for profile_index = 1, #peer_ids do
		local slot_name = lobby_slot_name(profile_index)
		local peer_id = peer_ids[profile_index]
		local local_player_id = player_indices[profile_index]
		lobby_data[slot_name] = join_lobby_entry(peer_id, local_player_id)
	end
end

ProfileSynchronizer.owner_in_lobby = function (profile_index, lobby_data)
	local slot_name = lobby_slot_name(profile_index)
	local owner = lobby_data[slot_name]

	if owner == nil then
		return
	end

	local peer_id, local_player_index = split_lobby_entry(owner)

	if peer_id ~= INVALID_PEER and peer_id ~= nil then
		return peer_id, local_player_index
	end
end
