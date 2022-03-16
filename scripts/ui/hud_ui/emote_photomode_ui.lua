local definitions = local_require("scripts/ui/hud_ui/emote_photomode_ui_definitions")
local widget_definitions = definitions.widgets
local widgets_pc_definitions = definitions.widgets_pc
local widgets_gamepad_definitions = definitions.widgets_gamepad
local scenegraph_definition = definitions.scenegraph_definition
EmotePhotomodeUI = class(EmotePhotomodeUI)
local DO_RELOAD = false

EmotePhotomodeUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ingame_ui_context = ingame_ui_context
	self._render_settings = {}

	self:_create_ui_elements()

	self._is_enabled = false
end

EmotePhotomodeUI.destroy = function (self)
	return
end

EmotePhotomodeUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._render_settings = self._render_settings or {}
	self._widgets = {}

	for name, widget in pairs(widget_definitions) do
		local widget = UIWidget.init(widget)
		self._widgets[name] = widget
	end

	self._widgets_pc = {}

	for name, widget in pairs(widgets_pc_definitions) do
		local widget = UIWidget.init(widget)
		self._widgets_pc[name] = widget
	end

	self._widgets_gamepad = {}

	for name, widget in pairs(widgets_gamepad_definitions) do
		local widget = UIWidget.init(widget)
		self._widgets_gamepad[name] = widget
	end

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
end

EmotePhotomodeUI.update = function (self, dt, t)
	if not self._is_enabled then
		return
	end

	self:_draw(dt, t)
end

EmotePhotomodeUI.set_enabled = function (self, enabled)
	self._is_enabled = enabled
end

EmotePhotomodeUI._draw = function (self, dt, t)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings
	local input_service = Managers.input:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in pairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	local gamepad_active = Managers.input:is_device_active("gamepad") or not IS_WINDOWS

	if gamepad_active then
		for _, widget in pairs(self._widgets_gamepad) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	else
		for _, widget in pairs(self._widgets_pc) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)
end

return
