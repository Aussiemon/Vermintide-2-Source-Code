require("scripts/managers/backend_playfab/playfab_mirror_dedicated")

local IPlayFabHttps = require("PlayFab.IPlayFabHttps")
local playfab_https_curl = require("scripts/managers/backend/playfab_https_curl")

IPlayFabHttps.SetHttp(playfab_https_curl)

local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
PlayFabClientApi.settings.titleId = GameSettingsDevelopment.backend_settings.title_id
ScriptBackendPlayFabDedicated = class(ScriptBackendPlayFabDedicated)
ScriptBackendPlayFabDedicated.init = function (self)
	local unique_id = self.generate_unique_id()
	local login_request = {
		CreateAccount = true,
		CustomId = unique_id,
		InfoRequestParameters = {
			GetUserReadOnlyData = true
		},
		TitleId = PlayFabClientApi.settings.titleId
	}

	print("Logging in to Playfab using custom ID")

	local login_request_cb = callback(self, "login_request_cb")

	PlayFabClientApi.LoginWithCustomID(login_request, login_request_cb, login_request_cb)

	return 
end
ScriptBackendPlayFabDedicated.destroy = function (self)
	return 
end
ScriptBackendPlayFabDedicated.update_state = function (self)
	assert(false)

	return 
end
ScriptBackendPlayFabDedicated.update_signin = function (self)
	local signin_result = self._signin_result_error

	if signin_result then
		local error_code = signin_result.errorCode
		local error_message = signin_result.errorMessage

		return {
			reason = error_code,
			details = error_message
		}
	end

	return nil
end
ScriptBackendPlayFabDedicated.login_request_cb = function (self, result)
	self._signin_result = result

	if result.error then
		print("Sign-in failed")

		return 
	end

	print("Signed In")

	self._signed_in = true

	return 
end
ScriptBackendPlayFabDedicated.authenticated = function (self)
	return self._signed_in
end
ScriptBackendPlayFabDedicated.get_signin_result = function (self)
	return self._signin_result
end
ScriptBackendPlayFabDedicated.generate_unique_id = function ()
	local machine_id = Application.machine_id()
	local ip_address = Development.parameter("ip_address")
	local server_port = Development.parameter("server_port")

	if machine_id == nil then
		machine_id = Application.guid()
	end

	return Application.make_hash(machine_id, ip_address, server_port)
end

return 
