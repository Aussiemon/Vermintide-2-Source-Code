-- chunkname: @scripts/managers/presence/script_presence_token.lua

ScriptPresenceToken = class(ScriptPresenceToken)

ScriptPresenceToken.init = function (self, token)
	self._token = token
	self._result = {}
	self._done = false
end

ScriptPresenceToken.update = function (self)
	local done, presence, error_code = Presence.status(self._token)

	self._done = done
	self._presence = presence
	self._error_code = error_code
end

ScriptPresenceToken.info = function (self)
	local info = {}

	if self._error_code then
		info.error_code = self._error_code
	elseif self._presence then
		info.presence = self._presence
	end

	return info
end

ScriptPresenceToken.done = function (self)
	return self._done
end

ScriptPresenceToken.close = function (self)
	Presence.close(self._token)
end
