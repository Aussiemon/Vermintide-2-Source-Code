require("scripts/managers/backend_playfab/playfab_mirror")

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
	local info_result_payload = result.InfoResultPayload
	local read_only_data = info_result_payload.UserReadOnlyData

	if result.NewlyCreated or not read_only_data.account_set_up then
		self:_set_up_initial_account()
	elseif not read_only_data.account_data_set_up then
		self:_set_up_initial_account_data()
	end

	self._signed_in = true
	self._signin_result = result
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
	self:_set_up_initial_account_data()

	self._setting_up_initial_account = false
end

ScriptBackendPlayFab._set_up_initial_account_data = function (self)
	local initial_account_data_set_up = {
		FunctionName = "initialAccountDataSetUp"
	}
	local initial_data_setup_request_cb = callback(self, "initial_data_setup_request_cb")

	PlayFabClientApi.ExecuteCloudScript(initial_account_data_set_up, initial_data_setup_request_cb)

	self._setting_up_initial_account_data = true
end

ScriptBackendPlayFab.initial_data_setup_request_cb = function (self, result)
	self._setting_up_initial_account_data = false
end

ScriptBackendPlayFab.authenticated = function (self)
	if self._setting_up_initial_account or self._setting_up_initial_account_data then
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
