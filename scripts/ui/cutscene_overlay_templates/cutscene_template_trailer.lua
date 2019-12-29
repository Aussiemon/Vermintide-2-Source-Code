local utils = require("scripts/ui/cutscene_overlay_templates/cutscene_utils")
local start_layer = 700
local template_settings = {
	template_1 = {
		{
			fade_out_duration = 0.3,
			font_size = 30,
			localize = true,
			vertical_alignment = "bottom",
			word_wrap = true,
			font_upper_case = false,
			horizontal_alignment = "center",
			text = "intro_subtitle_01",
			start_timestamp = "00:04:00",
			fade_in_duration = 0.3,
			end_timestamp = "00:10:50",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				50,
				start_layer
			}
		},
		{
			fade_out_duration = 0.3,
			font_size = 30,
			localize = true,
			vertical_alignment = "bottom",
			word_wrap = true,
			font_upper_case = false,
			horizontal_alignment = "center",
			text = "intro_subtitle_02",
			start_timestamp = "00:12:70",
			fade_in_duration = 0.3,
			end_timestamp = "00:33:50",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				50,
				start_layer
			}
		},
		{
			fade_out_duration = 0.3,
			font_size = 30,
			localize = true,
			vertical_alignment = "bottom",
			word_wrap = true,
			font_upper_case = false,
			horizontal_alignment = "center",
			text = "intro_subtitle_03",
			start_timestamp = "00:35:00",
			fade_in_duration = 0.3,
			end_timestamp = "00:36:60",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				50,
				start_layer
			}
		},
		{
			fade_out_duration = 0.3,
			font_size = 30,
			localize = true,
			vertical_alignment = "bottom",
			word_wrap = true,
			font_upper_case = false,
			horizontal_alignment = "center",
			text = "intro_subtitle_05",
			start_timestamp = "00:38:00",
			fade_in_duration = 0.3,
			end_timestamp = "00:54:20",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				50,
				start_layer
			}
		},
		{
			fade_out_duration = 0.3,
			font_size = 30,
			localize = true,
			vertical_alignment = "bottom",
			word_wrap = true,
			font_upper_case = false,
			horizontal_alignment = "center",
			text = "intro_subtitle_06",
			start_timestamp = "00:54:50",
			fade_in_duration = 0.3,
			end_timestamp = "01:15:10",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				50,
				start_layer
			}
		},
		{
			fade_out_duration = 0.3,
			font_size = 30,
			localize = true,
			vertical_alignment = "bottom",
			word_wrap = true,
			font_upper_case = false,
			horizontal_alignment = "center",
			text = "intro_subtitle_07",
			start_timestamp = "01:17:00",
			fade_in_duration = 0.3,
			end_timestamp = "01:27:60",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				50,
				start_layer
			}
		},
		{
			fade_out_duration = 0.3,
			font_size = 30,
			localize = true,
			vertical_alignment = "bottom",
			word_wrap = true,
			font_upper_case = false,
			horizontal_alignment = "center",
			text = "intro_subtitle_08",
			start_timestamp = "01:28:00",
			fade_in_duration = 0.3,
			end_timestamp = "01:42:20",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				50,
				start_layer
			}
		}
	}
}

utils.convert_string_timestamps_to_seconds(template_settings)

return {
	templates = template_settings
}
