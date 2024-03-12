-- chunkname: @scripts/managers/backend_playfab/playfab_mirror_base.lua

require("scripts/managers/backend_playfab/playfab_request_queue")
require("scripts/helpers/weave_utils")

local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
local CAREER_ID_LOOKUP = {
	"dr_ranger",
	"dr_slayer",
	"dr_ironbreaker",
	"dr_engineer",
	"we_waywatcher",
	"we_shade",
	"we_maidenguard",
	"es_huntsman",
	"es_mercenary",
	"es_knight",
	"es_questingknight",
	"bw_adept",
	"bw_scholar",
	"bw_unchained",
	"wh_captain",
	"wh_bountyhunter",
	"wh_zealot",
	"we_thornsister",
	"wh_priest",
	"bw_necromancer",
}
local ALLOWED_DATA_TYPES = {
	boolean = true,
	number = true,
	string = true,
}
local REDUCTION_INTERVAL = 80
local DELAY_MULTIPLIER = 5
local guid = IS_PS4 and math.uuid or Application.guid

PlayFabMirrorBase = class(PlayFabMirrorBase)

local function debug_printf(format, ...)
	printf("[PlayFabMirrorBase] " .. format, ...)
end

local function assert_or_print_exception(condition, format, ...)
	if not condition then
		Crashify.print_exception("PlayFabMirrorBase", format, ...)
	end
end

PlayFabMirrorBase.init = function (self, signin_result)
	self._num_items_to_load = 0
	self._stats = {}
	self._unlocked_dlcs = {}
	self._commits = {}
	self._commit_current_id = nil
	self._last_id = 0
	self._queued_commit = {}
	self._request_queue = PlayFabRequestQueue:new()
	self._quest_data = {}
	self._fake_inventory_items = {}
	self._unlocked_cosmetics = {}
	self._best_power_levels = nil
	self.sum_best_power_levels = nil
	self._belakor_data_loaded = false
	self._playfab_id = signin_result.PlayFabId

	local info_result_payload = signin_result.InfoResultPayload
	local read_only_data = info_result_payload.UserReadOnlyData or {}
	local read_only_data_values = {}

	for key, data in pairs(read_only_data) do
		local value = data.Value
		local value_type = type(value)

		assert_or_print_exception(ALLOWED_DATA_TYPES[value_type], "Tried to set initial read_only_data's '%s'. Got value '%s' ('%s')", key, tostring(value), value_type)

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
			elseif value == "true" or value == "false" then
				value = to_boolean(value)
			end

			user_data_values[key] = value
		end
	end

	self._user_data = user_data_values
	self._user_data_mirror = table.clone(self._user_data)
	self._commit_limit_timer = REDUCTION_INTERVAL
	self._commit_limit_total = 1

	self:_verify_account_data()
end

PlayFabMirrorBase._parse_claimed_achievements = function (self)
	local split_achievements_string = {}
	local claimed_achievements = {}
	local claimed_achievements_string = self:get_read_only_data("claimed_achievements")

	if claimed_achievements_string then
		split_achievements_string = string.split(claimed_achievements_string, ",")
	end

	for i = 1, #split_achievements_string do
		local value = split_achievements_string[i]

		claimed_achievements[value] = true
	end

	return claimed_achievements
end

PlayFabMirrorBase._parse_claimed_event_quests = function (self)
	local claimed_event_quests = {}
	local claimed_string = self:get_read_only_data("claimed_event_quests")

	if claimed_string then
		local split_string = string.split(claimed_string, ",")

		for i = 1, #split_string do
			claimed_event_quests[split_string[i]] = true
		end
	end

	return claimed_event_quests
end

PlayFabMirrorBase._parse_unlocked_weapon_skins = function (self)
	local unlocked_weapon_skins = {}
	local unlocked_weapon_skins_string = self:get_read_only_data("unlocked_weapon_skins")
	local unlock_manager = Managers.unlock
	local existing_weapon_skins = self._unlocked_weapon_skins or {}

	if unlocked_weapon_skins_string then
		local decoded = cjson.decode(unlocked_weapon_skins_string)

		if decoded then
			for i = 1, #decoded do
				local skin_name = decoded[i]
				local item_data = rawget(ItemMasterList, skin_name)
				local required_dlc = item_data and item_data.required_dlc

				if not required_dlc then
					unlocked_weapon_skins[skin_name] = existing_weapon_skins[skin_name] or true
				elseif not unlock_manager:dlc_exists(required_dlc) then
					assert_or_print_exception(false, "Tried to check if unexisting DLC was unlocked %s", required_dlc)

					unlocked_weapon_skins[skin_name] = true
				elseif unlock_manager:is_dlc_unlocked(required_dlc) then
					unlocked_weapon_skins[skin_name] = true
				end
			end
		else
			assert_or_print_exception(false, "Failed to decode unlocked_weapon_skins_string %s", unlocked_weapon_skins_string)
		end
	end

	return unlocked_weapon_skins
end

PlayFabMirrorBase._parse_unlocked_cosmetics = function (self, unlocked_cosmetics_string)
	unlocked_cosmetics_string = unlocked_cosmetics_string or self:get_read_only_data("unlocked_cosmetics")

	local unlocked_cosmetics = {}
	local unlock_manager = Managers.unlock
	local existing_cosmetics = self._unlocked_cosmetics or {}

	if unlocked_cosmetics_string then
		local decoded = cjson.decode(unlocked_cosmetics_string)

		if decoded then
			for _, cosmetics in pairs(decoded) do
				for i = 1, #cosmetics do
					local cosmetic_name = cosmetics[i]
					local item_data = rawget(ItemMasterList, cosmetic_name)
					local required_dlc = item_data and item_data.required_dlc

					if not required_dlc then
						unlocked_cosmetics[cosmetic_name] = existing_cosmetics[cosmetic_name] or true
					elseif not unlock_manager:dlc_exists(required_dlc) then
						assert_or_print_exception(false, "Tried to check if unexisting DLC was unlocked %s", required_dlc)

						unlocked_cosmetics[cosmetic_name] = true
					elseif unlock_manager:is_dlc_unlocked(required_dlc) then
						unlocked_cosmetics[cosmetic_name] = true
					end
				end
			end
		else
			assert_or_print_exception(false, "Failed to decode unlocked_cosmetics_string %s", unlocked_cosmetics_string)
		end
	end

	return unlocked_cosmetics
end

PlayFabMirrorBase._parse_claimed_console_dlc_rewards = function (self)
	local claimed_rewards = {}
	local claimed_rewards_string = self:get_read_only_data("claimed_console_dlc_rewards")

	if claimed_rewards_string then
		local claimed_rewards_table = cjson.decode(claimed_rewards_string)

		for reward_id, _ in pairs(claimed_rewards_table) do
			claimed_rewards[reward_id] = true
		end
	end

	return claimed_rewards
end

PlayFabMirrorBase._verify_account_data = function (self)
	if DEDICATED_SERVER then
		return
	end

	local request = {
		FunctionName = "verifyAccountData",
	}
	local success_callback = callback(self, "verify_account_data_cb")

	self._request_queue:enqueue(request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorBase.verify_account_data_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	self:_migrate_characters()
end

PlayFabMirrorBase._migrate_characters = function (self)
	local characters_data = self:get_read_only_data("characters_data")

	if not characters_data or characters_data == "{}" or characters_data == "" or type(characters_data) == "table" and table.is_empty(characters_data) then
		local request = {
			FunctionName = "migrateCharacters",
			FunctionParameter = {},
		}
		local success_callback = callback(self, "migrate_characters_cb")

		self._request_queue:enqueue(request, success_callback)

		self._num_items_to_load = self._num_items_to_load + 1

		return
	end

	self:_migrate_cosmetics()
end

PlayFabMirrorBase.migrate_characters_cb = function (self, result)
	local function_result = result.FunctionResult
	local success = function_result.success
	local characters_data = function_result.characters_data

	if characters_data then
		self:set_read_only_data("characters_data", characters_data, true)
	end

	self._num_items_to_load = self._num_items_to_load - 1

	self:_migrate_cosmetics()
end

PlayFabMirrorBase._migrate_cosmetics = function (self)
	if DEDICATED_SERVER then
		return
	end

	local request = {
		FunctionName = "migrateCosmetics",
	}
	local success_callback = callback(self, "migrate_cosmetics_request_cb")

	self._request_queue:enqueue(request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorBase.migrate_cosmetics_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	local data = result.FunctionResult
	local unlocked_cosmetics = data.unlocked_cosmetics
	local characters_data = data.characters_data

	if unlocked_cosmetics then
		self:set_read_only_data("unlocked_cosmetics", unlocked_cosmetics, true)
	end

	if characters_data then
		self:set_read_only_data("characters_data", characters_data, true)
	end

	self:_update_dlc_ownership()
end

PlayFabMirrorBase._update_dlc_ownership = function (self)
	if DEDICATED_SERVER then
		return
	end

	local unlock_manager = Managers.unlock
	local installed_dlcs = unlock_manager:get_installed_dlcs()
	local json_string = cjson.encode(installed_dlcs)
	local request = {
		FunctionName = "updateDLCOwnership",
		FunctionParameter = {
			installed_dlcs = json_string,
		},
	}
	local success_callback = callback(self, "dlc_ownership_request_cb")

	self._request_queue:enqueue(request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
	self._unlocked_dlcs = installed_dlcs
end

PlayFabMirrorBase.dlc_unlocked_at_signin = function (self, dlc_name)
	return table.find(self._unlocked_dlcs, dlc_name) ~= false
end

PlayFabMirrorBase.dlc_ownership_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	local function_result = result.FunctionResult
	local owned_dlcs = function_result.owned_dlcs
	local platform_dlcs = function_result.platform_dlcs
	local excluded_dlcs = function_result.excluded_dlcs
	local new_dlcs = function_result.new_dlcs
	local revoked_dlcs = function_result.revoked_dlcs

	self._owned_dlcs = owned_dlcs or {}
	self._platform_dlcs = platform_dlcs

	local unlock_manager = Managers.unlock

	unlock_manager:set_excluded_dlcs(excluded_dlcs, owned_dlcs)
	self:update_owned_dlcs(false)

	if HAS_STEAM then
		self:handle_new_dlcs(new_dlcs)
	end

	if revoked_dlcs and #revoked_dlcs > 0 then
		local unlocked_keep_decorations = function_result.unlocked_keep_decorations

		if unlocked_keep_decorations then
			self:set_read_only_data("unlocked_keep_decorations", unlocked_keep_decorations, true)
		end

		local unlocked_cosmetics = function_result.unlocked_cosmetics

		if unlocked_cosmetics then
			self:set_read_only_data("unlocked_cosmetics", unlocked_cosmetics, true)
		end

		local unlocked_weapon_skins = function_result.unlocked_weapon_skins

		if unlocked_cosmetics then
			self:set_read_only_data("unlocked_weapon_skins", unlocked_weapon_skins, true)
		end
	end

	self._claimed_achievements = self:_parse_claimed_achievements()
	self._claimed_event_quests = self:_parse_claimed_event_quests()
	self._unlocked_weapon_skins = self:_parse_unlocked_weapon_skins()
	self._unlocked_cosmetics = self:_parse_unlocked_cosmetics()

	local unlocked_keep_decorations_json = self:get_read_only_data("unlocked_keep_decorations") or "{}"

	self._unlocked_keep_decorations = cjson.decode(unlocked_keep_decorations_json)

	if IS_CONSOLE then
		self._claimed_console_dlc_rewards = self:_parse_claimed_console_dlc_rewards()
	end

	if script_data["eac-untrusted"] then
		self:_request_best_power_levels()
	else
		self:_execute_dlc_specific_logic()
	end
end

PlayFabMirrorBase._execute_dlc_specific_logic = function (self)
	local request = {
		FunctionName = "executeDLCLogic",
		FunctionParameter = {},
	}
	local success_callback = callback(self, "execute_dlc_logic_request_cb")

	self._request_queue:enqueue(request, success_callback, true)

	self._num_items_to_load = self._num_items_to_load + 1
end

local function get_item_from_item_master_list(item_id)
	return ItemMasterList[item_id]
end

PlayFabMirrorBase._sync_unseen_rewards = function (self, new_rewards)
	if not new_rewards then
		return
	end

	local unseen_rewards = self:get_user_data("unseen_rewards")

	unseen_rewards = unseen_rewards and cjson.decode(unseen_rewards) or {}

	for i = 1, #new_rewards do
		local item = new_rewards[i]
		local item_type = item.ItemType
		local item_id = item.ItemId

		if item_type == "keep_decoration_painting" then
			local reward = {
				reward_type = "keep_decoration_painting",
				rewarded_from = item.Data.rewarded_from,
				keep_decoration_name = item_id,
			}

			unseen_rewards[#unseen_rewards + 1] = reward

			self:add_keep_decoration(item_id)
		elseif CosmeticUtils.is_cosmetic_item(item_type) then
			local backend_id = self:add_item(nil, {
				ItemId = item_id,
			})

			if backend_id then
				local reward = {
					reward_type = item_type,
					backend_id = backend_id,
					rewarded_from = item.Data.rewarded_from,
					item_type = item_type,
					item_id = item_id,
				}

				unseen_rewards[#unseen_rewards + 1] = reward
			end
		else
			local data = get_item_from_item_master_list(item_id)
			local custom_data = item.CustomData
			local rewarded_from = custom_data and custom_data.rewarded_from

			if data and rewarded_from then
				if data.bundle then
					local bundled_currencies = data.bundle.BundledVirtualCurrencies

					for currency_type, currency_amount in pairs(bundled_currencies) do
						local reward = {
							reward_type = "currency",
							currency_type = currency_type,
							currency_amount = currency_amount,
							rewarded_from = rewarded_from,
						}

						unseen_rewards[#unseen_rewards + 1] = reward
					end
				else
					local backend_id = item.ItemInstanceId

					if rewarded_from then
						local item_type = data.item_type
						local reward = {
							reward_type = "item",
							backend_id = backend_id,
							rewarded_from = rewarded_from,
							item_type = item_type,
							item_id = item_id,
						}

						unseen_rewards[#unseen_rewards + 1] = reward
					end

					ItemHelper.mark_backend_id_as_new(backend_id, {
						data = data,
					})
				end
			end
		end
	end

	self:set_user_data("unseen_rewards", cjson.encode(unseen_rewards))
end

PlayFabMirrorBase.execute_dlc_logic_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	local function_result = result.FunctionResult

	if function_result then
		local info = function_result.missing_dlc_info

		if info then
			local popup_text = info.presentation_text_localized and Localize(info.presentation_text_localized) or info.presentation_text
			local popup_title = info.presentation_title_localized and Localize(info.presentation_title_localized) or info.presentation_title
			local popup_url_button

			if info.presentation_url_button then
				popup_url_button = {
					text = info.presentation_url_button.text_localized and Localize(info.presentation_url_button.text_localized) or info.presentation_url_button.text,
					url = info.presentation_url_button.url,
				}
			end

			Managers.backend:missing_required_dlc_error(popup_text, popup_title, popup_url_button)

			return
		end

		self:_sync_unseen_rewards(function_result.item_grant_results)
	end

	self:_request_best_power_levels()
end

PlayFabMirrorBase._request_best_power_levels = function (self)
	local request = {
		FunctionName = "bestPowerLevels",
		FunctionParameter = {},
	}
	local success_callback = callback(self, "best_power_levels_request_cb")

	self._request_queue:enqueue(request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorBase.best_power_levels_request_cb = function (self, result)
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

PlayFabMirrorBase._request_signin_reward = function (self)
	local request = {
		FunctionName = "signInRewards",
		FunctionParameter = {},
	}
	local success_callback = callback(self, "sign_in_reward_request_cb")

	self._request_queue:enqueue(request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorBase.sign_in_reward_request_cb = function (self, result)
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

		local unlocked_cosmetics = reward_data.unlocked_cosmetics

		if unlocked_cosmetics then
			for i = 1, #unlocked_cosmetics do
				self:add_item(nil, {
					ItemId = unlocked_cosmetics[i],
				})
			end
		end

		local unlocked_weapon_skins = reward_data.unlocked_weapon_skins

		if unlocked_weapon_skins then
			for i = 1, #unlocked_weapon_skins do
				self:add_unlocked_weapon_skin(unlocked_weapon_skins[i])
			end
		end
	end

	self:_request_quests()
end

PlayFabMirrorBase._request_quests = function (self)
	local request = {
		FunctionName = "getQuests",
		FunctionParameter = {},
	}
	local success_callback = callback(self, "get_quests_cb")

	self._request_queue:enqueue(request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorBase.get_quests_cb = function (self, result)
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

PlayFabMirrorBase._request_fix_inventory_data_1 = function (self)
	local request = {
		FunctionName = "fixInventoryData1",
		FunctionParameter = {},
	}
	local success_callback = callback(self, "fix_inventory_data_1_request_cb")

	self._request_queue:enqueue(request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorBase.fix_inventory_data_1_request_cb = function (self, result)
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
				self._unlocked_weapon_skins = self:_parse_unlocked_weapon_skins()
			elseif key == "unlocked_cosmetics" then
				self._unlocked_cosmetics = self:_parse_unlocked_cosmetics()
			end
		end
	end

	self:_request_fix_inventory_data_2()
end

PlayFabMirrorBase._request_fix_inventory_data_2 = function (self)
	local request = {
		FunctionName = "fixInventoryData2",
		FunctionParameter = {},
	}
	local success_callback = callback(self, "fix_inventory_data_2_request_cb")

	self._request_queue:enqueue(request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorBase.fix_inventory_data_2_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	local function_result = result.FunctionResult
	local new_magic_level = function_result and function_result.new_magic_level

	if new_magic_level then
		local progress_json = self:get_read_only_data("weaves_career_progress")
		local weaves_career_progress = cjson.decode(progress_json)

		for i = 1, #CAREER_ID_LOOKUP do
			local career_name = CAREER_ID_LOOKUP[i]

			if weaves_career_progress[career_name] then
				weaves_career_progress[career_name].magic_level = new_magic_level
			end
		end

		self:set_read_only_data("weaves_career_progress", cjson.encode(weaves_career_progress), true)
	end

	self:_handle_fix_data_ids()
end

PlayFabMirrorBase._handle_fix_data_ids = function (self)
	local request = {
		FunctionName = "handleFixDataIds",
		FunctionParameter = {},
	}
	local success_callback = callback(self, "handle_fix_data_ids_request_cb")

	self._request_queue:enqueue(request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorBase.handle_fix_data_ids_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	local function_result = result.FunctionResult

	if function_result.new_user_read_only_data then
		for key, value in pairs(function_result.new_user_read_only_data) do
			local value_json = cjson.encode(value)

			self:set_read_only_data(key, value_json, true)
		end
	end

	if function_result.new_user_data then
		for key, value in pairs(function_result.new_user_data) do
			local value_json = cjson.encode(value)

			self:set_user_data(key, value_json, true)
		end
	end

	if function_result.new_cosmetics then
		for i = 1, #function_result.new_cosmetics do
			self:add_item(nil, {
				ItemId = function_result.new_cosmetics[i],
			})
		end
	end

	if function_result.new_weapon_skins then
		for i = 1, #function_result.new_weapon_skins do
			local weapon_skin_name = function_result.new_weapon_skins[i]

			self:add_unlocked_weapon_skin(weapon_skin_name)
		end
	end

	if function_result.new_items then
		for i = 1, #function_result.new_items do
			local item = function_result.new_items[i]

			self:add_item(item.ItemInstanceId, item)
		end
	end

	if function_result.removed_items then
		for i = 1, #function_result.removed_items do
			local item = function_result.removed_items[i]

			self:remove_item(item.ItemInstanceId)
		end
	end

	self:_fix_excess_bogenhafen_chests()
end

PlayFabMirrorBase._fix_excess_bogenhafen_chests = function (self)
	local request = {
		FunctionName = "removeExcessBogenhafenChests",
		FunctionParameter = {},
	}
	local success_callback = callback(self, "_fix_excess_bogenhafen_chests_cb")

	self._request_queue:enqueue(request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorBase._fix_excess_bogenhafen_chests_cb = function (self)
	self._num_items_to_load = self._num_items_to_load - 1

	self:_fix_excess_duplicate_bogenhafen_cosmetics()
end

PlayFabMirrorBase._fix_excess_duplicate_bogenhafen_cosmetics = function (self)
	local request = {
		FunctionName = "removeDuplicateBogenhafenCosmetics",
		FunctionParameter = {},
	}
	local success_callback = callback(self, "_fix_excess_duplicate_bogenhafen_cosmetics_cb")

	self._request_queue:enqueue(request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorBase._fix_excess_duplicate_bogenhafen_cosmetics_cb = function (self)
	self._num_items_to_load = self._num_items_to_load - 1

	self:_request_read_only_data()
end

PlayFabMirrorBase._request_read_only_data = function (self)
	local request = {
		FunctionName = "getReadOnlyData",
		FunctionParameter = {},
	}
	local success_callback = callback(self, "read_only_data_request_cb")

	self._request_queue:enqueue(request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorBase.read_only_data_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	local function_result = result.FunctionResult
	local achievement_rewards = function_result.achievement_rewards

	self._achievement_rewards = cjson.decode(achievement_rewards)

	local weaves_progression_settings = function_result.weaves_progression_settings

	self._weaves_progression_settings = weaves_progression_settings and cjson.decode(weaves_progression_settings) or {}

	self:_request_user_data()
end

PlayFabMirrorBase._request_user_data = function (self)
	local request = {}
	local success_callback = callback(self, "user_data_request_cb")

	self._request_queue:enqueue_api_request("GetUserData", request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorBase.user_data_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	for key, data in pairs(result.Data) do
		if key == "unseen_rewards" then
			local new_unseen_rewards = cjson.decode(data.Value)
			local unseen_rewards_string = self:get_user_data("unseen_rewards")
			local existing_unseen_rewards = unseen_rewards_string and cjson.decode(unseen_rewards_string) or {}
			local is_fake_item = ItemHelper.is_fake_item

			for i = 1, #new_unseen_rewards do
				local new_reward = new_unseen_rewards[i]

				if is_fake_item(new_reward.reward_type) then
					if not table.find_by_key(existing_unseen_rewards, "item_id", new_reward.item_id) then
						existing_unseen_rewards[#existing_unseen_rewards + 1] = new_reward
					end
				elseif not table.find_by_key(existing_unseen_rewards, "backend_id", new_reward.backend_id) then
					existing_unseen_rewards[#existing_unseen_rewards + 1] = new_reward
				end
			end

			self:set_user_data(key, cjson.encode(existing_unseen_rewards))
		else
			self:set_user_data(key, data.Value, true)
		end
	end

	self:_request_twitch_app_access_token()
end

PlayFabMirrorBase._request_twitch_app_access_token = function (self)
	local request = {
		FunctionName = "getTwitchAccessToken",
		FunctionParameter = {},
	}
	local success_callback = callback(self, "_request_twitch_app_access_token_cb")

	self._request_queue:enqueue(request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorBase._request_twitch_app_access_token_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1
	self._twitch_app_access_token = false

	local function_result = result.FunctionResult

	if function_result.success then
		self._twitch_app_access_token = function_result.access_token
	end

	self:_weaves_player_setup()
end

PlayFabMirrorBase.get_twitch_app_access_token = function (self)
	return self._twitch_app_access_token
end

PlayFabMirrorBase._weaves_player_setup = function (self)
	local request = {
		FunctionName = "weavesPlayerSetup",
		FunctionParameter = {},
	}
	local success_callback = callback(self, "weaves_player_setup_request_cb")

	self._request_queue:enqueue(request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorBase.weaves_player_setup_request_cb = function (self, result)
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
	self:_fix_total_collected_essence()
end

PlayFabMirrorBase._fix_total_collected_essence = function (self)
	local request = {
		FunctionName = "fixTotalCollectedEssence",
		FunctionParameter = {},
	}
	local success_callback = callback(self, "fix_total_collected_essence_cb")

	self._request_queue:enqueue(request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorBase.fix_total_collected_essence_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	local function_result = result.FunctionResult
	local total_essence = function_result.total_essence

	if total_essence then
		self:set_total_essence(total_essence)
	end

	if DLCSettings.win_tracks then
		self:_request_win_tracks()
	elseif DLCSettings.morris then
		self:_deus_player_setup()
		self:_deus_setup_belakor_data()
	else
		self:_set_up_additional_account_data()
	end
end

PlayFabMirrorBase._request_win_tracks = function (self)
	local request = {
		FunctionName = "winTracksSetup",
		FunctionParameter = {},
	}
	local success_callback = callback(self, "win_tracks_request_cb")

	self._request_queue:enqueue(request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorBase.win_tracks_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	local function_result = result.FunctionResult
	local new_read_only_data = function_result.new_read_only_data

	for key, value in pairs(new_read_only_data) do
		local value_json = cjson.encode(value)

		self:set_read_only_data(key, value_json, true)
	end

	local win_tracks = function_result.win_tracks

	self._win_tracks = win_tracks

	local win_tracks_progress = function_result.new_read_only_data.win_tracks_progress

	self._current_win_track_id = win_tracks_progress.current_win_track_id

	if DLCSettings.morris then
		self:_deus_player_setup()
		self:_deus_setup_belakor_data()
	else
		self:_set_up_additional_account_data()
	end
end

PlayFabMirrorBase.get_win_tracks = function (self)
	return self._win_tracks
end

PlayFabMirrorBase._deus_player_setup = function (self)
	local request = {
		FunctionName = "deusPlayerSetup",
		FunctionParameter = {},
	}
	local success_callback = callback(self, "deus_player_setup_request_cb")

	self._request_queue:enqueue(request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorBase.deus_player_setup_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	self:handle_deus_result(result)
	self:_set_up_additional_account_data()
end

PlayFabMirrorBase.deus_refresh_belakor_data = function (self)
	self:_deus_setup_belakor_data()
end

PlayFabMirrorBase.has_loaded_belakor_data = function (self)
	return self._belakor_data_loaded
end

PlayFabMirrorBase.set_has_loaded_belakor_data = function (self, value)
	self._belakor_data_loaded = value
end

PlayFabMirrorBase._deus_setup_belakor_data = function (self)
	local request = {
		FunctionName = "deusSetBelakorCurse",
		FunctionParameter = {},
	}
	local success_callback = callback(self, "deus_setup_belakor_data_request_cb")

	self._request_queue:enqueue(request, success_callback)

	self._belakor_data_loaded = false
end

PlayFabMirrorBase.deus_setup_belakor_data_request_cb = function (self, result)
	self._belakor_data_loaded = true

	local function_result = result.FunctionResult
	local deus_belakor_curse_data = function_result.deus_belakor_curse_data

	if deus_belakor_curse_data then
		local current_time = Managers.time:time("main")

		self._deus_belakor_curse_data = {
			time_of_update = current_time,
			span = deus_belakor_curse_data.span_ms / 1000,
			remaining_time = deus_belakor_curse_data.remaining_time_ms / 1000,
			cycle_count = deus_belakor_curse_data.cycle_count,
		}
	end
end

PlayFabMirrorBase._set_up_additional_account_data = function (self, steps_completed)
	local request = {
		FunctionName = "additionalAccountDataSetUp",
		FunctionParameter = {
			steps_completed = steps_completed,
		},
	}
	local success_callback = callback(self, "additional_data_setup_request_cb")

	self._request_queue:enqueue(request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorBase.additional_data_setup_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	local function_result = result.FunctionResult
	local new_read_only_data = function_result.new_user_read_only_data
	local new_currencies = function_result.new_currencies

	if new_read_only_data then
		for key, value in pairs(new_read_only_data) do
			self:set_read_only_data(key, value, true)
		end
	end

	if new_currencies then
		if new_currencies.ES then
			self:set_essence(self._essence + new_currencies.ES)
		end

		if new_currencies.SM then
			local peddler_interface = Managers.backend:get_interface("peddler")

			if peddler_interface then
				local current_chips = peddler_interface:get_chips("SM")

				peddler_interface:set_chips("SM", current_chips + new_currencies.SM)
			end
		end
	end

	local steps_completed = function_result.steps_completed

	if steps_completed then
		self:_set_up_additional_account_data(steps_completed)
	else
		self:_request_user_inventory()
	end
end

PlayFabMirrorBase._request_user_inventory = function (self)
	local request = {}
	local success_callback = callback(self, "inventory_request_cb")

	self._request_queue:enqueue_api_request("GetUserInventory", request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorBase.inventory_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	local inventory_items = result.Inventory
	local unlock_manager = Managers.unlock

	if self._inventory_items then
		table.clear(self._inventory_items)
	else
		self._inventory_items = {}
	end

	for i = 1, #inventory_items do
		local item = inventory_items[i]

		if not item.BundleContents then
			if item.ItemId and not rawget(ItemMasterList, item.ItemId) then
				Crashify.print_exception("PlayFabMirrorBase", "ItemMasterList has no item %q", item.ItemId)
			else
				local backend_id = item.ItemInstanceId

				self:_update_data(item, backend_id)

				local filter = false
				local item_type = item.data.item_type

				if item_type == "weapon_skin" or CosmeticUtils.is_cosmetic_item(item_type) then
					filter = true
				end

				local required_dlc = ItemMasterList[item.ItemId].required_dlc

				if required_dlc and not unlock_manager:is_dlc_unlocked(required_dlc) then
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

	local unlocked_cosmetics = self:get_unlocked_cosmetics()

	unlocked_cosmetics = unlocked_cosmetics or {}

	self:_create_fake_inventory_items(unlocked_weapon_skins, "weapon_skins")
	self:_create_fake_inventory_items(unlocked_cosmetics, "cosmetics")

	if HAS_STEAM then
		self:_request_steam_user_inventory()
	else
		self:request_characters()
	end
end

PlayFabMirrorBase._request_steam_user_inventory = function (self)
	debug_printf("steam item server: requesting user inventory")

	self._num_items_to_load = self._num_items_to_load + 1

	local function callback(result, item_list)
		if item_list then
			debug_printf("_request_steam_user_inventory got results")
		else
			debug_printf("_request_steam_user_inventory got no results")
		end

		local request_characters = true
		local skip_mark_as_new = true

		self:_cb_steam_user_inventory(result, item_list, request_characters, skip_mark_as_new)
	end

	Managers.steam:request_user_inventory(callback)
end

PlayFabMirrorBase.delete_playfab_characters_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	self:request_characters()
end

PlayFabMirrorBase.add_steam_items = function (self, item_list)
	local result_success = 1

	self._num_items_to_load = self._num_items_to_load + 1

	local skip_mark_as_new = false

	self:_cb_steam_user_inventory(result_success, item_list, false, skip_mark_as_new)
end

PlayFabMirrorBase._cb_steam_user_inventory = function (self, result, item_list, request_characters, skip_mark_as_new)
	self._num_items_to_load = self._num_items_to_load - 1

	if result == 1 then
		debug_printf("-> retrieval of steam user inventory, SUCCESS")

		for i = 1, #item_list, 4 do
			local steam_itemdefid = item_list[i]
			local steam_backend_unique_id = item_list[i + 1]
			local flags = item_list[i + 2]
			local amount = item_list[i + 3]
			local item_key = SteamitemdefidToMasterList[steam_itemdefid]

			if item_key then
				local backend_id = steam_backend_unique_id
				local steam_item = {
					ItemId = item_key,
					ItemInstanceId = backend_id,
				}

				self:add_item(backend_id, steam_item, true, skip_mark_as_new)
				debug_printf("Steam Item: %q, %q, %q, %q, %q", item_key, steam_itemdefid, steam_backend_unique_id, flags, amount)
			end

			if false then
				-- Nothing
			end
		end
	else
		debug_printf("ERROR could not retrieve get steam user inventory. result-code: %q", result)
	end

	if request_characters then
		self:request_characters()
	end
end

PlayFabMirrorBase._set_inital_career_data = function (self, career_name, character_data, slots_to_verify)
	if not slots_to_verify then
		return
	end

	local career_data = self._career_data[career_name]
	local career_data_mirror = self._career_data_mirror[career_name]
	local broken_slots = {}
	local loadout = character_data

	table.clear(career_data)
	table.clear(career_data_mirror)

	for i = 1, #slots_to_verify do
		local slot_name = slots_to_verify[i]
		local slot_data = loadout[slot_name]
		local slot_item_value = type(slot_data) == "table" and slot_data.Value or slot_data

		if not slot_item_value then
			broken_slots[slot_name] = true
		elseif CosmeticUtils.is_cosmetic_slot(slot_name) then
			local cosmetic = self._unlocked_cosmetics[slot_item_value]

			if not cosmetic then
				broken_slots[slot_name] = true
			end
		else
			local item = self._inventory_items[slot_item_value]

			if not item then
				broken_slots[slot_name] = true
			end
		end
	end

	self:_verify_items_are_usable(broken_slots, loadout, career_name, slots_to_verify)

	for key, data in pairs(loadout) do
		local value = type(data) == "table" and data.Value or data

		career_data[key] = value
		career_data_mirror[key] = value
	end

	if table.size(broken_slots) > 0 then
		return broken_slots
	end
end

PlayFabMirrorBase._verify_items_are_usable = function (self, broken_slots, character_data, career_name, slots_to_verify)
	local career_settings = CareerSettings[career_name]

	if not career_settings then
		debug_printf("Tried to verify items of career that doesn't exist: %q", career_name)

		return
	end

	local item_slot_types_by_slot_name = career_settings.item_slot_types_by_slot_name

	for i = 1, #slots_to_verify do
		local slot_name = slots_to_verify[i]

		if not broken_slots[slot_name] then
			local slot_data = character_data[slot_name]
			local value = type(slot_data) == "table" and slot_data.Value or slot_data

			if value then
				local item = self._inventory_items[value]

				if CosmeticUtils.is_cosmetic_slot(slot_name) then
					local backend_id = self._unlocked_cosmetics[value]

					if backend_id then
						item = self._inventory_items[backend_id]
					end
				end

				if item then
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
				else
					broken_slots[slot_name] = true
				end
			end
		end
	end
end

PlayFabMirrorBase._update_data = function (self, item, backend_id)
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
			item.power_level = WeaveUtils.magic_level_to_power_level(item.magic_level)
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

PlayFabMirrorBase.ready = function (self)
	return self._inventory_items and self._num_items_to_load == 0
end

PlayFabMirrorBase.current_api_call = function (self)
	if not self._request_queue then
		return
	end

	return self._request_queue:current_api_call()
end

PlayFabMirrorBase.update = function (self, dt, t)
	local error_code, request_id

	if self._request_queue_error then
		return
	else
		error_code, request_id = self._request_queue:update(dt, t)
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

		if queued_commit.timer <= 0 and not self._commit_current_id and not Managers.account:user_detached() and LobbyInternal.network_initialized() then
			self:_commit_internal(queued_commit.id, queued_commit.commit_complete_callbacks)
		end
	end

	self._commit_limit_timer = self._commit_limit_timer - dt

	if self._commit_limit_timer <= 0 then
		self._commit_limit_timer = REDUCTION_INTERVAL
		self._commit_limit_total = math.max(self._commit_limit_total - 1, 1)
	end
end

PlayFabMirrorBase._check_current_commit = function (self)
	local status = self:_commit_status()

	if status ~= "waiting" then
		local commit_current_id = self._commit_current_id
		local commit_data = self._commits[commit_current_id]

		debug_printf("commit result %q, %q", status, commit_current_id)

		self._commit_current_id = nil

		if status == "commit_error" then
			self._commit_error = true
		else
			local backend_manager = Managers.backend

			backend_manager:dirtify_interfaces()
		end

		if commit_data.commit_complete_callbacks then
			for i = 1, #commit_data.commit_complete_callbacks do
				commit_data.commit_complete_callbacks[i](status)
			end
		end

		self._commits[commit_current_id] = nil
	end
end

PlayFabMirrorBase._commit_status = function (self)
	local commit_current_id = self._commit_current_id

	fassert(commit_current_id, "Querying status for commit_current_id %s", tostring(commit_current_id))

	local commit_data = self._commits[commit_current_id]

	fassert(commit_data, "No commit with id %d", commit_current_id)

	if commit_data.status == "commit_error" then
		return "commit_error"
	elseif commit_data.num_updates == commit_data.updates_to_make and not commit_data.wait_for_stats and not commit_data.wait_for_weave_user_data and not commit_data.wait_for_keep_decorations and not commit_data.wait_for_user_data and not commit_data.wait_for_read_only_data and not commit_data.wait_for_win_tracks_data and not commit_data.wait_for_gotwf_data then
		if IS_CONSOLE and not Managers.account:offline_mode() then
			PlayfabBackendSaveDataUtils.store_online_data(self)
		end

		return "success"
	end

	return commit_data.status
end

PlayFabMirrorBase.request_queue = function (self)
	return self._request_queue
end

PlayFabMirrorBase.get_playfab_id = function (self)
	return self._playfab_id
end

PlayFabMirrorBase.get_character_data = function (self, career_name, key)
	local career_data = self._career_data

	if career_data[career_name] ~= nil then
		return self._career_data[career_name][key]
	end

	return nil
end

PlayFabMirrorBase.set_character_data = function (self, career_name, key, value, set_mirror)
	local career_data = self._career_data[career_name]

	career_data[key] = value

	if set_mirror then
		self._career_data_mirror[career_name][key] = value
	end

	local character_name = PROFILES_BY_CAREER_NAMES[career_name].display_name

	self:set_career_read_only_data(character_name, key, value, career_name, set_mirror)
end

PlayFabMirrorBase.get_title_data = function (self)
	return self._title_data
end

PlayFabMirrorBase.set_title_data = function (self, key, value)
	if tonumber(value) then
		value = tonumber(value)
	end

	self._title_data[key] = value
end

PlayFabMirrorBase.get_user_data = function (self, key)
	return self._user_data[key]
end

PlayFabMirrorBase.set_user_data = function (self, key, value, set_mirror)
	self._user_data[key] = value

	if set_mirror then
		if type(value) == "table" then
			self._user_data_mirror[key] = table.clone(value)
		else
			self._user_data_mirror[key] = value
		end
	end
end

PlayFabMirrorBase.log_player_exit = function (self, external_cb)
	local request = {
		FunctionName = "logPlayerExit",
		FunctionParameter = {},
	}
	local success_callback = callback(self, "log_player_exit_cb", external_cb)
	local id = self._request_queue:enqueue(request, success_callback, false)
end

PlayFabMirrorBase.log_player_exit_cb = function (self, external_cb, result)
	external_cb(result)
end

PlayFabMirrorBase._commit_user_data = function (self, new_data, commit, commit_id)
	table.clear(new_data)

	for key, value in pairs(self._user_data) do
		if self._user_data_mirror[key] ~= value then
			new_data[key] = value
		end
	end

	if not table.is_empty(new_data) then
		local user_data_request = {
			Data = new_data,
		}

		self._user_data_mirror = table.clone(self._user_data)

		local cb_user_data = callback(self, "update_user_data_cb", commit_id)

		PlayFabClientApi.UpdateUserData(user_data_request, cb_user_data)

		commit.status = "waiting"
		commit.wait_for_user_data = true
	end
end

PlayFabMirrorBase.update_user_data_cb = function (self, commit_id, result)
	local commit = self._commits[commit_id]

	commit.wait_for_user_data = false
end

PlayFabMirrorBase.get_read_only_data = function (self, key)
	local value = self._read_only_data[key]
	local value_type = type(value)

	assert_or_print_exception(value == nil or ALLOWED_DATA_TYPES[value_type], "Tried to get read_only_data's '%s'. Got value '%s' ('%s')", key, tostring(value), value_type)

	return value
end

PlayFabMirrorBase.set_read_only_data = function (self, key, value, set_mirror)
	local value_type = type(value)

	assert_or_print_exception(ALLOWED_DATA_TYPES[value_type], "Tried to set read_only_data's '%s' to value '%s' ('%s')", key, tostring(value), value_type)

	self._read_only_data[key] = value

	if set_mirror then
		if value_type == "table" then
			self._read_only_data_mirror[key] = table.clone(value)
		else
			self._read_only_data_mirror[key] = value
		end
	end
end

PlayFabMirrorBase.merge_read_only_data = function (self, data, set_mirror)
	for key, value in pairs(data) do
		local value_type = type(value)

		assert_or_print_exception(ALLOWED_DATA_TYPES[value_type], "Tried to merge read_only_data's '%s' with value '%s' ('%s')", key, tostring(value), value_type)
	end

	table.merge_recursive(self._read_only_data, data)

	if set_mirror then
		table.merge_recursive(self._read_only_data_mirror, data)
	end
end

PlayFabMirrorBase.get_all_inventory_items = function (self)
	return self._inventory_items
end

PlayFabMirrorBase.get_all_fake_inventory_items = function (self)
	return self._fake_inventory_items
end

PlayFabMirrorBase.get_stats = function (self)
	return self._stats
end

PlayFabMirrorBase.set_stats = function (self, stats)
	self._stats = stats
end

PlayFabMirrorBase.get_claimed_achievements = function (self)
	return self._claimed_achievements
end

PlayFabMirrorBase.get_claimed_event_quests = function (self)
	return self._claimed_event_quests
end

PlayFabMirrorBase.add_claimed_event_quest = function (self, quest_name)
	self._claimed_event_quests[quest_name] = true
end

PlayFabMirrorBase.add_claimed_multiple_event_quests = function (self, quest_names)
	for i = 1, #quest_names do
		local quest_name = quest_names[i]

		self._claimed_event_quests[quest_name] = true
	end
end

PlayFabMirrorBase.get_achievement_rewards = function (self)
	return self._achievement_rewards
end

PlayFabMirrorBase.get_weaves_progression_settings = function (self)
	return self._weaves_progression_settings
end

PlayFabMirrorBase.get_unlocked_weapon_skins = function (self)
	return self._unlocked_weapon_skins
end

PlayFabMirrorBase.get_unlocked_cosmetics = function (self)
	return self._unlocked_cosmetics
end

PlayFabMirrorBase.get_unlocked_keep_decorations = function (self)
	return self._unlocked_keep_decorations
end

PlayFabMirrorBase.get_owned_dlcs = function (self)
	return self._owned_dlcs
end

PlayFabMirrorBase.get_platform_dlcs = function (self)
	return self._platform_dlcs
end

PlayFabMirrorBase.set_owned_dlcs = function (self, owned_dlcs)
	self._owned_dlcs = owned_dlcs
end

PlayFabMirrorBase.set_platform_dlcs = function (self, platform_dlcs)
	self._platform_dlcs = platform_dlcs
end

PlayFabMirrorBase.add_keep_decoration = function (self, decoration_name)
	self._unlocked_keep_decorations[#self._unlocked_keep_decorations + 1] = decoration_name

	ItemHelper.mark_keep_decoration_as_new(decoration_name)
end

local new_fake_inventory_items = {}

PlayFabMirrorBase._create_fake_inventory_items = function (self, fake_inventory_items, items_type)
	table.clear(new_fake_inventory_items)

	local lookup_table

	if items_type == "weapon_skins" then
		lookup_table = self._unlocked_weapon_skins

		local weapon_skins = WeaponSkins

		for skin_name, optional_offline_backend_id in pairs(fake_inventory_items) do
			local item_key, rarity = weapon_skins.matching_weapon_skin_item_key(skin_name)

			if item_key and rawget(ItemMasterList, item_key) then
				if rarity and rarity == "bogenhafen" then
					rarity = "unique"
				end

				new_fake_inventory_items[#new_fake_inventory_items + 1] = {
					ItemId = item_key,
					ItemInstanceId = type(optional_offline_backend_id) == "string" and optional_offline_backend_id or guid(),
					CustomData = {
						skin = skin_name,
						rarity = rarity,
					},
				}
			else
				lookup_table[skin_name] = nil
			end
		end
	elseif items_type == "cosmetics" then
		lookup_table = self._unlocked_cosmetics

		for cosmetic_name, optional_offline_backend_id in pairs(fake_inventory_items) do
			local master_list_item = rawget(ItemMasterList, cosmetic_name)

			if master_list_item then
				local existing_backend_id = lookup_table[cosmetic_name]
				local backend_id, override_id

				if type(existing_backend_id) == "string" then
					backend_id = existing_backend_id
				elseif type(optional_offline_backend_id) == "string" then
					backend_id = optional_offline_backend_id

					if master_list_item.steam_itemdefid ~= nil then
						override_id = backend_id
					end
				else
					backend_id = guid()
				end

				new_fake_inventory_items[#new_fake_inventory_items + 1] = {
					ItemId = cosmetic_name,
					ItemInstanceId = backend_id,
					override_id = override_id,
				}
			else
				lookup_table[cosmetic_name] = nil
			end
		end
	else
		fassert(false, "Invalid items_typs: %q", items_type)
	end

	if not self._inventory_items then
		self._inventory_items = {}
	end

	local new_fake_ids = {}

	for i = 1, #new_fake_inventory_items do
		local fake_item = new_fake_inventory_items[i]
		local backend_id = fake_item.ItemInstanceId
		local id = fake_item.override_id or fake_item.CustomData and fake_item.CustomData.skin or fake_item.ItemId

		lookup_table[id] = backend_id

		self:_update_data(fake_item, backend_id)

		self._inventory_items[backend_id] = fake_item
		self._fake_inventory_items[backend_id] = fake_item
		new_fake_ids[#new_fake_ids + 1] = backend_id
	end

	return new_fake_ids
end

PlayFabMirrorBase.set_achievement_claimed = function (self, achievement_id)
	local claimed_achievements = self._claimed_achievements

	claimed_achievements[achievement_id] = true
end

PlayFabMirrorBase.get_claimed_console_dlc_rewards = function (self)
	return self._claimed_console_dlc_rewards
end

PlayFabMirrorBase.set_console_dlc_reward_claimed = function (self, reward_id, claimed)
	local claimed_rewards = self._claimed_console_dlc_rewards

	claimed_rewards[reward_id] = claimed and true or nil
end

PlayFabMirrorBase.get_quest_data = function (self)
	return self._quest_data
end

PlayFabMirrorBase.set_quest_data = function (self, key, value)
	local quest_data = self._quest_data

	quest_data[key] = value
end

PlayFabMirrorBase.check_for_errors = function (self)
	return
end

local slot_type_to_best_power_level_key = {
	melee = "best_melee_pl",
	necklace = "best_necklace_pl",
	ranged = "best_ranged_pl",
	ring = "best_ring_pl",
	trinket = "best_trinket_pl",
}

PlayFabMirrorBase._re_evaluate_best_power_level = function (self, item)
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

PlayFabMirrorBase._add_new_weapon_skin = function (self, item, generate_new_id, optional_skin_name)
	local fake_item_id
	local skin_name = optional_skin_name or item.ItemId
	local create_new_id = not generate_new_id and Managers.account:offline_mode()

	if create_new_id then
		local ids = self:add_unlocked_weapon_skin(skin_name, item.ItemInstanceId)

		fake_item_id = ids and ids[1]
	else
		local ids = self:add_unlocked_weapon_skin(skin_name)

		fake_item_id = ids and ids[1]
	end

	return fake_item_id
end

PlayFabMirrorBase.add_item = function (self, backend_id, item, skip_autosave, skip_mark_as_new)
	if not self._inventory_items then
		self._inventory_items = {}
	end

	local skin_data = WeaponSkins.skins[item.ItemId]

	if skin_data then
		return self:_add_new_weapon_skin(item)
	else
		local master_list_item = ItemMasterList[item.ItemId]

		if CosmeticUtils.is_cosmetic_item(master_list_item.slot_type) then
			backend_id = self:add_unlocked_cosmetic(item.ItemId, backend_id)

			if not skip_mark_as_new then
				ItemHelper.mark_backend_id_as_new(backend_id, self._inventory_items[backend_id], skip_autosave)
			end

			return backend_id
		end

		self._inventory_items[backend_id] = item

		self:_update_data(item, backend_id)

		if not skip_mark_as_new then
			ItemHelper.mark_backend_id_as_new(backend_id, item, skip_autosave)
		end

		self:_re_evaluate_best_power_level(item)
		ItemHelper.on_inventory_item_added(item)

		local skin_name = item.CustomData and item.CustomData.skin

		if skin_name and WeaponSkins.skins[skin_name] then
			local unlocked_weapon_skins = self:get_unlocked_weapon_skins()

			self:_add_new_weapon_skin(item, true, skin_name)
		end
	end
end

PlayFabMirrorBase.remove_item = function (self, backend_id)
	local inventory_items = self._inventory_items

	if ItemHelper.is_new_backend_id(backend_id) then
		ItemHelper.unmark_backend_id_as_new(backend_id)
	end

	inventory_items[backend_id] = nil
end

PlayFabMirrorBase.update_item_field = function (self, backend_id, field, value)
	local inventory_items = self._inventory_items
	local item = inventory_items[backend_id]

	fassert(item[field], "Trying to update a field on an item in playfab_mirror_base.lua that does not exist on the item")

	item[field] = value
end

PlayFabMirrorBase.update_item = function (self, backend_id, new_item)
	local inventory_items = self._inventory_items

	fassert(inventory_items[backend_id], "Trying to update an item that does not exist with backend ID %s", backend_id)

	inventory_items[backend_id] = new_item

	local item = inventory_items[backend_id]

	self:_update_data(item, backend_id)
end

PlayFabMirrorBase.add_unlocked_weapon_skin = function (self, weapon_skin, offline_backend_id)
	if self._unlocked_weapon_skins then
		local existing_weapon_skin = self._unlocked_weapon_skins[weapon_skin]

		if existing_weapon_skin then
			return {
				existing_weapon_skin,
			}
		end

		self._unlocked_weapon_skins[weapon_skin] = true

		return self:_create_fake_inventory_items({
			[weapon_skin] = offline_backend_id or true,
		}, "weapon_skins")
	else
		assert_or_print_exception(false, "Tried to add_unlocked_weapon_skin '%s' before unlocked_weapon_skins was created", weapon_skin)
	end
end

PlayFabMirrorBase.add_unlocked_cosmetic = function (self, cosmetic_name, offline_backend_id)
	if self._unlocked_cosmetics then
		local backend_id = self:_create_fake_inventory_items({
			[cosmetic_name] = offline_backend_id or true,
		}, "cosmetics")

		if #backend_id > 0 then
			self._unlocked_cosmetics[cosmetic_name] = backend_id[1]

			return backend_id[1]
		end
	else
		assert_or_print_exception(false, "Tried to add_unlocked_cosmetics '%s' before unlocked_cosmetics was created", cosmetic_name)
	end
end

PlayFabMirrorBase.set_essence = function (self, amount)
	self._essence = amount
end

PlayFabMirrorBase.get_essence = function (self)
	return self._essence
end

PlayFabMirrorBase.set_total_essence = function (self, amount)
	self._total_essence = amount
end

PlayFabMirrorBase.get_total_essence = function (self)
	return self._total_essence
end

PlayFabMirrorBase.set_maximum_essence = function (self, amount)
	self._maximum_essence = amount
end

PlayFabMirrorBase.get_maximum_essence = function (self)
	return self._maximum_essence
end

PlayFabMirrorBase.get_deus_rolled_over_soft_currency = function (self)
	return self._deus_rolled_over_soft_currency or 0
end

PlayFabMirrorBase.get_deus_journey_cycle_data = function (self)
	return self._deus_journey_cycle_data
end

PlayFabMirrorBase.get_deus_belakor_curse_data = function (self)
	return self._deus_belakor_curse_data
end

PlayFabMirrorBase.handle_deus_result = function (self, result)
	local function_result = result.FunctionResult
	local deus_journey_cycle_data = function_result.deus_journey_cycle_data
	local deus_rolled_over_soft_currency = function_result.deus_rolled_over_soft_currency

	if deus_rolled_over_soft_currency then
		self._deus_rolled_over_soft_currency = deus_rolled_over_soft_currency
	end

	if deus_journey_cycle_data then
		local current_time = Managers.time:time("main")

		self._deus_journey_cycle_data = {
			span = deus_journey_cycle_data.span_ms / 1000,
			remaining_time = deus_journey_cycle_data.remaining_time_ms / 1000,
			cycle_count = deus_journey_cycle_data.cycle_count,
			time_of_update = current_time,
		}
	end
end

PlayFabMirrorBase.predict_deus_rolled_over_soft_currency = function (self, amount)
	local roll_over_coins = math.ceil(amount * DeusRollOverSettings.roll_over)

	self._deus_rolled_over_soft_currency = math.clamp(roll_over_coins, 0, DeusRollOverSettings.max)
end

PlayFabMirrorBase.predict_deus_run_started = function (self)
	self._deus_rolled_over_soft_currency = 0
end

PlayFabMirrorBase.predict_debug_clear_deus_meta_progression = function (self, amount)
	self._deus_rolled_over_soft_currency = 0
end

local function add_callback(commit, callback)
	if not callback then
		return
	end

	commit.commit_complete_callbacks = commit.commit_complete_callbacks or {}
	commit.commit_complete_callbacks[#commit.commit_complete_callbacks + 1] = callback

	return commit.commit_complete_callbacks
end

PlayFabMirrorBase.commit = function (self, skip_queue, commit_complete_callback)
	local queued_commit = self._queued_commit
	local id

	if skip_queue then
		if self._commit_current_id then
			debug_printf("Unable to skip queue: commit already in progress")

			id = self:_queue_commit(commit_complete_callback)
		elseif not LobbyInternal.network_initialized() then
			debug_printf("Unable to skip queue: Network not initialized")

			id = self:_queue_commit(commit_complete_callback)
		elseif queued_commit.active then
			local id = queued_commit.id

			debug_printf("Force commit: Override existing queue %q", id)
			add_callback(queued_commit, commit_complete_callback)
			self:_commit_internal(id, queued_commit.commit_complete_callbacks)
		else
			debug_printf("Force commit")
			add_callback(queued_commit, commit_complete_callback)

			id = self:_commit_internal(nil, queued_commit.commit_complete_callbacks)
		end
	elseif not queued_commit.active then
		if commit_complete_callback then
			add_callback(queued_commit, commit_complete_callback)
		end

		id = self:_queue_commit(commit_complete_callback, queued_commit.commit_complete_callbacks)
	elseif commit_complete_callback then
		add_callback(queued_commit, commit_complete_callback)
	end

	if id then
		self._commit_limit_total = self._commit_limit_total + 1
	end

	return id or queued_commit.id
end

PlayFabMirrorBase._new_id = function (self)
	self._last_id = self._last_id + 1

	return self._last_id
end

PlayFabMirrorBase._queue_commit = function (self, commit_complete_callback)
	local queued_commit = self._queued_commit
	local timer = self._commit_limit_total * DELAY_MULTIPLIER
	local id = self:_new_id()

	queued_commit.timer = timer
	queued_commit.id = id
	queued_commit.active = true

	add_callback(queued_commit, commit_complete_callback)

	return id
end

local new_data = {}

PlayFabMirrorBase._commit_internal = function (self, queue_id, commit_complete_callbacks)
	debug_printf("_commit_internal %q", queue_id)

	local commit_id = queue_id or self:_new_id()
	local commit = {
		num_updates = 0,
		status = "success",
		updates_to_make = 0,
		commit_complete_callbacks = commit_complete_callbacks,
		request_queue_ids = {},
	}

	table.clear(self._queued_commit)

	self._commit_current_id = commit_id

	local stats_interface = Managers.backend:get_interface("statistics")
	local game_mode_key = Managers.state and Managers.state.game_mode and Managers.state.game_mode:game_mode_key()

	if Managers.level_transition_handler:in_hub_level() then
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
				FunctionParameter = weave_user_data,
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

	local dirty, new_career_data = self:_check_career_data(self._career_data, self._career_data_mirror)

	if dirty then
		new_data[self._characters_data_key] = cjson.encode(new_career_data)
	end

	if not table.is_empty(new_data) then
		local update_read_only_data_request = {
			FunctionName = "updateHeroAttributes",
			FunctionParameter = {
				hero_attributes = new_data,
			},
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

PlayFabMirrorBase.update_current_win_track_cb = function (self, commit_id, result)
	local commit = self._commits[commit_id]
	local function_result = result.FunctionResult
	local new_read_only_data = function_result.new_read_only_data

	for key, value in pairs(new_read_only_data) do
		local encoded_value = cjson.encode(value)

		self:set_read_only_data(key, encoded_value, true)
	end

	commit.wait_for_win_tracks_data = false
end

PlayFabMirrorBase.update_current_gotwf_cb = function (self, commit_id, result)
	local commit = self._commits[commit_id]
	local function_result = result.FunctionResult
	local new_read_only_data = function_result.new_read_only_data

	for key, value in pairs(new_read_only_data) do
		local encoded_value = cjson.encode(value)

		self:set_read_only_data(key, encoded_value, true)
	end

	commit.wait_for_gotwf_data = false
end

PlayFabMirrorBase.update_read_only_data_request_cb = function (self, commit_id, result)
	local commit = self._commits[commit_id]
	local function_result = result.FunctionResult
	local hero_attributes = function_result.hero_attributes

	for key, new_value in pairs(hero_attributes) do
		local number_value = tonumber(new_value)

		self:set_read_only_data(key, number_value or new_value, true)
	end

	local new_characters_data_string = hero_attributes[self._characters_data_key]

	if new_characters_data_string then
		self._characters_data_mirror = cjson.decode(new_characters_data_string)

		for character_name, character_data in pairs(self._characters_data_mirror) do
			table.merge_recursive(self._career_data_mirror, character_data.careers)
		end
	end

	commit.wait_for_read_only_data = false
end

PlayFabMirrorBase.save_statistics_cb = function (self, commit_id, stats, result)
	local commit = self._commits[commit_id]
	local stats_interface = Managers.backend:get_interface("statistics")

	stats_interface:clear_dirty_flags(stats)

	commit.wait_for_stats = false
end

PlayFabMirrorBase.update_weave_user_data_cb = function (self, commit_id, result)
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

PlayFabMirrorBase.save_keep_decorations_cb = function (self, commit_id, on_complete, success)
	local commit = self._commits[commit_id]

	commit.wait_for_keep_decorations = false
end

PlayFabMirrorBase.wait_for_shutdown = function (self, duration)
	return
end

PlayFabMirrorBase.destroy = function (self)
	return
end

PlayFabMirrorBase._get_eac_response = function (self, challenge)
	local i = 0
	local str = ""

	while challenge[tostring(i)] do
		str = str .. string.char(challenge[tostring(i)])
		i = i + 1
	end

	local eac_response = EAC.challenge_response(str)
	local response

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

PlayFabMirrorBase._verify_dlc_careers = function (self)
	local request = {
		FunctionName = "verifyDlcCareers",
		FunctionParameter = {},
	}
	local success_callback = callback(self, "verify_dlc_careers_cb")

	self._request_queue:enqueue(request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorBase.verify_dlc_careers_cb = function (self, result)
	local function_result = result.FunctionResult
	local careers_added = function_result.careers_added

	if careers_added then
		local data = function_result.data

		self:merge_read_only_data(data, true)
	end

	self._num_items_to_load = self._num_items_to_load - 1

	self:_setup_careers()
end

PlayFabMirrorBase._setup_careers = function (self)
	local characters_data_string = self:get_read_only_data(self._characters_data_key)
	local characters_data = cjson.decode(characters_data_string)

	self._career_data = {}
	self._career_data_mirror = {}
	self._career_lookup = {}

	local broken_slots_data = {}
	local slots_to_verify
	local ignore_keys = {
		talents = true,
	}
	local slot_keys_lookup = {}

	for character_name, character_data in pairs(characters_data) do
		local profile_index = FindProfileIndex(character_name)

		if profile_index then
			local profile = SPProfiles[profile_index]

			slots_to_verify = slot_keys_lookup[profile.affiliation]

			if not slots_to_verify then
				local slot_keys_per_affiliation = self._verify_slot_keys_per_affiliation[profile.affiliation]

				if slot_keys_per_affiliation then
					local tbl = table.clone(self._verify_slot_keys_per_affiliation[profile.affiliation])

					for i = #tbl, 1, -1 do
						if ignore_keys[tbl[i]] then
							table.remove(tbl, i)
						end
					end

					slot_keys_lookup[profile.affiliation] = tbl
					slots_to_verify = tbl
				end
			end

			if slots_to_verify then
				for career_name, career_data in pairs(character_data.careers) do
					if CareerSettings[career_name] then
						self._career_data[career_name] = {}
						self._career_data_mirror[career_name] = {}

						local broken_slots = self:_set_inital_career_data(career_name, career_data, slots_to_verify)

						if broken_slots then
							broken_slots_data[career_name] = broken_slots

							debug_printf("Broken item slots for career: %q", career_name)
							table.dump(broken_slots)
						end
					end
				end
			end
		end
	end

	if table.is_empty(broken_slots_data) then
		self._characters_data = characters_data
		self._characters_data_mirror = table.clone(characters_data)

		if Managers.mechanism:current_mechanism_name() == "adventure" then
			self:_check_weaves_loadout()
		else
			self:unequip_disabled_items()
		end
	else
		self:_fix_career_data(broken_slots_data)
	end
end

PlayFabMirrorBase._fix_career_data = function (self, broken_slots_data, override_mechanism, override_cb_func)
	local request = {
		FunctionName = "fixCareerData",
		FunctionParameter = {
			broken_slots = broken_slots_data,
			mechanism = override_mechanism and override_mechanism or Managers.mechanism:current_mechanism_name(),
		},
	}
	local success_callback = callback(self, override_cb_func or "fix_career_data_request_cb")

	self._request_queue:enqueue(request, success_callback)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirrorBase.fix_career_data_request_cb = function (self, result)
	self.broken_slots_data = nil
	self._num_items_to_load = self._num_items_to_load - 1

	local function_result = result.FunctionResult
	local character_starting_gear = function_result.character_starting_gear
	local current_career_data = self._career_data
	local mirror_career_data = self._career_data_mirror

	self._characters_data = character_starting_gear
	self._characters_data_mirror = table.clone(character_starting_gear)

	for character_names, character_data in pairs(character_starting_gear) do
		local mirror_data = self._characters_data_mirror[character_names]
		local careers = character_data.careers
		local mirror_careers = mirror_data and mirror_data.careers

		table.merge(current_career_data, careers)
		table.merge(mirror_career_data, mirror_careers)
	end

	self:set_read_only_data(self._characters_data_key, cjson.encode(character_starting_gear), true)

	if function_result.num_items_granted > 0 then
		local unlocked_weapon_skins = function_result.unlocked_weapon_skins

		if unlocked_weapon_skins then
			self:set_read_only_data("unlocked_weapon_skins", unlocked_weapon_skins, true)

			self._unlocked_weapon_skins = self:_parse_unlocked_weapon_skins()
		end

		local unlocked_cosmetics = function_result.unlocked_cosmetics

		if unlocked_cosmetics then
			self:set_read_only_data("unlocked_cosmetics", unlocked_cosmetics, true)

			self._unlocked_cosmetics = self:_parse_unlocked_cosmetics()
		end

		self:_request_user_inventory()
	elseif Managers.mechanism:current_mechanism_name() == "adventure" then
		self:_check_weaves_loadout()
	else
		self:unequip_disabled_items()
	end
end

PlayFabMirrorBase.unequip_disabled_items = function (self)
	local item_availability = Managers.mechanism:mechanism_setting_for_title("override_item_availability")

	if not item_availability or table.is_empty(item_availability) then
		return
	end

	local profiles_by_career_names = PROFILES_BY_CAREER_NAMES
	local inventory_items = self._inventory_items
	local table_contains = table.contains

	for career_name, slot_data in pairs(self._career_data) do
		local character = profiles_by_career_names[career_name]

		if character then
			local slots_to_verify = self._verify_slot_keys_per_affiliation[character.affiliation]

			if slots_to_verify then
				local career_settings = CareerSettings[career_name]

				for slot_name, slot_value in pairs(slot_data) do
					if table_contains(slots_to_verify, slot_name) then
						local item = inventory_items[slot_value]

						if item and item_availability[item.ItemId] == false then
							local valid_item_id = self:_find_valid_item_for_slot(item_availability, career_settings, slot_name, career_name)

							if valid_item_id then
								self:set_character_data(career_name, slot_name, valid_item_id, true)
							end
						end
					end
				end
			end
		end
	end
end

PlayFabMirrorBase._find_valid_item_for_slot = function (self, override_item_availability, career_settings, slot_name, career_name)
	local item_master_list = ItemMasterList
	local table_contains = table.contains

	for inventory_id, inventory_item in pairs(self._inventory_items) do
		if override_item_availability[inventory_item.ItemId] ~= false then
			local master_list_item = item_master_list[inventory_item.ItemId]
			local correct_slot = table_contains(career_settings.item_slot_types_by_slot_name[slot_name], master_list_item.slot_type)
			local can_wield = master_list_item.can_wield

			if correct_slot and can_wield and table_contains(can_wield, career_name) then
				return inventory_id, inventory_item
			end
		end
	end
end

PlayFabMirrorBase._check_career_data = function (self, careers_data, career_data_mirror)
	local characters_data = self._characters_data
	local characters_data_mirror = self._characters_data_mirror
	local dirty = false
	local ignore_keys = {
		"careers",
	}

	for name, data in pairs(characters_data) do
		for name_mirror, data_mirror in pairs(characters_data_mirror) do
			if name == name_mirror then
				dirty = not table.compare(data, data_mirror, ignore_keys)

				break
			end
		end

		if dirty then
			break
		end
	end

	for career_name, career_data in pairs(careers_data) do
		local mirror_data = career_data_mirror[career_name]
		local profile = PROFILES_BY_CAREER_NAMES[career_name]

		if profile then
			local slots_to_verify = self._verify_slot_keys_per_affiliation[profile.affiliation]

			if slots_to_verify then
				for _, loadout_key in pairs(slots_to_verify) do
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
			else
				Application.warning(string.format("Missing slots to verify for %q", career_name))
			end
		end
	end

	dirty = dirty or Managers.account:offline_mode()

	return dirty, characters_data
end

PlayFabMirrorBase.set_career_read_only_data = function (self, character, key, value, career, set_mirror)
	local characters_data = self._characters_data
	local data = career and characters_data[character].careers[career] or characters_data[character]

	data[key] = value

	if set_mirror then
		local characters_data_mirror = self._characters_data_mirror
		local data_mirror = career and characters_data_mirror[character].careers[career] or characters_data_mirror[character]

		if type(value) == "table" then
			data_mirror[key] = table.clone(value)
		else
			data_mirror[key] = value
		end
	end

	local encoded_data = cjson.encode(characters_data)

	self:set_read_only_data(self._characters_data_key, encoded_data, set_mirror)
end

PlayFabMirrorBase.get_characters_data = function (self)
	return self._characters_data
end

PlayFabMirrorBase.update_owned_dlcs = function (self, set_status_changed)
	if not HAS_STEAM then
		return
	end

	local unlock_manager = Managers.unlock
	local dlcs = unlock_manager:get_dlcs()

	for dlc_name, unlock in pairs(dlcs) do
		if unlock.set_owned then
			local is_owned = table.contains(self._owned_dlcs, dlc_name)

			unlock:set_owned(is_owned, set_status_changed)
		end
	end

	for dlc_name, unlock in pairs(dlcs) do
		if unlock.check_all_children_dlc_owned then
			unlock:check_all_children_dlc_owned()
		end
	end
end

PlayFabMirrorBase.handle_new_dlcs = function (self, new_dlcs)
	SaveData.new_dlcs_unlocks = SaveData.new_dlcs_unlocks or {}

	if new_dlcs then
		for i = 1, #new_dlcs do
			local new_dlc = new_dlcs[i]

			if not SaveData.new_dlcs_unlocks[new_dlc] then
				SaveData.new_dlcs_unlocks[new_dlc] = true
			end
		end

		Managers.save:auto_save(SaveFileName, SaveData)
	end
end

PlayFabMirrorBase._snippet_clear_inventory = function (self)
	local function clear_inventory_cb(result)
		local broken_slots = {
			slot_frame = true,
			slot_hat = true,
			slot_melee = true,
			slot_necklace = true,
			slot_ranged = true,
			slot_ring = true,
			slot_skin = true,
			slot_trinket_1 = true,
		}
		local careers = PROFILES_BY_CAREER_NAMES
		local broken_heroes = {}

		for name, data in pairs(careers) do
			if data.affiliation == "heroes" then
				broken_heroes[name] = broken_slots
			end
		end

		self:_fix_career_data(broken_heroes, "adventure")
	end

	self._request_queue[#self._request_queue + 1] = {
		eac_check = false,
		func = "devClearInventory",
		args = {
			exclude_types = {},
		},
		success_cb = clear_inventory_cb,
	}
end

PlayFabMirrorBase.snippet_clear_inventory = function (self)
	self:_snippet_clear_inventory()
end

PlayFabMirrorBase.set_twitch_app_access_token = function (self, access_token)
	self._twitch_app_access_token = access_token
end
