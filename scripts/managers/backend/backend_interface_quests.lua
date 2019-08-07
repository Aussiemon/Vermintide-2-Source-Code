require("scripts/managers/backend/data_server_queue")

local function dprint(...)
	print("[BackendInterfaceQuests]", ...)
end

BackendInterfaceQuests = class(BackendInterfaceQuests)

BackendInterfaceQuests.init = function (self)
	self._tokens = {}
	self._initiated = false
	self._active_quest = nil
	self._available_quests = {}
	self._active_contracts = {}
	self._available_contracts = {}
	self._expire_times = nil
	self._reward_queue = {}
end

BackendInterfaceQuests.setup = function (self, data_server_queue)
	self:_register_executors(data_server_queue)

	self._queue = data_server_queue
	local param_config = {
		reset_contracts = true,
		reset_quests = true
	}

	self._queue:add_item("qnc_get_state_1")
end

BackendInterfaceQuests.initiated = function (self)
	return self._initiated
end

BackendInterfaceQuests._register_executors = function (self, queue)
	queue:register_executor("quests", callback(self, "_command_quests"))
	queue:register_executor("contracts", callback(self, "_command_contracts"))
	queue:register_executor("contract_update", callback(self, "_command_contract_update"))
	queue:register_executor("contract_delete", callback(self, "_command_contract_delete"))
	queue:register_executor("quest_update", callback(self, "_command_quest_update"))
	queue:register_executor("quest_delete", callback(self, "_command_quest_delete"))
	queue:register_executor("rewarded", callback(self, "_command_rewarded"))
	queue:register_executor("expire_times", callback(self, "_command_expire_times"))
	queue:register_executor("status", callback(self, "_command_status"))
end

BackendInterfaceQuests._command_quests = function (self, quests)
	dprint("_command_quests")

	self._initiated = true
	self._quests = quests
	self._quests_dirty = true

	table.clear(self._available_quests)

	for quest_id, quest in pairs(quests) do
		if quest.active then
			self._active_quest = quest
		else
			self._available_quests[quest_id] = quest
		end
	end
end

BackendInterfaceQuests._command_contracts = function (self, contracts)
	dprint("_command_contracts")

	self._contracts = contracts
	self._contracts_dirty = true

	table.clear(self._active_contracts)
	table.clear(self._available_contracts)

	for contract_id, contract in pairs(contracts) do
		if contract.active then
			self._active_contracts[contract_id] = contract
		else
			self._available_contracts[contract_id] = contract
		end

		local backend_difficulty = contract.requirements.difficulty
		contract.requirements.difficulty = Difficulties[backend_difficulty]
	end
end

BackendInterfaceQuests._command_contract_update = function (self, contract_update)
	dprint("_command_contract_update")

	self._contracts_dirty = true
	local id = contract_update.id
	local contract = self._contracts[id]
	local data = contract_update.data

	for key, value in pairs(data) do
		contract[key] = value

		if key == "active" then
			if value then
				self._available_contracts[id] = nil
				self._active_contracts[id] = contract
			else
				self._available_contracts[id] = contract
				self._active_contracts[id] = nil
			end
		elseif key == "requirements" then
			local backend_difficulty = value.difficulty
			contract.requirements.difficulty = Difficulties[backend_difficulty]
		end
	end
end

BackendInterfaceQuests._command_contract_delete = function (self, contract_delete)
	dprint("_command_contract_delete")

	self._contracts_dirty = true
	local id = contract_delete.id
	self._contracts[id] = nil
	local active_contracts = self._active_contracts

	if active_contracts[id] then
		active_contracts[id] = nil
	end
end

BackendInterfaceQuests._command_quest_update = function (self, quest_update)
	dprint("_command_quest_update")

	self._quests_dirty = true
	local id = quest_update.id
	local quest = self._quests[id]
	local data = quest_update.data

	for key, value in pairs(data) do
		quest[key] = value

		if key == "active" then
			if value then
				self._available_quests[id] = nil
				self._active_quest = quest
			else
				self._available_quests[id] = quest
				self._active_quest = nil
			end
		end
	end
end

BackendInterfaceQuests._command_quest_delete = function (self, quest_delete)
	dprint("_command_quest_delete")

	self._quests_dirty = true
	local id = quest_delete.id
	self._quests[id] = nil
	local active_quest = self._active_quest

	if active_quest and active_quest.id == id then
		self._active_quest = nil
	end
end

BackendInterfaceQuests._command_rewarded = function (self, rewarded)
	dprint("_command_rewarded")

	for _, reward in ipairs(rewarded) do
		if reward.type == "item" then
			local gui_reward = {
				reward.data
			}

			table.insert(self._reward_queue, reward)
		elseif reward.type == "token" then
			local gui_reward = {
				type = reward.token_type,
				amount = reward.amount
			}

			table.insert(self._reward_queue, reward)
		end
	end
end

BackendInterfaceQuests._command_expire_times = function (self, expire_times)
	dprint("_command_expire_times")

	self._expire_times_dirty = true
	self._expire_times = expire_times
end

BackendInterfaceQuests._command_status = function (self, status)
	dprint("_command_status", status)

	self._status_dirty = true
	self._status = status
end

BackendInterfaceQuests.are_quests_dirty = function (self)
	local dirty = self._quests_dirty
	self._quests_dirty = false

	return dirty
end

BackendInterfaceQuests.get_quests = function (self)
	return self._quests
end

BackendInterfaceQuests.get_available_quests = function (self)
	return self._available_quests
end

BackendInterfaceQuests.get_active_quest = function (self)
	return self._active_quest
end

BackendInterfaceQuests.set_active_quest = function (self, quest_id, active)
	local token = self._queue:add_item("qnc_set_quest_active_1", "quest_id", cjson.encode(quest_id), "active", cjson.encode(active))
	self._tokens[#self._tokens + 1] = token
end

BackendInterfaceQuests.complete_quest = function (self, quest_id)
	local token = self._queue:add_item("qnc_turn_in_quest_1", "quest_id", cjson.encode(quest_id))
	self._tokens[#self._tokens + 1] = token
end

BackendInterfaceQuests.are_contracts_dirty = function (self)
	local dirty = self._contracts_dirty
	self._contracts_dirty = false

	return dirty
end

BackendInterfaceQuests.get_contracts = function (self)
	return self._contracts
end

BackendInterfaceQuests.get_available_contracts = function (self)
	return self._available_contracts
end

BackendInterfaceQuests.get_active_contracts = function (self)
	return self._active_contracts
end

BackendInterfaceQuests.set_contract_active = function (self, contract_id, active)
	local token = self._queue:add_item("qnc_set_contract_active_1", "contract_id", cjson.encode(contract_id), "active", cjson.encode(active))
	self._tokens[#self._tokens + 1] = token
end

BackendInterfaceQuests.add_contract_progress = function (self, contract_id, level, amount)
	local token = self._queue:add_item("qnc_add_contract_progress_1", "contract_id", cjson.encode(contract_id), "level", cjson.encode(level), "task_amount", cjson.encode(amount))
	self._tokens[#self._tokens + 1] = token
end

BackendInterfaceQuests.add_all_contract_progress = function (self, contract_id)
	local token = self._queue:add_item("qnc_add_all_contract_progress_1", "contract_id", cjson.encode(contract_id))
	self._tokens[#self._tokens + 1] = token
end

BackendInterfaceQuests.poll_reward = function (self)
	if not table.is_empty(self._reward_queue) then
		local reward = table.remove(self._reward_queue, 1)

		return reward
	end
end

BackendInterfaceQuests.complete_contract = function (self, contract_id)
	local token = self._queue:add_item("qnc_turn_in_contract_1", "contract_id", cjson.encode(contract_id))
	self._tokens[#self._tokens + 1] = token
end

BackendInterfaceQuests.reset_quests_and_contracts = function (self, reset_quests, reset_contracts)
	local config = cjson.encode({
		reset_quests = reset_quests,
		reset_contracts = reset_contracts
	})
	local token = self._queue:add_item("qnc_reset_1", "param_config", config)
	self._tokens[#self._tokens + 1] = token
	local token2 = self._queue:add_item("qnc_get_state_1")
	self._tokens[#self._tokens + 1] = token2
end

local time_offset = 0

BackendInterfaceQuests.reset_quests_and_contracts_with_time_offset = function (self, reset_quests, reset_contracts, add_time_offset)
	local config = cjson.encode({
		reset_quests = reset_quests,
		reset_contracts = reset_contracts
	})
	local token = self._queue:add_item("qnc_reset_1", "param_config", config)
	self._tokens[#self._tokens + 1] = token

	if add_time_offset then
		time_offset = time_offset + add_time_offset
	else
		time_offset = 0
	end

	local debug_time = os.time() + time_offset
	local token2 = self._queue:add_item("get_quest_state_debug_1", "debug_time", debug_time)
	self._tokens[#self._tokens + 1] = token2
end

BackendInterfaceQuests.query_quests_and_contracts = function (self)
	local token = self._queue:add_item("qnc_get_state_1")
	self._tokens[#self._tokens + 1] = token
end

BackendInterfaceQuests.query_expire_times = function (self)
	dprint("query_expire_times")

	local token = self._queue:add_item("qnc_get_expire_times_1")
	self._tokens[#self._tokens + 1] = token
end

BackendInterfaceQuests.are_expire_times_dirty = function (self)
	local dirty = self._expire_times_dirty
	self._expire_times_dirty = false

	return dirty
end

BackendInterfaceQuests.get_expire_times = function (self)
	return self._expire_times
end

BackendInterfaceQuests.are_status_dirty = function (self)
	local dirty = self._status_dirty
	self._status_dirty = false

	return dirty
end

BackendInterfaceQuests.get_status = function (self)
	return self._status
end

return
