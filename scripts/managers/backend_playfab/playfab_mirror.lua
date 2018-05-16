require("scripts/managers/backend_playfab/playfab_request_queue")

REDUCTION_INTERVAL = 80
DELAY_MULTIPLIER = 5
local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
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
	self._best_power_levels = nil
	self.sum_best_power_levels = nil
	local read_only_data = signin_result.InfoResultPayload.UserReadOnlyData
	local read_only_data_values = {}

	for key, data in pairs(read_only_data) do
		local value = data.Value

		if tonumber(value) then
			value = tonumber(value)
		end

		read_only_data_values[key] = value
	end

	self._read_only_data = read_only_data_values
	self._read_only_data_mirror = table.clone(read_only_data_values)
	self._commit_limit_timer = REDUCTION_INTERVAL
	self._commit_limit_total = 1
	self._claimed_achievements = self:_parse_claimed_achievements(read_only_data_values)

	self:_request_best_power_levels()
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

PlayFabMirror._request_best_power_levels = function (self)
	local request = {
		FunctionName = "bestPowerLevels",
		FunctionParameter = {}
	}
	local request_cb = callback(self, "best_power_levels_request_cb")

	PlayFabClientApi.ExecuteCloudScript(request, request_cb, request_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirror.best_power_levels_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	if result.Error then
		table.dump(result, nil, 6)
		fassert(false, "best_power_levels_request_cb: it failed!")
	else
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
end

PlayFabMirror._request_signin_reward = function (self)
	local request = {
		FunctionName = "signInRewards",
		FunctionParameter = {}
	}
	local sign_in_reward_request_cb = callback(self, "sign_in_reward_request_cb")

	PlayFabClientApi.ExecuteCloudScript(request, sign_in_reward_request_cb, sign_in_reward_request_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirror.sign_in_reward_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	if result.Error then
		table.dump(result, nil, 6)
		fassert(false, "sign_in_reward_request_cb: it failed!")
	else
		local function_result = result.FunctionResult
		local rewards = function_result.rewards

		for reward_id, reward_data in pairs(rewards) do
			local grants = reward_data.ItemGrantResults

			for _, grant in ipairs(grants) do
				local grant_result = grant.Result

				if grant_result == true then
					local item_id = grant.ItemInstanceId

					ItemHelper.mark_sign_in_reward_as_new(reward_id, item_id)
				end
			end
		end

		self:_request_fix_inventory_data_1()
	end
end

PlayFabMirror._request_quests = function (self)
	local request = {
		FunctionName = "getQuests",
		FunctionParameter = {}
	}
	local request_cb = callback(self, "get_quests_cb")

	PlayFabClientApi.ExecuteCloudScript(request, request_cb, request_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirror.get_quests_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	if result.Error then
		table.dump(result, nil, 6)
		fassert(false, "get_quests_cb: it failed!")
	else
		local function_result = result.FunctionResult
		local current_quests = function_result.current_quests
		local refresh_available = function_result.daily_quest_refresh_available
		local daily_quest_update_time = function_result.daily_quest_update_time

		self:set_quest_data(current_quests, refresh_available, daily_quest_update_time)
		self:_request_fix_inventory_data_1()
	end
end

PlayFabMirror._request_fix_inventory_data_1 = function (self)
	local request = {
		FunctionName = "fixInventoryData1",
		FunctionParameter = {}
	}
	local request_cb = callback(self, "fix_inventory_data_1_request_cb")

	PlayFabClientApi.ExecuteCloudScript(request, request_cb, request_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirror.fix_inventory_data_1_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	if result.Error then
		table.dump(result, nil, 6)
		fassert(false, "fix_inventory_data_1_request_cb: it failed!")
	else
		self:_request_user_inventory()
	end
end

PlayFabMirror._request_user_inventory = function (self)
	local request = {}
	local inventory_request_cb = callback(self, "inventory_request_cb")

	PlayFabClientApi.GetUserInventory(request, inventory_request_cb, inventory_request_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirror.inventory_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	if result.Error then
		table.dump(result, nil, 6)
		fassert(false, "inventory_request_cb: it failed!")
	else
		local inventory_items = result.Inventory

		if self._inventory_items then
			table.clear(self._inventory_items)
		else
			self._inventory_items = {}
		end

		for i = 1, #inventory_items, 1 do
			local item = inventory_items[i]

			if not item.BundleContents then
				local backend_id = item.ItemInstanceId

				self:_update_data(item, backend_id)

				self._inventory_items[backend_id] = item
			end
		end

		self:_request_all_users_characters()
	end
end

PlayFabMirror._request_all_users_characters = function (self)
	local request = {}
	local character_request_cb = callback(self, "character_request_cb")

	PlayFabClientApi.GetAllUsersCharacters(request, character_request_cb, character_request_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirror.character_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	if result.Error then
		table.dump(result, nil, 6)
		fassert(false, "character_request_cb: it failed!")
	else
		self._career_data = {}
		self._career_data_mirror = {}
		self._career_lookup = {}
		local characters = result.Characters
		self._num_items_to_load = self._num_items_to_load + #characters

		self:_request_character_readonly_data(characters, 1)
	end
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

	PlayFabClientApi.GetCharacterReadOnlyData(request, character_data_request_cb, character_data_request_cb)
end

PlayFabMirror.character_data_request_cb = function (self, characters, i, result)
	self._num_items_to_load = self._num_items_to_load - 1

	if result.Error then
		table.dump(result, nil, 6)
		fassert(false, "character_data_request_cb: it failed!")
	else
		local character_id = result.CharacterId
		local character_name = self._career_lookup[character_id]
		local character_data = result.Data
		local broken_slots = self:_set_inital_career_data(character_id, character_data)

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

			PlayFabClientApi.ExecuteCloudScript(request, fix_career_data_request_cb, fix_career_data_request_cb)
		elseif i < #characters then
			print("Requesting character data for index", i + 1, #characters)
			self:_request_character_readonly_data(characters, i + 1)
		end
	end
end

PlayFabMirror.fix_career_data_request_cb = function (self, characters, i, result)
	self._num_items_to_load = self._num_items_to_load - 1

	if result.Error then
		table.dump(result, nil, 6)
		fassert(false, "character_data_request_cb: it failed!")
	else
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
end

PlayFabMirror._set_inital_career_data = function (self, character_id, character_data)
	local career_name = self._career_lookup[character_id]
	local career_data = self._career_data[career_name]
	local career_data_mirror = self._career_data_mirror[career_name]
	local broken_slots = nil

	table.clear(career_data)
	table.clear(career_data_mirror)

	if not character_data.slot_melee or not character_data.slot_melee.Value then
		broken_slots = broken_slots or {}
		broken_slots.slot_melee = true
	end

	if not character_data.slot_ranged or not character_data.slot_ranged.Value then
		broken_slots = broken_slots or {}
		broken_slots.slot_ranged = true
	end

	for key, data in pairs(character_data) do
		local value = data.Value
		career_data[key] = value
		career_data_mirror[key] = value

		if key == "slot_ranged" or key == "slot_melee" then
			local item = self._inventory_items[value]

			if not item then
				broken_slots = broken_slots or {}
				broken_slots[key] = true
			end
		end
	end

	return broken_slots
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
	if self._commit_current_id then
		self:_check_current_commit()
	end

	local queued_commit = self._queued_commit

	if queued_commit.active then
		queued_commit.timer = queued_commit.timer - dt

		if queued_commit.timer <= 0 and not self._commit_current_id then
			self:_commit_internal(queued_commit.id)
		end
	end

	self._commit_limit_timer = self._commit_limit_timer - dt

	if self._commit_limit_timer <= 0 then
		self._commit_limit_timer = REDUCTION_INTERVAL
		self._commit_limit_total = math.max(self._commit_limit_total - 1, 1)
	end

	self._request_queue:update(dt)
end

PlayFabMirror._check_current_commit = function (self)
	local status = self:_commit_status(self._commit_current_id)

	if status ~= "waiting" then
		local commit_data = self._commits[self._commit_current_id]

		print("commit result", status, self._commit_current_id)

		self._commit_current_id = nil

		if status == "commit_error" then
			self._commit_error = true
		else
			local backend_manager = Managers.backend

			backend_manager:dirtify_interfaces()
		end
	end
end

PlayFabMirror._commit_status = function (self, commit_id)
	fassert(commit_id, "Querying status for commit_id %s", tostring(commit_id))

	local commit_data = self._commits[commit_id]

	fassert(commit_data, "No commit with id %d", commit_id)

	if commit_data.timeout < os.time() then
		print(commit_data.timeout, os.time())

		local warning = string.format("Commit timed out %d", commit_id)

		Application.warning(warning)

		return "commit_error"
	elseif commit_data.status == "commit_error" then
		return "commit_error"
	elseif commit_data.num_updates == commit_data.updates_to_make and not commit_data.wait_for_stats and not commit_data.wait_for_keep_decorations and not commit_data.wait_for_hero_attributes then
		return "success"
	end

	return commit_data.status
end

PlayFabMirror.get_character_data = function (self, career_name, key)
	return self._career_data[career_name][key]
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

PlayFabMirror.get_read_only_data = function (self)
	return self._read_only_data
end

PlayFabMirror.set_read_only_data = function (self, key, value, set_mirror)
	self._read_only_data[key] = value

	if set_mirror then
		self._read_only_data_mirror[key] = value
	end
end

PlayFabMirror.get_all_inventory_items = function (self)
	return self._inventory_items
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

PlayFabMirror.set_achievement_claimed = function (self, achievement_id)
	local claimed_achievements = self._claimed_achievements
	claimed_achievements[achievement_id] = true
end

PlayFabMirror.get_quest_data = function (self)
	return self._quest_data
end

PlayFabMirror.set_quest_data = function (self, quests, refresh_available, daily_quest_update_time)
	table.clear(self._quest_data)

	local quest_data = self._quest_data
	quest_data.current_quests = quests
	quest_data.refresh_available = to_boolean(refresh_available)
	quest_data.daily_quest_update_time = tonumber(daily_quest_update_time)
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

	self:_update_data(item, backend_id)

	inventory_items[backend_id] = item

	ItemHelper.mark_backend_id_as_new(backend_id)
	self:_re_evaluate_best_power_level(item)
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

PlayFabMirror.get_users_career_data = function (self, peer_id, career_name, callback_func)
	local request = {
		FunctionName = "getPlayerData",
		FunctionParameter = {
			steam_id = Steam.id_hex_to_dec(peer_id),
			character_name = career_name
		}
	}
	local get_career_data_request_cb = callback(self, "get_career_data_request_cb", callback_func)

	PlayFabClientApi.ExecuteCloudScript(request, get_career_data_request_cb, get_career_data_request_cb)

	self._num_items_to_load = self._num_items_to_load + 1
end

PlayFabMirror.get_career_data_request_cb = function (self, callback_func, result)
	self._num_items_to_load = self._num_items_to_load - 1

	table.dump(result, nil, 5)
end

PlayFabMirror.commit = function (self, skip_queue)
	local queued_commit = self._queued_commit
	local id = nil

	if skip_queue and not self._commit_current_id then
		if queued_commit.active then
			local id = queued_commit.id

			print("FORCE COMMIT", id)
			self:_commit_internal(id, skip_queue)
		else
			id = self:_commit_internal(nil, skip_queue)
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

PlayFabMirror._commit_internal = function (self, queue_id, skip_queue)
	print("PlayFabMirror:_commit_internal", queue_id, skip_queue)

	local career_data = self._career_data
	local career_data_mirror = self._career_data_mirror
	local commit_id = queue_id or self:_new_id()
	local status = "success"
	local num_updates = 0

	table.clear(self._queued_commit)

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

				self:_send_update_character_data_request(update_character_data_request, skip_queue)

				status = "waiting"
				num_updates = num_updates + 1
			end
		end
	end

	local commit = {
		num_updates = 0,
		timeout = os.time() + 15,
		status = status,
		updates_to_make = num_updates
	}
	self._commit_current_id = commit_id
	local request = nil

	if skip_queue then
		local save_statistics_cb = callback(self, "save_statistics_cb", commit_id)
		request = Managers.backend:get_interface("statistics"):save(save_statistics_cb)

		if request then
			commit.status = "waiting"
			commit.wait_for_stats = true

			self._request_queue:enqueue("save_statistics", request, skip_queue)
		end
	end

	local save_keep_decorations_cb = callback(self, "save_keep_decorations_cb", commit_id)
	request = Managers.backend:get_interface("keep_decorations"):save(save_keep_decorations_cb)

	if request then
		commit.status = "waiting"
		commit.wait_for_keep_decorations = true

		self._request_queue:enqueue("save_keep_decorations", request, skip_queue)
	end

	table.clear(new_data)

	for i = 1, #hero_attributes, 1 do
		local key = hero_attributes[i]
		local value = self._read_only_data[key]
		local mirror_value = self._read_only_data_mirror[key]

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

		self:_send_update_read_only_data_request(commit_id, update_read_only_data_request, skip_queue)

		commit.status = "waiting"
		commit.wait_for_hero_attributes = true
	end

	self._commits[commit_id] = commit

	return commit_id
end

PlayFabMirror._send_update_character_data_request = function (self, update_character_data_request, skip_queue)
	local request = {
		payload = table.clone(update_character_data_request),
		callback = function (payload, on_complete)
			local update_character_data_request_cb = callback(self, "update_character_data_request_cb", on_complete)

			PlayFabClientApi.ExecuteCloudScript(payload, update_character_data_request_cb, update_character_data_request_cb)
		end
	}

	self._request_queue:enqueue("send_update_character_data_request", request, skip_queue)
end

PlayFabMirror.update_character_data_request_cb = function (self, on_complete, result)
	local function_result = result.FunctionResult
	local get_data_result = function_result.GetDataResult
	local commit_id = function_result.CommitId
	local commit = self._commits[commit_id]

	if result.Error then
		print("update_character_data_request_cb: it failed!")

		commit.status = "commit_error"
	else
		local character_id = get_data_result.CharacterId
		local character_data = get_data_result.Data
		local career_name = self._career_lookup[character_id]
		local career_data_mirror = self._career_data_mirror[career_name]

		table.clear(career_data_mirror)

		for key, data in pairs(character_data) do
			local value = data.Value
			career_data_mirror[key] = value
		end

		commit.num_updates = commit.num_updates + 1
	end

	on_complete()
end

PlayFabMirror._send_update_read_only_data_request = function (self, commit_id, update_read_only_data_request, skip_queue)
	local request = {
		payload = table.clone(update_read_only_data_request),
		callback = function (payload, on_complete)
			local update_read_only_data_request_cb = callback(self, "update_read_only_data_request_cb", commit_id, on_complete)

			PlayFabClientApi.ExecuteCloudScript(payload, update_read_only_data_request_cb, update_read_only_data_request_cb)
		end
	}

	self._request_queue:enqueue("send_update_read_only_data_request", request, skip_queue)
end

PlayFabMirror.update_read_only_data_request_cb = function (self, commit_id, on_complete, result)
	if result.Error then
		print("update_character_data_request_cb: it failed!")

		commit.status = "commit_error"
	else
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

		commit.wait_for_hero_attributes = false

		print("Hero attributes saved!")
	end

	on_complete()
end

PlayFabMirror.save_statistics_cb = function (self, commit_id, on_complete, success)
	local commit = self._commits[commit_id]
	commit.wait_for_stats = false

	if success == false then
		commit.status = "commit_error"
	end

	on_complete()
end

PlayFabMirror.save_keep_decorations_cb = function (self, commit_id, on_complete, success)
	local commit = self._commits[commit_id]
	commit.wait_for_keep_decorations = false

	if success == false then
		commit.status = "commit_error"
	end

	on_complete()
end

PlayFabMirror.wait_for_shutdown = function (self, duration)
	return
end

PlayFabMirror.destroy = function (self)
	return
end

return
