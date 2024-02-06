-- chunkname: @scripts/ui/views/start_game_view/windows/start_game_window_weave_info.lua

local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_weave_info_definitions")
local create_objective_widget = definitions.create_objective_widget
local top_widget_definitions = definitions.top_widgets
local bottom_widget_definitions = definitions.bottom_widgets
local bottom_hdr_widget_definitions = definitions.bottom_hdr_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false
local WIND_ICON_ANIMATION_DURATION = 1.5

StartGameWindowWeaveInfo = class(StartGameWindowWeaveInfo)
StartGameWindowWeaveInfo.NAME = "StartGameWindowWeaveInfo"

StartGameWindowWeaveInfo.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowWeaveInfo")

	self._params = params
	self._parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self._ingame_ui = ingame_ui_context.ingame_ui
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._statistics_db = ingame_ui_context.statistics_db
	self._render_settings = {
		snap_pixel_positions = true,
	}
	self._network_lobby = ingame_ui_context.network_lobby
	self._is_server = ingame_ui_context.is_server
	self._is_in_inn = ingame_ui_context.is_in_inn
	self._ui_hdr_renderer = self._parent:hdr_renderer()
	self._my_player = ingame_ui_context.player

	local player_manager = Managers.player
	local local_player = player_manager:local_player()

	if local_player then
		self._stats_id = local_player:stats_id()
	end

	self._enable_play = false
	self._animations = {}
	self._ui_animations = {}

	self:_create_ui_elements(params, offset)
	self:_start_transition_animation("on_enter")
end

StartGameWindowWeaveInfo._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings,
	}
	local widgets = self._widgets_by_name
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

StartGameWindowWeaveInfo._create_ui_elements = function (self, params, offset)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local widgets_by_name = {}
	local top_widgets = {}

	for name, widget_definition in pairs(top_widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		top_widgets[#top_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	local bottom_widgets = {}

	for name, widget_definition in pairs(bottom_widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		bottom_widgets[#bottom_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	local bottom_hdr_widgets = {}

	for name, widget_definition in pairs(bottom_hdr_widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		bottom_hdr_widgets[#bottom_hdr_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._top_widgets = top_widgets
	self._bottom_widgets = bottom_widgets
	self._bottom_hdr_widgets = bottom_hdr_widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	local private_game = self._parent:is_private_option_enabled()

	widgets_by_name.private_checkbox.content.button_hotspot.is_selected = private_game
	widgets_by_name.play_button.content.button_hotspot.disable_button = true

	self:_align_private_checkbox()
	self:_setup_input_buttons()
end

StartGameWindowWeaveInfo._setup_input_buttons = function (self)
	local input_service = self._parent:window_input_service()
	local start_game_input_data = UISettings.get_gamepad_input_texture_data(input_service, "refresh_press", true)
	local widgets_by_name = self._widgets_by_name
	local play_button_console = widgets_by_name.play_button_console
	local input_texture_style = play_button_console.style.input_texture

	input_texture_style.horizontal_alignment = "center"
	input_texture_style.vertical_alignment = "center"
	input_texture_style.texture_size = {
		start_game_input_data.size[1],
		start_game_input_data.size[2],
	}
	play_button_console.content.input_texture = start_game_input_data.texture
end

StartGameWindowWeaveInfo.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowWeaveInfo")

	self._ui_animator = nil
end

StartGameWindowWeaveInfo.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:_create_ui_elements()
	end

	self:_update_can_play()
	self:_handle_gamepad_activity()
	self:_update_selected_weave()
	self:_update_animations(dt)
	self:_update_party_status(dt)
	self:_handle_input(dt, t)
	self:draw(dt)
end

StartGameWindowWeaveInfo._handle_gamepad_activity = function (self)
	local force_update = self.gamepad_active_last_frame == nil
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active then
		if not self.gamepad_active_last_frame or force_update then
			self.gamepad_active_last_frame = true

			local widgets_by_name = self._widgets_by_name

			widgets_by_name.play_button.content.visible = false
			widgets_by_name.play_button_console.content.visible = true
		end
	elseif self.gamepad_active_last_frame or force_update then
		self.gamepad_active_last_frame = false

		local widgets_by_name = self._widgets_by_name

		widgets_by_name.play_button.content.visible = true
		widgets_by_name.play_button_console.content.visible = false
	end
end

StartGameWindowWeaveInfo._update_can_play = function (self)
	local widgets_by_name = self._widgets_by_name
	local is_matchmaking = Managers.matchmaking:is_game_matchmaking()
	local was_matchmaking = self._is_matchmaking

	self._is_matchmaking = is_matchmaking

	if is_matchmaking ~= was_matchmaking then
		if is_matchmaking then
			widgets_by_name.play_button.content.button_hotspot.disable_button = true

			self._parent:set_input_description("cancel_matchmaking_lock")
		else
			self._parent:set_input_description("play_available_lock")
		end
	end

	local play_button_console = self._widgets_by_name.play_button_console

	if is_matchmaking then
		play_button_console.content.text = Localize("cancel_matchmaking")

		if self._is_server then
			play_button_console.content.locked = false
		else
			play_button_console.content.locked = true
		end
	else
		play_button_console.content.locked = false
		play_button_console.content.text = Localize("start_game_window_play")
	end
end

StartGameWindowWeaveInfo.post_update = function (self, dt, t)
	return
end

StartGameWindowWeaveInfo._update_animations = function (self, dt)
	local ui_animations = self._ui_animations
	local animations = self._animations
	local ui_animator = self._ui_animator

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

	self:_update_wind_icon_animation(dt)

	local widgets_by_name = self._widgets_by_name

	UIWidgetUtils.animate_default_button(widgets_by_name.play_button, dt)
	UIWidgetUtils.animate_default_button(widgets_by_name.private_checkbox, dt)
end

StartGameWindowWeaveInfo._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowWeaveInfo._is_button_released = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowWeaveInfo._is_stepper_button_pressed = function (self, widget)
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

StartGameWindowWeaveInfo._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StartGameWindowWeaveInfo._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit
end

StartGameWindowWeaveInfo._is_button_selected = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.is_selected
end

StartGameWindowWeaveInfo._handle_input = function (self, dt, t)
	local parent = self._parent
	local widgets_by_name = self._widgets_by_name
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local input_service = self._parent:window_input_service()
	local play_button = widgets_by_name.play_button
	local private_checkbox = widgets_by_name.private_checkbox

	if self:_is_button_hover_enter(play_button) then
		self:_play_sound("Play_hud_hover")
	end

	local lock_party_size_pressed = gamepad_active and input_service:get("right_stick_press")

	if self:_is_button_released(private_checkbox) or lock_party_size_pressed then
		local content = private_checkbox.content

		content.button_hotspot.is_selected = not content.button_hotspot.is_selected

		parent:set_private_option_enabled(content.button_hotspot.is_selected)
		self:_play_sound("play_gui_lobby_button_play")
	end

	local play_pressed = gamepad_active and self._enable_play and input_service:get("refresh_press")

	if self:_is_button_released(play_button) or play_pressed then
		parent:play(t, "weave")
		self:_play_sound("menu_wind_level_choose_wind")
	end
end

local party_find_button_texts = {
	Localize("menu_weave_play_find_party"),
	(Localize("menu_weave_play_find_party_cancel")),
}

StartGameWindowWeaveInfo._update_party_status = function (self, dt)
	local matchmaking_manager = Managers.matchmaking
	local is_game_matchmaking = matchmaking_manager:is_game_matchmaking()
	local active_game_mode = matchmaking_manager:active_game_mode()
	local is_searching_for_weave = active_game_mode and active_game_mode == "weave"
	local is_searching = is_game_matchmaking and is_searching_for_weave

	self._is_matchmaking_for_weave = is_searching

	local widgets_by_name = self._widgets_by_name
	local play_button_widget = widgets_by_name.play_button
	local play_button_widget_content = play_button_widget.content
	local play_button_hotspot = play_button_widget_content.button_hotspot

	play_button_hotspot.disable_button = is_searching
end

StartGameWindowWeaveInfo._play_sound = function (self, event)
	self._parent:play_sound(event)
end

StartGameWindowWeaveInfo._update_selected_weave = function (self)
	local params = self._params
	local weave_template = params.selected_weave_template

	if not weave_template then
		local parent = self._parent
		local selected_weave_id = parent:get_selected_weave_id()
		local weave_templates = WeaveSettings.templates_ordered

		weave_template = weave_templates[selected_weave_id]
	end

	local widgets_by_name = self._widgets_by_name

	if weave_template then
		local name = weave_template.name

		if name and name ~= self._selected_weave_name then
			self._selected_weave_name = name

			local objectives = weave_template.objectives
			local display_name = weave_template.display_name
			local title_widget = widgets_by_name.title

			title_widget.content.text = display_name

			local level_id = objectives[1].level_id
			local level_settings = LevelSettings[level_id]
			local level_display_name = level_settings.display_name

			widgets_by_name.level_title.content.text = level_display_name

			local wind = weave_template.wind
			local wind_settings = WindSettings[wind]
			local wind_title_widget = widgets_by_name.wind_title
			local wind_icon_widget = widgets_by_name.wind_icon

			wind_title_widget.content.text = wind_settings.lore_display_name

			self:_set_wind_icon_by_name(wind)
			self:_set_colors_by_wind(wind)

			local mutator_name = wind_settings.mutator
			local mutator_data = MutatorTemplates[mutator_name]
			local mutator_icon_widget = widgets_by_name.mutator_icon
			local mutator_title_widget = widgets_by_name.mutator_title_text
			local mutator_description_widget = widgets_by_name.mutator_description_text

			mutator_icon_widget.content.texture_id = mutator_data.icon
			mutator_title_widget.content.text = mutator_data.display_name
			mutator_description_widget.content.text = mutator_data.description

			local objective_spacing = 10
			local total_objectives_height = 0
			local scenegraph_id = "objective"
			local objective_size = scenegraph_definition[scenegraph_id].size
			local widget_definition = create_objective_widget(scenegraph_id, objective_size)
			local objective_widgets = {}

			for i = 1, #objectives do
				local widget = UIWidget.init(widget_definition)

				objective_widgets[#objective_widgets + 1] = widget

				local objective = objectives[i]
				local conflict_settings = objective.conflict_settings
				local is_end_objective = conflict_settings == "weave_disabled"
				local title_text = is_end_objective and "menu_weave_play_next_end_event_title" or "menu_weave_play_main_objective_title"
				local objective_display_name = objective.display_name
				local objective_icon = is_end_objective and "objective_icon_boss" or "objective_icon_general"
				local objective_height = self:_assign_objective(widget, title_text, objective_display_name, objective_icon, objective_spacing)
				local offset = widget.offset

				offset[2] = -total_objectives_height
				total_objectives_height = total_objectives_height + objective_height + objective_spacing
			end

			self._objective_widgets = objective_widgets
		end

		widgets_by_name.play_button.content.button_hotspot.disable_button = false
	end
end

StartGameWindowWeaveInfo._update_wind_icon_animation = function (self, dt)
	local wind_icon_animation_time = self._wind_icon_animation_time

	if not wind_icon_animation_time then
		return
	end

	wind_icon_animation_time = math.max(wind_icon_animation_time - dt, 0)

	local progress = math.clamp(1 - wind_icon_animation_time / WIND_ICON_ANIMATION_DURATION, 0, 1)
	local pulse_progress = math.lerp(0, 1, progress)
	local widgets_by_name = self._widgets_by_name
	local widget_icon = widgets_by_name.wind_icon
	local ui_hdr_renderer = self._ui_hdr_renderer
	local hdr_gui = ui_hdr_renderer.gui
	local widget_icon_glow_texture = widget_icon.content.texture_id
	local icon_glow_material = Gui.material(hdr_gui, widget_icon_glow_texture)

	Material.set_scalar(icon_glow_material, "progress", pulse_progress)

	local icon_progress = math.easeInCubic(progress)

	widget_icon.style.texture_id.color[1] = 255 * icon_progress

	if progress == 1 then
		self._wind_icon_animation_time = nil
	else
		self._wind_icon_animation_time = wind_icon_animation_time
	end
end

local wind_texture_index_by_name = {
	beasts = 5,
	death = 3,
	fire = 4,
	heavens = 1,
	life = 0,
	light = 6,
	metal = 7,
	shadow = 2,
}

StartGameWindowWeaveInfo._set_wind_icon_by_name = function (self, wind_name)
	local widgets_by_name = self._widgets_by_name
	local widget_icon = widgets_by_name.wind_icon
	local index = wind_texture_index_by_name[wind_name]
	local ui_renderer = self._ui_renderer
	local gui = ui_renderer.gui
	local ui_hdr_renderer = self._ui_hdr_renderer
	local hdr_gui = ui_hdr_renderer.gui
	local widget_icon_texture = widget_icon.content.texture_id
	local icon_material = Gui.material(hdr_gui, widget_icon_texture)

	Material.set_scalar(icon_material, "texture_index", index)

	self._wind_icon_animation_time = WIND_ICON_ANIMATION_DURATION
end

StartGameWindowWeaveInfo._set_colors_by_wind = function (self, wind_name)
	local color = Colors.get_color_table_with_alpha(wind_name, 255)
	local widgets_by_name = self._widgets_by_name

	self:_apply_color_values(widgets_by_name.wind_title.style.text.text_color, color)
	self:_apply_color_values(widgets_by_name.wind_icon.style.texture_id.color, color)
end

StartGameWindowWeaveInfo._align_private_checkbox = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local widgets_by_name = self._widgets_by_name
	local widget_name = "private_checkbox"
	local widget = widgets_by_name[widget_name]
	local content = widget.content
	local offset = widget.offset
	local style = widget.style
	local hotspot_content = content.button_hotspot
	local hotspot_style = style.button_hotspot
	local hotspot_size = hotspot_style.size
	local text_style = style.text
	local text_offset = text_style.offset
	local text_width_offset = text_offset[1]
	local ui_renderer = self._ui_renderer
	local text_width = UIUtils.get_text_width(ui_renderer, text_style, hotspot_content.text)
	local total_width = text_width_offset + text_width

	offset[1] = -total_width / 2
	offset[2] = gamepad_active and 40 or 0

	local tooltip_style = style.additional_option_info
	local tooltip_width = tooltip_style.max_width
	local tooltip_offset = tooltip_style.offset

	tooltip_offset[1] = -(tooltip_width / 2 - total_width / 2)
	hotspot_size[1] = total_width
end

StartGameWindowWeaveInfo._apply_color_values = function (self, target, source, color_multiplier, include_alpha)
	color_multiplier = color_multiplier or 1

	if include_alpha then
		target[1] = source[1]
	end

	target[2] = math.floor(source[2] * color_multiplier)
	target[3] = math.floor(source[3] * color_multiplier)
	target[4] = math.floor(source[4] * color_multiplier)
end

StartGameWindowWeaveInfo._assign_objective = function (self, widget, title_text, text, icon, spacing)
	local scenegraph_id = widget.scenegraph_id
	local content = widget.content
	local style = widget.style
	local size = scenegraph_definition[scenegraph_id].size

	content.icon = icon or "trial_gem"
	content.title_text = title_text or "-"
	content.text = text or "-"

	local icon_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(content.icon)
	local icon_texture_size = icon_texture_settings.size
	local icon_style = style.icon
	local icon_size = icon_style.texture_size
	local icon_default_offset = icon_style.default_offset
	local icon_offset = icon_style.offset

	icon_size[1] = icon_texture_size[1]
	icon_size[2] = icon_texture_size[2]
	icon_offset[1] = icon_default_offset[1] - icon_size[1] / 2
	icon_offset[2] = icon_default_offset[2]

	local text_style = style.text
	local ui_renderer = self._ui_renderer
	local text_width = UIUtils.get_text_width(ui_renderer, text_style, content.text)
	local text_height = UIUtils.get_text_height(ui_renderer, size, text_style, content.text)

	spacing = spacing or 0

	local total_height = math.max(text_height, 50) + spacing

	return total_height
end

StartGameWindowWeaveInfo._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

StartGameWindowWeaveInfo.draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_hdr_renderer = self._ui_hdr_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings
	local input_service = self._parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._top_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	local objective_widgets = self._objective_widgets

	if objective_widgets then
		for _, widget in ipairs(objective_widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_top_renderer)
	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._bottom_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
	UIRenderer.begin_pass(ui_hdr_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._bottom_hdr_widgets) do
		UIRenderer.draw_widget(ui_hdr_renderer, widget)
	end

	UIRenderer.end_pass(ui_hdr_renderer)
end

StartGameWindowWeaveInfo._play_sound = function (self, event)
	self._parent:play_sound(event)
end

StartGameWindowWeaveInfo._animate_pulse = function (self, target, target_index, from, to, speed)
	local new_animation = UIAnimation.init(UIAnimation.pulse_animation, target, target_index, from, to, speed)

	return new_animation
end

StartGameWindowWeaveInfo._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

StartGameWindowWeaveInfo._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end

StartGameWindowWeaveInfo._format_time = function (self, time)
	local floor = math.floor
	local timer_text = string.format("%.2d:%.2d:%.2d", floor(time / 3600), floor(time / 60) % 60, floor(time) % 60)

	return timer_text
end

StartGameWindowWeaveInfo._get_save_data_by_weave_name = function (self, weave_name)
	local saved_value

	return saved_value
end
