require("scripts/ui/ui_renderer")
require("scripts/ui/ui_elements")
require("scripts/ui/ui_element")
require("scripts/ui/ui_widgets")

local definitions = require("scripts/ui/views/water_mark_view_definitions")
WaterMarkView = class(WaterMarkView)
local fake_input_service = {
	get = function ()
		return
	end,
	has = function ()
		return
	end
}

WaterMarkView.init = function (self, world)
	self._world = world
	self._ui_renderer = UIRenderer.create(world, "material", "materials/ui/ui_1080p_watermarks")
	self._render_settings = {
		snap_pixel_positions = true
	}

	self:_create_ui_elements()
end

WaterMarkView._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self._water_mark_widget = UIWidget.init(definitions.water_mark)

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
end

local DO_RELOAD = true

WaterMarkView.update = function (self, dt)
	if DO_RELOAD then
		DO_RELOAD = false

		self:_create_ui_elements()
	end

	self:_draw(dt)
end

WaterMarkView._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, fake_input_service, dt, nil, self._render_settings)
	UIRenderer.draw_widget(ui_renderer, self._water_mark_widget)
	UIRenderer.end_pass(ui_renderer)
end

WaterMarkView.destroy = function (self)
	UIRenderer.destroy(self._ui_renderer, self._world)
end

return
