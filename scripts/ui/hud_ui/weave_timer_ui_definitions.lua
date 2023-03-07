local SIZE_X = 1920
local SIZE_Y = 1080
local multiplier = 1.5
local BAR_SIZE = {
	250 * multiplier,
	21 * multiplier
}
local TIP_SIZE = {
	21 * multiplier,
	21 * multiplier
}
local ICON_SIZE = {
	70,
	50
}
local WINDOW_SIZE = {
	325 * multiplier,
	40 * multiplier
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
	timer_bg = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			UILayer.hud + 200
		},
		size = {
			339,
			125
		}
	},
	timer_window = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "right",
		position = {
			-20,
			-20 - WINDOW_SIZE[2],
			0
		},
		size = WINDOW_SIZE
	},
	timer_icon = {
		vertical_alignment = "center",
		parent = "timer_window",
		horizontal_alignment = "left",
		position = {
			47,
			0,
			1
		},
		size = ICON_SIZE
	},
	timer_bar = {
		vertical_alignment = "center",
		parent = "timer_window",
		horizontal_alignment = "right",
		position = {
			0,
			0,
			1
		},
		size = BAR_SIZE
	},
	outer_frame = {
		vertical_alignment = "center",
		parent = "timer_bar",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			BAR_SIZE[1] + 26,
			BAR_SIZE[2] + 26
		}
	}
}

local function create_progress_bar(scenegraph_id, texture)
	local frame_settings = UIFrameSettings.button_frame_02
	local outer_frame_settings = UIFrameSettings.frame_outer_glow_02

	return {
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "background"
				},
				{
					pass_type = "texture",
					style_id = "mask",
					texture_id = "mask_id"
				},
				{
					pass_type = "texture",
					style_id = "glass",
					texture_id = "glass_id"
				},
				{
					style_id = "progress_bar_fill",
					pass_type = "texture_uv",
					content_id = "progress_bar_fill_id",
					content_change_function = function (content, style)
						style.texture_size[1] = BAR_SIZE[1] - content.parent.progress * BAR_SIZE[1]
						content.uvs[1][1] = content.parent.progress
						content.uvs[2][1] = 1
						style.offset[1] = content.parent.progress * BAR_SIZE[1]
					end
				},
				{
					style_id = "progress_bar_tip",
					pass_type = "texture_uv",
					content_id = "progress_bar_tip",
					content_change_function = function (content, style)
						style.offset[1] = content.parent.progress * BAR_SIZE[1]
					end
				},
				{
					texture_id = "frame_id",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					scenegraph_id = "outer_frame",
					pass_type = "texture_frame",
					texture_id = "outer_frame_id",
					style_id = "outer_frame",
					content_check_function = function (content)
						return content.progress > 0.9
					end,
					content_change_function = function (content, style, ui_animations, dt)
						if content.progress >= 0.9 then
							local alpha = 192 + math.sin(content.timer) * 64
							style.color[1] = alpha
							content.timer = content.timer + dt * 7
						end
					end
				},
				{
					style_id = "progress_bar_end_left",
					pass_type = "texture_uv",
					content_id = "progress_bar_end_left_id"
				},
				{
					pass_type = "texture",
					style_id = "progress_bar_end_right",
					texture_id = "progress_bar_end_id"
				},
				{
					style_id = "timer_text",
					pass_type = "text",
					text_id = "timer_text_id"
				},
				{
					style_id = "timer_text_shadow",
					pass_type = "text",
					text_id = "timer_text_id"
				}
			}
		},
		content = {
			progress_bar_end_id = "weave_bar_end",
			progress = 0,
			progress_bar_tip_id = "experience_bar_edge_glow",
			glass_id = "button_glass_01",
			mask_id = "mask_rect",
			timer_text_id = "00:00:00",
			progress_bar_tip = {
				texture_id = "experience_bar_edge_glow",
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
			progress_bar_fill_id = {
				texture_id = "weave_bar_fill_timer",
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
			frame_id = frame_settings.texture,
			outer_frame_id = outer_frame_settings.texture,
			progress_bar_end_left_id = {
				texture_id = "weave_bar_end",
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				}
			},
			timer = math.degrees_to_radians(-90)
		},
		style = {
			background = {
				color = {
					128,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					0
				}
			},
			mask = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			glass = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					2
				},
				texture_size = {
					BAR_SIZE[1],
					BAR_SIZE[2]
				}
			},
			progress_bar_fill = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					1
				},
				texture_size = {
					BAR_SIZE[1],
					BAR_SIZE[2] - 1
				}
			},
			progress_bar_tip = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				masked = true,
				color = {
					255,
					255,
					255,
					255
				},
				texture_size = {
					TIP_SIZE[1],
					TIP_SIZE[2] - 1
				},
				offset = {
					0,
					0,
					1
				}
			},
			frame = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					3
				},
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes
			},
			outer_frame = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					10
				},
				texture_size = outer_frame_settings.texture_size,
				texture_sizes = outer_frame_settings.texture_sizes
			},
			progress_bar_end_right = {
				vertical_alignment = "center",
				horizontal_alignment = "right",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					4
				},
				texture_size = {
					17 * multiplier,
					21 * multiplier
				}
			},
			progress_bar_end_left = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					4
				},
				texture_size = {
					17 * multiplier,
					21 * multiplier
				}
			},
			timer_text = {
				word_wrap = false,
				localize = false,
				font_size = 20,
				pixel_perfect = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					20,
					-2,
					6
				}
			},
			timer_text_shadow = {
				word_wrap = false,
				localize = false,
				font_size = 20,
				pixel_perfect = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					22,
					-4,
					5
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_timer(texture, scenegraph_id)
	local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture)

	return {
		element = {
			passes = {
				{
					style_id = "time_left",
					pass_type = "text",
					text_id = "time_left_id"
				},
				{
					style_id = "timer_text",
					pass_type = "text",
					text_id = "timer_text_id"
				},
				{
					style_id = "timer_text_shadow",
					pass_type = "text",
					text_id = "timer_text_id"
				},
				{
					style_id = "background",
					texture_id = "background_id",
					pass_type = "texture",
					content_check_function = function (content)
						return content.progress_cutoff <= content.progress
					end,
					content_change_function = function (content, style)
						if content.progress_cutoff <= content.progress then
							local time = Managers.time:time("game")
							local progress = content.progress < 1 and math.cos(time * math.pi * 2) or 1
							style.color[1] = 192 + progress * 64
							style.texture_size[1] = math.lerp(texture_settings.size[1], texture_settings.size[1] * 1.25, progress)
						end
					end
				}
			}
		},
		content = {
			progress_cutoff = 1,
			show_background = false,
			progress = 0,
			timer_text_id = "00:00",
			time_left_id = "timer_prefix_time_left",
			background_id = texture
		},
		style = {
			time_left = {
				word_wrap = false,
				upper_case = false,
				localize = true,
				font_size = 32,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = {
					255,
					216,
					114,
					35
				},
				offset = {
					0,
					-15,
					0
				}
			},
			background = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				texture_size = texture_settings.size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					10,
					0
				}
			},
			timer_text = {
				word_wrap = false,
				localize = false,
				font_size = 42,
				pixel_perfect = true,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				dynamic_font = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					140,
					20,
					6
				}
			},
			timer_text_shadow = {
				word_wrap = false,
				localize = false,
				font_size = 42,
				pixel_perfect = true,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				dynamic_font = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					140,
					18,
					5
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local widgets = {
	timer = create_timer("weaves_timer_highlight", "timer_bg")
}

return {
	scenegraph_definition = scenegraph_definition,
	widgets = widgets
}
