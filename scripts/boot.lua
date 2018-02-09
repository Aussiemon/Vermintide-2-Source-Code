jit.off()

MODE = {}

dofile("foundation/scripts/boot/boot")

local BUILD = BUILD
local PLATFORM = PLATFORM
LAUNCH_MODE = LAUNCH_MODE or "game"
local args = {
	Application.argv()
}

for _, arg in pairs(args) do
	if arg == "-attract-mode" then
		LAUNCH_MODE = "attract"

		break
	end

	if arg == "-benchmark-mode" then
		LAUNCH_MODE = "attract_benchmark"

		break
	end
end

GlobalResources = GlobalResources or {
	"resource_packages/common_level_resources",
	"resource_packages/menu_assets_common",
	"resource_packages/ingame_sounds_one",
	"resource_packages/ingame_sounds_two",
	"resource_packages/ingame_sounds_three",
	"resource_packages/ingame_sounds_weapon_general",
	"resource_packages/ingame_sounds_enemy_clan_rat_vce",
	"resource_packages/ingame_sounds_player_foley_common",
	"resource_packages/ingame_sounds_hud_dice_game",
	"resource_packages/ingame_sounds_general_props",
	"resource_packages/ingame_sounds_honduras",
	"resource_packages/inventory",
	"resource_packages/decals",
	"resource_packages/levels/ui_loot_preview",
	"resource_packages/levels/ui_end_screen",
	"resource_packages/levels/ui_end_screen_defeat",
	"resource_packages/levels/ui_end_screen_win",
	"resource_packages/levels/ui_inventory_preview",
	"resource_packages/ingame",
	"resource_packages/pickups",
	"resource_packages/projection_decals",
	"resource_packages/levels/ui_character_selection"
}

if LEVEL_EDITOR_TEST then
	GlobalResources = {
		"resource_packages/menu_assets_common",
		"resource_packages/ingame_light",
		"resource_packages/projection_decals",
		"resource_packages/inventory",
		"resource_packages/pickups",
		"resource_packages/decals",
		"resource_packages/common_level_resources",
		"resource_packages/levels/ui_loot_preview",
		"resource_packages/levels/ui_end_screen",
		"resource_packages/levels/ui_end_screen_defeat",
		"resource_packages/levels/ui_end_screen_win",
		"resource_packages/levels/ui_inventory_preview",
		"resource_packages/levels/ui_character_selection"
	}
end

Boot.foundation_update = Boot.foundation_update or Boot.update
Boot.foundation_shutdown = Boot.foundation_shutdown or Boot.shutdown
Boot.flow_return_table = Script.new_map(32)

function force_render(dt)
	if Managers.transition then
		Managers.transition:force_render(dt)
	end

	render()

	return 
end

Boot.update = function (self, dt)
	if PlayerUnitLocomotionExtension then
		PlayerUnitLocomotionExtension.set_new_frame()
	end

	if Managers.mod then
		Managers.mod:update(dt)
	end

	UPDATE_RESOLUTION_LOOKUP()
	Managers.perfhud:update(dt)
	Managers.debug_updator:update(dt)
	Boot:foundation_update(dt)
	Managers.curl:update(true)
	Managers.irc:update(dt)
	Managers.twitch:update(dt)
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

	if Managers.beta_overlay then
		Managers.beta_overlay:update(dt)
	end

	if (BUILD == "dev" or BUILD == "debug") and SynergyMouse.connected() then
		print("[Boot] SynergyMouse enabled")
	end

	end_function_call_collection()
	table.clear(Boot.flow_return_table)

	return 
end
Boot.shutdown = function (self, dt)
	if Bulldozer.rift then
		Oculus.destroy_device(Bulldozer.rift_info.hmd_device)
	end

	Boot:foundation_shutdown()

	return 
end
Bulldozer = Bulldozer or {}

function project_setup()
	Bulldozer:setup()

	return Bulldozer.entrypoint()
end

Bulldozer.setup = function (self)
	self._patch_demo_functions(self)
	self._init_localizer(self)

	script_data.settings = Application.settings()
	script_data.build_identifier = Application.build_identifier()
	local content_revision = script_data.settings.content_revision
	local no_revision = content_revision == nil or content_revision == ""
	local trunk_path = Development.parameter("trunk_path")

	if no_revision and trunk_path then
		local path = Path.path_from_string(trunk_path)

		Path.add_path_part(path, "update_scripts")

		local svn_info_path = Path.copy(path)

		Path.add_path_part(svn_info_path, "svn_info.txt")

		svn_info_path = Path.tostring(svn_info_path, "\\")

		os.remove(svn_info_path)

		local script_path = Path.copy(path)

		Path.add_path_part(script_path, "get_svn_revision.bat")

		script_path = Path.tostring(script_path)
		path = Path.tostring(path)
		local command = string.format("start \"\" /min cmd /c call \"%s\" \"%s/.\" \"%s\"", script_path, trunk_path, svn_info_path)

		print(command)

		local execute_result = os.execute(command)

		if execute_result ~= 0 then
			print("[Boot] Could not execute command, result ", tostring(execute_result))
		end

		local t0 = os.clock()

		while os.clock() - t0 <= 1 do
		end

		local svn_info_file = io.open(svn_info_path, "r")

		if svn_info_file then
			io.input(svn_info_file)

			while true do
				local svn_info_line = io.read()

				if svn_info_line == nil then
					break
				end

				local find_start, find_end = svn_info_line.find(svn_info_line, "Revision: ")

				if find_start and find_end then
					local svn_revision = svn_info_line.sub(svn_info_line, find_end + 1)
					script_data.settings.content_revision = svn_revision

					break
				end
			end

			io.close(svn_info_file)
		else
			print("[Boot] Could not open ", svn_info_path)
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
	self._require_scripts(self)

	if Development.parameter("paste_revision_to_clipboard") then
		Clipboard.put(string.format("%s | %s", tostring(script_data.settings.content_revision), tostring(script_data.build_identifier)))
	end

	local non_rendering_dedicated_server = Application.is_dedicated_server()

	if not non_rendering_dedicated_server then
		self._handle_graphics_quality(self)
	end

	DefaultUserSettings.set_default_user_settings()
	Application.set_time_step_policy("no_smoothing")
	self._load_user_settings(self)

	if Development.parameter("network_log_spew") then
		Network.log(Network.SPEW)
	elseif Development.parameter("network_log_messages") then
		Network.log(Network.MESSAGES)
	end

	Application.set_time_step_policy("external_step_range", 0, 100)
	Application.set_time_step_policy("system_step_range", 0, 100)

	if Development.parameter("disable_long_timesteps") then
		Application.set_time_step_policy("external_step_range", 0, 0.2)
		Application.set_time_step_policy("system_step_range", 0, 0.2)
	end

	if GameSettingsDevelopment.remove_debug_stuff then
		DebugHelper.remove_debug_stuff()
	end

	if script_data.settings.physics_dump then
		DebugHelper.enable_physics_dump()
	end

	self._init_random(self)
	self._init_mouse(self)
	self._init_managers(self)

	if rawget(_G, "Steam") then
		print("[Boot] User ID:", Steam.user_id(), Steam.user_name())
	end

	local is_dev_debug = BUILD == "dev" or BUILD == "debug"

	if is_dev_debug and Development.parameter("synergy") then
		print("[Boot] Connecting to Synergy")

		local resx, resy = Application.resolution()
		local synergy_setting_name = Development.parameter("synergy")
		local synergy_settings = SynergySettings.user_settings[synergy_setting_name]

		Synergy.connect(synergy_settings.ip, synergy_settings.client_name, resx, resy)
	end

	if is_dev_debug then
		Window.set_resizable(true)
	else
		Window.set_resizable(false)
	end

	return 
end
Bulldozer._require_scripts = function (self)
	local function core_require(path, ...)
		for _, s in ipairs({
			...
		}) do
			require("core/" .. path .. "/" .. s)
		end

		return 
	end

	local function game_require(path, ...)
		for _, s in ipairs({
			...
		}) do
			require("scripts/" .. path .. "/" .. s)
		end

		return 
	end

	local function foundation_require(path, ...)
		for _, s in ipairs({
			...
		}) do
			require("foundation/scripts/" .. path .. "/" .. s)
		end

		return 
	end

	local start = os.clock()

	Managers.package:load("resource_packages/foundation_scripts", "boot")
	Application.warning(string.format("foundation_scripts load time: %f", tostring(os.clock() - start)))

	local start = os.clock()

	Managers.package:load("resource_packages/game_scripts", "boot")
	Application.warning(string.format("game_scripts load time: %f", tostring(os.clock() - start)))

	local start = os.clock()

	Managers.package:load("backend/local_backend/local_backend", "boot")
	Application.warning(string.format("local_backend load time: %f", tostring(os.clock() - start)))

	local start = os.clock()

	Managers.package:load("resource_packages/level_scripts", "boot")
	Application.warning(string.format("level_scripts load time: %f", tostring(os.clock() - start)))
	foundation_require("managers", "localization/localization_manager", "event/event_manager")
	foundation_require("util", "local_require")
	game_require("utils", "assert", "patches", "colors", "random_table", "global_utils", "function_call_stats", "util", "loaded_dice", "script_application", "benchmark/benchmark_handler")
	game_require("ui", "views/show_cursor_stack", "ui_fonts")
	game_require("settings", "demo_settings", "game_settings_development", "controller_settings", "default_user_settings", "synergy_settings")
	game_require("entity_system", "entity_system")
	game_require("game_state", "state_context", "state_splash_screen", "state_loading", "state_ingame", "state_demo_end")
	game_require("managers", "admin/admin_manager", "news_ticker/news_ticker_manager", "player/player_manager", "player/player_bot", "save/save_manager", "save/save_data", "perfhud/perfhud_manager", "music/music_manager", "network/party_manager", "transition/transition_manager", "smoketest/smoketest_manager", "debug/updator", "invite/invite_manager", "unlock/unlock_manager", "popup/popup_manager", "popup/simple_popup", "light_fx/light_fx_manager", "play_go/play_go_manager", "controller_features/controller_features_manager", "mod/mod_manager", "irc/irc_manager", "curl/curl_manager", "twitch/twitch_manager", "mutators/mutator_manager", "deed/deed_manager", "eac/eac_manager", "telemetry/telemetry_create")
	game_require("helpers", "effect_helper", "weapon_helper", "item_helper", "lorebook_helper", "ui_atlas_helper", "scoreboard_helper")
	game_require("network", "unit_spawner", "unit_storage", "network_unit")

	return 
end
Bulldozer._handle_graphics_quality = function (self)
	local graphics_quality = Application.user_setting("graphics_quality")

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
				Application.set_user_setting("texture_settings", texture_setting.texture_setting, texture_setting.mip_level)
			end
		elseif setting == "env_texture_quality" then
			local texture_settings = TextureQuality.environment[value]

			for i, texture_setting in ipairs(texture_settings) do
				Application.set_user_setting("texture_settings", texture_setting.texture_setting, texture_setting.mip_level)
			end
		elseif setting == "local_light_shadow_quality" then
			local local_light_shadow_quality_settings = LocalLightShadowQuality[value]

			for render_setting, key in pairs(local_light_shadow_quality_settings) do
				Application.set_user_setting("render_settings", render_setting, key)
			end
		elseif setting == "particles_quality" then
			local particle_quality_settings = ParticlesQuality[value]

			for render_setting, key in pairs(particle_quality_settings) do
				Application.set_user_setting("render_settings", render_setting, key)
			end
		elseif setting == "sun_shadow_quality" then
			local sun_shadow_quality_settings = SunShadowQuality[value]

			for render_setting, key in pairs(sun_shadow_quality_settings) do
				Application.set_user_setting("render_settings", render_setting, key)
			end
		elseif setting == "volumetric_fog_quality" then
			local volumetric_fog_quality_settings = VolumetricFogQuality[value]

			for render_setting, key in pairs(volumetric_fog_quality_settings) do
				Application.set_user_setting("render_settings", render_setting, key)
			end
		elseif setting == "ambient_light_quality" then
			local ambient_light_quality_settings = AmbientLightQuality[value]

			for render_setting, key in pairs(ambient_light_quality_settings) do
				Application.set_user_setting("render_settings", render_setting, key)
			end
		elseif setting == "ao_quality" then
			local ao_quality_settings = AmbientOcclusionQuality[value]

			for render_setting, key in pairs(ao_quality_settings) do
				Application.set_user_setting("render_settings", render_setting, key)
			end
		end

		Application.set_user_setting(setting, value)
	end

	local render_settings = settings.render_settings

	for setting, value in pairs(render_settings) do
		Application.set_user_setting("render_settings", setting, value)
	end

	Application.apply_user_settings()
	Application.save_user_settings()

	return 
end
Bulldozer._init_random = function (self)
	local seed = (os.clock()*10000)%1000

	math.randomseed(seed)
	math.random(5, 30000)

	return 
end
Bulldozer._init_mouse = function (self)
	Window.set_cursor("gui/cursors/mouse_cursor")
	Window.set_clip_cursor(true)

	return 
end
Bulldozer._init_managers = function (self)
	self._init_localization_manager(self)
	require("scripts/ui/views/ingame_ui")
	require("scripts/ui/views/level_end/level_end_view")
	require("scripts/ui/views/title_loading_ui")
	require("scripts/network_lookup/network_lookup")
	parse_item_master_list()

	Managers.save = SaveManager:new(script_data.settings.disable_cloud_save)

	self._init_backend(self)

	if PLATFORM ~= "win32" then
		Managers.splitscreen = SplitscreenTester:new()
	end

	Managers.admin = AdminManager:new()
	Managers.perfhud = PerfhudManager:new()
	Managers.debug_updator = Updator:new()
	Managers.music = MusicManager:new()
	Managers.transition = TransitionManager:new()
	Managers.play_go = PlayGoManager:new()
	Managers.irc = IRCManager:new()
	Managers.curl = CurlManager:new()
	Managers.twitch = TwitchManager:new()
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
	Managers.unlock = UnlockManager:new()

	if PLATFORM == "win32" and rawget(_G, "Steam") then
		Managers.mod = ModManager:new()
	end

	if GameSettingsDevelopment.use_leaderboards or Development.parameter("use_leaderboards") then
		Managers.leaderboards = LeaderboardManager:new()
	end

	return 
end
Bulldozer._init_backend = function (self)
	local backend = "ScriptBackendPlayFab"
	local mirror = "PlayFabMirror"

	if DEDICATED_SERVER then
		backend = "ScriptBackendPlayFabDedicated"
		mirror = "PlayFabMirrorDedicated"
	end

	Managers.backend = BackendManagerPlayFab:new(backend, mirror, "DataServerQueue")

	return 
end
Bulldozer._load_user_settings = function (self)
	if PLATFORM ~= "win32" then
		return 
	end

	local max_fps = Application.user_setting("max_fps")

	if max_fps then
		if max_fps == 0 then
			Application.set_time_step_policy("no_throttle")
		else
			Application.set_time_step_policy("throttle", max_fps)
		end
	end

	local max_frames = Application.win32_user_setting("max_stacking_frames")

	if max_frames then
		Application.set_max_frame_stacking(max_frames)
	end

	return 
end
Bulldozer._patch_demo_functions = function (self)
	if Development.parameter("honduras_demo") then
		Application.save_user_settings = function ()
			return 
		end
	end

	return 
end
Bulldozer._init_localizer = function (self)
	local has_steam = rawget(_G, "Steam")
	local language_id = Application.user_setting("language_id") or (has_steam and Steam:language()) or "en"

	Application.set_resource_property_preference_order(language_id)

	local start = os.clock()

	Managers.package:load("resource_packages/post_localization_boot", "boot")
	Application.warning(string.format("post_localization_boot load time: %f", tostring(os.clock() - start)))

	local start = os.clock()

	Managers.package:load("resource_packages/strings", "boot")
	Application.warning(string.format("strings load time: %f", tostring(os.clock() - start)))

	return 
end
Bulldozer._init_localization_manager = function (self)
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

		local key = input_service.get_keymapping(input_service, key_name)

		fassert(key, "[key_parser] There is no such key: %s in input service: %s", key_name, input_service_name)

		local key_locale_name = nil

		for j = 1, key.n, 3 do
			local device_type = key[j]
			local button_index = key[j + 1]

			if Managers.input:is_device_active("keyboard") or Managers.input:is_device_active("mouse") then
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

	return 
end
Bulldozer.rift_start = function (self)
	local hmd_device = Oculus.create_device()
	local info = Oculus.hmd_info(hmd_device)
	Bulldozer.rift_info = info
	info.hmd_device = hmd_device
	local horizontal_shift = info.horizontal_screen_size*0.25 - info.lens_separation_distance*0.5
	local projection_center_offset = (horizontal_shift*4)/info.horizontal_screen_size
	Bulldozer.left_projection_transform = Matrix4x4Box(Matrix4x4.from_translation(Vector3(projection_center_offset, 0, 0)))
	Bulldozer.right_projection_transform = Matrix4x4Box(Matrix4x4.from_translation(Vector3(-projection_center_offset, 0, 0)))
	Bulldozer.half_eye_shift = info.interpupillary_distance*0.5*info.horizontal_screen_size*0.25
	Bulldozer.left_lens_center = Vector3Box(info.lens_separation_distance*2*info.horizontal_screen_size - 1, 0.5)
	Bulldozer.right_lens_center = Vector3Box(info.lens_separation_distance*2*info.horizontal_screen_size - 1, 0.5)

	return 
end
Bulldozer.entrypoint = function (self)
	local args = {
		Application.argv()
	}
	Bulldozer.rift = false

	for i = 1, #args, 1 do
		if args[i] == "-rift" then
			Bulldozer.rift = true
		elseif args[i] == "safe-mode" then
			Bulldozer.safe_mode = true

			assert(false)
		end
	end

	if Bulldozer.rift then
		Bulldozer.rift_start()
	end

	local start = os.clock()

	Managers.package:load("resource_packages/levels/debug_levels", "boot")
	Application.warning(string.format("debug_levels load time: %f", tostring(os.clock() - start)))

	local start = os.clock()

	Managers.package:load("resource_packages/levels/benchmark_levels", "boot")
	Application.warning(string.format("benchmark_levels load time: %f", tostring(os.clock() - start)))

	local start = os.clock()

	print("WARNING: temporarily load honduras and dwarf packages from boot.")
	Managers.package:load("resource_packages/levels/honduras_levels", "boot")
	Application.warning(string.format("honduras_levels load time: %f", tostring(os.clock() - start)))

	script_data.use_optimized_breed_units = false
	local breed_package = (script_data.use_optimized_breed_units and "resource_packages/ingame_breeds_optimized") or "resource_packages/ingame_breeds"

	print("[Boot] use baked enemy meshes:", script_data.use_optimized_breed_units, " package: ", breed_package)

	if GameSettingsDevelopment.start_state == "dedicated_server" then
		Managers.package:load("resource_packages/menu", "boot")
		Managers.package:load("resource_packages/menu_assets_common", "global")
		Managers.package:load("resource_packages/ingame", "global")
		Managers.package:load(breed_package, "global")
		Managers.package:load("resource_packages/inventory", "global")
		Managers.package:load("resource_packages/pickups", "global")
		Managers.package:load("resource_packages/decals", "global")
		Managers.package:load("resource_packages/common_level_resources", "global")
		Managers.package:load("resource_packages/platform_specific/platform_specific", "boot")

		Boot.loading_context = {}

		require("scripts/game_state/state_dedicated_server")

		return StateDedicatedServer
	elseif GameSettingsDevelopment.start_state == "game" then
		local ingame_package = (LEVEL_EDITOR_TEST and "resource_packages/ingame_light") or "resource_packages/ingame"

		Managers.package:load("resource_packages/menu", "boot")
		Managers.package:load("resource_packages/menu_assets_common", "global")
		Managers.package:load(ingame_package, "global")
		Managers.package:load(breed_package, "global")
		Managers.package:load("resource_packages/inventory", "global")
		Managers.package:load("resource_packages/pickups", "global")
		Managers.package:load("resource_packages/decals", "global")
		Managers.package:load("resource_packages/common_level_resources", "global")

		local level_key = GameSettingsDevelopment.quicklaunch_params.level_key
		Boot.loading_context = {
			level_key = level_key
		}

		require("scripts/game_state/state_splash_screen")

		return StateSplashScreen
	elseif GameSettingsDevelopment.start_state == "menu" then
		Boot.loading_context = {
			show_splash_screens = true
		}

		Managers.package:load(breed_package, "global", nil, true)

		GlobalResources[#GlobalResources + 1] = breed_package

		if Development.parameter("honduras_demo") then
			local key_combinations_allowed = DemoSettings.key_combinations_allowed

			for key, enabled in pairs(key_combinations_allowed) do
				Window.set_keystroke_enabled(key, enabled)
			end
		end

		require("scripts/game_state/state_splash_screen")

		return StateSplashScreen
	end

	return StateSplashScreen
end
script_data = script_data or {}
__dgaa = 11.59

return 
