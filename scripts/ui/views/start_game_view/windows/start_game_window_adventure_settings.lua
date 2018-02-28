local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_adventure_settings_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false
StartGameWindowAdventureSettings = class(StartGameWindowAdventureSettings)
StartGameWindowAdventureSettings.NAME = "StartGameWindowAdventureSettings"
StartGameWindowAdventureSettings.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowAdventureSettings")

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
	self._update_difficulty_option(self)

	return 
end
StartGameWindowAdventureSettings.create_ui_elements = function (self, params, offset)
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

	widgets_by_name.play_button.content.button_hotspot.disable_button = true
	widgets_by_name.game_option_reward.content.button_hotspot.disable_button = true
	local game_option_1 = widgets_by_name.game_option_1
	local anim = self._animate_pulse(self, game_option_1.style.glow_frame.color, 1, 255, 100, 2)

	UIWidget.animate(game_option_1, anim)

	return 
end
StartGameWindowAdventureSettings.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowAdventureSettings")

	self.ui_animator = nil

	return 
end
StartGameWindowAdventureSettings.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self.create_ui_elements(self)
	end

	self._update_difficulty_option(self)
	self._update_animations(self, dt)
	self._handle_input(self, dt, t)
	self.draw(self, dt)

	return 
end
StartGameWindowAdventureSettings.post_update = function (self, dt, t)
	return 
end
StartGameWindowAdventureSettings._update_animations = function (self, dt)
	self._update_game_options_hover_effect(self)

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

	local widgets_by_name = self._widgets_by_name

	return 
end
StartGameWindowAdventureSettings._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
end
StartGameWindowAdventureSettings._is_button_released = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
end
StartGameWindowAdventureSettings._is_stepper_button_pressed = function (self, widget)
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
StartGameWindowAdventureSettings._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end
StartGameWindowAdventureSettings._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit
end
StartGameWindowAdventureSettings._is_button_selected = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.is_selected
end
StartGameWindowAdventureSettings._handle_input = function (self, dt, t)
	local parent = self.parent
	local widgets_by_name = self._widgets_by_name

	if self._is_button_released(self, widgets_by_name.game_option_1) then
		parent.set_layout(parent, 9)
	end

	if self._is_button_released(self, widgets_by_name.play_button) then
		parent.set_private_option_enabled(parent, false)
		parent.play(parent, t)
	end

	return 
end
StartGameWindowAdventureSettings._play_sound = function (self, event)
	self.parent:play_sound(event)

	return 
end
StartGameWindowAdventureSettings._update_difficulty_option = function (self)
	local parent = self.parent
	local difficulty_key = parent.get_difficulty_option(parent)

	if difficulty_key ~= self._difficulty_key then
		self._set_difficulty_option(self, difficulty_key)

		self._difficulty_key = difficulty_key
		self._widgets_by_name.play_button.content.button_hotspot.disable_button = false
		self._widgets_by_name.game_option_reward.content.button_hotspot.disable_button = false
	end

	return 
end
StartGameWindowAdventureSettings._set_difficulty_option = function (self, difficulty_key)
	local widgets_by_name = self._widgets_by_name
	local difficulty_settings = DifficultySettings[difficulty_key]
	local display_name = difficulty_settings.display_name
	local display_image = difficulty_settings.display_image
	local completed_frame_texture = difficulty_settings.completed_frame_texture or "map_frame_00"
	widgets_by_name.game_option_1.content.option_text = Localize(display_name)
	widgets_by_name.game_option_1.content.icon = display_image
	widgets_by_name.game_option_1.content.icon_frame = completed_frame_texture

	return 
end
StartGameWindowAdventureSettings._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level

	return 
end
StartGameWindowAdventureSettings.draw = function (self, dt)
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
StartGameWindowAdventureSettings._play_sound = function (self, event)
	self.parent:play_sound(event)

	return 
end
StartGameWindowAdventureSettings._update_game_options_hover_effect = function (self)
	local widgets_by_name = self._widgets_by_name
	local widget_prefix = "game_option_"

	for i = 1, 1, 1 do
		local widget_name = widget_prefix .. i
		local widget = widgets_by_name[widget_name]

		if self._is_button_hover_enter(self, widget) then
			self._on_option_button_hover_enter(self, i)
		elseif self._is_button_hover_exit(self, widget) then
			self._on_option_button_hover_exit(self, i)
		end
	end

	return 
end
StartGameWindowAdventureSettings._on_option_button_hover_enter = function (self, index, instant)
	local widgets_by_name = self._widgets_by_name
	local widget_name = "game_option_" .. index
	local widget = widgets_by_name[widget_name]

	self._create_style_animation_enter(self, widget, 255, "glow", index, instant)
	self._create_style_animation_enter(self, widget, 255, "icon_glow", index, instant)
	self._create_style_animation_exit(self, widget, 0, "button_hover_rect", index, instant)

	return 
end
StartGameWindowAdventureSettings._on_option_button_hover_exit = function (self, index, instant)
	local widgets_by_name = self._widgets_by_name
	local widget_name = "game_option_" .. index
	local widget = widgets_by_name[widget_name]

	self._create_style_animation_exit(self, widget, 0, "glow", index, instant)
	self._create_style_animation_exit(self, widget, 0, "icon_glow", index, instant)
	self._create_style_animation_enter(self, widget, 30, "button_hover_rect", index, instant)

	return 
end
StartGameWindowAdventureSettings._create_style_animation_enter = function (self, widget, target_value, style_id, widget_index, instant)
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
StartGameWindowAdventureSettings._create_style_animation_exit = function (self, widget, target_value, style_id, widget_index, instant)
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
StartGameWindowAdventureSettings._animate_pulse = function (self, target, target_index, from, to, speed)
	local new_animation = UIAnimation.init(UIAnimation.pulse_animation, target, target_index, from, to, speed)

	return new_animation
end
StartGameWindowAdventureSettings._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end
StartGameWindowAdventureSettings._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end

return 
