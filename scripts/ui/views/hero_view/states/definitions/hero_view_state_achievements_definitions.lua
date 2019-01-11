local create_quest_widget = local_require("scripts/ui/views/hero_view/states/definitions/quest_widget_definition")
local create_achievement_widget = local_require("scripts/ui/views/hero_view/states/definitions/achievement_widget_definition")
local window_default_settings = UISettings.game_start_windows
local small_window_frame = window_default_settings.frame
local small_window_size = window_default_settings.size
local small_window_spacing = window_default_settings.spacing
local window_size = window_default_settings.large_window_size
local window_top_height = 200
local side_window_height = window_size[2] - window_top_height + 22
local left_window_size = {
	math.floor((window_size[1] + 44) / 3),
	side_window_height
}
local right_window_size = {
	(window_size[1] + 22) - left_window_size[1],
	side_window_height
}
local achievement_entry_size = {
	900,
	156
}
local achievement_entry_expand_size = {
	800,
	100
}
local achievement_window_size = {
	right_window_size[1] - 22,
	right_window_size[2] - 104
}
local achievement_scrollbar_size = {
	16,
	right_window_size[2] - 44
}
local achievement_presentation_amount = 4
local achievement_spacing = 40
local checklist_entry_size = {
	achievement_entry_expand_size[2] / 2,
	30
}
local tab_size = {
	left_window_size[1] - 100,
	60
}
local tab_active_size = {
	tab_size[1] - small_window_spacing * 2,
	left_window_size[2] - tab_size[2] - tab_size[2]
}
local tab_list_entry_size = {
	tab_size[1] - small_window_spacing * 2,
	42
}
local tab_list_entry_spacing = 5
local category_tab_info = {
	tab_size = tab_size,
	tab_active_size = tab_active_size,
	tab_list_entry_size = tab_list_entry_size,
	tab_list_entry_spacing = tab_list_entry_spacing
}
local CATEGORY_LIST_LIMIT = 10
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
	screen = {
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
	console_cursor = {
		vertical_alignment = "center",
		parent = "screen",
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
	header = {
		vertical_alignment = "top",
		parent = "menu_root",
		horizontal_alignment = "center",
		size = {
			1920,
			50
		},
		position = {
			0,
			-20,
			100
		}
	},
	window = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1
		}
	},
	window_background = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1] - 5,
			window_size[2] - 5
		},
		position = {
			0,
			0,
			0
		}
	},
	claim_overlay_divider = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			314,
			33
		},
		position = {
			0,
			20,
			40
		}
	},
	window_top = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "left",
		size = {
			window_size[1],
			window_top_height
		},
		position = {
			0,
			0,
			1
		}
	},
	window_top_fade = {
		vertical_alignment = "center",
		parent = "window_top",
		horizontal_alignment = "center",
		size = {
			window_size[1] - 44,
			window_top_height - 44
		},
		position = {
			0,
			0,
			1
		}
	},
	left_window = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "left",
		size = left_window_size,
		position = {
			0,
			0,
			1
		}
	},
	left_window_fade = {
		vertical_alignment = "center",
		parent = "left_window",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 44,
			left_window_size[2] - 44
		},
		position = {
			0,
			0,
			1
		}
	},
	right_window = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "right",
		size = right_window_size,
		position = {
			0,
			0,
			1
		}
	},
	right_window_fade = {
		vertical_alignment = "center",
		parent = "right_window",
		horizontal_alignment = "center",
		size = {
			right_window_size[1] - 44,
			right_window_size[2] - 44
		},
		position = {
			0,
			0,
			1
		}
	},
	achievement_window = {
		vertical_alignment = "ceter",
		parent = "right_window",
		horizontal_alignment = "center",
		size = achievement_window_size,
		position = {
			0,
			0,
			1
		}
	},
	achievement_window_mask = {
		vertical_alignment = "ceter",
		parent = "achievement_window",
		horizontal_alignment = "center",
		size = {
			achievement_window_size[1],
			right_window_size[2] - 44
		},
		position = {
			0,
			0,
			0
		}
	},
	achievement_window_mask_top = {
		vertical_alignment = "top",
		parent = "achievement_window_mask",
		horizontal_alignment = "center",
		size = {
			achievement_window_size[1],
			30
		},
		position = {
			0,
			0,
			1
		}
	},
	achievement_window_mask_bottom = {
		vertical_alignment = "bottom",
		parent = "achievement_window_mask",
		horizontal_alignment = "center",
		size = {
			achievement_window_size[1],
			30
		},
		position = {
			0,
			0,
			1
		}
	},
	achievement_root = {
		vertical_alignment = "top",
		parent = "achievement_window",
		horizontal_alignment = "center",
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
	achievement_entry = {
		vertical_alignment = "top",
		parent = "achievement_root",
		horizontal_alignment = "center",
		size = achievement_entry_size,
		position = {
			0,
			0,
			3
		}
	},
	achievement_scrollbar = {
		vertical_alignment = "center",
		parent = "achievement_window",
		horizontal_alignment = "right",
		size = achievement_scrollbar_size,
		position = {
			-small_window_spacing,
			0,
			3
		}
	},
	quest_timer = {
		vertical_alignment = "bottom",
		parent = "achievement_window",
		horizontal_alignment = "center",
		size = {
			achievement_window_size[1] - 120,
			50
		},
		position = {
			0,
			-30,
			3
		}
	},
	exit_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			380,
			42
		},
		position = {
			0,
			-16,
			42
		}
	},
	quests_button = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			small_window_size[1] - 60,
			108
		},
		position = {
			-(small_window_size[1] + 30),
			-46,
			10
		}
	},
	summary_button = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			small_window_size[1] - 160,
			70
		},
		position = {
			0,
			-65,
			10
		}
	},
	achievements_button = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			small_window_size[1] - 60,
			108
		},
		position = {
			small_window_size[1] + 30,
			-46,
			10
		}
	},
	title = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			658,
			60
		},
		position = {
			0,
			34,
			46
		}
	},
	title_bg = {
		vertical_alignment = "top",
		parent = "title",
		horizontal_alignment = "center",
		size = {
			410,
			40
		},
		position = {
			0,
			-15,
			-1
		}
	},
	title_text = {
		vertical_alignment = "center",
		parent = "title",
		horizontal_alignment = "center",
		size = {
			350,
			50
		},
		position = {
			0,
			-3,
			2
		}
	},
	summary_center_window = {
		vertical_alignment = "center",
		parent = "left_window",
		horizontal_alignment = "left",
		size = {
			left_window_size[1] + 2,
			left_window_size[2]
		},
		position = {
			left_window_size[1] - 22,
			0,
			1
		}
	},
	summary_center_window_fade = {
		vertical_alignment = "center",
		parent = "summary_center_window",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 40,
			left_window_size[2] - 44
		},
		position = {
			0,
			0,
			1
		}
	},
	summary_center_text = {
		vertical_alignment = "center",
		parent = "summary_center_window",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 140,
			left_window_size[2] - 100
		},
		position = {
			0,
			-40,
			3
		}
	},
	summary_right_window = {
		vertical_alignment = "bottom",
		parent = "right_window",
		horizontal_alignment = "right",
		size = left_window_size,
		position = {
			0,
			0,
			1
		}
	},
	summary_right_window_fade = {
		vertical_alignment = "center",
		parent = "summary_right_window",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 44,
			left_window_size[2] - 44
		},
		position = {
			0,
			0,
			1
		}
	},
	summary_right_arrow = {
		vertical_alignment = "top",
		parent = "summary_right_window",
		horizontal_alignment = "center",
		size = {
			59,
			31
		},
		position = {
			0,
			18,
			22
		}
	},
	summary_right_title_divider = {
		vertical_alignment = "center",
		parent = "summary_right_window",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			-20,
			3
		}
	},
	summary_right_title = {
		vertical_alignment = "top",
		parent = "summary_right_title_divider",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 44,
			20
		},
		position = {
			0,
			20,
			3
		}
	},
	summary_achievement_flag = {
		vertical_alignment = "top",
		parent = "summary_right_window_fade",
		horizontal_alignment = "center",
		size = {
			320,
			320
		},
		position = {
			0,
			0,
			1
		}
	},
	summary_achievement_bar_1 = {
		vertical_alignment = "center",
		parent = "summary_right_window",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 100,
			42
		},
		position = {
			0,
			-60,
			5
		}
	},
	summary_achievement_bar_2 = {
		vertical_alignment = "bottom",
		parent = "summary_achievement_bar_1",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 100,
			42
		},
		position = {
			0,
			-50,
			1
		}
	},
	summary_achievement_bar_3 = {
		vertical_alignment = "bottom",
		parent = "summary_achievement_bar_2",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 100,
			42
		},
		position = {
			0,
			-50,
			1
		}
	},
	summary_achievement_bar_4 = {
		vertical_alignment = "bottom",
		parent = "summary_achievement_bar_3",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 100,
			42
		},
		position = {
			0,
			-50,
			1
		}
	},
	summary_achievement_bar_5 = {
		vertical_alignment = "bottom",
		parent = "summary_achievement_bar_4",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 100,
			42
		},
		position = {
			0,
			-50,
			1
		}
	},
	summary_achievement_bar_6 = {
		vertical_alignment = "bottom",
		parent = "summary_achievement_bar_5",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 100,
			42
		},
		position = {
			0,
			-50,
			1
		}
	},
	summary_left_window = {
		vertical_alignment = "bottom",
		parent = "left_window",
		horizontal_alignment = "left",
		size = {
			left_window_size[1],
			left_window_size[2]
		},
		position = {
			0,
			0,
			0
		}
	},
	summary_left_window_fade = {
		vertical_alignment = "center",
		parent = "summary_left_window",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 42,
			left_window_size[2] - 44
		},
		position = {
			0,
			0,
			1
		}
	},
	summary_left_arrow = {
		vertical_alignment = "top",
		parent = "summary_left_window",
		horizontal_alignment = "center",
		size = {
			59,
			31
		},
		position = {
			0,
			18,
			22
		}
	},
	summary_left_title_divider = {
		vertical_alignment = "center",
		parent = "summary_left_window",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			-20,
			45
		}
	},
	summary_left_title = {
		vertical_alignment = "top",
		parent = "summary_left_title_divider",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 44,
			20
		},
		position = {
			0,
			20,
			3
		}
	},
	summary_quest_book = {
		vertical_alignment = "center",
		parent = "summary_left_window",
		horizontal_alignment = "center",
		size = {
			256,
			256
		},
		position = {
			0,
			170,
			40
		}
	},
	summary_quest_bar_background_1 = {
		vertical_alignment = "center",
		parent = "summary_left_window",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 40,
			60
		},
		position = {
			0,
			-100,
			5
		}
	},
	summary_quest_bar_background_2 = {
		vertical_alignment = "center",
		parent = "summary_quest_bar_background_1",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 40,
			60
		},
		position = {
			0,
			-100,
			5
		}
	},
	summary_quest_bar_background_3 = {
		vertical_alignment = "center",
		parent = "summary_quest_bar_background_2",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 40,
			60
		},
		position = {
			0,
			-100,
			5
		}
	},
	summary_quest_bar_1 = {
		vertical_alignment = "center",
		parent = "summary_quest_bar_background_1",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 100,
			16
		},
		position = {
			0,
			0,
			5
		}
	},
	summary_quest_bar_2 = {
		vertical_alignment = "center",
		parent = "summary_quest_bar_background_2",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 100,
			16
		},
		position = {
			0,
			0,
			1
		}
	},
	summary_quest_bar_3 = {
		vertical_alignment = "center",
		parent = "summary_quest_bar_background_3",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 100,
			16
		},
		position = {
			0,
			0,
			1
		}
	},
	summary_quest_bar_title_1 = {
		vertical_alignment = "bottom",
		parent = "summary_quest_bar_1",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 100,
			16
		},
		position = {
			0,
			40,
			5
		}
	},
	summary_quest_bar_title_2 = {
		vertical_alignment = "bottom",
		parent = "summary_quest_bar_2",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 100,
			16
		},
		position = {
			0,
			40,
			5
		}
	},
	summary_quest_bar_title_3 = {
		vertical_alignment = "bottom",
		parent = "summary_quest_bar_3",
		horizontal_alignment = "center",
		size = {
			left_window_size[1] - 100,
			16
		},
		position = {
			0,
			40,
			5
		}
	},
	summary_left_title_banner = {
		vertical_alignment = "bottom",
		parent = "summary_left_window",
		horizontal_alignment = "center",
		size = {
			438,
			54
		},
		position = {
			0,
			290,
			20
		}
	}
}
local quest_refresh_title_text = {
	font_size = 28,
	upper_case = false,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local quest_refresh_value_text = {
	font_size = 28,
	upper_case = false,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "right",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local quest_bar_title_text = {
	font_size = 24,
	upper_case = true,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "bottom",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local quest_bar_timer_text = {
	font_size = 24,
	upper_case = true,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "right",
	vertical_alignment = "bottom",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local no_entries_overlay_text_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 58,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		10
	}
}
local summary_quest_title_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 28,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local summary_text_style = {
	font_size = 26,
	upper_case = false,
	localize = false,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = {
		255,
		20,
		20,
		20
	},
	offset = {
		0,
		0,
		2
	}
}
local title_text_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
	font_size = 28,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local summary_title_text_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
	font_size = 28,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}

local function create_tab(scenegraph_id, size, text, list_scenegraph_id)
	local masked = false
	local background_texture = "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = UIFrameSettings.button_frame_01
	local frame_width = frame_settings.texture_sizes.corner[1]
	local side_detail_texture = "button_detail_02"
	local side_detail_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail_texture)
	local side_detail_texture_size = side_detail_texture_settings.size
	local small_side_detail_texture = "button_detail_03"
	local small_side_detail_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(small_side_detail_texture)
	local small_side_detail_texture_size = small_side_detail_texture_settings.size
	local list_content = {
		allow_multi_hover = true
	}
	local item_styles = {}

	for i = 1, CATEGORY_LIST_LIMIT, 1 do
		local spacing = tab_list_entry_spacing
		list_content[i] = {
			text = "n/a",
			glass = "button_glass_02",
			hover_glow = "button_state_default",
			new = false,
			background_fade = "button_bg_fade",
			new_texture = "list_item_tag_new",
			icon = "tooltip_marker",
			button_hotspot = {},
			side_detail = {
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				},
				texture_id = small_side_detail_texture
			},
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						1 - size[2] / background_texture_settings.size[2]
					},
					{
						size[1] / background_texture_settings.size[1],
						1
					}
				},
				texture_id = background_texture
			}
		}
		item_styles[i] = {
			list_member_offset = {
				0,
				-(tab_list_entry_size[2] + spacing),
				0
			},
			size = {
				tab_list_entry_size[1],
				tab_list_entry_size[2]
			},
			text = {
				vertical_alignment = "center",
				upper_case = true,
				font_size = 22,
				horizontal_alignment = "left",
				word_wrap = true,
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					40,
					0,
					14
				}
			},
			text_hover = {
				vertical_alignment = "center",
				upper_case = true,
				font_size = 22,
				horizontal_alignment = "left",
				word_wrap = true,
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					40,
					0,
					14
				}
			},
			text_selected = {
				vertical_alignment = "center",
				upper_case = true,
				font_size = 22,
				horizontal_alignment = "left",
				word_wrap = true,
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					40,
					0,
					14
				}
			},
			text_shadow = {
				vertical_alignment = "center",
				upper_case = true,
				font_size = 22,
				horizontal_alignment = "left",
				word_wrap = true,
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					42,
					-2,
					13
				}
			},
			rect = {
				size = {
					tab_list_entry_size[1],
					tab_list_entry_size[2]
				},
				color = {
					100,
					100,
					0,
					0
				},
				offset = {
					0,
					0,
					0
				}
			},
			icon = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				texture_size = {
					13,
					13
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					20,
					0,
					10
				}
			},
			side_detail_left = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-9,
					tab_list_entry_size[2] / 2 - small_side_detail_texture_size[2] / 2,
					9
				},
				size = small_side_detail_texture_size
			},
			side_detail_right = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					tab_list_entry_size[1] - small_side_detail_texture_size[1] + 9,
					tab_list_entry_size[2] / 2 - small_side_detail_texture_size[2] / 2,
					9
				},
				size = small_side_detail_texture_size
			},
			frame = {
				size = tab_list_entry_size,
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
					8
				}
			},
			background = {
				size = tab_list_entry_size,
				color = {
					255,
					150,
					150,
					150
				},
				offset = {
					0,
					0,
					0
				}
			},
			background_fade = {
				color = {
					200,
					255,
					255,
					255
				},
				offset = {
					frame_width,
					frame_width - 2,
					2
				},
				size = {
					tab_list_entry_size[1] - frame_width * 2,
					tab_list_entry_size[2] - frame_width * 2
				}
			},
			hover_glow = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					frame_width - 2,
					3
				},
				size = {
					tab_list_entry_size[1],
					math.min(tab_list_entry_size[2] - 5, 80)
				}
			},
			clicked_rect = {
				size = tab_list_entry_size,
				color = {
					0,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					7
				}
			},
			disabled_rect = {
				size = tab_list_entry_size,
				color = {
					150,
					20,
					20,
					20
				},
				offset = {
					0,
					0,
					1
				}
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					tab_list_entry_size[2] - (frame_width + 11),
					4
				},
				size = {
					tab_list_entry_size[1],
					11
				}
			},
			glass_bottom = {
				color = {
					100,
					255,
					255,
					255
				},
				offset = {
					0,
					frame_width - 9,
					4
				},
				size = {
					tab_list_entry_size[1],
					11
				}
			},
			new_texture = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					tab_list_entry_size[1] - 63,
					tab_list_entry_size[2] / 2 - 12,
					12
				},
				size = {
					63,
					25
				}
			}
		}
	end

	return {
		element = {
			passes = {
				{
					style_id = "hotspot",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					texture_id = "background_fade",
					style_id = "background_fade",
					pass_type = "texture"
				},
				{
					texture_id = "hover_glow",
					style_id = "hover_glow",
					pass_type = "texture"
				},
				{
					pass_type = "rect",
					style_id = "clicked_rect"
				},
				{
					style_id = "disabled_rect",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "side_detail_right",
					pass_type = "texture_uv",
					content_id = "side_detail"
				},
				{
					texture_id = "texture_id",
					style_id = "side_detail_left",
					pass_type = "texture",
					content_id = "side_detail"
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text_disabled",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					texture_id = "glass",
					style_id = "glass_top",
					pass_type = "texture"
				},
				{
					texture_id = "glass",
					style_id = "glass_bottom",
					pass_type = "texture"
				},
				{
					texture_id = "new_texture",
					style_id = "new_texture",
					pass_type = "texture",
					content_check_function = function (content)
						return content.new
					end
				},
				{
					texture_id = "locked",
					style_id = "locked",
					pass_type = "texture",
					content_check_function = function (content)
						return content.button_hotspot.disable_button
					end
				},
				{
					style_id = "list_style",
					pass_type = "list_pass",
					content_id = "list_content",
					content_check_function = function (content)
						return content.active
					end,
					passes = {
						{
							style_id = "text",
							pass_type = "text",
							text_id = "text",
							content_check_function = function (content)
								local button_hotspot = content.button_hotspot

								return not button_hotspot.is_hover and not button_hotspot.is_selected
							end
						},
						{
							style_id = "text_hover",
							pass_type = "text",
							text_id = "text",
							content_check_function = function (content)
								local button_hotspot = content.button_hotspot

								return button_hotspot.is_hover and not button_hotspot.is_selected
							end
						},
						{
							style_id = "text_selected",
							pass_type = "text",
							text_id = "text",
							content_check_function = function (content)
								return content.button_hotspot.is_selected
							end
						},
						{
							style_id = "text_shadow",
							pass_type = "text",
							text_id = "text"
						},
						{
							pass_type = "texture",
							style_id = "icon",
							texture_id = "icon"
						},
						{
							pass_type = "hotspot",
							content_id = "button_hotspot"
						},
						{
							style_id = "side_detail_right",
							pass_type = "texture_uv",
							content_id = "side_detail"
						},
						{
							texture_id = "texture_id",
							style_id = "side_detail_left",
							pass_type = "texture",
							content_id = "side_detail"
						},
						{
							texture_id = "frame",
							style_id = "frame",
							pass_type = "texture_frame"
						},
						{
							style_id = "background",
							pass_type = "texture_uv",
							content_id = "background"
						},
						{
							texture_id = "background_fade",
							style_id = "background_fade",
							pass_type = "texture"
						},
						{
							texture_id = "hover_glow",
							style_id = "hover_glow",
							pass_type = "texture",
							content_check_function = function (content)
								local button_hotspot = content.button_hotspot

								return button_hotspot.is_hover or button_hotspot.is_selected
							end
						},
						{
							pass_type = "rect",
							style_id = "clicked_rect"
						},
						{
							style_id = "disabled_rect",
							pass_type = "rect",
							content_check_function = function (content)
								local button_hotspot = content.button_hotspot

								return button_hotspot.disable_button
							end
						},
						{
							texture_id = "glass",
							style_id = "glass_top",
							pass_type = "texture"
						},
						{
							texture_id = "glass",
							style_id = "glass_bottom",
							pass_type = "texture"
						},
						{
							texture_id = "glass",
							style_id = "glass_bottom",
							pass_type = "texture"
						},
						{
							texture_id = "new_texture",
							style_id = "new_texture",
							pass_type = "texture",
							content_check_function = function (content)
								return content.new
							end
						}
					}
				}
			}
		},
		content = {
			locked = "achievement_symbol_lock",
			hover_glow = "button_state_default",
			background_fade = "button_bg_fade",
			new = false,
			glass = "button_glass_02",
			new_texture = "list_item_tag_new",
			list_content = list_content,
			side_detail = {
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				},
				texture_id = side_detail_texture
			},
			button_hotspot = {},
			title_text = text or "n/a",
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						1 - size[2] / background_texture_settings.size[2]
					},
					{
						size[1] / background_texture_settings.size[1],
						1
					}
				},
				texture_id = background_texture
			}
		},
		style = {
			list_style = {
				vertical_alignment = "top",
				num_draws = 0,
				start_index = 1,
				horizontal_alignment = "center",
				list_member_offset = {
					0,
					tab_list_entry_size[2],
					0
				},
				size = {
					tab_list_entry_size[1],
					tab_list_entry_size[2]
				},
				scenegraph_id = list_scenegraph_id,
				item_styles = item_styles
			},
			hotspot = {
				size = {
					size[1],
					size[2]
				},
				offset = {
					0,
					0,
					0
				}
			},
			background = {
				color = {
					255,
					150,
					150,
					150
				},
				offset = {
					0,
					0,
					0
				}
			},
			background_fade = {
				color = {
					200,
					255,
					255,
					255
				},
				offset = {
					frame_width,
					frame_width - 2,
					2
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2
				}
			},
			hover_glow = {
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					frame_width - 2,
					3
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80)
				}
			},
			clicked_rect = {
				color = {
					0,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					7
				}
			},
			disabled_rect = {
				color = {
					150,
					20,
					20,
					20
				},
				offset = {
					0,
					0,
					1
				}
			},
			title_text = {
				upper_case = true,
				word_wrap = true,
				font_size = 24,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					30,
					0,
					6
				}
			},
			title_text_disabled = {
				upper_case = true,
				font_size = 24,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					30,
					0,
					6
				}
			},
			title_text_shadow = {
				upper_case = true,
				font_size = 24,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					32,
					-2,
					5
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
					8
				}
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - (frame_width + 11),
					4
				},
				size = {
					size[1],
					11
				}
			},
			glass_bottom = {
				color = {
					100,
					255,
					255,
					255
				},
				offset = {
					0,
					frame_width - 9,
					4
				},
				size = {
					size[1],
					11
				}
			},
			side_detail_left = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-9,
					size[2] / 2 - side_detail_texture_size[2] / 2,
					9
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2]
				}
			},
			side_detail_right = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - side_detail_texture_size[1] + 9,
					size[2] / 2 - side_detail_texture_size[2] / 2,
					9
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2]
				}
			},
			new_texture = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - 126,
					size[2] / 2 - 25,
					10
				},
				size = {
					126,
					51
				}
			},
			locked = {
				color = {
					255,
					100,
					100,
					100
				},
				offset = {
					size[1] - 64,
					size[2] / 2 - 20,
					10
				},
				size = {
					56,
					40
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}
end

local function create_window_divider(scenegraph_id, size, layer)
	local widget = {
		element = {
			passes = {
				{
					texture_id = "bottom_edge",
					style_id = "bottom_edge",
					pass_type = "tiled_texture"
				},
				{
					texture_id = "edge_holder_left",
					style_id = "edge_holder_left",
					pass_type = "texture"
				},
				{
					texture_id = "edge_holder_right",
					style_id = "edge_holder_right",
					pass_type = "texture"
				}
			}
		},
		content = {
			edge_holder_right = "menu_frame_09_divider_right",
			edge_holder_left = "menu_frame_09_divider_left",
			bottom_edge = "menu_frame_09_divider"
		},
		style = {
			bottom_edge = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					5,
					0,
					(layer or 0) + 6
				},
				size = {
					size[1] - 10,
					5
				},
				texture_tiling_size = {
					size[1] - 10,
					5
				}
			},
			edge_holder_left = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					3,
					-6,
					(layer or 0) + 10
				},
				size = {
					9,
					17
				}
			},
			edge_holder_right = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - 12,
					-6,
					(layer or 0) + 10
				},
				size = {
					9,
					17
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return widget
end

local function create_window_button(scenegraph_id, background_texture)
	local frame_settings = UIFrameSettings.frame_inner_glow_01

	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					pass_type = "texture_frame",
					style_id = "hover_frame",
					texture_id = "hover_frame"
				},
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					pass_type = "texture",
					style_id = "fade",
					texture_id = "fade"
				}
			}
		},
		content = {
			fade = "options_window_fade_01",
			background = {
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				},
				texture_id = background_texture
			},
			hover_frame = frame_settings.texture,
			button_hotspot = {
				allow_multi_hover = true
			}
		},
		style = {
			fade = {
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
			background = {
				color = {
					255,
					100,
					100,
					100
				}
			},
			hover_frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					3
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_quest_book(scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "book",
					texture_id = "book"
				},
				{
					pass_type = "texture",
					style_id = "edge_glow_1",
					texture_id = "edge_glow_1",
					content_check_function = function (content)
						return not content.disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "edge_glow_2",
					texture_id = "edge_glow_2",
					content_check_function = function (content)
						return not content.disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "top_glow_1",
					texture_id = "top_glow_1",
					content_check_function = function (content)
						return not content.disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "top_glow_2",
					texture_id = "top_glow_2",
					content_check_function = function (content)
						return not content.disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "ribbon_1",
					texture_id = "ribbon_1"
				},
				{
					pass_type = "texture",
					style_id = "ribbon_2",
					texture_id = "ribbon_2"
				}
			}
		},
		content = {
			ribbon_1 = "achievement_book_ribbon_01",
			edge_glow_2 = "achievement_book_glow_02",
			top_glow_2 = "achievement_book_glow_03",
			disabled = false,
			book = "achievement_book_base",
			top_glow_1 = "achievement_book_glow_04",
			ribbon_2 = "achievement_book_ribbon_02",
			edge_glow_1 = "achievement_book_glow_01"
		},
		style = {
			book = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					2
				}
			},
			ribbon_1 = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				texture_size = {
					32,
					128
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-40,
					-78,
					4
				}
			},
			ribbon_2 = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				texture_size = {
					32,
					128
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					35,
					-78,
					4
				}
			},
			edge_glow_1 = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				texture_size = {
					256,
					512
				},
				color = {
					255,
					238,
					122,
					20
				},
				offset = {
					7,
					32,
					0
				}
			},
			edge_glow_2 = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					256,
					256
				},
				color = {
					255,
					238,
					122,
					20
				},
				offset = {
					7,
					0,
					3
				}
			},
			top_glow_1 = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					256,
					256
				},
				color = {
					255,
					238,
					122,
					20
				},
				offset = {
					0,
					0,
					4
				}
			},
			top_glow_2 = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					64,
					64
				},
				color = {
					255,
					240,
					255,
					143
				},
				offset = {
					6,
					-3,
					5
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}
end

local disable_with_gamepad = true
local widgets = {
	window = UIWidgets.create_frame("window", scenegraph_definition.window.size, "menu_frame_11", 40),
	window_background = UIWidgets.create_tiled_texture("window_background", "menu_frame_bg_01", {
		960,
		1080
	}, nil, nil, {
		255,
		100,
		100,
		100
	}),
	window_top_fade = UIWidgets.create_simple_texture("options_window_fade_01", "window_top_fade"),
	window_top = UIWidgets.create_tiled_texture("window_top", "achievement_plank", {
		307,
		200
	}, nil, nil, {
		255,
		255,
		255,
		255
	}),
	left_window_frame = UIWidgets.create_frame("left_window", scenegraph_definition.left_window.size, "menu_frame_11", 20),
	right_window_frame = UIWidgets.create_frame("right_window", scenegraph_definition.right_window.size, "menu_frame_11", 20),
	right_window_fade = UIWidgets.create_simple_texture("options_window_fade_01", "right_window_fade"),
	right_window = UIWidgets.create_tiled_texture("right_window", "achievement_background_leather", {
		256,
		256
	}, nil, nil, {
		255,
		180,
		180,
		180
	}),
	right_window_mask = UIWidgets.create_simple_texture("mask_rect", "achievement_window"),
	achievement_window_mask_bottom = UIWidgets.create_simple_rotated_texture("mask_rect_edge_fade", math.pi, {
		achievement_window_size[1] / 2,
		15
	}, "achievement_window_mask_bottom"),
	achievement_window_mask_top = UIWidgets.create_simple_texture("mask_rect_edge_fade", "achievement_window_mask_top"),
	exit_button = UIWidgets.create_default_button("exit_button", scenegraph_definition.exit_button.size, nil, nil, Localize("menu_close"), 24, nil, "button_detail_04", 34, disable_with_gamepad),
	summary_button = UIWidgets.create_default_button("summary_button", scenegraph_definition.summary_button.size, nil, nil, Localize("achv_menu_summary_category_title"), 24),
	quests_button = UIWidgets.create_window_category_button("quests_button", scenegraph_definition.quests_button.size, Localize("achv_menu_quests_category_title"), "achievement_button_icon_quests", "achievement_button_background_quests", true),
	achievements_button = UIWidgets.create_window_category_button_mirrored("achievements_button", scenegraph_definition.achievements_button.size, Localize("achv_menu_achievements_category_title"), "achievement_button_icon_achievements", "achievement_button_background_achievements", true),
	title = UIWidgets.create_simple_texture("frame_title_bg", "title"),
	title_bg = UIWidgets.create_background("title_bg", scenegraph_definition.title_bg.size, "menu_frame_bg_02"),
	title_text = UIWidgets.create_simple_text(Localize("achv_menu_title"), "title_text", nil, nil, title_text_style),
	achievement_scrollbar = UIWidgets.create_chain_scrollbar("achievement_scrollbar", scenegraph_definition.achievement_scrollbar.size),
	achievement_window = {
		scenegraph_id = "achievement_window_mask",
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "hotspot"
				},
				{
					pass_type = "scroll",
					scroll_function = function (ui_scenegraph, ui_style, ui_content, input_service, scroll_axis, dt)
						local axis_input = scroll_axis.y * -1

						if PLATFORM == "xb1" and GameSettingsDevelopment.allow_keyboard_mouse and not Managers.input:is_device_active("gamepad") then
							axis_input = math.sign(scroll_axis.x) * -1
						end

						local hotspot = ui_content.hotspot

						if axis_input ~= 0 and hotspot.is_hover then
							ui_content.axis_input = axis_input
							ui_content.scroll_add = axis_input * ui_content.scroll_amount
						else
							axis_input = ui_content.axis_input
						end

						local scroll_add = ui_content.scroll_add

						if scroll_add then
							local step = scroll_add * dt * 5
							scroll_add = scroll_add - step

							if math.abs(scroll_add) > 0 then
								ui_content.scroll_add = scroll_add
							else
								ui_content.scroll_add = nil
							end

							local current_scroll_value = ui_content.scroll_value
							ui_content.scroll_value = math.clamp(current_scroll_value + step, 0, 1)
						end
					end
				}
			}
		},
		content = {
			scroll_amount = 0.1,
			scroll_value = 1,
			hotspot = {
				allow_multi_hover = true
			}
		},
		style = {}
	}
}
local quest_widgets = {
	left_window = UIWidgets.create_simple_uv_texture("achievement_quests_bg", {
		{
			0,
			0
		},
		{
			1,
			1
		}
	}, "summary_left_window_fade", nil, nil, {
		255,
		100,
		100,
		100
	}),
	left_window_fade = UIWidgets.create_simple_texture("options_window_fade_01", "summary_left_window_fade", nil, nil, nil, 1),
	time_left_text = UIWidgets.create_simple_text(Localize("achv_menu_summary_quest_refresh") .. " 00:00:00", "quest_timer", nil, nil, quest_refresh_title_text),
	overlay = UIWidgets.create_simple_rect("achievement_window_mask", {
		220,
		12,
		12,
		12
	}, 4),
	overlay_fade = UIWidgets.create_simple_texture("options_window_fade_01", "achievement_window_mask", nil, nil, nil, 5),
	overlay_text = UIWidgets.create_simple_text(Localize("achv_menu_no_quests_text"), "achievement_window_mask", nil, nil, no_entries_overlay_text_style)
}
local achievement_widgets = {
	left_window = UIWidgets.create_simple_uv_texture("achievement_challenges_bg", {
		{
			0,
			0
		},
		{
			1,
			1
		}
	}, "summary_left_window_fade", nil, nil, {
		255,
		100,
		100,
		100
	}),
	left_window_fade = UIWidgets.create_simple_texture("options_window_fade_01", "summary_left_window_fade", nil, nil, nil, 1),
	overlay = UIWidgets.create_simple_rect("achievement_window_mask", {
		220,
		12,
		12,
		12
	}, 4),
	overlay_fade = UIWidgets.create_simple_texture("options_window_fade_01", "achievement_window_mask", nil, nil, nil, 5),
	overlay_text = UIWidgets.create_simple_text(Localize("achv_menu_no_quests_text"), "achievement_window_mask", nil, nil, no_entries_overlay_text_style)
}
local overlay_widgets = {
	claim_overlay = UIWidgets.create_simple_rect("window", {
		220,
		12,
		12,
		12
	}, 36),
	claim_overlay_fade = UIWidgets.create_simple_texture("options_window_fade_01", "window", nil, nil, nil, 37),
	claim_overlay_loading_glow = UIWidgets.create_simple_texture("loading_title_divider", "claim_overlay_divider", nil, nil, nil, 1),
	claim_overlay_loading_frame = UIWidgets.create_simple_texture("loading_title_divider_background", "claim_overlay_divider")
}
local summary_widgets = {
	summary_center_window = UIWidgets.create_simple_texture("achievement_summary_bg", "summary_center_window_fade"),
	summary_center_window_frame = UIWidgets.create_frame("summary_center_window", scenegraph_definition.summary_center_window.size, "menu_frame_11", 30),
	summary_center_text = UIWidgets.create_simple_text(Localize("achv_menu_summary_description_text"), "summary_center_text", nil, nil, summary_text_style),
	summary_right_window_frame = UIWidgets.create_frame("summary_right_window", scenegraph_definition.summary_right_window.size, "menu_frame_11", 20),
	summary_right_window_button = create_window_button("summary_right_window_fade", "achievement_challenges_bg"),
	summary_right_arrow = UIWidgets.create_simple_texture("achievement_arrow_hover", "summary_right_arrow"),
	summary_right_title = UIWidgets.create_simple_text(Localize("achv_menu_summary_overview_title"), "summary_right_title", nil, nil, summary_title_text_style),
	summary_right_title_divider = UIWidgets.create_simple_texture("divider_01_top", "summary_right_title_divider"),
	summary_achievement_bar_1 = UIWidgets.create_statistics_bar("summary_achievement_bar_1", scenegraph_definition.summary_achievement_bar_1.size),
	summary_achievement_bar_2 = UIWidgets.create_statistics_bar("summary_achievement_bar_2", scenegraph_definition.summary_achievement_bar_2.size),
	summary_achievement_bar_3 = UIWidgets.create_statistics_bar("summary_achievement_bar_3", scenegraph_definition.summary_achievement_bar_3.size),
	summary_achievement_bar_4 = UIWidgets.create_statistics_bar("summary_achievement_bar_4", scenegraph_definition.summary_achievement_bar_4.size),
	summary_achievement_bar_5 = UIWidgets.create_statistics_bar("summary_achievement_bar_5", scenegraph_definition.summary_achievement_bar_5.size),
	summary_achievement_bar_6 = UIWidgets.create_statistics_bar("summary_achievement_bar_6", scenegraph_definition.summary_achievement_bar_6.size),
	summary_quest_bar_background_1 = UIWidgets.create_simple_texture("tab_menu_bg_02", "summary_quest_bar_background_1"),
	summary_quest_bar_background_2 = UIWidgets.create_simple_texture("tab_menu_bg_02", "summary_quest_bar_background_2"),
	summary_quest_bar_background_3 = UIWidgets.create_simple_texture("tab_menu_bg_02", "summary_quest_bar_background_3"),
	summary_quest_bar_1 = UIWidgets.create_quest_bar("summary_quest_bar_1", scenegraph_definition.summary_quest_bar_1.size),
	summary_quest_bar_2 = UIWidgets.create_quest_bar("summary_quest_bar_2", scenegraph_definition.summary_quest_bar_2.size),
	summary_quest_bar_3 = UIWidgets.create_quest_bar("summary_quest_bar_3", scenegraph_definition.summary_quest_bar_3.size),
	summary_quest_bar_title_1 = UIWidgets.create_simple_text(Localize("achv_menu_daily_category_title"), "summary_quest_bar_title_1", nil, nil, quest_bar_title_text),
	summary_quest_bar_title_2 = UIWidgets.create_simple_text(Localize("achv_menu_weekly_category_title"), "summary_quest_bar_title_2", nil, nil, quest_bar_title_text),
	summary_quest_bar_title_3 = UIWidgets.create_simple_text(Localize("achv_menu_event_category_title"), "summary_quest_bar_title_3", nil, nil, quest_bar_title_text),
	summary_quest_bar_timer_1 = UIWidgets.create_simple_text("", "summary_quest_bar_title_1", nil, nil, quest_bar_timer_text),
	summary_quest_bar_timer_2 = UIWidgets.create_simple_text("", "summary_quest_bar_title_2", nil, nil, quest_bar_timer_text),
	summary_quest_bar_timer_3 = UIWidgets.create_simple_text("", "summary_quest_bar_title_3", nil, nil, quest_bar_timer_text),
	summary_left_window_frame = UIWidgets.create_frame("summary_left_window", scenegraph_definition.summary_left_window.size, "menu_frame_11", 20),
	summary_left_window_button = create_window_button("summary_left_window_fade", "achievement_quests_bg"),
	summary_left_arrow = UIWidgets.create_simple_texture("achievement_arrow_hover", "summary_left_arrow"),
	summary_left_title = UIWidgets.create_simple_text(Localize("achv_menu_summary_quests_available"), "summary_left_title", nil, nil, summary_title_text_style),
	summary_left_title_divider = UIWidgets.create_simple_texture("divider_01_top", "summary_left_title_divider"),
	summary_quest_book = create_quest_book("summary_quest_book"),
	summary_achievement_flag = UIWidgets.create_simple_texture("achievement_menu_flag", "summary_achievement_flag")
}
local category_tab_widgets = {}

for i = 1, 8, 1 do
	local first_entry = i == 1
	local scenegraph_id = "category_tab_" .. i
	local scenegraph_list_id = "category_tab_" .. i .. "_list"
	local previous_scenegraph_id = "category_tab_" .. i - 1
	local previous_scenegraph_list_id = "category_tab_" .. i - 1 .. "_list"
	scenegraph_definition[scenegraph_id] = {
		horizontal_alignment = "center",
		parent = (first_entry and "left_window") or previous_scenegraph_list_id,
		vertical_alignment = (first_entry and "top") or "bottom",
		size = tab_size,
		position = {
			0,
			(first_entry and -40) or -(tab_size[2] + tab_list_entry_spacing),
			3
		}
	}
	scenegraph_definition[scenegraph_list_id] = {
		vertical_alignment = "top",
		horizontal_alignment = "center",
		parent = scenegraph_id,
		size = {
			tab_size[1],
			0
		},
		position = {
			0,
			-(tab_size[2] + tab_list_entry_spacing),
			0
		}
	}
	category_tab_widgets[i] = create_tab(scenegraph_id, tab_size, "n/a", scenegraph_list_id)
end

local quest_entry_definition = create_quest_widget("achievement_entry", achievement_entry_size)
local achievement_entry_definition = create_achievement_widget("achievement_entry", achievement_entry_size)
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
				params.render_settings.alpha_multiplier = 1
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
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = 1
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}
local generic_input_actions = {
	{
		input_action = "confirm",
		priority = 2,
		description_text = "input_description_select"
	},
	{
		input_action = "back",
		priority = 3,
		description_text = "input_description_close"
	}
}

return {
	generic_input_actions = generic_input_actions,
	quest_widgets = quest_widgets,
	achievement_widgets = achievement_widgets,
	category_tab_info = category_tab_info,
	achievement_spacing = achievement_spacing,
	checklist_entry_size = checklist_entry_size,
	achievement_entry_size = achievement_entry_size,
	achievement_window_size = achievement_window_size,
	achievement_scrollbar_size = achievement_scrollbar_size,
	achievement_presentation_amount = achievement_presentation_amount,
	widgets = widgets,
	overlay_widgets = overlay_widgets,
	summary_widgets = summary_widgets,
	category_tab_widgets = category_tab_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	quest_entry_definition = quest_entry_definition,
	achievement_entry_definition = achievement_entry_definition,
	console_cursor_definition = UIWidgets.create_console_cursor("console_cursor")
}
