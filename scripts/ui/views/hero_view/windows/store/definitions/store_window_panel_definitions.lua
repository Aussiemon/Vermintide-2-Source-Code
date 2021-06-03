local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	panel = {
		vertical_alignment = "top",
		scale = "fit_width",
		size = {
			1920,
			69
		},
		position = {
			0,
			0,
			UILayer.default + 4
		}
	},
	panel_shadow_top = {
		vertical_alignment = "top",
		scale = "fit_width",
		size = {
			1920,
			50
		},
		position = {
			0,
			0,
			UILayer.default + 5
		}
	},
	panel_edge_top = {
		vertical_alignment = "top",
		scale = "fit_width",
		size = {
			1920,
			6
		},
		position = {
			0,
			-63,
			UILayer.default + 10
		}
	},
	bottom_panel = {
		vertical_alignment = "bottom",
		scale = "fit_width",
		size = {
			1920,
			69
		},
		position = {
			0,
			0,
			UILayer.default + 4
		}
	},
	panel_shadow_bottom = {
		vertical_alignment = "bottom",
		scale = "fit_width",
		size = {
			1920,
			50
		},
		position = {
			0,
			0,
			UILayer.default + 5
		}
	},
	panel_shadow_bottom_2 = {
		vertical_alignment = "bottom",
		scale = "fit_width",
		size = {
			1920,
			20
		},
		position = {
			0,
			43,
			UILayer.default + 5
		}
	},
	panel_edge_bottom = {
		vertical_alignment = "bottom",
		scale = "fit_width",
		size = {
			1920,
			6
		},
		position = {
			0,
			63,
			UILayer.default + 10
		}
	},
	panel_entry_area = {
		vertical_alignment = "top",
		parent = "panel",
		horizontal_alignment = "left",
		size = {
			900,
			64
		},
		position = {
			100,
			0,
			7
		}
	},
	entry_panel_bg_masked = {
		vertical_alignment = "top",
		parent = "panel",
		horizontal_alignment = "left",
		size = {
			900,
			64
		},
		position = {
			0,
			0,
			7
		}
	},
	entry_panel_detail_left = {
		vertical_alignment = "top",
		parent = "panel_entry_area",
		horizontal_alignment = "left",
		size = {
			14,
			70
		},
		position = {
			-12,
			0,
			10
		}
	},
	entry_panel_detail_right = {
		vertical_alignment = "top",
		parent = "panel_entry_area",
		horizontal_alignment = "right",
		size = {
			14,
			70
		},
		position = {
			12,
			0,
			10
		}
	},
	panel_input_area_1 = {
		vertical_alignment = "center",
		parent = "panel_entry_area",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			-50,
			0,
			1
		}
	},
	panel_input_area_2 = {
		vertical_alignment = "center",
		parent = "panel_entry_area",
		horizontal_alignment = "right",
		size = {
			0,
			0
		},
		position = {
			50,
			0,
			1
		}
	},
	back_button = {
		vertical_alignment = "top",
		parent = "panel",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			40,
			-120,
			3
		}
	},
	close_button = {
		vertical_alignment = "top",
		parent = "panel",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			45,
			-34,
			30
		}
	},
	game_option_pivot = {
		vertical_alignment = "top",
		parent = "panel_entry_area",
		horizontal_alignment = "left",
		size = {
			0,
			70
		},
		position = {
			0,
			0,
			14
		}
	},
	game_option = {
		vertical_alignment = "top",
		parent = "game_option_pivot",
		horizontal_alignment = "left",
		size = {
			0,
			64
		},
		position = {
			0,
			0,
			1
		}
	},
	entry_panel_selection = {
		vertical_alignment = "bottom",
		parent = "game_option_pivot",
		horizontal_alignment = "left",
		size = {
			213,
			23
		},
		position = {
			0,
			0,
			10
		}
	},
	currency_area = {
		vertical_alignment = "bottom",
		parent = "panel",
		horizontal_alignment = "right",
		size = {
			200,
			70
		},
		position = {
			-92,
			0,
			20
		}
	},
	currency_area_frame = {
		vertical_alignment = "center",
		parent = "currency_area",
		horizontal_alignment = "center",
		size = {
			200,
			70
		},
		position = {
			0,
			0,
			0
		}
	},
	currency_icon = {
		vertical_alignment = "center",
		parent = "currency_area",
		horizontal_alignment = "left",
		size = {
			64,
			64
		},
		position = {
			30,
			0,
			1
		}
	},
	currency_text = {
		vertical_alignment = "center",
		parent = "currency_icon",
		horizontal_alignment = "left",
		size = {
			64,
			200
		},
		position = {
			71,
			-2,
			1
		}
	},
	mark_all_as_seen = {
		vertical_alignment = "bottom",
		parent = "panel",
		horizontal_alignment = "right",
		size = {
			270,
			70
		},
		position = {
			-30,
			-80,
			8
		}
	}
}
local currency_text_style = {
	word_wrap = false,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 32,
	horizontal_alignment = "left",
	vertical_alignment = "center",
	dynamic_font_size = false,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}
local disable_with_gamepad = true

local function create_panel_button_selection(scenegraph_id, size)
	return {
		element = {
			passes = {
				{
					texture_id = "edge",
					style_id = "edge",
					pass_type = "texture"
				},
				{
					style_id = "write_mask",
					pass_type = "texture_uv",
					content_id = "write_mask"
				}
			}
		},
		content = {
			edge = "store_menu_glow",
			write_mask = {
				texture_id = "circular_gradient_write_mask",
				uvs = {
					{
						0,
						0
					},
					{
						1,
						0.5
					}
				}
			},
			size = size
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
					-8,
					0
				}
			},
			write_mask = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				texture_size = {
					1,
					140
				},
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
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

local widgets = {
	panel_input_area_1 = UIWidgets.create_simple_texture("xbone_button_icon_lt", "panel_input_area_1"),
	panel_input_area_2 = UIWidgets.create_simple_texture("xbone_button_icon_rt", "panel_input_area_2"),
	panel = UIWidgets.create_simple_rect("panel", {
		120,
		0,
		0,
		0
	}),
	panel_edge_top = UIWidgets.create_simple_texture("store_menu_frame", "panel_edge_top"),
	panel_shadow_top = UIWidgets.create_simple_texture("loot_presentation_fg_01_fade", "panel_shadow_top", nil, nil, {
		255,
		255,
		255,
		255
	}),
	bottom_panel = UIWidgets.create_simple_rect("bottom_panel", {
		120,
		0,
		0,
		0
	}),
	panel_edge_bottom = UIWidgets.create_simple_texture("store_menu_frame", "panel_edge_bottom"),
	panel_shadow_bottom = UIWidgets.create_simple_texture("loot_presentation_fg_02_fade", "panel_shadow_bottom", nil, nil, {
		255,
		255,
		255,
		255
	}),
	panel_shadow_bottom_2 = UIWidgets.create_simple_texture("loot_presentation_fg_01_fade", "panel_shadow_bottom_2", nil, nil, {
		255,
		255,
		255,
		255
	}),
	back_button = UIWidgets.create_layout_button("back_button", "layout_button_back", "layout_button_back_glow"),
	close_button = UIWidgets.create_layout_button("close_button", "layout_button_close", "layout_button_close_glow"),
	entry_panel_selection = create_panel_button_selection("entry_panel_selection", scenegraph_definition.entry_panel_selection.size),
	mark_all_seen_button = UIWidgets.create_store_panel_button("mark_all_as_seen", scenegraph_definition.mark_all_as_seen.size, "mark_all_as_seen", 22)
}
local top_widgets = {
	currency_icon = UIWidgets.create_simple_texture("store_icon_currency_ingame_big", "currency_icon"),
	currency_text = UIWidgets.create_simple_text("-", "currency_text", nil, nil, currency_text_style),
	currency_area = UIWidgets.create_tiled_texture("currency_area", "menu_frame_bg_07", {
		512,
		256
	}, nil, nil, {
		255,
		255,
		255,
		255
	}),
	currency_area_frame = UIWidgets.create_frame("currency_area_frame", scenegraph_definition.currency_area_frame.size, "button_frame_01_gold", 1),
	currency_text_tooltip = UIWidgets.create_additional_option_tooltip("currency_area_frame", scenegraph_definition.currency_area_frame.size, {
		"weave_progression_slot_titles"
	}, {
		title = Localize("menu_store_panel_currency_tooltip_title"),
		description = Localize("menu_store_panel_currency_tooltip_desc"),
		input = Localize("menu_store_panel_currency_tooltip_obtain_desc")
	}, 400, "right", "bottom", true, {
		0,
		-22,
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
	widgets = widgets,
	top_widgets = top_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
