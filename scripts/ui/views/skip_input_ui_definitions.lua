-- chunkname: @scripts/ui/views/skip_input_ui_definitions.lua

local screen_resolution = {
	1920,
	1080,
}
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.popup,
		},
		size = screen_resolution,
	},
	screen = {
		horizontal_alignment = "right",
		parent = "root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			0,
		},
		size = screen_resolution,
	},
	skip_input = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "bottom",
		position = {
			20,
			20,
			1,
		},
	},
}
local input_text_style = {
	dynamic_font = true,
	font_size = 36,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	pixel_perfect = true,
	vertical_alignment = "bottom",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("white", 255),
}

local function create_skip_widget(parent, ui_renderer, input_service)
	local gamepad_active = true
	local gamepad_texture_data, gamepad_input_text, gamepad_keymap_binding, gamepad_unassigned = UISettings.get_gamepad_input_texture_data(input_service, "cancel_video_1", gamepad_active)
	local kbm_texture_data, kbm_input_text, kbm_keymap_binding, kbm_unassigned = UISettings.get_gamepad_input_texture_data(input_service, "cancel_video_1", not gamepad_active)
	local input_text_1 = Localize("input_hold")
	local input_text_2 = Localize("to_skip")
	local font, scaled_font_size = UIFontByResolution(input_text_style)
	local text_width, text_height, min = UIRenderer.text_size(ui_renderer, input_text_1, font[1], scaled_font_size)
	local icon_offset = text_width + 10
	local gamepad_input_text_2_offset = icon_offset + gamepad_texture_data.size[1] + 10
	local kbm_text_width, kbm_text_height, kbm_min = UIRenderer.text_size(ui_renderer, kbm_input_text, font[1], scaled_font_size)
	local kbm_icon_middle_offset = icon_offset + kbm_texture_data[1].size[1]
	local kbm_icon_right_offset = kbm_icon_middle_offset + kbm_text_width
	local kbm_input_text_2_offset = kbm_icon_right_offset + kbm_texture_data[3].size[1] + 10

	return {
		scenegraph_id = "skip_input",
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "input_text_1",
					text_id = "input_text_1",
					content_change_function = function (content, style)
						content.gamepad_active = Managers.input:is_device_active("gamepad")

						local speed = 2
						local t, dt = Managers.time:time_and_delta("main")
						local input = input_service:get("cancel_video")
						local dir = input and 1 or -1

						content.progress = math.clamp(content.progress + dt * speed * dir, 0, 1)

						if input ~= content.input and input then
							local double_click_threshold = UISettings.double_click_threshold * 2

							content.progress = double_click_threshold >= math.abs(content.input_time - t) and 1 or content.progress
							content.input_time = t
						end

						content.input = input

						if content.progress >= 1 then
							parent:skip()
						end
					end,
				},
				{
					pass_type = "text",
					style_id = "gamepad_input_text_2",
					text_id = "input_text_2",
					content_check_function = function (content)
						return content.gamepad_active
					end,
				},
				{
					pass_type = "texture",
					style_id = "gamepad_input_icon",
					texture_id = "gamepad_input_icon",
					content_check_function = function (content)
						return content.gamepad_input_icon and content.gamepad_active
					end,
				},
				{
					pass_type = "text",
					style_id = "kbm_input_text_2",
					text_id = "input_text_2",
					content_check_function = function (content)
						return not content.gamepad_active
					end,
				},
				{
					pass_type = "text",
					style_id = "kbm_input_text",
					text_id = "kbm_input_text",
					content_check_function = function (content)
						return not content.gamepad_active
					end,
				},
				{
					pass_type = "texture",
					style_id = "kbm_input_icon_left",
					texture_id = "kbm_input_icon_left",
					content_check_function = function (content)
						return content.kbm_input_icon_left and not content.gamepad_active
					end,
				},
				{
					pass_type = "tiled_texture",
					style_id = "kbm_input_icon_middle",
					texture_id = "kbm_input_icon_middle",
					content_check_function = function (content)
						return content.kbm_input_icon_middle and not content.gamepad_active
					end,
				},
				{
					pass_type = "texture",
					style_id = "kbm_input_icon_right",
					texture_id = "kbm_input_icon_right",
					content_check_function = function (content)
						return content.kbm_input_icon_right and not content.gamepad_active
					end,
				},
				{
					pass_type = "rect",
					style_id = "hold_bar",
					content_check_function = function (content)
						return not content.gamepad_active and content.progress > 0
					end,
					content_change_function = function (content, style)
						style.size[1] = content.progress * (kbm_text_width + kbm_texture_data[1].size[1] + kbm_texture_data[3].size[1])
					end,
				},
				{
					pass_type = "rect",
					style_id = "hold_bar_bg",
					content_check_function = function (content)
						return not content.gamepad_active and content.progress > 0
					end,
					content_change_function = function (content, style)
						style.size[1] = content.progress * (kbm_text_width + kbm_texture_data[1].size[1] + kbm_texture_data[3].size[1]) + 4
					end,
				},
				{
					pass_type = "gradient_mask_texture",
					style_id = "input_icon_bar",
					texture_id = "input_icon_bar",
					content_check_function = function (content)
						return content.gamepad_active and content.gamepad_input_icon
					end,
					content_change_function = function (content, style)
						style.gradient_threshold = content.progress
					end,
				},
			},
		},
		content = {
			input_icon_bar = "controller_hold_bar",
			input_time = 0,
			progress = 0,
			input_text_1 = input_text_1,
			input_text_2 = input_text_2,
			gamepad_input_icon = gamepad_texture_data.texture,
			kbm_input_text = kbm_input_text,
			kbm_input_icon_left = kbm_texture_data[1].texture,
			kbm_input_icon_middle = kbm_texture_data[2].texture,
			kbm_input_icon_right = kbm_texture_data[3].texture,
			parent = parent,
		},
		style = {
			hold_bar = {
				color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					icon_offset,
					-10,
					1,
				},
				size = {
					0,
					8,
				},
			},
			hold_bar_bg = {
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					icon_offset - 2,
					-12,
					0,
				},
				size = {
					0,
					12,
				},
			},
			gamepad_input_icon = {
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = gamepad_texture_data.size,
				offset = {
					icon_offset,
					5,
					1,
				},
			},
			input_icon_bar = {
				gradient_threshold = 0,
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					gamepad_texture_data.size[1] + 4,
					gamepad_texture_data.size[1] + 4,
				},
				offset = {
					icon_offset - 2,
					3,
					0,
				},
			},
			input_text_1 = input_text_style,
			gamepad_input_text_2 = {
				word_wrap = input_text_style.word_wrap,
				dynamic_font = input_text_style.dynamic_font,
				pixel_perfect = input_text_style.pixel_perfect,
				text_color = input_text_style.text_color,
				font_type = input_text_style.font_type,
				font_size = input_text_style.font_size,
				horizontal_alignment = input_text_style.horizontal_alignment,
				vertical_alignment = input_text_style.vertical_alignment,
				offset = {
					gamepad_input_text_2_offset,
					0,
					0,
				},
			},
			kbm_input_text = {
				word_wrap = input_text_style.word_wrap,
				dynamic_font = input_text_style.dynamic_font,
				pixel_perfect = input_text_style.pixel_perfect,
				text_color = input_text_style.text_color,
				font_type = input_text_style.font_type,
				font_size = input_text_style.font_size,
				horizontal_alignment = input_text_style.horizontal_alignment,
				vertical_alignment = input_text_style.vertical_alignment,
				offset = {
					kbm_icon_middle_offset,
					0,
					2,
				},
			},
			kbm_input_icon_left = {
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = kbm_texture_data[1].size,
				offset = {
					icon_offset,
					5,
					1,
				},
			},
			kbm_input_icon_middle = {
				color = {
					255,
					255,
					255,
					255,
				},
				texture_tiling_size = kbm_texture_data[2].size,
				texture_size = {
					kbm_text_width,
					kbm_texture_data[2].size[2],
				},
				offset = {
					kbm_icon_middle_offset,
					5,
					1,
				},
			},
			kbm_input_icon_right = {
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = kbm_texture_data[3].size,
				offset = {
					kbm_icon_right_offset,
					5,
					1,
				},
			},
			kbm_input_text_2 = {
				word_wrap = input_text_style.word_wrap,
				dynamic_font = input_text_style.dynamic_font,
				pixel_perfect = input_text_style.pixel_perfect,
				text_color = input_text_style.text_color,
				font_type = input_text_style.font_type,
				font_size = input_text_style.font_size,
				horizontal_alignment = input_text_style.horizontal_alignment,
				vertical_alignment = input_text_style.vertical_alignment,
				offset = {
					kbm_input_text_2_offset,
					0,
					0,
				},
			},
		},
	}
end

return {
	create_skip_widget = create_skip_widget,
	scenegraph_definition = scenegraph_definition,
}
