local DEBUG = Development.parameter("debug_telemetry")
local SETTINGS = TelemetrySettings.heartbeat
TelemetryHeartbeat = class(TelemetryHeartbeat)

TelemetryHeartbeat.init = function (self)
	self._last_heartbeat = 0
end

TelemetryHeartbeat.update = function (self, dt, t)
	if SETTINGS.interval <= t - self._last_heartbeat then
		self:_send()

		self._last_heartbeat = t
	end
end

TelemetryHeartbeat._send = function (self)
	local payload = cjson.encode({
		type = "heartbeat",
		title_id = TelemetrySettings.title_id,
		params = {
			content_revision = script_data.settings.content_revision
		}
	})

	if TelemetrySettings.send then
		if DEBUG then
			printf("[TelemetryHeartbeat] Sending heartbeat '%s'", payload)
		end

		if IS_WINDOWS or IS_LINUX then
			local headers = {
				"Content-Type: application/json"
			}

			Managers.curl:post(SETTINGS.endpoint, payload, headers, callback(self, "cb_send"))
		else
			local headers = {
				"Content-Type",
				"application/json"
			}

			Managers.rest_transport:post(SETTINGS.endpoint, payload, headers, callback(self, "cb_send"))
		end
	elseif DEBUG then
		printf("[TelemetryHeartbeat] Skipping sending heartbeat '%s'", payload)
	end
end

TelemetryHeartbeat.cb_send = function (self, success, _, _, error)
	if success then
		if DEBUG then
			printf("[TelemetryHeartbeat] Heartbeat sent")
		end
	elseif DEBUG then
		printf("[TelemetryHeartbeat] Error sending heartbeat")
	end
end

return
