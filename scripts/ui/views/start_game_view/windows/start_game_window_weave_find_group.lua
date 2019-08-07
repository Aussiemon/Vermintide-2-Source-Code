local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_weave_find_group_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
StartGameWindowWeaveFindGroup = class(StartGameWindowWeaveFindGroup)
StartGameWindowWeaveFindGroup.NAME = "StartGameWindowWeaveFindGroup"

StartGameWindowWeaveFindGroup.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowWeaveFindGroup")

	self._parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._statistics_db = ingame_ui_context.statistics_db
	self._render_settings = {
		snap_pixel_positions = true
	}
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self._player_manager = player_manager
	self._peer_id = ingame_ui_context.peer_id

	self:_create_ui_elements(params, offset)
end

StartGameWindowWeaveFindGroup._create_ui_elements = function (self, params, offset)
	local ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._ui_scenegraph = ui_scenegraph
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._ui_animations = {}
	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
	local overlay_button = widgets_by_name.overlay_button
	local anim = self:_animate_pulse(overlay_button.style.glow_frame.color, 1, 255, 100, 2)

	UIWidget.animate(overlay_button, anim)

	if offset then
		local window_position = ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StartGameWindowWeaveFindGroup.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowWeaveFindGroup")

	self._ui_animator = nil
end

StartGameWindowWeaveFindGroup._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StartGameWindowWeaveFindGroup._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit
end

StartGameWindowWeaveFindGroup._update_game_options_hover_effect = function (self)
	local widgets_by_name = self._widgets_by_name
	local overlay_button_widget = widgets_by_name.overlay_button

	if self:_is_button_hover_enter(overlay_button_widget) then
		self:_on_option_button_hover_enter(overlay_button_widget, 2)
	elseif self:_is_button_hover_exit(overlay_button_widget) then
		self:_on_option_button_hover_exit(overlay_button_widget, 2)
	end
end

StartGameWindowWeaveFindGroup._on_option_button_hover_enter = function (self, widget, index, instant)
	self:_create_style_animation_enter(widget, 255, "glow", index, instant)
	self:_create_style_animation_exit(widget, 0, "button_hover_rect", index, instant)
end

StartGameWindowWeaveFindGroup._on_option_button_hover_exit = function (self, widget, index, instant)
	self:_create_style_animation_exit(widget, 0, "glow", index, instant)
	self:_create_style_animation_enter(widget, 30, "button_hover_rect", index, instant)
end

StartGameWindowWeaveFindGroup._create_style_animation_enter = function (self, widget, target_value, style_id, widget_index, instant)
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
		local ui_animations = self._ui_animations
		local animation_name = "game_option_" .. style_id
		ui_animations[animation_name .. "_hover_" .. widget_index] = self:_animate_element_by_time(pass_style.color, 1, current_color_value, target_color_value, animation_duration)
	else
		pass_style.color[1] = target_color_value
	end
end

StartGameWindowWeaveFindGroup._animate_pulse = function (self, target, target_index, from, to, speed)
	local new_animation = UIAnimation.init(UIAnimation.pulse_animation, target, target_index, from, to, speed)

	return new_animation
end

StartGameWindowWeaveFindGroup._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

StartGameWindowWeaveFindGroup._create_style_animation_exit = function (self, widget, target_value, style_id, widget_index, instant)
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
		local ui_animations = self._ui_animations
		local animation_name = "game_option_" .. style_id
		ui_animations[animation_name .. "_hover_" .. widget_index] = self:_animate_element_by_time(pass_style.color, 1, current_color_value, target_color_value, animation_duration)
	else
		pass_style.color[1] = target_color_value
	end
end

StartGameWindowWeaveFindGroup._play_sound = function (self, event)
	self._parent:play_sound(event)
end

StartGameWindowWeaveFindGroup.update = function (self, dt, t)
	self:_update_button_state(dt, t)
	self:_update_animations(dt, t)
	self:_update_input(dt, t)
	self:_draw(dt)
end

StartGameWindowWeaveFindGroup._update_button_state = function (self, dt)
	local button_widget = self._widgets_by_name.overlay_button
	local button_widget_content = button_widget.content
	local button_hotspot = button_widget_content.button_hotspot
	local lobby = Managers.state.network:lobby()
	local lobby_members = lobby:members()
	local members = lobby_members:get_members()
	local num_players = #members
	button_hotspot.disable_button = num_players >= 4
end

StartGameWindowWeaveFindGroup._update_animations = function (self, dt)
	self:_update_game_options_hover_effect()

	local ui_animations = self._ui_animations or {}

	for name, animation in pairs(ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			ui_animations[name] = nil
		end
	end

	local ui_animator = self._ui_animator

	ui_animator:update(dt)
end

StartGameWindowWeaveFindGroup._update_input = function (self, dt, t)
	local button_widget = self._widgets_by_name.overlay_button
	local button_widget_content = button_widget.content
	local button_hotspot = button_widget_content.button_hotspot

	if self:_is_button_hover_enter(button_widget) then
		self:_play_sound("play_gui_lobby_button_01_difficulty_confirm_hover")
	end

	if button_hotspot.on_pressed then
		self._parent:play(t, "weave_find_group")
	end
end

StartGameWindowWeaveFindGroup.post_update = function (self, dt, t)
	return
end

StartGameWindowWeaveFindGroup._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)

	local widgets = self._widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

return
