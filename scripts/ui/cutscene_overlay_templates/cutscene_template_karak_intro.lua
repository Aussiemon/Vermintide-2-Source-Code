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
			text = "karak_intro_subtitle_01",
			start_timestamp = "00:08:40",
			fade_in_duration = 0.3,
			end_timestamp = "00:15:10",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				20,
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
			text = "karak_intro_subtitle_02",
			start_timestamp = "00:17:30",
			fade_in_duration = 0.3,
			end_timestamp = "00:21:60",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				20,
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
			text = "karak_intro_subtitle_03",
			start_timestamp = "00:22:70",
			fade_in_duration = 0.3,
			end_timestamp = "00:27:60",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				20,
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
			text = "karak_intro_subtitle_04",
			start_timestamp = "00:27:60",
			fade_in_duration = 0.3,
			end_timestamp = "00:30:50",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				20,
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
			text = "karak_intro_subtitle_05",
			start_timestamp = "00:45:50",
			fade_in_duration = 0.3,
			end_timestamp = "00:47:60",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				20,
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
			text = "karak_intro_subtitle_06",
			start_timestamp = "00:47:60",
			fade_in_duration = 0.3,
			end_timestamp = "00:51:00",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				20,
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
			text = "karak_intro_subtitle_07",
			start_timestamp = "00:51:00",
			fade_in_duration = 0.3,
			end_timestamp = "00:52:90",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				20,
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
			text = "karak_intro_subtitle_08",
			start_timestamp = "00:58:50",
			fade_in_duration = 0.3,
			end_timestamp = "01:04:20",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				20,
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
			text = "karak_intro_subtitle_09",
			start_timestamp = "01:26:90",
			fade_in_duration = 0.3,
			end_timestamp = "01:31:10",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				20,
				start_layer
			}
		}
	}
}

utils.convert_string_timestamps_to_seconds(template_settings)

return {
	templates = template_settings
}
