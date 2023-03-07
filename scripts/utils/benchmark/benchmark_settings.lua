require("scripts/settings/level_settings")

BenchmarkSettings = {
	cycle_view_time = 30,
	main_path_teleport_time = 2,
	initial_cycle_time = 30,
	debug = false,
	bot_selection_timer = 3,
	cycle_views = true,
	overview_downtime = 60,
	attract_benchmark = false,
	overview_duration = 10,
	cycle_time = 90,
	is_story_based = true,
	destroy_close_enemies_radius = 20,
	auto_host_level = "military",
	bot_damage_multiplier = 5,
	game_seed = 846387,
	destroy_close_enemies_timer = 90,
	initial_overview_time = math.huge,
	parameters = {
		hide_fps = true,
		network_debug = false,
		disable_tutorial_at_start = true,
		disable_gutter_runner = true,
		hide_version_info = true,
		network_debug_connections = false,
		honduras_demo = false,
		spawn_empty_chest = true,
		disable_debug_draw = true,
		disable_pack_master = true,
		network_log_messages = false,
		disable_intro_trailer = true,
		force_steam = true,
		debug_interactions = false,
		screen_space_player_camera_reactions = false,
		infinite_ammo = true,
		player_invincible = true,
		wanted_profile = "empire_soldier_tutorial"
	},
	attract_mode_settings = {
		display_name = "intel_loading_screen_attract_mode",
		loading_screen_wwise_events = {}
	},
	benchmark_mode_settings = {
		display_name = "intel_loading_screen_benchmark_mode",
		loading_screen_wwise_events = {}
	}
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
	Application.argv()
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
			"skaven_warpfire_thrower"
		}
	end
end
