-- chunkname: @scripts/managers/telemetry/telemetry_settings.lua

local Crashify = require("scripts/settings/crashify_settings")

TelemetrySettings = {
	endpoint = "https://telemetry-utvxrq72na-ez.a.run.app/events",
	enabled = not Development.parameter("telemetry-disable"),
	source = {
		id = "honduras",
		platform = PLATFORM,
		environment = BUILD,
		version = {
			game = VersionSettings.version,
			engine_revision = string.value_or_nil(script_data.build_identifier or Development.parameter("engine_revision")),
			content_revision = string.value_or_nil(script_data.settings.content_revision == "" and Development.parameter("content_revision") or script_data.settings.content_revision),
		},
		data = {
			testify = string.value_or_nil(script_data.testify),
			steam_branch = string.value_or_nil(script_data.steam_branch),
			svn_branch = string.value_or_nil(script_data.svn_branch),
			title_id = GameSettingsDevelopment.backend_settings.title_id,
		},
		crashify = {
			project_branch = string.value_or_nil(Crashify.branch),
		},
	},
	batch = {
		full_post_interval = 30,
		max_size = 16000,
		post_interval = 300,
		size = 2000,
	},
	heartbeat = {
		interval = 300,
	},
	blacklist = {},
	collect_memory = BUILD ~= "release" and Development.parameter("telemetry-collect-memory"),
	use_session_survey = Development.parameter("use-session-survey"),
}
