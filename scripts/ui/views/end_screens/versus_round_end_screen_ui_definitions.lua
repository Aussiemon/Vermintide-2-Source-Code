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
		parent = "screen",
		vertical_alignment = "top",
		position = {
			0,
			0,
			1,
		},
		size = {
			1920,
			150,
		},
	},
	level_name = {
		horizontal_alignment = "center",
		parent = "top_bar",
		vertical_alignment = "center",
		position = {
			0,
			20,
			1,
		},
		size = {
			1920,
			50,
		},
	},
	round_count = {
		horizontal_alignment = "center",
		parent = "top_bar",
		vertical_alignment = "center",
		position = {
			0,
			-20,
			1,
		},
		size = {
			1920,
			50,
		},
	},
	team_1_score_anchor = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			-300,
			0,
			2,
		},
		size = {
			500,
			80,
		},
	},
	team_1_banner = {
		horizontal_alignment = "center",
		parent = "team_1_score_anchor",
		vertical_alignment = "top",
		position = {
			0,
			0,
			2,
		},
		size = {
			500,
			80,
		},
	},
	team_2_score_anchor = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			300,
			0,
			2,
		},
		size = {
			500,
			80,
		},
	},
	team_2_banner = {
		horizontal_alignment = "center",
		parent = "team_2_score_anchor",
		vertical_alignment = "top",
		position = {
			0,
			0,
			2,
		},
		size = {
			500,
			80,
		},
	},
	total_score = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			0,
			-250,
			2,
		},
		size = {
			1100,
			120,
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
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
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
local round_counter_text_style = {
	font_size = 28,
	font_type = "hell_shark",
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
	top_bar_background = UIWidgets.create_simple_rect("top_bar", {
		140,
		0,
		0,
		0,
	}),
	level_name = UIWidgets.create_simple_text("LEVEL NAME", "level_name", nil, nil, level_name_text_style),
	round_counter = UIWidgets.create_simple_text("Round 1/3", "round_count", nil, nil, round_counter_text_style),
	team_1_banner = UIWidgets.create_round_end_banner_widget("team_1_banner"),
	team_2_banner = UIWidgets.create_round_end_banner_widget("team_2_banner", nil, nil, Colors.get_color_table_with_alpha("opponent_team", 255)),
	total_score = UIWidgets.create_round_end_total_score_widget("total_score", scenegraph.total_score.size),
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
				set_widget_alpha(widgets.top_bar_background, 0)
				set_widget_alpha(widgets.level_name, 0)
				set_widget_alpha(widgets.round_counter, 0)

				local num_rounds = params.num_rounds

				for i = 1, num_rounds do
					local widget = widgets["team_1_round_" .. i]

					set_widget_alpha(widget, 0)

					widget = widgets["team_2_round_" .. i]

					set_widget_alpha(widget, 0)
				end

				local current_round = params.current_round

				for i = 1, num_rounds do
					if i == current_round then
						break
					end

					local widget = widgets["team_1_round_" .. i]

					set_score_progress_bar_length(widget, 1)

					widget = widgets["team_2_round_" .. i]

					set_score_progress_bar_length(widget, 1)
				end

				set_widget_alpha(widgets.team_1_score_box_frame, 0)
				set_widget_alpha(widgets.team_2_score_box_frame, 0)
				set_widget_alpha(widgets.team_1_banner, 0)
				set_widget_alpha(widgets.team_2_banner, 0)
				set_widget_alpha(widgets.total_score, 0)

				params.draw_flags.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeCubic(progress)

				set_widget_alpha(widgets.background, anim_fraction * 60)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.8,
			name = "fade_in_top_banner",
			start_progress = 0.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeCubic(progress)
				local anim_font_size_fraction = math.ease_in_exp(1 - progress)
				local alpha = 255 * anim_fraction

				set_widget_alpha(widgets.top_bar_background, alpha)
				set_widget_alpha(widgets.level_name, alpha)
				set_widget_alpha(widgets.round_counter, alpha)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1.3,
			name = "entry_score",
			start_progress = 0.7,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeCubic(progress)
				local alpha = 255 * anim_fraction

				set_widget_alpha(widgets.team_1_score_box_frame, alpha)
				set_widget_alpha(widgets.team_2_score_box_frame, alpha)
				set_widget_alpha(widgets.team_1_banner, alpha)
				set_widget_alpha(widgets.team_2_banner, alpha)

				local num_rounds = params.num_rounds

				for i = 1, num_rounds do
					local widget = widgets["team_1_round_" .. i]

					set_widget_alpha(widget, alpha)
					set_widget_alpha(widget, 0, "highlight_glow")

					widget = widgets["team_2_round_" .. i]

					set_widget_alpha(widget, alpha)
					set_widget_alpha(widget, 0, "highlight_glow")
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 2.3,
			name = "highlight_current_round",
			start_progress = 1.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local current_round = params.current_round
				local widget = widgets["team_1_round_" .. current_round]

				widget.content.highlight = true
				widget = widgets["team_2_round_" .. current_round]
				widget.content.highlight = true
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeCubic(progress)
				local alpha = 50 + 155 * math.max(0, math.sin(Managers.time:time("ui") * 5))
				local current_round = params.current_round
				local widget = widgets["team_1_round_" .. current_round]

				set_widget_alpha(widget, alpha, "highlight_glow")

				widget = widgets["team_2_round_" .. current_round]

				set_widget_alpha(widget, alpha, "highlight_glow")
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local current_round = params.current_round
				local widget = widgets["team_1_round_" .. current_round]

				widget.content.highlight = false
				widget = widgets["team_2_round_" .. current_round]
				widget.content.highlight = false
			end,
		},
		{
			end_progress = 2.5,
			name = "set_team_score_progress",
			start_progress = 0.9,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeCubic(progress)
				local current_round = params.current_round
				local widget = widgets["team_1_round_" .. current_round]

				set_score_progress_bar_length(widget, anim_fraction)

				widget = widgets["team_2_round_" .. current_round]

				set_score_progress_bar_length(widget, anim_fraction)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1.5,
			name = "fade_in_total_score",
			start_progress = 1.1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeCubic(progress)
				local alpha = 255 * anim_fraction

				set_widget_alpha(widgets.total_score, alpha)
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
				local widget = widgets.total_score
				local content = widget.content
				local style = widget.style
				local scenegraph_node = scenegraph_definition[widget.scenegraph_id]
				local max_size = scenegraph_node.size[1] - 150
				local team_1_score = content.team_1_score
				local team_2_score = content.team_2_score
				local max_score = content.max_score
				local team_1_progress_fraction = math.min(team_1_score / max_score, 1)

				content.team_1_score_progress = team_1_progress_fraction * anim_fraction

				local team_1_current_score_icon_style = style.team_1_current_score_icon

				team_1_current_score_icon_style.offset[1] = 75 + max_size * (team_1_progress_fraction * anim_fraction) - 32

				local team_1_current_score_text_style = style.team_1_current_score_text

				team_1_current_score_text_style.offset[1] = 75 + max_size * (team_1_progress_fraction * anim_fraction) - 32

				local team_2_progress_fraction = math.min(team_2_score / max_score, 1)

				content.team_2_score_progress = team_2_progress_fraction * anim_fraction

				local team_2_current_score_icon_style = style.team_2_current_score_icon

				team_2_current_score_icon_style.offset[1] = 75 + max_size * (team_2_progress_fraction * anim_fraction) - 32

				local team_2_current_score_text_style = style.team_2_current_score_text

				team_2_current_score_text_style.offset[1] = 75 + max_size * (team_2_progress_fraction * anim_fraction) - 32
				content.team_1_current_score_text = math.floor(team_1_progress_fraction * anim_fraction * max_score)
				content.team_2_current_score_text = math.floor(team_2_progress_fraction * anim_fraction * max_score)
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
	create_score_widget = create_score_widget,
	scenegraph_definition = scenegraph,
	widget_definitions = widgets,
	animation_definitions = animations,
}
