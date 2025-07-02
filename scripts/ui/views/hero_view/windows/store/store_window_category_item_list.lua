-- chunkname: @scripts/ui/views/hero_view/windows/store/store_window_category_item_list.lua

local definitions = local_require("scripts/ui/views/hero_view/windows/store/definitions/store_window_category_item_list_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local LIST_SPACING = 10
local LIST_MAX_WIDTH = 800

StoreWindowCategoryItemList = class(StoreWindowCategoryItemList)
StoreWindowCategoryItemList.NAME = "StoreWindowCategoryItemList"

StoreWindowCategoryItemList.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate StoreWindowCategoryItemList")

	self._params = params
	self._parent = params.parent

	local ui_renderer, ui_top_renderer = self._parent:get_renderers()

	self._ui_renderer = ui_renderer
	self._ui_top_renderer = ui_top_renderer
	self._render_settings = {
		alpha_multiplier = 0,
		list_alpha_multiplier = 0,
		snap_pixel_positions = true,
	}
	self._layout_settings = params.layout_settings
	self._animations = {}
	self._ui_animations = {}

	self:_create_ui_elements(params, offset)
	self:_start_transition_animation("on_enter")
end

StoreWindowCategoryItemList._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings,
	}
	local widgets = {
		widgets_by_name = self._widgets_by_name,
		list_widgets = self._list_widgets,
	}
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

StoreWindowCategoryItemList._create_ui_elements = function (self, params, offset)
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
end

StoreWindowCategoryItemList.on_exit = function (self, params, force_unload)
	print("[HeroViewWindow] Exit Substate StoreWindowCategoryItemList")

	self._ui_animator = nil

	self:_destroy_product_widgets(force_unload)
end

StoreWindowCategoryItemList.update = function (self, dt, t)
	local force_update = false

	if self:_sync_products_version() then
		force_update = self._selected_product ~= nil
	end

	self:_sync_layout_path(force_update)
	self:_update_animations(dt)
	self:_draw(dt)
end

StoreWindowCategoryItemList._sync_products_version = function (self)
	local parent = self._parent
	local products_version_id = parent:products_version_id()

	if products_version_id ~= self._products_version_id then
		self._products_version_id = products_version_id

		return true
	end

	return false
end

StoreWindowCategoryItemList.post_update = function (self, dt, t)
	if self._list_initialized then
		self:_handle_input(dt, t)
		self:_handle_gamepad_activity()
		self:_update_gamepad_focus()
	end
end

StoreWindowCategoryItemList._update_animations = function (self, dt)
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

StoreWindowCategoryItemList._is_list_hovered = function (self)
	local list_mask = self._widgets_by_name.list

	return list_mask.content.list_hotspot.is_hover or false
end

StoreWindowCategoryItemList._handle_input = function (self, dt, t)
	local parent = self._parent
	local widgets_by_name = self._widgets_by_name
	local input_service = self._parent:window_input_service()

	if self._list_initialized then
		if self:_is_list_hovered() then
			local list_index = self:_list_index_pressed()

			if list_index then
				self:_play_sound("Play_hud_store_button_select")
				self:_on_list_index_pressed(list_index)
			end
		end

		if self._gamepad_active_last_frame then
			local confirm_press = input_service:get("confirm_press")

			if confirm_press then
				local current_index = self._selected_gamepad_grid_index

				if current_index then
					self:_play_sound("Play_hud_store_button_select")
					self:_on_list_index_pressed(current_index)
				end
			else
				self:_handle_gamepad_grid_selection(input_service)
			end
		end

		self._scrollbar_logic:update(dt, t)
		self:_update_scroll_position()
	end
end

StoreWindowCategoryItemList._draw = function (self, dt)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()
	local render_settings = self._render_settings
	local alpha_multiplier = render_settings.alpha_multiplier or 0
	local list_alpha_multiplier = render_settings.list_alpha_multiplier or 0

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	render_settings.alpha_multiplier = alpha_multiplier

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	render_settings.alpha_multiplier = math.min(alpha_multiplier, list_alpha_multiplier)

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

	render_settings.alpha_multiplier = alpha_multiplier

	UIRenderer.end_pass(ui_top_renderer)
end

StoreWindowCategoryItemList._play_sound = function (self, event)
	self._parent:play_sound(event)
end

StoreWindowCategoryItemList._update_gamepad_focus = function (self)
	local params = self._params
	local category_focused = params.category_focused

	if category_focused ~= self._category_focused then
		self._category_focused = category_focused

		if category_focused then
			self:_on_list_index_selected(nil)
		elseif self._gamepad_active_last_frame then
			self:_on_list_index_selected(self._previous_gamepad_grid_index or 1)
		end
	end
end

StoreWindowCategoryItemList._handle_gamepad_activity = function (self)
	local mouse_active = Managers.input:is_device_active("mouse")
	local force_update = self._gamepad_active_last_frame == nil

	if not mouse_active then
		if not self._gamepad_active_last_frame or force_update then
			self._gamepad_active_last_frame = true
		end
	elseif self._gamepad_active_last_frame or force_update then
		self._gamepad_active_last_frame = false

		self:_on_list_index_selected(nil)
	end
end

StoreWindowCategoryItemList._list_index_pressed = function (self)
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

StoreWindowCategoryItemList._animate_list_entries = function (self, dt)
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

		parent:animate_store_product(widget, dt, list_hovered)
	end
end

StoreWindowCategoryItemList._get_items_by_filter = function (self, item_filter)
	local backend_store = Managers.backend:get_interface("peddler")
	local items = backend_store:get_filtered_items(item_filter)

	return items
end

StoreWindowCategoryItemList._get_all_items = function (self)
	local backend_store = Managers.backend:get_interface("peddler")
	local items = backend_store:get_peddler_stock()

	return items
end

StoreWindowCategoryItemList._update_item_list = function (self)
	self:_destroy_product_widgets()

	local parent = self._parent
	local path = parent:get_store_path()
	local pages = StoreLayoutConfig.pages
	local product_type = "item"
	local layout = {}
	local item_filter = StoreLayoutConfig.get_item_filter(path, callback(self._parent.get_temporary_page, self))
	local items = self:_get_items_by_filter(item_filter)
	local insert_index = 0

	for backend_id, item in pairs(items) do
		local bundle_item_data = item.data
		local bundle = bundle_item_data and bundle_item_data.bundle

		if bundle then
			for _, item_key in ipairs(bundle.BundledItems) do
				local bundled_item = ItemMasterList[item_key]
				local product = {
					item = bundled_item,
					type = bundled_item.item_type,
					product_item = item,
					product_id = bundle_item_data.key,
					sort_key = Localize(bundle_item_data.display_name),
					settings = {
						hide_new = true,
						hide_price = true,
						icon_size = bundle_item_data.icon_size,
					},
					page_name = bundle_item_data.display_name,
					page = {
						category_button_texture = "store_category_icon_pactsworn",
						exclusive_filter = true,
						hide_preview_details = true,
						layout = "item_list",
						sort_order = 5,
						sound_event_enter = "Play_hud_store_category_button",
						type = "collection_item",
						display_name = bundle_item_data.display_name,
						item_filter = "item_type == " .. bundle_item_data.item_type .. " and item_key == " .. bundle_item_data.key,
					},
				}

				layout[#layout + 1] = product
			end
		else
			local product = {
				item = item,
				type = product_type,
				product_id = item.key,
				sort_key = StoreLayoutConfig.make_sort_key(item),
			}

			insert_index = insert_index + 1
			layout[insert_index] = product
		end
	end

	table.sort(layout, StoreLayoutConfig.compare_sort_key)

	self._layout = layout

	self:_create_product_widgets(layout)

	local current_page_name = path[#path]
	local current_page = pages[current_page_name] or self._parent:get_temporary_page(current_page_name)
	local current_page_display_name = current_page.display_name

	self:_set_title_texts(Localize(current_page_display_name))

	self._previous_gamepad_grid_index = nil
	self._previous_gamepad_grid_row = nil
	self._previous_gamepad_grid_column = nil

	if not self._list_initialized then
		self:_start_transition_animation("on_item_list_initialized")
	else
		self:_start_transition_animation("on_item_list_updated")
	end

	self._list_initialized = true
end

StoreWindowCategoryItemList._set_title_texts = function (self, title_text)
	local widgets_by_name = self._widgets_by_name
	local title_widget = widgets_by_name.title_text

	title_widget.content.text = title_text
end

StoreWindowCategoryItemList._get_list_index_by_product_id = function (self, product_id)
	local layout = self._layout
	local list_index = 1

	for index, entry in ipairs(layout) do
		if entry.product_id == product_id then
			return index
		end
	end
end

StoreWindowCategoryItemList._on_list_index_selected = function (self, index, scrollbar_animation_percentage)
	local layout = self._layout
	local entry = layout[index]

	self._params.selected_product = entry

	local row, column
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

StoreWindowCategoryItemList._on_list_index_pressed = function (self, index)
	local layout = self._layout
	local entry = layout[index]
	local product_id = entry.product_id
	local parent = self._parent
	local keep_global_shader_flags = true
	local current_store_path = parent:get_store_path()
	local new_path = table.clone(current_store_path)

	if entry.page then
		local page_name = entry.page_name

		new_path[#new_path + 1] = page_name

		parent:go_to_store_path(new_path, keep_global_shader_flags, entry.page)
	else
		new_path[#new_path + 1] = "all_items"

		parent:go_to_product(product_id, new_path, nil, keep_global_shader_flags)
	end
end

StoreWindowCategoryItemList._create_product_widgets = function (self, layout)
	local widgets = {}
	local parent = self._parent
	local scenegraph_id = "item_root"
	local masked = true

	for i, entry in ipairs(layout) do
		local widget = parent:create_item_widget(entry, scenegraph_id, masked)

		parent:populate_product_widget(widget, entry)

		widgets[i] = widget
	end

	self._list_widgets = widgets

	self:_align_item_widgets()
	self:_initialize_scrollbar()
end

StoreWindowCategoryItemList._destroy_product_widgets = function (self, force_unload)
	local parent = self._parent
	local layout = self._layout
	local widgets = self._list_widgets

	if widgets and layout then
		for i, entry in ipairs(layout) do
			local widget = widgets[i]

			parent:destroy_product_widget(widget, entry, force_unload)
		end
	end
end

StoreWindowCategoryItemList._align_item_widgets = function (self)
	local total_height = 0
	local widget_position_x = 0
	local widget_position_y = 0
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
		local change_row = widget_position_x + width > LIST_MAX_WIDTH

		if change_row then
			column = 1
			row = row + 1
			widget_position_x = 0
			widget_position_y = widget_position_y - (height + LIST_SPACING)
		end

		local empty_width_on_row = LIST_MAX_WIDTH - (widget_position_x + width)

		offset[1] = widget_position_x
		offset[2] = widget_position_y
		widget.default_offset = table.clone(offset)
		content.row = row
		content.column = column
		widget_position_x = widget_position_x + (width + LIST_SPACING)

		if index == num_widgets then
			total_height = math.abs(widget_position_y - height)
		end

		if not gamepad_navigation[row] then
			gamepad_navigation[row] = {}
		end

		gamepad_navigation[row][column] = index
		column = column + 1
	end

	self._gamepad_navigation = gamepad_navigation
	self._total_list_height = total_height

	self:_right_align_item_widgets()
end

StoreWindowCategoryItemList._right_align_item_widgets = function (self)
	local widgets = self._list_widgets
	local previous_column_index, new_position_x

	for index, widget in ripairs(widgets) do
		local offset = widget.offset
		local default_offset = widget.default_offset
		local content = widget.content
		local size = content.size
		local width = size[1]
		local widget_position_x = offset[1]
		local missing_row_space = LIST_MAX_WIDTH - (widget_position_x + width)
		local is_end_of_row = missing_row_space == 0

		if is_end_of_row then
			break
		end

		if new_position_x then
			new_position_x = new_position_x - (width + LIST_SPACING)
		else
			new_position_x = LIST_MAX_WIDTH - width
		end

		offset[1] = new_position_x
		default_offset[1] = new_position_x

		local column = content.column

		if previous_column_index and column < previous_column_index then
			break
		end

		previous_column_index = column
	end
end

StoreWindowCategoryItemList._sync_layout_path = function (self, force_update)
	local parent = self._parent
	local path = parent:get_store_path()
	local path_structure = StoreLayoutConfig.structure
	local pages = StoreLayoutConfig.pages
	local saved_path = self._saved_path or {}
	local path_differs = false
	local path_length = #path
	local saved_path_length = #saved_path

	if path_length ~= saved_path_length then
		path_differs = true
	else
		for i = 1, #path do
			if path[i] ~= saved_path[i] then
				path_differs = true

				break
			end
		end
	end

	if path_differs or force_update then
		self:_update_item_list()

		self._saved_path = table.clone(path)
	end
end

StoreWindowCategoryItemList._handle_gamepad_grid_selection = function (self, input_service)
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
	local new_row, new_index

	if input_service:get("move_left_hold_continuous") then
		if current_selected_column == 1 then
			self._params.category_focused = true

			return
		elseif current_selected_column > 1 then
			new_index = columns_on_row[current_selected_column - 1]
		end
	elseif input_service:get("move_right_hold_continuous") then
		if current_selected_column < num_columns_on_row then
			new_index = columns_on_row[current_selected_column + 1]
		end
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

StoreWindowCategoryItemList._find_closest_neighbour = function (self, column_index_list, current_index)
	local list_widgets = self._list_widgets
	local current_widget = list_widgets[current_index]
	local current_widget_content = current_widget.content
	local current_widget_size = current_widget_content.size
	local current_widget_offset = current_widget.offset
	local current_coordinate_x = current_widget_size[1] * 0.5 + current_widget_offset[1]
	local shortest_distance = math.huge
	local closest_index

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

StoreWindowCategoryItemList._initialize_scrollbar = function (self)
	local list_window_size = scenegraph_definition.list_window.size
	local list_scrollbar_size = scenegraph_definition.list_scrollbar.size
	local draw_length = list_window_size[2]
	local content_length = self._total_list_height
	local scrollbar_length = list_scrollbar_size[2]
	local step_size = 200
	local scroll_step_multiplier = 1
	local scrollbar_logic = self._scrollbar_logic

	scrollbar_logic:set_scrollbar_values(draw_length, content_length, scrollbar_length, step_size, scroll_step_multiplier)
	scrollbar_logic:set_scroll_percentage(0)
end

StoreWindowCategoryItemList._update_scroll_position = function (self)
	local scrollbar_logic = self._scrollbar_logic
	local length = scrollbar_logic:get_scrolled_length()

	if length ~= self._scrolled_length then
		self._ui_scenegraph.list.local_position[2] = length
		self._scrolled_length = length
	end
end

StoreWindowCategoryItemList._update_visible_list_entries = function (self)
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
		local widget_position = math.abs(offset[2]) + size[2]
		local is_outside = false

		if widget_position < scrolled_length - draw_padding then
			is_outside = true
		elseif draw_length < math.abs(offset[2]) - scrolled_length then
			is_outside = true
		end

		content.visible = not is_outside

		local hotspot = content.button_hotspot or content.hotspot

		if is_outside then
			table.clear(hotspot)
		end
	end
end

StoreWindowCategoryItemList._scroll_to_list_index = function (self, index)
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
			local percentage_difference

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

StoreWindowCategoryItemList._get_scrollbar_percentage_by_index = function (self, index)
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
