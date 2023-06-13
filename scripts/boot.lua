print("boot.lua start, os clock:", os.clock())
dofile("scripts/boot_init")

local BUILD = BUILD
local PLATFORM = PLATFORM

if IS_XB1 then
	local XB1_TYPE_LOOKUP = {
		[XboxOne.CONSOLE_TYPE_UNKNOWN] = "unknown",
		[XboxOne.CONSOLE_TYPE_XBOX_ONE] = "xb1",
		[XboxOne.CONSOLE_TYPE_XBOX_ONE_S] = "xb1s",
		[XboxOne.CONSOLE_TYPE_XBOX_ONE_X] = "xb1x",
		[XboxOne.CONSOLE_TYPE_XBOX_ONE_X_DEVKIT] = "xb1x-devkit",
		[XboxOne.CONSOLE_TYPE_XBOX_LOCKHART] = "xbs_lockhart",
		[XboxOne.CONSOLE_TYPE_XBOX_ANACONDA] = "xbs_anaconda",
		[XboxOne.CONSOLE_TYPE_XBOX_SERIES_X_DEVKIT] = "xbs_anaconda-devkit"
	}

	XboxOne.console_type_string = function ()
		return XB1_TYPE_LOOKUP[XboxOne.console_type()]
	end
end

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

print("Active feature-flags:")
Application.print_strip_tags()
print("")
require("scripts/settings/dlc_settings")
require("scripts/helpers/dlc_utils")

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
	_G.Crashify = require("foundation/scripts/util/crashify")

	foundation_require("util", "testify")

	if not DEDICATED_SERVER and IS_WINDOWS then
		Application.set_time_step_policy("throttle", 30)
	end

	Script.set_index_offset(0)
	print("Boot:setup() entered. time: ", 0, "os-clock: ", os.clock())

	Boot.startup_timer = 0
	Boot.startup_state = "loading"

	if IS_WINDOWS then
		Window.set_focus()
		Window.set_mouse_focus(true)
	end

	print(Application.sysinfo())
	self:_init_localizer()

	Boot.startup_packages = {
		"resource_packages/boot_assets",
		"resource_packages/fonts",
		"resource_packages/strings",
		"resource_packages/foundation_scripts",
		"resource_packages/game_scripts",
		"resource_packages/level_scripts",
		"resource_packages/levels/benchmark_levels",
		"resource_packages/levels/honduras_levels"
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

	if IS_WINDOWS then
		language = Application.user_setting("language_id") or rawget(_G, "Steam") and Steam:language() or default_language
	elseif IS_PS4 then
		language = PS4.locale() or default_language
	elseif IS_XB1 then
		language = xb1_format_locale(XboxLive.locale() or default_language)
	elseif IS_LINUX then
		language = "en"
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

			for i = 1, #value do
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

	for i = 1, #sorted_params do
		print(sorted_params[i])
	end

	print("*****************************************************************")

	script_data.honduras_demo = script_data.settings.honduras_demo or script_data["honduras-demo"]
	script_data.settings.use_beta_overlay = script_data.settings.use_beta_overlay or script_data.use_beta_overlay
	script_data.settings.use_beta_mode = script_data.settings.use_beta_mode or script_data.use_beta_mode
	script_data.use_optimized_breed_units = IS_CONSOLE

	print("[Boot] use baked enemy meshes:", script_data.use_optimized_breed_units)
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

		if window_title and IS_WINDOWS then
			Window.set_title(window_title)
		end

		for dlc_name, dlc in pairs(DLCSettings) do
			local package_name = dlc.package_name

			if package_name then
				Managers.package:load(package_name, "boot", nil, true)
			end

			local platform_specific_package_name = dlc.platform_specific

			if platform_specific_package_name then
				Managers.package:load(platform_specific_package_name, "boot", nil, true)
			end
		end

		local require_start = os.clock()

		self:_require_foundation_scripts()

		Boot.startup_state = "loading_dlcs"
	elseif Boot.startup_state == "loading_dlcs" then
		foundation_require("util", "local_require")

		local done = Managers.package:update()

		if done then
			Boot.startup_state = "done_loading_dlcs"
			Boot.disable_loading_bar = true
		end
	elseif Boot.startup_state == "done_loading_dlcs" then
		DLCUtils.require_list("additional_settings")
		DLCUtils.merge("script_data", script_data)
		Game:require_game_scripts()

		if IS_WINDOWS and LAUNCH_MODE ~= "attract_benchmark" then
			Boot.startup_state = "init_mods"
		elseif IS_LINUX then
			Managers.mod = MockClass:new()
			Boot.startup_state = "ready"
		else
			Boot.startup_state = "ready"
		end
	elseif Boot.startup_state == "init_mods" then
		Managers.curl = CurlManager:new()

		game_require("managers", "mod/mod_manager")

		Managers.mod = ModManager:new(Boot.gui)
		Boot.startup_state = "loading_mods"
	elseif Boot.startup_state == "loading_mods" then
		Managers.curl:update(true)
		Managers.mod:update(dt)

		if Managers.mod:all_mods_loaded() then
			Managers.mod:remove_gui()

			Boot.startup_state = "ready"
		end
	elseif Boot.startup_state == "ready" then
		local crashify_settings = require("scripts/settings/crashify_settings")

		Crashify.print_property("project", crashify_settings.project)
		Crashify.print_property("build", BUILD)
		Crashify.print_property("platform", PLATFORM)
		Crashify.print_property("dedicated_server", DEDICATED_SERVER)
		Crashify.print_property("title_id", GameSettingsDevelopment.backend_settings.title_id)
		Crashify.print_property("content_revision", script_data.settings.content_revision == "" and Development.parameter("content_revision") or script_data.settings.content_revision)
		Crashify.print_property("engine_revision", script_data.build_identifier or Development.parameter("engine_revision"))
		Crashify.print_property("release_version", VersionSettings.version)
		Crashify.print_property("rendering_backend", Renderer.render_device_string())
		Crashify.print_property("teamcity_build_id", script_data.settings.teamcity_build_id)

		if script_data.testify then
			Crashify.print_property("testify", true)
		end

		if IS_WINDOWS or IS_LINUX then
			if rawget(_G, "Steam") then
				Crashify.print_property("steam_id", Steam.user_id())
				Crashify.print_property("steam_profile_name", Steam.user_name())
				Crashify.print_property("steam_app_id", Steam.app_id())

				local write_network_debug_output_to_log = Application.user_setting("write_network_debug_output_to_log")

				if write_network_debug_output_to_log then
					print("Network.write_debug_output_to_log(true)")

					local k_ESteamNetworkingConfig_LogLevel_P2PRendezvous = 17
					local k_ESteamNetworkingSocketsDebugOutputType_Debug = 7

					Network.set_config_value(k_ESteamNetworkingConfig_LogLevel_P2PRendezvous, k_ESteamNetworkingSocketsDebugOutputType_Debug)
					Network.write_debug_output_to_log(true)
				end
			end

			Crashify.print_property("machine_id", Application.machine_id())
		elseif IS_PS4 then
			Crashify.print_property("machine_id", Application.machine_id())

			local console_type = "ps4"

			if PS4.is_ps5() then
				console_type = "ps5"
			elseif PS4.is_pro() then
				console_type = "ps4_pro"
			end

			Crashify.print_property("console_type", console_type)
		elseif IS_XB1 then
			Crashify.print_property("console_type", XboxOne.console_type_string())
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
		params.notify_mod_manager = IS_WINDOWS and LAUNCH_MODE ~= "attract_benchmark"
		local project_setup_end = os.clock()
		local state_machine_start = os.clock()

		self:_setup_statemachine(start_state, params)

		local state_machine_end = os.clock()
		local script_init_end_time = os.clock()

		Testify:ready()

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
	base_require("util", "verify_plugins", "error", "patches", "class", "callback", "rectangle", "state_machine", "visual_state_machine", "misc_util", "stack", "circular_queue", "grow_queue", "table", "math", "vector3", "quaternion", "script_world", "script_viewport", "script_camera", "script_unit", "frame_table", "path", "string", "reportify")
	base_require("debug", "table_trap")
	base_require("managers", "world/world_manager", "player/player", "free_flight/free_flight_manager", "state/state_machine_manager", "time/time_manager", "token/token_manager")
	base_require("managers", "localization/localization_manager", "event/event_manager")
end

Boot._init_managers = function (self)
	Managers.time = TimeManager:new()
	Managers.world = WorldManager:new()
	Managers.token = TokenManager:new()
	Managers.state_machine = StateMachineManager:new()
	Managers.url_loader = UrlLoaderManager:new()
end

Boot.game_render = function (self)
	if self._machine.pre_render then
		self._machine:pre_render()
	end

	Managers.world:render()
	self._machine:render()

	if self._machine.post_render then
		self._machine:post_render()
	end

	Managers.url_loader:post_render()
end

Boot._setup_statemachine = function (self, start_state, params)
	self._machine = GameStateMachine:new(self, start_state, params, true)
end

Boot.on_close = function (self)
	if self._machine and self._machine.on_close then
		return self._machine:on_close()
	end

	return true
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

function on_close()
	local close = Boot:on_close()

	if close then
		Application.force_silent_exit_policy()
		Crashify.print_property("shutdown", true)
	end

	return close
end

function shutdown()
	Application.force_silent_exit_policy()
	Crashify.print_property("shutdown", true)
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
	Boot.bar_timer = 0
end

function update_startup_world(dt)
	local w, h = Application.resolution()

	Gui.rect(Boot.gui, Vector3(0, 0, 0), Vector2(w, h), Color(255, 0, 0, 0))

	if IS_CONSOLE and not Boot.disable_loading_bar then
		local function clamp(value, min, max)
			if max < value then
				return max
			elseif value < min then
				return min
			else
				return value
			end
		end

		Boot.bar_timer = (Boot.bar_timer + dt) % 2
		local w, h = Gui.resolution()
		local scale = w / 1920
		local size = Vector2(120 * scale, 13 * scale)
		local width = 1 * scale
		local bar_value = clamp(Boot.bar_timer, 0, 1)
		bar_value = bar_value * bar_value * bar_value
		local alpha = clamp(2 - Boot.bar_timer, 0, 1)

		Gui.rect(Boot.gui, Vector3(w - 200 * scale, 50 * scale, 900), size)
		Gui.rect(Boot.gui, Vector3(w - 200 * scale + width, 50 * scale + width, 901), Vector2(size[1] - width * 2, size[2] - width * 2), Color(0, 0, 0))
		Gui.rect(Boot.gui, Vector3(w - 200 * scale + width * 3, 50 * scale + width * 4, 902), Vector2((size[1] - width * 6) * bar_value, size[2] - width * 8), Color(alpha * 255, 255, 255, 255))
	end

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

	base_require("util", "verify_plugins", "error", "framerate", "patches", "class", "callback", "rectangle", "misc_util", "stack", "circular_queue", "grow_queue", "table", "math", "vector3", "quaternion", "frame_table", "path", "script_extended_replay")
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

local EMPTY_TABLE = {}

Boot.game_update = function (self, real_world_dt)
	local Managers = Managers
	local dt = Managers.time:scaled_delta_time(real_world_dt)

	if PlayerUnitLocomotionExtension then
		PlayerUnitLocomotionExtension.set_new_frame()
	end

	if Managers.mod then
		Managers.mod:update(dt)
	end

	UPDATE_RESOLUTION_LOOKUP()
	Managers.perfhud:update(dt)
	Managers.updator:update(dt)

	GLOBAL_FRAME_INDEX = GLOBAL_FRAME_INDEX + 1

	Managers.time:update(dt)

	local t = Managers.time:time("main")

	for _, dlc in pairs(DLCSettings) do
		local manager_settings = dlc.manager_settings or EMPTY_TABLE

		for name, manager_data in pairs(manager_settings) do
			if manager_data.pre_update then
				Managers[name].pre_update(Managers[name], dt, t)
			end
		end
	end

	self._machine:pre_update(dt, t)
	Managers.package:update(dt, t)
	Managers.token:update(dt, t)

	for _, dlc in pairs(DLCSettings) do
		local manager_settings = dlc.manager_settings or EMPTY_TABLE

		for name, manager_data in pairs(manager_settings) do
			if manager_data.update then
				Managers[name].update(Managers[name], dt, t)
			end
		end
	end

	self._machine:update(dt, t)
	Managers.state_machine:update(dt)
	Managers.world:update(dt, t)
	Managers.url_loader:update(dt)

	if LEVEL_EDITOR_TEST and Keyboard.pressed(Keyboard.button_index("f5")) then
		Application.console_send({
			type = "stop_testing"
		})
	end

	if IS_WINDOWS then
		Managers.curl:update(true)
		Managers.irc:update(dt)
		Managers.twitch:update(dt)

		if rawget(_G, "Steam") then
			Managers.steam:update(t, dt)
		end
	elseif IS_XB1 then
		Managers.rest_transport:update(true, dt, t)

		if GameSettingsDevelopment.twitch_enabled then
			Managers.twitch:update(dt)
			Managers.irc:update(dt)
		end
	elseif IS_PS4 then
		Managers.rest_transport:update(true, dt, t)
		Managers.irc:update(dt)
		Managers.twitch:update(dt)
		Managers.system_dialog:update(dt)
	elseif IS_LINUX then
		Managers.curl:update(true)
		Managers.irc:update(dt)
		Managers.twitch:update(dt)
	end

	Managers.weave:update(dt, t)
	Managers.news_ticker:update(dt)
	Managers.transition:update(dt)
	Managers.load_time:update(dt)

	if Managers.splitscreen then
		Managers.splitscreen:update(dt)
	end

	Managers.telemetry_reporters:update(dt, t)
	Managers.telemetry:update(dt, t)
	Managers.invite:update(dt, t)
	Managers.admin:update(dt)

	if Managers.account then
		Managers.account:update(dt)
	end

	if Managers.light_fx then
		Managers.light_fx:update(dt)
	end

	if Managers.razer_chroma then
		Managers.razer_chroma:update(dt)
	end

	if Managers.unlock then
		Managers.unlock:update(dt, t)
	end

	if Managers.popup then
		Managers.simple_popup:update(dt)
		Managers.popup:update(dt)
	end

	if Managers.beta_overlay then
		Managers.beta_overlay:update(dt)
	end

	Managers.play_go:update(dt)

	if IS_XB1 then
		Managers.xbox_events:update(dt)

		if Managers.xbox_stats ~= nil then
			Managers.xbox_stats:update()
		end
	end

	Testify:update(dt, t)
	end_function_call_collection()
	table.clear(Boot.flow_return_table)

	for _, dlc in pairs(DLCSettings) do
		local manager_settings = dlc.manager_settings or EMPTY_TABLE

		for name, manager_data in pairs(manager_settings) do
			if manager_data.post_update then
				Managers[name].post_update(Managers[name], dt, t)
			end
		end
	end

	self._machine:post_update(dt)
	FrameTable.swap_and_clear()

	if self.quit_game then
		local function save_cb(info)
			Boot.is_controlled_exit = true

			Application.quit()
		end

		if not self._saving then
			Managers.save:auto_save(SaveFileName, SaveData, save_cb)

			self._saving = true
		end
	end
end

Boot.shutdown = function (self, dt)
	if self._machine then
		self._machine:destroy(true)
	end

	if Managers then
		Managers:destroy()
	end

	if Boot.world then
		destroy_startup_world()
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

	if IS_XB1 then
		Application.set_kinect_enabled(true)
	end

	if script_data.honduras_demo then
		self:_demo_setup()
	end

	local user_settings_time = nil

	if IS_WINDOWS then
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

		if IS_PS4 then
			self:_set_ps4_content_restrictions()
		end
	end

	profile(p, "set frame times")
	Framerate.set_playing()
	profile(p, "set frame times")

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

	for _, dlc in pairs(DLCSettings) do
		local ingame_package_name = dlc.ingame_package_name

		if ingame_package_name then
			GlobalResources[#GlobalResources + 1] = ingame_package_name
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
	local restrictions = {
		{
			country = "at",
			age = 18
		},
		{
			country = "bh",
			age = 18
		},
		{
			country = "be",
			age = 18
		},
		{
			country = "bg",
			age = 18
		},
		{
			country = "hr",
			age = 18
		},
		{
			country = "cy",
			age = 18
		},
		{
			country = "cz",
			age = 18
		},
		{
			country = "dk",
			age = 18
		},
		{
			country = "fi",
			age = 18
		},
		{
			country = "fr",
			age = 18
		},
		{
			country = "gr",
			age = 18
		},
		{
			country = "hu",
			age = 18
		},
		{
			country = "is",
			age = 18
		},
		{
			country = "in",
			age = 18
		},
		{
			country = "ie",
			age = 18
		},
		{
			country = "il",
			age = 18
		},
		{
			country = "it",
			age = 18
		},
		{
			country = "kw",
			age = 18
		},
		{
			country = "lb",
			age = 18
		},
		{
			country = "lu",
			age = 18
		},
		{
			country = "mt",
			age = 18
		},
		{
			country = "nl",
			age = 18
		},
		{
			country = "no",
			age = 18
		},
		{
			country = "om",
			age = 18
		},
		{
			country = "pl",
			age = 18
		},
		{
			country = "pt",
			age = 18
		},
		{
			country = "qa",
			age = 18
		},
		{
			country = "ro",
			age = 18
		},
		{
			country = "sa",
			age = 18
		},
		{
			country = "sk",
			age = 18
		},
		{
			country = "si",
			age = 18
		},
		{
			country = "za",
			age = 18
		},
		{
			country = "es",
			age = 18
		},
		{
			country = "se",
			age = 18
		},
		{
			country = "ch",
			age = 18
		},
		{
			country = "tr",
			age = 18
		},
		{
			country = "ua",
			age = 18
		},
		{
			country = "ae",
			age = 18
		},
		{
			country = "gb",
			age = 18
		},
		{
			country = "de",
			age = 18
		},
		{
			country = "ar",
			age = 17
		},
		{
			country = "bo",
			age = 17
		},
		{
			country = "br",
			age = 17
		},
		{
			country = "ca",
			age = 17
		},
		{
			country = "cl",
			age = 17
		},
		{
			country = "co",
			age = 17
		},
		{
			country = "cr",
			age = 17
		},
		{
			country = "ec",
			age = 17
		},
		{
			country = "sv",
			age = 17
		},
		{
			country = "gt",
			age = 17
		},
		{
			country = "hn",
			age = 17
		},
		{
			country = "mx",
			age = 17
		},
		{
			country = "ni",
			age = 17
		},
		{
			country = "pa",
			age = 17
		},
		{
			country = "py",
			age = 17
		},
		{
			country = "pe",
			age = 17
		},
		{
			country = "us",
			age = 17
		},
		{
			country = "uy",
			age = 17
		},
		{
			country = "au",
			age = 15
		},
		{
			country = "nz",
			age = 16
		},
		{
			country = "tw",
			age = 15
		},
		{
			country = "ru",
			age = 18
		}
	}

	NpCheck.set_content_restriction(18, restrictions)
end

Game.require_game_scripts = function (self)
	game_require("utils", "patches", "colors", "framerate", "global_utils", "function_call_stats", "loaded_dice", "deadlock_stack", "benchmark/benchmark_handler")
	game_require("settings", "version_settings")
	game_require("ui", "views/show_cursor_stack", "ui_fonts")
	game_require("settings", "demo_settings", "motion_control_settings", "game_settings_development", "controller_settings", "default_user_settings")
	game_require("entity_system", "entity_system")
	game_require("game_state", "game_state_machine", "state_context", "state_splash_screen", "state_loading", "state_ingame", "state_demo_end")
	game_require("managers", "admin/admin_manager", "news_ticker/news_ticker_manager", "player/player_manager", "player/player_bot", "save/save_manager", "save/save_data", "perfhud/perfhud_manager", "music/music_manager", "network/party_manager", "network/lobby_manager", "transition/transition_manager", "debug/updator", "invite/invite_manager", "unlock/unlock_manager", "popup/popup_manager", "popup/simple_popup", "light_fx/light_fx_manager", "razer_chroma/razer_chroma_manager", "play_go/play_go_manager", "controller_features/controller_features_manager", "deed/deed_manager", "boon/boon_manager", "telemetry/telemetry_manager", "telemetry/telemetry_events", "telemetry/telemetry_reporters", "load_time/load_time_manager", "game_mode/game_mechanism_manager", "ui/ui_manager", "weave/weave_manager")

	if IS_WINDOWS then
		game_require("managers", "irc/irc_manager", "curl/curl_manager", "curl/curl_token", "twitch/twitch_manager")

		if rawget(_G, "Steam") then
			game_require("managers", "steam/steam_manager")
		end
	elseif IS_XB1 then
		game_require("managers", "events/xbox_event_manager", "rest_transport/rest_transport_manager", "twitch/twitch_manager", "irc/irc_manager")
	elseif IS_PS4 then
		game_require("managers", "irc/irc_manager", "twitch/twitch_manager", "rest_transport/rest_transport_manager", "system_dialog/system_dialog_manager")
	elseif IS_LINUX then
		game_require("managers", "irc/irc_manager", "curl/curl_manager", "curl/curl_token", "twitch/twitch_manager")
	elseif IS_LINUX then
		game_require("managers", "irc/irc_manager", "curl/curl_manager", "curl/curl_token", "twitch/twitch_manager")
	end

	game_require("helpers", "effect_helper", "weapon_helper", "item_helper", "lorebook_helper", "ui_atlas_helper", "scoreboard_helper")
	game_require("network", "unit_spawner", "unit_storage", "network_unit")
	self:_init_localization_manager()
	require("scripts/ui/views/ingame_ui")
	require("scripts/ui/views/level_end/level_end_view_wrapper")
	require("scripts/ui/views/title_loading_ui")
	require("scripts/network_lookup/network_lookup")
	require("scripts/tests/test_cases")
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
	local seed = os.clock() * 10000 % 1000

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

	if IS_XB1 then
		self:_init_backend_xbox()
	elseif IS_PS4 then
		self:_init_backend_ps4()
	else
		self:_init_backend()
	end

	Managers.admin = AdminManager:new()
	Managers.perfhud = PerfhudManager:new()
	Managers.updator = Updator:new()
	Managers.music = MusicManager:new()
	Managers.transition = TransitionManager:new()
	Managers.play_go = PlayGoManager:new()

	if IS_WINDOWS then
		Managers.irc = IRCManager:new()

		if not Managers.curl then
			Managers.curl = CurlManager:new()
		end

		Managers.twitch = TwitchManager:new()
		Managers.unlock = UnlockManager:new()

		if rawget(_G, "Steam") then
			Managers.steam = SteamManager:new()
		end
	elseif IS_XB1 then
		Managers.xbox_events = XboxEventManager:new()
		Managers.rest_transport_online = RestTransportManager:new()
		Managers.rest_transport = Managers.rest_transport_online

		if GameSettingsDevelopment.twitch_enabled then
			Managers.twitch = TwitchManager:new()
			Managers.irc = IRCManager:new()
		end
	elseif IS_PS4 then
		Managers.rest_transport_online = RestTransportManager:new()
		Managers.rest_transport = Managers.rest_transport_online
		Managers.system_dialog = SystemDialogManager:new()
		Managers.irc = IRCManager:new()
		Managers.twitch = TwitchManager:new()
	elseif IS_LINUX then
		Managers.irc = IRCManager:new()

		if not Managers.curl then
			Managers.curl = CurlManager:new()
		end

		Managers.twitch = TwitchManager:new()
		Managers.unlock = UnlockManager:new()
	end

	Managers.ui = UIManager:new()
	Managers.weave = WeaveManager:new()
	Managers.telemetry = TelemetryManager.create()
	Managers.telemetry_events = TelemetryEvents:new(Managers.telemetry)
	Managers.telemetry_reporters = TelemetryReporters:new()
	Managers.player = PlayerManager:new()
	Managers.free_flight = FreeFlightManager:new()
	Managers.invite = InviteManager:new()
	Managers.news_ticker = NewsTickerManager:new()
	Managers.light_fx = LightFXManager:new()
	Managers.razer_chroma = RazerChromaManager:new()
	Managers.party = PartyManager:new()
	Managers.deed = DeedManager:new()
	Managers.boon = BoonManager:new()
	Managers.load_time = LoadTimeManager:new()
	Managers.level_transition_handler = LevelTransitionHandler:new()
	Managers.mechanism = GameMechanismManager:new()
	Managers.lobby = LobbyManager:new()

	if GameSettingsDevelopment.use_leaderboards or Development.parameter("use_leaderboards") then
		Managers.leaderboards = LeaderboardManager:new()
	end

	local empty_table = {}

	for dlc_name, dlc in pairs(DLCSettings) do
		local manager_settings = dlc.manager_settings or empty_table

		for manager_name, manager_data in pairs(manager_settings) do
			Managers[manager_name] = rawget(_G, manager_data.klass):new()
		end
	end
end

Game._init_backend = function (self)
	local backend, mirror = nil

	if DEDICATED_SERVER then
		backend = "ScriptBackendPlayFabDedicated"
		mirror = "PlayFabMirrorDedicated"
	else
		local mechanism_name = Development.parameter("mechanism") or SaveData.last_mechanism or "adventure"
		local mechanism_settings = MechanismSettings[mechanism_name]
		backend = "ScriptBackendPlayFab"
		local playfab_mirror = mechanism_settings and mechanism_settings.playfab_mirror
		mirror = playfab_mirror and playfab_mirror or "PlayFabMirrorAdventure"
	end

	Managers.backend = BackendManagerPlayFab:new(backend, mirror, "DataServerQueue")
end

Game._init_backend_xbox = function (self)
	local backend = "ScriptBackendPlayFabXbox"
	local mechanism_name = Development.parameter("mechanism") or SaveData.last_mechanism or "adventure"
	local mechanism_settings = MechanismSettings[mechanism_name]
	local playfab_mirror = mechanism_settings and mechanism_settings.playfab_mirror
	local mirror = playfab_mirror or "PlayFabMirrorAdventure"
	Managers.backend = BackendManagerPlayFab:new(backend, mirror, "DataServerQueue")
end

Game._init_backend_ps4 = function (self)
	local backend = "ScriptBackendPlayFabPS4"
	local mechanism_name = Development.parameter("mechanism") or SaveData.last_mechanism or "adventure"
	local mechanism_settings = MechanismSettings[mechanism_name]
	local playfab_mirror = mechanism_settings and mechanism_settings.playfab_mirror
	local mirror = playfab_mirror or "PlayFabMirrorAdventure"
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
	Managers.localizer = LocalizationManager:new()

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

	for i = 1, #args do
		if args[i] == "safe-mode" then
			Game.safe_mode = true

			assert(false)
		end
	end

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
		local ingame_package = LEVEL_EDITOR_TEST and "resource_packages/ingame_light" or "resource_packages/ingame"

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
