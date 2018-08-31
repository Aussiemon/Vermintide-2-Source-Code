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
	crafting_inventory = {
		ignore_alignment = true,
		name = "crafting_inventory",
		class_name = "HeroWindowCraftingInventoryConsole"
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
		class_name = "HeroWindowCraftingConsole"
	},
	prestige = {
		ignore_alignment = true,
		name = "prestige",
		class_name = "HeroWindowPrestige"
	},
	cosmetics_loadout = {
		ignore_alignment = true,
		name = "cosmetics_loadout",
		class_name = "HeroWindowCosmeticsLoadoutConsole"
	},
	cosmetics_inventory = {
		ignore_alignment = true,
		name = "cosmetics_inventory",
		class_name = "HeroWindowCosmeticsLoadoutInventoryConsole"
	},
	character_info = {
		ignore_alignment = true,
		name = "character_info",
		class_name = "HeroWindowCharacterInfo"
	},
	crafting_list = {
		ignore_alignment = true,
		name = "crafting_list",
		class_name = "HeroWindowCraftingListConsole"
	},
	hero_power = {
		ignore_alignment = true,
		name = "hero_power",
		class_name = "HeroWindowHeroPowerConsole"
	},
	ingame_view = {
		ignore_alignment = true,
		name = "ingame_view",
		class_name = "HeroWindowIngameView"
	}
}
local window_layouts = {
	{
		sound_event_enter = "play_gui_equipment_button",
		name = "equipment",
		sound_event_exit = "play_gui_equipment_close",
		close_on_exit = true,
		windows = {
			hero_power = 5,
			background = 2,
			character_info = 3,
			panel = 1,
			loadout = 4
		}
	},
	{
		sound_event_enter = "play_gui_talents_button",
		name = "talents",
		sound_event_exit = "play_gui_talents_close",
		close_on_exit = true,
		windows = {
			character_info = 3,
			panel = 1,
			background = 2,
			talents = 4
		}
	},
	{
		sound_event_enter = "play_gui_craft_button",
		name = "forge",
		sound_event_exit = "play_gui_craft_close",
		close_on_exit = true,
		windows = {
			character_info = 4,
			panel = 1,
			background = 2,
			crafting_list = 3
		}
	},
	{
		sound_event_enter = "play_gui_cosmetics_button",
		name = "cosmetics",
		sound_event_exit = "play_gui_cosmetics_close",
		close_on_exit = true,
		windows = {
			hero_power = 5,
			cosmetics_loadout = 3,
			background = 2,
			character_info = 4,
			panel = 1
		}
	},
	{
		sound_event_enter = "play_gui_craft_button",
		name = "crafting_recipe",
		sound_event_exit = "play_gui_craft_close",
		input_focus_window = "crafting",
		close_on_exit = false,
		windows = {
			crafting_inventory = 4,
			background = 2,
			character_info = 5,
			panel = 1,
			crafting = 3
		}
	},
	{
		sound_event_enter = "play_gui_equipment_button",
		name = "equipment_selection",
		sound_event_exit = "play_gui_equipment_close",
		input_focus_window = "loadout_inventory",
		close_on_exit = false,
		windows = {
			hero_power = 5,
			background = 2,
			character_info = 3,
			panel = 1,
			loadout_inventory = 4
		}
	},
	{
		sound_event_enter = "play_gui_equipment_button",
		name = "cosmetics_selection",
		sound_event_exit = "play_gui_equipment_close",
		input_focus_window = "cosmetics_inventory",
		close_on_exit = false,
		windows = {
			hero_power = 5,
			cosmetics_inventory = 4,
			background = 2,
			character_info = 3,
			panel = 1
		}
	},
	{
		sound_event_enter = "Play_hud_button_open",
		name = "system",
		sound_event_exit = "Play_hud_button_close",
		close_on_exit = true,
		windows = {
			character_info = 3,
			panel = 1,
			background = 2,
			ingame_view = 4
		}
	}
}
local MAX_ACTIVE_WINDOWS = 5

return {
	max_active_windows = MAX_ACTIVE_WINDOWS,
	windows = windows,
	window_layouts = window_layouts
}
