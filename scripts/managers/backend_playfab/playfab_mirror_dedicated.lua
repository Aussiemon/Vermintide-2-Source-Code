require("scripts/managers/backend_playfab/playfab_mirror")

local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
PlayFabMirrorDedicated = class(PlayFabMirrorDedicated, PlayFabMirror)
PlayFabMirrorDedicated.init = function (self, signin_result)
	self._data_is_ready = false

	self.super.init(self, signin_result)

	return 
end
PlayFabMirrorDedicated.update_items = function (self, leader_peer_id)
	self._leader_id = leader_peer_id
	self._data_is_ready = false

	self._request_all_users_characters(self)
	self._request_user_inventory(self)

	return 
end
PlayFabMirrorDedicated.is_update_items_done = function (self)
	return self._data_is_ready
end
PlayFabMirrorDedicated._request_signin_reward = function (self)
	return 
end
PlayFabMirrorDedicated.set_character_data = function (self, career_name, key, value)
	assert(false)

	return 
end
PlayFabMirrorDedicated._send_update_character_data_request = function (self, update_character_data_request)
	assert(false)

	return 
end
PlayFabMirrorDedicated._request_all_users_characters = function (self)
	local request = {
		FunctionName = "get_all_users_characters",
		FunctionParameter = {
			steam_id = Application.hex64_to_dec(self._leader_id)
		}
	}
	local character_request_cb = callback(self, "character_request_cb")

	PlayFabClientApi.ExecuteCloudScript(request, character_request_cb, character_request_cb)

	self._num_items_to_load = self._num_items_to_load + 1

	return 
end
PlayFabMirrorDedicated._request_user_inventory = function (self)
	local request = {
		FunctionName = "get_user_inventory",
		FunctionParameter = {
			steam_id = Application.hex64_to_dec(self._leader_id)
		}
	}
	local inventory_request_cb = callback(self, "inventory_request_cb")

	PlayFabClientApi.ExecuteCloudScript(request, inventory_request_cb, inventory_request_cb)

	self._num_items_to_load = self._num_items_to_load + 1

	return 
end
PlayFabMirrorDedicated._request_character_readonly_data = function (self, character_id)
	local request = {
		FunctionName = "get_character_readonly_data",
		FunctionParameter = {
			steam_id = Application.hex64_to_dec(self._leader_id),
			character_id = character_id
		}
	}
	local character_data_request_cb = callback(self, "character_data_request_cb")

	PlayFabClientApi.ExecuteCloudScript(request, character_data_request_cb, character_data_request_cb)

	self._num_items_to_load = self._num_items_to_load + 1

	return 
end
PlayFabMirrorDedicated.character_request_cb = function (self, result)
	self.super.character_request_cb(self, result.FunctionResult)

	return 
end
PlayFabMirrorDedicated.inventory_request_cb = function (self, result)
	self._data_is_ready = true

	self.super.inventory_request_cb(self, result.FunctionResult)

	return 
end
PlayFabMirrorDedicated.character_data_request_cb = function (self, result)
	self.super.character_data_request_cb(self, result.FunctionResult)

	return 
end

return 
