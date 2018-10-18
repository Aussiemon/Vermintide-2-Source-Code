local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_panel_console_definitions")
local widget_definitions = definitions.widgets
local title_button_definitions = definitions.title_button_definitions
local title_button_disable_functions = definitions.title_button_disable_functions
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local INPUT_ACTION_NEXT = "cycle_next"
local INPUT_ACTION_PREVIOUS = "cycle_previous"
local DO_RELOAD = false
local HERO_POWER_EFFECT_DURATION = 1
StartGameWindowPanelConsole = class(StartGameWindowPanelConsole)
StartGameWindowPanelConsole.NAME = "StartGameWindowPanelConsole"

StartGameWindowPanelConsole.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate StartGameWindowPanelConsole")

	self.params = params
	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	self._animations = {}
	self._ui_animations = {}

	self:create_ui_elements(params, offset)
	self:_setup_text_buttons_width()
	self:_setup_input_buttons()
end

StartGameWindowPanelConsole.create_ui_elements = function (self, params, offset)
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
	local title_button_widgets = {}

	for i, widget_definition in ipairs(title_button_definitions) do
		local widget = UIWidget.init(widget_definition)
		title_button_widgets[#title_button_widgets + 1] = widget
		local disable_function_name = title_button_disable_functions[i]

		if disable_function_name then
			widget.disable_function_name = disable_function_name
		end
	end

	self._title_button_widgets = title_button_widgets

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StartGameWindowPanelConsole.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate StartGameWindowPanelConsole")

	self.ui_animator = nil
end

StartGameWindowPanelConsole.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self:_handle_gamepad_activity()
	self:_handle_back_button_visibility()
	self:_update_title_buttons_disable_status()
	self:_update_current_game_mode_index()
	self:_update_animations(dt)
	self:draw(dt)
end

StartGameWindowPanelConsole._update_current_game_mode_index = function (self)
	local game_mode_index = self.parent:get_selected_game_mode_index()

	if game_mode_index ~= self._game_mode_index then
		self._game_mode_index = game_mode_index
		local ignore_layout_change = true

		self:_on_panel_button_selected(game_mode_index, ignore_layout_change)
	end
end

StartGameWindowPanelConsole._update_title_buttons_disable_status = function (self)
	local title_button_widgets = self._title_button_widgets

	for i = 1, #title_button_widgets, 1 do
		local widget = title_button_widgets[i]
		local disable_function_name = widget.disable_function_name

		if disable_function_name then
			local is_disabled = self[disable_function_name](self)
			widget.content.button_hotspot.disable_button = is_disabled
		else
			widget.content.button_hotspot.disable_button = false
		end
	end
end

StartGameWindowPanelConsole.post_update = function (self, dt, t)
	self:_handle_input(dt, t)
end

StartGameWindowPanelConsole._update_animations = function (self, dt)
	local ui_animations = self._ui_animations
	local animations = self._animations
	local ui_animator = self.ui_animator

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

	self:_animate_back_button(self._widgets_by_name.back_button, dt)
	self:_animate_back_button(self._widgets_by_name.close_button, dt)
end

StartGameWindowPanelConsole._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.button_text

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowPanelConsole._is_stepper_button_pressed = function (self, widget)
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

StartGameWindowPanelConsole._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StartGameWindowPanelConsole._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit
end

StartGameWindowPanelConsole._is_button_selected = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.is_selected
end

StartGameWindowPanelConsole._find_new_index = function (self, current_index, direction)
	if direction == 0 then
		return current_index
	end

	local title_button_widgets = self._title_button_widgets
	local new_index = current_index
	local done = false

	repeat
		new_index = math.index_wrapper(new_index + direction, #title_button_widgets)
		local widget = title_button_widgets[new_index]

		if not widget then
			done = true
			new_index = current_index
		elseif not widget.content.button_hotspot.disable_button then
			done = true
		end
	until done

	return new_index
end

StartGameWindowPanelConsole._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local title_button_widgets = self._title_button_widgets
	local parent = self.parent
	local input_service = parent:window_input_service()
	local input_made = false
	local title_button_widgets = self._title_button_widgets
	local current_layout_index = parent:get_selected_layout_index()

	for i, widget in ipairs(title_button_widgets) do
		if self:_is_button_hover_enter(widget) then
			self:_play_sound("Play_hud_hover")
		end

		if self:_is_button_pressed(widget) and i ~= current_layout_index then
			self:_on_panel_button_selected(i)

			input_made = true
		end
	end

	local close_button = widgets_by_name.close_button
	local back_button = widgets_by_name.back_button

	if self:_is_button_hover_enter(back_button) or self:_is_button_hover_enter(close_button) then
		self:_play_sound("Play_hud_hover")
	end

	local close_on_exit = parent:close_on_exit()

	if not close_on_exit and not input_made and self:_is_button_pressed(back_button) then
		local return_layout_index = nil
		local params = self.params

		if params then
			return_layout_index = params.return_layout_index
			params.return_layout_index = nil
		end

		return_layout_index = return_layout_index or parent:get_previous_selected_layout_index()

		if return_layout_index then
			self:_reset_back_button()
			self:_on_panel_button_selected(return_layout_index)

			input_made = true
		end
	end

	if not input_made and self:_is_button_pressed(close_button) then
		parent:close_menu()

		input_made = true
	end

	if not input_made then
		local current_index = parent:get_selected_game_mode_index()
		local direction = (input_service:get(INPUT_ACTION_PREVIOUS) and -1) or (input_service:get(INPUT_ACTION_NEXT) and 1) or 0
		local new_index = self:_find_new_index(current_index, direction)

		if new_index ~= current_index then
			self:_on_panel_button_selected(new_index)
		end
	end
end

StartGameWindowPanelConsole._on_panel_button_selected = function (self, index, ignore_layout_change)
	local title_button_widgets = self._title_button_widgets
	local parent = self.parent

	if title_button_widgets[index] then
		if title_button_widgets[index].content.button_hotspot.disable_button then
			index = self:_find_new_index(index, 1)
		end

		for i, widget in ipairs(title_button_widgets) do
			widget.content.button_hotspot.is_selected = i == index
		end

		if not ignore_layout_change then
			local selected_layout_index = parent:get_selected_layout_index()

			if index ~= selected_layout_index then
				PlayerData.mission_selection.start_layout = index
			end
		end
	end

	if not ignore_layout_change then
		parent:set_layout(index)
	end
end

StartGameWindowPanelConsole.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	for _, widget in ipairs(self._title_button_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	if self._portrait_widget then
		UIRenderer.draw_widget(ui_renderer, self._portrait_widget)
	end

	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for _, widget in ipairs(active_node_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)
end

StartGameWindowPanelConsole._play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartGameWindowPanelConsole._get_text_height = function (self, ui_renderer, size, ui_style, text, ui_style_global)
	local widget_scale = nil

	if ui_style_global then
		widget_scale = ui_style_global.scale
	end

	local font_material, font_size, font_name = nil

	if ui_style.font_type then
		local font, size_of_font = UIFontByResolution(ui_style, widget_scale)
		font_name = font[3]
		font_size = font[2]
		font_material = font[1]
		font_size = size_of_font
	else
		local font = ui_style.font
		font_name = font[3]
		font_size = font[2]
		font_material = font[1]
		font_size = ui_style.font_size or font_size
	end

	if ui_style.localize then
		text = Localize(text)
	end

	local font_height, font_min, font_max = UIGetFontHeight(ui_renderer.gui, font_name, font_size)
	local texts = UIRenderer.word_wrap(ui_renderer, text, font_material, font_size, size[1])
	local text_start_index = 1
	local max_texts = #texts
	local num_texts = math.min(#texts - (text_start_index - 1), max_texts)
	local inv_scale = RESOLUTION_LOOKUP.inv_scale
	local full_font_height = (font_max + math.abs(font_min)) * inv_scale * num_texts

	return full_font_height
end

StartGameWindowPanelConsole._create_style_animation_enter = function (self, widget, target_value, style_id, widget_index, instant)
	local ui_animations = self._ui_animations
	local animation_name = "game_option_" .. style_id
	local widget_style = widget.style
	local pass_style = widget_style[style_id]
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

StartGameWindowPanelConsole._create_style_animation_exit = function (self, widget, target_value, style_id, widget_index, instant)
	local ui_animations = self._ui_animations
	local animation_name = "game_option_" .. style_id
	local widget_style = widget.style
	local pass_style = widget_style[style_id]
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

StartGameWindowPanelConsole._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

StartGameWindowPanelConsole._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end

StartGameWindowPanelConsole._setup_input_buttons = function (self)
	local input_service = self.parent:window_input_service()
	local input_1_texture_data = UISettings.get_gamepad_input_texture_data(input_service, INPUT_ACTION_NEXT, true)
	local input_2_texture_data = UISettings.get_gamepad_input_texture_data(input_service, INPUT_ACTION_PREVIOUS, true)
	local widgets_by_name = self._widgets_by_name
	local input_1_widget = widgets_by_name.panel_input_area_1
	local input_2_widget = widgets_by_name.panel_input_area_2
	local icon_style_input_1 = input_1_widget.style.texture_id
	icon_style_input_1.horizontal_alignment = "center"
	icon_style_input_1.vertical_alignment = "center"
	icon_style_input_1.texture_size = {
		input_2_texture_data.size[1],
		input_2_texture_data.size[2]
	}
	input_1_widget.content.texture_id = input_2_texture_data.texture
	local icon_style_input_2 = input_2_widget.style.texture_id
	icon_style_input_2.horizontal_alignment = "center"
	icon_style_input_2.vertical_alignment = "center"
	icon_style_input_2.texture_size = {
		input_1_texture_data.size[1],
		input_1_texture_data.size[2]
	}
	input_2_widget.content.texture_id = input_1_texture_data.texture
end

StartGameWindowPanelConsole._handle_back_button_visibility = function (self)
	if not self.gamepad_active_last_frame then
		local close_on_exit = self.parent:close_on_exit()
		local back_button = self._widgets_by_name.back_button
		local new_visibility = not close_on_exit
		back_button.content.visible = new_visibility
	end
end

StartGameWindowPanelConsole._reset_back_button = function (self)
	local back_button = self._widgets_by_name.back_button
	local hotspot = back_button.content.button_hotspot

	table.clear(hotspot)
end

StartGameWindowPanelConsole._handle_gamepad_activity = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local force_update = self.gamepad_active_last_frame == nil

	if gamepad_active then
		if not self.gamepad_active_last_frame or force_update then
			self.gamepad_active_last_frame = true
			local widgets_by_name = self._widgets_by_name
			widgets_by_name.panel_input_area_1.content.visible = true
			widgets_by_name.panel_input_area_2.content.visible = true
			widgets_by_name.back_button.content.visible = false
			widgets_by_name.close_button.content.visible = false
		end
	elseif self.gamepad_active_last_frame or force_update then
		self.gamepad_active_last_frame = false
		local widgets_by_name = self._widgets_by_name
		widgets_by_name.panel_input_area_1.content.visible = false
		widgets_by_name.panel_input_area_2.content.visible = false
		widgets_by_name.close_button.content.visible = true
	end
end

StartGameWindowPanelConsole._setup_text_buttons_width = function (self)
	local ui_scenegraph = self.ui_scenegraph
	local area_size = ui_scenegraph.panel_entry_area.size
	local total_width = area_size[1]
	local total_menu_panel_length = 0
	local title_button_widgets = self._title_button_widgets
	local num_buttons = #title_button_widgets
	local entry_width = math.floor(total_width / num_buttons)

	for index, widget in ipairs(title_button_widgets) do
		self:_set_text_button_size(widget, entry_width)

		local position_x = entry_width * (index - 1)

		self:_set_text_button_horizontal_position(widget, position_x)
	end
end

StartGameWindowPanelConsole._set_text_button_size = function (self, widget, width)
	local ui_scenegraph = self.ui_scenegraph
	local scenegraph_id = widget.scenegraph_id
	ui_scenegraph[scenegraph_id].size[1] = width
	local style = widget.style
	style.selected_texture.texture_size[1] = width
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

StartGameWindowPanelConsole._setup_text_button_size = function (self, widget)
	local scenegraph_id = widget.scenegraph_id
	local content = widget.content
	local style = widget.style
	local text_style = style.text
	local text = content.text_field or content.text

	if text_style.localize then
		text = Localize(text)
	end

	if text_style.upper_case then
		text = TextToUpper(text)
	end

	local ui_scenegraph = self.ui_scenegraph
	local ui_renderer = self.ui_renderer
	local font, scaled_font_size = UIFontByResolution(text_style)
	local text_width, text_height, min = UIRenderer.text_size(ui_renderer, text, font[1], scaled_font_size)
	ui_scenegraph[scenegraph_id].size[1] = text_width

	return text_width
end

StartGameWindowPanelConsole._set_text_button_horizontal_position = function (self, widget, x_position)
	local ui_scenegraph = self.ui_scenegraph
	local scenegraph_id = widget.scenegraph_id
	ui_scenegraph[scenegraph_id].local_position[1] = x_position
end

StartGameWindowPanelConsole._adventure_disable_function = function (self)
	local is_connected = Managers.twitch and (Managers.twitch:is_connecting() or Managers.twitch:is_connected())

	return is_connected
end

StartGameWindowPanelConsole._custom_game_disable_function = function (self)
	local is_connected = Managers.twitch and (Managers.twitch:is_connecting() or Managers.twitch:is_connected())

	return is_connected
end

StartGameWindowPanelConsole._heroic_deed_disable_function = function (self)
	local is_connected = Managers.twitch and (Managers.twitch:is_connecting() or Managers.twitch:is_connected())
	local running_beta = script_data.use_beta_overlay

	return is_connected or running_beta
end

StartGameWindowPanelConsole._lobby_browser_disable_function = function (self)
	local is_connected = Managers.twitch and (Managers.twitch:is_connecting() or Managers.twitch:is_connected())

	return is_connected
end

StartGameWindowPanelConsole._streaming_disable_function = function (self)
	local twitch_enabled = GameSettingsDevelopment.twitch_enabled
	local is_offline = Managers.account:offline_mode()

	return not twitch_enabled or is_offline
end

StartGameWindowPanelConsole._animate_title_entry = function (self, widget, dt)
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
	style.selected_texture.color[1] = hover_alpha
	local text_height_offset = 4 * combined_progress
	style.text.offset[2] = 5 - text_height_offset
	style.text_shadow.offset[2] = 3 - text_height_offset
	style.text_hover.offset[2] = 5 - text_height_offset
	style.text_disabled.offset[2] = 5 - text_height_offset
	local new_marker_progress = 0.5 + math.sin(Application.time_since_launch() * 5) * 0.5
	style.new_marker.color[1] = 100 + 155 * new_marker_progress
	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

StartGameWindowPanelConsole._animate_back_button = function (self, widget, dt)
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
	style.texture_id.color[1] = 255 - hover_alpha
	style.texture_hover_id.color[1] = hover_alpha
	style.selected_texture.color[1] = hover_alpha
	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

return
