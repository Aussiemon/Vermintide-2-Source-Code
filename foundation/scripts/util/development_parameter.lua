-- chunkname: @foundation/scripts/util/development_parameter.lua

Development._hardcoded_dev_params = {
	beta_level_progression = false,
	debug_interactions = false,
	disable_debug_draw = true,
	disable_intro_trailer = false,
	disable_tutorial_at_start = false,
	force_debug_disabled = true,
	force_steam = true,
	hide_fps = true,
	hide_version_info = true,
	matchmaking_debug = true,
	network_debug = true,
	package_debug = true,
	packaged_build = true,
	qr_watermark = true,
	show_fps = false,
	spawn_empty_chest = true,
	telemetry_log_interval = "600",
	tobii_button = false,
	use_beta_overlay = false,
	use_local_backend = false,
	use_tech_telemetry = true,
	use_telemetry = true,
}
Development._hardcoded_benchmark_mode_params = {
	attract_benchmark = true,
	attract_mode = true,
	disable_debug_draw = true,
	disable_gutter_runner = true,
	disable_pack_master = true,
	disable_tutorial_at_start = true,
	force_steam = true,
	hide_fps = false,
	infinite_ammo = true,
	player_invincible = true,
	screen_space_player_camera_reactions = false,
	show_fps = true,
	tobii_button = false,
	use_lan_backend = false,
	use_local_backend = false,
	wanted_profile = "bright_wizard",
}

local hardcoded_dev_params = Development._hardcoded_dev_params

if LAUNCH_MODE == "attract_benchmark" then
	hardcoded_dev_params = Development._hardcoded_benchmark_mode_params
end

Development.parameter = function (param)
	return hardcoded_dev_params[param]
end

Development.clear_param_cache = function (param)
	return
end

Development.set_parameter = function (param, value)
	return
end

Development.init_parameters = function ()
	for param, value in pairs(hardcoded_dev_params) do
		script_data[param] = value
	end

	new_params = {}

	for param, value in pairs(hardcoded_dev_params) do
		if param:find("_") then
			new_param = param:gsub("_", "-")
			new_params[new_param] = value
		end
	end

	for param, value in pairs(new_params) do
		hardcoded_dev_params[param] = value
	end
end
