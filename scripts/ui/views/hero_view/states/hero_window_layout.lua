local windows = {
	options = {
		class_name = "HeroWindowOptions",
		name = "options"
	},
	character_preview = {
		class_name = "HeroWindowCharacterPreview",
		name = "character_preview"
	},
	inventory = {
		class_name = "HeroWindowInventory",
		name = "inventory"
	},
	loadout_inventory = {
		class_name = "HeroWindowLoadoutInventory",
		name = "loadout_inventory"
	},
	loadout = {
		alignment_index = 2,
		name = "loadout",
		class_name = "HeroWindowLoadout"
	},
	talents = {
		class_name = "HeroWindowTalents",
		name = "talents"
	},
	crafting = {
		class_name = "HeroWindowCrafting",
		name = "crafting"
	},
	prestige = {
		class_name = "HeroWindowPrestige",
		name = "prestige"
	},
	cosmetics_loadout = {
		alignment_index = 2,
		name = "cosmetics_loadout",
		class_name = "HeroWindowCosmeticsLoadout"
	},
	cosmetics_inventory = {
		class_name = "HeroWindowCosmeticsInventory",
		name = "cosmetics_inventory"
	}
}
local window_layouts = {
	{
		sound_event_enter = "play_gui_equipment_button",
		name = "equipment",
		sound_event_exit = "play_gui_equipment_close",
		close_on_exit = true,
		windows = {
			options = 1,
			loadout = 4,
			character_preview = 2,
			loadout_inventory = 3
		}
	},
	{
		sound_event_enter = "play_gui_talents_button",
		name = "talents",
		sound_event_exit = "play_gui_talents_close",
		close_on_exit = true,
		windows = {
			options = 1,
			talents = 2
		}
	},
	{
		sound_event_enter = "play_gui_craft_button",
		name = "forge",
		sound_event_exit = "play_gui_craft_close",
		close_on_exit = true,
		windows = {
			options = 1,
			inventory = 3,
			crafting = 2
		}
	},
	{
		sound_event_enter = "play_gui_cosmetics_button",
		name = "cosmetics",
		sound_event_exit = "play_gui_cosmetics_close",
		close_on_exit = true,
		windows = {
			options = 1,
			cosmetics_inventory = 3,
			character_preview = 2,
			cosmetics_loadout = 4
		}
	},
	{
		close_on_exit = true,
		name = "prestige",
		windows = {
			options = 1,
			prestige = 2
		}
	}
}
local MAX_ACTIVE_WINDOWS = 5

return {
	max_active_windows = MAX_ACTIVE_WINDOWS,
	windows = windows,
	window_layouts = window_layouts
}
