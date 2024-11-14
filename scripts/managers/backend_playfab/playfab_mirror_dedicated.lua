-- chunkname: @scripts/managers/backend_playfab/playfab_mirror_dedicated.lua

require("scripts/managers/backend_playfab/playfab_mirror_adventure")

local PlayFabClientApi = require("PlayFab.PlayFabClientApi")

PlayFabMirrorDedicated = class(PlayFabMirrorDedicated, PlayFabMirrorAdventure)

PlayFabMirrorDedicated.init = function (self, signin_result)
	self._data_is_ready = false

	PlayFabMirrorAdventure.init(self, signin_result)

	self._unlocked_weapon_skins = {}
	self._unlocked_cosmetics = {}
	self._owned_dlcs = {}

	for key, dlc in pairs(Managers.unlock:get_dlcs()) do
		self._owned_dlcs[#self._owned_dlcs + 1] = key

		if dlc and dlc.set_owned then
			dlc:set_owned(true)
		end
	end
end

PlayFabMirrorDedicated.is_update_items_done = function (self)
	return self._data_is_ready
end

PlayFabMirrorDedicated.set_character_data = function (self, career_name, key, value)
	assert(false)
end

PlayFabMirrorDedicated._request_server_inventory = function (self)
	local request = {
		FunctionName = "getServerInventory",
		FunctionParameter = {},
	}
	local inventory_request_cb = callback(self, "inventory_request_cb")

	self._request_queue:enqueue(request, inventory_request_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorDedicated.inventory_request_cb = function (self, result)
	self._data_is_ready = true
	self._unlocked_weapon_skins = self:_parse_unlocked_weapon_skins(result.FunctionResult)
	self._unlocked_cosmetics = self:_parse_unlocked_cosmetics(result.FunctionResult.unlocked_cosmetics)

	self.super.inventory_request_cb(self, result.FunctionResult)
end

PlayFabMirrorDedicated.request_characters = function (self)
	if self._refresh_characters or self:get_read_only_data("vs_characters_data") == nil then
		self._refresh_characters = false
		self._num_items_to_load = self._num_items_to_load + 1

		local request = {
			FunctionName = "getServerCharactersData",
			FunctionParameter = {},
		}
		local get_versus_characters_data_cb = callback(self, "get_versus_characters_data")

		self._request_queue:enqueue(request, get_versus_characters_data_cb)
	else
		self:_setup_careers()
	end
end

PlayFabMirrorDedicated.get_versus_characters_data = function (self, result)
	local function_result = result.FunctionResult
	local vs_characters_data = function_result.vs_characters_data

	self._num_items_to_load = self._num_items_to_load - 1

	self:set_read_only_data("vs_characters_data", vs_characters_data, true)
	self:_setup_careers()
end

PlayFabMirrorDedicated._fix_career_data = function (self, broken_slots_data)
	local characters_data = cjson.decode(self._read_only_data.vs_characters_data)

	self._characters_data = characters_data
	self._characters_data_mirror = table.clone(characters_data)
end
