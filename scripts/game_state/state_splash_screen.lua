-- chunkname: @scripts/game_state/state_splash_screen.lua

if IS_WINDOWS then
	require("scripts/managers/input/input_manager")
	require("scripts/utils/visual_assert_log")
	require("scripts/managers/debug/debug")
end

require("foundation/scripts/util/garbage_leak_detector")

StateSplashScreen = class(StateSplashScreen)
StateSplashScreen.NAME = "StateSplashScreen"
StateSplashScreen.packages_to_load = {
	"resource_packages/title_screen",
	"resource_packages/menu",
	"resource_packages/platform_specific/platform_specific",
	"resource_packages/menu_assets",
	"resource_packages/loading_screens/loading_screen_default",
}

if not IS_WINDOWS then
	StateSplashScreen.packages_to_load[#StateSplashScreen.packages_to_load + 1] = "resource_packages/news_splash/news_splash"
end

StateSplashScreen.on_enter = function (self)
	Framerate.set_low_power()

	if IS_WINDOWS then
		local assert_on_leak = true

		GarbageLeakDetector.run_leak_detection(assert_on_leak)
		GarbageLeakDetector.register_object(self, "StateSplashScreen")
		VisualAssertLog.setup(nil)
	end

	if script_data.honduras_demo then
		table.insert(StateSplashScreen.packages_to_load, 1, DemoSettings.level_resource_package)
		table.insert(StateSplashScreen.packages_to_load, 1, DemoSettings.inventory_resource_package)
		table.insert(StateSplashScreen.packages_to_load, 1, "resource_packages/ingame_sounds_one")
		table.insert(StateSplashScreen.packages_to_load, 1, "resource_packages/ingame_sounds_two")
		table.insert(StateSplashScreen.packages_to_load, 1, "resource_packages/ingame_sounds_three")
		table.insert(StateSplashScreen.packages_to_load, 1, "resource_packages/ingame_sounds_weapon_general")
		table.insert(StateSplashScreen.packages_to_load, 1, "resource_packages/ingame_sounds_enemy_clan_rat_vce")
		table.insert(StateSplashScreen.packages_to_load, 1, "resource_packages/ingame_sounds_player_foley_common")
		table.insert(StateSplashScreen.packages_to_load, 1, "resource_packages/ingame_sounds_hud_dice_game")
		table.insert(StateSplashScreen.packages_to_load, 1, "resource_packages/ingame_sounds_general_props")
		table.insert(StateSplashScreen.packages_to_load, 1, "resource_packages/ingame_sounds_honduras")
	end

	Managers.transition:force_fade_in()
	Managers.transition:show_loading_icon(false)
	self:setup_world()

	if IS_WINDOWS or IS_XB1 then
		self:setup_input()
	end

	if IS_WINDOWS then
		Managers.package:load("resource_packages/start_menu_splash", "StateSplashScreen", callback(self, "cb_splashes_loaded"), true, true)
	elseif IS_PS4 then
		if PS4.title_id() == "CUSA14407_00" or PS4.title_id() == "CUSA13595_00" then
			self:setup_esrb_logo()
		else
			Managers.package:load("resource_packages/start_menu_splash", "StateSplashScreen", callback(self, "cb_splashes_loaded"), true, true)
		end
	elseif IS_XB1 then
		if self:_is_in_esrb_region() then
			self:setup_esrb_logo()
		else
			Managers.package:load("resource_packages/start_menu_splash", "StateSplashScreen", callback(self, "cb_splashes_loaded"), true, true)
		end
	end

	if Managers.popup then
		Managers.popup:destroy()

		Managers.popup = nil
	end

	local loading_context = self.parent.loading_context

	if loading_context.reload_packages then
		self:unload_packages()
	end

	self:load_packages()
	Managers.transition:fade_out(1)

	if LEVEL_EDITOR_TEST then
		self._skip_splash = true
	else
		local skip_splash_screen_parameters = {
			"auto_host_level",
			"auto_join",
			"vs_auto_search",
			"skip_splash",
			"attract_mode",
			"benchmark_mode",
			"weave_name",
		}

		for i = 1, #skip_splash_screen_parameters do
			local parameter = skip_splash_screen_parameters[i]

			if Development.parameter(parameter) then
				self._skip_splash = true

				break
			end
		end
	end

	local args = {
		Application.argv(),
	}

	for i = 1, #args do
		local arg = args[i]

		if arg == "-skip-splash" then
			self._skip_splash = true

			break
		end
	end

	if IS_WINDOWS and not self._skip_splash then
		loading_context.first_time = true
	end

	self.parent.loading_context.show_profile_on_startup = true
end

local esrb_regions = {
	CA = true,
	MX = true,
	US = true,
}

StateSplashScreen._is_in_esrb_region = function (self)
	local region_info = XboxLive.region_info()
	local iso2 = region_info.GEO_ISO2

	return esrb_regions[iso2]
end

StateSplashScreen.setup_esrb_logo = function (self)
	self.gui = World.create_screen_gui(self.world, "material", "materials/ui/esrb_console_logo", "immediate")

	Managers.package:load("resource_packages/start_menu_splash", "StateSplashScreen", callback(self, "cb_splashes_loaded"), true, true)

	self.showing_esrb = true
	self.esrb_timer = 0
end

StateSplashScreen.update_esrb_logo = function (self, dt, t)
	local total_time = 5
	local timer = self.esrb_timer
	local alpha = 0
	local size = {
		1200,
		576,
	}
	local bitmap_name = "esrb_logo"

	if timer > total_time - 0.5 then
		alpha = 255 - 255 * math.clamp((total_time - timer) / 0.5, 0, 1)
	elseif timer <= 0.5 then
		alpha = 255 * math.clamp(1 - timer / 0.5, 0, 255)
	end

	local w, h = Application.resolution()

	Gui.rect(self.gui, Vector3(0, 0, 0), Vector2(w, h), Color(255, 0, 0, 0))
	Gui.bitmap(self.gui, bitmap_name, Vector3(w * 0.5 - size[1] * 0.5, h * 0.5 - size[2] * 0.5, 1), Vector2(size[1], size[2]))
	Gui.rect(self.gui, Vector3(0, 0, 2), Vector2(w, h), Color(alpha, 0, 0, 0))

	self.esrb_timer = math.clamp(self.esrb_timer + math.clamp(dt, 0, 0.1), 0, total_time)

	if total_time <= self.esrb_timer and self.splashes_loaded then
		self:setup_splash_screen_view()
		Managers.transition:force_fade_in()
	end
end

StateSplashScreen.cb_splashes_loaded = function (self)
	self.splashes_loaded = true

	if not self.showing_esrb then
		self:setup_splash_screen_view()
	end
end

StateSplashScreen.setup_world = function (self)
	self._world_name = "splash_ui"
	self._viewport_name = "splash_view_viewport"
	self.world = Managers.world:create_world(self._world_name, GameSettingsDevelopment.default_environment, nil, 980, Application.DISABLE_PHYSICS, Application.DISABLE_APEX_CLOTH)
	self.viewport = ScriptWorld.create_viewport(self.world, self._viewport_name, "overlay", 1)
end

if IS_WINDOWS or IS_XB1 then
	StateSplashScreen.setup_input = function (self)
		self.input_manager = InputManager:new()
		Managers.input = self.input_manager

		self.input_manager:initialize_device("keyboard", 1)
		self.input_manager:initialize_device("mouse", 1)
		self.input_manager:initialize_device("gamepad")
	end
end

StateSplashScreen.setup_splash_screen_view = function (self)
	if not Managers.package:has_loaded("resource_packages/start_menu_splash", "StateSplashScreen") then
		local old_time = os.clock()

		print("Stall loading splash screen", old_time)
		Managers.package:load("resource_packages/start_menu_splash", "StateSplashScreen")
		print("done stall loading splash screen", os.clock() - old_time)
	end

	require("scripts/ui/views/splash_view")

	self.splash_view = SplashView:new(self.input_manager, self.world)

	if self.parent.loading_context.show_splash_screens then
		self.parent.loading_context.show_splash_screens = false
	else
		self.splash_view:set_index(4)
	end
end

StateSplashScreen.update = function (self, dt, t)
	if not IS_CONSOLE then
		Debug.update(t, dt)
		self.input_manager:update(dt, t)
	end

	if self.splash_view then
		self.splash_view:update(dt)
	elseif self.showing_esrb then
		self:update_esrb_logo(dt, t)
	end

	if not self.wanted_state and (self.splash_view and self.splash_view:is_completed() or self._skip_splash) and self:packages_loaded() then
		require("scripts/game_state/state_title_screen")
		Managers.transition:fade_in(0.5, callback(self, "cb_fade_in_done"))
	end

	local state = self:next_state()

	return state
end

StateSplashScreen.render = function (self)
	if self.splash_view then
		self.splash_view:render()
	end
end

StateSplashScreen.next_state = function (self)
	if not self:packages_loaded() or not self.wanted_state then
		return
	end

	if IS_WINDOWS and not self.debug_setup then
		self.debug_setup = true

		Debug.setup(self.world, "splash_ui")
	end

	return self.wanted_state
end

StateSplashScreen.unload_packages = function (self)
	local package_manager = Managers.package

	for i, name in ipairs(StateSplashScreen.packages_to_load) do
		if package_manager:has_loaded(name, "state_splash_screen") then
			package_manager:unload(name, "state_splash_screen")
		end
	end
end

StateSplashScreen.load_packages = function (self)
	local package_manager = Managers.package

	for i, name in ipairs(StateSplashScreen.packages_to_load) do
		if not package_manager:has_loaded(name, "state_splash_screen") then
			package_manager:load(name, "state_splash_screen", nil, true)
		end
	end

	self._base_packages_loading = true
end

StateSplashScreen.packages_loaded = function (self)
	local package_manager = Managers.package

	for i, name in ipairs(StateSplashScreen.packages_to_load) do
		if not package_manager:has_loaded(name) then
			return false
		end
	end

	if self._base_packages_loading then
		Managers.transition:hide_loading_icon()

		self._base_packages_loading = nil
	end

	if IS_CONSOLE and self.splash_view then
		self.splash_view:allow_console_skip()
	end

	if not GlobalResources.loaded then
		for i, name in ipairs(GlobalResources) do
			if not package_manager:has_loaded(name) then
				package_manager:load(name, "global", nil, true)
			end
		end

		GlobalResources.loaded = true
	end

	return true
end

StateSplashScreen.cb_fade_in_done = function (self)
	self.wanted_state = StateTitleScreen
end

StateSplashScreen.on_exit = function (self, application_shutdown)
	Framerate.set_playing()

	if self.splash_view then
		self.splash_view:destroy()

		self.splash_view = nil
	end

	ScriptWorld.destroy_viewport(self.world, "splash_view_viewport")

	if rawget(_G, "Debug") and Debug.active then
		Debug.teardown()
	end

	Managers.world:destroy_world(self.world)

	self.world = nil

	if IS_WINDOWS then
		self.input_manager:destroy()

		self.input_manager = nil
		Managers.input = nil

		if GameSettingsDevelopment.skip_start_screen or Development.parameter("skip_start_screen") then
			Managers.package:unload("resource_packages/start_menu_splash", "StateSplashScreen")
		end

		VisualAssertLog.cleanup()

		self.parent.loading_context.windows_auto_sign_in = true
	end
end
