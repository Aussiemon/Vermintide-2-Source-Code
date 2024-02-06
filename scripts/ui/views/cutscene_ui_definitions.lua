-- chunkname: @scripts/ui/views/cutscene_ui_definitions.lua

local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.cutscene,
		},
		size = {
			1920,
			1080,
		},
	},
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.cutscene,
		},
		size = {
			1920,
			1080,
		},
	},
	letterbox_top_bar = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			1920,
			UISettings.cutscene_ui.letterbox.bar_height,
		},
		position = {
			0,
			0,
			1,
		},
	},
	letterbox_bottom_bar = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			1920,
			UISettings.cutscene_ui.letterbox.bar_height,
		},
		position = {
			0,
			0,
			1,
		},
	},
	checkbox_pivot = {
		horizontal_alignment = "left",
		parent = "letterbox_bottom_bar",
		vertical_alignment = "center",
		size = {
			40,
			40,
		},
		position = {
			-20,
			0,
			1,
		},
	},
	fx_fade_rect = {
		horizontal_alignment = "left",
		parent = "root",
		vertical_alignment = "bottom",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			2,
		},
	},
	fx_text_popup = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		size = {
			1920,
			200,
		},
		position = {
			0,
			140,
			2,
		},
	},
}

local function make_checkbox(i)
	local frame_settings = UIFrameSettings.menu_frame_06

	return {
		scenegraph_id = "checkbox_pivot",
		offset = {
			i * 50,
			0,
			0,
		},
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "check",
					texture_id = "check",
					content_check_function = function (content)
						return content.checked
					end,
				},
				{
					pass_type = "rect",
					style_id = "background",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
			},
		},
		content = {
			check = "matchmaking_checkbox",
			frame = frame_settings.texture,
		},
		style = {
			background = {
				color = {
					100,
					8,
					8,
					8,
				},
			},
			frame = {
				area_size = {
					40,
					40,
				},
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				offset = {
					0,
					0,
					1,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			check = {
				texture_size = {
					37,
					31,
				},
				offset = {
					4,
					6,
					2,
				},
				color = Colors.get_color_table_with_alpha("dark_olive_green", 255),
			},
		},
	}
end

local widget_definitions = {
	checkbox_1 = make_checkbox(1),
	checkbox_2 = make_checkbox(2),
	checkbox_3 = make_checkbox(3),
	checkbox_4 = make_checkbox(4),
	letterbox = {
		scenegraph_id = "screen",
		element = {
			passes = {
				{
					pass_type = "rect",
					scenegraph_id = "letterbox_top_bar",
					style_id = "letterbox_top_bar",
				},
				{
					pass_type = "rect",
					scenegraph_id = "letterbox_bottom_bar",
					style_id = "letterbox_bottom_bar",
				},
			},
		},
		content = {},
		style = {
			letterbox_top_bar = {
				horizontal_alignment = "center",
				vertical_alignment = "top",
				color = {
					255,
					0,
					0,
					0,
				},
			},
			letterbox_bottom_bar = {
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				color = {
					255,
					0,
					0,
					0,
				},
			},
		},
	},
	fx_fade = {
		scenegraph_id = "screen",
		element = {
			passes = {
				{
					pass_type = "rect",
					scenegraph_id = "screen",
					style_id = "fx_fade_rect",
					content_check_function = function (content, style_data)
						if not content or not style_data then
							return
						end

						local alpha = content.fx_fade_alpha * 255

						style_data.color[1] = alpha

						return alpha > 0
					end,
				},
			},
		},
		content = {
			fx_fade_alpha = 0,
		},
		style = {
			fx_fade_rect = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				color = {
					0,
					0,
					0,
					0,
				},
			},
		},
	},
	fx_text_popup = {
		scenegraph_id = "fx_text_popup",
		element = {
			passes = {
				{
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content, style_data)
						if not content or not style_data then
							return
						end

						local alpha = content.fx_text_popup_alpha * 255

						style_data.text_color[1] = alpha

						return alpha > 0
					end,
				},
			},
		},
		content = {
			fx_text_popup_alpha = 0,
			text = "",
		},
		style = {
			dynamic_font = true,
			font_size = 50,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			localize = true,
			vertical_alignment = "top",
			word_wrap = true,
			text_color = {
				0,
				255,
				255,
				255,
			},
		},
	},
}

return {
	scenegraph = scenegraph_definition,
	widgets = widget_definitions,
}
