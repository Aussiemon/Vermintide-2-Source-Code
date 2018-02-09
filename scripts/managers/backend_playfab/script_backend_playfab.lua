require("scripts/managers/backend_playfab/playfab_mirror")

local IPlayFabHttps = require("PlayFab.IPlayFabHttps")
local playfab_https_curl = require("scripts/managers/backend/playfab_https_curl")

IPlayFabHttps.SetHttp(playfab_https_curl)

local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
PlayFabClientApi.settings.titleId = GameSettingsDevelopment.backend_settings.title_id
ScriptBackendPlayFab = class(ScriptBackendPlayFab)
ScriptBackendPlayFab.init = function (self)
	self._steam_ticket_id = Steam.retrieve_auth_session_ticket()

	return 
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
					GetUserReadOnlyData = true
				}
			}
			local login_request_cb = callback(self, "login_request_cb")

			PlayFabClientApi.LoginWithSteam(login_request, login_request_cb, login_request_cb)

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

	local initial_inventory_result = self._initial_inventory_result_error

	if initial_inventory_result then
		local error_code = initial_inventory_result.errorCode
		local error_message = initial_inventory_result.errorMessage

		return {
			reason = error_code,
			details = error_message
		}
	end

	local character_creation_result = self._character_creation_result_error

	if character_creation_result then
		local error_code = character_creation_result.errorCode
		local error_message = character_creation_result.errorMessage

		return {
			reason = error_code,
			details = error_message
		}
	end

	return nil
end
ScriptBackendPlayFab.login_request_cb = function (self, result)
	self._signin_result = result

	print("Signed In")
	table.dump(result, nil, 4)

	if result.error then
		self._signin_result_error = result
	else
		local info_result_payload = result.InfoResultPayload
		local read_only_data = info_result_payload.UserReadOnlyData

		if result.NewlyCreated or not read_only_data.previously_created then
			self._set_up_initial_data(self)
		end

		self._signed_in = true
	end

	return 
end
ScriptBackendPlayFab._set_up_initial_data = function (self)
	local initial_inventory_request = {
		FunctionName = "generateInitialInventory"
	}
	local initial_inventory_request_cb = callback(self, "initial_inventory_request_cb")

	PlayFabClientApi.ExecuteCloudScript(initial_inventory_request, initial_inventory_request_cb, initial_inventory_request_cb)

	local initial_user_data_request = {
		FunctionName = "setInitialUserData"
	}
	local initial_user_data_request_cb = callback(self, "initial_user_data_request_cb")

	PlayFabClientApi.ExecuteCloudScript(initial_user_data_request, initial_user_data_request_cb, initial_user_data_request_cb)

	self._first_time_setup_required = true

	return 
end
ScriptBackendPlayFab.initial_inventory_request_cb = function (self, result)
	if result.Error then
		self._initial_inventory_result_error = result
	else
		local character_creation_request = {
			FunctionName = "createCharacter",
			FunctionParameter = {}
		}
		self._total_characters = 0

		for career_name, data in pairs(CareerSettings) do
			local playfab_name = data.playfab_name

			if playfab_name then
				local params = character_creation_request.FunctionParameter
				params.playfab_name = playfab_name
				params.career_name = career_name
				local character_creation_cb = callback(self, "character_creation_cb")

				PlayFabClientApi.ExecuteCloudScript(character_creation_request, character_creation_cb, character_creation_cb)

				self._total_characters = self._total_characters + 1
			end
		end

		self._characters_created = 0
		self._initial_inventory_set_up = true
	end

	return 
end
ScriptBackendPlayFab.initial_user_data_request_cb = function (self, result)
	if result.Error then
		self._initial_user_data_result_error = result
	else
		self._initial_user_data_set_up = true
	end

	return 
end
ScriptBackendPlayFab.character_creation_cb = function (self, result)
	if result.Error and not self._character_creation_result_error then
		self._character_creation_result_error = result
	end

	if not self._character_creation_result_error then
		self._characters_created = self._characters_created + 1
	end

	return 
end
ScriptBackendPlayFab.authenticated = function (self)
	if self._first_time_setup_required and (not self._initial_inventory_set_up or not self._initial_user_data_set_up or self._characters_created ~= self._total_characters) then
		return false
	end

	if self._signed_in then
		return true
	end

	return false
end
ScriptBackendPlayFab.get_signin_result = function (self)
	return self._signin_result
end
ScriptBackendPlayFab.destroy = function (self)
	return 
end

return 
