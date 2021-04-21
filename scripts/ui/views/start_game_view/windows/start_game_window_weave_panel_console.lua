local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_weave_panel_console_definitions")
local widget_definitions = definitions.widgets
local title_button_definitions = definitions.title_button_definitions
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local INPUT_ACTION_NEXT = "cycle_next"
local INPUT_ACTION_PREVIOUS = "cycle_previous"
StartGameWindowWeavePanelConsole = class(StartGameWindowWeavePanelConsole)
StartGameWindowWeavePanelConsole.NAME = "StartGameWindowWeavePanelConsole"

StartGameWindowWeavePanelConsole.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowWeavePanelConsole")

	self._params = params
	self._parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self._ingame_ui = ingame_ui_context.ingame_ui
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._statistics_db = ingame_ui_context.statistics_db
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._layout_settings = params.layout_settings
	self._animations = {}
	self._ui_animations = {}

	self:_create_ui_elements(params, offset)
	self:_setup_input_buttons()
end

StartGameWindowWeavePanelConsole._create_ui_elements = function (self, params, offset)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(widget_definitions)
	local title_button_widgets = {}
	local layout_settings = self._layout_settings
	local window_layouts = layout_settings.window_layouts
	local scenegraph_id = "game_option"
	local size = scenegraph_definition[scenegraph_id].size
	local font_size = 28
	local optional_horizontal_alignment = "center"
	local temp_text_style = {
		upper_case = true,
		localize = true,
		dynamic_font_size = true,
		word_wrap = false,
		font_type = "hell_shark_header",
		font_size = font_size
	}
	local parent = self._parent
	local total_length = 0

	for index, settings in ipairs(window_layouts) do
		if settings.panel_sorting and parent:can_add_layout(settings) then
			local settings_name = settings.name
			local display_name = settings.display_name or "n/a"
			local text_width = self:_get_text_width(temp_text_style, display_name)
			local option_size = {
				math.min(text_width + 40, 400),
				size[2]
			}
			local optional_offset = {
				total_length,
				0,
				0
			}
			local widget_definition = UIWidgets.create_weave_panel_button(scenegraph_id, option_size, display_name, font_size, optional_offset, optional_horizontal_alignment)
			total_length = total_length + option_size[1]
			local widget = UIWidget.init(widget_definition)

			self:_set_text_button_size(widget, option_size[1])

			local content = widget.content
			content.layout_name = settings_name
			title_button_widgets[#title_button_widgets + 1] = widget
		end
	end

	self._ui_scenegraph.panel_entry_area.size[1] = total_length
	self._title_button_widgets = title_button_widgets

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
end

StartGameWindowWeavePanelConsole.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowWeavePanelConsole")

	self._ui_animator = nil
end

StartGameWindowWeavePanelConsole.update = function (self, dt, t)
	if DO_RELOAD then
		self:_create_ui_elements()
	end

	self:_handle_gamepad_activity()
	self:_update_selected_option()
	self:_update_animations(dt)
	self:_draw(dt)
end

StartGameWindowWeavePanelConsole.post_update = function (self, dt, t)
	self:_handle_input(dt, t)
end

StartGameWindowWeavePanelConsole._update_animations = function (self, dt)
	local ui_animations = self._ui_animations
	local animations = self._animations
	local ui_animator = self._ui_animator

	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local title_button_widgets = self._title_button_widgets

	for i, widget in ipairs(title_button_widgets) do
		self:_animate_title_entry(widget, dt)
	end

	self:_update_panel_selection_animation(dt)
end

StartGameWindowWeavePanelConsole._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.button_text

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowWeavePanelConsole._is_stepper_button_pressed = function (self, widget)
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

StartGameWindowWeavePanelConsole._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StartGameWindowWeavePanelConsole._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit
end

StartGameWindowWeavePanelConsole._is_button_selected = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.is_selected
end

StartGameWindowWeavePanelConsole._handle_input = function (self, dt, t)
	local parent = self._parent
	local widgets_by_name = self._widgets_by_name
	local input_service = self._parent:window_input_service()
	local input_made = false
	local title_button_widgets = self._title_button_widgets
	local num_title_button_widgets = #title_button_widgets

	for i, widget in ipairs(title_button_widgets) do
		local is_selected = widget.content.button_hotspot.is_selected

		if not is_selected then
			if self:_is_button_hover_enter(widget) then
				self:_play_sound("Play_hud_store_button_hover_category")
			end

			if self:_is_button_pressed(widget) then
				self:_on_panel_button_selected(i)

				input_made = true
			end
		end
	end

	if not input_made then
		local current_index = self._selected_index or 1
		local max_index = #title_button_widgets

		if input_service:get(INPUT_ACTION_PREVIOUS) then
			local next_index = (current_index > 1 and current_index - 1) or max_index

			self:_on_panel_button_selected(next_index)
		elseif input_service:get(INPUT_ACTION_NEXT) then
			local next_index = current_index % max_index + 1

			self:_on_panel_button_selected(next_index)
		end
	end
end

StartGameWindowWeavePanelConsole._on_panel_button_selected = function (self, index)
	local parent = self._parent
	local widget = self._title_button_widgets[index]
	local layout_name = widget.content.layout_name

	print("_on_panel_button_selected", index, layout_name)
	parent:set_layout_by_name(layout_name)
end

StartGameWindowWeavePanelConsole._set_selected_option = function (self, index)
	self:_start_panel_selection_animation(self._selected_index, index)

	local title_button_widgets = self._title_button_widgets

	for i, widget in ipairs(title_button_widgets) do
		widget.content.button_hotspot.is_selected = i == index
	end
end

StartGameWindowWeavePanelConsole._update_selected_option = function (self)
	local parent = self._parent
	local selected_layout_name = parent:get_selected_layout_name()

	if selected_layout_name then
		local title_button_widgets = self._title_button_widgets

		for i, widget in ipairs(title_button_widgets) do
			local layout_name = widget.content.layout_name

			if layout_name == selected_layout_name and i ~= self._selected_index then
				self:_set_selected_option(i)

				self._selected_index = i
			end
		end
	end
end

StartGameWindowWeavePanelConsole._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()
	local render_settings = self._render_settings

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	for _, widget in ipairs(self._title_button_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

StartGameWindowWeavePanelConsole._play_sound = function (self, event)
	self._parent:play_sound(event)
end

StartGameWindowWeavePanelConsole._setup_input_buttons = function (self)
	local input_service = self._parent:window_input_service()
	local input_1_texture_data = UISettings.get_gamepad_input_texture_data(input_service, INPUT_ACTION_PREVIOUS, true)
	local input_2_texture_data = UISettings.get_gamepad_input_texture_data(input_service, INPUT_ACTION_NEXT, true)
	local widgets_by_name = self._widgets_by_name
	local input_1_widget = widgets_by_name.panel_input_area_1
	local input_2_widget = widgets_by_name.panel_input_area_2
	local icon_style_input_1 = input_1_widget.style.texture_id
	icon_style_input_1.horizontal_alignment = "center"
	icon_style_input_1.vertical_alignment = "center"
	icon_style_input_1.texture_size = {
		input_1_texture_data.size[1],
		input_1_texture_data.size[2]
	}
	input_1_widget.content.texture_id = input_1_texture_data.texture
	local icon_style_input_2 = input_2_widget.style.texture_id
	icon_style_input_2.horizontal_alignment = "center"
	icon_style_input_2.vertical_alignment = "center"
	icon_style_input_2.texture_size = {
		input_2_texture_data.size[1],
		input_2_texture_data.size[2]
	}
	input_2_widget.content.texture_id = input_2_texture_data.texture
end

StartGameWindowWeavePanelConsole._handle_gamepad_activity = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local force_update = self.gamepad_active_last_frame == nil

	if gamepad_active then
		if not self.gamepad_active_last_frame or force_update then
			self.gamepad_active_last_frame = true
			local widgets_by_name = self._widgets_by_name
			widgets_by_name.panel_input_area_1.content.visible = true
			widgets_by_name.panel_input_area_2.content.visible = true
		end
	elseif self.gamepad_active_last_frame or force_update then
		self.gamepad_active_last_frame = false
		local widgets_by_name = self._widgets_by_name
		widgets_by_name.panel_input_area_1.content.visible = false
		widgets_by_name.panel_input_area_2.content.visible = false
	end
end

StartGameWindowWeavePanelConsole._set_text_button_size = function (self, widget, width)
	local ui_scenegraph = self._ui_scenegraph
	local scenegraph_id = widget.scenegraph_id
	ui_scenegraph[scenegraph_id].size[1] = width
	local style = widget.style
	local text_width_offset = 5
	local text_width = width - text_width_offset * 2
	style.text.size[1] = text_width
	style.text_shadow.size[1] = text_width
	style.text_hover.size[1] = text_width
	style.text_disabled.size[1] = text_width
	style.text.offset[1] = style.text.default_offset[1] + text_width_offset
	style.text_shadow.offset[1] = style.text_shadow.default_offset[1] + text_width_offset
	style.text_hover.offset[1] = style.text_hover.default_offset[1] + text_width_offset
	style.text_disabled.offset[1] = style.text_disabled.default_offset[1] + text_width_offset
end

StartGameWindowWeavePanelConsole._get_text_width = function (self, text_style, text)
	if text_style.localize then
		text = Localize(text)
	end

	if text_style.upper_case then
		text = TextToUpper(text)
	end

	local ui_renderer = self._ui_renderer
	local font, scaled_font_size = UIFontByResolution(text_style)
	local text_width, text_height, min = UIRenderer.text_size(ui_renderer, text, font[1], scaled_font_size)

	return text_width
end

StartGameWindowWeavePanelConsole._set_text_button_horizontal_position = function (self, widget, x_position)
	local offset = widget.offset
	offset[1] = x_position
end

StartGameWindowWeavePanelConsole._animate_title_entry = function (self, widget, dt)
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
		input_progress = math.min(input_progress + dt * input_speed, 1)
	else
		input_progress = math.max(input_progress - dt * input_speed, 0)
	end

	local input_easing_out_progress = math.easeOutCubic(input_progress)
	local input_easing_in_progress = math.easeInCubic(input_progress)

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	local hover_easing_out_progress = math.easeOutCubic(hover_progress)
	local hover_easing_in_progress = math.easeInCubic(hover_progress)

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
	end

	local select_easing_out_progress = math.easeOutCubic(selection_progress)
	local select_easing_in_progress = math.easeInCubic(selection_progress)
	local combined_progress = math.max(hover_progress, selection_progress)
	local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
	local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
	local hover_alpha = 255 * combined_progress

	if style.text then
		local text_height_offset = 1 * combined_progress
		style.text.offset[2] = -(2 + text_height_offset)
		style.text_shadow.offset[2] = -(4 + text_height_offset)
		style.text_hover.offset[2] = -(2 + text_height_offset)
		style.text_disabled.offset[2] = -(2 + text_height_offset)
	end

	if style.new_marker then
		local new_marker_progress = 0.5 + math.sin(Managers.time:time("ui") * 5) * 0.5
		style.new_marker.color[1] = 100 + 155 * new_marker_progress
	end

	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

StartGameWindowWeavePanelConsole._start_panel_selection_animation = function (self, previous_selected_index, new_selected_index)
	local widgets_by_name = self._widgets_by_name
	local entry_panel_selection = widgets_by_name.entry_panel_selection
	local selection_offset = entry_panel_selection.offset
	local selection_size = entry_panel_selection.content.size
	local panel_selection_animation = self._panel_selection_animation or {}
	self._panel_selection_animation = panel_selection_animation
	local start_offset = selection_offset[1]
	local start_width = selection_size[1]
	local target_offset = self._title_button_widgets[new_selected_index].offset[1]
	local target_width = self._title_button_widgets[new_selected_index].content.size[1]
	local animation_duration = 0.3
	panel_selection_animation.duration = animation_duration
	panel_selection_animation.total_duration = animation_duration
	panel_selection_animation.target_offset = target_offset
	panel_selection_animation.start_offset = start_offset
	panel_selection_animation.target_width = target_width
	panel_selection_animation.start_width = start_width
end

StartGameWindowWeavePanelConsole._update_panel_selection_animation = function (self, dt)
	local panel_selection_animation = self._panel_selection_animation

	if not panel_selection_animation then
		return
	end

	local duration = panel_selection_animation.duration

	if not duration then
		return
	end

	duration = math.max(duration - dt, 0)
	local start_offset = panel_selection_animation.start_offset
	local target_offset = panel_selection_animation.target_offset
	local start_width = panel_selection_animation.start_width
	local target_width = panel_selection_animation.target_width
	local total_duration = panel_selection_animation.total_duration
	local progress = 1 - duration / total_duration
	local anim_progress = math.easeOutCubic(progress)
	local animation_width = (target_width - start_width) * anim_progress
	local current_width = start_width + animation_width
	local animation_distance = (target_offset - start_offset) * anim_progress
	local current_distance = start_offset + animation_distance
	local widgets_by_name = self._widgets_by_name
	local entry_panel_selection = widgets_by_name.entry_panel_selection
	local panel_selection_mask_size = entry_panel_selection.style.write_mask.texture_size
	local panel_selection_size = entry_panel_selection.content.size
	local panel_selection_scenegraph_id = entry_panel_selection.scenegraph_id
	panel_selection_size[1] = current_width
	panel_selection_mask_size[1] = current_width * 2
	self._ui_scenegraph[panel_selection_scenegraph_id].size[1] = current_width
	local selection_offset = entry_panel_selection.offset
	selection_offset[1] = current_distance

	if duration == 0 then
		panel_selection_animation.duration = nil
	else
		panel_selection_animation.duration = duration
	end
end

return
