local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
BackendInterfaceQuestsPlayfab = class(BackendInterfaceQuestsPlayfab)

BackendInterfaceQuestsPlayfab.init = function (self, backend_mirror)
	self._backend_mirror = backend_mirror
	self._quests = {}
	self._last_id = 0
	self._refresh_requests = {}
	self._quest_reward_requests = {}

	self:_refresh()
end

BackendInterfaceQuestsPlayfab._refresh = function (self)
	local talents = self._talents
	local backend_mirror = self._backend_mirror
	local quest_data = backend_mirror:get_quest_data()
	self._quests = quest_data.current_quests
	self._refresh_available = quest_data.refresh_available
	self._daily_quest_update_time = quest_data.daily_quest_update_time
	self._dirty = false
end

BackendInterfaceQuestsPlayfab.ready = function (self)
	return true
end

BackendInterfaceQuestsPlayfab._new_id = function (self)
	self._last_id = self._last_id + 1

	return self._last_id
end

BackendInterfaceQuestsPlayfab.make_dirty = function (self)
	self._dirty = true
end

BackendInterfaceQuestsPlayfab.update = function (self, dt)
	return
end

BackendInterfaceQuestsPlayfab.delete = function (self)
	return
end

BackendInterfaceQuestsPlayfab.get_quests = function (self)
	if self._dirty then
		self:_refresh()
	end

	return self._quests
end

BackendInterfaceQuestsPlayfab.get_daily_quest_update_time = function (self)
	if self._dirty then
		self:_refresh()
	end

	return self._daily_quest_update_time
end

BackendInterfaceQuestsPlayfab.can_refresh_quest = function (self)
	if self._dirty then
		self:_refresh()
	end

	return self._refresh_available
end

BackendInterfaceQuestsPlayfab.refresh_quest = function (self, key)
	local id = self:_new_id()
	local request = {
		FunctionName = "refreshQuest",
		FunctionParameter = {
			quest_key = key
		}
	}
	local request_cb = callback(self, "refresh_quest_cb", id, key)

	PlayFabClientApi.ExecuteCloudScript(request, request_cb, request_cb)

	return id
end

BackendInterfaceQuestsPlayfab.refresh_quest_cb = function (self, id, key, result)
	if result.Error then
		table.dump(result, nil, 6)
		fassert(false, "refresh_quest_cb: it failed!")
	else
		local backend_mirror = self._backend_mirror
		local function_result = result.FunctionResult

		if function_result == "refresh_unavailable" then
			Managers.backend:playfab_error(BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_QUEST_REFRESH_UNAVAILABLE)

			self._refresh_requests[id] = {}

			return
		end

		local current_quests = function_result.current_quests
		local daily_quest_refresh_available = function_result.daily_quest_refresh_available
		local daily_quest_update_time = function_result.daily_quest_update_time

		backend_mirror:set_quest_data(current_quests, daily_quest_refresh_available, daily_quest_update_time)

		self._refresh_requests[id] = {
			quest_key = key
		}
		self._dirty = true
	end
end

BackendInterfaceQuestsPlayfab.is_quest_refreshed = function (self, id)
	local refresh_request = self._refresh_requests[id]

	if refresh_request then
		return true, refresh_request.quest_key
	end

	return false
end

BackendInterfaceQuestsPlayfab.can_claim_quest_rewards = function (self, key)
	local quests = self._quests
	local current_quest_name = quests[key]

	if not current_quest_name then
		return false
	end

	return true
end

BackendInterfaceQuestsPlayfab.claim_quest_rewards = function (self, key)
	local id = self:_new_id()
	local data = {
		quest_key = key,
		id = id
	}
	local generate_challenge_request = {
		FunctionName = "generateChallenge"
	}
	local claim_quest_rewards_challenge_request_cb = callback(self, "claim_quest_rewards_challenge_request_cb", data)

	PlayFabClientApi.ExecuteCloudScript(generate_challenge_request, claim_quest_rewards_challenge_request_cb, claim_quest_rewards_challenge_request_cb)

	return id
end

BackendInterfaceQuestsPlayfab.claim_quest_rewards_challenge_request_cb = function (self, data, result)
	if result.Error then
		table.dump(result, nil, 5)
		fassert(false, "claim_quest_rewards_challenge_request_cb: it failed!")
	else
		local function_result = result.FunctionResult
		local challenge = function_result.challenge
		local eac_response, response = nil

		if challenge then
			eac_response, response = self:_get_eac_response(challenge)
		end

		if not challenge then
			print("EAC disabled on backend")
			self:_claim_quest_rewards(data)
		elseif not eac_response then
			print("EAC disabled on client")
			Managers.backend:playfab_eac_error()
		else
			print("EAC Enabled!")
			self:_claim_quest_rewards(data, response)
		end
	end
end

BackendInterfaceQuestsPlayfab._claim_quest_rewards = function (self, data, response)
	local function_params = table.clone(data)
	function_params.response = response
	local generate_quest_rewards_request = {
		FunctionName = "generateQuestRewards",
		FunctionParameter = function_params
	}
	local quest_rewards_request_cb = callback(self, "quest_rewards_request_cb", data)

	PlayFabClientApi.ExecuteCloudScript(generate_quest_rewards_request, quest_rewards_request_cb, quest_rewards_request_cb)
end

BackendInterfaceQuestsPlayfab.quest_rewards_request_cb = function (self, data, result)
	if result.Error then
		table.dump(result, nil, 5)
		fassert(false, "quest_rewards_request_cb: it failed!")
	else
		local function_result = result.FunctionResult

		if not function_result then
			Managers.backend:playfab_api_error(result)

			return
		elseif function_result.eac_failed_verification then
			Managers.backend:playfab_eac_error()

			return
		end

		local id = data.id
		local items = function_result.items
		local current_quests = function_result.current_quests
		local daily_quest_refresh_available = function_result.daily_quest_refresh_available
		local daily_quest_update_time = function_result.daily_quest_update_time
		local backend_mirror = self._backend_mirror
		local rewards = {
			quest_key = data.quest_key,
			loot = {}
		}
		local loot = rewards.loot

		if items then
			for i = 1, #items, 1 do
				local item = items[i]
				local backend_id = item.ItemInstanceId
				local amount = item.UsesIncrementedBy or 1

				backend_mirror:add_item(backend_id, item)

				loot[i] = {
					backend_id,
					amount
				}
			end
		end

		backend_mirror:set_quest_data(current_quests, daily_quest_refresh_available, daily_quest_update_time)

		self._quest_reward_requests[id] = rewards
		self._dirty = true
	end
end

BackendInterfaceQuestsPlayfab.quest_rewards_generated = function (self, id)
	local request = self._quest_reward_requests[id]

	if request then
		return true
	end

	return false
end

BackendInterfaceQuestsPlayfab.get_quest_rewards = function (self, id)
	return self._quest_reward_requests[id]
end

BackendInterfaceQuestsPlayfab._get_eac_response = function (self, challenge)
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
