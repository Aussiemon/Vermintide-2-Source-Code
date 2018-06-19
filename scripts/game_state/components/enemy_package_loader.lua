require("scripts/settings/enemy_package_loader_settings")

local bit = require("bit")
EnemyPackageLoader = class(EnemyPackageLoader)
local BREED_PATH = EnemyPackageLoaderSettings.breed_path
local ALIAS_TO_BREED = EnemyPackageLoaderSettings.alias_to_breed
local BREED_TO_ALIASES = EnemyPackageLoaderSettings.breed_to_aliases
local OPT_LOOKUP_BREED_NAMES = EnemyPackageLoaderSettings.opt_lookup_breed_names
local UNLOAD_STARTUP_PACKAGES_BETWEEN_LEVELS = EnemyPackageLoaderSettings.unload_startup_packages_between_levels

EnemyPackageLoader.init = function (self)
	self.network_event_delegate = nil
	self.use_optimized = script_data.use_optimized_breed_units
	self._dynamic_loaded_packages = {}
	self._breeds_to_load_at_startup = {}
	self._package_handles = {}
	self._package_state = {}
	self._breed_category_lookup = {}
	self.breed_loaded_on_all_peers = Script.new_map(96)
	self.breed_processed = Script.new_map(96)
	self._currently_loading_breeds = {}
	self._breed_category_loaded_packages = {}
end

local rpcs = {
	"rpc_from_server_load_breed_package",
	"rpc_from_server_load_breeds_by_bitmask",
	"rpc_from_server_unload_breed_package",
	"rpc_from_client_loading_breed_package_done"
}

EnemyPackageLoader.register_rpcs = function (self, network_event_delegate)
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(rpcs))
end

EnemyPackageLoader.unregister_rpcs = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
end

EnemyPackageLoader.set_unit_spawner = function (self, unit_spawner)
	self._unit_spawner = unit_spawner
end

EnemyPackageLoader.network_context_created = function (self, lobby, server_peer_id, own_peer_id)
	self._lobby = lobby
	self._server_peer_id = server_peer_id
	self._peer_id = own_peer_id
	local is_server = server_peer_id == own_peer_id
	self._is_server = is_server

	if is_server then
		self._unique_connection_counter = 0
		self._unique_connections = {}
		local type_info = Network.type_info("enemy_package_loader_connection_key")
		self._connection_key_max = self._connection_key_max or type_info.max + 1
	else
		self._unique_connection_key = nil
	end
end

EnemyPackageLoader.network_context_destroyed = function (self)
	self._lobby = nil
	self._server_peer_id = nil
	self._peer_id = nil

	if self._is_server then
		self._unique_connection_counter = nil
		self._unique_connections = nil
	else
		self._unique_connection_key = nil
	end
end

EnemyPackageLoader._find_unused_breed_to_unload = function (self, loaded_breeds)
	local num_spawned_by_breed = Managers.state.conflict._num_spawned_by_breed
	local package_handles = self._package_handles
	local unit_spawner = self._unit_spawner
	local ResourcePackage_can_unload = ResourcePackage.can_unload

	for breed_name, state in pairs(loaded_breeds) do
		if num_spawned_by_breed[breed_name] <= 0 and not unit_spawner:breed_in_death_watch(breed_name) and ResourcePackage_can_unload(package_handles[breed_name]) then
			return breed_name
		end
	end
end

EnemyPackageLoader._pick_breed_from_loaded_breeds = function (self, loaded_breeds, limit)
	local wanted_index = math.random(1, limit)
	local i = 0

	for breed_name, _ in pairs(loaded_breeds) do
		i = i + 1

		if wanted_index <= i then
			return breed_name
		end
	end
end

EnemyPackageLoader.request_breed = function (self, breed_name, ignore_breed_limits)
	breed_name = ALIAS_TO_BREED[breed_name] or breed_name
	local breed_category_data = self._breed_category_lookup[breed_name]
	local current_packages = breed_category_data.current
	local package_limit = breed_category_data.limit

	if not ignore_breed_limits and package_limit <= current_packages then
		local loaded_breeds = breed_category_data.loaded_breeds
		local unused_breed_name = self:_find_unused_breed_to_unload(loaded_breeds)

		if unused_breed_name then
			self:_unload_package(unused_breed_name, breed_category_data)
		else
			local replacement_breed_name = self:_pick_breed_from_loaded_breeds(loaded_breeds, package_limit)

			return false, replacement_breed_name
		end
	end

	self:_load_package(breed_name, breed_category_data)

	return true
end

EnemyPackageLoader._set_breed_processed = function (self, breed_name, processed)
	local breed_processed = self.breed_processed
	local aliases = BREED_TO_ALIASES[breed_name]

	if aliases then
		local num_aliases = #aliases

		for i = 1, num_aliases, 1 do
			local alias = aliases[i]
			breed_processed[alias] = processed
		end
	end

	breed_processed[breed_name] = processed
end

EnemyPackageLoader._set_breed_loaded_on_all_peers = function (self, breed_name, loaded)
	local loaded_on_all_peers = self.breed_loaded_on_all_peers
	local aliases = BREED_TO_ALIASES[breed_name]

	if aliases then
		local num_aliases = #aliases

		for i = 1, num_aliases, 1 do
			local alias = aliases[i]
			loaded_on_all_peers[alias] = loaded
		end
	end

	loaded_on_all_peers[breed_name] = loaded
end

EnemyPackageLoader.update_breeds_loading_status = function (self)
	local breeds_list = self._currently_loading_breeds

	if not next(breeds_list) then
		return
	end

	local session = Managers.state.network:game()
	local peers = GameSession.peers(session)
	local num_peers = #peers

	for breed_name, _ in pairs(breeds_list) do
		local peers_done = self._dynamic_loaded_packages[breed_name]
		local loading_done = true

		for j = 1, num_peers, 1 do
			local peer_id = peers[j]

			if not peers_done[peer_id] then
				loading_done = false

				break
			end
		end

		if loading_done then
			breeds_list[breed_name] = nil

			self:_set_breed_loaded_on_all_peers(breed_name, true)
		end
	end
end

EnemyPackageLoader._start_loading_package = function (self, breed_name, callback_name)
	local state = self._package_state[breed_name]

	fassert(state == nil or state == "unloaded", "Trying to load breed package twice!")

	local package_name = BREED_PATH .. ((self.use_optimized and OPT_LOOKUP_BREED_NAMES[breed_name]) or breed_name)
	self._package_state[breed_name] = "loading"

	self:_set_breed_processed(breed_name, true)

	local async = true
	local prioritize = true

	Managers.package:load(package_name, "EnemyPackageLoader", callback(self, callback_name or "cb_breed_package_loaded", breed_name), async, prioritize)
end

EnemyPackageLoader._load_package = function (self, breed_name, breed_category_data)
	local dynamic_loaded_packages = self._dynamic_loaded_packages

	if dynamic_loaded_packages[breed_name] == nil then
		dynamic_loaded_packages[breed_name] = {}
	end

	dynamic_loaded_packages[breed_name][self._peer_id] = false

	self:_start_loading_package(breed_name)

	breed_category_data.current = breed_category_data.current + 1
	local is_server = self._is_server

	if is_server and not LEVEL_EDITOR_TEST then
		local breed_id = NetworkLookup.breeds[breed_name]

		self:_send_rpc_to_clients("rpc_from_server_load_breed_package", breed_id)

		self._currently_loading_breeds[breed_name] = true
	end
end

EnemyPackageLoader._unload_package = function (self, breed_name, breed_category_data)
	local is_startup_breed = self._breeds_to_load_at_startup[breed_name]

	fassert(not is_startup_breed, "EnemyPackageLoader:_unload_package: Trying to unload a startup breed!")

	local package_name = BREED_PATH .. ((self.use_optimized and OPT_LOOKUP_BREED_NAMES[breed_name]) or breed_name)

	Managers.package:unload(package_name, "EnemyPackageLoader")

	local is_server = self._is_server

	if is_server and not LEVEL_EDITOR_TEST then
		breed_category_data.current = breed_category_data.current - 1
		breed_category_data.loaded_breeds[breed_name] = nil
		local breed_id = NetworkLookup.breeds[breed_name]

		self:_send_rpc_to_clients("rpc_from_server_unload_breed_package", breed_id)

		self._dynamic_loaded_packages[breed_name][self._peer_id] = false
		self._currently_loading_breeds[breed_name] = nil

		self:_set_breed_loaded_on_all_peers(breed_name, false)
	end

	self._package_state[breed_name] = "unloaded"

	self:_set_breed_processed(breed_name, false)
end

EnemyPackageLoader.cb_breed_package_loaded = function (self, breed_name)
	local breed_id = NetworkLookup.breeds[breed_name]
	local is_server = self._is_server

	if is_server then
		self._dynamic_loaded_packages[breed_name][self._peer_id] = true
		local breed_category_data = self._breed_category_lookup[breed_name]

		if breed_category_data then
			breed_category_data.loaded_breeds[breed_name] = true
		end
	else
		self:_send_rpc_to_server("rpc_from_client_loading_breed_package_done", breed_id)
	end

	self._package_state[breed_name] = "loaded"
end

EnemyPackageLoader.cb_breed_package_loaded_client_startup = function (self, breed_name)
	self._package_state[breed_name] = "loaded"
end

EnemyPackageLoader.cb_startup_breed_package_loaded = function (self, breed_name)
	self._package_state[breed_name] = "loaded"

	self:_set_breed_loaded_on_all_peers(breed_name, true)
end

EnemyPackageLoader._add_package_handles = function (self, breed_list)
	local package_handles = self._package_handles

	for i = 1, #breed_list, 1 do
		local breed_name = breed_list[i]
		package_handles[breed_name] = Application.resource_package(BREED_PATH .. breed_name)
	end
end

EnemyPackageLoader._create_breed_category_lookup = function (self, breed_list, category, limit)
	local breed_category_loaded_packages = self._breed_category_loaded_packages

	if breed_category_loaded_packages[category] == nil then
		breed_category_loaded_packages[category] = {
			current = 0,
			name = category,
			limit = limit,
			loaded_breeds = {}
		}
	end

	local breed_category_lookup = self._breed_category_lookup

	for i = 1, #breed_list, 1 do
		local breed_name = breed_list[i]
		local breed = Breeds[breed_name]
		breed_category_lookup[breed_name] = breed_category_loaded_packages[category]
	end
end

EnemyPackageLoader.setup_startup_enemies = function (self, level_key)
	local breeds_to_load_at_startup = self._breeds_to_load_at_startup

	if not breeds_to_load_at_startup.loaded then
		print("EnemyPackageLoader:setup_startup_enemies")

		local level_settings = LevelSettings[level_key]

		if level_settings.load_no_enemies then
			print("Load no enemies on this level")

			return
		end

		local breed_categories = EnemyPackageLoaderSettings.categories
		local num_breed_categories = #breed_categories

		for i = 1, num_breed_categories, 1 do
			local data = breed_categories[i]

			if BUILD ~= data.forbidden_in_build then
				local id = data.id
				local breeds = data.breeds

				if data.dynamic_loading then
					self:_create_breed_category_lookup(breeds, id, data.limit)
				else
					local num_breeds = #breeds

					for j = 1, num_breeds, 1 do
						local breed_name = breeds[j]
						breeds_to_load_at_startup[#breeds_to_load_at_startup + 1] = breed_name
					end
				end

				self:_add_package_handles(breeds)
			end
		end

		self:_load_startup_enemy_packages()
	end
end

EnemyPackageLoader._load_startup_enemy_packages = function (self)
	local breeds_to_load_at_startup = self._breeds_to_load_at_startup

	fassert(not breeds_to_load_at_startup.loaded, "trying to load startup enemies packages twice")

	local package_state = self._package_state
	local async = true
	local prioritize = false
	local package_manager = Managers.package
	local num_entries = #breeds_to_load_at_startup
	local use_optimized = self.use_optimized

	for i = 1, num_entries, 1 do
		local breed_name = breeds_to_load_at_startup[i]
		breeds_to_load_at_startup[breed_name] = true
		local breed_package_name = BREED_PATH .. ((use_optimized and OPT_LOOKUP_BREED_NAMES[breed_name]) or breed_name)
		package_state[breed_name] = "loading"

		package_manager:load(breed_package_name, "EnemyPackageLoader", callback(self, "cb_startup_breed_package_loaded", breed_name), async, prioritize)
		self:_set_breed_processed(breed_name, true)
	end

	breeds_to_load_at_startup.loaded = true
end

EnemyPackageLoader.loading_completed = function (self)
	if self._lobby and not self._is_server and self._unique_connection_key == nil then
		return false
	end

	local package_state = self._package_state

	for breed_name, state in pairs(package_state) do
		if state == "loading" then
			return false
		end
	end

	return true
end

EnemyPackageLoader.unload_enemy_packages = function (self, force_unload_startup_packages)
	local unload_startup_packages = force_unload_startup_packages or UNLOAD_STARTUP_PACKAGES_BETWEEN_LEVELS

	printf("EnemyPackageLoader:unload_enemy_packages (unload startup enemies=%s)", tostring(unload_startup_packages))

	local package_state = self._package_state
	local breeds_to_load_at_startup = self._breeds_to_load_at_startup
	local use_optimized = self.use_optimized

	for breed_name, state in pairs(package_state) do
		if state ~= "unloaded" and (unload_startup_packages or not breeds_to_load_at_startup[breed_name]) then
			local package_name = BREED_PATH .. ((use_optimized and OPT_LOOKUP_BREED_NAMES[breed_name]) or breed_name)

			Managers.package:unload(package_name, "EnemyPackageLoader")

			package_state[breed_name] = "unloaded"

			self:_set_breed_processed(breed_name, false)
			self:_set_breed_loaded_on_all_peers(breed_name, false)
		end
	end

	if unload_startup_packages then
		table.clear(self._breeds_to_load_at_startup)
	end

	table.clear(self._dynamic_loaded_packages)
	table.clear(self._currently_loading_breeds)

	local category_lookup = self._breed_category_loaded_packages

	for category, data in pairs(category_lookup) do
		data.current = 0

		table.clear(data.loaded_breeds)
	end
end

EnemyPackageLoader._sync_dynamic_to_client = function (self, peer_id, connection_key)
	local package_state = self._package_state
	local breeds_to_load_at_startup = self._breeds_to_load_at_startup
	local bitmasks = {}

	for i = 1, math.ceil(#NetworkLookup.breeds / 32), 1 do
		bitmasks[#bitmasks + 1] = 0
	end

	for breed_name, state in pairs(package_state) do
		if state ~= "unloaded" and not breeds_to_load_at_startup[breed_name] then
			local breed_index = NetworkLookup.breeds[breed_name]
			local bit_index = (breed_index - 1) % 32
			local bitmask_index = math.ceil(breed_index / 32)
			local bitmask = bitmasks[bitmask_index]
			bitmasks[bitmask_index] = bit.bor(bitmask, 2^bit_index)
			local dynamic_package = self._dynamic_loaded_packages[breed_name]
			dynamic_package[peer_id] = true
		end
	end

	self:_send_rpc("rpc_from_server_load_breeds_by_bitmask", peer_id, connection_key, bitmasks)
end

EnemyPackageLoader.rpc_from_server_load_breeds_by_bitmask = function (self, sender, connection_key, bitmasks)
	local num_bitmasks = #bitmasks
	self._unique_connection_key = connection_key

	printf("[EnemyPackageLoader] New connection established (%s) (key=%s)", sender, connection_key)

	for i = 1, num_bitmasks, 1 do
		local bitmask = bitmasks[i]

		if bitmask ~= 0 then
			for j = 0, 31, 1 do
				local should_load_breed = bit.band(bitmask, 2^j) ~= 0

				if should_load_breed then
					local breed_index = j + 1 + 32 * (i - 1)
					local breed_name = NetworkLookup.breeds[breed_index]

					self:_start_loading_package(breed_name, "cb_breed_package_loaded_client_startup")
				end
			end
		end
	end
end

EnemyPackageLoader.rpc_from_server_load_breed_package = function (self, sender, connection_key, breed_id)
	local server_peer_id = self._server_peer_id
	local unique_connection_key = self._unique_connection_key

	if server_peer_id ~= sender then
		printf("[EnemyPackageLoader] rpc_from_server_load_breed_package from wrong lobby (server=%s|%s)", server_peer_id or "nil", sender)

		return
	elseif connection_key ~= unique_connection_key then
		printf("[EnemyPackageLoader] rpc_from_server_load_breed_package from old connection (%s) (key=%s|%s)", sender, unique_connection_key or "nil", connection_key)

		return
	end

	local breed_name = NetworkLookup.breeds[breed_id]

	self:_start_loading_package(breed_name)
end

EnemyPackageLoader.rpc_from_server_unload_breed_package = function (self, sender, connection_key, breed_id)
	local server_peer_id = self._server_peer_id
	local unique_connection_key = self._unique_connection_key

	if server_peer_id ~= sender then
		printf("[EnemyPackageLoader] rpc_from_server_unload_breed_package from wrong lobby (server=%s|%s)", server_peer_id or "nil", sender)

		return
	elseif connection_key ~= unique_connection_key then
		printf("[EnemyPackageLoader] rpc_from_server_unload_breed_package from old connection (%s) (key=%s|%s)", sender, unique_connection_key or "nil", connection_key)

		return
	end

	local breed_name = NetworkLookup.breeds[breed_id]

	self:_unload_package(breed_name)
end

EnemyPackageLoader.rpc_from_client_loading_breed_package_done = function (self, sender, connection_key, breed_id)
	local client_key = self._unique_connections[sender]

	if client_key ~= connection_key then
		printf("[EnemyPackageLoader] rpc_from_client_loading_breed_package_done from old connection (%s) - (key=%s|%s)", sender, client_key or "nil", connection_key)

		return
	end

	local breed_name = NetworkLookup.breeds[breed_id]
	self._dynamic_loaded_packages[breed_name][sender] = true
end

EnemyPackageLoader._send_rpc = function (self, rpc_name, peer_id, ...)
	if not self._lobby then
		return
	end

	local rpc = RPC[rpc_name]

	rpc(peer_id, ...)
end

EnemyPackageLoader._send_rpc_to_server = function (self, rpc_name, ...)
	if not self._lobby then
		return
	end

	local rpc = RPC[rpc_name]

	rpc(self._server_peer_id, self._unique_connection_key, ...)
end

EnemyPackageLoader._send_rpc_to_clients = function (self, rpc_name, ...)
	if not self._lobby then
		return
	end

	local rpc = RPC[rpc_name]
	local server_peer_id = self._server_peer_id
	local members = self._lobby:members():get_members()
	local num_members = #members
	local unique_connections = self._unique_connections

	for i = 1, num_members, 1 do
		local peer_id = members[i]

		if peer_id ~= server_peer_id then
			local connection_key = unique_connections[peer_id]

			if connection_key then
				rpc(peer_id, connection_key, ...)
			end
		end
	end
end

EnemyPackageLoader._send_rpc_to_clients_except = function (self, rpc_name, except, ...)
	if not self._lobby then
		return
	end

	local rpc = RPC[rpc_name]
	local server_peer_id = self._server_peer_id
	local members = self._lobby:members():get_members()
	local num_members = #members
	local unique_connections = self._unique_connections

	for i = 1, num_members, 1 do
		local peer_id = members[i]

		if peer_id ~= server_peer_id and peer_id ~= except then
			local connection_key = unique_connections[peer_id]

			if connection_key then
				rpc(peer_id, connection_key, ...)
			end
		end
	end
end

EnemyPackageLoader.client_connected = function (self, peer_id)
	local connection_key = self._unique_connection_counter
	self._unique_connections[peer_id] = connection_key

	self:_sync_dynamic_to_client(peer_id, connection_key)

	local connection_key_max = self._connection_key_max
	self._unique_connection_counter = (connection_key + 1) % connection_key_max
end

EnemyPackageLoader.client_disconnected = function (self, peer_id)
	local dynamic_loaded_packages = self._dynamic_loaded_packages

	for breed_name, peers in pairs(dynamic_loaded_packages) do
		peers[peer_id] = nil
	end

	self._unique_connections[peer_id] = nil
end

EnemyPackageLoader.debug_loaded_breeds = function (self)
	local num_spawned_by_breed = Managers.state.conflict._num_spawned_by_breed
	local package_state = self._package_state
	local breed_category_lookup = self._breed_category_lookup
	local breed_category_loaded_packages = self._breed_category_loaded_packages

	Debug.text("EnemyPackageLoader Policy=%s", EnemyPackageLoaderSettings.policy)

	for current_category, _ in pairs(breed_category_loaded_packages) do
		Debug.text("Loaded %s:", current_category)

		for breed_name, state in pairs(package_state) do
			local category_data = breed_category_lookup[breed_name]

			if (state == "loaded" or state == "loading") and category_data and category_data.name == current_category then
				local num_alive = num_spawned_by_breed[breed_name]

				Debug.text("   %s=%s %s %s", breed_name, state, (self._unit_spawner:breed_in_death_watch(breed_name) and "DL") or "", tostring(num_alive))
			end
		end
	end

	Debug.text("Unloaded:")

	for breed_name, state in pairs(package_state) do
		if state == "unloaded" and breed_category_lookup[breed_name] then
			Debug.text("   %s=%s", breed_name, state)
		end
	end

	if self._is_server then
		Debug.text("Server=%s", self._peer_id)

		if self._unique_connections then
			for peer_id, connection_key in pairs(self._unique_connections) do
				Debug.text("   Peer=%s | Key=%s", peer_id, connection_key)
			end
		end
	else
		Debug.text("Peer=%s | Server=%s | Key=%s", self._peer_id, self._server_peer_id or "nil", self._unique_connection_key or "nil")
	end
end

return
