if rawget(_G, "EAC") then
	require("scripts/managers/eac/script_eac_token")
end

script_data.disable_eac = script_data.disable_eac or Development.parameter("disable_eac")
EACManager = class(EACManager)
EACManager.init = function (self)
	self._enabled = rawget(_G, "EAC") ~= nil

	if script_data.disable_eac then
		self._enabled = false
	end

	self._request_ids = 0

	return 
end
EACManager.destroy = function (self)
	return 
end
EACManager.enabled = function (self)
	return self._enabled
end
EACManager.authorized = function (self)
	if not self._enabled then
		return false
	end

	return EAC.local_user_connected()
end
EACManager.query_authorized = function (self, peer_id, callback)
	fassert(self._enabled, "EAC is not enabled")

	self._request_ids = self._request_ids + 1
	local token = EAC.query_user_status(peer_id)
	local eac_token = ScriptEACToken:new(token, peer_id, self._request_ids)

	Managers.token:register_token(eac_token, callback)

	return self._request_ids
end

return 
