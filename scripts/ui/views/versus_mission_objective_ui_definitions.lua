-- chunkname: @scripts/ui/views/versus_mission_objective_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local BACKGROUND_SIZE = {
	819,
	60,
}
local ICON_SIZE = {
	64,
	64,
}
local mission_background_size = {
	BACKGROUND_SIZE[1],
	BACKGROUND_SIZE[2],
}
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
	objective_text = {
		horizontal_alignment = "center",
		parent = "pivot",
		vertical_alignment = "top",
		size = {
			544,
			50,
		},
		position = {
			0,
			-10,
			0,
		},
	},
	objective = {
		horizontal_alignment = "center",
		parent = "pivot",
		vertical_alignment = "top",
		size = {
			302.4,
			117.6,
		},
		position = {
			0,
			-60,
			10,
		},
	},
	mission_pivot = {
		horizontal_alignment = "center",
		parent = "pivot",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			0,
			-250,
			1,
		},
	},
	mission_widget = {
		horizontal_alignment = "center",
		parent = "pivot",
		vertical_alignment = "top",
		size = mission_background_size,
		position = {
			0,
			0,
			0,
		},
	},
	background = {
		horizontal_alignment = "center",
		parent = "mission_pivot",
		vertical_alignment = "center",
		size = {
			574,
			90,
		},
		position = {
			0,
			-1,
			0,
		},
	},
	area_text_background = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		size = {
			1800,
			90,
		},
		position = {
			0,
			0,
			0,
		},
	},
	duration_text_background = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		size = {
			1800,
			90,
		},
		position = {
			0,
			0,
			0,
		},
	},
	top_center = {
		horizontal_alignment = "center",
		parent = "mission_pivot",
		vertical_alignment = "center",
		size = {
			54,
			22,
		},
		position = {
			0,
			0,
			5,
		},
	},
	top_left = {
		horizontal_alignment = "right",
		parent = "top_center",
		vertical_alignment = "center",
		size = {
			264,
			6,
		},
		position = {
			-31,
			0,
			-1,
		},
	},
	top_right = {
		horizontal_alignment = "left",
		parent = "top_center",
		vertical_alignment = "center",
		size = {
			264,
			6,
		},
		position = {
			31,
			0,
			-1,
		},
	},
	top_detail = {
		horizontal_alignment = "center",
		parent = "top_center",
		vertical_alignment = "center",
		size = {
			54,
			22,
		},
		position = {
			0,
			0,
			8,
		},
	},
	bottom_center = {
		horizontal_alignment = "center",
		parent = "mission_pivot",
		vertical_alignment = "center",
		size = {
			54,
			22,
		},
		position = {
			0,
			-1,
			6,
		},
	},
	bottom_left = {
		horizontal_alignment = "right",
		parent = "bottom_center",
		vertical_alignment = "center",
		size = {
			264,
			6,
		},
		position = {
			-31,
			-3,
			-1,
		},
	},
	bottom_right = {
		horizontal_alignment = "left",
		parent = "bottom_center",
		vertical_alignment = "center",
		size = {
			264,
			6,
		},
		position = {
			31,
			-3,
			-1,
		},
	},
	mission_icon_left = {
		horizontal_alignment = "center",
		parent = "mission_widget",
		vertical_alignment = "center",
		size = {
			ICON_SIZE[1],
			ICON_SIZE[2],
		},
		position = {
			0,
			0,
			1,
		},
	},
	mission_icon_right = {
		horizontal_alignment = "center",
		parent = "mission_widget",
		vertical_alignment = "center",
		size = {
			ICON_SIZE[1],
			ICON_SIZE[2],
		},
		position = {
			0,
			0,
			1,
		},
	},
	frame_top_right = {
		horizontal_alignment = "left",
		parent = "mission_widget",
		vertical_alignment = "top",
		size = {
			450,
			4,
		},
		position = {
			BACKGROUND_SIZE[1] / 2,
			2,
			3,
		},
	},
	frame_top_left = {
		horizontal_alignment = "right",
		parent = "mission_widget",
		vertical_alignment = "top",
		size = {
			450,
			4,
		},
		position = {
			-BACKGROUND_SIZE[1] / 2,
			2,
			3,
		},
	},
	frame_bottom_right = {
		horizontal_alignment = "left",
		parent = "mission_widget",
		vertical_alignment = "bottom",
		size = {
			450,
			4,
		},
		position = {
			BACKGROUND_SIZE[1] / 2,
			-2,
			3,
		},
	},
	frame_bottom_left = {
		horizontal_alignment = "right",
		parent = "mission_widget",
		vertical_alignment = "bottom",
		size = {
			450,
			4,
		},
		position = {
			-BACKGROUND_SIZE[1] / 2,
			-2,
			3,
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

local function create_mission_objective_widget(scenegraph_id)
	return {
		alpha_multiplier = 1,
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "area_text_style",
					text_id = "area_text_content",
				},
				{
					pass_type = "text",
					style_id = "area_text_shadow_style",
					text_id = "area_text_content",
				},
				{
					pass_type = "text",
					style_id = "duration_text_style",
					text_id = "duration_text_content",
					content_check_function = function (content, style)
						return content.duration_text_content
					end,
				},
				{
					pass_type = "text",
					style_id = "duration_text_shadow_style",
					text_id = "duration_text_content",
					content_check_function = function (content, style)
						return content.duration_text_content
					end,
				},
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "top_center",
					texture_id = "top_center",
				},
				{
					content_id = "top_glow",
					pass_type = "texture_uv",
					style_id = "top_glow",
				},
				{
					content_id = "top_edge_glow",
					pass_type = "texture_uv",
					style_id = "top_edge_glow",
				},
				{
					pass_type = "texture",
					style_id = "top_detail",
					texture_id = "top_detail",
				},
				{
					pass_type = "texture",
					style_id = "top_detail_glow",
					texture_id = "top_detail_glow",
				},
				{
					content_id = "top_left",
					pass_type = "texture_uv",
					style_id = "top_left",
				},
				{
					content_id = "top_right",
					pass_type = "texture_uv",
					style_id = "top_right",
				},
				{
					content_id = "bottom_left",
					pass_type = "texture_uv",
					style_id = "bottom_left",
				},
				{
					content_id = "bottom_right",
					pass_type = "texture_uv",
					style_id = "bottom_right",
				},
				{
					pass_type = "texture",
					style_id = "bottom_center",
					texture_id = "bottom_center",
				},
				{
					content_id = "bottom_glow",
					pass_type = "texture_uv",
					style_id = "bottom_glow",
				},
				{
					pass_type = "texture",
					style_id = "bottom_edge_glow",
					texture_id = "bottom_edge_glow",
				},
				{
					pass_type = "texture_uv_dynamic_color_uvs_size_offset",
					style_id = "background_texture",
					texture_id = "background_texture",
					dynamic_function = function (content, style, size, dt)
						local fraction = content.fraction
						local color = style.color
						local uv_start_pixels = style.uv_start_pixels
						local uv_scale_pixels = style.uv_scale_pixels
						local uv_pixels = uv_start_pixels + uv_scale_pixels * fraction
						local uvs = style.uvs
						local uv_scale_axis = style.scale_axis
						local uv_diff = uv_pixels / (uv_start_pixels + uv_scale_pixels)
						local side_scale = (1 - uv_diff) * 0.5

						uvs[1][uv_scale_axis] = side_scale
						uvs[2][uv_scale_axis] = 1 - side_scale

						return color, uvs, size, style.offset
					end,
				},
			},
		},
		content = {
			area_text_content = "n/a",
			background_texture = "hud_difficulty_notification_bg_center",
			bottom_center = "mission_objective_02",
			bottom_edge_glow = "mission_objective_glow_01",
			fraction = 1,
			top_center = "mission_objective_04",
			top_detail = "mission_objective_01",
			top_detail_glow = "mission_objective_glow_02",
			background = {
				texture_id = "mission_objective_bg",
				uvs = {
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
			top_glow = {
				texture_id = "mission_objective_top",
				uvs = {
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
			bottom_glow = {
				texture_id = "mission_objective_bottom",
				uvs = {
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
			top_edge_glow = {
				texture_id = "mission_objective_glow_01",
				uvs = {
					{
						0,
						1,
					},
					{
						1,
						0,
					},
				},
			},
			top_left = {
				texture_id = "mission_objective_05",
				uvs = {
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
			top_right = {
				texture_id = "mission_objective_05",
				uvs = {
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
			bottom_left = {
				texture_id = "mission_objective_03",
				uvs = {
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
			bottom_right = {
				texture_id = "mission_objective_03",
				uvs = {
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
			background = {
				scenegraph_id = "background",
				offset = {
					0,
					0,
					0,
				},
				color = {
					0,
					255,
					255,
					255,
				},
			},
			top_center = {
				scenegraph_id = "top_center",
				offset = {
					0,
					0,
					0,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			top_glow = {
				scenegraph_id = "top_center",
				size = {
					544,
					90,
				},
				default_size = {
					544,
					90,
				},
				offset = {
					-245,
					-80,
					-4,
				},
				default_offset = {
					-245,
					-80,
					-4,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			top_edge_glow = {
				scenegraph_id = "top_center",
				size = {
					544,
					16,
				},
				default_size = {
					544,
					16,
				},
				offset = {
					-245,
					-6,
					-4,
				},
				default_offset = {
					-245,
					-6,
					-5,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			top_detail = {
				scenegraph_id = "top_detail",
				offset = {
					0,
					0,
					0,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			top_detail_glow = {
				scenegraph_id = "top_detail",
				offset = {
					0,
					0,
					1,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			top_left = {
				scenegraph_id = "top_left",
				offset = {
					0,
					0,
					0,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			top_right = {
				scenegraph_id = "top_right",
				offset = {
					0,
					0,
					0,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			bottom_left = {
				scenegraph_id = "bottom_left",
				offset = {
					0,
					0,
					0,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			bottom_right = {
				scenegraph_id = "bottom_right",
				offset = {
					0,
					0,
					0,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			bottom_center = {
				scenegraph_id = "bottom_center",
				offset = {
					0,
					0,
					0,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			bottom_glow = {
				scenegraph_id = "bottom_center",
				size = {
					544,
					90,
				},
				default_size = {
					544,
					90,
				},
				offset = {
					-245,
					10,
					-4,
				},
				default_offset = {
					-245,
					10,
					-4,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			bottom_edge_glow = {
				scenegraph_id = "bottom_center",
				size = {
					544,
					16,
				},
				default_size = {
					544,
					16,
				},
				offset = {
					-245,
					10,
					-4,
				},
				default_offset = {
					-245,
					10,
					-5,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			area_text_style = {
				default_font_size = 30,
				font_size = 30,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				min_font_size = 20,
				scenegraph_id = "area_text_background",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					-1,
					11,
				},
			},
			area_text_shadow_style = {
				default_font_size = 30,
				font_size = 30,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				min_font_size = 20,
				scenegraph_id = "area_text_background",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-3,
					10,
				},
			},
			duration_text_style = {
				default_font_size = 30,
				font_size = 30,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				min_font_size = 20,
				scenegraph_id = "duration_text_background",
				upper_case = false,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					-1,
					11,
				},
			},
			duration_text_shadow_style = {
				default_font_size = 30,
				font_size = 30,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				min_font_size = 20,
				scenegraph_id = "duration_text_background",
				upper_case = false,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-3,
					10,
				},
			},
			background_texture = {
				background_component = true,
				offset_scale = 1,
				scale_axis = 2,
				uv_start_pixels = 0,
				uv_scale_pixels = BACKGROUND_SIZE[2],
				uvs = {
					{
						0,
						0,
					},
					{
						1,
						1,
					},
				},
				offset = {
					0,
					0,
					0,
				},
				color = {
					0,
					255,
					255,
					255,
				},
			},
		},
		scenegraph_id = scenegraph_id,
	}
end

local widget_definitions = {
	round_start_timer = UIWidgets.create_simple_text("", "objective", nil, nil, timer_counter_text_style),
	round_starting_text = UIWidgets.create_simple_text("", "objective", nil, nil, round_starting_text_style),
	objective = UIWidgets.create_objective_score_widget("objective", scenegraph_definition.objective.size),
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
	mission_start = {
		{
			end_progress = 0.5,
			name = "entry",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				widget.alpha_multiplier = 0
				params.render_settings.snap_pixel_positions = false
				widget.style.top_edge_glow.color[1] = 0
				widget.style.bottom_edge_glow.color[1] = 0
				ui_scenegraph.mission_pivot.local_position[2] = scenegraph_definition.mission_pivot.position[2]

				local style = widget.style
				local content = widget.content
				local area_text_style = style.area_text_style
				local area_text_shadow_style = style.area_text_shadow_style

				area_text_style.font_size = area_text_style.default_font_size
				area_text_shadow_style.font_size = area_text_style.default_font_size
				area_text_style.text_color[1] = 0
				area_text_shadow_style.text_color[1] = 0

				local duration_text_style = style.duration_text_style
				local duration_text_shadow_style = style.duration_text_shadow_style

				duration_text_style.font_size = duration_text_style.default_font_size
				duration_text_shadow_style.font_size = duration_text_style.default_font_size
				duration_text_style.text_color[1] = 0
				duration_text_shadow_style.text_color[1] = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				widget.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
		},
		{
			end_progress = 0.8,
			name = "unfold",
			start_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				local start_progress = 0.1
				local style = widget.style
				local content = widget.content
				local top_left_content = content.top_left
				local top_left_style = style.top_left
				local top_left_uvs = top_left_content.uvs
				local top_left_scenegraph = ui_scenegraph.top_left
				local top_left_definition = scenegraph_definition.top_left
				local top_left_current_size = top_left_scenegraph.size
				local top_left_default_size = top_left_definition.size

				top_left_current_size[1] = top_left_default_size[1] * start_progress
				top_left_uvs[2][1] = start_progress

				local bottom_left_content = content.bottom_left
				local bottom_left_style = style.bottom_left
				local bottom_left_uvs = bottom_left_content.uvs
				local bottom_left_scenegraph = ui_scenegraph.bottom_left
				local bottom_left_definition = scenegraph_definition.bottom_left
				local bottom_left_current_size = bottom_left_scenegraph.size
				local bottom_left_default_size = bottom_left_definition.size

				bottom_left_current_size[1] = bottom_left_default_size[1] * start_progress
				bottom_left_uvs[2][1] = start_progress

				local top_right_content = content.top_right
				local top_right_style = style.top_right
				local top_right_uvs = top_right_content.uvs
				local top_right_scenegraph = ui_scenegraph.top_right
				local top_right_definition = scenegraph_definition.top_right
				local top_right_current_size = top_right_scenegraph.size
				local top_right_default_size = top_right_definition.size

				top_right_current_size[1] = top_right_default_size[1] * start_progress
				top_right_uvs[1][1] = 1 - start_progress

				local bottom_right_content = content.bottom_right
				local bottom_right_style = style.bottom_right
				local bottom_right_uvs = bottom_right_content.uvs
				local bottom_right_scenegraph = ui_scenegraph.bottom_right
				local bottom_right_definition = scenegraph_definition.bottom_right
				local bottom_right_current_size = bottom_right_scenegraph.size
				local bottom_right_default_size = bottom_right_definition.size

				bottom_right_current_size[1] = bottom_right_default_size[1] * start_progress
				bottom_right_uvs[1][1] = 1 - start_progress
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.min(0.1 + math.easeInCubic(progress), 1)
				local style = widget.style
				local content = widget.content
				local top_left_content = content.top_left
				local top_left_style = style.top_left
				local top_left_uvs = top_left_content.uvs
				local top_left_scenegraph = ui_scenegraph.top_left
				local top_left_definition = scenegraph_definition.top_left
				local top_left_current_size = top_left_scenegraph.size
				local top_left_default_size = top_left_definition.size

				top_left_current_size[1] = top_left_default_size[1] * anim_progress
				top_left_uvs[2][1] = anim_progress

				local bottom_left_content = content.bottom_left
				local bottom_left_style = style.bottom_left
				local bottom_left_uvs = bottom_left_content.uvs
				local bottom_left_scenegraph = ui_scenegraph.bottom_left
				local bottom_left_definition = scenegraph_definition.bottom_left
				local bottom_left_current_size = bottom_left_scenegraph.size
				local bottom_left_default_size = bottom_left_definition.size

				bottom_left_current_size[1] = bottom_left_default_size[1] * anim_progress
				bottom_left_uvs[2][1] = anim_progress

				local top_right_content = content.top_right
				local top_right_style = style.top_right
				local top_right_uvs = top_right_content.uvs
				local top_right_scenegraph = ui_scenegraph.top_right
				local top_right_definition = scenegraph_definition.top_right
				local top_right_current_size = top_right_scenegraph.size
				local top_right_default_size = top_right_definition.size

				top_right_current_size[1] = top_right_default_size[1] * anim_progress
				top_right_uvs[1][1] = 1 - anim_progress

				local bottom_right_content = content.bottom_right
				local bottom_right_style = style.bottom_right
				local bottom_right_uvs = bottom_right_content.uvs
				local bottom_right_scenegraph = ui_scenegraph.bottom_right
				local bottom_right_definition = scenegraph_definition.bottom_right
				local bottom_right_current_size = bottom_right_scenegraph.size
				local bottom_right_default_size = bottom_right_definition.size

				bottom_right_current_size[1] = bottom_right_default_size[1] * anim_progress
				bottom_right_uvs[1][1] = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
		},
		{
			end_progress = 1.5,
			name = "open",
			start_progress = 0.8,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				local style = widget.style
				local content = widget.content
				local top_glow_style = style.top_glow
				local bottom_glow_style = style.bottom_glow
				local background_style = style.background

				content.top_glow.uvs[1][2] = 0
				content.bottom_glow.uvs[2][2] = 1
				top_glow_style.size[2] = 0
				bottom_glow_style.size[2] = 0
				background_style.color[1] = 0
				ui_scenegraph.top_center.local_position[2] = scenegraph_definition.top_center.position[2]
				ui_scenegraph.bottom_center.local_position[2] = scenegraph_definition.bottom_center.position[2]
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				ui_scenegraph.top_center.local_position[2] = scenegraph_definition.top_center.position[2] + 45 * anim_progress
				ui_scenegraph.bottom_center.local_position[2] = scenegraph_definition.bottom_center.position[2] + -45 * anim_progress

				local style = widget.style
				local content = widget.content
				local top_glow_content = content.top_glow
				local bottom_glow_content = content.bottom_glow
				local top_glow_uvs = top_glow_content.uvs
				local bottom_glow_uvs = bottom_glow_content.uvs

				top_glow_uvs[2][2] = anim_progress
				bottom_glow_uvs[1][2] = 1 - anim_progress

				local top_glow_style = style.top_glow
				local bottom_glow_style = style.bottom_glow
				local bottom_glow_size = bottom_glow_style.size
				local bottom_glow_default_size = bottom_glow_style.default_size
				local bottom_glow_offset = bottom_glow_style.offset
				local bottom_glow_default_offset = bottom_glow_style.default_offset

				bottom_glow_size[2] = bottom_glow_default_size[2] * anim_progress

				local top_glow_size = top_glow_style.size
				local top_glow_default_size = top_glow_style.default_size
				local top_glow_offset = top_glow_style.offset
				local top_glow_default_offset = top_glow_style.default_offset

				top_glow_size[2] = top_glow_default_size[2] * anim_progress
				top_glow_offset[2] = 10 - top_glow_size[2]

				local background_content = content.background
				local background_style = style.background
				local background_uvs = background_content.uvs
				local background_scenegraph = ui_scenegraph.background
				local background_definition = scenegraph_definition.background
				local background_current_size = background_scenegraph.size
				local background_default_size = background_definition.size

				background_current_size[2] = background_default_size[2] * anim_progress
				background_uvs[1][2] = 0.5 - 0.5 * anim_progress
				background_uvs[2][2] = 0.5 + 0.5 * anim_progress
				background_style.color[1] = 255
				widget.style.top_edge_glow.color[1] = 255 * anim_progress
				widget.style.bottom_edge_glow.color[1] = 255 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
		},
		{
			end_progress = 1.5,
			name = "text_entry",
			start_progress = 0.9,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				local style = widget.style
				local content = widget.content
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeCubic(progress)
				local style = widget.style
				local content = widget.content
				local area_text_style = style.area_text_style
				local area_text_shadow_style = style.area_text_shadow_style
				local alpha = 255 * anim_progress

				area_text_style.text_color[1] = alpha
				area_text_shadow_style.text_color[1] = alpha

				local duration_text_style = style.duration_text_style
				local duration_text_shadow_style = style.duration_text_shadow_style

				duration_text_style.text_color[1] = alpha
				duration_text_shadow_style.text_color[1] = alpha

				local size_progress = math.ease_pulse(math.easeInCubic(progress))
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				params.render_settings.snap_pixel_positions = false
			end,
		},
		{
			end_progress = 5.3,
			name = "text_minimize",
			start_progress = 5,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				local style = widget.style
				local content = widget.content
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local style = widget.style
				local content = widget.content
				local area_text_style = style.area_text_style
				local area_text_shadow_style = style.area_text_shadow_style
				local duration_text_style = style.duration_text_style
				local duration_text_shadow_style = style.duration_text_shadow_style
				local min_font_size = area_text_style.min_font_size
				local default_font_size = area_text_style.default_font_size
				local font_size_diff = default_font_size - min_font_size
				local new_font_size = default_font_size - font_size_diff * anim_progress

				area_text_style.font_size = new_font_size
				area_text_shadow_style.font_size = new_font_size
				duration_text_style.font_size = new_font_size
				duration_text_shadow_style.font_size = new_font_size
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				local style = widget.style
				local content = widget.content
				local text = content.area_text_content
				local duration_text = content.duration_text_content

				if duration_text then
					local ui_renderer = params.ui_renderer
					local font, size_of_font = UIFontByResolution(style.area_text_style)
					local font_material, font_size = font[1], size_of_font
					local text_string = string.upper(content.area_text_content)
					local text_width = UIRenderer.text_size(ui_renderer, text_string, font_material, font_size)
					local duration_string = duration_text
					local duration_width = UIRenderer.text_size(ui_renderer, duration_string, font_material, font_size)
					local area_text_background_size_x = ui_scenegraph.area_text_background.size[1]
					local duration_text_background_size_x = ui_scenegraph.duration_text_background.size[1]

					ui_scenegraph.area_text_background.position[1] = duration_width * 0.5
					ui_scenegraph.duration_text_background.position[1] = -text_width * 0.5
				end
			end,
		},
		{
			end_progress = 5.3,
			name = "collapse",
			start_progress = 5,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				local style = widget.style
				local content = widget.content
				local top_glow_style = style.top_glow
				local bottom_glow_style = style.bottom_glow
				local background_style = style.background

				top_glow_style.size[2] = 0
				bottom_glow_style.size[2] = 0
				background_style.color[1] = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local anim_progress_inverted = 1 - math.easeOutCubic(progress)
				local style = widget.style
				local content = widget.content
				local text_height = content.text_height or 45
				local anim_distance = (90 - text_height) / 2

				ui_scenegraph.top_center.local_position[2] = scenegraph_definition.top_center.position[2] + 45 - anim_distance * anim_progress
				ui_scenegraph.bottom_center.local_position[2] = scenegraph_definition.bottom_center.position[2] - 45 + anim_distance * anim_progress

				local top_glow_content = content.top_glow
				local bottom_glow_content = content.bottom_glow
				local top_glow_uvs = top_glow_content.uvs
				local bottom_glow_uvs = bottom_glow_content.uvs

				bottom_glow_uvs[2][2] = anim_progress_inverted
				top_glow_uvs[1][2] = 1 - anim_progress_inverted

				local top_glow_style = style.top_glow
				local bottom_glow_style = style.bottom_glow
				local bottom_glow_size = bottom_glow_style.size
				local bottom_glow_default_size = bottom_glow_style.default_size
				local bottom_glow_offset = bottom_glow_style.offset
				local bottom_glow_default_offset = bottom_glow_style.default_offset

				bottom_glow_size[2] = bottom_glow_default_size[2] * anim_progress_inverted

				local top_glow_size = top_glow_style.size
				local top_glow_default_size = top_glow_style.default_size
				local top_glow_offset = top_glow_style.offset
				local top_glow_default_offset = top_glow_style.default_offset

				top_glow_size[2] = top_glow_default_size[2] * anim_progress_inverted
				top_glow_offset[2] = 10 - top_glow_size[2]

				local background_content = content.background
				local background_style = style.background
				local background_uvs = background_content.uvs
				local background_scenegraph = ui_scenegraph.background
				local background_definition = scenegraph_definition.background
				local background_current_size = background_scenegraph.size
				local background_default_size = background_definition.size

				background_current_size[2] = background_default_size[2] - (background_default_size[2] - text_height) * anim_progress

				local background_size_fraction = text_height / background_default_size[2] * anim_progress

				background_uvs[1][2] = 0.5 * background_size_fraction
				background_uvs[2][2] = 1 - background_size_fraction / 2
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
		},
		{
			end_progress = 5.3,
			name = "fade_out",
			start_progress = 5,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				widget.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				ui_scenegraph.mission_pivot.local_position[2] = -30
			end,
		},
		{
			end_progress = 5.6,
			name = "fade_in",
			start_progress = 5.3,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local game_mode_key = Managers.state.game_mode:game_mode_key()

				if game_mode_key ~= "weave" then
					local anim_progress = math.easeOutCubic(progress)

					widget.alpha_multiplier = anim_progress
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				params.render_settings.snap_pixel_positions = true
			end,
		},
	},
}

return {
	animation_definitions = animation_definitions,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	objective_text = create_mission_objective_widget("mission_pivot"),
}
