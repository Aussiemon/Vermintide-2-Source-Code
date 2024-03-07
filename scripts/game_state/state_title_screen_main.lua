-- chunkname: @scripts/game_state/state_title_screen_main.lua

require("scripts/ui/views/title_main_ui")
require("scripts/ui/views/weave_splash_ui")

if script_data.honduras_demo then
	require("scripts/ui/views/demo_title_ui")
end

StateTitleScreenMain = class(StateTitleScreenMain)
StateTitleScreenMain.NAME = "StateTitleScreenMain"

local ATTRACT_MODE_TIMER = script_data.honduras_demo and DemoSettings.attract_timer or nil

StateTitleScreenMain.on_enter = function (self, params)
	print("[Gamestate] Enter Substate StateTitleScreenMain")

	self._params = params
	self._world = self._params.world
	self._viewport = self._params.viewport
	self._attract_mode_timer = ATTRACT_MODE_TIMER
	self._attract_mode_active = false
	self._auto_start = params.auto_start
	self._auto_sign_in = params.auto_sign_in
	self.input_manager = Managers.input
	self._windows_auto_sign_in = self.parent.parent.loading_context.windows_auto_sign_in
	self.parent.parent.loading_context.windows_auto_sign_in = nil
	self._title_start_ui = params.ui

	if self._title_start_ui and IS_CONSOLE then
		self._title_start_ui:clear_user_name()
	end

	self:_setup_account_manager()

	self._error_popups = {}

	if IS_XB1 then
		if not Managers.account:should_teardown_xboxlive() then
			Managers.account:reset()
		end

		if Managers.xbox_stats then
			Managers.xbox_stats:destroy()

			Managers.xbox_stats = nil
		end
	elseif IS_PS4 then
		Managers.account:reset()
	else
		Managers.account:reset()
	end

	if Managers.twitch then
		Managers.twitch:reset()
	end

	if Managers.matchmaking then
		Managers.matchmaking:destroy()

		Managers.matchmaking = nil
	end

	Managers.input:set_all_gamepads_available()

	if Managers.voice_chat and Managers.voice_chat:initiated() then
		Managers.voice_chat:reset()
	end

	self._network_event_meta_table = {}

	self._network_event_meta_table.__index = function (event_table, event_key)
		return function ()
			Application.warning("Got RPC %s during forced network update when exiting StateTitleScreenMain", event_key)
		end
	end

	if IS_PS4 and self.parent.invite_handled then
		Managers.invite:clear_invites()

		self.parent.invite_handled = nil
	end

	if script_data.honduras_demo then
		Wwise.set_state("menu_mute_ingame_sounds", "true")
	end

	if not self._params.menu_screen_music_playing and not GameSettingsDevelopment.skip_start_screen and not Development.parameter("skip_start_screen") and not self._auto_start then
		Managers.music:trigger_event("Play_console_menu_music")

		self._params.menu_screen_music_playing = true
	elseif self._params.menu_screen_music_playing then
		Managers.music:trigger_event("Play_console_menu_music_reset_switch")
	end
end

StateTitleScreenMain._queue_popup = function (self, ...)
	self._error_popups[#self._error_popups + 1] = Managers.popup:queue_popup(...)
end

StateTitleScreenMain._setup_account_manager = function (self)
	Managers.account = Managers.account or AccountManager:new()
end

StateTitleScreenMain.update = function (self, dt, t)
	self:_update_network(dt, t)

	if Managers.voice_chat then
		Managers.voice_chat:update(dt, t)
	end

	if not GameSettingsDevelopment.skip_start_screen and not Development.parameter("skip_start_screen") then
		local loading_context = self.parent.parent.loading_context

		if loading_context.previous_session_error then
			local previous_session_error = loading_context.previous_session_error

			loading_context.previous_session_error = nil

			self:_queue_popup(Localize(previous_session_error), Localize("popup_error_topic"), "ok", Localize("menu_ok"))
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
			self:_handle_continue_input(dt, t)
			self:_update_input(dt, t)
			self:_update_attract_mode(dt, t)
		end
	else
		self._state = StateTitleScreenInitNetwork
	end

	return self:_next_state()
end

StateTitleScreenMain._update_network = function (self, dt, t)
	if rawget(_G, "LobbyInternal") and LobbyInternal.network_initialized() then
		Network.update(dt, setmetatable({}, self._network_event_meta_table))
	end
end

StateTitleScreenMain._update_attract_mode = function (self, dt, t)
	if IS_WINDOWS then
		return
	end

	if self._title_start_ui:attract_mode() then
		if self._title_start_ui:video_completed() then
			self:_exit_attract_mode()
		end
	elseif self._attract_mode_timer then
		self._attract_mode_timer = self._attract_mode_timer - dt

		if self._attract_mode_timer <= 0 then
			self:_enter_attract_mode()
		end
	end
end

StateTitleScreenMain._enter_attract_mode = function (self)
	Managers.music:stop_all_sounds()
	self._title_start_ui:enter_attract_mode()
	self.parent:enter_attract_mode(true)

	self._attract_mode_active = true
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
end

StateTitleScreenMain._handle_continue_input = function (self, dt, t)
	local input_service = self.input_manager:get_service("main_menu")
	local start_allowed = true

	if script_data.honduras_demo then
		start_allowed = not self._title_start_ui:in_transition()
	end

	if start_allowed then
		if input_service:get("start", true) or self._windows_auto_sign_in then
			local current_device = Managers.input:get_most_recent_device()

			if IS_XB1 and (current_device._name == "Keyboard" or current_device._name == "Mouse") then
				self:_queue_popup(Localize("popup_signin_only_with_gamepad"), Localize("popup_notice_topic"), "ok", Localize("popup_choice_ok"))
			else
				self._start_pressed = true
			end
		elseif script_data.honduras_demo then
			local current_device = Managers.input:get_most_recent_device()

			if current_device:any_pressed() then
				if IS_XB1 and (current_device._name == "Keyboard" or current_device._name == "Mouse") then
					self:_queue_popup(Localize("popup_signin_only_with_gamepad"), Localize("popup_notice_topic"), "ok", Localize("popup_choice_ok"))
				else
					self._start_pressed = true
				end
			end
		end
	end

	if IS_CONSOLE and self._title_start_ui:attract_mode() then
		local current_device = Managers.input:get_most_recent_device()

		if current_device:any_pressed() then
			self._start_pressed = true
		end
	end

	if input_service:has("delete_save") and input_service:get("delete_save") and BUILD ~= "release" then
		StateTitleScreenLoadSave.DELETE_SAVE = true
	end
end

StateTitleScreenMain._user_exists = function (self, user_id)
	local users = {
		XboxLive.users(),
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

	if IS_PS4 then
		local play_together_list = SessionInvitation.play_together_list()

		if play_together_list then
			Managers.invite:set_play_together_list(play_together_list)
		end
	end

	if IS_PS4 and (Managers.invite:has_invitation() or Managers.invite:play_together_list()) and not self._state then
		if Managers.play_go:installed() then
			Managers.music:trigger_event("Play_console_menu_select")

			if PS4.signed_in() then
				Managers.account:set_controller(controller)
				Managers.input:set_exclusive_gamepad(controller)
				self._title_start_ui:set_start_pressed(true)

				self._state = StateTitleScreenLoadSave

				if Managers.invite:has_invitation() then
					self.parent.invite_handled = true
				end
			else
				self:_queue_popup(Localize("popup_ps4_not_signed_in"), Localize("popup_error_topic"), "ok", Localize("popup_choice_ok"))

				self._start_pressed = false
			end
		else
			self:_queue_popup(Localize("popup_invite_not_installed"), Localize("popup_invite_not_installed_header"), "not_installed", Localize("menu_ok"))
		end
	elseif (self._start_pressed or LEVEL_EDITOR_TEST or self._auto_start or GameSettingsDevelopment.skip_start_screen or Development.parameter("skip_start_screen") or self._params.switch_user_auto_sign_in or self._has_engaged) and not self._state then
		if IS_CONSOLE and self._title_start_ui:attract_mode() then
			self:_exit_attract_mode()

			self._start_pressed = false
		elseif IS_WINDOWS then
			if not GameSettingsDevelopment.skip_start_screen and not Development.parameter("skip_start_screen") then
				Managers.music:trigger_event("hud_menu_press_start")
			end

			self._state = StateTitleScreenInitNetwork

			self._title_start_ui:set_start_pressed(true)
			self._title_start_ui:set_information_text(Localize("loading_signing_in"))
		elseif IS_XB1 then
			if not controller or controller.type() ~= "xbox_controller" then
				self._start_pressed = false

				return
			end

			if not Managers.account:all_lobbies_freed() then
				self._start_pressed = false

				return
			end

			local user_id = controller and controller.user_id()

			if Application.is_constrained() then
				self._has_engaged = false
			end

			local can_proceed = true

			if self._has_engaged then
				can_proceed = user_id and self:_user_exists(user_id)
			end

			if can_proceed and user_id and Managers.account:user_exists(user_id) then
				if Managers.account:sign_in(user_id, controller, self._auto_sign_in) then
					Managers.music:trigger_event("Play_console_menu_select")
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
				local invalid_profile_id = 4294967295

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
		elseif IS_PS4 then
			Managers.music:trigger_event("Play_console_menu_select")
			Managers.input:set_exclusive_gamepad(controller)
			Managers.account:set_controller(controller)
			self._title_start_ui:set_start_pressed(true)

			self._state = StateTitleScreenLoadSave
		end
	else
		self._title_start_ui:set_start_pressed(false)
	end
end

StateTitleScreenMain._next_state = function (self)
	if self._state then
		return self._state
	end
end

StateTitleScreenMain.on_exit = function (self)
	return
end
