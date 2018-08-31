require("scripts/ui/ui_renderer")
require("scripts/ui/ui_elements")
require("scripts/ui/ui_element")
require("scripts/ui/ui_widgets")

local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			1000
		},
		size = {
			1920,
			1080
		}
	},
	screen = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			0
		},
		size = {
			1920,
			1080
		}
	},
	beta_tag = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "right",
		position = {
			-50,
			-50,
			0
		},
		size = {
			256,
			128
		}
	}
}
BetaOverlay = class(BetaOverlay)
local DO_RELOAD = false
local fake_input_service = {
	get = function ()
		return
	end,
	has = function ()
		return
	end
}

BetaOverlay.init = function (self)
	local top_world = Managers.world:world("top_ingame_view")
	self.ui_renderer = UIRenderer.create(top_world, "material", "materials/ui/ui_1080p_loading")
	self.top_world = top_world

	self:create_ui_elements()
end

BetaOverlay.create_ui_elements = function (self, widget_definition)
	local widget_definition = UIWidgets.create_simple_texture("beta_text", "beta_tag")
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.widget = UIWidget.init(widget_definition)
	DO_RELOAD = false

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)
end

BetaOverlay.update = function (self, dt)
	if DO_RELOAD then
		self:create_ui_elements()
	end

	self:draw(dt)
end

BetaOverlay.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, fake_input_service, dt)
	UIRenderer.draw_widget(ui_renderer, self.widget)
	UIRenderer.end_pass(ui_renderer)
end

BetaOverlay.destroy = function (self)
	UIRenderer.destroy(self.ui_renderer, self.top_world)
end

return
