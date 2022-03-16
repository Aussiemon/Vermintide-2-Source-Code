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
	system_button = {
		vertical_alignment = "top",
		parent = "panel",
		horizontal_alignment = "left",
		size = {
			254,
			114
		},
		position = {
			68,
			0,
			3
		}
	},
	bot_customization_button = {
		vertical_alignment = "top",
		parent = "panel",
		horizontal_alignment = "right",
		size = {
			250,
			105
		},
		position = {
			-25,
			10,
			0
		}
	},
	bot_customization_info_bar = {
		vertical_alignment = "top",
		parent = "panel",
		horizontal_alignment = "right",
		size = {
			464,
			100
		},
		position = {
			-180,
			20,
			3
		}
	},
	panel_entry_area = {
		vertical_alignment = "top",
		parent = "panel",
		horizontal_alignment = "left",
		size = {
			900,
			70
		},
		position = {
			320,
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
			-300,
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
			1
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
			0
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
			0
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
			0
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
			0
		}
	},
	game_option_5 = {
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
			0
		}
	},
	preorder_divider = {
		vertical_alignment = "center",
		parent = "panel",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			-110,
			3
		}
	},
	preorder_divider_effect = {
		vertical_alignment = "bottom",
		parent = "preorder_divider",
		horizontal_alignment = "center",
		size = {
			310,
			120
		},
		position = {
			0,
			7,
			-1
		}
	},
	preorder_divider_top = {
		vertical_alignment = "center",
		parent = "preorder_divider",
		horizontal_alignment = "center",
		size = {
			264,
			21
		},
		position = {
			0,
			80,
			3
		}
	},
	preorder_divider_top_effect = {
		vertical_alignment = "bottom",
		parent = "preorder_divider_top",
		horizontal_alignment = "center",
		size = {
			310,
			120
		},
		position = {
			0,
			-106,
			-1
		}
	},
	preorder_input = {
		vertical_alignment = "center",
		parent = "preorder_divider",
		horizontal_alignment = "center",
		size = {
			64,
			64
		},
		position = {
			0,
			-3,
			1
		}
	},
	preorder_text = {
		vertical_alignment = "center",
		parent = "preorder_divider",
		horizontal_alignment = "center",
		size = {
			220,
			40
		},
		position = {
			0,
			36,
			10
		}
	},
	preorder_text_bg = {
		vertical_alignment = "center",
		parent = "preorder_text",
		horizontal_alignment = "center",
		size = {
			600,
			120
		},
		position = {
			0,
			0,
			-15
		}
	},
	bot_warning = {
		vertical_alignment = "center",
		parent = "panel",
		horizontal_alignment = "left",
		size = {
			464,
			80
		},
		position = {
			1375,
			0,
			0
		}
	},
	bot_information_mask = {
		vertical_alignment = "center",
		parent = "panel",
		horizontal_alignment = "left",
		position = {
			1375,
			0,
			2
		}
	}
}
local preorder_text_style = {
	font_size = 42,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = false,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = false,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local menu_options_font_size = 32
local title_button_definitions = {
	[#title_button_definitions + 1] = UIWidgets.create_console_panel_button("game_option_1", scenegraph_definition.game_option_1.size, "hero_window_equipment", menu_options_font_size, nil, "center"),
	[#title_button_definitions + 1] = UIWidgets.create_console_panel_button("game_option_2", scenegraph_definition.game_option_2.size, "hero_window_talents", menu_options_font_size, nil, "center"),
	[#title_button_definitions + 1] = UIWidgets.create_console_panel_button("game_option_3", scenegraph_definition.game_option_3.size, "hero_window_crafting", menu_options_font_size, nil, "center"),
	[#title_button_definitions + 1] = UIWidgets.create_console_panel_button("game_option_4", scenegraph_definition.game_option_4.size, "hero_window_cosmetics", menu_options_font_size, nil, "center")
}
local panel_color = UISettings.console_menu_rect_color
local OFFSET_SIZE = 350

local function create_bot_cusomization_button(ui_renderer)
	local gui = ui_renderer.gui
	local base_offset = 50
	local font_style = {
		font_size = 22,
		font_type = "hell_shark_masked"
	}
	local font, size_of_font = UIFontByResolution(font_style)
	local font_name = font[1]
	local font_size = font[2]
	local font_material = font[3]
	local managing_text = "MANAGING: "
	local min, max = Gui.text_extents(gui, managing_text, font_name, font_size)
	local managing_text_width = max.x - min.x
	local playing_text = string.upper(Localize("lb_playing")) .. ": "
	local min, max = Gui.text_extents(gui, playing_text, font_name, font_size)
	local playing_text_width = max.x - min.x
	local career_name_offset = base_offset + ((managing_text_width > playing_text_width and managing_text_width) or playing_text_width)
	local managing_header_offset = base_offset + math.max(playing_text_width - managing_text_width, 0)
	local playing_header_offset = base_offset + math.max(managing_text_width - playing_text_width, 0)
	local widget = {
		scenegraph_id = "bot_customization_button",
		element = {
			passes = {
				{
					style_id = "button_hotspot",
					pass_type = "hotspot",
					content_id = "button_hotspot",
					content_change_function = function (content, style)
						local parent_content = content.parent
						style.area_size[1] = 250 + parent_content.progress * OFFSET_SIZE
					end
				},
				{
					style_id = "left_texture_id",
					texture_id = "left_texture_id",
					pass_type = "texture",
					content_change_function = function (content, style)
						style.offset[1] = content.progress * -OFFSET_SIZE
					end
				},
				{
					style_id = "right_texture_id",
					pass_type = "texture_uv",
					content_id = "right_texture_id"
				},
				{
					style_id = "middle_texture_id",
					texture_id = "middle_texture_id",
					pass_type = "texture",
					content_change_function = function (content, style)
						style.texture_size[1] = 100 + content.progress * OFFSET_SIZE
					end
				},
				{
					style_id = "left_texture_id",
					texture_id = "mask_id",
					pass_type = "texture",
					content_change_function = function (content, style)
						style.offset[1] = content.progress * -OFFSET_SIZE
					end,
					content_change_function = function (content, style)
						style.offset[1] = content.progress * -OFFSET_SIZE
					end
				},
				{
					style_id = "right_texture_id",
					pass_type = "texture_uv",
					content_id = "right_mask"
				},
				{
					style_id = "middle_mask",
					texture_id = "middle_mask_id",
					pass_type = "texture",
					content_change_function = function (content, style)
						style.texture_size[1] = 100 + content.progress * OFFSET_SIZE
					end
				},
				{
					pass_type = "tiled_texture",
					style_id = "background",
					texture_id = "background_id"
				},
				{
					style_id = "icon",
					texture_id = "icon_id",
					pass_type = "texture",
					content_change_function = function (content, style)
						local button_hotspot = content.button_hotspot
						local hover_progress = button_hotspot.hover_progress
						style.color = Colors.lerp_color_tables(style.unselected_color, style.selected_color, hover_progress)
					end
				},
				{
					style_id = "icon_unselected",
					texture_id = "icon_selected_id",
					pass_type = "texture",
					content_change_function = function (content, style)
						local button_hotspot = content.button_hotspot
						style.color[1] = 128 * (1 - button_hotspot.hover_progress)
					end
				},
				{
					style_id = "icon_selected",
					texture_id = "icon_selected_id",
					pass_type = "texture",
					content_change_function = function (content, style)
						local button_hotspot = content.button_hotspot
						style.color[1] = 255 * button_hotspot.hover_progress
					end
				},
				{
					style_id = "left_side_unselected",
					texture_id = "left_side_selected_id",
					pass_type = "texture",
					content_change_function = function (content, style)
						local button_hotspot = content.button_hotspot
						style.color[1] = 128 * (1 - button_hotspot.hover_progress)
						style.offset[1] = content.progress * -OFFSET_SIZE
					end
				},
				{
					style_id = "left_side_selected",
					texture_id = "left_side_selected_id",
					pass_type = "texture",
					content_change_function = function (content, style)
						local button_hotspot = content.button_hotspot
						style.color[1] = 255 * button_hotspot.hover_progress
						style.offset[1] = content.progress * -OFFSET_SIZE
					end
				},
				{
					style_id = "right_side_unselected",
					pass_type = "texture_uv",
					content_id = "right_side_selected_id",
					content_change_function = function (content, style)
						local button_hotspot = content.parent.button_hotspot
						style.color[1] = 128 * (1 - button_hotspot.hover_progress)
					end
				},
				{
					style_id = "right_side_selected",
					pass_type = "texture_uv",
					content_id = "right_side_selected_id",
					content_change_function = function (content, style)
						local button_hotspot = content.parent.button_hotspot
						style.color[1] = 255 * button_hotspot.hover_progress
					end
				},
				{
					style_id = "middle_unselected",
					texture_id = "middle_selected_id",
					pass_type = "texture",
					content_change_function = function (content, style)
						local button_hotspot = content.button_hotspot
						style.color[1] = 128 * (1 - button_hotspot.hover_progress)
						style.texture_size[1] = 100 + content.progress * OFFSET_SIZE
					end
				},
				{
					style_id = "middle_selected",
					texture_id = "middle_selected_id",
					pass_type = "texture",
					content_change_function = function (content, style)
						local button_hotspot = content.button_hotspot
						style.color[1] = 255 * button_hotspot.hover_progress
						style.texture_size[1] = 100 + content.progress * OFFSET_SIZE
					end
				},
				{
					style_id = "managing_header",
					pass_type = "text",
					text_id = "managing_header"
				},
				{
					style_id = "managing_header_shadow",
					pass_type = "text",
					text_id = "managing_header"
				},
				{
					style_id = "playing_header",
					pass_type = "text",
					text_id = "playing_header"
				},
				{
					style_id = "playing_header_shadow",
					pass_type = "text",
					text_id = "playing_header"
				},
				{
					style_id = "managing_career",
					pass_type = "text",
					text_id = "managing_career_name"
				},
				{
					style_id = "managing_career_shadow",
					pass_type = "text",
					text_id = "managing_career_name"
				},
				{
					style_id = "playing_career",
					pass_type = "text",
					text_id = "playing_career_name"
				},
				{
					style_id = "playing_career_shadow",
					pass_type = "text",
					text_id = "playing_career_name"
				}
			}
		},
		content = {
			middle_texture_id = "character_customization_expandable_border",
			texture_id = "console_menu_bot_cusomization",
			middle_selected_id = "character_customization_expandable_border_selected",
			progress = 0,
			background_id = "character_customization_bg",
			icon_selected_id = "character_customization_bag_icon_selected",
			left_side_selected_id = "character_customization_side_decoration_selected",
			visible = true,
			left_texture_id = "character_customization_side_decoration",
			middle_mask_id = "mask_rect",
			selected_texture = "console_menu_bot_cusomization_highlight",
			managing_career_name = "",
			playing_career_name = "",
			icon_id = "character_customization_bag_icon_unselected",
			mask_id = "character_customization_side_decoration_mask",
			button_hotspot = {},
			right_texture_id = {
				texture_id = "character_customization_side_decoration",
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
			right_mask = {
				texture_id = "character_customization_side_decoration_mask",
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
			right_side_selected_id = {
				texture_id = "character_customization_side_decoration_selected",
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
			managing_header = managing_text,
			playing_header = playing_text
		},
		style = {
			icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					76.8,
					76.8
				},
				color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				selected_color = Colors.get_color_table_with_alpha("white", 255),
				unselected_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					5,
					1
				}
			},
			icon_selected = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					76.8,
					76.8
				},
				color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					0,
					5,
					0
				}
			},
			icon_unselected = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					76.8,
					76.8
				},
				color = Colors.get_color_table_with_alpha("black", 128),
				offset = {
					0,
					5,
					0
				}
			},
			button_hotspot = {
				horizontal_alignment = "right",
				area_size = {
					250,
					90
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					17,
					24,
					0
				}
			},
			left_texture_id = {
				horizontal_alignment = "left",
				texture_size = {
					103,
					105
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
					5
				}
			},
			left_side_unselected = {
				horizontal_alignment = "left",
				texture_size = {
					103,
					105
				},
				color = Colors.get_color_table_with_alpha("black", 128),
				offset = {
					0,
					0,
					0
				}
			},
			left_side_selected = {
				horizontal_alignment = "left",
				texture_size = {
					103,
					105
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
			right_texture_id = {
				horizontal_alignment = "right",
				texture_size = {
					103,
					105
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
					5
				}
			},
			right_side_unselected = {
				horizontal_alignment = "right",
				texture_size = {
					103,
					105
				},
				color = Colors.get_color_table_with_alpha("black", 128),
				offset = {
					0,
					0,
					0
				}
			},
			right_side_selected = {
				horizontal_alignment = "right",
				texture_size = {
					103,
					105
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
			middle_mask = {
				horizontal_alignment = "right",
				texture_size = {
					50,
					105
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-103,
					21,
					0
				}
			},
			middle_texture_id = {
				point_sample = true,
				horizontal_alignment = "right",
				texture_size = {
					125,
					18
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-75,
					13,
					3
				}
			},
			middle_unselected = {
				point_sample = true,
				horizontal_alignment = "right",
				texture_size = {
					125,
					18
				},
				color = {
					255,
					0,
					0,
					0
				},
				offset = {
					-75,
					13,
					4
				}
			},
			middle_selected = {
				point_sample = true,
				horizontal_alignment = "right",
				texture_size = {
					125,
					18
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-75,
					13,
					4
				}
			},
			background = {
				masked = true,
				horizontal_alignment = "right",
				texture_size = {
					OFFSET_SIZE + 250,
					105
				},
				texture_tiling_size = {
					68,
					105
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					-2,
					-10
				}
			},
			selected_texture = {
				color = {
					0,
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
			managing_header = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				font_size = font_style.font_size,
				font_type = font_style.font_type,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					managing_header_offset - OFFSET_SIZE,
					-17,
					4
				}
			},
			managing_header_shadow = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				font_size = font_style.font_size,
				font_type = font_style.font_type,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					(managing_header_offset + 2) - OFFSET_SIZE,
					-19,
					3
				}
			},
			playing_header = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				font_size = font_style.font_size,
				font_type = font_style.font_type,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					playing_header_offset - OFFSET_SIZE,
					-47,
					4
				}
			},
			playing_header_shadow = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				font_size = font_style.font_size,
				font_type = font_style.font_type,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					(playing_header_offset + 2) - OFFSET_SIZE,
					-49,
					3
				}
			},
			managing_career = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				font_size = font_style.font_size,
				font_type = font_style.font_type,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					(career_name_offset + 5) - OFFSET_SIZE,
					-17,
					4
				}
			},
			managing_career_shadow = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				font_size = font_style.font_size,
				font_type = font_style.font_type,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					(career_name_offset + 5 + 2) - OFFSET_SIZE,
					-19,
					3
				}
			},
			playing_career = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				font_size = font_style.font_size,
				font_type = font_style.font_type,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					(career_name_offset + 5) - OFFSET_SIZE,
					-47,
					4
				}
			},
			playing_career_shadow = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				font_size = font_style.font_size,
				font_type = font_style.font_type,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					(career_name_offset + 5 + 2) - OFFSET_SIZE,
					-49,
					3
				}
			}
		},
		offset = {
			0,
			3,
			1
		}
	}

	return widget
end

local widgets = {
	system_button = {
		scenegraph_id = "system_button",
		element = {
			passes = {
				{
					style_id = "button_hotspot",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id"
				},
				{
					pass_type = "texture",
					style_id = "selected_texture",
					texture_id = "selected_texture"
				}
			}
		},
		content = {
			selected_texture = "console_menu_system_highlight",
			texture_id = "console_menu_system",
			button_hotspot = {}
		},
		style = {
			button_hotspot = {
				size = {
					220,
					90
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					17,
					24,
					0
				}
			},
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
			},
			selected_texture = {
				color = {
					0,
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
		},
		offset = {
			0,
			0,
			0
		}
	},
	panel_input_area_1 = UIWidgets.create_simple_texture("xbone_button_icon_lt", "panel_input_area_1"),
	panel_input_area_2 = UIWidgets.create_simple_texture("xbone_button_icon_rt", "panel_input_area_2"),
	panel = UIWidgets.create_simple_texture("menu_panel_bg", "panel", nil, nil, panel_color),
	panel_edge = UIWidgets.create_tiled_texture("panel_edge", "menu_frame_04_divider", {
		1920,
		4
	}),
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
	preorder_text = UIWidgets.create_simple_text(Localize("preorder_now"), "preorder_text", nil, nil, preorder_text_style),
	preorder_divider = UIWidgets.create_simple_texture("divider_01_top", "preorder_divider"),
	preorder_divider_top = UIWidgets.create_simple_texture("divider_01_bottom", "preorder_divider_top"),
	preorder_divider_effect = UIWidgets.create_simple_texture("play_button_frame_glow", "preorder_divider_effect", nil, nil, Colors.get_color_table_with_alpha("light_sky_blue", 255)),
	preorder_divider_top_effect = UIWidgets.create_simple_uv_texture("play_button_frame_glow", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "preorder_divider_top_effect", nil, nil, Colors.get_color_table_with_alpha("light_sky_blue", 255)),
	preorder_input = UIWidgets.create_simple_texture("xbone_button_icon_show_large", "preorder_input"),
	preorder_text_bg = UIWidgets.create_simple_texture("bg_center_fade", "preorder_text_bg", nil, nil, panel_color),
	back_button = UIWidgets.create_layout_button("back_button", "layout_button_back", "layout_button_back_glow", {
		0,
		0,
		100
	}),
	close_button = UIWidgets.create_layout_button("close_button", "layout_button_close", "layout_button_close_glow", {
		0,
		0,
		100
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
	},
	bot_info_enter = {
		{
			name = "bot_fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local widget = widgets.bot_customization_button
				widget.content.progress = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	bot_info_exit = {
		{
			name = "bot_fade_out",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local widget = widgets.bot_customization_button
				widget.content.progress = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}

return {
	widgets = widgets,
	create_bot_cusomization_button = create_bot_cusomization_button,
	title_button_definitions = title_button_definitions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
