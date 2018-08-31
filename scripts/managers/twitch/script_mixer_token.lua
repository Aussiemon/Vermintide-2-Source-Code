ScriptMixerToken = class(ScriptMixerToken)

ScriptMixerToken.init = function (self, token)
	self._token = token
	self._error_code = nil
	self._error_message = nil
	self._done = false
end

ScriptMixerToken.update = function (self)
	local status, error_code, error_message = Mixer.data(self._token)

	if status == Mixer.COMPLETED then
		self._done = true
		self._error_code = error_code
		self._error_message = error_message

		if self._done then
			print("[ScriptMixerToken] Done!")

			if self._error_code or self._error_message then
				print(string.format("Error code: %q", self._error_code))
				print(string.format("Error message: %q", self._error_message))
			end
		end
	end
end

ScriptMixerToken.info = function (self)
	return {
		error_code = self._error_code,
		error_message = self._error_message
	}
end

ScriptMixerToken.done = function (self)
	return self._done
end

ScriptMixerToken.close = function (self)
	Mixer.release_job(self._token)
end

return
