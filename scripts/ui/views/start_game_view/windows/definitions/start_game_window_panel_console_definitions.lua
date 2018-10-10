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
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	panel = {
		vertical_alignment = "top",
		scale = "fit_width",
		size = {
			1920,
			79
		},
		position = {
			0,
			0,
			UILayer.default + 1
		}
	},
	panel_edge = {
		vertical_alignment = "top",
		scale = "fit_width",
		size = {
			1920,
			4
		},
		position = {
			0,
			0,
			UILayer.default + 10
		}
	},
	bottom_panel = {
		vertical_alignment = "bottom",
		scale = "fit_width",
		size = {
			1920,
			79
		},
		position = {
			0,
			0,
			UILayer.default + 1
		}
	},
	back_button = {
		vertical_alignment = "top",
		parent = "panel",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			40,
			-120,
			3
		}
	},
	close_button = {
		vertical_alignment = "top",
		parent = "panel",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			40,
			-34,
			3
		}
	},
	panel_entry_area = {
		vertical_alignment = "top",
		parent = "panel",
		horizontal_alignment = "left",
		size = {
			1280,
			70
		},
		position = {
			70,
			0,
			1
		}
	},
	panel_input_area_1 = {
		vertical_alignment = "center",
		parent = "game_option_1",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			-50,
			8,
			1
		}
	},
	panel_input_area_2 = {
		vertical_alignment = "center",
		parent = "game_option_4",
		horizontal_alignment = "right",
		size = {
			0,
			0
		},
		position = {
			50,
			8,
			1
		}
	},
	menu_root = {
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
	game_option_pivot = {
		vertical_alignment = "top",
		parent = "panel_entry_area",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			20,
			0,
			14
		}
	},
	game_option_1 = {
		vertical_alignment = "top",
		parent = "game_option_pivot",
		horizontal_alignment = "left",
		size = {
			220,
			68
		},
		position = {
			0,
			0,
			1
		}
	},
	game_option_2 = {
		vertical_alignment = "top",
		parent = "game_option_pivot",
		horizontal_alignment = "left",
		size = {
			220,
			68
		},
		position = {
			0,
			0,
			1
		}
	},
	game_option_3 = {
		vertical_alignment = "top",
		parent = "game_option_pivot",
		horizontal_alignment = "left",
		size = {
			220,
			68
		},
		position = {
			0,
			0,
			1
		}
	},
	game_option_4 = {
		vertical_alignment = "top",
		parent = "game_option_pivot",
		horizontal_alignment = "left",
		size = {
			220,
			68
		},
		position = {
			0,
			0,
			1
		}
	}
}

if PLATFORM == "win32" then
	scenegraph_definition.game_option_5 = {
		vertical_alignment = "top",
		parent = "game_option_pivot",
		horizontal_alignment = "left",
		size = {
			220,
			68
		},
		position = {
			0,
			0,
			1
		}
	}
	scenegraph_definition.panel_input_area_2.parent = "game_option_5"
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

local function create_panel_buttons(scenegraph_id, size)
	local amount = 5
	local spacing = 0
	local texture_colors = {}
	local slot_frame_texture_colors = {}
	local slot_frame_color = {
		255,
		238,
		122,
		20
	}

	for i = 1, amount, 1 do
		texture_colors[i] = {
			255,
			255,
			255,
			255
		}
		slot_frame_texture_colors[i] = {
			slot_frame_color[1],
			slot_frame_color[2],
			slot_frame_color[3],
			slot_frame_color[4]
		}
	end

	return {
		element = {
			passes = {
				{
					pass_type = "centered_texture_amount",
					style_id = "slot",
					texture_id = "slot"
				},
				{
					pass_type = "centered_texture_amount",
					style_id = "slot_frame",
					texture_id = "slot_frame"
				},
				{
					pass_type = "centered_texture_amount",
					style_id = "icon_available",
					texture_id = "icon_available"
				},
				{
					pass_type = "centered_texture_amount",
					style_id = "icon_cooldown",
					texture_id = "icon_cooldown"
				},
				{
					pass_type = "centered_texture_amount",
					style_id = "icon_loot",
					texture_id = "icon_loot"
				},
				{
					pass_type = "centered_texture_amount",
					style_id = "icon_locked",
					texture_id = "icon_locked"
				},
				{
					style_id = "side_detail_right",
					pass_type = "texture_uv",
					content_id = "side_detail"
				},
				{
					texture_id = "refresh_icon",
					style_id = "refresh_icon",
					pass_type = "texture"
				},
				{
					texture_id = "refresh_icon_bg",
					style_id = "refresh_icon_bg",
					pass_type = "texture"
				},
				{
					texture_id = "texture_id",
					style_id = "side_detail_left",
					pass_type = "texture",
					content_id = "side_detail"
				},
				{
					pass_type = "tiled_texture",
					style_id = "background",
					texture_id = "background"
				}
			}
		},
		content = {
			slot = "achievement_symbol_book",
			refresh_icon_bg = "achievement_refresh_off",
			slot_frame = "achievement_symbol_book_glow_1",
			icon_available = "achievement_symbol_skull",
			icon_cooldown = "achievement_symbol_hourglass",
			icon_loot = "achievement_symbol_loot",
			background = "chain_middle",
			slot_flames = "achievement_small_book_glow",
			refresh_icon = "achievement_refresh_on",
			icon_locked = "achievement_symbol_lock",
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
			}
		},
		style = {
			background = {
				offset = {
					0,
					0,
					0
				},
				texture_tiling_size = {
					19,
					16
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			slot = {
				texture_axis = 1,
				spacing = spacing,
				texture_size = {
					63,
					58
				},
				texture_amount = amount,
				texture_colors = texture_colors,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-multi_texture_extra_width * 0.5,
					size[2] / 2 - 29,
					2
				},
				size = multi_texture_size
			},
			slot_frame = {
				texture_axis = 1,
				spacing = spacing,
				texture_size = {
					63,
					58
				},
				texture_amount = amount,
				texture_colors = slot_frame_texture_colors,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-multi_texture_extra_width * 0.5,
					size[2] / 2 - 29,
					0
				},
				size = multi_texture_size
			},
			slot_flames = {
				texture_axis = 1,
				spacing = spacing,
				texture_size = {
					71,
					102
				},
				texture_amount = amount,
				texture_colors = slot_frame_texture_colors,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-multi_texture_extra_width * 0.5,
					size[2] / 2 - 40,
					1
				},
				size = multi_texture_size
			},
			icon_cooldown = {
				texture_axis = 1,
				spacing = spacing,
				texture_size = {
					56,
					40
				},
				texture_amount = amount,
				texture_colors = texture_colors,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-multi_texture_extra_width * 0.5,
					size[2] / 2 - 20,
					3
				},
				size = multi_texture_size
			},
			icon_available = {
				texture_axis = 1,
				spacing = spacing,
				texture_size = {
					34,
					34
				},
				texture_amount = amount,
				texture_colors = texture_colors,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-multi_texture_extra_width * 0.5,
					size[2] / 2 - 17,
					3
				},
				size = multi_texture_size
			},
			icon_locked = {
				texture_axis = 1,
				spacing = spacing,
				texture_size = {
					56,
					40
				},
				texture_amount = amount,
				texture_colors = texture_colors,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-multi_texture_extra_width * 0.5,
					size[2] / 2 - 20,
					3
				},
				size = multi_texture_size
			},
			icon_loot = {
				texture_axis = 1,
				spacing = spacing,
				texture_size = {
					42,
					29
				},
				texture_amount = amount,
				texture_colors = texture_colors,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-multi_texture_extra_width * 0.5,
					size[2] / 2 - 14.5,
					3
				},
				size = multi_texture_size
			},
			side_detail_left = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-side_detail_texture_size[1],
					size[2] / 2 - side_detail_texture_size[2] / 2,
					5
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
					size[1],
					size[2] / 2 - side_detail_texture_size[2] / 2,
					5
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2]
				}
			},
			refresh_icon_bg = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - 10,
					size[2] / 2 - 12.5,
					6
				},
				size = {
					25,
					25
				}
			},
			refresh_icon = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - 10,
					size[2] / 2 - 12.5,
					7
				},
				size = {
					25,
					25
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

local title_button_definitions = {
	[#title_button_definitions + 1] = UIWidgets.create_console_panel_button("game_option_1", scenegraph_definition.game_option_1.size, "start_game_window_adventure_title", 32, nil, "center"),
	[#title_button_definitions + 1] = UIWidgets.create_console_panel_button("game_option_2", scenegraph_definition.game_option_2.size, "start_game_window_specific_title", 32, nil, "center"),
	[#title_button_definitions + 1] = UIWidgets.create_console_panel_button("game_option_3", scenegraph_definition.game_option_3.size, "start_game_window_mutator_title", 32, nil, "center")
}
local title_button_disable_functions = {
	"_adventure_disable_function",
	"_custom_game_disable_function",
	"_heroic_deed_disable_function",
	"_streaming_disable_function"
}

if PLATFORM == "win32" then
	title_button_definitions[#title_button_definitions + 1] = UIWidgets.create_console_panel_button("game_option_4", scenegraph_definition.game_option_4.size, "start_game_window_twitch", 32, nil, "center")
	title_button_definitions[#title_button_definitions + 1] = UIWidgets.create_console_panel_button("game_option_5", scenegraph_definition.game_option_5.size, "start_game_window_lobby_browser", 32, nil, "center")
	title_button_disable_functions[5] = "_lobby_browser_disable_function"
else
	title_button_definitions[#title_button_definitions + 1] = UIWidgets.create_console_panel_button("game_option_4", scenegraph_definition.game_option_4.size, "start_game_window_mixer", 32, nil, "center")
end

local panel_color = UISettings.console_menu_rect_color
local widgets = {
	panel_edge = UIWidgets.create_tiled_texture("panel_edge", "menu_frame_04_divider", {
		1,
		4
	}),
	panel_input_area_1 = UIWidgets.create_simple_texture("xbone_button_icon_lt", "panel_input_area_1"),
	panel_input_area_2 = UIWidgets.create_simple_texture("xbone_button_icon_rt", "panel_input_area_2"),
	panel = UIWidgets.create_simple_texture("menu_panel_bg", "panel", nil, nil, panel_color),
	bottom_panel = UIWidgets.create_simple_uv_texture("menu_panel_bg", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "bottom_panel", nil, nil, panel_color),
	back_button = UIWidgets.create_layout_button("back_button", "layout_button_back", "layout_button_back_glow"),
	close_button = UIWidgets.create_layout_button("close_button", "layout_button_close", "layout_button_close_glow")
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
	title_button_definitions = title_button_definitions,
	title_button_disable_functions = title_button_disable_functions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
