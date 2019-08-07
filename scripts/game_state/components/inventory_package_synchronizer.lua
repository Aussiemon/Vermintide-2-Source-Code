require("scripts/utils/debug_screen")

InventoryPackageSynchronizer = class(InventoryPackageSynchronizer)

InventoryPackageSynchronizer.init = function (self)
	self._profile_packages_by_peer = {}
end

InventoryPackageSynchronizer._create_profile_table = function (self)
	local profile_table = {
		profile_index = 0,
		package_map = {},
		package_map_first_person = {}
	}

	return profile_table
end

InventoryPackageSynchronizer._get_profile_table = function (self, peer_id, local_player_id)
	local profile_packages_by_peer = self._profile_packages_by_peer

	if not profile_packages_by_peer[peer_id] then
		profile_packages_by_peer[peer_id] = {}
	end

	local profiles = profile_packages_by_peer[peer_id]

	if not profiles[local_player_id] then
		profiles[local_player_id] = self:_create_profile_table()
	end

	return profiles[local_player_id]
end

InventoryPackageSynchronizer.clear_inventory_list = function (self, peer_id)
	self._profile_packages_by_peer[peer_id] = nil
end

InventoryPackageSynchronizer.set_inventory_list = function (self, peer_id, local_player_id, profile_index, inventory_list, inventory_list_first_person)
	local profile_table = self:_get_profile_table(peer_id, local_player_id)
	profile_table.profile_index = profile_index
	local package_map = profile_table.package_map

	table.clear(package_map)

	local package_map_first_person = profile_table.package_map_first_person

	table.clear(package_map_first_person)

	for _, package_name in ipairs(inventory_list) do
		package_map[package_name] = true
	end

	for _, package_name in ipairs(inventory_list_first_person) do
		package_map_first_person[package_name] = true
	end
end

InventoryPackageSynchronizer.get_complete_package_map_for_peer = function (self, peer_id)
	local package_map = FrameTable.alloc_table()

	for owner_peer_id, profile_tables in pairs(self._profile_packages_by_peer) do
		local is_owner = peer_id == owner_peer_id

		for _, profile_table in pairs(profile_tables) do
			if is_owner then
				for package_name, _ in pairs(profile_table.package_map_first_person) do
					package_map[package_name] = true
				end
			else
				for package_name, _ in pairs(profile_table.package_map) do
					package_map[package_name] = true
				end
			end
		end
	end

	return package_map
end

return
