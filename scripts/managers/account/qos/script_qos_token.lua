ScriptQoSToken = class(ScriptQoSToken)

ScriptQoSToken.init = function (self, token)
	self._token = token
	self._result = {}
	self._done = false
end

ScriptQoSToken.update = function (self)
	local in_progress, done, error_code, result_code = QoS.status(self._token)
	self._done = done
	self._result_code = result_code
end

ScriptQoSToken.info = function (self)
	local info = {}
	local up_failed = bit.band(self._result_code, QoS.UP_FAILED) > 0
	local down_failed = bit.band(self._result_code, QoS.DOWN_FAILED) > 0
	info.up_failed = up_failed
	info.down_failed = down_failed

	if up_failed or down_failed then
		local str = "Your"
		local up_str = (up_failed and " upload bandwidth ") or ""
		local down_str = (down_failed and " download bandwidth ") or ""
		info.error = str .. up_str .. ((up_failed and down_failed and "and") or "") .. down_str .. ((up_failed and down_failed and "are too low") or "is too low")
	end

	return info
end

ScriptQoSToken.done = function (self)
	return self._done
end

ScriptQoSToken.close = function (self)
	QoS.release(self._token)
end

return
