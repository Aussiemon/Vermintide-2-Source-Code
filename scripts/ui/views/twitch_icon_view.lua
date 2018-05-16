require("scripts/ui/ui_renderer")
require("scripts/ui/ui_elements")
require("scripts/ui/ui_element")
require("scripts/ui/ui_widgets")

local definitions = require("scripts/ui/views/twitch_icon_view_definitions")
local DO_RELOAD = true
TwitchIconView = class(TwitchIconView)
local fake_input_service = {
	get = function ()
		return
	end,
	has = function ()
		return
	end
}

TwitchIconView.init = function (self, world)
	self._world = world
	self._ui_renderer = UIRenderer.create(world, "material", "materials/ui/ui_1080p_loading")
	self._render_settings = {
		snap_pixel_positions = true
	}

	self:_create_ui_elements()

	DO_RELOAD = false
end

TwitchIconView._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self._twitch_icon_widget = UIWidget.init(definitions.twitch_icon_widget)

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
end

TwitchIconView.update = function (self, dt)
	if DO_RELOAD then
		DO_RELOAD = false

		print("Reloading Twitch Icon")
		self:_create_ui_elements()
	end

	if Managers.twitch and (Managers.twitch:is_connected() or Managers.twitch:is_activated()) then
		self:_draw(dt)
	end
end

TwitchIconView._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, fake_input_service, dt, nil, self._render_settings)
	UIRenderer.draw_widget(ui_renderer, self._twitch_icon_widget)
	UIRenderer.end_pass(ui_renderer)
end

TwitchIconView.destroy = function (self)
	UIRenderer.destroy(self._ui_renderer, self._world)
end

return
