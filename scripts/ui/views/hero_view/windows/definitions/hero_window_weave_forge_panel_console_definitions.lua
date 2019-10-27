local window_default_settings = UISettings.game_start_windows
local small_window_size = window_default_settings.size
local small_window_spacing = window_default_settings.spacing
local large_window_frame = window_default_settings.large_window_frame
local large_window_frame_width = UIFrameSettings[large_window_frame].texture_sizes.vertical[1]
local inner_window_size = {
	small_window_size[1] * 3 + small_window_spacing * 2 + large_window_frame_width * 2,
	small_window_size[2] + 80
}
local window_size = {
	inner_window_size[1] + 50,
	inner_window_size[2]
}
local window_frame_name = "menu_frame_11"
local window_frame = UIFrameSettings[window_frame_name]
local window_frame_width = window_frame.texture_sizes.vertical[1]
window_frame_width = 0
window_size = {
	1920,
	1080
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
	screen = {
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
	screen_center = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			1
		}
	},
	window = {
		vertical_alignment = "center",
		parent = "screen_center",
		horizontal_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1
		}
	},
	essence_panel = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "left",
		size = {
			327,
			48
		},
		position = {
			window_frame_width,
			-window_frame_width,
			8
		}
	},
	essence_text = {
		vertical_alignment = "bottom",
		parent = "essence_panel",
		horizontal_alignment = "left",
		size = {
			296,
			30
		},
		position = {
			50,
			15,
			3
		}
	},
	essence_icon = {
		vertical_alignment = "center",
		parent = "essence_text",
		horizontal_alignment = "center",
		size = {
			32,
			32
		},
		position = {
			0,
			0,
			1
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
			window_frame_width,
			-window_frame_width,
			12
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
			-window_frame_width,
			-window_frame_width,
			12
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
			window_frame_width,
			window_frame_width,
			12
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
			-window_frame_width,
			window_frame_width,
			12
		}
	},
	loadout_power_title = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			300,
			20
		},
		position = {
			0,
			window_frame_width + 33,
			12
		}
	},
	loadout_power_text = {
		vertical_alignment = "bottom",
		parent = "loadout_power_title",
		horizontal_alignment = "center",
		size = {
			150,
			40
		},
		position = {
			0,
			-32,
			0
		}
	},
	bottom_panel_left = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			634,
			80
		},
		position = {
			-317,
			window_frame_width,
			9
		}
	},
	bottom_panel_right = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			634,
			80
		},
		position = {
			317,
			window_frame_width,
			9
		}
	},
	upgrade_button = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			532,
			126
		},
		position = {
			-window_frame_width,
			-window_frame_width,
			4
		}
	},
	forge_level_title = {
		vertical_alignment = "center",
		parent = "upgrade_button",
		horizontal_alignment = "center",
		size = {
			300,
			20
		},
		position = {
			20,
			35,
			3
		}
	},
	forge_level_text = {
		vertical_alignment = "center",
		parent = "forge_level_title",
		horizontal_alignment = "center",
		size = {
			150,
			40
		},
		position = {
			0,
			0,
			0
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
			0,
			1
		}
	},
	wheel_ring_1 = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			math.floor(188 * wheel_scale),
			math.floor(188 * wheel_scale)
		},
		position = {
			0,
			0,
			1
		}
	},
	wheel_ring_2 = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			math.floor(461 * wheel_scale),
			math.floor(461 * wheel_scale)
		},
		position = {
			0,
			0,
			1
		}
	},
	wheel_ring_3 = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			math.floor(1074 * wheel_scale),
			math.floor(1074 * wheel_scale)
		},
		position = {
			0,
			0,
			1
		}
	},
	top_glow = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			500
		},
		position = {
			0,
			-(window_frame_width - 1),
			0
		}
	}
}
local title_text_style = {
	font_size = 36,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local essence_text_style = {
	font_size = 26,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local panel_title_text_style = {
	font_size = 18,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = {
		255,
		120,
		120,
		120
	},
	offset = {
		0,
		0,
		2
	}
}
local panel_value_text_style = {
	font_size = 32,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}
local mastery_text_style = {
	font_size = 62,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("corn_flower_blue", 255),
	offset = {
		0,
		0,
		2
	}
}
local level_text_style = {
	font_size = 20,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "left",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local power_text_style = {
	font_size = 20,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "left",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
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
local masked = true
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
	}, "wheel_ring_3", nil, nil, wheel_color)
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
local top_widgets = {
	bottom_panel_left = UIWidgets.create_simple_texture("athanor_power_bg", "bottom_panel_left"),
	bottom_panel_right = UIWidgets.create_simple_uv_texture("athanor_power_bg", {
		{
			1,
			0
		},
		{
			0,
			1
		}
	}, "bottom_panel_right"),
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
	}, "bottom_corner_right"),
	essence_icon = UIWidgets.create_simple_texture("icon_crafting_essence_small", "essence_icon"),
	essence_panel = UIWidgets.create_simple_texture("athanor_panel_front", "essence_panel"),
	essence_text = UIWidgets.create_simple_text("", "essence_text", nil, nil, essence_text_style),
	essence_tooltip = UIWidgets.create_additional_option_tooltip("essence_panel", scenegraph_definition.essence_panel.size, {
		"weave_progression_slot_titles"
	}, {
		title = Localize("menu_weave_forge_tooltip_essence_title"),
		description = Localize("menu_weave_forge_tooltip_essence_description"),
		input = Localize("menu_weave_forge_tooltip_essence_description_base_game")
	}, nil, nil, nil, true),
	loadout_power_title = UIWidgets.create_simple_text(Localize("menu_weave_forge_power_level_title"), "loadout_power_title", nil, nil, panel_title_text_style),
	loadout_power_text = UIWidgets.create_simple_text("0", "loadout_power_text", nil, nil, panel_value_text_style),
	loadout_power_tooltip = UIWidgets.create_additional_option_tooltip("loadout_power_text", scenegraph_definition.loadout_power_text.size, {
		"additional_option_info",
		"hero_power_perks"
	}, {
		title = Localize("menu_weave_forge_tooltip_weave_power_title"),
		description = Localize("menu_weave_forge_tooltip_weave_power_description")
	}, 400, nil, "top", nil, {
		0,
		22,
		0
	})
}
local animation_definitions = {
	on_enter = {
		{
			name = "top panel fade in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local top_glow_smoke_1 = widgets.top_glow_smoke_1

				if top_glow_smoke_1 then
					local scenegraph_id = top_glow_smoke_1.scenegraph_id
					local uvs = top_glow_smoke_1.content.texture_id.uvs
					uvs[1][2] = 1 - anim_progress
					ui_scenegraph[scenegraph_id].size[2] = scenegraph_definition[scenegraph_id].size[2] * anim_progress
				end

				local top_glow_smoke_2 = widgets.top_glow_smoke_2

				if top_glow_smoke_2 then
					local scenegraph_id = top_glow_smoke_2.scenegraph_id
					local uvs = top_glow_smoke_2.content.texture_id.uvs
					uvs[1][2] = 1 - anim_progress
					ui_scenegraph[scenegraph_id].size[2] = scenegraph_definition[scenegraph_id].size[2] * anim_progress
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "upgrade_button_fade_in",
			start_progress = 0.2,
			end_progress = 0.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local upgrade_button = widgets.upgrade_button

				if upgrade_button then
					local scenegraph_id = upgrade_button.scenegraph_id
					ui_scenegraph[scenegraph_id].local_position[2] = scenegraph_definition[scenegraph_id].position[2] + 0 * anim_progress
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	show_panel = {
		{
			name = "top panel fade in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local top_glow_smoke_1 = widgets.top_glow_smoke_1

				if top_glow_smoke_1 then
					local scenegraph_id = top_glow_smoke_1.scenegraph_id
					local uvs = top_glow_smoke_1.content.texture_id.uvs
					uvs[1][2] = 1 - anim_progress
					ui_scenegraph[scenegraph_id].size[2] = scenegraph_definition[scenegraph_id].size[2] * anim_progress
				end

				local top_glow_smoke_2 = widgets.top_glow_smoke_2

				if top_glow_smoke_2 then
					local scenegraph_id = top_glow_smoke_2.scenegraph_id
					local uvs = top_glow_smoke_2.content.texture_id.uvs
					uvs[1][2] = 1 - anim_progress
					ui_scenegraph[scenegraph_id].size[2] = scenegraph_definition[scenegraph_id].size[2] * anim_progress
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "upgrade_button_fade_in",
			start_progress = 0.2,
			end_progress = 0.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				widgets.upgrade_button.alpha_multiplier = 0
				widgets.forge_level_title.alpha_multiplier = 0
				widgets.forge_level_text.alpha_multiplier = 0
				widgets.loadout_power_title.alpha_multiplier = 0
				widgets.loadout_power_text.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				widgets.upgrade_button.alpha_multiplier = math.max(widgets.upgrade_button.alpha_multiplier, anim_progress)
				widgets.forge_level_title.alpha_multiplier = math.max(widgets.forge_level_title.alpha_multiplier, anim_progress)
				widgets.forge_level_text.alpha_multiplier = math.max(widgets.forge_level_text.alpha_multiplier, anim_progress)
				widgets.loadout_power_title.alpha_multiplier = math.max(widgets.loadout_power_title.alpha_multiplier, anim_progress)
				widgets.loadout_power_text.alpha_multiplier = math.max(widgets.loadout_power_text.alpha_multiplier, anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	hide_panel = {
		{
			name = "top panel fade in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(1 - progress)
				local top_glow_smoke_1 = widgets.top_glow_smoke_1

				if top_glow_smoke_1 then
					local scenegraph_id = top_glow_smoke_1.scenegraph_id
					local uvs = top_glow_smoke_1.content.texture_id.uvs
					uvs[1][2] = 1 - anim_progress
					ui_scenegraph[scenegraph_id].size[2] = scenegraph_definition[scenegraph_id].size[2] * anim_progress
				end

				local top_glow_smoke_2 = widgets.top_glow_smoke_2

				if top_glow_smoke_2 then
					local scenegraph_id = top_glow_smoke_2.scenegraph_id
					local uvs = top_glow_smoke_2.content.texture_id.uvs
					uvs[1][2] = 1 - anim_progress
					ui_scenegraph[scenegraph_id].size[2] = scenegraph_definition[scenegraph_id].size[2] * anim_progress
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "upgrade_button_fade_in",
			start_progress = 0.2,
			end_progress = 0.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				widgets.upgrade_button.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(1 - progress)
				widgets.upgrade_button.alpha_multiplier = math.min(widgets.upgrade_button.alpha_multiplier, anim_progress)
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
