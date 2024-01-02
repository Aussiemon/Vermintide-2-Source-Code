require("scripts/ui/ui_renderer")
require("scripts/ui/ui_elements")

local definitions = require("scripts/ui/views/dev_backend_water_mark_view_definitions")
DevBackendWatermarkView = class(DevBackendWatermarkView)

DevBackendWatermarkView.init = function (self, world)
	self._world = world
	self._ui_renderer = UIRenderer.create(world, "material", "materials/ui/ui_1080p_watermarks")
	self._render_settings = {
		snap_pixel_positions = true
	}

	self:_create_ui_elements()
end

DevBackendWatermarkView._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self._water_mark_widget = UIWidget.init(definitions.water_mark)

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
end

local DO_RELOAD = false

DevBackendWatermarkView.update = function (self, dt)
	if DO_RELOAD then
		DO_RELOAD = false

		self:_create_ui_elements()
	end

	self:_draw(dt)
end

DevBackendWatermarkView._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, FAKE_INPUT_SERVICE, dt, nil, self._render_settings)
	UIRenderer.draw_widget(ui_renderer, self._water_mark_widget)
	UIRenderer.end_pass(ui_renderer)
end

DevBackendWatermarkView.destroy = function (self)
	UIRenderer.destroy(self._ui_renderer, self._world)
end
