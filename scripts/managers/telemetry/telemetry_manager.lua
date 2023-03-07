require("scripts/managers/telemetry/telemetry_settings")
require("scripts/managers/telemetry/telemetry_manager_dummy")
require("scripts/managers/telemetry/telemetry_events")
require("scripts/managers/telemetry/telemetry_rpc_listener")
require("scripts/managers/telemetry/telemetry_heartbeat")

local function dprintf(...)
	if Development.parameter("debug_telemetry") then
		printf(...)
	end
end

TelemetryManager = class(TelemetryManager)

TelemetryManager.create = function ()
	if IS_WINDOWS and rawget(_G, "lcurl") == nil then
		print("[TelemetryManager] No lcurl interface found! Fallback to dummy...")

		return TelemetryManagerDummy:new()
	elseif not IS_WINDOWS and rawget(_G, "REST") == nil then
		print("[TelemetryManager] No REST interface found! Fallback to dummy...")

		return TelemetryManagerDummy:new()
	elseif rawget(_G, "cjson") == nil then
		print("[TelemetryManager] No cjson interface found! Fallback to dummy...")

		return TelemetryManagerDummy:new()
	elseif DEDICATED_SERVER then
		print("[TelemetryManager] No telemetry on the dedicated server! Fallback to dummy...")

		return TelemetryManagerDummy:new()
	elseif TelemetrySettings.enabled == false then
		print("[TelemetryManager] Disabled! Fallback to dummy...")

		return TelemetryManagerDummy:new()
	else
		return TelemetryManager:new()
	end
end

TelemetryManager.init = function (self)
	self.events = TelemetryEvents:new(self)
	self.rpc_listener = TelemetryRPCListener:new(self.events)
	self._heartbeat = TelemetryHeartbeat:new()

	self:reset()
	self:reload_settings()
end

TelemetryManager.reset = function (self)
	self._events_json = {}
	self._current_tick = 0
end

TelemetryManager.reload_settings = function (self)
	dprintf("[TelemetryManager] Refreshing settings")

	self._title_id = TelemetrySettings.title_id
	self._endpoint = TelemetrySettings.endpoint
	self._blacklisted_events = table.set(TelemetrySettings.blacklist or {})
end

TelemetryManager.update = function (self, dt, t)
	self._current_tick = self._current_tick + dt

	self._heartbeat:update(dt, t)
end

local event_entry = {}

TelemetryManager.register_event = function (self, event_type, event_params)
	if self._blacklisted_events[event_type] then
		dprintf("[TelemetryManager] Skipping blacklisted event '%s'", event_type)

		return
	end

	for k, param in pairs(event_params) do
		if Script.type_name(param) == "Vector3" then
			event_params[k] = {
				x = param.x,
				y = param.y,
				z = param.z
			}
		elseif type(param) == "userdata" then
			event_params[k] = tostring(param)
		end
	end

	event_entry.tick = self._current_tick
	event_entry.type = event_type
	event_entry.params = event_params
	local encoded_event = cjson.encode(event_entry)

	table.insert(self._events_json, encoded_event)
	dprintf("[TelemetryManager] Registering event '%s' %s", event_type, encoded_event)
end

TelemetryManager.send = function (self, cb)
	dprintf("[TelemetryManager] Sending session data")

	local payload = "[" .. table.concat(self._events_json, ", \n") .. "]"

	if IS_WINDOWS then
		local headers = {
			string.format("title_id: %s", self._title_id)
		}

		Managers.curl:post(self._endpoint, payload, headers, callback(self, "cb_send", cb))
	else
		local headers = {
			"title_id",
			self._title_id
		}

		Managers.rest_transport:post(self._endpoint, payload, headers, callback(self, "cb_send", cb))
	end
end

TelemetryManager.cb_send = function (self, cb, success, _, _, error)
	if success then
		dprintf("[TelemetryManager] Data sent successfully")
	else
		dprintf("[TelemetryManager] Error during transmission", error)
	end

	if cb then
		cb(success)
	end
end
