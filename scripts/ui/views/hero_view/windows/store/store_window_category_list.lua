local definitions = local_require("scripts/ui/views/hero_view/windows/store/definitions/store_window_category_list_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions

local function sort_categories_by_order(category_1, category_2)
	local category_1_order = category_1.sort_order or math.huge
	local category_2_order = category_2.sort_order or math.huge

	return category_1_order < category_2_order
end

local LIST_SPACING = 10
local LIST_MAX_WIDTH = 800
StoreWindowCategoryList = class(StoreWindowCategoryList)
StoreWindowCategoryList.NAME = "StoreWindowCategoryList"

StoreWindowCategoryList.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate StoreWindowCategoryList")

	self._params = params
	self._parent = params.parent
	local ui_renderer, ui_top_renderer = self._parent:get_renderers()
	self._ui_renderer = ui_renderer
	self._ui_top_renderer = ui_top_renderer
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._layout_settings = params.layout_settings
	self._animations = {}
	self._ui_animations = {}

	self:_create_ui_elements(params, offset)
	self:_start_transition_animation("on_enter")
	self._parent:set_list_details_visibility(true)
	self._parent:set_list_details_length(680, 0.3)
end

StoreWindowCategoryList._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings
	}
	local widgets = {
		widgets_by_name = self._widgets_by_name,
		list_widgets = self._list_widgets
	}
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

StoreWindowCategoryList._create_ui_elements = function (self, params, offset)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_top_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
	local scrollbar_widget = self._widgets_by_name.list_scrollbar
	self._scrollbar_logic = ScrollBarLogic:new(scrollbar_widget)

	self:_setup_list_elements()
end

StoreWindowCategoryList.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate StoreWindowCategoryList")

	self._ui_animator = nil
end

StoreWindowCategoryList.update = function (self, dt, t)
	self:_update_animations(dt)
	self:_draw(dt)
end

StoreWindowCategoryList.post_update = function (self, dt, t)
	if self._list_initialized then
		self:_handle_input(dt, t)
		self:_handle_gamepad_activity()
		self:_update_gamepad_focus()
	end
end

StoreWindowCategoryList._update_animations = function (self, dt)
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

	if self._list_initialized then
		self:_animate_list_entries(dt)
	end
end

StoreWindowCategoryList._is_list_hovered = function (self)
	local list_mask = self._widgets_by_name.list

	return list_mask.content.list_hotspot.is_hover or false
end

StoreWindowCategoryList._handle_input = function (self, dt, t)
	local parent = self._parent
	local widgets_by_name = self._widgets_by_name
	local input_service = self._parent:window_input_service()

	if self._list_initialized then
		if self:_is_list_hovered() then
			local list_index = self:_list_index_pressed()

			if list_index then
				self:_on_list_index_pressed(list_index)
			end
		end

		if self._gamepad_active_last_frame then
			local confirm_press = input_service:get("confirm_press")

			if confirm_press then
				if self._selected_gamepad_grid_index then
					self:_on_list_index_pressed(self._selected_gamepad_grid_index)
				end
			else
				self:_handle_gamepad_grid_selection(input_service)
			end
		end

		self._scrollbar_logic:update(dt, t)
		self:_update_scroll_position()
	end
end

StoreWindowCategoryList._draw = function (self, dt)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	if self._list_initialized then
		local list_widgets = self._list_widgets

		if list_widgets then
			local render_all = self:_update_visible_list_entries()

			for _, widget in ipairs(list_widgets) do
				if render_all or widget.content.visible then
					UIRenderer.draw_widget(ui_top_renderer, widget)
				end
			end
		end
	end

	UIRenderer.end_pass(ui_top_renderer)
end

StoreWindowCategoryList._play_sound = function (self, event)
	self._parent:play_sound(event)
end

StoreWindowCategoryList._update_gamepad_focus = function (self)
	local params = self._params
	local category_focused = params.category_focused

	if category_focused ~= self._category_focused then
		self._category_focused = category_focused

		if category_focused then
			if self._gamepad_active_last_frame then
				self:_on_list_index_selected(1)
			end
		else
			self:_on_list_index_selected(nil)
		end
	end
end

StoreWindowCategoryList._handle_gamepad_activity = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local force_update = self._gamepad_active_last_frame == nil

	if gamepad_active then
		if not self._gamepad_active_last_frame or force_update then
			self._gamepad_active_last_frame = true
			self._params.category_focused = true
		end
	elseif self._gamepad_active_last_frame or force_update then
		self._gamepad_active_last_frame = false
		self._params.category_focused = nil
	end
end

StoreWindowCategoryList._get_items_by_filter = function (self, item_filter)
	local backend_store = Managers.backend:get_interface("peddler")
	local items = backend_store:get_filtered_items(item_filter)

	return items
end

StoreWindowCategoryList._get_all_items = function (self)
	local backend_store = Managers.backend:get_interface("peddler")
	local items = backend_store:get_peddler_stock()

	return items
end

StoreWindowCategoryList._get_items_by_path = function (self, path)
	local item_filter = ""
	local added_filters = 0
	local pages = StoreLayoutConfig.pages

	for index, path_name in ipairs(path) do
		local page = pages[path_name]

		if page.item_filter then
			if added_filters > 0 then
				item_filter = item_filter .. " and "
			end

			item_filter = item_filter .. page.item_filter
			added_filters = added_filters + 1
		end
	end

	local items = nil

	if added_filters > 0 then
		items = self:_get_items_by_filter(item_filter)
	else
		items = self:_get_all_items()
	end

	return items
end

StoreWindowCategoryList._populate_list = function (self, layout)
	local widgets = {}
	local scenegraph_id = "item_root"
	local masked = true
	local size = {
		550,
		80
	}
	local definition = UIWidgets.create_store_category_entry_definition(scenegraph_id, size, masked)
	local backend_items = Managers.backend:get_interface("items")
	local item_rarity_textures = UISettings.item_rarity_textures
	local parent = self._parent
	local current_store_path = parent:get_store_path()

	for i, entry in ipairs(layout) do
		local widget = UIWidget.init(definition)
		widgets[i] = widget
		local content = widget.content
		local style = widget.style
		local display_name = entry.display_name
		local title = Localize(display_name)
		content.title = title
		local category_texture = entry.category_texture
		content.category_texture = category_texture

		if category_texture then
			local category_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(category_texture)
			local category_texture_default_size = category_texture_settings.size
			local category_texture_style = style.category_texture
			local category_texture_size = category_texture_style.texture_size
			category_texture_size[1] = category_texture_default_size[1]
			category_texture_size[2] = category_texture_default_size[2]
		end

		local path = table.clone(current_store_path)
		local num_path_entries = #path
		local page_name = entry.page_name
		path[num_path_entries + 1] = page_name
	end

	self._list_widgets = widgets

	self:_align_entry_widgets()
	self:_initialize_scrollbar()
end

StoreWindowCategoryList._align_entry_widgets = function (self)
	local total_height = 0
	local widget_position_x = 0
	local widget_position_y = LIST_SPACING
	local row = 1
	local column = 1
	local gamepad_navigation = {}
	local widgets = self._list_widgets
	local num_widgets = #widgets

	for index, widget in ipairs(widgets) do
		local offset = widget.offset
		local content = widget.content
		local size = content.size
		local width = size[1]
		local height = size[2]
		local change_row = LIST_MAX_WIDTH < widget_position_x + width

		if index == 1 then
			widget_position_y = -height
		end

		if change_row then
			column = 1
			row = row + 1
			widget_position_x = 0
			widget_position_y = widget_position_y - (height + LIST_SPACING)
		end

		offset[1] = widget_position_x
		offset[2] = widget_position_y
		widget.default_offset = table.clone(offset)
		content.row = row
		content.column = column
		widget_position_x = widget_position_x + width + LIST_SPACING

		if index == num_widgets then
			total_height = math.abs(widget_position_y)
		end

		if not gamepad_navigation[row] then
			gamepad_navigation[row] = {}
		end

		gamepad_navigation[row][column] = index
		column = column + 1
	end

	self._gamepad_navigation = gamepad_navigation
	self._total_list_height = total_height
end

StoreWindowCategoryList._list_index_pressed = function (self)
	local list_widgets = self._list_widgets

	if list_widgets then
		for index, widget in ipairs(list_widgets) do
			local content = widget.content
			local hotspot = content.hotspot or content.button_hotspot

			if hotspot and hotspot.on_release then
				hotspot.on_release = false

				return index
			end
		end
	end
end

StoreWindowCategoryList._animate_list_entries = function (self, dt)
	local parent = self._parent
	local list_hovered = self:_is_list_hovered()
	local list_widgets = self._list_widgets

	if self._gamepad_active_last_frame then
		list_hovered = true
	end

	for _, widget in ipairs(list_widgets) do
		local content = widget.content
		local style = widget.style
		local hotspot = content.button_hotspot or content.hotspot

		if hotspot.on_hover_enter then
			self:_play_sound("Play_hud_store_button_hover")

			hotspot.on_hover_enter = false
		end

		self:_animate_list_entry(content, style, dt, list_hovered)
	end
end

StoreWindowCategoryList._animate_list_entry = function (self, content, style, dt, list_hovered)
	local hotspot = content.button_hotspot or content.hotspot
	local on_hover_enter = list_hovered and hotspot.on_hover_enter
	local is_hover = list_hovered and hotspot.is_hover
	local is_selected = hotspot.is_selected
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local input_progress = hotspot.input_progress or 0
	local hover_progress = hotspot.hover_progress or 0
	local pulse_progress = hotspot.pulse_progress or 1
	local selection_progress = hotspot.selection_progress or 0
	local speed = ((is_hover or is_selected) and 14) or 3
	local pulse_speed = 3
	local input_speed = 20

	if input_pressed then
		input_progress = math.min(input_progress + dt * input_speed, 1)
	else
		input_progress = math.max(input_progress - dt * input_speed, 0)
	end

	local input_easing_out_progress = math.easeOutCubic(input_progress)
	local input_easing_in_progress = math.easeInCubic(input_progress)

	if on_hover_enter then
		pulse_progress = 0
	end

	pulse_progress = math.min(pulse_progress + dt * pulse_speed, 1)
	local pulse_easing_out_progress = math.easeOutCubic(pulse_progress)
	local pulse_easing_in_progress = math.easeInCubic(pulse_progress)

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
	style.hover_frame.color[1] = hover_alpha
	local category_texture_alpha = 100 + 155 * combined_progress
	style.category_texture.color[1] = category_texture_alpha
	local pulse_alpha = 255 - 255 * pulse_progress
	style.pulse_frame.color[1] = pulse_alpha
	local title_text_style = style.title
	local title_text_color = title_text_style.text_color
	local title_default_text_color = title_text_style.default_text_color
	local title_select_text_color = title_text_style.select_text_color

	Colors.lerp_color_tables(title_default_text_color, title_select_text_color, combined_progress, title_text_color)

	hotspot.pulse_progress = pulse_progress
	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

StoreWindowCategoryList._setup_list_elements = function (self)
	local parent = self._parent
	local path = parent:get_store_path()
	local path_structure = StoreLayoutConfig.structure

	for _, path_name in pairs(path) do
		path_structure = path_structure[path_name]
	end

	local categories = {}
	local pages = StoreLayoutConfig.pages

	for page_name, _ in pairs(path_structure) do
		local page = pages[page_name]
		local entry = {
			display_name = page.display_name,
			page_name = page_name,
			sort_order = page.sort_order,
			category_texture = page.category_button_texture
		}
		categories[#categories + 1] = entry
	end

	table.sort(categories, sort_categories_by_order)
	self:_populate_list(categories)

	self._layout = categories
	self._list_initialized = true
end

StoreWindowCategoryList._on_list_index_pressed = function (self, index)
	local layout = self._layout
	local entry = layout[index]
	local page_name = entry.page_name
	local parent = self._parent
	local path = parent:get_store_path()
	local new_path = table.clone(path)
	new_path[#new_path + 1] = page_name

	parent:go_to_store_path(new_path)
end

StoreWindowCategoryList._on_list_index_selected = function (self, index, scrollbar_animation_percentage)
	local layout = self._layout
	local entry = layout[index]
	self._params.selected_product = entry
	local row, column = nil
	local list_widgets = self._list_widgets

	if list_widgets then
		for i, widget in ipairs(list_widgets) do
			local content = widget.content
			local hotspot = content.hotspot or content.button_hotspot

			if hotspot then
				local is_selected = i == index
				hotspot.is_selected = is_selected

				if is_selected then
					row = content.row
					column = content.column
					hotspot.on_hover_enter = true
				end
			end
		end
	end

	self._previous_gamepad_grid_index = self._selected_gamepad_grid_index
	self._previous_gamepad_grid_row = self._selected_gamepad_grid_row
	self._previous_gamepad_grid_column = self._selected_gamepad_grid_column
	self._selected_gamepad_grid_index = index
	self._selected_gamepad_grid_row = row
	self._selected_gamepad_grid_column = column

	if scrollbar_animation_percentage then
		local scrollbar_widget = self._widgets_by_name.list_scrollbar
		local scroll_bar_info = scrollbar_widget.content.scroll_bar_info
		local func = UIAnimation.function_by_time
		local target = scroll_bar_info
		local target_index = "scroll_value"
		local from = scroll_bar_info.scroll_value
		local to = scrollbar_animation_percentage
		local duration = 0.3
		local easing = math.easeOutCubic
		self._ui_animations.scrollbar = UIAnimation.init(func, target, target_index, from, to, duration, easing)
	else
		self._ui_animations.scrollbar = nil
	end
end

StoreWindowCategoryList._handle_gamepad_grid_selection = function (self, input_service)
	local current_index = self._selected_gamepad_grid_index

	if not current_index then
		return
	end

	local gamepad_navigation = self._gamepad_navigation
	local num_rows = #gamepad_navigation
	local current_selected_grid_index = self._selected_gamepad_grid_index
	local current_selected_row = self._selected_gamepad_grid_row
	local current_selected_column = self._selected_gamepad_grid_column
	local columns_on_row = gamepad_navigation[current_selected_row]
	local num_columns_on_row = #columns_on_row
	local new_row, new_index = nil

	if input_service:get("move_left_hold_continuous") then
		if current_selected_column > 1 then
			new_index = columns_on_row[current_selected_column - 1]
		end
	elseif input_service:get("move_right_hold_continuous") then
		self._params.category_focused = false
	elseif input_service:get("move_up_hold_continuous") then
		new_row = math.max(current_selected_row - 1, 1)
	elseif input_service:get("move_down_hold_continuous") then
		new_row = math.min(current_selected_row + 1, num_rows)
	end

	if new_row and new_row ~= current_selected_row then
		local columns = gamepad_navigation[new_row]
		new_index = self:_find_closest_neighbour(columns, current_selected_grid_index, 1)
	end

	if new_index then
		local scroll_percentage = self:_get_scrollbar_percentage_by_index(new_index)

		self:_on_list_index_selected(new_index, scroll_percentage)
	end
end

StoreWindowCategoryList._find_closest_neighbour = function (self, column_index_list, current_index)
	local list_widgets = self._list_widgets
	local current_widget = list_widgets[current_index]
	local current_widget_content = current_widget.content
	local current_widget_size = current_widget_content.size
	local current_widget_offset = current_widget.offset
	local current_coordinate_x = current_widget_size[1] * 0.5 + current_widget_offset[1]
	local shortest_distance = math.huge
	local closest_index = nil

	for _, layout_index in pairs(column_index_list) do
		local widget = list_widgets[layout_index]
		local offset = widget.offset
		local content = widget.content
		local size = content.size
		local coordinate_x = size[1] * 0.5 + offset[1]
		local distance = math.abs(coordinate_x - current_coordinate_x)

		if distance < shortest_distance then
			shortest_distance = distance
			closest_index = layout_index
		end
	end

	if closest_index then
		return closest_index
	end
end

StoreWindowCategoryList._initialize_scrollbar = function (self)
	local list_window_size = scenegraph_definition.list_window.size
	local list_scrollbar_size = scenegraph_definition.list_scrollbar.size
	local draw_length = list_window_size[2]
	local content_length = self._total_list_height
	local scrollbar_length = list_scrollbar_size[2]
	local step_size = 80
	local scroll_step_multiplier = 1
	local scrollbar_logic = self._scrollbar_logic

	scrollbar_logic:set_scrollbar_values(draw_length, content_length, scrollbar_length, step_size, scroll_step_multiplier)
	scrollbar_logic:set_scroll_percentage(0)
end

StoreWindowCategoryList._update_scroll_position = function (self)
	local scrollbar_logic = self._scrollbar_logic
	local length = scrollbar_logic:get_scrolled_length()

	if length ~= self._scrolled_length then
		self._ui_scenegraph.list.local_position[2] = length
		self._scrolled_length = length
	end
end

StoreWindowCategoryList._update_visible_list_entries = function (self)
	local scrollbar_logic = self._scrollbar_logic
	local enabled = scrollbar_logic:enabled()

	if not enabled then
		return true
	end

	local scroll_percentage = scrollbar_logic:get_scroll_percentage()
	local scrolled_length = scrollbar_logic:get_scrolled_length()
	local scroll_length = scrollbar_logic:get_scroll_length()
	local list_window_size = scenegraph_definition.list_window.size
	local draw_padding = LIST_SPACING * 2
	local draw_length = list_window_size[2] + draw_padding
	local widgets = self._list_widgets
	local num_widgets = #widgets

	for index, widget in ipairs(widgets) do
		local offset = widget.offset
		local content = widget.content
		local size = content.size
		local widget_position = math.abs(offset[2])
		local is_outside = false

		if widget_position < scrolled_length - draw_padding then
			is_outside = true
		elseif draw_length < math.abs(offset[2] + size[2]) - scrolled_length then
			is_outside = true
		end

		content.visible = not is_outside
	end
end

StoreWindowCategoryList._scroll_to_list_index = function (self, index)
	local scrollbar_logic = self._scrollbar_logic
	local enabled = scrollbar_logic:enabled()

	if enabled then
		local scroll_percentage = scrollbar_logic:get_scroll_percentage()
		local scrolled_length = scrollbar_logic:get_scrolled_length()
		local scroll_length = scrollbar_logic:get_scroll_length()
		local list_window_size = scenegraph_definition.list_window.size
		local draw_length = list_window_size[2]
		local draw_start_height = scrolled_length
		local draw_end_height = draw_start_height + draw_length
		local list_widgets = self._list_widgets

		if list_widgets then
			local widget = list_widgets[index]
			local content = widget.content
			local offset = widget.offset
			local size = content.size
			local height = size[2]
			local start_position_top = math.abs(offset[2])
			local start_position_bottom = start_position_top + height
			local percentage_difference = nil

			if draw_end_height < start_position_bottom then
				local height_missing = start_position_bottom - draw_end_height
				percentage_difference = math.clamp(height_missing / scroll_length, 0, 1)
			elseif start_position_top < draw_start_height then
				local height_missing = draw_start_height - start_position_top
				percentage_difference = -math.clamp(height_missing / scroll_length, 0, 1)
			end

			if percentage_difference then
				local scroll_percentage = math.clamp(scroll_percentage + percentage_difference, 0, 1)

				scrollbar_logic:set_scroll_percentage(scroll_percentage)
			end
		end
	end
end

StoreWindowCategoryList._get_scrollbar_percentage_by_index = function (self, index)
	local scrollbar_logic = self._scrollbar_logic
	local enabled = scrollbar_logic:enabled()

	if enabled then
		local scroll_percentage = scrollbar_logic:get_scroll_percentage()
		local scrolled_length = scrollbar_logic:get_scrolled_length()
		local scroll_length = scrollbar_logic:get_scroll_length()
		local list_window_size = scenegraph_definition.list_window.size
		local draw_length = list_window_size[2]
		local draw_start_height = scrolled_length
		local draw_end_height = draw_start_height + draw_length
		local list_widgets = self._list_widgets

		if list_widgets then
			local widget = list_widgets[index]
			local content = widget.content
			local offset = widget.offset
			local size = content.size
			local height = size[2]
			local start_position_top = math.abs(offset[2] + height)
			local start_position_bottom = start_position_top + height
			local percentage_difference = 0

			if draw_end_height < start_position_bottom then
				local height_missing = start_position_bottom - draw_end_height
				percentage_difference = math.clamp(height_missing / scroll_length, 0, 1)
			elseif start_position_top < draw_start_height then
				local height_missing = draw_start_height - start_position_top
				percentage_difference = -math.clamp(height_missing / scroll_length, 0, 1)
			end

			if percentage_difference then
				local scroll_percentage = math.clamp(scroll_percentage + percentage_difference, 0, 1)

				return scroll_percentage
			end
		end
	end

	return 0
end

return
