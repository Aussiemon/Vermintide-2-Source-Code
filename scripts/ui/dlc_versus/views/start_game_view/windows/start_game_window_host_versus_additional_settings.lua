-- chunkname: @scripts/ui/dlc_versus/views/start_game_view/windows/start_game_window_host_versus_additional_settings.lua

StartGameWindowHostVersusAdditionalSettings = class(StartGameWindowHostVersusAdditionalSettings, StartGameWindowAdditionalSettingsConsole)
StartGameWindowHostVersusAdditionalSettings.NAME = "StartGameWindowHostVersusAdditionalSettings"

local definitions = local_require("scripts/ui/dlc_versus/views/start_game_view/windows/definitions/start_game_window_host_versus_additional_settings_definitions")

StartGameWindowHostVersusAdditionalSettings.create_ui_elements = function (self, _, params, offset)
	StartGameWindowHostVersusAdditionalSettings.super.create_ui_elements(self, definitions, params, offset)
end

StartGameWindowHostVersusAdditionalSettings._set_additional_options_enabled_state = function (self, enabled)
	local widgets_by_name = self._widgets_by_name
	local private_button = widgets_by_name.private_button

	private_button.content.button_hotspot.disable_button = not enabled
	self._additional_option_enabled = enabled
end

StartGameWindowHostVersusAdditionalSettings._handle_input = function (self, dt, t)
	local parent = self.parent
	local input_service = parent:window_input_service()

	if self._additional_option_enabled then
		local gamepad_active = Managers.input:is_device_active("gamepad")

		if gamepad_active then
			self:_handle_gamepad_input(dt, t, input_service)
		else
			self:_handle_mouse_input(dt, t, input_service)
		end

		local widgets_by_name = self._widgets_by_name
		local private_button = widgets_by_name.private_button

		UIWidgetUtils.animate_default_checkbox_button_console(private_button, dt)

		if self:_is_button_hover_enter(private_button) then
			self:_play_sound("play_gui_lobby_button_01_difficulty_confirm_hover")
		end

		local changed_selection = self:_is_other_option_button_selected(private_button, self._private_enabled)

		if changed_selection ~= nil then
			parent:set_private_option_enabled(changed_selection)
		end
	end

	if self.gamepad_active_last_frame then
		local consume = true

		if input_service:get("back_menu", consume) or input_service:get("refresh", consume) or input_service:get("right_stick_press", consume) then
			parent:set_window_input_focus(self._parent_window_name or "custom_game_overview")
		end
	end
end

StartGameWindowHostVersusAdditionalSettings._update_additional_options = function (self)
	local parent = self.parent
	local private_enabled = parent:is_private_option_enabled()
	local lobby = self._network_lobby
	local num_members = lobby:members():get_member_count()
	local is_alone = num_members == 1

	if is_alone ~= self._is_alone or private_enabled ~= self._private_enabled then
		local widgets_by_name = self._widgets_by_name
		local private_is_selected = private_enabled
		local private_hotspot = widgets_by_name.private_button.content.button_hotspot

		private_hotspot.is_selected = private_is_selected
		self._private_enabled = private_enabled
		self._is_alone = is_alone
	end
end
