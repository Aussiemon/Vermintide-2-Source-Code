local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.popup + 1
		},
		size = {
			1920,
			1080
		}
	},
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.popup
		},
		size = {
			1920,
			1080
		}
	},
	popup_root = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "right",
		position = {
			-100,
			100,
			1
		},
		size = {
			450,
			700
		}
	},
	exit_button = {
		vertical_alignment = "top",
		parent = "popup_root",
		horizontal_alignment = "right",
		position = {
			-10,
			-10,
			1
		},
		size = {
			40,
			40
		}
	},
	logo = {
		vertical_alignment = "top",
		parent = "popup_root",
		horizontal_alignment = "center",
		position = {
			0,
			-65,
			1
		},
		size = {
			420,
			151.2
		}
	},
	connecting = {
		vertical_alignment = "center",
		parent = "popup_root",
		horizontal_alignment = "center",
		position = {
			120,
			-50,
			1
		},
		size = {
			400,
			50
		}
	},
	error_field = {
		vertical_alignment = "center",
		parent = "popup_root",
		horizontal_alignment = "center",
		position = {
			0,
			-100,
			1
		},
		size = {
			400,
			50
		}
	},
	popup_text_box = {
		vertical_alignment = "center",
		parent = "popup_root",
		horizontal_alignment = "center",
		position = {
			-55,
			-50,
			1
		},
		size = {
			300,
			50
		}
	},
	popup_text = {
		vertical_alignment = "top",
		parent = "logo",
		horizontal_alignment = "center",
		position = {
			0,
			-90,
			2
		},
		size = {
			450,
			260
		}
	},
	play_text = {
		vertical_alignment = "top",
		parent = "popup_root",
		horizontal_alignment = "center",
		position = {
			0,
			90,
			2
		},
		size = {
			450,
			260
		}
	},
	twitch_connect_button = {
		vertical_alignment = "center",
		parent = "popup_text_box",
		horizontal_alignment = "left",
		position = {
			310,
			-0,
			2
		},
		size = {
			100,
			50
		}
	},
	twitch_disconnect_button = {
		vertical_alignment = "center",
		parent = "popup_root",
		horizontal_alignment = "center",
		position = {
			0,
			-10,
			2
		},
		size = {
			188,
			50
		}
	},
	glass_indicator = {
		vertical_alignment = "top",
		parent = "popup_root",
		horizontal_alignment = "right",
		size = {
			40,
			40
		},
		position = {
			-20,
			-20,
			1
		}
	},
	fuzzy_circle = {
		vertical_alignment = "center",
		parent = "glass_indicator",
		horizontal_alignment = "center",
		size = {
			90,
			90
		}
	},
	feed_area_edge = {
		vertical_alignment = "bottom",
		parent = "popup_root",
		horizontal_alignment = "center",
		size = {
			390,
			250
		},
		position = {
			2,
			50,
			2
		}
	},
	feed_area_top = {
		vertical_alignment = "center",
		parent = "feed_area_edge",
		horizontal_alignment = "center",
		size = {
			386,
			246
		}
	},
	feed_area = {
		vertical_alignment = "center",
		parent = "feed_area_top",
		horizontal_alignment = "center",
		size = {
			380,
			230
		}
	}
}

local function create_window(scenegraph_id, size)
	local background_texture = "menu_frame_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = UIFrameSettings.menu_frame_02
	local inner_frame_settings = UIFrameSettings.menu_frame_06
	local widget = {
		element = {}
	}
	local passes = {
		{
			scenegraph_id = "popup_text_box",
			pass_type = "hotspot",
			content_id = "text_input_hotspot"
		},
		{
			scenegraph_id = "root",
			pass_type = "hotspot",
			content_id = "screen_hotspot"
		},
		{
			scenegraph_id = "popup_root",
			pass_type = "hotspot",
			content_id = "frame_hotspot"
		},
		{
			style_id = "background",
			pass_type = "texture_uv",
			content_id = "background"
		},
		{
			pass_type = "texture",
			style_id = "logo",
			texture_id = "logo"
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame"
		},
		{
			style_id = "inner_rect",
			pass_type = "rect",
			content_check_function = function (content, style)
				return not Managers.twitch:is_connected() and not Managers.twitch:is_connecting()
			end
		},
		{
			style_id = "inner_inner_rect",
			pass_type = "rect",
			content_check_function = function (content, style)
				return not Managers.twitch:is_connected() and not Managers.twitch:is_connecting()
			end
		},
		{
			pass_type = "rect",
			style_id = "background_tint"
		},
		{
			style_id = "text",
			pass_type = "text",
			text_id = "text_field",
			content_check_function = function (content, style)
				local connected = Managers.twitch:is_connected()

				if connected then
					local user_name = Managers.twitch:user_name()
					content.text_field = Localize("start_game_window_twitch_confirm_connection") .. user_name
				else
					content.text_field = Localize("start_game_window_twitch_connect_description")
				end

				return true
			end
		},
		{
			style_id = "play_text",
			pass_type = "text",
			text_id = "play_text_field"
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
				local is_connecting = Managers.twitch:is_connecting()

				if not is_connecting then
					return
				end

				local timer = math.ceil(Application.time_since_launch() * 10)
				local dots = timer % 5
				local dot_str = ""

				for i = 1, dots, 1 do
					dot_str = dot_str .. "."
				end

				content.connecting_id = "Connecting" .. dot_str

				return true
			end
		},
		{
			style_id = "error_field",
			pass_type = "text",
			text_id = "error_id",
			content_check_function = function (content, style)
				local is_connecting = Managers.twitch:is_connecting()
				local is_connected = Managers.twitch:is_connected()

				if is_connecting or is_connected then
					return
				end

				return true
			end
		}
	}
	local content = {
		text_field_active = false,
		text_start_offset = 0,
		connecting_id = "Connecting",
		error_id = " ",
		text_field = "Connect to your twitch chat to be able to interact with your twitch audience",
		fuzzy_circle = "fuzzy_circle",
		glass_indicator = "glass_indicator",
		text_index = 1,
		logo = "twitch_logo",
		twitch_name = "",
		caret_index = 1,
		login_hint = "Type your username here",
		play_text_field = "Play with",
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
		text_input_hotspot = {},
		screen_hotspot = {},
		frame_hotspot = {}
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
		background_tint = {
			scenegraph_id = "screen",
			offset = {
				0,
				0,
				0
			},
			color = {
				60,
				0,
				0,
				0
			}
		},
		inner_rect = {
			scenegraph_id = "popup_text_box",
			color = {
				255,
				128,
				128,
				128
			},
			offset = {
				0,
				0,
				0
			}
		},
		inner_inner_rect = {
			scenegraph_id = "popup_text_box",
			color = {
				255,
				0,
				0,
				0
			},
			offset = {
				2,
				2,
				0
			},
			size = {
				296,
				46
			}
		},
		logo = {
			vertical_alignment = "center",
			scenegraph_id = "logo",
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
		glass_indicator = {
			vertical_alignment = "center",
			scenegraph_id = "glass_indicator",
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
		fuzzy_circle = {
			vertical_alignment = "center",
			scenegraph_id = "fuzzy_circle",
			horizontal_alignment = "center",
			offset = {
				0,
				0,
				2
			},
			color = {
				255,
				255,
				0,
				0
			}
		},
		text = {
			word_wrap = true,
			scenegraph_id = "popup_text",
			font_size = 28,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				0,
				0,
				2
			}
		},
		play_text = {
			word_wrap = true,
			scenegraph_id = "play_text",
			font_size = 60,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			dynamic_font = true,
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("twitch", 255),
			offset = {
				0,
				0,
				2
			}
		},
		login_hint = {
			word_wrap = true,
			scenegraph_id = "popup_text_box",
			font_size = 24,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			dynamic_font = true,
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
			}
		},
		connecting = {
			word_wrap = true,
			scenegraph_id = "connecting",
			font_size = 28,
			pixel_perfect = true,
			horizontal_alignment = "left",
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
				5,
				0,
				10
			}
		},
		error_field = {
			word_wrap = true,
			scenegraph_id = "error_field",
			font_size = 16,
			pixel_perfect = true,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = {
				0,
				255,
				0,
				0
			},
			offset = {
				0,
				0,
				10
			}
		},
		twitch_name = {
			horizontal_scroll = true,
			scenegraph_id = "popup_text_box",
			word_wrap = false,
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

local chat_output_widget = {
	scenegraph_id = "feed_area",
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
				style_id = "edge",
				pass_type = "rounded_background",
				content_check_function = function (content)
					return Managers.twitch:is_connected()
				end
			},
			{
				style_id = "background",
				pass_type = "rounded_background",
				content_check_function = function (content)
					return Managers.twitch:is_connected()
				end
			},
			{
				style_id = "text",
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
			scenegraph_id = "feed_area_top",
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
		edge = {
			corner_radius = 0,
			scenegraph_id = "feed_area_edge",
			offset = {
				0,
				0,
				1
			},
			color = {
				60,
				255,
				255,
				255
			}
		},
		background = {
			corner_radius = 0,
			scenegraph_id = "feed_area_top",
			offset = {
				0,
				0,
				2
			},
			color = Colors.get_table("black")
		},
		text = {
			word_wrap = true,
			scenegraph_id = "feed_area",
			spacing = 0,
			pixel_perfect = false,
			vertical_alignment = "top",
			dynamic_font = true,
			font_size = 18,
			font_type = "hell_shark_arial_masked",
			text_color = Colors.get_table("white"),
			name_color = Colors.get_table("sky_blue"),
			name_color_dev = Colors.get_table("cheeseburger"),
			name_color_system = Colors.get_table("white"),
			offset = {
				0,
				2,
				3
			}
		}
	}
}
local widget_definitions = {
	widgets = {
		frame_widget = create_window("popup_root", scenegraph_definition.popup_root.size),
		chat_output_widget = chat_output_widget,
		exit_button = UIWidgets.create_simple_two_state_button("exit_button", "tabs_icon_close", "tabs_icon_close_glow")
	},
	connect_button = UIWidgets.create_default_button("twitch_connect_button", scenegraph_definition.twitch_connect_button.size, nil, nil, "connect"),
	disconnect_button = UIWidgets.create_default_button("twitch_disconnect_button", scenegraph_definition.twitch_disconnect_button.size, nil, nil, "disconnect")
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions
}
