require("scripts/managers/backend_playfab/playfab_mirror_adventure")
require("scripts/settings/version_settings")
DLCUtils.require_list("playfab_mirror_files")

local IPlayFabHttps = require("PlayFab.IPlayFabHttps")
local playfab_https = require("scripts/managers/backend/playfab_https_curl")

IPlayFabHttps.SetHttp(playfab_https)

local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
PlayFabClientApi.settings.titleId = GameSettingsDevelopment.backend_settings.title_id
ScriptBackendPlayFab = class(ScriptBackendPlayFab)

ScriptBackendPlayFab.init = function (self)
	self._steam_ticket_id = Steam.retrieve_auth_session_ticket()
end

ScriptBackendPlayFab.update_state = function (self)
	return
end

ScriptBackendPlayFab.update_signin = function (self)
	if self._steam_ticket_id then
		local ticket = Steam.poll_auth_session_ticket(self._steam_ticket_id)

		if ticket then
			local login_request = {
				CreateAccount = true,
				TitleId = PlayFabClientApi.settings.titleId,
				SteamTicket = ticket,
				InfoRequestParameters = {
					GetUserReadOnlyData = true,
					GetTitleData = true,
					GetUserData = true
				}
			}
			local login_request_cb = callback(self, "login_request_cb")

			PlayFabClientApi.LoginWithSteam(login_request, login_request_cb)

			self._steam_ticket_id = nil
		end
	end

	local signin_result = self._signin_result_error

	if signin_result then
		local error_code = signin_result.errorCode
		local error_message = signin_result.errorMessage

		return {
			reason = error_code,
			details = error_message
		}
	end

	local initial_set_up_result = self._initial_set_up_result_error

	if initial_set_up_result then
		local error_code = initial_set_up_result.errorCode
		local error_message = initial_set_up_result.errorMessage

		return {
			reason = error_code,
			details = error_message
		}
	end

	local initial_data_set_up_result = self._initial_data_set_up_result_error

	if initial_data_set_up_result then
		local error_code = initial_data_set_up_result.errorCode
		local error_message = initial_data_set_up_result.errorMessage

		return {
			reason = error_code,
			details = error_message
		}
	end

	return nil
end

ScriptBackendPlayFab.login_request_cb = function (self, result)
	self._signin_result = result
	local info_result_payload = result.InfoResultPayload
	local read_only_data = info_result_payload.UserReadOnlyData
	local playfab_id = result.PlayFabId

	Crashify.print_property("playfab_id", playfab_id)
	self:_update_telemetry_settings()

	local account_set_up = read_only_data.account_set_up
	local initial_inventory_setup = read_only_data.initial_inventory_setup
	self._setup_initial_account_needed = result.NewlyCreated or not account_set_up or account_set_up.Value == "false"
	self._setup_initial_inventory_needed = not initial_inventory_setup or initial_inventory_setup.Value == "false"

	self:_validate_version()

	self._signed_in = true
end

ScriptBackendPlayFab._update_telemetry_settings = function (self)
	local settings_override = self._signin_result.InfoResultPayload.TitleData.telemetry_settings_override

	if settings_override then
		table.merge(TelemetrySettings, cjson.decode(settings_override))
		Managers.telemetry:reload_settings()
	end
end

ScriptBackendPlayFab._validate_version = function (self)
	local request = {
		FunctionName = "validateVersion",
		FunctionParameter = {
			Version = VersionSettings.version
		}
	}
	local callback = callback(self, "_validate_version_cb")

	PlayFabClientApi.ExecuteCloudScript(request, callback)

	self._validating_version = true
end

ScriptBackendPlayFab._validate_version_cb = function (self, result)
	local valid = result.FunctionResult and result.FunctionResult.valid_version
	self._validating_version = nil

	if valid ~= true then
		self._signed_in = false
		self._signin_result_error = {
			errorCode = BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_UNSUPPORTED_VERSION_ERROR
		}
	elseif self._setup_initial_account_needed then
		self:_set_up_initial_account()
	elseif self._setup_initial_inventory_needed then
		self:_set_up_initial_inventory()
	end
end

ScriptBackendPlayFab._set_up_initial_account = function (self)
	local initial_account_set_up = {
		FunctionName = "initialAccountSetUp"
	}
	local initial_setup_request_cb = callback(self, "initial_setup_request_cb")

	PlayFabClientApi.ExecuteCloudScript(initial_account_set_up, initial_setup_request_cb)

	self._setting_up_initial_account = true
end

ScriptBackendPlayFab.initial_setup_request_cb = function (self, result)
	self:_set_up_initial_inventory()

	self._setting_up_initial_account = false
	self._setup_initial_account_needed = nil
end

ScriptBackendPlayFab._set_up_initial_inventory = function (self, start_index)
	local initial_account_data_set_up = {
		FunctionName = "initialInventorySetup",
		FunctionParameter = {
			start_index = start_index or 0
		}
	}
	local initial_inventory_setup_request_cb = callback(self, "initial_inventory_setup_request_cb")

	PlayFabClientApi.ExecuteCloudScript(initial_account_data_set_up, initial_inventory_setup_request_cb)

	self._setting_up_initial_inventory = true
end

ScriptBackendPlayFab.initial_inventory_setup_request_cb = function (self, result)
	local done = result.FunctionResult.done

	if not done then
		local new_start_index = result.FunctionResult.new_start_index

		self:_set_up_initial_inventory(new_start_index)
	else
		self._setting_up_initial_inventory = false
		self._setup_initial_inventory_needed = nil
	end
end

ScriptBackendPlayFab.authenticated = function (self)
	if self._validating_version or self._setting_up_initial_account or self._setting_up_initial_inventory then
		return false
	end

	return self._signed_in
end

ScriptBackendPlayFab.get_signin_result = function (self)
	return self._signin_result
end

ScriptBackendPlayFab.destroy = function (self)
	return
end

return
