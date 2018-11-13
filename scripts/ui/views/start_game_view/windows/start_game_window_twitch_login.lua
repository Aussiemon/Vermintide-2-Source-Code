local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_twitch_login_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
StartGameWindowTwitchLogin = class(StartGameWindowTwitchLogin)
StartGameWindowTwitchLogin.NAME = "StartGameWindowTwitchLogin"

StartGameWindowTwitchLogin.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowTwitchLogin")

	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id

	self:create_ui_elements(params, offset)
	self:set_active(true)
	self:_set_disconnect_button_text()
end

StartGameWindowTwitchLogin.create_ui_elements = function (self, params, offset)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StartGameWindowTwitchLogin.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowTwitchLogin")
	self:set_active(false)
end

StartGameWindowTwitchLogin.update = function (self, dt, t)
	self:_update_popup()
	self:_update_animations(dt)
	self:_handle_input(dt, t)
	self:_update_game_options(dt, t)
	self:draw(dt)
end

StartGameWindowTwitchLogin.set_active = function (self, active, skip_block)
	self._active = active

	if PLATFORM == "win32" then
		if active then
			Managers.irc:register_message_callback("twitch", Irc.CHANNEL_MSG, callback(self, "cb_on_message_received"))
		else
			Managers.irc:unregister_message_callback("twitch")
		end
	end
end

StartGameWindowTwitchLogin._update_popup = function (self)
	if self._error_popup_id then
		local result = Managers.popup:query_result(self._error_popup_id)

		if result == "ok" then
			self._error_popup_id = nil
		elseif result then
			fassert(false, "[StateTitleScreenMainMenu] The popup result doesn't exist (%s)", result)
		end
	end
end

StartGameWindowTwitchLogin._handle_input = function (self, dt, t)
	local is_connecting = Managers.twitch:is_connecting()

	if not is_connecting then
		local is_connected = Managers.twitch:is_connected()
		local frame_widget = self._widgets_by_name.frame_widget

		if PLATFORM == "win32" then
			local frame_widget_content = frame_widget.content
			local text_input_hotspot = frame_widget_content.text_input_hotspot
			local screen_hotspot = frame_widget_content.screen_hotspot
			local frame_hotspot = frame_widget_content.frame_hotspot

			if text_input_hotspot.on_pressed and not is_connected then
				self.parent.parent:set_input_blocked(true)

				frame_widget_content.text_field_active = true
			elseif screen_hotspot.on_pressed or is_connected then
				if screen_hotspot.on_pressed and not frame_widget_content.text_field_active and not frame_hotspot.on_pressed then
					self:set_active(false)

					frame_widget_content.text_field_active = false

					self.parent.parent:set_input_blocked(false)

					return
				end

				frame_widget_content.text_field_active = false

				self.parent.parent:set_input_blocked(false)
			end

			if frame_widget_content.text_field_active then
				local keystrokes = Keyboard.keystrokes()
				frame_widget_content.twitch_name, frame_widget_content.caret_index = KeystrokeHelper.parse_strokes(frame_widget_content.twitch_name, frame_widget_content.caret_index, "insert", keystrokes)
				local input_service = self.parent:window_input_service()

				if input_service:get("execute_login", true) then
					frame_widget_content.text_field_active = false
					local user_name = string.gsub(frame_widget_content.twitch_name, " ", "")

					Managers.twitch:connect(user_name, callback(self, "cb_connection_error_callback"), callback(self, "cb_connection_success_callback"))
				end
			end
		end

		if not is_connected then
			local connect_button_widget = self._widgets_by_name.button_1

			if self:_is_button_hover_enter(connect_button_widget) then
				self:_play_sound("Play_hud_hover")
			end

			local button_pressed = self:_is_button_pressed(connect_button_widget)

			if button_pressed then
				local user_name = ""

				if frame_widget then
					local frame_widget_content = frame_widget.content
					user_name = string.gsub(frame_widget_content.twitch_name, " ", "")
				end

				Managers.twitch:connect(user_name, callback(self, "cb_connection_error_callback"), callback(self, "cb_connection_success_callback"))
				self:_play_sound("Play_hud_select")
			end
		else
			local disconnect_button_widget = self._widgets_by_name.button_2

			if self:_is_button_hover_enter(disconnect_button_widget) then
				self:_play_sound("Play_hud_hover")
			end

			local button_pressed = self:_is_button_pressed(disconnect_button_widget)

			if button_pressed then
				self:_play_sound("Play_hud_select")
				Managers.twitch:disconnect()

				local chat_output_widget = self._widgets_by_name.chat_output_widget
				local chat_output_content = chat_output_widget.content
				chat_output_content.message_tables = {}
				chat_output_content.text_start_offset = 0
			end
		end
	end
end

StartGameWindowTwitchLogin._update_game_options = function (self, dt, t)
	local is_connected = Managers.twitch:is_connected()
	local is_connecting = Managers.twitch:is_connecting()

	if is_connecting or is_connected then
		self.parent:enable_widget(1, "game_option_1", false)
		self.parent:enable_widget(1, "game_option_2", false)
		self.parent:enable_widget(1, "game_option_3", false)
		self.parent:enable_widget(1, "game_option_5", false)
	elseif not is_connecting and not is_connected then
		self.parent:enable_widget(1, "game_option_1", true)
		self.parent:enable_widget(1, "game_option_2", true)
		self.parent:enable_widget(1, "game_option_3", true)
		self.parent:enable_widget(1, "game_option_5", true)
	end
end

StartGameWindowTwitchLogin.cb_connection_error_callback = function (self, message)
	self._error_popup_id = Managers.popup:queue_popup(message, Localize("popup_header_error_twitch"), "ok", Localize("popup_choice_ok"))
end

StartGameWindowTwitchLogin.cb_connection_success_callback = function (self, user_data)
	self:_set_disconnect_button_text()
end

StartGameWindowTwitchLogin._set_disconnect_button_text = function (self)
	local user_name = (Managers.twitch and Managers.twitch:user_name()) or "N/A"
	local disconnect_button_widget = self._widgets_by_name.button_2
	disconnect_button_widget.content.button_hotspot.text = string.format(Localize("start_game_window_twitch_disconnect"), user_name)
end

StartGameWindowTwitchLogin.cb_on_message_received = function (self, key, message_type, user_name, message, parameter)
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

	if #message_tables > 20 then
		table.remove(message_tables, 1)
	else
		chat_output_content.text_start_offset = chat_output_content.text_start_offset + 1
	end
end

StartGameWindowTwitchLogin._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowTwitchLogin._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StartGameWindowTwitchLogin.post_update = function (self, dt, t)
	return
end

StartGameWindowTwitchLogin._update_animations = function (self, dt)
	self:_update_button_animations(dt)
end

StartGameWindowTwitchLogin._update_button_animations = function (self, dt)
	local widgets_by_name = self._widgets_by_name
	local widget_prefix = "button_"

	for i = 1, 2, 1 do
		local widget_name = widget_prefix .. i
		local widget = widgets_by_name[widget_name]

		self:_animate_button(widget, dt)
	end
end

StartGameWindowTwitchLogin._animate_button = function (self, widget, dt)
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

StartGameWindowTwitchLogin.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	local widgets = self._widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

StartGameWindowTwitchLogin._play_sound = function (self, event)
	self.parent:play_sound(event)
end

return
