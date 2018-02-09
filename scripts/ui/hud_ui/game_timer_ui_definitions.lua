local SIZE_X = 1920
local SIZE_Y = 1080
local scenegraph_definition = {
	root = {
		is_root = true,
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
	timer_background = {
		vertical_alignment = "center",
		parent = "timer_text_box",
		horizontal_alignment = "center",
		position = {
			0,
			2,
			-1
		},
		size = {
			268,
			49
		}
	},
	timer_text_box = {
		vertical_alignment = "top",
		parent = "root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			3
		},
		size = {
			SIZE_X,
			100
		}
	}
}
local color = Colors.get_color_table_with_alpha("white", 255)
local widget_definitions = {
	timer_background = {
		scenegraph_id = "timer_background",
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture",
					retained_mode = true
				}
			}
		},
		content = {
			texture_id = "timer_bg"
		},
		style = {
			texture_id = {
				color = {
					255,
					255,
					255,
					255
				}
			}
		}
	},
	timer_text_box = {
		scenegraph_id = "timer_text_box",
		element = {
			passes = {
				{
					style_id = "timer_text",
					pass_type = "text",
					text_id = "timer_text"
				}
			}
		},
		content = {
			timer_text = "00:00:00"
		},
		style = {
			timer_text = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				text_color = color,
				offset = {
					0,
					0,
					1
				}
			}
		}
	}
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions
}
