-- chunkname: @scripts/imgui/imgui_configuration_settings.lua

ImguiConfigurationSettings = {
	{
		category = "Debug",
		class = "ImguiCatTesterTools",
		file = "scripts/imgui/imgui_cat_tester_tools",
		name = "CAT Tester Tools",
	},
	{
		category = "Debug",
		class = "ImguiLevelDebug",
		file = "scripts/imgui/imgui_level_debug",
		name = "Level Debug",
	},
	{
		category = "Gameplay",
		class = "ImguiWeaponDebug",
		file = "scripts/imgui/imgui_weapon_debug",
		name = "Weapon Debug",
	},
	{
		category = "Gameplay",
		class = "ImguiCombatLog",
		file = "scripts/imgui/imgui_combat_log",
		name = "Combat Log",
	},
	{
		category = "Gameplay",
		class = "ImguiCraftItem",
		file = "scripts/imgui/imgui_craft_item",
		name = "Craft Item",
	},
}

DLCUtils.append("imgui_configuration_settings", ImguiConfigurationSettings)
