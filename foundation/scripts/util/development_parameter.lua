Development._hardcoded_dev_params = {
	package_debug = true,
	use_beta_overlay = false,
	disable_tutorial_at_start = false,
	disable_debug_draw = true,
	matchmaking_debug = true,
	network_debug_connections = true,
	telemetry_log_interval = "600",
	spawn_empty_chest = true,
	hide_version_info = true,
	network_debug = true,
	debug_voip = true,
	use_telemetry = true,
	use_local_backend = false,
	tobii_button = false,
	force_debug_disabled = true,
	packaged_build = true,
	network_log_messages = true,
	disable_intro_trailer = false,
	force_steam = true,
	debug_interactions = false,
	beta_level_progression = false,
	show_fps = false,
	use_tech_telemetry = true,
	hide_fps = true
}
Development._hardcoded_benchmark_mode_params = {
	attract_benchmark = true,
	use_local_backend = true,
	disable_tutorial_at_start = true,
	disable_gutter_runner = true,
	disable_pack_master = true,
	screen_space_player_camera_reactions = false,
	show_fps = true,
	hide_fps = false,
	use_lan_backend = true,
	disable_debug_draw = true,
	infinite_ammo = true,
	player_invincible = true,
	attract_mode = true,
	wanted_profile = "bright_wizard"
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

return
