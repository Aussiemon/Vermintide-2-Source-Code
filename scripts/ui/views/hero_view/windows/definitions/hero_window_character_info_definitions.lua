-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_character_info_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_size = window_default_settings.size
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	portrait_root = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			-100,
			70,
			5,
		},
	},
	divider_1 = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			2,
			61,
		},
		position = {
			-180,
			0,
			1,
		},
	},
	divider_2 = {
		horizontal_alignment = "right",
		parent = "divider_1",
		vertical_alignment = "bottom",
		size = {
			2,
			61,
		},
		position = {
			-0,
			60,
			1,
		},
	},
	experience_bar_bg = {
		horizontal_alignment = "right",
		parent = "divider_1",
		vertical_alignment = "bottom",
		size = {
			144,
			8,
		},
		position = {
			-20,
			14,
			1,
		},
	},
	experience_bar = {
		horizontal_alignment = "left",
		parent = "experience_bar_bg",
		vertical_alignment = "bottom",
		size = {
			144,
			8,
		},
		position = {
			0,
			0,
			2,
		},
	},
	experience_bar_edge = {
		horizontal_alignment = "right",
		parent = "experience_bar",
		vertical_alignment = "center",
		size = {
			8,
			8,
		},
		position = {
			8,
			0,
			3,
		},
	},
	level_text = {
		horizontal_alignment = "left",
		parent = "experience_bar_bg",
		vertical_alignment = "bottom",
		size = {
			144,
			0,
		},
		position = {
			0,
			10,
			5,
		},
	},
	career_name = {
		horizontal_alignment = "right",
		parent = "divider_2",
		vertical_alignment = "bottom",
		size = {
			350,
			0,
		},
		position = {
			-20,
			18,
			1,
		},
	},
	hero_name = {
		horizontal_alignment = "right",
		parent = "divider_2",
		vertical_alignment = "bottom",
		size = {
			350,
			0,
		},
		position = {
			-20,
			46,
			1,
		},
	},
}
local career_name_style = {
	dynamic_font_size = true,
	font_size = 30,
	font_type = "hell_shark_header",
	horizontal_alignment = "right",
	localize = true,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local hero_name_style = {
	dynamic_font_size = true,
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "right",
	localize = true,
	use_shadow = true,
	vertical_alignment = "center",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local power_title_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = true,
	use_shadow = true,
	vertical_alignment = "bottom",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local level_text_style = {
	dynamic_font_size = true,
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	use_shadow = true,
	vertical_alignment = "bottom",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2,
	},
}

local function create_window_divider(scenegraph_id, size)
	local widget = {
		element = {
			passes = {
				{
					pass_type = "tiled_texture",
					style_id = "bottom_edge",
					texture_id = "bottom_edge",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_left",
					texture_id = "edge_holder_left",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_right",
					texture_id = "edge_holder_right",
				},
			},
		},
		content = {
			bottom_edge = "menu_frame_09_divider",
			edge_holder_left = "menu_frame_09_divider_left",
			edge_holder_right = "menu_frame_09_divider_right",
		},
		style = {
			bottom_edge = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					5,
					0,
					6,
				},
				size = {
					size[1] - 10,
					5,
				},
				texture_tiling_size = {
					1,
					5,
				},
			},
			edge_holder_left = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					3,
					-6,
					10,
				},
				size = {
					9,
					17,
				},
			},
			edge_holder_right = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - 12,
					-6,
					10,
				},
				size = {
					9,
					17,
				},
			},
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
	}

	return widget
end

local widgets = {
	divider_1 = UIWidgets.create_simple_uv_texture("menu_divider", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "divider_1", nil, nil),
	divider_2 = UIWidgets.create_simple_texture("menu_divider", "divider_2", nil, nil, {
		255,
		255,
		255,
		255,
	}),
	experience_bar_bg = UIWidgets.create_simple_rect("experience_bar_bg", {
		255,
		10,
		10,
		10,
	}),
	experience_bar_edge = UIWidgets.create_simple_texture("experience_bar_edge_glow", "experience_bar_edge"),
	experience_bar = UIWidgets.create_simple_uv_texture("experience_bar_fill", {
		{
			0,
			0,
		},
		{
			1,
			1,
		},
	}, "experience_bar"),
	career_name = UIWidgets.create_simple_text("n/a", "career_name", 22, nil, career_name_style),
	hero_name = UIWidgets.create_simple_text("n/a", "hero_name", 22, nil, hero_name_style),
	level_text = UIWidgets.create_simple_text("n/a", "level_text", 22, nil, level_text_style),
}
local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.3,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	on_exit = {
		{
			end_progress = 0.3,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	widgets = widgets,
	node_widgets = node_widgets,
	category_settings = category_settings,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
