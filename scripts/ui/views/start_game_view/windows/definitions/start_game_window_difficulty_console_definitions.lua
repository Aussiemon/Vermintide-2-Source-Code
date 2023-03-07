local window_default_settings = UISettings.game_start_windows
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_text_width = window_size[1] - (window_frame_width * 2 + 60)
local difficulty_option_size = {
	window_size[1],
	150
}
local difficulty_option_spacing = 0
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
				params.render_settings.alpha_multiplier = 1
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
		horizontal_alignment = "left",
		size = window_size,
		position = {
			220,
			0,
			1
		}
	},
	info_window = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			window_size[2]
		},
		position = {
			window_size[1] + 200,
			50,
			1
		}
	},
	background = {
		vertical_alignment = "top",
		parent = "info_window",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			800
		},
		position = {
			0,
			-45,
			0
		}
	},
	difficulty_root = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			-80,
			-window_frame_height / 2,
			1
		}
	},
	difficulty_option = {
		vertical_alignment = "top",
		parent = "difficulty_root",
		horizontal_alignment = "left",
		size = difficulty_option_size,
		position = {
			0,
			0,
			0
		}
	},
	difficulty_texture = {
		vertical_alignment = "top",
		parent = "background",
		horizontal_alignment = "center",
		size = {
			150,
			150
		},
		position = {
			0,
			-30,
			1
		}
	},
	difficulty_title = {
		vertical_alignment = "bottom",
		parent = "difficulty_texture",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			50
		},
		position = {
			0,
			-70,
			1
		}
	},
	difficulty_title_divider = {
		vertical_alignment = "top",
		parent = "difficulty_title",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			-50,
			1
		}
	},
	description_background = {
		vertical_alignment = "top",
		parent = "difficulty_title_divider",
		horizontal_alignment = "center",
		size = {
			264,
			200
		},
		position = {
			0,
			0,
			1
		}
	},
	description_text = {
		vertical_alignment = "center",
		parent = "description_background",
		horizontal_alignment = "center",
		size = {
			window_text_width + 40,
			120
		},
		position = {
			0,
			20,
			1
		}
	},
	difficulty_bottom_divider = {
		vertical_alignment = "bottom",
		parent = "description_background",
		horizontal_alignment = "center",
		size = {
			264,
			21
		},
		position = {
			0,
			0,
			1
		}
	},
	warning_bg = {
		vertical_alignment = "bottom",
		parent = "description_background",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			100
		},
		position = {
			0,
			-100,
			1
		}
	},
	warning_texture = {
		vertical_alignment = "center",
		parent = "warning_bg",
		horizontal_alignment = "center",
		size = {
			485,
			103
		},
		position = {
			0,
			0,
			1
		}
	},
	requirement_bg = {
		vertical_alignment = "bottom",
		parent = "warning_bg",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			100
		},
		position = {
			0,
			-100,
			1
		}
	},
	buy_button = {
		vertical_alignment = "bottom",
		parent = "info_window",
		horizontal_alignment = "center",
		size = {
			477,
			91
		},
		position = {
			0,
			-10,
			40
		}
	},
	difficulty_chest_info = {
		vertical_alignment = "bottom",
		parent = "description_background",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			20
		},
		position = {
			0,
			30,
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
			-55,
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
			-30,
			0
		}
	},
	title_button_start = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			800,
			30
		},
		position = {
			0,
			-70,
			1
		}
	}
}
local extreme_difficulty_text_style = {
	word_wrap = false,
	upper_case = true,
	localize = false,
	font_size = 26,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = {
		255,
		246,
		56,
		53
	},
	offset = {
		0,
		0,
		2
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
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
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
	text_color = {
		255,
		250,
		250,
		250
	},
	offset = {
		0,
		0,
		2
	}
}
local difficulty_xp_multiplier_style = {
	font_size = 22,
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
	font_size = 18,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = {
		255,
		199,
		199,
		199
	},
	offset = {
		0,
		-30,
		2
	}
}
local difficulty_second_lock_text_style = {
	font_size = 18,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = false,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	dynamic_font_size = true,
	font_type = "hell_shark",
	text_color = {
		255,
		199,
		199,
		199
	},
	offset = {
		0,
		-60,
		2
	}
}
local difficulty_is_locked_text_style = {
	font_size = 20,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = {
		255,
		220,
		148,
		64
	},
	offset = {
		0,
		0,
		2
	}
}
local dlc_is_locked_text_style = {
	font_size = 20,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = {
		255,
		193,
		90,
		36
	},
	offset = {
		0,
		25,
		2
	}
}

local function create_difficulty_button(scenegraph_id, button_size)
	local texture_scale = 0.8
	local icon_texture = "difficulty_option_1"
	local icon_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(icon_texture)
	local icon_texture_size = {
		math.floor(icon_texture_settings.size[1] * texture_scale),
		math.floor(icon_texture_settings.size[2] * texture_scale)
	}
	local frame_size = {
		math.floor(180 * texture_scale),
		math.floor(180 * texture_scale)
	}
	local frame_glow_size = {
		math.floor(270 * texture_scale),
		math.floor(270 * texture_scale)
	}
	local background_size = {
		math.floor(414),
		math.floor(118 * texture_scale)
	}
	local background_offset = {
		frame_size[1] + 15,
		0,
		-2
	}
	local title_text_offset = {
		background_offset[1] + 30,
		0,
		5
	}
	local passes = {}
	local content = {}
	local style = {}
	local hotspot_name = "button_hotspot"
	passes[#passes + 1] = {
		pass_type = "hotspot",
		content_id = hotspot_name
	}
	content[hotspot_name] = {}
	local background_name = "selection_background"
	passes[#passes + 1] = {
		pass_type = "texture_uv",
		content_id = background_name,
		style_id = background_name
	}
	content[background_name] = {
		texture_id = "item_slot_side_fade",
		uvs = {
			{
				0,
				0
			},
			{
				1,
				1
			}
		}
	}
	style[background_name] = {
		vertical_alignment = "center",
		horizontal_alignment = "left",
		texture_size = background_size,
		color = UISettings.console_start_game_menu_rect_color,
		offset = background_offset
	}
	local bg_effect_name = "bg_effect"
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = bg_effect_name,
		style_id = bg_effect_name,
		content_check_function = function (content)
			return content.is_selected
		end
	}
	style[bg_effect_name] = {
		vertical_alignment = "center",
		horizontal_alignment = "left",
		texture_size = {
			background_size[1],
			background_size[2] + 8
		},
		color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			background_offset[1],
			background_offset[2],
			background_offset[3] + 1
		}
	}
	content[bg_effect_name] = "item_slot_side_effect"
	local text_title_name = "text_title"
	local text_title_shadow_name = text_title_name .. "_shadow"
	passes[#passes + 1] = {
		pass_type = "text",
		text_id = text_title_name,
		style_id = text_title_name,
		content_change_function = function (content, style)
			if content.is_selected then
				style.text_color = style.selected_color
			else
				style.text_color = style.default_color
			end
		end
	}
	passes[#passes + 1] = {
		pass_type = "text",
		text_id = text_title_name,
		style_id = text_title_shadow_name
	}
	content[text_title_name] = "n/a"
	local title_text_style = {
		word_wrap = false,
		upper_case = true,
		localize = false,
		font_size = 42,
		horizontal_alignment = "left",
		vertical_alignment = "center",
		font_type = "hell_shark_header",
		text_color = Colors.get_color_table_with_alpha("font_title", 255),
		selected_color = Colors.get_color_table_with_alpha("white", 255),
		default_color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			title_text_offset[1],
			title_text_offset[2],
			title_text_offset[3]
		}
	}
	local title_text_shadow_style = table.clone(title_text_style)
	title_text_shadow_style.text_color = {
		255,
		0,
		0,
		0
	}
	title_text_shadow_style.offset = {
		title_text_offset[1] + 2,
		title_text_offset[2] - 2,
		title_text_offset[3] - 1
	}
	style[text_title_name] = title_text_style
	style[text_title_shadow_name] = title_text_shadow_style
	local icon_texture_name = "icon_texture"
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = icon_texture_name,
		texture_id = icon_texture_name,
		content_check_function = function (content, style)
			return content[icon_texture_name]
		end,
		content_change_function = function (content, style)
			if content.button_hotspot.disable_button then
				style.saturated = true
			else
				style.saturated = false
			end
		end
	}
	content[icon_texture_name] = icon_texture
	local icon_offset = {
		-(button_size[1] / 2) + 108,
		0,
		5
	}
	style[icon_texture_name] = {
		vertical_alignment = "center",
		horizontal_alignment = "center",
		texture_size = icon_texture_size,
		color = {
			255,
			255,
			255,
			255
		},
		offset = icon_offset
	}
	local icon_background_name = "icon_background"
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = icon_background_name,
		style_id = icon_background_name
	}
	content[icon_background_name] = "level_icon_09"
	style[icon_background_name] = {
		vertical_alignment = "center",
		horizontal_alignment = "center",
		texture_size = icon_texture_size,
		color = UISettings.console_start_game_menu_rect_color,
		offset = {
			icon_offset[1],
			icon_offset[2],
			icon_offset[3] - 3
		}
	}
	local icon_frame_texture_name = "icon_frame_texture"
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = icon_frame_texture_name,
		texture_id = icon_frame_texture_name,
		content_check_function = function (content, style)
			return content[icon_texture_name]
		end,
		content_change_function = function (content, style)
			if content.button_hotspot.disable_button then
				style.saturated = true
			else
				style.saturated = false
			end
		end
	}
	content[icon_frame_texture_name] = "map_frame_00"
	style[icon_frame_texture_name] = {
		vertical_alignment = "center",
		horizontal_alignment = "center",
		texture_size = frame_size,
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			icon_offset[1],
			icon_offset[2],
			icon_offset[3] - 1
		}
	}
	local icon_texture_glow_name = "icon_texture_glow"
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = icon_texture_glow_name,
		texture_id = icon_texture_glow_name,
		content_check_function = function (content)
			return content.is_selected
		end
	}
	content[icon_texture_glow_name] = "map_frame_glow_02"
	style[icon_texture_glow_name] = {
		vertical_alignment = "center",
		horizontal_alignment = "center",
		texture_size = frame_glow_size,
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			icon_offset[1],
			icon_offset[2],
			icon_offset[3] - 2
		}
	}
	local widget = {
		element = {
			passes = passes
		},
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

local function create_title_button(scenegraph_id, text, font_size, optional_offset, optional_horizontal_alignment)
	local shadow_offset = {
		2,
		-2,
		3
	}

	if optional_offset then
		shadow_offset[1] = shadow_offset[1] + optional_offset[1]
		shadow_offset[2] = shadow_offset[2] + optional_offset[2]
		shadow_offset[3] = optional_offset[3] - 1
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
				}
			}
		},
		content = {
			button_hotspot = {},
			text_field = text,
			default_font_size = font_size
		},
		style = {
			text = {
				word_wrap = false,
				upper_case = true,
				localize = false,
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = optional_offset or {
					0,
					0,
					4
				}
			},
			text_shadow = {
				word_wrap = false,
				upper_case = true,
				localize = false,
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = shadow_offset
			},
			text_hover = {
				word_wrap = false,
				upper_case = true,
				localize = false,
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = optional_offset or {
					0,
					0,
					4
				}
			},
			text_disabled = {
				word_wrap = false,
				upper_case = true,
				localize = false,
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("gray", 50),
				offset = optional_offset or {
					0,
					0,
					4
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

local title_button_definitions = {}
local num_buttons = 10

for i = 1, num_buttons do
	title_button_definitions[i] = create_title_button("title_button_start", "n/a", 32, nil, "center")
end

local widgets = {
	background = UIWidgets.create_rect_with_outer_frame("background", scenegraph_definition.background.size, "frame_outer_fade_02", nil, UISettings.console_start_game_menu_rect_color),
	difficulty_texture = UIWidgets.create_simple_texture("difficulty_option_1", "difficulty_texture"),
	difficulty_title = UIWidgets.create_simple_text(Localize("start_game_window_difficulty"), "difficulty_title", nil, nil, title_text_style),
	difficulty_title_divider = UIWidgets.create_simple_texture("divider_01_top", "difficulty_title_divider"),
	description_text = UIWidgets.create_simple_text(Localize("start_game_window_adventure_desc"), "description_text", nil, nil, description_text_style),
	difficulty_bottom_divider = UIWidgets.create_simple_texture("divider_01_bottom", "difficulty_bottom_divider"),
	extreme_difficulty_bg = UIWidgets.create_simple_texture("extreme_difficulty_bg", "warning_texture"),
	extremely_hard_text = UIWidgets.create_simple_text(Localize("difficulty_cataclysm_warning"), "warning_bg", nil, nil, extreme_difficulty_text_style),
	difficulty_chest_info = UIWidgets.create_simple_text("", "difficulty_chest_info", nil, nil, difficulty_chest_info_style),
	difficulty_lock_text = UIWidgets.create_simple_text("difficulty_lock_text", "requirement_bg", nil, nil, difficulty_lock_text_style),
	difficulty_second_lock_text = UIWidgets.create_simple_text("KIll all the lords on Legend Difficulty", "requirement_bg", nil, nil, difficulty_second_lock_text_style),
	difficulty_is_locked_text = UIWidgets.create_simple_text("Some people in your party do not meet the required Hero Power.", "requirement_bg", nil, nil, difficulty_is_locked_text_style),
	dlc_lock_text = UIWidgets.create_simple_text(Localize("cataclysm_no_wom"), "buy_button", nil, nil, dlc_is_locked_text_style),
	buy_button = create_buy_button("buy_button", scenegraph_definition.buy_button.size, nil, "wom_button", Localize("menu_weave_area_no_wom_button"), 32, nil, nil, nil, false)
}

return {
	widgets = widgets,
	title_button_definitions = title_button_definitions,
	create_difficulty_button = create_difficulty_button,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
