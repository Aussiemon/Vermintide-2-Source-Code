local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_game_mode_definitions")
local widget_definitions = definitions.widgets
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
	local local_player = player_manager.local_player(player_manager)
	self._stats_id = local_player.stats_id(local_player)
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}
	self._ui_animations = {}

	self.create_ui_elements(self, params, offset)

	return 
end
StartGameWindowGameMode.create_ui_elements = function (self, params, offset)
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

	widgets_by_name.game_option_3.content.button_hotspot.disable_button = true

	return 
end
StartGameWindowGameMode.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowGameMode")

	self.ui_animator = nil

	return 
end
StartGameWindowGameMode.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self.create_ui_elements(self)
	end

	self._update_selected_option(self)
	self._update_animations(self, dt)
	self._handle_input(self, dt, t)
	self.draw(self, dt)

	return 
end
StartGameWindowGameMode.post_update = function (self, dt, t)
	return 
end
StartGameWindowGameMode._update_animations = function (self, dt)
	self._update_game_options_hover_effect(self, dt)

	local ui_animations = self._ui_animations
	local animations = self._animations
	local ui_animator = self.ui_animator

	for name, animation in pairs(ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			ui_animations[name] = nil
		end
	end

	ui_animator.update(ui_animator, dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator.is_animation_completed(ui_animator, animation_id) then
			ui_animator.stop_animation(ui_animator, animation_id)

			animations[animation_name] = nil
		end
	end

	return 
end
StartGameWindowGameMode._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
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

	return 
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
StartGameWindowGameMode._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name

	if self._is_button_pressed(self, widgets_by_name.game_option_1) then
		local layout_index = 1
		PlayerData.mission_selection.start_layout = layout_index

		self.parent:set_layout(layout_index)
	elseif self._is_button_pressed(self, widgets_by_name.game_option_2) then
		local layout_index = 2
		PlayerData.mission_selection.start_layout = layout_index

		self.parent:set_layout(layout_index)
	elseif self._is_button_pressed(self, widgets_by_name.game_option_3) then
		local layout_index = 3
		PlayerData.mission_selection.start_layout = layout_index

		self.parent:set_layout(layout_index)
	elseif self._is_button_pressed(self, widgets_by_name.game_option_4) then
		self.parent:set_layout(8)
	end

	return 
end
StartGameWindowGameMode._update_game_options_hover_effect = function (self, dt)
	local widgets_by_name = self._widgets_by_name
	local widget_prefix = "game_option_"

	for i = 1, 3, 1 do
		local widget_name = widget_prefix .. i
		local widget = widgets_by_name[widget_name]

		self._animate_option_button(self, widget, dt)

		if self._is_button_hover_enter(self, widget) and not self._is_button_selected(self, widget) then
			self._play_sound(self, "play_gui_equipment_button_hover")
		end
	end

	UIWidgetUtils.animate_default_button(widgets_by_name.game_option_4, dt)

	return 
end
StartGameWindowGameMode._set_selected_option = function (self, index)
	local widgets_by_name = self._widgets_by_name
	local widget_prefix = "game_option_"

	for i = 1, 4, 1 do
		local widget_name = widget_prefix .. i
		local widget = widgets_by_name[widget_name]
		widget.content.button_hotspot.is_selected = index == i
	end

	return 
end
StartGameWindowGameMode._update_selected_option = function (self)
	local parent = self.parent
	local selected_index = parent.get_selected_game_mode_index(parent)

	if selected_index ~= self._selected_index then
		self._set_selected_option(self, selected_index)

		self._selected_index = selected_index
	end

	return 
end
StartGameWindowGameMode.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for _, widget in ipairs(active_node_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end
StartGameWindowGameMode._play_sound = function (self, event)
	self.parent:play_sound(event)

	return 
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
	local animation_duration = (current_color_value/target_color_value - 1)*total_time

	if 0 < animation_duration and not instant then
		ui_animations[animation_name .. "_hover_" .. widget_index] = self._animate_element_by_time(self, pass_style.color, 1, current_color_value, target_color_value, animation_duration)
	else
		pass_style.color[1] = target_color_value
	end

	return 
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
	local animation_duration = current_color_value/255*total_time

	if 0 < animation_duration and not instant then
		ui_animations[animation_name .. "_hover_" .. widget_index] = self._animate_element_by_time(self, pass_style.color, 1, current_color_value, target_color_value, animation_duration)
	else
		pass_style.color[1] = target_color_value
	end

	return 
end
StartGameWindowGameMode._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end
StartGameWindowGameMode._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end
StartGameWindowGameMode._animate_option_button = function (self, widget, dt)
	local ui_renderer = self.ui_renderer
	local scenegraph_id = widget.scenegraph_id
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot
	local is_hover = hotspot.is_hover
	local is_selected = hotspot.is_selected
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local input_progress = hotspot.input_progress or 0
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 8
	local input_speed = 20

	if input_pressed then
		input_progress = math.min(input_progress + dt*input_speed, 1)
	else
		input_progress = math.max(input_progress - dt*input_speed, 0)
	end

	local input_easing_out_progress = math.easeOutCubic(input_progress)
	local input_easing_in_progress = math.easeInCubic(input_progress)

	if is_hover then
		hover_progress = math.min(hover_progress + dt*speed, 1)
	else
		hover_progress = math.max(hover_progress - dt*speed, 0)
	end

	local hover_easing_out_progress = math.easeOutCubic(hover_progress)
	local hover_easing_in_progress = math.easeInCubic(hover_progress)

	if is_selected then
		selection_progress = math.min(selection_progress + dt*speed, 1)
	else
		selection_progress = math.max(selection_progress - dt*speed, 0)
	end

	local select_easing_out_progress = math.easeOutCubic(selection_progress)
	local select_easing_in_progress = math.easeInCubic(selection_progress)
	local combined_progress = math.max(hover_progress, selection_progress)
	local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
	local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
	local input_alpha = input_progress*255
	style.button_clicked_rect.color[1] = input_progress*100
	style.hover_glow.color[1] = combined_progress*255
	local select_alpha = selection_progress*255
	style.select_glow.color[1] = select_alpha
	style.icon_selected.color[1] = select_alpha
	style.skull_select_glow.color[1] = select_alpha
	style.icon_bg_glow.color[1] = select_alpha
	local text_disabled_style = style.button_text_disabled
	local disabled_default_text_color = text_disabled_style.default_text_color
	local disabled_text_color = text_disabled_style.text_color
	disabled_text_color[2] = disabled_default_text_color[2]*0.4
	disabled_text_color[3] = disabled_default_text_color[3]*0.4
	disabled_text_color[4] = disabled_default_text_color[4]*0.4
	local button_text_style = style.button_text
	local button_text_color = button_text_style.text_color
	local default_text_color = button_text_style.default_text_color
	local select_text_color = button_text_style.select_text_color

	Colors.lerp_color_tables(default_text_color, select_text_color, combined_progress, button_text_color)

	local icon_color = style.icon.color
	icon_color[2] = button_text_color[2]
	icon_color[3] = button_text_color[3]
	icon_color[4] = button_text_color[4]
	local background_icon_style = style.background_icon
	local background_icon_color = background_icon_style.color
	local background_icon_default_color = background_icon_style.default_color
	background_icon_color[2] = background_icon_default_color[2] + combined_progress*(background_icon_default_color[2] - 255)
	background_icon_color[3] = background_icon_default_color[3] + combined_progress*(background_icon_default_color[3] - 255)
	background_icon_color[4] = background_icon_default_color[4] + combined_progress*(background_icon_default_color[4] - 255)
	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress

	return 
end

return 
