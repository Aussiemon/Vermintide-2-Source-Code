-- chunkname: @scripts/game_state/components/level_transition_handler.lua

require("scripts/game_state/components/enemy_package_loader")
require("scripts/game_state/components/transient_package_loader")
require("scripts/game_state/components/pickup_package_loader")
require("scripts/game_state/components/general_synced_package_loader")

local global_print = print

local function dprint(...)
	if script_data.level_transition_handler_debug_logging then
		local message = sprintf(...)

		global_print("[LevelTransitionHandler] ", message)
	end
end

local function print(...)
	local message = sprintf(...)

	global_print("[LevelTransitionHandler] ", message)
end

LevelTransitionHandler = class(LevelTransitionHandler)

LevelTransitionHandler.init = function (self)
	dprint("init")

	self.loading_packages = {}
	self._has_loaded_all_packages = nil
	self.loaded_levels = {}
	self._queued_network_flow_states = {}
	self.enemy_package_loader = EnemyPackageLoader:new()
	self.transient_package_loader = TransientPackageLoader:new()
	self.pickup_package_loader = PickupPackageLoader:new()
	self.general_synced_package_loader = GeneralSyncedPackageLoader:new()
	self._network_state = nil

	local level_key, environment_variation_id, level_seed, mechanism, game_mode, conflict_director, locked_director_functions, difficulty, difficulty_tweak, extra_packages

	if DEDICATED_SERVER then
		mechanism = "versus"
	end

	level_key, environment_variation_id, level_seed, mechanism, game_mode, conflict_director, locked_director_functions, difficulty, difficulty_tweak, extra_packages = self:apply_defaults_to_level_data(level_key, level_seed, environment_variation_id, mechanism, game_mode, conflict_director, locked_director_functions, difficulty, difficulty_tweak, extra_packages)

	local default_level_data = {
		level_transition_type = "load_next_level",
		level_key = level_key,
		mechanism = mechanism,
		game_mode = game_mode,
		level_seed = level_seed,
		environment_variation_id = environment_variation_id,
		conflict_director = conflict_director,
		locked_director_functions = locked_director_functions,
		difficulty = difficulty,
		difficulty_tweak = difficulty_tweak,
		extra_packages = extra_packages,
	}

	self._offline_level_data = table.clone(default_level_data)
	self._offline_level_data.level_session_id = math.random_seed()
	self._default_level_data = default_level_data
	self._next_level_data = nil
	self._checkpoint_data = nil
	self.hero_specific_packages = {}
end

LevelTransitionHandler.register_network_state = function (self, network_state)
	self._network_state = network_state

	dprint("register_network_state")

	local offline_level_data = self._offline_level_data

	if network_state:is_server() then
		network_state:set_level_data(offline_level_data.level_key, offline_level_data.environment_variation_id, offline_level_data.level_seed, offline_level_data.mechanism, offline_level_data.game_mode, offline_level_data.conflict_director, offline_level_data.locked_director_functions, offline_level_data.difficulty, offline_level_data.difficulty_tweak, offline_level_data.level_session_id, offline_level_data.level_transition_type, offline_level_data.extra_packages)
	end

	self._offline_level_data = nil
	self._next_level_data = nil
	self._checkpoint_data = nil
end

LevelTransitionHandler.deregister_network_state = function (self)
	dprint("deregister_network_state")

	self._next_level_data = nil
	self._network_state = nil
	self._offline_level_data = table.clone(self._default_level_data)
	self._offline_level_data.level_session_id = math.random_seed()
	self._currently_loaded_level_session_id = nil
end

LevelTransitionHandler.register_rpcs = function (self, network_event_delegate)
	self.enemy_package_loader:register_rpcs(network_event_delegate)
	self.transient_package_loader:register_rpcs(network_event_delegate)
end

LevelTransitionHandler.unregister_rpcs = function (self)
	self.enemy_package_loader:unregister_rpcs()
	self.transient_package_loader:unregister_rpcs()
end

LevelTransitionHandler.reload_level = function (self, optional_checkpoint_data, optional_level_seed)
	fassert(not self._network_state or self._network_state:is_server(), "only the server can reload")
	print("reload_level")

	self._checkpoint_data = optional_checkpoint_data

	local skip_metatable = true
	local level_transition_type = "reload_level"

	self:_set_next_level(level_transition_type, self:get_current_level_key(), self:get_current_environment_variation_id(), optional_level_seed or self:get_current_level_seed(), self:get_current_mechanism(), self:get_current_game_mode(), self:get_current_conflict_director(), self:get_current_locked_director_functions(), self:get_current_difficulty(), self:get_current_difficulty_tweak(), table.shallow_copy(self:get_current_extra_packages(), skip_metatable))
end

LevelTransitionHandler.get_checkpoint_data = function (self)
	fassert(not self._network_state or self._network_state:is_server(), "only the server handles checkpoint data")

	return self._checkpoint_data
end

LevelTransitionHandler.get_current_environment_variation_name = function (self)
	local variation_id = self:get_current_environment_variation_id()
	local level_key = self:get_current_level_key()

	if variation_id and level_key then
		local settings = LevelSettings[level_key]
		local variations = settings.environment_variations

		return variations and variations[variation_id]
	end

	return nil
end

LevelTransitionHandler.update = function (self)
	local has_loading_packages = false

	for level_name, _ in pairs(self.loading_packages) do
		has_loading_packages = true

		if self:_level_packages_loaded(level_name) then
			self.loaded_levels[level_name] = true
			self.loading_packages[level_name] = nil
		end
	end

	if has_loading_packages then
		self._has_loaded_all_packages = false
	elseif not self._has_loaded_all_packages and not has_loading_packages then
		print("Level load completed!")

		self._has_loaded_all_packages = true
	end

	self.enemy_package_loader:update()
	self.pickup_package_loader:update()
	self.general_synced_package_loader:update()
	self.transient_package_loader:update()
end

LevelTransitionHandler.promote_next_level_data = function (self)
	fassert(self._network_state and self._network_state:is_server() or not self._network_state, "only server can promote")
	fassert(self._next_level_data, "can't promote without previously calling set_next_level")
	print("promote_next_level_data")

	if self._network_state then
		self._network_state:set_level_data(self._next_level_data.level_key, self._next_level_data.environment_variation_id, self._next_level_data.level_seed, self._next_level_data.mechanism, self._next_level_data.game_mode, self._next_level_data.conflict_director, self._next_level_data.locked_director_functions, self._next_level_data.difficulty, self._next_level_data.difficulty_tweak, self._next_level_data.level_session_id, self._next_level_data.level_transition_type, self._next_level_data.extra_packages)
	else
		self._offline_level_data = self._next_level_data
	end

	self._next_level_data = nil
end

LevelTransitionHandler.needs_level_load = function (self)
	return self:get_current_level_session_id() ~= self._currently_loaded_level_session_id
end

LevelTransitionHandler.load_current_level = function (self)
	local new_level_key = self:get_current_level_key()
	local extra_packages = self:get_current_extra_packages()
	local new_environment_variation_id = self:get_current_environment_variation_id()
	local new_loaded_level_session_id = self:get_current_level_session_id()

	printf("load_current_level, loading %s %s", new_level_key, tostring(new_environment_variation_id))
	fassert(LevelSettings[new_level_key], "The level named %q does not exist in LevelSettings.", tostring(new_level_key))

	local currently_loaded_level_key = self._currently_loaded_level_key
	local currently_loaded_environment_variation_id = self._currently_loaded_environment_variation_id

	self:_release_extra_packages(currently_loaded_level_key)

	if currently_loaded_level_key and new_level_key ~= currently_loaded_level_key then
		self:_release_level_resources(currently_loaded_level_key)
	end

	local is_not_loading = not self.loading_packages[new_level_key]
	local is_not_loaded = not self:_level_packages_loaded(new_level_key)

	self:_load_extra_packages(new_level_key, extra_packages)

	if currently_loaded_level_key ~= new_level_key or currently_loaded_environment_variation_id ~= new_environment_variation_id or is_not_loading and is_not_loaded then
		self:_load_level_packages(new_level_key)

		local level_settings = LevelSettings[new_level_key]
		local packages = level_settings.packages

		dprint("loading level: %q", new_level_key)
		dprint("loading packages: %s", table.tostring(packages))
		dprint("loading extra packages: [%s] %s", new_level_key, table.tostring(extra_packages))

		self.loading_packages[new_level_key] = true

		local current_level_settings = currently_loaded_level_key and LevelSettings[currently_loaded_level_key]
		local current_level_render_overrides = current_level_settings and current_level_settings.render_settings_overrides

		if current_level_render_overrides then
			dprint("Restoring override render_settings for level: %q", new_level_key)

			for render_setting, _ in pairs(current_level_render_overrides) do
				local value = Application.user_setting("render_settings", render_setting)

				dprint("Restoring: %q = %q", render_setting, value)
				Application.set_render_setting(render_setting, tostring(value))
			end
		end

		local new_level_render_overrides = level_settings.render_settings_overrides

		if new_level_render_overrides then
			dprint("Setting render_settings overrides for level: %q", new_level_key)

			for render_setting, value in pairs(new_level_render_overrides) do
				dprint("Overriding: %q = %q", render_setting, value)
				Application.set_render_setting(render_setting, tostring(value))
			end
		end
	end

	self._currently_loaded_level_key = new_level_key
	self._currently_loaded_environment_variation_id = new_environment_variation_id
	self._currently_loaded_level_session_id = new_loaded_level_session_id
	self._has_loaded_all_packages = false
end

LevelTransitionHandler.release_level_resources = function (self)
	local reference_name = self._currently_loaded_level_key

	if not reference_name then
		return
	end

	self:_release_extra_packages(reference_name)
	self:_release_level_resources(reference_name)

	self._currently_loaded_level_key = nil
	self._currently_loaded_environment_variation_id = nil
end

LevelTransitionHandler._release_level_resources = function (self, reference_name)
	local is_loaded = self.loaded_levels[reference_name]
	local is_loading = self.loading_packages[reference_name]

	if not LEVEL_EDITOR_TEST and (is_loaded or is_loading) then
		self:_unload_level_packages(reference_name)

		self.loading_packages[reference_name] = nil
		self.loaded_levels[reference_name] = false
	end
end

LevelTransitionHandler._load_extra_packages = function (self, level_key, extra_packages)
	if extra_packages and #extra_packages > 0 then
		fassert(self._extra_packages == nil, "Trying to load level before releasing previous one properly. _extra_packages have not been unloaded.")

		self._extra_packages = extra_packages

		local async = true
		local reference_name = level_key
		local package_manager = Managers.package

		for i = 1, #extra_packages do
			local package_path = extra_packages[i]

			package_manager:load(package_path, reference_name, nil, async)
		end
	end
end

LevelTransitionHandler._release_extra_packages = function (self, reference_name)
	local extra_level_packages = self._extra_packages

	if extra_level_packages then
		dprint("unloading extra packages: [%s] %s", reference_name, table.tostring(extra_level_packages))

		local package_manager = Managers.package

		for i = #extra_level_packages, 1, -1 do
			local package_path = extra_level_packages[i]

			if package_manager:has_loaded(package_path, reference_name) or package_manager:is_loading(package_path) then
				package_manager:unload(package_path, reference_name)
			end
		end

		self._extra_packages = nil
	end
end

LevelTransitionHandler.has_next_level = function (self)
	fassert(not self._network_state or self._network_state:is_server(), "only the server handles next level logic")

	return self._next_level_data ~= nil
end

LevelTransitionHandler.clear_next_level = function (self)
	fassert(not self._network_state or self._network_state:is_server(), "only the server handles next level logic")
	dprint("clear_next_level")

	self._next_level_data = nil
end

LevelTransitionHandler.set_next_level = function (self, optional_level_key, optional_environment_variation_id, optional_level_seed, optional_mechanism, optional_game_mode, optional_conflict_director, optional_locked_director_functions, optional_difficulty, optional_difficulty_tweak, optional_extra_packages)
	local level_transition_type = "load_next_level"

	self:_set_next_level(level_transition_type, optional_level_key, optional_environment_variation_id, optional_level_seed, optional_mechanism, optional_game_mode, optional_conflict_director, optional_locked_director_functions, optional_difficulty, optional_difficulty_tweak, optional_extra_packages)
end

LevelTransitionHandler.get_next_level_key = function (self)
	fassert(not self._network_state or self._network_state:is_server(), "only the server handles next level logic")

	return self._next_level_data and self._next_level_data.level_key
end

LevelTransitionHandler.get_next_level_seed = function (self)
	fassert(not self._network_state or self._network_state:is_server(), "only the server handles next level logic")

	return self._next_level_data and self._next_level_data.level_seed
end

LevelTransitionHandler.get_next_game_mode = function (self)
	fassert(not self._network_state or self._network_state:is_server(), "only the server handles next level logic")

	return self._next_level_data and self._next_level_data.game_mode
end

LevelTransitionHandler.get_next_conflict_director = function (self)
	fassert(not self._network_state or self._network_state:is_server(), "only the server handles next level logic")

	return self._next_level_data and self._next_level_data.conflict_director
end

LevelTransitionHandler.get_next_environment_variation_id = function (self)
	fassert(not self._network_state or self._network_state:is_server(), "only the server handles next level logic")

	return self._next_level_data and self._next_level_data.environment_variation_id
end

LevelTransitionHandler.get_next_locked_director_functions = function (self)
	fassert(not self._network_state or self._network_state:is_server(), "only the server handles next level logic")

	return self._next_level_data and self._next_level_data.locked_director_functions
end

LevelTransitionHandler.get_next_difficulty = function (self)
	fassert(not self._network_state or self._network_state:is_server(), "only the server handles next level logic")

	return self._next_level_data and self._next_level_data.difficulty
end

LevelTransitionHandler.get_next_difficulty_tweak = function (self)
	fassert(not self._network_state or self._network_state:is_server(), "only the server handles next level logic")

	return self._next_level_data and self._next_level_data.difficulty_tweak
end

LevelTransitionHandler.get_current_level_key = function (self)
	return self._network_state and self._network_state:get_level_key() or self._offline_level_data and self._offline_level_data.level_key
end

LevelTransitionHandler.get_current_level_seed = function (self)
	return self._network_state and self._network_state:get_level_seed() or self._offline_level_data.level_seed
end

LevelTransitionHandler.get_current_game_mode = function (self)
	return self._network_state and self._network_state:get_game_mode() or self._offline_level_data.game_mode
end

LevelTransitionHandler.get_current_conflict_director = function (self)
	return self._network_state and self._network_state:get_conflict_director() or self._offline_level_data.conflict_director
end

LevelTransitionHandler.get_current_environment_variation_id = function (self)
	return self._network_state and self._network_state:get_environment_variation_id() or self._offline_level_data.environment_variation_id
end

LevelTransitionHandler.get_current_locked_director_functions = function (self)
	return self._network_state and self._network_state:get_locked_director_functions() or self._offline_level_data.locked_director_functions
end

LevelTransitionHandler.get_current_difficulty = function (self)
	return self._network_state and self._network_state:get_difficulty() or self._offline_level_data.difficulty
end

LevelTransitionHandler.get_current_difficulty_tweak = function (self)
	return self._network_state and self._network_state:get_difficulty_tweak() or self._offline_level_data.difficulty_tweak
end

LevelTransitionHandler.get_current_extra_packages = function (self)
	return self._network_state and self._network_state:get_extra_packages() or self._offline_level_data.extra_packages
end

LevelTransitionHandler.get_current_mechanism = function (self)
	return self._network_state and self._network_state:get_mechanism() or self._offline_level_data.mechanism
end

LevelTransitionHandler.get_current_level_session_id = function (self)
	return self._network_state and self._network_state:get_level_session_id() or self._offline_level_data.level_session_id
end

LevelTransitionHandler.get_current_level_transition_type = function (self)
	return self._network_state and self._network_state:get_level_transition_type() or self._offline_level_data.level_transition_type
end

LevelTransitionHandler.get_current_checkpoint = function (self)
	return self._network_state and self._network_state:get_check_point() or self._offline_level_data.check_point
end

LevelTransitionHandler.get_current_level_keys = function (self)
	return self:get_current_level_key()
end

LevelTransitionHandler.all_packages_loaded = function (self)
	return not self:needs_level_load() and self._has_loaded_all_packages == true
end

LevelTransitionHandler._set_next_level = function (self, level_transition_type, optional_level_key, optional_environment_variation_id, optional_level_seed, optional_mechanism, optional_game_mode, optional_conflict_director, optional_locked_director_functions, optional_difficulty, optional_difficulty_tweak, optional_extra_packages)
	local is_server = not self._network_state or self._network_state:is_server()

	fassert(is_server, "only the server handles next level logic")

	local level_key, environment_variation_id, level_seed, mechanism, game_mode, conflict_director, locked_director_functions, difficulty, difficulty_tweak, extra_packages = self:apply_defaults_to_level_data(optional_level_key, optional_environment_variation_id, optional_level_seed, optional_mechanism, optional_game_mode, optional_conflict_director, optional_locked_director_functions, optional_difficulty, optional_difficulty_tweak, optional_extra_packages, is_server)

	self:_append_event_packages(level_key, extra_packages)

	local new_level_session_id = math.random_seed()

	print("set_next_level( lvl:%s, mc:%s, gm:%s, env:%s, seed:%d, conflict:%s, lckd_director_funcs:{%s}, diff:%s, diff_tweak:%d, id:%d, lt:%s, extra_packages:%s)", tostring(level_key), mechanism, game_mode, tostring(environment_variation_id), level_seed, conflict_director, table.concat(locked_director_functions, ","), difficulty, difficulty_tweak, new_level_session_id, level_transition_type, table.tostring(extra_packages))

	self._next_level_data = {
		level_key = level_key,
		mechanism = mechanism,
		game_mode = game_mode,
		level_seed = level_seed,
		environment_variation_id = environment_variation_id,
		conflict_director = conflict_director,
		locked_director_functions = locked_director_functions,
		difficulty = difficulty,
		difficulty_tweak = difficulty_tweak,
		level_session_id = new_level_session_id,
		level_transition_type = level_transition_type,
		extra_packages = extra_packages,
	}
end

LevelTransitionHandler._append_event_packages = function (self, level_key, extra_packages)
	local level_settings = LevelSettings[level_key]

	if not level_settings or level_settings.hub_level or level_settings.tutorial_level then
		return
	end

	local live_event_interface = Managers.backend:get_interface("live_events")
	local special_events = live_event_interface:get_special_events()

	if not special_events then
		return
	end

	local mutators_list = {}

	for i = 1, #special_events do
		local special_event_data = special_events[i]
		local valid_levels = special_event_data.level_keys

		if not valid_levels or table.is_empty(valid_levels) or table.contains(valid_levels, self._level_key) then
			local weekly_override_type = special_event_data.weekly_event

			if weekly_override_type then
				if weekly_override_type == "override" then
					table.clear(mutators_list)
					table.append(mutators_list, special_event_data.mutators)
				elseif weekly_override_type == "append" then
					table.append(mutators_list, special_event_data.mutators)
				end
			end
		end
	end

	for mutator_i = 1, #mutators_list do
		local mutator_name = mutators_list[mutator_i]
		local mutator_packages = MutatorTemplates[mutator_name].packages

		if mutator_packages then
			for package_i = 1, #mutator_packages do
				local mutator_package = mutator_packages[package_i]

				if not table.contains(extra_packages, mutator_package) then
					table.insert(extra_packages, mutator_package)
				end
			end
		end
	end
end

LevelTransitionHandler._load_level_packages = function (self, level_key)
	local async = true
	local package_manager = Managers.package
	local reference_name = level_key
	local settings = LevelSettings[level_key]
	local packages = settings.packages

	if packages then
		for i = 1, #packages do
			local package_path = packages[i]

			package_manager:load(package_path, reference_name, nil, async)
		end
	end

	local hero_specific_packages = settings.hero_specific_packages

	if hero_specific_packages then
		local profile_synchronizer = Managers.mechanism:profile_synchronizer()
		local profile_index = profile_synchronizer and profile_synchronizer:profile_by_peer(Network.peer_id(), 1)

		if not profile_index then
			local network_handler = Managers.mechanism:network_handler()

			profile_index = network_handler and network_handler.wanted_profile_index
		end

		local profile = SPProfiles[profile_index]
		local hero_name = profile and profile.display_name
		local selected_hero_specific_packages = hero_specific_packages[hero_name]

		if selected_hero_specific_packages then
			for i = 1, #selected_hero_specific_packages do
				local package_path = selected_hero_specific_packages[i]

				package_manager:load(package_path, reference_name, nil, async)
			end

			self.hero_specific_packages[level_key] = selected_hero_specific_packages
			self.selected_hero_name_on_load = hero_name
		end
	end
end

LevelTransitionHandler._unload_level_packages = function (self, level_key)
	local reference_name = level_key
	local package_manager = Managers.package
	local settings = LevelSettings[level_key]
	local packages = settings.packages
	local hero_specific_packages = self.hero_specific_packages[level_key]

	if hero_specific_packages then
		for i = #hero_specific_packages, 1, -1 do
			local package_path = hero_specific_packages[i]

			if package_manager:has_loaded(package_path, reference_name) or package_manager:is_loading(package_path) then
				package_manager:unload(package_path, reference_name)
			end
		end

		self.hero_specific_packages[level_key] = nil
		self.selected_hero_name_on_load = nil
	end

	if packages then
		for i = #packages, 1, -1 do
			local package_path = packages[i]

			if package_manager:has_loaded(package_path, reference_name) or package_manager:is_loading(package_path) then
				package_manager:unload(package_path, reference_name)
			end
		end
	end
end

LevelTransitionHandler._level_packages_loaded = function (self, level_key)
	local reference_name = level_key
	local package_manager = Managers.package
	local settings = LevelSettings[level_key]
	local packages = settings.packages

	if packages then
		for i = 1, #packages do
			local package_path = packages[i]

			if not package_manager:has_loaded(package_path, reference_name) then
				return false
			end
		end
	end

	local hero_specific_packages = self.hero_specific_packages[level_key]

	if hero_specific_packages then
		for i = #hero_specific_packages, 1, -1 do
			local package_path = hero_specific_packages[i]

			if not package_manager:has_loaded(package_path, reference_name) then
				return false
			end
		end
	end

	return true
end

LevelTransitionHandler.create_level_seed = function ()
	local time_since_start = os.clock() * 10000 % 961748927
	local date_time = os.time()
	local low_time = tonumber(tostring(string.format("%d", date_time)):reverse():sub(1, 6))
	local seed = (time_since_start + low_time) % 15485867

	seed = math.floor(seed)

	return seed
end

LevelTransitionHandler.apply_defaults_to_level_data = function (self, level_key, environment_variation_id, level_seed, mechanism, game_mode, conflict_director, locked_director_functions, difficulty, difficulty_tweak, optional_extra_packages, is_server)
	if not mechanism and level_key then
		local level_settings = LevelSettings[level_key]

		mechanism = level_settings.mechanism
	end

	if not mechanism then
		local current_level_key = self:get_current_level_key()

		if current_level_key then
			local level_settings = LevelSettings[current_level_key]

			mechanism = level_settings.mechanism
		end
	end

	mechanism = mechanism or SaveData.last_mechanism or "adventure"

	if not level_key then
		local mechanism_settings = MechanismSettings[mechanism]
		local class_name = mechanism_settings.class_name
		local class = rawget(_G, class_name)

		level_key = class.get_starting_level()
	end

	local level_settings = LevelSettings[level_key]

	game_mode = game_mode or level_settings.game_mode

	if not game_mode then
		local mechanism_settings = MechanismSettings[mechanism]

		if level_settings.hub_level then
			game_mode = game_mode or mechanism_settings.gamemode_lookup.keep
		else
			game_mode = game_mode or mechanism_settings.gamemode_lookup.default
		end
	end

	local game_mode_settings = GameModeSettings[game_mode]
	local forced_difficulty = game_mode_settings and game_mode_settings.forced_difficulty

	environment_variation_id = environment_variation_id or 0
	conflict_director = script_data.override_conflict_settings or conflict_director or level_settings.conflict_settings or "default"
	locked_director_functions = locked_director_functions or {}
	difficulty = script_data.current_difficulty_setting or forced_difficulty or difficulty or "normal"
	difficulty_tweak = script_data.current_difficulty_tweak_setting or difficulty_tweak or 0

	if is_server and script_data.random_level_seed_from_toolcenter and not level_seed then
		level_seed = Development.parameter("level_seed") or LevelTransitionHandler.create_level_seed()
	else
		level_seed = tonumber(level_seed or Development.parameter("level_seed") or GameMechanismManager.create_level_seed())
	end

	optional_extra_packages = optional_extra_packages or {}

	return level_key, environment_variation_id, level_seed, mechanism, game_mode, conflict_director, locked_director_functions, difficulty, difficulty_tweak, optional_extra_packages
end

LevelTransitionHandler._update_debug = function (self)
	if script_data.debug_level_seed_and_level_packages then
		local level_seed = self:get_current_level_seed()

		for level_name, is_loaded in pairs(self.loaded_levels) do
			Debug.text("Level %q is_loaded: %s", level_name, tostring(is_loaded))
		end

		Debug.text("Level Seed: %d", level_seed or -1)
	end
end

LevelTransitionHandler.in_hub_level = function (self)
	local level_key = self:get_current_level_key()

	if level_key then
		local level_settings = LevelSettings[level_key]

		return level_settings.hub_level
	end
end

LevelTransitionHandler.queue_create_networked_flow_state = function (self, unit, ...)
	local level = Unit.level(unit)
	local flow_state_units = self._queued_network_flow_states[level] or {}

	self._queued_network_flow_states[level] = flow_state_units
	flow_state_units[#flow_state_units + 1] = unit
end

LevelTransitionHandler.create_queued_networked_flow_states = function (self, ingame_level)
	local flow_state_units = self._queued_network_flow_states[ingame_level]

	if flow_state_units then
		for i = 1, #flow_state_units do
			if Unit.alive(flow_state_units[i]) then
				Unit.flow_event(flow_state_units[i], "Create")
			end
		end
	end

	table.clear(self._queued_network_flow_states)
end
