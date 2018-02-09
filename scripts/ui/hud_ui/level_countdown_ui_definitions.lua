local scenegraph_definition = {
	fullscreen_countdown = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.matchmaking
		}
	}
}
local widgets = {
	fullscreen_countdown = {
		scenegraph_id = "fullscreen_countdown",
		element = {
			passes = {
				{
					style_id = "timer_text",
					pass_type = "text",
					text_id = "timer_text"
				},
				{
					style_id = "timer_text_shadow",
					pass_type = "text",
					text_id = "timer_text"
				},
				{
					pass_type = "rect",
					style_id = "background_rect"
				}
			}
		},
		content = {
			info_text = "",
			timer_text = ""
		},
		style = {
			timer_text = {
				font_size = 180,
				word_wrap = true,
				pixel_perfect = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					2
				}
			},
			timer_text_shadow = {
				font_size = 180,
				word_wrap = true,
				pixel_perfect = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					1
				}
			},
			background_rect = {
				color = {
					0,
					0,
					0,
					0
				}
			}
		}
	}
}

return {
	scenegraph_definition = scenegraph_definition,
	widgets = widgets
}
