local window_default_settings = UISettings.game_start_windows
local large_window_size = window_default_settings.large_window_size
local window_frame_name = "menu_frame_11"
local window_frame = UIFrameSettings[window_frame_name]
local window_frame_width = window_frame.texture_sizes.vertical[1]
local window_size = {
	large_window_size[1] - window_frame_width * 2,
	large_window_size[2] - window_frame_width * 2
}
local wheel_scale = 1.5
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
			UILayer.default
		}
	},
	root_fit = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
		}
	},
	menu_root = {
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
	parent_window = {
		vertical_alignment = "center",
		parent = "menu_root",
		horizontal_alignment = "center",
		size = large_window_size,
		position = {
			0,
			0,
			1
		}
	},
	window = {
		vertical_alignment = "center",
		parent = "parent_window",
		horizontal_alignment = "right",
		size = window_size,
		position = {
			-window_frame_width,
			0,
			1
		}
	},
	top_panel = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			84
		},
		position = {
			0,
			0,
			6
		}
	},
	top_glow = {
		vertical_alignment = "top",
		parent = "top_panel",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			500
		},
		position = {
			0,
			1,
			-1
		}
	},
	background_wheel = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			math.floor(1022 * wheel_scale),
			math.floor(1022 * wheel_scale)
		},
		position = {
			0,
			220,
			1
		}
	},
	wheel_ring_1 = {
		vertical_alignment = "center",
		parent = "background_wheel",
		horizontal_alignment = "center",
		size = {
			math.floor(188 * wheel_scale),
			math.floor(188 * wheel_scale)
		},
		position = {
			0,
			0,
			0
		}
	},
	wheel_ring_2 = {
		vertical_alignment = "center",
		parent = "background_wheel",
		horizontal_alignment = "center",
		size = {
			math.floor(461 * wheel_scale),
			math.floor(461 * wheel_scale)
		},
		position = {
			0,
			0,
			0
		}
	},
	wheel_ring_3 = {
		vertical_alignment = "center",
		parent = "background_wheel",
		horizontal_alignment = "center",
		size = {
			math.floor(1074 * wheel_scale),
			math.floor(1074 * wheel_scale)
		},
		position = {
			0,
			0,
			0
		}
	},
	top_corner_left = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "left",
		size = {
			110,
			110
		},
		position = {
			0,
			0,
			15
		}
	},
	top_corner_right = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			110,
			110
		},
		position = {
			0,
			0,
			15
		}
	},
	bottom_corner_left = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "left",
		size = {
			110,
			110
		},
		position = {
			0,
			0,
			15
		}
	},
	bottom_corner_right = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			110,
			110
		},
		position = {
			0,
			0,
			15
		}
	},
	bottom_glow = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			window_size[2]
		},
		position = {
			0,
			0,
			3
		}
	},
	bottom_glow_short = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			500
		},
		position = {
			0,
			0,
			4
		}
	},
	bottom_glow_shortest = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			200
		},
		position = {
			0,
			0,
			5
		}
	}
}
local background_color = {
	255,
	0,
	0,
	0
}
local bottom_glow_back_smoke_color = {
	200,
	138,
	0,
	147
}
local bottom_glow_front_smoke_color = {
	255,
	138,
	0,
	187
}
local bottom_glow_front_2_smoke_color = {
	200,
	128,
	0,
	217
}
local bottom_glow_back_ember_color = {
	130,
	255,
	255,
	255
}
local top_glow_back_smoke_color = {
	200,
	138,
	0,
	147
}
local wheel_color = {
	255,
	138,
	0,
	147
}
local bottom_hdr_widgets = {
	hdr_background_write_mask = UIWidgets.create_simple_texture("ui_write_mask", "window"),
	hdr_background_wheel_1 = UIWidgets.create_simple_texture("athanor_skilltree_background_effect", "background_wheel", nil, nil, wheel_color, 5),
	hdr_wheel_ring_1_1 = UIWidgets.create_simple_rotated_texture("athanor_skilltree_ring_effect_1", 0, {
		math.floor(188 * wheel_scale) / 2,
		math.floor(188 * wheel_scale) / 2
	}, "wheel_ring_1", nil, nil, wheel_color),
	hdr_wheel_ring_1_2 = UIWidgets.create_simple_rotated_texture("athanor_skilltree_ring_effect_2", 0, {
		math.floor(461 * wheel_scale) / 2,
		math.floor(461 * wheel_scale) / 2
	}, "wheel_ring_2", nil, nil, wheel_color),
	hdr_wheel_ring_1_3 = UIWidgets.create_simple_rotated_texture("athanor_skilltree_ring_effect_3", 0, {
		math.floor(1074 * wheel_scale) / 2,
		math.floor(1074 * wheel_scale) / 2
	}, "wheel_ring_3", nil, nil, wheel_color),
	hdr_wheel_ring_2_1 = UIWidgets.create_simple_rotated_texture("athanor_skilltree_ring_effect_1", 0, {
		math.floor(188 * wheel_scale) / 2,
		math.floor(188 * wheel_scale) / 2
	}, "wheel_ring_1", nil, nil, wheel_color),
	hdr_wheel_ring_2_2 = UIWidgets.create_simple_rotated_texture("athanor_skilltree_ring_effect_2", 0, {
		math.floor(461 * wheel_scale) / 2,
		math.floor(461 * wheel_scale) / 2
	}, "wheel_ring_2", nil, nil, wheel_color),
	hdr_wheel_ring_2_3 = UIWidgets.create_simple_rotated_texture("athanor_skilltree_ring_effect_3", 0, {
		math.floor(1074 * wheel_scale) / 2,
		math.floor(1074 * wheel_scale) / 2
	}, "wheel_ring_3", nil, nil, wheel_color),
	top_glow_smoke_1 = UIWidgets.create_simple_uv_texture("forge_overview_top_glow_effect_smoke_1", {
		{
			0,
			0
		},
		{
			1,
			1
		}
	}, "top_glow", nil, nil, top_glow_back_smoke_color, 0)
}
local bottom_widgets = {
	background_write_mask = UIWidgets.create_simple_texture("athanor_background_write_mask", "window"),
	background_wheel_1 = UIWidgets.create_simple_rotated_texture("athanor_skilltree_background", 0, {
		math.floor(1022 * wheel_scale) / 2,
		math.floor(1022 * wheel_scale) / 2
	}, "background_wheel", nil, nil, wheel_color),
	wheel_ring_1_1 = UIWidgets.create_simple_rotated_texture("athanor_skilltree_ring_1", 0, {
		math.floor(188 * wheel_scale) / 2,
		math.floor(188 * wheel_scale) / 2
	}, "wheel_ring_1", nil, nil, wheel_color),
	wheel_ring_1_2 = UIWidgets.create_simple_rotated_texture("athanor_skilltree_ring_2", 0, {
		math.floor(461 * wheel_scale) / 2,
		math.floor(461 * wheel_scale) / 2
	}, "wheel_ring_2", nil, nil, wheel_color),
	wheel_ring_1_3 = UIWidgets.create_simple_rotated_texture("athanor_skilltree_ring_3", 0, {
		math.floor(1074 * wheel_scale) / 2,
		math.floor(1074 * wheel_scale) / 2
	}, "wheel_ring_3", nil, nil, wheel_color),
	wheel_ring_2_1 = UIWidgets.create_simple_rotated_texture("athanor_skilltree_ring_1", 0, {
		math.floor(188 * wheel_scale) / 2,
		math.floor(188 * wheel_scale) / 2
	}, "wheel_ring_1", nil, nil, wheel_color),
	wheel_ring_2_2 = UIWidgets.create_simple_rotated_texture("athanor_skilltree_ring_2", 0, {
		math.floor(461 * wheel_scale) / 2,
		math.floor(461 * wheel_scale) / 2
	}, "wheel_ring_2", nil, nil, wheel_color),
	wheel_ring_2_3 = UIWidgets.create_simple_rotated_texture("athanor_skilltree_ring_3", 0, {
		math.floor(1074 * wheel_scale) / 2,
		math.floor(1074 * wheel_scale) / 2
	}, "wheel_ring_3", nil, nil, wheel_color),
	window_background = UIWidgets.create_simple_rect("window", background_color),
	bottom_glow_smoke_1 = UIWidgets.create_simple_uv_texture("forge_overview_bottom_glow_effect_smoke_1", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "bottom_glow", nil, nil, bottom_glow_back_smoke_color),
	bottom_glow_smoke_2 = UIWidgets.create_simple_uv_texture("forge_overview_bottom_glow_effect_smoke_2", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "bottom_glow_short", nil, nil, bottom_glow_front_smoke_color),
	bottom_glow_smoke_3 = UIWidgets.create_simple_uv_texture("forge_overview_bottom_glow_effect_embers_2", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "bottom_glow_shortest", nil, nil, bottom_glow_front_2_smoke_color),
	bottom_glow_embers_1 = UIWidgets.create_simple_uv_texture("forge_overview_bottom_glow_effect_embers_1", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "bottom_glow", nil, nil, bottom_glow_back_ember_color, 1),
	bottom_glow_embers_3 = UIWidgets.create_simple_uv_texture("forge_overview_bottom_glow_effect_embers_3", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "bottom_glow_short", nil, nil, bottom_glow_back_ember_color, 1)
}
local top_widgets = {
	top_corner_left = UIWidgets.create_simple_texture("athanor_decoration_corner", "top_corner_left"),
	top_corner_right = UIWidgets.create_simple_uv_texture("athanor_decoration_corner", {
		{
			1,
			0
		},
		{
			0,
			1
		}
	}, "top_corner_right"),
	bottom_corner_left = UIWidgets.create_simple_uv_texture("athanor_decoration_corner", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "bottom_corner_left"),
	bottom_corner_right = UIWidgets.create_simple_uv_texture("athanor_decoration_corner", {
		{
			1,
			1
		},
		{
			0,
			0
		}
	}, "bottom_corner_right")
}
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	on_exit = {
		{
			name = "fade_out",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}

return {
	top_widgets = top_widgets,
	bottom_widgets = bottom_widgets,
	bottom_hdr_widgets = bottom_hdr_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
