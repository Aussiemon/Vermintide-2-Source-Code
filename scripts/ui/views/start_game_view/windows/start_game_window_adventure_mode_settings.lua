local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_adventure_mode_settings_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
StartGameWindowAdventureModeSettings = class(StartGameWindowAdventureModeSettings)
StartGameWindowAdventureModeSettings.NAME = "StartGameWindowAdventureModeSettings"

StartGameWindowAdventureModeSettings.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowAdventureModeSettings")

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
	self._enable_play = false
	self._animations = {}
	self._ui_animations = {}

	self:create_ui_elements(params, offset)
	self:_update_difficulty_option()
	self:_update_next_level_option()
end

StartGameWindowAdventureModeSettings.create_ui_elements = function (self, params, offset)
	local ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.ui_scenegraph = ui_scenegraph
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

	self.ui_animator = UIAnimator:new(ui_scenegraph, animation_definitions)

	if offset then
		local window_position = ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	widgets_by_name.play_button.content.button_hotspot.disable_button = true
	widgets_by_name.game_option_next_mission.content.button_hotspot.disable_button = false
	local game_option_difficulty = widgets_by_name.game_option_difficulty
	local anim = self:_animate_pulse(game_option_difficulty.style.glow_frame.color, 1, 255, 100, 2)

	UIWidget.animate(game_option_difficulty, anim)
end

StartGameWindowAdventureModeSettings.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowAdventureModeSettings")

	self.ui_animator = nil
end

StartGameWindowAdventureModeSettings.update = function (self, dt, t)
	self:_update_difficulty_option()
	self:_update_animations(dt)
	self:_handle_input(dt, t)
	self:draw(dt)
end

StartGameWindowAdventureModeSettings.post_update = function (self, dt, t)
	return
end

StartGameWindowAdventureModeSettings._update_animations = function (self, dt)
	self:_update_game_options_hover_effect()

	local ui_animations = self._ui_animations

	for name, animation in pairs(ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			ui_animations[name] = nil
		end
	end

	local ui_animator = self.ui_animator

	ui_animator:update(dt)

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

StartGameWindowAdventureModeSettings._is_button_released = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowAdventureModeSettings._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StartGameWindowAdventureModeSettings._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit
end

StartGameWindowAdventureModeSettings._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name

	if self:_is_button_hover_enter(widgets_by_name.game_option_difficulty) or self:_is_button_hover_enter(widgets_by_name.play_button) then
		self:_play_sound("play_gui_lobby_button_01_difficulty_confirm_hover")
	end

	local parent = self.parent

	if self:_is_button_released(widgets_by_name.game_option_difficulty) then
		parent:set_layout_by_name("difficulty_selection_adventure")
	end

	local input_service = self.parent:window_input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local play_pressed = gamepad_active and self._enable_play and input_service:get("refresh_press")

	if self:_is_button_released(widgets_by_name.play_button) or play_pressed then
		parent:set_private_option_enabled(true)
		parent:play(t, "adventure_mode")
	end
end

StartGameWindowAdventureModeSettings._play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartGameWindowAdventureModeSettings._update_difficulty_option = function (self)
	local parent = self.parent
	local difficulty_key = parent:get_difficulty_option()

	if difficulty_key == nil then
		parent:set_difficulty_option(DefaultAdventureModeStartingDifficulty)
	end

	if difficulty_key ~= self._difficulty_key then
		self:_set_difficulty_option(difficulty_key)

		self._difficulty_key = difficulty_key
		self._enable_play = DifficultySettings[difficulty_key] ~= nil and rawget(LevelSettings, self._selected_level_id) ~= nil
		self._widgets_by_name.play_button.content.button_hotspot.disable_button = not self._enable_play

		if self._enable_play then
			self.parent:set_input_description("play_available")
		else
			self.parent:set_input_description(nil)
		end
	end
end

StartGameWindowAdventureModeSettings._update_next_level_option = function (self)
	local next_level_id = LevelUnlockUtils.get_next_adventure_level(self.statistics_db, self._stats_id)

	self.parent:set_selected_level_id(next_level_id)
	self:_set_selected_level(next_level_id)
end

StartGameWindowAdventureModeSettings._set_selected_level = function (self, level_id)
	local widget = self._widgets_by_name.game_option_next_mission
	local text = "n/a"

	if level_id then
		local level_settings = LevelSettings[level_id]
		local display_name = level_settings.display_name
		local level_image = level_settings.level_image
		text = Localize(display_name)
		local icon_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(level_image)
		local texture_size = widget.style.icon.texture_size
		texture_size[1] = icon_texture_settings.size[1]
		texture_size[2] = icon_texture_settings.size[2]
		widget.content.icon = level_image
		local completed_difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(self.statistics_db, self._stats_id, level_id) or 0
		local level_frame = UIWidgetUtils.get_level_frame_by_difficulty_index(completed_difficulty_index)
		widget.content.icon_frame = level_frame
	end

	widget.content.option_text = text
end

StartGameWindowAdventureModeSettings._set_difficulty_option = function (self, difficulty_key)
	local difficulty_settings = DifficultySettings[difficulty_key]
	local display_name = difficulty_settings and difficulty_settings.display_name
	local display_image = difficulty_settings and difficulty_settings.display_image
	local completed_frame_texture = (difficulty_settings and difficulty_settings.completed_frame_texture) or "map_frame_00"
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.game_option_difficulty.content.option_text = (display_name and Localize(display_name)) or ""
	widgets_by_name.game_option_difficulty.content.icon = display_image or nil
	widgets_by_name.game_option_difficulty.content.icon_frame = completed_frame_texture
end

StartGameWindowAdventureModeSettings.draw = function (self, dt)
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

StartGameWindowAdventureModeSettings._play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartGameWindowAdventureModeSettings._update_game_options_hover_effect = function (self)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.game_option_difficulty

	if self:_is_button_hover_enter(widget) then
		self:_on_option_button_hover_enter(widget, 1)
	elseif self:_is_button_hover_exit(widget) then
		self:_on_option_button_hover_exit(widget, 1)
	end
end

StartGameWindowAdventureModeSettings._on_option_button_hover_enter = function (self, widget, index, instant)
	self:_create_style_animation_enter(widget, 255, "glow", index, instant)
	self:_create_style_animation_enter(widget, 255, "icon_glow", index, instant)
	self:_create_style_animation_exit(widget, 0, "button_hover_rect", index, instant)
end

StartGameWindowAdventureModeSettings._on_option_button_hover_exit = function (self, widget, index, instant)
	self:_create_style_animation_exit(widget, 0, "glow", index, instant)
	self:_create_style_animation_exit(widget, 0, "icon_glow", index, instant)
	self:_create_style_animation_enter(widget, 30, "button_hover_rect", index, instant)
end

StartGameWindowAdventureModeSettings._create_style_animation_enter = function (self, widget, target_value, style_id, widget_index, instant)
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

StartGameWindowAdventureModeSettings._create_style_animation_exit = function (self, widget, target_value, style_id, widget_index, instant)
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

StartGameWindowAdventureModeSettings._animate_pulse = function (self, target, target_index, from, to, speed)
	local new_animation = UIAnimation.init(UIAnimation.pulse_animation, target, target_index, from, to, speed)

	return new_animation
end

StartGameWindowAdventureModeSettings._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

return
