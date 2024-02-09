-- chunkname: @scripts/ui/hud_ui/versus_slot_status_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local BANNER_LEFT_SIZE = {
	660,
	1080,
}
local BANNER_RIGHT_SIZE = {
	660,
	1080,
}
local MENU_BUTTON_SIZE = {
	370,
	70,
}
local MENU_BUTTON_FONT_SIZE = 24
local scenegraph_definition = {
	screen = {
		position = {
			0,
			0,
			UILayer.hud,
		},
		size = {
			SIZE_X,
			SIZE_Y,
		},
		scale = not IS_WINDOWS and "hud_fit" or "fit",
	},
	banner_left = {
		horizontal_alignment = "left",
		scale = "fit_height",
		position = {
			0,
			0,
			1,
		},
		size = BANNER_LEFT_SIZE,
	},
	banner_left_edge = {
		horizontal_alignment = "left",
		scale = "fit_height",
		position = {
			BANNER_LEFT_SIZE[1],
			0,
			1,
		},
		size = {
			5,
			BANNER_LEFT_SIZE[2],
		},
	},
	banner_right = {
		horizontal_alignment = "right",
		scale = "fit_height",
		position = {
			0,
			0,
			1,
		},
		size = BANNER_RIGHT_SIZE,
	},
	banner_right_edge = {
		horizontal_alignment = "right",
		scale = "fit_height",
		position = {
			-BANNER_LEFT_SIZE[1],
			0,
			1,
		},
		size = {
			5,
			BANNER_LEFT_SIZE[2],
		},
	},
	force_start_button = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = MENU_BUTTON_SIZE,
		position = {
			0,
			150,
			1,
		},
	},
	level_name = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			1600,
			60,
		},
		position = {
			0,
			-60,
			10,
		},
	},
	title_divider = {
		horizontal_alignment = "center",
		parent = "level_name",
		vertical_alignment = "center",
		size = {
			264,
			21,
		},
		position = {
			0,
			-60,
			0,
		},
	},
	sub_title = {
		horizontal_alignment = "center",
		parent = "title_divider",
		vertical_alignment = "center",
		size = {
			1600,
			60,
		},
		position = {
			0,
			-40,
			0,
		},
	},
	privacy_text = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			1900,
			30,
		},
		position = {
			-10,
			-10,
			10,
		},
	},
	player_list_input_description = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			1900,
			60,
		},
		position = {
			0,
			60,
			10,
		},
	},
	vs_text = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			500,
			50,
		},
		position = {
			0,
			0,
			10,
		},
	},
	team_1 = {
		horizontal_alignment = "left",
		parent = "banner_left",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			100,
			-300,
			10,
		},
	},
	team_1_name = {
		horizontal_alignment = "left",
		parent = "team_1",
		vertical_alignment = "top",
		size = {
			480,
			50,
		},
		position = {
			0,
			90,
			3,
		},
	},
	team_1_player_panel_1 = {
		horizontal_alignment = "left",
		parent = "team_1",
		vertical_alignment = "top",
		size = {
			480,
			100,
		},
		position = {
			0,
			0,
			10,
		},
	},
	team_1_player_panel_2 = {
		horizontal_alignment = "left",
		parent = "team_1",
		vertical_alignment = "top",
		size = {
			480,
			100,
		},
		position = {
			0,
			-150,
			10,
		},
	},
	team_1_player_panel_3 = {
		horizontal_alignment = "left",
		parent = "team_1",
		vertical_alignment = "top",
		size = {
			480,
			100,
		},
		position = {
			0,
			-300,
			10,
		},
	},
	team_1_player_panel_4 = {
		horizontal_alignment = "left",
		parent = "team_1",
		vertical_alignment = "top",
		size = {
			480,
			100,
		},
		position = {
			0,
			-450,
			10,
		},
	},
	team_1_player_frame_1 = {
		horizontal_alignment = "left",
		parent = "team_1_player_panel_1",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			63,
			69,
			3,
		},
	},
	team_1_player_frame_2 = {
		horizontal_alignment = "left",
		parent = "team_1_player_panel_2",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			63,
			69,
			3,
		},
	},
	team_1_player_frame_3 = {
		horizontal_alignment = "left",
		parent = "team_1_player_panel_3",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			63,
			69,
			3,
		},
	},
	team_1_player_frame_4 = {
		horizontal_alignment = "left",
		parent = "team_1_player_panel_4",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			63,
			69,
			3,
		},
	},
	team_1_player_ready_1 = {
		horizontal_alignment = "left",
		parent = "team_1_player_panel_1",
		vertical_alignment = "center",
		size = {
			50,
			55,
		},
		position = {
			-80,
			0,
			1,
		},
	},
	team_1_player_ready_2 = {
		horizontal_alignment = "left",
		parent = "team_1_player_panel_2",
		vertical_alignment = "center",
		size = {
			50,
			55,
		},
		position = {
			-80,
			0,
			1,
		},
	},
	team_1_player_ready_3 = {
		horizontal_alignment = "left",
		parent = "team_1_player_panel_3",
		vertical_alignment = "center",
		size = {
			50,
			55,
		},
		position = {
			-80,
			0,
			1,
		},
	},
	team_1_player_ready_4 = {
		horizontal_alignment = "left",
		parent = "team_1_player_panel_4",
		vertical_alignment = "center",
		size = {
			50,
			55,
		},
		position = {
			-80,
			0,
			1,
		},
	},
	team_2 = {
		horizontal_alignment = "right",
		parent = "banner_right",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			-100,
			-300,
			10,
		},
	},
	team_2_name = {
		horizontal_alignment = "right",
		parent = "team_2",
		vertical_alignment = "top",
		size = {
			480,
			50,
		},
		position = {
			0,
			90,
			3,
		},
	},
	team_2_player_panel_1 = {
		horizontal_alignment = "right",
		parent = "team_2",
		vertical_alignment = "top",
		size = {
			480,
			100,
		},
		position = {
			0,
			0,
			10,
		},
	},
	team_2_player_panel_2 = {
		horizontal_alignment = "right",
		parent = "team_2",
		vertical_alignment = "top",
		size = {
			480,
			100,
		},
		position = {
			0,
			-150,
			10,
		},
	},
	team_2_player_panel_3 = {
		horizontal_alignment = "right",
		parent = "team_2",
		vertical_alignment = "top",
		size = {
			480,
			100,
		},
		position = {
			0,
			-300,
			10,
		},
	},
	team_2_player_panel_4 = {
		horizontal_alignment = "right",
		parent = "team_2",
		vertical_alignment = "top",
		size = {
			480,
			100,
		},
		position = {
			0,
			-450,
			10,
		},
	},
	team_2_player_frame_1 = {
		horizontal_alignment = "left",
		parent = "team_2_player_panel_1",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			63,
			69,
			3,
		},
	},
	team_2_player_frame_2 = {
		horizontal_alignment = "left",
		parent = "team_2_player_panel_2",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			63,
			69,
			3,
		},
	},
	team_2_player_frame_3 = {
		horizontal_alignment = "left",
		parent = "team_2_player_panel_3",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			63,
			69,
			3,
		},
	},
	team_2_player_frame_4 = {
		horizontal_alignment = "left",
		parent = "team_2_player_panel_4",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			63,
			69,
			3,
		},
	},
	team_2_player_ready_1 = {
		horizontal_alignment = "right",
		parent = "team_2_player_panel_1",
		vertical_alignment = "center",
		size = {
			50,
			55,
		},
		position = {
			80,
			0,
			1,
		},
	},
	team_2_player_ready_2 = {
		horizontal_alignment = "right",
		parent = "team_2_player_panel_2",
		vertical_alignment = "center",
		size = {
			50,
			55,
		},
		position = {
			80,
			0,
			1,
		},
	},
	team_2_player_ready_3 = {
		horizontal_alignment = "right",
		parent = "team_2_player_panel_3",
		vertical_alignment = "center",
		size = {
			50,
			55,
		},
		position = {
			80,
			0,
			1,
		},
	},
	team_2_player_ready_4 = {
		horizontal_alignment = "right",
		parent = "team_2_player_panel_4",
		vertical_alignment = "center",
		size = {
			50,
			55,
		},
		position = {
			80,
			0,
			1,
		},
	},
}
local level_name_style = {
	dynamic_font_size = false,
	font_size = 80,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local sub_title_style = {
	dynamic_font_size = false,
	font_size = 36,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local team_name_red_style = {
	font_size = 48,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = {
		255,
		200,
		30,
		30,
	},
	offset = {
		0,
		0,
		0,
	},
}
local team_name_blue_style = {
	font_size = 48,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = {
		255,
		50,
		50,
		200,
	},
	offset = {
		0,
		0,
		0,
	},
}
local input_description_style = {
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = true,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	text_color = Colors.get_table("white"),
	offset = {
		0,
		0,
		1,
	},
}
local vs_text_style = {
	font_size = 82,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}

local function create_player_button_panel(scenegraph_id, num_buttons, left_aligned)
	local button_size = {
		30,
		30,
	}
	local icon_size = {
		30,
		30,
	}
	local spacing = 10
	local total_length = num_buttons * button_size[1] + spacing * (num_buttons - 1)
	local passes = {}
	local content = {}
	local style = {}
	local horizontal_alignment = left_aligned and "right" or "left"
	local x_offset = 0
	local y_offset = -button_size[2]

	for i = 1, num_buttons do
		local background_name = "background_" .. i

		passes[#passes + 1] = {
			pass_type = "rect",
			style_id = background_name,
		}
		style[background_name] = {
			vertical_alignment = "bottom",
			area_size = button_size,
			texture_size = button_size,
			horizontal_alignment = horizontal_alignment,
			color = {
				0,
				0,
				0,
				0,
			},
			offset = {
				x_offset,
				y_offset,
				0,
			},
		}

		local hotspot_name = "hotspot_" .. i

		passes[#passes + 1] = {
			pass_type = "hotspot",
			content_id = hotspot_name,
			style_id = background_name,
		}
		content[hotspot_name] = {}

		local icon_name = "icon_" .. i

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = icon_name,
			style_id = icon_name,
			content_check_function = function (content)
				return not content[hotspot_name].is_hover
			end,
		}
		content[icon_name] = "icons_placeholder"
		style[icon_name] = {
			vertical_alignment = "bottom",
			texture_size = button_size,
			horizontal_alignment = horizontal_alignment,
			color = {
				255,
				150,
				150,
				150,
			},
			offset = {
				x_offset,
				y_offset,
				2,
			},
		}

		local icon_hover_name = "icon_hover_" .. i

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = icon_name,
			style_id = icon_hover_name,
			content_check_function = function (content)
				return content[hotspot_name].is_hover
			end,
		}
		style[icon_hover_name] = {
			vertical_alignment = "bottom",
			texture_size = button_size,
			horizontal_alignment = horizontal_alignment,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				x_offset,
				y_offset,
				2,
			},
		}

		local shadow_icon_name = "shadow_icon_" .. i

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = icon_name,
			style_id = shadow_icon_name,
		}
		style[shadow_icon_name] = {
			vertical_alignment = "bottom",
			texture_size = button_size,
			horizontal_alignment = horizontal_alignment,
			color = {
				255,
				0,
				0,
				0,
			},
			offset = {
				x_offset + 1,
				y_offset - 1,
				1,
			},
		}

		local disabled_icon_name = "disabled_icon_" .. i

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = disabled_icon_name,
			style_id = disabled_icon_name,
			content_check_function = function (content)
				return content[hotspot_name].blocked
			end,
		}
		content[disabled_icon_name] = "tab_menu_icon_03"
		style[disabled_icon_name] = {
			vertical_alignment = "bottom",
			texture_size = button_size,
			horizontal_alignment = horizontal_alignment,
			color = {
				200,
				150,
				0,
				0,
			},
			offset = {
				x_offset,
				y_offset,
				3,
			},
		}

		if left_aligned then
			x_offset = x_offset - (button_size[1] + spacing)
		else
			x_offset = x_offset + (button_size[1] + spacing)
		end
	end

	local widget = {
		element = {
			passes = passes,
		},
		content = content,
		style = style,
		offset = {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}

	return widget
end

local function create_vertical_edge_divider(scenegraph_id, size)
	local scenegraph_definition = scenegraph_definition[scenegraph_id]
	local horizontal_alignment = scenegraph_definition.horizontal_alignment == "right" and "left" or "right"
	local offset_multiplier = horizontal_alignment == "left" and -1 or 1
	local widget = {
		element = {
			passes = {
				{
					pass_type = "tiled_texture",
					style_id = "edge",
					texture_id = "edge",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_top",
					texture_id = "edge_holder_top",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_bottom",
					texture_id = "edge_holder_bottom",
				},
			},
		},
		content = {
			edge = "menu_frame_09_divider_vertical",
			edge_holder_bottom = "menu_frame_09_divider_bottom",
			edge_holder_top = "menu_frame_09_divider_top",
		},
		style = {
			edge = {
				texture_size = {
					size[1],
					size[2],
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					5 * offset_multiplier,
					0,
					6,
				},
				texture_tiling_size = {
					5,
					size[2],
				},
				horizontal_alignment = horizontal_alignment,
			},
			edge_holder_top = {
				vertical_alignment = "top",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					11 * offset_multiplier,
					0,
					10,
				},
				texture_size = {
					17,
					9,
				},
				horizontal_alignment = horizontal_alignment,
			},
			edge_holder_bottom = {
				vertical_alignment = "bottom",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					11 * offset_multiplier,
					0,
					10,
				},
				texture_size = {
					17,
					9,
				},
				horizontal_alignment = horizontal_alignment,
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

local widget_definitions = {
	vs_text = UIWidgets.create_simple_text(Localize("vs_ui_vs_tag"), "vs_text", nil, nil, vs_text_style),
	team_1_name = UIWidgets.create_simple_text(Localize("vs_team_name_1"), "team_1_name", nil, nil, team_name_red_style),
	team_2_name = UIWidgets.create_simple_text(Localize("vs_team_name_2"), "team_2_name", nil, nil, team_name_blue_style),
	banner_left = UIWidgets.create_simple_rect("banner_left", {
		200,
		10,
		10,
		10,
	}),
	banner_right = UIWidgets.create_simple_rect("banner_right", {
		200,
		10,
		10,
		10,
	}),
	banner_left_edge = create_vertical_edge_divider("banner_left", {
		5,
		scenegraph_definition.banner_left.size[2],
	}),
	banner_right_edge = create_vertical_edge_divider("banner_right", {
		5,
		scenegraph_definition.banner_right.size[2],
	}),
	input_description_text = UIWidgets.create_simple_text("player_list_show_mouse_description", "player_list_input_description", nil, nil, input_description_style),
}
local disable_with_gamepad = true
local host_widget_definitions = {
	force_start_button = UIWidgets.create_default_button("force_start_button", MENU_BUTTON_SIZE, nil, nil, "Force Start Game", MENU_BUTTON_FONT_SIZE, nil, nil, nil, disable_with_gamepad),
}
local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.3,
			name = "entry",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
				ui_scenegraph.banner_left.position[1] = scenegraph_definition.banner_left.position[1] - BANNER_LEFT_SIZE[1]
				ui_scenegraph.banner_right.position[1] = scenegraph_definition.banner_right.position[1] + BANNER_RIGHT_SIZE[1]
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeCubic(progress)

				params.render_settings.alpha_multiplier = anim_fraction
				ui_scenegraph.banner_left.position[1] = scenegraph_definition.banner_left.position[1] - (1 - anim_fraction) * BANNER_LEFT_SIZE[1]
				ui_scenegraph.banner_right.position[1] = scenegraph_definition.banner_right.position[1] + (1 - anim_fraction) * BANNER_RIGHT_SIZE[1]
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}
local generic_input_actions = {
	default = {
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 3,
		},
	},
	switch_team = {
		actions = {
			{
				description_text = "Request Team Change",
				ignore_localization = true,
				input_action = "switch_team",
				priority = 2,
			},
		},
	},
	force_start = {
		actions = {
			{
				description_text = "Force Start Game",
				ignore_localization = true,
				input_action = "force_start",
				priority = 1,
			},
		},
	},
	force_start_switch_team = {
		actions = {
			{
				description_text = "Force Start Game",
				ignore_localization = true,
				input_action = "force_start",
				priority = 1,
			},
			{
				description_text = "Switch Team",
				ignore_localization = true,
				input_action = "switch_team",
				priority = 2,
			},
		},
	},
}

return {
	create_player_button_panel = create_player_button_panel,
	animation_definitions = animation_definitions,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	host_widget_definitions = host_widget_definitions,
	generic_input_actions = generic_input_actions,
}
