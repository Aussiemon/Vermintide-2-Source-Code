local quest_templates = require("scripts/managers/quest/quest_templates")
local outline = require("scripts/managers/quest/quest_outline")
local quest_keys = {}
local quest_rules = QuestSettings.rules

for quest_type, data in pairs(quest_rules) do
	local stat_prefix = string.format("%s_quest", quest_type)
	local quests = {}

	for i = 1, data.max_quests do
		local quest_name = string.format("%s_%d", stat_prefix, i)
		quests[#quests + 1] = quest_name
	end

	quest_keys[quest_type] = quests
end

QuestManager = class(QuestManager)

QuestManager.init = function (self, statistics_db)
	self._statistics_db = statistics_db
	local backend_interface_quests = Managers.backend:get_interface("quests")
	self._backend_interface_quests = backend_interface_quests

	Managers.state.event:register(self, "event_stat_incremented", "event_stat_incremented")
	Managers.state.event:register(self, "on_achievement_event", "on_achievement_event")
	self:on_quests_updated()
end

QuestManager.event_stat_incremented = function (self, stats_id, ...)
	local quests = self._backend_interface_quests:get_quests()
	local daily_quests = quests.daily
	local weekly_quests = quests.weekly
	local event_quests = quests.event

	if daily_quests then
		self:_increment_quest_stats(daily_quests, stats_id, ...)
	end

	if weekly_quests then
		self:_increment_quest_stats(weekly_quests, stats_id, ...)
	end

	if event_quests then
		self:_increment_quest_stats(event_quests, stats_id, ...)
	end
end

QuestManager.on_achievement_event = function (self, event_name, event_data)
	local quests = self._backend_interface_quests:get_quests()
	local event_quests = quests.event
	local templates = quest_templates.quests
	local statistics_db = self._statistics_db
	local local_player = Managers.player:local_player()
	local stats_id = local_player:stats_id()
	local event_mappings = self._quest_event_mapping
	local registered_quests = event_mappings[event_name]

	if registered_quests then
		for i = 1, #registered_quests do
			local quest_key = registered_quests[i]
			local quest_data = event_quests[quest_key]

			if quest_data and not quest_data.completed then
				local quest_name = quest_data.name
				local template = templates[quest_name]

				template.on_event(statistics_db, stats_id, nil, event_name, event_data, quest_key)
			end
		end
	end
end

QuestManager._increment_quest_stats = function (self, quests, stats_id, ...)
	local templates = quest_templates.quests
	local statistics_db = self._statistics_db
	local arg_n = select("#", ...)

	for quest_key, quest_data in pairs(quests) do
		local quest_name = quest_data.name
		local template = templates[quest_name]

		if template then
			local stat_mappings = template.stat_mappings

			if stat_mappings then
				for i = 1, #stat_mappings do
					local map = stat_mappings[i]
					local success = true

					for j = 1, arg_n do
						local arg_value = select(j, ...)
						map = map[arg_value]

						if not map then
							success = false

							break
						end
					end

					if success then
						local stat_name = QuestSettings.stat_mappings[quest_key][i]

						statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)

						break
					end
				end
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

			if type(quest_key) == "string" then
				local stat_names = QuestSettings.stat_mappings[quest_key]

				for i = 1, #stat_names do
					local stat_name = stat_names[i]

					statistics_db:set_stat(stats_id, "quest_statistics", stat_name, 0)
				end
			else
				for i = 1, #quest_key do
					local quest_key = quest_key[i]
					local stat_names = QuestSettings.stat_mappings[quest_key]

					for i = 1, #stat_names do
						local stat_name = stat_names[i]

						statistics_db:set_stat(stats_id, "quest_statistics", stat_name, 0)
					end
				end
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
				local stat_names = QuestSettings.stat_mappings[quest_key]

				for i = 1, #stat_names do
					local stat_name = stat_names[i]

					statistics_db:set_stat(stats_id, "quest_statistics", stat_name, 0)
				end

				Managers.backend:commit()
			end

			self._refresh_poll_id = nil
		end
	end
end

local quest_exist_warning = {}

QuestManager.get_quest_outline = function (self)
	local quests = self._backend_interface_quests:get_quests()
	local outline = table.clone(outline)
	local quest_categories = outline.categories

	for quest_list_name, quest_list in pairs(quests) do
		local category_table = nil

		for _, categories in ipairs(quest_categories) do
			if categories.quest_type == quest_list_name then
				category_table = categories

				break
			end
		end

		for backend_quest_key, quest_data in pairs(quest_list) do
			local quest_key = quest_data.name
			local quest_type = quest_data.type
			local category_name = quest_data.category_name
			local quest_exists = quest_templates.quests[quest_key] ~= nil

			if not quest_exists and not table.contains(quest_exist_warning, quest_key) then
				Application.warning("[QuestManager] Quest does not exist for id %s", quest_key)
				table.insert(quest_exist_warning, quest_key)
			end

			if quest_exists then
				if category_name then
					if not category_table.categories then
						category_table.categories = {}
					end

					local categories = category_table.categories
					local quest_type_category = nil

					for index, category in ipairs(categories) do
						if category.name == category_name then
							quest_type_category = category

							break
						end
					end

					if not quest_type_category then
						quest_type_category = {
							type = "quest",
							entries = {},
							name = category_name
						}
						categories[#categories + 1] = quest_type_category
					end

					local category_entries = quest_type_category.entries
					category_entries[#category_entries + 1] = quest_key
				else
					local entries = category_table.entries
					entries[#entries + 1] = quest_key
				end
			end
		end
	end

	return outline
end

QuestManager.get_data_by_id = function (self, quest_id)
	local backend_interface_quests = self._backend_interface_quests
	local quest_key = backend_interface_quests:get_quest_key(quest_id)
	local templates = quest_templates.quests
	local quest_data = templates[quest_id]
	local claimed_quests = backend_interface_quests:get_claimed_event_quests()

	fassert(quest_key, "Trying to fetch data for quest %q not found in user's quest list.", quest_id)
	fassert(quest_data, "Quest %q does not exist in quest_templates.", quest_id)

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
		completed = quest_data.completed(self._statistics_db, stats_id, quest_key, templates, claimed_quests)
	end

	if type(quest_data.progress) == "table" then
		progress = quest_data.progress
	elseif type(quest_data.progress) == "function" then
		progress = quest_data.progress(self._statistics_db, stats_id, quest_key, templates, claimed_quests)
	end

	if type(quest_data.requirements) == "table" then
		requirements = quest_data.requirements
	elseif type(quest_data.requirements) == "function" then
		requirements = quest_data.requirements(self._statistics_db, stats_id, quest_key, templates, claimed_quests)
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

	local icon = quest_data.icon
	local reward = quest_data.reward
	local required_dlc = nil
	local backend_quest_data = backend_interface_quests:get_quest_by_key(quest_key)

	if backend_quest_data and backend_quest_data.reward then
		reward = backend_quest_data.reward
	end

	local evaluated_quest = {
		claimed = false,
		id = quest_id,
		name = name,
		desc = desc,
		icon = icon,
		required_dlc = required_dlc,
		summary_icon = quest_data.summary_icon,
		completed = completed,
		progress = progress,
		requirements = requirements,
		reward = reward
	}

	return evaluated_quest
end

QuestManager.has_any_unclaimed_quests = function (self)
	local outline = self:get_quest_outline()

	for _, category in ipairs(outline.categories) do
		local entries = category.entries

		if entries then
			for _, entry in ipairs(entries) do
				local entry_data = self:get_data_by_id(entry)

				if entry_data and entry_data.completed and not entry_data.claimed then
					return true
				end
			end
		end
	end

	return false
end

QuestManager.can_refresh_daily_quest = function (self)
	local backend_interface_quests = self._backend_interface_quests
	local can_refresh = backend_interface_quests:can_refresh_daily_quest()

	if not can_refresh then
		return nil, "Refresh Unavailable"
	end

	if self._reward_poll_id or self._refresh_poll_id then
		return nil, "Polling in progress."
	end

	return true
end

QuestManager.refresh_daily_quest = function (self, quest_id)
	local backend_interface_quests = self._backend_interface_quests
	local quest_key = backend_interface_quests:get_quest_key(quest_id)
	local refresh_poll_id = backend_interface_quests:refresh_daily_quest(quest_key)
	self._refresh_poll_id = refresh_poll_id

	return refresh_poll_id
end

QuestManager.polling_quest_refresh = function (self)
	return self._refresh_poll_id and true or false
end

QuestManager.claim_reward = function (self, quest_id)
	if self._reward_poll_id or self._refresh_poll_id then
		return nil, "Polling in progress."
	end

	local backend_interface_quests = self._backend_interface_quests
	local quest_key = backend_interface_quests:get_quest_key(quest_id)

	if not quest_key then
		return nil, "Unable to find active quest"
	end

	local reward_poll_id = backend_interface_quests:claim_quest_rewards(quest_key)
	self._reward_poll_id = reward_poll_id

	return reward_poll_id
end

QuestManager.claim_multiple_quest_rewards = function (self, quest_ids)
	if self._reward_poll_id or self._refresh_poll_id then
		return nil, "Polling in progress."
	end

	local backend_interface_quests = self._backend_interface_quests
	local claimable_quest_keys = {}

	for i = 1, #quest_ids do
		local quest_id = quest_ids[i]
		local quest_key = backend_interface_quests:get_quest_key(quest_id)

		if quest_key then
			claimable_quest_keys[#claimable_quest_keys + 1] = quest_key
		end
	end

	if table.is_empty(claimable_quest_keys) then
		return nil, "Unable to find any of the quests"
	end

	local reward_poll_id = backend_interface_quests:claim_multiple_quest_rewards(claimable_quest_keys)
	self._reward_poll_id = reward_poll_id

	return reward_poll_id
end

QuestManager.polling_quest_reward = function (self)
	return self._reward_poll_id and true or false
end

QuestManager.can_claim_quest_rewards = function (self, quest_id)
	local backend_interface_quests = self._backend_interface_quests
	local quest_key = backend_interface_quests:get_quest_key(quest_id)

	if not quest_key then
		return nil, "Quest not currently active"
	end

	local can_claim = backend_interface_quests:can_claim_quest_rewards(quest_key)

	if not can_claim then
		return nil, "Quest already claimed."
	end

	if self._reward_poll_id or self._refresh_poll_id then
		return nil, "Polling in progress."
	end

	return true
end

QuestManager.can_claim_multiple_quest_rewards = function (self, quest_ids)
	local backend_interface_quests = self._backend_interface_quests
	local claimable_quest_keys = {}

	for i = 1, #quest_ids do
		local quest_id = quest_ids[i]
		local quest_key = backend_interface_quests:get_quest_key(quest_id)

		if quest_key then
			claimable_quest_keys[#claimable_quest_keys + 1] = quest_key
		end
	end

	if table.is_empty(claimable_quest_keys) then
		return nil, nil, "No quest currently active"
	end

	local can_claim, claimable_keys = backend_interface_quests:can_claim_multiple_quest_rewards(claimable_quest_keys)

	if not can_claim then
		return nil, nil, "Quest already claimed."
	end

	if self._reward_poll_id or self._refresh_poll_id then
		return nil, nil, "Polling in progress."
	end

	return true, claimable_keys
end

QuestManager.time_until_new_daily_quest = function (self)
	local backend_interface_quests = self._backend_interface_quests
	local next_quest_time = backend_interface_quests:get_daily_quest_update_time()

	return next_quest_time
end

QuestManager.time_until_new_weekly_quest = function (self)
	local backend_interface_quests = self._backend_interface_quests
	local next_quest_time = backend_interface_quests:get_weekly_quest_update_time()

	return next_quest_time
end

QuestManager.time_left_on_event_quest = function (self)
	local backend_interface_quests = self._backend_interface_quests
	local quests = backend_interface_quests:get_quests()
	local event_quests = quests.event

	if event_quests and not table.is_empty(event_quests) then
		local keys = quest_keys.event

		for i = 1, #keys do
			local key = keys[i]
			local quest_data = event_quests[key]

			if quest_data then
				local time_left = backend_interface_quests:get_time_left_on_event_quest(key)

				return time_left
			end
		end
	end

	return 0
end

QuestManager.update_quests = function (self)
	local backend_interface_quests = self._backend_interface_quests

	if backend_interface_quests.update_quests then
		backend_interface_quests:update_quests(callback(self, "on_quests_updated"))
	end
end

local EMPTY_TABLE = {}

QuestManager.on_quests_updated = function (self)
	local quest_event_mapping = {}
	local quests = self._backend_interface_quests:get_quests()
	local event_quests = quests.event or EMPTY_TABLE
	local templates = quest_templates.quests

	for quest_key, quest_data in pairs(event_quests) do
		local quest_name = quest_data.name
		local template = templates[quest_name]
		local events = template and template.events

		if events then
			for i = 1, #events do
				local event_name = events[i]
				quest_event_mapping[event_name] = quest_event_mapping[event_name] or {}
				quest_event_mapping[event_name][#quest_event_mapping[event_name] + 1] = quest_key
			end
		end
	end

	self._quest_event_mapping = quest_event_mapping
end
