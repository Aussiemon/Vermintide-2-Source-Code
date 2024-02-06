-- chunkname: @scripts/ui/views/hero_view/craft_pages/definitions/craft_page_roll_properties_console_definitions.lua

local NUM_CRAFT_SLOTS_X = 1
local NUM_CRAFT_SLOTS_Y = 1
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
	item_grid = {
		horizontal_alignment = "center",
		parent = "craft_bg_root",
		vertical_alignment = "center",
		size = {
			185,
			182,
		},
		position = {
			0,
			0,
			6,
		},
	},
	material_text_1 = {
		horizontal_alignment = "center",
		parent = "craft_bg_root",
		vertical_alignment = "top",
		size = {
			60,
			100,
		},
		position = {
			0,
			-90,
			2,
		},
	},
	material_text_2 = {
		horizontal_alignment = "center",
		parent = "craft_bg_root",
		vertical_alignment = "top",
		size = {
			60,
			100,
		},
		position = {
			0,
			-90,
			2,
		},
	},
	material_text_3 = {
		horizontal_alignment = "center",
		parent = "craft_bg_root",
		vertical_alignment = "top",
		size = {
			60,
			100,
		},
		position = {
			0,
			-90,
			2,
		},
	},
	material_text_4 = {
		horizontal_alignment = "center",
		parent = "craft_bg_root",
		vertical_alignment = "top",
		size = {
			60,
			100,
		},
		position = {
			0,
			-90,
			2,
		},
	},
	material_text_5 = {
		horizontal_alignment = "center",
		parent = "craft_bg_root",
		vertical_alignment = "top",
		size = {
			60,
			100,
		},
		position = {
			0,
			-90,
			2,
		},
	},
	material_text_6 = {
		horizontal_alignment = "center",
		parent = "craft_bg_root",
		vertical_alignment = "top",
		size = {
			60,
			100,
		},
		position = {
			0,
			-90,
			2,
		},
	},
	material_text_7 = {
		horizontal_alignment = "center",
		parent = "craft_bg_root",
		vertical_alignment = "top",
		size = {
			60,
			100,
		},
		position = {
			0,
			-90,
			2,
		},
	},
}
local disable_with_gamepad = true
local widgets = {
	item_grid_bg = UIWidgets.create_simple_texture("console_crafting_slot_01", "item_grid", nil, nil, nil, -1),
	item_grid = UIWidgets.create_grid("item_grid", scenegraph_definition.item_grid.size, NUM_CRAFT_SLOTS_Y, NUM_CRAFT_SLOTS_X, 20, 20),
	craft_button = UIWidgets.create_console_craft_button("craft_button", "console_crafting_recipe_icon_properties"),
	material_text_1 = UIWidgets.create_craft_material_widget("material_text_1"),
	material_text_2 = UIWidgets.create_craft_material_widget("material_text_2"),
	material_text_3 = UIWidgets.create_craft_material_widget("material_text_3"),
	material_text_4 = UIWidgets.create_craft_material_widget("material_text_4"),
	material_text_5 = UIWidgets.create_craft_material_widget("material_text_5"),
	material_text_6 = UIWidgets.create_craft_material_widget("material_text_6"),
	material_text_7 = UIWidgets.create_craft_material_widget("material_text_7"),
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
