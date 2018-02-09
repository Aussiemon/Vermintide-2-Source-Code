require("scripts/game_state/state_title_screen_main")
require("scripts/settings/platform_specific")
require("scripts/game_state/state_loading")
require("scripts/managers/rcon/rcon_manager")
require("scripts/settings/game_settings")
require("scripts/ui/views/beta_overlay")
require("foundation/scripts/managers/chat/chat_manager")

StateTitleScreen = class(StateTitleScreen)
StateTitleScreen.NAME = "StateTitleScreen"
StateTitleScreen.on_enter = function (self, params)
	print("[Gamestate] Enter StateTitleScreen")

	if PLATFORM == "xb1" then
		Application.set_kinect_enabled(true)
	end

	if Development.parameter("honduras_demo") then
		Wwise.set_state("menu_mute_ingame_sounds", "true")
	end

	if PLATFORM == "ps4" and rawget(_G, "LobbyInternal") and LobbyInternal.network_initialized() then
		LobbyInternal.shutdown_client()
	end

	local loading_context = self.parent.loading_context
	local args = {
		Application.argv()
	}

	for _, parameter in pairs(args) do
		if parameter == "-auto-host-level" or parameter == "-auto-join" or parameter == "-skip-splash" or loading_context.join_lobby_data then
			self._auto_start = true

			break
		end
	end

	if PLATFORM == "win32" then
		Application.set_time_step_policy("throttle", 60)
	end

	if Development.parameter("honduras_demo") then
		self._demo_hack_state_managers(self)
	end

	self._params = params

	self._setup_world(self)
	self._setup_leak_prevention(self)
	self._init_input(self)
	self._init_ui(self)
	self._setup_state_machine(self)
	self._init_popup_manager(self)
	self._init_chat_manager(self)

	Managers.rcon = Managers.rcon or RconManager:new()

	if Development.parameter("use_beta_overlay") then
		self._init_beta_overlay(self)
	end

	self._platform = PLATFORM

	if self._platform == "ps4" and PS4.signed_in() then
		Managers.account:set_presence("title_screen")
	end

	self._fade_out(self)

	if rawget(_G, "ControllerFeaturesManager") then
		Managers.state.controller_features = ControllerFeaturesManager:new()
	end

	self._is_installed = Managers.play_go:installed()
	self._play_go_progress_string = Localize("play_go_installing_progress")

	if Managers.backend and Managers.backend:item_script_type() == "tutorial" then
		Managers.backend:stop_tutorial()
	end

	return 
end
StateTitleScreen._demo_hack_state_managers = function (self)
	local STATE_TABLE = {}
	local FUNCTION_TABLE = {}
	local SYSTEM_TABLE = {}
	local mt = {
		__index = function ()
			return SYSTEM_TABLE
		end
	}

	setmetatable(STATE_TABLE, mt)

	local mt = {
		__index = function ()
			return FUNCTION_TABLE
		end
	}

	setmetatable(SYSTEM_TABLE, mt)

	local mt = {
		__index = function ()
			return FUNCTION_TABLE
		end,
		__call = function ()
			return nil
		end
	}

	setmetatable(FUNCTION_TABLE, mt)

	self._old_state_manager = Managers.state
	Managers.state = STATE_TABLE

	return 
end
StateTitleScreen._fade_out = function (self)
	if self._platform == "xb1" then
		if Managers.account:should_teardown_xboxlive() then
			Managers.account:teardown_xboxlive()

			self._wait_for_xboxlive_teardown = true
		else
			Managers.transition:hide_loading_icon()
			Managers.transition:fade_out(1)
		end
	else
		Managers.transition:hide_loading_icon()
		Managers.transition:fade_out(1)
	end

	return 
end
StateTitleScreen._setup_leak_prevention = function (self)
	local assert_on_leak = true

	GarbageLeakDetector.run_leak_detection(assert_on_leak)
	GarbageLeakDetector.register_object(self, "StateTitleScreen")
	VisualAssertLog.setup(self._world)

	return 
end
StateTitleScreen._setup_world = function (self)
	if not Managers.package:has_loaded("resource_packages/start_menu_splash", "StateSplashScreen") and not GameSettingsDevelopment.skip_start_screen then
		Managers.package:load("resource_packages/start_menu_splash", "StateSplashScreen")
	end

	self._world_name = "title_screen_world"
	self._viewport_name = "title_screen_viewport"
	self._world = Managers.world:create_world(self._world_name, GameSettingsDevelopment.default_environment, nil, 100, Application.ENABLE_UMBRA, Application.ENABLE_VOLUMETRICS)
	self._viewport = ScriptWorld.create_viewport(self._world, self._viewport_name, "default", 1)
	local camera = ScriptViewport.camera(self._viewport)

	Camera.set_vertical_fov(camera, (math.pi*65)/180)
	Camera.set_far_range(camera, 5000)

	return 
end
StateTitleScreen._init_input = function (self)
	self._input_manager = InputManager:new()
	local input_manager = self._input_manager
	Managers.input = input_manager

	input_manager.initialize_device(input_manager, "keyboard", 1)
	input_manager.initialize_device(input_manager, "mouse", 1)
	input_manager.initialize_device(input_manager, "gamepad")
	input_manager.create_input_service(input_manager, "Player", "PlayerControllerKeymaps", "PlayerControllerFilters")

	return 
end
local DO_RELOAD = true
StateTitleScreen._init_ui = function (self)
	if not GameSettingsDevelopment.skip_start_screen then
		if Development.parameter("honduras_demo") then
			self._title_start_ui = DemoTitleUI:new(self._world, self._viewport, self)
		else
			self._title_start_ui = TitleMainUI:new(self._world)
		end
	end

	return 
end
StateTitleScreen._setup_state_machine = function (self)
	local loading_context = self.parent.loading_context

	if loading_context.skip_signin then
		loading_context.skip_signin = nil
		self._machine = StateMachine:new(self, StateTitleScreenMainMenu, {
			skip_signin = true,
			world = self._world,
			ui = self._title_start_ui,
			viewport = self._viewport,
			auto_start = self._auto_start
		}, true)
	else
		self._machine = StateMachine:new(self, StateTitleScreenMain, {
			world = self._world,
			ui = self._title_start_ui,
			viewport = self._viewport,
			auto_start = self._auto_start
		}, true)
	end

	return 
end
StateTitleScreen._init_popup_manager = function (self)
	Managers.popup = PopupManager:new()

	Managers.popup:set_input_manager(self._input_manager)

	Managers.simple_popup = SimplePopup:new()

	return 
end
StateTitleScreen._init_chat_manager = function (self)
	Managers.chat = Managers.chat or ChatManager:new()

	return 
end
StateTitleScreen._init_beta_overlay = function (self)
	Managers.beta_overlay = BetaOverlay:new()

	return 
end
StateTitleScreen.update = function (self, dt, t)
	self._handle_delayed_fade_in(self)
	Managers.input:update(dt, t)
	self._machine:update(dt, t)

	if Managers.backend and not Managers.backend:is_disconnected() then
		Managers.backend:update(dt)
	end

	self._update_play_go_progress(self, dt, t)

	if Managers.state.controller_features then
		Managers.state.controller_features:update(dt, t)
	end

	local render_only_background = GameSettingsDevelopment.skip_start_screen

	self._render(self, dt, render_only_background)

	if script_data.debug_enabled then
		VisualAssertLog.update(dt)
	end

	return self._next_state(self)
end
StateTitleScreen.post_update = function (self, dt, t)
	self._machine:post_update(dt, t)

	return 
end
StateTitleScreen._next_state = function (self)
	if Managers.popup:has_popup() or Managers.account:user_detached() then
		if Managers.account:leaving_game() then
			self.state = StateTitleScreen

			Managers.popup:cancel_all_popups()
		else
			return 
		end
	elseif Managers.account:leaving_game() then
		self.state = StateTitleScreen

		Managers.popup:cancel_all_popups()
	elseif Managers.backend and Managers.backend:is_disconnected() then
		self.state = StateTitleScreen

		Managers.popup:cancel_all_popups()
	end

	return self.state
end
StateTitleScreen._handle_delayed_fade_in = function (self)
	if self._platform == "xb1" and self._wait_for_xboxlive_teardown and not Managers.account:should_teardown_xboxlive() then
		Managers.transition:hide_loading_icon()
		Managers.transition:fade_out(1)

		self._wait_for_xboxlive_teardown = nil
	end

	return 
end
StateTitleScreen._update_play_go_progress = function (self, dt, t)
	if self._is_installed then
		return 
	end

	local installed = Managers.play_go:installed()

	if installed then
		self._title_start_ui:clear_playgo_status()

		self._is_installed = true
	else
		local progress_percentage = Managers.play_go:progress_percentage()
		local progress = tostring(progress_percentage*100)
		local progress_string = string.format(self._play_go_progress_string, progress)

		self._title_start_ui:set_playgo_status(progress_string)
	end

	return 
end
StateTitleScreen.enter_attract_mode = function (self, enter)
	self._attract_mode_active = enter

	return 
end
StateTitleScreen._render = function (self, dt, render_only_background)
	return 
end
StateTitleScreen.show_menu = function (self, show)
	self._title_start_ui:show_menu(show)

	return 
end
StateTitleScreen.on_exit = function (self, application_shutdown)
	if PLATFORM == "win32" then
		local max_fps = Application.user_setting("max_fps")

		if max_fps == nil or max_fps == 0 then
			Application.set_time_step_policy("no_throttle")
		else
			Application.set_time_step_policy("throttle", max_fps)
		end
	end

	self._machine:destroy()
	VisualAssertLog.cleanup()

	if self._title_start_ui then
		self._title_start_ui:destroy()

		self._title_start_ui = nil
	end

	ScriptWorld.destroy_viewport(self._world, self._viewport_name)
	Managers.world:destroy_world(self._world)
	Managers.popup:remove_input_manager(application_shutdown)
	self._input_manager:destroy()

	self._input_manager = nil
	Managers.input = nil

	if Development.parameter("honduras_demo") then
		Managers.state = self._old_state_manager

		Wwise.set_state("menu_mute_ingame_sounds", "default")
	end

	Managers.state:destroy()
	Managers.music:trigger_event("Stop_menu_screen_music")

	return 
end

return 
