-- chunkname: @scripts/ui/dlc_versus/views/start_game_view/windows/start_game_window_versus_additional_settings.lua

StartGameWindowVersusAdditionalSettings = class(StartGameWindowVersusAdditionalSettings, StartGameWindowAdditionalSettingsConsole)
StartGameWindowVersusAdditionalSettings.NAME = "StartGameWindowVersusAdditionalSettings"

local definitions = local_require("scripts/ui/dlc_versus/views/start_game_view/windows/definitions/start_game_window_versus_additional_settings_definitions")

StartGameWindowVersusAdditionalSettings.create_ui_elements = function (self, _, params, offset)
	StartGameWindowVersusAdditionalSettings.super.create_ui_elements(self, definitions, params, offset)
end

StartGameWindowVersusAdditionalSettings._set_additional_options_enabled_state = function (self, enabled)
	local widgets_by_name = self._widgets_by_name
	local dedicated_servers_win_checkbox = widgets_by_name.dedicated_servers_win_checkbox

	dedicated_servers_win_checkbox.content.button_hotspot.disable_button = not enabled

	local dedicated_servers_aws_checkbox = widgets_by_name.dedicated_servers_aws_checkbox

	dedicated_servers_aws_checkbox.content.button_hotspot.disable_button = not enabled

	local player_hosted_checkbox = widgets_by_name.player_hosted_checkbox

	player_hosted_checkbox.content.button_hotspot.disable_button = not enabled
	self._additional_option_enabled = enabled
end

StartGameWindowVersusAdditionalSettings._handle_input = function (self, dt, t)
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
		local dedicated_servers_win_checkbox = widgets_by_name.dedicated_servers_win_checkbox
		local dedicated_servers_aws_checkbox = widgets_by_name.dedicated_servers_aws_checkbox
		local player_hosted_checkbox = widgets_by_name.player_hosted_checkbox

		UIWidgetUtils.animate_default_checkbox_button_console(dedicated_servers_win_checkbox, dt)
		UIWidgetUtils.animate_default_checkbox_button_console(dedicated_servers_aws_checkbox, dt)
		UIWidgetUtils.animate_default_checkbox_button_console(player_hosted_checkbox, dt)

		if self:_is_button_hover_enter(dedicated_servers_win_checkbox) or self:_is_button_hover_enter(dedicated_servers_aws_checkbox) or self:_is_button_hover_enter(player_hosted_checkbox) then
			self:_play_sound("play_gui_lobby_button_01_difficulty_confirm_hover")
		end

		local dedicated_servers_win_enabled = self:_is_other_option_button_selected(dedicated_servers_win_checkbox, self._dedicated_servers_win_checkbox_enabled)

		if dedicated_servers_win_enabled ~= nil then
			parent:set_dedicated_or_player_hosted_search(dedicated_servers_win_enabled, self._dedicated_servers_aws_checkbox_enabled, self._player_hosted_checkbox_enabled)
		end

		local dedicated_servers_aws = self:_is_other_option_button_selected(dedicated_servers_aws_checkbox, self._dedicated_servers_aws_checkbox_enabled)

		if dedicated_servers_aws ~= nil then
			parent:set_dedicated_or_player_hosted_search(self._dedicated_servers_win_checkbox_enabled, dedicated_servers_aws, self._player_hosted_checkbox_enabled)
		end

		local player_hosted_enabled = self:_is_other_option_button_selected(player_hosted_checkbox, self._player_hosted_checkbox_enabled)

		if player_hosted_enabled ~= nil then
			parent:set_dedicated_or_player_hosted_search(self._dedicated_servers_win_checkbox_enabled, self._dedicated_servers_aws_checkbox_enabled, player_hosted_enabled)
		end
	end

	if self.gamepad_active_last_frame then
		local consume = true

		if input_service:get("back_menu", consume) or input_service:get("refresh", consume) or input_service:get("right_stick_press", consume) then
			parent:set_window_input_focus(self._parent_window_name or "custom_game_overview")
		end
	end
end

StartGameWindowVersusAdditionalSettings._update_additional_options = function (self)
	local parent = self.parent
	local player_hosted_enabled = parent:using_player_hosted_search()
	local dedicated_servers_win_enabled, dedicated_servers_aws_enabled = parent:using_dedicated_servers_search()
	local lobby = self._network_lobby
	local num_members = lobby:members():get_member_count()
	local is_alone = num_members == 1

	if is_alone ~= self._is_alone or player_hosted_enabled ~= self._player_hosted_enabled or dedicated_servers_win_enabled ~= self._dedicated_servers_win_enabled or dedicated_servers_aws_enabled ~= self._dedicated_servers_aws_enabled then
		local widgets_by_name = self._widgets_by_name
		local button_hotspot = widgets_by_name.player_hosted_checkbox.content.button_hotspot

		button_hotspot.is_selected = player_hosted_enabled

		local button_hotspot = widgets_by_name.dedicated_servers_win_checkbox.content.button_hotspot

		button_hotspot.is_selected = dedicated_servers_win_enabled
		button_hotspot.disable_button = not dedicated_servers_aws_enabled

		local button_hotspot = widgets_by_name.dedicated_servers_aws_checkbox.content.button_hotspot

		button_hotspot.is_selected = dedicated_servers_aws_enabled
		button_hotspot.disable_button = not dedicated_servers_win_enabled
		self._dedicated_servers_win_checkbox_enabled = dedicated_servers_win_enabled
		self._dedicated_servers_aws_checkbox_enabled = dedicated_servers_aws_enabled
		self._player_hosted_checkbox_enabled = player_hosted_enabled
		self._is_alone = is_alone
	end
end
