ScriptConnectedStorageToken = class(ScriptConnectedStorageToken, ScriptSaveToken)
ScriptConnectedStorageToken.info = function (self)
	local info = {}

	if self._status == self._adapter.COMPLETED then
		print("GET STORAGE ID SUCCESS", self._status)

		info = {
			storage_id = self._token
		}
	else
		print("GET STORAGE ID ERROR", self._status)

		info = {
			error = self._parse_error(self, self._status)
		}
	end

	return info
end
ScriptConnectedStorageQueryToken = class(ScriptConnectedStorageQueryToken, ScriptSaveToken)
ScriptConnectedStorageQueryToken.info = function (self)
	local info = {}

	if self._status == self._adapter.COMPLETED then
		info = self._adapter.query_result(self._token)
	else
		print("QUERY ERROR")

		info = {
			error = self._parse_error(self, self._status)
		}
	end

	return info
end
ScriptConnectedStorageDeleteToken = class(ScriptConnectedStorageDeleteToken, ScriptSaveToken)
ScriptConnectedStorageDeleteToken.info = function (self)
	local info = {}

	if self._status == self._adapter.ERROR then
		print("DELETE ERROR")

		info = {
			error = self._parse_error(self, self._status)
		}
	end

	return info
end

return 
