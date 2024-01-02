local DEFAULT_BAR_SIZE = {
	250,
	16
}
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.hud_inventory
		},
		size = {
			1920,
			1080
		}
	},
	screen_bottom_pivot_parent = {
		parent = "screen",
		position = {
			0,
			0,
			0
		},
		size = {
			0,
			0
		}
	},
	screen_bottom_pivot = {
		parent = "screen_bottom_pivot_parent",
		position = {
			0,
			0,
			1
		},
		size = {
			0,
			0
		}
	},
	charge_bar = {
		vertical_alignment = "center",
		parent = "screen_bottom_pivot",
		horizontal_alignment = "center",
		size = DEFAULT_BAR_SIZE,
		position = {
			0,
			-220,
			1
		}
	}
}
local frame_settings = UIFrameSettings.frame_outer_glow_01
local frame_corner = frame_settings.texture_sizes.corner
local frame_width = frame_corner[1]
local widget_definitions = {
	charge_bar = {
		scenegraph_id = "charge_bar",
		element = {
			passes = {
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame"
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon"
				},
				{
					pass_type = "texture",
					style_id = "icon_shadow",
					texture_id = "icon"
				},
				{
					pass_type = "texture",
					style_id = "bar_fg",
					texture_id = "bar_fg"
				},
				{
					pass_type = "rect",
					style_id = "bar_bg"
				},
				{
					pass_type = "gradient_mask_texture",
					style_id = "bar_1",
					texture_id = "bar_1"
				},
				{
					pass_type = "rect",
					style_id = "min_threshold"
				},
				{
					pass_type = "rect",
					style_id = "max_threshold"
				}
			}
		},
		content = {
			icon = "tabs_icon_all_selected",
			bar_1 = "overcharge_bar",
			bar_fg = "overcharge_frame",
			size = {
				DEFAULT_BAR_SIZE[1] - 6,
				DEFAULT_BAR_SIZE[2]
			},
			frame = frame_settings.texture
		},
		style = {
			frame = {
				frame_margins = {
					-(frame_width - 1),
					-(frame_width - 1)
				},
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
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
				size = DEFAULT_BAR_SIZE
			},
			bar_1 = {
				gradient_threshold = 0,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					3,
					3,
					3
				},
				size = {
					DEFAULT_BAR_SIZE[1] - 6,
					DEFAULT_BAR_SIZE[2] - 6
				}
			},
			icon = {
				size = {
					34,
					34
				},
				offset = {
					DEFAULT_BAR_SIZE[1],
					DEFAULT_BAR_SIZE[2] / 2 - 17,
					5
				},
				color = {
					100,
					0,
					0,
					1
				}
			},
			icon_shadow = {
				size = {
					34,
					34
				},
				offset = {
					DEFAULT_BAR_SIZE[1] + 2,
					DEFAULT_BAR_SIZE[2] / 2 - 17 - 2,
					5
				},
				color = {
					0,
					0,
					0,
					0
				}
			},
			bar_fg = {
				offset = {
					0,
					0,
					5
				},
				color = {
					204,
					255,
					255,
					255
				},
				size = DEFAULT_BAR_SIZE
			},
			bar_bg = {
				size = {
					DEFAULT_BAR_SIZE[1] - 6,
					DEFAULT_BAR_SIZE[2] - 5
				},
				offset = {
					3,
					3,
					0
				},
				color = {
					100,
					0,
					0,
					0
				}
			},
			min_threshold = {
				pivot = {
					0,
					0
				},
				offset = {
					0,
					3,
					4
				},
				color = {
					204,
					0,
					0,
					0
				},
				size = {
					2,
					DEFAULT_BAR_SIZE[2] - 6
				}
			},
			max_threshold = {
				pivot = {
					0,
					0
				},
				offset = {
					0,
					3,
					4
				},
				color = {
					204,
					0,
					0,
					0
				},
				size = {
					2,
					DEFAULT_BAR_SIZE[2] - 6
				}
			}
		},
		offset = {
			0,
			0,
			0
		}
	}
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	DEFAULT_BAR_SIZE = DEFAULT_BAR_SIZE
}
