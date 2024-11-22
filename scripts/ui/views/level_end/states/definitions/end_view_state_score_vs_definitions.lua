-- chunkname: @scripts/ui/views/level_end/states/definitions/end_view_state_score_vs_definitions.lua

local MAX_SCORE_PANEL_ROWS = 20
local tab_layouts = {
	{
		class_name = "EndViewStateScoreVSTabReport",
		display_name = "end_view_state_score_vs_tab_report_display_name",
		name = "end_view_state_score_vs_tab_report",
	},
	{
		class_name = "EndViewStateScoreVSTabDetails",
		display_name = "end_view_state_score_vs_tab_details_display_name",
		name = "end_view_state_score_vs_tab_details",
	},
}
local tab_size = {
	210,
	48,
}
local scenegraph_definition = {
	screen = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.end_screen,
		},
	},
	panel = {
		scale = "fit_width",
		vertical_alignment = "top",
		size = {
			1920,
			200,
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
	fit_panel = {
		horizontal_alignment = "center",
		parent = "panel",
		vertical_alignment = "top",
		size = {
			1920,
			160,
		},
		position = {
			0,
			0,
			0,
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
		horizontal_alignment = "center",
		parent = "panel",
		vertical_alignment = "bottom",
		size = {
			1600,
			0,
		},
		position = {
			0,
			0,
			1,
		},
	},
	tab = {
		horizontal_alignment = "right",
		parent = "panel",
		vertical_alignment = "top",
		size = {
			0,
			tab_size[2],
		},
		position = {
			-300,
			-110 + tab_size[2] * 0.5,
			14,
		},
	},
	tab_selection = {
		horizontal_alignment = "center",
		parent = "tab",
		vertical_alignment = "bottom",
		size = {
			tab_size[1],
			2,
		},
		position = {
			0,
			-5,
			0,
		},
	},
	level = {
		horizontal_alignment = "left",
		parent = "fit_panel",
		vertical_alignment = "top",
		size = {
			180,
			180,
		},
		position = {
			230,
			-12,
			50,
		},
	},
	team_icon_local = {
		horizontal_alignment = "left",
		parent = "fit_panel",
		vertical_alignment = "center",
		size = {
			180,
			180,
		},
		position = {
			75,
			35,
			50,
		},
	},
	team_icon_opponent = {
		parent = "team_icon_local",
		size = {
			180,
			180,
		},
		position = {
			0,
			-70,
			0,
		},
	},
	level_text = {
		horizontal_alignment = "left",
		parent = "level",
		vertical_alignment = "top",
		size = {
			1920,
			180,
		},
		position = {
			200,
			80,
			0,
		},
	},
	match_finished_text = {
		horizontal_alignment = "left",
		parent = "level_text",
		vertical_alignment = "top",
		size = {
			1920,
			180,
		},
		position = {
			0,
			-30,
			0,
		},
	},
	back_to_keep_button = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			300,
			75,
		},
		position = {
			0,
			50,
			0,
		},
	},
}
local selected_color = {
	255,
	197,
	188,
	175,
}
local hammers_team_color = Colors.get_color_table_with_alpha("local_player_team", 255)
local hammers_team_color_light = Colors.get_color_table_with_alpha("local_player_team_lighter", 255)
local hammers_team_color_dark = Colors.get_color_table_with_alpha("local_player_team_darker", 255)
local skulls_team_color = Colors.get_color_table_with_alpha("opponent_team", 255)
local skulls_team_color_light = Colors.get_color_table_with_alpha("opponent_team_lighter", 255)
local skulls_team_color_dark = Colors.get_color_table_with_alpha("opponent_team_darkened", 255)
local summary_title_style = {
	font_size = 150,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
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
local level_text_style = {
	font_size = 52,
	font_type = "hell_shark_header",
	horizontal_alignment = "top",
	localize = false,
	use_shadow = true,
	vertical_alignment = "left",
	word_wrap = true,
	text_color = selected_color,
	offset = {
		0,
		0,
		2,
	},
}
local match_finished_text_style = {
	font_size = 28,
	font_type = "hell_shark",
	horizontal_alignment = "top",
	localize = false,
	use_shadow = true,
	vertical_alignment = "left",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		0,
		2,
	},
}
local tab_selection_style = {
	font_size = 24,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = selected_color,
	hover_color = selected_color,
	base_color = {
		255,
		128,
		128,
		128,
	},
	offset = {
		0,
		30,
		2,
	},
}
local team_score_style = {
	dynamic_font_size = true,
	font_size = 28,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		-2,
		1,
	},
	size = {
		0,
		0,
	},
}

local function create_tab_selection(scenegraph_id, color)
	local size = scenegraph_definition[scenegraph_id].size

	return {
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "rect",
				},
			},
		},
		content = {},
		style = {
			rect = {
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				color = color or {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					0,
				},
				texture_size = size,
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

local function create_team_score(team, team_name, score)
	local is_local_team = team == "local_team"
	local scenegraph_id = is_local_team and "team_icon_local" or "team_icon_opponent"
	local scenegraph_data = scenegraph_definition[scenegraph_id]
	local size = table.clone(scenegraph_data.size)

	size[1] = 140

	local settings = UISettings.teams_ui_assets
	local team_ui_settings = settings[team_name]
	local team_color = is_local_team and Colors.get_color_table_with_alpha("local_player_team_lighter", 255) or Colors.get_color_table_with_alpha("opponent_team_lighter", 255)
	local internal_score_style = table.clone(team_score_style)

	internal_score_style.size = size
	internal_score_style.text_color = team_color
	internal_score_style.offset = {
		70,
		0,
		0,
	}

	local widget = {
		element = {
			passes = {},
		},
		content = {},
		style = {},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
	}
	local element = widget.element
	local passes = element.passes
	local content = widget.content
	local style = widget.style

	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "icon",
		texture_id = "icon",
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "icon_bg",
		texture_id = "icon_bg",
	}
	content.icon = team_ui_settings.team_icon
	content.icon_bg = team_ui_settings.background_texture
	style.icon = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = {
			80,
			80,
		},
		color = team_color,
		offset = {
			-70,
			0,
			2,
		},
	}
	style.icon_bg = table.clone(style.icon)
	style.icon_bg.texture_size = {
		80,
		80,
	}
	style.icon_bg.offset[3] = 0
	style.icon_bg.color = team_color
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "score",
		text_id = "score",
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "score_shadow",
		text_id = "score",
	}
	content.score = tostring(score)
	style.score = internal_score_style
	style.score_shadow = table.clone(internal_score_style)
	style.score_shadow.text_color = {
		255,
		0,
		0,
		0,
	}
	style.score_shadow.offset = {
		style.score_shadow.offset[1] + 1,
		-1,
		-1,
	}

	return widget
end

local function create_tab_text(text, gamepad_text, scenegraph_id, text_style)
	local text_offset = text_style and text_style.offset or {
		0,
		0,
		2,
	}
	local text_color = text_style and text_style.text_color or {
		255,
		255,
		255,
		255,
	}
	local text_shadow_style = table.clone(text_style)
	local text_shadow_style_color = text_style.shadow_color or {
		255,
		0,
		0,
		0,
	}
	local text_shadow_offset = text_style.shadow_offset or {
		2,
		2,
		0,
	}

	text_shadow_style_color[1] = text_color[1]
	text_shadow_style.text_color = text_shadow_style_color
	text_shadow_style.offset = {
		text_offset[1] + text_shadow_offset[1],
		text_offset[2] - text_shadow_offset[2],
		text_offset[3] - 1,
	}
	text_shadow_style.skip_button_rendering = true

	local gamepad_text_style = table.clone(text_style)

	gamepad_text_style.offset[1] = gamepad_text_style.font_size * 0.75

	return {
		element = {
			passes = {
				{
					content_id = "hotspot",
					pass_type = "hotspot",
					style_id = "hotspot",
					content_check_function = function (content, style)
						return not Managers.input:is_device_active("gamepad")
					end,
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_check_function = function (content, style)
						return not Managers.input:is_device_active("gamepad")
					end,
					content_change_function = function (content, style)
						style.text_color = content.hotspot.is_hover and style.hover_color or style.base_color
					end,
				},
				{
					pass_type = "text",
					style_id = "gamepad_text",
					text_id = "gamepad_text",
					content_check_function = function (content, style)
						return Managers.input:is_device_active("gamepad")
					end,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
					content_check_function = function (content, style)
						return not Managers.input:is_device_active("gamepad")
					end,
				},
			},
		},
		content = {
			text = text,
			gamepad_text = gamepad_text,
			original_text = text,
			color = text_color,
			use_shadow = text_style and text_style.use_shadow or false,
			hotspot = {},
		},
		style = {
			hotspot = {
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				area_size = {
					60,
					60,
				},
			},
			text = text_style,
			gamepad_text = gamepad_text_style,
			text_shadow = text_shadow_style,
		},
		offset = {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

local disable_with_gamepad = true
local widgets = {
	level = UIWidgets.create_level_widget("level"),
	level_text = UIWidgets.create_simple_text("Righteous Stand", "level_text", nil, nil, level_text_style),
	match_finsihed_text = UIWidgets.create_simple_text(Localize("vs_match_completed"), "match_finished_text", nil, nil, match_finished_text_style),
	banner = UIWidgets.create_shader_tiled_texture("panel", "carousel_end_screen_panel", {
		512,
		200,
	}),
	banner_mask = UIWidgets.create_shader_tiled_texture("panel", "carousel_end_screen_panel_mask", {
		512,
		200,
	}),
	banner_gradient = UIWidgets.create_simple_texture("end_screen_banner_gradient", "panel", nil, nil, {
		76.8,
		255,
		255,
		255,
	}, {
		0,
		0,
		10,
	}),
	tab_selection = create_tab_selection("tab_selection", {
		255,
		201,
		201,
		201,
	}),
	prev_tab = create_tab_text("$KEY;ingame_menu__cycle_prev_raw:", "$KEY;ingame_menu__cycle_prev_raw:", "tab_selection", tab_selection_style),
	next_tab = create_tab_text("$KEY;ingame_menu__cycle_next_alt_raw:", "$KEY;ingame_menu__cycle_next_alt_raw:", "tab_selection", tab_selection_style),
	back_to_keep_button = UIWidgets.create_default_button("back_to_keep_button", scenegraph_definition.back_to_keep_button.size, nil, nil, Localize("return_to_inn"), 25, nil, nil, nil, disable_with_gamepad),
}
local animation_definitions = {
	transition_enter = {
		{
			end_progress = 0.3,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
				ui_scenegraph.panel.local_position[2] = scenegraph_definition.panel.position[2] + 200
				ui_scenegraph.back_to_keep_button.local_position[2] = scenegraph_definition.back_to_keep_button.position[2] - 200
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local eased_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = eased_progress
				ui_scenegraph.panel.local_position[2] = math.lerp(scenegraph_definition.panel.position[2] + 200, scenegraph_definition.panel.position[2], eased_progress)
				ui_scenegraph.back_to_keep_button.local_position[2] = math.lerp(scenegraph_definition.back_to_keep_button.position[2] - 200, scenegraph_definition.back_to_keep_button.position[2], eased_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	transition_exit = {
		{
			end_progress = 0.3,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)

				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

local function create_tab(scenegraph_id, text)
	return {
		element = {
			passes = {
				{
					content_id = "hotspot",
					pass_type = "hotspot",
					style_id = "hotspot",
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_check_function = function (content, style)
						return not content.hotspot.is_hover and not content.hotspot.is_selected
					end,
				},
				{
					pass_type = "text",
					style_id = "hover_text",
					text_id = "text",
					content_check_function = function (content)
						return content.hotspot.is_hover or content.hotspot.is_selected
					end,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
				},
			},
		},
		content = {
			text = text,
			hotspot = {},
		},
		style = {
			hotspot = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				area_size = {
					0,
					tab_size[2],
				},
			},
			text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				line_colors = {},
				offset = {
					0,
					0,
					2,
				},
			},
			hover_text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				text_color = selected_color,
				line_colors = {},
				offset = {
					0,
					0,
					2,
				},
			},
			text_shadow = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				line_colors = {},
				offset = {
					2,
					-2,
					1,
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
end

return {
	widgets = widgets,
	tab_layouts = tab_layouts,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	create_tab = create_tab,
	tab_size = tab_size,
	create_team_score_func = create_team_score,
}
