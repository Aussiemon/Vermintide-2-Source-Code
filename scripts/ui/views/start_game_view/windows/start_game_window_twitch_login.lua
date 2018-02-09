local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_twitch_login_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = true
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
	local local_player = player_manager.local_player(player_manager)
	self._stats_id = local_player.stats_id(local_player)
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}

	self.create_ui_elements(self, params, offset)
	self.set_active(self, true)

	return 
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

	self._connect_button_widget = UIWidget.init(definitions.connect_button)
	local button_text_style = self._connect_button_widget.style.title_text
	button_text_style.text_color = Colors.get_color_table_with_alpha("twitch", 255)
	button_text_style.text_color_enabled = Colors.get_color_table_with_alpha("twitch", 255)
	self._disconnect_button_widget = UIWidget.init(definitions.disconnect_button)
	local button_text_style = self._disconnect_button_widget.style.title_text
	button_text_style.text_color = Colors.get_color_table_with_alpha("red", 255)
	button_text_style.text_color_enabled = Colors.get_color_table_with_alpha("red", 255)
	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	return 
end
StartGameWindowTwitchLogin.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowTwitchLogin")

	self.ui_animator = nil

	self.set_active(self, false)

	return 
end
StartGameWindowTwitchLogin.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self.create_ui_elements(self)
	end

	self._update_animations(self, dt)
	self._handle_input(self, dt, t)
	self._update_game_options(self, dt, t)
	self.draw(self, dt)

	return 
end
StartGameWindowTwitchLogin.set_active = function (self, active, skip_block)
	self._active = active

	if active then
		Managers.irc:register_message_callback("twitch", Irc.CHANNEL_MSG, callback(self, "cb_on_message_received"))
	else
		Managers.irc:unregister_message_callback("twitch")
	end

	return 
end
StartGameWindowTwitchLogin._handle_input = function (self, dt, t)
	local frame_widget = self._widgets_by_name.frame_widget
	local frame_widget_content = frame_widget.content
	local input_service = self.parent:window_input_service()
	local is_connecting = Managers.twitch:is_connecting()
	local is_connected = Managers.twitch:is_connected()

	if is_connecting then
		local connect_button_content = self._connect_button_widget.content
		local connect_button_hotspot = connect_button_content.button_hotspot
		connect_button_hotspot.on_pressed = false
		local disconnect_button_content = self._disconnect_button_widget.content
		local disconnect_button_hotspot = disconnect_button_content.button_hotspot
		disconnect_button_hotspot.on_pressed = false
	else
		local input_hotspot = frame_widget_content.text_input_hotspot
		local screen_hotspot = frame_widget_content.screen_hotspot
		local frame_hotspot = frame_widget_content.frame_hotspot

		if input_hotspot.on_pressed and not is_connected then
			frame_widget_content.text_field_active = true
		elseif screen_hotspot.on_pressed or is_connected then
			if screen_hotspot.on_pressed and not frame_widget_content.text_field_active and not frame_hotspot.on_pressed then
				self.set_active(self, false)

				return 
			end

			frame_widget_content.text_field_active = false
		end

		if frame_widget_content.text_field_active then
			local keystrokes = Keyboard.keystrokes()
			frame_widget_content.twitch_name, frame_widget_content.caret_index = KeystrokeHelper.parse_strokes(frame_widget_content.twitch_name, frame_widget_content.caret_index, "insert", keystrokes)

			if input_service.get(input_service, "execute_login", true) then
				frame_widget_content.text_field_active = false
				local user_name = string.gsub(frame_widget_content.twitch_name, " ", "")

				Managers.twitch:connect(user_name, callback(self, "cb_connection_callback"))
			end
		end

		local connect_button_content = self._connect_button_widget.content
		local connect_button_hotspot = connect_button_content.button_hotspot

		if connect_button_hotspot.on_pressed and not is_connected then
			local user_name = string.gsub(frame_widget_content.twitch_name, " ", "")

			Managers.twitch:connect(user_name, callback(self, "cb_connection_callback"))
		end

		local disconnect_button_content = self._disconnect_button_widget.content
		local disconnect_button_hotspot = disconnect_button_content.button_hotspot

		if disconnect_button_hotspot.on_pressed and is_connected then
			Managers.twitch:disconnect()

			local chat_output_widget = self._widgets_by_name.chat_output_widget
			local chat_output_content = chat_output_widget.content
			chat_output_content.message_tables = {}
			chat_output_content.text_start_offset = 0
		end
	end

	return 
end
StartGameWindowTwitchLogin._update_game_options = function (self, dt, t)
	local is_connected = Managers.twitch:is_connected()
	local is_connecting = Managers.twitch:is_connecting()

	if is_connecting or is_connected then
		self.parent:enable_widget(1, "game_option_1", false)
		self.parent:enable_widget(1, "game_option_2", false)
		self.parent:enable_widget(1, "game_option_3", false)
	elseif not is_connecting and not is_connected then
		self.parent:enable_widget(1, "game_option_1", true)
		self.parent:enable_widget(1, "game_option_2", true)
		self.parent:enable_widget(1, "game_option_3", true)
	end

	return 
end
StartGameWindowTwitchLogin.cb_connection_callback = function (self, message)
	local widget = self._widgets_by_name.frame_widget
	local content = widget.content
	local style = widget.style
	content.error_id = message
	style.error_field.text_color[1] = 255
	self._error_timer = 5

	return 
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

	if 20 < #message_tables then
		table.remove(message_tables, 1)
	else
		chat_output_content.text_start_offset = chat_output_content.text_start_offset + 1
	end

	return 
end
StartGameWindowTwitchLogin.post_update = function (self, dt, t)
	return 
end
StartGameWindowTwitchLogin._update_animations = function (self, dt)
	self.ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator.is_animation_completed(ui_animator, animation_id) then
			ui_animator.stop_animation(ui_animator, animation_id)

			animations[animation_name] = nil
		end
	end

	local widgets_by_name = self._widgets_by_name

	return 
end
StartGameWindowTwitchLogin._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
end
StartGameWindowTwitchLogin._is_stepper_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot_left = content.button_hotspot_left
	local hotspot_right = content.button_hotspot_right

	if hotspot_left.on_release then
		hotspot_left.on_release = false

		return true, -1
	elseif hotspot_right.on_release then
		hotspot_right.on_release = false

		return true, 1
	end

	return 
end
StartGameWindowTwitchLogin._update_private_option = function (self)
	local parent = self.parent
	local private_enabled = parent.is_private_option_enabled(parent)

	if private_enabled ~= self._private_enabled then
		local widgets_by_name = self._widgets_by_name
		widgets_by_name.private_option.content.checked = private_enabled
		self._private_enabled = private_enabled
	end

	return 
end
StartGameWindowTwitchLogin._update_difficulty_option = function (self)
	local parent = self.parent
	local difficulty_key = parent.get_difficulty_option(parent)

	if difficulty_key ~= self._difficulty_key then
		self._set_difficulty_option(self, difficulty_key)

		self._difficulty_key = difficulty_key
	end

	return 
end
StartGameWindowTwitchLogin._set_difficulty_option = function (self, difficulty_key)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.difficulty_title
	local difficulty_settings = DifficultySettings[difficulty_key]
	local display_name = difficulty_settings.display_name
	widget.content.text = Localize(display_name)

	return 
end
StartGameWindowTwitchLogin._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level

	return 
end
StartGameWindowTwitchLogin.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()
	local is_connected = Managers.twitch:is_connected()
	local is_connecting = Managers.twitch:is_connecting()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	if not is_connecting then
		if is_connected then
			UIRenderer.draw_widget(ui_renderer, self._disconnect_button_widget)
		else
			UIRenderer.draw_widget(ui_renderer, self._connect_button_widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end
StartGameWindowTwitchLogin._play_sound = function (self, event)
	self.parent:play_sound(event)

	return 
end

return 
