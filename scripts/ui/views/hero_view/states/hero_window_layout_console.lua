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
	pose_inventory = {
		class_name = "HeroWindowCosmeticsLoadoutPoseInventoryConsole",
		ignore_alignment = true,
		name = "pose_inventory",
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
	loadout_selection = {
		class_name = "HeroWindowLoadoutSelectionConsole",
		ignore_alignment = true,
		name = "loadout_selection",
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
	dark_pact_character_selection = {
		class_name = "HeroWindowDarkPactCharacterSelectionConsole",
		ignore_alignment = true,
		name = "dark_pact_character_selection",
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
			loadout_selection = 6,
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
			loadout_selection = 5,
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
		can_add_function = function (mechanism_name)
			return mechanism_name ~= "versus" and mechanism_name ~= "inn_vs"
		end,
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
			loadout_selection = 6,
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
		close_on_exit = false,
		input_focus_window = "cosmetics_inventory",
		name = "cosmetics_selection_dark_pact",
		sound_event_enter = "play_gui_equipment_button",
		sound_event_exit = "play_gui_equipment_close",
		windows = {
			background = 2,
			character_info = 3,
			cosmetics_inventory = 4,
			panel = 1,
		},
	},
	{
		close_on_exit = false,
		input_focus_window = "pose_inventory",
		name = "pose_selection",
		sound_event_enter = "play_gui_equipment_button",
		sound_event_exit = "play_gui_equipment_close",
		windows = {
			background = 2,
			character_info = 3,
			hero_power = 5,
			panel = 1,
			pose_inventory = 4,
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
	{
		close_on_exit = true,
		name = "pactsworn_equipment",
		sound_event_enter = "Play_hud_button_open",
		sound_event_exit = "Play_hud_button_close",
		windows = {
			background = 2,
			dark_pact_character_selection = 3,
			panel = 1,
		},
		can_add_function = function (mechanism_name)
			return mechanism_name == "versus"
		end,
		on_exit = function (parent)
			local local_player = Managers.player:local_player()
			local profile_index = local_player:profile_index()
			local career_index = local_player:career_index()

			parent:change_profile(profile_index, career_index)

			local profile = SPProfiles[profile_index]

			Managers.state.event:trigger("respawn_hero", {
				hero_name = profile.display_name,
				career_index = career_index,
			})

			local mood_settings = DLCSettings.carousel and DLCSettings.carousel.hero_window_mood_settings
			local mood_setting = mood_settings.default or "default"

			parent:set_background_mood(mood_setting)
		end,
	},
}
local MAX_ACTIVE_WINDOWS = 6

DLCUtils.map("hero_view_window_layout_console", function (hero_view_window_layout_console)
	local new_windows = hero_view_window_layout_console.windows

	if new_windows then
		for name, window in pairs(new_windows) do
			windows[name] = window
		end
	end

	local new_window_layouts = hero_view_window_layout_console.window_layouts

	if new_window_layouts then
		for i = 1, #new_window_layouts do
			window_layouts[#window_layouts + 1] = new_window_layouts[i]
		end
	end
end)
DLCUtils.map("hero_view_window_layout_console", function (hero_view_window_layout_console)
	local new_windows = hero_view_window_layout_console.windows

	if new_windows then
		for name, window in pairs(new_windows) do
			windows[name] = window
		end
	end

	local new_window_layouts = hero_view_window_layout_console.window_layouts

	if new_window_layouts then
		for i = 1, #new_window_layouts do
			window_layouts[#window_layouts + 1] = new_window_layouts[i]
		end
	end
end)

return {
	max_active_windows = MAX_ACTIVE_WINDOWS,
	windows = windows,
	window_layouts = window_layouts,
}
