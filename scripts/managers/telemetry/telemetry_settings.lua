TelemetrySettings = {
	endpoint = "https://naot0wazba.execute-api.eu-north-1.amazonaws.com/prod/sessions",
	version = 2,
	enabled = not Development.parameter("telemetry-disable"),
	title_id = GameSettingsDevelopment.backend_settings.title_id,
	heartbeat = {
		interval = 600,
		endpoint = "https://naot0wazba.execute-api.eu-north-1.amazonaws.com/prod/stream"
	},
	blacklist = {
		"ai_died",
		"player_jumped",
		"fatigue_gained"
	},
	collect_memory = BUILD ~= "release" and Development.parameter("telemetry-collect-memory"),
	send = BUILD == "release" or Development.parameter("telemetry-force-send"),
	use_session_survey = Development.parameter("use-session-survey")
}

return
