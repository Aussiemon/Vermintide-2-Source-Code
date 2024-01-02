local windows = {
	panel = {
		ignore_alignment = true,
		name = "panel",
		class_name = "StoreWindowPanel",
		always_reload = true
	},
	background = {
		ignore_alignment = true,
		name = "background",
		class_name = "StoreWindowBackground"
	},
	item_list = {
		ignore_alignment = true,
		name = "item_list",
		class_name = "StoreWindowItemList",
		always_reload = true
	},
	item_preview = {
		ignore_alignment = true,
		name = "item_preview",
		class_name = "StoreWindowItemPreview",
		always_reload = false
	},
	dlc_preview = {
		ignore_alignment = true,
		name = "dlc_preview",
		class_name = "StoreWindowItemPreview",
		always_reload = true
	},
	category_list = {
		ignore_alignment = true,
		name = "category_list",
		class_name = "StoreWindowCategoryList",
		always_reload = true
	},
	category_item_list = {
		ignore_alignment = true,
		name = "category_item_list",
		class_name = "StoreWindowCategoryItemList",
		always_reload = false
	},
	path_title = {
		ignore_alignment = true,
		name = "path_title",
		class_name = "StoreWindowPathTitle"
	},
	featured = {
		ignore_alignment = true,
		name = "featured",
		class_name = "StoreWindowFeatured"
	},
	item_details = {
		ignore_alignment = true,
		name = "item_details",
		class_name = "StoreWindowItemDetails"
	}
}

DLCUtils.merge("store_windows", windows)

local window_layouts = {
	{
		name = "featured",
		display_name = "featured",
		draw_character = true,
		close_on_exit = true,
		menu_option = true,
		windows = {
			featured = 3,
			panel = 1,
			background = 2
		},
		object_sets = {},
		level_events = {
			"main_menu"
		}
	},
	{
		name = "category",
		display_name = "category",
		draw_character = true,
		close_on_exit = true,
		menu_option = true,
		windows = {
			panel = 1,
			path_title = 3,
			background = 2,
			category_item_list = 5,
			category_list = 4
		},
		object_sets = {},
		level_events = {
			"main_menu"
		}
	},
	{
		name = "item_list",
		display_name = "item_list",
		draw_character = true,
		close_on_exit = true,
		menu_option = false,
		windows = {
			path_title = 3,
			background = 2,
			item_list = 4,
			item_preview = 5,
			panel = 1
		},
		object_sets = {},
		level_events = {
			"main_menu"
		}
	},
	{
		name = "bundle_list",
		display_name = "bundle_list",
		draw_character = true,
		close_on_exit = true,
		menu_option = false,
		windows = {
			path_title = 3,
			background = 2,
			item_list = 4,
			item_preview = 5,
			panel = 1
		},
		object_sets = {},
		level_events = {
			"main_menu"
		}
	},
	{
		name = "dlc_list",
		display_name = "dlc_list",
		draw_character = true,
		close_on_exit = true,
		menu_option = false,
		windows = {
			path_title = 3,
			background = 2,
			item_list = 4,
			panel = 1,
			dlc_preview = 5
		},
		object_sets = {},
		level_events = {
			"main_menu"
		}
	},
	{
		name = "item_detailed",
		display_name = "item_detailed",
		draw_character = true,
		close_on_exit = true,
		menu_option = false,
		windows = {
			background = 2,
			path_title = 3,
			item_details = 4,
			item_preview = 5,
			panel = 1
		},
		object_sets = {},
		level_events = {
			"main_menu"
		}
	}
}

DLCUtils.append("store_window_layouts", window_layouts)

local MAX_ACTIVE_WINDOWS = 5

return {
	max_active_windows = MAX_ACTIVE_WINDOWS,
	windows = windows,
	window_layouts = window_layouts
}
