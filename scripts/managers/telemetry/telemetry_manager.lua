-- chunkname: @scripts/managers/telemetry/telemetry_manager.lua

require("scripts/managers/telemetry/telemetry_manager_dummy")
require("scripts/managers/telemetry/telemetry_events")
require("scripts/managers/telemetry/telemetry_settings")

local ENABLED = TelemetrySettings.enabled
local ENDPOINT = TelemetrySettings.endpoint
local POST_INTERVAL = TelemetrySettings.batch.post_interval
local FULL_POST_INTERVAL = TelemetrySettings.batch.full_post_interval
local MAX_BATCH_SIZE = TelemetrySettings.batch.max_size
local BATCH_SIZE = TelemetrySettings.batch.size

local function dprintf(...)
	if Development.parameter("debug_telemetry") then
		printf(...)
	end
end

TelemetryManager = class(TelemetryManager)
TelemetryManager.NAME = "TelemetryManager"

TelemetryManager.create = function ()
	if (IS_WINDOWS or IS_LINUX) and rawget(_G, "lcurl") == nil then
		print("[TelemetryManager] No lcurl interface found! Fallback to dummy...")

		return TelemetryManagerDummy:new()
	elseif not IS_WINDOWS and not IS_LINUX and rawget(_G, "REST") == nil then
		print("[TelemetryManager] No REST interface found! Fallback to dummy...")

		return TelemetryManagerDummy:new()
	elseif rawget(_G, "cjson") == nil then
		print("[TelemetryManager] No cjson interface found! Fallback to dummy...")

		return TelemetryManagerDummy:new()
	elseif TelemetrySettings.enabled == false then
		print("[TelemetryManager] Disabled! Fallback to dummy...")

		return TelemetryManagerDummy:new()
	else
		return TelemetryManager:new()
	end
end

TelemetryManager.init = function (self)
	self._events = {}
	self._batch_post_time = 0
	self._t = 0

	self:reload_settings()
end

TelemetryManager.reload_settings = function (self)
	dprintf("[TelemetryManager] Refreshing settings")

	self._blacklisted_events = table.set(TelemetrySettings.blacklist or {})
end

TelemetryManager.update = function (self, dt, t)
	self._t = t

	if self:_ready_to_post_batch(t) then
		self:post_batch()
	end
end

TelemetryManager.register_event = function (self, event)
	if not ENABLED then
		return
	end

	local raw_event = event:raw()

	if self._blacklisted_events[raw_event.type] then
		dprintf("[TelemetryManager] Skipping blacklisted event '%s'", raw_event.type)

		return
	end

	raw_event.time = self._t
	raw_event.data = self:_convert_userdata(raw_event.data)

	if #self._events < MAX_BATCH_SIZE then
		dprintf("[TelemetryManager] Registered event '%s'", event)
		table.insert(self._events, table.remove_empty_values(raw_event))
	else
		dprintf("[TelemetryManager] Discarding event '%s', buffer is full!", event)
	end
end

TelemetryManager._convert_userdata = function (self, data)
	local new_data = {}

	if type(data) == "table" then
		for key, value in pairs(data) do
			if Script.type_name(value) == "Vector3" then
				new_data[key] = {
					x = value.x,
					y = value.y,
					z = value.z,
				}
			elseif type(value) == "function" then
				new_data[key] = nil
			elseif type(value) == "userdata" then
				new_data[key] = tostring(value)
			elseif type(value) == "table" then
				new_data[key] = self:_convert_userdata(value)
			else
				new_data[key] = value
			end
		end
	end

	return new_data
end

TelemetryManager._ready_to_post_batch = function (self, t)
	if self._batch_in_flight then
		return false
	end

	if t - self._batch_post_time > POST_INTERVAL then
		return true
	elseif t - self._batch_post_time > FULL_POST_INTERVAL and #self._events >= BATCH_SIZE then
		return true
	end
end

TelemetryManager.post_batch = function (self)
	if not self:has_events_to_post() then
		return
	end

	dprintf("[TelemetryManager] Posting batch of %d events", #self._events)

	self._batch_in_flight = true
	self._batch_post_time = math.floor(self._t)

	local payload = self:_encode(self._events)

	if IS_WINDOWS or IS_LINUX then
		local headers = {
			"Content-Type: application/json",
			string.format("x-reference-time: %s", self._t),
		}

		Managers.curl:post(ENDPOINT, payload, headers, callback(self, "cb_post_batch"))
	else
		local headers = {
			"Content-Type",
			"application/json",
			"x-reference-time",
			tostring(self._t),
		}

		Managers.rest_transport:post(ENDPOINT, payload, headers, callback(self, "cb_post_batch"))
	end
end

TelemetryManager.has_events_to_post = function (self)
	return ENABLED and not table.is_empty(self._events)
end

TelemetryManager.batch_in_flight = function (self)
	return self._batch_in_flight
end

TelemetryManager._encode = function (self, events)
	local payload = table.map(events, cjson.encode)

	return "[" .. table.concat(payload, ",") .. "]"
end

TelemetryManager.cb_post_batch = function (self, success, _, _, error)
	if success then
		dprintf("[TelemetryManager] Batch sent successfully")
		table.clear(self._events)

		self._batch_in_flight = nil
	else
		dprintf("[TelemetryManager] Error sending batch: %s", error)

		self._batch_in_flight = nil
	end
end

TelemetryManager.destroy = function (self)
	self:post_batch()
end
