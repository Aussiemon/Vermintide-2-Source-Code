local window_default_settings = UISettings.game_start_windows
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_spacing = window_default_settings.spacing
local large_window_size = {
	window_size[1] * 3 + window_spacing * 2,
	window_size[2]
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
		size = large_window_size,
		position = {
			window_size[1] + window_spacing,
			0,
			1
		}
	},
	video = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = large_window_size,
		position = {
			0,
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
			1
		}
	},
	area_root = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			180,
			180
		},
		position = {
			0,
			-60,
			3
		}
	},
	title_divider = {
		vertical_alignment = "bottom",
		parent = "area_root",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			-160,
			1
		}
	},
	area_title = {
		vertical_alignment = "bottom",
		parent = "title_divider",
		horizontal_alignment = "center",
		size = {
			1200,
			50
		},
		position = {
			0,
			30,
			1
		}
	},
	description_text = {
		vertical_alignment = "top",
		parent = "title_divider",
		horizontal_alignment = "center",
		size = {
			800,
			150
		},
		position = {
			0,
			-50,
			1
		}
	},
	select_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			460,
			72
		},
		position = {
			0,
			120,
			20
		}
	},
	not_owned_text = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			800,
			50
		},
		position = {
			0,
			40,
			12
		}
	}
}
local not_owned_text_style = {
	word_wrap = true,
	upper_case = true,
	localize = true,
	use_shadow = true,
	font_size = 32,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("red", 255),
	offset = {
		0,
		0,
		3
	}
}
local description_text_style = {
	word_wrap = true,
	localize = false,
	font_size = 32,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	draw_text_rect = true,
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	rect_color = Colors.get_color_table_with_alpha("black", 150),
	offset = {
		0,
		0,
		3
	}
}
local level_text_style = {
	font_size = 72,
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

local function create_area_widget(i, specific_scenegraph_id)
	local scenegraph_id = specific_scenegraph_id
	local size = {
		180,
		180
	}

	if not scenegraph_id then
		scenegraph_id = "area_root_" .. i
		scenegraph_definition[scenegraph_id] = {
			vertical_alignment = "center",
			parent = "area_root",
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
			content_id = "button_hotspot"
		},
		{
			pass_type = "texture",
			style_id = "icon_glow",
			texture_id = "icon_glow"
		},
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon"
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
			style_id = "frame",
			texture_id = "frame"
		}
	}
	local content = {
		locked = true,
		frame = "map_frame_04",
		icon = "level_icon_01",
		lock = "hero_icon_locked",
		icon_glow = "map_frame_glow_02",
		button_hotspot = {}
	}
	local style = {
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
				76,
				87
			},
			offset = {
				64,
				-58,
				9
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
				0
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
				3
			},
			color = {
				0,
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

local disable_with_gamepad = true
local widgets = {
	window = UIWidgets.create_frame("window", large_window_size, window_frame, 10),
	window_fade = UIWidgets.create_simple_texture("options_window_fade_01", "window", nil, nil, nil, 2),
	background = UIWidgets.create_simple_rect("window", {
		255,
		0,
		0,
		0
	}),
	area_title = UIWidgets.create_simple_text("area_title", "area_title", nil, nil, level_text_style),
	title_divider = UIWidgets.create_simple_texture("divider_01_top", "title_divider"),
	description_text = UIWidgets.create_simple_text("description_text", "description_text", nil, nil, description_text_style),
	not_owned_text = UIWidgets.create_simple_text("dlc1_2_dlc_level_locked_tooltip", "not_owned_text", nil, nil, not_owned_text_style),
	select_button = UIWidgets.create_default_button("select_button", scenegraph_definition.select_button.size, nil, nil, Localize("menu_select"), 32, nil, nil, nil, disable_with_gamepad)
}
local area_widgets = {}

for i = 1, 10, 1 do
	area_widgets[i] = create_area_widget(i)
end

return {
	widgets = widgets,
	area_widgets = area_widgets,
	map_size = large_window_size,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
