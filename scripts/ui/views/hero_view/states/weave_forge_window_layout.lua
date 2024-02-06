-- chunkname: @scripts/ui/views/hero_view/states/weave_forge_window_layout.lua

local windows = {
	overview = {
		alignment_index = 2,
		class_name = "HeroWindowWeaveForgeOverview",
		name = "overview",
	},
	weapon_select = {
		alignment_index = 2,
		class_name = "HeroWindowWeaveForgeWeapons",
		name = "weapon_select",
	},
	properties = {
		alignment_index = 2,
		class_name = "HeroWindowWeaveProperties",
		name = "properties",
	},
	background = {
		alignment_index = 2,
		class_name = "HeroWindowWeaveForgeBackground",
		name = "background",
	},
	panel = {
		alignment_index = 2,
		class_name = "HeroWindowWeaveForgePanel",
		name = "panel",
	},
}
local window_layouts = {
	{
		close_on_exit = true,
		name = "weave_overview",
		sound_event_enter = "menu_magic_forge_overview_menu",
		sound_event_exit = "play_gui_equipment_close",
		windows = {
			background = 1,
			overview = 2,
			panel = 3,
		},
	},
	{
		close_on_exit = false,
		name = "weave_weapon_select",
		sound_event_enter = "menu_magic_forge_enter_weapon_switch_menu",
		sound_event_exit = "play_gui_equipment_close",
		windows = {
			background = 1,
			panel = 3,
			weapon_select = 2,
		},
	},
	{
		close_on_exit = false,
		name = "weave_properties",
		sound_event_exit = "play_gui_equipment_close",
		windows = {
			background = 1,
			panel = 3,
			properties = 2,
		},
	},
}
local MAX_ACTIVE_WINDOWS = 5

return {
	max_active_windows = MAX_ACTIVE_WINDOWS,
	windows = windows,
	window_layouts = window_layouts,
}
