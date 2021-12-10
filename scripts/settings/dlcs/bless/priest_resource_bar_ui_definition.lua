local charge_bar_size = {
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
		size = charge_bar_size,
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
					pass_type = "texture",
					style_id = "glow",
					texture_id = "glow"
				},
				{
					pass_type = "texture",
					style_id = "bar_detail",
					texture_id = "bar_detail"
				},
				{
					pass_type = "texture",
					style_id = "bar_active",
					texture_id = "bar_active"
				}
			}
		},
		content = {
			bar_1 = "overcharge_bar_warrior_priest",
			glow = "overcharge_bar_warrior_priest_bar_glow",
			bar_active = "overcharge_bar_warrior_priest_active",
			bar_detail = "overcharge_bar_warrior_priest_slim_bar",
			bar_fg = "overcharge_frame_priest",
			size = {
				charge_bar_size[1] - 6,
				charge_bar_size[2]
			}
		},
		style = {
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
					charge_bar_size[1] - 6,
					charge_bar_size[2] - 6
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
				}
			},
			bar_bg = {
				size = {
					charge_bar_size[1] - 6,
					charge_bar_size[2] - 6
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
			glow = {
				size = {
					75,
					75
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					-37.5 + charge_bar_size[2] / 2,
					11
				}
			},
			bar_detail = {
				color = {
					255,
					255,
					109,
					0
				},
				offset = {
					3,
					3,
					3
				},
				size = {
					charge_bar_size[1] - 6,
					charge_bar_size[2] - 6
				}
			},
			bar_active = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					3,
					-50 + charge_bar_size[2] / 2,
					10
				},
				size = {
					charge_bar_size[1] - 6,
					100
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
	widget_definitions = widget_definitions
}
