DieSuccessUI = class(DieSuccessUI)
local scenegraph_definition, widget_definition = nil

DieSuccessUI.init = function (self, ui_renderer, input_manager, scenegraph_id)
	self.ui_renderer = ui_renderer
	self.input_manager = input_manager

	self:create_ui_elements()

	self.scenegraph_id = scenegraph_id
	self.num_successes = ""
end

DieSuccessUI.set_num_successes = function (self, num_successes)
	self.num_successes = tostring(num_successes)
end

DieSuccessUI.set_done = function (self, is_done)
	if is_done then
		UIWidget.animate(self.widget, UIAnimation.init(UIAnimation.function_by_time, self.widget.style.background_glow.color, 1, 0, 255, 0.5, math.easeInCubic, UIAnimation.pulse_animation, self.widget.style.background_glow.color, 1, 255, 128, 2))
	end
end

DieSuccessUI.create_ui_elements = function (self)
	self.widget = UIWidget.init(widget_definition)
	self.scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
end

DieSuccessUI.update = function (self, dt)
	local ui_renderer = self.ui_renderer
	local input_service = self.input_manager:get_service("ingame_menu")
	local num_successes = self.num_successes
	self.widget.content.success_amount = num_successes

	UIRenderer.begin_pass(ui_renderer, self.scenegraph, input_service, dt, self.scenegraph_id)
	UIRenderer.draw_widget(ui_renderer, self.widget)
	UIRenderer.end_pass(ui_renderer)
end

widget_definition = {
	scenegraph_id = "root",
	element = {
		passes = {
			{
				pass_type = "texture",
				texture_id = "background"
			},
			{
				pass_type = "texture",
				style_id = "background_glow",
				texture_id = "background_glow"
			},
			{
				scenegraph_id = "successes_text",
				style_id = "successes_text",
				pass_type = "text",
				text_id = "successes_text"
			},
			{
				scenegraph_id = "success_amount",
				style_id = "success_amount",
				pass_type = "text",
				text_id = "success_amount"
			}
		}
	},
	content = {
		success_amount = "",
		background_glow = "loot_screen_successes_2",
		background = "loot_screen_successes_1",
		successes_text = "Successes"
	},
	style = {
		success_amount = {
			font_size = 40,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			text_color = Colors.color_definitions.white
		},
		successes_text = {
			font_size = 32,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			text_color = Colors.color_definitions.white
		},
		background_glow = {
			offset = {
				0,
				0,
				1
			},
			color = {
				0,
				255,
				255,
				255
			}
		}
	}
}
scenegraph_definition = {
	root = {
		size = {
			330,
			280
		}
	},
	success_amount = {
		parent = "root",
		position = {
			6,
			154,
			1
		},
		size = {
			60,
			60
		}
	},
	successes_text = {
		parent = "root",
		position = {
			76,
			8,
			1
		},
		size = {
			140,
			38
		}
	}
}

return
