local NUM_CRAFT_SLOTS_X = 1
local NUM_CRAFT_SLOTS_Y = 1
local NUM_CRAFT_SLOTS = NUM_CRAFT_SLOTS_X * NUM_CRAFT_SLOTS_Y
local NUM_RECIPE_SLOTS_X = 1
local NUM_RECIPE_SLOTS_Y = 1
local NUM_RECIPE_SLOTS = NUM_RECIPE_SLOTS_X * NUM_RECIPE_SLOTS_Y
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	craft_bg_root = console_menu_scenegraphs.craft_bg_root,
	craft_button = console_menu_scenegraphs.craft_button,
	item_grid_link = {
		vertical_alignment = "center",
		parent = "craft_bg_root",
		horizontal_alignment = "center",
		size = {
			55,
			36
		},
		position = {
			0,
			0,
			6
		}
	},
	item_grid = {
		vertical_alignment = "center",
		parent = "item_grid_link",
		horizontal_alignment = "center",
		size = {
			185,
			182
		},
		position = {
			-63,
			0,
			-1
		}
	},
	item_grid_2 = {
		vertical_alignment = "center",
		parent = "item_grid_link",
		horizontal_alignment = "center",
		size = {
			185,
			182
		},
		position = {
			61,
			0,
			-1
		}
	},
	item_grid_icon = {
		vertical_alignment = "center",
		parent = "item_grid",
		horizontal_alignment = "center",
		size = {
			60,
			67
		},
		position = {
			0,
			0,
			0
		}
	},
	item_grid_2_icon = {
		vertical_alignment = "center",
		parent = "item_grid_2",
		horizontal_alignment = "center",
		size = {
			50,
			55
		},
		position = {
			0,
			0,
			0
		}
	},
	material_text_1 = {
		vertical_alignment = "top",
		parent = "craft_bg_root",
		horizontal_alignment = "center",
		size = {
			60,
			100
		},
		position = {
			0,
			-90,
			2
		}
	},
	material_text_2 = {
		vertical_alignment = "top",
		parent = "craft_bg_root",
		horizontal_alignment = "center",
		size = {
			60,
			100
		},
		position = {
			0,
			-90,
			2
		}
	},
	material_text_3 = {
		vertical_alignment = "top",
		parent = "craft_bg_root",
		horizontal_alignment = "center",
		size = {
			60,
			100
		},
		position = {
			0,
			-90,
			2
		}
	},
	material_text_4 = {
		vertical_alignment = "top",
		parent = "craft_bg_root",
		horizontal_alignment = "center",
		size = {
			60,
			100
		},
		position = {
			0,
			-90,
			2
		}
	},
	material_text_5 = {
		vertical_alignment = "top",
		parent = "craft_bg_root",
		horizontal_alignment = "center",
		size = {
			60,
			100
		},
		position = {
			0,
			-90,
			2
		}
	},
	material_text_6 = {
		vertical_alignment = "top",
		parent = "craft_bg_root",
		horizontal_alignment = "center",
		size = {
			60,
			100
		},
		position = {
			0,
			-90,
			2
		}
	}
}
local disable_with_gamepad = true
local widgets = {
	item_grid_bg = UIWidgets.create_simple_texture("console_crafting_slot_01", "item_grid", nil, nil, nil, -2),
	item_grid_bg_2 = UIWidgets.create_simple_texture("console_crafting_slot_01", "item_grid_2", nil, nil, nil, -2),
	item_grid_link = UIWidgets.create_simple_rotated_texture("console_crafting_slot_connection", 0, {
		27.5,
		18
	}, "item_grid_link", nil, nil, nil, 0),
	item_grid_icon = UIWidgets.create_simple_texture("crafting_icon_01", "item_grid_icon"),
	item_grid_2_icon = UIWidgets.create_simple_texture("crafting_icon_02", "item_grid_2_icon"),
	item_grid = UIWidgets.create_grid("item_grid", scenegraph_definition.item_grid.size, NUM_CRAFT_SLOTS_Y, NUM_CRAFT_SLOTS_X, 20, 20),
	item_grid_2 = UIWidgets.create_grid("item_grid_2", scenegraph_definition.item_grid_2.size, NUM_RECIPE_SLOTS_Y, NUM_RECIPE_SLOTS_X, 30, 30),
	craft_button = UIWidgets.create_console_craft_button("craft_button", "console_crafting_recipe_icon_apply"),
	material_text_1 = UIWidgets.create_craft_material_widget("material_text_1"),
	material_text_2 = UIWidgets.create_craft_material_widget("material_text_2"),
	material_text_3 = UIWidgets.create_craft_material_widget("material_text_3"),
	material_text_4 = UIWidgets.create_craft_material_widget("material_text_4"),
	material_text_5 = UIWidgets.create_craft_material_widget("material_text_5"),
	material_text_6 = UIWidgets.create_craft_material_widget("material_text_6")
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
	animation_definitions = animation_definitions
}
