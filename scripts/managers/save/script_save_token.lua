ScriptSaveToken = class(ScriptSaveToken)
ScriptSaveToken.init = function (self, adapter, token)
	self._adapter = adapter
	self._token = token
	self._info = {}

	return 
end
ScriptSaveToken.update = function (self)
	self._info = self._adapter.progress(self._token)

	return 
end
ScriptSaveToken.info = function (self)
	return self._info
end
ScriptSaveToken.done = function (self)
	return self._info.done
end
ScriptSaveToken.close = function (self)
	self._adapter.close(self._token)

	return 
end

return 
