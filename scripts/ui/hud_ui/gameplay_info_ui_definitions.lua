-- chunkname: @scripts/ui/hud_ui/gameplay_info_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local RETAINED_MODE_ENABLED = false
local help_position = {
	SIZE_X * 0.5 - 128,
	SIZE_Y * 0.7 - 64,
	15,
}
local scenegraph_definition = {
	screen = {
		scale = "hud_scale_fit",
		size = {
			SIZE_X,
			SIZE_Y,
		},
		position = {
			0,
			0,
			UILayer.hud,
		},
	},
	center_screen = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			512,
			256,
		},
		position = {
			0,
			-SIZE_Y * 0.3,
			15,
		},
	},
	help_pos = {
		horizontal_alignment = "bottom",
		parent = "screen",
		vertical_alignment = "left",
		size = {
			256,
			128,
		},
		position = help_position,
	},
	help_pos_center = {
		horizontal_alignment = "center",
		parent = "help_pos",
		vertical_alignment = "center",
		size = {
			256,
			128,
		},
		position = {
			0,
			0,
			15,
		},
	},
	ghost_mode_text_field = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			1,
			1,
		},
		position = {
			0,
			220,
			3,
		},
	},
	teleport_background = {
		horizontal_alignment = "center",
		parent = "ghost_mode_text_field",
		vertical_alignment = "center",
		size = {
			411,
			61,
		},
		position = {
			0,
			50,
			1,
		},
	},
	teleport_text = {
		horizontal_alignment = "left",
		parent = "ghost_mode_text_field",
		vertical_alignment = "center",
		size = {
			800,
			50,
		},
		position = {
			0,
			50,
			2,
		},
	},
	teleport_text_input = {
		horizontal_alignment = "left",
		parent = "ghost_mode_text_field",
		vertical_alignment = "center",
		size = {
			800,
			50,
		},
		position = {
			0,
			50,
			2,
		},
	},
	open_selection_text = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			800,
			50,
		},
		position = {
			0,
			70,
			2,
		},
	},
	spawn_info = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			550,
			200,
		},
		position = {
			0,
			40,
			2,
		},
	},
	spawn_info_text = {
		horizontal_alignment = "right",
		parent = "spawn_info",
		vertical_alignment = "center",
		size = {
			400,
			184,
		},
		position = {
			16,
			0,
			4,
		},
	},
}
local ghost_mode_text_style = {
	dynamic_font_size = false,
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	upper_case = false,
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
local ghost_mode_text_sub_style = {
	dynamic_font_size = false,
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("white", 255),
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
local open_selection_text_style = table.clone(ghost_mode_text_sub_style)

open_selection_text_style.use_shadow = false

local ghost_mode_input_style = {
	dynamic_font_size = false,
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "left",
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

local function create_spawn_info_widget()
	local scenegraph_id = "spawn_info"
	local text_scenegraph_id = "spawn_info_text"
	local full_size = scenegraph_definition[scenegraph_id].size
	local glow_frame_style = "frame_outer_glow_01_white"
	local glow_frame_settings = UIFrameSettings[glow_frame_style]
	local glow_frame_width = glow_frame_settings.texture_sizes.horizontal[2]
	local portrait_frame_style = "versus_hero_selection_hero_portrait_frame"
	local portrait_frame_settings = UIFrameSettings[portrait_frame_style]
	local portrait_frame_width = portrait_frame_settings.texture_sizes.horizontal[2]
	local portrait_size = {
		143,
		169,
	}

	return {
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "background",
				},
				{
					pass_type = "texture_frame",
					style_id = "glow_frame",
					texture_id = "glow_frame",
				},
				{
					pass_type = "texture_frame",
					style_id = "portrait_frame",
					texture_id = "portrait_frame",
				},
				{
					pass_type = "texture",
					style_id = "portrait",
					texture_id = "portrait",
				},
				{
					pass_type = "text",
					style_id = "pick_name",
					text_id = "pick_name",
				},
				{
					pass_type = "text",
					style_id = "spawn_state_text",
					text_id = "spawn_state_text",
				},
				{
					pass_type = "text",
					style_id = "fail_reason_text",
					text_id = "fail_reason_text",
				},
			},
		},
		content = {
			fail_reason_text = "fail_reason_text",
			pick_name = "PICK NAME",
			portrait = "icons_placeholder",
			spawn_state_text = "spawn_state_text",
			glow_frame = glow_frame_settings.texture,
			portrait_frame = portrait_frame_settings.texture,
		},
		style = {
			background = {
				size = full_size,
				color = Colors.get_color_table_with_alpha("black", 150),
			},
			glow_frame = {
				size = {
					full_size[1] - 2,
					full_size[2] - 4,
				},
				default_size = {
					full_size[1] - 2,
					full_size[2] - 4,
				},
				texture_size = glow_frame_settings.texture_size,
				texture_sizes = glow_frame_settings.texture_sizes,
				frame_margins = {
					-glow_frame_width,
					-glow_frame_width,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					2,
					4,
				},
				default_offset = {
					0,
					2,
					4,
				},
			},
			portrait_frame = {
				size = {
					portrait_size[1] - 2,
					portrait_size[2] - 4,
				},
				default_size = {
					portrait_size[1] - 2,
					portrait_size[2] - 4,
				},
				texture_size = portrait_frame_settings.texture_size,
				texture_sizes = portrait_frame_settings.texture_sizes,
				frame_margins = {
					-portrait_frame_width,
					-portrait_frame_width,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					16,
					18,
					4,
				},
				default_offset = {
					20,
					18,
					4,
				},
			},
			portrait = {
				horizontal_alignment = "left",
				size = portrait_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					16,
					16,
					1,
				},
			},
			pick_name = {
				dynamic_font_size = true,
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				use_shadow = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					10,
					-20,
					10,
				},
				scenegraph_id = text_scenegraph_id,
			},
			spawn_state_text = {
				dynamic_font_size = true,
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					10,
					-5,
					10,
				},
				scenegraph_id = text_scenegraph_id,
			},
			fail_reason_text = {
				dynamic_font_size = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("red", 255),
				offset = {
					10,
					-35,
					10,
				},
				scenegraph_id = text_scenegraph_id,
			},
		},
		offset = {
			0,
			0,
			10,
		},
		scenegraph_id = scenegraph_id,
	}
end

local widgets = {
	teleport_text = UIWidgets.create_simple_text(Localize("matchmaking_surfix_ghost_mode"), "teleport_text", nil, nil, ghost_mode_text_style, nil, RETAINED_MODE_ENABLED),
	teleport_background = UIWidgets.create_simple_rect("teleport_background", {
		0,
		0,
		0,
		0,
	}, nil, nil, RETAINED_MODE_ENABLED),
	teleport_text_input = UIWidgets.create_simple_text(Localize("matchmaking_surfix_ghost_mode"), "teleport_text_input", nil, nil, ghost_mode_input_style, nil, RETAINED_MODE_ENABLED),
	info_help = UIWidgets.create_simple_texture("vs_info_open_career", "help_pos_center", nil, RETAINED_MODE_ENABLED),
}
local spawn_info_widgets = {
	open_selection_text = UIWidgets.create_simple_text("", "open_selection_text", nil, nil, open_selection_text_style, nil, RETAINED_MODE_ENABLED),
	spawn_help = create_spawn_info_widget(),
}
local animation_definitions = {
	on_enter = {
		{
			end_progress = 1.5,
			name = "fade_in_scale_up_center",
			start_progress = 0.2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
				params.ui_scenegraph.help_pos_center.size = {
					0,
					0,
				}

				if params.start_position then
					params.ui_scenegraph.help_pos.position[1] = params.start_position[1]
					params.ui_scenegraph.help_pos.position[2] = params.start_position[2]
				else
					params.start_position = {
						scenegraph_definition.help_pos.position[1],
						scenegraph_definition.help_pos.position[2],
					}
				end
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress

				local size_x = scenegraph_definition.help_pos_center.size[1] * 1.5
				local size_y = scenegraph_definition.help_pos_center.size[2] * 1.5

				params.ui_scenegraph.help_pos_center.size = {
					size_x * anim_progress,
					size_y * anim_progress,
				}
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.start_size = {
					params.ui_scenegraph.help_pos_center.size[1],
					params.ui_scenegraph.help_pos_center.size[2],
				}
			end,
		},
		{
			end_progress = 1.6,
			name = "scale_down_move_to_corner",
			start_progress = 1.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local start_size_x = params.start_size[1]
				local start_size_y = params.start_size[2]
				local wanted_size_x = scenegraph_definition.help_pos_center.size[1]
				local wanted_size_y = scenegraph_definition.help_pos_center.size[2]
				local dt_x = start_size_x - wanted_size_x
				local dt_y = start_size_y - wanted_size_y

				params.ui_scenegraph.help_pos_center.size = {
					start_size_x - dt_x * progress,
					start_size_y - dt_y * progress,
				}

				local start_position_x = params.start_position[1]
				local start_position_y = params.start_position[2]
				local wanted_position_x = -48
				local wanted_position_y = 128

				dt_x = start_position_x - wanted_position_x
				dt_y = start_position_y - wanted_position_y
				params.ui_scenegraph.help_pos.position[1] = start_position_x - dt_x * progress
				params.ui_scenegraph.help_pos.position[2] = start_position_y - dt_y * progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	scenegraph = scenegraph_definition,
	widgets = widgets,
	spawn_info_widgets = spawn_info_widgets,
	animation_definitions = animation_definitions,
}
