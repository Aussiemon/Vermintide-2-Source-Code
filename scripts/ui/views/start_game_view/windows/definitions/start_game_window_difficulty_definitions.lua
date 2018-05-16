local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
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
local title_text_style = {
	font_size = 42,
	upper_case = true,
	localize = false,
	use_shadow = true,
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
local blocking_peers_text_style = {
	font_size = 22,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = false,
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

local function create_window_button(scenegraph_id, size, button_text, font_size, use_bottom_edge, optional_color_name)
	local button_color_name = nil

	if optional_color_name then
		button_color_name = "button_" .. optional_color_name
	else
		button_color_name = "button_normal"
	end

	local background_color = Colors.get_color_table_with_alpha(button_color_name, 255)
	local button_background_texture = "button_bg_01"
	local button_background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(button_background_texture)
	local widget = {
		element = {
			passes = {
				{
					style_id = "button_background",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "button_background",
					pass_type = "texture_uv",
					content_id = "button_background"
				},
				{
					texture_id = "bottom_edge",
					style_id = "button_edge",
					pass_type = "tiled_texture"
				},
				{
					texture_id = "glass_top",
					style_id = "glass_top",
					pass_type = "texture"
				},
				{
					texture_id = "glow",
					style_id = "glow",
					pass_type = "texture"
				},
				{
					texture_id = "hover_glow",
					style_id = "hover_glow",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and (button_hotspot.is_selected or button_hotspot.is_hover)
					end
				},
				{
					style_id = "button_text",
					pass_type = "text",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					style_id = "button_text_disabled",
					pass_type = "text",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "button_text_shadow",
					pass_type = "text",
					text_id = "button_text"
				},
				{
					style_id = "button_clicked_rect",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot
						local is_clicked = button_hotspot.is_clicked

						return not is_clicked or is_clicked == 0
					end
				},
				{
					style_id = "button_disabled_rect",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					texture_id = "bottom_edge",
					style_id = "bottom_edge",
					pass_type = "tiled_texture",
					content_check_function = function (content)
						return content.use_bottom_edge
					end
				},
				{
					texture_id = "edge_holder_left",
					style_id = "edge_holder_left",
					pass_type = "texture",
					content_check_function = function (content)
						return content.use_bottom_edge
					end
				},
				{
					texture_id = "edge_holder_right",
					style_id = "edge_holder_right",
					pass_type = "texture",
					content_check_function = function (content)
						return content.use_bottom_edge
					end
				}
			}
		},
		content = {
			edge_holder_left = "menu_frame_09_divider_left",
			edge_holder_right = "menu_frame_09_divider_right",
			glass_top = "button_glass_01",
			bottom_edge = "menu_frame_09_divider",
			use_bottom_edge = use_bottom_edge,
			button_hotspot = {},
			button_text = button_text or "n/a",
			hover_glow = (optional_color_name and "button_state_hover_" .. optional_color_name) or "button_state_hover",
			glow = (optional_color_name and "button_state_normal_" .. optional_color_name) or "button_state_normal",
			button_background = {
				uvs = {
					{
						0,
						1 - math.min(size[2] / button_background_texture_settings.size[2], 1)
					},
					{
						math.min(size[1] / button_background_texture_settings.size[1], 1),
						1
					}
				},
				texture_id = button_background_texture
			}
		},
		style = {
			button_background = {
				color = background_color,
				offset = {
					0,
					0,
					2
				},
				size = size
			},
			button_edge = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2],
					3
				},
				size = {
					size[1],
					5
				},
				texture_tiling_size = {
					1,
					5
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
					size[2] - 4,
					3
				},
				size = {
					size[1],
					5
				}
			},
			glow = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					5,
					3
				},
				size = {
					size[1],
					size[2] - 5
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
					5,
					2
				},
				size = {
					size[1],
					size[2] - 5
				}
			},
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
					1,
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
			},
			button_text = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					5,
					4
				},
				size = size
			},
			button_text_disabled = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					5,
					4
				},
				size = size
			},
			button_text_shadow = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					3,
					3
				},
				size = size
			},
			button_clicked_rect = {
				color = {
					100,
					0,
					0,
					0
				},
				offset = {
					5,
					0,
					5
				},
				size = {
					size[1] - 10,
					size[2]
				}
			},
			button_disabled_rect = {
				color = {
					150,
					5,
					5,
					5
				},
				offset = {
					5,
					0,
					5
				},
				size = {
					size[1] - 10,
					size[2]
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

return {
	widgets = widgets,
	node_widgets = node_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
