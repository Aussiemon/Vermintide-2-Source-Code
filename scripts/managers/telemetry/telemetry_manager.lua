require("scripts/managers/telemetry/telemetry_events")
require("scripts/managers/telemetry/telemetry_rpc_listener")

local DEBUG = Development.parameter("debug-telemetry")
local SAVE_FILE = "telemetry"
local SAVE_DATA = {
	upload_attempts = 0
}
TelemetryManager = class(TelemetryManager)
TelemetryManager.init = function (self)
	self.reset(self)

	self.events = TelemetryEvents:new(self)
	self.rpc_listener = TelemetryRPCListener:new(self.events)

	Managers.save:auto_load(SAVE_FILE, function (result)
		SAVE_DATA = result.data or SAVE_DATA

		return 
	end)

	return 
end
TelemetryManager.reset = function (self)
	self._events_json = {}
	self._current_tick = 0

	return 
end
TelemetryManager.update = function (self, dt)
	self._current_tick = self._current_tick + dt

	return 
end
local BLACKLIST = table.set(TelemetrySettings.blacklist or {})
local event_entry = {}
TelemetryManager.register_event = function (self, event_type, event_params)
	if BLACKLIST[event_type] then
		if DEBUG then
			printf("[TelemetryManager] Blacklisted event '%s'", event_type)
		end

		return 
	end

	for k, param in pairs(event_params) do
		if type(param) == "userdata" then
			event_params[k] = tostring(param)
		end
	end

	event_entry.tick = self._current_tick
	event_entry.type = event_type
	event_entry.params = event_params
	local encoded_event = cjson.encode(event_entry)

	table.insert(self._events_json, encoded_event)

	if DEBUG then
		printf("[TelemetryManager] Registering event '%s' %s", event_type, encoded_event)
	end

	return 
end
TelemetryManager.send = function (self)
	self.register_event(self, "upload_attempts", SAVE_DATA)

	local events_as_string = "[" .. table.concat(self._events_json, ", \n") .. "]"
	local file_name = sprintf("%s_%s.json", TelemetrySettings.title_id, math.uuid())
	local url = string.format("%s%s", TelemetrySettings.ftp_address, file_name)

	Managers.curl:upload(url, events_as_string, callback(self, "cb_upload_complete"))

	return 
end
TelemetryManager.cb_upload_complete = function (self, success, _, _, error)
	if success then
		if DEBUG then
			print("[TelemetryManager] Data sent successfully")
		end

		table.clear(SAVE_DATA)

		SAVE_DATA.upload_attempts = 0

		Managers.save:auto_save(SAVE_FILE, SAVE_DATA)
	else
		if DEBUG then
			print("[TelemetryManager] Error during transmission", error)
		end

		SAVE_DATA.error = error
		SAVE_DATA.upload_attempts = SAVE_DATA.upload_attempts + 1

		Managers.save:auto_save(SAVE_FILE, SAVE_DATA)
	end

	return 
end

return 
