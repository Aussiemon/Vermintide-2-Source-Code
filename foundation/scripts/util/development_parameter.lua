Development._hardcoded_dev_params = {
	package_debug = true,
	use_beta_overlay = true,
	force_debug_disabled = true,
	network_debug = true,
	matchmaking_debug = true,
	network_debug_connections = true,
	telemetry_log_interval = "600",
	spawn_empty_chest = true,
	hide_version_info = true,
	disable_debug_draw = true,
	debug_voip = true,
	use_telemetry = true,
	use_local_backend = false,
	network_log_messages = true,
	disable_intro_trailer = false,
	force_steam = true,
	debug_interactions = false,
	beta_level_progression = false,
	show_fps = false,
	use_tech_telemetry = true,
	hide_fps = true
}
local hardcoded_dev_params = Development._hardcoded_dev_params
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
		if param.find(param, "_") then
			new_param = param.gsub(param, "_", "-")
			new_params[new_param] = value
		end
	end

	for param, value in pairs(new_params) do
		hardcoded_dev_params[param] = value
	end

	return 
end

return 
