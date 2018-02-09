local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_spacing = window_default_settings.spacing
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_width_offset = window_size[1]*2 + window_spacing*2
local window_text_width = window_size[1] - (window_frame_width*2 + 60)
local difficulty_option_size = {
	1020,
	200
}
local large_window_size = {
	window_size[1]*2 + window_spacing,
	window_size[2]
}
local info_window_size = {
	window_size[1],
	window_size[2]
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
		size = large_window_size,
		position = {
			window_size[1]/2 + window_spacing/2,
			0,
			1
		}
	},
	info_window = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "right",
		size = window_size,
		position = {
			info_window_size[1] + window_spacing,
			0,
			1
		}
	},
	act_root_node = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			large_window_size[1],
			256
		},
		position = {
			0,
			-24,
			1
		}
	},
	level_root_node = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			-44,
			10
		}
	},
	description_text = {
		vertical_alignment = "bottom",
		parent = "info_window",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			window_size[2]/2
		},
		position = {
			0,
			0,
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
local widgets = {
	background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "info_window"),
	background_mask = UIWidgets.create_simple_texture("mask_rect", "info_window"),
	info_window = UIWidgets.create_frame("info_window", window_size, window_frame, 10),
	window = UIWidgets.create_frame("window", large_window_size, window_frame, 10),
	level_title = UIWidgets.create_simple_text("level_title", "level_title", nil, nil, level_text_style),
	level_texture = UIWidgets.create_simple_texture("level_icon_01", "level_texture"),
	level_texture_lock = UIWidgets.create_simple_texture("map_frame_lock", "level_texture_lock"),
	level_texture_frame = UIWidgets.create_simple_texture("map_frame_00", "level_texture_frame", nil, nil, nil, 1),
	level_title_divider = UIWidgets.create_simple_texture("divider_01_top", "level_title_divider"),
	description_text = UIWidgets.create_simple_text("", "description_text", nil, nil, description_text_style),
	helper_text = UIWidgets.create_simple_text("Select a mission to play", "helper_text", nil, nil, helper_text_style),
	select_button = UIWidgets.create_default_button("select_button", scenegraph_definition.select_button.size, nil, nil, Localize("menu_select"), 32)
}

local function create_level_widget(i)
	local scenegraph_id = "level_root_" .. i
	local size = {
		180,
		180
	}
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
	local widget = {
		element = {}
	}
	local passes = {
		{
			style_id = "button_hotspot",
			pass_type = "hotspot",
			content_id = "button_hotspot",
			content_check_function = function (content)
				return not content.parent.locked
			end
		},
		{
			style_id = "tooltip",
			pass_type = "level_tooltip",
			level_id = "level_data",
			content_check_function = function (content)
				return content.button_hotspot.is_hover
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_glow",
			texture_id = "icon_glow",
			content_check_function = function (content)
				return content.button_hotspot.is_hover or content.button_hotspot.is_selected
			end
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
			pass_type = "texture",
			style_id = "glass",
			texture_id = "glass"
		}
	}
	local content = {
		glass = "act_presentation_fg_glass",
		locked = true,
		lock = "map_frame_lock",
		icon_glow = "map_frame_glow",
		frame = "map_frame_00",
		icon = "level_icon_01",
		lock_fade = "map_frame_fade",
		button_hotspot = {}
	}
	local style = {
		tooltip = {
			offset = {
				0,
				0,
				0
			},
			color = {
				255,
				255,
				0,
				0
			}
		},
		button_hotspot = {
			offset = {
				0,
				0,
				0
			},
			color = {
				200,
				255,
				0,
				0
			}
		},
		glass = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				216,
				216
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
		frame = {
			offset = {
				0,
				0,
				4
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
				6
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
				3
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
				1
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
				1
			}
		},
		icon_glow = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				318,
				318
			},
			offset = {
				0,
				0,
				0
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

local function create_act_widget(optional_texture_version)
	local texture_version = optional_texture_version or "09"
	local scenegraph_id = "act_root_node"
	local size = scenegraph_definition[scenegraph_id].size
	local widget = {
		element = {}
	}
	local passes = {
		{
			style_id = "text",
			pass_type = "text",
			text_id = "text"
		},
		{
			style_id = "text_shadow",
			pass_type = "text",
			text_id = "text"
		},
		{
			pass_type = "texture",
			style_id = "background",
			texture_id = "background"
		},
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
		},
		{
			pass_type = "texture",
			style_id = "title_bg",
			texture_id = "title_bg"
		},
		{
			pass_type = "texture",
			style_id = "title_edge",
			texture_id = "title_edge"
		}
	}
	local content = {
		text = "title_text",
		title_edge = "game_option_divider",
		background = "map_bg_image_03",
		title_bg = "playername_bg_02",
		edge_holder_left = "menu_frame_" .. texture_version .. "_divider_left",
		edge_holder_right = "menu_frame_" .. texture_version .. "_divider_right",
		bottom_edge = "menu_frame_" .. texture_version .. "_divider"
	}
	local style = {
		text = {
			vertical_alignment = "top",
			upper_case = true,
			localize = false,
			horizontal_alignment = "left",
			font_size = 28,
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				16,
				-5,
				10
			}
		},
		text_shadow = {
			vertical_alignment = "top",
			upper_case = true,
			localize = false,
			horizontal_alignment = "left",
			font_size = 28,
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				18,
				-7,
				9
			}
		},
		background = {
			offset = {
				0,
				0,
				0
			},
			color = {
				255,
				100,
				100,
				100
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
				size[2] - 4,
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
				size[2] - 10,
				15
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
				size[2] - 10,
				15
			},
			size = {
				9,
				17
			}
		},
		title_bg = {
			size = {
				size[1]/2,
				40
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				size[2] - 40,
				2
			}
		},
		title_edge = {
			size = {
				size[1]/2,
				5
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				size[2] - 40,
				4
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

local node_widgets = {}

for i = 1, 20, 1 do
	node_widgets[i] = create_level_widget(i)
end

local act_widgets = {}

for i = 1, 20, 1 do
	act_widgets[i] = create_act_widget()
end

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
				params.render_settings.alpha_multiplier = anim_progress - 1

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
	act_widgets = act_widgets,
	node_widgets = node_widgets,
	map_size = large_window_size,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
