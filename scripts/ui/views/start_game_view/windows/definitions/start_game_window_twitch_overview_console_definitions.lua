local window_default_settings = UISettings.game_start_windows
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local game_option_size = {
	window_size[1],
	194
}
local window_text_width = window_size[1]
local login_text_area_size = {
	window_text_width - 20 - 160,
	50
}
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	on_exit = {
		{
			name = "fade_out",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				params.render_settings.alpha_multiplier = 1
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}
local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
		}
	},
	root_fit = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
		}
	},
	menu_root = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			0
		}
	},
	window = {
		vertical_alignment = "center",
		parent = "menu_root",
		horizontal_alignment = "left",
		size = {
			window_size[1],
			window_size[2] + 100
		},
		position = {
			220,
			-50,
			1
		}
	},
	window_game_mode_root = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			window_frame_height
		},
		position = {
			0,
			-window_frame_height,
			1
		}
	},
	login_text_area = {
		vertical_alignment = "bottom",
		parent = "twitch_divider",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			50
		},
		position = {
			0,
			-60,
			1
		}
	},
	login_text_frame = {
		vertical_alignment = "center",
		parent = "login_text_area",
		horizontal_alignment = "left",
		size = login_text_area_size,
		position = {
			10,
			0,
			1
		}
	},
	login_text_box = {
		vertical_alignment = "center",
		parent = "login_text_frame",
		horizontal_alignment = "center",
		size = {
			300,
			42
		},
		position = {
			0,
			0,
			1
		}
	},
	twitch_background = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1] + 70,
			330
		},
		position = {
			0,
			0,
			1
		}
	},
	twitch_texture = {
		vertical_alignment = "top",
		parent = "twitch_background",
		horizontal_alignment = "center",
		size = {
			294,
			98
		},
		position = {
			0,
			-23,
			1
		}
	},
	twitch_divider = {
		vertical_alignment = "bottom",
		parent = "twitch_texture",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			-36,
			1
		}
	},
	twitch_description = {
		vertical_alignment = "bottom",
		parent = "login_text_area",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			100
		},
		position = {
			0,
			-125,
			1
		}
	},
	client_disclaimer_background = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1] + 70,
			150
		},
		position = {
			0,
			-380,
			1
		}
	},
	client_disclaimer_description = {
		vertical_alignment = "center",
		parent = "client_disclaimer_background",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			100
		},
		position = {
			0,
			0,
			1
		}
	},
	game_option_3 = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			game_option_size[1],
			game_option_size[2]
		},
		position = {
			-15,
			-15,
			1
		}
	},
	game_option_2 = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			game_option_size[1],
			game_option_size[2]
		},
		position = {
			-15,
			-15 + game_option_size[2],
			1
		}
	},
	game_option_1 = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			game_option_size[1],
			game_option_size[2]
		},
		position = {
			-15,
			-15 + game_option_size[2] * 2,
			1
		}
	},
	play_button_console = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			game_option_size[1],
			game_option_size[2]
		},
		position = {
			0,
			30,
			1
		}
	},
	play_button = {
		vertical_alignment = "center",
		parent = "play_button_console",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			-165,
			0,
			1
		}
	},
	selector = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			game_option_size[1],
			game_option_size[2] + 22
		},
		position = {
			0,
			0,
			1
		}
	},
	connecting = {
		vertical_alignment = "center",
		parent = "login_text_area",
		horizontal_alignment = "center",
		size = login_text_area_size,
		position = {
			0,
			0,
			1
		}
	},
	connect_button = {
		vertical_alignment = "center",
		parent = "login_text_area",
		horizontal_alignment = "right",
		size = {
			160,
			45
		},
		position = {
			-10,
			-2,
			1
		}
	},
	connect_button_frame = {
		vertical_alignment = "center",
		parent = "connect_button",
		horizontal_alignment = "center",
		size = {
			160,
			50
		},
		position = {
			0,
			2,
			10
		}
	},
	disconnect_button = {
		vertical_alignment = "center",
		parent = "login_text_area",
		horizontal_alignment = "center",
		size = {
			window_size[1] - 20,
			45
		},
		position = {
			0,
			-2,
			1
		}
	},
	disconnect_button_frame = {
		vertical_alignment = "center",
		parent = "disconnect_button",
		horizontal_alignment = "center",
		size = {
			window_size[1] - 20,
			50
		},
		position = {
			0,
			2,
			10
		}
	}
}

if PLATFORM == "xb1" then
	scenegraph_definition.connect_button = {
		vertical_alignment = "center",
		parent = "login_text_area",
		horizontal_alignment = "center",
		size = {
			160,
			45
		},
		position = {
			0,
			-2,
			1
		}
	}
	scenegraph_definition.connect_button_frame = {
		vertical_alignment = "center",
		parent = "connect_button",
		horizontal_alignment = "center",
		size = {
			160,
			50
		},
		position = {
			0,
			2,
			10
		}
	}
end

function create_button(scenegraph_id, size, text, font_size, content_check_function)
	local background_texture = "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local widget = {
		element = {}
	}
	local passes = {}
	local content = {}
	local style = {}
	local offset = {
		0,
		0,
		0
	}
	local hotspot_name = "button_hotspot"
	passes[#passes + 1] = {
		pass_type = "hotspot",
		content_id = hotspot_name,
		style_id = hotspot_name,
		content_check_function = content_check_function
	}
	style[hotspot_name] = {
		size = size,
		offset = offset
	}
	content[hotspot_name] = {}
	local hotspot_content = content[hotspot_name]
	local background_name = "background"
	passes[#passes + 1] = {
		pass_type = "texture_uv",
		content_id = background_name,
		style_id = background_name,
		content_check_function = content_check_function
	}
	style[background_name] = {
		size = size,
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			offset[1],
			offset[2],
			0
		}
	}
	content[background_name] = {
		uvs = {
			{
				0,
				1 - math.min(size[2] / background_texture_settings.size[2], 1)
			},
			{
				math.min(size[1] / background_texture_settings.size[1], 1),
				1
			}
		},
		texture_id = background_texture
	}
	local background_fade_name = "background_fade"
	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = background_fade_name,
		style_id = background_fade_name,
		content_check_function = content_check_function
	}
	style[background_fade_name] = {
		size = {
			size[1],
			size[2]
		},
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			offset[1],
			offset[2],
			1
		}
	}
	hotspot_content[background_fade_name] = "button_bg_fade"
	local hover_glow_name = "hover_glow"
	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = hover_glow_name,
		style_id = hover_glow_name,
		content_check_function = content_check_function
	}
	style[hover_glow_name] = {
		size = {
			size[1],
			math.min(size[2] - 5, 80)
		},
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			offset[1],
			offset[2] + 5,
			2
		}
	}
	hotspot_content[hover_glow_name] = "button_state_default"
	local clicked_rect_name = "clicked_rect"
	passes[#passes + 1] = {
		pass_type = "rect",
		content_id = hotspot_name,
		style_id = clicked_rect_name,
		content_check_function = content_check_function
	}
	style[clicked_rect_name] = {
		size = size,
		color = {
			100,
			0,
			0,
			0
		},
		offset = {
			offset[1],
			offset[2],
			6
		}
	}
	local glass_top_name = "glass_top"
	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = glass_top_name,
		style_id = glass_top_name,
		content_check_function = content_check_function
	}
	style[glass_top_name] = {
		size = {
			size[1],
			11
		},
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			offset[1],
			(offset[2] + size[2]) - 11,
			5
		}
	}
	hotspot_content[glass_top_name] = "button_glass_02"
	local glass_bottom_name = "glass_bottom"
	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = glass_bottom_name,
		style_id = glass_bottom_name,
		content_check_function = content_check_function
	}
	style[glass_bottom_name] = {
		size = {
			size[1],
			11
		},
		color = {
			100,
			255,
			255,
			255
		},
		offset = {
			offset[1],
			offset[2] - 3,
			5
		}
	}
	hotspot_content[glass_bottom_name] = "button_glass_02"
	local text_name = "text"
	passes[#passes + 1] = {
		pass_type = "text",
		content_id = hotspot_name,
		text_id = text_name,
		style_id = text_name,
		content_check_function = content_check_function
	}
	style[text_name] = {
		word_wrap = true,
		upper_case = true,
		localize = false,
		horizontal_alignment = "center",
		vertical_alignment = "center",
		dynamic_font_size = true,
		font_type = "hell_shark",
		font_size = font_size,
		text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
		default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
		select_text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			10 + offset[1],
			offset[2] + 3,
			4
		},
		size = {
			size[1] - 20,
			size[2]
		}
	}
	hotspot_content[text_name] = text
	local text_shadow_name = "text_shadow"
	passes[#passes + 1] = {
		pass_type = "text",
		content_id = hotspot_name,
		text_id = text_name,
		style_id = text_shadow_name,
		content_check_function = content_check_function
	}
	style[text_shadow_name] = {
		word_wrap = true,
		upper_case = true,
		localize = false,
		horizontal_alignment = "center",
		vertical_alignment = "center",
		dynamic_font_size = true,
		font_type = "hell_shark",
		font_size = font_size,
		text_color = Colors.get_color_table_with_alpha("black", 255),
		offset = {
			10 + offset[1] + 2,
			offset[2] + 2,
			3
		},
		size = {
			size[1] - 20,
			size[2]
		}
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_window(scenegraph_id, size)
	local widget = {
		element = {}
	}
	local passes = {
		{
			scenegraph_id = "login_text_box",
			pass_type = "hotspot",
			content_id = "text_input_hotspot"
		},
		{
			scenegraph_id = "window",
			pass_type = "hotspot",
			content_id = "frame_hotspot"
		},
		{
			style_id = "login_rect_bg",
			pass_type = "rect",
			content_check_function = function (content, style)
				return not Managers.twitch:is_connected() and not Managers.twitch:is_connecting()
			end
		},
		{
			style_id = "login_hint",
			pass_type = "text",
			text_id = "login_hint",
			content_check_function = function (content, style)
				local hotspot = content.text_input_hotspot

				if hotspot.is_hover then
					style.text_color = {
						128,
						255,
						255,
						255
					}
				else
					style.text_color = {
						60,
						255,
						255,
						255
					}
				end

				return content.twitch_name == "" and not Managers.twitch:is_connected() and not content.text_field_active and not Managers.twitch:is_connecting()
			end
		},
		{
			style_id = "twitch_name",
			pass_type = "text",
			text_id = "twitch_name",
			content_check_function = function (content, style)
				if not content.text_field_active then
					style.caret_color[1] = 0
				else
					style.caret_color[1] = 128 + math.sin(Application.time_since_launch() * 5) * 128
				end

				return not Managers.twitch:is_connected() and not Managers.twitch:is_connecting()
			end
		},
		{
			style_id = "connecting",
			pass_type = "text",
			text_id = "connecting_id",
			content_check_function = function (content, style)
				if not Managers.twitch:is_connecting() then
					return
				end

				local timer = math.ceil(Application.time_since_launch() * 10)
				local dots = timer % 5
				local dot_str = ""

				for i = 1, dots, 1 do
					dot_str = dot_str .. "."
				end

				content.connecting_id = Localize("start_game_window_twitch_connecting") .. dot_str

				return true
			end
		}
	}
	local content = {
		text_start_offset = 0,
		text_field_active = false,
		connecting_id = "Connecting",
		error_id = "",
		twitch_name = "",
		caret_index = 1,
		text_index = 1,
		login_hint = Localize("start_game_window_twitch_login_hint"),
		text_input_hotspot = {},
		screen_hotspot = {
			allow_multi_hover = true
		},
		frame_hotspot = {
			allow_multi_hover = true
		}
	}
	local style = {
		login_rect_bg = {
			scenegraph_id = "login_text_frame",
			color = {
				255,
				0,
				0,
				0
			},
			offset = {
				0,
				0,
				-1
			},
			size = login_text_area_size
		},
		login_hint = {
			word_wrap = true,
			scenegraph_id = "login_text_box",
			font_size = 24,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			dynamic_font_size = true,
			font_type = "hell_shark",
			text_color = {
				60,
				255,
				255,
				255
			},
			offset = {
				5,
				0,
				10
			},
			size = {
				290,
				42
			}
		},
		connecting = {
			word_wrap = false,
			scenegraph_id = "connecting",
			font_size = 24,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = {
				90,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				10
			}
		},
		twitch_name = {
			word_wrap = false,
			scenegraph_id = "login_text_box",
			horizontal_scroll = true,
			pixel_perfect = true,
			horizontal_alignment = "left",
			font_size = 28,
			vertical_alignment = "center",
			dynamic_font = true,
			font_type = "hell_shark_arial",
			text_color = Colors.get_table("white"),
			offset = {
				10,
				10,
				10
			},
			caret_size = {
				2,
				26
			},
			caret_offset = {
				-11,
				-4,
				4
			},
			caret_color = Colors.get_table("white")
		}
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_window_mixer(scenegraph_id, size)
	local widget = {
		element = {}
	}
	local passes = {
		{
			style_id = "connecting",
			pass_type = "text",
			text_id = "disconnected",
			content_check_function = function (content)
				return Managers.twitch and not Managers.twitch:is_connected() and not Managers.twitch:is_connecting()
			end
		},
		{
			style_id = "shadow",
			pass_type = "text",
			text_id = "disconnected",
			content_check_function = function (content)
				return Managers.twitch and not Managers.twitch:is_connected() and not Managers.twitch:is_connecting()
			end
		},
		{
			style_id = "connecting",
			pass_type = "text",
			text_id = "connecting_id",
			content_check_function = function (content, style)
				if not Managers.twitch:is_connecting() then
					return
				end

				local timer = math.ceil(Application.time_since_launch() * 10)
				local dots = timer % 5
				local dot_str = ""

				for i = 1, dots, 1 do
					dot_str = dot_str .. "."
				end

				content.connecting_id = Localize("start_game_window_twitch_connecting") .. dot_str

				return true
			end
		},
		{
			style_id = "shadow",
			pass_type = "text",
			text_id = "connecting_id",
			content_check_function = function (content, style)
				if not Managers.twitch:is_connecting() then
					return
				end
			end
		},
		{
			style_id = "connecting",
			pass_type = "text",
			text_id = "connected",
			content_check_function = function (content)
				return Managers.twitch and Managers.twitch:is_connected()
			end
		},
		{
			style_id = "shadow",
			pass_type = "text",
			text_id = "connected",
			content_check_function = function (content)
				return Managers.twitch and Managers.twitch:is_connected()
			end
		}
	}
	local content = {
		text_start_offset = 0,
		connecting_id = "Connecting",
		connected = "Connected to ",
		error_id = "",
		twitch_name = "",
		text_input_hotspot = {},
		disconnected = Localize("start_game_window_twitch_disconnected")
	}
	local style = {
		connecting = {
			word_wrap = false,
			scenegraph_id = "connecting",
			font_size = 24,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				10
			}
		},
		shadow = {
			word_wrap = false,
			scenegraph_id = "connecting",
			font_size = 24,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = {
				255,
				0,
				0,
				0
			},
			offset = {
				2,
				-2,
				9
			}
		}
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local twitch_description_style = {
	font_size = 28,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local client_disclaimer_description_style = {
	font_size = 28,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("red", 255),
	offset = {
		0,
		0,
		2
	}
}

local function connected_content_check_function(content)
	return not Managers.twitch:is_connecting() and not Managers.twitch:is_connected()
end

local function disconnected_content_check_function(content)
	return not Managers.twitch:is_connecting() and Managers.twitch:is_connected()
end

local streaming_desc_str = (PLATFORM == "win32" and "start_game_window_twitch_connect_description") or "start_game_window_mixer_connect_description"
local client_disclaimer_desc_str = (PLATFORM == "win32" and "start_game_window_twitch_client_disclaimer_description") or "start_game_window_mixer_client_disclaimer_description"
local play_widgets = {
	mission_setting = UIWidgets.create_start_game_console_setting_button("game_option_1", Localize("start_game_window_mission"), nil, nil, nil, scenegraph_definition.game_option_1.size),
	difficulty_setting = UIWidgets.create_start_game_console_setting_button("game_option_2", Localize("start_game_window_difficulty"), nil, "difficulty_option_1", nil, scenegraph_definition.game_option_2.size, true),
	play_button_console = UIWidgets.create_start_game_console_play_button("play_button_console"),
	play_button = UIWidgets.create_icon_and_name_button("play_button", "options_button_icon_quickplay", Localize("start_game_window_play"))
}
local client_widgets = {
	client_disclaimer_background = UIWidgets.create_rect_with_outer_frame("client_disclaimer_background", scenegraph_definition.client_disclaimer_background.size, "frame_outer_fade_02", nil, UISettings.console_start_game_menu_rect_color),
	client_disclaimer_description = UIWidgets.create_simple_text(Localize(client_disclaimer_desc_str), "client_disclaimer_description", nil, nil, client_disclaimer_description_style)
}
local widgets = {
	twitch_description_background = UIWidgets.create_rect_with_outer_frame("twitch_background", scenegraph_definition.twitch_background.size, "frame_outer_fade_02", nil, UISettings.console_start_game_menu_rect_color),
	twitch_texture = UIWidgets.create_simple_texture("twitch_logo", "twitch_texture"),
	twitch_divider = UIWidgets.create_simple_texture("divider_01_top", "twitch_divider"),
	twitch_description = UIWidgets.create_simple_text(Localize(streaming_desc_str), "twitch_description", nil, nil, twitch_description_style),
	button_1 = create_button("connect_button", scenegraph_definition.connect_button.size, Localize("start_game_window_twitch_connect"), 24, connected_content_check_function),
	button_2 = create_button("disconnect_button", scenegraph_definition.disconnect_button.size, string.format(Localize("start_game_window_twitch_disconnect"), "N/A"), 24, disconnected_content_check_function),
	connect_button_frame = UIWidgets.create_frame("connect_button_frame", scenegraph_definition.connect_button_frame.size, window_frame, 1),
	disconnect_button_frame = UIWidgets.create_frame("disconnect_button_frame", scenegraph_definition.disconnect_button_frame.size, window_frame, 1),
	login_text_frame = UIWidgets.create_frame("login_text_frame", {
		window_text_width,
		50
	}, "menu_frame_09", 1),
	frame_widget = create_window("twitch_background", scenegraph_definition.twitch_background.size)
}
widgets.login_text_frame.element.passes[1].content_check_function = connected_content_check_function
widgets.connect_button_frame.element.passes[1].content_check_function = connected_content_check_function
widgets.disconnect_button_frame.element.passes[1].content_check_function = disconnected_content_check_function

if PLATFORM == "xb1" then
	widgets.frame_widget = create_window_mixer("twitch_background", scenegraph_definition.twitch_background.size)
	widgets.login_text_frame = nil
	widgets.button_1 = nil
	widgets.button_2 = nil
	widgets.connect_button_frame = nil
	widgets.disconnect_button_frame = nil
end

local additional_settings_widgets = {}
local selector_input_definition = {
	"mission_setting",
	"difficulty_setting"
}

return {
	scenegraph_definition = scenegraph_definition,
	widgets = widgets,
	play_widgets = play_widgets,
	client_widgets = client_widgets,
	additional_settings_widgets = additional_settings_widgets,
	animation_definitions = animation_definitions,
	selector_input_definition = selector_input_definition
}
