require("scripts/utils/keystroke_helper")

local definitions = local_require("scripts/ui/views/twitch_view_definitions")
TwitchView = class(TwitchView)

TwitchView.init = function (self, ingame_ui_context)
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ingame_ui = ingame_ui_context.ingame_ui
	self._network_lobby = ingame_ui_context.network_lobby
	self._matchmaking_manager = ingame_ui_context.matchmaking_manager
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._network_server = ingame_ui_context.network_server
	local input_manager = ingame_ui_context.input_manager

	input_manager:create_input_service("twitch_view", "TwitchControllerSettings", "TwitchControllerFilters")
	input_manager:map_device_to_service("twitch_view", "keyboard")
	input_manager:map_device_to_service("twitch_view", "mouse")
	input_manager:map_device_to_service("twitch_view", "gamepad")

	self._input_manager = input_manager
	local world_manager = ingame_ui_context.world_manager
	local world = world_manager:world("level_world")
	self._wwise_world = Managers.world:wwise_world(world)

	self:_create_ui_elements()
end

TwitchView._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self._widgets = {}
	local widget_definitions = definitions.widget_definitions

	for name, widget in pairs(widget_definitions.widgets) do
		self._widgets[name] = UIWidget.init(widget)
	end

	self._connect_button_widget = UIWidget.init(definitions.widget_definitions.connect_button)
	local button_text_style = self._connect_button_widget.style.title_text
	button_text_style.text_color = Colors.get_color_table_with_alpha("twitch", 255)
	button_text_style.text_color_enabled = Colors.get_color_table_with_alpha("twitch", 255)
	self._disconnect_button_widget = UIWidget.init(definitions.widget_definitions.disconnect_button)
	local button_text_style = self._disconnect_button_widget.style.title_text
	button_text_style.text_color = Colors.get_color_table_with_alpha("red", 255)
	button_text_style.text_color_enabled = Colors.get_color_table_with_alpha("red", 255)

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._error_timer = nil
end

TwitchView.on_enter = function (self)
	ShowCursorStack.push()
	self:set_active(true)
end

local DO_RELOAD = true

TwitchView.update = function (self, dt, t, is_sub_menu)
	Profiler.start("twitch_view")

	if DO_RELOAD then
		DO_RELOAD = false

		self:_create_ui_elements()
	end

	if self._suspended or not self._active then
		Profiler.stop("twitch_view")

		return
	end

	script_data.twitch_view = self

	self:_draw(dt, t)
	self:_update_input(dt, t)
	self:_update_error(dt, t)
	Profiler.stop("twitch_view")
end

TwitchView.cb_on_message_received = function (self, key, message_type, user_name, message, parameter)
	local chat_output_widget = self._widgets.chat_output_widget
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

TwitchView._play_sound = function (self, event)
	WwiseWorld.trigger_event(self._wwise_world, event)
end

TwitchView._update_input = function (self, dt, t)
	local frame_widget = self._widgets.frame_widget
	local frame_widget_content = frame_widget.content
	local input_service = self._input_manager:get_service("twitch_view")

	if input_service:get("back", true) then
		if frame_widget_content.text_field_active then
			frame_widget_content.text_field_active = false
		else
			self:set_active(false)

			return
		end
	end

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
				self:set_active(false)

				return
			end

			frame_widget_content.text_field_active = false
		end

		if frame_widget_content.text_field_active then
			local keystrokes = Keyboard.keystrokes()
			frame_widget_content.twitch_name, frame_widget_content.caret_index = KeystrokeHelper.parse_strokes(frame_widget_content.twitch_name, frame_widget_content.caret_index, "insert", keystrokes)

			if input_service:get("execute_login") then
				frame_widget_content.text_field_active = false
				local user_name = string.gsub(frame_widget_content.twitch_name, " ", "")

				Managers.twitch:connect(user_name, callback(self, "cb_connection_callback"))
			end
		end

		local close_widget = self._widgets.exit_button
		local close_widget_content = close_widget.content

		if close_widget_content.button_hotspot.on_pressed then
			self:set_active(false)

			return
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

			local chat_output_widget = self._widgets.chat_output_widget
			local chat_output_content = chat_output_widget.content
			chat_output_content.message_tables = {}
			chat_output_content.text_start_offset = 0
		end
	end
end

TwitchView._update_error = function (self, dt, t)
	if not self._error_timer then
		return
	end

	local style = self._widgets.frame_widget.style
	self._error_timer = self._error_timer - dt
	local alpha = math.lerp(0, 255, math.min(self._error_timer, 1))
	style.error_field.text_color[1] = alpha

	if self._error_timer <= 0 then
		style.error_field.text_color[1] = 0
		self._error_timer = nil
	end
end

TwitchView.cb_connection_callback = function (self, message)
	local content = self._widgets.frame_widget.content
	local style = self._widgets.frame_widget.style
	content.error_id = message
	style.error_field.text_color[1] = 255
	self._error_timer = 5
end

TwitchView.set_active = function (self, active)
	self._active = active

	if self._active then
		self._input_manager:block_device_except_service("twitch_view", "keyboard", 1, "twitch")
		self._input_manager:block_device_except_service("twitch_view", "mouse", 1, "twitch")
		self._input_manager:block_device_except_service("twitch_view", "gamepad", 1, "twitch")
		Managers.irc:register_message_callback("twitch", Irc.CHANNEL_MSG, callback(self, "cb_on_message_received"))
	else
		self._input_manager:device_unblock_all_services("keyboard", 1)
		self._input_manager:device_unblock_all_services("mouse", 1)
		self._input_manager:device_unblock_all_services("gamepad", 1)
		self._input_manager:block_device_except_service("start_game_view", "keyboard", 1, "start_game_view")
		self._input_manager:block_device_except_service("start_game_view", "mouse", 1, "start_game_view")
		self._input_manager:block_device_except_service("start_game_view", "gamepad", 1, "start_game_view")
		Managers.irc:unregister_message_callback("twitch")
	end
end

TwitchView.is_active = function (self)
	return self._active
end

TwitchView.suspend = function (self)
	self._suspended = true

	self._input_manager:device_unblock_all_services("keyboard", 1)
	self._input_manager:device_unblock_all_services("mouse", 1)
	self._input_manager:device_unblock_all_services("gamepad", 1)
end

TwitchView.unsuspend = function (self)
	self._input_manager:block_device_except_service("twitch_view", "keyboard", 1, "twitch")
	self._input_manager:block_device_except_service("twitch_view", "mouse", 1, "twitch")
	self._input_manager:block_device_except_service("twitch_view", "gamepad", 1, "twitch")

	self._suspended = nil
end

TwitchView._draw = function (self, dt, t)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_manager:get_service("twitch_view")
	local render_settings = self._render_settings
	local is_connected = Managers.twitch:is_connected()
	local is_connecting = Managers.twitch:is_connecting()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for name, widget in pairs(self._widgets) do
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
end

TwitchView.on_exit = function (self)
	ShowCursorStack.pop()
	self:set_active(false)
end

TwitchView.destroy = function (self)
	return
end

TwitchView._exit = function (self, return_to_game)
	local exit_transition = (return_to_game and "exit_menu") or "ingame_menu"

	self._ingame_ui:handle_transition(exit_transition)
end

TwitchView.input_service = function (self)
	return self._input_manager:get_service("twitch_view")
end

return
