local MARGIN = 8
local WIDTH = 960 - 2 * MARGIN
local HEIGHT = 1080 - 2 * MARGIN
local HEADER_HEIGHT = 32
local HEADER_BORDER = 1
local FOOTER_HEIGHT = 32
local WINDOW_MARGIN = 2
local SCROLLBAR_WIDTH = 8
local SCROLLBAR_HEIGHT = HEIGHT - HEADER_HEIGHT - FOOTER_HEIGHT - 2 * WINDOW_MARGIN
local SCROLLBAR_MARGIN = 1
local BAR_WIDTH = SCROLLBAR_WIDTH - 2 * SCROLLBAR_MARGIN
local BAR_HEIGHT = 65
local FRAME_HEIGHT = 4
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.rcon
		},
		size = {
			1920,
			1080
		}
	},
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.rcon
		},
		size = {
			1920,
			1080
		}
	},
	window_root = {
		parent = "root",
		position = {
			1920 - WIDTH - MARGIN,
			8,
			0
		},
		size = {
			1,
			1
		}
	},
	window_background = {
		parent = "window_root",
		position = {
			0,
			0,
			1
		},
		size = {
			WIDTH,
			HEIGHT
		}
	},
	window_frame_top = {
		parent = "window_root",
		position = {
			0,
			HEIGHT - HEADER_HEIGHT,
			2
		},
		size = {
			WIDTH,
			FRAME_HEIGHT
		}
	},
	window_frame_bottom = {
		parent = "window_root",
		position = {
			0,
			0,
			2
		},
		size = {
			WIDTH,
			FRAME_HEIGHT
		}
	},
	scrollbar_root = {
		parent = "window_root",
		position = {
			WIDTH - SCROLLBAR_WIDTH,
			FOOTER_HEIGHT + WINDOW_MARGIN,
			2
		},
		size = {
			1,
			1
		}
	},
	scrollbar_background = {
		parent = "scrollbar_root",
		position = {
			0,
			0,
			2
		},
		size = {
			SCROLLBAR_WIDTH,
			SCROLLBAR_HEIGHT
		}
	},
	scrollbar_background_hotspot = {
		parent = "scrollbar_root",
		position = {
			0,
			0,
			2
		},
		size = {
			SCROLLBAR_WIDTH,
			SCROLLBAR_HEIGHT
		}
	},
	background_stroke_top = {
		parent = "scrollbar_root",
		position = {
			0,
			SCROLLBAR_HEIGHT - SCROLLBAR_MARGIN,
			2
		},
		size = {
			SCROLLBAR_WIDTH,
			SCROLLBAR_MARGIN
		}
	},
	background_stroke_bottom = {
		parent = "scrollbar_root",
		position = {
			0,
			0,
			2
		},
		size = {
			SCROLLBAR_WIDTH,
			SCROLLBAR_MARGIN
		}
	},
	background_stroke_left = {
		parent = "scrollbar_root",
		position = {
			0,
			0,
			2
		},
		size = {
			SCROLLBAR_MARGIN,
			SCROLLBAR_HEIGHT
		}
	},
	background_stroke_right = {
		parent = "scrollbar_root",
		position = {
			SCROLLBAR_WIDTH - SCROLLBAR_MARGIN,
			0,
			2
		},
		size = {
			SCROLLBAR_MARGIN,
			SCROLLBAR_HEIGHT
		}
	},
	scrollbar = {
		parent = "scrollbar_root",
		position = {
			SCROLLBAR_MARGIN,
			SCROLLBAR_MARGIN,
			3
		},
		size = {
			SCROLLBAR_WIDTH - 2 * SCROLLBAR_MARGIN,
			BAR_HEIGHT
		}
	},
	scrollbar_stroke_top = {
		parent = "scrollbar",
		position = {
			0,
			BAR_HEIGHT - 1,
			3
		},
		size = {
			BAR_WIDTH,
			1
		}
	},
	scrollbar_stroke_bottom = {
		parent = "scrollbar",
		position = {
			0,
			0,
			3
		},
		size = {
			BAR_WIDTH,
			1
		}
	},
	output_root = {
		parent = "window_root",
		position = {
			0,
			FOOTER_HEIGHT + WINDOW_MARGIN,
			1
		},
		size = {
			1,
			1
		}
	},
	output_text = {
		parent = "output_root",
		position = {
			0,
			0,
			2
		},
		size = {
			WIDTH - SCROLLBAR_WIDTH,
			HEIGHT - HEADER_HEIGHT - FOOTER_HEIGHT - 2 * WINDOW_MARGIN
		}
	},
	input_root = {
		parent = "window_root",
		position = {
			0,
			0,
			1
		},
		size = {
			WIDTH,
			FOOTER_HEIGHT
		}
	},
	input_text_ref = {
		parent = "input_root",
		position = {
			0,
			0,
			2
		},
		size = {
			WIDTH,
			FOOTER_HEIGHT
		}
	},
	input_text = {
		parent = "input_root",
		position = {
			0,
			0,
			2
		},
		size = {
			WIDTH,
			FOOTER_HEIGHT
		}
	},
	mask = {
		parent = "root",
		position = {
			0,
			0,
			0
		},
		size = {
			WIDTH,
			HEIGHT
		}
	}
}
local window_widget = {
	scenegraph_id = "window_root",
	element = {
		passes = {
			{
				style_id = "frame_top",
				pass_type = "texture_uv",
				content_id = "frame_top"
			},
			{
				style_id = "frame_bottom",
				pass_type = "texture_uv",
				content_id = "frame_bottom"
			},
			{
				style_id = "background",
				pass_type = "texture_uv",
				content_id = "background"
			}
		}
	},
	content = {
		background = {
			texture_id = "infoslate_bg",
			uvs = {
				{
					0,
					0
				},
				{
					1,
					1
				}
			}
		},
		frame_top = {
			texture_id = "infoslate_frame_02_horizontal",
			uvs = {
				{
					0,
					0
				},
				{
					1,
					1
				}
			}
		},
		frame_bottom = {
			texture_id = "infoslate_frame_02_horizontal",
			uvs = {
				{
					0,
					0
				},
				{
					1,
					1
				}
			}
		}
	},
	style = {
		frame_top = {
			scenegraph_id = "window_frame_top",
			masked = false,
			color = Colors.get_table("white")
		},
		frame_bottom = {
			scenegraph_id = "window_frame_bottom",
			masked = false,
			color = Colors.get_table("white")
		},
		background = {
			scenegraph_id = "window_background",
			masked = false,
			color = Colors.get_table("white")
		}
	}
}
local input_widget = {
	scenegraph_id = "input_root",
	element = {
		passes = {
			{
				pass_type = "rect",
				style_id = "background"
			},
			{
				pass_type = "rect",
				style_id = "background_header"
			},
			{
				pass_type = "rect",
				style_id = "background_header_front"
			},
			{
				style_id = "text",
				pass_type = "text",
				text_id = "text_field"
			},
			{
				style_id = "header_text",
				pass_type = "text",
				text_id = "header_field"
			}
		}
	},
	content = {
		text_index = 1,
		header_field = "",
		caret_index = 1,
		text_field = ""
	},
	style = {
		background = {
			color = Colors.get_table("black"),
			size = {
				WIDTH,
				FOOTER_HEIGHT
			}
		},
		background_header = {
			scenegraph_id = "window_frame_top",
			color = Colors.get_table("very_dark_gray"),
			size = {
				WIDTH,
				FOOTER_HEIGHT
			}
		},
		background_header_front = {
			scenegraph_id = "window_frame_top",
			color = Colors.get_table("black"),
			size = {
				WIDTH - 2 * HEADER_BORDER,
				FOOTER_HEIGHT - 2 * HEADER_BORDER
			},
			offset = {
				HEADER_BORDER,
				HEADER_BORDER,
				1
			}
		},
		text = {
			font_size = 22,
			scenegraph_id = "input_text",
			horizontal_scroll = true,
			pixel_perfect = false,
			vertical_alignment = "top",
			dynamic_font = true,
			font_type = "hell_shark_arial",
			text_color = Colors.get_table("white"),
			offset = {
				0,
				6,
				3
			},
			caret_size = {
				2,
				26
			},
			caret_offset = {
				-3,
				-4,
				4
			},
			caret_color = Colors.get_table("white")
		},
		header_text = {
			horizontal_alignment = "left",
			scenegraph_id = "window_frame_top",
			font_size = 18,
			pixel_perfect = false,
			vertical_alignment = "bottom",
			dynamic_font = true,
			font_type = "hell_shark_arial",
			text_color = Colors.get_table("white"),
			offset = {
				0,
				0,
				3
			}
		}
	}
}
local output_widget = {
	scenegraph_id = "output_root",
	element = UIElements.TextAreaChat,
	content = {
		text_start_offset = 0,
		message_tables = {}
	},
	style = {
		background = {
			corner_radius = 0,
			color = Colors.get_table("black")
		},
		text = {
			word_wrap = true,
			scenegraph_id = "output_text",
			font_size = 20,
			pixel_perfect = false,
			vertical_alignment = "bottom",
			dynamic_font = true,
			font_type = "hell_shark_arial",
			text_color = Colors.get_table("white"),
			name_color = Colors.get_table("sky_blue"),
			name_color_dev = Colors.get_table("cheeseburger"),
			name_color_system = Colors.get_table("white"),
			offset = {
				0,
				0,
				3
			}
		}
	}
}
local scrollbar_widget = {
	scenegraph_id = "scrollbar_root",
	element = {
		passes = {
			{
				pass_type = "rect",
				style_id = "background",
				texture_id = "background_rect"
			},
			{
				pass_type = "rect",
				style_id = "background_stroke_top",
				texture_id = "background_stroke_top_rect"
			},
			{
				pass_type = "rect",
				style_id = "background_stroke_bottom",
				texture_id = "background_stroke_bottom_rect"
			},
			{
				pass_type = "rect",
				style_id = "background_stroke_left",
				texture_id = "background_stroke_left_rect"
			},
			{
				pass_type = "rect",
				style_id = "background_stroke_right",
				texture_id = "background_stroke_right_rect"
			},
			{
				style_id = "scrollbar",
				pass_type = "local_offset",
				offset_function = function (ui_scenegraph, ui_style, ui_content)
					local local_position = UISceneGraph.get_local_position(ui_scenegraph, ui_style.scenegraph_id)
					local bar_height = ui_content.scroll_bar_height
					local half_bar_height = bar_height / 2
					local min = ui_content.scroll_offset_min
					local max = ui_content.scroll_offset_max
					local y_pos = math.min(min + (max - min) * ui_content.internal_scroll_value, max - bar_height)
					local_position[2] = y_pos
					ui_content.scroll_value = (y_pos - min) / (max - bar_height - min)

					return 
				end
			},
			{
				pass_type = "rect",
				style_id = "scrollbar",
				texture_id = "scrollbar_rect"
			},
			{
				pass_type = "rect",
				style_id = "scrollbar_stroke_top",
				texture_id = "scrollbar_stroke_top_rect"
			},
			{
				pass_type = "rect",
				style_id = "scrollbar_stroke_bottom",
				texture_id = "scrollbar_stroke_bottom_rect"
			},
			{
				pass_type = "hover",
				style_id = "background_hotspot"
			},
			{
				style_id = "background_hotspot",
				pass_type = "held",
				held_function = function (ui_scenegraph, ui_style, ui_content, input_service)
					local cursor = UIInverseScaleVectorToResolution(input_service.get(input_service, "cursor"))
					local scenegraph_id = ui_style.scenegraph_id
					local world_position = UISceneGraph.get_world_position(ui_scenegraph, scenegraph_id)
					local bar_height = ui_content.scroll_bar_height
					local half_bar_size = bar_height / 2
					local start_delta_cursor = half_bar_size
					local y_pos = cursor[2] - start_delta_cursor
					local size = UISceneGraph.get_size(ui_scenegraph, scenegraph_id)
					local current_offset_from_bottom = y_pos - world_position[2]
					local current_offset_center_bar = current_offset_from_bottom
					local min_world_pos = world_position[2] + half_bar_size
					local scroll_offset_max = ui_content.scroll_offset_max
					local max_world_pos = (world_position[2] + scroll_offset_max) - half_bar_size - ui_content.scroll_offset_min
					local current_position = math.clamp(current_offset_center_bar, 0, size[2])
					local delta_value = math.min(current_position / size[2], 1)
					ui_content.internal_scroll_value = delta_value

					return 
				end
			}
		}
	},
	content = {
		scroll_offset_min = 0,
		internal_scroll_value = 0,
		scroll_value = 0,
		scroll_offset_max = SCROLLBAR_HEIGHT,
		scroll_bar_height = BAR_HEIGHT
	},
	style = {
		background_hotspot = {
			scenegraph_id = "scrollbar_background_hotspot",
			color = {
				0,
				0,
				0,
				0
			}
		},
		background = {
			scenegraph_id = "scrollbar_background",
			color = Colors.get_table("gray")
		},
		scrollbar = {
			scenegraph_id = "scrollbar",
			color = Colors.get_table("light_gray")
		},
		background_stroke_top = {
			scenegraph_id = "background_stroke_top",
			color = Colors.get_table("black")
		},
		background_stroke_bottom = {
			scenegraph_id = "background_stroke_bottom",
			color = Colors.get_table("black")
		},
		background_stroke_left = {
			scenegraph_id = "background_stroke_left",
			color = Colors.get_table("black")
		},
		background_stroke_right = {
			scenegraph_id = "background_stroke_right",
			color = Colors.get_table("black")
		},
		scrollbar_stroke_top = {
			scenegraph_id = "scrollbar_stroke_top",
			color = Colors.get_table("black")
		},
		scrollbar_stroke_bottom = {
			scenegraph_id = "scrollbar_stroke_bottom",
			color = Colors.get_table("black")
		}
	}
}

return {
	WIDTH = WIDTH,
	HEIGHT = HEIGHT,
	scenegraph_definition = scenegraph_definition,
	window_widget = window_widget,
	output_widget = output_widget,
	input_widget = input_widget,
	scrollbar_widget = scrollbar_widget
}
