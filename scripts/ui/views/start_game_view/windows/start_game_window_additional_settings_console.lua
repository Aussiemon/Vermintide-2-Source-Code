local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_additional_settings_console_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local gamepad_widget_navigation = definitions.gamepad_widget_navigation
local DO_RELOAD = false
local private_settings = {
	{
		value = false,
		display_name = Localize("start_game_window_other_options_public")
	},
	{
		value = true,
		display_name = Localize("start_game_window_other_options_private")
	}
}
StartGameWindowAdditionalSettingsConsole = class(StartGameWindowAdditionalSettingsConsole)
StartGameWindowAdditionalSettingsConsole.NAME = "StartGameWindowAdditionalSettingsConsole"

StartGameWindowAdditionalSettingsConsole.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowAdditionalSettingsConsole")

	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	self._network_lobby = ingame_ui_context.network_lobby
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}
	self._ui_animations = {}

	self:create_ui_elements(params, offset)
	self:_update_additional_options()

	self._input_index = 0

	self:_handle_input_index(1)

	self._is_focused = false
end

StartGameWindowAdditionalSettingsConsole._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

StartGameWindowAdditionalSettingsConsole.create_ui_elements = function (self, params, offset)
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

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	self:_set_additional_options_enabled_state(true)
end

StartGameWindowAdditionalSettingsConsole._set_additional_options_enabled_state = function (self, enabled)
	local widgets_by_name = self._widgets_by_name
	local private_button = widgets_by_name.private_button
	private_button.content.button_hotspot.disable_button = not enabled
	local host_button = widgets_by_name.host_button
	host_button.content.button_hotspot.disable_button = not enabled
	local strict_matchmaking_button = widgets_by_name.strict_matchmaking_button
	strict_matchmaking_button.content.button_hotspot.disable_button = not enabled
	self._additional_option_enabled = enabled
end

StartGameWindowAdditionalSettingsConsole.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowAdditionalSettingsConsole")

	self.ui_animator = nil
end

StartGameWindowAdditionalSettingsConsole.set_focus = function (self, focused)
	self._is_focused = focused

	if focused then
		self:_start_transition_animation("on_enter")
	else
		self.render_settings.alpha_multiplier = 0
	end
end

StartGameWindowAdditionalSettingsConsole.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	if self._additional_option_enabled then
		self:_update_additional_options()
	end

	self:_update_animations(dt)

	if self._is_focused or not self.gamepad_active_last_frame then
		self:_handle_input(dt, t)
	end

	self:_handle_gamepad_activity()
	self:draw(dt)
end

StartGameWindowAdditionalSettingsConsole.post_update = function (self, dt, t)
	return
end

StartGameWindowAdditionalSettingsConsole._update_animations = function (self, dt)
	local ui_animations = self._ui_animations
	local animations = self._animations
	local ui_animator = self.ui_animator

	for name, animation in pairs(ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			ui_animations[name] = nil
		end
	end

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local widgets_by_name = self._widgets_by_name
end

StartGameWindowAdditionalSettingsConsole._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowAdditionalSettingsConsole._is_button_released = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowAdditionalSettingsConsole._is_stepper_button_pressed = function (self, widget)
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
end

StartGameWindowAdditionalSettingsConsole._is_tab_pressed = function (self, widget)
	local widget_content = widget.content
	local amount = widget_content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]

		if hotspot_content.on_release and not hotspot_content.is_selected then
			return i
		end
	end
end

StartGameWindowAdditionalSettingsConsole._select_tab_by_index = function (self, widget, index)
	local widget_content = widget.content
	local amount = widget_content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]
		hotspot_content.is_selected = i == index
	end
end

StartGameWindowAdditionalSettingsConsole._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StartGameWindowAdditionalSettingsConsole._is_button_hover = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.is_hover
end

StartGameWindowAdditionalSettingsConsole._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit
end

StartGameWindowAdditionalSettingsConsole._is_button_selected = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.is_selected
end

StartGameWindowAdditionalSettingsConsole._is_other_option_button_selected = function (self, widget, current_option)
	if self:_is_button_released(widget) then
		local is_selected = not current_option

		if is_selected then
			self:_play_sound("play_gui_lobby_button_03_private")
		else
			self:_play_sound("play_gui_lobby_button_03_public")
		end

		return is_selected
	end

	return nil
end

StartGameWindowAdditionalSettingsConsole._handle_input_index = function (self, index_increment)
	local input_index = self._input_index
	local widgets_by_name = self._widgets_by_name

	repeat
		input_index = input_index + index_increment
		local widget_name = gamepad_widget_navigation[input_index]

		if not widget_name then
			input_index = self._input_index
		else
			local widget = widgets_by_name[widget_name]

			if not widget.content.button_hotspot.disable_button then
				self._input_index = input_index
			end
		end
	until self._input_index == input_index
end

StartGameWindowAdditionalSettingsConsole._handle_gamepad_input = function (self, dt, t, input_service)
	local index_increment = nil

	if input_service:get("move_down") then
		index_increment = 1
	elseif input_service:get("move_up") then
		index_increment = -1
	end

	if index_increment then
		self:_handle_input_index(index_increment)
	end

	local input_index = self._input_index
	local widgets_by_name = self._widgets_by_name
	local option_tooltip = widgets_by_name.option_tooltip
	local toggle_option = false

	if input_service:get("confirm") then
		toggle_option = true
	end

	local num_inputs = #gamepad_widget_navigation

	for i = 1, num_inputs, 1 do
		local widget_name = gamepad_widget_navigation[i]
		local widget = widgets_by_name[widget_name]
		local is_selected = i == input_index
		local hotspot = widget.content.button_hotspot
		hotspot.is_hover = is_selected

		if is_selected then
			option_tooltip.content.text = widget.content.tooltip_info.description

			if toggle_option then
				hotspot.on_release = true
			end
		end
	end
end

StartGameWindowAdditionalSettingsConsole._handle_mouse_input = function (self, dt, t, input_service)
	local input_index = self._input_index
	local widgets_by_name = self._widgets_by_name
	local option_tooltip = widgets_by_name.option_tooltip
	local is_hovered = false
	local num_inputs = #gamepad_widget_navigation

	for i = 1, num_inputs, 1 do
		local widget_name = gamepad_widget_navigation[i]
		local widget = widgets_by_name[widget_name]
		local is_selected = i == input_index
		local hotspot = widget.content.button_hotspot

		if self:_is_button_hover_enter(widget) then
			option_tooltip.content.text = widget.content.tooltip_info.description
		end

		if self:_is_button_hover(widget) then
			is_hovered = true
		end
	end

	if not is_hovered then
		option_tooltip.content.text = ""
	end
end

StartGameWindowAdditionalSettingsConsole._handle_input = function (self, dt, t)
	local parent = self.parent
	local widgets_by_name = self._widgets_by_name
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local input_service = self.parent:window_input_service()

	if self._additional_option_enabled then
		if gamepad_active then
			self:_handle_gamepad_input(dt, t, input_service)
		else
			self:_handle_mouse_input(dt, t, input_service)
		end

		local host_button = widgets_by_name.host_button
		local private_button = widgets_by_name.private_button
		local strict_matchmaking_button = widgets_by_name.strict_matchmaking_button

		UIWidgetUtils.animate_default_checkbox_button_console(private_button, dt)
		UIWidgetUtils.animate_default_checkbox_button_console(host_button, dt)
		UIWidgetUtils.animate_default_checkbox_button_console(strict_matchmaking_button, dt)

		if self:_is_button_hover_enter(private_button) or self:_is_button_hover_enter(host_button) or self:_is_button_hover_enter(strict_matchmaking_button) then
			self:_play_sound("play_gui_lobby_button_01_difficulty_confirm_hover")
		end

		local changed_selection = self:_is_other_option_button_selected(private_button, self._private_enabled)

		if changed_selection ~= nil then
			parent:set_private_option_enabled(changed_selection)
		end

		changed_selection = self:_is_other_option_button_selected(host_button, self._always_host_enabled)

		if changed_selection ~= nil then
			parent:set_always_host_option_enabled(changed_selection)
		end

		changed_selection = self:_is_other_option_button_selected(strict_matchmaking_button, self._strict_matchmaking_enabled)

		if changed_selection ~= nil then
			parent:set_strict_matchmaking_option_enabled(changed_selection)
		end
	end

	if self.gamepad_active_last_frame then
		local consume = true

		if input_service:get("back", consume) or input_service:get("refresh", consume) or input_service:get("right_stick_press", consume) then
			parent:set_window_input_focus("custom_game_overview")
		end
	end
end

StartGameWindowAdditionalSettingsConsole._play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartGameWindowAdditionalSettingsConsole._update_game_options_hover_effect = function (self)
	local widgets_by_name = self._widgets_by_name
	local widget_prefix = "game_option_"

	for i = 1, 2, 1 do
		local widget_name = widget_prefix .. i
		local widget = widgets_by_name[widget_name]

		if self:_is_button_hover_enter(widget) then
			self:_on_option_button_hover_enter(i)
		elseif self:_is_button_hover_exit(widget) then
			self:_on_option_button_hover_exit(i)
		end
	end
end

StartGameWindowAdditionalSettingsConsole._on_option_button_hover_enter = function (self, index, instant)
	local widgets_by_name = self._widgets_by_name
	local widget_name = "game_option_" .. index
	local widget = widgets_by_name[widget_name]

	self:_create_style_animation_enter(widget, 255, "glow", index, instant)
	self:_create_style_animation_enter(widget, 255, "icon_glow", index, instant)
	self:_create_style_animation_exit(widget, 0, "button_hover_rect", index, instant)
end

StartGameWindowAdditionalSettingsConsole._on_option_button_hover_exit = function (self, index, instant)
	local widgets_by_name = self._widgets_by_name
	local widget_name = "game_option_" .. index
	local widget = widgets_by_name[widget_name]

	self:_create_style_animation_exit(widget, 0, "glow", index, instant)
	self:_create_style_animation_exit(widget, 0, "icon_glow", index, instant)
	self:_create_style_animation_enter(widget, 30, "button_hover_rect", index, instant)
end

StartGameWindowAdditionalSettingsConsole._update_additional_options = function (self)
	local parent = self.parent
	local private_enabled = parent:is_private_option_enabled()
	local always_host_enabled = parent:is_always_host_option_enabled()
	local strict_matchmaking_enabled = parent:is_strict_matchmaking_option_enabled()
	local twitch_active = Managers.twitch and Managers.twitch:is_connected()
	local lobby = self._network_lobby
	local num_members = #lobby:members():get_members()
	local is_alone = num_members == 1

	if is_alone ~= self._is_alone or private_enabled ~= self._private_enabled or always_host_enabled ~= self._always_host_enabled or strict_matchmaking_enabled ~= self._strict_matchmaking_enabled or twitch_active ~= self._twitch_active then
		local widgets_by_name = self._widgets_by_name
		local private_is_selected = private_enabled
		local private_is_disabled = twitch_active
		local always_host_is_selected = private_enabled or not is_alone or always_host_enabled
		local always_host_is_disabled = private_enabled or not is_alone or twitch_active
		local strict_matchmaking_is_selected = not always_host_enabled and not private_enabled and is_alone and strict_matchmaking_enabled
		local strict_matchmaking_is_disabled = private_enabled or always_host_enabled or not is_alone or twitch_active
		local private_hotspot = widgets_by_name.private_button.content.button_hotspot
		private_hotspot.disable_button = private_is_disabled
		private_hotspot.is_selected = private_is_selected
		local host_hotspot = widgets_by_name.host_button.content.button_hotspot
		host_hotspot.disable_button = always_host_is_disabled
		host_hotspot.is_selected = always_host_is_selected
		local strict_matchmaking_hotspot = widgets_by_name.strict_matchmaking_button.content.button_hotspot
		strict_matchmaking_hotspot.disable_button = strict_matchmaking_is_disabled
		strict_matchmaking_hotspot.is_selected = strict_matchmaking_is_selected
		self._private_enabled = private_enabled
		self._always_host_enabled = always_host_enabled
		self._strict_matchmaking_enabled = strict_matchmaking_enabled
		self._twitch_active = twitch_active
		self._is_alone = is_alone
	end
end

StartGameWindowAdditionalSettingsConsole._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

StartGameWindowAdditionalSettingsConsole.draw = function (self, dt)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for _, widget in ipairs(active_node_widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_top_renderer)
end

StartGameWindowAdditionalSettingsConsole._create_style_animation_enter = function (self, widget, target_value, style_id, widget_index, instant)
	local ui_animations = self._ui_animations
	local animation_name = "game_option_" .. style_id
	local widget_style = widget.style
	local pass_style = widget_style[style_id]

	if not pass_style then
		return
	end

	local current_color_value = pass_style.color[1]
	local target_color_value = target_value
	local total_time = 0.2
	local animation_duration = (1 - current_color_value / target_color_value) * total_time

	if animation_duration > 0 and not instant then
		ui_animations[animation_name .. "_hover_" .. widget_index] = self:_animate_element_by_time(pass_style.color, 1, current_color_value, target_color_value, animation_duration)
	else
		pass_style.color[1] = target_color_value
	end
end

StartGameWindowAdditionalSettingsConsole._create_style_animation_exit = function (self, widget, target_value, style_id, widget_index, instant)
	local ui_animations = self._ui_animations
	local animation_name = "game_option_" .. style_id
	local widget_style = widget.style
	local pass_style = widget_style[style_id]

	if not pass_style then
		return
	end

	local current_color_value = pass_style.color[1]
	local target_color_value = target_value
	local total_time = 0.2
	local animation_duration = current_color_value / 255 * total_time

	if animation_duration > 0 and not instant then
		ui_animations[animation_name .. "_hover_" .. widget_index] = self:_animate_element_by_time(pass_style.color, 1, current_color_value, target_color_value, animation_duration)
	else
		pass_style.color[1] = target_color_value
	end
end

StartGameWindowAdditionalSettingsConsole._animate_pulse = function (self, target, target_index, from, to, speed)
	local new_animation = UIAnimation.init(UIAnimation.pulse_animation, target, target_index, from, to, speed)

	return new_animation
end

StartGameWindowAdditionalSettingsConsole._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

StartGameWindowAdditionalSettingsConsole._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end

StartGameWindowAdditionalSettingsConsole._handle_gamepad_activity = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local force_update = self.gamepad_active_last_frame == nil

	if gamepad_active then
		if not self.gamepad_active_last_frame or force_update then
			self.gamepad_active_last_frame = true
			local widgets_by_name = self._widgets_by_name
			self.render_settings.alpha_multiplier = 0
			self.ui_scenegraph.window.local_position[2] = 10
		end
	elseif self.gamepad_active_last_frame or force_update then
		self.gamepad_active_last_frame = false
		local widgets_by_name = self._widgets_by_name

		if self._is_focused then
			self.parent:set_window_input_focus("custom_game_overview")
		end

		self.render_settings.alpha_multiplier = 1
		self.ui_scenegraph.window.local_position[2] = 265
	end
end

return
