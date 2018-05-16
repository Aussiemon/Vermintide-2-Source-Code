local SIZE_X = 1920
local SIZE_Y = 1080
local ICON_SIZE = {
	64,
	64
}
local BACKGROUND_SIZE = {
	819,
	60
}
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.hud
		},
		size = {
			SIZE_X,
			SIZE_Y
		}
	},
	pivot = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0,
			-50,
			100
		},
		size = {
			0,
			0
		}
	},
	mission_pivot = {
		vertical_alignment = "top",
		parent = "pivot",
		horizontal_alignment = "center",
		position = {
			0,
			-200,
			1
		},
		size = {
			0,
			0
		}
	},
	mission_widget = {
		vertical_alignment = "top",
		parent = "pivot",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			0
		},
		size = {
			BACKGROUND_SIZE[1],
			BACKGROUND_SIZE[2]
		}
	},
	background = {
		vertical_alignment = "center",
		parent = "mission_pivot",
		horizontal_alignment = "center",
		size = {
			574,
			90
		},
		position = {
			0,
			-1,
			0
		}
	},
	top_center = {
		vertical_alignment = "center",
		parent = "mission_pivot",
		horizontal_alignment = "center",
		size = {
			54,
			22
		},
		position = {
			0,
			0,
			5
		}
	},
	top_left = {
		vertical_alignment = "center",
		parent = "top_center",
		horizontal_alignment = "right",
		size = {
			264,
			6
		},
		position = {
			-31,
			0,
			-1
		}
	},
	top_right = {
		vertical_alignment = "center",
		parent = "top_center",
		horizontal_alignment = "left",
		size = {
			264,
			6
		},
		position = {
			31,
			0,
			-1
		}
	},
	top_detail = {
		vertical_alignment = "center",
		parent = "top_center",
		horizontal_alignment = "center",
		size = {
			54,
			22
		},
		position = {
			0,
			0,
			8
		}
	},
	bottom_center = {
		vertical_alignment = "center",
		parent = "mission_pivot",
		horizontal_alignment = "center",
		size = {
			54,
			22
		},
		position = {
			0,
			-1,
			6
		}
	},
	bottom_left = {
		vertical_alignment = "center",
		parent = "bottom_center",
		horizontal_alignment = "right",
		size = {
			264,
			6
		},
		position = {
			-31,
			-3,
			-1
		}
	},
	bottom_right = {
		vertical_alignment = "center",
		parent = "bottom_center",
		horizontal_alignment = "left",
		size = {
			264,
			6
		},
		position = {
			31,
			-3,
			-1
		}
	},
	mission_icon_left = {
		vertical_alignment = "center",
		parent = "mission_widget",
		horizontal_alignment = "center",
		size = {
			ICON_SIZE[1],
			ICON_SIZE[2]
		},
		position = {
			0,
			0,
			1
		}
	},
	mission_icon_right = {
		vertical_alignment = "center",
		parent = "mission_widget",
		horizontal_alignment = "center",
		size = {
			ICON_SIZE[1],
			ICON_SIZE[2]
		},
		position = {
			0,
			0,
			1
		}
	},
	frame_top_right = {
		vertical_alignment = "top",
		parent = "mission_widget",
		horizontal_alignment = "left",
		size = {
			450,
			4
		},
		position = {
			BACKGROUND_SIZE[1] / 2,
			2,
			3
		}
	},
	frame_top_left = {
		vertical_alignment = "top",
		parent = "mission_widget",
		horizontal_alignment = "right",
		size = {
			450,
			4
		},
		position = {
			-BACKGROUND_SIZE[1] / 2,
			2,
			3
		}
	},
	frame_bottom_right = {
		vertical_alignment = "bottom",
		parent = "mission_widget",
		horizontal_alignment = "left",
		size = {
			450,
			4
		},
		position = {
			BACKGROUND_SIZE[1] / 2,
			-2,
			3
		}
	},
	frame_bottom_left = {
		vertical_alignment = "bottom",
		parent = "mission_widget",
		horizontal_alignment = "right",
		size = {
			450,
			4
		},
		position = {
			-BACKGROUND_SIZE[1] / 2,
			-2,
			3
		}
	}
}
local color = table.clone(Colors.color_definitions.white)
color[1] = 0
local widget_definitions = {
	mission_widget = {
		scenegraph_id = "mission_pivot",
		element = {
			passes = {
				{
					style_id = "area_text_style",
					pass_type = "text",
					text_id = "area_text_content"
				},
				{
					style_id = "area_text_shadow_style",
					pass_type = "text",
					text_id = "area_text_content"
				},
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					texture_id = "top_center",
					style_id = "top_center",
					pass_type = "texture"
				},
				{
					style_id = "top_glow",
					pass_type = "texture_uv",
					content_id = "top_glow"
				},
				{
					style_id = "top_edge_glow",
					pass_type = "texture_uv",
					content_id = "top_edge_glow"
				},
				{
					texture_id = "top_detail",
					style_id = "top_detail",
					pass_type = "texture"
				},
				{
					texture_id = "top_detail_glow",
					style_id = "top_detail_glow",
					pass_type = "texture"
				},
				{
					style_id = "top_left",
					pass_type = "texture_uv",
					content_id = "top_left"
				},
				{
					style_id = "top_right",
					pass_type = "texture_uv",
					content_id = "top_right"
				},
				{
					style_id = "bottom_left",
					pass_type = "texture_uv",
					content_id = "bottom_left"
				},
				{
					style_id = "bottom_right",
					pass_type = "texture_uv",
					content_id = "bottom_right"
				},
				{
					texture_id = "bottom_center",
					style_id = "bottom_center",
					pass_type = "texture"
				},
				{
					style_id = "bottom_glow",
					pass_type = "texture_uv",
					content_id = "bottom_glow"
				},
				{
					texture_id = "bottom_edge_glow",
					style_id = "bottom_edge_glow",
					pass_type = "texture"
				},
				{
					texture_id = "frame_texture",
					style_id = "frame_texture_top_right",
					pass_type = "texture"
				},
				{
					style_id = "frame_texture_top_left",
					pass_type = "texture_uv",
					content_id = "frame_texture_top_left"
				},
				{
					texture_id = "frame_texture",
					style_id = "frame_texture_bottom_right",
					pass_type = "texture"
				},
				{
					style_id = "frame_texture_bottom_left",
					pass_type = "texture_uv",
					content_id = "frame_texture_bottom_left"
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
					end
				},
				{
					pass_type = "texture_uv_dynamic_color_uvs_size_offset",
					style_id = "mission_icon_left",
					texture_id = "mission_icon_left",
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
						size[2] = 64 * fraction
						local offset = style.offset
						offset[2] = (64 - size[2]) / 4

						return color, uvs, size, offset
					end
				},
				{
					pass_type = "texture_uv_dynamic_color_uvs_size_offset",
					style_id = "mission_icon_right",
					texture_id = "mission_icon_right",
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
						size[2] = 64 * fraction
						local offset = style.offset
						offset[2] = (64 - size[2]) / 4

						return color, uvs, size, offset
					end
				}
			}
		},
		content = {
			background_texture = "hud_difficulty_notification_bg_center",
			bottom_edge_glow = "mission_objective_glow_01",
			fraction = 1,
			mission_icon_right = "hud_tutorial_icon_mission",
			area_text_content = "n/a",
			top_detail_glow = "mission_objective_glow_02",
			mission_icon_left = "hud_tutorial_icon_mission",
			top_center = "mission_objective_04",
			frame_texture = "infoslate_frame_horizontal",
			bottom_center = "mission_objective_02",
			top_detail = "mission_objective_01",
			background = {
				texture_id = "mission_objective_bg",
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				}
			},
			top_glow = {
				texture_id = "mission_objective_top",
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				}
			},
			bottom_glow = {
				texture_id = "mission_objective_bottom",
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				}
			},
			top_edge_glow = {
				texture_id = "mission_objective_glow_01",
				uvs = {
					{
						0,
						1
					},
					{
						1,
						0
					}
				}
			},
			frame_texture_top_left = {
				texture_id = "infoslate_frame_horizontal",
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				}
			},
			frame_texture_bottom_left = {
				texture_id = "infoslate_frame_horizontal",
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				}
			},
			top_left = {
				texture_id = "mission_objective_05",
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				}
			},
			top_right = {
				texture_id = "mission_objective_05",
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				}
			},
			bottom_left = {
				texture_id = "mission_objective_03",
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				}
			},
			bottom_right = {
				texture_id = "mission_objective_03",
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				}
			}
		},
		style = {
			background = {
				scenegraph_id = "background",
				offset = {
					0,
					0,
					0
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			top_center = {
				scenegraph_id = "top_center",
				offset = {
					0,
					0,
					0
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			top_glow = {
				scenegraph_id = "top_center",
				size = {
					544,
					90
				},
				default_size = {
					544,
					90
				},
				offset = {
					-245,
					-80,
					-4
				},
				default_offset = {
					-245,
					-80,
					-4
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			top_edge_glow = {
				scenegraph_id = "top_center",
				size = {
					544,
					16
				},
				default_size = {
					544,
					16
				},
				offset = {
					-245,
					-6,
					-4
				},
				default_offset = {
					-245,
					-6,
					-5
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			top_detail = {
				scenegraph_id = "top_detail",
				offset = {
					0,
					0,
					0
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			top_detail_glow = {
				scenegraph_id = "top_detail",
				offset = {
					0,
					0,
					1
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			top_left = {
				scenegraph_id = "top_left",
				offset = {
					0,
					0,
					0
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			top_right = {
				scenegraph_id = "top_right",
				offset = {
					0,
					0,
					0
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			bottom_left = {
				scenegraph_id = "bottom_left",
				offset = {
					0,
					0,
					0
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			bottom_right = {
				scenegraph_id = "bottom_right",
				offset = {
					0,
					0,
					0
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			bottom_center = {
				scenegraph_id = "bottom_center",
				offset = {
					0,
					0,
					0
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			bottom_glow = {
				scenegraph_id = "bottom_center",
				size = {
					544,
					90
				},
				default_size = {
					544,
					90
				},
				offset = {
					-245,
					10,
					-4
				},
				default_offset = {
					-245,
					10,
					-4
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			bottom_edge_glow = {
				scenegraph_id = "bottom_center",
				size = {
					544,
					16
				},
				default_size = {
					544,
					16
				},
				offset = {
					-245,
					10,
					-4
				},
				default_offset = {
					-245,
					10,
					-5
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			area_text_style = {
				min_font_size = 20,
				upper_case = true,
				localize = false,
				font_size = 30,
				default_font_size = 30,
				horizontal_alignment = "center",
				word_wrap = false,
				vertical_alignment = "center",
				scenegraph_id = "background",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					-1,
					11
				}
			},
			area_text_shadow_style = {
				min_font_size = 20,
				upper_case = true,
				localize = false,
				font_size = 30,
				default_font_size = 30,
				horizontal_alignment = "center",
				word_wrap = false,
				vertical_alignment = "center",
				scenegraph_id = "background",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-3,
					10
				}
			},
			mission_icon_left = {
				uv_start_pixels = 0,
				uv_scale_pixels = 64,
				offset_scale = 1,
				scale_axis = 2,
				scenegraph_id = "mission_icon_left",
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				},
				offset = {
					0,
					0,
					0
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			mission_icon_right = {
				uv_start_pixels = 0,
				uv_scale_pixels = 64,
				offset_scale = 1,
				scale_axis = 2,
				scenegraph_id = "mission_icon_right",
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				},
				offset = {
					0,
					0,
					0
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			background_texture = {
				uv_start_pixels = 0,
				offset_scale = 1,
				background_component = true,
				scale_axis = 2,
				uv_scale_pixels = BACKGROUND_SIZE[2],
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				},
				offset = {
					0,
					0,
					0
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			frame_texture_top_right = {
				scenegraph_id = "frame_top_right",
				color = {
					0,
					255,
					255,
					255
				}
			},
			frame_texture_bottom_right = {
				scenegraph_id = "frame_bottom_right",
				color = {
					0,
					255,
					255,
					255
				}
			},
			frame_texture_top_left = {
				scenegraph_id = "frame_top_left",
				color = {
					0,
					255,
					255,
					255
				}
			},
			frame_texture_bottom_left = {
				scenegraph_id = "frame_bottom_left",
				color = {
					0,
					255,
					255,
					255
				}
			}
		}
	}
}
local animation_definitions = {
	mission_start = {
		{
			name = "entry",
			start_progress = 0,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				params.render_settings.alpha_multiplier = 0
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
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end
		},
		{
			name = "unfold",
			start_progress = 0.3,
			end_progress = 0.8,
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
			end
		},
		{
			name = "open",
			start_progress = 0.8,
			end_progress = 1.5,
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
			end
		},
		{
			name = "text_entry",
			start_progress = 0.9,
			end_progress = 1.5,
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
				local size_progress = math.ease_pulse(math.easeInCubic(progress))
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				params.render_settings.snap_pixel_positions = false
			end
		},
		{
			name = "text_minimize",
			start_progress = 5,
			end_progress = 5.3,
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
				local min_font_size = area_text_style.min_font_size
				local default_font_size = area_text_style.default_font_size
				local font_size_diff = default_font_size - min_font_size
				local new_font_size = default_font_size - font_size_diff * anim_progress
				area_text_style.font_size = new_font_size
				area_text_shadow_style.font_size = new_font_size
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end
		},
		{
			name = "collapse",
			start_progress = 5,
			end_progress = 5.3,
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
				local text_height = content.text_height
				local anim_distance = (90 - text_height) / 2
				ui_scenegraph.top_center.local_position[2] = (scenegraph_definition.top_center.position[2] + 45) - anim_distance * anim_progress
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
			end
		},
		{
			name = "fade_out",
			start_progress = 5,
			end_progress = 5.3,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				ui_scenegraph.mission_pivot.local_position[2] = 0
			end
		},
		{
			name = "fade_in",
			start_progress = 5.3,
			end_progress = 5.6,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				params.render_settings.snap_pixel_positions = true
			end
		}
	},
	mission_end = {
		{
			name = "exit",
			start_progress = 0,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				params.render_settings.alpha_multiplier = 0
				params.render_settings.snap_pixel_positions = false
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end
		}
	}
}

return {
	animation_definitions = animation_definitions,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions
}
