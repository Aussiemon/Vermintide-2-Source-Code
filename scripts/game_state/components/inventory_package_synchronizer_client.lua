require("scripts/settings/inventory_settings")
require("scripts/managers/backend/backend_utils")

script_data.profile_package_loading_debug = script_data.profile_package_loading_debug or Development.parameter("profile_package_loading_debug")
local profile_printf = (script_data.profile_package_loading_debug and printf) or function ()
	return
end
local network_printf = (script_data.network_debug and printf) or function ()
	return
end
InventoryPackageSynchronizerClient = class(InventoryPackageSynchronizerClient)

local function profile_packages(profile_index, career_index, packages_list, is_first_person)
	assert(packages_list)

	local first_person_value = nil

	if is_first_person then
		first_person_value = false
	end

	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career = careers[career_index]
	local career_name = career.name
	local slots_n = #InventorySettings.slots

	for i = 1, slots_n, 1 do
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
				local left_hand_unit_name = item_units.left_hand_unit

				if left_hand_unit_name then
					packages_list[left_hand_unit_name] = first_person_value
					packages_list[left_hand_unit_name .. "_3p"] = false
				end

				local right_hand_unit_name = item_units.right_hand_unit

				if right_hand_unit_name then
					packages_list[right_hand_unit_name] = first_person_value
					packages_list[right_hand_unit_name .. "_3p"] = false
				end

				local ammo_unit_name = item_units.ammo_unit

				if ammo_unit_name then
					packages_list[ammo_unit_name] = first_person_value
					packages_list[item_units.ammo_unit_3p or ammo_unit_name .. "_3p"] = false
				end

				local actions = item_template.actions

				for _, sub_actions in pairs(actions) do
					for _, sub_action_data in pairs(sub_actions) do
						local projectile_info = sub_action_data.projectile_info

						if projectile_info then
							if projectile_info.projectile_unit_name then
								packages_list[projectile_info.projectile_unit_name] = false
							end

							if projectile_info.dummy_linker_unit_name then
								packages_list[projectile_info.dummy_linker_unit_name] = false
							end

							if projectile_info.dummy_linker_broken_units then
								for _, unit in pairs(projectile_info.dummy_linker_broken_units) do
									packages_list[unit] = false
								end
							end
						end
					end
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

				error("InventoryPackageSynchronizerClient unknown slot_category: " .. slot_category)
			end
		until true
	end

	local base_skin_name = career.base_skin
	local skin_item = BackendUtils.get_loadout_item(career_name, "slot_skin")
	local skin_name = (skin_item and skin_item.data.name) or base_skin_name
	local skin_data = Cosmetics[skin_name]
	local material_changes = skin_data.material_changes

	if is_first_person then
		packages_list[skin_data.first_person] = false
		packages_list[skin_data.first_person_bot] = false
		packages_list[skin_data.third_person] = false
		packages_list[skin_data.third_person_bot] = false
		packages_list[skin_data.first_person_attachment.unit] = false
	else
		packages_list[skin_data.third_person_husk] = false
	end

	if material_changes then
		packages_list[material_changes.package_name] = false
	end

	packages_list[career.package_name] = false

	return packages_list
end

InventoryPackageSynchronizerClient.init = function (self, is_server)
	self.packages_map = {}
	self.unload_package_map = {}
	self.is_server = is_server
end

InventoryPackageSynchronizerClient.destroy = function (self)
	local package_manager = Managers.package

	for package_name, _ in pairs(self.packages_map) do
		package_manager:unload(package_name, "InventoryPackageSynchronizerClient")
	end
end

local empty_table = {}

InventoryPackageSynchronizerClient.build_inventory_lists = function (self, profile_index, career_index)
	if not profile_index or profile_index == 0 then
		return empty_table, empty_table
	end

	local inventory_list = profile_packages(profile_index, career_index, FrameTable.alloc_table(), false)
	local inventory_list_first_player = profile_packages(profile_index, career_index, FrameTable.alloc_table(), true)

	return inventory_list, inventory_list_first_player
end

InventoryPackageSynchronizerClient.register_rpc = function (self, network_transmit, network_event_delegate)
	self.network_transmit = network_transmit
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, "rpc_server_set_inventory_packages")
end

InventoryPackageSynchronizerClient.unregister = function (self)
	if self.network_event_delegate then
		self.network_event_delegate:unregister(self)

		self.network_event_delegate = nil
		self.network_transmit = nil
	end
end

local function inventory_array_to_set(array, destination)
	local inventory_packages_lut = NetworkLookup.inventory_packages

	for _, value in ipairs(array) do
		local inventory_package_name = inventory_packages_lut[value]
		destination[inventory_package_name] = true
	end
end

local TEMP_PACKAGE_MAP = {}

InventoryPackageSynchronizerClient.rpc_server_set_inventory_packages = function (self, sender, inventory_sync_id, inventory_package_list)
	local network_manager = Managers.state and Managers.state.network
	local ignore_lobby_rpcs = network_manager and network_manager.ignore_lobby_rpcs

	if ignore_lobby_rpcs then
		return
	end

	local peer_id = Network:peer_id()

	if self.is_server and sender ~= peer_id then
		network_printf("[NETWORK] got rpc_server_set_inventory_packages from " .. sender .. ", is_server:" .. tostring(self.is_server) .. "  --> ignogering")

		return
	end

	network_printf("[NETWORK] rpc_server_set_inventory_packages, sender:%s inventory_sync_id:%d my_peer_id:%s", sender, inventory_sync_id, peer_id)

	self.inventory_sync_id = inventory_sync_id
	local temp_package_map = TEMP_PACKAGE_MAP

	inventory_array_to_set(inventory_package_list, temp_package_map)

	local packages_map = self.packages_map
	local asynchronous = true
	local package_manager = Managers.package
	local unload_package_map = self.unload_package_map

	for package_name, _ in pairs(temp_package_map) do
		local package_info = packages_map[package_name]
		packages_map[package_name] = nil

		if package_info == nil then
			package_manager:load(package_name, "InventoryPackageSynchronizerClient", nil, asynchronous)

			unload_package_map[package_name] = nil
		else
			assert(package_manager:is_loading(package_name) or package_manager:has_loaded(package_name), "Package %q should be loaded or loading but isn't!", package_name)
		end
	end

	for package_name, _ in pairs(packages_map) do
		unload_package_map[package_name] = 2
		packages_map[package_name] = nil
	end

	for package_name, _ in pairs(temp_package_map) do
		packages_map[package_name] = package_manager:has_loaded(package_name)
		unload_package_map[package_name] = nil
	end

	self.all_loaded = false

	table.clear(temp_package_map)
end

InventoryPackageSynchronizerClient.update = function (self, dt)
	local package_manager = Managers.package
	local unload_package_map = self.unload_package_map

	for package_name, timer in pairs(unload_package_map) do
		if timer <= 0 then
			if package_manager:can_unload(package_name) then
				package_manager:unload(package_name, "InventoryPackageSynchronizerClient")

				unload_package_map[package_name] = nil
			else
				profile_printf("Couldn't unload package %s because one if its resources was still locked, trying again later", package_name)

				unload_package_map[package_name] = 2
			end
		else
			unload_package_map[package_name] = timer - 1
		end
	end

	if self.all_loaded == false then
		local all_loaded = true
		local packages_map = self.packages_map

		for package_name, is_loaded in pairs(packages_map) do
			if not is_loaded then
				is_loaded = package_manager:has_loaded(package_name)
				all_loaded = all_loaded and is_loaded
				packages_map[package_name] = is_loaded
			end
		end

		self.all_loaded = all_loaded

		if all_loaded then
			self.network_transmit:send_rpc_server("rpc_client_inventory_map_loaded", self.inventory_sync_id)
			network_printf("[NETWORK] sent rpc_client_inventory_map_loaded, inventory_sync_id: %d ", self.inventory_sync_id)
		end
	end
end

InventoryPackageSynchronizerClient.is_package_required = function (self, package_name)
	return self.packages_map[package_name] ~= nil
end

return
