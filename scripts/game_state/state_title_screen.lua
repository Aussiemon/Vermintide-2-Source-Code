﻿-- chunkname: @scripts/game_state/state_title_screen.lua

require("scripts/game_state/state_title_screen_main")
require("scripts/settings/platform_specific")
require("scripts/game_state/state_loading")
require("scripts/managers/eac/eac_manager")
require("scripts/settings/game_settings")
require("scripts/ui/views/beta_overlay")
require("foundation/scripts/managers/chat/chat_manager")

if IS_XB1 then
	require("scripts/managers/stats/stats_manager_2017")
end

StateTitleScreen = class(StateTitleScreen)
StateTitleScreen.NAME = "StateTitleScreen"

StateTitleScreen.on_enter = function (self, params)
	print("[Gamestate] Enter StateTitleScreen")

	if IS_XB1 then
		Application.set_kinect_enabled(true)

		if Managers.backend then
			Managers.backend:reset()
		end
	elseif IS_PS4 and Managers.backend then
		Managers.backend:reset()
	end

	if script_data.honduras_demo then
		Wwise.set_state("menu_mute_ingame_sounds", "true")
	end

	if IS_CONSOLE then
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		Managers.mechanism:destroy()

		Managers.mechanism = GameMechanismManager:new(current_mechanism_name)

		if rawget(_G, "LobbyInternal") and LobbyInternal.network_initialized() and (IS_PS4 or Managers.account:offline_mode()) then
			if Managers.party:has_party_lobby() then
				local lobby = Managers.party:steal_lobby()

				if type(lobby) ~= "table" then
					LobbyInternal.leave_lobby(lobby)
				end
			end

			LobbyInternal.shutdown_client()
		end
	end

	local loading_context = self.parent.loading_context
	local args = {
		Application.argv(),
	}

	for _, parameter in pairs(args) do
		if parameter == "-auto-host-level" or parameter == "-auto-join" or parameter == "-skip-splash" or parameter == "-deus-auto-host" or loading_context.join_lobby_data or loading_context.offline_invite then
			self._auto_start = true

			break
		elseif IS_PS4 then
			local play_together_list = SessionInvitation.play_together_list()

			if play_together_list then
				Managers.invite:set_play_together_list(play_together_list)

				self._auto_start = true

				break
			end
		end
	end

	Framerate.set_low_power()

	if script_data.honduras_demo then
		self:_demo_hack_state_managers()
	end

	self._params = params

	self:_setup_world()
	self:_setup_leak_prevention()
	self:_init_input()
	self:_init_ui()
	self:_setup_state_machine()
	self:_init_popup_manager()
	self:_init_chat_manager()

	if IS_WINDOWS or IS_LINUX then
		Managers.eac = Managers.eac or EacManager:new()

		self:_load_global_resources()
	end

	if Managers.beta_overlay then
		Managers.beta_overlay:destroy()

		Managers.beta_overlay = nil
	end

	if IS_PS4 then
		local account_manager = Managers.account

		if account_manager:is_online() then
			account_manager:set_presence("title_screen")
		end
	end

	self:_fade_out()

	if rawget(_G, "ControllerFeaturesManager") then
		Managers.state.controller_features = ControllerFeaturesManager:new()
	end

	self._is_installed = Managers.play_go:installed()
	self._play_go_progress_string = Localize("play_go_installing_progress")

	if Managers.backend and Managers.backend:item_script_type() == "tutorial" then
		Managers.backend:stop_tutorial()
	end

	ShowCursorStack.push()
end

StateTitleScreen._load_global_resources = function (self)
	if not GlobalResources.loaded then
		local package_manager = Managers.package

		for i, name in ipairs(GlobalResources) do
			if not package_manager:has_loaded(name) then
				package_manager:load(name, "global", nil, true)
			end
		end

		GlobalResources.loaded = true
	end
end

StateTitleScreen._demo_hack_state_managers = function (self)
	local STATE_TABLE = {}
	local FUNCTION_TABLE = {}
	local SYSTEM_TABLE = {}
	local mt = {
		__index = function ()
			return SYSTEM_TABLE
		end,
	}

	setmetatable(STATE_TABLE, mt)

	local mt = {
		__index = function ()
			return FUNCTION_TABLE
		end,
	}

	setmetatable(SYSTEM_TABLE, mt)

	local mt = {
		__index = function ()
			return FUNCTION_TABLE
		end,
		__call = function ()
			return nil
		end,
	}

	setmetatable(FUNCTION_TABLE, mt)

	self._old_state_manager = Managers.state
	Managers.state = STATE_TABLE
end

StateTitleScreen._fade_out = function (self)
	if IS_XB1 then
		if Managers.account:should_teardown_xboxlive() then
			Managers.account:teardown_xboxlive()

			self._wait_for_xboxlive_teardown = true
		elseif not self._auto_start then
			Managers.transition:hide_loading_icon()
			Managers.transition:fade_out(1)
		end
	else
		Managers.transition:hide_loading_icon()
		Managers.transition:fade_out(1)
	end
end

StateTitleScreen._setup_leak_prevention = function (self)
	local assert_on_leak = true

	GarbageLeakDetector.run_leak_detection(assert_on_leak)
	GarbageLeakDetector.register_object(self, "StateTitleScreen")
	VisualAssertLog.setup(self._world)
end

StateTitleScreen._setup_world = function (self)
	if not Managers.package:has_loaded("resource_packages/start_menu_splash", "StateSplashScreen") and not GameSettingsDevelopment.skip_start_screen and not Development.parameter("skip_start_screen") then
		Managers.package:load("resource_packages/start_menu_splash", "StateSplashScreen")
	end

	if IS_CONSOLE and not Managers.package:has_loaded("resource_packages/news_splash/news_splash", "state_splash_screen") and not GameSettingsDevelopment.skip_start_screen and not Development.parameter("skip_start_screen") then
		Managers.package:load("resource_packages/news_splash/news_splash", "state_splash_screen")
	end

	self._world_name = "title_screen_world"
	self._viewport_name = "title_screen_viewport"
	self._world = Managers.world:create_world(self._world_name, GameSettingsDevelopment.default_environment, nil, 100, Application.ENABLE_UMBRA, Application.ENABLE_VOLUMETRICS)

	if script_data.honduras_demo then
		self._viewport = ScriptWorld.create_viewport(self._world, self._viewport_name, "default", 1)
	else
		self._viewport = ScriptWorld.create_viewport(self._world, self._viewport_name, "overlay", 1)
		self._gui = World.create_screen_gui(self._world)

		local w, h = Application.resolution()

		Gui.rect(self._gui, Vector3(0, 0, 0), Vector2(w, h), Color(255, 0, 0, 0))
	end

	local camera = ScriptViewport.camera(self._viewport)

	Camera.set_vertical_fov(camera, math.pi * 65 / 180)
	Camera.set_far_range(camera, 5000)
end

StateTitleScreen._init_input = function (self)
	self._input_manager = InputManager:new()

	local input_manager = self._input_manager

	Managers.input = input_manager

	input_manager:initialize_device("keyboard", 1)
	input_manager:initialize_device("mouse", 1)
	input_manager:initialize_device("gamepad")
	input_manager:create_input_service("Player", "PlayerControllerKeymaps", "PlayerControllerFilters")
	input_manager:create_input_service("chat_input", "ChatControllerSettings", "ChatControllerFilters")
	input_manager:create_input_service("player_list_input", "IngamePlayerListKeymaps", "IngamePlayerListFilters")
end

local DO_RELOAD = true

StateTitleScreen._init_ui = function (self)
	if not GameSettingsDevelopment.skip_start_screen and not Development.parameter("skip_start_screen") then
		if script_data.honduras_demo then
			self._title_start_ui = DemoTitleUI:new(self._world, self._viewport, self)
		else
			self._title_start_ui = TitleMainUI:new(self._world)
		end
	end
end

StateTitleScreen._setup_state_machine = function (self)
	local loading_context = self.parent.loading_context

	if loading_context.skip_signin then
		loading_context.skip_signin = nil
		self._machine = GameStateMachine:new(self, StateTitleScreenMainMenu, {
			skip_signin = true,
			world = self._world,
			ui = self._title_start_ui,
			viewport = self._viewport,
			auto_start = self._auto_start,
			auto_sign_in = self._auto_sign_in,
		}, true)
	else
		self._machine = GameStateMachine:new(self, StateTitleScreenMain, {
			world = self._world,
			ui = self._title_start_ui,
			viewport = self._viewport,
			auto_start = self._auto_start,
			auto_sign_in = self._auto_sign_in,
		}, true)
	end
end

StateTitleScreen._init_popup_manager = function (self)
	Managers.popup = Managers.popup or PopupManager:new()

	Managers.popup:set_input_manager(self._input_manager)

	Managers.simple_popup = Managers.simple_popup or SimplePopup:new()
end

StateTitleScreen._init_chat_manager = function (self)
	Managers.chat = Managers.chat or ChatManager:new()
end

StateTitleScreen._init_beta_overlay = function (self)
	if not Managers.beta_overlay then
		Managers.beta_overlay = BetaOverlay:new(Managers.world:world("top_ingame_view"))
	end
end

StateTitleScreen.update = function (self, dt, t)
	self:_handle_delayed_fade_in()
	Managers.input:update(dt, t)
	self._machine:update(dt, t)

	if Managers.backend and not Managers.backend:is_disconnected() then
		Managers.backend:update(dt, t)
	end

	self:_update_play_go_progress(dt, t)

	if Managers.state.controller_features then
		Managers.state.controller_features:update(dt, t)
	end

	if Managers.eac ~= nil then
		Managers.eac:update(dt, t)
	end

	if Managers.music then
		Managers.music:update(dt, t)
	end

	local render_only_background = GameSettingsDevelopment.skip_start_screen

	self:_render(dt, render_only_background)

	if script_data.debug_enabled then
		VisualAssertLog.update(dt)
	end

	return self:_next_state()
end

StateTitleScreen.post_update = function (self, dt, t)
	self._machine:post_update(dt, t)
end

StateTitleScreen._next_state = function (self)
	if Managers.popup:has_popup() or Managers.account:user_detached() then
		if Managers.account:leaving_game() then
			print("Reloading StateTitleScreen due to user detatched")

			self.state = StateTitleScreen

			Managers.popup:cancel_all_popups()
		else
			return
		end
	elseif Managers.account:leaving_game() and not self._wait_for_xboxlive_teardown then
		print("Reloading StateTitleScreen due to leaving game")

		self.state = StateTitleScreen

		Managers.popup:cancel_all_popups()
	elseif IS_XB1 and Managers.backend and Managers.backend:is_disconnected() then
		print("Reloading StateTitleScreen due to backend disconnect")

		self.state = StateTitleScreen

		Managers.popup:cancel_all_popups()
	end

	return self.state
end

StateTitleScreen._handle_delayed_fade_in = function (self)
	if IS_XB1 and self._wait_for_xboxlive_teardown and not Managers.account:should_teardown_xboxlive() and not self._auto_start then
		Managers.transition:fade_out(1)

		self._wait_for_xboxlive_teardown = nil

		Managers.transition:hide_loading_icon()
	end
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
		local progress = tostring(100 * progress_percentage)
		local progress_string = string.format(self._play_go_progress_string, progress)

		self._title_start_ui:set_playgo_status(progress_string)
	end
end

StateTitleScreen.enter_attract_mode = function (self, enter)
	self._attract_mode_active = enter
end

StateTitleScreen._render = function (self, dt, render_only_background)
	return
end

StateTitleScreen.show_menu = function (self, show, force)
	self._title_start_ui:show_menu(show, force)
end

StateTitleScreen.on_exit = function (self, application_shutdown)
	Framerate.set_playing()
	self._machine:destroy()
	VisualAssertLog.cleanup()

	if self._title_start_ui then
		self._title_start_ui:destroy()

		self._title_start_ui = nil
	end

	self:_init_beta_overlay()

	if application_shutdown and rawget(_G, "LobbyInternal") and LobbyInternal.client then
		if Managers.party:has_party_lobby() then
			local lobby = Managers.party:steal_lobby()

			if type(lobby) ~= "table" then
				LobbyInternal.leave_lobby(lobby)
			end
		end

		LobbyInternal.shutdown_client()
	end

	ScriptWorld.destroy_viewport(self._world, self._viewport_name)
	Managers.world:destroy_world(self._world)
	Managers.popup:remove_input_manager(application_shutdown)
	self._input_manager:destroy()

	self._input_manager = nil
	Managers.input = nil

	if script_data.honduras_demo then
		Managers.state = self._old_state_manager

		Wwise.set_state("menu_mute_ingame_sounds", "default")
	end

	Managers.state:destroy()

	if Managers.package:has_loaded("resource_packages/news_splash/news_splash", "state_splash_screen") then
		Managers.package:unload("resource_packages/news_splash/news_splash", "state_splash_screen")
		Managers.package:unload("resource_packages/start_menu_splash", "StateSplashScreen")
	end

	if IS_CONSOLE and not GameSettingsDevelopment.skip_start_screen and not Development.parameter("skip_start_screen") then
		Managers.music:trigger_event("Stop_menu_screen_music")
	end

	ShowCursorStack.pop()
end
