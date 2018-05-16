require("scripts/utils/debug_screen")

InventoryPackageSynchronizer = class(InventoryPackageSynchronizer)

InventoryPackageSynchronizer.init = function (self)
	self.packages_by_profile = {}

	for i, _ in ipairs(SPProfiles) do
		self.packages_by_profile[i] = {
			active = false,
			all_loaded = false,
			package_map = {},
			package_map_first_person = {}
		}
	end

	self.packages_by_profile[0] = {
		active = false,
		all_loaded = false,
		package_map = MakeTableFrozen({}),
		package_map_first_person = MakeTableFrozen({})
	}
	self.packages_to_unload = {}
end

InventoryPackageSynchronizer.set_inventory_list = function (self, profile_index, inventory_list, inventory_list_first_person)
	local profile_data = self.packages_by_profile[profile_index]
	local package_map = profile_data.package_map

	table.clear(package_map)

	local package_map_first_person = profile_data.package_map_first_person

	table.clear(package_map_first_person)

	for _, package_name in ipairs(inventory_list) do
		package_map[package_name] = true
	end

	for _, package_name in ipairs(inventory_list_first_person) do
		package_map_first_person[package_name] = true
	end
end

InventoryPackageSynchronizer.get_complete_package_map_for_profile = function (self, profile_indexes)
	local package_map = FrameTable.alloc_table()

	for index, profile_data in pairs(self.packages_by_profile) do
		if profile_indexes[index] then
			for package_name, _ in pairs(profile_data.package_map_first_person) do
				package_map[package_name] = true
			end
		else
			for package_name, _ in pairs(profile_data.package_map) do
				package_map[package_name] = true
			end
		end
	end

	return package_map
end

return
