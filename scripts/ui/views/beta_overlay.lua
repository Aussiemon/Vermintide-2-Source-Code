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
			0,
			0,
			0
		},
		size = {
			256,
			128
		}
	}
}
BetaOverlay = class(BetaOverlay)
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
	local widget_definition = UIWidgets.create_simple_texture("beta_text", "beta_tag")

	self.create_ui_elements(self, widget_definition)

	return 
end
BetaOverlay.create_ui_elements = function (self, widget_definition)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.widget = UIWidget.init(widget_definition)

	return 
end
BetaOverlay.update = function (self, dt)
	self.draw(self, dt)

	return 
end
BetaOverlay.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, fake_input_service, dt)
	UIRenderer.draw_widget(ui_renderer, self.widget)
	UIRenderer.end_pass(ui_renderer)

	return 
end
BetaOverlay.destroy = function (self)
	UIRenderer.destroy(self.ui_renderer, self.top_world)

	return 
end

return 
