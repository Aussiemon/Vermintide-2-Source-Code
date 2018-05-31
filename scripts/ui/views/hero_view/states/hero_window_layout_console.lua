local windows = {
	panel = {
		ignore_alignment = true,
		name = "panel",
		class_name = "HeroWindowPanelConsole"
	},
	background = {
		ignore_alignment = true,
		name = "background",
		class_name = "HeroWindowBackgroundConsole"
	},
	inventory = {
		ignore_alignment = true,
		name = "inventory",
		class_name = "HeroWindowInventory"
	},
	loadout_inventory = {
		ignore_alignment = true,
		name = "loadout_inventory",
		class_name = "HeroWindowLoadoutInventoryConsole"
	},
	loadout = {
		ignore_alignment = true,
		name = "loadout",
		class_name = "HeroWindowLoadoutConsole"
	},
	talents = {
		ignore_alignment = true,
		name = "talents",
		class_name = "HeroWindowTalentsConsole"
	},
	crafting = {
		ignore_alignment = true,
		name = "crafting",
		class_name = "HeroWindowCrafting"
	},
	prestige = {
		ignore_alignment = true,
		name = "prestige",
		class_name = "HeroWindowPrestige"
	},
	cosmetics_loadout = {
		ignore_alignment = true,
		name = "cosmetics_loadout",
		class_name = "HeroWindowCosmeticsLoadout"
	},
	cosmetics_inventory = {
		ignore_alignment = true,
		name = "cosmetics_inventory",
		class_name = "HeroWindowCosmeticsInventory"
	}
}
local window_layouts = {
	{
		sound_event_enter = "play_gui_equipment_button",
		name = "equipment",
		sound_event_exit = "play_gui_equipment_close",
		input_focus_window = "loadout",
		close_on_exit = true,
		windows = {
			loadout = 4,
			panel = 1,
			background = 2,
			loadout_inventory = 3
		}
	},
	{
		sound_event_enter = "play_gui_talents_button",
		name = "talents",
		sound_event_exit = "play_gui_talents_close",
		close_on_exit = true,
		windows = {
			talents = 3,
			panel = 1,
			background = 2
		}
	},
	{
		sound_event_enter = "play_gui_craft_button",
		name = "forge",
		sound_event_exit = "play_gui_craft_close",
		close_on_exit = true,
		windows = {
			inventory = 4,
			panel = 1,
			background = 2,
			crafting = 3
		}
	},
	{
		sound_event_enter = "play_gui_cosmetics_button",
		name = "cosmetics",
		sound_event_exit = "play_gui_cosmetics_close",
		close_on_exit = true,
		windows = {
			cosmetics_inventory = 3,
			panel = 1,
			background = 2,
			cosmetics_loadout = 4
		}
	}
}
local MAX_ACTIVE_WINDOWS = 5

return {
	max_active_windows = MAX_ACTIVE_WINDOWS,
	windows = windows,
	window_layouts = window_layouts
}
