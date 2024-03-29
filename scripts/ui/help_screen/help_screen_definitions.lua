﻿-- chunkname: @scripts/ui/help_screen/help_screen_definitions.lua

local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.default,
		},
		size = {
			1920,
			1080,
		},
	},
	background_rect = {
		horizontal_alignment = "left",
		parent = "root",
		vertical_alignment = "bottom",
		position = {
			0,
			0,
			10,
		},
		size = {
			1920,
			1080,
		},
	},
	sheet = {
		horizontal_alignment = "center",
		parent = "background_rect",
		vertical_alignment = "center",
		position = {
			0,
			0,
			10,
		},
		size = {
			1440,
			810,
		},
	},
	text_area = {
		horizontal_alignment = "right",
		parent = "sheet",
		vertical_alignment = "bottom",
		position = {
			-150,
			100,
			10,
		},
		size = {
			600,
			500,
		},
	},
	image = {
		horizontal_alignment = "left",
		parent = "text_area",
		vertical_alignment = "top",
		position = {
			-540,
			0,
			10,
		},
		size = {
			620,
			417,
		},
	},
	page_indicator = {
		horizontal_alignment = "center",
		parent = "sheet",
		vertical_alignment = "bottom",
		size = {
			250,
			50,
		},
		offset = {
			0,
			35,
			2,
		},
	},
}

local function help_screen_widget_func(num_pages, current_page)
	local debug = false

	num_pages = num_pages or 3

	local textures = {}

	for i = 1, num_pages do
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
					style_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "sheet",
					texture_id = "background_image",
				},
				{
					pass_type = "rect",
					style_id = "text_area",
					content_check_function = function (content)
						return content.debug
					end,
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text_field",
				},
				{
					pass_type = "text",
					style_id = "header",
					text_id = "header",
				},
				{
					pass_type = "text",
					style_id = "page_header",
					text_id = "page_header",
				},
				{
					pass_type = "texture",
					style_id = "image",
					texture_id = "image",
				},
				{
					pass_type = "rect",
					style_id = "image_area",
					content_check_function = function (content)
						return content.debug
					end,
				},
				{
					pass_type = "texture",
					style_id = "image",
					texture_id = "image",
				},
				{
					pass_type = "texture",
					style_id = "image",
					texture_id = "image",
				},
				{
					pass_type = "rect",
					style_id = "page_indicator_area",
					content_check_function = function (content)
						return content.debug
					end,
				},
				{
					pass_type = "centered_texture_amount",
					style_id = "page_indicator",
					texture_id = "indicators",
				},
			},
		},
		content = {
			background_image = "large_frame_01",
			header = "Help Screen Header",
			image = "craft_bg",
			page_header = "Page Header",
			text_field = "Text Field",
			indicators = textures,
			num_pages = num_pages,
			debug = debug,
		},
		style = {
			background = {
				offset = {
					0,
					0,
					100,
				},
				color = {
					192,
					0,
					0,
					0,
				},
				size = {
					1920,
					1080,
				},
			},
			sheet = {
				scenegraph_id = "sheet",
				offset = {
					0,
					0,
					101,
				},
			},
			text = {
				dynamic_font = true,
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				pixel_perfect = true,
				scenegraph_id = "text_area",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.color_definitions.white,
				offset = {
					0,
					0,
					103,
				},
				size = {
					600,
					500,
				},
			},
			header = {
				dynamic_font = true,
				font_size = 26,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				pixel_perfect = true,
				scenegraph_id = "sheet",
				vertical_alignment = "top",
				text_color = Colors.color_definitions.cheeseburger,
				offset = {
					0,
					-3,
					103,
				},
			},
			page_header = {
				dynamic_font = true,
				font_size = 42,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				pixel_perfect = true,
				scenegraph_id = "sheet",
				vertical_alignment = "top",
				text_color = Colors.color_definitions.cheeseburger,
				offset = {
					0,
					-100,
					103,
				},
			},
			text_area = {
				scenegraph_id = "text_area",
				offset = {
					0,
					0,
					102,
				},
				color = {
					255,
					255,
					0,
					0,
				},
			},
			image = {
				scenegraph_id = "image",
				offset = {
					0,
					0,
					103,
				},
				size = {
					282.5,
					417,
				},
			},
			image_area = {
				scenegraph_id = "image",
				offset = {
					0,
					0,
					102,
				},
				color = {
					255,
					255,
					0,
					0,
				},
			},
			page_indicator_area = {
				scenegraph_id = "page_indicator",
				offset = {
					0,
					0,
					104,
				},
				color = {
					255,
					255,
					0,
					0,
				},
			},
			page_indicator = {
				scenegraph_id = "page_indicator",
				spacing = 6,
				texture_axis = 1,
				offset = {
					0,
					0,
					105,
				},
				texture_size = {
					29,
					29,
				},
				texture_amount = num_pages,
			},
		},
	}
end

return {
	scenegraph_definition = scenegraph_definition,
	help_screen_widget_func = help_screen_widget_func,
}
