local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
BackendInterfaceLootPlayfab = class(BackendInterfaceLootPlayfab)
BackendInterfaceLootPlayfab.init = function (self, backend_mirror)
	self._backend_mirror = backend_mirror
	self._last_id = 0
	self._loot_requests = {}
	self._loot_chest_requests = {}

	return 
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
BackendInterfaceLootPlayfab.open_loot_chest = function (self, hero_name, backend_id)
	local id = self._new_id(self)
	local generate_loot_chest_rewards_request = {
		FunctionName = "generateLootChestRewards",
		FunctionParameter = {
			hero_name = hero_name,
			playfab_id = backend_id,
			id = id
		}
	}
	local loot_chest_rewards_request_cb = callback(self, "loot_chest_rewards_request_cb", id)

	PlayFabClientApi.ExecuteCloudScript(generate_loot_chest_rewards_request, loot_chest_rewards_request_cb, loot_chest_rewards_request_cb)

	return id
end
BackendInterfaceLootPlayfab.loot_chest_rewards_request_cb = function (self, id, result)
	if result.Error then
		table.dump(result, nil, 5)
		fassert(false, "loot_chest_rewards_request_cb: it failed!")
	else
		local function_result = result.FunctionResult
		local items = function_result.items
		local consume_data = function_result.consumed_chest
		local chest_backend_id = consume_data.ItemInstanceId
		local remaining_uses = consume_data.RemainingUses
		local num_items = #items
		local loot = {}
		local backend_mirror = self._backend_mirror

		for i = 1, num_items, 1 do
			local item = items[i]
			local backend_id = item.ItemInstanceId

			backend_mirror.add_item(backend_mirror, backend_id, item)

			loot[#loot + 1] = backend_id
		end

		if 0 < remaining_uses then
			backend_mirror.update_item_field(backend_mirror, chest_backend_id, "RemainingUses", remaining_uses)
		else
			backend_mirror.remove_item(backend_mirror, chest_backend_id)
		end

		self._loot_chest_requests[id] = loot
	end

	return 
end
BackendInterfaceLootPlayfab.is_loot_chest_opened = function (self, id)
	local loot_chest_request = self._loot_chest_requests[id]

	if loot_chest_request then
		return true
	end

	return false
end
BackendInterfaceLootPlayfab.get_loot_chest_rewards = function (self, id)
	return self._loot_chest_requests[id]
end
BackendInterfaceLootPlayfab.generate_end_of_level_loot = function (self, game_won, quick_play_bonus, difficulty, level_key, num_tomes, num_grims, num_loot_dice, hero_name, start_experience, end_experience, deed_item_name, deed_backend_id)
	local id = self._new_id(self)
	local generate_end_of_level_loot_request = {
		FunctionName = "generateEndOfLevelLoot",
		FunctionParameter = {
			won = game_won,
			quick_play_bonus = quick_play_bonus,
			difficulty = difficulty,
			level_name = level_key,
			num_tomes = num_tomes,
			num_grims = num_grims,
			num_dice = num_loot_dice,
			start_experience = start_experience,
			end_experience = end_experience,
			hero_name = hero_name,
			deed_item_name = deed_item_name,
			deed_backend_id = deed_backend_id,
			id = id
		}
	}
	local end_of_level_loot_request_cb = callback(self, "end_of_level_loot_request_cb", id)

	PlayFabClientApi.ExecuteCloudScript(generate_end_of_level_loot_request, end_of_level_loot_request_cb, end_of_level_loot_request_cb)

	return id
end
BackendInterfaceLootPlayfab.end_of_level_loot_request_cb = function (self, id, result)
	if result.Error then
		table.dump(result, nil, 5)
		fassert(false, "end_of_level_loot_request_cb: it failed!")
	else
		local function_result = result.FunctionResult
		local rewards = function_result.Rewards
		local items = function_result.Result
		local random_value = function_result.RandomValue
		local consumed_deed_result = function_result.ConsumedDeedResult
		local num_items = #items
		local loot_request = {}

		for item_type, item_data in pairs(rewards) do
			local backend_id, item = nil

			for i = 1, num_items, 1 do
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
				loot_request[item_type].random_value = random_value
			end

			self._backend_mirror:add_item(backend_id, item)
		end

		if consumed_deed_result then
			local deed_backend_id = consumed_deed_result.ItemInstanceId

			self._backend_mirror:remove_item(deed_backend_id)
		end

		self._loot_requests[id] = loot_request
	end

	return 
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

return 
