local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local game_option_size = {
	window_size[1] - window_frame_width * 2,
	(window_size[2] - window_frame_height * 2) / 3.5
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
	title_text_glow = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			544,
			16
		},
		position = {
			0,
			15,
			-1
		}
	},
	title_text = {
		vertical_alignment = "center",
		parent = "title_text_glow",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			50
		},
		position = {
			0,
			15,
			1
		}
	},
	hero_info_bg = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			220
		},
		position = {
			0,
			0,
			1
		}
	},
	hero_info_divider = {
		vertical_alignment = "bottom",
		parent = "hero_info_bg",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			0
		},
		position = {
			0,
			0,
			10
		}
	},
	hero_info_detail = {
		vertical_alignment = "center",
		parent = "hero_info_divider",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			0,
			11
		}
	},
	prestige_button = {
		vertical_alignment = "top",
		parent = "hero_info_bg",
		horizontal_alignment = "right",
		size = {
			window_size[1] / 2,
			35
		},
		position = {
			0,
			-5,
			1
		}
	},
	prestige_divider = {
		vertical_alignment = "center",
		parent = "prestige_button",
		horizontal_alignment = "left",
		size = {
			window_size[1] / 2,
			35
		},
		position = {
			-5,
			0,
			1
		}
	},
	experience_bar_fg = {
		vertical_alignment = "top",
		parent = "hero_info_bg",
		horizontal_alignment = "left",
		size = {
			window_size[1] - 10,
			40
		},
		position = {
			5,
			0,
			7
		}
	},
	experience_bar_glass = {
		vertical_alignment = "top",
		parent = "experience_bar_fg",
		horizontal_alignment = "center",
		size = {
			438,
			5
		},
		position = {
			0,
			-5,
			-1
		}
	},
	experience_divider = {
		vertical_alignment = "bottom",
		parent = "experience_bar_fg",
		horizontal_alignment = "left",
		size = {
			window_size[1],
			0
		},
		position = {
			-5,
			-5,
			10
		}
	},
	experience_bar_bg = {
		vertical_alignment = "center",
		parent = "experience_bar_fg",
		horizontal_alignment = "center",
		size = {
			438,
			40
		},
		position = {
			0,
			0,
			-6
		}
	},
	experience_bar = {
		vertical_alignment = "bottom",
		parent = "experience_bar_bg",
		horizontal_alignment = "left",
		size = {
			438,
			40
		},
		position = {
			0,
			0,
			2
		}
	},
	experience_bar_edge = {
		vertical_alignment = "center",
		parent = "experience_bar",
		horizontal_alignment = "right",
		size = {
			40,
			40
		},
		position = {
			40,
			0,
			3
		}
	},
	portrait_root = {
		vertical_alignment = "top",
		parent = "hero_info_bg",
		horizontal_alignment = "right",
		size = {
			0,
			0
		},
		position = {
			-100,
			-130,
			5
		}
	},
	career_name = {
		vertical_alignment = "top",
		parent = "hero_info_bg",
		horizontal_alignment = "left",
		size = {
			window_size[1],
			0
		},
		position = {
			20,
			-65,
			1
		}
	},
	name_divider = {
		vertical_alignment = "bottom",
		parent = "career_name",
		horizontal_alignment = "left",
		size = {
			window_size[1] / 2,
			4
		},
		position = {
			0,
			-16,
			1
		}
	},
	hero_name = {
		vertical_alignment = "bottom",
		parent = "name_divider",
		horizontal_alignment = "left",
		size = {
			window_size[1],
			0
		},
		position = {
			0,
			-12,
			1
		}
	},
	power_text_bg = {
		vertical_alignment = "bottom",
		parent = "hero_info_bg",
		horizontal_alignment = "left",
		size = {
			115,
			63
		},
		position = {
			30,
			10,
			1
		}
	},
	power_text = {
		vertical_alignment = "center",
		parent = "power_text_bg",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			0
		},
		position = {
			-4,
			-3,
			1
		}
	},
	power_title = {
		vertical_alignment = "top",
		parent = "power_text_bg",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			0
		},
		position = {
			0,
			0,
			1
		}
	},
	level_text = {
		vertical_alignment = "center",
		parent = "experience_bar_fg",
		horizontal_alignment = "left",
		size = {
			window_size[1],
			0
		},
		position = {
			0,
			-3,
			5
		}
	},
	game_option_1 = {
		vertical_alignment = "bottom",
		parent = "game_option_2",
		horizontal_alignment = "center",
		size = {
			window_size[1] - 20,
			108
		},
		position = {
			0,
			124,
			3
		}
	},
	game_option_2 = {
		vertical_alignment = "bottom",
		parent = "game_option_3",
		horizontal_alignment = "center",
		size = {
			window_size[1] - 20,
			108
		},
		position = {
			0,
			124,
			3
		}
	},
	game_option_3 = {
		vertical_alignment = "bottom",
		parent = "game_option_4",
		horizontal_alignment = "center",
		size = {
			window_size[1] - 20,
			108
		},
		position = {
			0,
			124,
			3
		}
	},
	game_option_4 = {
		vertical_alignment = "bottom",
		parent = "game_option_5",
		horizontal_alignment = "center",
		size = {
			window_size[1] - 20,
			108
		},
		position = {
			0,
			84,
			3
		}
	},
	game_option_5 = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1] - 40,
			70
		},
		position = {
			0,
			18,
			1
		}
	},
	game_options_right_chain = {
		vertical_alignment = "top",
		parent = "hero_info_divider",
		horizontal_alignment = "center",
		size = {
			16,
			600
		},
		position = {
			195,
			0,
			-10
		}
	},
	game_options_left_chain = {
		vertical_alignment = "top",
		parent = "hero_info_divider",
		horizontal_alignment = "center",
		size = {
			16,
			600
		},
		position = {
			-195,
			0,
			-10
		}
	},
	game_options_right_chain_end = {
		vertical_alignment = "bottom",
		parent = "game_options_right_chain",
		horizontal_alignment = "center",
		size = {
			19,
			20
		},
		position = {
			-1,
			-20,
			1
		}
	},
	game_options_left_chain_end = {
		vertical_alignment = "bottom",
		parent = "game_options_left_chain",
		horizontal_alignment = "center",
		size = {
			19,
			20
		},
		position = {
			-1,
			-20,
			1
		}
	}
}
local career_name_style = {
	font_size = 28,
	upper_case = true,
	localize = true,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local hero_name_style = {
	use_shadow = true,
	vertical_alignment = "center",
	localize = true,
	horizontal_alignment = "left",
	font_size = 20,
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local power_title_style = {
	use_shadow = true,
	vertical_alignment = "bottom",
	localize = true,
	horizontal_alignment = "center",
	font_size = 20,
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local level_text_style = {
	use_shadow = true,
	vertical_alignment = "center",
	localize = false,
	horizontal_alignment = "center",
	font_size = 24,
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}
local power_text_style = {
	use_shadow = true,
	vertical_alignment = "center",
	localize = false,
	horizontal_alignment = "center",
	font_size = 42,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}

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

local function create_vertical_window_divider(scenegraph_id, size)
	local widget = {
		element = {
			passes = {
				{
					texture_id = "edge",
					style_id = "edge",
					pass_type = "tiled_texture"
				},
				{
					texture_id = "edge_holder_top",
					style_id = "edge_holder_top",
					pass_type = "texture"
				},
				{
					texture_id = "edge_holder_bottom",
					style_id = "edge_holder_bottom",
					pass_type = "texture"
				}
			}
		},
		content = {
			edge = "menu_frame_09_divider_vertical",
			edge_holder_top = "menu_frame_09_divider_top",
			edge_holder_bottom = "menu_frame_09_divider_bottom"
		},
		style = {
			edge = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					6,
					6
				},
				size = {
					5,
					size[2] - 9
				},
				texture_tiling_size = {
					5,
					size[2] - 9
				}
			},
			edge_holder_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-6,
					size[2] - 7,
					10
				},
				size = {
					17,
					9
				}
			},
			edge_holder_bottom = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-6,
					3,
					10
				},
				size = {
					17,
					9
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

local function create_button(scenegraph_id, size, button_text, font_size, use_bottom_edge, optional_color_name)
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
					size[1],
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
					3,
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
					3,
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
					1,
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
					0,
					0,
					5
				},
				size = size
			},
			button_disabled_rect = {
				color = {
					150,
					5,
					5,
					5
				},
				offset = {
					0,
					0,
					5
				},
				size = size
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

local widgets = {
	hero_power_tooltip = {
		scenegraph_id = "power_text_bg",
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
					style_id = "hover",
					texture_id = "hover",
					content_check_function = function (content)
						return content.button_hotspot.is_hover
					end
				},
				{
					pass_type = "hero_power_tooltip",
					content_check_function = function (content)
						return content.button_hotspot.is_hover
					end
				},
				{
					pass_type = "rotated_texture",
					style_id = "effect",
					texture_id = "effect"
				}
			}
		},
		content = {
			effect = "sparkle_effect",
			background = "hero_power_bg",
			hover = "hero_power_bg_hover",
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
					0
				}
			},
			hover = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					140,
					89
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
					1
				}
			},
			effect = {
				vertical_alignment = "top",
				angle = 0,
				horizontal_alignment = "right",
				offset = {
					110,
					120,
					4
				},
				pivot = {
					128,
					128
				},
				texture_size = {
					256,
					256
				},
				color = Colors.get_color_table_with_alpha("white", 0)
			}
		}
	},
	hero_info_divider = create_window_divider("hero_info_divider", scenegraph_definition.hero_info_divider.size),
	hero_info_detail = UIWidgets.create_simple_texture("divider_01_top", "hero_info_detail"),
	background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "window"),
	window = UIWidgets.create_frame("window", window_size, window_frame, 20),
	game_option_1 = UIWidgets.create_window_category_button("game_option_1", scenegraph_definition.game_option_1.size, Localize("hero_window_equipment"), "options_button_icon_equipment", "menu_options_button_image_01"),
	game_option_2 = UIWidgets.create_window_category_button("game_option_2", scenegraph_definition.game_option_2.size, Localize("hero_window_talents"), "options_button_icon_talents", "menu_options_button_image_08"),
	game_option_3 = UIWidgets.create_window_category_button("game_option_3", scenegraph_definition.game_option_3.size, Localize("hero_window_crafting"), "options_button_icon_crafting", "menu_options_button_image_06"),
	game_option_4 = UIWidgets.create_window_category_button("game_option_4", scenegraph_definition.game_option_4.size, Localize("hero_window_cosmetics"), "options_button_icon_cosmetics", "menu_options_button_image_07"),
	game_option_5 = UIWidgets.create_default_image_button("game_option_5", scenegraph_definition.game_option_5.size, nil, nil, Localize("hero_window_loot_crates"), 28),
	game_options_left_chain = UIWidgets.create_tiled_texture("game_options_left_chain", "chain_link_01", {
		16,
		19
	}),
	game_options_right_chain = UIWidgets.create_tiled_texture("game_options_right_chain", "chain_link_01", {
		16,
		19
	}),
	experience_bar_fg = UIWidgets.create_simple_texture("crafting_button_fg", "experience_bar_fg"),
	experience_bar_glass = UIWidgets.create_simple_texture("button_glass_01", "experience_bar_glass"),
	experience_bar_bg = UIWidgets.create_simple_rect("experience_bar_bg", {
		255,
		0,
		0,
		0
	}),
	experience_bar_edge = UIWidgets.create_simple_texture("experience_bar_edge_glow", "experience_bar_edge"),
	experience_bar = UIWidgets.create_simple_uv_texture("experience_bar_fill", {
		{
			0,
			0
		},
		{
			1,
			1
		}
	}, "experience_bar"),
	experience_divider = create_window_divider("experience_divider", scenegraph_definition.experience_divider.size),
	career_name = UIWidgets.create_simple_text("n/a", "career_name", 22, nil, career_name_style),
	hero_name = UIWidgets.create_simple_text("n/a", "hero_name", 22, nil, hero_name_style),
	name_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "name_divider"),
	power_title = UIWidgets.create_simple_text("hero_power_header", "power_title", 22, nil, power_title_style),
	power_text = UIWidgets.create_simple_text("n/a", "power_text", 22, nil, power_text_style),
	level_text = UIWidgets.create_simple_text("n/a", "level_text", 22, nil, level_text_style)
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
				params.render_settings.alpha_multiplier = 1 - anim_progress

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
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
