local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_game_mode_definitions")
local widget_definitions = definitions.widgets
local game_option_widgets = definitions.game_option_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false
StartGameWindowGameMode = class(StartGameWindowGameMode)
StartGameWindowGameMode.NAME = "StartGameWindowGameMode"

StartGameWindowGameMode.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowGameMode")

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
	self._animations = {}
	self._ui_animations = {}

	self:create_ui_elements(params, offset)
end

StartGameWindowGameMode.create_ui_elements = function (self, params, offset)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widgets = {}
	local widgets_by_name = {}
	self._disabled_widgets = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	for name, widget_definition in pairs(game_option_widgets) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	self._disabled_widgets.game_option_4 = not GameSettingsDevelopment.twitch_enabled or Managers.account:offline_mode()

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StartGameWindowGameMode.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowGameMode")

	self.ui_animator = nil
end

StartGameWindowGameMode.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self:_update_selected_option()
	self:_update_animations(dt)
	self:_handle_input(dt, t)
	self:draw(dt)
end

StartGameWindowGameMode.post_update = function (self, dt, t)
	return
end

StartGameWindowGameMode._update_animations = function (self, dt)
	self:_update_game_options_hover_effect(dt)

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
end

StartGameWindowGameMode._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowGameMode._is_stepper_button_pressed = function (self, widget)
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

StartGameWindowGameMode._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StartGameWindowGameMode._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit
end

StartGameWindowGameMode._is_button_selected = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.is_selected
end

local layout_indices = {
	win32 = {
		1,
		2,
		3,
		4
	},
	xb1 = {
		1,
		2,
		3,
		(GameSettingsDevelopment.twitch_enabled and 4) or nil
	},
	ps4 = {
		1,
		2,
		3
	}
}

StartGameWindowGameMode._handle_input = function (self, dt, t)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local widgets_by_name = self._widgets_by_name

	if self:_is_button_pressed(widgets_by_name.game_option_1) then
		local layout_index = 1
		PlayerData.mission_selection.start_layout = layout_index

		self.parent:set_layout(layout_index)
	elseif self:_is_button_pressed(widgets_by_name.game_option_2) then
		local layout_index = 2
		PlayerData.mission_selection.start_layout = layout_index

		self.parent:set_layout(layout_index)
	elseif self:_is_button_pressed(widgets_by_name.game_option_3) then
		local layout_index = 3
		PlayerData.mission_selection.start_layout = layout_index

		self.parent:set_layout(layout_index)
	elseif self:_is_button_pressed(widgets_by_name.game_option_4) then
		local layout_index = 4

		self.parent:set_layout(layout_index)

		PlayerData.mission_selection.start_layout = layout_index
	elseif widgets_by_name.game_option_5 and self:_is_button_pressed(widgets_by_name.game_option_5) then
		self.parent:set_layout(8)
	elseif gamepad_active then
		local platform_layout_indices = layout_indices[PLATFORM]
		local input_service = self.parent:window_input_service()
		local current_index = self.parent:get_selected_game_mode_index()
		local current_game_mode_index = table.find(platform_layout_indices, current_index)

		if input_service:get("move_up_raw") then
			if current_game_mode_index > 1 then
				local index = platform_layout_indices[current_game_mode_index - 1]

				self.parent:set_layout(index)
			end
		elseif input_service:get("move_down_raw") and current_game_mode_index < #platform_layout_indices then
			local index = platform_layout_indices[current_game_mode_index + 1]

			self.parent:set_layout(index)
		end
	end
end

StartGameWindowGameMode._update_game_options_hover_effect = function (self, dt)
	local widgets_by_name = self._widgets_by_name
	local widget_prefix = "game_option_"

	for i = 1, 4, 1 do
		local widget_name = widget_prefix .. i
		local widget = widgets_by_name[widget_name]

		UIWidgetUtils.animate_option_button(widget, dt)

		if self:_is_button_hover_enter(widget) and not self:_is_button_selected(widget) then
			self:_play_sound("play_gui_equipment_button_hover")
		end
	end

	if widgets_by_name.game_option_5 and self:_is_button_hover_enter(widgets_by_name.game_option_5) then
		self:_play_sound("play_gui_equipment_button_hover")
	end

	if widgets_by_name.game_option_5 then
		UIWidgetUtils.animate_default_button(widgets_by_name.game_option_5, dt)
	end
end

StartGameWindowGameMode._set_selected_option = function (self, index)
	local widgets_by_name = self._widgets_by_name
	local widget_prefix = "game_option_"

	for i = 1, 4, 1 do
		local widget_name = widget_prefix .. i
		local widget = widgets_by_name[widget_name]
		widget.content.button_hotspot.is_selected = index == i
	end
end

StartGameWindowGameMode._update_selected_option = function (self)
	local parent = self.parent
	local selected_index = parent:get_selected_game_mode_index()

	if selected_index ~= self._selected_index then
		self:_set_selected_option(selected_index)

		self._selected_index = selected_index
	end
end

StartGameWindowGameMode.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for name, widget in pairs(self._widgets_by_name) do
		if not self._disabled_widgets[name] then
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for _, widget in ipairs(active_node_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)
end

StartGameWindowGameMode._play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartGameWindowGameMode._create_style_animation_enter = function (self, widget, target_value, style_id, widget_index, instant)
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

StartGameWindowGameMode._create_style_animation_exit = function (self, widget, target_value, style_id, widget_index, instant)
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

StartGameWindowGameMode._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

StartGameWindowGameMode._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end

return
