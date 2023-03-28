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
			text = "bogenhafen_intro_video_1",
			start_timestamp = "00:10:70",
			fade_in_duration = 0.3,
			end_timestamp = "00:12:70",
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
			text = "bogenhafen_intro_video_2",
			start_timestamp = "00:17:10",
			fade_in_duration = 0.3,
			end_timestamp = "00:23:20",
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
			text = "bogenhafen_intro_video_3",
			start_timestamp = "00:45:70",
			fade_in_duration = 0.3,
			end_timestamp = "00:52:10",
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
			text = "bogenhafen_intro_video_4",
			start_timestamp = "00:54:70",
			fade_in_duration = 0.3,
			end_timestamp = "00:59:20",
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
			text = "bogenhafen_intro_video_5",
			start_timestamp = "01:11:70",
			fade_in_duration = 0.3,
			end_timestamp = "01:16:60",
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
			text = "bogenhafen_intro_video_6",
			start_timestamp = "01:16:60",
			fade_in_duration = 0.3,
			end_timestamp = "01:22:20",
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
			text = "bogenhafen_intro_video_7",
			start_timestamp = "01:23:10",
			fade_in_duration = 0.3,
			end_timestamp = "01:29:20",
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
			text = "bogenhafen_intro_video_8",
			start_timestamp = "01:33:10",
			fade_in_duration = 0.3,
			end_timestamp = "01:37:20",
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
			text = "bogenhafen_intro_video_9",
			start_timestamp = "01:37:70",
			fade_in_duration = 0.3,
			end_timestamp = "01:42:10",
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
			text = "bogenhafen_intro_video_10",
			start_timestamp = "01:51:70",
			fade_in_duration = 0.3,
			end_timestamp = "01:55:60",
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
			text = "bogenhafen_intro_video_11",
			start_timestamp = "02:02:10",
			fade_in_duration = 0.3,
			end_timestamp = "02:05:40",
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
			text = "bogenhafen_intro_video_12",
			start_timestamp = "02:26:70",
			fade_in_duration = 0.3,
			end_timestamp = "02:32:50",
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
			text = "bogenhafen_intro_video_13",
			start_timestamp = "02:35:40",
			fade_in_duration = 0.3,
			end_timestamp = "02:37:70",
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
			text = "bogenhafen_intro_video_14",
			start_timestamp = "02:39:70",
			fade_in_duration = 0.3,
			end_timestamp = "02:45:40",
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
