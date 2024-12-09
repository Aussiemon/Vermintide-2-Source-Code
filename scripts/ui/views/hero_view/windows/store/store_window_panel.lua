-- chunkname: @scripts/ui/views/hero_view/windows/store/store_window_panel.lua

local definitions = local_require("scripts/ui/views/hero_view/windows/store/definitions/store_window_panel_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local INPUT_ACTION_NEXT = "cycle_next"
local INPUT_ACTION_PREVIOUS = "cycle_previous"

StoreWindowPanel = class(StoreWindowPanel)
StoreWindowPanel.NAME = "StoreWindowPanel"

StoreWindowPanel.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate StoreWindowPanel")

	self._params = params
	self._parent = params.parent

	local ui_renderer, ui_top_renderer = self._parent:get_renderers()

	self._ui_renderer = ui_renderer
	self._ui_top_renderer = ui_top_renderer
	self._layout_settings = params.layout_settings
	self._animations = {}
	self._ui_animations = {}
	self._currency_types = DLCSettings.store.currency_types
	self._currency_ui_settings = DLCSettings.store.currency_ui_settings
	self._currencies = {}

	self:_create_ui_elements(params, offset)
	self:_setup_input_buttons()
end

StoreWindowPanel._create_ui_elements = function (self, params, offset)
	local currency_types = self._currency_types
	local currency_ui_settings = self._currency_ui_settings
	local top_widget_definitions = {}

	for i = 1, #currency_types do
		local currency_type = currency_types[i]
		local scenegraph_node_name = "currency_node_" .. currency_type
		local scenegraph_node = {}

		scenegraph_node.parent = "panel"
		scenegraph_node.size = {
			200,
			70,
		}
		scenegraph_node.position = {
			-92 - 200 * (i - 1),
			0,
			20,
		}
		scenegraph_node.horizontal_alignment = "right"
		scenegraph_node.vertical_alignment = "bottom"
		scenegraph_definition[scenegraph_node_name] = scenegraph_node

		local currency_ui_setting = currency_ui_settings[currency_type]
		local background_ui_settings = currency_ui_setting.background_ui_settings

		top_widget_definitions["currency_panel_widget_" .. currency_type] = UIWidgets.create_store_panel_currency_widget(scenegraph_node_name, currency_ui_setting.frame, currency_ui_setting.icon_big, background_ui_settings.texture, background_ui_settings.size)
		top_widget_definitions["currency_text_tooltip_" .. currency_type] = UIWidgets.create_additional_option_tooltip(scenegraph_node_name, {
			200,
			70,
		}, {
			"weave_progression_slot_titles",
		}, {
			title = Localize(currency_ui_setting.tooltip_title),
			description = Localize(currency_ui_setting.tooltip_description),
			input = Localize(currency_ui_setting.tooltip_input),
		}, 400, "right", "bottom", true, {
			0,
			-22,
			0,
		})
	end

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(widget_definitions)
	self._top_widgets, self._top_widgets_by_name = UIUtils.create_widgets(top_widget_definitions)

	local title_button_widgets = {}
	local layout_settings = self._layout_settings
	local window_layouts = layout_settings.window_layouts
	local pages = StoreLayoutConfig.pages
	local menu_options = StoreLayoutConfig.menu_options
	local scenegraph_id = "game_option"
	local size = scenegraph_definition[scenegraph_id].size
	local font_size = 28
	local optional_horizontal_alignment = "center"
	local temp_text_style = {
		dynamic_font_size = true,
		font_type = "hell_shark_header",
		localize = true,
		upper_case = true,
		word_wrap = false,
		font_size = font_size,
	}
	local tab_cat = self._parent.tab_cat

	ItemHelper.create_tab_unseen_item_stars(tab_cat)

	local in_sub_page = #self._parent:get_store_path() > 1
	local total_length = 0

	for index, page_name in ipairs(menu_options) do
		local page_settings = pages[page_name]
		local display_name = page_settings.display_name or "n/a"
		local text_width = self:_get_text_width(temp_text_style, display_name)
		local option_size = {
			math.min(text_width + 40, 400),
			size[2],
		}
		local optional_offset = {
			total_length,
			0,
			0,
		}
		local widget_definition = UIWidgets.create_store_panel_button(scenegraph_id, option_size, display_name, font_size, optional_offset, optional_horizontal_alignment)

		total_length = total_length + option_size[1]

		local widget = UIWidget.init(widget_definition)

		self:_set_text_button_size(widget, option_size[1])

		local content = widget.content

		content.page_name = page_name

		if tab_cat[page_name] > 0 then
			content.new = true
		end

		title_button_widgets[#title_button_widgets + 1] = widget
	end

	self.tab_cat = tab_cat
	self._ui_scenegraph.panel_entry_area.size[1] = total_length
	self._title_button_widgets = title_button_widgets

	local mark_all_seen_button = self._widgets_by_name.mark_all_seen_button

	mark_all_seen_button.content.new = true
	mark_all_seen_button.style.new_marker.offset = {
		-80,
		8,
		10,
	}

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self._ui_scenegraph.window.local_position

		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StoreWindowPanel.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate StoreWindowPanel")

	self._ui_animator = nil
end

StoreWindowPanel.update = function (self, dt, t)
	self:_handle_gamepad_activity()
	self:_handle_back_button_visibility()
	self:_sync_player_wallet()
	self:_sync_wallet_matchmaking_location()
	self:_update_selected_option()
	self:_update_animations(dt)
	self:_draw(dt)
end

StoreWindowPanel.post_update = function (self, dt, t)
	self:_handle_input(dt, t)
end

StoreWindowPanel._update_animations = function (self, dt)
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

	local tab_cat = self._parent.tab_cat
	local title_button_widgets = self._title_button_widgets
	local sum_unseen = 0

	for i, widget in ipairs(title_button_widgets) do
		self:_animate_title_entry(widget, dt)

		local content = widget.content
		local page_name = content.page_name
		local page_settings = StoreLayoutConfig.pages[page_name]
		local rotation_timestamp = page_settings.rotation_timestamp

		content.timer = rotation_timestamp and rotation_timestamp > os.time()

		local num_unseen = tab_cat[page_name]

		content.new = num_unseen > 0
		sum_unseen = sum_unseen + num_unseen
	end

	local gamepad_active = Managers.input:is_device_active("gamepad")
	local mark_all_seen_button = self._widgets_by_name.mark_all_seen_button
	local mark_all_shown = sum_unseen > 0

	mark_all_seen_button.content.visible = not gamepad_active and mark_all_shown
	mark_all_seen_button.content.enabled = not gamepad_active and mark_all_shown

	local widgets_by_name = self._widgets_by_name
	local back_button = widgets_by_name.back_button
	local close_button = widgets_by_name.close_button

	self:_animate_back_button(back_button, dt)
	self:_animate_back_button(close_button, dt)
	self:_update_panel_selection_animation(dt)
end

StoreWindowPanel._is_stepper_button_pressed = function (self, widget)
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

StoreWindowPanel._handle_input = function (self, dt, t)
	local parent = self._parent
	local widgets_by_name = self._widgets_by_name
	local input_service = self._parent:window_input_service()
	local input_made = false
	local close_button = widgets_by_name.close_button
	local back_button = widgets_by_name.back_button
	local mark_all_seen_button = widgets_by_name.mark_all_seen_button

	if UIUtils.is_button_hover_enter(back_button) or UIUtils.is_button_hover_enter(close_button) then
		self:_play_sound("Play_hud_hover")
	end

	if not input_made and UIUtils.is_button_pressed(close_button) then
		parent:close_menu()

		input_made = true
	end

	if not input_made and UIUtils.is_button_pressed(mark_all_seen_button) then
		mark_all_seen_button.content.new = false

		ItemHelper.set_all_shop_item_seen(self._parent.tab_cat)

		input_made = true
	end

	local path = parent:get_store_path()
	local path_length = #path
	local title_button_widgets = self._title_button_widgets
	local num_title_button_widgets = #title_button_widgets

	for i, widget in ipairs(title_button_widgets) do
		local is_selected = widget.content.button_hotspot.is_selected

		if not is_selected or path_length > 1 then
			if UIUtils.is_button_hover_enter(widget) then
				self:_play_sound("Play_hud_store_button_hover_category")
			end

			if UIUtils.is_button_pressed(widget) then
				self:_on_panel_button_selected(i)

				input_made = true
			end
		end
	end

	if not input_made then
		local current_index = self._selected_index or 1
		local max_index = #title_button_widgets

		if input_service:get(INPUT_ACTION_PREVIOUS) then
			local next_index = current_index > 1 and current_index - 1 or max_index

			self:_on_panel_button_selected(next_index)
		elseif input_service:get(INPUT_ACTION_NEXT) then
			local next_index = current_index % max_index + 1

			self:_on_panel_button_selected(next_index)
		end
	end
end

StoreWindowPanel._on_panel_button_selected = function (self, index)
	local parent = self._parent
	local widget = self._title_button_widgets[index]
	local page_name = widget.content.page_name
	local path = {
		page_name,
	}

	parent:go_to_store_path(path)
end

StoreWindowPanel._set_selected_option = function (self, index)
	self:_start_panel_selection_animation(self._selected_index, index)

	local title_button_widgets = self._title_button_widgets

	for i, widget in ipairs(title_button_widgets) do
		widget.content.button_hotspot.is_selected = i == index
	end
end

StoreWindowPanel._update_selected_option = function (self)
	local parent = self._parent
	local path = parent:get_store_path()

	if path then
		local root_page = path[1]
		local title_button_widgets = self._title_button_widgets

		for i, widget in ipairs(title_button_widgets) do
			local page_name = widget.content.page_name

			if page_name == root_page and i ~= self._selected_index then
				self:_set_selected_option(i)

				self._selected_index = i
			end
		end
	end
end

StoreWindowPanel._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()
	local render_settings = self._render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)
	UIRenderer.draw_all_widgets(ui_renderer, self._widgets)
	UIRenderer.draw_all_widgets(ui_renderer, self._title_button_widgets)
	UIRenderer.end_pass(ui_renderer)
	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)
	UIRenderer.draw_all_widgets(ui_top_renderer, self._top_widgets)
	UIRenderer.end_pass(ui_top_renderer)
end

StoreWindowPanel._play_sound = function (self, event)
	return self._parent:play_sound(event)
end

StoreWindowPanel._setup_input_buttons = function (self)
	local force = true
	local input_service = self._parent:window_input_service(force)
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
		input_1_texture_data.size[2],
	}
	input_1_widget.content.texture_id = input_1_texture_data.texture

	local icon_style_input_2 = input_2_widget.style.texture_id

	icon_style_input_2.horizontal_alignment = "center"
	icon_style_input_2.vertical_alignment = "center"
	icon_style_input_2.texture_size = {
		input_2_texture_data.size[1],
		input_2_texture_data.size[2],
	}
	input_2_widget.content.texture_id = input_2_texture_data.texture
end

StoreWindowPanel._handle_back_button_visibility = function (self)
	if not self.gamepad_active_last_frame then
		local close_on_exit = self._parent:close_on_exit()
		local back_button = self._widgets_by_name.back_button
		local new_visibility = not close_on_exit

		back_button.content.visible = new_visibility
	end
end

StoreWindowPanel._reset_back_button = function (self)
	local back_button = self._widgets_by_name.back_button
	local hotspot = back_button.content.button_hotspot

	table.clear(hotspot)
end

StoreWindowPanel._handle_gamepad_activity = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local most_recent_device = Managers.input:get_most_recent_device()
	local force_update = self.gamepad_active_last_frame == nil or gamepad_active and most_recent_device ~= self._most_recent_device

	if gamepad_active then
		if not self.gamepad_active_last_frame or force_update then
			self.gamepad_active_last_frame = true

			local widgets_by_name = self._widgets_by_name

			widgets_by_name.panel_input_area_1.content.visible = true
			widgets_by_name.panel_input_area_2.content.visible = true
			widgets_by_name.back_button.content.visible = false
			widgets_by_name.close_button.content.visible = false

			self:_setup_input_buttons()
		end
	elseif self.gamepad_active_last_frame or force_update then
		self.gamepad_active_last_frame = false

		local widgets_by_name = self._widgets_by_name

		widgets_by_name.panel_input_area_1.content.visible = false
		widgets_by_name.panel_input_area_2.content.visible = false
		widgets_by_name.close_button.content.visible = true
	end

	self._most_recent_device = most_recent_device
end

StoreWindowPanel._set_text_button_size = function (self, widget, width)
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

StoreWindowPanel._get_text_width = function (self, text_style, text)
	if text_style.localize then
		text = Localize(text)
	end

	if text_style.upper_case then
		text = TextToUpper(text)
	end

	local ui_renderer = self._ui_renderer
	local font, scaled_font_size = UIFontByResolution(text_style)
	local text_width = UIRenderer.text_size(ui_renderer, text, font[1], scaled_font_size)

	return text_width
end

StoreWindowPanel._set_text_button_horizontal_position = function (self, widget, x_position)
	local offset = widget.offset

	offset[1] = x_position
end

StoreWindowPanel._animate_title_entry = function (self, widget, dt)
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

	input_progress = UIUtils.animate_value(input_progress, dt * input_speed, input_pressed)
	hover_progress = UIUtils.animate_value(hover_progress, dt * speed, is_hover)
	selection_progress = UIUtils.animate_value(selection_progress, dt * speed, is_selected)

	local hover_easing_out_progress = math.easeOutCubic(hover_progress)
	local hover_easing_in_progress = math.easeInCubic(hover_progress)
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

StoreWindowPanel._animate_back_button = function (self, widget, dt)
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

	input_progress = UIUtils.animate_value(input_progress, dt * input_speed, input_pressed)
	hover_progress = UIUtils.animate_value(hover_progress, dt * speed, is_hover)
	selection_progress = UIUtils.animate_value(selection_progress, dt * speed, is_selected)

	local hover_easing_out_progress = math.easeOutCubic(hover_progress)
	local hover_easing_in_progress = math.easeInCubic(hover_progress)
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

StoreWindowPanel._sync_wallet_matchmaking_location = function (self)
	local is_game_matchmaking = Managers.matchmaking:is_game_matchmaking()

	if is_game_matchmaking ~= self._is_game_matchmaking then
		self._is_game_matchmaking = is_game_matchmaking

		local ui_scenegraph = self._ui_scenegraph
		local offset_value = is_game_matchmaking and 26 or 0
		local currency_types = self._currency_types

		for i = 1, #currency_types do
			local currency_type = currency_types[i]
			local node_name = "currency_node_" .. currency_type

			ui_scenegraph[node_name].position[1] = scenegraph_definition[node_name].position[1] - offset_value
		end
	end
end

StoreWindowPanel._sync_player_wallet = function (self)
	local currency_types = self._currency_types
	local background_total_size = 0
	local dirty = false

	for i = 1, #currency_types do
		local currency_type = currency_types[i]
		local backend_store = Managers.backend:get_interface("peddler")
		local currency_amount = backend_store:get_chips(currency_type)

		if currency_amount ~= self._currencies[currency_type] then
			self._currencies[currency_type] = currency_amount
			dirty = true
		end
	end

	if dirty then
		for i = 1, #currency_types do
			local currency_type = currency_types[i]
			local currency_amount = self._currencies[currency_type]
			local top_widgets_by_name = self._top_widgets_by_name
			local widget = top_widgets_by_name["currency_panel_widget_" .. currency_type]
			local content = widget.content
			local style = widget.style
			local currency_settings = self._currency_ui_settings[currency_type]
			local currency_text = UIUtils.comma_value(tostring(currency_amount))

			if currency_settings.max_amount then
				currency_text = string.format("%s/{#size(20)}%s{#reset()}", currency_text, tostring(currency_settings.max_amount))
			end

			content.currency_text = currency_text

			local ui_renderer = self._ui_renderer
			local text_width = UIUtils.get_text_width(ui_renderer, style.currency_text, currency_text)
			local icon_width = style.currency_icon.texture_size[1]
			local text_spacing = 10
			local total_length = icon_width + text_width + text_spacing * 2
			local ui_scenegraph = self._ui_scenegraph
			local background_margin = 60
			local background_size = total_length + background_margin

			ui_scenegraph["currency_node_" .. currency_type].size[1] = background_size
			scenegraph_definition["currency_node_" .. currency_type].position[1] = -92 - background_total_size

			local is_game_matchmaking = Managers.matchmaking:is_game_matchmaking()
			local offset_value = is_game_matchmaking and 26 or 0

			ui_scenegraph["currency_node_" .. currency_type].position[1] = scenegraph_definition["currency_node_" .. currency_type].position[1] - offset_value
			background_total_size = background_total_size + background_size
		end
	end
end

StoreWindowPanel._start_panel_selection_animation = function (self, previous_selected_index, new_selected_index)
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

StoreWindowPanel._update_panel_selection_animation = function (self, dt)
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
	panel_selection_mask_size[1] = current_width * 1.5
	self._ui_scenegraph[panel_selection_scenegraph_id].size[1] = current_width

	local selection_offset = entry_panel_selection.offset

	selection_offset[1] = current_distance

	if duration == 0 then
		panel_selection_animation.duration = nil
	else
		panel_selection_animation.duration = duration
	end
end
