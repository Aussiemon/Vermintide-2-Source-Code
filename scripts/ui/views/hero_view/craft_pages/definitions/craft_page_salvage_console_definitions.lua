local NUM_CRAFT_SLOTS_X = 3
local NUM_CRAFT_SLOTS_Y = 3
local NUM_CRAFT_SLOTS = NUM_CRAFT_SLOTS_X * NUM_CRAFT_SLOTS_Y
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	craft_bg_root = console_menu_scenegraphs.craft_bg_root,
	craft_button = console_menu_scenegraphs.craft_button,
	counter_text_root = {
		vertical_alignment = "center",
		parent = "craft_bg_root",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			6
		}
	},
	counter_text = {
		vertical_alignment = "center",
		parent = "counter_text_root",
		horizontal_alignment = "center",
		size = {
			200,
			200
		},
		position = {
			-16,
			0,
			1
		}
	},
	max_counter_text = {
		vertical_alignment = "center",
		parent = "counter_text_root",
		horizontal_alignment = "left",
		size = {
			200,
			200
		},
		position = {
			0,
			58,
			1
		}
	},
	material_holder = {
		vertical_alignment = "center",
		parent = "craft_bg_root",
		horizontal_alignment = "center",
		size = {
			251,
			277
		},
		position = {
			0,
			4,
			4
		}
	},
	material_circle = {
		vertical_alignment = "center",
		parent = "material_holder",
		horizontal_alignment = "center",
		size = {
			136,
			136
		},
		position = {
			0,
			0,
			1
		}
	},
	material_cross = {
		vertical_alignment = "center",
		parent = "material_holder",
		horizontal_alignment = "center",
		size = {
			108,
			108
		},
		position = {
			0,
			0,
			1
		}
	},
	material_text_1 = {
		vertical_alignment = "center",
		parent = "material_holder",
		horizontal_alignment = "center",
		size = {
			60,
			100
		},
		position = {
			-90,
			30,
			2
		}
	},
	material_text_2 = {
		vertical_alignment = "center",
		parent = "material_holder",
		horizontal_alignment = "center",
		size = {
			60,
			100
		},
		position = {
			-38,
			75,
			2
		}
	},
	material_text_3 = {
		vertical_alignment = "center",
		parent = "material_holder",
		horizontal_alignment = "center",
		size = {
			60,
			100
		},
		position = {
			38,
			75,
			2
		}
	},
	material_text_4 = {
		vertical_alignment = "center",
		parent = "material_holder",
		horizontal_alignment = "center",
		size = {
			60,
			100
		},
		position = {
			90,
			30,
			2
		}
	},
	material_text_5 = {
		vertical_alignment = "center",
		parent = "material_holder",
		horizontal_alignment = "center",
		size = {
			60,
			100
		},
		position = {
			70,
			-80,
			2
		}
	},
	material_text_6 = {
		vertical_alignment = "center",
		parent = "material_holder",
		horizontal_alignment = "center",
		size = {
			60,
			100
		},
		position = {
			0,
			-105,
			2
		}
	},
	material_text_7 = {
		vertical_alignment = "center",
		parent = "material_holder",
		horizontal_alignment = "center",
		size = {
			60,
			100
		},
		position = {
			-70,
			-80,
			2
		}
	}
}
local counter_text_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 72,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local max_counter_text_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 42,
	horizontal_alignment = "left",
	vertical_alignment = "bottom",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}

local function create_craft_material_widget(scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon"
				},
				{
					pass_type = "rotated_texture",
					style_id = "effect",
					texture_id = "effect"
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content)
						return not content.warning
					end
				},
				{
					style_id = "text_warning",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.warning
					end
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text"
				},
				{
					item_id = "item",
					pass_type = "item_tooltip",
					content_check_function = function (content)
						return content.button_hotspot.is_hover and content.item
					end
				}
			}
		},
		content = {
			text = "0",
			effect = "sparkle_effect",
			icon = "icon_crafting_dust_01_small",
			warning = false,
			button_hotspot = {}
		},
		style = {
			icon = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				texture_size = {
					50,
					50
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
					3
				}
			},
			effect = {
				vertical_alignment = "top",
				angle = 0,
				horizontal_alignment = "right",
				offset = {
					110,
					120,
					4
				},
				pivot = {
					128,
					128
				},
				texture_size = {
					256,
					256
				},
				color = Colors.get_color_table_with_alpha("white", 0)
			},
			text = {
				vertical_alignment = "bottom",
				font_size = 24,
				localize = false,
				horizontal_alignment = "center",
				word_wrap = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					26,
					3
				}
			},
			text_warning = {
				vertical_alignment = "bottom",
				font_size = 24,
				localize = false,
				horizontal_alignment = "center",
				word_wrap = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("red", 255),
				offset = {
					0,
					26,
					3
				}
			},
			text_shadow = {
				vertical_alignment = "bottom",
				font_size = 24,
				localize = false,
				horizontal_alignment = "center",
				word_wrap = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					24,
					2
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
end

local disable_with_gamepad = true
local widgets = {
	craft_button = UIWidgets.create_console_craft_button("craft_button", "console_crafting_recipe_icon_salvage"),
	counter_text = UIWidgets.create_simple_text("", "counter_text", nil, nil, counter_text_style),
	max_counter_text = UIWidgets.create_simple_text("", "max_counter_text", nil, nil, max_counter_text_style),
	material_holder = UIWidgets.create_simple_texture("console_crafting_salvage_bg", "material_holder"),
	material_circle = UIWidgets.create_simple_texture("console_crafting_salvage_ring", "material_circle"),
	material_cross = UIWidgets.create_simple_texture("console_crafting_salvage_cross", "material_cross"),
	material_text_1 = create_craft_material_widget("material_text_1"),
	material_text_2 = create_craft_material_widget("material_text_2"),
	material_text_3 = create_craft_material_widget("material_text_3"),
	material_text_4 = create_craft_material_widget("material_text_4"),
	material_text_5 = create_craft_material_widget("material_text_5"),
	material_text_6 = create_craft_material_widget("material_text_6"),
	material_text_7 = create_craft_material_widget("material_text_7")
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
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	NUM_CRAFT_SLOTS = NUM_CRAFT_SLOTS
}
