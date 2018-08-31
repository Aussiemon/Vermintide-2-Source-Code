require("scripts/managers/backend_playfab/playfab_mirror_dedicated")
require("scripts/managers/backend_playfab/script_backend_playfab")

local IPlayFabHttps = require("PlayFab.IPlayFabHttps")
local playfab_https_curl = require("scripts/managers/backend/playfab_https_curl")

IPlayFabHttps.SetHttp(playfab_https_curl)

local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
PlayFabClientApi.settings.titleId = GameSettingsDevelopment.backend_settings.title_id
ScriptBackendPlayFabDedicated = class(ScriptBackendPlayFabDedicated, ScriptBackendPlayFab)

ScriptBackendPlayFabDedicated.init = function (self)
	local unique_id = self.generate_unique_id()
	local login_request = {
		CreateAccount = true,
		CustomId = unique_id,
		InfoRequestParameters = {
			GetUserReadOnlyData = true,
			GetTitleData = true
		},
		TitleId = PlayFabClientApi.settings.titleId
	}
	self._signed_in = false

	print("Logging in to Playfab using custom ID")

	local login_request_cb = callback(self, "login_request_cb")

	PlayFabClientApi.LoginWithCustomID(login_request, login_request_cb, login_request_cb)
end

ScriptBackendPlayFabDedicated.login_request_cb = function (self, result)
	self._signin_result = result

	if result.error then
		cprint("Backend sign-in failed")

		self._signin_result_error = result
	else
		cprint("Backend sign-in success")

		self._signed_in = true
	end
end

ScriptBackendPlayFabDedicated.generate_unique_id = function ()
	local machine_id = Application.machine_id()
	local ip_address = Network.default_network_address()
	local server_port = script_data.server_port or script_data.settings.server_port

	if machine_id == nil then
		machine_id = Application.guid()
	end

	return Application.make_hash(machine_id, ip_address, server_port)
end

return
