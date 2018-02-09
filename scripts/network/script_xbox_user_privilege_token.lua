ScriptXboxUserPrivilegeToken = class(ScriptXboxUserPrivilegeToken)
ScriptXboxUserPrivilegeToken.init = function (self, token)
	self._token = token
	self._result = {}

	return 
end
ScriptXboxUserPrivilegeToken.update = function (self)
	local in_progress, done, error, status_code = UserPrivilege.status(self._token)
	self._result.in_progress = in_progress
	self._result.done = done
	self._result.error = error
	self._result.status_code = status_code

	return 
end
ScriptXboxUserPrivilegeToken.info = function (self)
	local info = {}

	if self._result.error then
		info.error = self._result.error
		info.status_code = self._result.status_code
	else
		info.status_code = self._result.status_code
	end

	return info
end
ScriptXboxUserPrivilegeToken.done = function (self)
	return self._result.done
end
ScriptXboxUserPrivilegeToken.close = function (self)
	UserPrivilege.release(self._token)

	return 
end

return 
