﻿-- chunkname: @scripts/ui/views/hero_view/states/definitions/hero_view_state_loot_definitions.lua

local panel_height = UISettings.hero_panel_height
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local panel_color = UISettings.console_menu_rect_color
local grid_size = {
	520,
	600,
}
local num_loot_options = IS_CONSOLE and 5 or 5
local USE_DELAYED_SPAWN = true
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	bottom_panel = {
		scale = "fit_width",
		vertical_alignment = "bottom",
		size = {
			1920,
			79,
		},
		position = {
			0,
			0,
			UILayer.default + 1,
		},
	},
	dead_space_filler = {
		scale = "fit",
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
	chest_title = {
		horizontal_alignment = "center",
		parent = "dead_space_filler",
		vertical_alignment = "top",
		size = {
			1200,
			50,
		},
		position = {
			0,
			-80,
			1,
		},
	},
	chest_sub_title = {
		horizontal_alignment = "center",
		parent = "chest_title",
		vertical_alignment = "top",
		size = {
			1200,
			50,
		},
		position = {
			0,
			-40,
			1,
		},
	},
	chest_indicator_root = {
		horizontal_alignment = "center",
		parent = "dead_space_filler",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			0,
			200,
			0,
		},
	},
	arrow_root = {
		horizontal_alignment = "center",
		parent = "dead_space_filler",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			0,
			200,
			0,
		},
	},
	info_root = {
		horizontal_alignment = "right",
		parent = "dead_space_filler",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			0,
			0,
			1,
		},
	},
	info_window = {
		horizontal_alignment = "right",
		parent = "info_root",
		vertical_alignment = "center",
		size = {
			300,
			576,
		},
		position = {
			-70,
			0,
			1,
		},
	},
	info_text_box = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "top",
		size = {
			270,
			430,
		},
		position = {
			0,
			-140,
			1,
		},
	},
	info_title_text = {
		horizontal_alignment = "center",
		parent = "info_text_box",
		vertical_alignment = "top",
		size = {
			320,
			50,
		},
		position = {
			0,
			70,
			1,
		},
	},
	info_portrait_root = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			0,
			0,
			1,
		},
	},
	item_grid_root = {
		horizontal_alignment = "left",
		parent = "dead_space_filler",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			0,
			0,
			1,
		},
	},
	item_window = {
		horizontal_alignment = "left",
		parent = "item_grid_root",
		vertical_alignment = "center",
		size = grid_size,
		position = {
			50,
			0,
			10,
		},
	},
	item_grid = {
		horizontal_alignment = "center",
		parent = "item_window",
		vertical_alignment = "center",
		size = {
			520,
			600,
		},
		position = {
			0,
			0,
			1,
		},
	},
	item_grid_title = {
		horizontal_alignment = "center",
		parent = "item_window",
		vertical_alignment = "top",
		size = {
			260,
			32,
		},
		position = {
			0,
			-15,
			1,
		},
	},
	page_text_area = {
		horizontal_alignment = "center",
		parent = "item_grid",
		vertical_alignment = "bottom",
		size = {
			334,
			60,
		},
		position = {
			0,
			-25,
			3,
		},
	},
	input_icon_previous = {
		horizontal_alignment = "center",
		parent = "page_text_area",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			-60,
			0,
			1,
		},
	},
	input_icon_next = {
		horizontal_alignment = "center",
		parent = "page_text_area",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			60,
			0,
			1,
		},
	},
	input_arrow_next = {
		horizontal_alignment = "center",
		parent = "input_icon_next",
		vertical_alignment = "center",
		size = {
			19,
			27,
		},
		position = {
			40,
			0,
			1,
		},
	},
	input_arrow_previous = {
		horizontal_alignment = "center",
		parent = "input_icon_previous",
		vertical_alignment = "center",
		size = {
			19,
			27,
		},
		position = {
			-40,
			0,
			1,
		},
	},
	page_button_next = {
		horizontal_alignment = "center",
		parent = "input_icon_next",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			20,
			0,
			1,
		},
	},
	page_button_previous = {
		horizontal_alignment = "center",
		parent = "input_icon_previous",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			-20,
			0,
			1,
		},
	},
	item_window_1 = {
		horizontal_alignment = "left",
		parent = "item_grid_root",
		vertical_alignment = "center",
		size = {
			270,
			180,
		},
		position = {
			50,
			300,
			1,
		},
	},
	item_grid_1 = {
		horizontal_alignment = "center",
		parent = "item_window_1",
		vertical_alignment = "center",
		size = {
			270,
			180,
		},
		position = {
			0,
			0,
			1,
		},
	},
	difficulty_icon_left_1 = {
		horizontal_alignment = "left",
		parent = "item_window_1",
		vertical_alignment = "center",
		size = {
			100,
			200,
		},
		position = {
			-100,
			0,
			1,
		},
	},
	difficulty_icon_right_1 = {
		horizontal_alignment = "right",
		parent = "item_window_1",
		vertical_alignment = "center",
		size = {
			100,
			200,
		},
		position = {
			100,
			0,
			1,
		},
	},
	item_window_2 = {
		horizontal_alignment = "left",
		parent = "item_grid_root",
		vertical_alignment = "center",
		size = {
			270,
			180,
		},
		position = {
			50,
			100,
			1,
		},
	},
	item_grid_2 = {
		horizontal_alignment = "center",
		parent = "item_window_2",
		vertical_alignment = "center",
		size = {
			270,
			180,
		},
		position = {
			0,
			0,
			1,
		},
	},
	difficulty_icon_left_2 = {
		horizontal_alignment = "left",
		parent = "item_window_2",
		vertical_alignment = "center",
		size = {
			100,
			200,
		},
		position = {
			-100,
			0,
			1,
		},
	},
	difficulty_icon_right_2 = {
		horizontal_alignment = "right",
		parent = "item_window_2",
		vertical_alignment = "center",
		size = {
			100,
			200,
		},
		position = {
			100,
			0,
			1,
		},
	},
	item_window_3 = {
		horizontal_alignment = "left",
		parent = "item_grid_root",
		vertical_alignment = "center",
		size = {
			270,
			180,
		},
		position = {
			50,
			-100,
			1,
		},
	},
	item_grid_3 = {
		horizontal_alignment = "center",
		parent = "item_window_3",
		vertical_alignment = "center",
		size = {
			270,
			180,
		},
		position = {
			0,
			0,
			1,
		},
	},
	difficulty_icon_left_3 = {
		horizontal_alignment = "left",
		parent = "item_window_3",
		vertical_alignment = "center",
		size = {
			100,
			200,
		},
		position = {
			-100,
			0,
			1,
		},
	},
	difficulty_icon_right_3 = {
		horizontal_alignment = "right",
		parent = "item_window_3",
		vertical_alignment = "center",
		size = {
			100,
			200,
		},
		position = {
			100,
			0,
			1,
		},
	},
	item_window_4 = {
		horizontal_alignment = "left",
		parent = "item_grid_root",
		vertical_alignment = "center",
		size = {
			270,
			180,
		},
		position = {
			50,
			-300,
			1,
		},
	},
	item_grid_4 = {
		horizontal_alignment = "center",
		parent = "item_window_4",
		vertical_alignment = "center",
		size = {
			270,
			180,
		},
		position = {
			0,
			0,
			1,
		},
	},
	difficulty_icon_left_4 = {
		horizontal_alignment = "left",
		parent = "item_window_4",
		vertical_alignment = "center",
		size = {
			100,
			200,
		},
		position = {
			-100,
			0,
			1,
		},
	},
	difficulty_icon_right_4 = {
		horizontal_alignment = "right",
		parent = "item_window_4",
		vertical_alignment = "center",
		size = {
			100,
			200,
		},
		position = {
			100,
			0,
			1,
		},
	},
	item_cap_warning_text = {
		horizontal_alignment = "center",
		parent = "bottom_panel",
		vertical_alignment = "bottom",
		size = {
			900,
			72,
		},
		position = {
			0,
			235,
			10,
		},
	},
	open_buttons_pivot = {
		horizontal_alignment = "center",
		parent = "dead_space_filler",
		vertical_alignment = "bottom",
		size = {
			0,
			70,
		},
		position = {
			0,
			30,
			10,
		},
	},
	open_button = {
		horizontal_alignment = "right",
		parent = "open_buttons_pivot",
		vertical_alignment = "bottom",
		size = {
			380,
			70,
		},
		position = {
			-10,
			0,
			0,
		},
	},
	open_multiple_button = {
		horizontal_alignment = "left",
		parent = "open_buttons_pivot",
		vertical_alignment = "bottom",
		size = {
			380,
			70,
		},
		position = {
			10,
			0,
			0,
		},
	},
	continue_button = {
		horizontal_alignment = "center",
		parent = "dead_space_filler",
		vertical_alignment = "bottom",
		size = {
			380,
			70,
		},
		position = {
			0,
			-230,
			10,
		},
	},
	close_button = {
		horizontal_alignment = "right",
		parent = "dead_space_filler",
		vertical_alignment = "bottom",
		size = {
			300,
			70,
		},
		position = {
			-80,
			30,
			10,
		},
	},
	debug_add_chest_5 = {
		horizontal_alignment = "right",
		parent = "dead_space_filler",
		vertical_alignment = "bottom",
		size = {
			450,
			70,
		},
		position = {
			-20,
			480,
			2,
		},
	},
	debug_add_chest_4 = {
		horizontal_alignment = "right",
		parent = "dead_space_filler",
		vertical_alignment = "bottom",
		size = {
			450,
			70,
		},
		position = {
			-20,
			400,
			2,
		},
	},
	debug_add_chest_3 = {
		horizontal_alignment = "right",
		parent = "dead_space_filler",
		vertical_alignment = "bottom",
		size = {
			450,
			70,
		},
		position = {
			-20,
			320,
			2,
		},
	},
	debug_add_chest_2 = {
		horizontal_alignment = "right",
		parent = "dead_space_filler",
		vertical_alignment = "bottom",
		size = {
			450,
			70,
		},
		position = {
			-20,
			240,
			2,
		},
	},
	debug_add_chest_1 = {
		horizontal_alignment = "right",
		parent = "dead_space_filler",
		vertical_alignment = "bottom",
		size = {
			450,
			70,
		},
		position = {
			-20,
			160,
			2,
		},
	},
	loot_options_root = {
		horizontal_alignment = "center",
		parent = "dead_space_filler",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			0,
			-30,
			1,
		},
	},
}

for i = 1, num_loot_options do
	local idx = (i - 1) * 3 + 1
	local id = "loot_option_" .. idx

	scenegraph_definition[id] = {
		horizontal_alignment = "center",
		parent = "loot_options_root",
		vertical_alignment = "center",
		size = {
			364,
			0,
		},
		position = {
			-600 + 1920 * (i - 1),
			0,
			1,
		},
	}
	scenegraph_definition[id .. "_center"] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		parent = id,
		size = {
			0,
			0,
		},
		position = {
			0,
			0,
			1,
		},
	}
	scenegraph_definition["gamepad_tooltip_option_" .. idx] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		parent = id,
		size = {
			450,
			0,
		},
		position = {
			0,
			380,
			100,
		},
	}

	local idx = (i - 1) * 3 + 2
	local id = "loot_option_" .. idx

	scenegraph_definition[id] = {
		horizontal_alignment = "center",
		parent = "loot_options_root",
		vertical_alignment = "center",
		size = {
			364,
			0,
		},
		position = {
			0 + 1920 * (i - 1),
			0,
			1,
		},
	}
	scenegraph_definition[id .. "_center"] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		parent = id,
		size = {
			0,
			0,
		},
		position = {
			0,
			0,
			1,
		},
	}
	scenegraph_definition["gamepad_tooltip_option_" .. idx] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		parent = id,
		size = {
			450,
			0,
		},
		position = {
			0,
			380,
			100,
		},
	}

	local idx = (i - 1) * 3 + 3
	local id = "loot_option_" .. idx

	scenegraph_definition[id] = {
		horizontal_alignment = "center",
		parent = "loot_options_root",
		vertical_alignment = "center",
		size = {
			364,
			0,
		},
		position = {
			600 + 1920 * (i - 1),
			0,
			1,
		},
	}
	scenegraph_definition[id .. "_center"] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		parent = id,
		size = {
			0,
			0,
		},
		position = {
			0,
			0,
			1,
		},
	}
	scenegraph_definition["gamepad_tooltip_option_" .. idx] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		parent = id,
		size = {
			450,
			0,
		},
		position = {
			0,
			380,
			100,
		},
	}
end

local loot_option_positions_by_amount = {
	{
		{
			0,
			0,
		},
		{
			0,
			0,
		},
		{
			0,
			0,
		},
	},
	{
		{
			-300,
			0,
		},
		{
			300,
			0,
		},
		{
			0,
			0,
		},
	},
	{
		{
			-600,
			0,
		},
		{
			0,
			0,
		},
		{
			600,
			0,
		},
	},
}
local title_text_style = {
	font_size = 42,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "bottom",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2,
	},
}
local sub_title_text_style = {
	font_size = 28,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local warning_text_style = {
	font_size = 36,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("red", 255),
	offset = {
		0,
		0,
		2,
	},
}
local info_title_text_style = {
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "bottom",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local info_text_style = {
	font_size = 18,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = true,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2,
	},
}
local page_number_left_text_style = {
	font_size = 26,
	font_type = "hell_shark",
	horizontal_alignment = "right",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		-172,
		4,
		2,
	},
}
local page_number_right_text_style = {
	font_size = 26,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		171,
		4,
		2,
	},
}
local page_number_center_text_style = {
	font_size = 26,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		4,
		2,
	},
}
local item_grid_title_style = {
	font_size = 56,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		75,
		2,
	},
}
local settings_by_screen = {
	{
		description = "n/a",
		hero_specific_filter = true,
		name = "loot",
		display_name = Localize("hero_view_crafting_tokens"),
		icons = {
			normal = "tabs_icon_equipment",
			selected = "tabs_icon_equipment_glow",
		},
		contains_new_content = function ()
			return false
		end,
		slot_type = ItemType.LOOT_CHEST,
		item_filter = "slot_type == " .. ItemType.LOOT_CHEST,
	},
}
local option_icons = {}

for index, settings in ipairs(settings_by_screen) do
	option_icons[#option_icons + 1] = "tabs_icon_all_selected"
end

local viewport_widget = {
	scenegraph_id = "dead_space_filler",
	element = {
		passes = {
			{
				pass_type = "viewport",
				style_id = "viewport",
			},
			{
				content_id = "button_hotspot",
				pass_type = "hotspot",
			},
		},
	},
	style = {
		viewport = {
			enable_sub_gui = false,
			fov = 120,
			level_name = "levels/end_screen/world",
			scenegraph_id = "dead_space_filler",
			viewport_name = "chest_opening_viewport",
			world_name = "chest_opening",
			world_flags = {
				Application.DISABLE_SOUND,
				Application.DISABLE_ESRAM,
				Application.ENABLE_VOLUMETRICS,
			},
			object_sets = {
				"flow_victory",
			},
			layer = UILayer.default,
			camera_position = {
				0,
				0,
				0,
			},
			camera_lookat = {
				0,
				0,
				0,
			},
		},
	},
	content = {
		button_hotspot = {},
	},
}
local arrow_right = {
	scenegraph_id = "arrow_root",
	element = {
		passes = {
			{
				content_id = "button_hotspot",
				pass_type = "hotspot",
				style_id = "button_hotspot",
			},
			{
				pass_type = "texture",
				style_id = "arrow_lit",
				texture_id = "arrow_lit",
			},
			{
				pass_type = "texture",
				style_id = "arrow_unlit",
				texture_id = "arrow_unlit",
			},
		},
	},
	content = {
		arrow_lit = "arrow_on",
		arrow_unlit = "arrow_off_01",
		disable_with_gamepad = true,
		button_hotspot = {},
	},
	style = {
		button_hotspot = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			area_size = {
				58,
				62,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		arrow_lit = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				58,
				62,
			},
			offset = {
				0,
				0,
				1,
			},
			color = {
				0,
				255,
				255,
				255,
			},
		},
		arrow_unlit = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				58,
				62,
			},
			offset = {
				0,
				0,
				0,
			},
			color = {
				128,
				255,
				255,
				255,
			},
		},
	},
	offset = {
		0,
		5,
		0,
	},
}
local arrow_left = {
	scenegraph_id = "arrow_root",
	element = {
		passes = {
			{
				content_id = "button_hotspot",
				pass_type = "hotspot",
				style_id = "button_hotspot",
			},
			{
				content_id = "arrow_lit",
				pass_type = "texture_uv",
				style_id = "arrow_lit",
			},
			{
				content_id = "arrow_unlit",
				pass_type = "texture_uv",
				style_id = "arrow_unlit",
			},
		},
	},
	content = {
		disable_with_gamepad = true,
		button_hotspot = {},
		arrow_lit = {
			texture_id = "arrow_on",
			uvs = {
				{
					1,
					0,
				},
				{
					0,
					1,
				},
			},
		},
		arrow_unlit = {
			texture_id = "arrow_off_01",
			uvs = {
				{
					1,
					0,
				},
				{
					0,
					1,
				},
			},
		},
	},
	style = {
		button_hotspot = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			area_size = {
				58,
				62,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		arrow_lit = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				58,
				62,
			},
			offset = {
				0,
				0,
				1,
			},
			color = {
				0,
				255,
				255,
				255,
			},
		},
		arrow_unlit = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				58,
				62,
			},
			offset = {
				0,
				0,
				0,
			},
			color = {
				128,
				255,
				255,
				255,
			},
		},
	},
	offset = {
		0,
		5,
		0,
	},
}

local function create_loot_preview_widget(scenegraph_id, size)
	local widget = {
		element = {},
	}
	local passes = {
		{
			pass_type = "viewport",
			style_id = "viewport",
		},
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
		},
	}
	local content = {
		activated = true,
		button_hotspot = {},
	}
	local style = {
		viewport = {
			enable_sub_gui = false,
			fov = 65,
			layer = 990,
			shading_environment = "environment/blank_offscreen_chest_item",
			viewport_type = "default_forward",
			world_name = scenegraph_id,
			viewport_name = scenegraph_id,
			camera_position = {
				0,
				0,
				0,
			},
			camera_lookat = {
				0,
				0,
				0,
			},
		},
	}

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_loot_widget(index, size)
	local frame_settings = UIFrameSettings.menu_frame_09
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
			style_id = "button_hotspot",
			content_check_function = function (content)
				return not content.parent.presentation_complete
			end,
		},
		{
			content_id = "item_hotspot",
			pass_type = "hotspot",
			style_id = "item_icon",
			content_check_function = function (content)
				return content.parent.presentation_complete
			end,
		},
		{
			content_id = "item_hotspot_2",
			pass_type = "hotspot",
			content_check_function = function (content)
				return content.parent.presentation_complete
			end,
		},
		{
			pass_type = "text",
			style_id = "item_name",
			text_id = "item_name",
		},
		{
			pass_type = "text",
			style_id = "item_type",
			text_id = "item_type",
		},
		{
			pass_type = "text",
			style_id = "item_name_shadow",
			text_id = "item_name",
		},
		{
			pass_type = "text",
			style_id = "item_type_shadow",
			text_id = "item_type",
		},
		{
			item_id = "item",
			pass_type = "item_tooltip",
			style_id = "item_tooltip",
			content_check_function = function (content)
				local is_hover = content.item_hotspot.is_hover or content.item_hotspot_2.is_hover

				return is_hover and content.item
			end,
		},
		{
			pass_type = "texture",
			style_id = "item_icon",
			texture_id = "item_icon",
		},
		{
			pass_type = "texture",
			style_id = "item_icon_frame",
			texture_id = "item_icon_frame",
		},
		{
			pass_type = "texture",
			style_id = "item_icon_rarity",
			texture_id = "item_icon_rarity",
		},
		{
			pass_type = "texture",
			style_id = "illusion_overlay",
			texture_id = "illusion_overlay",
			content_check_function = function (content)
				local item = content.item
				local item_skin = item and item.skin

				if item_skin then
					return item.data.item_type == "weapon_skin"
				end
			end,
		},
		{
			pass_type = "texture",
			style_id = "illusion_icon",
			texture_id = "illusion_icon",
			content_check_function = function (content)
				local item = content.item
				local item_skin = item and item.skin

				if item_skin then
					return item.data.item_type ~= "weapon_skin" and WeaponSkins.default_skins[item.key] ~= item_skin
				end
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
			content_check_function = function (content)
				return content.draw_frame
			end,
		},
		{
			pass_type = "texture",
			style_id = "lock_bottom",
			texture_id = "lock_bottom",
		},
		{
			pass_type = "texture",
			style_id = "lock_top",
			texture_id = "lock_top",
		},
		{
			pass_type = "texture",
			style_id = "lock_top_shadow",
			texture_id = "lock_top_shadow",
		},
		{
			pass_type = "texture",
			style_id = "lock_bottom_shadow",
			texture_id = "lock_bottom_shadow",
		},
		{
			pass_type = "texture",
			style_id = "lock_bottom_glow",
			texture_id = "lock_bottom_glow",
		},
		{
			pass_type = "texture",
			style_id = "lock_bottom_glow_2",
			texture_id = "lock_bottom_glow_2",
		},
		{
			pass_type = "texture",
			style_id = "lock_glow",
			texture_id = "lock_glow",
		},
		{
			pass_type = "texture",
			style_id = "lock_glow_1",
			texture_id = "lock_glow_1",
		},
		{
			pass_type = "texture",
			style_id = "lock_glow_2",
			texture_id = "lock_glow_2",
		},
		{
			pass_type = "texture",
			style_id = "final_glow",
			texture_id = "final_glow",
		},
		{
			pass_type = "texture",
			style_id = "final_glow_1",
			texture_id = "final_glow_1",
		},
		{
			pass_type = "texture",
			style_id = "final_glow_2",
			texture_id = "final_glow_2",
		},
		{
			pass_type = "texture",
			style_id = "image",
			texture_id = "image",
			content_check_function = function (content)
				return content.image
			end,
		},
		{
			pass_type = "rotated_texture",
			style_id = "loading_icon",
			texture_id = "loading_icon",
			content_check_function = function (content)
				return content.is_loading
			end,
			content_change_function = function (content, style, _, dt)
				local progress = style.progress or 0

				progress = (progress + dt) % 1

				local angle = math.pow(2, math.smoothstep(progress, 0, 1)) * (math.pi * 2)

				style.angle = angle
				style.progress = progress
			end,
		},
		{
			pass_type = "text",
			style_id = "amount_text",
			text_id = "amount_text",
			content_check_function = function (content)
				return content.amount_text
			end,
		},
		{
			pass_type = "text",
			style_id = "amount_text_shadow",
			text_id = "amount_text",
			content_check_function = function (content)
				return content.amount_text
			end,
		},
	}
	local content = {
		amount_text = "",
		draw_frame = false,
		final_glow = "loot_presentation_circle_glow_plentiful_large",
		final_glow_1 = "loot_presentation_glow_06",
		final_glow_2 = "loot_presentation_glow_05",
		illusion_icon = "item_applied_illusion_icon",
		illusion_overlay = "item_frame_illusion",
		item_icon = "icons_placeholder",
		item_icon_frame = "item_frame",
		item_icon_rarity = "icon_bg_plentiful",
		item_name = "n/a",
		item_type = "n/a",
		loading_icon = "loot_loading",
		lock_bottom = "loot_presentation_fg_02",
		lock_bottom_glow = "loot_presentation_glow_02",
		lock_bottom_glow_2 = "loot_presentation_glow_01",
		lock_bottom_shadow = "loot_presentation_fg_02_fade",
		lock_glow = "loot_presentation_circle_glow_plentiful",
		lock_glow_1 = "loot_presentation_glow_04",
		lock_glow_2 = "loot_presentation_glow_03",
		lock_top = "loot_presentation_fg_01",
		lock_top_shadow = "loot_presentation_fg_01_fade",
		frame = frame_settings.texture,
		item_hotspot = {},
		item_hotspot_2 = {
			allow_multi_hover = true,
		},
		button_hotspot = {
			hover_type = "circle",
		},
	}
	local style = {
		button_hotspot = {
			size = {
				400,
				400,
			},
			offset = {
				size[1] / 2 - 200,
				size[2] / 2 - 200,
				0,
			},
		},
		frame = {
			size = {
				[2] = size[2],
			},
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				2,
			},
		},
		loading_icon = {
			angle = 0,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				150,
				150,
			},
			offset = {
				0,
				0,
				1,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			scenegraph_id = "loot_option_" .. index .. "_center",
			pivot = {
				75,
				75,
			},
		},
		image = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				364,
				364,
			},
			offset = {
				0,
				0,
				1,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			scenegraph_id = "loot_option_" .. index .. "_center",
		},
		amount_text = {
			font_size = 42,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			localize = false,
			upper_case = false,
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				-100,
				3,
			},
			scenegraph_id = "loot_option_" .. index .. "_center",
		},
		amount_text_shadow = {
			font_size = 42,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			localize = false,
			upper_case = false,
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				2,
				-102,
				2,
			},
			scenegraph_id = "loot_option_" .. index .. "_center",
		},
		lock_top = {
			horizontal_alignment = "center",
			vertical_alignment = "top",
			texture_size = {
				364,
				364,
			},
			offset = {
				0,
				182,
				13,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		lock_top_shadow = {
			horizontal_alignment = "center",
			vertical_alignment = "top",
			texture_size = {
				364,
				95,
			},
			offset = {
				0,
				0,
				1,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		lock_bottom = {
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			texture_size = {
				364,
				364,
			},
			offset = {
				0,
				-182,
				18,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		lock_bottom_shadow = {
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			texture_size = {
				364,
				95,
			},
			offset = {
				0,
				0,
				1,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		lock_bottom_glow = {
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			texture_size = {
				93,
				88,
			},
			offset = {
				0,
				-40,
				19,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			default_color = {
				0,
				255,
				255,
				255,
			},
		},
		lock_bottom_glow_2 = {
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			texture_size = {
				93,
				88,
			},
			offset = {
				0,
				-40,
				20,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			default_color = {
				0,
				255,
				255,
				255,
			},
		},
		lock_glow = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				600,
				600,
			},
			offset = {
				0,
				0,
				21,
			},
			color = {
				0,
				255,
				255,
				255,
			},
			default_color = {
				0,
				255,
				255,
				255,
			},
		},
		lock_glow_1 = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				408,
				408,
			},
			offset = {
				0,
				0,
				22,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			default_color = {
				0,
				255,
				255,
				255,
			},
		},
		lock_glow_2 = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				408,
				408,
			},
			offset = {
				0,
				0,
				23,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			default_color = {
				0,
				255,
				255,
				255,
			},
		},
		final_glow = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				600,
				1000,
			},
			offset = {
				0,
				0,
				21,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			default_color = {
				0,
				255,
				255,
				255,
			},
		},
		final_glow_1 = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				600,
				1000,
			},
			offset = {
				0,
				0,
				22,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			default_color = {
				0,
				255,
				255,
				255,
			},
		},
		final_glow_2 = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				600,
				1000,
			},
			offset = {
				0,
				0,
				23,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			default_color = {
				0,
				255,
				255,
				255,
			},
		},
		illusion_overlay = {
			horizontal_alignment = "center",
			vertical_alignment = "top",
			texture_size = {
				80,
				80,
			},
			offset = {
				0,
				40,
				16,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		illusion_icon = {
			horizontal_alignment = "center",
			vertical_alignment = "top",
			texture_size = {
				20,
				20,
			},
			offset = {
				22,
				-12,
				16,
			},
			color = Colors.get_color_table_with_alpha("promo", 255),
		},
		item_icon_frame = {
			horizontal_alignment = "center",
			vertical_alignment = "top",
			texture_size = {
				80,
				80,
			},
			offset = {
				0,
				40,
				17,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		item_icon = {
			size = {
				80,
				80,
			},
			offset = {
				size[1] / 2 - 40,
				-40,
				15,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		item_icon_rarity = {
			horizontal_alignment = "center",
			vertical_alignment = "top",
			texture_size = {
				80,
				80,
			},
			offset = {
				0,
				40,
				14,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		item_name = {
			font_size = 30,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			localize = false,
			upper_case = true,
			vertical_alignment = "bottom",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("white", 0),
			size = {
				size[1],
				50,
			},
			offset = {
				0,
				size[2] + 182 + 70,
				30,
			},
		},
		item_name_shadow = {
			font_size = 30,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			localize = false,
			upper_case = true,
			vertical_alignment = "bottom",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 0),
			size = {
				size[1],
				50,
			},
			offset = {
				2,
				size[2] + 182 + 70 - 2,
				29,
			},
		},
		item_type = {
			font_size = 26,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			localize = false,
			vertical_alignment = "top",
			text_color = Colors.get_color_table_with_alpha("white", 0),
			size = {
				size[1],
				50,
			},
			offset = {
				0,
				size[2] + 182,
				30,
			},
		},
		item_type_shadow = {
			font_size = 26,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			localize = false,
			vertical_alignment = "top",
			text_color = Colors.get_color_table_with_alpha("black", 0),
			size = {
				size[1],
				50,
			},
			offset = {
				2,
				size[2] + 182 - 2,
				29,
			},
		},
		item_tooltip = {
			font_size = 18,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			localize = true,
			max_width = 500,
			vertical_alignment = "top",
			text_color = Colors.get_color_table_with_alpha("white", 255),
			line_colors = {
				Colors.get_color_table_with_alpha("font_title", 255),
				Colors.get_color_table_with_alpha("white", 255),
			},
			size = {
				80,
				80,
			},
			offset = {
				size[1] / 2 - 40,
				-40,
				4,
			},
		},
	}

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = "loot_option_" .. index

	return widget
end

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

local function create_chest_indicator_func(index, current_index, rarity_a, rarity_b, rarity_c)
	local spacing = 20
	local size = 40
	local rarity_size = size / 5
	local rarity_settings_a = RaritySettings[rarity_a]
	local rarity_color_a = rarity_settings_a.color
	local rarity_settings_b = RaritySettings[rarity_b]
	local rarity_color_b = rarity_settings_b and rarity_settings_b.color
	local rarity_settings_c = RaritySettings[rarity_c]
	local rarity_color_c = rarity_settings_c and rarity_settings_c.color
	local selected = index == current_index
	local widget = {
		scenegraph_id = "chest_indicator_root",
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "button_hotspot",
				},
				{
					pass_type = "texture",
					style_id = "indicator_selected",
					texture_id = "dot_lit",
					content_check_function = function (content)
						return content.selected
					end,
				},
				{
					pass_type = "texture",
					style_id = "indicator_unselected",
					texture_id = "dot_unlit",
					content_check_function = function (content)
						return not content.selected
					end,
				},
				{
					pass_type = "texture",
					style_id = "texture_hover_id",
					texture_id = "dot_lit",
					content_check_function = function (content)
						return not content.selected
					end,
				},
				{
					pass_type = "texture",
					style_id = "rarity_a",
					texture_id = "rarity_icon",
				},
				{
					pass_type = "texture",
					style_id = "rarity_b",
					texture_id = "rarity_icon",
					content_check_function = function (content)
						return rarity_settings_b
					end,
				},
				{
					pass_type = "texture",
					style_id = "rarity_c",
					texture_id = "rarity_icon",
					content_check_function = function (content)
						return rarity_settings_c
					end,
				},
			},
		},
		content = {
			dot_lit = "dot_on",
			dot_unlit = "dot_off_01",
			rarity_icon = "loot_indicator_rarity",
			button_hotspot = {},
			index = index,
			selected = selected,
		},
		style = {
			button_hotspot = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				area_size = {
					60,
					60,
				},
				offset = {
					0,
					-5,
					0,
				},
			},
			indicator_selected = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					6,
				},
				texture_size = {
					60,
					60,
				},
			},
			indicator_unselected = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				color = {
					128,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					6,
				},
				texture_size = {
					60,
					60,
				},
			},
			texture_hover_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					6,
				},
				texture_size = {
					60,
					60,
				},
			},
			rarity_a = {
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				color = rarity_color_a,
				offset = {
					-rarity_size * 2,
					-size,
					6,
				},
				texture_size = {
					18,
					18,
				},
			},
			rarity_b = {
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				color = rarity_color_b,
				offset = {
					0,
					-size,
					6,
				},
				texture_size = {
					18,
					18,
				},
			},
			rarity_c = {
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				color = rarity_color_c,
				offset = {
					rarity_size * 2,
					-size,
					6,
				},
				texture_size = {
					18,
					18,
				},
			},
		},
		offset = {
			(index - 1) * (spacing + size),
			0,
			0,
		},
	}

	return widget
end

local disable_with_gamepad = true
local widgets = {
	chest_title = UIWidgets.create_simple_text("chest_title", "chest_title", nil, nil, title_text_style),
	chest_sub_title = UIWidgets.create_simple_text("chest_sub_title", "chest_sub_title", nil, nil, sub_title_text_style),
	info_text_title = UIWidgets.create_simple_text("n/a", "info_title_text", nil, nil, info_title_text_style),
	info_text_box = UIWidgets.create_simple_text("loot_opening_screen_desc", "info_text_box", nil, nil, info_text_style),
	info_window = UIWidgets.create_rect_with_outer_frame("info_window", scenegraph_definition.info_window.size, nil, nil, Colors.get_color_table_with_alpha("console_menu_rect", 210)),
	item_grid_title = UIWidgets.create_simple_text(string.upper(Localize("hero_window_loot_crates")), "item_grid_title", nil, nil, item_grid_title_style),
	title_top_divider = UIWidgets.create_simple_texture("divider_01_top", "item_grid_title"),
	item_grid = UIWidgets.create_grid("item_grid", scenegraph_definition.item_grid.size, 5, 4, 16, 16, false),
	page_button_next = UIWidgets.create_arrow_button("page_button_next", math.pi),
	page_button_previous = UIWidgets.create_arrow_button("page_button_previous"),
	input_icon_next = UIWidgets.create_simple_texture("xbone_button_icon_a", "input_icon_next"),
	input_icon_previous = UIWidgets.create_simple_texture("xbone_button_icon_a", "input_icon_previous"),
	input_arrow_next = UIWidgets.create_simple_uv_texture("settings_arrow_normal", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "input_arrow_next"),
	input_arrow_previous = UIWidgets.create_simple_texture("settings_arrow_normal", "input_arrow_previous"),
	page_text_center = UIWidgets.create_simple_text("/", "page_text_area", nil, nil, page_number_center_text_style),
	page_text_left = UIWidgets.create_simple_text("0", "page_text_area", nil, nil, page_number_left_text_style),
	page_text_right = UIWidgets.create_simple_text("0", "page_text_area", nil, nil, page_number_right_text_style),
	page_text_area = UIWidgets.create_simple_texture("tab_menu_bg_03", "page_text_area"),
	open_button = UIWidgets.create_default_button("open_button", scenegraph_definition.open_button.size, nil, nil, Localize("interaction_action_open") .. " 1", 32, "green", nil, nil, disable_with_gamepad, false),
	open_multiple_button = UIWidgets.create_default_button("open_multiple_button", scenegraph_definition.open_multiple_button.size, nil, nil, Localize("interaction_action_open") .. " 5", 32, "green", nil, nil, disable_with_gamepad, true),
	close_button = UIWidgets.create_default_button("close_button", scenegraph_definition.close_button.size, nil, nil, Localize("interaction_action_close"), 32, nil, nil, nil, disable_with_gamepad, true),
	item_cap_warning_text = {
		scenegraph_id = "item_cap_warning_text",
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "background",
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
				},
			},
		},
		content = {
			text = Localize("item_cap_warning_text"),
		},
		style = {
			background = {
				color = {
					200,
					0,
					0,
					0,
				},
			},
			text = warning_text_style,
		},
	},
}
local input_description_widgets = {
	bottom_panel = UIWidgets.create_simple_uv_texture("menu_panel_bg", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "bottom_panel", nil, nil, panel_color),
}
local console_tooltip_pass_definition = {
	"skin_applied",
	"deed_mission",
	"deed_difficulty",
	"mutators",
	"deed_rewards",
	"ammunition",
	"fatigue",
	"item_power_level",
	"properties",
	"traits",
	"weapon_skin_title",
	"item_information_text",
	"loot_chest_difficulty",
	"loot_chest_power_range",
	"unwieldable",
	"console_keywords",
	"console_item_description",
	"light_attack_stats",
	"heavy_attack_stats",
	"detailed_stats_light",
	"detailed_stats_heavy",
	"detailed_stats_push",
	"detailed_stats_ranged_light",
	"detailed_stats_ranged_heavy",
	"console_item_background",
}
local gamepad_tooltip_widgets = {}

for i = 1, num_loot_options do
	gamepad_tooltip_widgets["item_tooltip_" .. (i - 1) * 3 + 1] = UIWidgets.create_simple_item_presentation("gamepad_tooltip_option_" .. (i - 1) * 3 + 1, console_tooltip_pass_definition)
	gamepad_tooltip_widgets["item_tooltip_" .. (i - 1) * 3 + 2] = UIWidgets.create_simple_item_presentation("gamepad_tooltip_option_" .. (i - 1) * 3 + 2, console_tooltip_pass_definition)
	gamepad_tooltip_widgets["item_tooltip_" .. (i - 1) * 3 + 3] = UIWidgets.create_simple_item_presentation("gamepad_tooltip_option_" .. (i - 1) * 3 + 3, console_tooltip_pass_definition)
end

local option_background_widgets = {}

for i = 1, num_loot_options do
	option_background_widgets["loot_background_" .. (i - 1) * 3 + 1] = UIWidgets.create_background("loot_option_" .. (i - 1) * 3 + 1, scenegraph_definition["loot_option_" .. (i - 1) * 3 + 1].size, "item_tooltip_background_old")
	option_background_widgets["loot_background_" .. (i - 1) * 3 + 2] = UIWidgets.create_background("loot_option_" .. (i - 1) * 3 + 2, scenegraph_definition["loot_option_" .. (i - 1) * 3 + 2].size, "item_tooltip_background_old")
	option_background_widgets["loot_background_" .. (i - 1) * 3 + 3] = UIWidgets.create_background("loot_option_" .. (i - 1) * 3 + 3, scenegraph_definition["loot_option_" .. (i - 1) * 3 + 3].size, "item_tooltip_background_old")
end

local option_widgets = {}

for i = 1, num_loot_options do
	option_widgets["loot_option_" .. (i - 1) * 3 + 1] = create_loot_widget((i - 1) * 3 + 1, scenegraph_definition["loot_option_" .. (i - 1) * 3 + 1].size)
	option_widgets["loot_option_" .. (i - 1) * 3 + 2] = create_loot_widget((i - 1) * 3 + 2, scenegraph_definition["loot_option_" .. (i - 1) * 3 + 2].size)
	option_widgets["loot_option_" .. (i - 1) * 3 + 3] = create_loot_widget((i - 1) * 3 + 3, scenegraph_definition["loot_option_" .. (i - 1) * 3 + 3].size)
end

local preview_widgets = {}

if USE_DELAYED_SPAWN then
	preview_widgets.loot_option_1 = create_loot_preview_widget("loot_option_1", scenegraph_definition.loot_option_1.size)
	preview_widgets.loot_option_2 = create_loot_preview_widget("loot_option_2", scenegraph_definition.loot_option_2.size)
	preview_widgets.loot_option_3 = create_loot_preview_widget("loot_option_3", scenegraph_definition.loot_option_3.size)
else
	for i = 1, num_loot_options do
		preview_widgets["loot_option_" .. (i - 1) * 3 + 1] = create_loot_preview_widget("loot_option_" .. (i - 1) * 3 + 1, scenegraph_definition["loot_option_" .. (i - 1) * 3 + 1].size)
		preview_widgets["loot_option_" .. (i - 1) * 3 + 2] = create_loot_preview_widget("loot_option_" .. (i - 1) * 3 + 2, scenegraph_definition["loot_option_" .. (i - 1) * 3 + 2].size)
		preview_widgets["loot_option_" .. (i - 1) * 3 + 3] = create_loot_preview_widget("loot_option_" .. (i - 1) * 3 + 3, scenegraph_definition["loot_option_" .. (i - 1) * 3 + 3].size)
	end
end

local arrow_widgets = {
	arrow_right = arrow_right,
	arrow_left = arrow_left,
}
local continue_button = UIWidgets.create_default_button("continue_button", scenegraph_definition.continue_button.size, nil, nil, Localize("continue"), 32, nil, nil, nil, disable_with_gamepad)
local debug_button_widgets = {
	debug_add_chest_1 = UIWidgets.create_default_button("debug_add_chest_1", scenegraph_definition.debug_add_chest_1.size, nil, nil, "DEBUG: Normal Chest", nil, "green"),
	debug_add_chest_2 = UIWidgets.create_default_button("debug_add_chest_2", scenegraph_definition.debug_add_chest_2.size, nil, nil, "DEBUG: Hard Chest", nil, "green"),
	debug_add_chest_3 = UIWidgets.create_default_button("debug_add_chest_3", scenegraph_definition.debug_add_chest_3.size, nil, nil, "DEBUG: Nightmare Chest", nil, "green"),
	debug_add_chest_4 = UIWidgets.create_default_button("debug_add_chest_4", scenegraph_definition.debug_add_chest_4.size, nil, nil, "DEBUG: Cataclysm Chest", nil, "green"),
}
local generic_input_actions = {
	default = {},
	chest_selected_single_use = {
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_pad",
				priority = 1,
			},
			{
				ignore_localization = true,
				input_action = "confirm",
				priority = 2,
				description_text = Localize("interaction_action_open"),
			},
			{
				description_text = "input_description_close",
				input_action = "back",
				priority = 3,
			},
		},
	},
	chest_selected = {
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_pad",
				priority = 1,
			},
			{
				ignore_localization = true,
				input_action = "confirm",
				priority = 2,
				description_text = Localize("interaction_action_open") .. " 1",
			},
			{
				ignore_localization = true,
				input_action = "refresh",
				priority = 3,
				description_text = Localize("interaction_action_open") .. " 5",
			},
			{
				description_text = "input_description_close",
				input_action = "back",
				priority = 4,
			},
		},
	},
	chest_not_selected = {
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_pad",
				priority = 1,
			},
			{
				description_text = "input_description_close",
				input_action = "back",
				priority = 2,
			},
		},
	},
	chest_not_selected = {
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_pad",
				priority = 1,
			},
			{
				description_text = "input_description_close",
				input_action = "back",
				priority = 2,
			},
		},
	},
	chest_opened = {
		actions = {
			{
				description_text = "input_description_select",
				ignore_keybinding = true,
				input_action = "d_horizontal",
				priority = 1,
			},
			{
				description_text = "input_description_open",
				input_action = "confirm",
				priority = 1,
			},
			{
				description_text = "input_description_tooltip",
				input_action = "special_1",
				priority = 2,
			},
			{
				description_text = "input_description_back",
				input_action = "back",
				priority = 3,
			},
		},
	},
	chest_opened_pages = {
		actions = {
			{
				description_text = "input_description_select",
				ignore_keybinding = true,
				input_action = "d_horizontal",
				priority = 1,
			},
			{
				description_text = "input_description_open",
				input_action = "confirm",
				priority = 1,
			},
			{
				description_text = "input_description_tooltip",
				input_action = "special_1",
				priority = 2,
			},
			{
				description_text = "input_description_prev_page",
				input_action = "trigger_cycle_previous",
				priority = 3,
			},
			{
				description_text = "input_description_next_page",
				input_action = "trigger_cycle_next",
				priority = 4,
			},
			{
				description_text = "input_description_back",
				input_action = "back",
				priority = 5,
			},
		},
	},
	loot_presented = {
		actions = {
			{
				description_text = "input_description_tooltip",
				input_action = "special_1",
				priority = 1,
			},
			{
				description_text = "input_description_back",
				input_action = "back",
				priority = 2,
			},
		},
	},
	loot_presented_pages = {
		actions = {
			{
				description_text = "input_description_tooltip",
				input_action = "special_1",
				priority = 1,
			},
			{
				description_text = "input_description_prev_page",
				input_action = "trigger_cycle_previous",
				priority = 2,
			},
			{
				description_text = "input_description_next_page",
				input_action = "trigger_cycle_next",
				priority = 3,
			},
			{
				description_text = "input_description_back",
				input_action = "back",
				priority = 4,
			},
		},
	},
}
local animation_definitions = {
	open_loot_widget = {
		{
			end_progress = 0.3,
			name = "rumble",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				local wwise_world = params.wwise_world

				WwiseWorld.trigger_event(wwise_world, "play_gui_chest_reward_rumble")
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local bounce_anim_progress = math.bounce(progress)
				local content = widget.content
				local style = widget.style
				local offset = widget.offset
				local scenegraph_id = widget.scenegraph_id
				local definition = scenegraph_definition[scenegraph_id]
				local definition_size = definition.size

				offset[1] = 5 - 5 * math.catmullrom(bounce_anim_progress, 10, 1, 1, -1)
				offset[2] = 5 - 5 * math.catmullrom(bounce_anim_progress, -1, 1, 1, 10)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
		},
		{
			end_progress = 0.3,
			name = "glow_exit",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local content = widget.content
				local style = widget.style

				style.lock_bottom_glow.color[1] = math.max(style.lock_bottom_glow.color[1], style.lock_bottom_glow.default_color[1] * anim_progress)
				style.lock_bottom_glow_2.color[1] = math.max(style.lock_bottom_glow_2.color[1], style.lock_bottom_glow_2.default_color[1] * anim_progress)
				style.lock_glow.color[1] = math.min(style.lock_glow.color[1], style.lock_glow.default_color[1] * (1 - anim_progress))
				style.lock_glow_1.color[1] = math.min(style.lock_glow_1.color[1], style.lock_glow_1.default_color[1] * (1 - anim_progress))
				style.lock_glow_2.color[1] = math.min(style.lock_glow_2.color[1], style.lock_glow_2.default_color[1] * (1 - anim_progress))
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
		},
		{
			end_progress = 0.6,
			name = "open",
			start_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				if not params.played_open_sound then
					local wwise_world = params.wwise_world

					WwiseWorld.trigger_event(wwise_world, "play_gui_chest_reward_open")

					params.played_open_sound = true
				end

				local anim_progress = math.easeInCubic(progress)
				local content = widget.content
				local style = widget.style
				local scenegraph_id = widget.scenegraph_id
				local definition = scenegraph_definition[scenegraph_id]
				local definition_size = definition.size
				local new_height = anim_progress * 400

				ui_scenegraph[scenegraph_id].size[2] = new_height

				local reward_option = params.reward_option
				local background_widget = reward_option.background_widget
				local background_content = background_widget.content.background
				local background_uvs = background_content.uvs
				local background_texture = background_content.texture_id
				local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)

				background_uvs[2][2] = math.min(new_height / background_texture_settings.size[2], 1)
				style.item_name.offset[2] = new_height + 182 + 35
				style.item_name_shadow.offset[2] = style.item_name.offset[2] - 2
				style.item_type.offset[2] = new_height + 182 - 5
				style.item_type_shadow.offset[2] = style.item_type.offset[2] - 2
				style.item_icon.offset[2] = new_height - 40
				style.item_tooltip.offset[2] = new_height - 40
				content.draw_frame = true

				local frame_style = style.frame

				frame_style.size[2] = new_height + 20
				frame_style.offset[2] = -10
				reward_option.opened = true
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				local presentation_complete = true
				local reward_option = params.reward_option
				local item_previewer = reward_option.item_previewer
				local reward_key = reward_option.reward_key

				if item_previewer and reward_key then
					item_previewer:present_item(reward_key)
				end

				local world_previewer = reward_option.world_previewer

				if world_previewer then
					world_previewer:force_unhide_character()
				end

				reward_option.presentation_complete = presentation_complete
				widget.content.presentation_complete = presentation_complete

				if not params.played_opened_sound then
					local wwise_world = params.wwise_world

					WwiseWorld.trigger_event(wwise_world, "play_gui_chest_reward_opened")

					params.played_opened_sound = true
				end
			end,
		},
		{
			end_progress = 0.8,
			name = "glow_enter",
			start_progress = 0.6,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local content = widget.content
				local style = widget.style

				style.final_glow.color[1] = math.max(style.final_glow.color[1], style.final_glow.default_color[1] * anim_progress)
				style.final_glow_1.color[1] = math.max(style.final_glow_1.color[1], style.final_glow_1.default_color[1] * anim_progress)
				style.final_glow_2.color[1] = math.max(style.final_glow_2.color[1], style.final_glow_2.default_color[1] * anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
		},
		{
			end_progress = 1.2,
			name = "fade_in_text",
			start_progress = 0.8,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local content = widget.content
				local style = widget.style
				local alpha = 255 * anim_progress

				style.item_name.text_color[1] = alpha
				style.item_name_shadow.text_color[1] = alpha
				style.item_type.text_color[1] = alpha
				style.item_type_shadow.text_color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
		},
	},
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
	USE_DELAYED_SPAWN = USE_DELAYED_SPAWN,
	arrow_widgets = arrow_widgets,
	create_chest_indicator_func = create_chest_indicator_func,
	num_loot_options = num_loot_options,
	loot_option_positions_by_amount = loot_option_positions_by_amount,
	gamepad_tooltip_widgets = gamepad_tooltip_widgets,
	input_description_widgets = input_description_widgets,
	widgets = widgets,
	option_widgets = option_widgets,
	debug_button_widgets = debug_button_widgets,
	option_background_widgets = option_background_widgets,
	preview_widgets = preview_widgets,
	viewport_widget = viewport_widget,
	continue_button = continue_button,
	settings_by_screen = settings_by_screen,
	generic_input_actions = generic_input_actions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	background_fade_definition = UIWidgets.create_simple_rect("dead_space_filler", {
		0,
		5,
		5,
		5,
	}),
}
