-- chunkname: @scripts/utils/benchmark/benchmark_settings.lua

require("scripts/settings/level_settings")

BenchmarkSettings = {
	attract_benchmark = false,
	auto_host_level = "military",
	bot_damage_multiplier = 5,
	bot_selection_timer = 3,
	cycle_time = 90,
	cycle_view_time = 30,
	cycle_views = true,
	debug = false,
	destroy_close_enemies_radius = 20,
	destroy_close_enemies_timer = 90,
	game_seed = 846387,
	initial_cycle_time = 30,
	is_story_based = true,
	main_path_teleport_time = 2,
	overview_downtime = 60,
	overview_duration = 10,
	initial_overview_time = math.huge,
	parameters = {
		debug_interactions = false,
		disable_debug_draw = true,
		disable_gutter_runner = true,
		disable_intro_trailer = true,
		disable_pack_master = true,
		disable_tutorial_at_start = true,
		force_steam = true,
		hide_fps = true,
		hide_version_info = true,
		honduras_demo = false,
		infinite_ammo = true,
		network_debug = false,
		network_debug_connections = false,
		network_log_messages = false,
		player_invincible = true,
		screen_space_player_camera_reactions = false,
		spawn_empty_chest = true,
		wanted_profile = "empire_soldier_tutorial",
	},
	attract_mode_settings = {
		display_name = "intel_loading_screen_attract_mode",
		loading_screen_wwise_events = {},
	},
	benchmark_mode_settings = {
		display_name = "intel_loading_screen_benchmark_mode",
		loading_screen_wwise_events = {},
	},
}

local function setup_parameters(parameters)
	for parameter, value in pairs(parameters) do
		Development.set_parameter(parameter, value)

		script_data[parameter] = value
	end
end

local function override_display_name(mode_settings)
	local level_key = BenchmarkSettings.auto_host_level
	local level_settings = LevelSettings[level_key]

	level_settings.display_name = mode_settings.display_name
	level_settings.loading_screen_wwise_events = mode_settings.loading_screen_wwise_events
	script_data.no_loading_screen_tip_texts = true
end

local function override_development_parameter_func(parameters)
	local function development_parameter(param)
		return parameters[param]
	end

	Development.parameter = development_parameter
end

local DEMO_MODE = false
local args = {
	Application.argv(),
}

for _, arg in pairs(args) do
	if arg == "-attract-mode" then
		LAUNCH_MODE = "attract"

		Development.set_parameter("attract_mode", true)
		setup_parameters(BenchmarkSettings.parameters)
		override_display_name(BenchmarkSettings.attract_mode_settings)

		break
	end

	if arg == "-benchmark-mode" then
		LAUNCH_MODE = "attract_benchmark"
		BenchmarkSettings.attract_benchmark = true
		BenchmarkSettings.parameters.hide_fps = false
		BenchmarkSettings.parameters.show_fps = true
		BenchmarkSettings.parameters.attract_mode = true

		override_display_name(BenchmarkSettings.benchmark_mode_settings)
		override_development_parameter_func(BenchmarkSettings.parameters)

		break
	end

	if arg == "-demo-mode" then
		DEMO_MODE = true
	end
end

BenchmarkSettings.demo_mode_overrides = function ()
	if DEMO_MODE then
		print("Entering demo mode")

		for setting_name, setting in pairs(PackSpawningSettings) do
			setting.area_density_coefficient = setting.area_density_coefficient * 0.75
		end

		for setting_name, setting in pairs(BreedPacks) do
			if setting.patrol_overrides then
				setting.patrol_overrides.patrol_chance = 0
			end
		end

		SpecialsSettings.chaos.breeds = {
			"skaven_pack_master",
			"skaven_gutter_runner",
			"skaven_warpfire_thrower",
		}
	end
end
