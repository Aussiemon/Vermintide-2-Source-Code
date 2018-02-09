ScriptEACToken = class(ScriptEACToken)
local STATUS_MAP = {
	[EAC.QUERY_PENDING] = "pending",
	[EAC.QUERY_COMPLETE] = "complete"
}
local RESULTS_MAP = {
	[EAC.QUERY_RESULT_AUTHORIZED] = "authorized",
	[EAC.QUERY_RESULT_UNAUTHORIZED] = "unauthorized"
}
ScriptEACToken.init = function (self, token, peer_id, request_id)
	self._token = token
	self._done = false
	self._info = {
		authorized = false,
		peer_id = peer_id,
		request_id = request_id
	}

	return 
end
ScriptEACToken.update = function (self)
	local status = EAC.poll_query_status(self._token)

	if STATUS_MAP[status] == "complete" then
		local result = EAC.get_query_result(self._token)

		if RESULTS_MAP[result] == "authorized" then
			self._info.authorized = true
		end

		self._done = true
	end

	return 
end
ScriptEACToken.done = function (self)
	return self._done
end
ScriptEACToken.info = function (self)
	return self._info
end
ScriptEACToken.close = function (self)
	return 
end

return 
