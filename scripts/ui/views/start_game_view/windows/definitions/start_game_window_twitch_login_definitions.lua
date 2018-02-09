local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_text_width = window_size[1] - window_frame_width*2
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
	logo = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			420,
			151.2
		},
		position = {
			0,
			-65,
			1
		}
	},
	play_text = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			450,
			260
		},
		position = {
			0,
			90,
			2
		}
	},
	window_text = {
		vertical_alignment = "top",
		parent = "logo",
		horizontal_alignment = "center",
		size = {
			450,
			260
		},
		position = {
			0,
			-90,
			2
		}
	},
	window_text_box = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			300,
			42
		},
		position = {
			-85,
			-50,
			1
		}
	},
	connecting = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			400,
			50
		},
		position = {
			120,
			-50,
			1
		}
	},
	error_field = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			400,
			50
		},
		position = {
			0,
			-100,
			1
		}
	},
	twitch_connect_button = {
		vertical_alignment = "center",
		parent = "window_text_box",
		horizontal_alignment = "left",
		size = {
			150,
			42
		},
		position = {
			320,
			-0,
			2
		}
	},
	twitch_disconnect_button = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			188,
			42
		},
		position = {
			0,
			-10,
			2
		}
	},
	feed_area_edge = {
		vertical_alignment = "bottom",
		parent = "window",
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
			scenegraph_id = "window",
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
			style_id = "logo",
			texture_id = "logo"
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
					style.caret_color[1] = math.sin(Application.time_since_launch()*5)*128 + 128
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

				local timer = math.ceil(Application.time_since_launch()*10)
				local dots = timer%5
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
		text_start_offset = 0,
		logo = "twitch_logo",
		twitch_name = "",
		text_field_active = false,
		text_index = 1,
		caret_index = 1,
		connecting_id = "Connecting",
		error_id = " ",
		frame = frame_settings.texture,
		background = {
			uvs = {
				{
					0,
					0
				},
				{
					math.min(size[1]/background_texture_settings.size[1], 1),
					math.min(size[2]/background_texture_settings.size[2], 1)
				}
			},
			texture_id = background_texture
		},
		text_field = Localize("start_game_window_twitch_connect_with_twitch_to_activate"),
		play_text_field = Localize("start_game_window_twitch_play_with"),
		login_hint = Localize("start_game_window_twitch_login_hint"),
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
			scenegraph_id = "window",
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
			scenegraph_id = "window_text_box",
			color = {
				255,
				128,
				128,
				128
			},
			offset = {
				0,
				0,
				1
			}
		},
		inner_inner_rect = {
			scenegraph_id = "window_text_box",
			color = {
				255,
				0,
				0,
				0
			},
			offset = {
				2,
				2,
				2
			},
			size = {
				296,
				38
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
		text = {
			word_wrap = true,
			scenegraph_id = "window_text",
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
			scenegraph_id = "window_text_box",
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
			scenegraph_id = "window_text_box",
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
local widgets = {
	background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "window"),
	background_mask = UIWidgets.create_simple_texture("mask_rect", "window"),
	window = UIWidgets.create_frame("window", window_size, window_frame, 20),
	frame_widget = create_window("window", scenegraph_definition.window.size),
	chat_output_widget = chat_output_widget
}
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress

				return 
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

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress - 1

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	}
}

return {
	widgets = widgets,
	node_widgets = node_widgets,
	connect_button = UIWidgets.create_default_button("twitch_connect_button", scenegraph_definition.twitch_connect_button.size, nil, nil, Localize("start_game_window_twitch_connect"), 24, nil, "button_detail_03"),
	disconnect_button = UIWidgets.create_default_button("twitch_disconnect_button", scenegraph_definition.twitch_disconnect_button.size, nil, nil, "disconnect", 24, nil, "button_detail_03"),
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
