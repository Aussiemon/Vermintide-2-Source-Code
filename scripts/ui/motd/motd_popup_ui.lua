local definitions = local_require("scripts/ui/motd/motd_popup_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
MOTDPopupUI = class(MOTDPopupUI)
local DO_RELOAD = true

MOTDPopupUI.init = function (self, ui_context)
	self.ui_renderer = ui_context.ui_renderer
	self.ui_top_renderer = ui_context.ui_top_renderer
	self.input_manager = ui_context.input_manager
	self.world = ui_context.world
	local world = Managers.world:world("level_world")
	self.wwise_world = Managers.world:wwise_world(world)
	self.render_settings = {
		snap_pixel_positions = true
	}

	self:_create_ui_elements()
	self:_setup_input()

	local gui = self.ui_top_renderer.gui
	self.dynamic_material = Gui.material(gui, definitions.dynamic_texture)
end

MOTDPopupUI._setup_input = function (self)
	self.input_manager:create_input_service("motd", "IngameMenuKeymaps", "IngameMenuFilters")
	self.input_manager:map_device_to_service("motd", "keyboard")
	self.input_manager:map_device_to_service("motd", "mouse")
	self.input_manager:map_device_to_service("motd", "gamepad")
end

MOTDPopupUI._create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widget_definitions = definitions.widget_definitions
	self.widgets = {}
	self.buttons = {}

	for key, widget in pairs(widget_definitions) do
		local w = UIWidget.init(widget)
		self.widgets[#self.widgets + 1] = w

		if string.ends_with(key, "_button") then
			self.buttons[key] = w
		end
	end
end

MOTDPopupUI.show = function (self, texture_resource)
	if not self or self.dynamic_texture then
		print("a texture has already been loaded but not unloaded via hide. Delete resource")
		Managers.url_loader:unload_resource(texture_resource)

		return
	end

	if self.draw_widgets and self.is_visible then
		print("MOTDPopupUI is already visible")

		return
	end

	self.dynamic_texture = texture_resource

	Material.set_resource(self.dynamic_material, "diffuse_map", self.dynamic_texture)

	self.draw_widgets = true
	self.is_visible = true

	ShowCursorStack.push()
	self.input_manager:block_device_except_service("motd", "keyboard", 1, "popup")
	self.input_manager:block_device_except_service("motd", "mouse", 1, "popup")
	self.input_manager:block_device_except_service("motd", "gamepad", 1, "popup")
end

MOTDPopupUI.hide = function (self)
	if not self.draw_widgets and not self.is_visible then
		return
	end

	self.draw_widgets = false
	self.is_visible = false

	ShowCursorStack.pop()
	self.input_manager:device_unblock_all_services("keyboard", 1)
	self.input_manager:device_unblock_all_services("mouse", 1)
	self.input_manager:device_unblock_all_services("gamepad", 1)
	Managers.url_loader:unload_resource(self.dynamic_texture)

	self.dynamic_texture = nil
end

MOTDPopupUI.destroy = function (self)
	self.draw_widgets = false
	self.is_visible = false
	self.widgets = nil
	self.buttons = nil

	if self.dynamic_texture then
		Managers.url_loader:unload_resource(self.dynamic_texture)
	end

	self.dynamic_material = nil
	self.dynamic_texture = nil
end

MOTDPopupUI.update = function (self, dt)
	if DO_RELOAD then
		DO_RELOAD = false

		self:_create_ui_elements()
	end

	if not self.is_visible or not self.draw_widgets then
		return
	end

	if self:_button_clicked("ok_button") then
		self:hide()

		return
	end

	self:_draw(dt)
end

MOTDPopupUI.post_update = function (self, dt)
	return
end

MOTDPopupUI.post_render = function (self)
	return
end

MOTDPopupUI._draw = function (self, dt)
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("motd")
	local render_settings = self.render_settings

	for _, b in pairs(self.buttons) do
		self:_animate_button(b, dt)
	end

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self.widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

MOTDPopupUI._button_clicked = function (self, button_name)
	local is_pressed = self.buttons[button_name].content.button_hotspot.on_release

	if is_pressed then
		self.buttons[button_name].content.button_hotspot.on_release = false
	end

	return is_pressed
end

MOTDPopupUI._animate_button = function (self, widget, dt)
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

return
