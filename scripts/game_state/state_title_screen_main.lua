require("scripts/ui/views/title_main_ui")

if script_data.honduras_demo then
	require("scripts/ui/views/demo_title_ui")
end

StateTitleScreenMain = class(StateTitleScreenMain)
StateTitleScreenMain.NAME = "StateTitleScreenMain"
ATTRACT_MODE_TIMER = (script_data.honduras_demo and DemoSettings.attract_timer) or 45
StateTitleScreenMain.on_enter = function (self, params)
	print("[Gamestate] Enter Substate StateTitleScreenMain")

	self._params = params
	self._world = self._params.world
	self._viewport = self._params.viewport
	self._attract_mode_timer = ATTRACT_MODE_TIMER
	self._attract_mode_active = false
	self._auto_start = params.auto_start
	self.input_manager = Managers.input
	self._title_start_ui = params.ui

	if self._title_start_ui then
		self._title_start_ui:clear_user_name()
	end

	self._setup_account_manager(self)

	self._error_popups = {}

	if PLATFORM == "xb1" then
		if not Managers.account:should_teardown_xboxlive() then
			Managers.account:reset()
		end

		if script_data.honduras_demo or PLATFORM == "xb1" then
			self._update_ui_settings(self)
		end
	else
		Managers.account:reset()
	end

	if Managers.matchmaking then
		Managers.matchmaking:destroy()

		Managers.matchmaking = nil
	end

	Managers.input:set_all_gamepads_available()

	if Managers.voice_chat and Managers.voice_chat:initiated() then
		Managers.voice_chat:shutdown()
	end

	self._network_event_meta_table = {
		__index = function (event_table, event_key)
			return function ()
				Application.warning("Got RPC %s during forced network update when exiting StateTitleScreenMain", event_key)

				return 
			end
		end
	}

	if script_data.honduras_demo then
		Wwise.set_state("menu_mute_ingame_sounds", "true")
	end

	if not self._params.menu_screen_music_playing and not GameSettingsDevelopment.skip_start_screen and not self._auto_start then
		Managers.music:trigger_event("Play_menu_screen_music")

		self._params.menu_screen_music_playing = true
	end

	return 
end
StateTitleScreenMain._update_ui_settings = function (self)
	local ui_scale = 150
	local console_type = XboxOne.console_type()

	if console_type ~= XboxOne.CONSOLE_TYPE_XBOX_ONE_X_DEVKIT and console_type ~= XboxOne.CONSOLE_TYPE_XBOX_ONE_X then
		ui_scale = math.clamp(ui_scale, 0, 100)
		UserSettings.ui_scale = ui_scale
	end

	UISettings.ui_scale = ui_scale
	UISettings.use_hud_screen_fit = Application.user_setting("use_hud_screen_fit") or false
	UISettings.root_scale = {
		Application.user_setting("root_scale_x") or 1,
		Application.user_setting("root_scale_y") or 1
	}
	local force_update = true

	UPDATE_RESOLUTION_LOOKUP(force_update)

	return 
end
StateTitleScreenMain._queue_popup = function (self, ...)
	self._error_popups[#self._error_popups + 1] = Managers.popup:queue_popup(...)

	return 
end
StateTitleScreenMain._setup_account_manager = function (self)
	Managers.account = Managers.account or AccountManager:new()

	return 
end
StateTitleScreenMain.update = function (self, dt, t)
	self._update_network(self, dt, t)

	if Managers.voice_chat then
		Managers.voice_chat:update(dt, t)
	end

	if not GameSettingsDevelopment.skip_start_screen then
		local loading_context = self.parent.parent.loading_context

		if loading_context.previous_session_error then
			local previous_session_error = loading_context.previous_session_error
			loading_context.previous_session_error = nil

			self._queue_popup(self, Localize(previous_session_error), Localize("popup_error_topic"), "ok", Localize("menu_ok"))
		end

		self._title_start_ui:update(dt, t)

		local n_popups = #self._error_popups
		local popup = self._error_popups[n_popups]

		if popup then
			local result = Managers.popup:query_result(popup)

			if result == "ok" then
				Managers.popup:cancel_popup(popup)
				table.remove(self._error_popups, 1)
			elseif result == "not_installed" then
				Managers.invite:clear_invites()
				Managers.popup:cancel_popup(popup)
				table.remove(self._error_popups, 1)
			elseif result then
				fassert(false, "Unhandled popup result %s", result)
			end
		else
			self._handle_continue_input(self, dt, t)
			self._update_input(self, dt, t)
			self._update_attract_mode(self, dt, t)
		end
	else
		self._state = StateTitleScreenInitNetwork
	end

	return self._next_state(self)
end
StateTitleScreenMain._update_network = function (self, dt, t)
	if rawget(_G, "LobbyInternal") and LobbyInternal.network_initialized() then
		Network.update(dt, setmetatable({}, self._network_event_meta_table))
	end

	return 
end
StateTitleScreenMain._update_attract_mode = function (self, dt, t)
	if self._title_start_ui:attract_mode() then
		if self._title_start_ui:video_completed() then
			self._exit_attract_mode(self)
		end
	else
		self._attract_mode_timer = self._attract_mode_timer - dt

		if self._attract_mode_timer <= 0 then
			self._enter_attract_mode(self)
		end
	end

	return 
end
StateTitleScreenMain._enter_attract_mode = function (self)
	Managers.music:stop_all_sounds()
	self._title_start_ui:enter_attract_mode()
	self.parent:enter_attract_mode(true)

	self._attract_mode_active = true

	return 
end
StateTitleScreenMain._exit_attract_mode = function (self)
	Managers.music:stop_all_sounds()
	Managers.music:trigger_event("Play_menu_screen_music")

	self._params.menu_screen_music_playing = true
	self._attract_mode_timer = ATTRACT_MODE_TIMER
	self._attract_mode_active = false

	Managers.transition:force_fade_in()
	Managers.transition:fade_out(1)
	self._title_start_ui:exit_attract_mode()
	self.parent:enter_attract_mode(false)

	return 
end
StateTitleScreenMain._handle_continue_input = function (self, dt, t)
	local input_service = self.input_manager:get_service("main_menu")
	local start_allowed = true

	if script_data.honduras_demo then
		start_allowed = not self._title_start_ui:in_transition()
	end

	if start_allowed then
		if input_service.get(input_service, "start", true) then
			self._start_pressed = true
		elseif script_data.honduras_demo then
			local current_device = Managers.input:get_most_recent_device()

			if current_device.any_pressed(current_device) then
				self._start_pressed = true
			end
		end
	end

	if self._title_start_ui:attract_mode() then
		local current_device = Managers.input:get_most_recent_device()

		if current_device.any_pressed(current_device) then
			self._start_pressed = true
		end
	end

	if input_service.has(input_service, "delete_save") and input_service.get(input_service, "delete_save") and BUILD ~= "release" then
		StateTitleScreenLoadSave.DELETE_SAVE = true
	end

	return 
end
StateTitleScreenMain._user_exists = function (self, user_id)
	local users = {
		XboxLive.users()
	}

	for _, user in pairs(users) do
		if user.id == user_id then
			return true
		end
	end

	return false
end
StateTitleScreenMain._update_input = function (self, dt, t)
	local platform = PLATFORM
	local controller = Managers.input:get_most_recent_device()

	if platform == "ps4" and Managers.invite:has_invitation() and not self._state then
		if Managers.play_go:installed() then
			Managers.music:trigger_event("hud_menu_press_start")

			if PS4.signed_in() then
				self._title_start_ui:set_start_pressed(true)

				self._state = StateTitleScreenLoadSave
			else
				self._queue_popup(self, Localize("popup_ps4_not_signed_in"), Localize("popup_error_topic"), "ok", Localize("popup_choice_ok"))

				self._start_pressed = false
			end
		else
			self._queue_popup(self, Localize("popup_invite_not_installed"), Localize("popup_invite_not_installed_header"), "not_installed", Localize("menu_ok"))
		end
	elseif (self._start_pressed or LEVEL_EDITOR_TEST or self._auto_start or GameSettingsDevelopment.skip_start_screen or self._params.switch_user_auto_sign_in or self._has_engaged) and not self._state then
		if self._title_start_ui:attract_mode() then
			self._exit_attract_mode(self)

			self._start_pressed = false
		elseif platform == "win32" then
			if not GameSettingsDevelopment.skip_start_screen then
				Managers.music:trigger_event("hud_menu_press_start")
			end

			self._title_start_ui:set_start_pressed(true)

			self._state = StateTitleScreenInitNetwork
		elseif platform == "xb1" then
			local user_id = controller and controller.user_id()

			if Application.is_constrained() then
				self._has_engaged = false
			end

			local can_proceed = true

			if self._has_engaged then
				can_proceed = user_id and self._user_exists(self, user_id)
			end

			if can_proceed and user_id and Managers.account:user_exists(user_id) then
				if Managers.account:sign_in(user_id, controller) then
					Managers.music:trigger_event("hud_menu_press_start")
					self._title_start_ui:set_start_pressed(true)

					self._params.switch_user_auto_sign_in = nil
					self._state = StateTitleScreenLoadSave
				else
					self._has_engaged = false
					self._start_pressed = false
				end
			elseif controller and string.match(controller._name, "Pad") and not self._has_engaged and not Application.is_constrained() then
				local index = tonumber(string.gsub(controller._name, "Pad", ""), 10)

				XboxLive.show_account_picker(index)

				local error, device_id, user_id_old, user_id_new = XboxLive.show_account_picker_result()
				local invalid_profile_id = 4294967295.0

				if error or user_id_new == invalid_profile_id then
					print("[StateTitleScreenMain] Invalid profile selected from account picker --> Resetting")

					self._has_engaged = false
					self._start_pressed = false
				else
					self._has_engaged = true
				end
			elseif can_proceed then
				self._has_engaged = false
				self._start_pressed = false
			end
		elseif platform == "ps4" then
			Managers.music:trigger_event("hud_menu_press_start")

			if PS4.signed_in() then
				Managers.input:set_exclusive_gamepad(controller)
				self._title_start_ui:set_start_pressed(true)

				self._state = StateTitleScreenLoadSave
			else
				self._queue_popup(self, Localize("popup_ps4_not_signed_in"), Localize("popup_error_topic"), "ok", Localize("popup_choice_ok"))

				self._start_pressed = false
			end
		end
	else
		self._title_start_ui:set_start_pressed(false)
	end

	return 
end
StateTitleScreenMain._next_state = function (self)
	if self._state then
		return self._state
	end

	return 
end
StateTitleScreenMain.on_exit = function (self)
	return 
end

return 
