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
	pivot = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			0,
			0
		}
	}
}
local widget_definitions = {
	default = {
		scenegraph_id = "pivot",
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture"
				},
				{
					texture_id = "arrow",
					style_id = "arrow",
					pass_type = "rotated_texture",
					content_check_function = function (content, style)
						return 0 < style.color[1]
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.text
					end
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.text
					end
				}
			}
		},
		content = {
			text = "tooltip_text",
			texture_id = "hud_tutorial_icon_info",
			arrow = "indicator"
		},
		style = {
			text = {
				vertical_alignment = "center",
				font_size = 30,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					34,
					0,
					1
				}
			},
			text_shadow = {
				vertical_alignment = "center",
				font_size = 30,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					36,
					-2,
					0
				}
			},
			texture_id = {
				size = {
					64,
					64
				},
				offset = {
					-30,
					-30,
					1
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			arrow = {
				angle = 0,
				size = {
					38,
					18
				},
				pivot = {
					19,
					9
				},
				offset = {
					-19,
					-9,
					2
				},
				color = {
					255,
					255,
					255,
					255
				}
			}
		}
	}
}
local animation_definitions = {}

return {
	animation_definitions = animation_definitions,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions
}
