-- chunkname: @scripts/ui/views/hero_view/states/store_window_layout.lua

local windows = {
	panel = {
		always_reload = true,
		class_name = "StoreWindowPanel",
		ignore_alignment = true,
		name = "panel",
	},
	background = {
		class_name = "StoreWindowBackground",
		ignore_alignment = true,
		name = "background",
	},
	item_list = {
		always_reload = true,
		class_name = "StoreWindowItemList",
		ignore_alignment = true,
		name = "item_list",
	},
	item_preview = {
		always_reload = false,
		class_name = "StoreWindowItemPreview",
		ignore_alignment = true,
		name = "item_preview",
	},
	dlc_preview = {
		always_reload = true,
		class_name = "StoreWindowItemPreview",
		ignore_alignment = true,
		name = "dlc_preview",
	},
	category_list = {
		always_reload = true,
		class_name = "StoreWindowCategoryList",
		ignore_alignment = true,
		name = "category_list",
	},
	category_item_list = {
		always_reload = false,
		class_name = "StoreWindowCategoryItemList",
		ignore_alignment = true,
		name = "category_item_list",
	},
	path_title = {
		class_name = "StoreWindowPathTitle",
		ignore_alignment = true,
		name = "path_title",
	},
	featured = {
		class_name = "StoreWindowFeatured",
		ignore_alignment = true,
		name = "featured",
	},
	item_details = {
		class_name = "StoreWindowItemDetails",
		ignore_alignment = true,
		name = "item_details",
	},
}

DLCUtils.merge("store_windows", windows)

local window_layouts = {
	{
		close_on_exit = true,
		display_name = "featured",
		draw_character = true,
		menu_option = true,
		name = "featured",
		windows = {
			background = 2,
			featured = 3,
			panel = 1,
		},
		object_sets = {},
		level_events = {
			"main_menu",
		},
	},
	{
		close_on_exit = true,
		display_name = "category",
		draw_character = true,
		menu_option = true,
		name = "category",
		windows = {
			background = 2,
			category_item_list = 5,
			category_list = 4,
			panel = 1,
			path_title = 3,
		},
		object_sets = {},
		level_events = {
			"main_menu",
		},
	},
	{
		close_on_exit = true,
		display_name = "item_list",
		draw_character = true,
		menu_option = false,
		name = "item_list",
		windows = {
			background = 2,
			item_list = 4,
			item_preview = 5,
			panel = 1,
			path_title = 3,
		},
		object_sets = {},
		level_events = {
			"main_menu",
		},
	},
	{
		close_on_exit = true,
		display_name = "bundle_list",
		draw_character = true,
		menu_option = false,
		name = "bundle_list",
		windows = {
			background = 2,
			item_list = 4,
			item_preview = 5,
			panel = 1,
			path_title = 3,
		},
		object_sets = {},
		level_events = {
			"main_menu",
		},
	},
	{
		close_on_exit = true,
		display_name = "dlc_list",
		draw_character = true,
		menu_option = false,
		name = "dlc_list",
		windows = {
			background = 2,
			dlc_preview = 5,
			item_list = 4,
			panel = 1,
			path_title = 3,
		},
		object_sets = {},
		level_events = {
			"main_menu",
		},
	},
	{
		close_on_exit = true,
		display_name = "item_detailed",
		draw_character = true,
		menu_option = false,
		name = "item_detailed",
		windows = {
			background = 2,
			item_details = 4,
			item_preview = 5,
			panel = 1,
			path_title = 3,
		},
		object_sets = {},
		level_events = {
			"main_menu",
		},
	},
}

DLCUtils.append("store_window_layouts", window_layouts)

local MAX_ACTIVE_WINDOWS = 5

return {
	max_active_windows = MAX_ACTIVE_WINDOWS,
	windows = windows,
	window_layouts = window_layouts,
}
