-- chunkname: @scripts/ui/views/end_screens/versus_round_end_screen_ui_definitions.lua

local scenegraph = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.end_screen_banner,
		},
		size = {
			1920,
			1080,
		},
	},
	top_bar = {
		horizontal_alignment = "center",
		scale = "fit_width",
		vertical_alignment = "top",
		position = {
			0,
			0,
			UILayer.end_screen_banner + 100,
		},
		size = {
			1920,
			200,
		},
	},
	level_name = {
		horizontal_alignment = "center",
		parent = "top_bar",
		vertical_alignment = "center",
		position = {
			200,
			20,
			1,
		},
		size = {
			600,
			50,
		},
	},
	round_count = {
		horizontal_alignment = "center",
		parent = "top_bar",
		vertical_alignment = "center",
		position = {
			200,
			-20,
			1,
		},
		size = {
			600,
			50,
		},
	},
	level_image = {
		horizontal_alignment = "center",
		parent = "top_bar",
		vertical_alignment = "center",
		position = {
			-200,
			0,
			1,
		},
		size = {
			180,
			180,
		},
	},
	team_1_banner = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			-710,
			40,
			2,
		},
		size = {
			232,
			484,
		},
	},
	team_1_winner = {
		horizontal_alignment = "center",
		parent = "team_1_banner",
		vertical_alignment = "top",
		position = {
			0,
			90,
			2,
		},
		size = {
			140,
			140,
		},
	},
	team_1_info = {
		horizontal_alignment = "right",
		parent = "team_1_banner",
		vertical_alignment = "top",
		position = {
			450,
			-10,
			-2,
		},
		size = {
			500,
			98,
		},
	},
	team_2_banner = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			710,
			40,
			2,
		},
		size = {
			232,
			484,
		},
	},
	team_2_winner = {
		horizontal_alignment = "center",
		parent = "team_2_banner",
		vertical_alignment = "top",
		position = {
			0,
			90,
			2,
		},
		size = {
			140,
			140,
		},
	},
	team_2_info = {
		horizontal_alignment = "left",
		parent = "team_2_banner",
		vertical_alignment = "top",
		position = {
			-450,
			-10,
			-2,
		},
		size = {
			500,
			98,
		},
	},
	total_score = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			0,
			50,
			2,
		},
		size = {
			1180,
			180,
		},
	},
	team_winning_text = {
		horizontal_alignment = "center",
		parent = "total_score",
		vertical_alignment = "center",
		position = {
			0,
			108,
			2,
		},
		size = {
			1180,
			30,
		},
	},
	team_1_total_score = {
		horizontal_alignment = "center",
		parent = "total_score",
		vertical_alignment = "top",
		position = {
			40,
			-36,
			2,
		},
		size = {
			1020,
			30,
		},
	},
	team_2_total_score = {
		horizontal_alignment = "center",
		parent = "total_score",
		vertical_alignment = "bottom",
		position = {
			40,
			36,
			2,
		},
		size = {
			1020,
			30,
		},
	},
	round_score_bgs_pivot = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			0,
			-160,
			2,
		},
		size = {
			920,
			100,
		},
	},
	round_score_bar_team_1 = {
		horizontal_alignment = "left",
		parent = "round_score_bgs_pivot",
		vertical_alignment = "center",
		position = {
			40,
			-20,
			3,
		},
		size = {
			400,
			14,
		},
	},
	round_score_bar_team_2 = {
		horizontal_alignment = "right",
		parent = "round_score_bgs_pivot",
		vertical_alignment = "center",
		position = {
			-40,
			-20,
			3,
		},
		size = {
			400,
			14,
		},
	},
	title_text_round_end = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			0,
			300,
			1,
		},
		size = {
			1400,
			100,
		},
	},
}
local level_name_text_style = {
	font_size = 50,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
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
local round_counter_text_style = {
	font_size = 28,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		0,
		2,
	},
}
local title_text_round_end_style = {
	font_size = 72,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2,
	},
}
local team_name_1_style = {
	font_size = 68,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("local_player_team", 255),
	offset = {
		0,
		0,
		0,
	},
}
local team_winning_text_style = {
	font_size = 36,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		0,
		10,
	},
}
local team_name_2_style = table.clone(team_name_1_style)

team_name_2_style.horizontal_alignment = "right"
team_name_2_style.text_color = Colors.get_color_table_with_alpha("opponent_team", 255)

local widgets = {
	background = UIWidgets.create_simple_rect("screen", {
		0,
		0,
		0,
		0,
	}),
	banner = UIWidgets.create_shader_tiled_texture("top_bar", "carousel_end_screen_panel", {
		512,
		200,
	}),
	banner_mask = UIWidgets.create_shader_tiled_texture("top_bar", "carousel_end_screen_panel_mask", {
		512,
		200,
	}),
	banner_gradient = UIWidgets.create_simple_texture("end_screen_banner_gradient", "top_bar", nil, nil, {
		76.8,
		255,
		255,
		255,
	}, {
		0,
		0,
		10,
	}),
	level_image = UIWidgets.create_level_widget("level_image"),
	level_name = UIWidgets.create_simple_text("LEVEL NAME", "level_name", nil, nil, level_name_text_style),
	round_counter = UIWidgets.create_simple_text("Round 1/3", "round_count", nil, nil, round_counter_text_style),
	team_1_banner = UIWidgets.create_simple_texture("banner_skulls_local_long", "team_1_banner"),
	team_1_info = UIWidgets.create_team_banner_info("team_1_info", true),
	team_2_banner = UIWidgets.create_simple_texture("banner_skulls_opponent_long", "team_2_banner"),
	team_2_info = UIWidgets.create_team_banner_info("team_2_info", false),
	total_score_bg = UIWidgets.create_round_end_total_score_widget("total_score", scenegraph.total_score.size),
	team_wining_status_text = UIWidgets.create_simple_text("Your Team is Winning", "team_winning_text", nil, nil, team_winning_text_style),
}
local set_widget_alpha = UIUtils.set_widget_alpha

local function set_score_progress_bar_length(widget, anim_progress)
	local style = widget.style
	local content = widget.content
	local current_score = content.current_score
	local max_score = content.max_score
	local progress_fraction = math.min(current_score / max_score, 1)

	content.score_progress = progress_fraction * anim_progress

	local current_score_icon_style = style.current_score_icon

	current_score_icon_style.offset[1] = 75 + content.progress_bar_max_size * (progress_fraction * anim_progress) - 32

	local current_score_text_style = style.current_score_text

	current_score_text_style.offset[1] = 75 + content.progress_bar_max_size * (progress_fraction * anim_progress) - 32
	content.current_score_text = math.floor(progress_fraction * anim_progress * max_score)
end

local animations = {
	round_end = {
		{
			end_progress = 0.5,
			name = "entry",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				set_widget_alpha(widgets.background, 0)

				params.draw_flags.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeCubic(progress)

				params.draw_flags.alpha_multiplier = anim_fraction

				set_widget_alpha(widgets.background, anim_fraction * 60)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 2.5,
			name = "set_team_score_progress",
			start_progress = 0.9,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				if params.current_round > 1 then
					for team = 1, 2 do
						for round = 1, params.current_round - 1 do
							local widget_name = "round_" .. round .. "team_" .. team .. "_score_bar"
							local team_score_bar = widgets[widget_name]
							local team_content = team_score_bar.content
							local team_style = team_score_bar.style
							local team_progress = team_content.bar_fill_threashold
							local current_score_background = team_style.current_score_bg

							current_score_background.offset[1] = current_score_background.default_offset[1] + (team_content.bar_size[1] - team_content.score_size[1] - 50) * math.max(0, team_progress)

							local current_score_frame = team_style.current_score_frame

							current_score_frame.offset[1] = current_score_frame.default_offset[1] + (team_content.bar_size[1] - team_content.score_size[1] - 50) * math.max(0, team_progress)

							local current_score = team_style.current_score

							current_score.offset[1] = current_score.default_offset[1] + (team_content.bar_size[1] - team_content.score_size[1] - 50) * math.max(0, team_progress)
							team_content.current_bar_fil_threshold = team_progress
						end
					end
				end
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeCubic(progress)

				for team = 1, 2 do
					local current_round = params.current_round
					local widget_name = "round_" .. current_round .. "team_" .. team .. "_score_bar"
					local team_score_bar = widgets[widget_name]
					local team_content = team_score_bar.content
					local team_style = team_score_bar.style
					local team_progress = team_content.bar_fill_threashold * anim_fraction
					local current_score_background = team_style.current_score_bg

					current_score_background.offset[1] = current_score_background.default_offset[1] + (team_content.bar_size[1] - team_content.score_size[1] - 50) * math.max(0, team_progress)

					local current_score_frame = team_style.current_score_frame

					current_score_frame.offset[1] = current_score_frame.default_offset[1] + (team_content.bar_size[1] - team_content.score_size[1] - 50) * math.max(0, team_progress)

					local current_score = team_style.current_score

					current_score.offset[1] = current_score.default_offset[1] + (team_content.bar_size[1] - team_content.score_size[1] - 50) * math.max(0, team_progress)
					team_content.current_bar_fil_threshold = team_progress
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 2.5,
			name = "total_score_progress",
			start_progress = 1.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeCubic(progress)

				for i = 1, 2 do
					local team_score_bar = widgets["team_" .. i .. "_total_score"]
					local team_content = team_score_bar.content
					local team_style = team_score_bar.style
					local team_progress = team_content.bar_fill_threashold * anim_fraction
					local current_score_background = team_style.current_score_background

					current_score_background.offset[1] = current_score_background.default_offset[1] + (team_content.bar_size[1] - team_content.current_score_size[1] - 65) * math.max(0, team_progress)

					local gold_frame = team_style.gold_frame

					gold_frame.offset[1] = gold_frame.default_offset[1] + (team_content.bar_size[1] - team_content.current_score_size[1] - 65) * math.max(0, team_progress)

					local left_detail_w = team_style.left_detail_w

					left_detail_w.offset[1] = left_detail_w.default_offset[1] + (team_content.bar_size[1] - team_content.current_score_size[1] - 65) * math.max(0, team_progress)

					local right_detail_w = team_style.right_detail_w

					right_detail_w.offset[1] = right_detail_w.default_offset[1] + (team_content.bar_size[1] - team_content.current_score_size[1] - 65) * math.max(0, team_progress)

					local bronze_frame = team_style.bronze_frame

					bronze_frame.offset[1] = bronze_frame.default_offset[1] + (team_content.bar_size[1] - team_content.current_score_size[1] - 65) * math.max(0, team_progress)

					local left_detail_l = team_style.left_detail_l

					left_detail_l.offset[1] = left_detail_l.default_offset[1] + (team_content.bar_size[1] - team_content.current_score_size[1] - 65) * math.max(0, team_progress)

					local right_detail_l = team_style.right_detail_l

					right_detail_l.offset[1] = right_detail_l.default_offset[1] + (team_content.bar_size[1] - team_content.current_score_size[1] - 65) * math.max(0, team_progress)

					local current_score = team_style.current_score

					current_score.offset[1] = current_score.default_offset[1] + (team_content.bar_size[1] - team_content.current_score_size[1] - 65) * math.max(0, team_progress)
					team_content.current_bar_fil_threshold = team_progress
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 10,
			name = "fade_out",
			start_progress = 9.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = 1 - math.easeInCubic(progress)

				params.draw_flags.alpha_multiplier = anim_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	scenegraph_definition = scenegraph,
	widget_definitions = widgets,
	animation_definitions = animations,
}
