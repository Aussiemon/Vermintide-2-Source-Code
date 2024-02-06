-- chunkname: @scripts/ui/cutscene_overlay_templates/cutscene_template_belakor_intro.lua

local utils = require("scripts/ui/cutscene_overlay_templates/cutscene_utils")
local start_layer = 700
local template_settings = {
	template_1 = {
		{
			end_timestamp = "00:04:30",
			fade_in_duration = 0.3,
			fade_out_duration = 0.3,
			font_size = 30,
			font_type = "hell_shark",
			font_upper_case = false,
			horizontal_alignment = "center",
			localize = true,
			start_timestamp = "00:02:00",
			text = "belakor_intro_video_1",
			vertical_alignment = "bottom",
			word_wrap = true,
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				20,
				start_layer,
			},
		},
		{
			end_timestamp = "00:07:90",
			fade_in_duration = 0.3,
			fade_out_duration = 0.3,
			font_size = 30,
			font_type = "hell_shark",
			font_upper_case = false,
			horizontal_alignment = "center",
			localize = true,
			start_timestamp = "00:05:40",
			text = "belakor_intro_video_2",
			vertical_alignment = "bottom",
			word_wrap = true,
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				20,
				start_layer,
			},
		},
		{
			end_timestamp = "00:18:70",
			fade_in_duration = 0.3,
			fade_out_duration = 0.3,
			font_size = 30,
			font_type = "hell_shark",
			font_upper_case = false,
			horizontal_alignment = "center",
			localize = true,
			start_timestamp = "00:12:70",
			text = "belakor_intro_video_3",
			vertical_alignment = "bottom",
			word_wrap = true,
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				20,
				start_layer,
			},
		},
		{
			end_timestamp = "00:39:10",
			fade_in_duration = 0.3,
			fade_out_duration = 0.3,
			font_size = 30,
			font_type = "hell_shark",
			font_upper_case = false,
			horizontal_alignment = "center",
			localize = true,
			start_timestamp = "00:34:40",
			text = "belakor_intro_video_4",
			vertical_alignment = "bottom",
			word_wrap = true,
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				20,
				start_layer,
			},
		},
	},
}

utils.convert_string_timestamps_to_seconds(template_settings)

return {
	templates = template_settings,
}
