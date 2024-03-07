-- chunkname: @scripts/ui/dlc_versus/views/start_game_view/windows/definitions/start_game_window_versus_panel_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_size = window_default_settings.size
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local game_option_size = {
	220,
	68,
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
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	panel = {
		scale = "fit_width",
		vertical_alignment = "top",
		size = {
			1920,
			79,
		},
		position = {
			0,
			0,
			UILayer.default + 1,
		},
	},
	panel_edge = {
		scale = "fit_width",
		vertical_alignment = "top",
		size = {
			1920,
			4,
		},
		position = {
			0,
			0,
			UILayer.default + 10,
		},
	},
	bottom_panel = {
		scale = "fit_width",
		vertical_alignment = "bottom",
		size = {
			1920,
			79,
		},
		position = {
			0,
			0,
			UILayer.default + 1,
		},
	},
	back_button = {
		horizontal_alignment = "left",
		parent = "panel",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			40,
			-120,
			3,
		},
	},
	close_button = {
		horizontal_alignment = "left",
		parent = "panel",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			40,
			-34,
			3,
		},
	},
	panel_entry_area = {
		horizontal_alignment = "left",
		parent = "panel",
		vertical_alignment = "top",
		size = {
			1600,
			70,
		},
		position = {
			70,
			0,
			1,
		},
	},
	game_mode_option = {
		horizontal_alignment = "left",
		parent = "panel_entry_area",
		vertical_alignment = "top",
		size = game_option_size,
		position = {
			20,
			0,
			14,
		},
	},
	panel_input_area_1 = {
		horizontal_alignment = "left",
		parent = "game_mode_option",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			-50,
			8,
			1,
		},
	},
	panel_input_area_2 = {
		horizontal_alignment = "right",
		parent = "game_mode_option",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			50,
			8,
			1,
		},
	},
	menu_root = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	window = {
		horizontal_alignment = "center",
		parent = "menu_root",
		vertical_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1,
		},
	},
	title_text_glow = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			544,
			16,
		},
		position = {
			0,
			15,
			-1,
		},
	},
	title_text = {
		horizontal_alignment = "center",
		parent = "title_text_glow",
		vertical_alignment = "center",
		size = {
			window_size[1],
			50,
		},
		position = {
			0,
			15,
			1,
		},
	},
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
			1,
		},
		{
			1,
			0,
		},
	}, "bottom_panel", nil, nil, panel_color),
	back_button = UIWidgets.create_layout_button("back_button", "layout_button_back", "layout_button_back_glow"),
	close_button = UIWidgets.create_layout_button("close_button", "layout_button_close", "layout_button_close_glow"),
}

local function create_panel_button(scenegraph_id, size, text, font_size, optional_offset, optional_horizontal_alignment, highlight_color)
	local new_marker_offset = {
		-19,
		-25,
		10,
	}
	local marker_offset = {
		0,
		-3,
		1,
	}
	local selection_offset = {
		0,
		-4,
		0,
	}
	local shadow_offset = {
		2,
		3,
		3,
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
					content_id = "button_hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text_field",
				},
				{
					pass_type = "text",
					style_id = "text_hover",
					text_id = "text_field",
					content_check_function = function (content)
						return not content.button_hotspot.disable_button and (content.button_hotspot.is_hover or content.button_hotspot.is_selected)
					end,
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text_field",
					content_check_function = function (content)
						return not content.button_hotspot.disable_button and not content.button_hotspot.is_hover and not content.button_hotspot.is_selected
					end,
				},
				{
					pass_type = "text",
					style_id = "text_disabled",
					text_id = "text_field",
					content_check_function = function (content)
						return content.button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "selected_texture",
					texture_id = "selected_texture",
					content_check_function = function (content)
						return not content.button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "marker_left",
					texture_id = "marker",
				},
				{
					pass_type = "texture",
					style_id = "marker_right",
					texture_id = "marker",
				},
				{
					pass_type = "texture",
					style_id = "marker_highlight_left",
					texture_id = "marker_highlight",
					content_check_function = function (content)
						return content.button_hotspot.is_selected
					end,
				},
				{
					pass_type = "texture",
					style_id = "marker_highlight_right",
					texture_id = "marker_highlight",
					content_check_function = function (content)
						return content.button_hotspot.is_selected
					end,
				},
				{
					pass_type = "texture",
					style_id = "new_marker",
					texture_id = "new_marker",
					content_check_function = function (content)
						return content.new
					end,
				},
			},
		},
		content = {
			marker = "morris_panel_divider",
			marker_highlight = "morris_panel_highlight",
			new_marker = "list_item_tag_new",
			selected_texture = "hero_panel_selection_glow",
			button_hotspot = {},
			text_field = text,
			default_font_size = font_size,
		},
		style = {
			text = {
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = false,
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_offset = optional_offset or {
					0,
					10,
					4,
				},
				offset = optional_offset or {
					0,
					5,
					4,
				},
				size = size,
			},
			text_shadow = {
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = false,
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_offset = shadow_offset,
				offset = shadow_offset,
				size = size,
			},
			text_hover = {
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = false,
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				default_offset = optional_offset or {
					0,
					10,
					4,
				},
				offset = optional_offset or {
					0,
					5,
					4,
				},
				size = size,
			},
			text_disabled = {
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = false,
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("gray", 50),
				default_offset = optional_offset or {
					0,
					10,
					4,
				},
				offset = optional_offset or {
					0,
					5,
					4,
				},
				size = size,
			},
			selected_texture = {
				horizontal_alignment = "center",
				vertical_alignment = "top",
				texture_size = {
					169,
					35,
				},
				color = highlight_color or Colors.get_color_table_with_alpha("font_title", 255),
				offset = selection_offset,
			},
			marker_left = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = {
					52,
					30,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					marker_offset[1] - 26,
					marker_offset[2],
					marker_offset[3],
				},
			},
			marker_right = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					52,
					30,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					marker_offset[1] + 26,
					marker_offset[2],
					marker_offset[3],
				},
			},
			marker_highlight_left = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = {
					52,
					30,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					marker_offset[1] - 26,
					marker_offset[2],
					marker_offset[3] + 1,
				},
			},
			marker_highlight_right = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					52,
					30,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					marker_offset[1] + 26,
					marker_offset[2],
					marker_offset[3] + 1,
				},
			},
			new_marker = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					math.floor(88.19999999999999),
					math.floor(35.699999999999996),
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					new_marker_offset[1],
					new_marker_offset[2],
					new_marker_offset[3],
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

return {
	widget_definitions = widget_definitions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	create_panel_button = create_panel_button,
}
