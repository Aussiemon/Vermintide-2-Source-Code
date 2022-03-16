local definitions = local_require("scripts/ui/dlc_morris/views/start_game_view/windows/definitions/start_game_window_deus_twitch_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local widget_definitions = definitions.widgets
local selection_widgets_definitions = definitions.selection_widgets
local client_widget_definitions = definitions.client_widgets
local server_widget_definitions = definitions.server_widgets
local additional_settings_widgets_definitions = definitions.additional_settings_widgets
local animation_definitions = definitions.animation_definitions
local selector_input_definition = definitions.selector_input_definition
local START_GAME_INPUT = "refresh_press"
local SELECTION_INPUT = "confirm_press"
local CONNECT_INPUT = "special_1_press"
StartGameWindowDeusTwitch = class(StartGameWindowDeusTwitch)
StartGameWindowDeusTwitch.NAME = "StartGameWindowDeusTwitch"

StartGameWindowDeusTwitch.on_enter = function (self, params, offset)
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
	self._is_focused = false
	self._play_button_pressed = false
	self._show_additional_settings = false
	self._previous_can_play = nil
	self._current_difficulty = self._parent:get_difficulty_option(true) or Managers.state.difficulty:get_difficulty()
	self._dlc_name = nil
	self._animations = {}

	self:_create_ui_elements(params, offset)

	if self._is_server then
		self:_gamepad_selector_input_func(params.input_index or 1)
		self:_update_expedition_option()
		self:_update_difficulty_option(self._current_difficulty)
	end

	self:_set_expedition_text_highlight_offset(self._ui_renderer)

	local connected = Managers.twitch and Managers.twitch:is_connected()

	self:_set_input_description(connected)
	self:_set_disconnect_button_text()
	self:_setup_connected_status()

	if Managers.twitch:is_connected() then
		self:_set_active(true)
	end

	self:_start_transition_animation("on_enter")
end

StartGameWindowDeusTwitch._create_ui_elements = function (self, params, offset)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(widget_definitions)
	self._expedition_widgets = {}
	local selection_widgets = {}
	local selection_widgets_by_name = {}

	if self._is_server then
		selection_widgets, selection_widgets_by_name = UIUtils.create_widgets(selection_widgets_definitions)

		UIUtils.create_widgets(server_widget_definitions, self._widgets, self._widgets_by_name)
		self:_gather_unlocked_journeys()
		self:_setup_journey_widgets()
		self:_refresh_journey_cycle()
	else
		UIUtils.create_widgets(client_widget_definitions, self._widgets, self._widgets_by_name)
	end

	self._selection_widgets = selection_widgets
	self._selection_widgets_by_name = selection_widgets_by_name
	self._additional_settings_widgets, self._additional_settings_widgets_by_name = UIUtils.create_widgets(additional_settings_widgets_definitions)

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

	self._widgets_by_name.difficulty_info.content.visible = false
	self._widgets_by_name.upsell_button.content.visible = false
end

StartGameWindowDeusTwitch.set_focus = function (self, focused)
	self._is_focused = focused
end

StartGameWindowDeusTwitch._set_active = function (self, active)
	if active then
		Managers.irc:register_message_callback("twitch_gamepad", Irc.CHANNEL_MSG, callback(self, "cb_on_message_received"))
	else
		Managers.irc:unregister_message_callback("twitch_gamepad")

		local chat_output_widget = self._widgets_by_name.chat_output_widget
		local chat_output_content = chat_output_widget.content

		table.clear(chat_output_content.message_tables)
	end
end

StartGameWindowDeusTwitch._set_disconnect_button_text = function (self)
	local disconnect_button_widget = self._widgets_by_name.button_2

	if disconnect_button_widget then
		local user_name = (Managers.twitch and Managers.twitch:user_name()) or "N/A"
		disconnect_button_widget.content.button_hotspot.text = string.format(Localize("start_game_window_twitch_disconnect"), user_name)
	end
end

StartGameWindowDeusTwitch.cb_on_message_received = function (self, key, message_type, user_name, message, parameter)
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

StartGameWindowDeusTwitch.set_input_blocked = function (self, blocked)
	local input_manager = Managers.input

	if blocked then
		input_manager:block_device_except_service("start_game_view", "keyboard", 1, "twitch")
		input_manager:block_device_except_service("start_game_view", "mouse", 1, "twitch")
		input_manager:block_device_except_service("start_game_view", "gamepad", 1, "twitch")
		self._parent.parent:set_input_blocked(true)
	else
		input_manager:device_unblock_all_services("keyboard")
		input_manager:device_unblock_all_services("mouse")
		input_manager:device_unblock_all_services("gamepad")
		input_manager:block_device_except_service("start_game_view", "keyboard", 1)
		input_manager:block_device_except_service("start_game_view", "mouse", 1)
		input_manager:block_device_except_service("start_game_view", "gamepad", 1)
		self._parent.parent:set_input_blocked(false)
	end
end

StartGameWindowDeusTwitch._handle_twitch_login_input = function (self, dt, t, input_service)
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
				self:set_input_blocked(true)

				frame_widget_content.text_field_active = true
			elseif screen_hotspot.on_pressed or is_connected then
				if screen_hotspot.on_pressed and not frame_widget_content.text_field_active and not frame_hotspot.on_pressed then
					frame_widget_content.text_field_active = false

					self:set_input_blocked(false)

					return
				end

				frame_widget_content.text_field_active = false

				self:set_input_blocked(false)
			end

			if frame_widget_content.text_field_active then
				if input_service:get("toggle_menu", true) then
					frame_widget_content.text_field_active = false

					self:set_input_blocked(false)
				else
					Managers.chat:block_chat_input_for_one_frame()

					local keystrokes = Keyboard.keystrokes()
					frame_widget_content.twitch_name, frame_widget_content.caret_index = KeystrokeHelper.parse_strokes(frame_widget_content.twitch_name, frame_widget_content.caret_index, "insert", keystrokes)

					if input_service:get("execute_chat_input", true) then
						frame_widget_content.text_field_active = false

						self:set_input_blocked(false)

						local user_name = string.gsub(frame_widget_content.twitch_name, " ", "")

						Managers.twitch:connect(user_name, callback(Managers.twitch, "cb_connection_error_callback"), callback(self, "cb_connection_success_callback"))
					end
				end
			end
		end

		if not is_connected then
			local connect_button_widget = self._widgets_by_name.button_1

			if connect_button_widget and UIUtils.is_button_hover_enter(connect_button_widget) then
				self:_play_sound("Play_hud_hover")
			end

			local button_pressed = connect_button_widget and UIUtils.is_button_pressed(connect_button_widget)

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

			if disconnect_button_widget and UIUtils.is_button_hover_enter(disconnect_button_widget) then
				self:_play_sound("Play_hud_hover")
			end

			local button_pressed = disconnect_button_widget and UIUtils.is_button_pressed(disconnect_button_widget)

			if button_pressed or input_service:get(CONNECT_INPUT) then
				self:_play_sound("Play_hud_select")
				self:_set_active(false)
				Managers.twitch:disconnect()
			end
		end
	end
end

StartGameWindowDeusTwitch.cb_connection_success_callback = function (self, user_data)
	self:_set_disconnect_button_text()
	self:_setup_connected_status()
	self:_set_active(true)
end

StartGameWindowDeusTwitch._setup_connected_status = function (self)
	local user_name = (Managers.twitch and Managers.twitch:user_name()) or "N/A"
	self._widgets_by_name.frame_widget.content.connected = Localize("start_game_window_twitch_connected_to") .. user_name
end

local function is_journey_cycle_expired(journey_cycle, current_time)
	return journey_cycle.remaining_time - (current_time - journey_cycle.time_of_update) < 0
end

StartGameWindowDeusTwitch._get_selection_frame_by_difficulty_index = function (self, difficulty_index)
	local completed_frame_texture = "map_frame_00"

	if difficulty_index and difficulty_index > 0 then
		local difficulty_key = DefaultDifficulties[difficulty_index]
		local settings = DifficultySettings[difficulty_key]
		completed_frame_texture = settings.completed_frame_texture
	end

	return completed_frame_texture
end

StartGameWindowDeusTwitch._gather_unlocked_journeys = function (self)
	local unlocked_journeys = {}

	for _, journey_name in ipairs(LevelUnlockUtils.unlocked_journeys(self._statistics_db, self._stats_id)) do
		unlocked_journeys[journey_name] = true
	end

	self._unlocked_journeys = unlocked_journeys
end

StartGameWindowDeusTwitch._setup_journey_widgets = function (self)
	local node_widgets = self._node_widgets
	local statistics_db = self._statistics_db
	local stats_id = self._stats_id
	local unlocked_journeys = self._unlocked_journeys
	local expedition_widgets = {}
	local journey_position_x = -365
	local settings = definitions.journey_widget_settings
	local available_journey_order = AvailableJourneyOrder

	for i = 1, #available_journey_order, 1 do
		local journey_name = AvailableJourneyOrder[i]
		local journey_data = DeusJourneySettings[journey_name]
		local index = #expedition_widgets + 1
		local next_journey = available_journey_order[index + 1]
		local widget_data = UIWidgets.create_expedition_widget_func("level_root_node", index, journey_data, journey_name, settings)
		local widget = UIWidget.init(widget_data)
		local content = widget.content
		content.text = Localize(journey_data.display_name)
		local width_to_next_journey = settings.width + settings.spacing_x
		journey_position_x = journey_position_x + width_to_next_journey
		local offset = widget.offset
		offset[1] = journey_position_x
		offset[2] = 0
		local completed_difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, journey_name)
		local selection_frame_texture = self:_get_selection_frame_by_difficulty_index(completed_difficulty_index)
		local is_unlocked = unlocked_journeys[journey_name]
		content.level_icon = journey_data.level_image
		content.locked = not is_unlocked
		content.frame = selection_frame_texture
		content.journey_name = journey_name
		content.draw_path = next_journey ~= nil
		content.draw_path_fill = unlocked_journeys[next_journey]
		widget.style.path.texture_size[1] = settings.spacing_x
		widget.style.path_glow.texture_size[1] = settings.spacing_x
		expedition_widgets[index] = widget
		journey_position_x = journey_position_x + settings.spacing_x
	end

	self._expedition_widgets = expedition_widgets
end

StartGameWindowDeusTwitch._refresh_journey_cycle = function (self)
	local backend_deus = Managers.backend:get_interface("deus")
	self._journey_cycle = backend_deus:get_journey_cycle()

	self:_on_new_journey_cycle()
end

StartGameWindowDeusTwitch._on_new_journey_cycle = function (self)
	self:_update_journey_god_icons()
end

StartGameWindowDeusTwitch._update_journey_god_icons = function (self)
	local journey_cycle = self._journey_cycle

	for _, widget in ipairs(self._expedition_widgets) do
		local content = widget.content
		local theme = journey_cycle.journey_data[content.journey_name].dominant_god
		local theme_settings = DeusThemeSettings[theme]
		content.theme_icon = theme_settings.text_icon
	end
end

StartGameWindowDeusTwitch.update = function (self, dt, t)
	self:_update_modifiers(dt, t)
	self:_update_input_description(dt, t)
	self:_update_can_play(dt, t)
	self:_update_animations(dt)
	self:_handle_virtual_keyboard(dt, t)
	self:_handle_gamepad_activity(dt, t)
	self:_handle_input(dt, t)

	if RESOLUTION_LOOKUP.modified then
		self:_set_expedition_text_highlight_offset(self._ui_renderer)
	end

	self:_draw(dt, t)
end

StartGameWindowDeusTwitch.post_update = function (self, dt, t)
	return
end

StartGameWindowDeusTwitch._handle_input = function (self, dt, t)
	if self._virtual_keyboard_id then
		return
	end

	local parent = self._parent
	local input_service = parent:window_input_service()
	local mouse_active = Managers.input:is_device_active("mouse")

	if self._is_server then
		if not mouse_active then
			local input_change = nil
			local input_index = self._input_index

			if input_service:get("move_down") then
				input_index = input_index + 1
				input_change = 1
			elseif input_service:get("move_up") then
				input_index = input_index - 1
				input_change = -1
			else
				local input_funcs = selector_input_definition[input_index]

				input_funcs.update(self, input_service, dt, t)
			end

			if input_index ~= self._input_index then
				self:_gamepad_selector_input_func(input_index, input_change)
			end
		else
			local selection_widgets_by_name = self._selection_widgets_by_name

			for widget_name, widget in pairs(selection_widgets_by_name) do
				if widget_name == "difficulty_stepper" then
					if UIUtils.is_button_pressed(widget, "left_arrow_hotspot") then
						self:_option_selected(widget_name, "left_arrow", t)
					elseif UIUtils.is_button_pressed(widget, "right_arrow_hotspot") then
						self:_option_selected(widget_name, "right_arrow", t)
					end

					if UIUtils.is_button_hover(widget, "info_hotspot") or UIUtils.is_button_hover(self._widgets_by_name.difficulty_info, "widget_hotspot") then
						local widgets = {
							difficulty_info = self._widgets_by_name.difficulty_info,
							upsell_button = self._widgets_by_name.upsell_button
						}

						if not self.diff_info_anim_played then
							self._diff_anim_id = self._ui_animator:start_animation("difficulty_info_enter", widgets, scenegraph_definition)
							self.diff_info_anim_played = true
						end

						self:_update_difficulty_lock()
					else
						if self._diff_anim_id then
							self._ui_animator:stop_animation(self._diff_anim_id)
						end

						self.diff_info_anim_played = false
						self._widgets_by_name.upsell_button.content.visible = false
						self._widgets_by_name.difficulty_info.content.visible = false
					end
				elseif UIUtils.is_button_pressed(widget) then
					self:_option_selected(widget_name, nil, t)
				end

				if widget_name == "difficulty_stepper" then
					widget.content.is_selected = UIUtils.is_button_hover(widget, "left_arrow_hotspot") or UIUtils.is_button_hover(widget, "right_arrow_hotspot")
				else
					widget.content.is_selected = UIUtils.is_button_hover(widget)
				end
			end
		end

		local index = self._expeditions_selection_index
		local selected_widget = self._expedition_widgets[self._expeditions_selection_index]

		for i = 1, #self._expedition_widgets, 1 do
			local widget = self._expedition_widgets[i]

			if UIUtils.is_button_pressed(widget) then
				if selected_widget then
					selected_widget.content.button_hotspot.is_selected = nil
				end

				widget.content.button_hotspot.is_selected = true
				local journey_name = widget.content.journey_name

				parent:set_selected_level_id(journey_name)

				self._expeditions_selection_index = i

				self:_play_sound("play_gui_lobby_button_01_difficulty_select_normal")
			end

			if UIUtils.is_button_hover_enter(widget) then
				self._parent:play_sound("Play_hud_hover")
			end
		end

		local upsell_button = self._widgets_by_name.upsell_button

		if UIUtils.is_button_pressed(upsell_button) then
			Managers.unlock:open_dlc_page(self._dlc_name)
		end

		if self:_can_play() then
			local selection_widgets_by_name = self._selection_widgets_by_name

			if UIUtils.is_button_hover_enter(selection_widgets_by_name.play_button) then
				self._parent:play_sound("Play_hud_hover")
			end

			if input_service:get(START_GAME_INPUT) or UIUtils.is_button_pressed(selection_widgets_by_name.play_button) then
				local twitch_settings = parent:get_twitch_settings(self._mechanism_name) or parent:get_twitch_settings("adventure")

				self._parent:set_difficulty_option(self._current_difficulty)
				parent:play(t, twitch_settings.game_mode_type)

				self._play_button_pressed = true
			end
		end
	end

	self:_update_gamemode_info_text(input_service)
	self:_handle_twitch_login_input(dt, t, input_service)
end

StartGameWindowDeusTwitch._update_input_description = function (self, dt, t)
	local connected = Managers.twitch and Managers.twitch:is_connected()

	self:_set_input_description(connected)
end

StartGameWindowDeusTwitch._update_modifiers = function (self, dt, t)
	local current_time = Managers.time:time("main")
	local journey_cycle = self._journey_cycle

	if not journey_cycle or is_journey_cycle_expired(journey_cycle, current_time) then
		self:_refresh_journey_cycle()
	end
end

StartGameWindowDeusTwitch._update_expedition_option = function (self)
	local parent = self._parent
	local selected_level_id = parent:get_selected_level_id()

	if not selected_level_id then
		return
	end

	local level_settings = LevelSettings[selected_level_id]
	local display_name = level_settings.display_name
	local icon_texture = level_settings.level_image
	local completed_difficulty_index = self._parent:get_completed_level_difficulty_index(self._statistics_db, self._stats_id, selected_level_id)

	for i = 1, #self._expedition_widgets, 1 do
		local widget = self._expedition_widgets[i]
		local content = widget.content
		local journey_name = content.journey_name

		if selected_level_id == journey_name then
			content.button_hotspot.is_selected = true
			self._expeditions_selection_index = i

			break
		end
	end
end

StartGameWindowDeusTwitch._update_button_animations = function (self, dt)
	local widgets_by_name = self._widgets_by_name

	self:_animate_button(widgets_by_name.button_1, dt)
	self:_animate_button(widgets_by_name.button_2, dt)
end

StartGameWindowDeusTwitch._update_animations = function (self, dt, t)
	if not IS_PS4 and not Managers.input:is_device_active("gamepad") then
		self:_update_button_animations(dt)
	end

	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			animations[animation_name] = nil
		end
	end

	local widgets = self._expedition_widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		self:_animate_expedition_widget(widget, dt)
	end
end

StartGameWindowDeusTwitch._draw = function (self, dt, t)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()
	local render_settings = self._render_settings
	local parent_scenegraph_id = nil

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, parent_scenegraph_id, render_settings)
	UIRenderer.draw_all_widgets(ui_top_renderer, self._widgets)
	UIRenderer.draw_all_widgets(ui_top_renderer, self._expedition_widgets)
	UIRenderer.draw_all_widgets(ui_top_renderer, self._selection_widgets)

	if self._show_additional_settings then
		UIRenderer.draw_all_widgets(ui_top_renderer, self._additional_settings_widgets)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

StartGameWindowDeusTwitch._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings
	}
	local anim_id = self._ui_animator:start_animation(animation_name, nil, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

StartGameWindowDeusTwitch._animate_button = function (self, widget, dt)
	local content = widget.content
	local hotspot_name = "button_hotspot"
	local hotspot = content[hotspot_name]
	local input_speed = 20
	local input_progress = hotspot.input_progress or 0
	local input_pressed = hotspot.is_clicked and hotspot.is_clicked == 0
	input_progress = UIUtils.animate_value(input_progress, dt * input_speed, input_pressed)
	local speed = 8
	local hover_progress = hotspot.hover_progress or 0
	local is_hover = not hotspot.disable_button and hotspot.is_hover
	hover_progress = UIUtils.animate_value(hover_progress, dt * speed, is_hover)
	local selection_progress = hotspot.selection_progress or 0
	local is_selected = not hotspot.disable_button and hotspot.is_selected
	selection_progress = UIUtils.animate_value(selection_progress, dt * speed, is_selected)
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

StartGameWindowDeusTwitch._animate_expedition_widget = function (self, widget, dt)
	local content = widget.content
	local hotspot = content.button_hotspot
	local is_selected = hotspot.is_selected
	local selected_progress = hotspot.selected_progress or 0
	local selected_speed = 1.5
	selected_progress = UIUtils.animate_value(selected_progress, selected_speed * dt, is_selected)
	local style = widget.style
	style.purple_glow.color[1] = 255 * selected_progress
	hotspot.selected_progress = selected_progress
end

StartGameWindowDeusTwitch._play_sound = function (self, event)
	self._parent:play_sound(event)
end

StartGameWindowDeusTwitch._handle_virtual_keyboard = function (self, dt, t)
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

StartGameWindowDeusTwitch._handle_gamepad_activity = function (self, dt, t)
	local force_update = self.gamepad_active_last_frame == nil
	local mouse_active = Managers.input:is_device_active("mouse")

	if not mouse_active then
		if not self.gamepad_active_last_frame or force_update then
			self.gamepad_active_last_frame = true
			self._input_index = 1
			local input_funcs = selector_input_definition[self._input_index]

			if input_funcs and input_funcs.enter_requirements(self) then
				input_funcs.on_enter(self)
			end
		end
	elseif self.gamepad_active_last_frame or force_update then
		self.gamepad_active_last_frame = false
		local input_funcs = selector_input_definition[self._input_index]

		if input_funcs then
			input_funcs.on_exit(self)
		end
	end
end

StartGameWindowDeusTwitch._verify_selection_index = function (self, input_index, input_change)
	local verified_index = self._input_index
	local num_inputs = #selector_input_definition
	input_index = math.clamp(input_index, 1, num_inputs)

	if not input_change then
		return input_index
	end

	local input_funcs = selector_input_definition[input_index]

	while input_funcs and input_index < num_inputs and not input_funcs.enter_requirements(self) do
		input_index = input_index + input_change
		input_funcs = selector_input_definition[input_index]
	end

	if input_funcs and input_funcs.enter_requirements(self) then
		verified_index = input_index
	end

	return verified_index
end

StartGameWindowDeusTwitch._gamepad_selector_input_func = function (self, input_index, input_change)
	local mouse_active = Managers.input:is_device_active("mouse")
	input_index = self:_verify_selection_index(input_index, input_change)

	if self._input_index ~= input_index and not mouse_active then
		self._parent:play_sound("play_gui_lobby_button_02_mission_act_click")

		if self._input_index then
			local input_funcs = selector_input_definition[self._input_index]

			input_funcs.on_exit(self)
		end

		local input_funcs = selector_input_definition[input_index]

		input_funcs.on_enter(self)
	end

	self._input_index = input_index
end

StartGameWindowDeusTwitch._update_difficulty_option = function (self, difficulty_key)
	if difficulty_key then
		local difficulty_settings = DifficultySettings[difficulty_key]
		local difficulty_widget = self._selection_widgets_by_name.difficulty_stepper
		difficulty_widget.content.selected_difficulty_text = Localize(difficulty_settings.display_name)
		local display_image = difficulty_settings.display_image
		difficulty_widget.content.difficulty_icon = display_image

		self:_set_info_window(difficulty_key)

		self._current_difficulty = difficulty_key
	end
end

StartGameWindowDeusTwitch._option_selected = function (self, widget_name, button_name, t)
	local parent = self._parent
	local twitch_settings = parent:get_twitch_settings(self._mechanism_name) or parent:get_twitch_settings("adventure")

	if widget_name == "difficulty_stepper" then
		local difficulty_key = self._current_difficulty
		local difficulty_list = GameModeSettings.deus.difficulties
		local current_difficulty_index = table.find(difficulty_list, difficulty_key)
		local new_current_index = 0

		if button_name == "left_arrow" then
			if current_difficulty_index - 1 >= 1 then
				new_current_index = current_difficulty_index - 1

				self._parent:play_sound("hud_morris_start_menu_set")
			end
		elseif button_name == "right_arrow" and current_difficulty_index + 1 <= #difficulty_list then
			new_current_index = current_difficulty_index + 1

			self._parent:play_sound("hud_morris_start_menu_set")
		end

		self:_update_difficulty_option(difficulty_list[new_current_index])
	elseif widget_name == "play_button" then
		self._play_button_pressed = true

		self._parent:set_difficulty_option(self._current_difficulty)
		self._parent:play(t, twitch_settings.game_mode_type)
	else
		ferror("Unknown selector_input_definition: %s", widget_name)
	end
end

StartGameWindowDeusTwitch._set_input_description = function (self, connected)
	if self._is_server then
		if connected then
			local input_actions = (self._dlc_locked and "deus_twitch_buy_connected") or "deus_default_twitch_connected"

			self._parent:change_generic_actions(input_actions)
		else
			local input_actions = (self._dlc_locked and "deus_twitch_buy") or "deus_default_twitch"

			self._parent:change_generic_actions(input_actions)
		end
	elseif connected then
		self._parent:change_generic_actions("deus_default_twitch_client_connected")
	else
		self._parent:change_generic_actions("deus_default_twitch_client")
	end

	self._input_description_connected = connected
end

StartGameWindowDeusTwitch._update_can_play = function (self, dt, t)
	if self._is_server then
		local can_play = self:_can_play()

		if self._previous_can_play ~= can_play then
			self._previous_can_play = can_play
			local play_button = self._selection_widgets_by_name.play_button
			play_button.content.button_hotspot.disable_button = not can_play

			if can_play then
				self._parent:set_input_description("play_available")
			else
				self._parent:set_input_description(nil)
			end
		end
	end
end

StartGameWindowDeusTwitch._can_play = function (self)
	if not self._is_server then
		return false
	end

	local parent = self._parent
	local selected_level_id = parent:get_selected_level_id()
	local connected = Managers.twitch and Managers.twitch:is_connected()
	local can_play = selected_level_id ~= nil and connected and not self._dlc_locked

	return can_play
end

StartGameWindowDeusTwitch.on_exit = function (self, params)
	print("[StartGameViewWindow] Exit Substate StartGameWindowTwitchOverviewConsole")

	self._ui_animator = nil

	if self._play_button_pressed then
		params.input_index = nil
	else
		params.input_index = self._input_index
	end

	self._parent:set_difficulty_option(self._current_difficulty)
	self:_set_active(false)
end

StartGameWindowDeusTwitch._set_info_window = function (self, difficulty_key)
	local difficulty_settings = DifficultySettings[difficulty_key]
	local description = difficulty_settings.description
	local chest_max_power_level = difficulty_settings.max_chest_power_level
	local selected_difficulty_info_widget = self._widgets_by_name.difficulty_info
	selected_difficulty_info_widget.content.difficulty_description = Localize(description)
	selected_difficulty_info_widget.content.highest_obtainable_level = Localize("difficulty_chest_max_powerlevel") .. ": " .. tostring(chest_max_power_level)
end

StartGameWindowDeusTwitch._update_difficulty_lock = function (self)
	local selected_difficulty_key = self._current_difficulty
	local difficulty_info_widget = self._widgets_by_name.difficulty_info
	local upsell_button = self._widgets_by_name.upsell_button

	if selected_difficulty_key then
		local approved, extra_requirement_failed, dlc_locked, below_power_level = self._parent:is_difficulty_approved(selected_difficulty_key)

		if not approved then
			if extra_requirement_failed then
				difficulty_info_widget.content.should_show_diff_lock_text = true
				difficulty_info_widget.content.difficulty_lock_text = (extra_requirement_failed and Localize(extra_requirement_failed)) or ""
			else
				difficulty_info_widget.content.should_show_diff_lock_text = false
			end

			if dlc_locked then
				difficulty_info_widget.content.should_show_dlc_lock = true
				self._dlc_locked = dlc_locked
				self._dlc_name = dlc_locked
				upsell_button.content.visible = true
			else
				difficulty_info_widget.content.should_show_dlc_lock = false
				upsell_button.content.visible = false
				self._dlc_locked = nil
				self._dlc_name = nil
			end
		else
			difficulty_info_widget.content.should_show_dlc_lock = false
			difficulty_info_widget.content.should_show_diff_lock_text = false
			difficulty_info_widget.content.should_resize = false
			upsell_button.content.visible = false
			self._dlc_locked = nil
			self._dlc_name = nil
		end

		self._difficulty_approved = approved
	else
		difficulty_info_widget.content.should_show_dlc_lock = false
		upsell_button.content.visible = false
	end

	local widget_height = self:_calculate_difficulty_info_widget_size(difficulty_info_widget)
	local offset_y = (math.floor(widget_height) - scenegraph_definition.difficulty_info.size[2]) / 2

	self:_resize_difficulty_info({
		math.floor(scenegraph_definition.difficulty_info.size[1]),
		math.floor(widget_height)
	}, {
		0,
		-offset_y,
		1
	})

	upsell_button.offset[2] = -math.floor(widget_height) / 2 + 24
end

StartGameWindowDeusTwitch._calculate_difficulty_info_widget_size = function (self, diff_widget)
	local spacing = 20
	local description_text_style = diff_widget.style.difficulty_description
	local description_text = diff_widget.content.difficulty_description
	local description_text_height = UIUtils.get_text_height(self._ui_renderer, description_text_style.size, description_text_style, description_text)
	diff_widget.content.difficulty_description_text_size = description_text_height
	local chest_text_style = diff_widget.style.highest_obtainable_level
	local chest_text = diff_widget.content.highest_obtainable_level
	local chest_text_height = UIUtils.get_text_height(self._ui_renderer, chest_text_style.size, chest_text_style, chest_text) + spacing
	local difficulty_lock_text_style = diff_widget.style.difficulty_lock_text
	local difficulty_lock_text = diff_widget.content.difficulty_lock_text
	local difficulty_lock_text_height = 0

	if diff_widget.content.should_show_diff_lock_text then
		difficulty_lock_text_height = UIUtils.get_text_height(self._ui_renderer, difficulty_lock_text_style.size, difficulty_lock_text_style, difficulty_lock_text) + spacing
		diff_widget.content.difficulty_lock_text_height = difficulty_lock_text_height
	end

	local dlc_lock_text_style = diff_widget.style.dlc_lock_text
	local dlc_lock_text = diff_widget.content.dlc_lock_text
	local dlc_lock_text_height = 0

	if diff_widget.content.should_show_dlc_lock then
		dlc_lock_text_height = UIUtils.get_text_height(self._ui_renderer, dlc_lock_text_style.size, dlc_lock_text_style, dlc_lock_text) + spacing
	end

	local widget_height = chest_text_height + description_text_height + difficulty_lock_text_height + dlc_lock_text_height + 50

	return widget_height
end

StartGameWindowDeusTwitch._resize_difficulty_info = function (self, new_size, new_offset)
	local difficulty_info_widget = self._widgets_by_name.difficulty_info
	difficulty_info_widget.content.should_resize = true
	difficulty_info_widget.content.resize_size = new_size
	difficulty_info_widget.content.resize_offset = new_offset
	difficulty_info_widget.style.widget_hotspot.size = new_size
	difficulty_info_widget.style.widget_hotspot.offset = new_offset
end

StartGameWindowDeusTwitch._update_gamemode_info_text = function (self, input_service)
	local gamemode_infobox_widget = self._widgets_by_name.twitch_gamemode_info_box

	if input_service:get("trigger_cycle_next") and not gamemode_infobox_widget.content.is_showing_info then
		self._ui_animator:start_animation("gamemode_text_swap", gamemode_infobox_widget, scenegraph_definition)

		gamemode_infobox_widget.content.is_showing_info = true
	elseif input_service:get("trigger_cycle_next") and gamemode_infobox_widget.content.is_showing_info then
		self._ui_animator:start_animation("gamemode_text_swap", gamemode_infobox_widget, scenegraph_definition)

		gamemode_infobox_widget.content.is_showing_info = false
	end

	if UIUtils.is_button_pressed(gamemode_infobox_widget, "info_hotspot") then
		if not gamemode_infobox_widget.content.is_showing_info then
			self._ui_animator:start_animation("gamemode_text_swap", gamemode_infobox_widget, scenegraph_definition)

			gamemode_infobox_widget.content.is_showing_info = true
		else
			self._ui_animator:start_animation("gamemode_text_swap", gamemode_infobox_widget, scenegraph_definition)

			gamemode_infobox_widget.content.is_showing_info = false
		end
	end
end

StartGameWindowDeusTwitch._set_expedition_text_highlight_offset = function (self, ui_renderer)
	local game_mode_info_box = self._widgets_by_name.twitch_gamemode_info_box
	local text = game_mode_info_box.content.game_mode_text
	local expedition_text_style = game_mode_info_box.style.expedition_highlight_text
	local expedition_word = Utf8.lower(Localize("expedition_highlight_text"))
	local index_start = string.find(text, expedition_word, 1, true)

	if index_start then
		local prefix = string.sub(text, 1, index_start - 1)
		local split_text_length = UIUtils.get_text_width(ui_renderer, game_mode_info_box.style.game_mode_text, prefix)
		local new_offset = 25 + split_text_length
		game_mode_info_box.content.expedition_highlight_text = expedition_word
		expedition_text_style.offset[1] = new_offset
	else
		game_mode_info_box.content.expedition_highlight_text = ""
	end
end

return
