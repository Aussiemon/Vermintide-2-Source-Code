local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_settings_definitions")
local widget_definitions = definitions.widgets
local other_options_widget_definitions = definitions.other_options_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
StartGameWindowSettings = class(StartGameWindowSettings)
StartGameWindowSettings.NAME = "StartGameWindowSettings"

StartGameWindowSettings.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowSettings")

	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	self._network_lobby = ingame_ui_context.network_lobby
	self._mechanism_name = Managers.mechanism:current_mechanism_name()
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}
	self._ui_animations = {}

	self:create_ui_elements(params, offset)
	self:_update_mission_selection()
	self:_update_difficulty_option()
end

StartGameWindowSettings.create_ui_elements = function (self, params, offset)
	local ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.ui_scenegraph = ui_scenegraph
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	local other_options_widgets = {}
	local on_dedicated_server = self._network_lobby:is_dedicated_server()

	for name, widget_definition in pairs(other_options_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widget.content.visible = not on_dedicated_server
		other_options_widgets[#other_options_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._other_options_widgets = other_options_widgets
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
	widgets_by_name.game_option_2.content.button_hotspot.disable_button = true

	self:_set_additional_options_enabled_state(false)

	local game_option_1 = widgets_by_name.game_option_1
	local anim_1 = self:_animate_pulse(game_option_1.style.glow_frame.color, 1, 255, 100, 2)

	UIWidget.animate(game_option_1, anim_1)

	local game_option_2 = widgets_by_name.game_option_2
	local anim_2 = self:_animate_pulse(game_option_2.style.glow_frame.color, 1, 255, 100, 2)

	UIWidget.animate(game_option_2, anim_2)
end

StartGameWindowSettings._set_additional_options_enabled_state = function (self, enabled)
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.additional_option.content.button_hotspot.disable_button = not enabled
	local private_button = widgets_by_name.private_button
	private_button.content.button_hotspot.disable_button = not enabled
	local host_button = widgets_by_name.host_button
	host_button.content.button_hotspot.disable_button = not enabled
	local strict_matchmaking_button = widgets_by_name.strict_matchmaking_button
	strict_matchmaking_button.content.button_hotspot.disable_button = not enabled
	self._additional_option_enabled = enabled
end

StartGameWindowSettings.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowSettings")

	self.ui_animator = nil
end

StartGameWindowSettings.update = function (self, dt, t)
	self:_update_mission_selection()

	if self._additional_option_enabled then
		self:_update_additional_options()
	end

	self:_update_difficulty_option()
	self:_update_animations(dt)
	self:_handle_input(dt, t)
end

StartGameWindowSettings.post_update = function (self, dt, t)
	self:draw(dt)
end

StartGameWindowSettings._update_animations = function (self, dt)
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

StartGameWindowSettings._is_button_released = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowSettings._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StartGameWindowSettings._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit
end

StartGameWindowSettings._is_other_option_button_selected = function (self, widget, current_option)
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

StartGameWindowSettings._handle_input = function (self, dt, t)
	local parent = self.parent
	local widgets_by_name = self._widgets_by_name

	if self._additional_option_enabled then
		local host_button = widgets_by_name.host_button
		local private_button = widgets_by_name.private_button
		local strict_matchmaking_button = widgets_by_name.strict_matchmaking_button

		UIWidgetUtils.animate_default_checkbox_button(private_button, dt)
		UIWidgetUtils.animate_default_checkbox_button(host_button, dt)
		UIWidgetUtils.animate_default_checkbox_button(strict_matchmaking_button, dt)

		if self:_is_button_hover_enter(widgets_by_name.game_option_1) or self:_is_button_hover_enter(widgets_by_name.game_option_2) or self:_is_button_hover_enter(widgets_by_name.play_button) then
			self:_play_sound("play_gui_lobby_button_01_difficulty_confirm_hover")
		end

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

	local custom_game_settings = parent:get_custom_game_settings(self._mechanism_name) or parent:get_custom_game_settings("adventure")

	if self:_is_button_released(widgets_by_name.game_option_1) then
		parent:set_layout_by_name(custom_game_settings.layout_name)
	elseif self:_is_button_released(widgets_by_name.game_option_2) then
		parent:set_layout_by_name("difficulty_selection_custom")
	end

	if self:_is_button_released(widgets_by_name.play_button) then
		local game_mode_type = custom_game_settings.game_mode_type

		if self._mechanism_name == "versus" then
			game_mode_type = "versus"
		end

		parent:play(t, game_mode_type)
	end
end

StartGameWindowSettings._play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartGameWindowSettings._update_game_options_hover_effect = function (self)
	local widgets_by_name = self._widgets_by_name
	local widget_prefix = "game_option_"

	for i = 1, 2 do
		local widget_name = widget_prefix .. i
		local widget = widgets_by_name[widget_name]

		if self:_is_button_hover_enter(widget) then
			self:_on_option_button_hover_enter(i)
		elseif self:_is_button_hover_exit(widget) then
			self:_on_option_button_hover_exit(i)
		end
	end
end

StartGameWindowSettings._on_option_button_hover_enter = function (self, index, instant)
	local widgets_by_name = self._widgets_by_name
	local widget_name = "game_option_" .. index
	local widget = widgets_by_name[widget_name]

	self:_create_style_animation_enter(widget, 255, "glow", index, instant)
	self:_create_style_animation_enter(widget, 255, "icon_glow", index, instant)
	self:_create_style_animation_exit(widget, 0, "button_hover_rect", index, instant)
end

StartGameWindowSettings._on_option_button_hover_exit = function (self, index, instant)
	local widgets_by_name = self._widgets_by_name
	local widget_name = "game_option_" .. index
	local widget = widgets_by_name[widget_name]

	self:_create_style_animation_exit(widget, 0, "glow", index, instant)
	self:_create_style_animation_exit(widget, 0, "icon_glow", index, instant)
	self:_create_style_animation_enter(widget, 30, "button_hover_rect", index, instant)
end

StartGameWindowSettings._update_additional_options = function (self)
	local parent = self.parent
	local private_enabled = parent:is_private_option_enabled()
	local always_host_enabled = parent:is_always_host_option_enabled()
	local strict_matchmaking_enabled = parent:is_strict_matchmaking_option_enabled()
	local twitch_active = Managers.twitch and Managers.twitch:is_connected()
	local lobby = self._network_lobby
	local num_members = lobby:members():get_member_count()
	local is_alone = num_members == 1

	if is_alone ~= self._is_alone or private_enabled ~= self._private_enabled or always_host_enabled ~= self._always_host_enabled or strict_matchmaking_enabled ~= self._strict_matchmaking_enabled or twitch_active ~= self._twitch_active then
		local widgets_by_name = self._widgets_by_name
		local always_host_disabled = nil

		if self._mechanism_name == "versus" then
			always_host_disabled = true
			always_host_enabled = true
		end

		local private_is_selected = private_enabled
		local private_is_disabled = twitch_active
		local private_hotspot = widgets_by_name.private_button.content.button_hotspot
		private_hotspot.is_selected = private_is_selected
		private_hotspot.disable_button = private_is_disabled
		local always_host_is_selected = private_enabled or not is_alone or always_host_enabled
		local always_host_is_disabled = private_enabled or not is_alone or twitch_active or always_host_disabled
		local host_hotspot = widgets_by_name.host_button.content.button_hotspot
		host_hotspot.is_selected = always_host_is_selected
		host_hotspot.disable_button = always_host_is_disabled
		local strict_matchmaking_is_selected = not always_host_enabled and not private_enabled and is_alone and strict_matchmaking_enabled
		local strict_matchmaking_is_disabled = private_enabled or always_host_enabled or not is_alone or twitch_active
		local strict_matchmaking_hotspot = widgets_by_name.strict_matchmaking_button.content.button_hotspot
		strict_matchmaking_hotspot.is_selected = strict_matchmaking_is_selected
		strict_matchmaking_hotspot.disable_button = strict_matchmaking_is_disabled
		self._private_enabled = private_enabled
		self._always_host_enabled = always_host_enabled
		self._strict_matchmaking_enabled = strict_matchmaking_enabled
		self._twitch_active = twitch_active
		self._is_alone = is_alone
	end
end

StartGameWindowSettings._update_difficulty_option = function (self)
	local parent = self.parent
	local difficulty_key = parent:get_difficulty_option()

	if not difficulty_key or difficulty_key ~= self._difficulty_key then
		self:_set_difficulty_option(difficulty_key)

		self._difficulty_key = difficulty_key
		self._enable_play = DifficultySettings[difficulty_key] ~= nil and rawget(LevelSettings, self._selected_level_id) ~= nil

		if not Managers.account:offline_mode() then
			self:_set_additional_options_enabled_state(true)
		end

		local widgets_by_name = self._widgets_by_name
		widgets_by_name.play_button.content.button_hotspot.disable_button = not self._enable_play

		if self._enable_play then
			self.parent:set_input_description("play_available")
		else
			self.parent:set_input_description(nil)
		end
	end
end

StartGameWindowSettings._set_difficulty_option = function (self, difficulty_key)
	local difficulty_settings = DifficultySettings[difficulty_key]
	local display_name = difficulty_settings and difficulty_settings.display_name
	local display_image = difficulty_settings and difficulty_settings.display_image
	local completed_frame_texture = difficulty_settings and difficulty_settings.completed_frame_texture or "map_frame_00"
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.game_option_2.content.option_text = display_name and Localize(display_name) or ""
	widgets_by_name.game_option_2.content.icon = display_image or nil
	widgets_by_name.game_option_2.content.icon_frame = completed_frame_texture
end

StartGameWindowSettings._update_mission_selection = function (self)
	local parent = self.parent
	local selected_level_id = parent:get_selected_level_id()

	if not selected_level_id or selected_level_id ~= self._selected_level_id then
		self:_set_selected_level(selected_level_id)

		self._selected_level_id = selected_level_id
	end

	self._widgets_by_name.game_option_2.content.button_hotspot.disable_button = selected_level_id == nil
end

StartGameWindowSettings._set_selected_level = function (self, level_id)
	local widget = self._widgets_by_name.game_option_1
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
		local completed_difficulty_index = self.parent:get_completed_level_difficulty_index(self.statistics_db, self._stats_id, level_id)
		local level_frame = UIWidgetUtils.get_level_frame_by_difficulty_index(completed_difficulty_index)
		widget.content.icon_frame = level_frame
	end

	widget.content.option_text = text
end

StartGameWindowSettings.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	local widgets = self._widgets

	for i = 1, #widgets do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	local other_options_widgets = self._other_options_widgets

	for i = 1, #other_options_widgets do
		local widget = other_options_widgets[i]

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

StartGameWindowSettings._create_style_animation_enter = function (self, widget, target_value, style_id, widget_index, instant)
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
		local animation_name = "game_option_" .. style_id
		local ui_animations = self._ui_animations
		ui_animations[animation_name .. "_hover_" .. widget_index] = self:_animate_element_by_time(pass_style.color, 1, current_color_value, target_color_value, animation_duration)
	else
		pass_style.color[1] = target_color_value
	end
end

StartGameWindowSettings._create_style_animation_exit = function (self, widget, target_value, style_id, widget_index, instant)
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
		local animation_name = "game_option_" .. style_id
		local ui_animations = self._ui_animations
		ui_animations[animation_name .. "_hover_" .. widget_index] = self:_animate_element_by_time(pass_style.color, 1, current_color_value, target_color_value, animation_duration)
	else
		pass_style.color[1] = target_color_value
	end
end

StartGameWindowSettings._animate_pulse = function (self, target, target_index, from, to, speed)
	local new_animation = UIAnimation.init(UIAnimation.pulse_animation, target, target_index, from, to, speed)

	return new_animation
end

StartGameWindowSettings._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end
