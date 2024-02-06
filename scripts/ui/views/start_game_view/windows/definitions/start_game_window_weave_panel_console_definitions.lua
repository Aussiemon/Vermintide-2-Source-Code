-- chunkname: @scripts/ui/views/start_game_view/windows/definitions/start_game_window_weave_panel_console_definitions.lua

local window_default_settings = UISettings.game_start_windows
local large_window_size = window_default_settings.large_window_size
local window_frame_name = "menu_frame_11"
local window_frame = UIFrameSettings[window_frame_name]
local window_frame_width = window_frame.texture_sizes.vertical[1]
local window_size = {
	large_window_size[1] - window_frame_width * 2,
	large_window_size[2] - window_frame_width * 2,
}
local panel_height = 70

window_size = {
	1920,
	1080,
}
window_frame_width = 0

local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	menu_root = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	parent_window = {
		horizontal_alignment = "center",
		parent = "menu_root",
		vertical_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1,
		},
	},
	window = {
		horizontal_alignment = "right",
		parent = "parent_window",
		vertical_alignment = "center",
		size = window_size,
		position = {
			-window_frame_width,
			0,
			1,
		},
	},
	panel = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			window_size[1],
			panel_height,
		},
		position = {
			0,
			3,
			6,
		},
	},
	panel_left = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "top",
		size = {
			256,
			45,
		},
		position = {
			0,
			3,
			6,
		},
	},
	panel_right = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "top",
		size = {
			256,
			45,
		},
		position = {
			211,
			3,
			6,
		},
	},
	panel_bottom = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			window_size[1],
			90,
		},
		position = {
			0,
			-3,
			0,
		},
	},
	panel_edge_top = {
		horizontal_alignment = "center",
		parent = "panel",
		vertical_alignment = "bottom",
		size = {
			window_size[1],
			5,
		},
		position = {
			0,
			-3,
			6,
		},
	},
	panel_edge_bottom = {
		horizontal_alignment = "center",
		parent = "panel_bottom",
		vertical_alignment = "top",
		size = {
			window_size[1],
			5,
		},
		position = {
			0,
			3,
			6,
		},
	},
	panel_entry_area = {
		horizontal_alignment = "left",
		parent = "panel",
		vertical_alignment = "top",
		size = {
			window_size[1],
			64,
		},
		position = {
			150,
			0,
			2,
		},
	},
	panel_input_area_1 = {
		horizontal_alignment = "left",
		parent = "panel_entry_area",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			-50,
			0,
			1,
		},
	},
	panel_input_area_2 = {
		horizontal_alignment = "right",
		parent = "panel_entry_area",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			50,
			0,
			1,
		},
	},
	game_option_pivot = {
		horizontal_alignment = "left",
		parent = "panel_entry_area",
		vertical_alignment = "top",
		size = {
			0,
			panel_height,
		},
		position = {
			0,
			0,
			0,
		},
	},
	game_option = {
		horizontal_alignment = "left",
		parent = "game_option_pivot",
		vertical_alignment = "top",
		size = {
			0,
			64,
		},
		position = {
			0,
			0,
			3,
		},
	},
	entry_panel_selection = {
		horizontal_alignment = "left",
		parent = "game_option_pivot",
		vertical_alignment = "bottom",
		size = {
			0,
			23,
		},
		position = {
			0,
			0,
			0,
		},
	},
}
local disable_with_gamepad = true

local function create_panel_button_selection(scenegraph_id, size)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "edge",
					texture_id = "edge",
				},
				{
					pass_type = "texture",
					style_id = "selection",
					texture_id = "selection",
				},
				{
					content_id = "write_mask",
					pass_type = "texture_uv",
					style_id = "write_mask",
				},
			},
		},
		content = {
			edge = "weave_menu_glow",
			selection = "athanor_item_divider_middle",
			write_mask = {
				texture_id = "weave_preview_smoke_01",
				uvs = {
					{
						0,
						0,
					},
					{
						1,
						0.5,
					},
				},
			},
			size = size,
		},
		style = {
			edge = {
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					-8,
					1,
				},
			},
			write_mask = {
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				texture_size = {
					200,
					150,
				},
				color = {
					255,
					138,
					0,
					187,
				},
				offset = {
					0,
					0,
					2,
				},
			},
			selection = {
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				texture_size = {
					68,
					19,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					-10,
					20,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

local widgets = {
	panel_input_area_1 = UIWidgets.create_simple_texture("xbone_button_icon_lt", "panel_input_area_1"),
	panel_input_area_2 = UIWidgets.create_simple_texture("xbone_button_icon_rt", "panel_input_area_2"),
	panel = UIWidgets.create_tiled_texture("panel", "menu_frame_bg_03", {
		256,
		256,
	}, nil, nil, {
		255,
		150,
		150,
		150,
	}),
	panel_bottom = UIWidgets.create_tiled_texture("panel_bottom", "athanor_panel_back", {
		64,
		84,
	}, nil, nil, {
		255,
		150,
		150,
		150,
	}),
	panel_fade = UIWidgets.create_simple_texture("options_window_fade_01", "panel", nil, nil, {
		255,
		0,
		0,
		0,
	}, 1),
	panel_edge_top = UIWidgets.create_simple_texture("menu_frame_09_divider", "panel_edge_top"),
	panel_edge_bottom = UIWidgets.create_simple_texture("menu_frame_09_divider", "panel_edge_bottom"),
	panel_fade_bottom = UIWidgets.create_simple_uv_texture("options_window_fade_01", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "panel_bottom", nil, nil, {
		255,
		0,
		0,
		0,
	}, 2),
	entry_panel_selection = create_panel_button_selection("entry_panel_selection", scenegraph_definition.entry_panel_selection.size),
}
local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.3,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	on_exit = {
		{
			end_progress = 0.3,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
