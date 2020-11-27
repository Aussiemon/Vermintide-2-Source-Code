require("scripts/game_state/components/enemy_package_loader")

local function check_bool_string(text)
	if text == "false" then
		return false
	else
		return text
	end
end

local function Print(format, ...)
	print(string.format(string.format("[LevelTransitionHandler] %s", format), ...))
end

LevelTransitionHandler = class(LevelTransitionHandler)

LevelTransitionHandler.init = function (self)
	self.loading_packages = {}
	self.has_loaded_all_packages = nil
	self.loaded_levels = {}
	self.enemy_package_loader = EnemyPackageLoader:new()
end

local rpcs = {
	"rpc_reload_level"
}
local events = {}

LevelTransitionHandler.register_rpcs = function (self, network_event_delegate)
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(rpcs))
	self.enemy_package_loader:register_rpcs(network_event_delegate)
end

LevelTransitionHandler.register_events = function (self, event_manager)
	for i = 1, #events, 1 do
		event_manager:register(self, events[i], events[i])
	end
end

LevelTransitionHandler.unregister_events = function (self, event_manager)
	for i = 1, #events, 1 do
		event_manager:unregister(events[i], self)
	end
end

LevelTransitionHandler.unregister_rpcs = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil

	self.enemy_package_loader:unregister_rpcs()
end

LevelTransitionHandler.default_level_key = function (self)
	local boot_level_name = Boot.loading_context and Boot.loading_context.level_key

	if boot_level_name then
		return boot_level_name
	end

	local attract_mode_level = check_bool_string(Development.parameter("attract_mode")) and BenchmarkSettings.auto_host_level
	local level_name = check_bool_string(Development.parameter("auto_host_level")) or attract_mode_level or Managers.mechanism:get_starting_level()

	return level_name
end

LevelTransitionHandler.default_environment_id = function (self)
	return 0
end

LevelTransitionHandler.load_default_level = function (self)
	local level_key = self:default_level_key()
	local environment_id = self:default_environment_id()

	self:load_level(level_key, environment_id)
end

LevelTransitionHandler.load_level = function (self, level_key, environment_variation_id)
	printf("[LevelTransitionHandler] load_level %s %s", level_key, tostring(environment_variation_id))
	fassert(LevelSettings[level_key], "The level named %q does not exist in LevelSettings.", tostring(level_key))

	local current_level = self.level_key

	if current_level and level_key ~= current_level then
		self:release_level_resources(current_level)
	end

	local level_settings = LevelSettings[level_key]
	local level_package_name = level_settings.package_name
	local meta_package_name = level_settings.meta_package_name
	local package_manager = Managers.package

	if self.level_key ~= level_key or self.environment_variation_id ~= environment_variation_id or (not package_manager:has_loaded(level_package_name, "LevelTransitionHandler") and not package_manager:is_loading(level_package_name) and (not meta_package_name or (not package_manager:has_loaded(meta_package_name, "LevelTransitionHandler") and not package_manager:is_loading(meta_package_name)))) then
		self:_load_dlc_level_packages(level_key)
		self:_load_nested_level_packages(level_key)
		self:_load_umbra_tome_package(level_key)
		self:_load_meta_package(level_key)

		self.last_level_key = self.level_key
		self.level_key = level_key
		self.environment_variation_id = environment_variation_id
		self.level_name = level_settings.level_name

		Print("Loading level: %q", self.level_key)
		Print("Package name: %q Meta package name: %q", level_package_name, meta_package_name)

		self.picked_level_key = nil
		self.loading_packages[level_key] = level_package_name

		package_manager:load(level_package_name, "LevelTransitionHandler", nil, true)

		self.has_loaded_all_packages = false
	else
		self.last_level_key = self.level_key
	end
end

LevelTransitionHandler.release_level_resources = function (self, level_key)
	if level_key == nil then
		return
	end

	local package_name = LevelSettings[level_key].package_name

	if not LEVEL_EDITOR_TEST and (self.loaded_levels[level_key] or Managers.package:is_loading(package_name)) then
		self:_unload_meta_packages(level_key)
		self:_unload_dlc_level_packages(level_key)
		self:_unload_nested_level_packages(level_key)
		self:_unload_umbra_tome_package(level_key)
		Managers.package:unload(package_name, "LevelTransitionHandler")

		if level_key == self.level_key then
			self.level_key = nil
			self.environment_variation_id = nil
		end

		self.loaded_levels[level_key] = false
	end
end

LevelTransitionHandler.get_current_transition_level = function (self)
	assert(self.transition_type, "Missing transition type.")

	if self.picked_level_key then
		return self.picked_level_key
	elseif self.transition_type ~= "reload_level" then
		return self.transition_type
	else
		return self.level_key
	end
end

LevelTransitionHandler.get_current_transition_environment = function (self)
	return self.picked_environment_id or self.environment_variation_id or 0
end

LevelTransitionHandler.get_next_level_key = function (self)
	if self.picked_level_key then
		return self.picked_level_key
	elseif self.transition_type and self.transition_type ~= "reload_level" then
		return self.transition_type
	else
		return self.level_key
	end
end

LevelTransitionHandler.load_next_level = function (self)
	printf("[LevelTransitionHandler] load_next_level - self.transition_type=[%s] self.picked_level_key=[%s] self.picked_environment_id=[%s]", tostring(self.transition_type), tostring(self.picked_level_key), tostring(self.picked_environment_id))

	if self.picked_level_key then
		self:load_level(self.picked_level_key, self.picked_environment_id)

		self.picked_level_key = nil
	elseif self.transition_type ~= "reload_level" then
		self:load_level(self.transition_type, self.picked_environment_id)
	end

	self.transition_type = nil
	self.picked_environment_id = nil
end

LevelTransitionHandler.reload_level = function (self, checkpoint_data)
	self.checkpoint_data = checkpoint_data
	self.transition_type = "reload_level"
end

LevelTransitionHandler.level_completed = function (self)
	if self.picked_level_key then
		self.transition_type = self.picked_level_key
		self.picked_level_key = nil
	end
end

LevelTransitionHandler.set_next_level = function (self, level_key, environment_variation_id)
	printf("[LevelTransitionHandler] set_next_level( %s, %s )", tostring(level_key), tostring(environment_variation_id))

	self.picked_level_key = level_key
	self.picked_environment_id = environment_variation_id or 0
end

LevelTransitionHandler.get_current_level_keys = function (self)
	return self.level_key
end

LevelTransitionHandler.get_current_environment_id = function (self)
	return self.environment_variation_id or 0
end

LevelTransitionHandler.get_current_environment_variation_name = function (self)
	local variation_id = self.environment_variation_id
	local level_key = self.level_key

	if variation_id and level_key then
		local settings = LevelSettings[level_key]
		local variations = settings.environment_variations

		return variations and variations[variation_id]
	end

	return nil
end

LevelTransitionHandler.all_packages_loaded = function (self)
	return self.has_loaded_all_packages == true
end

LevelTransitionHandler.update = function (self)
	local package_manager = Managers.package
	local has_loading_packages = false

	for level_name, level_package_name in pairs(self.loading_packages) do
		has_loading_packages = true

		if package_manager:has_loaded(level_package_name) then
			self.loaded_levels[level_name] = true

			if self:_meta_package_loaded(level_name) and self:_dlc_level_packages_loaded(level_name) and self:_nested_level_packages_loaded(level_name) and self:_umbra_tome_package_loaded(level_name) then
				self.loading_packages[level_name] = nil
			end
		end
	end

	if self.has_loaded_all_packages == has_loading_packages and not self.transition_type then
		print("[LevelTransitionHandler] Level load completed!")

		self.has_loaded_all_packages = not has_loading_packages
	end
end

LevelTransitionHandler.prepare_load_level = function (self, level_index, level_seed, environment_variation_id)
	local level_name = NetworkLookup.level_keys[level_index]
	self.transition_type = level_name

	self:set_next_level(level_name, environment_variation_id)

	if self.level_key ~= level_name then
		printf("[LevelTransitionHandler] prepare_load_level : %s seed: %i environment %i. New level, resetting package load status.", level_name, level_seed or -1, environment_variation_id or 0)

		self.has_loaded_all_packages = false
	else
		printf("[LevelTransitionHandler] prepare_load_level : %s seed: %i environment %i. Same level as previously, NOT resetting package load status.", level_name, level_seed or -1, environment_variation_id or 0)
	end
end

LevelTransitionHandler.rpc_reload_level = function (self, channel_id, level_seed, locked_director_functions_ids)
	self:reload_level()
	printf("[LevelTransitionHandler] rpc_reload_level : %s seed: %i environment %i. Same level as previously, NOT resetting package load status.", self.level_key, level_seed or -1, self.environment_variation_id or 0)
	print("[LevelTransitionHandler] Setting level_seed: ", level_seed)
	Managers.mechanism:set_level_seed(level_seed)
	Managers.mechanism:set_locked_director_functions_from_ids(locked_director_functions_ids)
end

LevelTransitionHandler.set_transition_exit_type = function (self, transition_exit_type)
	self.transition_exit_type = transition_exit_type
end

LevelTransitionHandler.clear_transition_exit_type = function (self)
	self.transition_exit_type = nil
end

LevelTransitionHandler.transition_in_progress = function (self)
	return self.transition_exit_type ~= nil
end

LevelTransitionHandler._load_dlc_level_packages = function (self, level_key)
	local async = true
	local reference_name = "dlc_level_package_" .. level_key
	local package_manager = Managers.package

	for _, settings in pairs(DLCSettings) do
		local level_packages = settings.level_packages

		if level_packages then
			local level_specific_packages = level_packages[level_key]

			if level_specific_packages then
				for _, package_path in ipairs(level_specific_packages) do
					package_manager:load(package_path, reference_name, nil, async)
				end
			end
		end
	end
end

LevelTransitionHandler._unload_dlc_level_packages = function (self, level_key)
	local reference_name = "dlc_level_package_" .. level_key
	local package_manager = Managers.package

	for _, settings in pairs(DLCSettings) do
		local level_packages = settings.level_packages

		if level_packages then
			local level_specific_packages = level_packages[level_key]

			if level_specific_packages then
				for _, package_path in ipairs(level_specific_packages) do
					if package_manager:has_loaded(package_path, reference_name) or package_manager:is_loading(package_path) then
						package_manager:unload(package_path, reference_name)
					end
				end
			end
		end
	end
end

LevelTransitionHandler._dlc_level_packages_loaded = function (self, level_key)
	local reference_name = "dlc_level_package_" .. level_key
	local package_manager = Managers.package

	for _, settings in pairs(DLCSettings) do
		local level_packages = settings.level_packages

		if level_packages then
			local level_specific_packages = level_packages[level_key]

			if level_specific_packages then
				for _, package_path in ipairs(level_specific_packages) do
					if not package_manager:has_loaded(package_path, reference_name) then
						return false
					end
				end
			end
		end
	end

	return true
end

LevelTransitionHandler._load_nested_level_packages = function (self, level_key)
	local async = true
	local package_manager = Managers.package
	local reference_name = "nested_level_package_" .. level_key
	local settings = LevelSettings[level_key]
	local nested_level_package_names = settings.nested_level_package_names

	if nested_level_package_names then
		for _, package_path in ipairs(nested_level_package_names) do
			package_manager:load(package_path, reference_name, nil, async)
		end
	end
end

LevelTransitionHandler._unload_nested_level_packages = function (self, level_key)
	local reference_name = "nested_level_package_" .. level_key
	local package_manager = Managers.package
	local settings = LevelSettings[level_key]
	local nested_level_package_names = settings.nested_level_package_names

	if nested_level_package_names then
		for _, package_path in ipairs(nested_level_package_names) do
			if package_manager:has_loaded(package_path, reference_name) or package_manager:is_loading(package_path) then
				package_manager:unload(package_path, reference_name)
			end
		end
	end
end

LevelTransitionHandler._nested_level_packages_loaded = function (self, level_key)
	local reference_name = "nested_level_package_" .. level_key
	local package_manager = Managers.package
	local settings = LevelSettings[level_key]
	local nested_level_package_names = settings.nested_level_package_names

	if nested_level_package_names then
		for _, package_path in ipairs(nested_level_package_names) do
			if not package_manager:has_loaded(package_path, reference_name) then
				return false
			end
		end
	end

	return true
end

LevelTransitionHandler._load_umbra_tome_package = function (self, level_key)
	local async = true
	local package_manager = Managers.package
	local reference_name = "tome_package_" .. level_key
	local settings = LevelSettings[level_key]
	local tome_package_name = settings.tome_package_name

	if tome_package_name then
		package_manager:load(tome_package_name, reference_name, nil, async)
	end
end

LevelTransitionHandler._unload_umbra_tome_package = function (self, level_key)
	local reference_name = "tome_package_" .. level_key
	local package_manager = Managers.package
	local settings = LevelSettings[level_key]
	local tome_package_name = settings.tome_package_name

	if tome_package_name and (package_manager:has_loaded(tome_package_name, reference_name) or package_manager:is_loading(tome_package_name)) then
		package_manager:unload(tome_package_name, reference_name)
	end
end

LevelTransitionHandler._umbra_tome_package_loaded = function (self, level_key)
	local reference_name = "tome_package_" .. level_key
	local package_manager = Managers.package
	local settings = LevelSettings[level_key]
	local tome_package_name = settings.tome_package_name

	if tome_package_name and not package_manager:has_loaded(tome_package_name, reference_name) then
		return false
	end

	return true
end

LevelTransitionHandler._load_meta_package = function (self, level_key)
	local settings = LevelSettings[level_key]
	local meta_package_name = settings.meta_package_name

	if not meta_package_name then
		return
	end

	local async = true
	local package_manager = Managers.package
	local reference_name = "LevelTransitionHandler"

	package_manager:load(meta_package_name, reference_name, nil, async)
end

LevelTransitionHandler._meta_package_loaded = function (self, level_key)
	local settings = LevelSettings[level_key]
	local meta_package_name = settings.meta_package_name

	if not meta_package_name then
		return true
	end

	local reference_name = "LevelTransitionHandler"
	local package_manager = Managers.package

	if not package_manager:has_loaded(meta_package_name, reference_name) then
		return false
	end

	return true
end

LevelTransitionHandler._unload_meta_packages = function (self, level_key)
	local settings = LevelSettings[level_key]
	local meta_package_name = settings.meta_package_name

	if not meta_package_name then
		return
	end

	local reference_name = "LevelTransitionHandler"
	local package_manager = Managers.package

	if package_manager:has_loaded(meta_package_name, reference_name) or package_manager:is_loading(meta_package_name) then
		package_manager:unload(meta_package_name, reference_name)
	end
end

LevelTransitionHandler._update_debug = function (self)
	if script_data.debug_level_packages then
		local level_seed = Managers.mechanism:get_level_seed()

		for level_name, is_loaded in pairs(self.loaded_levels) do
			Debug.text("Level %q is_loaded: %s", level_name, tostring(is_loaded))
		end

		Debug.text("Level Seed: %d", level_seed or -1)
	end
end

return
