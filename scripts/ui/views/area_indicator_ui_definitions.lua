local SIZE_X = 1920
local SIZE_Y = 1080
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.hud
		},
		size = {
			SIZE_X,
			SIZE_Y
		}
	},
	area_text_box = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0,
			200,
			100
		},
		size = {
			SIZE_X,
			50
		}
	}
}
local text_style = {
	word_wrap = false,
	font_size = 52,
	localize = true,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 0),
	default_text_color = Colors.get_color_table_with_alpha("white", 0),
	offset = {
		0,
		0,
		1
	}
}
local widget_definitions = {
	area_text_box = UIWidgets.create_simple_text("placeholder_area_text", "area_text_box", nil, nil, text_style)
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions
}
