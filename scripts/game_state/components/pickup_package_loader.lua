-- chunkname: @scripts/game_state/components/pickup_package_loader.lua

PickupPackageLoader = class(PickupPackageLoader)

local CACHED_REFERENCES = {}
local CACHED_3P = {}

PickupPackageLoader.init = function (self)
	self._loaded_pickup_map = {}
end

PickupPackageLoader.network_context_created = function (self, lobby, server_peer_id, own_peer_id, network_handler)
	printf("[PickupPackageLoader] network_context_created (server_peer_id=%s, own_peer_id=%s)", server_peer_id, own_peer_id)

	self._lobby = lobby

	local is_server = server_peer_id == own_peer_id

	self._is_server = is_server

	if is_server then
		self._session_pickup_map = {}
	end

	self._network_handler = network_handler
end

PickupPackageLoader.matching_session = function (self, network_handler)
	return self._network_handler == network_handler
end

PickupPackageLoader.network_context_destroyed = function (self)
	print("[PickupPackageLoader] network_context_destroyed")

	self._lobby = nil
	self._network_handler = nil

	if self._is_server then
		self._session_pickup_map = nil
	end

	self._is_server = nil
end

PickupPackageLoader.request_pickup = function (self, pickup_name, optional_cb)
	assert(self._is_server, "[PickupPackageLoader] 'request_pickup' is a server only function")

	local cb_or_true = self._session_pickup_map[pickup_name]

	if cb_or_true then
		if optional_cb then
			self._session_pickup_map[pickup_name] = function ()
				if cb_or_true ~= true then
					cb_or_true()
				end

				optional_cb()
			end
		end

		return
	end

	self._session_pickup_map[pickup_name] = optional_cb or true

	self._network_handler:set_session_pickup_map(table.shallow_copy(self._session_pickup_map))
	self:_update_package_diffs()
end

PickupPackageLoader.is_pickup_processed = function (self, pickup_name)
	local session_pickup_map = self._network_handler:get_session_pickup_map()

	return session_pickup_map[pickup_name]
end

PickupPackageLoader.processed_pickups = function (self)
	return self._network_handler:get_session_pickup_map()
end

PickupPackageLoader._unload_package = function (self, pickup_name)
	assert(self._is_server, "[PickupPackageLoader] '_unload_package' is a server only function.")

	self._session_pickup_map[pickup_name] = nil

	self._network_handler:set_session_pickup_map(table.shallow_copy(self._session_pickup_map))
	self:_update_package_diffs()
end

PickupPackageLoader.update = function (self)
	if not self._initialized then
		if Managers.package:has_loaded("resource_packages/pickups") then
			self._initialized = true
		end

		return
	end

	self:_update_package_diffs()
end

PickupPackageLoader._package_reference = function (self, pickup_name)
	local cached = CACHED_REFERENCES[pickup_name]

	if cached then
		return cached
	end

	CACHED_REFERENCES[pickup_name] = "PickupPackageLoader_" .. pickup_name

	return CACHED_REFERENCES[pickup_name]
end

PickupPackageLoader._cached_3p = function (self, unit_name)
	local cached = CACHED_3P[unit_name]

	if cached then
		return cached
	end

	CACHED_3P[unit_name] = unit_name .. "_3p"

	return CACHED_3P[unit_name]
end

PickupPackageLoader._has_loaded_pickup = function (self, pickup_name)
	local package_reference = self:_package_reference(pickup_name)
	local package_manager = Managers.package
	local pickup_setting = AllPickups[pickup_name]
	local unit_name = pickup_setting.unit_name

	if not package_manager:has_loaded(unit_name, package_reference) then
		return false
	end

	local item = rawget(ItemMasterList, pickup_setting.item_name)

	if item then
		local weapon_template_name = item.temporary_template
		local weapon_template = WeaponUtils.get_weapon_template(weapon_template_name)
		local left_hand_unit = weapon_template.left_hand_unit

		if left_hand_unit and (not package_manager:has_loaded(left_hand_unit, package_reference) or not package_manager:has_loaded(self:_cached_3p(left_hand_unit), package_reference)) then
			return false
		end

		local right_hand_unit = weapon_template.right_hand_unit

		if right_hand_unit and (not package_manager:has_loaded(right_hand_unit, package_reference) or not package_manager:has_loaded(self:_cached_3p(right_hand_unit), package_reference)) then
			return false
		end
	end

	return true
end

PickupPackageLoader._is_loading_pickup = function (self, pickup_name)
	local package_reference = self:_package_reference(pickup_name)
	local package_manager = Managers.package
	local pickup_setting = AllPickups[pickup_name]
	local unit_name = pickup_setting.unit_name

	if package_manager:is_loading(unit_name, package_reference) then
		return true
	end

	local item = rawget(ItemMasterList, pickup_setting.item_name)

	if item then
		local weapon_template_name = item.temporary_template
		local weapon_template = WeaponUtils.get_weapon_template(weapon_template_name)
		local left_hand_unit = weapon_template.left_hand_unit

		if left_hand_unit and (package_manager:is_loading(left_hand_unit, package_reference) or package_manager:is_loading(self:_cached_3p(left_hand_unit), package_reference)) then
			return true
		end

		local right_hand_unit = weapon_template.right_hand_unit

		if right_hand_unit and (package_manager:has_loaded(right_hand_unit, package_reference) or package_manager:has_loaded(self:_cached_3p(right_hand_unit), package_reference)) then
			return true
		end
	end
end

PickupPackageLoader._load_pickup = function (self, pickup_name, async, prioritize)
	local package_reference = self:_package_reference(pickup_name)
	local package_manager = Managers.package
	local pickup_setting = AllPickups[pickup_name]
	local unit_name = pickup_setting.unit_name

	package_manager:load(unit_name, package_reference, nil, async, prioritize)

	local item = rawget(ItemMasterList, pickup_setting.item_name)

	if item then
		local weapon_template_name = item.temporary_template
		local weapon_template = WeaponUtils.get_weapon_template(weapon_template_name)

		if weapon_template then
			local left_hand_unit = weapon_template.left_hand_unit

			if left_hand_unit then
				package_manager:load(left_hand_unit, package_reference, nil, async, prioritize)
				package_manager:load(self:_cached_3p(left_hand_unit), package_reference, nil, async, prioritize)
			end

			local right_hand_unit = weapon_template.right_hand_unit

			if right_hand_unit then
				package_manager:load(right_hand_unit, package_reference, nil, async, prioritize)
				package_manager:load(self:_cached_3p(right_hand_unit), package_reference, nil, async, prioritize)
			end
		end
	end
end

PickupPackageLoader._unload_pickup = function (self, pickup_name)
	local package_reference = self:_package_reference(pickup_name)
	local package_manager = Managers.package
	local pickup_setting = AllPickups[pickup_name]
	local unit_name = pickup_setting.unit_name

	package_manager:unload(unit_name, package_reference)

	local weapon_template_name = pickup_setting.temporary_template

	if weapon_template_name then
		local weapon_template = WeaponUtils.get_weapon_template(weapon_template_name)
		local left_hand_unit = weapon_template.left_hand_unit

		if left_hand_unit then
			package_manager:unload(left_hand_unit, package_reference)
			package_manager:unload(self:_cached_3p(left_hand_unit), package_reference)
		end

		local right_hand_unit = weapon_template.right_hand_unit

		if right_hand_unit then
			package_manager:unload(right_hand_unit, package_reference)
			package_manager:unload(self:_cached_3p(right_hand_unit), package_reference)
		end
	end
end

PickupPackageLoader._update_package_diffs = function (self, skip_load)
	if not self._network_handler or not self._network_handler:is_fully_synced() then
		return
	end

	local async = true
	local prioritize = true
	local loaded_pickup_map = self._loaded_pickup_map
	local session_pickup_map = self._session_pickup_map or self._network_handler:get_session_pickup_map()
	local synced_loaded_pickup_map = self._network_handler:get_own_loaded_session_pickup_map()

	for pickup_name, status in pairs(loaded_pickup_map) do
		if not session_pickup_map[pickup_name] then
			self:_unload_pickup(pickup_name)

			loaded_pickup_map[pickup_name] = nil
		end
	end

	for pickup_name, server_cb_or_true in pairs(session_pickup_map) do
		local has_loaded = self:_has_loaded_pickup(pickup_name)

		if not has_loaded and not self:_is_loading_pickup(pickup_name) then
			self:_load_pickup(pickup_name, async, prioritize)
		elseif has_loaded and not loaded_pickup_map[pickup_name] then
			loaded_pickup_map[pickup_name] = true
		elseif server_cb_or_true ~= true and self:is_pickup_loaded_on_all_peers(pickup_name) then
			server_cb_or_true()

			session_pickup_map[pickup_name] = true
		end
	end

	if not table.shallow_equal(loaded_pickup_map, synced_loaded_pickup_map) then
		self._network_handler:set_own_loaded_session_pickups(table.shallow_copy(loaded_pickup_map))
	end

	if self._is_server then
		local synced_session_pickup_map = self._network_handler:get_session_pickup_map()

		if not table.shallow_equal(session_pickup_map, synced_session_pickup_map) then
			self._network_handler:set_session_pickup_map(table.shallow_copy(session_pickup_map))
		end
	end
end

PickupPackageLoader.load_sync_done_for_peer = function (self, peer_id)
	if not self._network_handler or not self._network_handler:is_fully_synced() then
		return false
	end

	local session_pickup_map = self._network_handler:get_session_pickup_map()
	local loaded_pickup_map = self._network_handler:get_loaded_session_pickups(peer_id)

	for pickup_name in pairs(session_pickup_map) do
		if not loaded_pickup_map[pickup_name] then
			return false
		end
	end

	return true
end

PickupPackageLoader.loading_completed = function (self)
	if not self._network_handler or not self._network_handler:is_fully_synced() then
		return false
	end

	local session_pickup_map = self._network_handler:get_session_pickup_map()
	local loaded_pickup_map = self._loaded_pickup_map

	for pickup_name in pairs(session_pickup_map) do
		if loaded_pickup_map[pickup_name] ~= true then
			return false
		end
	end

	return true
end

PickupPackageLoader.random_director_list = function (self)
	return self._random_director_list
end

PickupPackageLoader.on_application_shutdown = function (self)
	local loaded_pickup_map = self._loaded_pickup_map
	local session_pickup_map = self._session_pickup_map

	for pickup_name, status in pairs(loaded_pickup_map) do
		local package_reference = self:_package_reference(pickup_name)
		local pickup_setting = AllPickups[pickup_name]
		local unit_name = pickup_setting.unit_name

		Managers.package:unload(unit_name, package_reference)

		if self._is_server then
			session_pickup_map[pickup_name] = nil
		end

		loaded_pickup_map[pickup_name] = nil
	end
end

PickupPackageLoader.is_pickup_loaded_on_all_peers = function (self, pickup_name, for_debugging)
	local peers = self._is_server and self._network_handler:hot_join_synced_peers()

	if for_debugging then
		peers = table.shallow_copy(self._network_handler:get_peers(), true)
		peers = table.array_to_map(peers, function (i, peer_id)
			return peer_id, true
		end)
	end

	for peer_id in pairs(peers) do
		local loaded_session_pickups = self._network_handler:get_loaded_session_pickups(peer_id)

		if not loaded_session_pickups[pickup_name] then
			return false
		end
	end

	return true
end

PickupPackageLoader.debug_loaded_pickups = function (self)
	if not self._network_handler then
		Debug.text("[PickupPackageLoader] network handler not avaiable")

		return
	end

	local session_map = self._network_handler:get_session_pickup_map()

	if table.is_empty(session_map) then
		Debug.text("No dynamic pickups to load. (DynamicPickupLoader)")
	else
		Debug.text("Dynamic pickups:")
	end

	local peers = self._is_server and self._network_handler:hot_join_synced_peers() or self._network_handler:get_peers()

	if not self._is_server then
		peers = table.shallow_copy(self._network_handler:get_peers(), true)
		peers = table.array_to_map(peers, function (i, peer_id)
			return peer_id, true
		end)
	end

	for pickup_name in pairs(session_map) do
		repeat
			Debug.text("   %s", pickup_name)

			if not self:is_pickup_loaded_on_all_peers(pickup_name, not self._is_server) then
				Debug.text("      --Waiting on Peer(s) to Load--")

				for peer_id, _ in pairs(peers) do
					if not self._network_handler:get_loaded_session_pickups(peer_id)[pickup_name] then
						Debug.text("      %s", peer_id)
					end
				end
			end
		until true
	end
end
