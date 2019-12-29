local scenegraph_definition = {
	screen = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.matchmaking - 10
		}
	},
	window_root = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "right",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			0
		}
	},
	window = {
		vertical_alignment = "top",
		parent = "window_root",
		horizontal_alignment = "right",
		size = {
			506,
			136
		},
		position = {
			0,
			0,
			5
		}
	},
	loading_icon = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			141,
			141
		},
		position = {
			15,
			15,
			1
		}
	},
	loading_status_frame = {
		vertical_alignment = "center",
		parent = "loading_icon",
		horizontal_alignment = "center",
		size = {
			141,
			141
		},
		position = {
			0,
			0,
			1
		}
	},
	status_text = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "left",
		size = {
			360,
			35
		},
		position = {
			43,
			-28,
			1
		}
	},
	window_party = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			400,
			50
		},
		position = {
			0,
			-80,
			1
		}
	},
	detailed_info_box = {
		vertical_alignment = "top",
		parent = "window_root",
		horizontal_alignment = "right",
		size = {
			400,
			150
		},
		position = {
			0,
			-60,
			0
		}
	},
	level_key_info_box = {
		vertical_alignment = "top",
		parent = "detailed_info_box",
		horizontal_alignment = "left",
		size = {
			270,
			150
		},
		position = {
			0,
			0,
			0
		}
	},
	party_slot_root = {
		vertical_alignment = "top",
		parent = "detailed_info_box",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			-50,
			1
		}
	},
	party_slot_1 = {
		vertical_alignment = "center",
		parent = "party_slot_root",
		horizontal_alignment = "center",
		size = {
			60,
			70
		},
		position = {
			-135,
			-52,
			1
		}
	},
	party_slot_2 = {
		vertical_alignment = "center",
		parent = "party_slot_root",
		horizontal_alignment = "center",
		size = {
			60,
			70
		},
		position = {
			-45,
			-52,
			1
		}
	},
	party_slot_3 = {
		vertical_alignment = "center",
		parent = "party_slot_root",
		horizontal_alignment = "center",
		size = {
			60,
			70
		},
		position = {
			45,
			-52,
			1
		}
	},
	party_slot_4 = {
		vertical_alignment = "center",
		parent = "party_slot_root",
		horizontal_alignment = "center",
		size = {
			60,
			70
		},
		position = {
			135,
			-52,
			1
		}
	},
	player_status_4 = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			30,
			30
		},
		position = {
			-18,
			15,
			10
		}
	},
	player_status_3 = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			30,
			30
		},
		position = {
			-45,
			12,
			10
		}
	},
	player_status_2 = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			30,
			30
		},
		position = {
			-71,
			22,
			10
		}
	},
	player_status_1 = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			30,
			30
		},
		position = {
			-89,
			43,
			10
		}
	},
	timer_bg = {
		vertical_alignment = "top",
		parent = "detailed_info_box",
		horizontal_alignment = "center",
		size = {
			400,
			16
		},
		position = {
			0,
			-140,
			3
		}
	},
	timer_fg = {
		vertical_alignment = "center",
		parent = "timer_bg",
		horizontal_alignment = "left",
		size = {
			392,
			16
		},
		position = {
			4,
			0,
			3
		}
	},
	timer_glow = {
		vertical_alignment = "center",
		parent = "timer_fg",
		horizontal_alignment = "right",
		size = {
			45,
			80
		},
		position = {
			22,
			0,
			3
		}
	},
	cancel_text_field = {
		vertical_alignment = "bottom",
		parent = "detailed_info_box",
		horizontal_alignment = "center",
		size = {
			400,
			50
		},
		position = {
			0,
			-50,
			3
		}
	},
	cancel_input_backround = {
		vertical_alignment = "center",
		parent = "cancel_text_field",
		horizontal_alignment = "center",
		size = {
			411,
			61
		},
		position = {
			0,
			0,
			1
		}
	},
	cancel_text_input = {
		vertical_alignment = "center",
		parent = "cancel_text_field",
		horizontal_alignment = "center",
		size = {
			400,
			50
		},
		position = {
			200,
			0,
			2
		}
	},
	cancel_text_prefix = {
		vertical_alignment = "center",
		parent = "cancel_text_field",
		horizontal_alignment = "center",
		size = {
			400,
			50
		},
		position = {
			200,
			0,
			2
		}
	},
	cancel_text_suffix = {
		vertical_alignment = "center",
		parent = "cancel_text_field",
		horizontal_alignment = "center",
		size = {
			400,
			50
		},
		position = {
			200,
			0,
			2
		}
	},
	cancel_icon = {
		vertical_alignment = "center",
		parent = "cancel_text_field",
		horizontal_alignment = "center",
		size = {
			36,
			26
		},
		position = {
			0,
			0,
			2
		}
	},
	debug_box = {
		vertical_alignment = "bottom",
		parent = "window_root",
		horizontal_alignment = "center",
		size = {
			320,
			320
		},
		position = {
			0,
			-340,
			1
		}
	},
	debug_box_text = {
		vertical_alignment = "center",
		parent = "debug_box",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			2
		},
		size = {
			300,
			300
		}
	},
	debug_lobbies_box = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			1440,
			1040
		},
		position = {
			20,
			-20,
			1
		}
	},
	debug_lobbies_text = {
		vertical_alignment = "center",
		parent = "debug_lobbies_box",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			2
		},
		size = {
			900,
			1040
		}
	},
	debug_server_text = {
		vertical_alignment = "center",
		parent = "debug_lobbies_box",
		horizontal_alignment = "left",
		position = {
			0,
			0,
			2
		},
		size = {
			150,
			1000
		}
	},
	debug_match_text = {
		vertical_alignment = "center",
		parent = "debug_lobbies_box",
		horizontal_alignment = "left",
		position = {
			150,
			0,
			2
		},
		size = {
			50,
			1000
		}
	},
	debug_broken_text = {
		vertical_alignment = "center",
		parent = "debug_lobbies_box",
		horizontal_alignment = "left",
		position = {
			190,
			0,
			2
		},
		size = {
			50,
			1000
		}
	},
	debug_valid_text = {
		vertical_alignment = "center",
		parent = "debug_lobbies_box",
		horizontal_alignment = "left",
		position = {
			250,
			0,
			2
		},
		size = {
			50,
			1000
		}
	},
	debug_level_key_text = {
		vertical_alignment = "center",
		parent = "debug_lobbies_box",
		horizontal_alignment = "left",
		position = {
			300,
			0,
			2
		},
		size = {
			100,
			1000
		}
	},
	debug_selected_level_key_text = {
		vertical_alignment = "center",
		parent = "debug_lobbies_box",
		horizontal_alignment = "left",
		position = {
			400,
			0,
			2
		},
		size = {
			100,
			1000
		}
	},
	debug_matchmaking_text = {
		vertical_alignment = "center",
		parent = "debug_lobbies_box",
		horizontal_alignment = "left",
		position = {
			500,
			0,
			2
		},
		size = {
			75,
			1000
		}
	},
	debug_difficulty_text = {
		vertical_alignment = "center",
		parent = "debug_lobbies_box",
		horizontal_alignment = "left",
		position = {
			575,
			0,
			2
		},
		size = {
			50,
			1000
		}
	},
	debug_num_players_text = {
		vertical_alignment = "center",
		parent = "debug_lobbies_box",
		horizontal_alignment = "left",
		position = {
			640,
			0,
			2
		},
		size = {
			50,
			1000
		}
	},
	debug_wh_text = {
		vertical_alignment = "center",
		parent = "debug_lobbies_box",
		horizontal_alignment = "left",
		position = {
			690,
			0,
			2
		},
		size = {
			50,
			1000
		}
	},
	debug_we_text = {
		vertical_alignment = "center",
		parent = "debug_lobbies_box",
		horizontal_alignment = "left",
		position = {
			740,
			0,
			2
		},
		size = {
			50,
			1000
		}
	},
	debug_dr_text = {
		vertical_alignment = "center",
		parent = "debug_lobbies_box",
		horizontal_alignment = "left",
		position = {
			790,
			0,
			2
		},
		size = {
			50,
			1000
		}
	},
	debug_bw_text = {
		vertical_alignment = "center",
		parent = "debug_lobbies_box",
		horizontal_alignment = "left",
		position = {
			840,
			0,
			2
		},
		size = {
			50,
			1000
		}
	},
	debug_es_text = {
		vertical_alignment = "center",
		parent = "debug_lobbies_box",
		horizontal_alignment = "left",
		position = {
			890,
			0,
			2
		},
		size = {
			50,
			1000
		}
	},
	debug_rp_text = {
		vertical_alignment = "center",
		parent = "debug_lobbies_box",
		horizontal_alignment = "left",
		position = {
			940,
			0,
			2
		},
		size = {
			50,
			1000
		}
	},
	debug_host_text = {
		vertical_alignment = "center",
		parent = "debug_lobbies_box",
		horizontal_alignment = "left",
		position = {
			990,
			0,
			2
		},
		size = {
			150,
			1000
		}
	},
	debug_lobby_id_text = {
		vertical_alignment = "center",
		parent = "debug_lobbies_box",
		horizontal_alignment = "left",
		position = {
			1140,
			0,
			2
		},
		size = {
			150,
			1000
		}
	},
	debug_hash_text = {
		vertical_alignment = "center",
		parent = "debug_lobbies_box",
		horizontal_alignment = "left",
		position = {
			1290,
			0,
			2
		},
		size = {
			150,
			1000
		}
	},
	debug_divider_0 = {
		vertical_alignment = "top",
		parent = "debug_lobbies_box",
		horizontal_alignment = "left",
		position = {
			0,
			-40,
			2
		},
		size = {
			1290,
			2
		}
	},
	debug_divider_1 = {
		vertical_alignment = "top",
		parent = "debug_lobbies_box",
		horizontal_alignment = "left",
		position = {
			179,
			0,
			2
		},
		size = {
			2,
			1040
		}
	}
}
local window_corner_radius = 5
local window_background_color = {
	255,
	10,
	10,
	10
}
local default_text_style = {
	font_size = 22,
	upper_case = true,
	word_wrap = true,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local title_text_style = table.clone(default_text_style)
title_text_style.vertical_alignment = "top"
title_text_style.horizontal_alignment = "left"
title_text_style.dynamic_font_size = true
title_text_style.offset[2] = -10
title_text_style.offset[1] = 15
title_text_style.text_color = Colors.get_color_table_with_alpha("font_title", 255)
local difficulty_text_style = table.clone(default_text_style)
difficulty_text_style.vertical_alignment = "top"
difficulty_text_style.horizontal_alignment = "left"
difficulty_text_style.font_size = 16
difficulty_text_style.offset[1] = 15
difficulty_text_style.offset[2] = -35
local matchmaking_status_text_style = table.clone(default_text_style)
matchmaking_status_text_style.vertical_alignment = "center"
matchmaking_status_text_style.horizontal_alignment = "center"
matchmaking_status_text_style.font_size = 26
matchmaking_status_text_style.dynamic_font_size = true
matchmaking_status_text_style.word_wrap = false
matchmaking_status_text_style.offset[2] = 2
local cancel_input_text_style = table.clone(default_text_style)
cancel_input_text_style.vertical_alignment = "center"
cancel_input_text_style.horizontal_alignment = "left"
cancel_input_text_style.use_shadow = true
cancel_input_text_style.font_size = 28
cancel_input_text_style.dynamic_font_size = true
cancel_input_text_style.offset[2] = 2
cancel_input_text_style.text_color = Colors.get_color_table_with_alpha("font_title", 255)
local cancel_text_style = table.clone(cancel_input_text_style)
cancel_text_style.text_color = Colors.get_color_table_with_alpha("white", 255)

local function create_status_widget(texture, scenegraph_id)
	return {
		element = {
			passes = {
				{
					style_id = "texture_id",
					pass_type = "texture",
					texture_id = "texture_id",
					content_check_function = function (content)
						return content.is_connecting or content.is_connected
					end,
					content_change_function = function (content, style, animations, dt)
						local color = style.color

						if content.is_connecting then
							local color_progress = ((content.color_progress or 1) + dt) % 1
							content.color_progress = color_progress
							local anim_progress = math.ease_pulse(color_progress)
							color[1] = 255 * anim_progress
						elseif content.is_connected then
							color[1] = 255
						end
					end
				}
			}
		},
		content = {
			is_connected = false,
			is_connecting = false,
			texture_id = texture
		},
		style = {
			texture_id = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

local widget_definitions = {
	window = UIWidgets.create_simple_texture("matchmaking_window", "window"),
	loading_icon = UIWidgets.create_simple_texture("matchmaking_icon", "loading_icon"),
	loading_status_frame = UIWidgets.create_simple_rotated_texture("matchmaking_icon_effect", 0, {
		71,
		71
	}, "loading_status_frame"),
	window_hotspot = UIWidgets.create_simple_hotspot("window"),
	status_text = UIWidgets.create_simple_text("n/a", "status_text", nil, nil, matchmaking_status_text_style),
	player_status_1 = create_status_widget("matchmaking_light_02", "player_status_1"),
	player_status_2 = create_status_widget("matchmaking_light_02", "player_status_2"),
	player_status_3 = create_status_widget("matchmaking_light_02", "player_status_3"),
	player_status_4 = create_status_widget("matchmaking_light_02", "player_status_4")
}
local widget_detail_definitions = {
	detailed_info_box_frame = UIWidgets.create_frame("detailed_info_box", scenegraph_definition.detailed_info_box.size, "menu_frame_09", 1),
	detailed_info_box = UIWidgets.create_background("detailed_info_box", scenegraph_definition.detailed_info_box.size, "matchmaking_window_01"),
	title_text = UIWidgets.create_simple_text("n/a", "level_key_info_box", nil, nil, title_text_style),
	difficulty_text = UIWidgets.create_simple_text("n/a", "detailed_info_box", nil, nil, difficulty_text_style),
	party_slot_1 = UIWidgets.create_matchmaking_portrait(scenegraph_definition.party_slot_1.size, "party_slot_1"),
	party_slot_2 = UIWidgets.create_matchmaking_portrait(scenegraph_definition.party_slot_2.size, "party_slot_2"),
	party_slot_3 = UIWidgets.create_matchmaking_portrait(scenegraph_definition.party_slot_3.size, "party_slot_3"),
	party_slot_4 = UIWidgets.create_matchmaking_portrait(scenegraph_definition.party_slot_4.size, "party_slot_4"),
	timer_bg = UIWidgets.create_simple_texture("timer_bg", "timer_bg"),
	timer_fg = UIWidgets.create_simple_uv_texture("timer_fg", {
		{
			0,
			0
		},
		{
			1,
			1
		}
	}, "timer_fg"),
	timer_glow = UIWidgets.create_simple_texture("timer_detail", "timer_glow")
}
local cancel_input_widgets = {
	cancel_text_input = UIWidgets.create_simple_text(Localize("matchmaking_surfix_cancel"), "cancel_text_input", nil, nil, cancel_input_text_style),
	cancel_text_suffix = UIWidgets.create_simple_text(Localize("matchmaking_surfix_cancel"), "cancel_text_suffix", nil, nil, cancel_text_style),
	cancel_text_prefix = UIWidgets.create_simple_text(Localize("matchmaking_surfix_cancel"), "cancel_text_prefix", nil, nil, cancel_text_style),
	cancel_icon = UIWidgets.create_simple_texture("xbone_button_icon_a", "cancel_icon"),
	cancel_input_backround = UIWidgets.create_simple_texture("tab_menu_bg_02", "cancel_input_backround")
}
local debug_widget_definitions = {
	debug_box = {
		scenegraph_id = "debug_box",
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "background_rect"
				},
				{
					style_id = "debug_text",
					pass_type = "text",
					text_id = "debug_text"
				}
			}
		},
		content = {
			debug_text = ""
		},
		style = {
			debug_text = {
				scenegraph_id = "debug_box_text",
				font_size = 28,
				word_wrap = true,
				pixel_perfect = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255)
			},
			background_rect = {
				color = {
					180,
					0,
					0,
					0
				}
			}
		}
	},
	debug_lobbies = {
		scenegraph_id = "debug_lobbies_box",
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "background_rect"
				},
				{
					pass_type = "rect",
					style_id = "debug_divider_0"
				},
				{
					pass_type = "rect",
					style_id = "debug_divider_1"
				},
				{
					style_id = "debug_text",
					pass_type = "text",
					text_id = "debug_text"
				},
				{
					style_id = "debug_match_text",
					pass_type = "text",
					text_id = "debug_match_text"
				},
				{
					style_id = "debug_broken_text",
					pass_type = "text",
					text_id = "debug_broken_text"
				},
				{
					style_id = "debug_valid_text",
					pass_type = "text",
					text_id = "debug_valid_text"
				},
				{
					style_id = "debug_server_text",
					pass_type = "text",
					text_id = "debug_server_text"
				},
				{
					style_id = "debug_level_key_text",
					pass_type = "text",
					text_id = "debug_level_key_text"
				},
				{
					style_id = "debug_selected_level_key_text",
					pass_type = "text",
					text_id = "debug_selected_level_key_text"
				},
				{
					style_id = "debug_matchmaking_text",
					pass_type = "text",
					text_id = "debug_matchmaking_text"
				},
				{
					style_id = "debug_difficulty_text",
					pass_type = "text",
					text_id = "debug_difficulty_text"
				},
				{
					style_id = "debug_num_players_text",
					pass_type = "text",
					text_id = "debug_num_players_text"
				},
				{
					style_id = "debug_wh_text",
					pass_type = "text",
					text_id = "debug_wh_text"
				},
				{
					style_id = "debug_we_text",
					pass_type = "text",
					text_id = "debug_we_text"
				},
				{
					style_id = "debug_dr_text",
					pass_type = "text",
					text_id = "debug_dr_text"
				},
				{
					style_id = "debug_bw_text",
					pass_type = "text",
					text_id = "debug_bw_text"
				},
				{
					style_id = "debug_es_text",
					pass_type = "text",
					text_id = "debug_es_text"
				},
				{
					style_id = "debug_rp_text",
					pass_type = "text",
					text_id = "debug_rp_text"
				},
				{
					style_id = "debug_host_text",
					pass_type = "text",
					text_id = "debug_host_text"
				},
				{
					style_id = "debug_lobby_id_text",
					pass_type = "text",
					text_id = "debug_lobby_id_text"
				},
				{
					style_id = "debug_hash_text",
					pass_type = "text",
					text_id = "debug_hash_text"
				}
			}
		},
		content = {
			debug_es_text = "",
			debug_num_players_text = "",
			debug_bw_text = "",
			debug_match_text = "",
			debug_wh_text = "",
			debug_lobby_id_text = "",
			debug_server_text = "",
			debug_host_text = "",
			debug_valid_text = "",
			debug_level_key_text = "",
			debug_we_text = "",
			debug_selected_level_key_text = "",
			debug_rp_text = "",
			debug_text = "Lobbies",
			debug_broken_text = "",
			debug_difficulty_text = "",
			debug_matchmaking_text = "",
			debug_hash_text = "",
			debug_dr_text = ""
		},
		style = {
			debug_text = {
				vertical_alignment = "top",
				scenegraph_id = "debug_lobbies_text",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 14,
				font_type = "hell_shark",
				text_color = Colors.get_table("white", 255)
			},
			debug_server_text = {
				vertical_alignment = "top",
				scenegraph_id = "debug_server_text",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 14,
				font_type = "hell_shark",
				text_color = Colors.get_table("white", 255)
			},
			debug_match_text = {
				vertical_alignment = "top",
				scenegraph_id = "debug_match_text",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 14,
				font_type = "hell_shark",
				text_color = Colors.get_table("white", 255)
			},
			debug_broken_text = {
				vertical_alignment = "top",
				scenegraph_id = "debug_broken_text",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 14,
				font_type = "hell_shark",
				text_color = Colors.get_table("white", 255)
			},
			debug_valid_text = {
				vertical_alignment = "top",
				scenegraph_id = "debug_valid_text",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 14,
				font_type = "hell_shark",
				text_color = Colors.get_table("white", 255)
			},
			debug_level_key_text = {
				vertical_alignment = "top",
				scenegraph_id = "debug_level_key_text",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 14,
				font_type = "hell_shark",
				text_color = Colors.get_table("white", 255)
			},
			debug_selected_level_key_text = {
				vertical_alignment = "top",
				scenegraph_id = "debug_selected_level_key_text",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 14,
				font_type = "hell_shark",
				text_color = Colors.get_table("white", 255)
			},
			debug_matchmaking_text = {
				vertical_alignment = "top",
				scenegraph_id = "debug_matchmaking_text",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 14,
				font_type = "hell_shark",
				text_color = Colors.get_table("white", 255)
			},
			debug_difficulty_text = {
				vertical_alignment = "top",
				scenegraph_id = "debug_difficulty_text",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 14,
				font_type = "hell_shark",
				text_color = Colors.get_table("white", 255)
			},
			debug_num_players_text = {
				vertical_alignment = "top",
				scenegraph_id = "debug_num_players_text",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 14,
				font_type = "hell_shark",
				text_color = Colors.get_table("white", 255)
			},
			debug_wh_text = {
				vertical_alignment = "top",
				scenegraph_id = "debug_wh_text",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 14,
				font_type = "hell_shark",
				text_color = Colors.get_table("white", 255)
			},
			debug_we_text = {
				vertical_alignment = "top",
				scenegraph_id = "debug_we_text",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 14,
				font_type = "hell_shark",
				text_color = Colors.get_table("white", 255)
			},
			debug_dr_text = {
				vertical_alignment = "top",
				scenegraph_id = "debug_dr_text",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 14,
				font_type = "hell_shark",
				text_color = Colors.get_table("white", 255)
			},
			debug_bw_text = {
				vertical_alignment = "top",
				scenegraph_id = "debug_bw_text",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 14,
				font_type = "hell_shark",
				text_color = Colors.get_table("white", 255)
			},
			debug_es_text = {
				vertical_alignment = "top",
				scenegraph_id = "debug_es_text",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 14,
				font_type = "hell_shark",
				text_color = Colors.get_table("white", 255)
			},
			debug_rp_text = {
				vertical_alignment = "top",
				scenegraph_id = "debug_rp_text",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 14,
				font_type = "hell_shark",
				text_color = Colors.get_table("white", 255)
			},
			debug_host_text = {
				vertical_alignment = "top",
				scenegraph_id = "debug_host_text",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 14,
				font_type = "hell_shark",
				text_color = Colors.get_table("white", 255)
			},
			debug_lobby_id_text = {
				vertical_alignment = "top",
				scenegraph_id = "debug_lobby_id_text",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 14,
				font_type = "hell_shark",
				text_color = Colors.get_table("white", 255)
			},
			debug_hash_text = {
				vertical_alignment = "top",
				scenegraph_id = "debug_hash_text",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 14,
				font_type = "hell_shark",
				text_color = Colors.get_table("white", 255)
			},
			background_rect = {
				color = {
					180,
					0,
					0,
					0
				}
			},
			debug_divider_0 = {
				scenegraph_id = "debug_divider_0",
				color = {
					150,
					255,
					255,
					255
				}
			},
			debug_divider_1 = {
				scenegraph_id = "debug_divider_1",
				color = {
					150,
					255,
					255,
					255
				}
			}
		}
	}
}

return {
	widget_definitions = widget_definitions,
	cancel_input_widgets = cancel_input_widgets,
	widget_detail_definitions = widget_detail_definitions,
	debug_widget_definitions = debug_widget_definitions,
	scenegraph_definition = scenegraph_definition
}
