local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.credits_menu
		},
		size = {
			1920,
			1080
		}
	},
	text_position = {
		horizontal_alignment = "center",
		parent = "root"
	}
}
local credits_widget_definition = {
	scenegraph_id = "text_position",
	offset = {
		0,
		0,
		1
	},
	element = {
		passes = {
			{
				style_id = "text",
				pass_type = "text",
				text_id = "text_field"
			}
		}
	},
	content = {
		text_field = ""
	},
	style = {
		text = {
			dynamic_font = true,
			horizontal_alignment = "center",
			font_size = 30,
			font_type = "arial",
			text_color = Colors.color_definitions.white
		}
	}
}
local widget_definitions = {
	credits = credits_widget_definition
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions
}
