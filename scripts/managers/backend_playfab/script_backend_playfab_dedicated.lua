-- chunkname: @scripts/managers/backend_playfab/script_backend_playfab_dedicated.lua

require("scripts/managers/backend_playfab/playfab_mirror_dedicated")
require("scripts/managers/backend_playfab/script_backend_playfab")

local IPlayFabHttps = require("PlayFab.IPlayFabHttps")
local playfab_https_curl = require("scripts/managers/backend/playfab_https_curl")

IPlayFabHttps.SetHttp(playfab_https_curl)

local PlayFabClientApi = require("PlayFab.PlayFabClientApi")

PlayFabClientApi.settings.titleId = GameSettingsDevelopment.backend_settings.title_id
ScriptBackendPlayFabDedicated = class(ScriptBackendPlayFabDedicated, ScriptBackendPlayFab)

ScriptBackendPlayFabDedicated.init = function (self)
	local unique_id = self._generate_unique_id()

	self._metadata = Managers.backend:get_metadata()

	local login_request = {
		CreateAccount = true,
		CustomId = unique_id,
		InfoRequestParameters = {
			GetTitleData = true,
			GetUserReadOnlyData = true,
		},
		TitleId = PlayFabClientApi.settings.titleId,
	}

	self._signed_in = false

	print("Logging in to Playfab using custom ID")

	local login_request_cb = callback(self, "login_request_cb")

	PlayFabClientApi.LoginWithCustomID(login_request, login_request_cb)
end

ScriptBackendPlayFabDedicated.login_request_cb = function (self, result)
	self._signin_result = result

	local info_result_payload = result.InfoResultPayload
	local read_only_data = info_result_payload.UserReadOnlyData
	local playfab_id = result.PlayFabId

	self:_update_telemetry_settings()
	Crashify.print_property("playfab_id", playfab_id)
	cprint("[ScriptBackendPlayFabDedicated] Backend Sign-In Success")
	cprintf("[ScriptBackendPlayFabDedicated] PlayFabId: %s", playfab_id)

	self._signed_in = true

	self:_validate_version()
end

ScriptBackendPlayFabDedicated._validate_version = function (self)
	local request = {
		FunctionName = "validateVersion",
		FunctionParameter = {
			Version = VersionSettings.version,
			metadata = self._metadata,
		},
	}
	local callback = callback(self, "_validate_version_cb")

	PlayFabClientApi.ExecuteCloudScript(request, callback)

	self._validating_version = true
end

ScriptBackendPlayFabDedicated._validate_version_cb = function (self, result)
	local valid = result.FunctionResult and result.FunctionResult.valid_version

	self._validating_version = nil

	if valid ~= true then
		self._signed_in = false
		self._signin_result_error = {
			errorCode = BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_UNSUPPORTED_VERSION_ERROR,
		}
	end
end

ScriptBackendPlayFabDedicated.update_signin = function (self)
	local signin_result = self._signin_result_error

	if signin_result then
		local error_code = signin_result.errorCode
		local error_message = signin_result.errorMessage

		return {
			reason = error_code,
			details = error_message,
		}
	end
end

ScriptBackendPlayFabDedicated._generate_unique_id = function ()
	local machine_id = Application.machine_id()
	local ip_address = Network.default_network_address()
	local server_port = script_data.server_port or script_data.settings.server_port

	if machine_id == nil then
		machine_id = Application.guid()
	end

	return Application.make_hash(machine_id, ip_address, server_port)
end
