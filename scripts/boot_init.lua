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
LAUNCH_MODE = "game"
HAS_STEAM = (rawget(_G, "Steam") and true) or false
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

if not PROFILER_SCOPES_INITED then
	local ProfilerScopes = {}
	PROFILER_SCOPES_INITED = true
	local profiler_start = Profiler.start

	Profiler.start = function (scope_name)
		ProfilerScopes[scope_name] = true

		profiler_start(scope_name)
	end
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
		"resource_packages/levels/ui_end_screen"
	}
elseif PLATFORM == "ps4" then
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
		"resource_packages/ingame",
		"resource_packages/pickups",
		"resource_packages/projection_decals",
		"resource_packages/ingame_sounds_honduras"
	}
elseif PLATFORM == "xb1" then
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
		"resource_packages/ingame",
		"resource_packages/pickups",
		"resource_packages/projection_decals",
		"resource_packages/ingame_sounds_honduras"
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
		"resource_packages/ingame",
		"resource_packages/pickups",
		"resource_packages/projection_decals"
	}
end

if BUILD ~= "dev" and PLATFORM == "win32" then
	if LAUNCH_MODE ~= "attract_benchmark" then
		local input = io.input
		local read = io.read
		slot5 = io.write
	end

	os.execute = nil
	os.remove = nil
	os.rename = nil
	package.path = nil
	package.cpath = nil
end

return
