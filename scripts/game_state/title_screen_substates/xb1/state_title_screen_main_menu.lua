-- chunkname: @scripts/game_state/title_screen_substates/xb1/state_title_screen_main_menu.lua

require("scripts/ui/views/additional_content/additional_content_view")

StateTitleScreenMainMenu = class(StateTitleScreenMainMenu)
StateTitleScreenMainMenu.NAME = "StateTitleScreenMainMenu"

local game_types = {
	INVITATION = "invitation",
	OFFLINE = "offline",
	ONLINE = "online",
}
local menu_functions

if script_data.honduras_demo then
	menu_functions = {
		function (this)
			this:_start_game(game_types.ONLINE, DemoSettings.demo_level)
			Managers.music:trigger_event("Play_console_menu_start_game")
		end,
	}
elseif script_data.settings.use_beta_mode then
	if script_data.settings.disable_tutorial_at_start then
		menu_functions = {
			function (this)
				local game_type = this._title_start_ui:game_type() or game_types.ONLINE

				this:_start_game(game_type)
				this._title_start_ui:menu_option_activated(true)
				Managers.music:trigger_event("Play_console_menu_start_game")
			end,
			function (this)
				local input_manager = Managers.input

				input_manager:block_device_except_service("options_menu", "gamepad")
				this:activate_view("options_view")
				this._title_start_ui:menu_option_activated(true)
				Managers.music:trigger_event("Play_console_menu_select")
			end,
			function (this)
				this:activate_view("credits_view")
				this._title_start_ui:menu_option_activated(true)
				Managers.music:trigger_event("Play_console_menu_select")
			end,
		}
	else
		menu_functions = {
			function (this)
				local game_type = this._title_start_ui:game_type() or game_types.ONLINE

				this:_start_game(game_type)
				this._title_start_ui:menu_option_activated(true)
				Managers.music:trigger_event("Play_console_menu_start_game")
			end,
			function (this)
				local game_type = this._title_start_ui:game_type() or game_types.ONLINE

				this:_start_game(game_type, "prologue")
				this._title_start_ui:menu_option_activated(true)
				Managers.music:trigger_event("Play_console_menu_start_game")
			end,
			function (this)
				local input_manager = Managers.input

				input_manager:block_device_except_service("options_menu", "gamepad")
				this:activate_view("options_view")
				this._title_start_ui:menu_option_activated(true)
				Managers.music:trigger_event("Play_console_menu_select")
			end,
			function (this)
				this:activate_view("credits_view")
				this._title_start_ui:menu_option_activated(true)
				Managers.music:trigger_event("Play_console_menu_select")
			end,
		}
	end
elseif GameSettingsDevelopment.additional_content_view_enabled then
	menu_functions = {
		function (this)
			local game_type = this._title_start_ui:game_type() or game_types.ONLINE

			this:_start_game(game_type)
			this._title_start_ui:menu_option_activated(true)
			Managers.music:trigger_event("Play_console_menu_start_game")
		end,
		function (this)
			local game_type = this._title_start_ui:game_type() or game_types.ONLINE

			this:_start_game(game_type, "prologue")
			this._title_start_ui:menu_option_activated(true)
			Managers.music:trigger_event("Play_console_menu_start_game")
		end,
		function (this)
			local input_manager = Managers.input

			input_manager:block_device_except_service("options_menu", "gamepad")
			this:activate_view("options_view")
			this._title_start_ui:menu_option_activated(true)
			Managers.music:trigger_event("Play_console_menu_select")
		end,
		function (this)
			local input_manager = Managers.input

			this:activate_view("cinematics_view")
			this._title_start_ui:menu_option_activated(true)
			Managers.music:trigger_event("Play_console_menu_select")
		end,
		function (this)
			local input_manager = Managers.input

			input_manager:block_device_except_service("additional_content_menu", "gamepad")
			this:activate_view("additional_content_view")
			this._title_start_ui:menu_option_activated(true)
			Managers.music:trigger_event("Play_console_menu_select")
		end,
		function (this)
			this:activate_view("credits_view")
			this._title_start_ui:menu_option_activated(true)
			Managers.music:trigger_event("Play_console_menu_select")
		end,
	}
else
	menu_functions = {
		function (this)
			local game_type = this._title_start_ui:game_type() or game_types.ONLINE

			this:_start_game(game_type)
			this._title_start_ui:menu_option_activated(true)
			Managers.music:trigger_event("Play_console_menu_start_game")
		end,
		function (this)
			local game_type = this._title_start_ui:game_type() or game_types.ONLINE

			this:_start_game(game_type, "prologue")
			this._title_start_ui:menu_option_activated(true)
			Managers.music:trigger_event("Play_console_menu_start_game")
		end,
		function (this)
			local input_manager = Managers.input

			input_manager:block_device_except_service("options_menu", "gamepad")
			this:activate_view("options_view")
			this._title_start_ui:menu_option_activated(true)
			Managers.music:trigger_event("Play_console_menu_select")
		end,
		function (this)
			this:activate_view("credits_view")
			this._title_start_ui:menu_option_activated(true)
			Managers.music:trigger_event("Play_console_menu_select")
		end,
	}
end

StateTitleScreenMainMenu.on_enter = function (self, params)
	print("[Gamestate] Enter Substate StateTitleScreenMainMenu")

	self._params = params
	self._world = params.world
	self._viewport = params.viewport
	self._title_start_ui = params.ui
	self._auto_start = params.auto_start
	params.auto_start = nil
	self._state = "none"
	self._new_state = nil
	self._input_disabled = false
	self._game_type = nil
	self._level_key = nil
	self._disable_trailer = nil
	self._profile_name = nil

	if script_data.honduras_demo then
		Wwise.set_state("menu_mute_ingame_sounds", "false")
	end

	UISettings.set_console_settings()
	self._setup_sound()
	self:_setup_input()
	self:_init_menu_views()
	self:_init_managers()
	self:_update_chat_ignore_list()

	if params.skip_signin then
		self._title_start_ui:set_start_pressed(true)
	end

	Managers.transition:hide_loading_icon()

	self._network_event_meta_table = {}

	self._network_event_meta_table.__index = function (event_table, event_key)
		return function ()
			Application.warning("Got RPC %s during forced network update when exiting StateTitleScreenMain", event_key)
		end
	end

	self._is_installed = Managers.play_go:installed()

	if not self._is_installed then
		self._title_start_ui:set_menu_item_enable_state_by_index("start_game", false, true, "start_game_disabled_playgo")
		self._title_start_ui:set_menu_item_enable_state_by_index("cinematics", false, true, "start_game_disabled_playgo")
	else
		self._title_start_ui:set_menu_item_enable_state_by_index("start_game", true, true)
		self._title_start_ui:set_menu_item_enable_state_by_index("cinematics", true, true)
	end

	if PlayfabBackendSaveDataUtils.online_data_is_dirty() then
		self._title_start_ui:set_update_offline_data_enabled(true)
	else
		self._title_start_ui:set_update_offline_data_enabled(false)
	end

	self:_try_activate_splash()

	if GameSettingsDevelopment.additional_content_view_enabled then
		local additional_content_view = self._views.additional_content_view
		local has_splashes = additional_content_view and additional_content_view:has_active_splashes()

		if not has_splashes then
			self._title_start_ui:set_menu_item_enable_state_by_index("store", false, true, "start_game_disabled_playgo")
		else
			self._title_start_ui:set_menu_item_enable_state_by_index("store", true, true)
		end
	end
end

StateTitleScreenMainMenu._setup_sound = function (self)
	local master_bus_volume = Application.user_setting("master_bus_volume") or 90
	local music_bus_volume = Application.user_setting("music_bus_volume") or 90
	local wwise_world

	if GLOBAL_MUSIC_WORLD then
		wwise_world = MUSIC_WWISE_WORLD
	else
		local music_world = Managers.world:world("music_world")

		wwise_world = Managers.world:wwise_world(music_world)
	end

	WwiseWorld.set_global_parameter(wwise_world, "master_bus_volume", master_bus_volume)
	Managers.music:set_master_volume(master_bus_volume)
	Managers.music:set_music_volume(music_bus_volume)
end

StateTitleScreenMainMenu.cb_camera_animation_complete = function (self)
	ShowCursorStack.show("StateTitleScreenMainMenu")
	self._title_start_ui:activate_career_ui(true)
end

StateTitleScreenMainMenu.cb_camera_animation_complete_back = function (self)
	self._new_state = StateTitleScreenMain
end

StateTitleScreenMainMenu._setup_input = function (self)
	local input_manager = Managers.input

	self.input_manager = input_manager
end

StateTitleScreenMainMenu._init_menu_views = function (self)
	local ui_renderer = self._title_start_ui:get_ui_renderer()
	local view_context = {
		in_title_screen = true,
		ui_renderer = ui_renderer,
		ui_top_renderer = ui_renderer,
		input_manager = Managers.input,
		world_manager = Managers.world,
	}

	if script_data.honduras_demo then
		self._title_start_ui:animate_to_camera(DemoSettings.camera_end_position, nil, callback(self, "cb_camera_animation_complete"))

		self._views = {}
	else
		self._views = {
			credits_view = CreditsView:new(view_context),
			options_view = OptionsView:new(view_context),
			cinematics_view = CinematicsView:new(view_context),
			additional_content_view = GameSettingsDevelopment.additional_content_view_enabled and AdditionalContentView:new(view_context) or nil,
		}
	end

	for name, view in pairs(self._views) do
		view.exit = function ()
			self:exit_current_view()
		end
	end
end

StateTitleScreenMainMenu._init_managers = function (self)
	local user_id = Managers.account:user_id()

	Managers.xbox_stats = StatsManager2017:new(user_id)
end

StateTitleScreenMainMenu._update_chat_ignore_list = function (self)
	Managers.chat:update_ignore_list()
end

StateTitleScreenMainMenu._try_activate_splash = function (self)
	local additional_content_view = self._views.additional_content_view

	if additional_content_view and additional_content_view:has_active_splashes() and not SaveData.store_shown then
		local input_manager = Managers.input

		input_manager:block_device_except_service("additional_content_menu", "gamepad")
		self:activate_view("additional_content_view")
		self._title_start_ui:menu_option_activated(true)
		self.parent:show_menu(true, true)
	else
		self.parent:show_menu(true)
	end
end

local BACKGROUND_ONLY = BACKGROUND_ONLY or true

StateTitleScreenMainMenu._update_network = function (self, dt, t)
	if rawget(_G, "LobbyInternal") and LobbyInternal.network_initialized() then
		Network.update(dt, setmetatable({}, self._network_event_meta_table))
	end
end

StateTitleScreenMainMenu._start_game = function (self, game_type, level_key, disable_trailer, profile_name)
	self._game_type = game_type
	self._level_key = level_key
	self._disable_trailer = disable_trailer or not Application.user_setting("play_intro_cinematic")
	self._profile_name = profile_name
	self._input_disabled = true

	Managers.transition:show_loading_icon(false)
	self._title_start_ui:disable_input(true)

	if game_type == game_types.OFFLINE then
		self._state = "signin_to_backend"
	else
		self._state = "check_connection_state"
	end
end

StateTitleScreenMainMenu.update = function (self, dt, t)
	local title_start_ui = self._title_start_ui

	self:_update_play_go(dt, t)
	self:_update_network(dt, t)

	local has_offline_invitation = false

	if self._auto_start then
		local loading_context = self.parent.parent.loading_context

		if loading_context.offline_invite then
			has_offline_invitation = true
			loading_context.offline_invite = nil
		else
			self:_start_game(game_types.ONLINE)
		end

		self._auto_start = nil
	end

	local has_popup = Managers.popup:has_popup()
	local user_detached = Managers.account:user_detached()

	if (Managers.invite:has_invitation() or has_offline_invitation) and not self._input_disabled and not has_popup and not user_detached and not self._popup_id then
		if self._is_installed then
			self:_start_game(game_types.INVITATION, nil, true)
		else
			self._popup_id = Managers.popup:queue_popup(Localize("popup_invite_not_installed"), Localize("popup_invite_not_installed_header"), "not_installed", Localize("menu_ok"))
			self._state = "check_popup"
		end
	end

	local active_view = self._active_view

	if active_view then
		self._views[active_view]:update(dt, t)
	else
		title_start_ui:update(dt, t)

		if script_data.honduras_demo then
			self:_update_demo_input(dt, t)
		else
			self:_update_input(dt, t)
		end
	end

	if not Managers.account:user_detached() then
		if self._state == "check_connection_state" then
			self:_check_connection_state()
			title_start_ui:set_information_text(Localize("loading_checking_online_state"))
		elseif self._state == "check_multiplayer_privileges" then
			self:_check_privileges()
			title_start_ui:set_information_text(Localize("loading_checking_privileges"))
		elseif self._state == "signin_to_xsts" then
			title_start_ui:set_information_text(Localize("loading_acquiring_xsts_token"))
			self:_signin_to_xsts()
		elseif self._state == "signin_to_backend" then
			self:_signin_to_backend()
			title_start_ui:set_information_text(Localize("loading_signing_in"))
		elseif self._state == "waiting_for_backend_signin" then
			self:_waiting_for_backend_signin()
		elseif self._state == "check_popup" then
			self:_check_popup()
		end
	elseif self._popup_id then
		self:_check_popup()
	end

	if Managers.account:leaving_game() then
		if active_view then
			self:exit_current_view()
		end

		self.parent:show_menu(false)
		self._title_start_ui:set_start_pressed(false)
	end

	return self:_next_state()
end

StateTitleScreenMainMenu._check_popup = function (self)
	local result = Managers.popup:query_result(self._popup_id)

	if result == "xbox_live_connection_error" then
		Managers.invite:clear_invites()
		self:_close_menu()
	elseif result == "privilege_error" then
		Managers.invite:clear_invites()
		self:_close_menu()
	elseif result == "xsts_error" then
		Managers.invite:clear_invites()
		self:_close_menu()
	elseif result == "not_installed" then
		Managers.invite:clear_invites()

		self._state = "none"
	elseif result == "update_offline_data" then
		print("[StateTitleScreenMainMenu] Updating offline data...")
		PlayfabBackendSaveDataUtils.update_offline_data(callback(self, "cb_offline_data_updated"))
		self._title_start_ui:set_update_offline_data_enabled(false)
		self._title_start_ui:disable_input(true)

		self._input_disabled = true

		Managers.transition:show_loading_icon(false)

		self._state = "waiting_for_offline_data_update"
	elseif result == "do_nothing" then
		self._state = "none"
	elseif result then
		fassert(false, "[StateTitleScreenMainMenu] The popup result doesn't exist (%s)", result)
	end

	if result then
		self._popup_id = nil
	end
end

StateTitleScreenMainMenu.cb_offline_data_updated = function (self, success)
	if success then
		print("[StateTitleScreenMainMenu] Offline data update SUCCESS")
	else
		print("[StateTitleScreenMainMenu] Offline data update ERROR")
	end

	self._title_start_ui:disable_input(false)

	self._input_disabled = false

	Managers.transition:hide_loading_icon()

	self._state = "none"
end

StateTitleScreenMainMenu._close_menu = function (self)
	self.parent:show_menu(false)
	self._title_start_ui:set_start_pressed(false)
	self._title_start_ui:disable_input(false)
	self._title_start_ui:set_game_type(nil)

	self._closing_menu = true

	Managers.transition:hide_loading_icon()
	Managers.account:close_storage()

	if Managers.transition:fade_state() == "in" then
		Managers.transition:hide_loading_icon()
		Managers.transition:fade_out(1)
	end

	self._new_state = StateTitleScreenMain
	self._state = "none"
end

StateTitleScreenMainMenu._next_state = function (self)
	if not Managers.popup:has_popup() and not self._popup_id then
		if script_data.honduras_demo and not self._title_start_ui:is_ready() then
			return
		end

		if Managers.backend and Managers.backend:is_disconnected() then
			self:_close_menu()

			return self._new_state
		elseif self._closing_menu then
			return self._new_state
		else
			return nil
		end
	end
end

StateTitleScreenMainMenu._update_input = function (self, dt, t)
	local input_service = self.input_manager:get_service("main_menu")
	local current_menu_index = self._title_start_ui:current_menu_index()
	local active_menu_selection = self._title_start_ui:active_menu_selection()
	local has_popup = Managers.popup:has_popup()
	local user_detached = Managers.account:user_detached()
	local active_controller = Managers.account:active_controller()

	if active_menu_selection and not self._input_disabled and not has_popup and not user_detached and not self._popup_id then
		if current_menu_index and input_service:get("start", true) then
			input_service:get("confirm_press", true)
			menu_functions[current_menu_index](self)
		elseif input_service:get("back") then
			self:_close_menu()
		elseif active_controller.pressed(active_controller.button_index("x")) then
			local controller_id = tonumber(string.gsub(active_controller._name, "Pad", ""), 10)

			XboxLive.show_account_picker(controller_id)

			local error, device_id, user_id_from, user_id_to = XboxLive.show_account_picker_result()

			while error do
				XboxLive.show_account_picker(controller_id)

				error, device_id, user_id_from, user_id_to = XboxLive.show_account_picker_result()
			end

			if user_id_to == user_id_from and user_id_to == AccountManager.SIGNED_OUT then
				return
			elseif user_id_to ~= AccountManager.SIGNED_OUT then
				self._params.switch_user_auto_sign_in = true
			end

			self:_close_menu()
		elseif self._title_start_ui:offline_data_available() and active_controller.pressed(active_controller.button_index("y")) then
			self._popup_id = Managers.popup:queue_popup(Localize("popup_update_offline_data"), Localize("popup_update_offline_data_header"), "update_offline_data", Localize("popup_choice_yes"), "do_nothing", Localize("popup_choice_no"))
			self._state = "check_popup"
		end
	elseif not active_menu_selection and not self._input_disabled and input_service:get("back") then
		self:_close_menu()
	end
end

StateTitleScreenMainMenu._update_demo_input = function (self, dt, t)
	local demo_ui = self._title_start_ui
	local input_service = self.input_manager:get_service("main_menu")
	local has_popup = Managers.popup:has_popup()
	local user_detached = Managers.account:user_detached()
	local active_controller = Managers.account:active_controller()

	if demo_ui:should_start() and not self._input_disabled then
		local profile_name, career_index = demo_ui:selected_profile()

		self:_start_game(game_types.ONLINE, DemoSettings.demo_level, nil, profile_name)
		Managers.music:trigger_event("Play_console_menu_start_game")

		return
	end

	if Managers.time:get_demo_transition() and not demo_ui:in_transition() then
		demo_ui:animate_to_camera(DemoSettings.starting_camera_name, nil, callback(self, "cb_camera_animation_complete_back"))
		demo_ui:activate_career_ui(false)
		self.parent:show_menu(false)
	end

	if not self._input_disabled and not has_popup and not user_detached and not self._popup_id then
		if input_service:get("back") then
			if not demo_ui:in_transition() then
				demo_ui:animate_to_camera(DemoSettings.starting_camera_name, nil, callback(self, "cb_camera_animation_complete_back"))
				demo_ui:activate_career_ui(false)
				self:_close_menu()
			end
		elseif active_controller.pressed(active_controller.button_index("x")) and not demo_ui:in_transition() then
			local controller_id = tonumber(string.gsub(active_controller._name, "Pad", ""), 10)

			XboxLive.show_account_picker(controller_id)

			local error, device_id, user_id_from, user_id_to = XboxLive.show_account_picker_result()

			while error do
				XboxLive.show_account_picker(controller_id)

				error, device_id, user_id_from, user_id_to = XboxLive.show_account_picker_result()
			end

			if user_id_to == user_id_from and user_id_to == AccountManager.SIGNED_OUT then
				return
			elseif user_id_to ~= AccountManager.SIGNED_OUT then
				self._params.switch_user_auto_sign_in = true
			end

			self:_close_menu()
			demo_ui:animate_to_camera(DemoSettings.starting_camera_name, nil, callback(self, "cb_camera_animation_complete_back"))
			demo_ui:activate_career_ui(false)
		end
	end
end

StateTitleScreenMainMenu._update_play_go = function (self, dt, t)
	if self._is_installed then
		return
	end

	local installed = Managers.play_go:installed()

	if installed then
		self._title_start_ui:set_menu_item_enable_state_by_index("start_game", true, true)
		self._title_start_ui:set_menu_item_enable_state_by_index("cinematics", true, true)

		self._is_installed = true
	end
end

StateTitleScreenMainMenu.on_exit = function (self)
	for k, view in pairs(self._views) do
		if view.destroy then
			view:destroy()
		end
	end

	self._views = nil
end

StateTitleScreenMainMenu.cb_fade_in_done = function (self)
	local game_type = self._game_type
	local level_key = self._level_key
	local disable_trailer = self._disable_trailer or not Application.user_setting("play_intro_cinematic")
	local profile_name = self._profile_name
	local switch_to_tutorial_backend, tutorial_state = Managers.mechanism:should_run_tutorial()

	if switch_to_tutorial_backend and not Managers.backend:get_user_data("prologue_started") and not script_data.settings.disable_tutorial_at_start and not script_data.disable_prologue and not script_data.honduras_demo then
		disable_trailer = false
		level_key = "prologue"
	end

	self.parent.state = StateLoading

	local loading_context = self.parent.parent.loading_context

	loading_context.restart_network = true
	loading_context.level_key = level_key

	if game_type == game_types.INVITATION then
		loading_context.first_time = false
	end

	if level_key then
		local environment_variation_id = LevelHelper.get_environment_variation_id and LevelHelper:get_environment_variation_id(level_key) or nil

		Managers.level_transition_handler:set_next_level(level_key, environment_variation_id)
	end

	if level_key == "prologue" then
		loading_context.gamma_correct = not SaveData.gamma_corrected
		loading_context.play_trailer = true
		loading_context.switch_to_tutorial_backend = switch_to_tutorial_backend
		loading_context.wanted_tutorial_state = tutorial_state
	elseif script_data.honduras_demo then
		self.parent.parent.loading_context.wanted_profile_index = profile_name and FindProfileIndex(profile_name) or DemoSettings.wanted_profile_index
		GameSettingsDevelopment.disable_free_flight = DemoSettings.disable_free_flight
		GameSettingsDevelopment.disable_intro_trailer = DemoSettings.disable_intro_trailer
	elseif not level_key then
		loading_context.gamma_correct = not SaveData.gamma_corrected
		loading_context.show_profile_on_startup = true

		if not disable_trailer then
			loading_context.play_trailer = true
		end
	end
end

StateTitleScreenMainMenu.activate_view = function (self, new_view)
	self._active_view = new_view

	local views = self._views

	assert(views[new_view])

	if new_view and views[new_view] and views[new_view].on_enter then
		views[new_view]:on_enter()
	end
end

StateTitleScreenMainMenu.exit_current_view = function (self)
	local active_view = self._active_view
	local views = self._views

	assert(active_view)

	if views[active_view] and views[active_view].on_exit then
		views[active_view]:on_exit()
	end

	self._active_view = nil

	local input_manager = Managers.input

	input_manager:block_device_except_service("main_menu", "gamepad")
	self._title_start_ui:menu_option_activated(false)
end

StateTitleScreenMainMenu._check_connection_state = function (self)
	if XboxLive.online_state() == XboxOne.OFFLINE then
		self._popup_id = Managers.popup:queue_popup(Localize("popup_xbox_live_connection_error"), Localize("popup_xbox_live_connection_error_header"), "xbox_live_connection_error", Localize("menu_ok"))
		self._state = "check_popup"
	else
		self._state = "check_multiplayer_privileges"
	end
end

StateTitleScreenMainMenu._check_privileges = function (self)
	if Managers.account:is_privileges_initialized() then
		Managers.account:get_privilege_async(UserPrivilege.MULTIPLAYER_SESSIONS, true, callback(self, "cb_privilege_updated"))

		self._state = "none"
	end
end

StateTitleScreenMainMenu.cb_privilege_updated = function (self, privilege)
	if Managers.account:has_privilege_error() then
		self._popup_id = Managers.popup:queue_popup(Localize("popup_privilege_error"), Localize("popup_privilege_error_header"), "privilege_error", Localize("menu_ok"))
		self._state = "check_popup"
	elseif Managers.account:has_privilege(UserPrivilege.MULTIPLAYER_SESSIONS) then
		self._state = "signin_to_xsts"
	else
		self._popup_id = Managers.popup:queue_popup(Localize("popup_xbox_live_gold_error"), Localize("popup_xbox_live_gold_error_header"), "privilege_error", Localize("menu_ok"))
		self._state = "check_popup"
	end
end

StateTitleScreenMainMenu._signin_to_xsts = function (self)
	local token = UserXSTS.has(Managers.account:user_id())
	local script_xsts_token = ScriptXSTSToken:new(token)

	Managers.token:register_token(script_xsts_token, callback(self, "cb_xsts_token_received"))

	self._state = "waiting_for_xsts"
end

StateTitleScreenMainMenu.cb_xsts_token_received = function (self, data)
	print("[StateTitleScreenMainMenu] cb_xsts_token_received")

	local title_start_ui = self._title_start_ui

	if data.error then
		self._popup_id = Managers.popup:queue_popup(Localize("popup_xsts_signin_failed"), Localize("popup_xsts_signin_failed_header"), "xsts_error", Localize("menu_ok"))
		self._state = "check_popup"
	else
		print("[StateTitleScreenMainMenu] Successfully acquired an XSTS token")
		print("################  XSTS  ##################")

		self._xsts_result = data.result

		print(self._xsts_result)
		print("################ XSTS END ################")

		self._state = "signin_to_backend"
	end
end

StateTitleScreenMainMenu._signin_to_backend = function (self)
	local mechanism_name = Development.parameter("mechanism") or "adventure"
	local mechanism_settings = MechanismSettings[mechanism_name]
	local playfab_mirror = mechanism_settings and mechanism_settings.playfab_mirror
	local mirror = playfab_mirror or "PlayFabMirrorAdventure"

	Managers.unlock = UnlockManager:new()

	if self._game_type == game_types.OFFLINE then
		print("Using Offline Backend")
		Managers.account:set_offline_mode(true)

		if not Managers.rest_transport_offline then
			require("scripts/managers/rest_transport_offline/rest_transport_manager_offline")

			local offline_backend = require("scripts/managers/rest_transport_offline/offline_backend_playfab")

			Managers.rest_transport_offline = RestTransportManagerOffline:new(offline_backend.endpoints)
		end

		Managers.rest_transport = Managers.rest_transport_offline
		Managers.backend = BackendManagerPlayFab:new("ScriptBackendPlayFabXbox", mirror, "DataServerQueue")

		Managers.backend:signin("")
	else
		print("Using Online Backend")
		Managers.account:set_offline_mode(false)

		Managers.rest_transport = Managers.rest_transport_online
		Managers.backend = BackendManagerPlayFab:new("ScriptBackendPlayFabXbox", mirror, "DataServerQueue")

		Managers.backend:signin(self._xsts_result)
		Managers.account:set_xsts_token(self._xsts_result)

		self._xsts_result = nil
	end

	self._state = "waiting_for_backend_signin"
end

StateTitleScreenMainMenu._waiting_for_backend_signin = function (self)
	local backend_manager = Managers.backend

	if backend_manager and backend_manager:authenticated() then
		self._params.menu_screen_music_playing = false

		Managers.transition:fade_in(GameSettings.transition_fade_out_speed, callback(self, "cb_fade_in_done"))

		self._state = "none"
	end
end
