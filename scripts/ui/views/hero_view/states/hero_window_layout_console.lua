-- chunkname: @scripts/ui/views/hero_view/states/hero_window_layout_console.lua

local windows = {
	panel = {
		class_name = "HeroWindowPanelConsole",
		ignore_alignment = true,
		name = "panel",
	},
	background = {
		class_name = "HeroWindowBackgroundConsole",
		ignore_alignment = true,
		name = "background",
	},
	crafting_inventory = {
		class_name = "HeroWindowCraftingInventoryConsole",
		ignore_alignment = true,
		name = "crafting_inventory",
	},
	loadout_inventory = {
		class_name = "HeroWindowLoadoutInventoryConsole",
		ignore_alignment = true,
		name = "loadout_inventory",
	},
	loadout = {
		class_name = "HeroWindowLoadoutConsole",
		ignore_alignment = true,
		name = "loadout",
	},
	talents = {
		class_name = "HeroWindowTalentsConsole",
		ignore_alignment = true,
		name = "talents",
	},
	crafting = {
		class_name = "HeroWindowCraftingConsole",
		ignore_alignment = true,
		name = "crafting",
	},
	prestige = {
		class_name = "HeroWindowPrestige",
		ignore_alignment = true,
		name = "prestige",
	},
	cosmetics_loadout = {
		class_name = "HeroWindowCosmeticsLoadoutConsole",
		ignore_alignment = true,
		name = "cosmetics_loadout",
	},
	cosmetics_inventory = {
		class_name = "HeroWindowCosmeticsLoadoutInventoryConsole",
		ignore_alignment = true,
		name = "cosmetics_inventory",
	},
	character_info = {
		class_name = "HeroWindowCharacterInfo",
		ignore_alignment = true,
		name = "character_info",
	},
	crafting_list = {
		class_name = "HeroWindowCraftingListConsole",
		ignore_alignment = true,
		name = "crafting_list",
	},
	hero_power = {
		class_name = "HeroWindowHeroPowerConsole",
		ignore_alignment = true,
		name = "hero_power",
	},
	ingame_view = {
		class_name = "HeroWindowIngameView",
		ignore_alignment = true,
		name = "ingame_view",
	},
	character_selection = {
		class_name = "HeroWindowCharacterSelectionConsole",
		ignore_alignment = true,
		name = "character_selection",
	},
	item_customization = {
		class_name = "HeroWindowItemCustomization",
		ignore_alignment = true,
		name = "item_customization",
	},
}
local window_layouts = {
	{
		close_on_exit = true,
		name = "equipment",
		sound_event_enter = "play_gui_equipment_button",
		sound_event_exit = "play_gui_equipment_close",
		windows = {
			background = 2,
			character_info = 3,
			hero_power = 5,
			loadout = 4,
			panel = 1,
		},
	},
	{
		close_on_exit = true,
		name = "talents",
		sound_event_enter = "play_gui_talents_button",
		sound_event_exit = "play_gui_talents_close",
		windows = {
			background = 2,
			character_info = 3,
			panel = 1,
			talents = 4,
		},
	},
	{
		close_on_exit = true,
		name = "forge",
		sound_event_enter = "play_gui_craft_button",
		sound_event_exit = "play_gui_craft_close",
		windows = {
			background = 2,
			character_info = 4,
			crafting_list = 3,
			panel = 1,
		},
	},
	{
		close_on_exit = true,
		name = "cosmetics",
		sound_event_enter = "play_gui_cosmetics_button",
		sound_event_exit = "play_gui_cosmetics_close",
		windows = {
			background = 2,
			character_info = 4,
			cosmetics_loadout = 3,
			hero_power = 5,
			panel = 1,
		},
	},
	{
		close_on_exit = false,
		input_focus_window = "crafting",
		name = "crafting_recipe",
		sound_event_enter = "play_gui_craft_button",
		sound_event_exit = "play_gui_craft_close",
		windows = {
			background = 2,
			character_info = 5,
			crafting = 3,
			crafting_inventory = 4,
			panel = 1,
		},
	},
	{
		close_on_exit = false,
		input_focus_window = "loadout_inventory",
		name = "equipment_selection",
		sound_event_enter = "play_gui_equipment_button",
		sound_event_exit = "play_gui_equipment_close",
		windows = {
			background = 2,
			character_info = 3,
			hero_power = 5,
			loadout_inventory = 4,
			panel = 1,
		},
	},
	{
		close_on_exit = false,
		input_focus_window = "cosmetics_inventory",
		name = "cosmetics_selection",
		sound_event_enter = "play_gui_equipment_button",
		sound_event_exit = "play_gui_equipment_close",
		windows = {
			background = 2,
			character_info = 3,
			cosmetics_inventory = 4,
			hero_power = 5,
			panel = 1,
		},
	},
	{
		close_on_exit = true,
		name = "system",
		sound_event_enter = "Play_hud_button_open",
		sound_event_exit = "Play_hud_button_close",
		windows = {
			background = 2,
			character_info = 3,
			ingame_view = 4,
			panel = 1,
		},
	},
	{
		close_on_exit = true,
		name = "store",
		sound_event_enter = "Play_hud_button_open",
		sound_event_exit = "Play_hud_button_close",
		windows = {
			background = 1,
		},
	},
	{
		close_on_exit = false,
		name = "character_selection",
		sound_event_enter = "Play_hud_button_open",
		sound_event_exit = "Play_hud_button_close",
		windows = {
			background = 2,
			character_selection = 3,
			panel = 1,
		},
	},
	{
		close_on_exit = false,
		name = "item_customization",
		sound_event_enter = "Play_hud_button_open",
		sound_event_exit = "Play_hud_button_close",
		windows = {
			background = 2,
			character_info = 3,
			item_customization = 4,
			panel = 1,
		},
	},
}
local MAX_ACTIVE_WINDOWS = 5

return {
	max_active_windows = MAX_ACTIVE_WINDOWS,
	windows = windows,
	window_layouts = window_layouts,
}
