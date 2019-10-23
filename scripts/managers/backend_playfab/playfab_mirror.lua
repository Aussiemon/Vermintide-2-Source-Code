require("scripts/managers/backend_playfab/playfab_request_queue")

local CAREER_ID_LOOKUP = {
	"dr_ranger",
	"dr_slayer",
	"dr_ironbreaker",
	"we_waywatcher",
	"we_shade",
	"we_maidenguard",
	"es_huntsman",
	"es_mercenary",
	"es_knight",
	"bw_adept",
	"bw_scholar",
	"bw_unchained",
	"wh_captain",
	"wh_bountyhunter",
	"wh_zealot"
}
REDUCTION_INTERVAL = 80
DELAY_MULTIPLIER = 5
local PlayFabClientApi = require("PlayFab.PlayFabClientApi")

local function guid()
	if PLATFORM == "ps4" then
		local pattern = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

		return string.gsub(pattern, "x", function (c)
			return string.format("%x", math.random(0, 15))
		end)
	else
		return Application.guid()
	end
end

PlayFabMirror = class(PlayFabMirror)

PlayFabMirror.init = function (self, signin_result)
	self._num_items_to_load = 0
	self._stats = {}
	self._commits = {}
	self._commit_current_id = nil
	self._last_id = 0
	self._queued_commit = {}
	self._request_queue = PlayFabRequestQueue:new()
	self._quest_data = {}
	self._fake_inventory_items = {}
	self._best_power_levels = nil
	self.sum_best_power_levels = nil
	self._playfab_id = signin_result.PlayFabId
	local info_result_payload = signin_result.InfoResultPayload
	local read_only_data = info_result_payload.UserReadOnlyData or {}
	local read_only_data_values = {}

	for key, data in pairs(read_only_data) do
		local value = data.Value

		if tonumber(value) then
			value = tonumber(value)
		elseif value == "true" or value == "false" then
			value = to_boolean(value)
		end

		read_only_data_values[key] = value
	end

	self._read_only_data = read_only_data_values
	self._read_only_data_mirror = table.clone(read_only_data_values)
	local title_data = info_result_payload.TitleData or {}
	self._title_data = {}

	for key, value in pairs(title_data) do
		self:set_title_data(key, value)
	end

	local user_data = info_result_payload.UserData or {}
	local user_data_values = {}

	for key, value_table in pairs(user_data) do
		local value = value_table.Value

		if value then
			if tonumber(value) then
				value = tonumber(value)
			end

			user_data_values[key] = value
		end
	end

	self._claimed_achievements = self:_parse_claimed_achievements(read_only_data_values)
	self._unlocked_weapon_skins = self:_parse_unlocked_weapon_skins(read_only_data_values)
	local unlocked_keep_decorations_json = read_only_data_values.unlocked_keep_decorations or "{}"
	self._unlocked_keep_decorations = cjson.decode(unlocked_keep_decorations_json)
	self._user_data = user_data_values
	self._user_data_mirror = table.clone(self._user_data)
	self._commit_limit_timer = REDUCTION_INTERVAL
	self._commit_limit_total = 1

	if PLATFORM == "xb1" or PLATFORM == "ps4" then
		self._claimed_console_dlc_rewards = self:_parse_claimed_console_dlc_rewards(read_only_data_values)
	end

	self:_execute_dlc_specific_logic_challenge()
end

PlayFabMirror._parse_claimed_achievements = function (self, read_only_data_values)
	local split_achievements_string = {}
	local claimed_achievements = {}
	local claimed_achievements_string = read_only_data_values.claimed_achievements

	if claimed_achievements_string then
		split_achievements_string = string.split(claimed_achievements_string, ",")
	end

	for i = 1, #split_achievements_string, 1 do
		local value = split_achievements_string[i]
		claimed_achievements[value] = true
	end

	return claimed_achievements
end

PlayFabMirror._parse_unlocked_weapon_skins = function (self, read_only_data_values)
	local unlocked_weapon_skins = {}
	local unlocked_weapon_skins_string = read_only_data_values.unlocked_weapon_skins

	if unlocked_weapon_skins_string then
		local decoded = cjson.decode(unlocked_weapon_skins_string)

		if decoded then
			for i = 1, #decoded, 1 do
				unlocked_weapon_skins[decoded[i]] = true
			end
		end
	end

	return unlocked_weapon_skins
end

PlayFabMirror._parse_claimed_console_dlc_rewards = function (self, read_only_data_values)
	local claimed_rewards = {}
	local claimed_rewards_string = read_only_data_values.claimed_console_dlc_rewards

	if claimed_rewards_string then
		local claimed_rewards_table = cjson.decode(claimed_rewards_string)

		for reward_id, _ in pairs(claimed_rewards_table) do
			claimed_rewards[reward_id] = true
		end
	end

	return claimed_rewards
end

PlayFabMirror._update_dlc_ownership = function (self)
	local request = {
		FunctionName = "updateDLCOwnership",
		FunctionParameter = {}
	}
	local request_cb = callback(self, "dlc_ownership_request_cb")

	PlayFabClientApi.ExecuteCloudScript(request, request_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirror.dlc_ownership_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	self:_execute_dlc_specific_logic_challenge()
end

PlayFabMirror._execute_dlc_specific_logic_challenge = function (self)
	local success_cb = callback(self, "eac_challenge_success_cb")
	local generate_challenge_request = {
		FunctionName = "generateChallenge"
	}

	PlayFabClientApi.ExecuteCloudScript(generate_challenge_request, success_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirror.eac_challenge_success_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1
	local function_result = result.FunctionResult
	local challenge = function_result.challenge
	local eac_response, response = nil

	if challenge then
		eac_response, response = self:_get_eac_response(challenge)
	end

	if not challenge then
		self:_execute_dlc_specific_logic()
	elseif not eac_response then
		self:_request_best_power_levels()
	else
		self:_execute_dlc_specific_logic(response)
	end
end

PlayFabMirror._execute_dlc_specific_logic = function (self, response)
	local unlock_manager = Managers.unlock
	local unlocked_dlcs = unlock_manager:get_unlocked_dlcs()
	local json_string = cjson.encode(unlocked_dlcs)
	local request = {
		FunctionName = "executeDLCLogic",
		FunctionParameter = {
			active_dlcs = json_string,
			response = response
		}
	}
	local request_cb = callback(self, "execute_dlc_logic_request_cb")

	PlayFabClientApi.ExecuteCloudScript(request, request_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirror.execute_dlc_logic_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1
	local function_result = result.FunctionResult

	if function_result then
		local info = function_result.missing_dlc_info

		if info then
			local popup_text = (info.presentation_text_localized and Localize(info.presentation_text_localized)) or info.presentation_text
			local popup_title = (info.presentation_title_localized and Localize(info.presentation_title_localized)) or info.presentation_title
			local popup_url_button = nil

			if info.presentation_url_button then
				popup_url_button = {
					text = (info.presentation_url_button.text_localized and Localize(info.presentation_url_button.text_localized)) or info.presentation_url_button.text,
					url = info.presentation_url_button.url
				}
			end

			Managers.backend:missing_required_dlc_error(popup_text, popup_title, popup_url_button)

			return
		end
	end

	self:_set_up_additional_account_data()
end

PlayFabMirror._set_up_additional_account_data = function (self)
	local request = {
		FunctionName = "additionalAccountDataSetUp",
		FunctionParameter = {}
	}
	local request_cb = callback(self, "additional_data_setup_request_cb")

	PlayFabClientApi.ExecuteCloudScript(request, request_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirror.additional_data_setup_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1
	local function_result = result.FunctionResult
	local new_read_only_data = function_result.new_user_read_only_data

	for key, value in pairs(new_read_only_data) do
		self:set_read_only_data(key, value, true)
	end

	self:_request_best_power_levels()
end

PlayFabMirror._request_best_power_levels = function (self)
	local request = {
		FunctionName = "bestPowerLevels",
		FunctionParameter = {}
	}
	local request_cb = callback(self, "best_power_levels_request_cb")

	PlayFabClientApi.ExecuteCloudScript(request, request_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirror.best_power_levels_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1
	local function_result = result.FunctionResult
	local best_power_levels = function_result.best_power_levels
	self._best_power_levels = best_power_levels
	local sum = 0

	for _, value in pairs(best_power_levels) do
		sum = sum + value
	end

	self.sum_best_power_levels = sum

	self:_request_signin_reward()
end

PlayFabMirror._request_signin_reward = function (self)
	local request = {
		FunctionName = "signInRewards",
		FunctionParameter = {}
	}
	local sign_in_reward_request_cb = callback(self, "sign_in_reward_request_cb")

	PlayFabClientApi.ExecuteCloudScript(request, sign_in_reward_request_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirror.sign_in_reward_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1
	local function_result = result.FunctionResult
	local rewards = function_result.rewards

	for reward_id, reward_data in pairs(rewards) do
		local grants = reward_data.ItemGrantResults

		if grants then
			for _, grant in ipairs(grants) do
				local grant_result = grant.Result

				if grant_result == true then
					local item_id = grant.ItemInstanceId

					if reward_id and item_id then
						ItemHelper.mark_sign_in_reward_as_new(reward_id, item_id)
					end
				end
			end
		end

		local unlocked_keep_decorations = reward_data.unlocked_keep_decorations

		if unlocked_keep_decorations then
			for _, keep_decoration in ipairs(unlocked_keep_decorations) do
				self:add_keep_decoration(keep_decoration)
			end
		end
	end

	self:_request_quests()
end

PlayFabMirror._request_quests = function (self)
	local request = {
		FunctionName = "getQuests",
		FunctionParameter = {}
	}
	local request_cb = callback(self, "get_quests_cb")

	PlayFabClientApi.ExecuteCloudScript(request, request_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirror.get_quests_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1
	local function_result = result.FunctionResult
	local current_daily_quests = function_result.current_daily_quests
	local daily_quest_refresh_available = function_result.daily_quest_refresh_available
	local daily_quest_update_time = function_result.daily_quest_update_time
	local current_event_quests = function_result.current_event_quests
	local current_weekly_quests = function_result.current_weekly_quests
	local weekly_quest_update_time = function_result.weekly_quest_update_time

	self:set_quest_data("current_daily_quests", current_daily_quests)
	self:set_quest_data("daily_quest_refresh_available", to_boolean(daily_quest_refresh_available))
	self:set_quest_data("daily_quest_update_time", tonumber(daily_quest_update_time))
	self:set_quest_data("current_event_quests", current_event_quests)
	self:set_quest_data("current_weekly_quests", current_weekly_quests)
	self:set_quest_data("weekly_quest_update_time", weekly_quest_update_time)
	self:_request_fix_inventory_data_1()
end

PlayFabMirror._request_fix_inventory_data_1 = function (self)
	local request = {
		FunctionName = "fixInventoryData1",
		FunctionParameter = {}
	}
	local request_cb = callback(self, "fix_inventory_data_1_request_cb")

	PlayFabClientApi.ExecuteCloudScript(request, request_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirror.fix_inventory_data_1_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1
	local function_result = result.FunctionResult
	local updated_xp_data = function_result and function_result.updated_xp_data
	local new_read_only_data = function_result and function_result.new_read_only_data

	if updated_xp_data then
		for key, value in pairs(updated_xp_data) do
			self:set_read_only_data(key, value, true)
		end
	end

	if new_read_only_data then
		for key, value in pairs(new_read_only_data) do
			self:set_read_only_data(key, value, true)

			if key == "unlocked_weapon_skins" then
				self._unlocked_weapon_skins = self:_parse_unlocked_weapon_skins(new_read_only_data)
			end
		end
	end

	self:_request_fix_inventory_data_2()
end

PlayFabMirror._request_fix_inventory_data_2 = function (self)
	local request = {
		FunctionName = "fixInventoryData2",
		FunctionParameter = {}
	}
	local request_cb = callback(self, "fix_inventory_data_2_request_cb")

	PlayFabClientApi.ExecuteCloudScript(request, request_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirror.fix_inventory_data_2_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1
	local function_result = result.FunctionResult
	local new_magic_level = function_result and function_result.new_magic_level

	if new_magic_level then
		local progress_json = self._read_only_data.weaves_career_progress
		local weaves_career_progress = cjson.decode(progress_json)

		for i = 1, #CAREER_ID_LOOKUP, 1 do
			local career_name = CAREER_ID_LOOKUP[i]
			weaves_career_progress[career_name].magic_level = new_magic_level
		end

		self._read_only_data.weaves_career_progress = cjson.encode(weaves_career_progress)
	end

	self:_request_read_only_data()
end

PlayFabMirror._request_read_only_data = function (self)
	local request = {
		FunctionName = "getReadOnlyData",
		FunctionParameter = {}
	}
	local request_cb = callback(self, "read_only_data_request_cb")

	PlayFabClientApi.ExecuteCloudScript(request, request_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirror.read_only_data_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1
	local function_result = result.FunctionResult
	local achievement_rewards = function_result.achievement_rewards
	self._achievement_rewards = cjson.decode(achievement_rewards)
	local weaves_progression_settings = function_result.weaves_progression_settings
	self._weaves_progression_settings = (weaves_progression_settings and cjson.decode(weaves_progression_settings)) or {}

	self:_weaves_player_setup()
end

PlayFabMirror._weaves_player_setup = function (self)
	self._num_items_to_load = self._num_items_to_load + 1
	local request = {
		FunctionName = "weavesPlayerSetup",
		FunctionParameter = {}
	}
	local request_cb = callback(self, "weaves_player_setup_request_cb")

	PlayFabClientApi.ExecuteCloudScript(request, request_cb)
end

PlayFabMirror.weaves_player_setup_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1
	local function_result = result.FunctionResult
	local created = function_result.created
	local essence = function_result.essence
	local total_essence = function_result.total_essence
	local maximum_essence = function_result.maximum_essence

	if created then
		local new_user_data = function_result.new_user_data

		for key, value in pairs(new_user_data) do
			self:set_read_only_data(key, value, true)
		end
	end

	self:set_essence(essence)
	self:set_total_essence(total_essence)
	self:set_maximum_essence(maximum_essence)
	self:_request_user_inventory()
end

PlayFabMirror._request_user_inventory = function (self)
	local request = {}
	local inventory_request_cb = callback(self, "inventory_request_cb")

	PlayFabClientApi.GetUserInventory(request, inventory_request_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirror.inventory_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1
	local inventory_items = result.Inventory

	if self._inventory_items then
		table.clear(self._inventory_items)
	else
		self._inventory_items = {}
	end

	for i = 1, #inventory_items, 1 do
		local item = inventory_items[i]

		if not item.BundleContents then
			if item.ItemId and not rawget(ItemMasterList, item.ItemId) then
				Crashify.print_exception("PlayfabMirror", string.format("ItemMasterList has no item %q", tostring(item.ItemId)))
			else
				local backend_id = item.ItemInstanceId

				self:_update_data(item, backend_id)

				local filter = false

				if item.data.item_type == "weapon_skin" then
					filter = true
				end

				local required_dlc = ItemMasterList[item.ItemId].required_dlc

				if required_dlc and not Managers.unlock:is_dlc_unlocked(required_dlc) then
					filter = true
				end

				if not filter then
					self._inventory_items[backend_id] = item
				end
			end
		end
	end

	local unlocked_weapon_skins = self:get_unlocked_weapon_skins()
	unlocked_weapon_skins = unlocked_weapon_skins or {}

	self:_create_fake_inventory_items(unlocked_weapon_skins)

	if Managers.mechanism:current_mechanism_name() == "versus" then
		self:_request_characters_versus()
	else
		self:_request_characters_adventure()
	end
end

PlayFabMirror._request_characters_versus = function (self)
	if not self._read_only_data.vs_characters_data then
		self._num_items_to_load = self._num_items_to_load + 1
		local request = {
			FunctionName = "versusPlayerSetup",
			FunctionParameter = {}
		}
		local versus_player_setup_cb = callback(self, "versus_player_setup_cb")

		PlayFabClientApi.ExecuteCloudScript(request, versus_player_setup_cb)

		return
	end

	self:setup_careers_versus()
end

PlayFabMirror.versus_player_setup_cb = function (self, result)
	local function_result = result.FunctionResult
	local vs_characters_data = function_result.vs_characters_data
	local num_items_granted = function_result.num_items_granted
	self._read_only_data.vs_characters_data = vs_characters_data
	self._num_items_to_load = self._num_items_to_load - 1

	if num_items_granted > 0 then
		self:_request_user_inventory()
	else
		self:setup_careers_versus()
	end
end

PlayFabMirror.setup_careers_versus = function (self)
	local read_only_data = self._read_only_data
	local vs_characters_data = cjson.decode(read_only_data.vs_characters_data)
	self._career_data = {}
	self._career_data_mirror = {}
	self._career_lookup = {}
	local broken_slots_data = {}

	for character_name, character_data in pairs(vs_characters_data) do
		for career_name, career_data in pairs(character_data.careers) do
			self._career_data[career_name] = {}
			self._career_data_mirror[career_name] = {}
			local broken_slots = self:_set_inital_career_data(career_name, career_data)

			if broken_slots then
				broken_slots_data[career_name] = broken_slots

				print("Broken item slots for career", career_name)
				table.dump(broken_slots)
			end
		end
	end

	if table.is_empty(broken_slots_data) then
		self._vs_characters_data = vs_characters_data
		self._vs_characters_data_mirror = table.clone(vs_characters_data)
	else
		self:_versus_fix_career_data(broken_slots_data)
	end
end

PlayFabMirror._versus_fix_career_data = function (self, broken_slots_data)
	self._num_items_to_load = self._num_items_to_load + 1
	local request = {
		FunctionName = "versusFixCareerData",
		FunctionParameter = {
			broken_slots = broken_slots_data
		}
	}
	local fix_versus_career_data_request_cb = callback(self, "fix_versus_career_data_request_cb")

	PlayFabClientApi.ExecuteCloudScript(request, fix_versus_career_data_request_cb)
end

PlayFabMirror.fix_versus_career_data_request_cb = function (self, result)
	self.broken_slots_data = nil
	self._num_items_to_load = self._num_items_to_load - 1
	local function_result = result.FunctionResult

	if function_result.num_items_granted > 0 then
		self:_request_user_inventory()

		return
	end

	local vs_character_starting_gear = function_result.vs_character_starting_gear
	local current_career_data = self._career_data
	local mirror_career_data = self._career_data_mirror
	self._vs_characters_data = vs_character_starting_gear
	self._vs_characters_data_mirror = table.clone(vs_character_starting_gear)

	for character_names, character_data in pairs(vs_character_starting_gear) do
		local careers = character_data.careers

		for career_name, career_data in pairs(careers) do
			for attribute_name, attribute_value in pairs(career_data) do
				current_career_data[career_name][attribute_name] = attribute_value
				mirror_career_data[career_name][attribute_name] = attribute_value
			end
		end
	end
end

PlayFabMirror._request_characters_adventure = function (self)
	local request = {}
	local character_request_cb = callback(self, "character_request_adventure_cb")

	PlayFabClientApi.GetAllUsersCharacters(request, character_request_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirror.character_request_adventure_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1
	self._career_data = {}
	self._career_data_mirror = {}
	self._career_lookup = {}
	local characters = result.Characters
	self._num_items_to_load = self._num_items_to_load + #characters

	self:_request_character_readonly_data(characters, 1)
end

PlayFabMirror._request_character_readonly_data = function (self, characters, i)
	print("Populating data for character", i, #characters)

	local character_data = characters[i]
	local career_name = character_data.CharacterType
	local character_id = character_data.CharacterId
	self._career_data[career_name] = {}
	self._career_data_mirror[career_name] = {}
	self._career_lookup[career_name] = character_id
	self._career_lookup[character_id] = career_name
	local request = {
		CharacterId = character_id
	}
	local character_data_request_cb = callback(self, "character_data_request_cb", characters, i)

	PlayFabClientApi.GetCharacterReadOnlyData(request, character_data_request_cb)
end

PlayFabMirror.character_data_request_cb = function (self, characters, i, result)
	self._num_items_to_load = self._num_items_to_load - 1
	local character_id = result.CharacterId
	local character_name = self._career_lookup[character_id]
	local character_data = result.Data
	local broken_slots = self:_set_inital_career_data(character_name, character_data)

	if broken_slots then
		self._num_items_to_load = self._num_items_to_load + 1

		print("Broken item slots for career", character_name)
		table.dump(broken_slots)

		local request = {
			FunctionName = "fixCareerData",
			FunctionParameter = {
				character_type = character_name,
				character_id = character_id,
				broken_slots = broken_slots
			}
		}
		local fix_career_data_request_cb = callback(self, "fix_career_data_request_cb", characters, i)

		PlayFabClientApi.ExecuteCloudScript(request, fix_career_data_request_cb)
	elseif i < #characters then
		print("Requesting character data for index", i + 1, #characters)
		self:_request_character_readonly_data(characters, i + 1)
	end
end

PlayFabMirror.fix_career_data_request_cb = function (self, characters, i, result)
	self._num_items_to_load = self._num_items_to_load - 1
	local function_result = result.FunctionResult
	local character_id = function_result.character_id
	local career_name = self._career_lookup[character_id]
	local career_data = self._career_data[career_name]
	local career_data_mirror = self._career_data_mirror[career_name]
	local updated_data = function_result.updated_data

	for key, value in pairs(updated_data) do
		career_data[key] = value
		career_data_mirror[key] = value
	end

	if i < #characters then
		print("Requesting character data for index", i + 1, #characters)
		self:_request_character_readonly_data(characters, i + 1)
	end
end

local hero_slots_to_verify_if_they_exist = {
	"slot_ranged",
	"slot_melee",
	"slot_hat",
	"slot_skin",
	"slot_necklace",
	"slot_trinket_1",
	"slot_ring",
	"slot_frame"
}
local dark_pact_slots_to_verify_exist = {
	"slot_melee",
	"slot_skin",
	"slot_frame"
}

PlayFabMirror._set_inital_career_data = function (self, career_name, character_data)
	local career_data = self._career_data[career_name]
	local career_data_mirror = self._career_data_mirror[career_name]
	local broken_slots = {}
	local loadout = character_data

	table.clear(career_data)
	table.clear(career_data_mirror)

	local slots_to_verify = nil

	if career_name:find("^vs_.*") ~= nil then
		slots_to_verify = dark_pact_slots_to_verify_exist
	else
		slots_to_verify = hero_slots_to_verify_if_they_exist
	end

	for i = 1, #slots_to_verify, 1 do
		local slot_name = slots_to_verify[i]
		local slot_data = loadout[slot_name]
		local slot_item_value = (type(slot_data) == "table" and slot_data.Value) or slot_data

		if not slot_item_value then
			broken_slots[slot_name] = true
		else
			local item = self._inventory_items[slot_item_value]

			if not item then
				broken_slots[slot_name] = true
			end
		end
	end

	self:_verify_items_are_usable(broken_slots, loadout, career_name, slots_to_verify)

	for key, data in pairs(loadout) do
		local value = (type(data) == "table" and data.Value) or data
		career_data[key] = value
		career_data_mirror[key] = value
	end

	if table.size(broken_slots) > 0 then
		return broken_slots
	end
end

local slots_to_verify_by_item_data = {
	"slot_ranged",
	"slot_melee",
	"slot_hat",
	"slot_skin",
	"slot_frame",
	"slot_necklace",
	"slot_trinket_1",
	"slot_ring"
}
local slot_mapping = {
	melee = "slot_melee",
	frame = "slot_frame",
	hat = "slot_hat",
	trinket = "slot_trinket_1",
	ranged = "slot_ranged",
	skin = "slot_skin",
	necklace = "slot_necklace",
	ring = "slot_ring"
}

PlayFabMirror._verify_items_are_usable = function (self, broken_slots, character_data, career_name, slots_to_verify)
	local career_settings = CareerSettings[career_name]
	local item_slot_types_by_slot_name = career_settings.item_slot_types_by_slot_name

	for i = 1, #slots_to_verify, 1 do
		local slot_name = slots_to_verify[i]

		if not broken_slots[slot_name] then
			local slot_data = character_data[slot_name]
			local value = (type(slot_data) == "table" and slot_data.Value) or slot_data

			if value then
				local item = self._inventory_items[value]
				local item_data = item.data
				local can_wield = item_data.can_wield

				if not table.contains(can_wield, career_name) then
					broken_slots[slot_name] = true
				end

				local accepted_slot_types = item_slot_types_by_slot_name[slot_name]
				local item_slot_type = item_data.slot_type
				local item_rarity = item_data.rarity

				if not table.contains(accepted_slot_types, item_slot_type) or item_rarity == "magic" then
					broken_slots[slot_name] = true
				end
			end
		end
	end
end

PlayFabMirror._update_data = function (self, item, backend_id)
	local custom_data = item.CustomData

	if custom_data then
		local properites_string = custom_data.properties

		if properites_string then
			item.properties = cjson.decode(properites_string)
		end

		local traits_string = custom_data.traits

		if traits_string then
			item.traits = cjson.decode(traits_string)
		end

		local power_level = custom_data.power_level

		if power_level then
			item.power_level = tonumber(power_level)
		end

		local rarity = custom_data.rarity

		if rarity then
			item.rarity = rarity
		end

		local skin = custom_data.skin

		if skin then
			item.skin = skin
		end

		local level_key = custom_data.level_key

		if level_key then
			item.level_key = level_key
		end

		local difficulty = custom_data.difficulty

		if difficulty then
			item.difficulty = difficulty
		end

		local magic_level = custom_data.magic_level

		if magic_level then
			item.magic_level = tonumber(magic_level)
		end
	end

	local item_key = item.ItemId
	local data = ItemMasterList[item_key]

	if not item.rarity then
		item.rarity = data.rarity
	end

	item.backend_id = backend_id
	item.key = item_key
	item.data = data
end

PlayFabMirror.ready = function (self)
	return self._inventory_items and self._num_items_to_load == 0
end

PlayFabMirror.update = function (self, dt)
	local error_code, request_id = nil

	if self._request_queue_error then
		return
	else
		error_code, request_id = self._request_queue:update(dt)
	end

	if error_code then
		self._request_queue_error = error_code

		if error_code == "request_timed_out" then
			Managers.backend:request_timeout()
		end

		return
	end

	if self._commit_current_id then
		self:_check_current_commit()
	end

	local queued_commit = self._queued_commit

	if queued_commit.active then
		queued_commit.timer = queued_commit.timer - dt

		if queued_commit.timer <= 0 and not self._commit_current_id and not Managers.account:user_detached() then
			self:_commit_internal(queued_commit.id)
		end
	end

	self._commit_limit_timer = self._commit_limit_timer - dt

	if self._commit_limit_timer <= 0 then
		self._commit_limit_timer = REDUCTION_INTERVAL
		self._commit_limit_total = math.max(self._commit_limit_total - 1, 1)
	end
end

PlayFabMirror._check_current_commit = function (self)
	local status = self:_commit_status()

	if status ~= "waiting" then
		local commit_current_id = self._commit_current_id
		local commit_data = self._commits[commit_current_id]

		print("commit result", status, commit_current_id)

		self._commit_current_id = nil

		if status == "commit_error" then
			self._commit_error = true
		else
			local backend_manager = Managers.backend

			backend_manager:dirtify_interfaces()
		end

		if commit_data.commit_complete_callback then
			commit_data.commit_complete_callback(status)
		end

		self._commits[commit_current_id] = nil
	end
end

PlayFabMirror._commit_status = function (self)
	local commit_current_id = self._commit_current_id

	fassert(commit_current_id, "Querying status for commit_current_id %s", tostring(commit_current_id))

	local commit_data = self._commits[commit_current_id]

	fassert(commit_data, "No commit with id %d", commit_current_id)

	if commit_data.status == "commit_error" then
		return "commit_error"
	elseif commit_data.num_updates == commit_data.updates_to_make and not commit_data.wait_for_stats and not commit_data.wait_for_weave_user_data and not commit_data.wait_for_keep_decorations and not commit_data.wait_for_user_data and not commit_data.wait_for_read_only_data then
		if PLATFORM ~= "win32" and not Managers.account:offline_mode() then
			PlayfabBackendSaveDataUtils.store_online_data(self)
		end

		return "success"
	end

	return commit_data.status
end

PlayFabMirror.request_queue = function (self)
	return self._request_queue
end

PlayFabMirror.get_playfab_id = function (self)
	return self._playfab_id
end

PlayFabMirror.get_character_data = function (self, career_name, key)
	local career_data = self._career_data

	if career_data[career_name] ~= nil then
		return self._career_data[career_name][key]
	end

	return nil
end

PlayFabMirror.set_character_data = function (self, career_name, key, value)
	local career_data = self._career_data[career_name]
	career_data[key] = value
end

PlayFabMirror.update_career_data = function (self, career_name, key, value)
	local career_data = self._career_data[career_name]
	local career_data_mirror = self._career_data_mirror[career_name]
	career_data[key] = value
	career_data_mirror[key] = value
end

PlayFabMirror.get_title_data = function (self)
	return self._title_data
end

PlayFabMirror.set_title_data = function (self, key, value)
	if tonumber(value) then
		value = tonumber(value)
	end

	self._title_data[key] = value
end

PlayFabMirror.get_user_data = function (self)
	return self._user_data
end

PlayFabMirror.set_user_data = function (self, key, value)
	self._user_data[key] = value
end

PlayFabMirror._commit_user_data = function (self, new_data, commit, commit_id)
	table.clear(new_data)

	for key, value in pairs(self._user_data) do
		if self._user_data_mirror[key] ~= value then
			new_data[key] = value
		end
	end

	if not table.is_empty(new_data) then
		local user_data_request = {
			Data = new_data
		}
		self._user_data_mirror = table.clone(self._user_data)
		local cb_user_data = callback(self, "update_user_data_cb", commit_id)

		PlayFabClientApi.UpdateUserData(user_data_request, cb_user_data)

		commit.status = "waiting"
		commit.wait_for_user_data = true
	end
end

PlayFabMirror.update_user_data_cb = function (self, commit_id, result)
	local commit = self._commits[commit_id]
	commit.wait_for_user_data = false
end

PlayFabMirror.get_read_only_data = function (self)
	return self._read_only_data
end

PlayFabMirror.set_read_only_data = function (self, key, value, set_mirror)
	self._read_only_data[key] = value

	if set_mirror then
		self._read_only_data_mirror[key] = value
	end
end

PlayFabMirror.set_career_read_only_data = function (self, character, key, value, career, set_mirror)
	local characters_data = self._vs_characters_data
	local data = (career and characters_data[character][career]) or characters_data[character]
	data[key] = value

	if set_mirror then
		self._read_only_data_mirror = characters_data
	end

	self:set_read_only_data("vs_characters_data", cjson.encode(characters_data))
end

PlayFabMirror.get_all_inventory_items = function (self)
	return self._inventory_items
end

PlayFabMirror.get_all_fake_inventory_items = function (self)
	return self._fake_inventory_items
end

PlayFabMirror.get_stats = function (self)
	return self._stats
end

PlayFabMirror.set_stats = function (self, stats)
	self._stats = stats
end

PlayFabMirror.get_claimed_achievements = function (self)
	return self._claimed_achievements
end

PlayFabMirror.get_achievement_rewards = function (self)
	return self._achievement_rewards
end

PlayFabMirror.get_weaves_progression_settings = function (self)
	return self._weaves_progression_settings
end

PlayFabMirror.get_unlocked_weapon_skins = function (self)
	return self._unlocked_weapon_skins
end

PlayFabMirror.get_unlocked_keep_decorations = function (self)
	return self._unlocked_keep_decorations
end

PlayFabMirror.add_keep_decoration = function (self, decoration_name)
	self._unlocked_keep_decorations[#self._unlocked_keep_decorations + 1] = decoration_name

	ItemHelper.mark_keep_decoration_as_new(decoration_name)
end

local new_fake_inventory_items = {}

PlayFabMirror._create_fake_inventory_items = function (self, unlocked_weapon_skins)
	table.clear(new_fake_inventory_items)

	for skin_name, unlocked in pairs(unlocked_weapon_skins) do
		local item_key, rarity = WeaponSkins.matching_weapon_skin_item_key(skin_name)

		if item_key and rarity then
			if rarity == "bogenhafen" then
				rarity = "unique"
			end

			local fake_item = {
				ItemId = item_key,
				ItemInstanceId = guid(),
				CustomData = {
					skin = skin_name,
					rarity = rarity
				}
			}

			table.insert(new_fake_inventory_items, fake_item)
		end
	end

	for i = 1, #new_fake_inventory_items, 1 do
		local fake_item = new_fake_inventory_items[i]
		local backend_id = fake_item.ItemInstanceId

		self:_update_data(fake_item, backend_id)

		self._inventory_items[backend_id] = fake_item
		self._fake_inventory_items[backend_id] = fake_item
	end
end

PlayFabMirror.set_achievement_claimed = function (self, achievement_id)
	local claimed_achievements = self._claimed_achievements
	claimed_achievements[achievement_id] = true
end

PlayFabMirror.get_claimed_console_dlc_rewards = function (self)
	return self._claimed_console_dlc_rewards
end

PlayFabMirror.set_console_dlc_reward_claimed = function (self, reward_id, claimed)
	local claimed_rewards = self._claimed_console_dlc_rewards
	claimed_rewards[reward_id] = (claimed and true) or nil
end

PlayFabMirror.get_quest_data = function (self)
	return self._quest_data
end

PlayFabMirror.set_quest_data = function (self, key, value)
	local quest_data = self._quest_data
	quest_data[key] = value
end

PlayFabMirror.check_for_errors = function (self)
	return
end

local slot_type_to_best_power_level_key = {
	ranged = "best_ranged_pl",
	ring = "best_ring_pl",
	necklace = "best_necklace_pl",
	trinket = "best_trinket_pl",
	melee = "best_melee_pl"
}

PlayFabMirror._re_evaluate_best_power_level = function (self, item)
	local item_power_level = item.power_level

	if not item_power_level then
		return
	end

	local slot_type = item.data.slot_type
	local power_level_key = slot_type_to_best_power_level_key[slot_type]

	if not power_level_key then
		return
	end

	local best_power_levels = self._best_power_levels
	local current_best = best_power_levels[power_level_key]

	if current_best < item_power_level then
		best_power_levels[power_level_key] = item_power_level
		local sum = 0

		for _, value in pairs(best_power_levels) do
			sum = sum + value
		end

		self.sum_best_power_levels = sum
	end
end

PlayFabMirror.add_item = function (self, backend_id, item)
	local inventory_items = self._inventory_items
	local skin_data = WeaponSkins.skins[item.ItemId]

	if skin_data then
		self:add_unlocked_weapon_skin(item.ItemId)
	else
		inventory_items[backend_id] = item

		self:_update_data(item, backend_id)
		ItemHelper.mark_backend_id_as_new(backend_id)
		self:_re_evaluate_best_power_level(item)
		ItemHelper.on_inventory_item_added(item)
	end
end

PlayFabMirror.remove_item = function (self, backend_id)
	local inventory_items = self._inventory_items
	inventory_items[backend_id] = nil
end

PlayFabMirror.update_item_field = function (self, backend_id, field, value)
	local inventory_items = self._inventory_items
	local item = inventory_items[backend_id]

	fassert(item[field], "Trying to update a field on an item in playfab_mirror.lua that does not exist on the item")

	item[field] = value
end

PlayFabMirror.update_item = function (self, backend_id, new_item)
	local inventory_items = self._inventory_items

	fassert(inventory_items[backend_id], "Trying to update an item that does not exist with backend ID %s", backend_id)

	inventory_items[backend_id] = new_item
	local item = inventory_items[backend_id]

	self:_update_data(item, backend_id)
end

PlayFabMirror.add_unlocked_weapon_skin = function (self, weapon_skin)
	if self._unlocked_weapon_skins then
		self._unlocked_weapon_skins[weapon_skin] = true

		self:_create_fake_inventory_items({
			[weapon_skin] = true
		})
	end
end

PlayFabMirror.set_essence = function (self, amount)
	self._essence = amount
end

PlayFabMirror.get_essence = function (self)
	return self._essence
end

PlayFabMirror.set_total_essence = function (self, amount)
	self._total_essence = amount
end

PlayFabMirror.get_total_essence = function (self)
	return self._total_essence
end

PlayFabMirror.set_maximum_essence = function (self, amount)
	self._maximum_essence = amount
end

PlayFabMirror.get_maximum_essence = function (self)
	return self._maximum_essence
end

PlayFabMirror.commit = function (self, skip_queue, commit_complete_callback)
	local queued_commit = self._queued_commit
	local id = nil

	if skip_queue and not self._commit_current_id then
		if queued_commit.active then
			local id = queued_commit.id

			print("FORCE COMMIT", id)
			self:_commit_internal(id, commit_complete_callback)
		else
			id = self:_commit_internal(nil, commit_complete_callback)
		end
	elseif not queued_commit.active then
		id = self:_queue_commit()
	end

	if id then
		self._commit_limit_total = self._commit_limit_total + 1
	end

	return id or queued_commit.id
end

PlayFabMirror._new_id = function (self)
	self._last_id = self._last_id + 1

	return self._last_id
end

PlayFabMirror._queue_commit = function (self)
	local queued_commit = self._queued_commit
	local timer = self._commit_limit_total * DELAY_MULTIPLIER
	local id = self:_new_id()
	queued_commit.timer = timer
	queued_commit.id = id
	queued_commit.active = true

	return id
end

local new_data = {}
local keys_to_remove = {}
local keys = {
	"slot_ranged",
	"slot_melee",
	"slot_skin",
	"slot_hat",
	"slot_necklace",
	"slot_ring",
	"slot_trinket_1",
	"slot_frame",
	"talents"
}
local hero_attributes = {
	"witch_hunter_career",
	"bright_wizard_career",
	"dwarf_ranger_career",
	"wood_elf_career",
	"empire_soldier_career"
}
local num_updates_per_request = 5
local num_requests = math.ceil(#keys / num_updates_per_request)

PlayFabMirror._check_career_data = function (self, careers_data, career_data_mirror)
	local characters_data = self._vs_characters_data
	local characters_data_mirror = self._vs_characters_data_mirror
	local dirty = false

	for name, data in pairs(characters_data) do
		for name_mirror, data_mirror in pairs(characters_data_mirror) do
			if name == name_mirror then
				dirty = not table.compare(data, data_mirror, {
					"careers"
				})

				break
			end
		end

		if dirty then
			break
		end
	end

	for career_name, career_data in pairs(careers_data) do
		local career_id = self._career_lookup[career_name]
		local mirror_data = career_data_mirror[career_name]

		for _, loadout_key in pairs(keys) do
			local loadout_value = career_data[loadout_key]
			local mirror_loadout_value = mirror_data[loadout_key]

			if loadout_value ~= mirror_loadout_value then
				for _, data in pairs(characters_data) do
					if data.careers[career_name] then
						data.careers[career_name][loadout_key] = loadout_value

						break
					end
				end

				dirty = true
			end
		end
	end

	return dirty, characters_data
end

PlayFabMirror._check_careers_dirty_adventure = function (self, commit, commit_id)
	local career_data_mirror = self._career_data_mirror
	local update_character_data_request = {
		FunctionName = "updateCharacterData",
		FunctionParameter = {}
	}

	for career_name, data in pairs(self._career_data) do
		local mirror_data = career_data_mirror[career_name]

		for i = 1, num_requests, 1 do
			table.clear(new_data)
			table.clear(keys_to_remove)

			local dirty = false
			local starting_index = (i - 1) * num_updates_per_request + 1
			local ending_index = starting_index + num_updates_per_request - 1

			for j = starting_index, ending_index, 1 do
				local key = keys[j]

				if key then
					local value = data[key]
					local mirror_value = mirror_data[key]

					if value ~= mirror_value then
						dirty = true

						if value then
							new_data[key] = value
						else
							keys_to_remove[#keys_to_remove + 1] = key
						end
					end
				end
			end

			if dirty then
				local function_params = update_character_data_request.FunctionParameter

				table.clear(function_params)

				function_params.character_id = self._career_lookup[career_name]
				function_params.data = new_data
				function_params.keys_to_remove = keys_to_remove
				function_params.commit_id = commit_id
				function_params.commit_limit_total = self._commit_limit_total
				local success_callback = callback(self, "update_character_data_request_cb")
				local id = self._request_queue:enqueue(update_character_data_request, success_callback, false)
				commit.status = "waiting"
				commit.updates_to_make = commit.updates_to_make + 1
				commit.request_queue_ids[#commit.request_queue_ids + 1] = id
			end
		end
	end
end

PlayFabMirror._check_careers_dirty_versus = function (self, commit, commit_id)
	local dirty, new_career_data = self:_check_career_data(self._career_data, self._career_data_mirror)

	if dirty then
		local update_character_data_request = {
			FunctionName = "versusUpdateCharacterData",
			FunctionParameter = {
				data = cjson.encode(new_career_data),
				commit_id = commit_id
			}
		}
		local success_callback = callback(self, "update_character_data_request_versus_cb")
		local id = self._request_queue:enqueue(update_character_data_request, success_callback, false)
		commit.status = "waiting"
		commit.updates_to_make = commit.updates_to_make + 1
		commit.request_queue_ids[#commit.request_queue_ids + 1] = id
	end
end

PlayFabMirror._commit_internal = function (self, queue_id, commit_complete_callback)
	print("PlayFabMirror:_commit_internal", queue_id)

	local career_data = self._career_data
	local commit_id = queue_id or self:_new_id()
	local commit = {
		num_updates = 0,
		status = "success",
		updates_to_make = 0,
		commit_complete_callback = commit_complete_callback,
		request_queue_ids = {}
	}

	table.clear(self._queued_commit)

	if Managers.mechanism:current_mechanism_name() == "versus" then
		self:_check_careers_dirty_versus(commit, commit_id)
	else
		self:_check_careers_dirty_adventure(commit, commit_id)
	end

	self._commit_current_id = commit_id
	local stats_interface = Managers.backend:get_interface("statistics")
	local game_mode_key = Managers.state and Managers.state.game_mode and Managers.state.game_mode:game_mode_key()

	if game_mode_key == "inn" then
		stats_interface:save()
	end

	local request, stats_to_save = stats_interface:get_stat_save_request()

	if request and not script_data["eac-untrusted"] then
		local success_callback = callback(self, "save_statistics_cb", commit_id, stats_to_save)
		local id = self._request_queue:enqueue(request, success_callback, true)

		stats_interface:clear_saved_stats()

		commit.status = "waiting"
		commit.wait_for_stats = true
		commit.request_queue_ids[#commit.request_queue_ids + 1] = id
	end

	if not script_data["eac-untrusted"] then
		local weaves_interface = Managers.backend:get_interface("weaves")
		local weave_user_data = weaves_interface:get_dirty_user_data()

		if weave_user_data then
			local weave_user_data_request = {
				FunctionName = "updateWeaveUserData",
				FunctionParameter = weave_user_data
			}
			local id = self._request_queue:enqueue(weave_user_data_request, callback(self, "update_weave_user_data_cb", commit_id), true)
			commit.status = "waiting"
			commit.wait_for_weave_user_data = true
			commit.request_queue_ids[#commit.request_queue_ids + 1] = id
		end
	end

	table.clear(new_data)

	local read_only_data_mirror = self._read_only_data_mirror
	local keep_decorations_interface = Managers.backend:get_interface("keep_decorations")
	local keep_decorations_json = keep_decorations_interface:get_keep_decorations_json()

	if keep_decorations_json ~= read_only_data_mirror.keep_decorations then
		new_data.keep_decorations = keep_decorations_json
	end

	for i = 1, #hero_attributes, 1 do
		local key = hero_attributes[i]
		local value = self._read_only_data[key]
		local mirror_value = read_only_data_mirror[key]

		if value ~= mirror_value then
			new_data[key] = value
		end
	end

	if not table.is_empty(new_data) then
		local update_read_only_data_request = {
			FunctionName = "updateHeroAttributes",
			FunctionParameter = {
				hero_attributes = new_data
			}
		}
		local success_callback = callback(self, "update_read_only_data_request_cb", commit_id)
		local id = self._request_queue:enqueue(update_read_only_data_request, success_callback, false)
		commit.status = "waiting"
		commit.wait_for_read_only_data = true
		commit.request_queue_ids[#commit.request_queue_ids + 1] = id
	end

	self:_commit_user_data(new_data, commit, commit_id)

	self._commits[commit_id] = commit

	return commit_id
end

PlayFabMirror.update_character_data_request_versus_cb = function (self, result)
	local function_result = result.FunctionResult
	local vs_characters_data = cjson.decode(function_result.characters_data)
	local career_data_mirror = self._career_data_mirror
	self._vs_characters_data_mirror = vs_characters_data

	table.clear(career_data_mirror)

	for character_name, character_data in pairs(vs_characters_data) do
		for career_name, career_data in pairs(character_data.careers) do
			career_data_mirror[career_name] = career_data
		end
	end

	local commit_id = function_result.CommitId
	local commit = self._commits[commit_id]
	commit.num_updates = commit.num_updates + 1
end

PlayFabMirror.update_character_data_request_cb = function (self, result)
	local function_result = result.FunctionResult
	local get_data_result = function_result.GetDataResult
	local character_id = get_data_result.CharacterId
	local character_data = get_data_result.Data
	local career_name = self._career_lookup[character_id]
	local career_data_mirror = self._career_data_mirror[career_name]

	table.clear(career_data_mirror)

	for key, data in pairs(character_data) do
		local value = data.Value
		career_data_mirror[key] = value
	end

	local commit_id = function_result.CommitId
	local commit = self._commits[commit_id]
	commit.num_updates = commit.num_updates + 1
end

PlayFabMirror.update_read_only_data_request_cb = function (self, commit_id, result)
	local commit = self._commits[commit_id]
	local function_result = result.FunctionResult
	local hero_attributes = function_result.hero_attributes
	local read_only_data_mirror = self._read_only_data_mirror

	for key, new_value in pairs(hero_attributes) do
		local value = new_value

		if tonumber(value) then
			value = tonumber(value)
		end

		read_only_data_mirror[key] = value
	end

	commit.wait_for_read_only_data = false
end

PlayFabMirror.save_statistics_cb = function (self, commit_id, stats, result)
	local commit = self._commits[commit_id]
	local stats_interface = Managers.backend:get_interface("statistics")

	stats_interface:clear_dirty_flags(stats)

	commit.wait_for_stats = false
end

PlayFabMirror.update_weave_user_data_cb = function (self, commit_id, result)
	local commit = self._commits[commit_id]
	commit.wait_for_weave_user_data = false
	local weaves_interface = Managers.backend:get_interface("weaves")

	weaves_interface:clear_dirty_user_data()

	local function_result = result.FunctionResult
	local new_read_only_data = function_result.new_read_only_data

	if new_read_only_data then
		for key, value in pairs(new_read_only_data) do
			self:set_read_only_data(key, value, true)
		end
	end
end

PlayFabMirror.save_keep_decorations_cb = function (self, commit_id, on_complete, success)
	local commit = self._commits[commit_id]
	commit.wait_for_keep_decorations = false
end

PlayFabMirror.wait_for_shutdown = function (self, duration)
	return
end

PlayFabMirror.destroy = function (self)
	return
end

PlayFabMirror._get_eac_response = function (self, challenge)
	local i = 0
	local str = ""

	while challenge[tostring(i)] do
		str = str .. string.char(challenge[tostring(i)])
		i = i + 1
	end

	local eac_response = EAC.challenge_response(str)
	local response = nil

	if eac_response then
		local index = 1
		response = {}

		while string.byte(eac_response, index, index) do
			local byte_value = string.byte(eac_response, index, index)
			response[tostring(index - 1)] = byte_value
			index = index + 1
		end
	end

	return eac_response, response
end

return
