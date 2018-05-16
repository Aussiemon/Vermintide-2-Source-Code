require("scripts/managers/telemetry/telemetry_settings")
require("scripts/managers/telemetry/telemetry_manager_dummy")
require("scripts/managers/telemetry/telemetry_manager")

function CreateTelemetryManager()
	if rawget(_G, "lcurl") == nil then
		print("[TelemetryManager] No lcurl interface found! Fallback to dummy... ")

		return TelemetryManagerDummy:new()
	elseif rawget(_G, "cjson") == nil then
		print("[TelemetryManager] No cjson interface found! Fallback to dummy...")

		return TelemetryManagerDummy:new()
	elseif PLATFORM ~= "win32" then
		print("[TelemetryManager] Only supported on win32 currently! Fallback to dummy...")

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

return
