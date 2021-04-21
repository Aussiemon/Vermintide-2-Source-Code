local window_default_settings = UISettings.game_start_windows
local window_size = window_default_settings.size
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local game_option_size = {
	220,
	68
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
			1600,
			70
		},
		position = {
			70,
			0,
			1
		}
	},
	game_mode_option = {
		vertical_alignment = "top",
		parent = "panel_entry_area",
		horizontal_alignment = "left",
		size = game_option_size,
		position = {
			20,
			0,
			14
		}
	},
	panel_input_area_1 = {
		vertical_alignment = "center",
		parent = "game_mode_option",
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
		parent = "game_mode_option",
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
	}
}
local panel_color = UISettings.console_menu_rect_color
local widget_definitions = {
	panel_edge = UIWidgets.create_simple_texture("menu_frame_04_divider", "panel_edge"),
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

local function create_panel_button(scenegraph_id, size, text, font_size, optional_offset, optional_horizontal_alignment, highlight_color)
	local new_marker_offset = {
		-19,
		-25,
		10
	}
	local marker_offset = {
		0,
		-3,
		1
	}
	local selection_offset = {
		0,
		-4,
		0
	}
	local shadow_offset = {
		2,
		3,
		3
	}

	if optional_offset then
		shadow_offset[1] = shadow_offset[1] + optional_offset[1]
		shadow_offset[2] = shadow_offset[2] + optional_offset[2]
		shadow_offset[3] = optional_offset[3] - 1
		selection_offset[1] = selection_offset[1] + optional_offset[1]
		selection_offset[2] = selection_offset[2] + optional_offset[2]
		selection_offset[3] = optional_offset[3] - 3
		marker_offset[1] = marker_offset[1] + optional_offset[1]
		marker_offset[2] = marker_offset[2] + optional_offset[2]
		marker_offset[3] = optional_offset[3] - 2
		new_marker_offset[1] = new_marker_offset[1] + optional_offset[1]
		new_marker_offset[2] = new_marker_offset[2] + optional_offset[2]
		new_marker_offset[3] = optional_offset[3] - 2
	end

	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text_field"
				},
				{
					style_id = "text_hover",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						return not content.button_hotspot.disable_button and (content.button_hotspot.is_hover or content.button_hotspot.is_selected)
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						return not content.button_hotspot.disable_button and not content.button_hotspot.is_hover and not content.button_hotspot.is_selected
					end
				},
				{
					style_id = "text_disabled",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						return content.button_hotspot.disable_button
					end
				},
				{
					texture_id = "selected_texture",
					style_id = "selected_texture",
					pass_type = "texture",
					content_check_function = function (content)
						return not content.button_hotspot.disable_button
					end
				},
				{
					texture_id = "marker",
					style_id = "marker_left",
					pass_type = "texture"
				},
				{
					texture_id = "marker",
					style_id = "marker_right",
					pass_type = "texture"
				},
				{
					texture_id = "marker_highlight",
					style_id = "marker_highlight_left",
					pass_type = "texture",
					content_check_function = function (content)
						return content.button_hotspot.is_selected
					end
				},
				{
					texture_id = "marker_highlight",
					style_id = "marker_highlight_right",
					pass_type = "texture",
					content_check_function = function (content)
						return content.button_hotspot.is_selected
					end
				},
				{
					texture_id = "new_marker",
					style_id = "new_marker",
					pass_type = "texture",
					content_check_function = function (content)
						return content.new
					end
				}
			}
		},
		content = {
			marker = "morris_panel_divider",
			marker_highlight = "morris_panel_highlight",
			selected_texture = "hero_panel_selection_glow",
			new_marker = "list_item_tag_new",
			button_hotspot = {},
			text_field = text,
			default_font_size = font_size
		},
		style = {
			text = {
				word_wrap = false,
				upper_case = true,
				localize = true,
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_offset = optional_offset or {
					0,
					10,
					4
				},
				offset = optional_offset or {
					0,
					5,
					4
				},
				size = size
			},
			text_shadow = {
				word_wrap = false,
				upper_case = true,
				localize = true,
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_offset = shadow_offset,
				offset = shadow_offset,
				size = size
			},
			text_hover = {
				word_wrap = false,
				upper_case = true,
				localize = true,
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				default_offset = optional_offset or {
					0,
					10,
					4
				},
				offset = optional_offset or {
					0,
					5,
					4
				},
				size = size
			},
			text_disabled = {
				word_wrap = false,
				upper_case = true,
				localize = true,
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("gray", 50),
				default_offset = optional_offset or {
					0,
					10,
					4
				},
				offset = optional_offset or {
					0,
					5,
					4
				},
				size = size
			},
			selected_texture = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				texture_size = {
					169,
					35
				},
				color = highlight_color or Colors.get_color_table_with_alpha("font_title", 255),
				offset = selection_offset
			},
			marker_left = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				texture_size = {
					52,
					30
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					marker_offset[1] - 26,
					marker_offset[2],
					marker_offset[3]
				}
			},
			marker_right = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					52,
					30
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					marker_offset[1] + 26,
					marker_offset[2],
					marker_offset[3]
				}
			},
			marker_highlight_left = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				texture_size = {
					52,
					30
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					marker_offset[1] - 26,
					marker_offset[2],
					marker_offset[3] + 1
				}
			},
			marker_highlight_right = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					52,
					30
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					marker_offset[1] + 26,
					marker_offset[2],
					marker_offset[3] + 1
				}
			},
			new_marker = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					math.floor(88.19999999999999),
					math.floor(35.699999999999996)
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					new_marker_offset[1],
					new_marker_offset[2],
					new_marker_offset[3]
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

return {
	widget_definitions = widget_definitions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	create_panel_button = create_panel_button
}
