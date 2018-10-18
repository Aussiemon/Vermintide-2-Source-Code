local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
BackendInterfaceQuestsPlayfab = class(BackendInterfaceQuestsPlayfab)

BackendInterfaceQuestsPlayfab.init = function (self, backend_mirror)
	self._backend_mirror = backend_mirror
	self._quests = {}
	self._last_id = 0
	self._refresh_requests = {}
	self._quest_reward_requests = {}
	self._quests_updating = false
	self._quest_timer = 0
	self._event_quest_update_times = {}

	self:_refresh()
end

BackendInterfaceQuestsPlayfab._refresh = function (self)
	local talents = self._talents
	local backend_mirror = self._backend_mirror
	local quest_data = backend_mirror:get_quest_data()
	self._quests.daily = quest_data.current_daily_quests
	self._quests.event = quest_data.current_event_quests
	local weekly_quests = {}

	for quest_id, quest in pairs(quest_data.current_weekly_quests) do
		local quest_copy = table.clone(quest)

		if quest.difficulty then
			quest_copy.name = quest.name .. "_" .. quest.difficulty
		else
			quest_copy.name = quest.name
		end

		weekly_quests[quest_id] = quest_copy
	end

	self._quests.weekly = weekly_quests
	self._refresh_available = quest_data.daily_quest_refresh_available
	self._daily_quest_update_time = quest_data.daily_quest_update_time / 1000
	local weekly_quest_update_time = quest_data.weekly_quest_update_time

	if weekly_quest_update_time ~= nil then
		self._weekly_quest_update_time = weekly_quest_update_time / 1000
	end

	for key, data in pairs(self._quests.event) do
		self._event_quest_update_times[key] = data.end_time / 1000
	end

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
	local request_quest_update = false
	local daily_update_time = self:get_daily_quest_update_time() - self._quest_timer

	if daily_update_time < 0 and not self._quests_updating then
		request_quest_update = true
	end

	local weekly_update_time = self:get_weekly_quest_update_time()

	if weekly_update_time then
		weekly_update_time = weekly_update_time - self._quest_timer

		if weekly_update_time < 0 and not self._quests_updating then
			request_quest_update = true
		end
	end

	for key, data in pairs(self._quests.event) do
		local update_time = self:get_time_left_on_event_quest(key) - self._quest_timer

		if update_time < 0 and not self._quests_updating then
			request_quest_update = true

			break
		end
	end

	if request_quest_update then
		local request = {
			FunctionName = "getQuests"
		}
		local success_callback = callback(self, "get_quests_cb")
		local request_queue = self._backend_mirror:request_queue()

		request_queue:enqueue(request, success_callback, false)

		self._quests_updating = true
	end

	self._quest_timer = self._quest_timer + dt
end

BackendInterfaceQuestsPlayfab.get_quests_cb = function (self, result)
	local backend_mirror = self._backend_mirror
	local function_result = result.FunctionResult
	local current_daily_quests = function_result.current_daily_quests
	local daily_quest_refresh_available = function_result.daily_quest_refresh_available
	local daily_quest_update_time = function_result.daily_quest_update_time
	local current_weekly_quests = function_result.current_weekly_quests
	local weekly_quest_update_time = function_result.weekly_quest_update_time
	local current_event_quests = function_result.current_event_quests

	backend_mirror:set_quest_data("current_daily_quests", current_daily_quests)
	backend_mirror:set_quest_data("daily_quest_refresh_available", to_boolean(daily_quest_refresh_available))
	backend_mirror:set_quest_data("daily_quest_update_time", tonumber(daily_quest_update_time))
	backend_mirror:set_quest_data("current_weekly_quests", current_weekly_quests)
	backend_mirror:set_quest_data("weekly_quest_update_time", tonumber(weekly_quest_update_time))
	backend_mirror:set_quest_data("current_event_quests", current_event_quests)

	self._quests_updating = false
	self._dirty = true
	self._quest_timer = 0
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

	return self._daily_quest_update_time - self._quest_timer
end

BackendInterfaceQuestsPlayfab.get_weekly_quest_update_time = function (self)
	if self._dirty then
		self:_refresh()
	end

	if not self._weekly_quest_update_time then
		return nil
	end

	return self._weekly_quest_update_time - self._quest_timer
end

BackendInterfaceQuestsPlayfab.get_time_left_on_event_quest = function (self, key)
	if self._dirty then
		self:_refresh()
	end

	return self._event_quest_update_times[key] - self._quest_timer
end

BackendInterfaceQuestsPlayfab.can_refresh_daily_quest = function (self)
	if self._dirty then
		self:_refresh()
	end

	return self._refresh_available
end

BackendInterfaceQuestsPlayfab.refresh_daily_quest = function (self, key)
	local id = self:_new_id()
	local request = {
		FunctionName = "refreshQuest",
		FunctionParameter = {
			quest_key = key
		}
	}
	local success_callback = callback(self, "refresh_quest_cb", id, key)
	local request_queue = self._backend_mirror:request_queue()

	request_queue:enqueue(request, success_callback, false)

	return id
end

BackendInterfaceQuestsPlayfab.refresh_quest_cb = function (self, id, key, result)
	local backend_mirror = self._backend_mirror
	local function_result = result.FunctionResult

	if function_result == "refresh_unavailable" then
		Managers.backend:playfab_error(BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_QUEST_REFRESH_UNAVAILABLE)

		self._refresh_requests[id] = {}

		return
	end

	local current_daily_quests = function_result.current_daily_quests
	local daily_quest_refresh_available = function_result.daily_quest_refresh_available

	backend_mirror:set_quest_data("current_daily_quests", current_daily_quests)
	backend_mirror:set_quest_data("daily_quest_refresh_available", to_boolean(daily_quest_refresh_available))

	self._refresh_requests[id] = {
		quest_key = key
	}
	self._dirty = true
end

BackendInterfaceQuestsPlayfab.is_quest_refreshed = function (self, id)
	local refresh_request = self._refresh_requests[id]

	if refresh_request then
		return true, refresh_request.quest_key
	end

	return false
end

BackendInterfaceQuestsPlayfab.can_claim_quest_rewards = function (self, key)
	local quests = self:get_quests()
	local daily_quests = self._quests.daily
	local weekly_quests = self._quests.weekly
	local event_quests = self._quests.event

	if daily_quests[key] or weekly_quests[key] or event_quests[key] then
		return true
	end

	return false
end

BackendInterfaceQuestsPlayfab.claim_quest_rewards = function (self, key)
	local id = self:_new_id()
	local data = {
		quest_key = key,
		id = id
	}
	local request = {
		FunctionName = "generateQuestRewards",
		FunctionParameter = data
	}
	local success_callback = callback(self, "quest_rewards_request_cb", data)
	local request_queue = self._backend_mirror:request_queue()

	request_queue:enqueue(request, success_callback, true)

	return id
end

BackendInterfaceQuestsPlayfab.quest_rewards_request_cb = function (self, data, result)
	local function_result = result.FunctionResult

	if not function_result then
		Managers.backend:playfab_api_error(result)

		return
	end

	local id = data.id
	local items = function_result.items
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

	local current_daily_quests = function_result.current_daily_quests
	local current_weekly_quests = function_result.current_weekly_quests
	local current_event_quests = function_result.current_event_quests

	backend_mirror:set_quest_data("current_daily_quests", current_daily_quests)
	backend_mirror:set_quest_data("current_weekly_quests", current_weekly_quests)
	backend_mirror:set_quest_data("current_event_quests", current_event_quests)

	self._quest_reward_requests[id] = rewards
	self._dirty = true
end

BackendInterfaceQuestsPlayfab.get_quest_key = function (self, quest_id)
	local quests = self:get_quests()
	local daily_quests = quests.daily
	local weekly_quests = quests.weekly
	local event_quests = quests.event

	for quest_key, quest_data in pairs(daily_quests) do
		local id = quest_data.name

		if id == quest_id then
			return quest_key
		end
	end

	for quest_key, quest_data in pairs(weekly_quests) do
		local id = quest_data.name

		if id == quest_id then
			return quest_key
		end
	end

	for quest_key, quest_data in pairs(event_quests) do
		local id = quest_data.name

		if id == quest_id then
			return quest_key
		end
	end

	return nil
end

BackendInterfaceQuestsPlayfab.get_quest_by_key = function (self, key)
	local quests = self:get_quests()
	local daily_quests = quests.daily
	local weekly_quests = quests.weekly
	local event_quests = quests.event

	for quest_key, quest_data in pairs(daily_quests) do
		if key == quest_key then
			return quest_data
		end
	end

	for quest_key, quest_data in pairs(weekly_quests) do
		if key == quest_key then
			return quest_data
		end
	end

	for quest_key, quest_data in pairs(event_quests) do
		if key == quest_key then
			return quest_data
		end
	end

	return nil
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

return
