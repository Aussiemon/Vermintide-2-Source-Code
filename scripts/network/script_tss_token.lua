ScriptTssToken = class(ScriptTssToken)

ScriptTssToken.init = function (self, token)
	self._token = token
	self._done = false
	self._result = nil
end

ScriptTssToken.update = function (self)
	local token = self._token
	local done = Tss.has_result(token)

	if Tss.has_result(token) then
		local done, result = Tss.get_result(token)
		self._done = done
		self._result = result
	end
end

ScriptTssToken.info = function (self)
	local info = {
		result = self._result
	}

	return info
end

ScriptTssToken.done = function (self)
	return self._done
end

ScriptTssToken.close = function (self)
	Tus.free(self._token)
end
