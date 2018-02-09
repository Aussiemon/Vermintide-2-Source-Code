local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_spacing = window_default_settings.spacing
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_text_width = window_size[1] - (window_frame_width*2 + 60)
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
	window = {
		vertical_alignment = "center",
		parent = "menu_root",
		horizontal_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1
		}
	},
	item_grid = {
		vertical_alignment = "bottom",
		parent = "page_button_divider",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			window_size[2] - 130
		},
		position = {
			0,
			-5,
			-10
		}
	},
	item_grid_divider = {
		vertical_alignment = "top",
		parent = "item_grid",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			0
		},
		position = {
			0,
			15,
			7
		}
	},
	item_grid_header_fade = {
		vertical_alignment = "top",
		parent = "item_tabs_divider",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			60
		},
		position = {
			0,
			0,
			-1
		}
	},
	item_grid_header = {
		vertical_alignment = "center",
		parent = "item_grid_divider",
		horizontal_alignment = "center",
		size = {
			window_size[1] - 20,
			40
		},
		position = {
			0,
			8,
			1
		}
	},
	item_grid_header_detail = {
		vertical_alignment = "bottom",
		parent = "item_grid_header",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			-30,
			0
		}
	},
	item_tabs = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			40
		},
		position = {
			0,
			-5,
			1
		}
	},
	item_tabs_segments = {
		vertical_alignment = "bottom",
		parent = "item_tabs",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			0
		},
		position = {
			0,
			5,
			10
		}
	},
	item_tabs_segments_top = {
		vertical_alignment = "top",
		parent = "item_tabs",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			0
		},
		position = {
			0,
			-7,
			20
		}
	},
	item_tabs_segments_bottom = {
		vertical_alignment = "bottom",
		parent = "item_tabs",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			0
		},
		position = {
			0,
			3,
			20
		}
	},
	item_tabs_divider = {
		vertical_alignment = "bottom",
		parent = "item_tabs",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			0
		},
		position = {
			0,
			0,
			7
		}
	},
	page_button_next = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			window_size[1]*0.4,
			42
		},
		position = {
			0,
			0,
			1
		}
	},
	page_button_edge_right = {
		vertical_alignment = "center",
		parent = "page_button_next",
		horizontal_alignment = "left",
		size = {
			0,
			42
		},
		position = {
			0,
			0,
			10
		}
	},
	page_button_previous = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "left",
		size = {
			window_size[1]*0.4,
			42
		},
		position = {
			0,
			0,
			1
		}
	},
	page_button_edge_left = {
		vertical_alignment = "center",
		parent = "page_button_previous",
		horizontal_alignment = "right",
		size = {
			0,
			42
		},
		position = {
			0,
			0,
			10
		}
	},
	page_button_divider = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			0
		},
		position = {
			0,
			42,
			14
		}
	},
	page_text_area = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1]*0.2,
			42
		},
		position = {
			0,
			0,
			3
		}
	}
}
local item_grid_header_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
	font_size = 28,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local page_number_left_text_style = {
	word_wrap = true,
	font_size = 20,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "right",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		-(window_size[1]*0.1 + 5),
		4,
		2
	}
}
local page_number_right_text_style = {
	word_wrap = true,
	font_size = 20,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		window_size[1]*0.1 + 4,
		4,
		2
	}
}
local page_number_center_text_style = {
	word_wrap = true,
	font_size = 20,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		4,
		2
	}
}

local function create_window_divider(scenegraph_id, size)
	local widget = {
		element = {
			passes = {
				{
					texture_id = "bottom_edge",
					style_id = "bottom_edge",
					pass_type = "tiled_texture"
				},
				{
					texture_id = "edge_holder_left",
					style_id = "edge_holder_left",
					pass_type = "texture"
				},
				{
					texture_id = "edge_holder_right",
					style_id = "edge_holder_right",
					pass_type = "texture"
				}
			}
		},
		content = {
			edge_holder_right = "menu_frame_09_divider_right",
			edge_holder_left = "menu_frame_09_divider_left",
			bottom_edge = "menu_frame_09_divider"
		},
		style = {
			bottom_edge = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					5,
					0,
					6
				},
				size = {
					size[1] - 10,
					5
				},
				texture_tiling_size = {
					size[1] - 10,
					5
				}
			},
			edge_holder_left = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					3,
					-6,
					10
				},
				size = {
					9,
					17
				}
			},
			edge_holder_right = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - 12,
					-6,
					10
				},
				size = {
					9,
					17
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return widget
end

local function create_vertical_window_divider(scenegraph_id, size)
	local widget = {
		element = {
			passes = {
				{
					texture_id = "edge",
					style_id = "edge",
					pass_type = "tiled_texture"
				},
				{
					texture_id = "edge_holder_top",
					style_id = "edge_holder_top",
					pass_type = "texture"
				},
				{
					texture_id = "edge_holder_bottom",
					style_id = "edge_holder_bottom",
					pass_type = "texture"
				}
			}
		},
		content = {
			edge = "menu_frame_09_divider_vertical",
			edge_holder_top = "menu_frame_09_divider_top",
			edge_holder_bottom = "menu_frame_09_divider_bottom"
		},
		style = {
			edge = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					6,
					6
				},
				size = {
					5,
					size[2] - 9
				},
				texture_tiling_size = {
					5,
					size[2] - 9
				}
			},
			edge_holder_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-6,
					size[2] - 7,
					10
				},
				size = {
					17,
					9
				}
			},
			edge_holder_bottom = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-6,
					3,
					10
				},
				size = {
					17,
					9
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return widget
end

local category_settings = {
	{
		wield = true,
		name = "melee",
		item_filter = "slot_type == melee",
		hero_specific_filter = true,
		display_name = Localize("inventory_screen_melee_weapon_title"),
		item_types = {
			"melee"
		},
		icon = UISettings.slot_icons.melee
	},
	{
		wield = true,
		name = "ranged",
		item_filter = "slot_type == ranged",
		hero_specific_filter = true,
		display_name = Localize("inventory_screen_ranged_weapon_title"),
		item_types = {
			"ranged"
		},
		icon = UISettings.slot_icons.ranged
	},
	{
		name = "necklace",
		item_filter = "slot_type == necklace",
		hero_specific_filter = true,
		display_name = Localize("inventory_screen_trinket_title"),
		item_types = {
			"necklace"
		},
		icon = UISettings.slot_icons.necklace
	},
	{
		name = "ring",
		item_filter = "slot_type == ring",
		hero_specific_filter = true,
		display_name = Localize("inventory_screen_trinket_title"),
		item_types = {
			"ring"
		},
		icon = UISettings.slot_icons.ring
	},
	{
		name = "trinket",
		item_filter = "slot_type == trinket",
		hero_specific_filter = true,
		display_name = Localize("inventory_screen_trinket_title"),
		item_types = {
			"trinket"
		},
		icon = UISettings.slot_icons.trinket
	}
}
local num_tabs = #category_settings
local widgets = {
	item_grid = UIWidgets.create_grid("item_grid", scenegraph_definition.item_grid.size, 7, 5, 16, 10, false),
	item_tabs_divider = create_window_divider("item_tabs_divider", scenegraph_definition.item_tabs_divider.size),
	item_grid_header = UIWidgets.create_simple_text(Localize("hero_view_inventory"), "item_grid_header", nil, nil, item_grid_header_style),
	item_grid_header_fade = UIWidgets.create_simple_uv_texture("edge_fade_small", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "item_grid_header_fade"),
	item_grid_header_detail = UIWidgets.create_simple_texture("divider_01_top", "item_grid_header_detail"),
	window_frame = UIWidgets.create_frame("window", scenegraph_definition.window.size, window_frame, 10),
	window = UIWidgets.create_background("window", scenegraph_definition.window.size, "background_leather_02"),
	item_tabs = UIWidgets.create_default_icon_tabs("item_tabs", scenegraph_definition.item_tabs.size, num_tabs),
	item_tabs_segments = UIWidgets.create_simple_centered_texture_amount("menu_frame_09_divider_vertical", {
		5,
		35
	}, "item_tabs_segments", num_tabs - 1),
	item_tabs_segments_top = UIWidgets.create_simple_centered_texture_amount("menu_frame_09_divider_top", {
		17,
		9
	}, "item_tabs_segments_top", num_tabs - 1),
	item_tabs_segments_bottom = UIWidgets.create_simple_centered_texture_amount("menu_frame_09_divider_bottom", {
		17,
		9
	}, "item_tabs_segments_bottom", num_tabs - 1),
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
		0
	})
}
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress

				return 
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

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress - 1

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	}
}

return {
	widgets = widgets,
	category_settings = category_settings,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
