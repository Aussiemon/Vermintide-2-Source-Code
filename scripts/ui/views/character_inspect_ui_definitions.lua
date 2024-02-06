-- chunkname: @scripts/ui/views/character_inspect_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local ITEM_SIZE = {
	124,
	124,
}
local ITEM_SPACING = 30
local NUM_ITEM_SLOTS = 7
local WINDOW_WIDTH_SPACING = 50
local WINDOW_SIZE = {
	ITEM_SIZE[1] * NUM_ITEM_SLOTS + (NUM_ITEM_SLOTS - 1) * ITEM_SPACING + WINDOW_WIDTH_SPACING * 2,
	550,
}
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.ingame_player_list + 50,
		},
		size = {
			SIZE_X,
			SIZE_Y,
		},
	},
	screen = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			1920,
			1080,
		},
	},
	rect = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		position = {
			0,
			160,
			1,
		},
		size = {
			SIZE_X,
			SIZE_Y - 360,
		},
	},
	background = {
		horizontal_alignment = "center",
		parent = "rect",
		vertical_alignment = "center",
		position = {
			0,
			0,
			2,
		},
		size = {
			WINDOW_SIZE[1],
			WINDOW_SIZE[2],
		},
	},
	item_background = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "top",
		position = {
			0,
			-80,
			1,
		},
		size = {
			WINDOW_SIZE[1] - WINDOW_WIDTH_SPACING * 2,
			ITEM_SIZE[2] + ITEM_SPACING,
		},
	},
	item_title = {
		horizontal_alignment = "center",
		parent = "item_background",
		vertical_alignment = "top",
		position = {
			0,
			50,
			1,
		},
		size = {
			WINDOW_SIZE[1],
			50,
		},
	},
	talents_background = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "top",
		position = {
			0,
			-300,
			1,
		},
		size = {
			WINDOW_SIZE[1] - WINDOW_WIDTH_SPACING * 2,
			ITEM_SIZE[2] + ITEM_SPACING,
		},
	},
	talents_title = {
		horizontal_alignment = "center",
		parent = "talents_background",
		vertical_alignment = "top",
		position = {
			0,
			50,
			1,
		},
		size = {
			WINDOW_SIZE[1],
			50,
		},
	},
	item_slot = {
		horizontal_alignment = "left",
		parent = "item_background",
		vertical_alignment = "center",
		position = {
			ITEM_SPACING / 2,
			0,
			5,
		},
		size = {
			ITEM_SIZE[1],
			ITEM_SIZE[2],
		},
	},
	portrait_pivot = {
		horizontal_alignment = "left",
		parent = "background",
		vertical_alignment = "top",
		position = {
			0,
			0,
			10,
		},
		size = {
			0,
			0,
		},
	},
}
local title_text_style = {
	font_size = 28,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = true,
	upper_case = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local rect_color = {
	240,
	5,
	5,
	5,
}
local background_color = {
	200,
	10,
	10,
	10,
}
local widget_definitions = {
	item_title = UIWidgets.create_simple_text("equipment", "item_title", nil, nil, title_text_style),
	talents_title = UIWidgets.create_simple_text("talents", "talents_title", nil, nil, title_text_style),
	rect = UIWidgets.create_simple_rect("rect", rect_color),
	background = UIWidgets.create_background_with_frame("background", scenegraph_definition.background.size, "menu_frame_bg_01", "menu_frame_02"),
	item_background = UIWidgets.create_rect_with_frame("item_background", scenegraph_definition.item_background.size, background_color, "menu_frame_06"),
	talents_background = UIWidgets.create_rect_with_frame("talents_background", scenegraph_definition.talents_background.size, background_color, "menu_frame_06"),
	loadout = UIWidgets.create_loadout_grid("item_slot", ITEM_SIZE, NUM_ITEM_SLOTS, ITEM_SPACING, true),
	portrait = UIWidgets.create_portrait_frame("portrait_pivot", "default", "-", 1, nil, "unit_frame_portrait_way_watcher"),
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
}
