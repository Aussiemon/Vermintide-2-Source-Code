local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.default
		},
		size = {
			1920,
			1080
		}
	},
	background_rect = {
		vertical_alignment = "bottom",
		parent = "root",
		horizontal_alignment = "left",
		position = {
			0,
			0,
			10
		},
		size = {
			1920,
			1080
		}
	},
	sheet = {
		vertical_alignment = "center",
		parent = "background_rect",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			10
		},
		size = {
			1440,
			810
		}
	},
	text_area = {
		vertical_alignment = "bottom",
		parent = "sheet",
		horizontal_alignment = "right",
		position = {
			-150,
			100,
			10
		},
		size = {
			600,
			500
		}
	},
	image = {
		vertical_alignment = "top",
		parent = "text_area",
		horizontal_alignment = "left",
		position = {
			-540,
			0,
			10
		},
		size = {
			620,
			417
		}
	},
	page_indicator = {
		vertical_alignment = "bottom",
		parent = "sheet",
		horizontal_alignment = "center",
		size = {
			250,
			50
		},
		offset = {
			0,
			35,
			2
		}
	}
}

local function help_screen_widget_func(num_pages, current_page)
	local debug = false
	num_pages = num_pages or 3
	local textures = {}

	for i = 1, num_pages, 1 do
		if i == current_page then
			textures[#textures + 1] = "trait_slot_cover"
		else
			textures[#textures + 1] = "reroll_trait_slot_01"
		end
	end

	return {
		scenegraph_id = "background_rect",
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "background"
				},
				{
					texture_id = "background_image",
					style_id = "sheet",
					pass_type = "texture"
				},
				{
					style_id = "text_area",
					pass_type = "rect",
					content_check_function = function (content)
						return content.debug
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text_field"
				},
				{
					style_id = "header",
					pass_type = "text",
					text_id = "header"
				},
				{
					style_id = "page_header",
					pass_type = "text",
					text_id = "page_header"
				},
				{
					texture_id = "image",
					style_id = "image",
					pass_type = "texture"
				},
				{
					style_id = "image_area",
					pass_type = "rect",
					content_check_function = function (content)
						return content.debug
					end
				},
				{
					texture_id = "image",
					style_id = "image",
					pass_type = "texture"
				},
				{
					texture_id = "image",
					style_id = "image",
					pass_type = "texture"
				},
				{
					style_id = "page_indicator_area",
					pass_type = "rect",
					content_check_function = function (content)
						return content.debug
					end
				},
				{
					texture_id = "indicators",
					style_id = "page_indicator",
					pass_type = "centered_texture_amount"
				}
			}
		},
		content = {
			page_header = "Page Header",
			background_image = "large_frame_01",
			header = "Help Screen Header",
			image = "craft_bg",
			text_field = "Text Field",
			indicators = textures,
			num_pages = num_pages,
			debug = debug
		},
		style = {
			background = {
				offset = {
					0,
					0,
					100
				},
				color = {
					192,
					0,
					0,
					0
				},
				size = {
					1920,
					1080
				}
			},
			sheet = {
				scenegraph_id = "sheet",
				offset = {
					0,
					0,
					101
				}
			},
			text = {
				font_size = 24,
				scenegraph_id = "text_area",
				localize = false,
				word_wrap = true,
				pixel_perfect = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.color_definitions.white,
				offset = {
					0,
					0,
					103
				},
				size = {
					600,
					500
				}
			},
			header = {
				font_size = 26,
				scenegraph_id = "sheet",
				localize = false,
				pixel_perfect = true,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.color_definitions.cheeseburger,
				offset = {
					0,
					-3,
					103
				}
			},
			page_header = {
				font_size = 42,
				scenegraph_id = "sheet",
				localize = false,
				pixel_perfect = true,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.color_definitions.cheeseburger,
				offset = {
					0,
					-100,
					103
				}
			},
			text_area = {
				scenegraph_id = "text_area",
				offset = {
					0,
					0,
					102
				},
				color = {
					255,
					255,
					0,
					0
				}
			},
			image = {
				scenegraph_id = "image",
				offset = {
					0,
					0,
					103
				},
				size = {
					282.5,
					417
				}
			},
			image_area = {
				scenegraph_id = "image",
				offset = {
					0,
					0,
					102
				},
				color = {
					255,
					255,
					0,
					0
				}
			},
			page_indicator_area = {
				scenegraph_id = "page_indicator",
				offset = {
					0,
					0,
					104
				},
				color = {
					255,
					255,
					0,
					0
				}
			},
			page_indicator = {
				scenegraph_id = "page_indicator",
				spacing = 6,
				texture_axis = 1,
				offset = {
					0,
					0,
					105
				},
				texture_size = {
					29,
					29
				},
				texture_amount = num_pages
			}
		}
	}
end

return {
	scenegraph_definition = scenegraph_definition,
	help_screen_widget_func = help_screen_widget_func
}
