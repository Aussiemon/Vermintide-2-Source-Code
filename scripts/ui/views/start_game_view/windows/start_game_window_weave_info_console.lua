local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_weave_info_console_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local environment_icons = {
	environment_template_01 = "trials_icon_day",
	environment_template_03 = "trials_icon_evening",
	environment_template_02 = "trials_icon_night"
}
local DO_RELOAD = false
StartGameWindowWeaveInfoConsole = class(StartGameWindowWeaveInfoConsole)
StartGameWindowWeaveInfoConsole.NAME = "StartGameWindowWeaveInfoConsole"

StartGameWindowWeaveInfoConsole.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowWeaveInfoConsole")

	self._params = params
	self._parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	self._network_lobby = ingame_ui_context.network_lobby
	self._is_server = ingame_ui_context.is_server
	self._level_transition_handler = ingame_ui_context.level_transition_handler
	self._is_in_inn = ingame_ui_context.is_in_inn
	local player_manager = Managers.player
	local local_player = player_manager:local_player()

	if local_player then
		self._stats_id = local_player:stats_id()
	end

	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}
	self._ui_animations = {}

	self:create_ui_elements(params, offset)
	Managers.state.event:trigger("weave_list_entered")
end

StartGameWindowWeaveInfoConsole.create_ui_elements = function (self, params, offset)
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

	UIRenderer.clear_scenegraph_queue(self.ui_top_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	widgets_by_name.select_button.content.button_hotspot.disable_button = true
end

StartGameWindowWeaveInfoConsole.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowWeaveInfoConsole")

	self.ui_animator = nil
end

StartGameWindowWeaveInfoConsole.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	local selected_layout_name = self._parent:get_selected_layout_name()

	if selected_layout_name ~= self._selected_layout_name then
		self._allow_input = selected_layout_name == "weave_selection"
		self._selected_layout_name = selected_layout_name
		self._widgets_by_name.select_button.content.visible = self._allow_input
	end

	self:_update_selected_weave()

	if self._selected_weave_name then
		self:_update_animations(dt)

		if self._allow_input then
			self:_handle_input(dt, t)
		end

		self:draw(dt)
	end
end

StartGameWindowWeaveInfoConsole.post_update = function (self, dt, t)
	return
end

StartGameWindowWeaveInfoConsole._update_animations = function (self, dt)
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

	self:_animate_wind_effects(dt)
end

StartGameWindowWeaveInfoConsole._animate_wind_effects = function (self, dt)
	local speed = 0.08
	local wind_effect_progress = self._wind_effect_progress or 0
	wind_effect_progress = (wind_effect_progress + dt * speed) % 1
	self._wind_effect_progress = wind_effect_progress
	local angle = math.degrees_to_radians(360 * wind_effect_progress)
	local widgets_by_name = self._widgets_by_name
end

StartGameWindowWeaveInfoConsole._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowWeaveInfoConsole._is_button_released = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowWeaveInfoConsole._is_stepper_button_pressed = function (self, widget)
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

StartGameWindowWeaveInfoConsole._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StartGameWindowWeaveInfoConsole._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit
end

StartGameWindowWeaveInfoConsole._is_button_selected = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.is_selected
end

StartGameWindowWeaveInfoConsole._handle_input = function (self, dt, t)
	local parent = self._parent
	local widgets_by_name = self._widgets_by_name
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local input_service = self._parent:window_input_service()

	if self:_is_button_hover_enter(widgets_by_name.select_button) then
		self:_play_sound("play_gui_lobby_button_01_difficulty_confirm_hover")
	end

	if self._selected_weave_name and (self:_is_button_released(widgets_by_name.select_button) or input_service:get("confirm_press")) then
		parent:set_selected_weave_id(self._selected_weave_name)
		parent:set_selected_weave_objective_index(1)

		local game_mode_layout_name = parent:get_selected_game_mode_layout_name()

		parent:set_layout_by_name(game_mode_layout_name)
	end
end

StartGameWindowWeaveInfoConsole._play_sound = function (self, event)
	self._parent:play_sound(event)
end

StartGameWindowWeaveInfoConsole._update_selected_weave = function (self)
	local params = self._params
	local weave_template = params.selected_weave_template
	local widgets_by_name = self._widgets_by_name

	if not weave_template then
		local parent = self._parent
		local selected_weave_id = parent:get_selected_weave_id()
		local weave_templates = WeaveSettings.templates
		weave_template = weave_templates[selected_weave_id]
	end

	if weave_template then
		local name = weave_template.name

		if name and name ~= self._selected_weave_name then
			self._selected_weave_name = name
			local display_name = Localize(weave_template.display_name)
			local title_widget = widgets_by_name.title
			title_widget.content.text = display_name
			local level_id = weave_template.objectives[1].level_id
			local level_settings = LevelSettings[level_id]
			local level_display_name = level_settings.display_name
			local level_image = level_settings.level_image
			widgets_by_name.level_title.content.text = level_display_name
			widgets_by_name.level_image.content.texture_id = level_image
			local wind = weave_template.wind
			local wind_settings = WindSettings[wind]
			local wind_title_widget = widgets_by_name.wind_title
			local wind_icon_widget = widgets_by_name.wind_icon
			local thumbnail_icon = wind_settings.thumbnail_icon
			local thumbnail_icon_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(wind_settings.thumbnail_icon)
			local thumbnail_icon_size = thumbnail_icon_settings.size
			wind_title_widget.content.text = wind_settings.display_name
			wind_icon_widget.content.texture_id = thumbnail_icon
			wind_icon_widget.style.texture_id.offset = {
				32 - thumbnail_icon_size[1] / 2,
				32 - thumbnail_icon_size[2] / 2,
				10
			}
			wind_icon_widget.style.texture_id.size = thumbnail_icon_size

			self:_set_colors_by_wind(wind)

			local mutator_name = wind_settings.mutator
			local mutator_data = MutatorTemplates[mutator_name]
			local mutator_icon_widget = widgets_by_name.mutator_icon
			local mutator_title_widget = widgets_by_name.mutator_title_text
			local mutator_description_widget = widgets_by_name.mutator_description_text
			mutator_icon_widget.content.texture_id = mutator_data.icon
			mutator_title_widget.content.text = Localize(mutator_data.display_name)
			mutator_description_widget.content.text = Localize(mutator_data.description)
			local objective_1 = weave_template.objectives[1]
			local objective_2 = weave_template.objectives[2]
			local objectives = weave_template.objectives
			local objective_spacing = 10
			local largest_objective_width = 0

			for i = 1, #objectives, 1 do
				local objective = objectives[i]
				local objective_display_name = objective.display_name
				local objective_icon = objective.icon
				local objective_length = self:_assign_objective(i, objective_display_name, objective_icon, objective_spacing)

				if largest_objective_width < objective_length then
					largest_objective_width = objective_length
				end
			end

			for i = 1, #objectives, 1 do
				self:_align_objective(i, -largest_objective_width / 2, objective_spacing)
			end
		end

		widgets_by_name.select_button.content.button_hotspot.disable_button = false
	end
end

StartGameWindowWeaveInfoConsole._set_colors_by_wind = function (self, wind_name)
	local color = Colors.get_color_table_with_alpha(wind_name, 255)
	local widgets_by_name = self._widgets_by_name

	self:_apply_color_values(widgets_by_name.wind_icon_glow.style.texture_id.color, color, 0.75)
	self:_apply_color_values(widgets_by_name.level_image_frame.style.texture_id.color, color, 1)
	self:_apply_color_values(widgets_by_name.wind_icon.style.texture_id.color, color, 1)
end

StartGameWindowWeaveInfoConsole._apply_color_values = function (self, target, source, color_multiplier, include_alpha)
	color_multiplier = color_multiplier or 1

	if include_alpha then
		target[1] = source[1]
	end

	target[2] = math.floor(source[2] * color_multiplier)
	target[3] = math.floor(source[3] * color_multiplier)
	target[4] = math.floor(source[4] * color_multiplier)
end

StartGameWindowWeaveInfoConsole._align_objective = function (self, index, start_offset, spacing)
	local widgets_by_name = self._widgets_by_name
	local widget_name = "objective_" .. index
	local widget = widgets_by_name[widget_name]
	local content = widget.content
	local style = widget.style
	local icon_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(content.icon)
	local icon_size = icon_texture_settings.size
	local icon_width = icon_size[1]
	local text_style = style.text
	local ui_renderer = self.ui_top_renderer
	local text_width = UIUtils.get_text_width(ui_renderer, text_style, content.text)
	spacing = spacing or 0
	local total_width = icon_width + text_width + spacing
	style.icon.offset[1] = start_offset + icon_width / 2
	style.text.offset[1] = style.icon.offset[1] + icon_width / 2 + text_width / 2 + spacing
	style.text_shadow.offset[1] = style.text.offset[1] + 2

	return total_width
end

StartGameWindowWeaveInfoConsole._assign_objective = function (self, index, text, icon, spacing)
	local widgets_by_name = self._widgets_by_name
	local widget_name = "objective_" .. index
	local widget = widgets_by_name[widget_name]
	local content = widget.content
	local style = widget.style
	content.icon = icon or "objective_icon_general"
	content.text = text or "-"
	local icon_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(content.icon)
	local icon_size = icon_texture_settings.size
	local icon_width = icon_size[1]
	local text_style = style.text
	local ui_renderer = self.ui_top_renderer
	local text_width = UIUtils.get_text_width(ui_renderer, text_style, content.text)
	spacing = spacing or 0
	local total_width = icon_width + text_width + spacing

	return total_width
end

StartGameWindowWeaveInfoConsole._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

StartGameWindowWeaveInfoConsole.draw = function (self, dt)
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self._parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

StartGameWindowWeaveInfoConsole._play_sound = function (self, event)
	self._parent:play_sound(event)
end

StartGameWindowWeaveInfoConsole._animate_pulse = function (self, target, target_index, from, to, speed)
	local new_animation = UIAnimation.init(UIAnimation.pulse_animation, target, target_index, from, to, speed)

	return new_animation
end

StartGameWindowWeaveInfoConsole._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

StartGameWindowWeaveInfoConsole._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end

StartGameWindowWeaveInfoConsole._format_time = function (self, time)
	local floor = math.floor
	local timer_text = string.format("%.2d:%.2d:%.2d", floor(time / 3600), floor(time / 60) % 60, floor(time) % 60)

	return timer_text
end

StartGameWindowWeaveInfoConsole._get_save_data_by_weave_name = function (self, weave_name)
	local saved_value = nil

	return saved_value
end

return
