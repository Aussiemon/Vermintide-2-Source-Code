local window_default_settings = UISettings.game_start_windows
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_spacing = window_default_settings.spacing
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_text_width = window_size[1] - (window_frame_width * 2 + 60)
local large_window_size = {
	window_size[1] * 2 + window_spacing,
	window_size[2]
}
local info_window_size = {
	window_size[1],
	window_size[2]
}
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local modifier_info_size = {
	large_window_size[1] - 50,
	200
}
local modifier_info_panel_offset = {
	0,
	-50,
	0
}
local padding = {
	20,
	0
}
local modifier_info_panel_size = {
	modifier_info_size[1] + modifier_info_panel_offset[1] - padding[1],
	modifier_info_size[2] + modifier_info_panel_offset[2] - padding[2]
}
local modifier_info_panel_pos = {
	0 + modifier_info_panel_offset[1],
	0 + modifier_info_panel_offset[2],
	2 + modifier_info_panel_offset[3]
}
local journey_widget_settings = {
	width = 180,
	spacing_x = 50
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
		},
		{
			name = "animate_in_window",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				ui_scenegraph.window.local_position[1] = scenegraph_definition.window.position[1] + math.floor(-100 * (1 - anim_progress))
				ui_scenegraph.info_window.local_position[1] = scenegraph_definition.info_window.position[1] + math.floor(-80 * (1 - anim_progress))
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
	window = {
		vertical_alignment = "center",
		parent = "area_left",
		horizontal_alignment = "left",
		size = large_window_size,
		position = {
			100,
			0,
			1
		}
	},
	window_background = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			large_window_size[1],
			770
		},
		position = {
			0,
			0,
			0
		}
	},
	info_window = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "right",
		size = window_size,
		position = {
			info_window_size[1] + 25,
			0,
			1
		}
	},
	level_root_node = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			210,
			0,
			10
		}
	},
	end_level_root_node = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			90,
			0,
			10
		}
	},
	title_divider = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			large_window_size[1],
			0
		},
		position = {
			0,
			768,
			14
		}
	},
	mission_selection_title = {
		vertical_alignment = "bottom",
		parent = "title_divider",
		horizontal_alignment = "center",
		size = {
			large_window_size[1],
			52
		},
		position = {
			0,
			0,
			1
		}
	},
	modifier_timer = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			512,
			100
		},
		position = {
			0,
			0,
			2
		}
	},
	modifier_info = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = modifier_info_size,
		position = {
			0,
			0,
			2
		}
	},
	modifier_info_god = {
		vertical_alignment = "top",
		parent = "modifier_info",
		horizontal_alignment = "center",
		size = modifier_info_panel_size,
		position = modifier_info_panel_pos
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
			0,
			1
		}
	},
	locked_text = {
		vertical_alignment = "bottom",
		parent = "info_window",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			100
		},
		position = {
			0,
			40,
			1
		}
	},
	level_texture_frame = {
		vertical_alignment = "top",
		parent = "info_window",
		horizontal_alignment = "center",
		size = {
			180,
			180
		},
		position = {
			0,
			-103,
			2
		}
	},
	level_texture = {
		vertical_alignment = "center",
		parent = "level_texture_frame",
		horizontal_alignment = "center",
		size = {
			168,
			168
		},
		position = {
			0,
			0,
			-1
		}
	},
	level_texture_lock = {
		vertical_alignment = "center",
		parent = "level_texture_frame",
		horizontal_alignment = "center",
		size = {
			146,
			146
		},
		position = {
			0,
			0,
			1
		}
	},
	level_title_divider = {
		vertical_alignment = "bottom",
		parent = "level_texture_frame",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			-90,
			1
		}
	},
	level_title = {
		vertical_alignment = "bottom",
		parent = "level_title_divider",
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
	helper_text = {
		vertical_alignment = "bottom",
		parent = "level_title_divider",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			50
		},
		position = {
			0,
			-50,
			1
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
local level_text_style = {
	font_size = 36,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local helper_text_style = {
	font_size = 36,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local locked_level_text_style = {
	font_size = 22,
	horizontal_alignment = "center",
	localize = false,
	word_wrap = true,
	use_shadow = true,
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("red", 255),
	offset = {
		0,
		0,
		0
	}
}

local function create_modifier_timer_widget(scenegraph_id)
	return {
		element = {
			passes = {
				{
					retained_mode = false,
					style_id = "title",
					pass_type = "text",
					text_id = "title"
				},
				{
					retained_mode = false,
					style_id = "time_text",
					pass_type = "text",
					text_id = "time_text"
				}
			}
		},
		content = {
			time_text = "3 days, 23h 03m",
			title = "deus_start_game_mod_timer_title"
		},
		style = {
			title = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				localize = true,
				font_size = 42,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					-5,
					1
				}
			},
			time_text = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				localize = false,
				font_size = 32,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					5,
					1
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_modifier_info_panel(scenegraph_id)
	local spacing_y = 10
	local title_font_size = 32
	local icon_size = {
		50,
		50
	}
	local icon_offset = {
		0,
		40,
		0
	}
	local title_offset = {
		0,
		-spacing_y - icon_size[2] + icon_offset[2],
		0
	}
	local desc_offset = {
		0,
		-spacing_y - title_font_size + title_offset[2],
		0
	}

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						return content.icon ~= nil
					end
				},
				{
					retained_mode = false,
					style_id = "title",
					pass_type = "text",
					text_id = "title"
				},
				{
					retained_mode = false,
					style_id = "description",
					pass_type = "text",
					text_id = "description"
				}
			}
		},
		content = {
			description = "",
			title = ""
		},
		style = {
			icon = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				texture_size = icon_size,
				offset = icon_offset,
				color = Colors.get_color_table_with_alpha("white", 255)
			},
			title = {
				upper_case = true,
				localize = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				font_size = title_font_size,
				offset = title_offset
			},
			description = {
				horizontal_alignment = "center",
				font_size = 18,
				localize = false,
				word_wrap = true,
				vertical_alignment = "top",
				dynamic_font_size = false,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = desc_offset
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_modifier_info_widget(scenegraph_id)
	local frame_settings = UIFrameSettings.frame_outer_fade_01
	local edge_height = frame_settings.texture_sizes.horizontal[2]
	local size = scenegraph_definition[scenegraph_id].size
	local frame_size = {
		size[1] + edge_height * 2,
		size[2] + edge_height * 2
	}

	return {
		element = {
			passes = {
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame"
				},
				{
					style_id = "rect",
					pass_type = "rect",
					retained_mode = false
				}
			}
		},
		content = {
			title = "deus_start_game_mod_info_title",
			frame = frame_settings.texture
		},
		style = {
			frame = {
				color = Colors.get_color_table_with_alpha("console_menu_rect", 128),
				size = frame_size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				offset = {
					-edge_height,
					-edge_height,
					0
				}
			},
			rect = {
				color = Colors.get_color_table_with_alpha("console_menu_rect", 128),
				offset = {
					0,
					0,
					0
				}
			},
			title = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				localize = true,
				font_size = 22,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					-10,
					0,
					1
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_level_widget(i, specific_scenegraph_id)
	local scenegraph_id = specific_scenegraph_id
	local size = {
		180,
		180
	}

	if not scenegraph_id then
		scenegraph_id = "level_root_" .. i
		scenegraph_definition[scenegraph_id] = {
			vertical_alignment = "center",
			parent = "level_root_node",
			horizontal_alignment = "center",
			size = size,
			position = {
				0,
				0,
				1
			}
		}
	end

	local widget = {
		element = {}
	}
	local passes = {
		{
			style_id = "icon",
			pass_type = "hotspot",
			content_id = "button_hotspot",
			content_check_function = function (content)
				return not content.parent.locked
			end
		},
		{
			style_id = "icon",
			pass_type = "level_tooltip",
			level_id = "level_data",
			content_check_function = function (content)
				return content.button_hotspot.is_hover
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_glow",
			texture_id = "icon_glow"
		},
		{
			pass_type = "texture",
			style_id = "icon_unlock_guidance_glow",
			texture_id = "icon_unlock_guidance_glow"
		},
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon",
			content_check_function = function (content)
				return not content.locked
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_locked",
			texture_id = "icon",
			content_check_function = function (content)
				return content.locked
			end
		},
		{
			pass_type = "texture",
			style_id = "lock",
			texture_id = "lock",
			content_check_function = function (content)
				return content.locked
			end
		},
		{
			pass_type = "texture",
			style_id = "lock_fade",
			texture_id = "lock_fade",
			content_check_function = function (content)
				return content.locked
			end
		},
		{
			pass_type = "texture",
			style_id = "frame",
			texture_id = "frame"
		},
		{
			pass_type = "rotated_texture",
			style_id = "path",
			texture_id = "path",
			content_check_function = function (content)
				return content.draw_path
			end
		},
		{
			pass_type = "rotated_texture",
			style_id = "path_glow",
			texture_id = "path_glow",
			content_check_function = function (content)
				return content.draw_path and content.draw_path_fill and not content.locked
			end
		},
		{
			pass_type = "texture",
			style_id = "chaos_symbol",
			texture_id = "chaos_symbol",
			content_check_function = function (content)
				return content.draw_chaos_symbol
			end
		},
		{
			pass_type = "texture",
			style_id = "theme_icon",
			texture_id = "theme_icon",
			content_check_function = function (content)
				return content.theme_icon ~= nil
			end
		}
	}
	local content = {
		frame = "map_frame_00",
		locked = true,
		lock = "map_frame_lock",
		draw_path = false,
		path_glow = "mission_select_screen_trail_fill",
		draw_path_fill = false,
		path = "mission_select_screen_trail",
		icon_glow = "map_frame_glow_02",
		icon_unlock_guidance_glow = "map_frame_glow_03",
		chaos_symbol = "map_frame_chaos_slot_01",
		lock_fade = "map_frame_fade",
		icon = "level_icon_01",
		draw_chaos_symbol = true,
		button_hotspot = {}
	}
	local style = {
		path = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			angle = 0,
			pivot = {
				0,
				6.5
			},
			texture_size = {
				216,
				13
			},
			offset = {
				size[1] / 2,
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
		path_glow = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			angle = 0,
			pivot = {
				0,
				21.5
			},
			texture_size = {
				216,
				43
			},
			offset = {
				size[1] / 2,
				0,
				2
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		frame = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				180,
				180
			},
			offset = {
				0,
				0,
				6
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		lock = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				180,
				180
			},
			offset = {
				0,
				0,
				9
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		lock_fade = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				180,
				180
			},
			offset = {
				0,
				0,
				5
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				168,
				168
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
				3
			}
		},
		icon_locked = {
			vertical_alignment = "center",
			saturated = true,
			horizontal_alignment = "center",
			texture_size = {
				168,
				168
			},
			color = {
				255,
				100,
				100,
				100
			},
			offset = {
				0,
				0,
				3
			}
		},
		icon_glow = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				270,
				270
			},
			offset = {
				0,
				0,
				4
			},
			color = {
				0,
				255,
				255,
				255
			}
		},
		icon_unlock_guidance_glow = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				180,
				180
			},
			offset = {
				0,
				0,
				7
			},
			color = {
				0,
				255,
				255,
				255
			}
		},
		chaos_symbol = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				110,
				110
			},
			offset = {
				0,
				90,
				8
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		theme_icon = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				50,
				50
			},
			offset = {
				0,
				90,
				8
			},
			color = {
				255,
				255,
				255,
				255
			}
		}
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local widgets = {
	level_title = UIWidgets.create_simple_text("level_title", "level_title", nil, nil, level_text_style),
	selected_level = create_level_widget(nil, "level_texture_frame"),
	level_title_divider = UIWidgets.create_simple_texture("divider_01_top", "level_title_divider"),
	description_text = UIWidgets.create_simple_text("", "description_text", nil, nil, description_text_style),
	helper_text = UIWidgets.create_simple_text(Localize("tutorial_map"), "helper_text", nil, nil, helper_text_style),
	description_background = UIWidgets.create_rect_with_outer_frame("info_window", scenegraph_definition.info_window.size, "frame_outer_fade_02", nil, UISettings.console_start_game_menu_rect_color),
	locked_text = UIWidgets.create_simple_text("", "locked_text", nil, nil, locked_level_text_style),
	modifier_timer = create_modifier_timer_widget("modifier_timer"),
	modifier_info = create_modifier_info_widget("modifier_info"),
	modifier_info_god = create_modifier_info_panel("modifier_info_god")
}
local node_widgets = {}

for i = 1, 20 do
	node_widgets[i] = create_level_widget(i)
end

return {
	widgets = widgets,
	node_widgets = node_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	large_window_size = large_window_size,
	journey_widget_settings = journey_widget_settings
}
