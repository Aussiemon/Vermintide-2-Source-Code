local template_settings = {
	template_1 = {
		{
			fade_out_duration = 0.4,
			font_upper_case = true,
			localize = true,
			font_size = 70,
			text = "tutorial_intro_fatshark_games",
			start_timestamp = "00:00:00",
			fade_in_duration = 0.5,
			end_timestamp = "00:03:90",
			font_type = "hell_shark_header",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				0,
				0
			}
		},
		{
			fade_out_duration = 0.4,
			font_upper_case = true,
			localize = true,
			font_size = 70,
			text = "tutorial_intro_games_workshop",
			start_timestamp = "00:08:90",
			fade_in_duration = 0.5,
			end_timestamp = "00:12:80",
			font_type = "hell_shark_header",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				0,
				0
			}
		},
		{
			fade_out_duration = 0.4,
			font_upper_case = true,
			localize = true,
			font_size = 60,
			text = "tutorial_intro_end_times_adventure",
			start_timestamp = "00:17:80",
			fade_in_duration = 0.5,
			end_timestamp = "00:21:70",
			font_type = "hell_shark_header",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				0,
				0
			}
		},
		{
			fade_out_duration = 0.51,
			start_timestamp = "00:28:70",
			image = "vermintide_2_logo_tutorial",
			fade_in_duration = 1,
			end_timestamp = "00:33:21",
			image_size = {
				1920,
				1080
			},
			offset = {
				0,
				0,
				0
			}
		}
	},
	template_2 = {
		{
			fade_out_duration = 0.4,
			font_upper_case = false,
			localize = true,
			font_size = 30,
			text = "tutorial_intro_presents",
			start_timestamp = "00:00:00",
			fade_in_duration = 0.5,
			end_timestamp = "00:03:90",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				-50,
				0
			}
		},
		{
			fade_out_duration = 0.4,
			font_upper_case = false,
			localize = true,
			font_size = 28,
			text = "tutorial_intro_in_association_with",
			start_timestamp = "00:08:90",
			fade_in_duration = 0.5,
			end_timestamp = "00:12:80",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				50,
				0
			}
		},
		{
			fade_out_duration = 0.5,
			font_upper_case = false,
			localize = true,
			font_size = 30,
			text = "tutorial_intro_an",
			start_timestamp = "00:17:80",
			fade_in_duration = 0.4,
			end_timestamp = "00:21:70",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				50,
				0
			}
		}
	},
	template_3 = {
		{
			fade_out_duration = 0.4,
			font_upper_case = false,
			localize = false,
			font_size = 30,
			text = "",
			start_timestamp = "00:00:00",
			fade_in_duration = 0.5,
			end_timestamp = "00:03:90",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				-50,
				0
			}
		},
		{
			fade_out_duration = 0.4,
			font_upper_case = false,
			localize = false,
			font_size = 28,
			text = "",
			start_timestamp = "00:08:90",
			fade_in_duration = 0.5,
			end_timestamp = "00:12:80",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				50,
				0
			}
		},
		{
			fade_out_duration = 0.5,
			font_upper_case = false,
			localize = true,
			font_size = 30,
			text = "tutorial_intro_adventure",
			start_timestamp = "00:17:80",
			fade_in_duration = 0.4,
			end_timestamp = "00:21:70",
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				-45,
				0
			}
		}
	}
}

local function convert_string_timestamp_to_seconds(string_timestamp)
	local minutes, seconds, hundredths = string.match(string_timestamp, "(%d+)%:(%d+)%:(%d+)")
	local time_in_seconds = minutes * 60 + seconds + hundredths * 0.01

	return time_in_seconds
end

for template_name, template in pairs(template_settings) do
	for index, entry in ipairs(template) do
		local start_timestamp = entry.start_timestamp
		local end_timestamp = entry.end_timestamp
		local start_time_in_seconds = convert_string_timestamp_to_seconds(start_timestamp)
		local end_time_in_seconds = convert_string_timestamp_to_seconds(end_timestamp)
		local duration = end_time_in_seconds - start_time_in_seconds
		entry.duration = duration
		entry.start_time = start_time_in_seconds
		entry.end_time = end_time_in_seconds
	end
end

return {
	templates = template_settings
}
