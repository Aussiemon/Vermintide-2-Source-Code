StateTitleScreenMainMenu = class(StateTitleScreenMainMenu)
StateTitleScreenMainMenu.NAME = "StateTitleScreenMainMenu"
local game_types = {
	INVITATION = "invitation",
	OFFLINE = "offline",
	ONLINE = "online"
}
local menu_functions = nil

if script_data.honduras_demo then
	menu_functions = {
		function (this)
			this:_start_game(game_types.OFFLINE, DemoSettings.demo_level)
			Managers.music:trigger_event("Play_console_menu_start_game")
		end
	}
elseif script_data.settings.use_beta_overlay then
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
		function (this)
			this:_start_game(game_types.OFFLINE)
			this._title_start_ui:menu_option_activated(true)
			Managers.music:trigger_event("Play_console_menu_start_game")
		end
	}
end

local DO_RELOAD = true

StateTitleScreenMainMenu.on_enter = function (self, params)
	self._params = params
	self._world = self._params.world
	self._viewport = self._params.viewport
	self._title_start_ui = params.ui
	self._auto_start = params.auto_start

	self._setup_sound()
	self:_setup_input()
	self:_init_menu_views()
	self.parent:show_menu(true)
	Managers.transition:hide_loading_icon()

	if params.skip_signin then
		self._title_start_ui:set_start_pressed(true)
	end

	if script_data.honduras_demo then
		Wwise.set_state("menu_mute_ingame_sounds", "false")
	end

	self._is_installed = Managers.play_go:installed()

	if not self._is_installed then
		self._title_start_ui:set_menu_item_enable_state_by_index("start_game", false, true, "start_game_disabled_playgo")
	else
		self._title_start_ui:set_menu_item_enable_state_by_index("start_game", true, true)
	end

	local user_id = Managers.account:user_id()

	if not Managers.account:has_access("chat", user_id) then
		Managers.system_dialog:open_system_dialog(MsgDialog.SYSTEM_MSG_TRC_PSN_CHAT_RESTRICTION, user_id)
	end
end

StateTitleScreenMainMenu._setup_sound = function (self)
	local master_bus_volume = Application.user_setting("master_bus_volume") or 90
	local music_bus_volume = Application.user_setting("music_bus_volume") or 90
	local wwise_world = nil

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
	ShowCursorStack.push()
	self._title_start_ui:activate_career_ui(true)
	Managers.input:enable_gamepad_cursor()
end

StateTitleScreenMainMenu.cb_camera_animation_complete_back = function (self)
	self._new_state = StateTitleScreenMain

	Managers.input:disable_gamepad_cursor()
end

StateTitleScreenMainMenu._setup_input = function (self)
	local input_manager = Managers.input
	self.input_manager = input_manager
end

StateTitleScreenMainMenu._init_menu_views = function (self)
	local ui_renderer = self._title_start_ui:get_ui_renderer()
	local view_context = {
		ui_renderer = ui_renderer,
		ui_top_renderer = ui_renderer,
		input_manager = Managers.input,
		world_manager = Managers.world
	}

	if script_data.honduras_demo then
		self._title_start_ui:animate_to_camera(DemoSettings.camera_end_position, nil, callback(self, "cb_camera_animation_complete"))

		self._views = {}
	else
		self._views = {
			credits_view = CreditsView:new(view_context),
			options_view = OptionsView:new(view_context)
		}
	end

	for name, view in pairs(self._views) do
		view.exit = function ()
			self:exit_current_view()
		end
	end
end

local BACKGROUND_ONLY = BACKGROUND_ONLY or true

StateTitleScreenMainMenu.update = function (self, dt, t)
	local title_start_ui = self._title_start_ui

	self:_update_play_go(dt, t)
	self:_check_invites()

	local active_view = self._active_view

	if active_view then
		Profiler.start(active_view)
		self._views[active_view]:update(dt, t)
		Profiler.stop(active_view)
	else
		local input_service = self.input_manager:get_service("main_menu")

		if self._auto_start and not self._auto_started then
			self._auto_started = true

			menu_functions[1](self)

			return
		end

		title_start_ui:update(dt, t)

		if script_data.honduras_demo then
			self:_update_demo_input(dt, t)
		else
			self:_update_input(dt, t)
		end
	end

	if not self._popup_id then
		if not Managers.account:user_detached() then
			if self._state == "check_restrictions" then
				self:_check_restrictions()
				title_start_ui:set_information_text(Localize("loading_checking_online_state"))
			elseif self._state == "request_np_auth_data" then
				self:_request_np_auth_data()
				title_start_ui:set_information_text(Localize("loading_requesting_np_auth_data"))
			elseif self._state == "signin_to_backend" then
				self:_signin_to_backend()
				title_start_ui:set_information_text(Localize("loading_signing_in"))
			elseif self._state == "waiting_for_backend_signin" then
				self:_waiting_for_backend_signin()
			elseif self._state == "check_popup" then
				self:_check_popup()
			end
		end
	elseif self._popup_id then
		self:_check_popup()
	end

	return self:_next_state()
end

StateTitleScreenMainMenu._check_invites = function (self)
	local has_offline_invitation = false

	if self._auto_start then
		local loading_context = self.parent.parent.loading_context

		if loading_context.offline_invite then
			has_offline_invitation = true
			loading_context.offline_invite = nil
		end
	end

	if (Managers.invite:has_invitation() or has_offline_invitation) and not self._handled_invite and not self._input_disabled and not self._popup_id then
		if self._is_installed then
			self:_start_game(game_types.INVITATION, nil, true)
			self:_fetch_restrictions()
		else
			self._popup_id = Managers.popup:queue_popup(Localize("popup_invite_not_installed"), Localize("popup_invite_not_installed_header"), "not_installed", Localize("menu_ok"))
		end

		self._handled_invite = true
	end
end

StateTitleScreenMainMenu._fetch_restrictions = function (self)
	Managers.account:refetch_restriction_access(nil, {
		"network_availability",
		"playstation_plus"
	})

	self._should_evaluate_network_availability = true
	self._should_evaluate_playstation_plus = true
end

StateTitleScreenMainMenu._update_input = function (self, dt, t)
	local title_start_ui = self._title_start_ui
	local input_service = self.input_manager:get_service("main_menu")
	local current_menu_index = title_start_ui:current_menu_index()
	local active_menu_selection = title_start_ui:active_menu_selection()
	local has_popup = Managers.popup:has_popup()
	local user_detached = Managers.account:user_detached()
	local active_controller = Managers.account:active_controller()

	if active_menu_selection and not self._input_disabled and not has_popup and not user_detached and not self._popup_id then
		if current_menu_index and input_service:get("start", true) then
			menu_functions[current_menu_index](self)
		elseif input_service:get("back") then
			self:_close_menu()
		elseif title_start_ui:offline_data_available() and active_controller.pressed(active_controller.button_index("y")) then
			self._popup_id = Managers.popup:queue_popup(Localize("popup_update_offline_data"), Localize("popup_update_offline_data_header"), "update_offline_data", Localize("popup_choice_yes"), "do_nothing", Localize("popup_choice_no"))
			self._state = "check_popup"
		end
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

		self:_start_game(game_types.OFFLINE, DemoSettings.demo_level, true, profile_name)
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
		elseif active_controller.pressed(active_controller.button_index("square")) and not demo_ui:in_transition() then
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

		self._is_installed = true
	end
end

StateTitleScreenMainMenu._check_restrictions = function (self)
	if self._should_evaluate_network_availability and not Managers.account:restriction_access_fetched("network_availability") then
		return
	end

	if self._should_evaluate_network_availability then
		local error_code = Managers.account:has_error("network_availability")
		local has_access = Managers.account:has_access("network_availability")

		if error_code then
			self._show_error_dialog = true

			Managers.system_dialog:open_error_dialog(error_code, callback(self, "cb_error_message_done"))
		elseif not has_access then
			self._popup_id = Managers.popup:queue_popup(Localize("popup_ps4_network_not_available"), Localize("popup_error_topic"), "ok", Localize("popup_choice_ok"))
		else
			self._network_available = true
		end

		if not self._network_available then
			self._should_evaluate_playstation_plus = false
			self._has_evaluated_playstation_plus = true
		end

		self._should_evaluate_network_availability = false
		self._has_evaluated_network_availability = true
	else
		self._has_evaluated_network_availability = true
	end

	if self._should_evaluate_playstation_plus and not Managers.account:restriction_access_fetched("playstation_plus") then
		return
	end

	if self._should_evaluate_playstation_plus then
		local error_code = Managers.account:has_error("playstation_plus")
		local has_access = Managers.account:has_access("playstation_plus")

		if error_code then
			self._show_error_dialog = true

			Managers.system_dialog:open_error_dialog(error_code, callback(self, "cb_error_message_done"))
		elseif not has_access then
			self:_setup_playstation_plus_dialog()
		else
			self._playstation_plus_available = true
		end

		if not self._playstation_plus_dialog then
			self._has_evaluated_playstation_plus = true
		end

		self._should_evaluate_playstation_plus = false
	elseif not self._playstation_plus_dialog then
		self._has_evaluated_playstation_plus = true
	end

	if self._playstation_plus_dialog then
		local status = NpCommerceDialog.update()

		if status == NpCommerceDialog.INITIALIZED then
			NpCommerceDialog.open(Managers.account:user_id(), NpCheck.REALTIME_MULTIPLAY)
		elseif status == NpCommerceDialog.FINISHED then
			local action, result = NpCommerceDialog.result()

			if result == true then
				Managers.account:refetch_restriction_access(nil, {
					"playstation_plus"
				})

				self._playstation_plus_available = true
			end

			self._has_evaluated_playstation_plus = true

			NpCommerceDialog.terminate()

			self._playstation_plus_dialog = nil
		end
	end

	if self._has_evaluated_playstation_plus and self._has_evaluated_network_availability then
		self._state = "request_np_auth_data"
	end
end

StateTitleScreenMainMenu._request_np_auth_data = function (self)
	local token = NpAuth.create_async_token()
	local script_token = ScriptNpAuthToken:new(token)

	Managers.token:register_token(script_token, callback(self, "cb_np_auth_data_received"))

	self._state = "waiting_for_np_auth_data"
end

StateTitleScreenMainMenu.cb_np_auth_data_received = function (self, data)
	print("[StateTitleScreenMainMenu] cb_np_auth_data_received")

	if data.error then
		self._popup_id = Managers.popup:queue_popup(Localize("popup_np_auth_failed"), Localize("popup_np_auth_failed_header"), "xsts_error", Localize("menu_ok"))
		self._state = "check_popup"
	else
		print("[StateTitleScreenMainMenu] Successfully acquired NpAuth data")

		self._np_auth_data = {
			auth_code = data.auth_code,
			issuer_id = data.issuer_id
		}
		self._state = "signin_to_backend"
	end
end

StateTitleScreenMainMenu._signin_to_backend = function (self)
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
		Managers.backend = BackendManagerPlayFab:new("ScriptBackendPlayFabPS4", "PlayFabMirror", "DataServerQueue")

		Managers.backend:signin("")
	else
		print("Using Online Backend")
		Managers.account:set_offline_mode(false)

		Managers.rest_transport = Managers.rest_transport_online
		Managers.backend = BackendManagerPlayFab:new("ScriptBackendPlayFabPS4", "PlayFabMirror", "DataServerQueue")

		Managers.backend:signin(self._np_auth_data)

		self._np_auth_data = nil
	end

	self._state = "waiting_for_backend_signin"
end

StateTitleScreenMainMenu._waiting_for_backend_signin = function (self)
	local backend_manager = Managers.backend

	if backend_manager and (backend_manager:is_local() or backend_manager:authenticated()) then
		self._params.menu_screen_music_playing = false

		Managers.transition:fade_in(GameSettings.transition_fade_out_speed, callback(self, "cb_fade_in_done"))

		self._state = "none"
	end
end

StateTitleScreenMainMenu._update_start_game = function (self, dt, t)
	self:_check_restrictions()

	local start_game = self._fade_in_done and self._has_evaluated_network_availability and self._has_evaluated_playstation_plus

	if start_game then
		if self._network_available and self._playstation_plus_available then
			self:_start_game(self._level_key)
		else
			self.parent:show_menu(false)

			self._new_state = StateTitleScreenMain

			Managers.transition:force_fade_out()
			Managers.transition:hide_loading_icon()
		end
	end
end

StateTitleScreenMainMenu._setup_playstation_plus_dialog = function (self)
	NpCommerceDialog.initialize()

	self._playstation_plus_dialog = true
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

	if PLATFORM ~= "win32" and not Managers.backend:get_user_data("prologue_started") and not script_data.settings.disable_tutorial_at_start and not script_data.disable_prologue and not script_data.honduras_demo then
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

	if level_key and loading_context.level_transition_handler then
		loading_context.level_transition_handler:set_next_level(level_key)
	end

	if level_key == "prologue" then
		loading_context.gamma_correct = not SaveData.gamma_corrected
		loading_context.play_trailer = true
		loading_context.switch_to_tutorial_backend = true
	elseif script_data.honduras_demo then
		self.parent.parent.loading_context.wanted_profile_index = (profile_name and FindProfileIndex(profile_name)) or DemoSettings.wanted_profile_index
		GameSettingsDevelopment.disable_free_flight = DemoSettings.disable_free_flight
		GameSettingsDevelopment.disable_intro_trailer = DemoSettings.disable_intro_trailer
	elseif not level_key then
		loading_context.gamma_correct = not SaveData.gamma_corrected

		if not disable_trailer then
			loading_context.play_trailer = true
			loading_context.show_profile_on_startup = true
		else
			loading_context.show_profile_on_startup = false
		end
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
		self._state = "check_restrictions"
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

StateTitleScreenMainMenu._close_menu = function (self)
	self.parent:show_menu(false)
	self._title_start_ui:set_start_pressed(false)
	self._title_start_ui:disable_input(false)
	self._title_start_ui:set_game_type(nil)

	self._closing_menu = true

	Managers.transition:hide_loading_icon()

	self._new_state = StateTitleScreenMain
	self._state = "none"
end

StateTitleScreenMainMenu._check_popup = function (self)
	if self._popup_id then
		local result = Managers.popup:query_result(self._popup_id)

		if result == "not_installed" then
			Managers.invite:clear_invites()

			self._popup_id = nil
		elseif result == "ok" then
			self._popup_id = nil
		elseif result == "online_mode_not_implemented" then
			self._popup_id = nil

			self:_close_menu()
		elseif result == "prologue_not_working" then
			self._popup_id = nil

			Managers.transition:force_fade_out()
			self:_close_menu()
		elseif result then
			fassert(false, "[StateTitleScreenMainMenu] The popup result doesn't exist (%s)", result)
		end

		return
	end
end

StateTitleScreenMainMenu._next_state = function (self)
	if self._popup_id then
		return
	end

	if self._show_error_dialog then
		return
	end

	if not Managers.popup:has_popup() then
		return self._new_state
	end
end

StateTitleScreenMainMenu.cb_error_message_done = function (self, result)
	self._show_error_dialog = nil
end

return
