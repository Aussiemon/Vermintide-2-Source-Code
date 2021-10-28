jit.off()

MODE = {}

if not LEVEL_EDITOR_TEST then
	LEVEL_EDITOR_TEST = false
end

local function import(lib)
	for k, v in pairs(lib) do
		_G[k] = v
	end
end

if s3d then
	import(s3d)
end

GLOBAL_MUSIC_WORLD = true
local dummy_wwise_world = {
	stop_all = function ()
		return
	end
}

if GLOBAL_MUSIC_WORLD then
	MUSIC_WORLD = Application.new_world("music_world", Application.DISABLE_PHYSICS, Application.DISABLE_RENDERING)
	MUSIC_WWISE_WORLD = Wwise.wwise_world(MUSIC_WORLD) or (Application.platform() == "ps4" and dummy_wwise_world) or "dedicated_server_no_wwise_dummy"
end

BUILD = Application.build()
PLATFORM = Application.platform()
IS_CONSOLE = PLATFORM == "ps4" or PLATFORM == "xb1"
IS_WINDOWS = PLATFORM == "win32"
IS_LINUX = PLATFORM == "linux"
IS_XB1 = PLATFORM == "xb1"
IS_PS4 = PLATFORM == "ps4"
IS_NOT_CONSOLE = not IS_CONSOLE
IS_NOT_WINDOWS = not IS_WINDOWS
IS_NOT_LINUX = not IS_LINUX
IS_NOT_XB1 = not IS_XB1
IS_NOT_PS4 = not IS_PS4
LAUNCH_MODE = "game"
HAS_STEAM = HAS_STEAM ~= false and not not rawget(_G, "Steam")
DEDICATED_SERVER = Application.is_dedicated_server()
local args = {
	Application.argv()
}

for _, arg in pairs(args) do
	if arg == "-attract-mode" then
		LAUNCH_MODE = "attract"

		break
	end

	if arg == "-benchmark-mode" then
		LAUNCH_MODE = "attract_benchmark"

		break
	end
end

Application.build = function ()
	error("Trying to use Application.build, use global variable BUILD instead.")
end

Application.platform = function ()
	error("Trying to use Application.platform(), use global variable PLATFORM instead.")
end

GLOBAL_FRAME_INDEX = GLOBAL_FRAME_INDEX or 0
script_data = script_data or {
	settings = Application.settings(),
	build_identifier = Application.build_identifier()
}

if LEVEL_EDITOR_TEST then
	GlobalResources = GlobalResources or {
		"resource_packages/menu_assets_common",
		"resource_packages/ingame_light",
		"resource_packages/projection_decals",
		"resource_packages/inventory",
		"resource_packages/careers",
		"resource_packages/pickups",
		"resource_packages/decals",
		"resource_packages/levels/ui_loot_preview",
		"resource_packages/levels/ui_end_screen",
		"resource_packages/levels/ui_end_screen_victory",
		"resource_packages/breeds",
		"resource_packages/breeds_common_resources"
	}
elseif IS_PS4 then
	GlobalResources = GlobalResources or {
		"resource_packages/menu_assets_common",
		"resource_packages/ingame_sounds_one",
		"resource_packages/ingame_sounds_two",
		"resource_packages/ingame_sounds_three",
		"resource_packages/ingame_sounds_weapon_general",
		"resource_packages/ingame_sounds_enemy_clan_rat_vce",
		"resource_packages/ingame_sounds_player_foley_common",
		"resource_packages/ingame_sounds_hud_dice_game",
		"resource_packages/ingame_sounds_general_props",
		"resource_packages/inventory",
		"resource_packages/careers",
		"resource_packages/decals",
		"resource_packages/levels/ui_loot_preview",
		"resource_packages/levels/ui_end_screen",
		"resource_packages/levels/ui_end_screen_victory",
		"resource_packages/ingame",
		"resource_packages/pickups",
		"resource_packages/projection_decals",
		"resource_packages/ingame_sounds_honduras",
		"resource_packages/breeds",
		"resource_packages/breeds_common_resources"
	}
elseif IS_XB1 then
	GlobalResources = GlobalResources or {
		"resource_packages/menu_assets_common",
		"resource_packages/ingame_sounds_one",
		"resource_packages/ingame_sounds_two",
		"resource_packages/ingame_sounds_three",
		"resource_packages/ingame_sounds_weapon_general",
		"resource_packages/ingame_sounds_enemy_clan_rat_vce",
		"resource_packages/ingame_sounds_player_foley_common",
		"resource_packages/ingame_sounds_hud_dice_game",
		"resource_packages/ingame_sounds_general_props",
		"resource_packages/inventory",
		"resource_packages/careers",
		"resource_packages/decals",
		"resource_packages/levels/ui_loot_preview",
		"resource_packages/levels/ui_end_screen",
		"resource_packages/levels/ui_end_screen_victory",
		"resource_packages/ingame",
		"resource_packages/pickups",
		"resource_packages/projection_decals",
		"resource_packages/ingame_sounds_honduras",
		"resource_packages/breeds",
		"resource_packages/breeds_common_resources"
	}
else
	GlobalResources = GlobalResources or {
		"resource_packages/menu_assets_common",
		"resource_packages/ingame_sounds_one",
		"resource_packages/ingame_sounds_two",
		"resource_packages/ingame_sounds_three",
		"resource_packages/ingame_sounds_weapon_general",
		"resource_packages/ingame_sounds_enemy_clan_rat_vce",
		"resource_packages/ingame_sounds_player_foley_common",
		"resource_packages/ingame_sounds_hud_dice_game",
		"resource_packages/ingame_sounds_general_props",
		"resource_packages/ingame_sounds_honduras",
		"resource_packages/inventory",
		"resource_packages/careers",
		"resource_packages/decals",
		"resource_packages/levels/ui_loot_preview",
		"resource_packages/levels/ui_end_screen",
		"resource_packages/levels/ui_end_screen_victory",
		"resource_packages/ingame",
		"resource_packages/pickups",
		"resource_packages/projection_decals",
		"resource_packages/slug_core_materials",
		"resource_packages/breeds",
		"resource_packages/breeds_common_resources"
	}
end

if IS_WINDOWS and BUILD ~= "dev" and BUILD ~= "debug" and LAUNCH_MODE ~= "attract_benchmark" then
	local function scrub_library(lib)
		rawset(_G, lib, nil)

		package.loaded[lib] = nil
		package.preload[lib] = nil
	end

	scrub_library("ffi")
	scrub_library("io")

	os = {
		clock = os.clock,
		date = os.date,
		difftime = os.difftime,
		time = os.time,
		getenv = os.getenv
	}
	package.loadlib = nil
	package.loaders[3] = nil
	package.loaders[4] = nil
end

return
