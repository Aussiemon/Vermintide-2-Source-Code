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
			0
		}
	},
	dead_space_filler = {
		scale = "fit",
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
	background = {
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
			99
		}
	},
	information_text = {
		vertical_alignment = "bottom",
		parent = "background",
		horizontal_alignment = "center",
		size = {
			600,
			62
		},
		position = {
			0,
			50,
			2
		}
	},
	splash_video = {
		parent = "background",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			700
		}
	},
	loop_video = {
		parent = "background",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			1
		}
	},
	logo = {
		vertical_alignment = "top",
		parent = "background",
		horizontal_alignment = "center",
		size = {
			1240,
			540
		},
		position = {
			0,
			-30,
			0
		}
	},
	legal_text = {
		vertical_alignment = "bottom",
		parent = "background",
		horizontal_alignment = "center",
		size = {
			1400,
			300
		},
		position = {
			0,
			55,
			0
		}
	},
	user_gamertag = {
		vertical_alignment = "bottom",
		parent = "change_profile_input_icon",
		horizontal_alignment = "left",
		size = {
			1200,
			50
		},
		position = {
			0,
			35,
			1
		}
	},
	change_profile_input_icon = {
		vertical_alignment = "bottom",
		parent = "background",
		horizontal_alignment = "left",
		size = {
			26,
			26
		},
		position = {
			35,
			15,
			30
		}
	},
	change_profile_input_text = {
		vertical_alignment = "center",
		parent = "change_profile_input_icon",
		horizontal_alignment = "left",
		size = {
			1200,
			1
		},
		position = {
			30,
			-5,
			1
		}
	},
	playgo_status = {
		vertical_alignment = "top",
		parent = "background",
		horizontal_alignment = "left",
		size = {
			1200,
			50
		},
		position = {
			35,
			-5,
			30
		}
	},
	menu_anchor_point = {
		vertical_alignment = "center",
		parent = "background",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			-250.5,
			4
		}
	},
	frame_top = {
		vertical_alignment = "bottom",
		parent = "menu_anchor_point",
		horizontal_alignment = "center",
		size = {
			960,
			96
		},
		position = {
			0,
			0,
			7
		}
	},
	frame_bottom = {
		vertical_alignment = "top",
		parent = "menu_anchor_point",
		horizontal_alignment = "center",
		size = {
			960,
			85
		},
		position = {
			0,
			-3,
			6
		}
	},
	frame_background = {
		vertical_alignment = "bottom",
		parent = "frame_bottom",
		horizontal_alignment = "center",
		size = {
			660,
			0
		},
		position = {
			0,
			83,
			-1
		}
	},
	frame_circle_glow = {
		vertical_alignment = "bottom",
		parent = "frame_bottom",
		horizontal_alignment = "center",
		size = {
			205,
			184
		},
		position = {
			4,
			-7,
			15
		}
	},
	frame_line_glow = {
		vertical_alignment = "center",
		parent = "frame_circle_glow",
		horizontal_alignment = "center",
		size = {
			730,
			26
		},
		position = {
			-4,
			-2,
			1
		}
	},
	fog_parent_back_1 = {
		vertical_alignment = "bottom",
		parent = "background",
		horizontal_alignment = "left",
		size = {
			1920,
			500
		},
		position = {
			0,
			50,
			1
		}
	},
	fog_parent_back_2 = {
		vertical_alignment = "bottom",
		parent = "background",
		horizontal_alignment = "left",
		size = {
			1920,
			500
		},
		position = {
			-1920,
			0,
			1
		}
	},
	fog_parent_front_1 = {
		vertical_alignment = "bottom",
		parent = "background",
		horizontal_alignment = "left",
		size = {
			1920,
			300
		},
		position = {
			0,
			100,
			2
		}
	},
	fog_parent_front_2 = {
		vertical_alignment = "bottom",
		parent = "background",
		horizontal_alignment = "left",
		size = {
			1920,
			300
		},
		position = {
			-1920,
			150,
			2
		}
	},
	input_icon = {
		vertical_alignment = "center",
		parent = "frame_circle_glow",
		horizontal_alignment = "center",
		size = {
			50,
			50
		},
		position = {
			-4,
			-2,
			-10
		}
	},
	lock_center = {
		vertical_alignment = "center",
		parent = "input_icon",
		horizontal_alignment = "center",
		size = {
			50,
			50
		},
		position = {
			0,
			1,
			-1
		}
	},
	lock_middle_top = {
		vertical_alignment = "bottom",
		parent = "frame_top",
		horizontal_alignment = "center",
		size = {
			50,
			50
		},
		position = {
			0,
			-29,
			2
		}
	},
	lock_middle_bottom = {
		vertical_alignment = "center",
		parent = "input_icon",
		horizontal_alignment = "center",
		size = {
			50,
			50
		},
		position = {
			0,
			1,
			-2
		}
	},
	lock_outer_top = {
		vertical_alignment = "bottom",
		parent = "frame_top",
		horizontal_alignment = "center",
		size = {
			50,
			50
		},
		position = {
			0,
			-29,
			1
		}
	},
	lock_outer_bottom = {
		vertical_alignment = "center",
		parent = "input_icon",
		horizontal_alignment = "center",
		size = {
			50,
			50
		},
		position = {
			0,
			1,
			-3
		}
	},
	selection_anchor = {
		vertical_alignment = "center",
		parent = "menu_anchor_point",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			10
		},
		size = {
			0,
			60
		}
	},
	selection_glow_left = {
		vertical_alignment = "center",
		parent = "selection_anchor",
		horizontal_alignment = "left",
		position = {
			-98,
			0,
			10
		},
		size = {
			98,
			60
		}
	},
	selection_glow_right = {
		vertical_alignment = "center",
		parent = "selection_anchor",
		horizontal_alignment = "right",
		position = {
			98,
			0,
			10
		},
		size = {
			98,
			60
		}
	},
	start_game_button = {
		vertical_alignment = "center",
		parent = "menu_anchor_point",
		horizontal_alignment = "center",
		position = {
			0,
			90,
			10
		},
		size = {
			1000,
			60
		}
	},
	tutorial = {
		vertical_alignment = "center",
		parent = "menu_anchor_point",
		horizontal_alignment = "center",
		position = {
			0,
			30,
			10
		},
		size = {
			1000,
			60
		}
	},
	options = {
		vertical_alignment = "center",
		parent = "menu_anchor_point",
		horizontal_alignment = "center",
		position = {
			0,
			-30,
			10
		},
		size = {
			1000,
			60
		}
	},
	credits = {
		vertical_alignment = "center",
		parent = "menu_anchor_point",
		horizontal_alignment = "center",
		position = {
			0,
			-90,
			10
		},
		size = {
			1000,
			60
		}
	},
	ai_benchmark = {
		vertical_alignment = "center",
		parent = "menu_anchor_point",
		horizontal_alignment = "center",
		position = {
			0,
			-240,
			10
		},
		size = {
			1000,
			60
		}
	},
	ai_benchmark_cycle = {
		vertical_alignment = "center",
		parent = "menu_anchor_point",
		horizontal_alignment = "center",
		position = {
			0,
			-300,
			10
		},
		size = {
			1000,
			60
		}
	},
	whitebox_combat = {
		vertical_alignment = "center",
		parent = "menu_anchor_point",
		horizontal_alignment = "center",
		position = {
			0,
			-360,
			10
		},
		size = {
			1000,
			60
		}
	},
	support_info = {
		vertical_alignment = "top",
		parent = "background",
		horizontal_alignment = "center",
		size = {
			1200,
			50
		},
		position = {
			0,
			-20,
			30
		}
	}
}

if PLATFORM == "ps4" then
	scenegraph_definition.user_gamertag.position[1] = 61
	scenegraph_definition.user_gamertag.position[2] = 45
end

local attract_mode_video = {
	video_name = "video/vermintide_2",
	sound_start = "Play_v2_teaser_demo",
	scenegraph_id = "splash_video",
	loop = false,
	material_name = "vermintide_2",
	sound_stop = "Stop_v2_teaser_demo"
}
local background_widget_definitions = {
	background = UIWidgets.create_simple_texture("start_screen_bg", "background"),
	fog_front_1 = UIWidgets.create_simple_texture("start_screen_bg_fog_01", "fog_parent_front_1"),
	fog_front_2 = UIWidgets.create_simple_texture("start_screen_bg_fog_02", "fog_parent_front_2"),
	fog_front_3 = UIWidgets.create_simple_texture("start_screen_bg_fog_02", "fog_parent_front_1"),
	fog_front_4 = UIWidgets.create_simple_texture("start_screen_bg_fog_01", "fog_parent_front_2"),
	fog_back_1 = UIWidgets.create_simple_texture("start_screen_bg_fog_01", "fog_parent_back_1"),
	fog_back_2 = UIWidgets.create_simple_texture("start_screen_bg_fog_02", "fog_parent_back_2"),
	fog_back_3 = UIWidgets.create_simple_texture("start_screen_bg_fog_02", "fog_parent_back_1"),
	fog_back_4 = UIWidgets.create_simple_texture("start_screen_bg_fog_01", "fog_parent_back_2"),
	logo = UIWidgets.create_simple_texture("vermintide_logo_title", "logo"),
	dead_space_filler_widget = UIWidgets.create_simple_rect("dead_space_filler", {
		255,
		0,
		0,
		0
	})
}
local widget_definitions = {
	frame_top = UIWidgets.create_simple_texture("start_screen_menu_fg_top", "frame_top"),
	frame_bottom = UIWidgets.create_simple_texture("start_screen_menu_fg_bottom", "frame_bottom"),
	frame_background = UIWidgets.create_simple_texture("start_screen_menu_bg", "frame_background"),
	frame_line_glow = UIWidgets.create_simple_texture("start_screen_menu_glow_02", "frame_line_glow"),
	frame_circle_glow = UIWidgets.create_simple_texture("start_screen_menu_glow_01", "frame_circle_glow"),
	input_icon = UIWidgets.create_simple_texture("ps4_button_icon_cross_large", "input_icon")
}
local single_widget_definitions = {
	legal_text = UIWidgets.create_simple_text("n/a", "legal_text", 12, {
		255,
		255,
		255,
		255
	}),
	information_text = UIWidgets.create_simple_text("n/a", "information_text", 18, {
		255,
		255,
		255,
		255
	}),
	start_screen_selection_left = UIWidgets.create_simple_texture("start_screen_selection_left", "selection_glow_left"),
	start_screen_selection_right = UIWidgets.create_simple_texture("start_screen_selection_right", "selection_glow_right"),
	lock_center = UIWidgets.create_simple_rotated_texture("start_screen_menu_lock_part_05", 0, {
		25,
		25
	}, "lock_center"),
	lock_middle_top = UIWidgets.create_simple_rotated_texture("start_screen_menu_lock_part_03", 0, {
		25,
		25
	}, "lock_middle_top"),
	lock_middle_bottom = UIWidgets.create_simple_rotated_texture("start_screen_menu_lock_part_04", 0, {
		25,
		25
	}, "lock_middle_bottom"),
	lock_outer_top = UIWidgets.create_simple_rotated_texture("start_screen_menu_lock_part_01", 0, {
		25,
		25
	}, "lock_outer_top"),
	lock_outer_bottom = UIWidgets.create_simple_rotated_texture("start_screen_menu_lock_part_02", 0, {
		25,
		25
	}, "lock_outer_bottom"),
	user_gamertag = UIWidgets.create_simple_rect_text("user_gamertag", "Gamertag not assigned"),
	playgo_status = UIWidgets.create_simple_rect_text("playgo_status", "n/a"),
	change_profile_input_icon = UIWidgets.create_simple_texture("xbone_button_icon_x", "change_profile_input_icon"),
	change_profile_input_text = UIWidgets.create_simple_rect_text("change_profile_input_text", Localize("xb1_switch_profile"), 20),
	support_info = UIWidgets.create_simple_text("", "support_info", 20, Colors.get_color_table_with_alpha("white", 150))
}
local animations = {
	scale_and_position_in = {
		{
			name = "scale_and_position_in",
			start_progress = 0,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local widget = widgets[1]
				local size = widget.style.texture_style.size
				local offset = widget.style.texture_style.offset
				local text_color = widget.style.texts_style.text_color
				local original_size = params.title_content.texture_size
				size[1] = math.lerp(original_size[1], original_size[1]*0.25, math.smoothstep(local_progress, 0, 1))
				size[2] = math.lerp(original_size[2], original_size[2]*0.25, math.smoothstep(local_progress, 0, 1))
				offset[1] = math.lerp(title_content.texture_offset[1], -150, math.smoothstep(local_progress, 0, 1))
				offset[2] = math.lerp(title_content.texture_offset[2], 550, math.smoothstep(local_progress, 0, 1))
				text_color[1] = math.lerp(Colors.color_definitions.white[1], 0, math.smoothstep(local_progress, 0, 1))

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	sidebar_fade_in = {
		{
			name = "sidebar_fade_in",
			start_progress = 0,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local widget = widgets[1]
				local color = widget.style.sidebar.color
				color[1] = math.lerp(0, 255, math.smoothstep(local_progress, 0, 1))

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	scale_and_position_out = {
		{
			name = "scale_and_position_out",
			start_progress = 0,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local widget = widgets[1]
				local size = widget.style.texture_style.size
				local offset = widget.style.texture_style.offset
				local text_color = widget.style.texts_style.text_color
				local original_size = params.title_content.texture_size
				size[1] = math.lerp(original_size[1], original_size[1]*0.25, math.smoothstep(local_progress, 1, 0))
				size[2] = math.lerp(original_size[2], original_size[2]*0.25, math.smoothstep(local_progress, 1, 0))
				offset[1] = math.lerp(title_content.texture_offset[1], -150, math.smoothstep(local_progress, 1, 0))
				offset[2] = math.lerp(title_content.texture_offset[2], 600, math.smoothstep(local_progress, 1, 0))
				text_color[1] = math.lerp(Colors.color_definitions.white[1], 0, math.smoothstep(local_progress, 1, 0))

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	sidebar_fade_out = {
		{
			name = "sidebar_fade_out",
			start_progress = 0,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local widget = widgets[1]
				local color = widget.style.sidebar.color
				color[1] = math.lerp(0, 255, math.smoothstep(local_progress, 1, 0))

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	input_icon_fade_out = {
		{
			name = "input_icon_out",
			start_progress = 0,
			end_progress = 0.1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local anim_progress = math.smoothstep(local_progress, 1, 0)
				widgets.input_icon.style.texture_id.color[1] = anim_progress*255

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "circle_glow_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local anim_progress = math.smoothstep(local_progress, 1, 0)
				local circle_glow_color = widgets.frame_circle_glow.style.texture_id.color
				local alpha = anim_progress*255

				if circle_glow_color[1] < alpha then
					circle_glow_color[1] = alpha
				end

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "line_glow_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local ease_progress = math.catmullrom(local_progress, -5, 1, 1, -5)
				local anim_progress = math.easeOutCubic(local_progress)
				widgets.frame_line_glow.style.texture_id.color[1] = anim_progress*255

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	frame_open = {
		{
			name = "bounce",
			start_progress = 0,
			end_progress = 0.2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				widgets.input_icon.style.texture_id.color[1] = 0

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local input_icon_size = ui_scenegraph.input_icon.size
				local frame_top_size = ui_scenegraph.frame_top.size
				local frame_bottom_size = ui_scenegraph.frame_bottom.size
				local frame_circle_glow_size = ui_scenegraph.frame_circle_glow.size
				local default_input_icon_size = scenegraph_definition.input_icon.size
				local default_frame_top_size = scenegraph_definition.frame_top.size
				local default_frame_bottom_size = scenegraph_definition.frame_bottom.size
				local default_frame_circle_glow_size = scenegraph_definition.frame_circle_glow.size
				local anim_progress = math.catmullrom(math.easeOutCubic(local_progress), 2, 1, 1, 1.5)
				frame_top_size[1] = default_frame_top_size[1]*anim_progress
				frame_top_size[2] = default_frame_top_size[2]*anim_progress
				frame_bottom_size[1] = default_frame_bottom_size[1]*anim_progress
				frame_bottom_size[2] = default_frame_bottom_size[2]*anim_progress
				frame_circle_glow_size[1] = default_frame_circle_glow_size[1]*anim_progress
				frame_circle_glow_size[2] = default_frame_circle_glow_size[2]*anim_progress
				input_icon_size[1] = default_input_icon_size[1]*anim_progress
				input_icon_size[2] = default_input_icon_size[2]*anim_progress

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "lock_bounce",
			start_progress = 0,
			end_progress = 0.2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				widgets.input_icon.style.texture_id.color[1] = 0

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local anim_progress = math.catmullrom(math.easeOutCubic(local_progress), 2, 1, 1, 1.5)
				local lock_center_size = ui_scenegraph.lock_center.size
				local lock_outer_bottom_size = ui_scenegraph.lock_outer_bottom.size
				local lock_middle_bottom_size = ui_scenegraph.lock_middle_bottom.size
				local lock_middle_top_size = ui_scenegraph.lock_middle_top.size
				local lock_outer_top_size = ui_scenegraph.lock_outer_top.size
				local default_lock_center_size = scenegraph_definition.lock_center.size
				local default_lock_outer_bottom_size = scenegraph_definition.lock_outer_bottom.size
				local default_lock_middle_bottom_size = scenegraph_definition.lock_middle_bottom.size
				local default_lock_middle_top_size = scenegraph_definition.lock_middle_top.size
				local default_lock_outer_top_size = scenegraph_definition.lock_outer_top.size
				lock_center_size[1] = default_lock_center_size[1]*anim_progress
				lock_center_size[2] = default_lock_center_size[2]*anim_progress
				lock_outer_bottom_size[1] = default_lock_outer_bottom_size[1]*anim_progress
				lock_outer_bottom_size[2] = default_lock_outer_bottom_size[2]*anim_progress
				lock_middle_bottom_size[1] = default_lock_middle_bottom_size[1]*anim_progress
				lock_middle_bottom_size[2] = default_lock_middle_bottom_size[2]*anim_progress
				lock_middle_top_size[1] = default_lock_middle_top_size[1]*anim_progress
				lock_middle_top_size[2] = default_lock_middle_top_size[2]*anim_progress
				lock_outer_top_size[1] = default_lock_outer_top_size[1]*anim_progress
				lock_outer_top_size[2] = default_lock_outer_top_size[2]*anim_progress
				local lock_outer_top_position = ui_scenegraph.lock_outer_top.local_position
				local lock_middle_top_position = ui_scenegraph.lock_middle_top.local_position
				local default_lock_outer_top_position = scenegraph_definition.lock_outer_top.position
				local default_lock_middle_top_position = scenegraph_definition.lock_middle_top.position
				lock_outer_top_position[2] = default_lock_outer_top_position[2]*anim_progress
				lock_middle_top_position[2] = default_lock_middle_top_position[2]*anim_progress

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "line_glow_out",
			start_progress = 0,
			end_progress = 0.15,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local ease_progress = math.catmullrom(local_progress, -5, 1, 1, -5)
				local anim_progress = math.smoothstep(local_progress, 1, 0)
				widgets.frame_line_glow.style.texture_id.color[1] = anim_progress*255

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "circle_glow_out",
			start_progress = 0,
			end_progress = 0.15,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local anim_progress = math.smoothstep(local_progress, 1, 0)
				widgets.frame_circle_glow.style.texture_id.color[1] = anim_progress*255

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "frame_open",
			start_progress = 0.3,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local widget_top = widgets.frame_top
				local widget_bottom = widgets.frame_bottom
				local anim_progress = math.ease_out_quad(local_progress)
				local default_frame_bottom_position = scenegraph_definition.frame_bottom.position
				ui_scenegraph.frame_top.local_position[2] = anim_progress*140
				ui_scenegraph.frame_bottom.local_position[2] = default_frame_bottom_position[2] + anim_progress*-140
				ui_scenegraph.frame_background.size[2] = anim_progress*280

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	frame_close = {
		{
			name = "frame_close",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local widget_top = widgets.frame_top
				local widget_bottom = widgets.frame_bottom
				local default_frame_bottom_position = scenegraph_definition.frame_bottom.position
				local anim_progress = math.smoothstep(local_progress, 1, 0)
				ui_scenegraph.frame_top.local_position[2] = anim_progress*140
				ui_scenegraph.frame_bottom.local_position[2] = default_frame_bottom_position[2] - anim_progress*140
				ui_scenegraph.frame_background.size[2] = anim_progress*280

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "input_icon_in",
			start_progress = 0.3,
			end_progress = 0.45,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local ease_progress = math.catmullrom(local_progress, -5, 1, 1, -5)
				local anim_progress = math.smoothstep(local_progress, 0, 1)
				widgets.input_icon.style.texture_id.color[1] = anim_progress*255

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	circle_glow_pulse_in = {
		{
			name = "circle_glow_pulse_in",
			start_progress = 0,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local widget_circle_glow = widgets.frame_circle_glow
				local anim_progress = math.smoothstep(local_progress, 1, 0)
				widget_circle_glow.style.texture_id.color[1] = anim_progress*100 + 155

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	circle_glow_pulse_out = {
		{
			name = "circle_glow_pulse_out",
			start_progress = 0,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local widget_circle_glow = widgets.frame_circle_glow
				local anim_progress = math.smoothstep(local_progress, 1, 0)
				widget_circle_glow.style.texture_id.color[1] = anim_progress*100 - 255

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	fog_move_back = {
		{
			name = "fog_back_1",
			start_progress = 0,
			end_progress = 100,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.fog_back_1
				widget.style.texture_id.color[1] = 90

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local widget = widgets.fog_back_1

				if widget then
					local scenegraph_id = widget.scenegraph_id
					local anim_progress = math.smoothstep(local_progress, 1, 0)
					local size = ui_scenegraph[scenegraph_id].size
					local screen_width = 1820
					local total_distance = size[1] + screen_width
					local x_offset = local_progress*total_distance

					if screen_width < x_offset then
						widget.offset[1] = -total_distance + x_offset
					else
						widget.offset[1] = x_offset
					end
				end

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "fog_back_2",
			start_progress = 0,
			end_progress = 100,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.fog_back_2

				if widget then
					widget.style.texture_id.color[1] = 90
				end

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local widget = widgets.fog_back_2

				if widget then
					local scenegraph_id = widget.scenegraph_id
					local anim_progress = math.smoothstep(local_progress, 1, 0)
					local size = ui_scenegraph[scenegraph_id].size
					local screen_width = 1820
					local total_distance = size[1] + screen_width
					local x_offset = local_progress*total_distance
					widget.offset[1] = x_offset
				end

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "fog_back_3",
			start_progress = 0,
			end_progress = 100,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.fog_back_3
				widget.style.texture_id.color[1] = 70

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local widget = widgets.fog_back_3

				if widget then
					local scenegraph_id = widget.scenegraph_id
					local anim_progress = math.smoothstep(local_progress, 1, 0)
					local size = ui_scenegraph[scenegraph_id].size
					local screen_width = 1820
					local start_offset = -(screen_width*0.5)
					local total_distance = size[1] + screen_width
					local x_offset = start_offset + local_progress*total_distance

					if screen_width < x_offset then
						widget.offset[1] = -total_distance + x_offset
					else
						widget.offset[1] = x_offset
					end
				end

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "fog_back_4",
			start_progress = 0,
			end_progress = 100,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.fog_back_4

				if widget then
					widget.style.texture_id.color[1] = 70
				end

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local widget = widgets.fog_back_4

				if widget then
					local scenegraph_id = widget.scenegraph_id
					local anim_progress = math.smoothstep(local_progress, 1, 0)
					local size = ui_scenegraph[scenegraph_id].size
					local screen_width = 1820
					local start_offset = -(screen_width*0.5)
					local total_distance = size[1] + screen_width
					local x_offset = -start_offset + local_progress*total_distance
					widget.offset[1] = x_offset
				end

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	fog_move_front = {
		{
			name = "fog_front_1",
			start_progress = 0,
			end_progress = 70,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.fog_front_1
				widget.style.texture_id.color[1] = 50

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local widget = widgets.fog_front_1

				if widget then
					local scenegraph_id = widget.scenegraph_id
					local anim_progress = math.smoothstep(local_progress, 1, 0)
					local size = ui_scenegraph[scenegraph_id].size
					local screen_width = 1820
					local length_to_screen_edge = size[1]
					local total_distance = size[1] + screen_width
					local x_offset = local_progress*total_distance

					if screen_width < x_offset then
						widget.offset[1] = -total_distance + x_offset
					else
						widget.offset[1] = x_offset
					end
				end

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "fog_front_2",
			start_progress = 0,
			end_progress = 70,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.fog_front_2

				if widget then
					widget.style.texture_id.color[1] = 50
				end

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local widget = widgets.fog_front_2

				if widget then
					local scenegraph_id = widget.scenegraph_id
					local anim_progress = math.smoothstep(local_progress, 1, 0)
					local size = ui_scenegraph[scenegraph_id].size
					local screen_width = 1820
					local length_to_screen_edge = size[1]
					local total_distance = size[1] + screen_width
					local x_offset = local_progress*total_distance
					widget.offset[1] = x_offset
				end

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "fog_front_3",
			start_progress = 0,
			end_progress = 70,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.fog_front_3
				widget.style.texture_id.color[1] = 25

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local widget = widgets.fog_front_3

				if widget then
					local scenegraph_id = widget.scenegraph_id
					local anim_progress = math.smoothstep(local_progress, 1, 0)
					local size = ui_scenegraph[scenegraph_id].size
					local screen_width = 1820
					local start_offset = -(screen_width*0.5)
					local total_distance = size[1] + screen_width
					local x_offset = start_offset + local_progress*total_distance

					if screen_width < x_offset then
						widget.offset[1] = -total_distance + x_offset
					else
						widget.offset[1] = x_offset
					end
				end

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "fog_front_4",
			start_progress = 0,
			end_progress = 70,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.fog_front_4

				if widget then
					widget.style.texture_id.color[1] = 25
				end

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local widget = widgets.fog_front_4

				if widget then
					local scenegraph_id = widget.scenegraph_id
					local anim_progress = math.smoothstep(local_progress, 1, 0)
					local size = ui_scenegraph[scenegraph_id].size
					local screen_width = 1820
					local start_offset = -(screen_width*0.5)
					local total_distance = size[1] + screen_width
					local x_offset = -start_offset + local_progress*total_distance
					widget.offset[1] = x_offset
				end

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	}
}
local menu_item_index_lookup = {
	options = 3,
	credits = 4,
	start_game = 1,
	tutorial = 2
}
local menu_button_font_size = 24
local menu_button_definitions = nil

if Development.parameter("honduras_demo") then
	menu_button_definitions = {
		UIWidgets.create_text_button("start_game_button", "start_demo_menu_button_name", menu_button_font_size)
	}
elseif BUILD == "dev" or BUILD == "debug" then
	menu_button_definitions = {
		UIWidgets.create_text_button("start_game_button", "start_game_menu_button_name", menu_button_font_size),
		UIWidgets.create_text_button("tutorial", "tutorial_menu_button_name", menu_button_font_size),
		UIWidgets.create_text_button("options", "options_menu_button_name", menu_button_font_size),
		UIWidgets.create_text_button("credits", "credits_menu_button_name", menu_button_font_size)
	}
else
	menu_button_definitions = {
		UIWidgets.create_text_button("start_game_button", "start_game_menu_button_name", menu_button_font_size),
		UIWidgets.create_text_button("tutorial", "tutorial_menu_button_name", menu_button_font_size),
		UIWidgets.create_text_button("options", "options_menu_button_name", menu_button_font_size),
		UIWidgets.create_text_button("credits", "credits_menu_button_name", menu_button_font_size)
	}
end

return {
	background_widget_definitions = background_widget_definitions,
	single_widget_definitions = single_widget_definitions,
	menu_button_definitions = menu_button_definitions,
	scenegraph_definition = scenegraph_definition,
	attract_mode_video = attract_mode_video,
	widget_definitions = widget_definitions,
	menu_button_font_size = menu_button_font_size,
	menu_item_index_lookup = menu_item_index_lookup,
	animations = animations
}
