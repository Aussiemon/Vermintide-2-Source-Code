local window_default_settings = UISettings.game_start_windows
local window_size = window_default_settings.size
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	divider = {
		vertical_alignment = "top",
		parent = "area_left",
		horizontal_alignment = "left",
		size = {
			489,
			137
		},
		position = {
			50,
			-13,
			1
		}
	},
	divider_detail_1 = {
		vertical_alignment = "center",
		parent = "divider",
		horizontal_alignment = "left",
		size = {
			55,
			59
		},
		position = {
			51,
			-4,
			1
		}
	},
	divider_detail_2 = {
		vertical_alignment = "center",
		parent = "divider",
		horizontal_alignment = "left",
		size = {
			494,
			138
		},
		position = {
			-12,
			44,
			-1
		}
	},
	hero_power_number = {
		vertical_alignment = "top",
		parent = "divider",
		horizontal_alignment = "left",
		size = {
			500,
			120
		},
		position = {
			164,
			26,
			1
		}
	},
	hero_power_text = {
		vertical_alignment = "center",
		parent = "divider",
		horizontal_alignment = "left",
		size = {
			500,
			40
		},
		position = {
			170,
			-24,
			1
		}
	}
}
local hero_power_number_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 102,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local hero_power_text_style = {
	font_size = 28,
	upper_case = false,
	localize = true,
	use_shadow = true,
	horizontal_alignment = "left",
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
	hero_power_tooltip = {
		scenegraph_id = "divider",
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
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
			effect = {
				vertical_alignment = "top",
				angle = 0,
				horizontal_alignment = "left",
				offset = {
					40,
					40,
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
	divider = UIWidgets.create_simple_texture("hero_power_bg_console", "divider"),
	divider_detail_1 = UIWidgets.create_simple_texture("hero_power_eyes_console", "divider_detail_1"),
	divider_detail_2 = UIWidgets.create_simple_texture("hero_power_glow_console", "divider_detail_2", nil, nil, Colors.get_color_table_with_alpha("font_title", 255)),
	power_text = UIWidgets.create_simple_text("10", "hero_power_number", nil, nil, hero_power_number_style),
	power_title = UIWidgets.create_simple_text("hero_power_header", "hero_power_text", nil, nil, hero_power_text_style)
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
	category_settings = category_settings,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
