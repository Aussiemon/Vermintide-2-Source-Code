-- chunkname: @scripts/game_state/components/general_synced_package_loader.lua

GeneralSyncedPackageLoader = class(GeneralSyncedPackageLoader)

local CACHED_REFERENCES = {}

GeneralSyncedPackageLoader.init = function (self)
	self._loaded_mutator_map = {}
	self._cached_mutator_map = {}
end

GeneralSyncedPackageLoader.network_context_created = function (self, lobby, server_peer_id, own_peer_id, network_handler)
	printf("[GeneralSyncedPackageLoader] network_context_created (server_peer_id=%s, own_peer_id=%s)", server_peer_id, own_peer_id)

	self._lobby = lobby

	local is_server = server_peer_id == own_peer_id

	self._is_server = is_server
	self._network_handler = network_handler
end

GeneralSyncedPackageLoader.matching_session = function (self, network_handler)
	return self._network_handler == network_handler
end

GeneralSyncedPackageLoader.network_context_destroyed = function (self)
	print("[GeneralSyncedPackageLoader] network_context_destroyed")

	self._lobby = nil
	self._network_handler = nil

	if self._is_server then
		self._session_mutator_map = nil
	end

	self._is_server = nil
end

GeneralSyncedPackageLoader.update = function (self)
	self:_update_package_diffs()
end

GeneralSyncedPackageLoader._mutator_package_reference = function (self, mutator_name)
	local cached = CACHED_REFERENCES[mutator_name]

	if cached then
		return cached
	end

	CACHED_REFERENCES[mutator_name] = "GeneralSyncedPackageLoader_" .. mutator_name

	return CACHED_REFERENCES[mutator_name]
end

GeneralSyncedPackageLoader._has_loaded_mutator = function (self, mutator_name)
	local mutator_template = MutatorTemplates[mutator_name]
	local packages = mutator_template.packages

	if not packages then
		return true
	end

	local package_reference = self:_mutator_package_reference(mutator_name)
	local package_manager = Managers.package

	for i = 1, #packages do
		local package_name = packages[i]

		if not package_manager:has_loaded(package_name, package_reference) then
			return false
		end
	end

	return true
end

GeneralSyncedPackageLoader._is_loading_mutator = function (self, mutator_name)
	local mutator_template = MutatorTemplates[mutator_name]
	local packages = mutator_template.packages

	if not packages then
		return false
	end

	local package_reference = self:_mutator_package_reference(mutator_name)
	local package_manager = Managers.package

	for i = 1, #packages do
		local package_name = packages[i]

		if package_manager:is_loading(package_name, package_reference) then
			return true
		end
	end

	return false
end

GeneralSyncedPackageLoader._load_mutator = function (self, mutator_name, async, prioritize)
	local mutator_template = MutatorTemplates[mutator_name]
	local packages = mutator_template.packages

	if not packages then
		return
	end

	local package_reference = self:_mutator_package_reference(mutator_name)
	local package_manager = Managers.package

	for i = 1, #packages do
		local package_name = packages[i]

		package_manager:load(package_name, package_reference, nil, async, prioritize)
	end
end

GeneralSyncedPackageLoader._unload_mutator = function (self, mutator_name)
	local mutator_template = MutatorTemplates[mutator_name]
	local packages = mutator_template.packages

	if not packages then
		return
	end

	local package_reference = self:_mutator_package_reference(mutator_name)
	local package_manager = Managers.package

	for i = 1, #packages do
		local package_name = packages[i]

		package_manager:unload(package_name, package_reference)
	end
end

GeneralSyncedPackageLoader._update_package_diffs = function (self, skip_load)
	if not self._network_handler or not self._network_handler:is_fully_synced() then
		return
	end

	local async = true
	local prioritize = true
	local loaded_mutator_map = self._loaded_mutator_map
	local wanted_mutator_map = self:_mutator_map()
	local synced_loaded_mutator_map = self._network_handler:get_own_loaded_mutator_map()

	for mutator_name, status in pairs(loaded_mutator_map) do
		if not wanted_mutator_map[mutator_name] then
			self:_unload_mutator(mutator_name)

			loaded_mutator_map[mutator_name] = nil
		end
	end

	for mutator_name, server_cb_or_true in pairs(wanted_mutator_map) do
		local has_loaded = self:_has_loaded_mutator(mutator_name)

		if not has_loaded and not self:_is_loading_mutator(mutator_name) then
			self:_load_mutator(mutator_name, async, prioritize)
		elseif has_loaded and not loaded_mutator_map[mutator_name] then
			loaded_mutator_map[mutator_name] = true
		elseif server_cb_or_true ~= true and self:is_mutator_loaded_on_all_peers(mutator_name) then
			server_cb_or_true()

			wanted_mutator_map[mutator_name] = true
		end
	end

	if not table.shallow_equal(loaded_mutator_map, synced_loaded_mutator_map) then
		self._network_handler:set_own_loaded_mutator_map(table.shallow_copy(loaded_mutator_map))
	end
end

GeneralSyncedPackageLoader.load_sync_done_for_peer = function (self, peer_id)
	if not self._network_handler or not self._network_handler:is_fully_synced() then
		return false
	end

	local wanted_mutator_map = self:_mutator_map()
	local loaded_mutator_map = self._network_handler:get_loaded_mutator_map(peer_id)

	for mutator_name in pairs(wanted_mutator_map) do
		if not loaded_mutator_map[mutator_name] then
			return false
		end
	end

	return true
end

GeneralSyncedPackageLoader.loading_completed = function (self)
	if not self._network_handler or not self._network_handler:is_fully_synced() then
		return false
	end

	local wanted_mutator_map = self:_mutator_map()
	local loaded_mutator_map = self._loaded_mutator_map

	for mutator_name in pairs(wanted_mutator_map) do
		if loaded_mutator_map[mutator_name] ~= true then
			return false
		end
	end

	return true
end

GeneralSyncedPackageLoader.on_application_shutdown = function (self)
	local loaded_mutator_map = self._loaded_mutator_map

	for mutator_name in pairs(loaded_mutator_map) do
		local package_reference = self:_mutator_package_reference(mutator_name)
		local mutator_template = MutatorTemplates[mutator_name]
		local packages = mutator_template.packages

		if packages then
			for i = 1, #packages do
				local package_name = packages[i]

				Managers.package:unload(package_name, package_reference)
			end
		end

		loaded_mutator_map[mutator_name] = nil
	end
end

GeneralSyncedPackageLoader.is_mutator_loaded_on_all_peers = function (self, mutator_name, for_debugging)
	local peers = self._is_server and self._network_handler:hot_join_synced_peers()

	if for_debugging then
		peers = table.shallow_copy(self._network_handler:get_peers(), true)
		peers = table.array_to_map(peers, function (i, peer_id)
			return peer_id, true
		end)
	end

	for peer_id in pairs(peers) do
		local loaded_mutators = self._network_handler:get_loaded_mutator_map(peer_id)

		if not loaded_mutators[mutator_name] then
			return false
		end
	end

	return true
end

GeneralSyncedPackageLoader._mutator_map = function (self)
	local state_revision = self._network_handler:state_revision()

	if self._cached_mutator_map_version == state_revision then
		return self._cached_mutator_map
	end

	self._cached_mutator_map_version = state_revision
	self._cached_mutator_map = {}

	local game_mode_event_data = self._network_handler:get_game_mode_event_data()
	local mutators = game_mode_event_data.mutators

	if mutators then
		for i = 1, #mutators do
			self._cached_mutator_map[mutators[i]] = true
		end
	end

	return self._cached_mutator_map
end

GeneralSyncedPackageLoader.debug_loaded_packages = function (self)
	if not self._network_handler then
		Debug.text("[GeneralSyncedPackageLoader] network handler not avaiable")

		return
	end

	local mutator_map = self._network_handler:_mutator_map()

	if table.is_empty(mutator_map) then
		Debug.text("No mutators initialized. (DynamicPackageLoader)")
	else
		Debug.text("Initialized mutators:")
	end

	local peers = self._is_server and self._network_handler:hot_join_synced_peers() or self._network_handler:get_peers()

	if not self._is_server then
		peers = table.shallow_copy(self._network_handler:get_peers(), true)
		peers = table.array_to_map(peers, function (i, peer_id)
			return peer_id, true
		end)
	end

	for mutator_name in pairs(mutator_map) do
		repeat
			Debug.text("   %s", mutator_name)

			if not self:is_mutator_loaded_on_all_peers(mutator_name, not self._is_server) then
				Debug.text("      --Waiting on Peer(s) to Load--")

				for peer_id, _ in pairs(peers) do
					if not self._network_handler:get_loaded_mutator_map(peer_id)[mutator_name] then
						Debug.text("      %s", peer_id)
					end
				end
			end
		until true
	end
end
