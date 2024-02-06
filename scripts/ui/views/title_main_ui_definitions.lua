-- chunkname: @scripts/ui/views/title_main_ui_definitions.lua

local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	dead_space_filler = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	screen = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	info_icon = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "top",
		position = {
			100,
			-350,
			30,
		},
		size = {
			87,
			87,
		},
	},
	info_icon_text = {
		horizontal_alignment = "left",
		parent = "info_icon",
		vertical_alignment = "top",
		position = {
			95,
			-15,
			0,
		},
		size = {
			400,
			100,
		},
	},
	sidebar_fade_bg = {
		horizontal_alignment = "left",
		scale = "fit_height",
		size = {
			256,
			256,
		},
		position = {
			-256,
			0,
			3,
		},
	},
	sidebar = {
		horizontal_alignment = "left",
		scale = "fit_height",
		size = {
			544,
			1080,
		},
		position = {
			-800,
			0,
			3,
		},
	},
	sidebar_mask = {
		horizontal_alignment = "left",
		scale = "fit_height",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			1080,
			3,
		},
	},
	engage_prompt = {
		horizontal_alignment = "center",
		parent = "dead_space_filler",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			10,
		},
	},
	background = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			99,
		},
	},
	information_text = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		size = {
			600,
			62,
		},
		position = {
			0,
			-375,
			2,
		},
	},
	splash_video = {
		parent = "background",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			700,
		},
	},
	start_screen_video = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
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
	loop_video = {
		parent = "background",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			1,
		},
	},
	logo = {
		horizontal_alignment = "left",
		parent = "background",
		vertical_alignment = "top",
		size = {
			682,
			383.90000000000003,
		},
		position = {
			0,
			20,
			0,
		},
	},
	legal_text = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "bottom",
		size = {
			1400,
			300,
		},
		position = {
			0,
			10,
			0,
		},
	},
	game_type_text = {
		horizontal_alignment = "left",
		parent = "change_profile_input_icon",
		vertical_alignment = "bottom",
		size = {
			1200,
			50,
		},
		position = {
			0,
			60,
			1,
		},
	},
	user_gamertag = {
		horizontal_alignment = "left",
		parent = "change_profile_input_icon",
		vertical_alignment = "bottom",
		size = {
			1200,
			50,
		},
		position = {
			0,
			35,
			1,
		},
	},
	change_profile_input_icon = {
		horizontal_alignment = "left",
		parent = "background",
		vertical_alignment = "bottom",
		size = {
			26,
			26,
		},
		position = {
			35,
			15,
			30,
		},
	},
	change_profile_input_text = {
		horizontal_alignment = "left",
		parent = "change_profile_input_icon",
		vertical_alignment = "center",
		size = {
			1200,
			1,
		},
		position = {
			30,
			-5,
			1,
		},
	},
	update_offline_data_input_icon = {
		horizontal_alignment = "left",
		parent = "background",
		vertical_alignment = "bottom",
		size = {
			26,
			26,
		},
		position = {
			250,
			15,
			30,
		},
	},
	update_offline_data_input_text = {
		horizontal_alignment = "left",
		parent = "update_offline_data_input_icon",
		vertical_alignment = "center",
		size = {
			1200,
			1,
		},
		position = {
			30,
			-5,
			1,
		},
	},
	playgo_status = {
		horizontal_alignment = "left",
		parent = "background",
		vertical_alignment = "top",
		size = {
			1200,
			50,
		},
		position = {
			35,
			-5,
			30,
		},
	},
	menu_anchor_point = {
		horizontal_alignment = "left",
		parent = "background",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			340,
			-100,
			4,
		},
	},
	frame_top = {
		horizontal_alignment = "center",
		parent = "menu_anchor_point",
		vertical_alignment = "bottom",
		size = {
			960,
			96,
		},
		position = {
			0,
			0,
			7,
		},
	},
	frame_bottom = {
		horizontal_alignment = "center",
		parent = "menu_anchor_point",
		vertical_alignment = "top",
		size = {
			960,
			85,
		},
		position = {
			0,
			-3,
			6,
		},
	},
	frame_background = {
		horizontal_alignment = "center",
		parent = "frame_bottom",
		vertical_alignment = "bottom",
		size = {
			660,
			0,
		},
		position = {
			0,
			83,
			-1,
		},
	},
	frame_circle_glow = {
		horizontal_alignment = "center",
		parent = "frame_bottom",
		vertical_alignment = "bottom",
		size = {
			205,
			184,
		},
		position = {
			4,
			-7,
			15,
		},
	},
	frame_line_glow = {
		horizontal_alignment = "center",
		parent = "frame_circle_glow",
		vertical_alignment = "center",
		size = {
			730,
			26,
		},
		position = {
			-4,
			-2,
			1,
		},
	},
	input_icon = {
		horizontal_alignment = "center",
		parent = "frame_circle_glow",
		vertical_alignment = "center",
		size = {
			50,
			50,
		},
		position = {
			-4,
			-2,
			-10,
		},
	},
	lock_center = {
		horizontal_alignment = "center",
		parent = "input_icon",
		vertical_alignment = "center",
		size = {
			50,
			50,
		},
		position = {
			0,
			1,
			-1,
		},
	},
	lock_middle_top = {
		horizontal_alignment = "center",
		parent = "frame_top",
		vertical_alignment = "bottom",
		size = {
			50,
			50,
		},
		position = {
			0,
			-29,
			2,
		},
	},
	lock_middle_bottom = {
		horizontal_alignment = "center",
		parent = "input_icon",
		vertical_alignment = "center",
		size = {
			50,
			50,
		},
		position = {
			0,
			1,
			-2,
		},
	},
	lock_outer_top = {
		horizontal_alignment = "center",
		parent = "frame_top",
		vertical_alignment = "bottom",
		size = {
			50,
			50,
		},
		position = {
			0,
			-29,
			1,
		},
	},
	lock_outer_bottom = {
		horizontal_alignment = "center",
		parent = "input_icon",
		vertical_alignment = "center",
		size = {
			50,
			50,
		},
		position = {
			0,
			1,
			-3,
		},
	},
	selection_anchor = {
		horizontal_alignment = "center",
		parent = "menu_anchor_point",
		vertical_alignment = "center",
		position = {
			0,
			0,
			10,
		},
		size = {
			0,
			60,
		},
	},
	selection_glow_left = {
		horizontal_alignment = "left",
		parent = "selection_anchor",
		vertical_alignment = "center",
		position = {
			-98,
			0,
			10,
		},
		size = {
			98,
			60,
		},
	},
	selection_glow_right = {
		horizontal_alignment = "right",
		parent = "selection_anchor",
		vertical_alignment = "center",
		position = {
			98,
			0,
			10,
		},
		size = {
			98,
			60,
		},
	},
	online_button = {
		horizontal_alignment = "center",
		parent = "menu_anchor_point",
		vertical_alignment = "center",
		position = {
			0,
			-100,
			10,
		},
		size = {
			300,
			60,
		},
	},
	offline_button = {
		horizontal_alignment = "center",
		parent = "menu_anchor_point",
		vertical_alignment = "center",
		position = {
			0,
			-150,
			10,
		},
		size = {
			300,
			60,
		},
	},
	menu_option_1 = {
		horizontal_alignment = "center",
		parent = "menu_anchor_point",
		vertical_alignment = "center",
		position = {
			0,
			90,
			10,
		},
		size = {
			300,
			60,
		},
	},
	menu_option_2 = {
		horizontal_alignment = "center",
		parent = "menu_anchor_point",
		vertical_alignment = "center",
		position = {
			0,
			40,
			10,
		},
		size = {
			300,
			60,
		},
	},
	menu_option_3 = {
		horizontal_alignment = "center",
		parent = "menu_anchor_point",
		vertical_alignment = "center",
		position = {
			0,
			-10,
			10,
		},
		size = {
			300,
			60,
		},
	},
	menu_option_4 = {
		horizontal_alignment = "center",
		parent = "menu_anchor_point",
		vertical_alignment = "center",
		position = {
			0,
			-60,
			10,
		},
		size = {
			300,
			60,
		},
	},
	menu_option_5 = {
		horizontal_alignment = "center",
		parent = "menu_anchor_point",
		vertical_alignment = "center",
		position = {
			0,
			-110,
			10,
		},
		size = {
			300,
			60,
		},
	},
	menu_option_6 = {
		horizontal_alignment = "center",
		parent = "menu_anchor_point",
		vertical_alignment = "center",
		position = {
			0,
			-160,
			10,
		},
		size = {
			300,
			60,
		},
	},
	ai_benchmark = {
		horizontal_alignment = "center",
		parent = "menu_anchor_point",
		vertical_alignment = "center",
		position = {
			0,
			-240,
			10,
		},
		size = {
			1000,
			60,
		},
	},
	ai_benchmark_cycle = {
		horizontal_alignment = "center",
		parent = "menu_anchor_point",
		vertical_alignment = "center",
		position = {
			0,
			-300,
			10,
		},
		size = {
			1000,
			60,
		},
	},
	whitebox_combat = {
		horizontal_alignment = "center",
		parent = "menu_anchor_point",
		vertical_alignment = "center",
		position = {
			0,
			-360,
			10,
		},
		size = {
			1000,
			60,
		},
	},
	support_info = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "top",
		size = {
			1200,
			50,
		},
		position = {
			0,
			-20,
			30,
		},
	},
}

if IS_PS4 then
	scenegraph_definition.update_offline_data_input_icon.position[1] = 35
	scenegraph_definition.update_offline_data_input_icon.position[2] = 50
end

local function create_engage_prompt(ui_renderer)
	local font_type = "hell_shark"
	local font_size = 52
	local button_size = {
		50,
		50,
	}
	local press_str = Localize("interaction_prefix_press")
	local to_start_str = Localize("to_start_game")
	local spacing = 10
	local button_alignment = 7.5
	local font, scaled_font_size = UIFontByResolution({
		font_type = font_type,
		font_size = font_size,
	})
	local press_text_width = UIRenderer.text_size(ui_renderer, press_str, font[1], scaled_font_size)
	local to_start_width = UIRenderer.text_size(ui_renderer, to_start_str, font[1], scaled_font_size)
	local total_size = press_text_width + spacing + button_size[1] + spacing + to_start_width + button_alignment
	local press_offset_x = -total_size * 0.5 + press_text_width * 0.5
	local button_offset = -total_size * 0.5 + button_size[1] * 0.5 + press_text_width + spacing + button_alignment
	local to_start_offset = button_offset + button_size[1] * 0.5 + spacing + to_start_width * 0.5

	return {
		scenegraph_id = "engage_prompt",
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "press",
					text_id = "press_str",
					content_change_function = function (content, style)
						local t = Managers.time:time("main")
						local alpha = 192 + math.sin(t * 5) * 63

						style.text_color[2] = alpha
						style.text_color[3] = alpha
						style.text_color[4] = alpha
					end,
				},
				{
					pass_type = "text",
					style_id = "to_start",
					text_id = "to_start_str",
					content_change_function = function (content, style)
						local t = Managers.time:time("main")
						local alpha = 192 + math.sin(t * 5) * 63

						style.text_color[2] = alpha
						style.text_color[3] = alpha
						style.text_color[4] = alpha
					end,
				},
				{
					pass_type = "texture",
					style_id = "button",
					texture_id = "button_id",
					content_change_function = function (content, style)
						local t = Managers.time:time("main")
						local alpha = 192 + math.sin(t * 5) * 63

						style.color[2] = alpha
						style.color[3] = alpha
						style.color[4] = alpha
					end,
				},
			},
		},
		content = {
			press_str = press_str,
			button_id = IS_PS4 and "ps4_button_icon_cross_large" or "xbone_button_icon_a_large",
			to_start_str = to_start_str,
		},
		style = {
			press = {
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "center",
				word_wrap = false,
				font_size = font_size,
				font_type = font_type,
				text_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					press_offset_x,
					0,
					0,
				},
			},
			to_start = {
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "center",
				word_wrap = false,
				font_size = font_size,
				font_type = font_type,
				text_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					to_start_offset,
					0,
					0,
				},
			},
			button = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = button_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					button_offset,
					0,
					0,
				},
			},
			rect_press = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					press_text_width,
					30,
				},
				color = {
					255,
					255,
					0,
					0,
				},
				offset = {
					press_offset_x,
					50,
					0,
				},
			},
			rect_button = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					button_size[1],
					30,
				},
				color = {
					255,
					0,
					255,
					0,
				},
				offset = {
					button_offset,
					50,
					0,
				},
			},
			rect_to_start = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					to_start_width,
					30,
				},
				color = {
					255,
					0,
					0,
					255,
				},
				offset = {
					to_start_offset,
					50,
					0,
				},
			},
			rect_total = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					total_size,
					30,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					100,
					0,
				},
			},
		},
		offset = {
			0,
			-375,
			0,
		},
	}
end

UIWidgets.create_game_type_text = function (text, scenegraph_id, size, color)
	local text_color = color or {
		255,
		255,
		255,
		255,
	}

	return {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
				},
				{
					pass_type = "text",
					style_id = "status_text",
					text_id = "status_text",
					content_check_function = function (content, style)
						return content.text ~= ""
					end,
				},
			},
		},
		content = {
			text = text,
			status_text = Localize("lb_status") .. ":",
			color = text_color,
		},
		style = {
			text = {
				font_type = "hell_shark",
				localize = false,
				word_wrap = true,
				font_size = size,
				text_color = text_color,
				offset = {
					0,
					0,
					2,
				},
			},
			status_text = {
				font_type = "hell_shark",
				localize = false,
				word_wrap = true,
				font_size = size * 0.4,
				text_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size,
					2,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

local function create_info_text(text, scenegraph_id, font_size)
	return {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
				},
			},
		},
		content = {
			text = text,
		},
		style = {
			text = {
				dynamic_font = true,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				pixel_perfect = true,
				vertical_alignment = "top",
				word_wrap = true,
				font_size = font_size,
				text_color = Colors.get_table("dark_gray"),
				offset = {
					0,
					0,
					1,
				},
			},
		},
		scenegraph_id = scenegraph_id,
	}
end

local function create_menu_button(scenegraph_id, text, font_size, optional_default_color_name, show_icon, spacing)
	return {
		element = {
			passes = {
				{
					content_id = "button_text",
					pass_type = "hotspot",
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text_field",
					content_check_function = function (content)
						if not Managers.input:is_device_active("gamepad") then
							return
						end

						return not content.button_text.disable_button and not content.button_text.is_hover and not content.button_text.is_selected
					end,
				},
				{
					pass_type = "text",
					style_id = "text_no_hover",
					text_id = "text_field",
					content_check_function = function (content)
						if Managers.input:is_device_active("gamepad") then
							return
						end

						return not content.button_text.disable_button and not content.button_text.is_hover
					end,
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text_field",
					content_check_function = function (content)
						if Managers.input:is_device_active("gamepad") then
							return
						end

						return not content.button_text.disable_button and content.button_text.is_hover
					end,
				},
				{
					pass_type = "text",
					style_id = "text_disabled",
					text_id = "text_field",
					content_check_function = function (content)
						return content.button_text.disable_button
					end,
				},
				{
					content_id = "icon_content",
					pass_type = "texture_uv",
					style_id = "icon",
					texture_id = "icon_id",
					content_check_function = function (content)
						local parent_content = content.parent

						if not parent_content.show_icon or parent_content.disabled then
							return false
						end

						if parent_content.selection_callback then
							local current_index = parent_content.selection_callback()

							return parent_content.index ~= current_index
						end

						return false
					end,
				},
			},
		},
		content = {
			button_text = {},
			text_field = text,
			default_font_size = font_size,
			spacing = spacing,
			show_icon = show_icon,
			icon_content = {
				icon_id = "info",
				uvs = {
					{
						0,
						1,
					},
					{
						1,
						0,
					},
				},
			},
		},
		style = {
			text = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = false,
				font_size = font_size,
				text_color = Colors.get_color_table_with_alpha(optional_default_color_name or "font_button_normal", 255),
				offset = {
					0,
					0,
					4,
				},
			},
			text_no_hover = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = false,
				font_size = font_size,
				text_color = Colors.get_color_table_with_alpha(optional_default_color_name or "font_button_normal", 255),
				offset = {
					0,
					0,
					4,
				},
			},
			text_hover = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = false,
				font_size = font_size,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					4,
				},
			},
			text_disabled = {
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = false,
				font_size = font_size,
				text_color = Colors.get_color_table_with_alpha("gray", 50),
				offset = {
					0,
					0,
					4,
				},
			},
			icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					font_size * 1.5,
					font_size * 1.5,
				},
				offset = {
					0,
					2,
					4,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
		},
		scenegraph_id = scenegraph_id,
	}
end

if IS_PS4 then
	scenegraph_definition.user_gamertag.position[1] = 0
	scenegraph_definition.user_gamertag.position[2] = 45
end

local attract_mode_video = {
	loop = false,
	material_name = "fatshark_splash",
	scenegraph_id = "splash_video",
	sound_start = "Play_fatshark_logo",
	sound_stop = "Stop_fatshark_logo",
	video_name = "video/fatshark_splash",
}
local engage_screen_video = {
	loop = true,
	material_name = "start_1",
	scenegraph_id = "start_screen_video",
	video_name = "video/start_1",
}
local main_menu_video = {
	loop = true,
	main_menu = true,
	material_name = "start_2",
	scenegraph_id = "start_screen_video",
	video_name = "video/start_2",
}
local background_widget_definitions = {
	logo = UIWidgets.create_simple_texture("vermintide_logo_title", "logo"),
	dead_space_filler_widget = UIWidgets.create_simple_rect("dead_space_filler", {
		255,
		0,
		0,
		0,
	}),
	sidebar_fill = UIWidgets.create_simple_texture("rect_masked", "sidebar", false, false, {
		245,
		0,
		0,
		0,
	}),
	sidebar_fade_bg = UIWidgets.create_shader_tiled_texture("sidebar_fade_bg", "fade_bg", {
		256,
		256,
	}, nil, nil, {
		245,
		255,
		255,
		255,
	}),
}
local info_texts = {
	"menu_desc_online_mode",
	"menu_desc_offline_mode",
}
local single_widget_definitions = {
	legal_text = UIWidgets.create_simple_text("n/a", "legal_text", 12, {
		255,
		255,
		255,
		255,
	}),
	information_text = UIWidgets.create_simple_text("n/a", "information_text", 18, {
		255,
		255,
		255,
		255,
	}),
	start_screen_selection_left = UIWidgets.create_simple_texture("start_screen_selection_left", "selection_glow_left"),
	start_screen_selection_right = UIWidgets.create_simple_texture("start_screen_selection_right", "selection_glow_right"),
	game_type_text = UIWidgets.create_game_type_text("", "game_type_text", 46, Colors.get_color_table_with_alpha("font_title", 255)),
	user_gamertag = UIWidgets.create_simple_rect_text("user_gamertag", "Gamertag not assigned"),
	playgo_status = UIWidgets.create_simple_rect_text("playgo_status", "n/a"),
	change_profile_input_icon = UIWidgets.create_simple_texture("xbone_button_icon_x", "change_profile_input_icon"),
	change_profile_input_text = UIWidgets.create_simple_rect_text("change_profile_input_text", Localize("xb1_switch_profile"), 20),
	support_info = UIWidgets.create_simple_text("", "support_info", 20, Colors.get_color_table_with_alpha("white", 150)),
	update_offline_data_input_icon = UIWidgets.create_simple_texture(IS_XB1 and "xbone_button_icon_y" or "ps4_button_icon_triangle", "update_offline_data_input_icon"),
	update_offline_data_input_text = UIWidgets.create_simple_rect_text("update_offline_data_input_text", Localize("update_offline_data"), 20),
	sidebar_mask = UIWidgets.create_simple_texture("mask_rect", "sidebar_mask", false, false, {
		255,
		255,
		255,
		255,
	}),
	create_engage_prompt = create_engage_prompt,
	info_icon = UIWidgets.create_simple_texture("info", "info_icon"),
	info_icon_text = create_info_text(info_texts[1], "info_icon_text", 23),
}
local menu_item_index_lookup = {
	cinematics = 4,
	credits = 5,
	offline = 2,
	online = 1,
	options = 3,
	start_game = 1,
	store = 4,
	tutorial = 2,
}
local menu_button_font_size = 24
local base_menu_button_definitions = {
	create_menu_button("online_button", "status_online", menu_button_font_size, "font_title"),
	(create_menu_button("offline_button", "status_offline", menu_button_font_size, "font_title")),
}
local menu_button_definitions

if script_data.honduras_demo then
	menu_button_definitions = {
		(create_menu_button("menu_option_1", "start_demo_menu_button_name", menu_button_font_size, "font_title")),
	}
elseif script_data.settings.use_beta_mode then
	if script_data.settings.disable_tutorial_at_start then
		menu_button_definitions = {
			create_menu_button("menu_option_1", "start_game_menu_button_name", menu_button_font_size, "font_title"),
			create_menu_button("menu_option_2", "options_menu_button_name", menu_button_font_size, "font_title"),
			(create_menu_button("menu_option_3", "credits_menu_button_name", menu_button_font_size, "font_title")),
		}
	else
		menu_button_definitions = {
			create_menu_button("menu_option_1", "start_game_menu_button_name", menu_button_font_size, "font_title"),
			create_menu_button("menu_option_2", "tutorial_menu_button_name", menu_button_font_size, "font_title"),
			create_menu_button("menu_option_3", "options_menu_button_name", menu_button_font_size, "font_title"),
			(create_menu_button("menu_option_4", "credits_menu_button_name", menu_button_font_size, "font_title")),
		}
	end
elseif BUILD == "dev" or BUILD == "debug" then
	if IS_XB1 then
		if GameSettingsDevelopment.additional_content_view_enabled then
			menu_button_definitions = {
				create_menu_button("menu_option_1", "start_game_menu_button_name", menu_button_font_size, "font_title"),
				create_menu_button("menu_option_2", "tutorial_menu_button_name", menu_button_font_size, "font_title"),
				create_menu_button("menu_option_3", "options_menu_button_name", menu_button_font_size, "font_title"),
				create_menu_button("menu_option_4", "start_menu_cinematics", menu_button_font_size, "font_title"),
				create_menu_button("menu_option_5", "title_screen_store_xb1", menu_button_font_size, "font_title", true),
				create_menu_button("menu_option_6", "credits_menu_button_name", menu_button_font_size, "font_title"),
			}
		else
			menu_button_definitions = {
				create_menu_button("menu_option_1", "start_game_menu_button_name", menu_button_font_size, "font_title"),
				create_menu_button("menu_option_2", "tutorial_menu_button_name", menu_button_font_size, "font_title"),
				create_menu_button("menu_option_3", "options_menu_button_name", menu_button_font_size, "font_title"),
				(create_menu_button("menu_option_4", "credits_menu_button_name", menu_button_font_size, "font_title")),
			}
		end
	elseif IS_PS4 then
		if GameSettingsDevelopment.additional_content_view_enabled then
			menu_button_definitions = {
				create_menu_button("menu_option_1", "start_game_menu_button_name", menu_button_font_size, "font_title"),
				create_menu_button("menu_option_2", "tutorial_menu_button_name", menu_button_font_size, "font_title"),
				create_menu_button("menu_option_3", "options_menu_button_name", menu_button_font_size, "font_title"),
				create_menu_button("menu_option_4", "start_menu_cinematics", menu_button_font_size, "font_title"),
				create_menu_button("menu_option_5", "dlc1_2_dlc_level_locked_tooltip", 18, "font_title", true, 60),
				(create_menu_button("menu_option_6", "credits_menu_button_name", menu_button_font_size, "font_title")),
			}
		else
			menu_button_definitions = {
				create_menu_button("menu_option_1", "start_game_menu_button_name", menu_button_font_size, "font_title"),
				create_menu_button("menu_option_2", "tutorial_menu_button_name", menu_button_font_size, "font_title"),
				create_menu_button("menu_option_3", "options_menu_button_name", menu_button_font_size, "font_title"),
				(create_menu_button("menu_option_4", "credits_menu_button_name", menu_button_font_size, "font_title")),
			}
		end
	else
		menu_button_definitions = {
			create_menu_button("menu_option_1", "start_game_menu_button_name", menu_button_font_size, "font_title"),
			create_menu_button("menu_option_2", "tutorial_menu_button_name", menu_button_font_size, "font_title"),
			create_menu_button("menu_option_3", "options_menu_button_name", menu_button_font_size, "font_title"),
			(create_menu_button("menu_option_4", "credits_menu_button_name", menu_button_font_size, "font_title")),
		}
	end
elseif IS_XB1 then
	if GameSettingsDevelopment.additional_content_view_enabled then
		menu_button_definitions = {
			create_menu_button("menu_option_1", "start_game_menu_button_name", menu_button_font_size, "font_title"),
			create_menu_button("menu_option_2", "tutorial_menu_button_name", menu_button_font_size, "font_title"),
			create_menu_button("menu_option_3", "options_menu_button_name", menu_button_font_size, "font_title"),
			create_menu_button("menu_option_4", "start_menu_cinematics", menu_button_font_size, "font_title"),
			create_menu_button("menu_option_5", "title_screen_store_xb1", menu_button_font_size, "font_title", true),
			create_menu_button("menu_option_6", "credits_menu_button_name", menu_button_font_size, "font_title"),
		}
	else
		menu_button_definitions = {
			create_menu_button("menu_option_1", "start_game_menu_button_name", menu_button_font_size, "font_title"),
			create_menu_button("menu_option_2", "tutorial_menu_button_name", menu_button_font_size, "font_title"),
			create_menu_button("menu_option_3", "options_menu_button_name", menu_button_font_size, "font_title"),
			(create_menu_button("menu_option_4", "credits_menu_button_name", menu_button_font_size, "font_title")),
		}
	end
elseif IS_PS4 then
	if GameSettingsDevelopment.additional_content_view_enabled then
		menu_button_definitions = {
			create_menu_button("menu_option_1", "start_game_menu_button_name", menu_button_font_size, "font_title"),
			create_menu_button("menu_option_2", "tutorial_menu_button_name", menu_button_font_size, "font_title"),
			create_menu_button("menu_option_3", "options_menu_button_name", menu_button_font_size, "font_title"),
			create_menu_button("menu_option_4", "start_menu_cinematics", menu_button_font_size, "font_title"),
			create_menu_button("menu_option_5", "dlc1_2_dlc_level_locked_tooltip", 18, "font_title", true, 60),
			(create_menu_button("menu_option_6", "credits_menu_button_name", menu_button_font_size, "font_title")),
		}
	else
		menu_button_definitions = {
			create_menu_button("menu_option_1", "start_game_menu_button_name", menu_button_font_size, "font_title"),
			create_menu_button("menu_option_2", "tutorial_menu_button_name", menu_button_font_size, "font_title"),
			create_menu_button("menu_option_3", "options_menu_button_name", menu_button_font_size, "font_title"),
			(create_menu_button("menu_option_4", "credits_menu_button_name", menu_button_font_size, "font_title")),
		}
	end
else
	menu_button_definitions = {
		create_menu_button("menu_option_1", "start_game_menu_button_name", menu_button_font_size, "font_title"),
		create_menu_button("menu_option_2", "tutorial_menu_button_name", menu_button_font_size, "font_title"),
		create_menu_button("menu_option_3", "options_menu_button_name", menu_button_font_size, "font_title"),
		(create_menu_button("menu_option_4", "credits_menu_button_name", menu_button_font_size, "font_title")),
	}
end

local menu_videos = {
	main = {
		loop = true,
		main_menu = true,
		material_name = "start_1",
		scenegraph_id = "start_screen_video",
		video_name = "video/start_1",
	},
	main_menu = {
		loop = true,
		main_menu = true,
		material_name = "start_2",
		scenegraph_id = "start_screen_video",
		video_name = "video/start_2",
	},
}

return {
	background_widget_definitions = background_widget_definitions,
	single_widget_definitions = single_widget_definitions,
	menu_button_definitions = menu_button_definitions,
	base_menu_button_definitions = base_menu_button_definitions,
	scenegraph_definition = scenegraph_definition,
	attract_mode_video = attract_mode_video,
	menu_button_font_size = menu_button_font_size,
	menu_item_index_lookup = menu_item_index_lookup,
	menu_videos = menu_videos,
	info_texts = info_texts,
}
