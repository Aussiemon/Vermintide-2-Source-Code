-- chunkname: @scripts/ui/views/start_game_view/windows/definitions/start_game_window_mutator_grid_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_spacing = window_default_settings.spacing
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_text_width = window_size[1] - (window_frame_width * 2 + 60)
local actual_window_size = {
	window_size[1] * 2 + window_spacing,
	window_size[2],
}
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
			UILayer.default,
		},
	},
	root_fit = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.default,
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
	window = {
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
	actual_window = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "center",
		size = actual_window_size,
		position = {
			0,
			0,
			1,
		},
	},
	item_grid = {
		horizontal_alignment = "center",
		parent = "actual_window",
		vertical_alignment = "center",
		size = actual_window_size,
		position = {
			0,
			20,
			3,
		},
	},
	title_text_detail = {
		horizontal_alignment = "center",
		parent = "actual_window",
		vertical_alignment = "top",
		size = {
			264,
			32,
		},
		position = {
			0,
			21,
			10,
		},
	},
	title_text_detail_glow = {
		horizontal_alignment = "center",
		parent = "title_text_detail",
		vertical_alignment = "top",
		size = {
			544,
			16,
		},
		position = {
			0,
			5,
			-1,
		},
	},
	title_text = {
		horizontal_alignment = "center",
		parent = "title_text_detail",
		vertical_alignment = "center",
		size = {
			window_size[1],
			50,
		},
		position = {
			0,
			25,
			1,
		},
	},
	description_text = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			window_text_width,
			window_size[2] / 2,
		},
		position = {
			0,
			0,
			1,
		},
	},
	page_button_next = {
		horizontal_alignment = "right",
		parent = "actual_window",
		vertical_alignment = "bottom",
		size = {
			actual_window_size[1] * 0.4,
			42,
		},
		position = {
			0,
			0,
			1,
		},
	},
	page_button_edge_right = {
		horizontal_alignment = "left",
		parent = "page_button_next",
		vertical_alignment = "center",
		size = {
			0,
			42,
		},
		position = {
			0,
			0,
			10,
		},
	},
	page_button_previous = {
		horizontal_alignment = "left",
		parent = "actual_window",
		vertical_alignment = "bottom",
		size = {
			actual_window_size[1] * 0.4,
			42,
		},
		position = {
			0,
			0,
			1,
		},
	},
	page_button_edge_left = {
		horizontal_alignment = "right",
		parent = "page_button_previous",
		vertical_alignment = "center",
		size = {
			0,
			42,
		},
		position = {
			0,
			0,
			10,
		},
	},
	page_button_divider = {
		horizontal_alignment = "center",
		parent = "actual_window",
		vertical_alignment = "bottom",
		size = {
			actual_window_size[1],
			0,
		},
		position = {
			0,
			42,
			14,
		},
	},
	page_text_area = {
		horizontal_alignment = "center",
		parent = "actual_window",
		vertical_alignment = "bottom",
		size = {
			actual_window_size[1] * 0.2,
			42,
		},
		position = {
			0,
			0,
			3,
		},
	},
}
local page_number_left_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "right",
	localize = false,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		-(actual_window_size[1] * 0.1 + 5),
		4,
		2,
	},
}
local page_number_right_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		actual_window_size[1] * 0.1 + 4,
		4,
		2,
	},
}
local page_number_center_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		4,
		2,
	},
}

local function create_window_divider(scenegraph_id, size)
	local widget = {
		element = {
			passes = {
				{
					pass_type = "tiled_texture",
					style_id = "bottom_edge",
					texture_id = "bottom_edge",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_left",
					texture_id = "edge_holder_left",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_right",
					texture_id = "edge_holder_right",
				},
			},
		},
		content = {
			bottom_edge = "menu_frame_09_divider",
			edge_holder_left = "menu_frame_09_divider_left",
			edge_holder_right = "menu_frame_09_divider_right",
		},
		style = {
			bottom_edge = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					5,
					0,
					6,
				},
				size = {
					size[1] - 10,
					5,
				},
				texture_tiling_size = {
					size[1] - 10,
					5,
				},
			},
			edge_holder_left = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					3,
					-6,
					10,
				},
				size = {
					9,
					17,
				},
			},
			edge_holder_right = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - 12,
					-6,
					10,
				},
				size = {
					9,
					17,
				},
			},
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
	}

	return widget
end

local function create_vertical_window_divider(scenegraph_id, size)
	local widget = {
		element = {
			passes = {
				{
					pass_type = "tiled_texture",
					style_id = "edge",
					texture_id = "edge",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_top",
					texture_id = "edge_holder_top",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_bottom",
					texture_id = "edge_holder_bottom",
				},
			},
		},
		content = {
			edge = "menu_frame_09_divider_vertical",
			edge_holder_bottom = "menu_frame_09_divider_bottom",
			edge_holder_top = "menu_frame_09_divider_top",
		},
		style = {
			edge = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					6,
					6,
				},
				size = {
					5,
					size[2] - 9,
				},
				texture_tiling_size = {
					5,
					size[2] - 9,
				},
			},
			edge_holder_top = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-6,
					size[2] - 7,
					10,
				},
				size = {
					17,
					9,
				},
			},
			edge_holder_bottom = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-6,
					3,
					10,
				},
				size = {
					17,
					9,
				},
			},
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
	}

	return widget
end

local widgets = {
	item_grid = UIWidgets.create_grid("item_grid", scenegraph_definition.item_grid.size, 8, 11, 12, 12, true),
	window_frame = UIWidgets.create_frame("actual_window", actual_window_size, window_frame, 10),
	window = UIWidgets.create_tiled_texture("actual_window", "background_leather_02", {
		520,
		820,
	}, nil, nil, {
		255,
		255,
		255,
		255,
	}),
	window_background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "actual_window", nil, nil, nil, 1),
	page_button_next = UIWidgets.create_simple_window_button("page_button_next", scenegraph_definition.page_button_next.size, Localize("menu_next"), 16),
	page_button_previous = UIWidgets.create_simple_window_button("page_button_previous", scenegraph_definition.page_button_previous.size, Localize("menu_previous"), 16),
	page_button_divider = create_window_divider("page_button_divider", scenegraph_definition.page_button_divider.size),
	page_button_edge_left = create_vertical_window_divider("page_button_edge_left", scenegraph_definition.page_button_edge_left.size),
	page_button_edge_right = create_vertical_window_divider("page_button_edge_right", scenegraph_definition.page_button_edge_right.size),
	page_text_center = UIWidgets.create_simple_text("/", "page_text_area", nil, nil, page_number_center_text_style),
	page_text_left = UIWidgets.create_simple_text("0", "page_text_area", nil, nil, page_number_left_text_style),
	page_text_right = UIWidgets.create_simple_text("0", "page_text_area", nil, nil, page_number_right_text_style),
	page_text_area = UIWidgets.create_simple_rect("page_text_area", {
		255,
		0,
		0,
		0,
	}),
}

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition,
}
