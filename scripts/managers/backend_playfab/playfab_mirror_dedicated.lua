require("scripts/managers/backend_playfab/playfab_mirror")

local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
PlayFabMirrorDedicated = class(PlayFabMirrorDedicated, PlayFabMirror)

PlayFabMirrorDedicated.init = function (self, signin_result)
	self._data_is_ready = false

	self.super.init(self, signin_result)
end

PlayFabMirrorDedicated.update_items = function (self, leader_peer_id)
	self._leader_id = leader_peer_id
	self._data_is_ready = false

	self:_request_user_inventory()
end

PlayFabMirrorDedicated.is_update_items_done = function (self)
	return self._data_is_ready
end

PlayFabMirrorDedicated._request_signin_reward = function (self)
	self:_request_quests()
end

PlayFabMirrorDedicated._request_fix_inventory_data_1 = function (self)
	return
end

PlayFabMirrorDedicated.set_character_data = function (self, career_name, key, value)
	assert(false)
end

PlayFabMirrorDedicated._send_update_character_data_request = function (self, update_character_data_request)
	assert(false)
end

PlayFabMirrorDedicated._request_all_users_characters = function (self)
	local request = {
		FunctionName = "get_all_users_characters",
		FunctionParameter = {
			steam_id = Application.hex64_to_dec(self._leader_id)
		}
	}
	local character_request_cb = callback(self, "character_request_cb")

	PlayFabClientApi.ExecuteCloudScript(request, character_request_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorDedicated._request_user_inventory = function (self)
	local request = {
		FunctionName = "get_user_inventory",
		FunctionParameter = {
			steam_id = Application.hex64_to_dec(self._leader_id)
		}
	}
	local inventory_request_cb = callback(self, "inventory_request_cb")

	PlayFabClientApi.ExecuteCloudScript(request, inventory_request_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorDedicated._request_character_readonly_data = function (self, characters, i)
	print("Populating data for character", i, #characters)

	local character_data = characters[i]
	local career_name = character_data.CharacterType
	local character_id = character_data.CharacterId
	self._career_data[career_name] = {}
	self._career_data_mirror[career_name] = {}
	self._career_lookup[career_name] = character_id
	self._career_lookup[character_id] = career_name
	local request = {
		FunctionName = "get_character_readonly_data",
		FunctionParameter = {
			steam_id = Application.hex64_to_dec(self._leader_id),
			character_id = character_id
		}
	}
	local character_data_request_cb = callback(self, "character_data_request_cb", characters, i)

	PlayFabClientApi.ExecuteCloudScript(request, character_data_request_cb)
end

PlayFabMirrorDedicated.character_request_cb = function (self, result)
	self.super.character_request_cb(self, result.FunctionResult)
end

PlayFabMirrorDedicated.inventory_request_cb = function (self, result)
	self._data_is_ready = true

	self.super.inventory_request_cb(self, result.FunctionResult)
end

PlayFabMirrorDedicated.character_data_request_cb = function (self, characters, index, result)
	self.super.character_data_request_cb(self, characters, index, result.FunctionResult)
end

return
