local definitions = local_require("scripts/ui/views/hero_view/windows/store/definitions/store_window_path_title_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local create_breadcrumbs_definition = definitions.create_breadcrumbs_definition
StoreWindowPathTitle = class(StoreWindowPathTitle)
StoreWindowPathTitle.NAME = "StoreWindowPathTitle"

StoreWindowPathTitle.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate StoreWindowPathTitle")

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

	self:_create_ui_elements(params, offset)
end

StoreWindowPathTitle._create_ui_elements = function (self, params, offset)
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

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self._ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StoreWindowPathTitle._sync_layout_path = function (self)
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
		for i = 1, #path, 1 do
			if path[i] ~= saved_path[i] then
				path_differs = true

				break
			end
		end
	end

	if path_differs then
		self._saved_path = table.clone(path)
		local breadcrumb_widgets = {}

		for i, page_name in ipairs(path) do
			local display_selected_product = page_name == "item_details"
			local page = pages[page_name]
			local widget = self:_create_breadcrumb_widget()
			local display_name = nil

			if display_selected_product then
				display_name = self:_get_selected_product_display_name()
			else
				display_name = page.display_name
			end

			widget.content.text = Localize(display_name)
			widget.content.page_name = page_name
			widget.content.button_hotspot.is_selected = i == path_length
			breadcrumb_widgets[#breadcrumb_widgets + 1] = widget
		end

		self._breadcrumb_widgets = breadcrumb_widgets

		self:_setup_breadcrumb_widgets()
	end
end

StoreWindowPathTitle._get_selected_product_display_name = function (self)
	local selected_product = self._params.selected_product
	local product_type = selected_product and selected_product.type

	if product_type == "item" then
		local item = selected_product.item
		local inventory_icon, display_name, _ = UIUtils.get_ui_information_from_item(item)

		return display_name
	elseif product_type == "dlc" then
		local dlc_settings = selected_product.dlc_settings

		return dlc_settings.name
	else
		return "n/a"
	end
end

StoreWindowPathTitle._setup_breadcrumb_widgets = function (self)
	local total_menu_panel_length = 0
	local breadcrumb_widgets = self._breadcrumb_widgets
	local num_buttons = #breadcrumb_widgets
	local selected_product = self._params.selected_product

	Managers.telemetry.events:store_breadcrumbs_changed(breadcrumb_widgets, selected_product)

	local start_position_x = 0
	local spacing = 2
	local icon_width = 70

	for index, widget in ipairs(breadcrumb_widgets) do
		widget.offset[1] = start_position_x
		local text_width = self:_get_breadcrumb_text_width(widget)
		local widget_width = icon_width + spacing + text_width
		widget.style.button_hotspot.size[1] = widget_width
		start_position_x = start_position_x + widget_width
	end
end

StoreWindowPathTitle._get_breadcrumb_text_width = function (self, widget)
	local content = widget.content
	local style = widget.style
	local text_style = style.text
	local text = content.text

	if text_style.localize then
		text = Localize(text)
	end

	if text_style.upper_case then
		text = TextToUpper(text)
	end

	local ui_scenegraph = self._ui_scenegraph
	local ui_renderer = self._ui_renderer
	local font, scaled_font_size = UIFontByResolution(text_style)
	local text_width, text_height, min = UIRenderer.text_size(ui_renderer, text, font[1], scaled_font_size)

	return text_width
end

StoreWindowPathTitle._create_breadcrumb_widget = function (self)
	local definition = create_breadcrumbs_definition()
	local widget = UIWidget.init(definition)

	return widget
end

StoreWindowPathTitle.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate StoreWindowPathTitle")

	self._ui_animator = nil
end

StoreWindowPathTitle.update = function (self, dt, t)
	self:_sync_layout_path()
	self:_update_animations(dt)
	self:_draw(dt)
end

StoreWindowPathTitle._get_layout_settings_by_name = function (self, name)
	local layout_settings = self._layout_settings
	local window_layouts = layout_settings.window_layouts

	for _, settings in ipairs(window_layouts) do
		if settings.name == name then
			return settings
		end
	end
end

StoreWindowPathTitle.post_update = function (self, dt, t)
	local input_service = self._parent:window_input_service()

	self:_handle_input(input_service, dt, t)
end

StoreWindowPathTitle._update_animations = function (self, dt)
	self._ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self._ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local breadcrumb_widgets = self._breadcrumb_widgets

	if breadcrumb_widgets then
		for index, widget in ipairs(breadcrumb_widgets) do
			self:_animate_breadcrumb_widget(widget, dt)
		end
	end
end

StoreWindowPathTitle._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StoreWindowPathTitle._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StoreWindowPathTitle._handle_input = function (self, input_service, dt, t)
	local breadcrumb_widgets = self._breadcrumb_widgets

	if breadcrumb_widgets then
		local num_breadcrumb_widgets = #breadcrumb_widgets

		for index, widget in ipairs(breadcrumb_widgets) do
			if index ~= num_breadcrumb_widgets then
				if self:_is_button_hovered(widget) then
					self:_play_sound("Play_hud_store_button_hover_category")
				end

				if self:_is_button_pressed(widget) then
					self:_play_sound("Play_hud_store_button_back")
					self:_on_path_index_pressed_pressed(index)

					break
				end
			end
		end
	end
end

StoreWindowPathTitle._on_path_index_pressed_pressed = function (self, index)
	local parent = self._parent
	local path = parent:get_store_path()
	local pages = StoreLayoutConfig.pages
	local new_path = {}

	for i, page_name in ipairs(path) do
		new_path[i] = page_name

		if i == index then
			break
		end
	end

	parent:go_to_store_path(new_path)
end

StoreWindowPathTitle._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	local breadcrumb_widgets = self._breadcrumb_widgets

	if breadcrumb_widgets then
		for _, widget in ipairs(breadcrumb_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)
end

StoreWindowPathTitle._play_sound = function (self, event)
	self._parent:play_sound(event)
end

StoreWindowPathTitle._animate_breadcrumb_widget = function (self, widget, dt)
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot
	local is_hover = hotspot.is_hover
	local is_selected = hotspot.is_selected
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 14

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
	end

	hotspot.hover_progress = hover_progress
	hotspot.selection_progress = selection_progress
	local combined_progress = math.max(hover_progress, selection_progress)
	local text_style = style.text
	local text_color = text_style.text_color
	local default_text_color = text_style.default_text_color
	local select_text_color = text_style.select_text_color

	Colors.lerp_color_tables(default_text_color, select_text_color, combined_progress, text_color)
end

return
