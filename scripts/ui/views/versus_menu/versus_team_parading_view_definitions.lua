-- chunkname: @scripts/ui/views/versus_menu/versus_team_parading_view_definitions.lua

local DIORAMA_SIZE = {
	400,
	640,
}
local DIORAMA_SPACING = 50
local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.transition,
		},
	},
	root_fit = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.transition,
		},
	},
	root_center_pivot = {
		horizontal_alignment = "center",
		parent = "root_fit",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			0,
			0,
			0,
		},
	},
	background_banner = {
		horizontal_alignment = "left",
		parent = "root_fit",
		scale = "fit_width",
		vertical_alignment = "center",
		size = {
			1920,
			DIORAMA_SIZE[2] + 100,
		},
		position = {
			0,
			0,
			1,
		},
	},
	player_1 = {
		horizontal_alignment = "center",
		parent = "root_center_pivot",
		vertical_alignment = "center",
		size = {
			DIORAMA_SIZE[1],
			DIORAMA_SIZE[2],
		},
		position = {
			-(DIORAMA_SIZE[1] + DIORAMA_SPACING) * 1.5,
			0,
			3,
		},
	},
	player_2 = {
		horizontal_alignment = "center",
		parent = "root_center_pivot",
		vertical_alignment = "center",
		size = {
			DIORAMA_SIZE[1],
			DIORAMA_SIZE[2],
		},
		position = {
			-(DIORAMA_SIZE[1] / 2 + DIORAMA_SPACING / 2),
			0,
			3,
		},
	},
	player_3 = {
		horizontal_alignment = "center",
		parent = "root_center_pivot",
		vertical_alignment = "center",
		size = {
			DIORAMA_SIZE[1],
			DIORAMA_SIZE[2],
		},
		position = {
			DIORAMA_SIZE[1] / 2 + DIORAMA_SPACING / 2,
			0,
			3,
		},
	},
	player_4 = {
		horizontal_alignment = "center",
		parent = "root_center_pivot",
		vertical_alignment = "center",
		size = {
			DIORAMA_SIZE[1],
			DIORAMA_SIZE[2],
		},
		position = {
			(DIORAMA_SIZE[1] + DIORAMA_SPACING) * 1.5,
			0,
			3,
		},
	},
	team_title = {
		horizontal_alignment = "center",
		parent = "root_center_pivot",
		vertical_alignment = "center",
		size = {
			800,
			60,
		},
		position = {
			0,
			500,
			4,
		},
	},
	team_name = {
		horizontal_alignment = "center",
		parent = "root_center_pivot",
		vertical_alignment = "center",
		size = {
			800,
			60,
		},
		position = {
			0,
			420,
			4,
		},
	},
	round_title = {
		horizontal_alignment = "center",
		parent = "root_center_pivot",
		vertical_alignment = "center",
		size = {
			800,
			60,
		},
		position = {
			0,
			0,
			10,
		},
	},
	timer_title = {
		horizontal_alignment = "center",
		parent = "root_center_pivot",
		vertical_alignment = "center",
		size = {
			800,
			60,
		},
		position = {
			0,
			-430,
			4,
		},
	},
	screen_timer_area = {
		horizontal_alignment = "center",
		parent = "root_center_pivot",
		vertical_alignment = "center",
		size = {
			2200,
			800,
		},
		position = {
			0,
			-470,
			8,
		},
	},
}
local team_name_text_style = {
	font_size = 64,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	use_shadow = true,
	vertical_alignment = "bottom",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local team_title_text_style = {
	font_size = 32,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	use_shadow = true,
	vertical_alignment = "bottom",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local screen_timer_text_style = {
	default_font_size = 64,
	font_size = 64,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	max_font_size = 450,
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
local screen_timer_text_big_style = {
	default_font_size = 500,
	font_size = 500,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	max_font_size = 1200,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 100),
	offset = {
		0,
		0,
		0,
	},
}
local timer_title_text_style = {
	font_size = 36,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local round_title_text_style = {
	font_size = 172,
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
local shadow_frame_name = "frame_outer_glow_01"
local shadow_frame_settings = UIFrameSettings[shadow_frame_name]
local shadow_frame_edge_height = shadow_frame_settings.texture_sizes.horizontal[2]
local shadow_frame_margins = {
	-shadow_frame_edge_height,
	-shadow_frame_edge_height,
}
local widget_definitions = {
	background = UIWidgets.create_simple_rect("root_fit", {
		180,
		0,
		0,
		0,
	}),
	background_banner = UIWidgets.create_tiled_texture("background_banner", "quests_background", {
		50,
		156,
	}, nil, nil, {
		255,
		200,
		200,
		200,
	}),
	background_frame = UIWidgets.create_frame("background_banner", scenegraph_definition.background_banner.size, shadow_frame_name, 3, {
		255,
		0,
		0,
		0,
	}, shadow_frame_margins),
}
local top_widget_definitions = {
	round_title = UIWidgets.create_simple_text("", "round_title", nil, nil, round_title_text_style),
	timer_title = UIWidgets.create_simple_text(Localize("vote_timer_game_start"), "timer_title", nil, nil, timer_title_text_style),
	screen_timer_text = UIWidgets.create_simple_text("", "screen_timer_area", nil, nil, screen_timer_text_style),
	screen_timer_text_big = UIWidgets.create_simple_text("", "screen_timer_area", nil, nil, screen_timer_text_big_style),
	team_name_text = UIWidgets.create_simple_text("", "team_name", nil, nil, team_name_text_style),
	team_title = UIWidgets.create_simple_text("Starting As Heroes", "team_title", nil, nil, team_title_text_style),
}
local animations = {
	start = {
		{
			end_progress = 0.3,
			name = "background_fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
				widgets.screen_timer_text_big.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)

				widgets.background.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 2,
			name = "round_title_in",
			start_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				if not params.round_title_sound_played then
					WwiseWorld.trigger_event(params.wwise_world, "play_gui_mission_summary_level_up")

					params.round_title_sound_played = true
				end

				local anim_progress = math.easeOutCubic(1 - progress)
				local widget = widgets.round_title
				local offset = widget.offset

				offset[1] = -(50 + 720 * anim_progress)
				widget.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 4,
			name = "round_title_move",
			start_progress = 2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget = widgets.round_title
				local offset = widget.offset
				local anim_progress = math.ease_out_exp(progress)

				offset[1] = -50 + 50 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 4,
			name = "round_title_out",
			start_progress = 3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget = widgets.round_title
				local offset = widget.offset
				local anim_progress = math.ease_in_exp(progress)

				offset[1] = offset[1] + 770 * anim_progress
				widget.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 4.5,
			name = "banner_expand",
			start_progress = 3.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local scenegraph_id = "background_banner"
				local scenegraph = ui_scenegraph[scenegraph_id]
				local default_scenegraph = scenegraph_definition[scenegraph_id]

				scenegraph.size[2] = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeCubic(progress)
				local scenegraph_id = "background_banner"
				local scenegraph = ui_scenegraph[scenegraph_id]
				local default_scenegraph = scenegraph_definition[scenegraph_id]

				scenegraph.size[2] = default_scenegraph.size[2] * anim_progress
				widgets.background_banner.alpha_multiplier = anim_progress
				widgets.background_frame.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 4.9,
			name = "widgets_fade_in",
			start_progress = 4.6,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
				params.show_diorama = true
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress

				local diorama_list = params.diorama_list

				if diorama_list then
					local show_diorama = params.show_diorama
					local fade_in_duration = 0.5

					for i = 1, #diorama_list do
						local diorama = diorama_list[i]

						if show_diorama then
							diorama:set_viewport_active(true)
							diorama:fade_in(fade_in_duration)
						end

						diorama:update_position()
					end

					params.show_diorama = false
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				widgets.background_banner.alpha_multiplier = nil
				widgets.background_frame.alpha_multiplier = nil
			end,
		},
		{
			end_progress = 8,
			name = "fade_out",
			start_progress = 7.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				return
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				Managers.transition:fade_in(1.5)
			end,
		},
		{
			end_progress = 9.5,
			name = "screen_move_out",
			start_progress = 8.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local scenegraph_id = "screen_timer_area"
				local scenegraph = ui_scenegraph[scenegraph_id]
				local default_scenegraph = scenegraph_definition[scenegraph_id]

				scenegraph.local_position[2] = default_scenegraph.position[2]
				params.hide_diorama = true
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local diorama_list = params.diorama_list

				if diorama_list then
					local hide_diorama = params.hide_diorama
					local fade_out_duration = 0.5

					for i = 1, #diorama_list do
						local diorama = diorama_list[i]

						if hide_diorama then
							diorama:fade_out(fade_out_duration)
						end

						diorama:update_position()
					end

					params.hide_diorama = false
				end

				local anim_progress = math.easeOutCubic(progress)
				local scenegraph_id = "screen_timer_area"
				local scenegraph = ui_scenegraph[scenegraph_id]
				local default_scenegraph = scenegraph_definition[scenegraph_id]

				scenegraph.local_position[2] = default_scenegraph.position[2] + 490 * anim_progress
				params.render_settings.alpha_multiplier = math.easeInCubic(1 - anim_progress)

				local timer_widget = widgets.screen_timer_text

				timer_widget.alpha_multiplier = 1

				local timer_widget_style = timer_widget.style
				local time_text_style = timer_widget_style.text
				local time_text_shadow_style = timer_widget_style.text_shadow
				local default_font_size = time_text_style.default_font_size
				local max_font_size = time_text_style.max_font_size
				local new_font_size = default_font_size + (max_font_size - default_font_size) * anim_progress

				time_text_style.font_size = new_font_size
				time_text_shadow_style.font_size = new_font_size
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local timer_big_widget = widgets.screen_timer_text_big

				timer_big_widget.alpha_multiplier = 1
			end,
		},
	},
}

return {
	DIORAMA_SIZE = DIORAMA_SIZE,
	animations = animations,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	top_widget_definitions = top_widget_definitions,
}
