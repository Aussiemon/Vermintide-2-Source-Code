require("scripts/ui/ui_renderer")
require("scripts/ui/ui_elements")
require("scripts/ui/ui_widgets")

local definitions = dofile("scripts/ui/views/console_cursor_view_definitions")
local DO_RELOAD = true
ConsoleCursorView = class(ConsoleCursorView)

ConsoleCursorView.init = function (self, world)
	self._world = world
	self._ui_renderer = UIRenderer.create(world, "material", "materials/ui/ui_1080p_loading")
	self._render_settings = {
		snap_pixel_positions = false
	}

	self:_create_ui_elements()

	DO_RELOAD = false
end

ConsoleCursorView._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self._widgets = {}

	for name, widget_definition in pairs(definitions.widgets) do
		self._widgets[name] = UIWidget.init(widget_definition)
	end

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
end

ConsoleCursorView.update = function (self, dt)
	if DO_RELOAD then
		DO_RELOAD = false

		self:_create_ui_elements()
	end

	if not Managers.input:is_device_active("gamepad") then
		return
	end

	self:_update_position(dt)
	self:_draw(dt)
end

ConsoleCursorView._update_position = function (self, dt)
	return
end

ConsoleCursorView._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, FAKE_INPUT_SERVICE, dt, nil, self._render_settings)

	for name, widget in pairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end
