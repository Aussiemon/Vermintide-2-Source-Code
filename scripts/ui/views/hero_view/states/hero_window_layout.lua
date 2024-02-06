-- chunkname: @scripts/ui/views/hero_view/states/hero_window_layout.lua

local windows = {
	options = {
		class_name = "HeroWindowOptions",
		name = "options",
	},
	character_preview = {
		class_name = "HeroWindowCharacterPreview",
		name = "character_preview",
	},
	inventory = {
		class_name = "HeroWindowInventory",
		name = "inventory",
	},
	loadout_inventory = {
		class_name = "HeroWindowLoadoutInventory",
		name = "loadout_inventory",
	},
	loadout = {
		alignment_index = 2,
		class_name = "HeroWindowLoadout",
		name = "loadout",
	},
	talents = {
		class_name = "HeroWindowTalents",
		name = "talents",
	},
	crafting = {
		class_name = "HeroWindowCrafting",
		name = "crafting",
	},
	prestige = {
		class_name = "HeroWindowPrestige",
		name = "prestige",
	},
	cosmetics_loadout = {
		alignment_index = 2,
		class_name = "HeroWindowCosmeticsLoadout",
		name = "cosmetics_loadout",
	},
	cosmetics_inventory = {
		class_name = "HeroWindowCosmeticsInventory",
		name = "cosmetics_inventory",
	},
}
local window_layouts = {
	{
		close_on_exit = true,
		name = "equipment",
		sound_event_enter = "play_gui_equipment_button",
		sound_event_exit = "play_gui_equipment_close",
		windows = {
			character_preview = 2,
			loadout = 4,
			loadout_inventory = 3,
			options = 1,
		},
	},
	{
		close_on_exit = true,
		name = "talents",
		sound_event_enter = "play_gui_talents_button",
		sound_event_exit = "play_gui_talents_close",
		windows = {
			options = 1,
			talents = 2,
		},
	},
	{
		close_on_exit = true,
		name = "forge",
		sound_event_enter = "play_gui_craft_button",
		sound_event_exit = "play_gui_craft_close",
		windows = {
			crafting = 2,
			inventory = 3,
			options = 1,
		},
	},
	{
		close_on_exit = true,
		name = "cosmetics",
		sound_event_enter = "play_gui_cosmetics_button",
		sound_event_exit = "play_gui_cosmetics_close",
		windows = {
			character_preview = 2,
			cosmetics_inventory = 3,
			cosmetics_loadout = 4,
			options = 1,
		},
	},
	{
		close_on_exit = true,
		name = "prestige",
		windows = {
			options = 1,
			prestige = 2,
		},
	},
}
local MAX_ACTIVE_WINDOWS = 5

return {
	max_active_windows = MAX_ACTIVE_WINDOWS,
	windows = windows,
	window_layouts = window_layouts,
}
