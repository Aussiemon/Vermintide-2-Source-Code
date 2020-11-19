local window_default_settings = UISettings.game_start_windows
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_text_width = window_size[1] - window_frame_width * 2
local login_text_area_size = {
	window_text_width - 20 - 160,
	50
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
		horizontal_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1
		}
	},
	description_text = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			window_size[2] / 2
		},
		position = {
			0,
			0,
			1
		}
	},
	texture_frame = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			383,
			383
		},
		position = {
			0,
			0,
			1
		}
	},
	twitch_texture = {
		vertical_alignment = "center",
		parent = "texture_frame",
		horizontal_alignment = "center",
		size = {
			294,
			98
		},
		position = {
			0,
			0,
			1
		}
	},
	twitch_title_divider = {
		vertical_alignment = "bottom",
		parent = "texture_frame",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			-20,
			2
		}
	},
	login_text_area = {
		vertical_alignment = "bottom",
		parent = "twitch_title_divider",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			50
		},
		position = {
			0,
			35,
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
	chat_feed_frame = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1] - 20,
			window_size[2] / 2
		},
		position = {
			0,
			10,
			1
		}
	},
	chat_feed_area_mask = {
		vertical_alignment = "center",
		parent = "chat_feed_frame",
		horizontal_alignment = "center",
		size = {
			window_size[1] - 40,
			window_size[2] / 2
		}
	},
	chat_feed_area = {
		vertical_alignment = "center",
		parent = "chat_feed_area_mask",
		horizontal_alignment = "center",
		size = {
			window_size[1] - 20,
			window_size[2] / 2
		}
	},
	chat_text_box = {
		vertical_alignment = "top",
		parent = "chat_feed_area",
		horizontal_alignment = "center",
		size = {
			window_size[1] - 40,
			window_size[2] / 2
		},
		position = {
			0,
			0,
			1
		}
	}
}

local function create_window(scenegraph_id, size)
	local background_texture = "menu_frame_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = UIFrameSettings.menu_frame_02
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
			scenegraph_id = "menu_root",
			pass_type = "hotspot",
			content_id = "screen_hotspot"
		},
		{
			scenegraph_id = "window",
			pass_type = "hotspot",
			content_id = "frame_hotspot"
		},
		{
			pass_type = "texture",
			style_id = "twitch_texture",
			texture_id = "twitch_texture"
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
					style.caret_color[1] = 128 + math.sin(Managers.time:time("ui") * 5) * 128
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

				local timer = math.ceil(Managers.time:time("ui") * 10)
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
		connecting_id = "Connecting",
		text_field_active = false,
		twitch_name = "",
		error_id = "",
		caret_index = 1,
		twitch_texture = "twitch_logo",
		text_index = 1,
		frame = frame_settings.texture,
		background = {
			uvs = {
				{
					0,
					0
				},
				{
					math.min(size[1] / background_texture_settings.size[1], 1),
					math.min(size[2] / background_texture_settings.size[2], 1)
				}
			},
			texture_id = background_texture
		},
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
		background = {
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				1
			}
		},
		frame = {
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				5
			}
		},
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
		twitch_texture = {
			vertical_alignment = "center",
			scenegraph_id = "twitch_texture",
			horizontal_alignment = "center",
			offset = {
				0,
				0,
				1
			},
			color = {
				255,
				255,
				255,
				255
			}
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
				0,
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

local chat_output_widget = {
	scenegraph_id = "chat_feed_area",
	element = {
		passes = {
			{
				pass_type = "texture",
				style_id = "mask",
				texture_id = "mask_id",
				content_check_function = function (content)
					return Managers.twitch:is_connected()
				end
			},
			{
				style_id = "background",
				pass_type = "rect",
				content_check_function = function (content)
					return Managers.twitch:is_connected()
				end
			},
			{
				style_id = "chat_text_box",
				pass_type = "text_area_chat",
				text_id = "text_field",
				content_check_function = function (content)
					return Managers.twitch:is_connected()
				end
			}
		}
	},
	content = {
		mask_id = "mask_rect",
		text_start_offset = 0,
		message_tables = {}
	},
	style = {
		mask = {
			corner_radius = 0,
			scenegraph_id = "chat_feed_area_mask",
			offset = {
				0,
				0,
				0
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		background = {
			scenegraph_id = "chat_feed_area",
			offset = {
				0,
				0,
				-1
			},
			color = {
				255,
				0,
				0,
				0
			}
		},
		chat_text_box = {
			word_wrap = true,
			scenegraph_id = "chat_text_box",
			spacing = 0,
			pixel_perfect = false,
			vertical_alignment = "top",
			dynamic_font = true,
			font_size = 18,
			font_type = "chat_output_font_masked",
			text_color = Colors.get_table("white"),
			name_color = Colors.get_table("sky_blue"),
			name_color_dev = Colors.get_table("cheeseburger"),
			name_color_system = Colors.get_table("gold"),
			offset = {
				0,
				-10,
				0
			}
		}
	}
}

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

local description_text_style = {
	word_wrap = true,
	font_size = 22,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
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

local function connecting_content_check_function(content)
	return Managers.twitch:is_connecting() or not Managers.twitch:is_connected()
end

local streaming_desc_str = "start_game_window_twitch_connect_description"
local widgets = {
	background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "window"),
	background_mask = UIWidgets.create_simple_texture("mask_rect", "window"),
	window = UIWidgets.create_frame("window", window_size, window_frame, 20),
	frame_widget = create_window("window", scenegraph_definition.window.size),
	login_text_frame = UIWidgets.create_frame("login_text_frame", {
		window_text_width,
		50
	}, "menu_frame_09", 1),
	chat_feed_frame = UIWidgets.create_frame("chat_feed_frame", {
		window_text_width - 20,
		250
	}, "menu_frame_09", 1),
	description_text = UIWidgets.create_simple_text(Localize(streaming_desc_str), "description_text", nil, nil, description_text_style),
	twitch_texture = UIWidgets.create_simple_texture("twitch_logo", "twitch_texture"),
	twitch_title_divider = UIWidgets.create_simple_texture("divider_01_top", "twitch_title_divider"),
	chat_output_widget = chat_output_widget,
	button_1 = create_button("connect_button", scenegraph_definition.connect_button.size, Localize("start_game_window_twitch_connect"), 24, connected_content_check_function),
	button_2 = create_button("disconnect_button", scenegraph_definition.disconnect_button.size, string.format(Localize("start_game_window_twitch_disconnect"), "N/A"), 24, disconnected_content_check_function),
	connect_button_frame = UIWidgets.create_frame("connect_button_frame", scenegraph_definition.connect_button_frame.size, window_frame, 1),
	disconnect_button_frame = UIWidgets.create_frame("disconnect_button_frame", scenegraph_definition.disconnect_button_frame.size, window_frame, 1)
}
widgets.login_text_frame.element.passes[1].content_check_function = connected_content_check_function
widgets.connect_button_frame.element.passes[1].content_check_function = connected_content_check_function
widgets.disconnect_button_frame.element.passes[1].content_check_function = disconnected_content_check_function
widgets.chat_feed_frame.element.passes[1].content_check_function = disconnected_content_check_function
widgets.description_text.element.passes[1].content_check_function = connecting_content_check_function
widgets.description_text.element.passes[2].content_check_function = connecting_content_check_function

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition
}
