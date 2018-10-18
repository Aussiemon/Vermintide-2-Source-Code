print("boot.lua start, os clock:", os.clock())

local io_input = io.input
local io_read = io.read
local io_open = io.open
local io_close = io.close
local os_execute = os.execute
local os_remove = os.remove

dofile("scripts/boot_init")

local BUILD = BUILD
local PLATFORM = PLATFORM

local function base_require(path, ...)
	for _, s in ipairs({
		...
	}) do
		require(string.format("foundation/scripts/%s/%s", path, s))
	end
end

local function core_require(path, ...)
	for _, s in ipairs({
		...
	}) do
		require("core/" .. path .. "/" .. s)
	end
end

local function game_require(path, ...)
	for _, s in ipairs({
		...
	}) do
		require("scripts/" .. path .. "/" .. s)
	end
end

local function foundation_require(path, ...)
	for _, s in ipairs({
		...
	}) do
		require("foundation/scripts/" .. path .. "/" .. s)
	end
end

require("scripts/settings/dlc_settings")

for dlc_name, dlc in pairs(DLCSettings) do
	local data = dlc.script_data

	if data then
		for key, value in pairs(data) do
			script_data[key] = value
		end
	end
end

Boot = Boot or {}
Boot.flow_return_table = Script.new_map(32)
Boot.is_controlled_exit = false

local function profile_start(title)
	local t = {
		title = title,
		start_time = os.clock()
	}

	return t
end

local function profile(t, alias)
	local num = #t
	local scope = t[num]

	if scope and scope.alias == alias then
		scope.end_time = os.clock()
	else
		scope = {
			alias = alias
		}
		t[num + 1] = scope
		scope.start_time = os.clock()
	end
end

local function profile_end(t)
	local total = os.clock() - t.start_time

	print(t.title .. " total time: " .. total)

	local acc = 0

	for _, scope in ipairs(t) do
		local duration = (scope.end_time or math.huge) - scope.start_time

		print("\t" .. scope.alias .. ": ", duration)

		acc = acc + duration
	end

	print("")
	print("\t unaccounted: ", total - acc)
end

Boot.setup = function (self)
	foundation_require("util", "crashify")
	Script.set_index_offset(0)
	print("Boot:setup() entered. time: ", 0, "os-clock: ", os.clock())

	Boot.startup_timer = 0
	Boot.startup_state = "loading"

	if PLATFORM == "win32" then
		Window.set_focus()
		Window.set_mouse_focus(true)
	end

	print(Application.sysinfo())
	self:_init_localizer()

	Boot.startup_packages = {
		"resource_packages/boot_assets",
		"resource_packages/strings",
		"resource_packages/foundation_scripts",
		"resource_packages/game_scripts",
		"backend/local_backend/local_backend",
		"resource_packages/level_scripts",
		"resource_packages/levels/debug_levels",
		"resource_packages/levels/benchmark_levels",
		"resource_packages/levels/honduras_levels",
		"resource_packages/breeds",
		"resource_packages/breeds_common_resources"
	}
	local handles = {}

	for _, package_name in ipairs(Boot.startup_packages) do
		local resource_handle = Application.resource_package(package_name)

		ResourcePackage.load(resource_handle)

		handles[package_name] = resource_handle
	end

	Boot.startup_package_handles = handles
	Boot.render = Boot.booting_render

	create_startup_world()
end

local function xb1_format_locale(language_id)
	local supported_languages = {
		["zh-hk"] = "zh",
		["fr-ch"] = "fr",
		["ru-ru"] = "ru",
		["nb-no"] = "nb",
		["en-us"] = "en",
		["en-gb"] = "en",
		["en-il"] = "en",
		["es-mx"] = "es",
		["en-nz"] = "en",
		["da-dk"] = "da",
		["en-sa"] = "en",
		["pt-pt"] = "pt",
		["es-co"] = "es",
		["en-hu"] = "en",
		["en-sg"] = "en",
		["fr-ca"] = "fr",
		["en-ae"] = "en",
		["nl-be"] = "nl",
		["en-in"] = "en",
		["zh-tw"] = "zh",
		["en-cz"] = "en",
		["de-ch"] = "de",
		["de-de"] = "de",
		["fr-be"] = "fr",
		["en-gr"] = "en",
		["ko-kr"] = "kr",
		["tr-tr"] = "tr",
		["sv-se"] = "sv",
		["zh-sg"] = "zh",
		["es-ar"] = "es",
		["en-sk"] = "en",
		["pl-pl"] = "pl",
		["nl-nl"] = "nl",
		["pt-br"] = "br-pt",
		["it-it"] = "it",
		["es-es"] = "es",
		["en-au"] = "en",
		["de-at"] = "de",
		["en-ca"] = "en",
		["zh-cn"] = "zh",
		["fr-fr"] = "fr",
		["en-hk"] = "en",
		["ja-jp"] = "jp",
		["es-cl"] = "es",
		["fi-fi"] = "fi",
		["en-ie"] = "en",
		["en-za"] = "en"
	}

	return supported_languages[string.lower(language_id)] or "en"
end

Boot._init_localizer = function (self)
	local default_language = "en"
	local language = nil

	if PLATFORM == "win32" then
		language = Application.user_setting("language_id") or (rawget(_G, "Steam") and Steam:language()) or default_language
	elseif PLATFORM == "ps4" then
		language = PS4.locale() or default_language
	elseif PLATFORM == "xb1" then
		language = xb1_format_locale(XboxLive.locale() or default_language)
	end

	if language == default_language then
		Application.set_resource_property_preference_order(default_language)
	else
		Application.set_resource_property_preference_order(language, default_language)
	end
end

local function init_development_parameters()
	require("foundation/scripts/util/user_setting")
	Development.init_user_settings()
	require("foundation/scripts/util/application_parameter")
	Development.init_application_parameters({
		Application.argv()
	}, true)
	require("foundation/scripts/util/development_parameter")
	Development.init_parameters()

	local max_param_string_length = 0

	for param, value in pairs(script_data) do
		max_param_string_length = math.max(max_param_string_length, #param)
	end

	local sorted_params = {}

	for param, value in pairs(script_data) do
		if type(value) == "table" then
			local formatted_string = string.format("script_data.%%-%ds = {", max_param_string_length)
			local output = string.format(formatted_string, param)

			for i = 1, #value, 1 do
				output = output .. ", " .. tostring(value[i])
			end

			output = output .. " }"
			sorted_params[#sorted_params + 1] = output
		else
			local formatted_string = string.format("script_data.%%-%ds = %%s", max_param_string_length)
			sorted_params[#sorted_params + 1] = string.format(formatted_string, param, tostring(value))
		end
	end

	table.sort(sorted_params, function (a, b)
		return a < b
	end)
	print("*****************************************************************")
	print("**                Initial contents of script_data              **")

	for i = 1, #sorted_params, 1 do
		print(sorted_params[i])
	end

	print("*****************************************************************")

	script_data.honduras_demo = script_data.settings.honduras_demo or script_data["honduras-demo"]
	script_data.settings.use_beta_overlay = script_data.settings.use_beta_overlay or script_data.use_beta_overlay
end

Boot.booting_update = function (self, dt)
	local old_time = Boot.startup_timer
	Boot.startup_timer = old_time + dt
	local has_loaded_packages = true

	for package_name, handle in pairs(Boot.startup_package_handles) do
		if not ResourcePackage.has_loaded(handle) then
			has_loaded_packages = false

			break
		end
	end

	if has_loaded_packages and Boot.startup_state == "loading" then
		local script_init_start_time = os.clock()

		print("Boot:booting_update() reports boot packages loaded, initializing scripts. time: ", Boot.startup_timer, "os-clock: ", script_init_start_time)

		local handles = Boot.startup_package_handles

		for _, package_name in ipairs(Boot.startup_packages) do
			local handle = handles[package_name]

			ResourcePackage.flush(handle)
			print("Flushing:", package_name, handle)
		end

		base_require("managers", "managers", "package/package_manager")

		Managers.package = PackageManager

		Managers.package:init()
		init_development_parameters()

		local window_title = Development.parameter("window-title")

		if window_title and PLATFORM == "win32" then
			Window.set_title(window_title)
		end

		for dlc_name, dlc in pairs(DLCSettings) do
			local package_name = dlc.package_name

			if package_name then
				Managers.package:load(package_name, "boot", nil, true)
			end
		end

		local require_start = os.clock()

		self:_require_foundation_scripts()

		Boot.startup_state = "loading_dlcs"
	elseif Boot.startup_state == "loading_dlcs" then
		local done = Managers.package:update()

		if done then
			Game:require_game_scripts()

			local require_end = os.clock()

			if PLATFORM == "win32" then
				game_require("managers", "mod/mod_manager")

				Managers.mod = ModManager:new(Boot.gui)
				Boot.startup_state = "loading_mods"
			else
				Boot.startup_state = "ready"
			end
		end
	elseif Boot.startup_state == "loading_mods" then
		Managers.mod:update(dt)

		if Managers.mod:all_mods_loaded() then
			Managers.mod:remove_gui()

			Boot.startup_state = "ready"
		end
	elseif Boot.startup_state == "ready" then
		Crashify.print_property("project", "vermintide 2")
		Crashify.print_property("build", BUILD)
		Crashify.print_property("platform", PLATFORM)
		Crashify.print_property("title_id", GameSettingsDevelopment.backend_settings.title_id)
		Crashify.print_property("engine_revision", script_data.build_identifier)
		Crashify.print_property("content_revision", script_data.settings.content_revision)
		Crashify.print_property("rendering_backend", Renderer.render_device_string())

		if PLATFORM == "win32" then
			if rawget(_G, "Steam") then
				Crashify.print_property("user_id", Steam.user_id())
			end

			Crashify.print_property("machine_id", Application.machine_id())
		elseif PLATFORM == "ps4" then
			Crashify.print_property("machine_id", Application.machine_id())
		elseif PLATFORM == "xb1" then
			Crashify.print_property("console_type", XboxOne.console_type())
		end

		local frame_table_start = os.clock()

		FrameTable.init()

		local frame_table_end = os.clock()
		local managers_start = os.clock()

		self:_init_managers()

		local managers_end = os.clock()
		local project_setup_start = os.clock()

		Game:setup()

		local start_state, params = Game:select_starting_state()
		params.notify_mod_manager = PLATFORM == "win32"
		local project_setup_end = os.clock()
		local state_machine_start = os.clock()

		self:_setup_statemachine(start_state, params)

		local state_machine_end = os.clock()
		local script_init_end_time = os.clock()
		Boot.render = Boot.game_render
		Boot.has_booted = true

		destroy_startup_world()

		return true
	end

	update_startup_world(dt)

	return false
end

Boot.booting_render = function (self)
	render_startup_world()
end

Boot._require_foundation_scripts = function (self)
	Profiler.start("Boot:_require_scripts()")
	base_require("util", "verify_plugins", "clipboard", "error", "patches", "class", "callback", "rectangle", "state_machine", "visual_state_machine", "misc_util", "stack", "circular_queue", "grow_queue", "table", "math", "vector3", "quaternion", "script_world", "script_viewport", "script_camera", "script_unit", "frame_table", "path")
	base_require("debug", "table_trap")
	base_require("managers", "world/world_manager", "player/player", "free_flight/free_flight_manager", "state/state_machine_manager", "time/time_manager", "token/token_manager")
	base_require("managers", "localization/localization_manager", "event/event_manager")
	Profiler.stop("Boot:_require_scripts()")
end

Boot._init_managers = function (self)
	Profiler.start("Boot:_init_managers()")

	Managers.time = TimeManager:new()
	Managers.world = WorldManager:new()
	Managers.token = TokenManager:new()
	Managers.state_machine = StateMachineManager:new()

	Profiler.stop("Boot:_init_managers()")
end

Boot.game_render = function (self)
	Managers.world:render()
	self._machine:render()
end

Boot._setup_statemachine = function (self, start_state, params)
	Profiler.start("Boot:_setup_statemachine()")

	self._machine = GameStateMachine:new(self, start_state, params, true)

	Profiler.stop("Boot:_setup_statemachine()")
end

function init()
	Boot:setup()
end

function update(dt)
	if Boot.has_booted then
		Boot:game_update(dt)
	else
		local run_game_update = Boot:booting_update(dt)

		if run_game_update then
			Boot:game_update(dt)
		end
	end
end

function render()
	Boot:render()
end

function shutdown()
	Boot:shutdown()
end

function create_startup_world()
	assert(not Boot.world)

	Boot.world = Application.new_world("boot_world", Application.DISABLE_PHYSICS, Application.DISABLE_SOUND, Application.DISABLE_APEX_CLOTH)
	Boot.shading_env = World.create_shading_environment(Boot.world, "environment/blank")
	Boot.viewport = Application.create_viewport(Boot.world, "overlay")
	local camera_unit = World.spawn_unit(Boot.world, "core/units/camera")
	local camera = Unit.camera(camera_unit, "camera")

	Camera.set_data(camera, "unit", camera_unit)
	Viewport.set_data(Boot.viewport, "camera", camera)

	Boot.gui = World.create_screen_gui(Boot.world, "immediate")
end

function update_startup_world(dt)
	local w, h = Application.resolution()

	Gui.rect(Boot.gui, Vector3(0, 0, 0), Vector2(w, h), Color(255, 0, 0, 0))
	World.update_scene(Boot.world, dt)
end

function render_startup_world()
	local world = Boot.world
	local shading_env = Boot.shading_env
	local viewport = Boot.viewport
	local camera = Viewport.get_data(Boot.viewport, "camera")

	Application.render_world(world, camera, viewport, shading_env)
end

function destroy_startup_world()
	assert(Boot.world)
	Application.release_world(Boot.world)

	Boot.world = nil
	Boot.viewport = nil
	Boot.shading_env = nil
	Boot.gui = nil
end

ReplayBoot = ReplayBoot or {}

ReplayBoot.init = function (self)
	self._packages = {}

	for _, name in ipairs(ExtendedReplay.packages_to_load()) do
		print("Loading package " .. name)

		local package = Application.resource_package(name)

		package:load()
		package:flush()
		table.insert(self._packages, package)
	end

	base_require("util", "verify_plugins", "clipboard", "error", "framerate", "patches", "class", "callback", "rectangle", "misc_util", "stack", "circular_queue", "grow_queue", "table", "math", "vector3", "quaternion", "frame_table", "path", "script_extended_replay")
	base_require("managers", "managers", "replay/replay_manager")
	Framerate.set_replay()

	self._world = Application.new_world("replay")

	ExtendedReplay.set_world(self._world)

	Managers.replay = ReplayManager:new(self._world)
end

ReplayBoot.update = function (self, dt)
	dt = Managers.replay:update(dt)

	World.update(self._world, dt)
end

ReplayBoot.render = function (self)
	local render_objects = ExtendedReplay.render_objects()

	if render_objects then
		local camera = Managers.replay:overriding_camera() or render_objects.camera

		Application.render_world(self._world, camera, render_objects.viewport, render_objects.shading_environment)
	end
end

ReplayBoot.shutdown = function (self)
	Managers:destroy()
	Application.release_world(self._world)

	for _, package in ipairs(self._packages) do
		package:unload()
		Application.release_resource_package(package)
	end
end

function replay_init()
	ReplayBoot:init()
end

function replay_update(dt)
	ReplayBoot:update(dt)
end

function replay_render()
	ReplayBoot:render()
end

function replay_shutdown()
	ReplayBoot:shutdown()
end

function force_render(dt)
	if Managers.transition then
		Managers.transition:force_render(dt)
	end

	render()
end

Boot.game_update = function (self, real_world_dt)
	Profiler.start("LUA update")

	local dt = Managers.time:scaled_delta_time(real_world_dt)

	if PlayerUnitLocomotionExtension then
		PlayerUnitLocomotionExtension.set_new_frame()
	end

	if Managers.mod then
		Managers.mod:update(dt)
	end

	UPDATE_RESOLUTION_LOOKUP()
	Managers.perfhud:update(dt)
	Managers.debug_updator:update(dt)

	GLOBAL_FRAME_INDEX = GLOBAL_FRAME_INDEX + 1

	Managers.time:update(dt)

	local t = Managers.time:time("main")

	Profiler.start("Lua machine pre-update")
	self._machine:pre_update(dt, t)
	Profiler.stop("Lua machine pre-update")
	Managers.package:update(dt, t)
	Profiler.start("Lua token update")
	Managers.token:update(dt, t)
	Profiler.stop("Lua token update")
	Profiler.start("Lua machine update")
	self._machine:update(dt, t)
	Profiler.stop("Lua machine update")
	Profiler.start("Visual state machine update")
	Managers.state_machine:update(dt)
	Profiler.stop("Visual state machine update")
	Profiler.start("Lua world update")
	Managers.world:update(dt, t)
	Profiler.stop("Lua world update")

	if self.quit_game then
		Boot.is_controlled_exit = true

		Application.quit()

		return
	end

	if LEVEL_EDITOR_TEST and Keyboard.pressed(Keyboard.button_index("f5")) then
		Application.console_send({
			type = "stop_testing"
		})
	end

	if PLATFORM == "win32" then
		Managers.curl:update(true)
		Managers.irc:update(dt)
		Managers.twitch:update(dt)
	elseif PLATFORM == "xb1" then
		Managers.rest_transport:update(true)

		if GameSettingsDevelopment.twitch_enabled then
			Managers.twitch:update(dt)
		end
	elseif PLATFORM == "ps4" then
		Managers.rest_transport:update(true)
		Managers.system_dialog:update(dt)
	end

	Managers.news_ticker:update(dt)
	Managers.transition:update(dt)

	if Managers.splitscreen then
		Managers.splitscreen:update(dt)
	end

	Managers.telemetry:update(dt)
	Managers.smoketest:update(dt)
	Managers.invite:update(dt)
	Managers.admin:update(dt)

	if Managers.account then
		Managers.account:update(dt)
	end

	if Managers.light_fx then
		Managers.light_fx:update(dt)
	end

	if Managers.unlock then
		Managers.unlock:update(dt)
	end

	if Managers.popup then
		Managers.simple_popup:update(dt)
		Managers.popup:update(dt)
	end

	if Managers.player then
		Managers.player:update(dt)
	end

	if Managers.beta_overlay then
		Managers.beta_overlay:update(dt)
	end

	Managers.play_go:update(dt)

	if PLATFORM == "xb1" then
		Managers.xbox_events:update(dt)

		if Managers.xbox_stats ~= nil then
			Managers.xbox_stats:update()
		end
	end

	if (BUILD == "dev" or BUILD == "debug") and SynergyMouse.connected() then
		print("[Boot] SynergyMouse enabled")
	end

	end_function_call_collection()
	table.clear(Boot.flow_return_table)
	Profiler.stop("LUA update")
	Profiler.start("LUA post_update")
	self._machine:post_update(dt)
	FrameTable.swap_tables()
	FrameTable.clear_tables()
	Profiler.stop("LUA post_update")
end

Boot.shutdown = function (self, dt)
	if Boot.has_booted then
		self._machine:destroy(true)
		Managers:destroy()
	end

	for package_name, handle in pairs(Boot.startup_package_handles) do
		if ResourcePackage.has_loaded(handle) then
			ResourcePackage.unload(handle)
			Application.release_resource_package(handle)
		end
	end

	if GLOBAL_MUSIC_WORLD then
		Application.release_world(MUSIC_WORLD)
	end
end

Game = Game or {}

Game.setup = function (self)
	local p = profile_start("Game:setup()")
	local is_dev_debug = BUILD == "dev" or BUILD == "debug"

	if PLATFORM == "xb1" then
		Application.set_kinect_enabled(true)
	end

	profile(p, "handle rev info")
	self:_handle_revision_info()
	profile(p, "handle rev info")

	if script_data.honduras_demo then
		self:_demo_setup()
	end

	local user_settings_time = nil

	if PLATFORM == "win32" then
		local non_rendering_dedicated_server = Application.is_dedicated_server()

		if not non_rendering_dedicated_server then
			profile(p, "handle gfx quality")
			self:_handle_win32_graphics_quality()
			profile(p, "handle gfx quality")
		end

		if rawget(_G, "Steam") then
			print("[Boot] User ID:", Steam.user_id(), Steam.user_name())
		end

		profile(p, "default settings")
		DefaultUserSettings.set_default_user_settings()
		profile(p, "default settings")
		profile(p, "user settings")
		self:_load_win32_user_settings()
		profile(p, "user settings")
		self:_init_mouse()

		if is_dev_debug then
			Window.set_resizable(true)
		else
			Window.set_resizable(false)
		end
	else
		profile(p, "default settings")
		DefaultUserSettings.set_default_user_settings()
		profile(p, "default settings")

		if PLATFORM == "ps4" then
			self:_set_ps4_content_restrictions()
		end
	end

	profile(p, "set frame times")
	Framerate.set_playing()
	profile(p, "set frame times")

	if Development.parameter("network_log_spew") then
		Network.log(Network.SPEW)
	elseif Development.parameter("network_log_messages") then
		Network.log(Network.MESSAGES)
	end

	if GameSettingsDevelopment.remove_debug_stuff then
		profile(p, "remove debug stuff")
		DebugHelper.remove_debug_stuff()
		profile(p, "remove debug stuff")
	end

	if script_data.settings.physics_dump then
		profile(p, "physics_dump")
		DebugHelper.enable_physics_dump()
		profile(p, "physics_dump")
	end

	if BUILD == "dev" or BUILD == "debug" then
		if Synergy and Development.parameter("synergy") then
			local resx, resy = Application.resolution()
			local synergy_setting_name = Development.parameter("synergy")
			local synergy_settings = SynergySettings.user_settings[synergy_setting_name]

			printf("Connecting to Synergy: %s @ %s", synergy_setting_name, synergy_settings.ip)
			Synergy.connect(synergy_settings.ip, synergy_settings.client_name, resx, resy)
		end

		local debug_resource_package = "resource_packages/debug/ui_debug"

		if script_data.load_ui_debug_package and not Managers.package:has_loaded(debug_resource_package, "global") and not table.contains(GlobalResources, debug_resource_package) then
			GlobalResources[#GlobalResources + 1] = debug_resource_package
		end
	end

	profile(p, "init random")
	self:_init_random()
	profile(p, "init random")
	profile(p, "managers")
	self:_init_managers()
	profile(p, "managers")
	profile_end(p)
end

Game._set_ps4_content_restrictions = function (self)
	local t_us = {
		{
			country = "at",
			age = 16
		},
		{
			country = "be",
			age = 16
		},
		{
			country = "bg",
			age = 16
		},
		{
			country = "hr",
			age = 16
		},
		{
			country = "cy",
			age = 16
		},
		{
			country = "cz",
			age = 16
		},
		{
			country = "dk",
			age = 16
		},
		{
			country = "fi",
			age = 16
		},
		{
			country = "fr",
			age = 16
		},
		{
			country = "gr",
			age = 16
		},
		{
			country = "hu",
			age = 16
		},
		{
			country = "is",
			age = 16
		},
		{
			country = "ie",
			age = 16
		},
		{
			country = "il",
			age = 16
		},
		{
			country = "it",
			age = 16
		},
		{
			country = "lu",
			age = 16
		},
		{
			country = "mt",
			age = 16
		},
		{
			country = "nl",
			age = 16
		},
		{
			country = "no",
			age = 16
		},
		{
			country = "pl",
			age = 16
		},
		{
			country = "pt",
			age = 16
		},
		{
			country = "ro",
			age = 16
		},
		{
			country = "sk",
			age = 16
		},
		{
			country = "si",
			age = 16
		},
		{
			country = "es",
			age = 16
		},
		{
			country = "se",
			age = 16
		},
		{
			country = "ch",
			age = 16
		},
		{
			country = "tr",
			age = 16
		},
		{
			country = "gb",
			age = 16
		},
		{
			country = "au",
			age = 15
		},
		{
			country = "tw",
			age = 15
		},
		{
			country = "br",
			age = 16
		},
		{
			country = "ru",
			age = 16
		}
	}
	local t_eu = {
		{
			country = "at",
			age = 16
		},
		{
			country = "be",
			age = 16
		},
		{
			country = "bg",
			age = 16
		},
		{
			country = "hr",
			age = 16
		},
		{
			country = "cy",
			age = 16
		},
		{
			country = "cz",
			age = 16
		},
		{
			country = "dk",
			age = 16
		},
		{
			country = "fi",
			age = 16
		},
		{
			country = "fr",
			age = 16
		},
		{
			country = "gr",
			age = 16
		},
		{
			country = "hu",
			age = 16
		},
		{
			country = "is",
			age = 16
		},
		{
			country = "ie",
			age = 16
		},
		{
			country = "il",
			age = 16
		},
		{
			country = "it",
			age = 16
		},
		{
			country = "lu",
			age = 16
		},
		{
			country = "mt",
			age = 16
		},
		{
			country = "nl",
			age = 16
		},
		{
			country = "no",
			age = 16
		},
		{
			country = "pl",
			age = 16
		},
		{
			country = "pt",
			age = 16
		},
		{
			country = "ro",
			age = 16
		},
		{
			country = "sk",
			age = 16
		},
		{
			country = "si",
			age = 16
		},
		{
			country = "es",
			age = 16
		},
		{
			country = "se",
			age = 16
		},
		{
			country = "ch",
			age = 16
		},
		{
			country = "tr",
			age = 16
		},
		{
			country = "gb",
			age = 16
		},
		{
			country = "us",
			age = 17
		},
		{
			country = "mx",
			age = 17
		},
		{
			country = "ca",
			age = 17
		},
		{
			country = "au",
			age = 15
		},
		{
			country = "tw",
			age = 15
		},
		{
			country = "br",
			age = 16
		},
		{
			country = "ru",
			age = 16
		}
	}

	if PS4.title_id() == "CUSA02133_00" then
		NpCheck.set_content_restriction(17, t_us)
	else
		NpCheck.set_content_restriction(18, t_eu)
	end
end

Game._handle_revision_info = function (self)
	local content_revision = script_data.settings.content_revision
	local no_revision = content_revision == nil or content_revision == ""
	local trunk_path = Development.parameter("trunk_path")

	if no_revision and trunk_path then
		if false then
			local path = Path.path_from_string(trunk_path)

			Path.add_path_part(path, "update_scripts")

			local svn_info_path = Path.copy(path)

			Path.add_path_part(svn_info_path, "svn_info.txt")

			svn_info_path = Path.tostring(svn_info_path, "\\")

			os_remove(svn_info_path)

			local script_path = Path.copy(path)

			Path.add_path_part(script_path, "get_svn_revision.bat")

			script_path = Path.tostring(script_path)
			path = Path.tostring(path)
			local command = string.format("start \"\" /min cmd /c call \"%s\" \"%s/.\" \"%s\"", script_path, trunk_path, svn_info_path)

			print(command)

			local execute_result = os_execute(command)

			if execute_result ~= 0 then
				print("[Boot] Could not execute command, result ", tostring(execute_result))
			end

			local t0 = os.clock()

			while os.clock() - t0 <= 1 do
			end

			local svn_info_file = io_open(svn_info_path, "r")

			if svn_info_file then
				io_input(svn_info_file)

				while true do
					local svn_info_line = io_read()

					if svn_info_line == nil then
						break
					end

					local find_start, find_end = svn_info_line:find("Revision: ")

					if find_start and find_end then
						local svn_revision = svn_info_line:sub(find_end + 1)
						script_data.settings.content_revision = svn_revision

						break
					end
				end

				io_close(svn_info_file)
			else
				print("[Boot] Could not open ", svn_info_path)
			end
		end
	end

	local tab = {}

	for word in string.gmatch(script_data.build_identifier, "([^|]+)") do
		table.insert(tab, word)
	end

	if #tab == 3 then
		local build_id = tab[2]:gsub("^%s*(.-)%s*$", "%1")
		local build_conf = tab[3]:gsub("^%s*(.-)%s*$", "%1")
		local build_url = string.format("http://vcs01.i.fatshark.se:8111/viewLog.html?buildId=%s&tab=buildResultsDiv&buildTypeId=%s", build_id, build_conf)

		print("[Boot] Link to build log:", build_url)
	end

	print("[Boot] Application build:", BUILD)
	print("[Boot] Engine revision:", script_data.build_identifier)
	print("[Boot] Content revision:", script_data.settings.content_revision)

	if Development.parameter("paste_revision_to_clipboard") then
		Clipboard.put(string.format("%s | %s", tostring(script_data.settings.content_revision), tostring(script_data.build_identifier)))
	end
end

Game.require_game_scripts = function (self)
	foundation_require("util", "local_require")
	game_require("utils", "patches", "colors", "framerate", "random_table", "global_utils", "function_call_stats", "util", "loaded_dice", "script_application", "benchmark/benchmark_handler")
	game_require("ui", "views/show_cursor_stack", "ui_fonts")
	game_require("settings", "demo_settings", "game_settings_development", "synergy_settings", "controller_settings", "default_user_settings")
	game_require("entity_system", "entity_system")
	game_require("game_state", "game_state_machine", "state_context", "state_splash_screen", "state_loading", "state_ingame", "state_demo_end")
	game_require("managers", "admin/admin_manager", "news_ticker/news_ticker_manager", "player/player_manager", "player/player_bot", "save/save_manager", "save/save_data", "perfhud/perfhud_manager", "music/music_manager", "network/party_manager", "transition/transition_manager", "smoketest/smoketest_manager", "debug/updator", "invite/invite_manager", "unlock/unlock_manager", "popup/popup_manager", "popup/simple_popup", "light_fx/light_fx_manager", "play_go/play_go_manager", "controller_features/controller_features_manager", "mutators/mutator_manager", "deed/deed_manager", "telemetry/telemetry_create")

	if PLATFORM == "win32" then
		game_require("managers", "irc/irc_manager", "curl/curl_manager", "twitch/twitch_manager")
	elseif PLATFORM == "xb1" then
		game_require("managers", "events/xbox_event_manager", "rest_transport/rest_transport_manager", "twitch/mixer_manager")
	elseif PLATFORM == "ps4" then
		game_require("managers", "rest_transport/rest_transport_manager", "system_dialog/system_dialog_manager")
	end

	game_require("helpers", "effect_helper", "weapon_helper", "item_helper", "lorebook_helper", "ui_atlas_helper", "scoreboard_helper")
	game_require("network", "unit_spawner", "unit_storage", "network_unit")
	self:_init_localization_manager()
	require("scripts/ui/views/ingame_ui")
	require("scripts/ui/views/level_end/level_end_view")
	require("scripts/ui/views/title_loading_ui")
	require("scripts/network_lookup/network_lookup")
end

Game._handle_win32_graphics_quality = function (self)
	local p = profile_start("Game:_handle_win32_graphics_quality()")
	local graphics_quality = Application.user_setting("graphics_quality")

	local function is_same(current, new)
		if current == new then
			return true
		elseif type(current) == "table" and type(new) == "table" then
			for k, v in pairs(current) do
				if new[k] ~= v then
					return false
				end
			end

			for k, v in pairs(new) do
				if current[k] ~= v then
					return false
				end
			end

			return true
		else
			return false
		end
	end

	local dirty = false

	local function set_user_setting(category, setting, value)
		if value ~= nil then
			local current = Application.user_setting(category, setting)

			if not is_same(current, value) then
				Application.set_user_setting(category, setting, value)
				print("Diff in user_setting:", category, setting, current, value)

				dirty = true
			end
		else
			value = setting
			setting = category
			local current = Application.user_setting(setting)

			if not is_same(current, value) then
				Application.set_user_setting(setting, value)
				print("Diff in user_setting:", setting, current, value)

				dirty = true
			end
		end
	end

	if graphics_quality == nil then
		graphics_quality = script_data.settings.default_graphics_quality or "medium"

		Application.set_user_setting("graphics_quality", graphics_quality)
	end

	if LEVEL_EDITOR_TEST or graphics_quality == "custom" or not GraphicsQuality[graphics_quality] then
		return
	end

	local settings = GraphicsQuality[graphics_quality]
	local user_settings = settings.user_settings

	for setting, value in pairs(user_settings) do
		if setting == "char_texture_quality" then
			local texture_settings = TextureQuality.characters[value]

			for i, texture_setting in ipairs(texture_settings) do
				set_user_setting("texture_settings", texture_setting.texture_setting, texture_setting.mip_level)
			end
		elseif setting == "env_texture_quality" then
			local texture_settings = TextureQuality.environment[value]

			for i, texture_setting in ipairs(texture_settings) do
				set_user_setting("texture_settings", texture_setting.texture_setting, texture_setting.mip_level)
			end
		elseif setting == "local_light_shadow_quality" then
			local local_light_shadow_quality_settings = LocalLightShadowQuality[value]

			for render_setting, key in pairs(local_light_shadow_quality_settings) do
				set_user_setting("render_settings", render_setting, key)
			end
		elseif setting == "particles_quality" then
			local particle_quality_settings = ParticlesQuality[value]

			for render_setting, key in pairs(particle_quality_settings) do
				Application.set_user_setting("render_settings", render_setting, key)
			end
		elseif setting == "sun_shadow_quality" then
			local sun_shadow_quality_settings = SunShadowQuality[value]

			for render_setting, key in pairs(sun_shadow_quality_settings) do
				set_user_setting("render_settings", render_setting, key)
			end
		elseif setting == "volumetric_fog_quality" then
			local volumetric_fog_quality_settings = VolumetricFogQuality[value]

			for render_setting, key in pairs(volumetric_fog_quality_settings) do
				set_user_setting("render_settings", render_setting, key)
			end
		elseif setting == "ambient_light_quality" then
			local ambient_light_quality_settings = AmbientLightQuality[value]

			for render_setting, key in pairs(ambient_light_quality_settings) do
				set_user_setting("render_settings", render_setting, key)
			end
		elseif setting == "ao_quality" then
			local ao_quality_settings = AmbientOcclusionQuality[value]

			for render_setting, key in pairs(ao_quality_settings) do
				set_user_setting("render_settings", render_setting, key)
			end
		end

		set_user_setting(setting, value)
	end

	local render_settings = settings.render_settings

	for setting, value in pairs(render_settings) do
		set_user_setting("render_settings", setting, value)
	end

	if dirty then
		profile(p, "apply")
		Application.apply_user_settings()
		profile(p, "apply")
	end

	profile(p, "save")
	Application.save_user_settings()
	profile(p, "save")
	profile_end(p)
end

Game._init_random = function (self)
	local seed = (os.clock() * 10000) % 1000

	math.randomseed(seed)
	math.random(5, 30000)
end

Game._init_mouse = function (self)
	Window.set_cursor("gui/cursors/mouse_cursor")
	Window.set_clip_cursor(true)
end

Game._init_managers = function (self)
	parse_item_master_list()

	Managers.save = SaveManager:new(script_data.settings.disable_cloud_save)

	if PLATFORM == "xb1" then
		self:_init_backend_xbox()
	elseif PLATFORM == "ps4" then
		self:_init_backend_ps4()
	else
		self:_init_backend()
	end

	self:_init_localization_manager()

	Managers.admin = AdminManager:new()
	Managers.perfhud = PerfhudManager:new()
	Managers.debug_updator = Updator:new()
	Managers.music = MusicManager:new()
	Managers.transition = TransitionManager:new()
	Managers.play_go = PlayGoManager:new()

	if PLATFORM == "win32" then
		Managers.irc = IRCManager:new()
		Managers.curl = CurlManager:new()
		Managers.twitch = TwitchManager:new()
		Managers.unlock = UnlockManager:new()
	elseif PLATFORM == "xb1" then
		Managers.xbox_events = XboxEventManager:new()
		Managers.rest_transport_online = RestTransportManager:new()
		Managers.rest_transport = Managers.rest_transport_online

		if GameSettingsDevelopment.twitch_enabled then
			Managers.twitch = MixerManager:new()
		end
	elseif PLATFORM == "ps4" then
		Managers.rest_transport_online = RestTransportManager:new()
		Managers.rest_transport = Managers.rest_transport_online
		Managers.system_dialog = SystemDialogManager:new()
	end

	Managers.telemetry = CreateTelemetryManager()
	Managers.player = PlayerManager:new()
	Managers.free_flight = FreeFlightManager:new()
	Managers.smoketest = SmoketestManager:new()
	Managers.invite = InviteManager:new()
	Managers.news_ticker = NewsTickerManager:new()
	Managers.light_fx = LightFXManager:new()
	Managers.party = PartyManager:new()
	Managers.mutators = MutatorManager:new()
	Managers.deed = DeedManager:new()

	if GameSettingsDevelopment.use_leaderboards or Development.parameter("use_leaderboards") then
		Managers.leaderboards = LeaderboardManager:new()
	end
end

Game._init_backend = function (self)
	local backend = "ScriptBackendPlayFab"
	local mirror = "PlayFabMirror"

	if DEDICATED_SERVER then
		backend = "ScriptBackendPlayFabDedicated"
		mirror = "PlayFabMirrorDedicated"
	end

	Managers.backend = BackendManagerPlayFab:new(backend, mirror, "DataServerQueue")
end

Game._init_backend_xbox = function (self)
	local backend = "ScriptBackendPlayFabXbox"
	local mirror = "PlayFabMirror"
	Managers.backend = BackendManagerPlayFab:new(backend, mirror, "DataServerQueue")
end

Game._init_backend_ps4 = function (self)
	local backend = "ScriptBackendPlayFabPS4"
	local mirror = "PlayFabMirror"
	Managers.backend = BackendManagerPlayFab:new(backend, mirror, "DataServerQueue")
end

Game._load_win32_user_settings = function (self)
	local max_frames = Application.win32_user_setting("max_stacking_frames")

	if max_frames then
		Application.set_max_frame_stacking(max_frames)
	end
end

Game._demo_setup = function (self)
	Application.save_user_settings = function ()
		return
	end

	local key_combinations_allowed = DemoSettings.key_combinations_allowed

	for key, enabled in pairs(key_combinations_allowed) do
		Window.set_keystroke_enabled(key, enabled)
	end

	Managers.package:load("resource_packages/demo", "boot")
end

Game._init_localization_manager = function (self)
	Managers.localizer = LocalizationManager:new("localization/game")

	local function tweak_parser(tweak_name)
		return LocalizerTweakData[tweak_name] or "<missing LocalizerTweakData \"" .. tweak_name .. "\">"
	end

	Managers.localizer:add_macro("TWEAK", tweak_parser)

	local function key_parser(input_service_and_key_name)
		local split_start, split_end = string.find(input_service_and_key_name, "__")

		assert(split_start and split_end, "[key_parser] You need to specify a key using this format $KEY;<input_service>__<key>. Example: $KEY;options_menu__back (note the dubbel underline separating input service and key")

		local input_service_name = string.sub(input_service_and_key_name, 1, split_start - 1)
		local key_name = string.sub(input_service_and_key_name, split_end + 1)
		local input_service = Managers.input:get_service(input_service_name)

		fassert(input_service, "[key_parser] No input service with the name %s", input_service_name)

		local key = input_service:get_keymapping(key_name)

		fassert(key, "[key_parser] There is no such key: %s in input service: %s", key_name, input_service_name)

		local key_locale_name = nil

		for j = 1, key.n, 3 do
			local device_type = key[j]
			local button_index = key[j + 1]

			if button_index == UNASSIGNED_KEY then
				key_locale_name = "n/a"
			elseif Managers.input:is_device_active("keyboard") or Managers.input:is_device_active("mouse") then
				if device_type == "keyboard" then
					key_locale_name = Keyboard.button_locale_name(button_index) or Keyboard.button_name(button_index)
				elseif device_type == "mouse" then
					key_locale_name = Mouse.button_name(button_index)
				end
			elseif Managers.input:is_device_active("gamepad") and device_type == "gamepad" then
				key_locale_name = Pad1.button_name(button_index)
			end
		end

		return key_locale_name
	end

	Managers.localizer:add_macro("KEY", key_parser)
end

Game.select_starting_state = function (self)
	local args = {
		Application.argv()
	}

	for i = 1, #args, 1 do
		if args[i] == "safe-mode" then
			Game.safe_mode = true

			assert(false)
		end
	end

	script_data.use_optimized_breed_units = PLATFORM ~= "win32"

	print("[Boot] use baked enemy meshes:", script_data.use_optimized_breed_units)

	if GameSettingsDevelopment.start_state == "dedicated_server" then
		Managers.package:load("resource_packages/menu", "boot")
		Managers.package:load("resource_packages/menu_assets_common", "global")
		Managers.package:load("resource_packages/ingame", "global")
		Managers.package:load("resource_packages/inventory", "global")
		Managers.package:load("resource_packages/careers", "global")
		Managers.package:load("resource_packages/pickups", "global")
		Managers.package:load("resource_packages/decals", "global")
		Managers.package:load("resource_packages/platform_specific/platform_specific", "boot")

		Boot.loading_context = {}

		require("scripts/game_state/state_dedicated_server")

		return StateDedicatedServer, {}
	elseif GameSettingsDevelopment.start_state == "game" then
		local ingame_package = (LEVEL_EDITOR_TEST and "resource_packages/ingame_light") or "resource_packages/ingame"

		Managers.package:load("resource_packages/menu", "boot")
		Managers.package:load("resource_packages/menu_assets_common", "global")
		Managers.package:load(ingame_package, "global")
		Managers.package:load("resource_packages/inventory", "global")
		Managers.package:load("resource_packages/careers", "global")
		Managers.package:load("resource_packages/pickups", "global")
		Managers.package:load("resource_packages/decals", "global")

		local level_key = GameSettingsDevelopment.quicklaunch_params.level_key
		Boot.loading_context = {
			level_key = level_key
		}

		require("scripts/game_state/state_splash_screen")

		return StateSplashScreen, {}
	elseif GameSettingsDevelopment.start_state == "menu" then
		Boot.loading_context = {
			show_splash_screens = true
		}

		require("scripts/game_state/state_splash_screen")

		return StateSplashScreen, {}
	end

	return StateSplashScreen, {}
end

return
