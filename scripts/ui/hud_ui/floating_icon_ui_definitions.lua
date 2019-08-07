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
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "left",
		position = {
			0,
			0,
			1
		},
		size = {
			0,
			0
		}
	},
	bar_pivot = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "left",
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

local function create_simple_bar(scenegraph_id, size)
	return {
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "background"
				},
				{
					pass_type = "rect",
					style_id = "foreground"
				}
			}
		},
		content = {},
		style = {
			background = {
				vertical_alignment = "bottom",
				horizontal_alignment = "left",
				texture_size = size,
				color = {
					200,
					30,
					30,
					30
				},
				offset = {
					0,
					0,
					0
				}
			},
			foreground = {
				vertical_alignment = "bottom",
				horizontal_alignment = "left",
				texture_size = {
					size[1] - 4,
					size[2] - 4
				},
				default_size = {
					size[1] - 4,
					size[2] - 4
				},
				color = {
					255,
					255,
					0,
					0
				},
				offset = {
					2,
					2,
					1
				}
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

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
						return style.color[1] > 0
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
		},
		offset = {
			0,
			0,
			0
		}
	},
	progress_bar = create_simple_bar("bar_pivot", {
		300,
		50
	})
}
local animation_definitions = {}

return {
	animation_definitions = animation_definitions,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions
}
