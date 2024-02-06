-- chunkname: @scripts/ui/views/telemetry_survey_view_definitions.lua

local COMPACT_PREVIEW_SPACING = {
	15,
	15,
}
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
	background_1 = {
		horizontal_alignment = "left",
		parent = "root",
		vertical_alignment = "bottom",
		position = {
			0,
			0,
			80,
		},
		size = {
			1920,
			1080,
		},
	},
	background_2 = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			100,
		},
		size = {
			680,
			512,
		},
	},
	headers = {
		horizontal_alignment = "center",
		parent = "background_2",
		vertical_alignment = "top",
		position = {
			0,
			-110,
			5,
		},
		size = {
			640,
			45,
		},
	},
	survey_rating_buttons = {
		horizontal_alignment = "center",
		parent = "background_2",
		vertical_alignment = "top",
		size = {
			58,
			58,
		},
		position = {
			0,
			-(275 + COMPACT_PREVIEW_SPACING[2] - 58),
			2,
		},
	},
	survey_window_button = {
		horizontal_alignment = "center",
		parent = "background_2",
		vertical_alignment = "top",
		size = {
			220,
			58,
		},
		position = {
			0,
			-(450 + COMPACT_PREVIEW_SPACING[2] - 58),
			2,
		},
	},
}
local widget_definitions = {
	background_1 = {
		scenegraph_id = "background_1",
		element = UIElements.SimpleTexture,
		content = {
			texture_id = "gradient_playerlist",
		},
		style = {
			color = {
				255,
				255,
				255,
				255,
			},
		},
	},
	background_2 = {
		scenegraph_id = "background_2",
		element = UIElements.SimpleTexture,
		content = {
			texture_id = "large_frame_01",
		},
		style = {
			color = {
				255,
				255,
				255,
				255,
			},
		},
	},
	headers = {
		scenegraph_id = "headers",
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "survey_header",
					text_id = "survey_header",
				},
				{
					pass_type = "text",
					style_id = "time_left",
					text_id = "time_left",
				},
			},
		},
		content = {
			survey_header = "telemetry_survey_header",
			time_left = "",
		},
		style = {
			survey_header = {
				dynamic_font = true,
				font_size = 42,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = true,
				word_wrap = true,
				offset = {
					0,
					0,
					0,
				},
				text_color = Colors.get_table("antique_white"),
			},
			time_left = {
				dynamic_font = true,
				font_size = 28,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				offset = {
					0,
					-40,
					0,
				},
				text_color = Colors.get_table("antique_white"),
			},
		},
	},
	continue_button = {
		scenegraph_id = "survey_window_button",
		element = UIElements.Button4States,
		content = {
			disabled = false,
			text_field = "telemetry_survey_submit_button",
			texture_click_id = "small_button_02_gold_selected",
			texture_disabled_id = "small_button_02_gold_disabled",
			texture_hover_id = "small_button_02_gold_hover",
			texture_id = "small_button_02_gold_normal",
			button_hotspot = {},
		},
		style = {
			text = {
				dynamic_font = true,
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = true,
				pixel_perfect = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_table("antique_white"),
				base_color = Colors.get_table("antique_white"),
				disabled_color = Colors.get_table("dim_gray"),
				offset = {
					0,
					5,
					2,
				},
			},
		},
	},
}
local X_OFFSET = 4

local function survey_rating_definitions(index)
	local i = index - 1
	local x_offset = (X_OFFSET + 58) * i + 29 - (58 + X_OFFSET) * 2.5
	local definition = {
		scenegraph_id = "survey_rating_buttons",
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "style_normal",
				},
				{
					pass_type = "texture",
					style_id = "style_normal",
					texture_id = "texture_id",
					content_check_function = function (content)
						return not content.button_hotspot.is_hover and content.button_hotspot.is_clicked > 0
					end,
				},
				{
					pass_type = "texture",
					style_id = "style_hover",
					texture_id = "texture_hover_id",
					content_check_function = function (content)
						return content.button_hotspot.is_hover and content.button_hotspot.is_clicked > 0
					end,
				},
				{
					pass_type = "texture",
					style_id = "style_click",
					texture_id = "texture_click_id",
					content_check_function = function (content)
						return content.button_hotspot.is_clicked == 0 or content.button_hotspot.is_selected
					end,
				},
				{
					click_check_content_id = "button_hotspot",
					pass_type = "on_click",
					click_function = function (ui_scenegraph, ui_style, ui_content, input_service)
						ui_content.button_hotspot.is_selected = true
					end,
				},
			},
		},
		content = {
			texture_click_id = "sun_icon",
			texture_hover_id = "sun_icon_selected",
			texture_id = "sun_icon",
			button_hotspot = {},
		},
		style = {
			style_normal = {
				horizontal_alignment = "center",
				color = {
					50,
					255,
					255,
					255,
				},
				offset = {
					x_offset,
					0,
					0,
				},
			},
			style_hover = {
				horizontal_alignment = "center",
				offset = {
					x_offset,
					0,
					0,
				},
			},
			style_click = {
				horizontal_alignment = "center",
				offset = {
					x_offset,
					0,
					0,
				},
			},
		},
	}

	return definition
end

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	survey_rating_definitions = survey_rating_definitions,
}
