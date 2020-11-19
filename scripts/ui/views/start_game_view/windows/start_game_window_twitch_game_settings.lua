local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_twitch_game_settings_definitions")
local widget_definitions = definitions.widgets
local other_options_widget_definitions = definitions.other_options_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
StartGameWindowTwitchGameSettings = class(StartGameWindowTwitchGameSettings)
StartGameWindowTwitchGameSettings.NAME = "StartGameWindowTwitchGameSettings"

StartGameWindowTwitchGameSettings.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowTwitchGameSettings")

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
	self._enable_play = false
	self._ui_animations = {}

	self:create_ui_elements(params, offset)

	self._twitch_active = nil

	self:_update_difficulty_option()
end

StartGameWindowTwitchGameSettings.create_ui_elements = function (self, params, offset)
	local ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.ui_scenegraph = ui_scenegraph
	local on_dedicated_server = self._network_lobby:is_dedicated_server()
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	local other_options_widgets = {}

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
	self:_update_additional_options(true)

	local game_option_1 = widgets_by_name.game_option_1
	local anim_1 = self:_animate_pulse(game_option_1.style.glow_frame.color, 1, 255, 100, 2)

	UIWidget.animate(game_option_1, anim_1)

	local game_option_2 = widgets_by_name.game_option_2
	local anim_2 = self:_animate_pulse(game_option_2.style.glow_frame.color, 1, 255, 100, 2)

	UIWidget.animate(game_option_2, anim_2)
end

StartGameWindowTwitchGameSettings._set_additional_options_enabled_state = function (self, enabled)
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

StartGameWindowTwitchGameSettings.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowTwitchGameSettings")

	self.ui_animator = nil
end

StartGameWindowTwitchGameSettings.update = function (self, dt, t)
	self:_update_mission_selection()

	if self._additional_option_enabled then
		self:_update_additional_options()
	end

	self:_update_difficulty_option()
	self:_update_animations(dt)
	self:_handle_input(dt, t)
	self:draw(dt)
end

StartGameWindowTwitchGameSettings.post_update = function (self, dt, t)
	return
end

StartGameWindowTwitchGameSettings._update_animations = function (self, dt)
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
end

StartGameWindowTwitchGameSettings._is_button_released = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowTwitchGameSettings._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StartGameWindowTwitchGameSettings._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit
end

StartGameWindowTwitchGameSettings._is_other_option_button_selected = function (self, widget, current_option)
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

StartGameWindowTwitchGameSettings._handle_input = function (self, dt, t)
	local parent = self.parent
	local widgets_by_name = self._widgets_by_name

	if self._additional_option_enabled then
		local private_button = widgets_by_name.private_button

		UIWidgetUtils.animate_default_checkbox_button(private_button, dt)

		local changed_selection = self:_is_other_option_button_selected(private_button, self._private_enabled)

		if changed_selection ~= nil then
			parent:set_private_option_enabled(changed_selection)
		end

		local host_button = widgets_by_name.host_button
		local strict_matchmaking_button = widgets_by_name.strict_matchmaking_button

		UIWidgetUtils.animate_default_checkbox_button(host_button, dt)
		UIWidgetUtils.animate_default_checkbox_button(strict_matchmaking_button, dt)

		if self:_is_button_hover_enter(widgets_by_name.game_option_1) or self:_is_button_hover_enter(widgets_by_name.game_option_2) or self:_is_button_hover_enter(widgets_by_name.play_button) then
			self:_play_sound("play_gui_lobby_button_01_difficulty_confirm_hover")
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

	local twitch_settings = parent:get_twitch_settings(self._mechanism_name) or parent:get_twitch_settings("adventure")

	if self:_is_button_released(widgets_by_name.game_option_1) then
		parent:set_layout_by_name(twitch_settings.layout_name)
	elseif self:_is_button_released(widgets_by_name.game_option_2) then
		parent:set_layout_by_name("difficulty_selection_twitch")
	end

	if self:_is_button_released(widgets_by_name.play_button) then
		parent:play(t, twitch_settings.game_mode_type)
	end
end

StartGameWindowTwitchGameSettings._play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartGameWindowTwitchGameSettings._update_game_options_hover_effect = function (self)
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

StartGameWindowTwitchGameSettings._on_option_button_hover_enter = function (self, index, instant)
	local widgets_by_name = self._widgets_by_name
	local widget_name = "game_option_" .. index
	local widget = widgets_by_name[widget_name]

	self:_create_style_animation_enter(widget, 255, "glow", index, instant)
	self:_create_style_animation_enter(widget, 255, "icon_glow", index, instant)
	self:_create_style_animation_exit(widget, 0, "button_hover_rect", index, instant)
end

StartGameWindowTwitchGameSettings._on_option_button_hover_exit = function (self, index, instant)
	local widgets_by_name = self._widgets_by_name
	local widget_name = "game_option_" .. index
	local widget = widgets_by_name[widget_name]

	self:_create_style_animation_exit(widget, 0, "glow", index, instant)
	self:_create_style_animation_exit(widget, 0, "icon_glow", index, instant)
	self:_create_style_animation_enter(widget, 30, "button_hover_rect", index, instant)
end

StartGameWindowTwitchGameSettings._update_additional_options = function (self, force_update)
	local private_enabled = true
	local always_host_enabled = true
	local strict_matchmaking_enabled = false
	local twitch_active = Managers.twitch and Managers.twitch:is_connected()
	local lobby = self._network_lobby
	local num_members = #lobby:members():get_members()
	local is_alone = num_members == 1

	if force_update or is_alone ~= self._is_alone or private_enabled ~= self._private_enabled or always_host_enabled ~= self._always_host_enabled or strict_matchmaking_enabled ~= self._strict_matchmaking_enabled or twitch_active ~= self._twitch_active then
		local widgets_by_name = self._widgets_by_name
		local private_is_selected = true
		local always_host_is_selected = true
		local strict_matchmaking_is_selected = false
		local private_button = widgets_by_name.private_button
		private_button.content.button_hotspot.disable_button = true
		private_button.content.button_hotspot.is_selected = private_is_selected
		private_button.style.hover_glow.color[1] = 0
		local host_button = widgets_by_name.host_button
		host_button.content.button_hotspot.disable_button = true
		host_button.content.button_hotspot.is_selected = always_host_is_selected
		host_button.style.hover_glow.color[1] = 0
		local strict_matchmaking_button = widgets_by_name.strict_matchmaking_button
		strict_matchmaking_button.content.button_hotspot.disable_button = true
		strict_matchmaking_button.content.button_hotspot.is_selected = strict_matchmaking_is_selected
		strict_matchmaking_button.style.hover_glow.color[1] = 0
		self._private_enabled = private_enabled
		self._always_host_enabled = always_host_enabled
		self._strict_matchmaking_enabled = strict_matchmaking_enabled
		self._twitch_active = twitch_active
		self._is_alone = is_alone
	end
end

StartGameWindowTwitchGameSettings._update_difficulty_option = function (self)
	local parent = self.parent
	local difficulty_key = parent:get_difficulty_option()
	local twitch_active = Managers.twitch and Managers.twitch:is_connected()

	if difficulty_key ~= self._difficulty_key or twitch_active ~= self._twitch_active then
		self:_set_difficulty_option(difficulty_key)

		self._difficulty_key = difficulty_key
		local enable_play = DifficultySettings[difficulty_key] ~= nil
		local widgets_by_name = self._widgets_by_name
		self._enable_play = enable_play and twitch_active
		widgets_by_name.play_button.content.button_hotspot.disable_button = not self._enable_play

		if self._enable_play then
			self.parent:set_input_description("play_available")
		else
			self.parent:set_input_description(nil)
		end
	end
end

StartGameWindowTwitchGameSettings._set_difficulty_option = function (self, difficulty_key)
	local difficulty_settings = DifficultySettings[difficulty_key]
	local display_name = difficulty_settings and difficulty_settings.display_name
	local display_image = difficulty_settings and difficulty_settings.display_image
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.game_option_2.content.option_text = (display_name and Localize(display_name)) or ""
	widgets_by_name.game_option_2.content.icon = display_image or nil
end

StartGameWindowTwitchGameSettings._update_mission_selection = function (self)
	local parent = self.parent
	local selected_level_id = parent:get_selected_level_id()
	local selected_journey = parent:get_selected_deus_journey()
	local selected_mission = selected_level_id or selected_journey

	if not selected_mission or selected_mission ~= self._selected_mission then
		if selected_journey then
			self:_set_selected_journey(selected_journey)
		else
			self:_set_selected_level(selected_level_id)
		end

		self._selected_mission = selected_mission
	end

	self._widgets_by_name.game_option_2.content.button_hotspot.disable_button = selected_mission == nil
end

StartGameWindowTwitchGameSettings._set_selected_level = function (self, level_id)
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
		local completed_difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(self.statistics_db, self._stats_id, level_id) or 0
		local level_frame = self:_get_selection_frame_by_difficulty_index(completed_difficulty_index)
		widget.content.icon_frame = level_frame
	end

	widget.content.option_text = text
end

StartGameWindowTwitchGameSettings._set_selected_journey = function (self, journey_name)
	local widget = self._widgets_by_name.game_option_1
	local text = "n/a"

	if journey_name then
		local level_settings = DeusJourneySettings[journey_name]
		local display_name = level_settings.display_name
		local level_image = level_settings.level_image
		text = Localize(display_name)
		local icon_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(level_image)
		local texture_size = widget.style.icon.texture_size
		texture_size[1] = icon_texture_settings.size[1]
		texture_size[2] = icon_texture_settings.size[2]
		widget.content.icon = level_image
		local completed_difficulty_index = LevelUnlockUtils.completed_journey_difficulty_index(self.statistics_db, self._stats_id, journey_name)
		local level_frame = self:_get_selection_frame_by_difficulty_index(completed_difficulty_index)
		widget.content.icon_frame = level_frame
	end

	widget.content.option_text = text
end

StartGameWindowTwitchGameSettings._get_selection_frame_by_difficulty_index = function (self, difficulty_index)
	local completed_frame_texture = "map_frame_00"

	if difficulty_index and difficulty_index > 0 then
		local difficulty_key = DefaultDifficulties[difficulty_index]
		local settings = DifficultySettings[difficulty_key]
		completed_frame_texture = settings.completed_frame_texture
	end

	return completed_frame_texture
end

StartGameWindowTwitchGameSettings.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	local widgets = self._widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	local other_options_widgets = self._other_options_widgets

	for i = 1, #other_options_widgets, 1 do
		local widget = other_options_widgets[i]

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

StartGameWindowTwitchGameSettings._play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartGameWindowTwitchGameSettings._create_style_animation_enter = function (self, widget, target_value, style_id, widget_index, instant)
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

StartGameWindowTwitchGameSettings._create_style_animation_exit = function (self, widget, target_value, style_id, widget_index, instant)
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

StartGameWindowTwitchGameSettings._animate_pulse = function (self, target, target_index, from, to, speed)
	local new_animation = UIAnimation.init(UIAnimation.pulse_animation, target, target_index, from, to, speed)

	return new_animation
end

StartGameWindowTwitchGameSettings._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

return
