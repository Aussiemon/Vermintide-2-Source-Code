require("scripts/settings/enemy_package_loader_settings")
require("scripts/managers/conflict_director/main_path_spawning_generator")
require("scripts/managers/conflict_director/conflict_utils")

local bit = require("bit")
EnemyPackageLoader = class(EnemyPackageLoader)
local BREED_PATH = EnemyPackageLoaderSettings.breed_path
local ALIAS_TO_BREED = EnemyPackageLoaderSettings.alias_to_breed
local BREED_TO_ALIASES = EnemyPackageLoaderSettings.breed_to_aliases
local OPT_LOOKUP_BREED_NAMES = EnemyPackageLoaderSettings.opt_lookup_breed_names
local UNLOAD_STARTUP_PACKAGES_BETWEEN_LEVELS = EnemyPackageLoaderSettings.unload_startup_packages_between_levels

local function get_weighted_random_index(random, entries, entry_weight_map)
	local range_start = 0
	local num_entries = #entries

	for i = 1, num_entries, 1 do
		local entry = entries[i]
		local weight = entry_weight_map[entry]
		local range_end = range_start + weight

		if range_start <= random and random < range_end then
			return i
		end

		range_start = range_end
	end

	return num_entries
end

local function normalize_weight_map(list, list_weight_map, default_weight)
	local total_weight = 0

	for director_id = 1, #list, 1 do
		local director = list[director_id]

		if not list_weight_map[director] then
			list_weight_map[director] = default_weight
		end

		total_weight = total_weight + list_weight_map[director]
	end

	for entry, weight in pairs(list_weight_map) do
		list_weight_map[entry] = weight / total_weight
	end

	print("Updated list weights for random:")

	local last_weight = 0

	for i = 1, #list, 1 do
		local current_entry = list[i]
		local current_weight = list_weight_map[current_entry]

		printf("\t %s, %.2f (%.2f-%.2f)", current_entry, current_weight, last_weight, last_weight + current_weight)

		last_weight = last_weight + current_weight
	end
end

EnemyPackageLoader.init = function (self)
	self.network_event_delegate = nil
	self.use_optimized = script_data.use_optimized_breed_units
	self._dynamic_loaded_packages = {}
	self._breeds_to_load_at_startup = {}
	self._breed_to_package_name = {}
	self._package_state = {}
	self._breed_category_lookup = {}
	self.breed_loaded_on_all_peers = Script.new_map(96)
	self.breed_processed = Script.new_map(96)
	self._currently_loading_breeds = {}
	self._locked_breeds = {}
	self.random_director_list = nil
	self.breed_category_loaded_packages = {}

	self:_create_dynamic_breed_lookups()

	self._dynamic_breed_lookups = table.clone(self._breed_category_lookup)
	self._dynamic_breed_category_loaded_packages = table.clone(self.breed_category_loaded_packages)
end

local rpcs = {
	"rpc_from_server_load_breed_package",
	"rpc_from_server_load_breeds_by_bitmask",
	"rpc_from_server_unload_breed_package",
	"rpc_from_client_loading_breed_package_done",
	"rpc_from_client_sync_packages_load_done"
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
	printf("[EnemyPackageLoader] network_context_created (server_peer_id=%s, own_peer_id=%s)", server_peer_id, own_peer_id)

	self._lobby = lobby
	self._server_peer_id = server_peer_id
	self._peer_id = own_peer_id
	local is_server = server_peer_id == own_peer_id
	self._is_server = is_server

	if is_server then
		self._unique_connection_counter = 0
		self._unique_connections = {}
		self._load_sync_done_peers = {
			[own_peer_id] = true
		}
		local type_info = Network.type_info("enemy_package_loader_connection_key")
		self._connection_key_max = self._connection_key_max or type_info.max + 1
	else
		self._unique_connection_key = nil
		self._has_synced_all_loaded_to_server = false
	end
end

EnemyPackageLoader.network_context_destroyed = function (self)
	print("[EnemyPackageLoader] network_context_destroyed")

	self._lobby = nil
	self._server_peer_id = nil
	self._peer_id = nil
	self._breeds_to_load_at_startup.initial_check_done = nil

	if self._is_server then
		self._unique_connection_counter = nil
		self._unique_connections = nil
		self._load_sync_done_peers = nil
	else
		self._unique_connection_key = nil
		self._has_synced_all_loaded_to_server = nil
	end

	self._is_server = nil
end

EnemyPackageLoader._find_unused_breed_to_unload = function (self, loaded_breeds)
	local conflict_director = Managers.state.conflict
	local num_spawned_by_breed = conflict_director._num_spawned_by_breed
	local num_queued_spawn_by_breed = conflict_director.num_queued_spawn_by_breed
	local breed_to_package_name = self._breed_to_package_name
	local unit_spawner = self._unit_spawner
	local locked_breeds = self._locked_breeds
	local package_manager = Managers.package

	for breed_name, state in pairs(loaded_breeds) do
		if not locked_breeds[breed_name] and num_queued_spawn_by_breed[breed_name] <= 0 and num_spawned_by_breed[breed_name] <= 0 and not unit_spawner:breed_in_death_watch(breed_name) then
			local aliases = BREED_TO_ALIASES[breed_name]
			local alias_breed_used = false

			if aliases then
				local num_aliases = #aliases

				for i = 1, num_aliases, 1 do
					local alias = aliases[i]

					if num_queued_spawn_by_breed[alias] > 0 or num_spawned_by_breed[alias] > 0 or unit_spawner:breed_in_death_watch(alias) then
						alias_breed_used = true

						break
					end
				end
			end

			if not alias_breed_used and package_manager:can_unload(breed_to_package_name[breed_name]) then
				return breed_name
			end
		end
	end
end

EnemyPackageLoader._pick_breed_from_processed_breeds = function (self, breeds, limit)
	local breed_processed = self.breed_processed
	local wanted_index = math.random(1, limit)
	local j = 0
	local num_breeds = #breeds

	for i = 1, num_breeds, 1 do
		local breed_name = breeds[i]

		if breed_processed[breed_name] then
			j = j + 1

			if wanted_index <= j then
				return breed_name
			end
		end
	end

	ferror("[EnemyPackageLoader:_pick_breed_from_processed_breeds] No breed found, this should not happen!")
end

EnemyPackageLoader.request_breed = function (self, breed_name, ignore_breed_limits, spawn_category)
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
			local replacement_breed_override_func = breed_category_data.replacement_breed_override_funcs and breed_category_data.replacement_breed_override_funcs[spawn_category]

			if replacement_breed_override_func then
				local replacement_breed_name = self[replacement_breed_override_func](self)

				return false, replacement_breed_name
			else
				local breeds = breed_category_data.breeds
				local replacement_breed_name = self:_pick_breed_from_processed_breeds(breeds, package_limit)

				return false, replacement_breed_name
			end
		end
	end

	self:_load_package(breed_name, breed_category_data)

	return true
end

local ELITE_REPLACEMENTS = {}
local FALLBACK_REPLACEMENTS = {}

EnemyPackageLoader._find_patrol_replacement = function (self)
	table.clear(ELITE_REPLACEMENTS)
	table.clear(FALLBACK_REPLACEMENTS)

	local startup_breeds = self._breeds_to_load_at_startup

	for _, breed_name in ipairs(startup_breeds) do
		local potential_breed = Breeds[breed_name]

		if potential_breed.patrol_passive_perception and potential_breed.patrol_passive_target_selection then
			if potential_breed.elite then
				ELITE_REPLACEMENTS[#ELITE_REPLACEMENTS + 1] = breed_name
			elseif not potential_breed.boss and not potential_breed.special then
				FALLBACK_REPLACEMENTS[#FALLBACK_REPLACEMENTS + 1] = breed_name
			end
		end
	end

	print("### REPLACING BREED IN PATROL")

	local replacement_breed_name = nil

	if table.size(ELITE_REPLACEMENTS) > 0 then
		local elite_index = Math.random(#ELITE_REPLACEMENTS)
		replacement_breed_name = ELITE_REPLACEMENTS[elite_index]
	else
		local fallback_index = Math.random(#FALLBACK_REPLACEMENTS)
		replacement_breed_name = FALLBACK_REPLACEMENTS[fallback_index]
	end

	print(string.format(" - Replacement breed name %q", replacement_breed_name))

	return replacement_breed_name
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

EnemyPackageLoader._set_breed_package_lock = function (self, breed_name, locked)
	local modifier = (locked and 1) or -1
	local locked_breeds = self._locked_breeds
	local aliases = BREED_TO_ALIASES[breed_name]

	if aliases then
		local num_aliases = #aliases

		for i = 1, num_aliases, 1 do
			local alias = aliases[i]
			locked_breeds[alias] = (locked_breeds[alias] or 0) + modifier

			if locked_breeds[alias] == 0 then
				locked_breeds[alias] = nil
			end
		end
	end

	locked_breeds[breed_name] = (locked_breeds[breed_name] or 0) + modifier

	if locked_breeds[breed_name] == 0 then
		locked_breeds[breed_name] = nil
	end

	fassert(not locked_breeds[breed_name] or locked_breeds[breed_name] > 0, "EnemyPackageLoader: Called unlock breed package more times than lock!")
end

EnemyPackageLoader.update_breeds_loading_status = function (self)
	local breeds_list = self._currently_loading_breeds

	if not next(breeds_list) then
		return
	end

	local peers = self._load_sync_done_peers

	for breed_name, _ in pairs(breeds_list) do
		local peers_done = self._dynamic_loaded_packages[breed_name]
		local loading_done = true

		for peer_id, _ in pairs(peers) do
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

EnemyPackageLoader.lock_breed_package = function (self, breed_name)
	self:_set_breed_package_lock(breed_name, true)
end

EnemyPackageLoader.unlock_breed_package = function (self, breed_name)
	self:_set_breed_package_lock(breed_name, false)
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

	local is_locked_breed = self._locked_breeds[breed_name]

	fassert(not is_locked_breed, "EnemyPackageLoader:_unload_package: Trying to unload a locked breed!")

	local package_name = BREED_PATH .. ((self.use_optimized and OPT_LOOKUP_BREED_NAMES[breed_name]) or breed_name)

	Managers.package:unload(package_name, "EnemyPackageLoader")

	local is_server = self._is_server

	if is_server and not LEVEL_EDITOR_TEST then
		breed_category_data.current = breed_category_data.current - 1
		breed_category_data.loaded_breeds[breed_name] = nil
		local breed_id = NetworkLookup.breeds[breed_name]

		self:_send_rpc_to_clients("rpc_from_server_unload_breed_package", breed_id)
		table.clear(self._dynamic_loaded_packages[breed_name])

		self._currently_loading_breeds[breed_name] = nil

		self:_set_breed_loaded_on_all_peers(breed_name, false)
	end

	self._package_state[breed_name] = "unloaded"

	self:_set_breed_processed(breed_name, false)
	self:report_if_synced_to_server()
end

EnemyPackageLoader.load_sync_done_for_peer = function (self, peer_id)
	if self._is_server == nil then
		return false
	end

	fassert(self._is_server, "only call this on the server/host")

	return self._load_sync_done_peers[peer_id]
end

EnemyPackageLoader.report_if_synced_to_server = function (self)
	if self._lobby and not self._is_server and not self._has_synced_all_loaded_to_server then
		local all_packages_loaded = self:loading_completed()

		if all_packages_loaded then
			print("[EnemyPackageLoader] has_synced_all_loaded_to_server")
			self:_send_rpc_to_server("rpc_from_client_sync_packages_load_done")

			self._has_synced_all_loaded_to_server = true
		end
	end
end

EnemyPackageLoader.cb_breed_package_loaded = function (self, breed_name)
	local breed_id = NetworkLookup.breeds[breed_name]
	local is_server = self._is_server

	if is_server then
		self._dynamic_loaded_packages[breed_name][self._peer_id] = true
		local breed_category_data = self._breed_category_lookup[breed_name]
		breed_category_data.loaded_breeds[breed_name] = true
	else
		self:_send_rpc_to_server("rpc_from_client_loading_breed_package_done", breed_id)
	end

	self._package_state[breed_name] = "loaded"

	self:report_if_synced_to_server()
end

EnemyPackageLoader.cb_breed_package_loaded_client_startup = function (self, breed_name)
	self._package_state[breed_name] = "loaded"

	self:report_if_synced_to_server()
end

EnemyPackageLoader.cb_startup_breed_package_loaded = function (self, breed_name)
	self._package_state[breed_name] = "loaded"

	self:_set_breed_loaded_on_all_peers(breed_name, true)
	self:report_if_synced_to_server()
end

EnemyPackageLoader._add_breed_package_name = function (self, breed_list)
	local breed_to_package_name = self._breed_to_package_name

	for i = 1, #breed_list, 1 do
		local breed_name = breed_list[i]
		breed_to_package_name[breed_name] = BREED_PATH .. ((self.use_optimized and OPT_LOOKUP_BREED_NAMES[breed_name]) or breed_name)
	end
end

EnemyPackageLoader._add_missing_breeds_to_dynamic = function (self)
	local category = "custom_event"
	local limit = math.huge
	local replacement_breed_override_funcs = nil
	local breed_list = Script.new_array(32)
	local breed_list_size = 0
	local breed_category_lookup = self._breed_category_lookup

	for breed_name, breed in pairs(Breeds) do
		if not breed_category_lookup[breed_name] then
			breed_list_size = breed_list_size + 1
			breed_list[breed_list_size] = breed_name
		end
	end

	self:_create_breed_category_lookup(breed_list, category, limit, replacement_breed_override_funcs)
end

EnemyPackageLoader._create_breed_category_lookup = function (self, breed_list, category, limit, replacement_breed_override_funcs)
	local breed_category_loaded_packages = self.breed_category_loaded_packages

	if breed_category_loaded_packages[category] == nil then
		breed_category_loaded_packages[category] = {
			current = 0,
			name = category,
			limit = limit,
			loaded_breeds = {},
			breeds = breed_list,
			replacement_breed_override_funcs = replacement_breed_override_funcs
		}
	end

	local breed_category_lookup = self._breed_category_lookup

	for i = 1, #breed_list, 1 do
		local breed_name = breed_list[i]
		breed_category_lookup[breed_name] = breed_category_loaded_packages[category]
	end
end

EnemyPackageLoader._create_dynamic_breed_lookups = function (self)
	local breed_categories = EnemyPackageLoaderSettings.categories
	local num_breed_categories = #breed_categories

	for i = 1, num_breed_categories, 1 do
		local data = breed_categories[i]

		if BUILD ~= data.forbidden_in_build and data.dynamic_loading then
			local id = data.id
			local breeds = data.breeds
			local replacement_breed_override_funcs = data.replacement_breed_override_funcs

			self:_create_breed_category_lookup(breeds, id, data.limit, replacement_breed_override_funcs)
			self:_add_breed_package_name(breeds)
		end
	end
end

EnemyPackageLoader._reset_dynamic_breed_lookups = function (self)
	self.breed_category_loaded_packages = table.clone(self._dynamic_breed_category_loaded_packages)
	self._breed_category_lookup = table.clone(self._dynamic_breed_lookups)
end

function print_breed_hash(t, desc)
	local s = desc or ""

	for k, v in pairs(t) do
		s = s .. k .. " "
	end

	print(s)
end

local function completed_level_num_times(level_name, times)
	local player_manager = Managers.player
	local stats_id = player_manager:local_player():stats_id()
	local statistics_db = Managers.player:statistics_db()
	local num = statistics_db:get_stat(stats_id, "completed_levels", level_name)
	local has_completed_level = num and times <= num

	return has_completed_level
end

EnemyPackageLoader._remove_locked_directors = function (self, director_list, failed_locked_functions)
	print("checking dlc's against conflict directors")

	for i = #director_list, 1, -1 do
		local director_name = director_list[i]
		local conflict_director = ConflictDirectors[director_name]
		local locked_func_name = conflict_director.locked_func_name

		if locked_func_name and failed_locked_functions[locked_func_name] then
			table.swap_delete(director_list, i)
			printf("- removing conflict director '%s'", conflict_director.name)
		end
	end
end

EnemyPackageLoader._get_directors_from_breed_budget = function (self, spawn_breed_hash, num_needed_directors, director_list, breed_cap, difficulty_name, non_random_conflict_directors, seed)
	local num_used_breeds = table.size(spawn_breed_hash)
	local num_free = breed_cap - num_used_breeds

	fassert(num_free >= 0, "Fail, too many breeds! ")

	local approved_directors = {}
	local new_breeds = nil
	local new_breed_list = {}
	local success = nil

	printf("--- --- ---")
	printf("Starting... difficulty '%s'", difficulty_name)

	if table.is_empty(non_random_conflict_directors) then
		printf("There are no starting conflict directors!")
	else
		printf("These are the starting conflict directors:")

		for director_name, _ in pairs(non_random_conflict_directors) do
			printf("\t %s", director_name)
		end
	end

	printf("--- --- ---\n")

	for i = 1, num_needed_directors, 1 do
		print("")
		print("Looking for a new director:")
		print_breed_hash(spawn_breed_hash, sprintf("(free: %s) master hash is: ", num_free))

		seed = table.shuffle(director_list, seed)

		while #director_list > 0 do
			new_breeds = 0

			table.clear(new_breed_list)

			local director_name = director_list[1]
			local director = ConflictDirectors[director_name]
			local breed_hash = director.contained_breeds[difficulty_name]

			print("->trying director:", director.name)

			success = true

			for breed_name, breed in pairs(breed_hash) do
				if not spawn_breed_hash[breed_name] then
					new_breeds = new_breeds + 1
					new_breed_list[breed_name] = breed

					if num_free < new_breeds then
						success = false

						table.swap_delete(director_list, 1)
						print("\t--> fail!")

						break
					end
				end
			end

			if success then
				print("\t--> success!")

				for breed_name, breed in pairs(breed_hash) do
					if not spawn_breed_hash[breed_name] then
						spawn_breed_hash[breed_name] = true
						num_free = num_free - 1
					end
				end

				approved_directors[#approved_directors + 1] = director

				if new_breeds > 0 then
					print_breed_hash(new_breed_list, "\t--> Added these breeds: ")

					break
				end

				print("\t--> re-used the same breeds")

				break
			end
		end

		fassert(success, "---> failed to find a director with matching breeds")
	end

	print("")
	print("DONE! Found the following directors:")

	for i = 1, #approved_directors, 1 do
		local director = approved_directors[i]

		printf("\t %s", director.name)
	end

	print_breed_hash(spawn_breed_hash, sprintf("(free: %s), Master hash is: ", num_free))

	return approved_directors
end

EnemyPackageLoader._remove_directors_by_breed_budget = function (self, director_names_list, breeds_in_use, difficulty_name, breed_cap)
	local new_breed_list = {}

	for i = #director_names_list, 1, -1 do
		local director_name = director_names_list[i]
		local director = ConflictDirectors[director_name]
		local breed_hash = director.contained_breeds[difficulty_name]
		local new_breeds = 0

		table.clear(new_breed_list)

		for breed_name, breed in pairs(breed_hash) do
			if not breeds_in_use[breed_name] then
				new_breeds = new_breeds + 1
				new_breed_list[breed_name] = breed

				if breed_cap < new_breeds then
					table.swap_delete(director_names_list, i)

					break
				end
			end
		end
	end
end

EnemyPackageLoader._get_factions_from_directors = function (self, director_names_list)
	local factions = {}

	for director_name_id = 1, #director_names_list, 1 do
		local director_name = director_names_list[director_name_id]
		local director = ConflictDirectors[director_name]
		local director_factions = director and director.factions

		if director_factions then
			for faction_id = 1, #director_factions, 1 do
				local faction_to_add = director_factions[faction_id]

				if table.index_of(factions, faction_to_add) == -1 then
					table.insert(factions, faction_to_add)
				end
			end
		end
	end

	return factions
end

EnemyPackageLoader._make_faction_list = function (self, available_factions, mandatory_factions, faction_weights, seed, preferred_num_faction)
	local faction_list = nil

	print("number of factions to include", preferred_num_faction)

	if preferred_num_faction < #available_factions then
		faction_list = table.shallow_copy(mandatory_factions)

		table.array_remove_if(available_factions, function (faction)
			return table.index_of(faction_list, faction) > 0
		end)

		local num_selected_factions = #faction_list

		while preferred_num_faction > num_selected_factions do
			normalize_weight_map(available_factions, faction_weights, DefaultConflictFactionWeight)

			local random = 0
			seed, random = Math.next_random(seed)
			local random_faction_id = get_weighted_random_index(random, available_factions, faction_weights)
			local faction_to_add = available_factions[random_faction_id]

			print("Rolled random faction:", random, faction_to_add)
			table.swap_delete(available_factions, random_faction_id)
			table.insert(faction_list, faction_to_add)

			num_selected_factions = num_selected_factions + 1
		end
	else
		faction_list = table.shallow_copy(available_factions)
	end

	print("number of factions added", #faction_list)

	return seed, faction_list
end

EnemyPackageLoader._remove_directors_not_in_factions = function (self, director_names_list, faction_list)
	table.array_remove_if(director_names_list, function (director_name)
		local director = ConflictDirectors[director_name]
		local director_factions = director and director.factions

		if director_factions then
			for faction_id = 1, #director_factions, 1 do
				local director_faction_name = director_factions[faction_id]

				if table.index_of(faction_list, director_faction_name) == -1 then
					return true
				end
			end
		end

		return false
	end)
end

EnemyPackageLoader._get_startup_breeds = function (self, level_key, level_seed, failed_locked_functions, use_random_directors, overriden_conflict_setting_name)
	local level_settings = LevelSettings[level_key]
	local level_name = level_settings.level_name
	local num_nested_levels = LevelResource.nested_level_count(level_name)

	if num_nested_levels > 0 then
		level_name = LevelResource.nested_level_resource_name(level_name, 0)
	end

	local spawn_zone_path = level_name .. "_spawn_zones"

	if not Application.can_get("lua", spawn_zone_path) then
		ferror("Cant get %s, make sure this is added to the \\resource_packages\\level_scripts.package file. Or have you forgotten to run generate_resource_packages.bat? If it only crashes when running from a bundle, it might be that this level needs to be whitelisted.", spawn_zone_path)
	end

	local breed_lookup = {}
	local difficulty, difficulty_tweak = Managers.mechanism:get_difficulty()
	local composition_difficulty = DifficultyTweak.converters.composition(difficulty, difficulty_tweak)
	local composition_difficulty_rank = DifficultySettings[composition_difficulty].rank
	local terror_events = TerrorEventBlueprints[level_key]

	if terror_events then
		for event_name, event in pairs(terror_events) do
			ConflictUtils.add_breeds_from_event(event_name, event, composition_difficulty, composition_difficulty_rank, breed_lookup, terror_events)
		end
	end

	local spawn_zone_data = table.clone(MainPathSpawningGenerator.load_spawn_zone_data(spawn_zone_path))
	local crossroads = spawn_zone_data.crossroads
	local main_paths = spawn_zone_data.main_paths
	local zones = spawn_zone_data.zones
	local num_main_zones = spawn_zone_data.num_main_zones
	local path_markers = spawn_zone_data.path_markers
	local chosen_crossroads = MainPathSpawningGenerator.generate_crossroad_path_choices(crossroads, level_seed)
	local main_path_was_changed, altered_amount_num_main_zones, _ = MainPathSpawningGenerator.remove_crossroads_extra_path_branches(crossroads, chosen_crossroads, main_paths, zones, num_main_zones, path_markers, level_seed)

	if main_path_was_changed then
		num_main_zones = altered_amount_num_main_zones
	end

	local default_conflict_settings_name = overriden_conflict_setting_name or level_settings.conflict_settings or "default"
	local non_random_conflict_directors, num_random_conflict_directors = nil
	non_random_conflict_directors, num_random_conflict_directors, level_seed = MainPathSpawningGenerator.process_conflict_directors_zones(default_conflict_settings_name, zones, num_main_zones, level_seed)

	for conflict_settings_name, _ in pairs(non_random_conflict_directors) do
		local conflict_setting = ConflictDirectors[conflict_settings_name]
		local contained_breeds = conflict_setting.contained_breeds[composition_difficulty]

		table.merge(breed_lookup, contained_breeds)
	end

	if use_random_directors then
		local director_list = table.shallow_copy(level_settings.conflict_director_set or DefaultConflictDirectorSet)
		local faction_weights = table.shallow_copy(level_settings.conflict_faction_weights or DefaultConflictFactionSetWeights)
		local breed_cap = level_settings.breed_cap_override or EnemyPackageLoaderSettings.max_loaded_breed_cap
		local faction_count_roll = 0
		level_seed, faction_count_roll = Math.next_random(level_seed)
		local num_faction_chances = DefaultConflictPreferredFactionCountChances
		local preferred_num_faction = 0

		for i = 1, #num_faction_chances, 1 do
			local required_roll = num_faction_chances[i]

			if faction_count_roll <= required_roll then
				preferred_num_faction = i
			end
		end

		if not DEDICATED_SERVER then
			self:_remove_locked_directors(director_list, failed_locked_functions)
		end

		self:_remove_directors_by_breed_budget(director_list, breed_lookup, composition_difficulty, breed_cap)

		local non_random_director_list = table.keys(non_random_conflict_directors)
		local mandatory_factions = self:_get_factions_from_directors(non_random_director_list)
		local available_factions = self:_get_factions_from_directors(director_list)
		local faction_list = nil
		level_seed, faction_list = self:_make_faction_list(available_factions, mandatory_factions, faction_weights, level_seed, preferred_num_faction)

		self:_remove_directors_not_in_factions(director_list, faction_list)

		self.random_director_list = self:_get_directors_from_breed_budget(breed_lookup, num_random_conflict_directors, director_list, breed_cap, composition_difficulty, non_random_conflict_directors, level_seed, failed_locked_functions)
	end

	local loop_breeds = true

	while loop_breeds do
		loop_breeds = false

		for breed_name, _ in pairs(breed_lookup) do
			local breed_data = Breeds[breed_name]

			if breed_data.additional_breed_packages_to_load then
				local additional_breeds = breed_data.additional_breed_packages_to_load(composition_difficulty)

				if additional_breeds then
					for i = 1, #additional_breeds, 1 do
						local additional_breed_name = additional_breeds[i]
						local breed_added = breed_lookup[additional_breed_name]

						if not breed_added and table.size(breed_lookup) < EnemyPackageLoaderSettings.max_loaded_breed_cap then
							breed_lookup[additional_breed_name] = true
							loop_breeds = true
						end
					end
				end
			end
		end
	end

	print("[EnemyPackageLoader] breed_lookup: " .. table.tostring(breed_lookup))

	return breed_lookup
end

EnemyPackageLoader.setup_startup_enemies = function (self, level_key, level_seed, failed_locked_functions, use_random_directors, overriden_conflict_setting_name)
	fassert(level_seed, "Cannot setup_startup_enemies without level_seed!")

	local breeds_to_load_at_startup = self._breeds_to_load_at_startup
	breeds_to_load_at_startup.initial_check_done = true

	if not breeds_to_load_at_startup.loaded then
		self:_reset_dynamic_breed_lookups()
		print("[EnemyPackageLoader] setup_startup_enemies - level_key:", level_key, "- level_seed:", level_seed, "- use_random_directors:", use_random_directors, "- overriden_conflict:", overriden_conflict_setting_name)

		local level_settings = LevelSettings[level_key]

		if level_settings.load_no_enemies then
			print("[EnemyPackageLoader] Load no enemies on this level")
		else
			local startup_breeds = self:_get_startup_breeds(level_key, level_seed, failed_locked_functions, use_random_directors, overriden_conflict_setting_name)
			local breed_category_lookup = self._breed_category_lookup
			local breeds_to_load_lookup = {}
			local breed_categories = level_settings.breed_categories or EnemyPackageLoaderSettings.categories
			local num_breed_categories = #breed_categories

			for i = 1, num_breed_categories, 1 do
				local data = breed_categories[i]

				if BUILD ~= data.forbidden_in_build and not data.dynamic_loading then
					local breeds = data.breeds
					local num_breeds = #breeds

					for j = 1, num_breeds, 1 do
						local breed_name = breeds[j]
						breeds_to_load_lookup[breed_name] = breed_name
						breeds_to_load_at_startup[#breeds_to_load_at_startup + 1] = breed_name
					end
				end
			end

			for breed_name, _ in pairs(startup_breeds) do
				breed_name = ALIAS_TO_BREED[breed_name] or breed_name
				local is_dynamic = breed_category_lookup[breed_name]

				if not is_dynamic and not breeds_to_load_lookup[breed_name] then
					breeds_to_load_lookup[breed_name] = breed_name
					breeds_to_load_at_startup[#breeds_to_load_at_startup + 1] = breed_name
				end
			end

			self:_add_missing_breeds_to_dynamic()
			self:_add_breed_package_name(breeds_to_load_at_startup)
			self:_load_startup_enemy_packages()
		end
	end

	if self._unique_connection_key then
		self:report_if_synced_to_server()
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

	printf("load_startup_enemy_packages: --------------")

	for i = 1, num_entries, 1 do
		local breed_name = breeds_to_load_at_startup[i]
		local breed = Breeds[breed_name]

		fassert(not breed.opt_base_unit or OPT_LOOKUP_BREED_NAMES[breed_name], "Breed %q has an optimized base unit but isn't setup correctly in %q", breed_name, "EnemyPackageLoaderSettings.opt_lookup_breed_names")

		breeds_to_load_at_startup[breed_name] = true
		local breed_package_name = BREED_PATH .. ((use_optimized and OPT_LOOKUP_BREED_NAMES[breed_name]) or breed_name)
		package_state[breed_name] = "loading"

		package_manager:load(breed_package_name, "EnemyPackageLoader", callback(self, "cb_startup_breed_package_loaded", breed_name), async, prioritize)
		self:_set_breed_processed(breed_name, true)
		printf(breed_name)
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

	printf("[EnemyPackageLoader] unload_enemy_packages (unload startup enemies=%s)", tostring(unload_startup_packages))

	local package_state = self._package_state
	local breeds_to_load_at_startup = self._breeds_to_load_at_startup
	local locked_breeds = self._locked_breeds
	local use_optimized = self.use_optimized

	for breed_name, state in pairs(package_state) do
		if state ~= "unloaded" and (unload_startup_packages or not breeds_to_load_at_startup[breed_name]) then
			fassert(not locked_breeds[breed_name], "EnemyPackageLoader:unload_enemy_packages: Trying to unload a locked breed, remember to unlock breed on shutdown! If you are locking packages via level flow, use unload_enemy_packages external in event to unload.")

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

	local category_lookup = self.breed_category_loaded_packages

	for category, data in pairs(category_lookup) do
		data.current = 0

		table.clear(data.loaded_breeds)
	end

	self.random_director_list = nil
end

EnemyPackageLoader._sync_dynamic_to_client = function (self, peer_id, connection_key)
	local package_state = self._package_state
	local breeds_to_load_at_startup = self._breeds_to_load_at_startup
	local bitmasks = {}

	for i = 1, math.ceil(#NetworkLookup.breeds / 32), 1 do
		bitmasks[#bitmasks + 1] = 0
	end

	print("Sync dynamic to client:")

	for breed_name, state in pairs(package_state) do
		if state ~= "unloaded" and not breeds_to_load_at_startup[breed_name] then
			local breed_index = NetworkLookup.breeds[breed_name]
			local bit_index = (breed_index - 1) % 32
			local bitmask_index = math.ceil(breed_index / 32)
			local bitmask = bitmasks[bitmask_index]
			bitmasks[bitmask_index] = bit.bor(bitmask, 2^bit_index)
			local dynamic_package = self._dynamic_loaded_packages[breed_name]
			dynamic_package[peer_id] = true

			printf("breed_name: %s, bitmask: %d, bit_index: %d", breed_name, bitmask_index, bit_index)
		end
	end

	self:_send_rpc("rpc_from_server_load_breeds_by_bitmask", peer_id, connection_key, bitmasks)
end

EnemyPackageLoader.rpc_from_server_load_breeds_by_bitmask = function (self, channel_id, connection_key, bitmasks)
	local num_bitmasks = #bitmasks
	self._unique_connection_key = connection_key

	printf("[EnemyPackageLoader] New connection established (%s) (key=%s)", channel_id, connection_key)

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

	if self._breeds_to_load_at_startup.initial_check_done then
		self:report_if_synced_to_server()
	end
end

EnemyPackageLoader.rpc_from_server_load_breed_package = function (self, channel_id, connection_key, breed_id)
	local server_peer_id = self._server_peer_id
	local unique_connection_key = self._unique_connection_key
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if server_peer_id ~= peer_id then
		printf("[EnemyPackageLoader] rpc_from_server_load_breed_package from wrong lobby (server=%s|%s)", server_peer_id or "nil", peer_id)

		return
	elseif connection_key ~= unique_connection_key then
		printf("[EnemyPackageLoader] rpc_from_server_load_breed_package from old connection (%s) (key=%s|%s)", peer_id, unique_connection_key or "nil", connection_key)

		return
	end

	local breed_name = NetworkLookup.breeds[breed_id]

	printf("[EnemyPackageLoader] rpc_from_server_load_breed_package (peer_id=%s, connection_key=%d, breed_name=%s)", peer_id, connection_key, breed_name)
	self:_start_loading_package(breed_name)
end

EnemyPackageLoader.rpc_from_server_unload_breed_package = function (self, channel_id, connection_key, breed_id)
	local server_peer_id = self._server_peer_id
	local unique_connection_key = self._unique_connection_key
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if server_peer_id ~= peer_id then
		printf("[EnemyPackageLoader] rpc_from_server_unload_breed_package from wrong lobby (server=%s|%s)", server_peer_id or "nil", peer_id)

		return
	elseif connection_key ~= unique_connection_key then
		printf("[EnemyPackageLoader] rpc_from_server_unload_breed_package from old connection (%s) (key=%s|%s)", peer_id, unique_connection_key or "nil", connection_key)

		return
	end

	local breed_name = NetworkLookup.breeds[breed_id]

	printf("[EnemyPackageLoader] rpc_from_server_unload_breed_package (peer_id=%s, connection_key=%d, breed_name=%s)", peer_id, connection_key, breed_name)
	self:_unload_package(breed_name)
end

EnemyPackageLoader.rpc_from_client_loading_breed_package_done = function (self, channel_id, connection_key, breed_id)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]
	local client_key = self._unique_connections[peer_id]

	if client_key ~= connection_key then
		printf("[EnemyPackageLoader] rpc_from_client_loading_breed_package_done from old connection (%s) - (key=%s|%s)", peer_id, client_key or "nil", connection_key)

		return
	end

	local breed_name = NetworkLookup.breeds[breed_id]

	printf("[EnemyPackageLoader] rpc_from_client_loading_breed_package_done (peer_id=%s, connection_key=%d, breed_name=%s)", peer_id, connection_key, breed_name)

	self._dynamic_loaded_packages[breed_name][peer_id] = true
end

EnemyPackageLoader.rpc_from_client_sync_packages_load_done = function (self, channel_id, connection_key)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]
	local client_key = self._unique_connections[peer_id]

	if client_key ~= connection_key then
		printf("[EnemyPackageLoader] rpc_from_client_sync_packages_load_done from old connection (%s) - (key=%s|%s)", peer_id, client_key or "nil", connection_key)

		return
	else
		printf("[EnemyPackageLoader] rpc_from_client_sync_packages_load_done (peer_id=%s, connection_key=%d)", peer_id, connection_key)
	end

	self._load_sync_done_peers[peer_id] = true
end

EnemyPackageLoader._send_rpc = function (self, rpc_name, peer_id, ...)
	if not self._lobby then
		return
	end

	local rpc = RPC[rpc_name]
	local channel_id = PEER_ID_TO_CHANNEL[peer_id]

	rpc(channel_id, ...)
end

EnemyPackageLoader._send_rpc_to_server = function (self, rpc_name, ...)
	if not self._lobby then
		return
	end

	local rpc = RPC[rpc_name]
	local channel_id = PEER_ID_TO_CHANNEL[self._server_peer_id]

	rpc(channel_id, self._unique_connection_key, ...)
end

EnemyPackageLoader._send_rpc_to_clients = function (self, rpc_name, ...)
	local rpc = RPC[rpc_name]
	local server_peer_id = self._server_peer_id
	local unique_connections = self._unique_connections

	for peer_id, connection_key in pairs(unique_connections) do
		if peer_id ~= server_peer_id and connection_key then
			local channel_id = PEER_ID_TO_CHANNEL[peer_id]

			rpc(channel_id, connection_key, ...)
		end
	end
end

EnemyPackageLoader._send_rpc_to_clients_except = function (self, rpc_name, except, ...)
	local rpc = RPC[rpc_name]
	local server_peer_id = self._server_peer_id
	local unique_connections = self._unique_connections

	for peer_id, connection_key in pairs(unique_connections) do
		if peer_id ~= server_peer_id and peer_id ~= except and connection_key then
			local channel_id = PEER_ID_TO_CHANNEL[peer_id]

			rpc(channel_id, connection_key, ...)
		end
	end
end

EnemyPackageLoader.get_startup_breeds = function (self)
	return self._breeds_to_load_at_startup
end

EnemyPackageLoader.client_connected = function (self, peer_id)
	local connection_key = self._unique_connection_counter

	printf("[EnemyPackageLoader] client_connected (peer_id=%s, connection_key=%d)", peer_id, connection_key)

	self._unique_connections[peer_id] = connection_key

	self:_sync_dynamic_to_client(peer_id, connection_key)

	local connection_key_max = self._connection_key_max
	self._unique_connection_counter = (connection_key + 1) % connection_key_max
	self._load_sync_done_peers[peer_id] = false
end

EnemyPackageLoader.client_disconnected = function (self, peer_id)
	printf("[EnemyPackageLoader] client_disconnected (peer_id=%s)", peer_id)

	local dynamic_loaded_packages = self._dynamic_loaded_packages

	for breed_name, peers in pairs(dynamic_loaded_packages) do
		peers[peer_id] = nil
	end

	if self._unique_connections then
		self._unique_connections[peer_id] = nil
		self._load_sync_done_peers[peer_id] = nil
	end
end

EnemyPackageLoader.debug_loaded_breeds = function (self)
	local num_spawned_by_breed = Managers.state.conflict._num_spawned_by_breed
	local package_state = self._package_state
	local breed_category_lookup = self._breed_category_lookup
	local breed_category_loaded_packages = self.breed_category_loaded_packages
	local dynamic_loaded_packages = self._dynamic_loaded_packages
	local breed_loaded_on_all_peers = self.breed_loaded_on_all_peers
	local locked_breeds = self._locked_breeds
	local peers = self._load_sync_done_peers

	Debug.text("EnemyPackageLoader Policy=%s", EnemyPackageLoaderSettings.policy)

	for current_category, _ in pairs(breed_category_loaded_packages) do
		Debug.text("Loaded %s:", current_category)

		for breed_name, state in pairs(package_state) do
			local category_data = breed_category_lookup[breed_name]

			if (state == "loaded" or state == "loading") and category_data and category_data.name == current_category then
				local num_alive = ""
				local breed_in_death_watch = false

				if self._is_server then
					breed_in_death_watch = self._unit_spawner:breed_in_death_watch(breed_name)
					num_alive = num_spawned_by_breed[breed_name]
					local aliases = BREED_TO_ALIASES[breed_name]

					if aliases then
						local num_aliases = #aliases

						for i = 1, num_aliases, 1 do
							local alias = aliases[i]
							num_alive = num_alive + num_spawned_by_breed[alias]
							breed_in_death_watch = breed_in_death_watch or self._unit_spawner:breed_in_death_watch(alias)
						end
					end
				end

				local is_locked_string = (locked_breeds[breed_name] and "[LOCKED]") or ""

				Debug.text("   %s=%s %s %s %s", breed_name, state, (breed_in_death_watch and "DL") or "", tostring(num_alive), is_locked_string)

				if self._is_server and not breed_loaded_on_all_peers[breed_name] then
					local peers_done = dynamic_loaded_packages[breed_name]

					Debug.text("         --Waiting on Peer(s) to Load--")

					for peer_id, _ in pairs(peers) do
						if not peers_done[peer_id] then
							Debug.text("         %s", peer_id)
						end
					end
				end
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
