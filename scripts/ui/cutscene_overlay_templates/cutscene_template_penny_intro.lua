-- chunkname: @scripts/ui/cutscene_overlay_templates/cutscene_template_penny_intro.lua

local utils = require("scripts/ui/cutscene_overlay_templates/cutscene_utils")
local start_layer = 700
local template_settings = {
	template_1 = {
		{
			end_timestamp = "00:10:73",
			fade_in_duration = 0.3,
			fade_out_duration = 0.3,
			font_size = 30,
			font_type = "hell_shark",
			font_upper_case = false,
			horizontal_alignment = "center",
			localize = true,
			start_timestamp = "00:02:30",
			text = "drachenfels_intro_video_1",
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
			end_timestamp = "00:20:09",
			fade_in_duration = 0.3,
			fade_out_duration = 0.3,
			font_size = 30,
			font_type = "hell_shark",
			font_upper_case = false,
			horizontal_alignment = "center",
			localize = true,
			start_timestamp = "00:11:85",
			text = "drachenfels_intro_video_2",
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
			end_timestamp = "00:33:53",
			fade_in_duration = 0.3,
			fade_out_duration = 0.3,
			font_size = 30,
			font_type = "hell_shark",
			font_upper_case = false,
			horizontal_alignment = "center",
			localize = true,
			start_timestamp = "00:22:79",
			text = "drachenfels_intro_video_3",
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
			end_timestamp = "00:36:89",
			fade_in_duration = 0.3,
			fade_out_duration = 0.3,
			font_size = 30,
			font_type = "hell_shark",
			font_upper_case = false,
			horizontal_alignment = "center",
			localize = true,
			start_timestamp = "00:35:50",
			text = "drachenfels_intro_video_4",
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
