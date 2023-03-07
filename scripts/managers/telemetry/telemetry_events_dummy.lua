TelemetryEventsDummy = class(TelemetryEventsDummy)

local function nop()
	return
end

setmetatable(TelemetryEventsDummy, {
	__index = function (t, k)
		return nop
	end
})
