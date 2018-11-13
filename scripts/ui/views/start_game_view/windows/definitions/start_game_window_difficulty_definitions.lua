local window_default_settings = UISettings.game_start_windows
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_spacing = window_default_settings.spacing
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_width_offset = window_size[1] * 2 + window_spacing * 2
local window_text_width = window_size[1] - (window_frame_width * 2 + 60)
local difficulty_option_size = {
	1020,
	200
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
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = 1 - anim_progress
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
		horizontal_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1
		}
	},
	info_window = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = window_size,
		position = {
			window_width_offset,
			0,
			1
		}
	},
	difficulty_option_1 = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "left",
		size = difficulty_option_size,
		position = {
			window_spacing,
			-window_frame_height / 2,
			1
		}
	},
	difficulty_option_2 = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "left",
		size = difficulty_option_size,
		position = {
			window_spacing,
			-(difficulty_option_size[2] + window_frame_height + window_frame_height / 2),
			1
		}
	},
	difficulty_option_3 = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "left",
		size = difficulty_option_size,
		position = {
			window_spacing,
			-((difficulty_option_size[2] + window_frame_height) * 2 + window_frame_height / 2),
			1
		}
	},
	difficulty_option_4 = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "left",
		size = difficulty_option_size,
		position = {
			window_spacing,
			-((difficulty_option_size[2] + window_frame_height) * 3 + window_frame_height / 2),
			1
		}
	},
	description_text = {
		vertical_alignment = "bottom",
		parent = "info_window",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			window_size[2] / 2
		},
		position = {
			0,
			35,
			1
		}
	},
	difficulty_texture = {
		vertical_alignment = "top",
		parent = "info_window",
		horizontal_alignment = "center",
		size = {
			150,
			150
		},
		position = {
			0,
			-128,
			1
		}
	},
	difficulty_title_divider = {
		vertical_alignment = "bottom",
		parent = "difficulty_texture",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			-95,
			1
		}
	},
	difficulty_title = {
		vertical_alignment = "bottom",
		parent = "difficulty_title_divider",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			50
		},
		position = {
			0,
			20,
			1
		}
	},
	difficulty_chest_info = {
		vertical_alignment = "top",
		parent = "description_text",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			20
		},
		position = {
			0,
			-120,
			0
		}
	},
	difficulty_xp_multiplier = {
		vertical_alignment = "top",
		parent = "difficulty_chest_info",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			20
		},
		position = {
			0,
			-30,
			0
		}
	},
	difficulty_lock_text = {
		vertical_alignment = "top",
		parent = "difficulty_xp_multiplier",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			20
		},
		position = {
			0,
			-70,
			0
		}
	},
	difficulty_is_locked_text = {
		vertical_alignment = "top",
		parent = "difficulty_lock_text",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			20
		},
		position = {
			0,
			-35,
			0
		}
	},
	select_button = {
		vertical_alignment = "bottom",
		parent = "info_window",
		horizontal_alignment = "center",
		size = {
			460,
			72
		},
		position = {
			0,
			18,
			20
		}
	}
}
local description_text_style = {
	word_wrap = true,
	font_size = 18,
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
local difficulty_text_style = {
	font_size = 36,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local difficulty_chest_info_style = {
	font_size = 20,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("cyan", 255),
	offset = {
		0,
		0,
		2
	}
}
local difficulty_xp_multiplier_style = {
	font_size = 20,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("cyan", 255),
	offset = {
		0,
		0,
		2
	}
}
local difficulty_lock_text_style = {
	font_size = 24,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}
local difficulty_is_locked_text_style = {
	font_size = 22,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("red", 255),
	offset = {
		0,
		0,
		2
	}
}

local function difficulty_option_button(scenegraph_id, size)
	local widget = {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background"
				},
				{
					pass_type = "texture",
					style_id = "select",
					texture_id = "select"
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon"
				},
				{
					pass_type = "texture",
					style_id = "icon_glow",
					texture_id = "icon_glow"
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
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "title_text_disabled",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				}
			}
		},
		content = {
			background = "difficulty_banner",
			title_text = "n/a",
			description_text = "n/a",
			select = "difficulty_banner_glow_02",
			title_divider = "divider_01_bottom",
			title_divider_bottom = "divider_01_top",
			icon = "difficulty_option_1",
			icon_glow = "difficulty_banner_glow_01",
			button_hotspot = {}
		},
		style = {
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
			icon = {
				size = {
					150,
					150
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					45,
					25,
					3
				}
			},
			icon_glow = {
				size = {
					178,
					178
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					30,
					10,
					2
				}
			},
			select = {
				size = {
					1043,
					224
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-11,
					-12,
					3
				}
			},
			description_text = {
				font_size = 20,
				localize = true,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					300,
					-110,
					2
				},
				default_offset = {
					300,
					-110,
					2
				}
			},
			title_text = {
				font_size = 72,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					300,
					-4,
					2
				}
			},
			title_text_shadow = {
				font_size = 72,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					302,
					-6,
					1
				}
			},
			title_text_disabled = {
				font_size = 72,
				upper_case = true,
				localize = true,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					300,
					-4,
					2
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

local disable_with_gamepad = true
local widgets = {
	background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "info_window"),
	background_mask = UIWidgets.create_simple_texture("mask_rect", "info_window"),
	window = UIWidgets.create_frame("info_window", window_size, window_frame, 20),
	difficulty_option_1 = difficulty_option_button("difficulty_option_1", difficulty_option_size),
	difficulty_option_2 = difficulty_option_button("difficulty_option_2", difficulty_option_size),
	difficulty_option_3 = difficulty_option_button("difficulty_option_3", difficulty_option_size),
	difficulty_option_4 = difficulty_option_button("difficulty_option_4", difficulty_option_size),
	difficulty_title = UIWidgets.create_simple_text("difficulty_title", "difficulty_title", nil, nil, difficulty_text_style),
	difficulty_texture = UIWidgets.create_simple_texture("difficulty_option_1", "difficulty_texture"),
	difficulty_title_divider = UIWidgets.create_simple_texture("divider_01_top", "difficulty_title_divider"),
	description_text = UIWidgets.create_simple_text(Localize("start_game_window_adventure_desc"), "description_text", nil, nil, description_text_style),
	difficulty_chest_info = UIWidgets.create_simple_text("", "difficulty_chest_info", nil, nil, difficulty_chest_info_style),
	xp_multiplier = UIWidgets.create_simple_text("", "difficulty_xp_multiplier", nil, nil, difficulty_xp_multiplier_style),
	difficulty_lock_text = UIWidgets.create_simple_text("difficulty_lock_text", "difficulty_lock_text", nil, nil, difficulty_lock_text_style),
	difficulty_is_locked_text = UIWidgets.create_simple_text("Some people in your party do not meet the required Hero Power.", "difficulty_is_locked_text", nil, nil, difficulty_is_locked_text_style),
	select_button = UIWidgets.create_default_button("select_button", scenegraph_definition.select_button.size, nil, nil, Localize("confirm_menu_button_name"), 32, nil, nil, nil, disable_with_gamepad)
}

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
