require("scripts/utils/keystroke_helper")

local definitions = local_require("scripts/ui/views/chat_gui_definitions")
ChatGui = class(ChatGui)
ChatGui.MAX_CHARS = 500

ChatGui.init = function (self, ui_context)
	self.input_manager = ui_context.input_manager
	self.ui_renderer = ui_context.ui_top_renderer
	self.chat_manager = ui_context.chat_manager
	self._render_settings = {
		alpha_multiplier = 1
	}
	self.chat_message = ""
	self.chat_index = 1
	self.chat_mode = "insert"
	self.chat_messages = {}

	rawset(_G, "global_chat_gui", self)

	self.ui_animations = {}

	self:create_ui_elements()

	self.block_chat_activation_hack = 0
	self.menu_active = false
	self.chat_closed = true
	self.chat_focused = false
	self.chat_close_time = 0
	local font_size = nil

	if LEVEL_EDITOR_TEST then
		font_size = DefaultUserSettings.get("user_settings", "chat_font_size")
	else
		font_size = Application.user_setting("chat_font_size")
	end

	self:set_font_size(font_size)
	self:_set_chat_window_alpha(0)
end

ChatGui.set_profile_synchronizer = function (self, profile_synchronizer)
	self.profile_synchronizer = profile_synchronizer
end

ChatGui.set_wwise_world = function (self, wwise_world)
	self.wwise_world = wwise_world
end

ChatGui.set_input_manager = function (self, input_manager)
	if input_manager then
		local block_reasons = {
			keybind = true,
			irc_chat = true,
			debug_screen = true,
			rcon = true,
			twitch = true,
			popup = true,
			free_flight = true
		}

		input_manager:create_input_service("chat_input", "ChatControllerSettings", "ChatControllerFilters", block_reasons)
		input_manager:map_device_to_service("chat_input", "keyboard")
		input_manager:map_device_to_service("chat_input", "mouse")
	end

	self.input_manager = input_manager
end

local RELOAD_CHAT_GUI = true

ChatGui.create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self.chat_window_widget = UIWidget.init(definitions.chat_window_widget)
	self.chat_output_widget = UIWidget.init(definitions.chat_output_widget)
	self.chat_input_widget = UIWidget.init(definitions.chat_input_widget)
	self.scrollbar_widget = UIWidget.init(definitions.chat_scrollbar_widget)
	self.tab_widget = UIWidget.init(definitions.chat_tab_widget)
	self._widgets = {}

	for name, widget in pairs(definitions.widgets) do
		self._widgets[name] = UIWidget.init(widget)
	end

	self.ui_animations.caret_pulse = self:animate_element_pulse(self.chat_input_widget.style.text.caret_color, 1, 60, 255, 2)

	if RELOAD_CHAT_GUI then
		local font_size = nil

		if LEVEL_EDITOR_TEST then
			font_size = DefaultUserSettings.get("user_settings", "chat_font_size")
		else
			font_size = Application.user_setting("chat_font_size")
		end

		self:set_font_size(font_size)
		self:set_menu_transition_fraction(0)
	end

	RELOAD_CHAT_GUI = false
end

ChatGui.clear_messages = function (self)
	self.chat_output_widget = UIWidget.init(definitions.chat_output_widget)
end

ChatGui.animate_element_pulse = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.pulse_animation, target, target_index, from, to, time)

	return new_animation
end

ChatGui.animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

ChatGui.destroy = function (self)
	rawset(_G, "global_chat_gui", nil)
end

ChatGui.ignoring_peer_id = function (self, peer_id)
	return self.chat_manager:ignoring_peer_id(peer_id)
end

ChatGui.ignore_peer_id = function (self, peer_id)
	self.chat_manager:ignore_peer_id(peer_id)
end

ChatGui.remove_ignore_peer_id = function (self, peer_id)
	self.chat_manager:remove_ignore_peer_id(peer_id)
end

ChatGui.set_font_size = function (self, font_size)
	local ui_scenegraph = self.ui_scenegraph
	local scenegraph_definition = definitions.scenegraph_definition
	local output_field_margin = 0
	local input_field_size_padding = 20
	local background_height = font_size + input_field_size_padding
	ui_scenegraph.chat_input_text.size[2] = background_height
	ui_scenegraph.chat_input_box.size[2] = background_height
	self.chat_output_widget.style.text.font_size = font_size
	self.chat_input_widget.style.text.font_size = font_size
	self.chat_input_widget.style.channel_text.font_size = font_size
	local font, scaled_font_size = UIFontByResolution(self.chat_input_widget.style.text)
	local font_type = self.chat_input_widget.style.text.font_type
	local font_height, font_min, font_max = UIGetFontHeight(self.ui_renderer.gui, font_type, scaled_font_size)
	local input_text_height_offset = (background_height / 2 + math.abs(font_min / 2)) - font_height / 2
	self.chat_input_widget.style.text.offset[2] = input_text_height_offset
	self.chat_input_widget.style.text.caret_size[2] = font_height
	ui_scenegraph[self.chat_output_widget.style.text.scenegraph_id].size[2] = definitions.CHAT_HEIGHT - font_size - output_field_margin
	ui_scenegraph[self.chat_output_widget.style.text.scenegraph_id].position[2] = output_field_margin * 0.5
end

local customizer_data = {
	registry_key = "chat_gui",
	drag_scenegraph_id = "root_dragger",
	root_scenegraph_id = "root",
	label = "Chat",
	use_plain_rects = true
}

ChatGui.update = function (self, dt, menu_active, menu_input_service, no_unblock, chat_enabled)
	if RELOAD_CHAT_GUI then
		self:create_ui_elements()
	end

	HudCustomizer.run(self.ui_renderer, self.ui_scenegraph, customizer_data)
	self:update_transition(dt)

	local show_new_messages = self:_update_chat_messages()
	local ui_scenegraph = self.ui_scenegraph
	local ui_animations = self.ui_animations

	if not self.menu_active and menu_active then
		if self.chat_focused then
			self.chat_focused = true
			self.chat_closed = false

			self:clear_current_transition()
			self:set_menu_transition_fraction(1)
			self:_set_chat_window_alpha(1)

			self.tab_widget.style.button_notification.color[1] = UISettings.chat.tab_notification_alpha_2
		else
			self.chat_closed = true
			self.chat_focused = false
			self.chat_close_time = 0

			self:clear_current_transition()
			self:set_menu_transition_fraction(0)
			self:_set_chat_window_alpha(1)

			self.tab_widget.style.button_notification.color[1] = UISettings.chat.tab_notification_alpha_1
		end
	elseif self.menu_active and not menu_active then
		if self.chat_focused then
			self.chat_focused = true
			self.chat_closed = false

			self:clear_current_transition()
			self:_set_chat_window_alpha(1)
			self:set_menu_transition_fraction(1)

			ui_animations.notification_pulse = nil
		else
			self.chat_closed = true
			self.chat_focused = false
			self.chat_close_time = 0

			self:clear_current_transition()
			self:_set_chat_window_alpha(0)

			ui_animations.notification_pulse = nil
		end
	end

	self.menu_active = menu_active
	local input_manager = self.input_manager
	local input_service = input_manager:get_service("chat_input")
	local chat_focused, closed, close_time = self:_update_input(input_service, menu_input_service, dt, no_unblock, chat_enabled)

	if show_new_messages and not menu_active then
		closed = false

		if not chat_focused and not self.keep_chat_visible then
			close_time = UISettings.chat.chat_close_delay
		end
	end

	if close_time and close_time > 0 then
		close_time = close_time - dt

		if close_time < 0 then
			close_time = 0
		end
	end

	if IS_WINDOWS and self.chat_closed ~= closed then
		Window.set_ime_enabled(not closed)
	end

	if menu_active then
		if self.chat_closed and not closed then
			self:menu_open()
		elseif not self.chat_closed and closed then
			self:menu_close()
		end

		if closed and show_new_messages then
			if self.wwise_world then
				WwiseWorld.trigger_event(self.wwise_world, "hud_chat_message")
			end

			if not ui_animations.notification_pulse then
				local ui_settings = UISettings.chat
				local alpha_1 = ui_settings.tab_notification_alpha_1
				local alpha_2 = ui_settings.tab_notification_alpha_2
				ui_animations.notification_pulse = self:animate_element_pulse(self.tab_widget.style.button_notification.color, 1, alpha_1, alpha_2, 5)
			end
		end
	elseif show_new_messages or (not self.chat_focused and chat_focused) or (self.chat_closed and not closed) then
		self:clear_current_transition()
		self:set_menu_transition_fraction(1)
		self:_set_chat_window_alpha(1)
	end

	self.chat_focused = chat_focused
	self.chat_closed = closed
	self.chat_close_time = close_time
	local input_service = (menu_input_service and menu_input_service) or input_manager:get_service("chat_input")

	if menu_active then
		if self.chat_focused then
			input_service = input_manager:get_service("chat_input")

			if input_manager.get_service("chat_input") then
			end
		end
	elseif self.chat_focused then
		input_service = input_manager:get_service("chat_input")
	end

	self:_update_hud_scale()
	self:_draw_widgets(dt, input_service, chat_enabled)
end

ChatGui._update_chat_messages = function (self)
	if Managers.chat:gui_should_clear() then
		self:clear_messages()
	end

	local added_chat_messages = FrameTable.alloc_table()

	self.chat_manager:get_chat_messages(added_chat_messages)

	local history_max_size = 30
	local num_new = #added_chat_messages
	local show_new_messages = false

	if num_new > 0 then
		local message_tables = self.chat_output_widget.content.message_tables
		local num_current = #message_tables

		if history_max_size < num_new + num_current then
			local num_to_remove = (num_new + num_current) - history_max_size

			for i = 1, num_to_remove, 1 do
				table.remove(message_tables, 1)
			end
		end

		num_current = #message_tables

		for i = 1, num_new, 1 do
			local new_message = added_chat_messages[i]
			local new_message_table = {}

			if new_message.type ~= Irc.PARTY_MSG and new_message.type ~= Irc.ALL_MSG and new_message.type ~= Irc.TEAM_MSG then
				local message = new_message.message

				if new_message.is_system_message then
					new_message_table.is_system = true
					new_message_table.sender = new_message.message_sender .. ": "
				else
					if new_message.type == Irc.CHANNEL_MSG and new_message.data then
						new_message_table.sender = "[" .. new_message.data.parameter .. "] " .. new_message.message_sender .. ": "
						new_message_table.trimmed_sender = "[" .. new_message.data.parameter .. "] " .. string.sub(new_message.message_sender, 1, -11) .. ": "
					elseif new_message.type == Irc.PRIVATE_MSG then
						new_message_table.sender = new_message.message_sender .. ": "
						new_message_table.trimmed_sender = string.sub(new_message.message_sender, 1, -11) .. ": "
					else
						new_message_table.sender = new_message.message_sender .. ": "
					end

					new_message_table.is_system = false
				end

				new_message_table.is_dev = new_message.is_dev
				new_message_table.is_enemy = new_message.is_enemy
				new_message_table.is_bot = new_message.is_bot
				new_message_table.message = message
				new_message_table.type = new_message.type

				if new_message.link then
					new_message_table.link = new_message.link
				end

				show_new_messages = new_message.pop_chat
			else
				local sender = new_message.message_sender
				local player = Managers.player:player(sender, new_message.local_player_id)
				local ingame_display_name, name = nil

				if player then
					local profile_index = self.profile_synchronizer:profile_by_peer(player.peer_id, player:local_player_id())
					ingame_display_name = (SPProfiles[profile_index] and SPProfiles[profile_index].ingame_short_display_name) or nil
					name = player:name()
				else
					name = (rawget(_G, "Steam") and Steam.user_name(sender)) or tostring(sender)
				end

				local message = new_message.message
				new_message_table.is_dev = new_message.is_dev
				new_message_table.is_enemy = new_message.is_enemy
				new_message_table.is_bot = new_message.is_bot
				new_message_table.is_system = false
				new_message_table.sender = (ingame_display_name and string.format("%s (%s): ", name, Localize(ingame_display_name))) or string.format("%s: ", name)
				new_message_table.message = message
				new_message_table.type = new_message.type
				local message_targets = self.chat_manager.message_targets

				for _, message_target in ipairs(message_targets) do
					if message_target.message_target_type == new_message.type then
						if message_target.message_target_key then
							new_message_table.channel_string = string.format("[%s] ", Localize(message_target.message_target_key))
						end

						break
					end
				end

				show_new_messages = true
			end

			message_tables[num_current + i] = new_message_table
		end
	end

	return show_new_messages
end

ChatGui.show_chat = function (self)
	self:clear_current_transition()
	self:set_menu_transition_fraction(1)
	self:_set_chat_window_alpha(1)

	self.chat_closed = false
	self.chat_focused = false
	self.chat_close_time = nil
	self.keep_chat_visible = true
	self.scrollbar_widget.content.internal_scroll_value = 0
end

ChatGui.hide_chat = function (self)
	self:clear_current_transition()
	self:set_menu_transition_fraction(0)
	self:_set_chat_window_alpha(0)

	self.chat_closed = true
	self.chat_focused = false
	self.chat_close_time = nil
	self.keep_chat_visible = false
end

ChatGui.menu_open = function (self)
	self:clear_current_transition()

	local ui_settings = UISettings.chat
	self.ui_animations.notification_pulse = nil
	self.tab_widget.style.button_notification.color[1] = ui_settings.tab_notification_alpha_1
	self.opening = true
	self.transition_timer = 0
end

ChatGui.menu_close = function (self)
	self:clear_current_transition()

	self.closing = true
	self.transition_timer = 0
end

ChatGui.set_menu_transition_fraction = function (self, fraction)
	local ui_scenegraph = self.ui_scenegraph
	local scenegraph_definition = definitions.scenegraph_definition
	local chat_window_widget = self.chat_window_widget
	local scenegraph_id = chat_window_widget.scenegraph_id
	local default_definition_background = scenegraph_definition[scenegraph_id]
	ui_scenegraph[scenegraph_id].size[1] = default_definition_background.size[1] * fraction
end

ChatGui.update_transition = function (self, dt)
	local transition_timer = self.transition_timer

	if not transition_timer then
		return
	end

	local total_transition_time = 0.2
	transition_timer = math.min(transition_timer + dt, total_transition_time)
	local progress = transition_timer / total_transition_time

	if self.opening then
		self:set_menu_transition_fraction(progress)
	elseif self.closing then
		self:set_menu_transition_fraction(1 - progress)
	end

	if progress == 1 then
		self.transition_timer = nil

		if self.opening then
			self.opening = nil
		elseif self.closing then
			self.closing = nil
		end
	else
		self.transition_timer = transition_timer
	end
end

ChatGui.clear_current_transition = function (self)
	self.opening = nil
	self.closing = nil
	self.transition_timer = nil
end

ChatGui.block_input = function (self)
	self.input_manager:capture_input({
		"keyboard",
		"gamepad",
		"mouse"
	}, 1, "chat_input", "ChatGui")
	self:_show_cursor()
end

ChatGui.unblock_input = function (self)
	self.input_manager:release_input({
		"keyboard",
		"gamepad",
		"mouse"
	}, 1, "chat_input", "ChatGui")
	self:_hide_cursor()
end

ChatGui._show_cursor = function (self)
	if not self._cursor_visible then
		self._cursor_visible = true

		ShowCursorStack.push()
	end
end

ChatGui._hide_cursor = function (self)
	if self._cursor_visible then
		self._cursor_visible = false

		ShowCursorStack.pop()
	end
end

ChatGui.block_chat_input_for_one_frame = function (self)
	self._block_keystrokes = true
end

ChatGui._update_input = function (self, input_service, menu_input_service, dt, no_unblock, chat_enabled)
	local input_manager = self.input_manager
	local chat_focused = self.chat_focused
	local chat_closed = self.chat_closed
	local chat_close_time = self.chat_close_time
	local tab_widget = self.tab_widget
	local tab_hotspot = tab_widget.content.button_hotspot
	local scroll_widget = self.scrollbar_widget
	local alt_was_pressed = input_service:get("unallowed_activate_chat_input")

	if alt_was_pressed then
		self.block_chat_activation_hack = 0
	else
		self.block_chat_activation_hack = self.block_chat_activation_hack + dt
	end

	local block_chat_activation = self.block_chat_activation_hack < 0.2 or not Managers.chat:is_chat_enabled() or self._block_keystrokes
	self._block_keystrokes = false

	if chat_closed then
		local alt_chat_input = input_service:get("execute_alt_chat_input")

		if tab_hotspot.on_release or ((input_service:get("activate_chat_input") or input_service:get("execute_chat_input") or alt_chat_input) and not block_chat_activation and GameSettingsDevelopment.allow_chat_input) then
			if chat_enabled then
				chat_closed = false
				chat_close_time = nil
				chat_focused = true

				self:block_input()
			else
				chat_closed = false
				chat_close_time = UISettings.chat.chat_close_delay
				chat_focused = false
				self._refocus_chat_window = true
			end

			self.chat_message = ""
			self.chat_index = 1
			self.chat_mode = "insert"
			local channel_id = 1
			local message_target = nil
			local mechanism = Managers.mechanism:game_mechanism()

			if mechanism.get_chat_channel then
				channel_id, message_target = mechanism:get_chat_channel(Managers.player:local_player(), alt_chat_input)
			end

			self.channel_id = channel_id
			self.alt_chat_input = alt_chat_input

			if message_target then
				Managers.chat:set_message_target_type(message_target)
			end

			local current_message_target_info = Managers.chat:current_message_target()
			local current_message_target = nil

			if current_message_target_info.message_target_key then
				current_message_target = string.format("[%s] ", Localize(current_message_target_info.message_target_key))
			else
				current_message_target = string.format("[%s] ", current_message_target_info.message_target)
			end

			local font, scaled_font_size = UIFontByResolution(self.chat_input_widget.style.channel_text)
			local text_width, text_height, min = UIRenderer.text_size(self.ui_renderer, current_message_target, font[1], scaled_font_size)
			self.chat_input_widget.content.channel_field = current_message_target
			local channel_text_color = IRC_CHANNEL_COLORS[current_message_target_info.message_target_type]
			local widget_channel_text_color = self.chat_input_widget.style.channel_text.text_color

			self:_apply_color_values(widget_channel_text_color, channel_text_color)

			self.ui_scenegraph.chat_input_text.size[1] = definitions.CHAT_INPUT_TEXT_WIDTH - text_width
			self.chat_input_widget.style.text.offset[1] = self.chat_input_widget.style.channel_text.offset[1] + text_width
			self.chat_input_widget.content.caret_index = 1
			self.chat_input_widget.content.text_index = 1
		end

		scroll_widget.content.internal_scroll_value = 0
	else
		local menu_close_press_outside_area = false

		if self.menu_active and input_service:get("left_release") then
			local cursor = UIInverseScaleVectorToResolution(input_service:get("cursor"))
			local chat_pos = UISceneGraph.get_world_position(self.ui_scenegraph, "chat_window_background")
			local chat_size = UISceneGraph.get_size(self.ui_scenegraph, "chat_window_background")

			if not math.point_is_inside_2d_box(cursor, chat_pos, chat_size) then
				menu_close_press_outside_area = true
			end
		end

		local auto_close = chat_close_time and chat_close_time == 0

		if tab_hotspot.on_release or (input_service:get("deactivate_chat_input") and not block_chat_activation) or menu_close_press_outside_area or auto_close then
			if chat_focused and (tab_hotspot.on_release or (input_service:get("deactivate_chat_input") and not block_chat_activation) or menu_close_press_outside_area) then
				self:unblock_input()
				table.clear(tab_hotspot)
			end

			chat_closed = true
			chat_close_time = 0
			chat_focused = false
			self.recent_message_index = nil
			self.old_chat_message = nil
		end

		tab_hotspot.on_release = false

		if chat_focused and chat_enabled then
			if GameSettingsDevelopment.allow_chat_input and input_service:get("execute_chat_input") then
				chat_closed = false
				chat_focused = false

				if not self.keep_chat_visible then
					chat_close_time = UISettings.chat.chat_close_delay
				end

				if self.chat_message ~= "" then
					local target_index = 1
					local channel_id = self.channel_id

					if self.chat_manager:has_channel(channel_id) then
						local localize = false
						local localize_parameters = false

						self.chat_manager:send_chat_message(channel_id, 1, self.chat_message, localize, nil, localize_parameters, self.recent_message_index)
					end

					self.chat_message = ""
					self.chat_mode = "insert"
					self.chat_index = 1
					self.chat_input_widget.content.caret_index = 1
					self.chat_input_widget.content.text_index = 1
					self.scrollbar_widget.content.internal_scroll_value = 0
				else
					chat_closed = true
					chat_close_time = 0
					chat_focused = false
				end

				self.old_chat_message = nil
				self.recent_message_index = nil

				self:unblock_input()
			elseif input_service:get("chat_next_old_message") and GameSettingsDevelopment.allow_chat_input then
				local recent_chat_messages = Managers.chat:get_recently_sent_messages()
				local num_recent_chat_messages = #recent_chat_messages

				if num_recent_chat_messages > 0 then
					if not self.recent_message_index then
						if string.len(self.chat_message) > 0 and not self.recent_message_index then
							self.old_chat_message = self.chat_message
						end

						self.recent_message_index = num_recent_chat_messages
					else
						self.recent_message_index = math.max(self.recent_message_index - 1, 1)
					end

					self.chat_message = recent_chat_messages[self.recent_message_index]
					local text_table = KeystrokeHelper._build_utf8_table(self.chat_message)
					self.chat_index = #text_table + 1
					self.chat_input_widget.content.jump_to_end = true
				end
			elseif input_service:get("chat_previous_old_message") and GameSettingsDevelopment.allow_chat_input then
				local recent_chat_messages = Managers.chat:get_recently_sent_messages()
				local num_recent_chat_messages = #recent_chat_messages

				if self.recent_message_index then
					if num_recent_chat_messages > 0 and self.recent_message_index < num_recent_chat_messages then
						self.recent_message_index = math.clamp(self.recent_message_index + 1, 1, num_recent_chat_messages)
						self.chat_message = recent_chat_messages[self.recent_message_index]
						local text_table = KeystrokeHelper._build_utf8_table(self.chat_message)
						self.chat_index = #text_table + 1
					elseif self.recent_message_index == num_recent_chat_messages and self.old_chat_message then
						self.chat_message = self.old_chat_message
						local text_table = KeystrokeHelper._build_utf8_table(self.chat_message)
						self.chat_index = #text_table + 1
						self.recent_message_index = nil
						self.old_chat_message = nil
					end

					self.chat_input_widget.content.jump_to_end = true
				end
			elseif GameSettingsDevelopment.use_global_chat and input_service:get("chat_switch_view") and GameSettingsDevelopment.allow_chat_input then
				self:clear_messages()
				Managers.chat:switch_view()

				local view_name, color = Managers.chat:current_view_and_color()
				self.chat_input_widget.content.header_field = view_name

				self:_apply_color_values(self.chat_input_widget.style.header_text.text_color, color)
			elseif GameSettingsDevelopment.use_global_chat and input_service:get("chat_switch_channel") and GameSettingsDevelopment.allow_chat_input then
				if Managers.chat:next_message_target() then
					self:clear_messages()
				end

				local current_message_target_info = Managers.chat:current_message_target()
				local current_message_target = "[" .. tostring(current_message_target_info.message_target) .. "]  "
				local font, scaled_font_size = UIFontByResolution(self.chat_input_widget.style.channel_text)
				local text_width, text_height, min = UIRenderer.text_size(self.ui_renderer, current_message_target, font[1], scaled_font_size)
				self.chat_input_widget.content.channel_field = current_message_target
				local channel_text_color = IRC_CHANNEL_COLORS[current_message_target_info.message_target_type]

				self:_apply_color_values(self.chat_input_widget.style.channel_text.text_color, channel_text_color)

				self.ui_scenegraph.chat_input_text.size[1] = definitions.CHAT_INPUT_TEXT_WIDTH - text_width
				self.chat_input_widget.style.text.offset[1] = self.chat_input_widget.style.channel_text.offset[1] + text_width
				self.chat_input_widget.content.caret_index = UTF8Utils.string_length(self.chat_message) + 1
				self.chat_index = self.chat_input_widget.content.caret_index
				local view_name, color = Managers.chat:current_view_and_color()
				self.chat_input_widget.content.header_field = view_name

				self:_apply_color_values(self.chat_input_widget.style.header_text.text_color, color)
			elseif input_service:get("chat_backspace_word") and GameSettingsDevelopment.allow_chat_input then
				local text_table = KeystrokeHelper._build_utf8_table(self.chat_message)
				local current_index = self.chat_index - 1
				local char_step = false
				local temp = 0

				for i = current_index, 1, -1 do
					local letter = text_table[i]

					if text_table[i] == " " and char_step then
						current_index = i + 1

						break
					else
						table.remove(text_table, i)

						current_index = i

						if text_table[i] ~= " " then
							char_step = true
						end
					end
				end

				self.chat_index = math.clamp(current_index, 1, #text_table + 1)
				self.chat_message = ""
				local num_chars = 0

				for _, text_snippet in ipairs(text_table) do
					self.chat_message = self.chat_message .. text_snippet
					num_chars = num_chars + 1
				end
			elseif GameSettingsDevelopment.allow_chat_input then
				local keystrokes = Keyboard.keystrokes()
				local ctrl_button_index = Keyboard.button_index("left ctrl")
				local ctrl_held = Keyboard.pressed(ctrl_button_index) or Keyboard.button(ctrl_button_index) > 0
				local new_chat_message, new_chat_index, new_chat_mode = KeystrokeHelper.parse_strokes(self.chat_message, self.chat_index, self.chat_mode, keystrokes, ChatGui.MAX_CHARS)

				if new_chat_index ~= self.chat_index then
					if new_chat_index == 1 then
						self.chat_input_widget.content.text_index = new_chat_index
					elseif UTF8Utils.string_length(new_chat_message) < new_chat_index then
						self.chat_input_widget.content.jump_to_end = true
					end
				end

				self.chat_message = new_chat_message
				self.chat_index = new_chat_index
				self.chat_mode = new_chat_mode
			end
		else
			local alt_chat_input = input_service:get("execute_alt_chat_input")

			if input_service:get("activate_chat_input") or ((input_service:get("execute_chat_input") or alt_chat_input) and GameSettingsDevelopment.allow_chat_input) then
				if chat_enabled then
					chat_closed = false
					chat_close_time = nil
					chat_focused = true

					self:block_input()
				else
					chat_closed = false
					chat_close_time = UISettings.chat.chat_close_delay
					chat_focused = false
					self._refocus_chat_window = true
				end

				self.chat_message = ""
				self.chat_index = 1
				self.chat_mode = "insert"
				self.recent_message_index = nil
				self.old_chat_message = nil
				local channel_id = 1
				local message_target = nil
				local mechanism = Managers.mechanism:game_mechanism()

				if mechanism.get_chat_channel then
					channel_id, message_target = mechanism:get_chat_channel(Managers.player:local_player(), alt_chat_input)
				end

				self.channel_id = channel_id
				self.alt_chat_input = alt_chat_input

				if message_target then
					Managers.chat:set_message_target_type(message_target)
				end

				local current_message_target_info = Managers.chat:current_message_target()
				local current_message_target = "[" .. tostring(current_message_target_info.message_target) .. "]  "
				local font, scaled_font_size = UIFontByResolution(self.chat_input_widget.style.channel_text)
				local text_width, text_height, min = UIRenderer.text_size(self.ui_renderer, current_message_target, font[1], scaled_font_size)
				self.chat_input_widget.content.channel_field = current_message_target
				local channel_text_color = IRC_CHANNEL_COLORS[current_message_target_info.message_target_type]

				self:_apply_color_values(self.chat_input_widget.style.channel_text.text_color, channel_text_color)

				self.ui_scenegraph.chat_input_text.size[1] = definitions.CHAT_INPUT_TEXT_WIDTH - text_width
				self.chat_input_widget.style.text.offset[1] = self.chat_input_widget.style.channel_text.offset[1] + text_width
				self.chat_input_widget.content.caret_index = 1
				self.chat_input_widget.content.text_index = 1
			end
		end

		local chat_input_widget_content = self.chat_input_widget.content
		local enlarge_hotspot = chat_input_widget_content.enlarge_hotspot
		local info_hotspot = chat_input_widget_content.info_hotspot
		local filter_hotspot = chat_input_widget_content.filter_hotspot
		local target_hotspot = chat_input_widget_content.target_hotspot

		if GameSettingsDevelopment.use_global_chat then
			if enlarge_hotspot.on_release then
				self:unblock_input()
				Managers.ui:handle_transition("chat_view_force", {
					use_fade = true
				})

				chat_closed = true
				chat_close_time = 0
				chat_focused = false
			elseif info_hotspot.on_release and false then
				self:unblock_input()

				chat_closed = true
				chat_close_time = 0
				chat_focused = false
			elseif filter_hotspot.on_release then
				self:clear_messages()
				Managers.chat:switch_view()

				local view_name, color = Managers.chat:current_view_and_color()
				self.chat_input_widget.content.header_field = view_name

				self:_apply_color_values(self.chat_input_widget.style.header_text.text_color, color)
			elseif target_hotspot.on_release then
				if Managers.chat:next_message_target() then
					self:clear_messages()
				end

				local current_message_target_info = Managers.chat:current_message_target()
				local current_message_target = "[" .. tostring(current_message_target_info.message_target) .. "]  "
				local font, scaled_font_size = UIFontByResolution(self.chat_input_widget.style.channel_text)
				local text_width, text_height, min = UIRenderer.text_size(self.ui_renderer, current_message_target, font[1], scaled_font_size)
				self.chat_input_widget.content.channel_field = current_message_target
				local channel_text_color = IRC_CHANNEL_COLORS[current_message_target_info.message_target_type]

				self:_apply_color_values(self.chat_input_widget.style.channel_text.text_color, channel_text_color)

				self.ui_scenegraph.chat_input_text.size[1] = definitions.CHAT_INPUT_TEXT_WIDTH - text_width
				self.chat_input_widget.style.text.offset[1] = self.chat_input_widget.style.channel_text.offset[1] + text_width
				self.chat_input_widget.content.caret_index = UTF8Utils.string_length(self.chat_message) + 1
				self.chat_index = self.chat_input_widget.content.caret_index
				local view_name, color = Managers.chat:current_view_and_color()
				self.chat_input_widget.content.header_field = view_name

				self:_apply_color_values(self.chat_input_widget.style.header_text.text_color, color)
			end
		end

		local step_size = 0.025
		local scroll_widget_content = scroll_widget.content
		local scroll_value = nil

		if chat_focused then
			if input_service:get("chat_scroll_up") then
				scroll_value = step_size
			elseif input_service:get("chat_scroll_down") then
				scroll_value = -step_size
			end

			local mouse_scroll_action = "chat_scroll"

			if input_service:has(mouse_scroll_action) then
				local scroll_axis = input_service:get(mouse_scroll_action)
				local axis_input = scroll_axis.y

				if axis_input ~= 0 then
					scroll_value = step_size * axis_input
				end
			end
		end

		if scroll_value then
			local ui_scenegraph = self.ui_scenegraph
			local scroll_bottom_y_pos = ui_scenegraph[scroll_widget.scenegraph_id].position[2]
			local chat_bottom_y_pos = ui_scenegraph.chat_window_root.position[2]
			local bottom_y_pos = scroll_bottom_y_pos + chat_bottom_y_pos
			local scenegraph_id = scroll_widget.style.scrollbar.scenegraph_id
			local bar_height = scroll_widget_content.scroll_bar_height
			local half_bar_size = bar_height / 2
			local y_pos = bottom_y_pos - half_bar_size
			local size = UISceneGraph.get_size(ui_scenegraph, scenegraph_id)
			local current_position = math.clamp(y_pos, 0, size[2])
			local max_value = math.min(current_position / size[2], 1)
			scroll_widget_content.internal_scroll_value = math.clamp(scroll_widget_content.internal_scroll_value + scroll_value, 0, max_value)
		end
	end

	return chat_focused, chat_closed, chat_close_time
end

ChatGui._draw_widgets = function (self, dt, input_service, chat_enabled)
	local gamepad_active = self.input_manager:is_device_active("gamepad")
	local chat_close_time = self.chat_close_time
	local menu_active = self.menu_active

	if not menu_active and chat_close_time and chat_close_time == 0 then
		return
	end

	local render_settings = self._render_settings
	local ui_scenegraph = self.ui_scenegraph
	local ui_renderer = self.ui_renderer
	local ui_animations = self.ui_animations
	local window_widget = self.chat_window_widget
	local input_widget = self.chat_input_widget
	local output_widget = self.chat_output_widget
	local scrollbar_widget = self.scrollbar_widget
	local tab_widget = self.tab_widget
	input_widget.content.text_field = self.chat_message
	input_widget.content.caret_index = self.chat_index
	output_widget.content.text_start_offset = 1 - scrollbar_widget.content.scroll_value
	local alpha_multiplier = render_settings.alpha_multiplier

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	if not gamepad_active and menu_active and chat_enabled then
		UIRenderer.draw_widget(ui_renderer, tab_widget)
	end

	self:_apply_hud_scale()

	if self.chat_focused then
		UIAnimation.update(ui_animations.caret_pulse, dt)
	end

	if menu_active then
		if ui_animations.window_position then
			UIAnimation.update(ui_animations.window_position, dt)
		end

		if ui_animations.notification_pulse then
			UIAnimation.update(ui_animations.notification_pulse, dt)
		end
	else
		local fade_length = UISettings.chat.chat_close_fade_length

		if chat_close_time and chat_close_time < fade_length then
			local progress = chat_close_time / fade_length

			self:_set_chat_window_alpha(progress)
		elseif self._refocus_chat_window then
			self:_set_chat_window_alpha(1)

			self._refocus_chat_window = nil
		end
	end

	UIRenderer.draw_widget(ui_renderer, window_widget)

	if not self.chat_closed and not self.opening and not self.closing then
		if self.chat_focused and chat_enabled then
			UIRenderer.draw_widget(ui_renderer, input_widget)

			render_settings.alpha_multiplier = self._output_text_alpha_multiplier or alpha_multiplier

			UIRenderer.draw_widget(ui_renderer, output_widget)

			render_settings.alpha_multiplier = alpha_multiplier

			UIRenderer.draw_widget(ui_renderer, scrollbar_widget)

			if output_widget.content.link_pressed then
				local link_data = output_widget.content.link_pressed

				Managers.invite:set_invited_lobby_data(link_data.lobby_id)

				output_widget.content.link_pressed = nil

				print("Link Pressed! -> joining game!")
			end
		end

		if chat_enabled then
			for name, widget in pairs(self._widgets) do
				UIRenderer.draw_widget(ui_renderer, widget)
			end
		end
	end

	self:_abort_hud_scale()
	UIRenderer.end_pass(ui_renderer)

	render_settings.alpha_multiplier = alpha_multiplier
end

ChatGui._update_hud_scale = function (self)
	if not self._resolution_modified then
		self._resolution_modified = RESOLUTION_LOOKUP.modified
	end

	if not self._scale_modified then
		local hud_scale_multiplier = UISettings.hud_scale * 0.01
		self._scale_modified = self._hud_scale_multiplier ~= hud_scale_multiplier
		self._hud_scale_multiplier = hud_scale_multiplier
	end
end

ChatGui._apply_hud_scale = function (self)
	self:_update_hud_scale()

	local scale_modified = self._scale_modified
	local resolution_modified = self._resolution_modified
	local force_update = scale_modified or resolution_modified
	local hud_scale_multiplier = self._hud_scale_multiplier

	UPDATE_RESOLUTION_LOOKUP(force_update, hud_scale_multiplier)
end

ChatGui._abort_hud_scale = function (self)
	local scale_modified = self._scale_modified
	local resolution_modified = self._resolution_modified
	local force_update = scale_modified or resolution_modified

	UPDATE_RESOLUTION_LOOKUP(force_update)
end

ChatGui._set_chat_window_alpha = function (self, progress)
	local ui_settings = UISettings.chat
	local window_widget = self.chat_window_widget
	local input_widget = self.chat_input_widget
	local output_widget = self.chat_output_widget
	local scrollbar_widget = self.scrollbar_widget
	local style = window_widget.style
	style.background.color[1] = ui_settings.window_background_alpha * progress
	style = input_widget.style
	style.background.color[1] = ui_settings.input_background_alpha * progress
	style.text.text_color[1] = ui_settings.input_text_alpha * progress
	style.text.caret_color[1] = ui_settings.input_caret_alpha * progress
	style = output_widget.style
	style.background.color[1] = ui_settings.output_background_alpha * progress
	style = scrollbar_widget.style
	style.background.color[1] = ui_settings.scrollbar_background_alpha * progress
	local stroke_alpha = ui_settings.scrollbar_background_stroke_alpha * progress
	style.background_stroke_top.color[1] = stroke_alpha
	style.background_stroke_bottom.color[1] = stroke_alpha
	style.background_stroke_left.color[1] = stroke_alpha
	style.background_stroke_right.color[1] = stroke_alpha
	style.scrollbar.color[1] = ui_settings.scrollbar_alpha * progress
	stroke_alpha = ui_settings.scrollbar_stroke_alpha * progress
	style.scrollbar_stroke_top.color[1] = stroke_alpha
	style.scrollbar_stroke_bottom.color[1] = stroke_alpha
	self._output_text_alpha_multiplier = progress
end

ChatGui._apply_color_values = function (self, color, to_color)
	color[2] = to_color[2]
	color[3] = to_color[3]
	color[4] = to_color[4]
end

return
