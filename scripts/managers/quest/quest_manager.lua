local quest_templates = require("scripts/managers/quest/quest_templates")
local outline = require("scripts/managers/quest/quest_outline")
local quest_keys = {
	daily = {
		"daily_quest_1",
		"daily_quest_2",
		"daily_quest_3"
	}
}
local stat_names_by_quest_key = {
	daily_quest_1 = {
		"daily_quest_1_stat_1",
		"daily_quest_1_stat_2",
		"daily_quest_1_stat_3"
	},
	daily_quest_2 = {
		"daily_quest_2_stat_1",
		"daily_quest_2_stat_2",
		"daily_quest_2_stat_3"
	},
	daily_quest_3 = {
		"daily_quest_3_stat_1",
		"daily_quest_3_stat_2",
		"daily_quest_3_stat_3"
	}
}
QuestManager = class(QuestManager)

QuestManager.init = function (self, statistics_db)
	self._statistics_db = statistics_db
	local backend_interface_quests = Managers.backend:get_interface("quests")
	local quests = backend_interface_quests:get_quests()
	self._backend_interface_quests = backend_interface_quests

	Managers.state.event:register(self, "event_stat_incremented", "event_stat_incremented")
end

QuestManager.event_stat_incremented = function (self, stats_id, ...)
	local templates = quest_templates.quests
	local statistics_db = self._statistics_db
	local stats = statistics_db:get_all_stats(stats_id)
	local quests = self._backend_interface_quests:get_quests()
	local arg_n = select("#", ...)

	for quest_key, quest_id in pairs(quests) do
		local template = templates[quest_id]
		local stat_mappings = template.stat_mappings

		for i = 1, #stat_mappings, 1 do
			local map = stat_mappings[i]
			local success = true

			for j = 1, arg_n, 1 do
				local arg_value = select(j, ...)
				map = map[arg_value]

				if not map then
					success = false

					break
				end
			end

			if success then
				local stat_name = stat_names_by_quest_key[quest_key][i]

				statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)

				break
			end
		end
	end
end

QuestManager.update = function (self, dt, t)
	local reward_poll_id = self._reward_poll_id
	local player_manager = Managers.player
	local player = player_manager:local_player()

	if not player then
		return
	end

	local stats_id = player:stats_id()

	if reward_poll_id then
		local statistics_db = self._statistics_db
		local backend_interface_quests = self._backend_interface_quests
		local poll_completed = backend_interface_quests:quest_rewards_generated(reward_poll_id)

		if poll_completed then
			local rewards = backend_interface_quests:get_quest_rewards(reward_poll_id)
			local quest_key = rewards.quest_key
			local stat_names = stat_names_by_quest_key[quest_key]

			for i = 1, #stat_names, 1 do
				local stat_name = stat_names[i]

				statistics_db:set_stat(stats_id, "quest_statistics", stat_name, 0)
			end

			Managers.backend:commit()

			self._reward_poll_id = nil
		end
	end

	local refresh_poll_id = self._refresh_poll_id

	if refresh_poll_id then
		local statistics_db = self._statistics_db
		local backend_interface_quests = self._backend_interface_quests
		local poll_completed, quest_key = backend_interface_quests:is_quest_refreshed(refresh_poll_id)

		if poll_completed then
			if quest_key then
				local stat_names = stat_names_by_quest_key[quest_key]

				for i = 1, #stat_names, 1 do
					local stat_name = stat_names[i]

					statistics_db:set_stat(stats_id, "quest_statistics", stat_name, 0)
				end

				Managers.backend:commit()
			end

			self._refresh_poll_id = nil
		end
	end
end

QuestManager.get_quest_outline = function (self)
	local quests = self._backend_interface_quests:get_quests()
	local outline = table.clone(outline)
	local quest_categories = outline.categories

	for i = 1, #quest_categories, 1 do
		local catergory = quest_categories[i]
		local quest_type = catergory.quest_type

		if quest_type == "daily" then
			local entries = catergory.entries
			local keys = quest_keys.daily

			for j = 1, #keys, 1 do
				local key = keys[j]
				local quest_name = quests[key]

				if quest_name then
					entries[#entries + 1] = quest_name
				end
			end
		end
	end

	return outline
end

QuestManager.get_data_by_id = function (self, quest_id)
	local quests = self._backend_interface_quests:get_quests()
	local quest_key = table.find(quests, quest_id)
	local quest_data = quest_templates.quests[quest_id]

	assert(quest_key)
	assert(quest_data)

	local name, desc, completed, progress, requirements, claimed = nil
	local player_manager = Managers.player
	local player = player_manager:local_player()

	if not player then
		return nil, "Missing player"
	end

	local stats_id = player:stats_id()

	if type(quest_data.name) == "function" then
		local status, result = pcall(quest_data.name)

		if status then
			name = result
		else
			Application.warning("Failed to evaluate quest name for %s: %s", quest_id, result)

			name = "<Error>"
		end
	elseif type(quest_data.name) == "string" then
		name = Localize(quest_data.name)
	end

	if type(quest_data.desc) == "function" then
		local status, result = pcall(quest_data.desc)

		if status then
			desc = result
		else
			Application.warning("Failed to evaluate quest desc for %s: %s", quest_id, result)

			desc = "<Error>"
		end
	elseif type(quest_data.desc) == "string" then
		desc = Localize(quest_data.desc)
	end

	if type(quest_data.completed) == "boolean" then
		completed = quest_data.completed
	elseif type(quest_data.completed) == "function" then
		completed = quest_data.completed(self._statistics_db, stats_id, quest_key)
	end

	if type(quest_data.progress) == "table" then
		progress = quest_data.progress
	elseif type(quest_data.progress) == "function" then
		progress = quest_data.progress(self._statistics_db, stats_id, quest_key)
	end

	if type(quest_data.requirements) == "table" then
		requirements = quest_data.requirements
	elseif type(quest_data.requirements) == "function" then
		requirements = quest_data.requirements(self._statistics_db, stats_id, quest_key)
	end

	if requirements then
		for i, requirement in ipairs(requirements) do
			if type(requirement.name) == "string" then
				requirement.name = Localize(requirement.name)
			elseif type(requirement.name) == "function" then
				local status, result = pcall(requirement.name)

				if status then
					requirement.name = result
				else
					Application.warning("Failed to evaluate requirement name for %s: %s", quest_id, result)

					requirement.name = "<Error>"
				end
			end
		end
	end

	local evaluated_quest = {
		claimed = false,
		id = quest_id,
		name = name,
		desc = desc,
		icon = quest_data.icon,
		completed = completed,
		progress = progress,
		requirements = requirements,
		reward = quest_data.reward
	}

	return evaluated_quest
end

QuestManager.refresh_quest = function (self, quest_id)
	if self._reward_poll_id or self._refresh_poll_id then
		return "Polling in progress."
	end

	local quests = self._backend_interface_quests:get_quests()
	local quest_key = table.find(quests, quest_id)
	local backend_interface_quests = self._backend_interface_quests
	local refresh_poll_id = backend_interface_quests:refresh_quest(quest_key)
	self._refresh_poll_id = refresh_poll_id

	return refresh_poll_id
end

QuestManager.polling_quest_refresh = function (self)
	return (self._refresh_poll_id and true) or false
end

QuestManager.can_refresh_quest = function (self)
	local backend_interface_quests = self._backend_interface_quests
	local can_refresh = backend_interface_quests:can_refresh_quest()

	if not can_refresh then
		return nil, "Refresh Unavailable"
	end

	if self._reward_poll_id or self._refresh_poll_id then
		return "Polling in progress."
	end

	return true
end

QuestManager.claim_reward = function (self, quest_id)
	if self._reward_poll_id or self._refresh_poll_id then
		return "Polling in progress."
	end

	local quests = self._backend_interface_quests:get_quests()
	local quest_key = table.find(quests, quest_id)
	local backend_interface_quests = self._backend_interface_quests
	local reward_poll_id = backend_interface_quests:claim_quest_rewards(quest_key)
	self._reward_poll_id = reward_poll_id

	return reward_poll_id
end

QuestManager.polling_quest_reward = function (self)
	return (self._reward_poll_id and true) or false
end

QuestManager.can_claim_quest_rewards = function (self, quest_id)
	local quests = self._backend_interface_quests:get_quests()
	local quest_key = table.find(quests, quest_id)
	local backend_interface_quests = self._backend_interface_quests
	local can_claim = backend_interface_quests:can_claim_quest_rewards(quest_key)

	if not can_claim then
		return nil, "Quest already claimed."
	end

	if self._reward_poll_id or self._refresh_poll_id then
		return "Polling in progress."
	end

	return true
end

QuestManager.time_until_new_daily_quest = function (self)
	local current_utc = os.time(os.date("!*t"))
	local backend_interface_quests = self._backend_interface_quests
	local next_quest_time = backend_interface_quests:get_daily_quest_update_time()
	local difference = next_quest_time - current_utc * 1000
	local difference_in_seconds = difference / 1000

	return difference_in_seconds
end

return
