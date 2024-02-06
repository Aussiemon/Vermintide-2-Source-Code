-- chunkname: @scripts/managers/irc/script_irc_token.lua

ScriptIrcToken = class(ScriptIrcToken)

ScriptIrcToken.init = function (self, token)
	self._token = token
	self._result = {}
	self._done = false
end

ScriptIrcToken.update = function (self)
	local done, result = Irc.connect_async_status(self._token)

	self._done = done
	self._result = result
end

ScriptIrcToken.info = function (self)
	local data = {}

	if self._done then
		data.result = self._result
	end

	return data
end

ScriptIrcToken.done = function (self)
	return self._done
end

ScriptIrcToken.close = function (self)
	Irc.release_token(self._token)
end
