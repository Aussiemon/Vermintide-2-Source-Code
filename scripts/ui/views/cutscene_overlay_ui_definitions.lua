-- chunkname: @scripts/ui/views/cutscene_overlay_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			200,
		},
		size = {
			SIZE_X,
			SIZE_Y,
		},
	},
	text_area = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			0,
			0,
			0,
		},
		size = {
			SIZE_X - 100,
			SIZE_Y - 100,
		},
	},
	image_area = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			0,
			0,
			0,
		},
		size = {
			0,
			0,
		},
	},
}
local text_style = {
	font_size = 52,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("white", 0),
	default_text_color = Colors.get_color_table_with_alpha("white", 0),
	offset = {
		0,
		0,
		1,
	},
}
local widget_definitions = {
	text = UIWidgets.create_simple_text("", "text_area", nil, nil, text_style),
	image = {
		scenegraph_id = "image_area",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
				},
			},
		},
		content = {
			texture_id = "icons_placeholder",
		},
		style = {
			texture_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					50,
					50,
				},
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					0,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
}
