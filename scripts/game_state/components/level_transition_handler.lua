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
	self.has_loaded_all_packages = false
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
	local attract_mode_level = check_bool_string(Development.parameter("attract_mode")) and BenchmarkSettings.auto_host_level
	local level_name = check_bool_string(Development.parameter("auto_host_level")) or attract_mode_level or LevelSettings.default_start_level

	return boot_level_name or level_name
end

LevelTransitionHandler.load_default_level = function (self)
	local level_key = self:default_level_key()

	self:load_level(level_key)
end

LevelTransitionHandler.load_level = function (self, level_key)
	printf("[LevelTransitionHandler] load_level %s", level_key)
	fassert(LevelSettings[level_key], "The level named %q does not exist in LevelSettings.", tostring(level_key))

	local current_level = self.level_key

	if current_level and level_key ~= current_level then
		self:release_level_resources(current_level)
	end

	local level_package_name = LevelSettings[level_key].package_name

	if self.level_key ~= level_key or (not Managers.package:has_loaded(level_package_name, "LevelTransitionHandler") and not Managers.package:is_loading(level_package_name)) then
		self.last_level_key = self.level_key
		self.level_key = level_key
		self.level_name = LevelSettings[level_key].level_name

		Print("Loading level: %q", self.level_key)
		Print("Package name : %q", level_package_name)

		self.picked_level_key = nil
		self.loading_packages[level_key] = level_package_name

		Managers.package:load(level_package_name, "LevelTransitionHandler", nil, true)

		self.has_loaded_all_packages = false
	else
		self.last_level_key = self.level_key
	end

	self.enemy_package_loader:setup_startup_enemies(level_key)
end

LevelTransitionHandler.release_level_resources = function (self, level_key)
	if level_key == nil then
		return
	end

	local package_name = LevelSettings[level_key].package_name

	if not LEVEL_EDITOR_TEST and (self.loaded_levels[level_key] or Managers.package:is_loading(package_name)) then
		Managers.package:unload(package_name, "LevelTransitionHandler")

		self.loaded_levels[level_key] = false

		if level_key == self.level_key then
			self.level_key = nil
		end
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
	printf("[LevelTransitionHandler] load_next_level - self.transition_type=[%s] self.picked_level_key=[%s]", tostring(self.transition_type), tostring(self.picked_level_key))

	if self.picked_level_key then
		self:load_level(self.picked_level_key)

		self.picked_level_key = nil
	elseif self.transition_type ~= "reload_level" then
		self:load_level(self.transition_type)
	elseif self.transition_type == "reload_level" then
		local level_key = self.level_key

		self.enemy_package_loader:setup_startup_enemies(level_key)
	end

	self.transition_type = nil
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

LevelTransitionHandler.set_next_level = function (self, level_key)
	printf("[LevelTransitionHandler] set_next_level( %s )", tostring(level_key))

	self.picked_level_key = level_key
end

LevelTransitionHandler.get_current_level_keys = function (self)
	return self.level_key
end

LevelTransitionHandler.all_packages_loaded = function (self)
	return self.has_loaded_all_packages
end

LevelTransitionHandler.update = function (self)
	Profiler.start("LevelTransitionHandler:update()")

	local package_manager = Managers.package
	local has_loading_packages = false

	for level_name, level_package_name in pairs(self.loading_packages) do
		has_loading_packages = true

		if package_manager:has_loaded(level_package_name) then
			self.loading_packages[level_name] = nil
			self.loaded_levels[level_name] = true
		end
	end

	if self.has_loaded_all_packages == has_loading_packages and not self.transition_type then
		print("[LevelTransitionHandler] Level load completed!")

		self.has_loaded_all_packages = not has_loading_packages
	end

	if script_data.debug_level_packages then
		for level_name, is_loaded in pairs(self.loaded_levels) do
			Debug.text("Level %q is_loaded: %s", level_name, tostring(is_loaded))
		end
	end

	Profiler.stop("LevelTransitionHandler:update()")
end

LevelTransitionHandler.generate_level_seed = function (self)
	local t = Managers.time:time("main")
	local time_since_start = (os.clock() * 10000) % 961748927
	local date_time = os.time()
	local low_time = tonumber(tostring(string.format("%d", date_time)):reverse():sub(1, 6))
	local seed = (time_since_start + low_time) % 15485867
	seed = math.floor(seed)
	self.level_seed = seed

	print("[LevelTransitionHandler] Generated new level_seed:", seed)
end

LevelTransitionHandler.prepare_load_level = function (self, level_index, level_seed)
	local level_name = NetworkLookup.level_keys[level_index]
	self.transition_type = level_name

	self:set_next_level(level_name)

	if self.level_key ~= level_name then
		printf("[LevelTransitionHandler] prepare_load_level : %s seed: %i. New level, resetting package load status.", level_name, level_seed or -1)

		self.has_loaded_all_packages = false
	else
		printf("[LevelTransitionHandler] prepare_load_level : %s seed: %i. Same level as previously, NOT resetting package load status.", level_name, level_seed or -1)
	end

	print("[LevelTransitionHandler] Setting level_seed: ", level_seed)

	self.level_seed = level_seed
end

LevelTransitionHandler.rpc_reload_level = function (self, sender)
	self:reload_level()
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

return
