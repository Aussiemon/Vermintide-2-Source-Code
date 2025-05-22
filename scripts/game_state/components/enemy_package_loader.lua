-- chunkname: @scripts/game_state/components/enemy_package_loader.lua

require("scripts/settings/enemy_package_loader_settings")
require("scripts/managers/conflict_director/main_path_spawning_generator")
require("scripts/managers/conflict_director/conflict_utils")

EnemyPackageLoader = class(EnemyPackageLoader)

local PACKAGE_REFERENCE_NAME = "EnemyPackageLoader"
local BREED_PATH = EnemyPackageLoaderSettings.breed_path
local ALIAS_TO_BREED = EnemyPackageLoaderSettings.alias_to_breed
local BREED_TO_ALIASES = EnemyPackageLoaderSettings.breed_to_aliases
local OPT_LOOKUP_BREED_NAMES = EnemyPackageLoaderSettings.opt_lookup_breed_names

local function get_weighted_random_index(random, entries, entry_weight_map)
	local range_start = 0
	local num_entries = #entries

	for i = 1, num_entries do
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

	for director_id = 1, #list do
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

	for i = 1, #list do
		local current_entry = list[i]
		local current_weight = list_weight_map[current_entry]

		printf("\t %s, %.2f (%.2f-%.2f)", current_entry, current_weight, last_weight, last_weight + current_weight)

		last_weight = last_weight + current_weight
	end
end

EnemyPackageLoader.init = function (self)
	self._use_optimized = script_data.use_optimized_breed_units
	self._breed_to_package_name_cache = {}
	self._locked_breeds = {}
	self._random_director_list = nil
	self._breed_category_loaded_packages = {}
	self._breed_category_lookup = {}
	self._loaded_breed_map = {}
end

local rpcs = {}

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

EnemyPackageLoader.network_context_created = function (self, lobby, server_peer_id, own_peer_id, network_handler)
	printf("[EnemyPackageLoader] network_context_created (server_peer_id=%s, own_peer_id=%s)", server_peer_id, own_peer_id)

	self._lobby = lobby
	self._server_peer_id = server_peer_id
	self._peer_id = own_peer_id

	local is_server = server_peer_id == own_peer_id

	self._is_server = is_server

	if is_server then
		self._breeds_to_load_at_startup = {}
		self._session_breed_map = {}
	end

	self._network_handler = network_handler
end

EnemyPackageLoader.matching_session = function (self, network_handler)
	return self._network_handler == network_handler
end

EnemyPackageLoader.network_context_destroyed = function (self)
	print("[EnemyPackageLoader] network_context_destroyed")

	self._lobby = nil
	self._server_peer_id = nil
	self._peer_id = nil
	self._network_handler = nil

	if self._is_server then
		self._session_breed_map = nil
	end

	self._is_server = nil
end

EnemyPackageLoader._find_unused_breed_to_unload = function (self, loaded_breeds)
	local conflict_director = Managers.state.conflict
	local num_spawned_by_breed = conflict_director.num_spawned_by_breed
	local num_queued_spawn_by_breed = conflict_director.num_queued_spawn_by_breed
	local unit_spawner = self._unit_spawner
	local locked_breeds = self._locked_breeds
	local package_manager = Managers.package

	for breed_name, state in pairs(loaded_breeds) do
		if not locked_breeds[breed_name] and num_queued_spawn_by_breed[breed_name] <= 0 and num_spawned_by_breed[breed_name] <= 0 and not unit_spawner:breed_in_death_watch(breed_name) then
			local aliases = BREED_TO_ALIASES[breed_name]
			local alias_breed_used = false

			if aliases then
				local num_aliases = #aliases

				for i = 1, num_aliases do
					local alias = aliases[i]

					if num_queued_spawn_by_breed[alias] > 0 or num_spawned_by_breed[alias] > 0 or unit_spawner:breed_in_death_watch(alias) then
						alias_breed_used = true

						break
					end
				end
			end

			if not alias_breed_used and package_manager:can_unload(self:_breed_package_name(breed_name)) then
				return breed_name
			end
		end
	end
end

EnemyPackageLoader._pick_breed_from_processed_breeds = function (self, breeds, limit)
	local session_breed_map = self._network_handler:get_session_breed_map()
	local wanted_index = math.random(1, limit)
	local j = 0
	local num_breeds = #breeds

	for i = 1, num_breeds do
		local breed_name = breeds[i]

		if session_breed_map[breed_name] then
			j = j + 1

			if wanted_index <= j then
				return breed_name
			end
		end
	end

	ferror("[EnemyPackageLoader:_pick_breed_from_processed_breeds] No breed found, this should not happen!")
end

EnemyPackageLoader.request_breed = function (self, breed_name, ignore_breed_limits, spawn_category)
	assert(self._is_server, "[EnemyPackageLoader] 'request_breed' is a server only function")

	breed_name = ALIAS_TO_BREED[breed_name] or breed_name

	local breed_category_data = self:_category(breed_name)
	local current_packages = breed_category_data.current
	local package_limit = breed_category_data.limit

	if not ignore_breed_limits and package_limit <= current_packages then
		local loaded_breeds = breed_category_data.loaded_breeds
		local unused_breed_name = self:_find_unused_breed_to_unload(loaded_breeds)

		if unused_breed_name then
			self:_unload_package(unused_breed_name)
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

EnemyPackageLoader.find_patrol_replacement = function (self)
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

	local replacement_breed_name

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

EnemyPackageLoader.is_breed_processed = function (self, breed_name)
	breed_name = ALIAS_TO_BREED[breed_name] or breed_name

	local session_breed_map = self._network_handler:get_session_breed_map()

	return session_breed_map[breed_name]
end

EnemyPackageLoader.processed_breeds = function (self)
	return self._network_handler:get_session_breed_map()
end

EnemyPackageLoader._set_breed_package_lock = function (self, breed_name, locked)
	local modifier = locked and 1 or -1
	local locked_breeds = self._locked_breeds
	local aliases = BREED_TO_ALIASES[breed_name]

	if aliases then
		local num_aliases = #aliases

		for i = 1, num_aliases do
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

EnemyPackageLoader.lock_breed_package = function (self, breed_name)
	self:_set_breed_package_lock(breed_name, true)
end

EnemyPackageLoader.unlock_breed_package = function (self, breed_name)
	self:_set_breed_package_lock(breed_name, false)
end

EnemyPackageLoader._load_package = function (self, breed_name, breed_category_data)
	assert(self._is_server, "[EnemyPackageLoader] '_load_package' is a server only function.")

	breed_category_data.current = breed_category_data.current + 1

	assert(not self._session_breed_map[breed_name], "[EnemyPackageLoader] Attempted to load same breed twice")

	self._session_breed_map[breed_name] = true

	self._network_handler:set_session_breed_map(table.shallow_copy(self._session_breed_map))
	self:_update_package_diffs()
end

EnemyPackageLoader._unload_package = function (self, breed_name)
	assert(self._is_server, "[EnemyPackageLoader] '_unload_package' is a server only function.")

	local is_startup_breed = self._breeds_to_load_at_startup[breed_name]

	fassert(not is_startup_breed, "EnemyPackageLoader:_unload_package: Trying to unload a startup breed!")

	local is_locked_breed = self._locked_breeds[breed_name]

	fassert(not is_locked_breed, "EnemyPackageLoader:_unload_package: Trying to unload a locked breed!")

	self._session_breed_map[breed_name] = nil

	self._network_handler:set_session_breed_map(table.shallow_copy(self._session_breed_map))
	self:_update_package_diffs()
end

EnemyPackageLoader.update = function (self)
	self:_update_package_diffs()
end

EnemyPackageLoader._update_package_diffs = function (self)
	if not self._network_handler or not self._network_handler:is_fully_synced() then
		return
	end

	local async = true
	local prioritize = true
	local package_manager = Managers.package
	local loaded_breed_map = self._loaded_breed_map
	local session_breed_map = self._session_breed_map or self._network_handler:get_session_breed_map()
	local synced_loaded_breed_map = self._network_handler:get_own_loaded_session_breed_map()

	for breed_name, status in pairs(loaded_breed_map) do
		if not session_breed_map[breed_name] then
			local package_name = self:_breed_package_name(breed_name)

			package_manager:unload(package_name, PACKAGE_REFERENCE_NAME)

			local category = self:_category(breed_name)

			category.current = category.current - 1
			category.loaded_breeds[breed_name] = nil
			loaded_breed_map[breed_name] = nil
		end
	end

	for breed_name in pairs(session_breed_map) do
		local package_name = self:_breed_package_name(breed_name)
		local has_loaded = package_manager:has_loaded(package_name, PACKAGE_REFERENCE_NAME)

		if not has_loaded and not package_manager:is_loading(package_name, PACKAGE_REFERENCE_NAME) then
			package_manager:load(package_name, PACKAGE_REFERENCE_NAME, nil, async, prioritize)
		elseif has_loaded and not loaded_breed_map[breed_name] then
			local breed_category_data = self:_category(breed_name)

			breed_category_data.loaded_breeds[breed_name] = true
			loaded_breed_map[breed_name] = true
		end
	end

	if not table.shallow_equal(loaded_breed_map, synced_loaded_breed_map) then
		self._network_handler:set_own_loaded_session_breeds(table.shallow_copy(loaded_breed_map))
	end

	if self._is_server then
		local synced_session_breed_map = self._network_handler:get_session_breed_map()

		if not table.shallow_equal(session_breed_map, synced_session_breed_map) then
			self._network_handler:set_session_breed_map(table.shallow_copy(session_breed_map))
		end
	end
end

EnemyPackageLoader.load_sync_done_for_peer = function (self, peer_id)
	if not self._network_handler or not self._network_handler:is_fully_synced() then
		return false
	end

	local session_breed_map = self._network_handler:get_session_breed_map()
	local loaded_breed_map = self._network_handler:get_loaded_session_breeds(peer_id)

	for breed_name in pairs(session_breed_map) do
		if not loaded_breed_map[breed_name] then
			return false
		end
	end

	return true
end

EnemyPackageLoader._breed_package_name = function (self, breed_name)
	local cache = self._breed_to_package_name_cache
	local cached = cache[breed_name]

	if not cached then
		cached = BREED_PATH .. (self._use_optimized and OPT_LOOKUP_BREED_NAMES[breed_name] or breed_name)
		cache[breed_name] = cached
	end

	return cached
end

EnemyPackageLoader._category = function (self, breed_name)
	local category_lookup = self._breed_category_lookup
	local category = category_lookup[breed_name]

	if category then
		return category
	end

	local category_by_name = self._breed_category_loaded_packages
	local breed_categories = EnemyPackageLoaderSettings.categories

	for i = 1, #breed_categories do
		local data = breed_categories[i]

		if BUILD ~= data.forbidden_in_build and table.find(data.breeds, breed_name) then
			category_by_name[data.id] = category_by_name[data.id] or {
				current = 0,
				name = data.id,
				dynamic_loading = data.dynamic_loading,
				limit = data.limit,
				loaded_breeds = {},
				breeds = {},
				replacement_breed_override_funcs = data.replacement_breed_override_funcs,
			}
		end
	end

	category_by_name.dynamic_breeds = category_by_name.dynamic_breeds or {
		current = 0,
		dynamic_loading = true,
		is_generated_category = true,
		name = "dynamic_breeds",
		limit = math.huge,
		loaded_breeds = {},
		breeds = {},
	}

	table.insert(category_by_name.dynamic_breeds.breeds, breed_name)

	category_lookup[breed_name] = category_by_name.dynamic_breeds

	return category_lookup[breed_name]
end

function print_breed_hash(t, desc)
	local s = desc or ""

	for k, v in pairs(t) do
		s = s .. k .. " "
	end

	print(s)
end

EnemyPackageLoader._remove_locked_directors = function (self, director_list, failed_locked_functions)
	print("checking dlc's against conflict directors")

	for i = #director_list, 1, -1 do
		local director_name = director_list[i]
		local conflict_director = ConflictDirectors[director_name]
		local locked_func_name = conflict_director.locked_func_name

		if locked_func_name and table.find(failed_locked_functions, locked_func_name) then
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
	local new_breeds
	local new_breed_list = {}
	local success

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

	for i = 1, num_needed_directors do
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

	for i = 1, #approved_directors do
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

	for director_name_id = 1, #director_names_list do
		local director_name = director_names_list[director_name_id]
		local director = ConflictDirectors[director_name]
		local director_factions = director and director.factions

		if director_factions then
			for faction_id = 1, #director_factions do
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
	local faction_list

	print("number of factions to include", preferred_num_faction)

	if preferred_num_faction < #available_factions then
		faction_list = table.shallow_copy(mandatory_factions)

		table.array_remove_if(available_factions, function (faction)
			return table.index_of(faction_list, faction) > 0
		end)

		local num_selected_factions = #faction_list

		while num_selected_factions < preferred_num_faction do
			normalize_weight_map(available_factions, faction_weights, DefaultConflictFactionWeight)

			local random

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
			for faction_id = 1, #director_factions do
				local director_faction_name = director_factions[faction_id]

				if table.index_of(faction_list, director_faction_name) == -1 then
					return true
				end
			end
		end

		return false
	end)
end

EnemyPackageLoader._get_startup_breeds = function (self, level_key, level_seed, failed_locked_functions, use_random_directors, conflict_director_name, difficulty, difficulty_tweak)
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
	local composition_difficulty = DifficultyTweak.converters.composition(difficulty, difficulty_tweak)
	local composition_difficulty_rank = DifficultySettings[composition_difficulty].rank
	local terror_events = TerrorEventBlueprints[level_key]

	if terror_events then
		for event_name, event in pairs(terror_events) do
			ConflictUtils.add_breeds_from_event(event_name, event, composition_difficulty, composition_difficulty_rank, breed_lookup, terror_events)
		end
	end

	local spawn_zone_data = table.clone(MainPathSpawningGenerator.load_spawn_zone_data(spawn_zone_path))
	local crossroads, main_paths, zones, num_main_zones, path_markers = spawn_zone_data.crossroads, spawn_zone_data.main_paths, spawn_zone_data.zones, spawn_zone_data.num_main_zones, spawn_zone_data.path_markers
	local chosen_crossroads = MainPathSpawningGenerator.generate_crossroad_path_choices(crossroads, level_seed)
	local main_path_was_changed, altered_amount_num_main_zones, _ = MainPathSpawningGenerator.remove_crossroads_extra_path_branches(crossroads, chosen_crossroads, main_paths, zones, num_main_zones, path_markers, level_seed)

	if main_path_was_changed then
		num_main_zones = altered_amount_num_main_zones
	end

	local non_random_conflict_directors, num_random_conflict_directors

	non_random_conflict_directors, num_random_conflict_directors, level_seed = MainPathSpawningGenerator.process_conflict_directors_zones(conflict_director_name, zones, num_main_zones, level_seed)

	for conflict_settings_name, _ in pairs(non_random_conflict_directors) do
		local conflict_setting = ConflictDirectors[conflict_settings_name]
		local contained_breeds = conflict_setting.contained_breeds[composition_difficulty]

		table.merge(breed_lookup, contained_breeds)
	end

	if use_random_directors then
		local director_list = table.shallow_copy(level_settings.conflict_director_set or DefaultConflictDirectorSet)
		local faction_weights = table.shallow_copy(level_settings.conflict_faction_weights or DefaultConflictFactionSetWeights)
		local breed_cap = level_settings.breed_cap_override or EnemyPackageLoaderSettings.max_loaded_breed_cap
		local faction_count_roll

		level_seed, faction_count_roll = Math.next_random(level_seed)

		local num_faction_chances = DefaultConflictPreferredFactionCountChances
		local preferred_num_faction = 0

		for i = 1, #num_faction_chances do
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
		local faction_list

		level_seed, faction_list = self:_make_faction_list(available_factions, mandatory_factions, faction_weights, level_seed, preferred_num_faction)

		self:_remove_directors_not_in_factions(director_list, faction_list)

		self._random_director_list = self:_get_directors_from_breed_budget(breed_lookup, num_random_conflict_directors, director_list, breed_cap, composition_difficulty, non_random_conflict_directors, level_seed, failed_locked_functions)
	end

	local loop_breeds = true

	while loop_breeds do
		loop_breeds = false

		for breed_name, _ in pairs(breed_lookup) do
			local breed_data = Breeds[breed_name]

			if breed_data.additional_breed_packages_to_load then
				local additional_breeds = breed_data.additional_breed_packages_to_load(composition_difficulty)

				if additional_breeds then
					for i = 1, #additional_breeds do
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

EnemyPackageLoader.setup_startup_enemies = function (self, level_key, level_seed, failed_locked_functions, use_random_directors, conflict_director_name, difficulty, difficulty_tweak)
	fassert(self._is_server, "[EnemyPackageLoader] 'setup_startup_enemies' is a server only function")
	fassert(level_seed, "Cannot setup_startup_enemies without level_seed!")
	print("[EnemyPackageLoader] setup_startup_enemies - level_key:", level_key, "- level_seed:", level_seed, "- use_random_directors:", use_random_directors, "- conflict_director_name:", conflict_director_name)

	if not LevelHelper:should_load_enemies(level_key) then
		print("[EnemyPackageLoader] Load no enemies on this level")
	else
		local previous_startup_breeds = self._breeds_to_load_at_startup
		local breeds_to_load_at_startup = {}

		self._breeds_to_load_at_startup = breeds_to_load_at_startup

		local startup_breeds = self:_get_startup_breeds(level_key, level_seed, failed_locked_functions, use_random_directors, conflict_director_name, difficulty, difficulty_tweak)
		local handled_breeds = {}
		local breed_categories = EnemyPackageLoaderSettings.categories
		local num_breed_categories = #breed_categories

		for i = 1, num_breed_categories do
			local data = breed_categories[i]

			if BUILD ~= data.forbidden_in_build then
				local breeds = data.breeds
				local num_breeds = #breeds

				for j = 1, num_breeds do
					local breed_name = breeds[j]

					handled_breeds[breed_name] = breed_name

					if not data.dynamic_loading then
						breeds_to_load_at_startup[breed_name] = true
					end
				end
			end
		end

		for breed_name, _ in pairs(startup_breeds) do
			breed_name = ALIAS_TO_BREED[breed_name] or breed_name

			if not handled_breeds[breed_name] then
				handled_breeds[breed_name] = breed_name

				local breed_category = self:_category(breed_name)
				local is_dynamic = breed_category.dynamic_loading
				local is_generated_category = breed_category.is_generated_category

				if not is_dynamic or is_generated_category then
					breeds_to_load_at_startup[breed_name] = true
				end
			end
		end

		self:_load_startup_enemy_packages(previous_startup_breeds)
	end
end

EnemyPackageLoader._load_startup_enemy_packages = function (self, previous_startup_breeds)
	assert(self._is_server, "[EnemyPackageLoader] '_load_startup_enemy_packages' is a server only function.")

	local session_breed_map = self._session_breed_map
	local breeds_to_load_at_startup = self._breeds_to_load_at_startup

	for breed_name in pairs(breeds_to_load_at_startup) do
		session_breed_map[breed_name] = true
	end

	for breed_name in pairs(previous_startup_breeds) do
		if not breeds_to_load_at_startup[breed_name] then
			session_breed_map[breed_name] = nil
		end
	end

	self._network_handler:set_startup_breeds(table.shallow_copy(breeds_to_load_at_startup))
	self:_update_package_diffs()
end

EnemyPackageLoader.loading_completed = function (self)
	if not self._network_handler or not self._network_handler:is_fully_synced() then
		return false
	end

	local session_breed_map = self._network_handler:get_session_breed_map()
	local loaded_breed_map = self._loaded_breed_map

	for breed_name in pairs(session_breed_map) do
		if loaded_breed_map[breed_name] ~= true then
			return false
		end
	end

	return true
end

EnemyPackageLoader.random_director_list = function (self)
	return self._random_director_list
end

EnemyPackageLoader.on_application_shutdown = function (self)
	printf("[EnemyPackageLoader] unload_enemy_packages")

	local locked_breeds = self._locked_breeds
	local loaded_breed_map = self._loaded_breed_map
	local session_breed_map = self._session_breed_map

	for breed_name, status in pairs(loaded_breed_map) do
		fassert(not locked_breeds[breed_name], "EnemyPackageLoader:on_application_shutdown: Trying to unload a locked breed, remember to unlock breed on shutdown! If you are locking packages via level flow, use unload_enemy_packages external in event to unload.")

		local package_name = self:_breed_package_name(breed_name)

		Managers.package:unload(package_name, PACKAGE_REFERENCE_NAME)

		if self._is_server then
			session_breed_map[breed_name] = nil
		end

		loaded_breed_map[breed_name] = nil
	end
end

EnemyPackageLoader.get_startup_breeds = function (self)
	if self._is_server then
		return self._breeds_to_load_at_startup
	else
		return self._network_handler:get_startup_breeds()
	end
end

EnemyPackageLoader.client_connected = function (self, peer_id)
	return
end

EnemyPackageLoader.client_disconnected = function (self, peer_id)
	return
end

EnemyPackageLoader.is_breed_loaded_on_all_peers = function (self, breed_name)
	breed_name = ALIAS_TO_BREED[breed_name] or breed_name

	local peers = self._network_handler:hot_join_synced_peers()

	for peer_id in pairs(peers) do
		local loaded_session_breeds = self._network_handler:get_loaded_session_breeds(peer_id)

		if not loaded_session_breeds[breed_name] then
			return false
		end
	end

	return true
end

EnemyPackageLoader.debug_loaded_breeds = function (self)
	if not self._is_server then
		Debug.text("[EnemyPackageLoader] no client debug support. need to fetch peers some other way")

		return
	end

	if not self._network_handler then
		Debug.text("[EnemyPackageLoader] network handler not avaiable")

		return
	end

	local num_spawned_by_breed = Managers.state.conflict.num_spawned_by_breed
	local breed_category_loaded_packages = self._breed_category_loaded_packages
	local locked_breeds = self._locked_breeds
	local peers = self._network_handler and self._network_handler:hot_join_synced_peers() or {}

	Debug.text("EnemyPackageLoader Policy=%s", EnemyPackageLoaderSettings.policy)

	for current_category, _ in pairs(breed_category_loaded_packages) do
		Debug.text("Loaded %s:", current_category)

		for breed_name, state in pairs(self._loaded_breed_map) do
			repeat
				local category_data = self:_category(breed_name)

				if category_data.name ~= current_category then
					break
				end

				local num_alive = ""
				local breed_in_death_watch = false

				if self._is_server then
					breed_in_death_watch = self._unit_spawner:breed_in_death_watch(breed_name)
					num_alive = num_spawned_by_breed[breed_name]

					local aliases = BREED_TO_ALIASES[breed_name]

					if aliases then
						local num_aliases = #aliases

						for i = 1, num_aliases do
							local alias = aliases[i]

							num_alive = num_alive + num_spawned_by_breed[alias]
							breed_in_death_watch = breed_in_death_watch or self._unit_spawner:breed_in_death_watch(alias)
						end
					end
				end

				local is_locked_string = locked_breeds[breed_name] and "[LOCKED]" or ""

				Debug.text("   %s=%s %s %s %s", breed_name, state, breed_in_death_watch and "DL" or "", tostring(num_alive), is_locked_string)

				if self._is_server and not self:is_breed_loaded_on_all_peers(breed_name) then
					Debug.text("         --Waiting on Peer(s) to Load--")

					for peer_id, _ in pairs(peers) do
						if not self._network_handler:get_loaded_session_breeds(peer_id)[breed_name] then
							Debug.text("         %s", peer_id)
						end
					end
				end
			until true
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
