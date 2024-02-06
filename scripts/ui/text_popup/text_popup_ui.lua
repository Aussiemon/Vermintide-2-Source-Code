-- chunkname: @scripts/ui/text_popup/text_popup_ui.lua

local definitions = local_require("scripts/ui/text_popup/text_popup_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local generic_input_actions = definitions.generic_input_actions
local WINDOW_INSIDE_HEIGHT = scenegraph_definition.text_entry.size[2]

TextPopupUI = class(TextPopupUI)

TextPopupUI.init = function (self, ui_context)
	self._ui_top_renderer = ui_context.ui_top_renderer
	self._input_manager = ui_context.input_manager
	self._render_settings = {
		snap_pixel_positions = true,
	}

	self:_create_ui_elements()
	self:_setup_input()

	local input_service = self._input_manager:get_service("Text")

	self._menu_input_description = MenuInputDescriptionUI:new(ui_context, self._ui_top_renderer, input_service, 3, 900, generic_input_actions.default)

	self._menu_input_description:set_input_description(nil)
end

TextPopupUI._setup_input = function (self)
	self._input_manager:create_input_service("Text", "IngameMenuKeymaps", "IngameMenuFilters")
	self._input_manager:map_device_to_service("Text", "keyboard")
	self._input_manager:map_device_to_service("Text", "mouse")
	self._input_manager:map_device_to_service("Text", "gamepad")
end

TextPopupUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local widget_definitions = definitions.widget_definitions

	self._widgets = {}
	self._widgets_by_name = {}
	self._buttons = {}

	for key, widget in pairs(widget_definitions) do
		local w = UIWidget.init(widget)

		self._widgets[#self._widgets + 1] = w

		if string.ends_with(key, "_button") then
			self._buttons[key] = w
		else
			self._widgets_by_name[key] = w
		end
	end
end

TextPopupUI.show = function (self, header_localization_key, text_localization_key, on_close_callback)
	if self._draw_widgets and self.is_visible then
		print("TextPopupUI is already visible")

		return
	end

	if on_close_callback then
		self._on_close_callback = on_close_callback
	end

	self._widgets_by_name.title_text.content.text = Localize(header_localization_key)
	self._widgets_by_name.overlay_text.content.text = Localize(text_localization_key)

	self:_update_scroll_height(0)

	self._draw_widgets = true
	self.is_visible = true

	ShowCursorStack.push()
	self._input_manager:capture_input({
		"keyboard",
		"gamepad",
		"mouse",
	}, 1, "Text", "TextPopupUI")
end

TextPopupUI.hide = function (self)
	if not self._draw_widgets and not self.is_visible then
		return
	end

	self._draw_widgets = false
	self.is_visible = false

	ShowCursorStack.pop()
	self._input_manager:release_input({
		"keyboard",
		"gamepad",
		"mouse",
	}, 1, "Text", "TextPopupUI")

	if self._on_close_callback then
		self._on_close_callback()

		self._on_close_callback = nil
	end
end

TextPopupUI.update = function (self, dt)
	if not self.is_visible or not self._draw_widgets then
		return
	end

	if self:_button_clicked("ok_button") then
		self:hide()

		return
	end

	self:_update_mouse_scroll_input()
	self:_update_gamepad_scroll_input()
	self:_draw(dt)
end

TextPopupUI.post_update = function (self, dt)
	return
end

TextPopupUI.post_render = function (self)
	return
end

TextPopupUI._update_scroll_height = function (self, optional_scroll_value)
	local total_height = UIUtils.get_text_height(self._ui_top_renderer, definitions.scenegraph_definition.text_entry.size, definitions.scroll_text_style, self._widgets_by_name.overlay_text.content.text)

	self._total_scroll_height = math.max(total_height - WINDOW_INSIDE_HEIGHT, 0)

	self:_setup_scrollbar(total_height, optional_scroll_value)
end

TextPopupUI._setup_scrollbar = function (self, height, optional_value)
	local widget = self._widgets_by_name.scrollbar
	local scenegraph_id = widget.scenegraph_id
	local scrollbar_size_y = self._ui_scenegraph[scenegraph_id].size[2]
	local percentage = math.min(scrollbar_size_y / height, 1)

	widget.content.scroll_bar_info.bar_height_percentage = percentage

	self:_set_scrollbar_value(optional_value or 0)

	local scroll_step_multiplier = 2
	local scroll_amount = math.max(WINDOW_INSIDE_HEIGHT / self._total_scroll_height, 0) * scroll_step_multiplier

	self._widgets_by_name.scroll_content.content.scroll_amount = scroll_amount
end

TextPopupUI._update_mouse_scroll_input = function (self)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.scrollbar
	local window_widget = widgets_by_name.scroll_content

	if widget.content.scroll_bar_info.on_pressed then
		window_widget.content.scroll_add = nil
	end

	local mouse_scroll_value = window_widget.content.scroll_value

	if not mouse_scroll_value then
		return
	end

	local scroll_bar_value = widget.content.scroll_bar_info.value
	local current_scroll_value = self._scroll_value or 0

	if current_scroll_value ~= mouse_scroll_value then
		self:_set_scrollbar_value(mouse_scroll_value)
	elseif current_scroll_value ~= scroll_bar_value then
		self:_set_scrollbar_value(scroll_bar_value)
	end
end

TextPopupUI._update_gamepad_scroll_input = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if not gamepad_active then
		return
	end

	local input_service = self._input_manager:get_service("Text")
	local gamepad_scroll_value = input_service:get("gamepad_left_axis")

	if math.abs(gamepad_scroll_value.y) == 0 then
		return
	end

	local widgets_by_name = self._widgets_by_name
	local scroll_content = widgets_by_name.scroll_content
	local scroll_content_content = scroll_content.content

	scroll_content_content.scroll_add = scroll_content_content.scroll_amount * gamepad_scroll_value.y * -1 * 0.1
end

TextPopupUI._set_scrollbar_value = function (self, value)
	if value then
		local widgets_by_name = self._widgets_by_name
		local widget = widgets_by_name.scrollbar
		local widget_scroll_bar_info = widget.content.scroll_bar_info

		widget_scroll_bar_info.value = value
		widgets_by_name.scroll_content.content.scroll_value = value
		self._scroll_value = value

		local scenegraph_id_to_move = "text_entry"
		local ui_scenegraph = self._ui_scenegraph
		local default_scenegraph = scenegraph_definition[scenegraph_id_to_move]
		local default_position = default_scenegraph.position

		ui_scenegraph[scenegraph_id_to_move].local_position[2] = default_position[2] + value * self._total_scroll_height
	end
end

TextPopupUI._draw = function (self, dt)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_manager:get_service("Text")
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local render_settings = self._render_settings

	for _, b in pairs(self._buttons) do
		self:_animate_button(b, dt)
	end

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)

	if gamepad_active then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

TextPopupUI._button_clicked = function (self, button_name)
	local is_pressed = self._buttons[button_name].content.button_hotspot.on_release
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active and button_name == "ok_button" then
		local input_service = self._input_manager:get_service("Text")

		is_pressed = input_service:get("confirm") or is_pressed
	end

	if is_pressed then
		self._buttons[button_name].content.button_hotspot.on_release = false
	end

	return is_pressed
end

TextPopupUI._animate_button = function (self, widget, dt)
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot
	local is_hover = hotspot.is_hover
	local is_selected = hotspot.is_selected
	local input_pressed = hotspot.is_clicked and hotspot.is_clicked == 0
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

	local combined_progress = math.max(hover_progress, selection_progress)

	style.clicked_rect.color[1] = 100 * input_progress

	local hover_alpha = 255 * hover_progress

	style.hover_glow.color[1] = hover_alpha

	local text_disabled_style = style.title_text_disabled
	local disabled_default_text_color = text_disabled_style.default_text_color
	local disabled_text_color = text_disabled_style.text_color

	disabled_text_color[2] = disabled_default_text_color[2] * 0.4
	disabled_text_color[3] = disabled_default_text_color[3] * 0.4
	disabled_text_color[4] = disabled_default_text_color[4] * 0.4
	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress

	local title_text_style = style.title_text
	local title_text_color = title_text_style.text_color
	local title_default_text_color = title_text_style.default_text_color
	local title_select_text_color = title_text_style.select_text_color

	Colors.lerp_color_tables(title_default_text_color, title_select_text_color, combined_progress, title_text_color)
end

TextPopupUI.destroy = function (self)
	self._draw_widgets = false
	self.is_visible = false
	self._widgets = nil
	self._widgets_by_name = nil
	self._buttons = nil
	self._on_close_callback = nil
end
