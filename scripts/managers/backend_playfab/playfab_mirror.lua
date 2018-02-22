REDUCTION_INTERVAL = 80
DELAY_MULTIPLIER = 5
local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
PlayFabMirror = class(PlayFabMirror)
PlayFabMirror.init = function (self, signin_result)
	self._num_items_to_load = 0
	self._commits = {}
	self._commit_current_id = nil
	self._last_id = 0
	self._queued_commit = {}
	local commit_limit_data = signin_result.InfoResultPayload.UserReadOnlyData.commit_limit_total
	self._commit_limit_timer = REDUCTION_INTERVAL
	self._commit_limit_total = (commit_limit_data and commit_limit_data.Value) or 0

	self._request_signin_reward(self)

	return 
end
PlayFabMirror._request_signin_reward = function (self)
	self._num_items_to_load = self._num_items_to_load - 1
	local request = {
		FunctionName = "signInRewards",
		FunctionParameter = {}
	}
	local sign_in_reward_request_cb = callback(self, "sign_in_reward_request_cb")

	PlayFabClientApi.ExecuteCloudScript(request, sign_in_reward_request_cb, sign_in_reward_request_cb)

	self._num_items_to_load = self._num_items_to_load + 1

	return 
end
PlayFabMirror.sign_in_reward_request_cb = function (self, result)
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

		self._request_all_users_characters(self)
		self._request_user_inventory(self)
	end

	return 
end
PlayFabMirror._request_all_users_characters = function (self)
	local request = {}
	local character_request_cb = callback(self, "character_request_cb")

	PlayFabClientApi.GetAllUsersCharacters(request, character_request_cb, character_request_cb)

	self._num_items_to_load = self._num_items_to_load + 1

	return 
end
PlayFabMirror._request_user_inventory = function (self)
	local request = {}
	local inventory_request_cb = callback(self, "inventory_request_cb")

	PlayFabClientApi.GetUserInventory(request, inventory_request_cb, inventory_request_cb)

	self._num_items_to_load = self._num_items_to_load + 1

	return 
end
PlayFabMirror._request_character_readonly_data = function (self, character_id)
	local request = {
		CharacterId = character_id
	}
	local character_data_request_cb = callback(self, "character_data_request_cb")

	PlayFabClientApi.GetCharacterReadOnlyData(request, character_data_request_cb, character_data_request_cb)

	self._num_items_to_load = self._num_items_to_load + 1

	return 
end
PlayFabMirror.character_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	if result.Error then
		table.dump(result, nil, 6)
		fassert(false, "character_request_cb: it failed!")
	else
		local characters = result.Characters
		self._career_data = {}
		self._career_data_mirror = {}
		self._career_lookup = {}

		for i = 1, #characters, 1 do
			local character_data = characters[i]
			local career_name = character_data.CharacterType
			local character_id = character_data.CharacterId
			self._career_data[career_name] = {}
			self._career_data_mirror[career_name] = {}
			self._career_lookup[career_name] = character_id
			self._career_lookup[character_id] = career_name

			self._request_character_readonly_data(self, character_id)
		end
	end

	return 
end
PlayFabMirror.character_data_request_cb = function (self, result)
	self._num_items_to_load = self._num_items_to_load - 1

	if result.Error then
		table.dump(result, nil, 6)
		fassert(false, "character_data_request_cb: it failed!")
	else
		local character_id = result.CharacterId
		local character_data = result.Data

		self._set_career_data(self, character_id, character_data)
	end

	return 
end
PlayFabMirror._set_career_data = function (self, character_id, character_data)
	local career_name = self._career_lookup[character_id]
	local career_data = self._career_data[career_name]
	local career_data_mirror = self._career_data_mirror[career_name]

	table.clear(career_data)
	table.clear(career_data_mirror)

	for key, data in pairs(character_data) do
		local value = data.Value
		career_data[key] = value
		career_data_mirror[key] = value
	end

	return 
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

				self._update_data(self, item, backend_id)

				self._inventory_items[backend_id] = item
			end
		end
	end

	return 
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

	return 
end
PlayFabMirror.ready = function (self)
	return self._inventory_items and self._num_items_to_load == 0
end
PlayFabMirror.update = function (self, dt)
	if self._commit_current_id then
		self._check_current_commit(self)
	end

	local queued_commit = self._queued_commit

	if queued_commit.active then
		queued_commit.timer = queued_commit.timer - dt

		if queued_commit.timer <= 0 and not self._commit_current_id then
			self._commit_internal(self, queued_commit.id)
		end
	end

	self._commit_limit_timer = self._commit_limit_timer - dt

	if self._commit_limit_timer <= 0 then
		self._commit_limit_timer = REDUCTION_INTERVAL
		self._commit_limit_total = math.max(self._commit_limit_total - 1, 0)
	end

	return 
end
PlayFabMirror._check_current_commit = function (self)
	local status = self._commit_status(self, self._commit_current_id)

	if status ~= "waiting" then
		local commit_data = self._commits[self._commit_current_id]

		print("commit result", status, self._commit_current_id)

		self._commit_current_id = nil

		if status == "commit_error" then
			self._commit_error = true
		else
			local backend_manager = Managers.backend

			backend_manager.dirtify_interfaces(backend_manager)
		end
	end

	return 
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
	end

	return commit_data.status
end
PlayFabMirror.get_character_data = function (self, career_name, key)
	return self._career_data[career_name][key]
end
PlayFabMirror.set_character_data = function (self, career_name, key, value)
	local career_data = self._career_data[career_name]
	career_data[key] = value

	return 
end
PlayFabMirror.update_career_data = function (self, career_name, key, value)
	local career_data = self._career_data[career_name]
	local career_data_mirror = self._career_data_mirror[career_name]
	career_data[key] = value
	career_data_mirror[key] = value

	return 
end
PlayFabMirror.get_all_inventory_items = function (self)
	return self._inventory_items
end
PlayFabMirror.get_stats = function (self)
	return self._stats
end
PlayFabMirror.set_stats = function (self, stats)
	self._stats = stats

	return 
end
PlayFabMirror.check_for_errors = function (self)
	return 
end
PlayFabMirror.add_item = function (self, backend_id, item)
	local inventory_items = self._inventory_items

	self._update_data(self, item, backend_id)

	inventory_items[backend_id] = item

	ItemHelper.mark_backend_id_as_new(backend_id)

	return 
end
PlayFabMirror.remove_item = function (self, backend_id)
	local inventory_items = self._inventory_items
	inventory_items[backend_id] = nil

	return 
end
PlayFabMirror.update_item_field = function (self, backend_id, field, value)
	local inventory_items = self._inventory_items
	local item = inventory_items[backend_id]

	fassert(item[field], "Trying to update a field on an item in playfab_mirror.lua that does not exist on the item")

	item[field] = value

	return 
end
PlayFabMirror.update_item = function (self, backend_id, new_item)
	local inventory_items = self._inventory_items

	fassert(inventory_items[backend_id], "Trying to update an item that does not exist with backend ID %s", backend_id)

	inventory_items[backend_id] = new_item
	local item = inventory_items[backend_id]

	self._update_data(self, item, backend_id)

	return 
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

	return 
end
PlayFabMirror.get_career_data_request_cb = function (self, callback_func, result)
	self._num_items_to_load = self._num_items_to_load - 1

	table.dump(result, nil, 5)

	return 
end
PlayFabMirror.commit = function (self, skip_queue)
	local queued_commit = self._queued_commit
	local id = nil

	if skip_queue and not self._commit_current_id then
		id = self._commit_internal(self)
	elseif not queued_commit.active then
		id = self._queue_commit(self)
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
	local timer = self._commit_limit_total*DELAY_MULTIPLIER
	local id = self._new_id(self)
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
local num_updates_per_request = 5
local num_requests = math.ceil(#keys/num_updates_per_request)
PlayFabMirror._commit_internal = function (self, queue_id)
	local career_data = self._career_data
	local career_data_mirror = self._career_data_mirror
	local commit_id = queue_id or self._new_id(self)
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
			local starting_index = (i - 1)*num_updates_per_request + 1
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

				self._send_update_character_data_request(self, update_character_data_request)

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
	local save_statistics_cb = callback(self, "save_statistics_cb", commit_id)
	local request_sent = Managers.backend:get_interface("statistics"):save(save_statistics_cb)

	if request_sent then
		commit.status = "waiting"
		commit.wait_for_stats = true
	end

	local save_keep_decorations_cb = callback(self, "save_keep_decorations_cb", commit_id)
	request_sent = Managers.backend:get_interface("keep_decorations"):save(save_keep_decorations_cb)

	if request_sent then
		commit.status = "waiting"
		commit.wait_for_keep_decorations = true
	end

	self._commits[commit_id] = commit

	return commit_id
end
PlayFabMirror._send_update_character_data_request = function (self, update_character_data_request)
	local update_character_data_request_cb = callback(self, "update_character_data_request_cb")

	PlayFabClientApi.ExecuteCloudScript(update_character_data_request, update_character_data_request_cb, update_character_data_request_cb)

	return 
end
PlayFabMirror.update_character_data_request_cb = function (self, result)
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

		self._set_career_data(self, character_id, character_data)

		commit.num_updates = commit.num_updates + 1

		if commit.num_updates == commit.updates_to_make and not commit.wait_for_stats and not commit.wait_for_keep_decorations then
			commit.status = "success"
		end
	end

	return 
end
PlayFabMirror.save_statistics_cb = function (self, commit_id, result)
	local commit = self._commits[commit_id]
	commit.wait_for_stats = false

	if result == false then
		commit.status = "commit_error"
	elseif result and commit.num_updates == commit.updates_to_make and not commit.wait_for_keep_decorations then
		commit.status = "success"
	end

	return 
end
PlayFabMirror.save_keep_decorations_cb = function (self, commit_id, result)
	local commit = self._commits[commit_id]
	commit.wait_for_keep_decorations = false

	if result == false then
		commit.status = "commit_error"
	elseif result and commit.num_updates == commit.updates_to_make and not commit.wait_for_stats then
		commit.status = "success"
	end

	return 
end
PlayFabMirror.wait_for_shutdown = function (self, duration)
	return 
end
PlayFabMirror.destroy = function (self)
	return 
end

return 
