local definitions, widget_definitions, scenegraph_definition, animation_definitions, create_weave_entry_func, weave_entry_size, weave_entry_spacing, num_visible_weave_entries = nil
local DO_RELOAD = true
StartGameWindowWeaveList = class(StartGameWindowWeaveList)
StartGameWindowWeaveList.NAME = "StartGameWindowWeaveList"

StartGameWindowWeaveList.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowWeaveList")

	self._params = params
	self._parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self._is_server = ingame_ui_context.is_server
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._current_index = 0
	self._hold_down_timer = 0
	self._hold_up_timer = 0
	self._current_scroll_value = 0
	self._wanted_scrollbar_value = 0
	self._start_index = 0
	self._play_button_pressed = false
	self._animations = {}

	self:_setup_definitions(params)
	self:_create_ui_elements(params, offset)
	self:_populate_list()

	local ignore_sound = true

	self:_on_weave_widget_pressed(self._next_weave_widget, ignore_sound)
	Managers.state.event:trigger("weave_list_entered")
	self:_start_transition_animation("on_enter")
	self._parent:change_generic_actions("default_weave")
end

StartGameWindowWeaveList._setup_definitions = function (self, params)
	local gamepad_active = params.use_gamepad_layout or not IS_WINDOWS

	if gamepad_active then
		definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_weave_list_console_definitions")
	else
		definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_weave_list_definitions")
	end

	widget_definitions = definitions.widgets
	scenegraph_definition = definitions.scenegraph_definition
	animation_definitions = definitions.animation_definitions
	create_weave_entry_func = definitions.create_weave_entry_func
	weave_entry_size = definitions.entry_size
	weave_entry_spacing = definitions.entry_spacing
	num_visible_weave_entries = definitions.num_visible_weave_entries
end

StartGameWindowWeaveList._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings
	}
	local widgets = self._widgets_by_name
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

StartGameWindowWeaveList._create_ui_elements = function (self, params, offset)
	DO_RELOAD = false
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
	self._weave_entry_widgets = {}
	self._weave_entry_widgets_by_name = {}

	UIRenderer.clear_scenegraph_queue(self._ui_top_renderer)

	self._ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
end

StartGameWindowWeaveList.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowWeaveList")

	self._ui_animator = nil
	self._params.selected_weave_template = nil
end

StartGameWindowWeaveList.update = function (self, dt, t)
	if DO_RELOAD then
		self:_setup_definitions(self._params)
		self:_create_ui_elements()
	end

	script_data.weave_list = self

	self:_update_can_play(dt, t)
	self:_update_animations(dt)

	if not self._play_button_pressed then
		self:_handle_input(dt, t)
		self:_handle_gamepad_input(dt, t)
	end

	self:_draw(dt)
end

StartGameWindowWeaveList._can_play = function (self)
	local can_play = self._selected_weave_name ~= nil

	return can_play
end

StartGameWindowWeaveList._can_set_next_weave = function (self)
	local next_weave_widget = self._next_weave_widget
	local next_weave_widget_content = next_weave_widget.content
	local weave_template_name = next_weave_widget_content.weave_template_name

	return self._selected_weave_name ~= weave_template_name
end

StartGameWindowWeaveList._update_can_play = function (self)
	local is_matchmaking = Managers.matchmaking:is_game_matchmaking()
	local can_play = self:_can_play()
	local can_set_next_weave = self:_can_set_next_weave()

	if self._previous_can_play ~= can_play or self._previous_set_next_weave ~= can_set_next_weave or is_matchmaking ~= self._was_matchmaking then
		self._previous_can_play = can_play
		self._previous_set_next_weave = can_set_next_weave
		self._was_matchmaking = is_matchmaking

		if is_matchmaking then
			if self._is_server then
				if can_set_next_weave then
					self._parent:set_input_description("cancel_available_set_next_weave_available_lock")
				else
					self._parent:set_input_description("cancel_matchmaking_lock")
				end
			elseif can_set_next_weave then
				self._parent:set_input_description("set_next_weave_available_lock")
			else
				self._parent:set_input_description(nil)
			end
		elseif can_play then
			if can_set_next_weave then
				self._parent:set_input_description("play_available_set_next_weave_available_lock")
			else
				self._parent:set_input_description("play_available_lock")
			end
		elseif can_set_next_weave then
			self._parent:set_input_description("set_next_weave_available_lock")
		else
			self._parent:set_input_description(nil)
		end
	end
end

StartGameWindowWeaveList.post_update = function (self, dt, t)
	return
end

StartGameWindowWeaveList._update_animations = function (self, dt)
	local animations = self._animations
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

StartGameWindowWeaveList._on_list_index_selected = function (self, index)
	local widgets = self._weave_entry_widgets
	local widget = widgets[index]

	if not widget then
		return
	end

	local widget_content = widget.content
	local template_id = widget_content.template_id

	for idx, widget in ipairs(widgets) do
		local content = widget.content
		local hotspot = content.button_hotspot
		local is_selected = idx == index

		if hotspot then
			hotspot.is_selected = is_selected
			hotspot.has_focus = is_selected
		end
	end

	local selected_widget = widgets[index]

	if selected_widget then
		local next_weave_widget_content = self._next_weave_widget.content
		next_weave_widget_content.button_hotspot.is_selected = false
		next_weave_widget_content.button_hotspot.has_focus = false
	end

	local weave_templates = WeaveSettings.templates_ordered
	local template = weave_templates[template_id]
	self._params.selected_weave_template = template
	self._current_index = index
	local weave_name = template.name
	self._selected_weave_name = weave_name

	self._parent:set_selected_weave_id(weave_name)
	self._parent:set_selected_weave_objective_index(1)
	self:_play_sound("menu_wind_level_select")
end

StartGameWindowWeaveList._handle_gamepad_input = function (self, dt, t)
	local mouse_active = Managers.input:is_device_active("mouse")

	if mouse_active then
		return
	end

	local num_entries = #self._weave_entry_widgets
	local input_service = self._parent:window_input_service()
	local is_matchmaking = Managers.matchmaking:is_game_matchmaking()

	if input_service:get("move_up_hold") then
		self._hold_up_timer = self._hold_up_timer + dt
		self._hold_down_timer = 0
	elseif input_service:get("move_down_hold") then
		self._hold_down_timer = self._hold_down_timer + dt
		self._hold_up_timer = 0
	else
		self._hold_up_timer = 0
		self._hold_down_timer = 0
	end

	if input_service:get("move_up") or self._hold_up_timer > 0.5 then
		if self._hold_up_timer > 0.5 then
			self._hold_up_timer = 0.45
		end

		local current_index = self._current_index
		local new_index = current_index - 1

		if new_index < 1 then
			new_index = num_entries
		end

		if new_index ~= current_index then
			self:_on_list_index_selected(new_index)
		end
	elseif input_service:get("move_down") or self._hold_down_timer > 0.5 then
		if self._hold_down_timer > 0.5 then
			self._hold_down_timer = 0.45
		end

		local weave_templates = WeaveSettings.templates_ordered
		local current_index = self._current_index
		local new_index = 1 + current_index % num_entries

		if new_index ~= current_index then
			self:_on_list_index_selected(new_index)
		end
	else
		if is_matchmaking then
			if self._is_server and (input_service:get("refresh_press") or input_service:get("skip_pressed")) then
				self._parent:play_sound("Play_hud_hover")
				Managers.matchmaking:cancel_matchmaking()
			end
		elseif self:_can_play() and (input_service:get("refresh_press") or input_service:get("skip_pressed")) then
			self._play_button_pressed = true
			local force_close_menu = true

			self._parent:play(t, "weave", force_close_menu)
		end

		if input_service:get("special_1") then
			self._current_index = 0
			self._hold_down_timer = 0
			self._hold_up_timer = 0
			self._current_scroll_value = 0
			self._wanted_scrollbar_value = 0
			self._start_index = 0

			self:_on_weave_widget_pressed(self._next_weave_widget)
		elseif input_service:get("trigger_cycle_next") then
			Managers.state.event:trigger("weave_tutorial_message", WeaveUITutorials.ranked_weave_desc)
		end
	end

	self:_handle_gamepad_scrollbar(dt, t)
	self:_animate_list_entries(false, dt)
end

StartGameWindowWeaveList._handle_gamepad_scrollbar = function (self, dt, t)
	local num_entries = #self._weave_entry_widgets

	if num_entries <= num_visible_weave_entries then
		return
	end

	local start_index = self._start_index
	local step = 1 / (num_entries - num_visible_weave_entries + 1)
	local current_index = self._current_index
	local relative_index = self._current_index - (start_index - 1)

	if relative_index > num_visible_weave_entries - 3 then
		local diff = relative_index - (num_visible_weave_entries - 3)
		self._start_index = math.min(start_index + diff, num_entries - num_visible_weave_entries + 3)
		self._current_scroll_value = self._wanted_scrollbar_value
		self._wanted_scrollbar_value = math.min(self._wanted_scrollbar_value + step * diff, 1)
	elseif self._current_index < start_index + 2 then
		local diff = (start_index + 2) - self._current_index
		self._start_index = math.max(start_index - diff, 1)
		self._current_scroll_value = self._wanted_scrollbar_value
		self._wanted_scrollbar_value = math.max(self._wanted_scrollbar_value - step * diff, 0)
	end

	self._current_scroll_value = math.lerp(self._current_scroll_value, self._wanted_scrollbar_value, dt * 7)

	self:_set_scrollbar_value(self._current_scroll_value)
end

StartGameWindowWeaveList._handle_input = function (self, dt, t)
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active then
		return
	end

	local parent = self._parent
	local widgets_by_name = self._widgets_by_name
	local input_service = self._parent:window_input_service()
	local list_hovered = self:_is_list_hovered()

	if self:_next_weave_widget_hover_enter() then
		self:_play_sound("play_gui_lobby_button_02_mission_act_hover")
	end

	local widget = self:_next_weave_widget_pressed()

	if widget then
		self:_on_weave_widget_pressed(widget)
		self:_play_sound("play_gui_lobby_button_02_mission_select")
	elseif list_hovered then
		if self:_weave_widget_hover_enter() then
			self:_play_sound("play_gui_lobby_button_02_mission_act_hover")
		end

		local widget = self:_weave_widget_pressed()

		if widget then
			self:_on_weave_widget_pressed(widget)
			self:_play_sound("play_gui_lobby_button_02_mission_select")
		end
	end

	self:_update_mouse_scroll_input()
	self:_animate_list_entries(list_hovered, dt)
end

StartGameWindowWeaveList._is_list_hovered = function (self)
	local widgets_by_name = self._widgets_by_name
	local list_hotspot = widgets_by_name.list_hotspot
	local list_hotspot_content = list_hotspot.content
	local hotspot = list_hotspot_content.hotspot

	return hotspot.is_hover == true
end

StartGameWindowWeaveList._on_weave_widget_pressed = function (self, widget, ignore_sound)
	local widgets = self._weave_entry_widgets
	local selected_widget = widget
	local selected_content = selected_widget.content
	local template_id = selected_content.template_id

	for _, widget in pairs(widgets) do
		local content = widget.content
		local hotspot = content.button_hotspot
		local is_selected = content.template_id == template_id and widget == selected_widget

		if hotspot then
			hotspot.is_selected = is_selected
			hotspot.has_focus = is_selected
		end
	end

	local next_weave_widget_content = self._next_weave_widget.content
	next_weave_widget_content.button_hotspot.is_selected = widget == self._next_weave_widget
	next_weave_widget_content.button_hotspot.has_focus = widget == self._next_weave_widget
	local weave_templates = WeaveSettings.templates_ordered
	local template = weave_templates[template_id]
	self._params.selected_weave_template = template
	local weave_name = template.name
	self._selected_weave_name = weave_name

	self._parent:set_selected_weave_id(weave_name)
	self._parent:set_selected_weave_objective_index(1)

	if not ignore_sound then
		self:_play_sound("menu_wind_level_select")
	end
end

StartGameWindowWeaveList._draw = function (self, dt)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self._parent:window_input_service()
	local render_settings = self._render_settings
	local alpha_multiplier = render_settings.alpha_multiplier or 0

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for widget_name, widget in pairs(self._widgets_by_name) do
		render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	local start_index = self:_calculate_first_widget_to_draw()

	for i = start_index, (start_index + num_visible_weave_entries) - 1, 1 do
		local widget = self._weave_entry_widgets[i]

		if widget then
			render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	render_settings.alpha_multiplier = alpha_multiplier

	UIRenderer.draw_widget(ui_top_renderer, self._next_weave_widget)
	UIRenderer.end_pass(ui_top_renderer)
end

StartGameWindowWeaveList._calculate_first_widget_to_draw = function (self)
	local total_scroll_height = self._total_scroll_height
	local num_weave_widgets = #self._weave_entry_widgets
	local current_scroll_value = self._scroll_value
	local max_index = num_weave_widgets - num_visible_weave_entries + 2
	local start_index = math.floor(math.lerp(1, max_index, current_scroll_value))

	return start_index
end

StartGameWindowWeaveList._play_sound = function (self, event)
	self._parent:play_sound(event)
end

StartGameWindowWeaveList._populate_list = function (self)
	local ignore_dlc_check = false
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.list
	local weave_templates = WeaveSettings.templates_ordered
	local num_entries = #weave_templates
	local statistics_db = Managers.player:statistics_db()
	local stats_id = Managers.player:local_player():stats_id()
	local unlocked_weave_templates = {}
	local highest_consecutive_unlocked_weave = 1
	local highest_consecutive_unlocked_weave_found = false

	for i = 1, num_entries, 1 do
		local template = weave_templates[i]
		local weave_completed = LevelUnlockUtils.weave_unlocked(statistics_db, stats_id, template.name, ignore_dlc_check)

		if weave_completed or highest_consecutive_unlocked_weave == i then
			unlocked_weave_templates[i] = true

			if weave_completed and not highest_consecutive_unlocked_weave_found then
				if weave_templates[i + 1] then
					highest_consecutive_unlocked_weave = i + 1
				end
			else
				highest_consecutive_unlocked_weave_found = true
			end
		end
	end

	for i = num_entries, 1, -1 do
		if unlocked_weave_templates[i] and i ~= highest_consecutive_unlocked_weave then
			local template = weave_templates[i]
			local widget_definition = create_weave_entry_func(#self._weave_entry_widgets + 1, i, template, true)
			local widget = UIWidget.init(widget_definition)
			self._weave_entry_widgets[#self._weave_entry_widgets + 1] = widget
			self._weave_entry_widgets_by_name[template.name] = widget
		end
	end

	local template = weave_templates[highest_consecutive_unlocked_weave]
	local widget_definition = create_weave_entry_func(1, highest_consecutive_unlocked_weave, template, false, "next_weave")
	local widget = UIWidget.init(widget_definition)
	self._next_weave_widget = widget

	self:_setup_scrollbar()
end

StartGameWindowWeaveList._setup_scrollbar = function (self)
	local num_weave_widgets = #self._weave_entry_widgets
	self._total_scroll_height = num_weave_widgets * weave_entry_size[2] + (num_weave_widgets + 1) * weave_entry_spacing
	local scrollbar_widget = self._widgets_by_name.list_scrollbar
	local scenegraph_id = scrollbar_widget.scenegraph_id
	local scrollbar_size_y = self.ui_scenegraph[scenegraph_id].size[2]
	local percentage = math.min(scrollbar_size_y / self._total_scroll_height, 1)
	local scroll_bar_info = scrollbar_widget.content.scroll_bar_info
	scroll_bar_info.bar_height_percentage = percentage

	self:_set_scrollbar_value(0)

	local list_window_size = scenegraph_definition.list_window.size

	if list_window_size[2] < self._total_scroll_height then
		local total_entry_height = num_weave_widgets * weave_entry_size[2]
		local entry_height = weave_entry_size[2]
		local scroll_amount = math.max(entry_height / total_entry_height, 0)
		scroll_bar_info.scroll_amount = scroll_amount
	else
		scroll_bar_info.scroll_amount = 0
	end
end

StartGameWindowWeaveList._next_weave_widget_pressed = function (self)
	local next_weave_widget_content = self._next_weave_widget.content
	local hotspot = next_weave_widget_content.button_hotspot

	if hotspot and hotspot.on_release then
		hotspot.on_release = false

		return self._next_weave_widget
	end
end

StartGameWindowWeaveList._next_weave_widget_hover_enter = function (self)
	local next_weave_widget_content = self._next_weave_widget.content
	local hotspot = next_weave_widget_content.button_hotspot

	if hotspot and hotspot.on_hover_enter then
		hotspot.on_hover_enter = false

		return self._next_weave_widget
	end
end

StartGameWindowWeaveList._weave_widget_pressed = function (self)
	local widgets = self._weave_entry_widgets

	for idx, widget in pairs(widgets) do
		local content = widget.content

		if content then
			local hotspot = content.button_hotspot

			if hotspot and hotspot.on_release then
				hotspot.on_release = false

				return widget
			end
		end
	end
end

StartGameWindowWeaveList._weave_widget_hover_enter = function (self)
	local widgets = self._weave_entry_widgets

	for idx, widget in pairs(widgets) do
		local content = widget.content

		if content then
			local hotspot = content.button_hotspot

			if hotspot and hotspot.on_hover_enter then
				hotspot.on_hover_enter = false

				return widget
			end
		end
	end
end

StartGameWindowWeaveList._update_mouse_scroll_input = function (self)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.list_scrollbar
	local scroll_bar_info = widget.content.scroll_bar_info

	if scroll_bar_info.on_pressed then
		scroll_bar_info.scroll_add = nil
	end

	local mouse_scroll_value = scroll_bar_info.scroll_value

	if not mouse_scroll_value then
		return
	end

	local scroll_bar_value = scroll_bar_info.value
	local current_scroll_value = self._scroll_value

	if current_scroll_value ~= mouse_scroll_value then
		self:_set_scrollbar_value(mouse_scroll_value)
	elseif current_scroll_value ~= scroll_bar_value then
		self:_set_scrollbar_value(scroll_bar_value)
	end
end

StartGameWindowWeaveList._set_scrollbar_value = function (self, value)
	local current_scroll_value = self._scroll_value

	if value then
		local widgets_by_name = self._widgets_by_name
		local widget = widgets_by_name.list_scrollbar
		local widget_scroll_bar_info = widget.content.scroll_bar_info
		widget_scroll_bar_info.value = value
		widget_scroll_bar_info.scroll_value = value
		local scenegraph_node = self.ui_scenegraph.list_anchor
		local scenegraph_pos = scenegraph_node.local_position
		local list_window_size = scenegraph_definition.list_window.size
		scenegraph_pos[2] = math.floor((self._total_scroll_height - list_window_size[2]) * value)
		self._scroll_value = value
	end
end

StartGameWindowWeaveList._animate_list_entries = function (self, list_hovered, dt)
	local widgets = self._weave_entry_widgets

	for _, widget in pairs(widgets) do
		local content = widget.content
		local style = widget.style

		if content then
			self:_animate_list_entry(content, style, dt, list_hovered)
		end
	end

	local content = self._next_weave_widget.content
	local style = self._next_weave_widget.style

	self:_animate_list_entry(content, style, dt, true)
end

StartGameWindowWeaveList._animate_list_entry = function (self, content, style, dt, optional_hover)
	local mouse_active = Managers.input:is_device_active("mouse")
	local hotspot = content.button_hotspot or content.hotspot
	local is_hover = (hotspot.is_hover or not mouse_active) and hotspot.has_focus
	local is_selected = hotspot.is_selected
	local on_hover_enter = hotspot.on_hover_enter

	if mouse_active and optional_hover ~= nil and not optional_hover then
		is_hover = false
		on_hover_enter = false
	end

	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local input_progress = hotspot.input_progress or 0
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 14
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
	local hover_alpha = 255 * hover_progress
	local combined_alpha = 255 * combined_progress
	style.hover_frame.color[1] = hover_alpha
	style.symbol_bg_glow.color[1] = 64 + 64 * combined_progress
	style.wind_symbol.color[1] = 70 + 185 * combined_progress
	style.background_effect.color[1] = 255 * selection_progress
	local size_increase = 20
	local symbol_frame_selected = style.symbol_frame_selected
	local symbol_frame_selected_size = symbol_frame_selected.texture_size
	local symbol_frame_selected_default_size = symbol_frame_selected.default_size
	local symbol_frame_selected_offset = symbol_frame_selected.offset
	local symbol_frame_selected_default_offset = symbol_frame_selected.default_offset
	symbol_frame_selected_size[1] = symbol_frame_selected_default_size[1] - size_increase + size_increase * selection_progress
	symbol_frame_selected_size[2] = symbol_frame_selected_default_size[2] - size_increase + size_increase * selection_progress
	symbol_frame_selected_offset[1] = (symbol_frame_selected_default_offset[1] + size_increase / 2) - size_increase / 2 * selection_progress
	local symbol_frame_selected_glow = style.symbol_frame_selected_glow
	local symbol_frame_selected_glow_size = symbol_frame_selected_glow.texture_size
	local symbol_frame_selected_glow_default_size = symbol_frame_selected_glow.default_size
	local symbol_frame_selected_glow_offset = symbol_frame_selected_glow.offset
	local symbol_frame_selected_glow_default_offset = symbol_frame_selected_glow.default_offset
	local size_increase = 20
	symbol_frame_selected_glow_size[1] = symbol_frame_selected_glow_default_size[1] - size_increase + size_increase * selection_progress
	symbol_frame_selected_glow_size[2] = symbol_frame_selected_glow_default_size[2] - size_increase + size_increase * selection_progress
	symbol_frame_selected_glow_offset[1] = (symbol_frame_selected_glow_default_offset[1] + size_increase / 2) - size_increase / 2 * selection_progress
	local level_name_text_style = style.level_name
	local level_name_text_color = level_name_text_style.text_color
	local level_name_default_text_color = level_name_text_style.default_text_color
	local level_name_select_text_color = level_name_text_style.select_text_color

	Colors.lerp_color_tables(level_name_default_text_color, level_name_select_text_color, combined_progress, level_name_text_color)

	local title_text_style = style.title
	local title_text_color = title_text_style.text_color
	local title_default_text_color = title_text_style.default_text_color
	local title_select_text_color = title_text_style.select_text_color

	Colors.lerp_color_tables(title_default_text_color, title_select_text_color, combined_progress, title_text_color)

	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

return
