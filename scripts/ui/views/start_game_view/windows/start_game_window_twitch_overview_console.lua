local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_twitch_overview_console_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local widget_definitions = definitions.widgets
local play_widget_definitions = definitions.play_widgets
local client_widget_definitions = definitions.client_widgets
local additional_settings_widgets_definitions = definitions.additional_settings_widgets
local animation_definitions = definitions.animation_definitions
local selector_input_definition = definitions.selector_input_definition
local START_GAME_INPUT = "refresh_press"
local SELECTION_INPUT = "confirm_press"
local CONNECT_INPUT = "special_1_press"
StartGameWindowTwitchOverviewConsole = class(StartGameWindowTwitchOverviewConsole)
StartGameWindowTwitchOverviewConsole.NAME = "StartGameWindowTwitchOverviewConsole"

StartGameWindowTwitchOverviewConsole.on_enter = function (self, params, offset)
	print("[StartGameViewWindow] Enter Substate StartGameWindowTwitchOverviewConsole")

	self._parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self._ingame_ui_context = ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._statistics_db = ingame_ui_context.statistics_db
	self._is_server = ingame_ui_context.is_server
	self._mechanism_name = Managers.mechanism:current_mechanism_name()
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._animations = {}

	self:_create_ui_elements(params, offset)

	if self._is_server then
		self._input_index = params.input_index or 1

		self:_handle_new_selection(self._input_index)
	end

	if self._is_server then
		self:_update_mission_option()
		self:_update_difficulty_option()
	end

	self._is_focused = false
	self._play_button_pressed = false
	self._show_additional_settings = false
	self._previous_can_play = nil
	local connected = Managers.twitch and Managers.twitch:is_connected()

	self:_set_input_description(connected)
	self:_set_disconnect_button_text()
	self:_setup_connected_status()

	if Managers.twitch:is_connected() then
		self:_set_active(true)
	end

	self:_start_transition_animation("on_enter")
end

StartGameWindowTwitchOverviewConsole._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings
	}
	local widgets = {}
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

StartGameWindowTwitchOverviewConsole._create_ui_elements = function (self, params, offset)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	if self._is_server then
		for name, widget_definition in pairs(play_widget_definitions) do
			local widget = UIWidget.init(widget_definition)
			widgets[#widgets + 1] = widget
			widgets_by_name[name] = widget
		end
	else
		for name, widget_definition in pairs(client_widget_definitions) do
			local widget = UIWidget.init(widget_definition)
			widgets[#widgets + 1] = widget
			widgets_by_name[name] = widget
		end
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	local additional_settings_widgets = {}
	local additional_settings_widgets_by_name = {}

	for name, widget_definition in pairs(additional_settings_widgets_definitions) do
		local widget = UIWidget.init(widget_definition)
		additional_settings_widgets[#additional_settings_widgets + 1] = widget
		additional_settings_widgets_by_name[name] = widget
	end

	self._additional_settings_widgets = additional_settings_widgets
	self._additional_settings_widgets_by_name = additional_settings_widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self._ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	if IS_PS4 then
		local frame_widget = self._widgets_by_name.frame_widget
		local frame_widget_content = frame_widget.content
		frame_widget_content.twitch_name = PlayerData.twitch_user_name or ""
	end
end

StartGameWindowTwitchOverviewConsole._set_input_description = function (self, connected)
	if self._is_server then
		if connected then
			self._parent:change_generic_actions("default_twitch_connected")
		else
			self._parent:change_generic_actions("default_twitch")
		end
	elseif connected then
		self._parent:change_generic_actions("default_twitch_client_connected")
	else
		self._parent:change_generic_actions("default_twitch_client")
	end

	self._input_description_connected = connected
end

StartGameWindowTwitchOverviewConsole._set_disconnect_button_text = function (self)
	local disconnect_button_widget = self._widgets_by_name.button_2

	if disconnect_button_widget then
		local user_name = (Managers.twitch and Managers.twitch:user_name()) or "N/A"
		disconnect_button_widget.content.button_hotspot.text = string.format(Localize("start_game_window_twitch_disconnect"), user_name)
	end
end

StartGameWindowTwitchOverviewConsole.on_exit = function (self, params)
	print("[StartGameViewWindow] Exit Substate StartGameWindowTwitchOverviewConsole")

	self._ui_animator = nil

	if self._play_button_pressed then
		params.input_index = nil
	else
		params.input_index = self._input_index
	end

	self:_set_active(false)
end

StartGameWindowTwitchOverviewConsole.set_focus = function (self, focused)
	self._is_focused = focused
end

StartGameWindowTwitchOverviewConsole.update = function (self, dt, t)
	self:_update_input_description()
	self:_update_can_play()
	self:_update_animations(dt)
	self:_handle_virtual_keyboard(dt, t)
	self:_handle_input(dt, t)
	self:_draw(dt)
end

StartGameWindowTwitchOverviewConsole.post_update = function (self, dt, t)
	return
end

StartGameWindowTwitchOverviewConsole._update_input_description = function (self)
	local previous_input_description_connected = self._input_description_connected
	local connected = Managers.twitch and Managers.twitch:is_connected()

	if connected ~= previous_input_description_connected then
		self:_set_input_description(connected)
	end
end

StartGameWindowTwitchOverviewConsole._update_can_play = function (self)
	if self._is_server then
		local can_play = self:_can_play()

		if self._previous_can_play ~= can_play then
			self._previous_can_play = can_play
			local play_button = self._widgets_by_name.play_button
			play_button.content.button_hotspot.disable_button = not can_play
			play_button.content.disabled = not can_play

			if can_play then
				self._parent:set_input_description("play_available")
			else
				self._parent:set_input_description(nil)
			end
		end
	end
end

StartGameWindowTwitchOverviewConsole._set_active = function (self, active)
	if active then
		Managers.irc:register_message_callback("twitch_gamepad", Irc.CHANNEL_MSG, callback(self, "cb_on_message_received"))
	else
		Managers.irc:unregister_message_callback("twitch_gamepad")

		local chat_output_widget = self._widgets_by_name.chat_output_widget
		local chat_output_content = chat_output_widget.content

		table.clear(chat_output_content.message_tables)
	end
end

StartGameWindowTwitchOverviewConsole.cb_on_message_received = function (self, key, message_type, user_name, message, parameter)
	local chat_output_widget = self._widgets_by_name.chat_output_widget
	local chat_output_content = chat_output_widget.content
	local message_tables = chat_output_content.message_tables
	local new_message_table = {
		is_dev = false,
		is_system = false,
		sender = string.format("%s: ", user_name),
		message = message
	}
	message_tables[#message_tables + 1] = new_message_table

	if #message_tables > 45 then
		table.remove(message_tables, 1)
	else
		chat_output_content.text_start_offset = chat_output_content.text_start_offset + 1
	end
end

StartGameWindowTwitchOverviewConsole._handle_virtual_keyboard = function (self, dt, t)
	if not self._virtual_keyboard_id then
		return
	end

	if IS_XB1 then
		if not XboxInterface.interface_active() then
			local twitch_user_name = XboxInterface.get_keyboard_result()
			self._virtual_keyboard_id = nil
			local twitch_user_name = string.gsub(twitch_user_name, " ", "")

			if twitch_user_name then
				PlayerData.twitch_user_name = twitch_user_name
			end

			local frame_widget = self._widgets_by_name.frame_widget
			local frame_widget_content = frame_widget.content
			frame_widget_content.twitch_name = twitch_user_name

			Managers.twitch:connect(twitch_user_name, callback(Managers.twitch, "cb_connection_error_callback"), callback(self, "cb_connection_success_callback"))
			self:_play_sound("Play_hud_select")
		end
	else
		local done, success, twitch_user_name = Managers.system_dialog:poll_virtual_keyboard(self._virtual_keyboard_id)

		if done then
			self._virtual_keyboard_id = nil

			if success then
				local twitch_user_name = string.gsub(twitch_user_name, " ", "")

				if twitch_user_name then
					PlayerData.twitch_user_name = twitch_user_name
				end

				local frame_widget = self._widgets_by_name.frame_widget
				local frame_widget_content = frame_widget.content
				frame_widget_content.twitch_name = twitch_user_name

				Managers.twitch:connect(twitch_user_name, callback(Managers.twitch, "cb_connection_error_callback"), callback(self, "cb_connection_success_callback"))
				self:_play_sound("Play_hud_select")
			end
		end
	end
end

StartGameWindowTwitchOverviewConsole._handle_input = function (self, dt, t)
	if self._virtual_keyboard_id then
		return
	end

	local parent = self._parent
	local input_service = parent:window_input_service()

	self:_handle_twitch_login_input(dt, t, input_service)

	if self._is_server then
		if input_service:get(SELECTION_INPUT) then
			self:_option_selected(self._input_index, t)
		end

		local input_index = self._input_index

		if input_service:get("move_down") then
			input_index = input_index + 1
		elseif input_service:get("move_up") then
			input_index = input_index - 1
		end

		if input_index ~= self._input_index then
			self:_handle_new_selection(input_index)
		end

		local widgets_by_name = self._widgets_by_name

		for i = 1, #selector_input_definition, 1 do
			local widget_name = selector_input_definition[i]
			local widget = widgets_by_name[widget_name]
			local is_selected = widget.content.is_selected

			if not is_selected and self:_is_button_hover_enter(widget) then
				self:_handle_new_selection(i)
			end

			if self:_is_button_pressed(widget) then
				self:_option_selected(self._input_index, t)
			end
		end

		if self:_can_play() then
			if self:_is_button_hover_enter(widgets_by_name.play_button) then
				self._parent:play_sound("Play_hud_hover")
			end

			if input_service:get(START_GAME_INPUT) or self:_is_button_pressed(widgets_by_name.play_button) then
				local twitch_settings = parent:get_twitch_settings(self._mechanism_name) or parent:get_twitch_settings("adventure")

				parent:play(t, twitch_settings.game_mode_type)

				self._play_button_pressed = true
			end
		end
	end
end

StartGameWindowTwitchOverviewConsole._handle_twitch_login_input = function (self, dt, t, input_service)
	local is_connecting = Managers.twitch:is_connecting()

	if not is_connecting then
		local is_connected = Managers.twitch:is_connected()
		local frame_widget = self._widgets_by_name.frame_widget

		if IS_WINDOWS then
			local frame_widget_content = frame_widget.content
			local text_input_hotspot = frame_widget_content.text_input_hotspot
			local screen_hotspot = frame_widget_content.screen_hotspot
			local frame_hotspot = frame_widget_content.frame_hotspot

			if text_input_hotspot.on_pressed and not is_connected then
				self._parent.parent:set_input_blocked(true)

				frame_widget_content.text_field_active = true
			elseif frame_widget_content.text_field_active and screen_hotspot.on_pressed then
				frame_widget_content.text_field_active = false

				self._parent.parent:set_input_blocked(false)
			end

			if frame_widget_content.text_field_active then
				input_service:get("move_up", true)
				input_service:get("move_down", true)
				input_service:get("cycle_next", true)
				input_service:get("cycle_previous", true)
				Managers.chat:block_chat_input_for_one_frame()

				local keystrokes = Keyboard.keystrokes()
				frame_widget_content.twitch_name, frame_widget_content.caret_index = KeystrokeHelper.parse_strokes(frame_widget_content.twitch_name, frame_widget_content.caret_index, "insert", keystrokes)

				if input_service:get("execute_chat_input", true) then
					frame_widget_content.text_field_active = false
					local user_name = string.gsub(frame_widget_content.twitch_name, " ", "")

					Managers.twitch:connect(user_name, callback(Managers.twitch, "cb_connection_error_callback"), callback(self, "cb_connection_success_callback"))
				elseif input_service:get("toggle_menu", true) then
					frame_widget_content.text_field_active = false

					self._parent.parent:set_input_blocked(false)
				end
			end
		end

		if not is_connected then
			local connect_button_widget = self._widgets_by_name.button_1

			if connect_button_widget and self:_is_button_hover_enter(connect_button_widget) then
				self:_play_sound("Play_hud_hover")
			end

			local button_pressed = connect_button_widget and self:_is_button_pressed(connect_button_widget)

			if button_pressed or input_service:get(CONNECT_INPUT) then
				if IS_PS4 then
					local user_id = Managers.account:user_id()
					local twitch_user_name = PlayerData.twitch_user_name
					local title = Localize("start_game_window_twitch_login_hint")
					local position = definitions.twitch_keyboard_anchor_point
					local inv_scale = RESOLUTION_LOOKUP.inv_scale
					self._virtual_keyboard_id = Managers.system_dialog:open_virtual_keyboard(user_id, title, twitch_user_name, position)
				elseif IS_XB1 then
					local twitch_user_name = PlayerData.twitch_user_name
					local title = Localize("start_game_window_twitch_login_hint")

					XboxInterface.show_virtual_keyboard(twitch_user_name, title)

					self._virtual_keyboard_id = true
				else
					local user_name = ""

					if frame_widget then
						local frame_widget_content = frame_widget.content
						user_name = string.gsub(frame_widget_content.twitch_name, " ", "")
					end

					Managers.twitch:connect(user_name, callback(Managers.twitch, "cb_connection_error_callback"), callback(self, "cb_connection_success_callback"))
					self:_play_sound("Play_hud_select")
				end
			end
		else
			local disconnect_button_widget = self._widgets_by_name.button_2

			if disconnect_button_widget and self:_is_button_hover_enter(disconnect_button_widget) then
				self:_play_sound("Play_hud_hover")
			end

			local button_pressed = disconnect_button_widget and self:_is_button_pressed(disconnect_button_widget)

			if button_pressed or input_service:get(CONNECT_INPUT) then
				self:_play_sound("Play_hud_select")
				self:_set_active(false)
				Managers.twitch:disconnect()
			end
		end
	end
end

StartGameWindowTwitchOverviewConsole._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowTwitchOverviewConsole._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StartGameWindowTwitchOverviewConsole.cb_connection_success_callback = function (self, user_data)
	self:_set_disconnect_button_text()
	self:_setup_connected_status()
	self:_set_active(true)
end

StartGameWindowTwitchOverviewConsole._setup_connected_status = function (self)
	local user_name = (Managers.twitch and Managers.twitch:user_name()) or "N/A"
	self._widgets_by_name.frame_widget.content.connected = Localize("start_game_window_twitch_connected_to") .. user_name
end

StartGameWindowTwitchOverviewConsole._can_play = function (self)
	if not self._is_server then
		return false
	end

	local parent = self._parent
	local selected_level_id = parent:get_selected_level_id()
	local selected_difficulty_key = parent:get_difficulty_option()
	local connected = Managers.twitch and Managers.twitch:is_connected()
	local can_play = selected_level_id ~= nil and selected_difficulty_key ~= nil and connected

	return can_play
end

StartGameWindowTwitchOverviewConsole._update_mission_option = function (self)
	local parent = self._parent
	local selected_level_id = parent:get_selected_level_id()

	if selected_level_id then
		self:_set_selected_level(selected_level_id)
	end

	self._widgets_by_name.mission_setting.content.button_hotspot.disable_button = selected_level_id == nil
end

StartGameWindowTwitchOverviewConsole._set_selected_level = function (self, level_id)
	local level_settings = LevelSettings[level_id]
	local mission_widget = self._widgets_by_name.mission_setting
	mission_widget.content.input_text = Localize(level_settings.display_name)
	local level_image = level_settings.level_image
	mission_widget.content.icon_texture = level_image
	local completed_difficulty_index = self._parent:get_completed_level_difficulty_index(self._statistics_db, self._stats_id, level_id)
	local level_frame = self:_get_selection_frame_by_difficulty_index(completed_difficulty_index)
	mission_widget.content.icon_frame_texture = level_frame
end

StartGameWindowTwitchOverviewConsole._get_selection_frame_by_difficulty_index = function (self, difficulty_index)
	local completed_frame_texture = "map_frame_00"

	if difficulty_index and difficulty_index > 0 then
		local difficulty_key = DefaultDifficulties[difficulty_index]
		local settings = DifficultySettings[difficulty_key]
		completed_frame_texture = settings.completed_frame_texture
	end

	return completed_frame_texture
end

StartGameWindowTwitchOverviewConsole._update_difficulty_option = function (self)
	local selected_difficulty_key = self._parent:get_difficulty_option()

	if selected_difficulty_key then
		local difficulty_settings = DifficultySettings[selected_difficulty_key]
		local difficulty_widget = self._widgets_by_name.difficulty_setting
		difficulty_widget.content.input_text = Localize(difficulty_settings.display_name)
		local display_image = difficulty_settings.display_image
		difficulty_widget.content.icon_texture = display_image
		local completed_frame_texture = difficulty_settings.completed_frame_texture
		difficulty_widget.content.icon_frame_texture = completed_frame_texture
	end
end

StartGameWindowTwitchOverviewConsole._option_selected = function (self, input_index, t)
	local parent = self._parent
	local twitch_settings = parent:get_twitch_settings(self._mechanism_name) or parent:get_twitch_settings("adventure")
	local selected_widget_name = selector_input_definition[input_index]

	if selected_widget_name == "mission_setting" then
		self._parent:set_layout_by_name(twitch_settings.layout_name)
	elseif selected_widget_name == "difficulty_setting" then
		self._parent:set_layout_by_name("difficulty_selection_custom")
	elseif selected_widget_name == "play_button" then
		if self:_can_play() then
			self._play_button_pressed = true

			self._parent:play(t, twitch_settings.game_mode_type)
		end
	else
		ferror("Unknown selector_input_definition: %s", selected_widget_name)
	end
end

StartGameWindowTwitchOverviewConsole._handle_new_selection = function (self, input_index)
	local widgets_by_name = self._widgets_by_name
	local num_inputs = #selector_input_definition
	input_index = math.clamp(input_index, 1, num_inputs)
	local widget_name = selector_input_definition[input_index]
	local widget = widgets_by_name[widget_name]
	local widget_content = widget.content

	if widget_content.disabled then
		return
	end

	for i = 1, #selector_input_definition, 1 do
		local widget_name = selector_input_definition[i]
		local widget = widgets_by_name[widget_name]

		if widget then
			local is_selected = i == input_index
			widget.content.is_selected = is_selected
		end
	end

	if self._input_index ~= input_index then
		self._parent:play_sound("play_gui_lobby_button_02_mission_act_click")
	end

	self._input_index = input_index
end

StartGameWindowTwitchOverviewConsole._update_animations = function (self, dt)
	if not IS_PS4 and not Managers.input:is_device_active("gamepad") then
		self:_update_button_animations(dt)
	end

	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	if self._is_server then
		local widgets_by_name = self._widgets_by_name

		UIWidgetUtils.animate_start_game_console_setting_button(widgets_by_name.mission_setting, dt)
		UIWidgetUtils.animate_start_game_console_setting_button(widgets_by_name.difficulty_setting, dt)
		UIWidgetUtils.animate_play_button(widgets_by_name.play_button, dt)
	end
end

StartGameWindowTwitchOverviewConsole._update_button_animations = function (self, dt)
	local widgets_by_name = self._widgets_by_name
	local widget_prefix = "button_"

	for i = 1, 2, 1 do
		local widget_name = widget_prefix .. i
		local widget = widgets_by_name[widget_name]

		self:_animate_button(widget, dt)
	end
end

StartGameWindowTwitchOverviewConsole._animate_button = function (self, widget, dt)
	local content = widget.content
	local hotspot_name = "button_hotspot"
	local hotspot = content[hotspot_name]
	local input_speed = 20
	local input_progress = hotspot.input_progress or 0
	local input_pressed = hotspot.is_clicked and hotspot.is_clicked == 0

	if input_pressed then
		input_progress = math.min(input_progress + dt * input_speed, 1)
	else
		input_progress = math.max(input_progress - dt * input_speed, 0)
	end

	local speed = 8
	local hover_progress = hotspot.hover_progress or 0
	local is_hover = not hotspot.disable_button and hotspot.is_hover

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	local selection_progress = hotspot.selection_progress or 0
	local is_selected = not hotspot.disable_button and hotspot.is_selected

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
	end

	local combined_progress = math.max(hover_progress, selection_progress)
	local style = widget.style
	local clicked_rect_name = "clicked_rect"
	style[clicked_rect_name].color[1] = 100 * input_progress
	local hover_glow_name = "hover_glow"
	local hover_alpha = 255 * combined_progress
	style[hover_glow_name].color[1] = hover_alpha
	local text_name = "text"
	local text_style = style[text_name]
	local text_color = text_style.text_color
	local default_text_color = text_style.default_text_color
	local select_text_color = text_style.select_text_color

	Colors.lerp_color_tables(default_text_color, select_text_color, combined_progress, text_color)

	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

StartGameWindowTwitchOverviewConsole._draw = function (self, dt)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()
	local render_settings = self._render_settings
	local parent_scenegraph_id = nil

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, parent_scenegraph_id, render_settings)

	local widgets = self._widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	if self._show_additional_settings then
		local additional_settings_widgets = self._additional_settings_widgets

		for i = 1, #additional_settings_widgets, 1 do
			local widget = additional_settings_widgets[i]

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_top_renderer)
end

StartGameWindowTwitchOverviewConsole._play_sound = function (self, event)
	self._parent:play_sound(event)
end

return
