-- chunkname: @scripts/managers/backend_playfab/playfab_mirror_adventure.lua

require("scripts/managers/backend_playfab/playfab_mirror_base")

local PlayFabClientApi = require("PlayFab.PlayFabClientApi")

PlayFabMirrorAdventure = class(PlayFabMirrorAdventure, PlayFabMirrorBase)

PlayFabMirrorAdventure.init = function (self, signin_result)
	local mechanism_key = Managers.mechanism:current_mechanism_name()

	self:set_mechanism(mechanism_key)
	PlayFabMirrorBase.init(self, signin_result)
end

PlayFabMirrorAdventure.set_mechanism = function (self, mechanism_key)
	printf("[PlayFabMirrorAdventure] Setting mechanism %s", mechanism_key)
	rawset(_G, "debug_characters_data_unsafe_write", self._mechanism_key and self._mechanism_key ~= mechanism_key or nil)

	self._mechanism_key = mechanism_key

	if mechanism_key == "versus" then
		self._characters_data_key = "vs_characters_data"
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
				"talents",
				"slot_pose",
			},
			dark_pact = {
				"slot_melee",
				"slot_skin",
				"slot_frame",
			},
			spectators = {},
		}
	else
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
				"talents",
				"slot_pose",
			},
		}
	end
end

PlayFabMirrorAdventure.request_characters = function (self, mechanism_key)
	mechanism_key = mechanism_key or self._mechanism_key

	if mechanism_key == "versus" then
		local setup = false
		local characters_data = self:get_read_only_data("vs_characters_data")

		if not characters_data or self:get_read_only_data("vs_profile_data") == nil then
			setup = true
		elseif characters_data then
			characters_data = cjson.decode(characters_data)

			for character_name, character_data in pairs(characters_data) do
				if table.is_empty(character_data.careers) then
					setup = true

					break
				end
			end

			if not setup then
				local pactsworn_profiles = PROFILES_BY_AFFILIATION.dark_pact

				for i = 1, #pactsworn_profiles do
					local profile_name = pactsworn_profiles[i]

					if profile_name ~= "vs_undecided" and not characters_data[profile_name] then
						setup = true

						break
					end
				end
			end
		end

		if setup then
			self._num_items_to_load = self._num_items_to_load + 1

			local request = {
				FunctionName = "versusPlayerSetup",
				FunctionParameter = {},
			}
			local versus_player_setup_cb = callback(self, "versus_player_setup_cb")

			self._request_queue:enqueue(request, versus_player_setup_cb)
		else
			self:_verify_career_loadouts()
		end
	else
		self:_verify_career_loadouts()
	end
end

PlayFabMirrorAdventure._verify_career_loadouts = function (self)
	self._num_items_to_load = self._num_items_to_load + 1

	local request = {
		FunctionName = "verifyCareerLoadouts",
		FunctionParameter = {},
	}
	local verify_career_loadouts_cb = callback(self, "verify_career_loadouts_cb")

	self._request_queue:enqueue(request, verify_career_loadouts_cb)
end

PlayFabMirrorAdventure.verify_career_loadouts_cb = function (self, result)
	local function_result = result.FunctionResult
	local characters_data = function_result.characters_data
	local vs_characters_data = function_result.vs_characters_data

	if characters_data then
		self:set_read_only_data("characters_data", characters_data, true)
	end

	if vs_characters_data then
		self:set_read_only_data("vs_characters_data", vs_characters_data, true)
	end

	self._num_items_to_load = self._num_items_to_load - 1

	self:_verify_dlc_careers()
end

PlayFabMirrorAdventure.versus_player_setup_cb = function (self, result)
	local function_result = result.FunctionResult
	local vs_characters_data = function_result.vs_characters_data
	local vs_profile_data = function_result.vs_profile_data
	local num_items_granted = function_result.num_items_granted

	self:set_read_only_data("vs_characters_data", vs_characters_data, true)
	self:set_read_only_data("vs_profile_data", vs_profile_data, true)

	self._num_items_to_load = self._num_items_to_load - 1

	local unlocked_cosmetics = function_result.unlocked_cosmetics

	if unlocked_cosmetics then
		self:set_read_only_data("unlocked_cosmetics", unlocked_cosmetics, true)

		self._unlocked_cosmetics = self:_parse_unlocked_cosmetics()
	end

	if num_items_granted > 0 then
		self:_request_user_inventory()
	else
		self:_verify_career_loadouts()
	end
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
	else
		self:unequip_disabled_items()
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
	self:unequip_disabled_items()
end
