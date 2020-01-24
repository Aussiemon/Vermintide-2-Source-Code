local window_default_settings = UISettings.game_start_windows
local small_window_size = window_default_settings.size
local small_window_spacing = window_default_settings.spacing
local window_frame_name = "menu_frame_11"
local window_frame = UIFrameSettings[window_frame_name]
local window_frame_width = window_frame.texture_sizes.vertical[1]
local large_window_frame = window_default_settings.large_window_frame
local large_window_frame_width = UIFrameSettings[large_window_frame].texture_sizes.vertical[1]
local inner_window_size = {
	small_window_size[1] * 3 + small_window_spacing * 2 + large_window_frame_width * 2,
	small_window_size[2] + 80
}
local window_size = {
	inner_window_size[1] + 50,
	inner_window_size[2]
}
local option_tabs_height = 40
local list_fade_height = 10
local list_window_size = {
	window_size[1] - window_frame_width * 2,
	window_size[2] - window_frame_width * 2
}
local list_mask_size = {
	list_window_size[1] - 100,
	list_window_size[2] - 280
}
local list_scrollbar_size = {
	16,
	list_mask_size[2]
}
local list_entry_size = {
	list_mask_size[1] - 80,
	48
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
			0
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
	window_background_mask = {
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
			1
		}
	},
	inner_window = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = inner_window_size,
		position = {
			0,
			0,
			1
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
			10
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
	list_window = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "left",
		size = list_window_size,
		position = {
			window_frame_width,
			0,
			1
		}
	},
	list_mask = {
		vertical_alignment = "bottom",
		parent = "list_window",
		horizontal_alignment = "center",
		size = list_mask_size,
		position = {
			0,
			80,
			3
		}
	},
	list_scrollbar = {
		vertical_alignment = "bottom",
		parent = "list_mask",
		horizontal_alignment = "right",
		size = list_scrollbar_size,
		position = {
			-16,
			0,
			10
		}
	},
	list_scroll_root = {
		vertical_alignment = "top",
		parent = "list_mask",
		horizontal_alignment = "left",
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
	list_entry = {
		vertical_alignment = "top",
		parent = "list_scroll_root",
		horizontal_alignment = "left",
		size = list_entry_size,
		position = {
			25,
			0,
			0
		}
	},
	setting_stepper_1 = {
		vertical_alignment = "top",
		parent = "list_window",
		horizontal_alignment = "center",
		size = {
			list_window_size[1] / 3,
			85
		},
		position = {
			list_window_size[1] / 5,
			-(option_tabs_height + 13),
			4
		}
	},
	setting_stepper_2 = {
		vertical_alignment = "top",
		parent = "list_window",
		horizontal_alignment = "center",
		size = {
			list_window_size[1] / 3,
			85
		},
		position = {
			-list_window_size[1] / 5,
			-(option_tabs_height + 13),
			4
		}
	},
	loading_icon = {
		vertical_alignment = "center",
		parent = "list_mask",
		horizontal_alignment = "center",
		size = {
			150,
			150
		},
		position = {
			0,
			0,
			19
		}
	},
	list_title_rank = {
		vertical_alignment = "top",
		parent = "list_mask",
		horizontal_alignment = "left",
		size = {
			90,
			40
		},
		position = {
			112,
			45,
			1
		}
	},
	list_title_name = {
		vertical_alignment = "center",
		parent = "list_title_rank",
		horizontal_alignment = "right",
		size = {
			430,
			40
		},
		position = {
			748,
			0,
			0
		}
	},
	list_title_weave = {
		vertical_alignment = "center",
		parent = "list_title_name",
		horizontal_alignment = "right",
		size = {
			144,
			40
		},
		position = {
			306,
			0,
			0
		}
	},
	list_title_score = {
		vertical_alignment = "center",
		parent = "list_title_weave",
		horizontal_alignment = "right",
		size = {
			290,
			40
		},
		position = {
			261,
			0,
			0
		}
	},
	option_tabs = {
		vertical_alignment = "top",
		parent = "list_window",
		horizontal_alignment = "center",
		size = {
			list_window_size[1],
			option_tabs_height
		},
		position = {
			0,
			0,
			1
		}
	},
	option_tabs_segments = {
		vertical_alignment = "bottom",
		parent = "option_tabs",
		horizontal_alignment = "center",
		size = {
			list_window_size[1],
			0
		},
		position = {
			0,
			5,
			1
		}
	},
	option_tabs_segments_top = {
		vertical_alignment = "top",
		parent = "option_tabs",
		horizontal_alignment = "center",
		size = {
			list_window_size[1],
			0
		},
		position = {
			0,
			-7,
			10
		}
	},
	option_tabs_segments_bottom = {
		vertical_alignment = "bottom",
		parent = "option_tabs",
		horizontal_alignment = "center",
		size = {
			list_window_size[1],
			0
		},
		position = {
			0,
			3,
			10
		}
	},
	option_tabs_divider = {
		vertical_alignment = "bottom",
		parent = "option_tabs",
		horizontal_alignment = "center",
		size = {
			list_window_size[1] + 6,
			0
		},
		position = {
			0,
			0,
			1
		}
	},
	refresh_button = {
		vertical_alignment = "bottom",
		parent = "list_mask",
		horizontal_alignment = "left",
		size = {
			30,
			30
		},
		position = {
			0,
			-50,
			3
		}
	},
	refresh_text = {
		vertical_alignment = "center",
		parent = "refresh_button",
		horizontal_alignment = "left",
		size = {
			list_window_size[1] - 40,
			30
		},
		position = {
			40,
			0,
			1
		}
	},
	no_placement_text = {
		vertical_alignment = "center",
		parent = "inner_window",
		horizontal_alignment = "center",
		size = {
			1280,
			100
		},
		position = {
			8,
			0,
			10
		}
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
local list_title_text_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
	font_size = 20,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = {
		255,
		120,
		120,
		120
	},
	offset = {
		0,
		0,
		2
	}
}
local refresh_text_style = {
	use_shadow = true,
	upper_case = false,
	localize = false,
	font_size = 18,
	horizontal_alignment = "left",
	vertical_alignment = "bottom",
	dynamic_font_size = true,
	font_type = "hell_shark",
	text_color = {
		255,
		120,
		120,
		120
	},
	offset = {
		0,
		0,
		2
	}
}
local no_placement_text_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
	font_size = 52,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark",
	text_color = {
		255,
		120,
		120,
		120
	},
	offset = {
		0,
		0,
		2
	}
}

local function create_list_mask(scenegraph_id, size, fade_height)
	fade_height = fade_height or 20
	local element = {
		passes = {
			{
				pass_type = "hotspot",
				content_id = "hotspot"
			},
			{
				pass_type = "texture",
				style_id = "mask",
				texture_id = "mask_texture"
			},
			{
				pass_type = "texture",
				style_id = "mask_top",
				texture_id = "mask_edge"
			},
			{
				pass_type = "rotated_texture",
				style_id = "mask_bottom",
				texture_id = "mask_edge"
			}
		}
	}
	local content = {
		mask_texture = "mask_rect",
		mask_edge = "mask_rect_edge_fade",
		hotspot = {
			allow_multi_hover = true
		}
	}
	local style = {
		mask = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				size[1],
				size[2] - fade_height * 2
			},
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
		},
		mask_top = {
			vertical_alignment = "top",
			horizontal_alignment = "center",
			texture_size = {
				size[1],
				fade_height
			},
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
		},
		mask_bottom = {
			vertical_alignment = "bottom",
			horizontal_alignment = "center",
			texture_size = {
				size[1],
				fade_height
			},
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
			},
			angle = math.pi,
			pivot = {
				size[1] / 2,
				fade_height / 2
			}
		}
	}
	local widget = {
		element = element,
		content = content,
		style = style,
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}

	return widget
end

local function create_stepper(scenegraph_id, size)
	local arrow_icon_size = {
		17,
		27
	}
	local button_hotspot_size = {
		30,
		40
	}
	local left_button_offset = {
		0,
		0,
		0
	}
	local right_button_offset = {
		size[1] - button_hotspot_size[1],
		0,
		0
	}

	return {
		element = {
			passes = {
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					pass_type = "texture",
					style_id = "setting_background",
					texture_id = "setting_background"
				},
				{
					style_id = "setting_text",
					pass_type = "text",
					text_id = "setting_text"
				},
				{
					style_id = "setting_text_shadow",
					pass_type = "text",
					text_id = "setting_text"
				},
				{
					style_id = "button_hotspot_left",
					pass_type = "hotspot",
					content_id = "button_hotspot_left"
				},
				{
					texture_id = "texture_id",
					style_id = "left_arrow_icon",
					pass_type = "texture",
					content_id = "arrow_icon"
				},
				{
					style_id = "button_hotspot_right",
					pass_type = "hotspot",
					content_id = "button_hotspot_right"
				},
				{
					texture_id = "texture_id",
					style_id = "right_arrow_icon",
					pass_type = "texture_uv",
					content_id = "arrow_icon"
				}
			}
		},
		content = {
			title_text = "title_text",
			setting_background = "menu_subheader_bg",
			setting_text = "setting_text",
			arrow_icon = {
				texture_id = "settings_arrow_normal",
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				}
			},
			button_hotspot_left = {},
			button_hotspot_right = {}
		},
		style = {
			setting_background = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				texture_size = {
					400,
					59
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					-10,
					0
				}
			},
			title_text = {
				word_wrap = true,
				upper_case = true,
				font_size = 20,
				pixel_perfect = true,
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				dynamic_font = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					0,
					size[2] - 50,
					4
				},
				size = {
					size[1],
					59
				}
			},
			title_text_shadow = {
				word_wrap = true,
				upper_case = true,
				font_size = 20,
				pixel_perfect = true,
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				dynamic_font = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					size[2] - 50 - 2,
					3
				},
				size = {
					size[1],
					59
				}
			},
			setting_text = {
				word_wrap = true,
				font_size = 20,
				pixel_perfect = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font = true,
				dynamic_font_size = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					button_hotspot_size[1] + 10,
					0,
					4
				},
				size = {
					size[1] - (button_hotspot_size[1] * 2 + 20),
					button_hotspot_size[2]
				}
			},
			setting_text_shadow = {
				word_wrap = true,
				font_size = 20,
				pixel_perfect = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font = true,
				dynamic_font_size = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					button_hotspot_size[1] + 10 + 2,
					-2,
					3
				},
				size = {
					size[1] - (button_hotspot_size[1] * 2 + 20),
					button_hotspot_size[2]
				}
			},
			button_hotspot_left = {
				color = {
					150,
					30,
					30,
					30
				},
				size = button_hotspot_size,
				offset = left_button_offset
			},
			left_arrow_icon = {
				size = arrow_icon_size,
				offset = {
					left_button_offset[1] + button_hotspot_size[1] / 2 - arrow_icon_size[1] / 2,
					left_button_offset[2] + button_hotspot_size[2] / 2 - arrow_icon_size[2] / 2,
					2
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			button_hotspot_right = {
				size = button_hotspot_size,
				offset = right_button_offset
			},
			right_arrow_icon = {
				angle = math.degrees_to_radians(180),
				pivot = {
					14,
					17
				},
				size = arrow_icon_size,
				offset = {
					right_button_offset[1] + button_hotspot_size[1] / 2 - arrow_icon_size[1] / 2,
					right_button_offset[2] + button_hotspot_size[2] / 2 - arrow_icon_size[2] / 2,
					2
				},
				color = {
					255,
					255,
					255,
					255
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_window_divider(scenegraph_id, size)
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
					6
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
					10
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
					10
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

local function create_refresh_button(scenegraph_id, size)
	local frame_settings = UIFrameSettings.menu_frame_09
	local element = {
		passes = {
			{
				style_id = "button",
				pass_type = "hotspot",
				content_id = "button_hotspot"
			},
			{
				pass_type = "rect",
				style_id = "button"
			},
			{
				pass_type = "texture_frame",
				style_id = "frame",
				texture_id = "frame"
			},
			{
				pass_type = "texture",
				style_id = "icon",
				texture_id = "icon",
				content_check_function = function (content)
					return not content.button_hotspot.is_hover
				end
			},
			{
				pass_type = "texture",
				style_id = "icon_hover",
				texture_id = "icon",
				content_check_function = function (content)
					return content.button_hotspot.is_hover
				end
			},
			{
				pass_type = "texture",
				style_id = "hover",
				texture_id = "hover",
				content_check_function = function (content)
					return content.button_hotspot.is_hover
				end
			}
		}
	}
	local content = {
		icon = "leaderboard_icon_refresh",
		hover = "button_state_default_2",
		button_hotspot = {},
		frame = frame_settings.texture
	}
	local style = {
		button = {
			color = Colors.get_color_table_with_alpha("black", 200),
			offset = {
				0,
				0,
				0
			}
		},
		icon = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				15,
				13
			},
			color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			offset = {
				0,
				0,
				3
			}
		},
		icon_hover = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				15,
				13
			},
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				0,
				3
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
				2
			}
		},
		hover = {
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
		}
	}
	local widget = {
		element = element,
		content = content,
		style = style,
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}

	return widget
end

local disable_with_gamepad = true
local widgets = {
	window = UIWidgets.create_frame("window", scenegraph_definition.window.size, "menu_frame_11"),
	window_background = UIWidgets.create_tiled_texture("window_background", "quests_background", {
		50,
		156
	}, {
		0,
		0,
		-1
	}, nil, {
		255,
		200,
		200,
		200
	}),
	exit_button = UIWidgets.create_default_button("exit_button", scenegraph_definition.exit_button.size, nil, nil, Localize("menu_close"), 24, nil, "button_detail_04", 34, disable_with_gamepad),
	title = UIWidgets.create_simple_texture("frame_title_bg", "title"),
	title_bg = UIWidgets.create_background("title_bg", scenegraph_definition.title_bg.size, "menu_frame_bg_02"),
	title_text = UIWidgets.create_simple_text(Localize("menu_weave_leaderboard_title"), "title_text", nil, nil, title_text_style),
	option_tabs_divider = create_window_divider("option_tabs_divider", scenegraph_definition.option_tabs_divider.size),
	list_title_rank = UIWidgets.create_simple_text(Localize("menu_weave_leaderboard_title_rank"), "list_title_rank", nil, nil, list_title_text_style),
	list_title_name = UIWidgets.create_simple_text((PLATFORM ~= "xb1" and Localize("menu_weave_leaderboard_title_player_name")) or Localize("menu_weave_leaderboard_title_gamertag"), "list_title_name", nil, nil, list_title_text_style),
	list_title_weave = UIWidgets.create_simple_text(Localize("menu_weave_leaderboard_title_weave_number"), "list_title_weave", nil, nil, list_title_text_style),
	list_title_score = UIWidgets.create_simple_text(Localize("menu_weave_leaderboard_title_weave_score"), "list_title_score", nil, nil, list_title_text_style),
	no_placement_text = UIWidgets.create_simple_text(Localize("menu_weave_leaderboard_no_placement_text"), "no_placement_text", nil, nil, no_placement_text_style),
	refresh_button = create_refresh_button("refresh_button", scenegraph_definition.refresh_button.size),
	refresh_text = UIWidgets.create_simple_text(Localize("menu_description_refresh"), "refresh_text", nil, nil, refresh_text_style),
	list_window_fade = UIWidgets.create_simple_texture("options_window_fade_01", "list_window", nil, nil, nil, -1),
	list_scrollbar = UIWidgets.create_chain_scrollbar("list_scrollbar", "list_mask", scenegraph_definition.list_scrollbar.size),
	list_mask = create_list_mask("list_mask", scenegraph_definition.list_mask.size, list_fade_height),
	list_mask_window = UIWidgets.create_rect_with_outer_frame("list_mask", scenegraph_definition.list_mask.size, "shadow_frame_02", nil, {
		100,
		0,
		0,
		0
	}, {
		255,
		0,
		0,
		0
	}),
	setting_stepper_1 = create_stepper("setting_stepper_1", scenegraph_definition.setting_stepper_1.size),
	setting_stepper_2 = create_stepper("setting_stepper_2", scenegraph_definition.setting_stepper_2.size),
	loading_icon = UIWidgets.create_leaderboard_loading_icon("loading_icon", {
		"list_mask"
	})
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
	default = {
		{
			input_action = "special_1",
			priority = 3,
			description_text = "menu_description_refresh"
		},
		{
			input_action = "confirm",
			priority = 4,
			description_text = "input_description_select"
		},
		{
			input_action = "back",
			priority = 5,
			description_text = "input_description_close"
		}
	},
	open_profile = {
		actions = {
			{
				input_action = "refresh",
				priority = 1,
				description_text = "input_description_show_profile"
			}
		}
	}
}

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	console_cursor_definition = UIWidgets.create_console_cursor("console_cursor"),
	generic_input_actions = generic_input_actions
}
