-- chunkname: @scripts/ui/views/versus_mission_objective_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local scenegraph_definition = {
	screen = {
		size = {
			SIZE_X,
			SIZE_Y,
		},
		position = {
			0,
			0,
			UILayer.hud,
		},
		scale = not IS_WINDOWS and "hud_fit" or "fit",
	},
	pivot = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			0,
			0,
			100,
		},
	},
	objective_detail = {
		horizontal_alignment = "center",
		parent = "pivot",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			0,
			-25,
			0,
		},
	},
	objective = {
		horizontal_alignment = "center",
		parent = "pivot",
		vertical_alignment = "top",
		size = {
			100,
			100,
		},
		position = {
			0,
			-40,
			0,
		},
	},
	score_party_1 = {
		horizontal_alignment = "left",
		parent = "objective",
		vertical_alignment = "center",
		size = {
			124,
			56,
		},
		position = {
			-100,
			5,
			-10,
		},
	},
	score_party_2 = {
		horizontal_alignment = "right",
		parent = "objective",
		vertical_alignment = "center",
		size = {
			124,
			56,
		},
		position = {
			100,
			5,
			-10,
		},
	},
	objective_text = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			1600,
			20,
		},
		position = {
			0,
			-150,
			1,
		},
	},
}
local objective_text_style = {
	draw_text_rect = true,
	dynamic_font_size = false,
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	rect_color = {
		0,
		0,
		0,
		0,
	},
	text_color = Colors.get_color_table_with_alpha("white_smoke", 255),
	shadow_offset = {
		1,
		1,
		0,
	},
	offset = {
		0,
		0,
		2,
	},
}
local timer_counter_text_style = table.clone(objective_text_style)

timer_counter_text_style.font_size = 38
timer_counter_text_style.offset = {
	0,
	-20,
	2,
}
timer_counter_text_style.text_color = Colors.get_color_table_with_alpha("white_smoke", 255)

local round_starting_text_style = table.clone(objective_text_style)

round_starting_text_style.font_size = 24
round_starting_text_style.word_wrap = false
round_starting_text_style.offset = {
	0,
	-75,
	2,
}
round_starting_text_style.text_color = Colors.get_color_table_with_alpha("white_smoke", 255)

local saturated_color = {
	255,
	144,
	144,
	144,
}

local function create_objective_count_widget(scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "round_frame",
					texture_id = "round_frame",
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
			},
		},
		content = {
			background = "round_background_small",
			round_frame = "round_frame_small",
		},
		style = {
			round_frame = {
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					18,
					18,
				},
				offset = {
					0,
					0,
					6,
				},
			},
			background = {
				color = {
					255,
					144,
					144,
					144,
				},
				texture_size = {
					18,
					18,
				},
				offset = {
					0,
					0,
					1,
				},
			},
		},
		scenegraph_id = scenegraph_id,
		offset = offset or {
			0,
			0,
			0,
		},
	}
end

local function create_score_widget(scenegraph_id, uvs, color)
	return {
		element = {
			passes = {
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					content_id = "frame",
					pass_type = "texture_uv",
					style_id = "frame",
				},
				{
					content_id = "disabled_background",
					pass_type = "texture_uv",
					style_id = "disabled_background",
					content_check_function = function (content, style)
						return content.is_hero == false
					end,
				},
				{
					pass_type = "texture",
					style_id = "top_detail",
					texture_id = "top_detail",
				},
				{
					pass_type = "text",
					style_id = "score",
					text_id = "score",
				},
			},
		},
		content = {
			score = "0",
			top_detail = "score_top_detail",
			frame = {
				texture_id = "score_frame",
				uvs = uvs or {
					{
						0,
						0,
					},
					{
						1,
						1,
					},
				},
			},
			background = {
				texture_id = "score_plain_backround",
				uvs = uvs or {
					{
						0,
						0,
					},
					{
						1,
						1,
					},
				},
			},
			disabled_background = {
				is_hero = true,
				texture_id = "score_shaded_background",
				uvs = uvs or {
					{
						0,
						0,
					},
					{
						1,
						1,
					},
				},
			},
		},
		style = {
			frame = {
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					124,
					56,
				},
				offset = {
					0,
					0,
					6,
				},
			},
			background = {
				color = color or Colors.get_color_table_with_alpha("local_player_team_darkened", 255),
				texture_size = {
					124,
					56,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			disabled_background = {
				color = Colors.get_color_table_with_alpha("black", 140),
				texture_size = {
					124,
					56,
				},
				offset = {
					0,
					0,
					5,
				},
			},
			top_detail = {
				color = Colors.get_color_table_with_alpha("white", 255),
				texture_size = {
					124,
					8,
				},
				offset = {
					0,
					56,
					1,
				},
			},
			score = {
				dynamic_font_size = true,
				font_size = 50,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("white_smoke", 255),
				shadow_offset = {
					1,
					1,
					4,
				},
				offset = {
					0,
					-4,
					4,
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

local function create_objective_widget(scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "gradient_mask_texture",
					style_id = "progress_bar",
					texture_id = "progress_bar",
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "progress_background",
					texture_id = "progress_background",
				},
				{
					pass_type = "text",
					style_id = "pre_round_timer",
					text_id = "pre_round_timer",
					content_check_function = function (content)
						return not content.pre_round_timer_done
					end,
				},
				{
					pass_type = "texture",
					style_id = "objective_icon",
					texture_id = "objective_icon",
					content_check_function = function (content)
						return content.pre_round_timer_done
					end,
				},
			},
		},
		content = {
			background = "round_background_big",
			is_hero = true,
			objective_icon = "icons_placeholder",
			pre_round_timer = "0",
			pre_round_timer_done = false,
			progress_background = "circular_progress_background",
			progress_bar = "versus_objective_progress_bar",
		},
		style = {
			progress_bar = {
				gradient_threshold = 0,
				texture_size = {
					94,
					94,
				},
				offset = {
					3,
					3,
					5,
				},
				color = Colors.get_color_table_with_alpha("black", 255),
			},
			background = {
				offset = {
					0,
					0,
					1,
				},
				color = Colors.get_color_table_with_alpha("black", 255),
			},
			progress_background = {
				texture_size = {
					94,
					94,
				},
				offset = {
					3,
					3,
					2,
				},
				color = Colors.get_color_table_with_alpha("gainsboro", 185),
			},
			objective_icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					64,
					64,
				},
				offset = {
					0,
					0,
					5,
				},
				color = Colors.get_color_table_with_alpha("white_smoke", 255),
			},
			pre_round_timer = {
				dynamic_font_size = false,
				font_size = 50,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("white_smoke", 255),
				shadow_offset = {
					1,
					1,
					0,
				},
				offset = {
					0,
					0,
					2,
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

function create_detailed_objective_widgets(scenegraph_id, active_team_color)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
					content_change_function = function (content, style)
						if content.current_objective then
							style.color = Colors.get_color_table_with_alpha("white", 255)
						elseif content.completed then
							style.color = content.active_team_color
						end
					end,
				},
				{
					pass_type = "texture",
					style_id = "frame",
					texture_id = "frame",
				},
			},
		},
		content = {
			background = "round_background_small",
			completed = false,
			current_objective = false,
			frame = "round_frame_small",
			is_inactive = true,
			active_team_color = active_team_color or Colors.get_color_table_with_alpha("local_player_team", 255),
		},
		style = {
			background = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					18,
					18,
				},
				offset = {
					0,
					0,
					1,
				},
				color = Colors.get_color_table_with_alpha("very_dark_gray", 180),
			},
			frame = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					18,
					18,
				},
				offset = {
					0,
					0,
					2,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
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

local widget_definitions = {
	round_start_timer = UIWidgets.create_simple_text("", "objective", nil, nil, timer_counter_text_style),
	round_starting_text = UIWidgets.create_simple_text("", "objective", nil, nil, round_starting_text_style),
	objective_text = UIWidgets.create_simple_text("", "objective_text", nil, nil, objective_text_style),
	team_1_score = create_score_widget("score_party_1", nil, Colors.get_color_table_with_alpha("local_player_team", 255)),
	team_2_score = create_score_widget("score_party_2", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, Colors.get_color_table_with_alpha("opponent_team", 255)),
	objective = create_objective_widget("objective"),
}
local time_scale = 1.5
local animation_definitions = {
	announcement = {
		{
			name = "fade_in_header",
			start_progress = 0 * time_scale,
			end_progress = 0.5 * time_scale,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha_progress = math.easeOutCubic(progress)
				local pulse_progress = math.ease_pulse(alpha_progress)
				local style = widget.style
				local text_style = style.text
				local text_shadow_style = style.text_shadow
				local default_font_size = text_style.default_font_size
				local extra_font_size = math.floor(default_font_size * 1) * (1 - alpha_progress)

				text_style.font_size = default_font_size + extra_font_size
				text_shadow_style.font_size = text_style.font_size
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			name = "fade_in_value",
			start_progress = 0.5 * time_scale,
			end_progress = 1 * time_scale,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha_progress = math.easeOutCubic(progress)
				local pulse_progress = math.ease_pulse(alpha_progress)
				local widget = widgets.announcement_value_text

				widget.alpha_multiplier = math.easeCubic(progress)

				local style = widget.style
				local extra_height = -70 * (1 - math.ease_out_exp(progress))

				widget.offset[2] = extra_height
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			name = "fade_out_header",
			start_progress = 2 * time_scale,
			end_progress = 2.5 * time_scale,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha_progress = math.easeOutCubic(progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			name = "fade_out_value",
			start_progress = 1.7 * time_scale,
			end_progress = 2.5 * time_scale,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local widget = widgets.announcement_value_text

				widget.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	animation_definitions = animation_definitions,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	create_score_widget = create_score_widget,
	create_objective_count_widget = create_objective_count_widget,
}
