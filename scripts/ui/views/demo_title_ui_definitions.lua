local window_width = 264
local window_height = 575
local video_window_width = 320
local video_window_height = 180
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
			0
		}
	},
	dead_space_filler = {
		scale = "fit",
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
	portrait_base = {
		vertical_alignment = "top",
		parent = "dead_space_filler",
		horizontal_alignment = "left",
		size = {
			1920,
			200
		},
		position = {
			0,
			-90,
			1
		}
	},
	portrait_ink = {
		vertical_alignment = "center",
		parent = "portrait_base",
		horizontal_alignment = "left",
		size = {
			486,
			116
		},
		position = {
			100,
			0,
			10
		}
	},
	player_portrait = {
		vertical_alignment = "center",
		parent = "portrait_base",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			100,
			0,
			10
		}
	},
	player_career_name = {
		vertical_alignment = "center",
		parent = "player_portrait",
		horizontal_alignment = "left",
		size = {
			500,
			0
		},
		position = {
			80,
			-11,
			1
		}
	},
	player_name_divider = {
		vertical_alignment = "center",
		parent = "player_portrait",
		horizontal_alignment = "left",
		size = {
			450,
			4
		},
		position = {
			80,
			-5,
			1
		}
	},
	player_hero_name = {
		vertical_alignment = "center",
		parent = "player_portrait",
		horizontal_alignment = "left",
		size = {
			500,
			0
		},
		position = {
			80,
			-7,
			1
		}
	},
	press_start = {
		vertical_alignment = "bottom",
		parent = "dead_space_filler",
		horizontal_alignment = "center",
		size = {
			1920,
			1080
		},
		position = {
			0,
			150,
			100
		}
	},
	console_cursor = {
		vertical_alignment = "center",
		parent = "dead_space_filler",
		horizontal_alignment = "center",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			-50
		}
	},
	background = {
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
			99
		}
	},
	information_text = {
		vertical_alignment = "bottom",
		parent = "background",
		horizontal_alignment = "center",
		size = {
			600,
			62
		},
		position = {
			0,
			50,
			2
		}
	},
	change_profile_input_icon = {
		vertical_alignment = "bottom",
		parent = "dead_space_filler",
		horizontal_alignment = "left",
		size = {
			26,
			26
		},
		position = {
			35,
			15,
			30
		}
	},
	change_profile_input_text = {
		vertical_alignment = "center",
		parent = "change_profile_input_icon",
		horizontal_alignment = "left",
		size = {
			1200,
			1
		},
		position = {
			30,
			-5,
			1
		}
	},
	user_gamertag = {
		vertical_alignment = "bottom",
		parent = "change_profile_input_icon",
		horizontal_alignment = "left",
		size = {
			1200,
			50
		},
		position = {
			0,
			35,
			1
		}
	},
	splash_video = {
		parent = "background",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			700
		}
	},
	menu_root = {
		vertical_alignment = "center",
		parent = "dead_space_filler",
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
	right_side_root = {
		vertical_alignment = "top",
		parent = "dead_space_filler",
		horizontal_alignment = "right",
		size = {
			0,
			1080
		},
		position = {
			0,
			0,
			1
		}
	},
	left_side_root = {
		vertical_alignment = "top",
		parent = "dead_space_filler",
		horizontal_alignment = "left",
		size = {
			0,
			1080
		},
		position = {
			0,
			0,
			1
		}
	},
	selection_divider = {
		vertical_alignment = "center",
		parent = "left_side_root",
		horizontal_alignment = "left",
		size = {
			386,
			22
		},
		position = {
			100,
			0,
			1
		}
	},
	selection_description = {
		vertical_alignment = "top",
		parent = "left_side_root",
		horizontal_alignment = "left",
		size = {
			400,
			100
		},
		position = {
			100,
			-100,
			1
		}
	},
	info_window = {
		vertical_alignment = "top",
		parent = "right_side_root",
		horizontal_alignment = "right",
		size = {
			window_width,
			window_height
		},
		position = {
			-100,
			-150,
			1
		}
	},
	info_window_ink = {
		vertical_alignment = "top",
		parent = "right_side_root",
		horizontal_alignment = "right",
		size = {
			360,
			576
		},
		position = {
			-50,
			-150,
			1
		}
	},
	info_window_top = {
		vertical_alignment = "top",
		parent = "info_window",
		horizontal_alignment = "center",
		size = {
			264,
			21
		},
		position = {
			0,
			10,
			5
		}
	},
	info_window_bottom = {
		vertical_alignment = "bottom",
		parent = "info_window",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			-8,
			5
		}
	},
	info_window_video = {
		vertical_alignment = "top",
		parent = "info_window",
		horizontal_alignment = "center",
		size = {
			video_window_width,
			video_window_height
		},
		position = {
			0,
			-20,
			1
		}
	},
	info_window_title = {
		vertical_alignment = "top",
		parent = "info_window_top",
		horizontal_alignment = "center",
		size = {
			477,
			50
		},
		position = {
			0,
			80,
			1
		}
	},
	info_window_passive = {
		vertical_alignment = "bottom",
		parent = "info_window_video",
		horizontal_alignment = "center",
		size = {
			video_window_width,
			210
		},
		position = {
			0,
			-230,
			1
		}
	},
	info_window_passive_title = {
		vertical_alignment = "top",
		parent = "info_window_passive",
		horizontal_alignment = "center",
		size = {
			video_window_width,
			0
		},
		position = {
			0,
			0,
			1
		}
	},
	info_passive_icon = {
		vertical_alignment = "top",
		parent = "info_window_passive",
		horizontal_alignment = "left",
		size = {
			50,
			50
		},
		position = {
			10,
			-40,
			2
		}
	},
	info_passive_title = {
		vertical_alignment = "top",
		parent = "info_passive_icon",
		horizontal_alignment = "left",
		size = {
			video_window_width - 70,
			50
		},
		position = {
			60,
			0,
			1
		}
	},
	info_passive_description = {
		vertical_alignment = "bottom",
		parent = "info_window_passive",
		horizontal_alignment = "left",
		size = {
			video_window_width - 20,
			100
		},
		position = {
			10,
			15,
			2
		}
	},
	info_window_ability = {
		vertical_alignment = "bottom",
		parent = "info_window_passive",
		horizontal_alignment = "center",
		size = {
			video_window_width,
			210
		},
		position = {
			0,
			-180,
			1
		}
	},
	info_window_ability_title = {
		vertical_alignment = "top",
		parent = "info_window_ability",
		horizontal_alignment = "center",
		size = {
			video_window_width,
			0
		},
		position = {
			0,
			0,
			1
		}
	},
	info_ability_icon = {
		vertical_alignment = "top",
		parent = "info_window_ability",
		horizontal_alignment = "left",
		size = {
			50,
			50
		},
		position = {
			10,
			-40,
			2
		}
	},
	info_ability_title = {
		vertical_alignment = "top",
		parent = "info_ability_icon",
		horizontal_alignment = "left",
		size = {
			video_window_width - 70,
			50
		},
		position = {
			60,
			0,
			1
		}
	},
	info_ability_description = {
		vertical_alignment = "bottom",
		parent = "info_window_ability",
		horizontal_alignment = "left",
		size = {
			video_window_width - 20,
			100
		},
		position = {
			10,
			15,
			2
		}
	},
	button_root = {
		vertical_alignment = "bottom",
		parent = "dead_space_filler",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			3
		}
	},
	start_game_button = {
		vertical_alignment = "bottom",
		parent = "button_root",
		horizontal_alignment = "center",
		size = {
			300,
			70
		},
		position = {
			-170,
			40,
			0
		}
	},
	back_button = {
		vertical_alignment = "bottom",
		parent = "button_root",
		horizontal_alignment = "center",
		size = {
			300,
			70
		},
		position = {
			170,
			40,
			0
		}
	}
}
local attract_mode_video = {
	video_name = "video/vermintide_2_reveal",
	scenegraph_id = "splash_video",
	loop = false,
	material_name = "vermintide_2_reveal",
	sound_start = IS_XB1 and "Play_reveal_trailer" or "Play_vermintide_2_reveal",
	sound_stop = IS_XB1 and "Stop_reveal_trailer" or "Stop_vermintide_2_reveal"
}
local skill_title_style = {
	vertical_alignment = "bottom",
	font_size = 18,
	localize = false,
	horizontal_alignment = "left",
	word_wrap = true,
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local skill_description_style = {
	vertical_alignment = "top",
	font_size = 16,
	localize = false,
	horizontal_alignment = "left",
	word_wrap = true,
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local selection_description_style = {
	word_wrap = true,
	upper_case = true,
	localize = true,
	font_size = 58,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local press_start_style = {
	word_wrap = true,
	upper_case = true,
	localize = true,
	font_size = 58,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}
local player_career_name_style = {
	vertical_alignment = "bottom",
	upper_case = true,
	localize = true,
	horizontal_alignment = "left",
	font_size = 36,
	font_type = "hell_shark_header",
	text_color = Colors.get_table("font_title"),
	offset = {
		0,
		0,
		0
	}
}
local player_hero_name_style = {
	vertical_alignment = "top",
	horizontal_alignment = "left",
	localize = true,
	font_size = 24,
	font_type = "hell_shark",
	text_color = Colors.get_table("font_default"),
	offset = {
		0,
		0,
		0
	}
}

local function create_video(scenegraph_id, material_name)
	return {
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "background"
				},
				{
					style_id = "video_style",
					pass_type = "video",
					content_id = "video_content",
					content_check_function = function (content, style)
						if not content.parent.video_player then
							return false
						end

						local fade_range_in = 20
						local fade_range_out = 20
						local black_frames = 30
						local current_frame = VideoPlayer.current_frame(content.parent.video_player)
						local num_frames = VideoPlayer.number_of_frames(content.parent.video_player)

						if current_frame <= fade_range_in then
							style.color[1] = current_frame / fade_range_in * 255
						elseif current_frame >= num_frames - fade_range_out - black_frames then
							style.color[1] = math.clamp((num_frames - current_frame - black_frames) / fade_range_out, 0, 1) * 255
						else
							style.color[1] = 255
						end

						return true
					end
				}
			}
		},
		content = {
			video_content = {
				video_completed = false,
				material_name = material_name
			}
		},
		style = {
			video_style = {
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
			background = {
				color = {
					255,
					0,
					0,
					0
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_simple_pulsating_text(text, scenegraph_id, size, color, text_style, optional_font_style)
	return {
		element = {
			passes = {
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content, style)
						style.text_color[1] = 160 + math.sin(Managers.time:time("ui") * 5) * 95

						return true
					end
				}
			}
		},
		content = {
			text = text,
			color = text_style and text_style.text_color or color
		},
		style = {
			text = text_style or {
				vertical_alignment = "center",
				localize = true,
				horizontal_alignment = "center",
				word_wrap = true,
				font_size = size,
				font_type = optional_font_style or "hell_shark",
				text_color = color,
				offset = {
					0,
					0,
					2
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
	info_window_video = UIWidgets.create_frame("info_window_video", scenegraph_definition.info_window_video.size, "menu_frame_06"),
	info_passive_icon = UIWidgets.create_simple_texture("icons_placeholder", "info_passive_icon"),
	info_ability_icon = UIWidgets.create_simple_texture("icons_placeholder", "info_ability_icon"),
	info_passive_title = UIWidgets.create_simple_text("n/a", "info_passive_title", nil, nil, skill_title_style),
	info_ability_title = UIWidgets.create_simple_text("n/a", "info_ability_title", nil, nil, skill_title_style),
	info_passive_description = UIWidgets.create_simple_text("n/a", "info_passive_description", nil, nil, skill_description_style),
	info_ability_description = UIWidgets.create_simple_text("n/a", "info_ability_description", nil, nil, skill_description_style),
	info_window_passive_title = UIWidgets.create_title_widget("info_window_passive_title", scenegraph_definition.info_window_passive_title.size, "Passive Effect", false, true),
	info_window_ability_title = UIWidgets.create_title_widget("info_window_ability_title", scenegraph_definition.info_window_ability_title.size, "Active Ability", false, true),
	info_window = UIWidgets.create_simple_texture("divider_01_bg", "info_window", nil, nil, {
		255,
		0,
		0,
		0
	}),
	info_window_top = UIWidgets.create_simple_texture("divider_01_bottom", "info_window_bottom"),
	info_window_bottom = UIWidgets.create_simple_texture("divider_01_top", "info_window_top"),
	demo_bg_01 = UIWidgets.create_simple_texture("demo_bg_01", "info_window_ink"),
	demo_bg_02 = UIWidgets.create_simple_texture("demo_bg_02", "portrait_ink")
}
local career_widget_definitions = {
	player_career_name = UIWidgets.create_simple_text("n/a", "player_career_name", 22, nil, player_career_name_style),
	player_hero_name = UIWidgets.create_simple_text("n/a", "player_hero_name", 22, nil, player_hero_name_style),
	player_name_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "player_name_divider")
}

return {
	career_widget_definitions = career_widget_definitions,
	widget_definitions = widget_definitions,
	attract_mode_video = attract_mode_video,
	scenegraph_definition = scenegraph_definition,
	dead_space_filler_widget = UIWidgets.create_simple_rect("dead_space_filler", {
		255,
		0,
		0,
		0
	}),
	create_video_func = create_video,
	start_game_button_widget = UIWidgets.create_default_button("start_game_button", scenegraph_definition.start_game_button.size, nil, nil, Localize("start_game_menu_button_name")),
	back_button_widget = UIWidgets.create_default_button("back_button", scenegraph_definition.start_game_button.size, nil, nil, Localize("back_menu_button_name")),
	console_cursor_definition = UIWidgets.create_console_cursor("console_cursor"),
	press_start_widget = create_simple_pulsating_text(IS_WINDOWS and "press_any_key_to_continue" or "press_any_button_to_continue", "press_start", nil, nil, press_start_style)
}
