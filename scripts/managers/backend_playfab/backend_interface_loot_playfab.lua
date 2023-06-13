local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
BackendInterfaceLootPlayfab = class(BackendInterfaceLootPlayfab)

BackendInterfaceLootPlayfab.init = function (self, backend_mirror)
	self._backend_mirror = backend_mirror
	self._last_id = 0
	self._loot_requests = {}
	self._reward_poll_id = false
end

BackendInterfaceLootPlayfab.ready = function (self)
	return true
end

BackendInterfaceLootPlayfab.update = function (self, dt)
	return
end

BackendInterfaceLootPlayfab._new_id = function (self)
	self._last_id = self._last_id + 1

	return self._last_id
end

BackendInterfaceLootPlayfab.open_loot_chest = function (self, hero_name, backend_id, game_mode_key, num_chests)
	local id = self:_new_id()
	local data = {
		hero_name = hero_name,
		playfab_id = backend_id,
		id = id,
		amount = num_chests or 1,
		game_mode_key = game_mode_key
	}
	local generate_loot_chest_rewards_request = {
		FunctionName = "generateLootChestRewards",
		FunctionParameter = data
	}
	local success_callback = callback(self, "loot_chest_rewards_request_cb", data)
	local request_queue = self._backend_mirror:request_queue()

	request_queue:enqueue(generate_loot_chest_rewards_request, success_callback, true)

	return id
end

BackendInterfaceLootPlayfab.loot_chest_rewards_request_cb = function (self, data, result)
	local function_result = result.FunctionResult
	local items = function_result.items
	local unlocked_weapon_skins = function_result.unlocked_weapon_skins
	local new_cosmetics = function_result.new_cosmetics
	local updated_statistics = function_result.updated_statistics
	local consume_data = function_result.consumed_chest
	local chest_backend_id = consume_data and consume_data.ItemInstanceId
	local remaining_uses = consume_data and consume_data.RemainingUses
	local num_items = #items
	local loot = {}
	local backend_mirror = self._backend_mirror

	for i = 1, num_items do
		local item = items[i]
		local backend_id = item.ItemInstanceId
		local new_backend_id = backend_mirror:add_item(backend_id, item)
		loot[#loot + 1] = new_backend_id or backend_id
	end

	if chest_backend_id then
		if remaining_uses > 0 then
			backend_mirror:update_item_field(chest_backend_id, "RemainingUses", remaining_uses)
		else
			backend_mirror:remove_item(chest_backend_id)
		end
	end

	if unlocked_weapon_skins then
		for i = 1, #unlocked_weapon_skins do
			backend_mirror:add_unlocked_weapon_skin(unlocked_weapon_skins[i])
		end
	end

	if new_cosmetics then
		for i = 1, #new_cosmetics do
			local backend_id = backend_mirror:add_item(nil, {
				ItemId = new_cosmetics[i]
			})

			if backend_id then
				loot[#loot + 1] = backend_id
			end
		end
	end

	if updated_statistics then
		local player = Managers.player and Managers.player:local_player_safe()
		local statistics_db = Managers.player:statistics_db()

		if not player or not statistics_db then
			print("[BackendInterfaceLootPlayfab] Could not get statistics_db, skipping updating statistics...")
		else
			local player_stats_id = player:stats_id()

			for key, value in pairs(updated_statistics) do
				if not statistics_db.statistics[player_stats_id][key] then
					Application.warning("[BackendInterfaceLootPlayfab] updated_statistics " .. key .. " doesn't exist.")
				else
					statistics_db:set_stat(player_stats_id, key, value)
				end
			end
		end
	end

	local id = data.id
	self._loot_requests[id] = loot
end

BackendInterfaceLootPlayfab.generate_end_of_level_loot = function (self, game_won, quick_play_bonus, difficulty, level_key, hero_name, start_experience, end_experience, loot_profile_name, deed_item_name, deed_backend_id, game_mode_key, game_time, end_of_level_rewards_arguments)
	local id = self:_new_id()
	local remote_player_ids_and_characters = self:_get_remote_player_network_ids_and_characters()

	if end_of_level_rewards_arguments.deus_soft_currency then
		self._backend_mirror:predict_deus_rolled_over_soft_currency(end_of_level_rewards_arguments.deus_soft_currency)
	end

	local data = {
		won = game_won,
		quick_play_bonus = quick_play_bonus,
		difficulty = difficulty,
		level_name = level_key,
		loot_profile_name = loot_profile_name,
		start_experience = start_experience,
		end_experience = end_experience,
		hero_name = hero_name,
		deed_item_name = deed_item_name,
		deed_backend_id = deed_backend_id,
		id = id,
		remote_player_ids_and_characters = remote_player_ids_and_characters,
		game_mode_key = game_mode_key,
		game_time = game_time,
		end_of_level_rewards_arguments = end_of_level_rewards_arguments
	}
	local generate_end_of_level_loot_request = {
		FunctionName = "generateEndOfLevelLoot",
		FunctionParameter = data
	}
	local success_callback = callback(self, "end_of_level_loot_request_cb", data)
	local request_queue = self._backend_mirror:request_queue()

	request_queue:enqueue(generate_end_of_level_loot_request, success_callback, true)

	return id
end

BackendInterfaceLootPlayfab.end_of_level_loot_request_cb = function (self, data, result)
	Managers.telemetry_events:end_of_game_rewards(result.FunctionResult)

	local function_result = result.FunctionResult
	local id = data.id
	local rewards = function_result.Rewards
	local experience = function_result.Experience
	local experience_pool = function_result.ExperiencePool
	local recent_quickplay_games = function_result.RecentQuickplayGames
	local total_essence = function_result.total_essence
	local vs_profile_data = function_result.vs_profile_data
	local score_breakdown = function_result.ScoreBreakdown
	local items = function_result.ItemsGranted or function_result.Result
	local currency_granted = function_result.CurrencyGranted
	local essence_rewards = function_result.EssenceRewards
	local cosmetic_rewards = function_result.cosmetic_rewards
	local items_revoked = function_result.ItemsRevoked
	local consumed_deed_result = function_result.ConsumedDeedResult
	local num_items = #items
	local win_track_progress = function_result.win_tracks_progress
	local loot_request = {}
	local backend_mirror = self._backend_mirror

	for item_type, item_data in pairs(rewards) do
		local backend_id, item = nil

		for i = 1, num_items do
			item = items[i]

			if item_data.ItemId == item.ItemId then
				backend_id = item.ItemInstanceId

				break
			end
		end

		loot_request[item_type] = {
			backend_id = backend_id
		}

		if item_type == "chest" then
			loot_request[item_type].score_breakdown = score_breakdown
		end

		backend_mirror:add_item(backend_id, item)
	end

	if cosmetic_rewards then
		for reward_key, item in pairs(cosmetic_rewards) do
			local backend_id = backend_mirror:add_item(nil, {
				ItemId = item
			})

			if backend_id then
				loot_request[reward_key] = {
					backend_id = backend_id
				}
			end
		end
	end

	if items_revoked then
		for i = 1, #items_revoked do
			local item_backend_id = items_revoked[i].ItemInstanceId

			backend_mirror:remove_item(item_backend_id)
		end
	elseif consumed_deed_result then
		local deed_backend_id = consumed_deed_result.ItemInstanceId

		backend_mirror:remove_item(deed_backend_id)
	end

	local hero_name = data.hero_name
	local key = hero_name .. "_experience"

	backend_mirror:set_read_only_data(key, experience, true)

	local key = "win_tracks_progress"

	self._backend_mirror:set_read_only_data(key, cjson.encode(win_track_progress), true)

	if experience_pool then
		local xp_pool_key = hero_name .. "_experience_pool"

		backend_mirror:set_read_only_data(xp_pool_key, experience_pool, true)
	end

	if recent_quickplay_games then
		backend_mirror:set_read_only_data("recent_quickplay_games", recent_quickplay_games, true)
	end

	if vs_profile_data then
		backend_mirror:set_read_only_data("vs_profile_data", vs_profile_data, true)
	end

	if currency_granted then
		for key, currency_data in pairs(currency_granted) do
			if key == "ES" then
				loot_request.essence = currency_data

				backend_mirror:set_essence(currency_data.new_total)
			else
				fassert(false, string.format("currency '%s' not supported", key))
			end
		end
	elseif essence_rewards and #essence_rewards > 0 then
		loot_request.essence = essence_rewards
		local final_essence_reward = essence_rewards[#essence_rewards]
		local new_total_essence = final_essence_reward.new_total

		backend_mirror:set_essence(new_total_essence)
	end

	backend_mirror:set_total_essence(total_essence)
	backend_mirror:handle_deus_result(result)
	Managers.backend:dirtify_interfaces()

	self._loot_requests[id] = loot_request
end

BackendInterfaceLootPlayfab._get_remote_player_network_ids_and_characters = function (self)
	local ids_and_characters = {}

	if IS_WINDOWS or IS_LINUX then
		if rawget(_G, "Steam") then
			local human_players = Managers.player:human_players()

			for _, player in pairs(human_players) do
				if player.remote then
					local peer_id = player:network_id()
					local profile_index = player:profile_index()
					local career_index = player:career_index()
					local career_settings = SPProfiles[profile_index].careers[career_index]
					local career_playfab_name = career_settings.playfab_name
					local decimal_id = Steam.id_hex_to_dec(peer_id)
					ids_and_characters[decimal_id] = career_playfab_name
				end
			end
		end
	elseif IS_XB1 then
		local human_players = Managers.player:human_players()

		for _, player in pairs(human_players) do
			if player.remote then
				local peer_id = player:network_id()
				local profile_index = player:profile_index()
				local career_index = player:career_index()
				local career_settings = SPProfiles[profile_index].careers[career_index]
				local career_playfab_name = career_settings.playfab_name
				local decimal_id = player:platform_id()
				ids_and_characters[decimal_id] = career_playfab_name
			end
		end
	elseif IS_PS4 then
		local human_players = Managers.player:human_players()

		for _, player in pairs(human_players) do
			if player.remote then
				local peer_id = player:network_id()
				local profile_index = player:profile_index()
				local career_index = player:career_index()
				local career_settings = SPProfiles[profile_index].careers[career_index]
				local career_playfab_name = career_settings.playfab_name
				local platform_id = player:platform_id()
				local decimal_id = Application.hex64_to_dec(peer_id)
				ids_and_characters[decimal_id] = career_playfab_name
			end
		end
	end

	return ids_and_characters
end

BackendInterfaceLootPlayfab.get_achievement_rewards = function (self, achievement_id)
	local achievement_rewards = self._backend_mirror:get_achievement_rewards()
	local rewards = achievement_rewards[achievement_id] and achievement_rewards[achievement_id][1]

	return rewards
end

BackendInterfaceLootPlayfab.achievement_rewards_claimed = function (self, achievement_id)
	local mirror = self._backend_mirror
	local claimed_achievements = mirror:get_claimed_achievements()

	return claimed_achievements[achievement_id]
end

BackendInterfaceLootPlayfab.can_claim_achievement_rewards = function (self, achievement_id)
	local mirror = self._backend_mirror
	local claimed_achievements = mirror:get_claimed_achievements()

	if not claimed_achievements[achievement_id] then
		return true
	end

	return false
end

BackendInterfaceLootPlayfab.claim_achievement_rewards = function (self, achievement_id, poll_id)
	self._reward_poll_id = true
	local data = {
		achievement_id = achievement_id,
		id = poll_id
	}
	local generate_achievement_rewards_request = {
		FunctionName = "generateAchievementRewards",
		FunctionParameter = data
	}
	local success_callback = callback(self, "achievement_rewards_request_cb", data)
	local request_queue = self._backend_mirror:request_queue()

	request_queue:enqueue(generate_achievement_rewards_request, success_callback, true)
end

BackendInterfaceLootPlayfab.achievement_rewards_request_cb = function (self, data, result)
	local function_result = result.FunctionResult
	local id = data.id

	if not function_result then
		Managers.backend:playfab_api_error(result)

		return
	elseif function_result == "reward_claimed" then
		Managers.backend:playfab_error(BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_ACHIEVEMENT_REWARD_CLAIMED)

		self._loot_requests[id] = {}

		return
	end

	local items = function_result.items
	local achievement_id = function_result.achievement_id
	local currency_added = function_result.currency_added
	local chips = function_result.chips
	local backend_mirror = self._backend_mirror
	local loot = {}

	if items then
		for i = 1, #items do
			local item = items[i]
			local backend_id = item.ItemInstanceId
			local amount = item.UsesIncrementedBy or 1

			backend_mirror:add_item(backend_id, item)

			loot[#loot + 1] = {
				type = "item",
				backend_id = backend_id,
				amount = amount
			}
		end
	end

	local new_keep_decorations = function_result.new_keep_decorations

	if new_keep_decorations then
		for i = 1, #new_keep_decorations do
			local keep_decoration_name = new_keep_decorations[i]

			backend_mirror:add_keep_decoration(keep_decoration_name)

			loot[#loot + 1] = {
				type = "keep_decoration_painting",
				keep_decoration_name = keep_decoration_name
			}
		end
	end

	local new_weapon_skins = function_result.new_weapon_skins

	if new_weapon_skins then
		for i = 1, #new_weapon_skins do
			local weapon_skin_name = new_weapon_skins[i]

			backend_mirror:add_unlocked_weapon_skin(weapon_skin_name)

			loot[#loot + 1] = {
				type = "weapon_skin",
				weapon_skin_name = weapon_skin_name
			}
		end
	end

	local new_cosmetics = function_result.new_cosmetics

	if new_cosmetics then
		local item_master_list = ItemMasterList

		for i = 1, #new_cosmetics do
			local cosmetic_name = new_cosmetics[i]
			local item = rawget(item_master_list, cosmetic_name)
			local backend_id = backend_mirror:add_item(nil, {
				ItemId = cosmetic_name
			})

			if backend_id then
				loot[#loot + 1] = {
					type = item.slot_type,
					backend_id = backend_id
				}
			end
		end
	end

	local rewarded_currency = {}

	if currency_added then
		for _, data in ipairs(currency_added) do
			local code = data.code
			local amount = data.amount
			loot[#loot + 1] = {
				type = "currency",
				currency_code = code,
				amount = amount
			}
		end
	end

	if chips then
		local peddler_interface = Managers.backend:get_interface("peddler")

		if peddler_interface then
			for chip_type, amount in pairs(chips) do
				peddler_interface:set_chips(chip_type, amount)
			end
		end
	end

	backend_mirror:set_achievement_claimed(achievement_id)

	self._loot_requests[id] = loot
	self._reward_poll_id = nil

	Managers.backend:dirtify_interfaces()
end

BackendInterfaceLootPlayfab.can_claim_all_achievement_rewards = function (self, achievement_ids)
	local claimable_achievements = {}
	local unclaimable_achievements = {}
	local mirror = self._backend_mirror
	local claimed_achievements = mirror:get_claimed_achievements()

	for i = 0, #achievement_ids do
		local achievement_id = achievement_ids[i]

		if not claimed_achievements[achievement_id] then
			table.insert(claimable_achievements, achievement_id)
		else
			table.insert(unclaimable_achievements, achievement_id)
		end
	end

	if table.is_empty(claimable_achievements) then
		return false, nil, unclaimable_achievements
	else
		return true, claimable_achievements, unclaimable_achievements
	end
end

local ACH_CHUNK_LIMIT = 150

BackendInterfaceLootPlayfab.claim_multiple_achievement_rewards = function (self, achievement_ids, poll_id, start_index, end_index)
	self._reward_poll_id = true
	start_index = start_index or 1
	end_index = end_index or ACH_CHUNK_LIMIT
	local challenge_data = {}
	local num_elements = #achievement_ids
	local id = poll_id
	local temp_achievement_ids = nil
	local chunk_size = ACH_CHUNK_LIMIT

	if start_index > 1 then
		temp_achievement_ids = table.slice(achievement_ids, start_index, num_elements)
	else
		temp_achievement_ids = achievement_ids
	end

	if #temp_achievement_ids <= ACH_CHUNK_LIMIT then
		chunk_size = #temp_achievement_ids
	end

	for i = 1, chunk_size do
		local achievement_id = temp_achievement_ids[i]
		local data = {
			achievement_id = achievement_id
		}
		challenge_data[#challenge_data + 1] = data
	end

	local generate_achievement_rewards_request = {
		FunctionName = "generateAchievementRewards",
		FunctionParameter = {
			achievement_ids = challenge_data,
			id = id
		}
	}
	local success_callback = callback(self, "claim_multiple_achievement_rewards_request_cb", challenge_data, id, start_index, end_index, achievement_ids)
	local request_queue = self._backend_mirror:request_queue()

	request_queue:enqueue(generate_achievement_rewards_request, success_callback, true)
end

BackendInterfaceLootPlayfab.claim_multiple_achievement_rewards_request_cb = function (self, data, id, start_index, end_index, achievement_ids, result)
	print("[BackendInterfaceLootPlayfab]:claim_all_achievement_rewards_request_cb: Firing!")

	local function_result = result.FunctionResult
	local id = id
	local achievement_ids = achievement_ids

	if not function_result then
		Managers.backend:playfab_api_error(result)

		return
	elseif function_result == "reward_claimed" then
		Managers.backend:playfab_error(BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_ACHIEVEMENT_REWARD_CLAIMED)

		self._loot_requests[id] = {}

		return
	end

	if self._loot_requests[id] == nil then
		self._loot_requests[id] = {}
	end

	local items = function_result.items
	local awarded_achievement_ids = function_result.achievement_id
	local currency_added = function_result.currency_added
	local chips = function_result.chips
	local backend_mirror = self._backend_mirror
	local loot = {}

	if items then
		for i = 1, #items do
			local item = items[i]
			local backend_id = item.ItemInstanceId
			local amount = item.UsesIncrementedBy or 1

			backend_mirror:add_item(backend_id, item)

			loot[#loot + 1] = {
				type = "item",
				backend_id = backend_id,
				amount = amount
			}
		end
	end

	local new_keep_decorations = function_result.new_keep_decorations

	if new_keep_decorations then
		for i = 1, #new_keep_decorations do
			local keep_decoration_name = new_keep_decorations[i]

			backend_mirror:add_keep_decoration(keep_decoration_name)

			loot[#loot + 1] = {
				type = "keep_decoration_painting",
				keep_decoration_name = keep_decoration_name
			}
		end
	end

	local new_weapon_skins = function_result.new_weapon_skins

	if new_weapon_skins then
		for i = 1, #new_weapon_skins do
			local weapon_skin_name = new_weapon_skins[i]

			backend_mirror:add_unlocked_weapon_skin(weapon_skin_name)

			loot[#loot + 1] = {
				type = "weapon_skin",
				weapon_skin_name = weapon_skin_name
			}
		end
	end

	local new_cosmetics = function_result.new_cosmetics

	if new_cosmetics then
		local item_master_list = ItemMasterList

		for i = 1, #new_cosmetics do
			local cosmetic_name = new_cosmetics[i]
			local item = rawget(item_master_list, cosmetic_name)
			local backend_id = backend_mirror:add_item(nil, {
				ItemId = cosmetic_name
			})

			if backend_id then
				loot[#loot + 1] = {
					type = item.slot_type,
					backend_id = backend_id
				}
			end
		end
	end

	local rewarded_currency = {}

	if currency_added then
		for _, data in ipairs(currency_added) do
			local code = data.code
			local amount = data.amount
			loot[#loot + 1] = {
				type = "currency",
				currency_code = code,
				amount = amount
			}
		end
	end

	if chips then
		local peddler_interface = Managers.backend:get_interface("peddler")

		if peddler_interface then
			for chip_type, amount in pairs(chips) do
				peddler_interface:set_chips(chip_type, amount)
			end
		end
	end

	if awarded_achievement_ids then
		for i = 1, #awarded_achievement_ids do
			local achievement_id = awarded_achievement_ids[i].achievement_id

			backend_mirror:set_achievement_claimed(achievement_id)
		end

		for i = 1, #loot do
			table.insert(self._loot_requests[id], loot[i])
		end
	else
		local requested_achievement_ids = function_result.requested_achievement_ids or {}

		table.dump(requested_achievement_ids)
		Crashify.print_exception("Failed to claim multiple challenges")
	end

	local num_elements = #achievement_ids

	if end_index < num_elements then
		local next_start_index = start_index + ACH_CHUNK_LIMIT
		local next_end_index = end_index + ACH_CHUNK_LIMIT

		self:claim_multiple_achievement_rewards(achievement_ids, id, next_start_index, next_end_index)
	else
		self._reward_poll_id = nil

		Managers.backend:dirtify_interfaces()
	end
end

BackendInterfaceLootPlayfab.polling_reward = function (self)
	return self._reward_poll_id
end

BackendInterfaceLootPlayfab.is_loot_generated = function (self, id)
	local loot_request = self._loot_requests[id]

	if loot_request then
		return true
	end

	return false
end

BackendInterfaceLootPlayfab.get_loot = function (self, id)
	return self._loot_requests[id]
end

BackendInterfaceLootPlayfab.generate_reward_loot_id = function (self)
	return self:_new_id()
end
