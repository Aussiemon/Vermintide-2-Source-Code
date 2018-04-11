local RETAINED_MODE_ENABLED = true
local animations = local_require("scripts/ui/views/tutorial_ui_animation_definitions")
local INFO_SLATE_SIZE = {
	500,
	500
}
local INFO_SLATE_ENTRY_SIZE = {
	450,
	66
}
local INFO_SLATE_ENTRY_SPACING = 30
local INFO_SLATE_GLOW_SIZE = {
	584,
	138
}
local INFO_SLATE_GLOW_UV_SIZE = {
	450,
	62
}
local INFO_SLATE_ENTRY_HEIGHT_SPACING = 20
local NUMBER_OF_INFO_SLATE_ENTRIES = 4
local NUMBER_OF_HEALTH_BARS = 10
local NUMBER_OF_OBJECTIVE_TOOLTIPS = 6
local FLOATING_ICON_SIZE = {
	64,
	64
}
local HEALTH_BAR_SIZE_FG = {
	137,
	7
}
local HEALTH_BAR_SIZE_BG = {
	147,
	17
}
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
			UILayer.tutorial
		}
	},
	center_root = {
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
			0
		}
	},
	screen_fit = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.tutorial
		},
		size = {
			1920,
			1080
		}
	},
	tooltip_root = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			0
		},
		size = {
			3,
			3
		}
	},
	tooltip = {
		vertical_alignment = "bottom",
		parent = "tooltip_root",
		position = {
			0,
			-120,
			1
		},
		size = {
			200,
			40
		}
	},
	info_slate_root = {
		vertical_alignment = "bottom",
		parent = "root",
		horizontal_alignment = "center",
		size = {
			1,
			1
		},
		position = {
			0,
			240,
			2
		}
	},
	info_slate_mission_goal_end = {
		parent = "info_slate_root",
		size = {
			INFO_SLATE_ENTRY_SIZE[1],
			INFO_SLATE_ENTRY_SIZE[2] / 2
		},
		position = {
			0,
			INFO_SLATE_ENTRY_SIZE[2] / 2,
			2
		}
	},
	info_slate_mask = {
		vertical_alignment = "top",
		parent = "info_slate_root",
		size = {
			INFO_SLATE_ENTRY_SIZE[1] + 30,
			550
		},
		position = {
			0,
			180,
			0
		}
	}
}

for i = 1, 3, 1 do
	local slot_name_start = string.format("info_slate_slot%d_start", i)
	local slot_name_end = string.format("info_slate_slot%d_end", i)
	local y = (i - 1) * (INFO_SLATE_ENTRY_SIZE[2] + INFO_SLATE_ENTRY_SPACING)
	scenegraph_definition[slot_name_start] = {
		parent = "info_slate_mission_goal_end",
		size = {
			INFO_SLATE_ENTRY_SIZE[1],
			INFO_SLATE_ENTRY_SIZE[2]
		},
		position = {
			0,
			-y,
			1
		}
	}
	scenegraph_definition[slot_name_end] = {
		parent = "info_slate_mission_goal_end",
		size = {
			INFO_SLATE_ENTRY_SIZE[1],
			INFO_SLATE_ENTRY_SIZE[2] / 2
		},
		position = {
			0,
			-y,
			2
		}
	}
end

local widget_definitions = {
	tooltip_mission = {
		scenegraph_id = "tooltip",
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture"
				},
				{
					texture_id = "arrow",
					style_id = "arrow",
					pass_type = "rotated_texture",
					content_check_function = function (content, style)
						return 0 < style.color[1]
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.text
					end
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.text
					end
				}
			}
		},
		content = {
			text = "tooltip_text",
			texture_id = "hud_tutorial_icon_info",
			arrow = "indicator"
		},
		style = {
			text = {
				font_size = 30,
				scenegraph_id = "tooltip_mission_text",
				pixel_perfect = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					1
				}
			},
			text_shadow = {
				font_size = 30,
				scenegraph_id = "tooltip_mission_text",
				pixel_perfect = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					0
				}
			},
			texture_id = {
				scenegraph_id = "tooltip_mission_icon",
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
			arrow = {
				scenegraph_id = "tooltip_mission_arrow",
				angle = 0,
				pivot = {
					19,
					9
				},
				offset = {
					0,
					0,
					1
				},
				color = {
					0,
					255,
					255,
					255
				}
			}
		}
	},
	info_slate_mask = {
		scenegraph_id = "info_slate_mask",
		element = UIElements.SimpleTexture,
		content = {
			texture_id = "mask_rect"
		},
		style = {
			color = {
				255,
				255,
				255,
				255
			}
		}
	}
}
local floating_icons_scene_graph = {
	root = {
		is_root = true,
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.tutorial
		}
	},
	screen_fit = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.tutorial
		},
		size = {
			1920,
			1080
		}
	},
	tooltip_root = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			0
		},
		size = {
			3,
			3
		}
	},
	tooltip = {
		vertical_alignment = "bottom",
		parent = "tooltip_root",
		position = {
			0,
			-120,
			1
		},
		size = {
			200,
			40
		}
	},
	tooltip_mission_root = {
		parent = "root",
		position = {
			0,
			0,
			0
		},
		size = {
			3,
			3
		}
	},
	tooltip_mission = {
		vertical_alignment = "bottom",
		parent = "tooltip_mission_root",
		position = {
			0,
			0,
			1
		},
		size = {
			1,
			1
		}
	},
	tooltip_mission_text = {
		vertical_alignment = "center",
		parent = "tooltip_mission_icon",
		horizontal_alignment = "right",
		size = {
			400,
			62
		},
		position = {
			403,
			0,
			2
		}
	},
	tooltip_mission_icon = {
		vertical_alignment = "center",
		parent = "tooltip_mission",
		horizontal_alignment = "center",
		size = {
			FLOATING_ICON_SIZE[1],
			FLOATING_ICON_SIZE[2]
		},
		position = {
			0,
			0,
			3
		}
	},
	tooltip_mission_arrow = {
		vertical_alignment = "center",
		parent = "tooltip_mission_icon",
		horizontal_alignment = "center",
		size = {
			38,
			18
		},
		position = {
			0,
			0,
			2
		}
	}
}

local function create_health_bar_definitions(num_health_bars)
	local definitions = {}

	for i = 1, num_health_bars, 1 do
		local scenegraph_id = "health_bar_" .. i
		floating_icons_scene_graph[scenegraph_id] = {
			parent = "screen_fit",
			position = {
				0,
				0,
				1
			},
			size = HEALTH_BAR_SIZE_FG
		}
		local health_bar_definition = {
			element = {
				passes = {
					{
						texture_id = "texture_bg",
						style_id = "texture_bg",
						pass_type = "texture"
					},
					{
						texture_id = "texture_fg",
						style_id = "texture_fg",
						pass_type = "texture"
					}
				}
			},
			content = {
				texture_fg = "objective_hp_bar_fg_2",
				texture_bg = "objective_hp_bar_bg_2"
			},
			style = {
				texture_bg = {
					size = HEALTH_BAR_SIZE_BG,
					offset = {
						-HEALTH_BAR_SIZE_BG[1] / 2,
						0,
						1
					},
					color = {
						255,
						255,
						255,
						255
					},
					scenegraph_id = scenegraph_id
				},
				texture_fg = {
					size = HEALTH_BAR_SIZE_FG,
					offset = {
						-HEALTH_BAR_SIZE_FG[1] / 2,
						5,
						1
					},
					color = {
						255,
						255,
						255,
						255
					},
					scenegraph_id = scenegraph_id
				}
			},
			scenegraph_id = scenegraph_id
		}
		definitions[i] = health_bar_definition
	end

	return definitions
end

local function create_info_slate_widgets(num_of_entries)
	local entries = {}

	for i = 1, num_of_entries, 1 do
		local scenegraph_anchor_id = "info_slate_entry_anchor" .. i
		local scenegraph_id = "info_slate_entry_root" .. i
		local text_scenegraph_id = scenegraph_id .. "_text"
		local icon_root_scenegraph_id = scenegraph_id .. "_icon_root"
		local icon_scenegraph_id = scenegraph_id .. "_icon"
		local top_frame_scenegraph_id = scenegraph_id .. "_top_frame"
		local bottom_frame_scenegraph_id = scenegraph_id .. "_bottom_frame"
		local frame_details_scenegraph_id = scenegraph_id .. "_frame_details"
		local frame_glow_top_scenegraph_id = scenegraph_id .. "_frame_glow_top"
		local frame_glow_bottom_scenegraph_id = scenegraph_id .. "_frame_glow_bottom"
		scenegraph_definition[scenegraph_id] = {
			parent = "info_slate_root",
			position = {
				-INFO_SLATE_ENTRY_SIZE[1],
				0,
				1
			},
			size = {
				INFO_SLATE_ENTRY_SIZE[1],
				INFO_SLATE_ENTRY_SIZE[2]
			}
		}
		scenegraph_definition[icon_root_scenegraph_id] = {
			vertical_alignment = "top",
			horizontal_alignment = "center",
			parent = scenegraph_id,
			position = {
				-INFO_SLATE_ENTRY_SIZE[1] / 2 + 30,
				0,
				0
			},
			size = {
				62,
				62
			}
		}
		scenegraph_definition[icon_scenegraph_id] = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			parent = icon_root_scenegraph_id,
			position = {
				0,
				0,
				1
			},
			size = {
				62,
				62
			}
		}
		scenegraph_definition[text_scenegraph_id] = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			parent = scenegraph_id,
			position = {
				2,
				0,
				1
			},
			size = {
				INFO_SLATE_ENTRY_SIZE[1] - 62,
				INFO_SLATE_ENTRY_SIZE[2]
			}
		}
		scenegraph_definition[top_frame_scenegraph_id] = {
			vertical_alignment = "top",
			horizontal_alignment = "left",
			parent = scenegraph_id,
			position = {
				0,
				0,
				2
			},
			size = {
				450,
				4
			}
		}
		scenegraph_definition[bottom_frame_scenegraph_id] = {
			vertical_alignment = "bottom",
			horizontal_alignment = "left",
			parent = scenegraph_id,
			position = {
				0,
				0,
				2
			},
			size = {
				450,
				4
			}
		}
		scenegraph_definition[frame_glow_top_scenegraph_id] = {
			vertical_alignment = "top",
			horizontal_alignment = "left",
			parent = scenegraph_id,
			position = {
				-105,
				108,
				5
			},
			size = {
				INFO_SLATE_GLOW_SIZE[1],
				INFO_SLATE_GLOW_SIZE[2]
			}
		}
		scenegraph_definition[frame_glow_bottom_scenegraph_id] = {
			vertical_alignment = "bottom",
			horizontal_alignment = "left",
			parent = scenegraph_id,
			position = {
				-105,
				-108,
				5
			},
			size = {
				INFO_SLATE_GLOW_SIZE[1],
				INFO_SLATE_GLOW_SIZE[2]
			}
		}
		local temp = {
			0,
			0,
			0
		}
		local info_slate_entry_default = {
			element = {
				passes = {
					{
						style_id = "background_texture",
						pass_type = "texture_uv_dynamic_color_uvs_size_offset",
						content_id = "background_texture",
						dynamic_function = function (content, style, size, dt)
							local fraction = content.fraction
							local uv_start_pixels = style.uv_start_pixels
							local uv_scale_pixels = style.uv_scale_pixels
							local uv_pixels = uv_start_pixels + uv_scale_pixels * fraction
							local uvs = style.uvs
							local uv_scale_axis = style.scale_axis
							local offset_scale = style.offset_scale
							uvs[1][uv_scale_axis] = 1 - fraction
							size[uv_scale_axis] = uv_pixels

							return style.color, uvs, size, temp
						end
					},
					{
						style_id = "icon_texture",
						pass_type = "texture_uv_dynamic_color_uvs_size_offset",
						content_id = "icon_texture",
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
						style_id = "description_text",
						pass_type = "text",
						text_id = "description_text",
						retained_mode = false,
						content_check_function = function (content, style)
							if content.icon_texture then
								style.offset[1] = 78
							else
								style.offset[1] = 0
							end

							return true
						end
					},
					{
						pass_type = "texture",
						style_id = "top_frame_texture",
						texture_id = "top_frame_texture",
						retained_mode = RETAINED_MODE_ENABLED,
						content_check_function = function (content)
							return content.top_frame_texture
						end
					},
					{
						pass_type = "texture",
						style_id = "bottom_frame_texture",
						texture_id = "bottom_frame_texture",
						retained_mode = RETAINED_MODE_ENABLED,
						content_check_function = function (content)
							return content.bottom_frame_texture
						end
					},
					{
						pass_type = "texture",
						style_id = "frame_glow_top_texture",
						texture_id = "frame_glow_top_texture",
						retained_mode = RETAINED_MODE_ENABLED,
						content_check_function = function (content)
							return content.frame_glow_top_texture
						end
					},
					{
						pass_type = "texture",
						style_id = "frame_glow_bottom_texture",
						texture_id = "frame_glow_bottom_texture",
						retained_mode = RETAINED_MODE_ENABLED,
						content_check_function = function (content)
							return content.frame_glow_bottom_texture
						end
					}
				}
			},
			content = {
				frame_details_texture = "infoslate_frame_detail",
				frame_glow_top_texture = "infoslate_glow_top",
				top_frame_texture = "infoslate_frame_horizontal",
				frame_glow_bottom_texture = "infoslate_glow_bottom",
				bottom_frame_texture = "infoslate_frame_horizontal",
				description_text = "",
				background_texture = {
					texture_id = "infoslate_bg_white",
					fraction = 0.5
				},
				frame_glow_uv_texture = {
					fraction = 0
				},
				icon_texture = {
					texture_id = "hud_tutorial_icon_info",
					fraction = 0
				}
			},
			style = {
				icon_texture = {
					masked = true,
					uv_scale_pixels = 62,
					uv_start_pixels = 0,
					offset_scale = 1,
					scale_axis = 2,
					scenegraph_id = icon_scenegraph_id,
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
					},
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
				description_text = {
					font_size = 24,
					word_wrap = true,
					pixel_perfect = true,
					horizontal_alignment = "left",
					vertical_alignment = "center",
					dynamic_font = true,
					font_type = "hell_shark_masked",
					offset = {
						0,
						0,
						0
					},
					text_color = Colors.get_color_table_with_alpha("white", 255),
					scenegraph_id = text_scenegraph_id
				},
				background_texture = {
					masked = true,
					background_component = true,
					uv_start_pixels = 0,
					offset_scale = 1,
					scale_axis = 1,
					offset = {
						0,
						0,
						0
					},
					scenegraph_id = scenegraph_id,
					color = {
						255,
						66,
						31,
						17
					},
					uv_scale_pixels = INFO_SLATE_ENTRY_SIZE[1],
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
				top_frame_texture = {
					background_component = true,
					masked = true,
					offset = {
						-3,
						0,
						1
					},
					color = {
						255,
						255,
						255,
						255
					},
					scenegraph_id = top_frame_scenegraph_id
				},
				bottom_frame_texture = {
					background_component = true,
					masked = true,
					offset = {
						-3,
						0,
						1
					},
					color = {
						255,
						255,
						255,
						255
					},
					scenegraph_id = bottom_frame_scenegraph_id
				},
				frame_glow_top_texture = {
					masked = true,
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
					},
					scenegraph_id = frame_glow_top_scenegraph_id
				},
				frame_glow_bottom_texture = {
					masked = true,
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
					},
					scenegraph_id = frame_glow_bottom_scenegraph_id
				}
			},
			scenegraph_id = scenegraph_id
		}

		for name, style_data in pairs(info_slate_entry_default.style) do
			if style_data.color then
				style_data.default_alpha = style_data.color[1]
			end
		end

		entries[#entries + 1] = info_slate_entry_default
	end

	return entries
end

local function create_objective_tooltip_definitions(num_objective_tooltips)
	local definitions = {}

	for i = 1, num_objective_tooltips, 1 do
		local scenegraph_root = "objective_tooltip_root_" .. i
		local scenegraph_id = "objective_tooltip_" .. i
		local scenegraph_text = "objective_tooltip_text" .. i
		local scenegraph_icon = "objective_tooltip_icon" .. i
		local scenegraph_arrow = "objective_tooltip_arrow" .. i
		floating_icons_scene_graph[scenegraph_root] = {
			parent = "root",
			position = {
				0,
				0,
				0
			},
			size = {
				3,
				3
			}
		}
		floating_icons_scene_graph[scenegraph_id] = {
			vertical_alignment = "bottom",
			parent = scenegraph_root,
			position = {
				0,
				0,
				1
			},
			size = {
				1,
				1
			}
		}
		floating_icons_scene_graph[scenegraph_text] = {
			vertical_alignment = "center",
			horizontal_alignment = "right",
			parent = scenegraph_icon,
			size = {
				400,
				62
			},
			position = {
				403,
				0,
				2
			}
		}
		floating_icons_scene_graph[scenegraph_icon] = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			parent = scenegraph_id,
			size = {
				62,
				62
			},
			position = {
				0,
				0,
				3
			}
		}
		floating_icons_scene_graph[scenegraph_arrow] = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			parent = scenegraph_icon,
			size = {
				38,
				18
			},
			position = {
				0,
				0,
				2
			}
		}
		local objective_tooltip = {
			element = {
				passes = {
					{
						texture_id = "texture_id",
						style_id = "texture_id",
						pass_type = "texture"
					},
					{
						texture_id = "arrow",
						style_id = "arrow",
						pass_type = "rotated_texture",
						content_check_function = function (content, style)
							return 0 < style.color[1]
						end
					},
					{
						style_id = "text",
						pass_type = "text",
						text_id = "text",
						content_check_function = function (content)
							return content.text
						end
					},
					{
						style_id = "text_shadow",
						pass_type = "text",
						text_id = "text",
						content_check_function = function (content)
							return content.text
						end
					}
				}
			},
			content = {
				text = "tooltip_text",
				texture_id = "hud_tutorial_icon_info",
				arrow = "indicator"
			},
			style = {
				text = {
					font_size = 30,
					pixel_perfect = false,
					horizontal_alignment = "left",
					vertical_alignment = "center",
					dynamic_font = false,
					allow_fractions = true,
					font_type = "hell_shark",
					text_color = Colors.get_color_table_with_alpha("white", 255),
					offset = {
						0,
						0,
						1
					},
					scenegraph_id = scenegraph_text
				},
				text_shadow = {
					font_size = 30,
					pixel_perfect = false,
					horizontal_alignment = "left",
					vertical_alignment = "center",
					dynamic_font = false,
					allow_fractions = true,
					font_type = "hell_shark",
					text_color = Colors.get_color_table_with_alpha("black", 255),
					offset = {
						2,
						-2,
						0
					},
					scenegraph_id = scenegraph_text
				},
				texture_id = {
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
					},
					scenegraph_id = scenegraph_icon,
					size = FLOATING_ICON_SIZE
				},
				arrow = {
					angle = 0,
					pivot = {
						19,
						9
					},
					offset = {
						0,
						0,
						1
					},
					color = {
						0,
						255,
						255,
						255
					},
					scenegraph_id = scenegraph_arrow
				}
			},
			scenegraph_id = scenegraph_id
		}
		definitions[i] = objective_tooltip
	end

	return definitions
end

local info_slate_entries = create_info_slate_widgets(NUMBER_OF_INFO_SLATE_ENTRIES)
local health_bar_definitions = create_health_bar_definitions(NUMBER_OF_HEALTH_BARS)
local objective_tooltips = create_objective_tooltip_definitions(NUMBER_OF_OBJECTIVE_TOOLTIPS)

return {
	scenegraph = scenegraph_definition,
	floating_icons_scene_graph = floating_icons_scene_graph,
	widgets = widget_definitions,
	INFO_SLATE_SIZE = INFO_SLATE_SIZE,
	INFO_SLATE_ENTRY_SIZE = INFO_SLATE_ENTRY_SIZE,
	INFO_SLATE_ENTRY_SPACING = INFO_SLATE_ENTRY_SPACING,
	INFO_SLATE_ENTRY_HEIGHT_SPACING = INFO_SLATE_ENTRY_HEIGHT_SPACING,
	NUMBER_OF_INFO_SLATE_ENTRIES = NUMBER_OF_INFO_SLATE_ENTRIES,
	tutorial_icons = tutorial_icons,
	info_slate_entries = info_slate_entries,
	health_bar_definitions = health_bar_definitions,
	NUMBER_OF_HEALTH_BARS = NUMBER_OF_HEALTH_BARS,
	objective_tooltips = objective_tooltips,
	NUMBER_OF_OBJECTIVE_TOOLTIPS = NUMBER_OF_OBJECTIVE_TOOLTIPS,
	FLOATING_ICON_SIZE = FLOATING_ICON_SIZE,
	animations = animations
}
