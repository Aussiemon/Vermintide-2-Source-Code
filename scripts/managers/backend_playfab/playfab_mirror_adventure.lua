-- chunkname: @scripts/managers/backend_playfab/playfab_mirror_adventure.lua

require("scripts/managers/backend_playfab/playfab_mirror_base")

local PlayFabClientApi = require("PlayFab.PlayFabClientApi")

PlayFabMirrorAdventure = class(PlayFabMirrorAdventure, PlayFabMirrorBase)

PlayFabMirrorAdventure.init = function (self, signin_result)
	self._characters_data_key = "characters_data"
	self._verify_slot_keys_per_affiliation = {
		heroes = {
			"slot_ranged",
			"slot_melee",
			"slot_hat",
			"slot_skin",
			"slot_necklace",
			"slot_trinket_1",
			"slot_ring",
			"slot_frame",
		},
	}

	PlayFabMirrorBase.init(self, signin_result)
end

PlayFabMirrorAdventure.request_characters = function (self, mechanism_key)
	self:_verify_dlc_careers()
end

PlayFabMirrorAdventure._set_inital_career_data_weaves = function (self, career_name, loadout, slots_to_verify)
	local broken_slots = {}

	for i = 1, #slots_to_verify do
		local slot_name = slots_to_verify[i]
		local slot_data = loadout[slot_name]
		local slot_item_value = type(slot_data) == "table" and slot_data.Value or slot_data

		if not slot_item_value then
			broken_slots[slot_name] = true
		else
			local item = self._inventory_items[slot_item_value]

			if not item then
				broken_slots[slot_name] = true
			end
		end
	end

	if table.size(broken_slots) > 0 then
		return broken_slots
	end
end

PlayFabMirrorAdventure._check_weaves_loadout = function (self)
	local characters_data_string = self:get_read_only_data(self._characters_data_key)
	local characters_data = cjson.decode(characters_data_string)
	local broken_slots_data = {}

	for character_name, character_data in pairs(characters_data) do
		for career_name, career_data in pairs(character_data.careers) do
			local weave_name = "weaves_loadout_" .. career_name
			local weave_loadout_string = self:get_read_only_data(weave_name)
			local weave_loadout = cjson.decode(weave_loadout_string)
			local broken_slots = self:_set_inital_career_data_weaves(career_name, weave_loadout, {
				"slot_melee",
				"slot_ranged",
			})

			if broken_slots then
				broken_slots_data[career_name] = broken_slots

				print("Broken item slots for career", weave_name)
				table.dump(broken_slots)
			end
		end
	end

	if not table.is_empty(broken_slots_data) then
		self:_fix_career_data(broken_slots_data, "weaves", "fix_weaves_career_data_request_cb")
	end
end

PlayFabMirrorAdventure.fix_weaves_career_data_request_cb = function (self, result)
	self.broken_slots_data = nil
	self._num_items_to_load = self._num_items_to_load - 1

	local function_result = result.FunctionResult

	if function_result.num_items_granted > 0 then
		self:_request_user_inventory()

		return
	end

	local data = function_result.character_starting_gear

	self:merge_read_only_data(data, true)
end
