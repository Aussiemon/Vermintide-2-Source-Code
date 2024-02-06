﻿-- chunkname: @scripts/ui/hud_ui/deus_curse_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local BACKGROUND_SIZE = {
	819,
	60,
}
local text_padding = {
	0,
	20,
}
local max_widget_height = 100
local widget_height = max_widget_height
local widget_width = 1000

BACKGROUND_SIZE[2] = BACKGROUND_SIZE[2] + widget_height + text_padding[2] * 2

local scenegraph_methods = {
	change_widget_height = function (new_height)
		widget_height = math.min(max_widget_height, new_height)
	end,
}
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.hud,
		},
		size = {
			SIZE_X,
			SIZE_Y,
		},
	},
	pivot = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		position = {
			0,
			-50,
			100,
		},
		size = {
			0,
			0,
		},
	},
	theme_icon = {
		horizontal_alignment = "center",
		parent = "title_text",
		vertical_alignment = "center",
		position = {
			0,
			30,
			1,
		},
		size = {
			50,
			50,
		},
	},
	curse_name = {
		horizontal_alignment = "center",
		parent = "pivot",
		vertical_alignment = "center",
		position = {
			0,
			-75,
			1,
		},
		size = {
			1000,
			50,
		},
	},
	title_text = {
		horizontal_alignment = "center",
		parent = "curse_name",
		vertical_alignment = "center",
		position = {
			0,
			25,
			1,
		},
		size = {
			1000,
			30,
		},
	},
	description_pivot = {
		horizontal_alignment = "center",
		parent = "curse_name",
		vertical_alignment = "top",
		position = {
			0,
			-widget_height - 25,
			1,
		},
		size = {
			0,
			0,
		},
	},
	description_widget = {
		horizontal_alignment = "center",
		parent = "pivot",
		vertical_alignment = "top",
		position = {
			0,
			0,
			0,
		},
		size = {
			BACKGROUND_SIZE[1],
			BACKGROUND_SIZE[2],
		},
	},
	background = {
		horizontal_alignment = "center",
		parent = "description_pivot",
		vertical_alignment = "center",
		size = {
			widget_width,
			widget_height + text_padding[2],
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
			widget_width,
			widget_height,
		},
		position = {
			0,
			0,
			0,
		},
	},
	top_center = {
		horizontal_alignment = "center",
		parent = "description_pivot",
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
			widget_width / 2,
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
			widget_width / 2,
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
			54,
		},
		position = {
			0,
			0,
			8,
		},
	},
	bottom_center = {
		horizontal_alignment = "center",
		parent = "description_pivot",
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
			widget_width / 2,
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
			widget_width / 2,
			6,
		},
		position = {
			31,
			-3,
			-1,
		},
	},
	frame_top_right = {
		horizontal_alignment = "left",
		parent = "description_widget",
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
		parent = "description_widget",
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
		parent = "description_widget",
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
		parent = "description_widget",
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

if not IS_WINDOWS then
	scenegraph_definition.screen.scale = "hud_fit"
end

local color = table.clone(Colors.color_definitions.white)

color[1] = 0

local widget_definitions = {
	description_widget = {
		scenegraph_id = "description_pivot",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "theme_icon",
					texture_id = "theme_icon",
					content_check_function = function (content)
						return content.theme_icon ~= nil
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
				},
				{
					pass_type = "text",
					style_id = "title_text_shadow",
					text_id = "title_text",
				},
				{
					pass_type = "text",
					style_id = "curse_name",
					text_id = "curse_name",
				},
				{
					pass_type = "text",
					style_id = "curse_name_shadow",
					text_id = "curse_name",
				},
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
					pass_type = "texture",
					style_id = "frame_texture_top_right",
					texture_id = "frame_texture",
				},
				{
					content_id = "frame_texture_top_left",
					pass_type = "texture_uv",
					style_id = "frame_texture_top_left",
				},
				{
					pass_type = "texture",
					style_id = "frame_texture_bottom_right",
					texture_id = "frame_texture",
				},
				{
					content_id = "frame_texture_bottom_left",
					pass_type = "texture_uv",
					style_id = "frame_texture_bottom_left",
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
			bottom_edge_glow = "curse_description_glow_01",
			curse_name = "",
			fraction = 1,
			frame_texture = "infoslate_frame_horizontal",
			title_text = "",
			top_center = "mission_objective_04",
			top_detail = "curse_description_01",
			top_detail_glow = "curse_description_glow_02",
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
				texture_id = "mission_objective_white_top",
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
				texture_id = "mission_objective_white_bottom",
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
				texture_id = "curse_description_glow_01",
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
			frame_texture_top_left = {
				texture_id = "infoslate_frame_horizontal",
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
			frame_texture_bottom_left = {
				texture_id = "infoslate_frame_horizontal",
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
			theme_icon = {
				scenegraph_id = "theme_icon",
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
					widget_width + 44,
					90,
				},
				default_size = {
					widget_width + 44,
					90,
				},
				offset = {
					27 - (widget_width + 44) / 2,
					-80,
					-4,
				},
				default_offset = {
					27 - (widget_width + 44) / 2,
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
					widget_width + 44,
					16,
				},
				default_size = {
					widget_width + 44,
					16,
				},
				offset = {
					27 - (widget_width + 44) / 2,
					-6,
					-4,
				},
				default_offset = {
					27 - (widget_width + 44) / 2,
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
					4,
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
					widget_width + 44,
					90,
				},
				default_size = {
					widget_width + 44,
					90,
				},
				offset = {
					27 - (widget_width + 44) / 2,
					10,
					-4,
				},
				default_offset = {
					27 - (widget_width + 44) / 2,
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
					widget_width + 44,
					16,
				},
				default_size = {
					widget_width + 44,
					16,
				},
				offset = {
					27 - (widget_width + 44) / 2,
					10,
					-4,
				},
				default_offset = {
					27 - (widget_width + 44) / 2,
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
			title_text = {
				font_size = 16,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				scenegraph_id = "title_text",
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
			title_text_shadow = {
				font_size = 16,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				scenegraph_id = "title_text",
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
			curse_name = {
				font_size = 32,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				scenegraph_id = "curse_name",
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
			curse_name_shadow = {
				font_size = 32,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				scenegraph_id = "curse_name",
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
			area_text_style = {
				default_font_size = 30,
				dynamic_font_size_word_wrap = true,
				font_size = 30,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				min_font_size = 12,
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
				dynamic_font_size_word_wrap = true,
				font_size = 30,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				min_font_size = 12,
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
			frame_texture_top_right = {
				scenegraph_id = "frame_top_right",
				color = {
					0,
					255,
					255,
					255,
				},
			},
			frame_texture_bottom_right = {
				scenegraph_id = "frame_bottom_right",
				color = {
					0,
					255,
					255,
					255,
				},
			},
			frame_texture_top_left = {
				scenegraph_id = "frame_top_left",
				color = {
					0,
					255,
					255,
					255,
				},
			},
			frame_texture_bottom_left = {
				scenegraph_id = "frame_bottom_left",
				color = {
					0,
					255,
					255,
					255,
				},
			},
		},
	},
}
local animation_definitions = {
	description_start = {
		{
			end_progress = 0.5,
			name = "entry",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				params.render_settings.alpha_multiplier = 0
				params.render_settings.snap_pixel_positions = false
				widget.style.top_edge_glow.color[1] = 0
				widget.style.bottom_edge_glow.color[1] = 0

				local description_pivot_position = scenegraph_definition.description_pivot.position

				ui_scenegraph.description_pivot.local_position[2] = description_pivot_position[2]

				local style = widget.style
				local area_text_style = style.area_text_style
				local area_text_shadow_style = style.area_text_shadow_style

				area_text_style.font_size = area_text_style.default_font_size
				area_text_shadow_style.font_size = area_text_style.default_font_size
				area_text_style.text_color[1] = 0
				area_text_shadow_style.text_color[1] = 0

				local background_scenegraph = ui_scenegraph.background
				local background_definition = scenegraph_definition.background

				background_scenegraph.size[2] = background_definition.size[2]
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress
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
				local content = widget.content
				local top_left_content = content.top_left
				local top_left_uvs = top_left_content.uvs
				local top_left_scenegraph = ui_scenegraph.top_left
				local top_left_definition = scenegraph_definition.top_left
				local top_left_current_size = top_left_scenegraph.size
				local top_left_default_size = top_left_definition.size

				top_left_current_size[1] = top_left_default_size[1] * start_progress
				top_left_uvs[2][1] = start_progress

				local bottom_left_content = content.bottom_left
				local bottom_left_uvs = bottom_left_content.uvs
				local bottom_left_scenegraph = ui_scenegraph.bottom_left
				local bottom_left_definition = scenegraph_definition.bottom_left
				local bottom_left_current_size = bottom_left_scenegraph.size
				local bottom_left_default_size = bottom_left_definition.size

				bottom_left_current_size[1] = bottom_left_default_size[1] * start_progress
				bottom_left_uvs[2][1] = start_progress

				local top_right_content = content.top_right
				local top_right_uvs = top_right_content.uvs
				local top_right_scenegraph = ui_scenegraph.top_right
				local top_right_definition = scenegraph_definition.top_right
				local top_right_current_size = top_right_scenegraph.size
				local top_right_default_size = top_right_definition.size

				top_right_current_size[1] = top_right_default_size[1] * start_progress
				top_right_uvs[1][1] = 1 - start_progress

				local bottom_right_content = content.bottom_right
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
				local content = widget.content
				local top_left_content = content.top_left
				local top_left_uvs = top_left_content.uvs
				local top_left_scenegraph = ui_scenegraph.top_left
				local top_left_definition = scenegraph_definition.top_left
				local top_left_current_size = top_left_scenegraph.size
				local top_left_default_size = top_left_definition.size

				top_left_current_size[1] = top_left_default_size[1] * anim_progress
				top_left_uvs[2][1] = anim_progress

				local bottom_left_content = content.bottom_left
				local bottom_left_uvs = bottom_left_content.uvs
				local bottom_left_scenegraph = ui_scenegraph.bottom_left
				local bottom_left_definition = scenegraph_definition.bottom_left
				local bottom_left_current_size = bottom_left_scenegraph.size
				local bottom_left_default_size = bottom_left_definition.size

				bottom_left_current_size[1] = bottom_left_default_size[1] * anim_progress
				bottom_left_uvs[2][1] = anim_progress

				local top_right_content = content.top_right
				local top_right_uvs = top_right_content.uvs
				local top_right_scenegraph = ui_scenegraph.top_right
				local top_right_definition = scenegraph_definition.top_right
				local top_right_current_size = top_right_scenegraph.size
				local top_right_default_size = top_right_definition.size

				top_right_current_size[1] = top_right_default_size[1] * anim_progress
				top_right_uvs[1][1] = 1 - anim_progress

				local bottom_right_content = content.bottom_right
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

				ui_scenegraph.top_center.local_position[2] = scenegraph_definition.top_center.position[2] + (widget_height + text_padding[2]) / 2 * anim_progress
				ui_scenegraph.bottom_center.local_position[2] = scenegraph_definition.bottom_center.position[2] + -((widget_height + text_padding[2]) / 2) * anim_progress

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

				bottom_glow_size[2] = bottom_glow_default_size[2] * anim_progress

				local top_glow_size = top_glow_style.size
				local top_glow_default_size = top_glow_style.default_size
				local top_glow_offset = top_glow_style.offset

				top_glow_size[2] = top_glow_default_size[2] * anim_progress
				top_glow_offset[2] = 10 - top_glow_size[2]

				local background_content = content.background
				local background_style = style.background
				local background_uvs = background_content.uvs
				local background_scenegraph = ui_scenegraph.background
				local background_current_size = background_scenegraph.size
				local background_default_size = {
					widget_width,
					widget_height + text_padding[2],
				}

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
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeCubic(progress)
				local style = widget.style
				local area_text_style = style.area_text_style
				local area_text_shadow_style = style.area_text_shadow_style
				local alpha = 255 * anim_progress

				area_text_style.text_color[1] = alpha
				area_text_shadow_style.text_color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				params.render_settings.snap_pixel_positions = false
			end,
		},
	},
	description_end = {
		{
			end_progress = 0.3,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				ui_scenegraph.description_pivot.local_position[2] = 0
			end,
		},
	},
}

return {
	animation_definitions = animation_definitions,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	scenegraph_methods = scenegraph_methods,
	text_background_width = widget_width,
}
