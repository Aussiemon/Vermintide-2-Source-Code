require("scripts/managers/quest/contract_templates")
require("scripts/managers/quest/quest_templates")
require("scripts/managers/quest/quest_contract_texts")
require("scripts/settings/quest_settings")

local QuestTextSettings = QuestTextSettings
local NUM_QUEST_GIVERS = table.size(QuestTextSettings.quest_givers)
QuestManager = class(QuestManager)
QuestManager.init = function (self, statistics_db, level_key)
	local backend_settings = GameSettingsDevelopment.backend_settings

	if backend_settings.quests_enabled then
		local statistics_db = statistics_db
		local difficulty_manager = Managers.state.difficulty
		local difficulty_rank = difficulty_manager.get_difficulty_rank(difficulty_manager)

		Managers.state.event:register(self, "difficulty_synced", "difficulty_set")

		self.evaluation_params = {
			statistics_db = statistics_db,
			level_key = level_key,
			difficulty_rank = difficulty_rank
		}
		local quest_interface = Managers.backend:get_interface("quests")

		quest_interface.are_contracts_dirty(quest_interface)
		quest_interface.are_quests_dirty(quest_interface)
		quest_interface.are_expire_times_dirty(quest_interface)

		self.quest_interface = quest_interface
		self.session_progress = {}
		self.all_quests = quest_interface.get_quests(quest_interface)
		self.active_quest = quest_interface.get_active_quest(quest_interface)
		self.available_quests = quest_interface.get_available_quests(quest_interface)
		self.all_contracts = quest_interface.get_contracts(quest_interface)
		self.active_contracts = quest_interface.get_active_contracts(quest_interface)
		self.available_contracts = quest_interface.get_available_contracts(quest_interface)
		self.status = quest_interface.get_status(quest_interface)
	end

	return 
end
QuestManager.evaluate_level_end = function (self, statistics_db, level_key)
	local backend_settings = GameSettingsDevelopment.backend_settings

	if backend_settings.quests_enabled then
		local params = self.evaluation_params
		local active_contracts = self.active_contracts
		local session_progress = self.session_progress

		for contract_id, contract in pairs(active_contracts) do
			self._commit_contract_progress(self, contract_id, contract, params)

			local contract_session_progress = session_progress[contract_id]

			if contract_session_progress then
				contract_session_progress.commited = true
			end
		end
	end

	return 
end
QuestManager.difficulty_set = function (self)
	local params = self.evaluation_params

	if params then
		local difficulty_manager = Managers.state.difficulty
		local difficulty_rank = difficulty_manager.get_difficulty_rank(difficulty_manager)
		params.difficulty_rank = difficulty_rank
	end

	return 
end
QuestManager.update = function (self, statistics_db, dt, t)
	local quest_interface = self.quest_interface
	self.all_quests = quest_interface.get_quests(quest_interface)
	self.active_quest = quest_interface.get_active_quest(quest_interface)
	self.available_quests = quest_interface.get_available_quests(quest_interface)
	self.all_contracts = quest_interface.get_contracts(quest_interface)
	self.active_contracts = quest_interface.get_active_contracts(quest_interface)
	self.available_contracts = quest_interface.get_available_contracts(quest_interface)
	local session_progress = self.session_progress
	local active_contracts = self.active_contracts
	local params = self.evaluation_params

	for contract_id, contract in pairs(active_contracts) do
		if not self._progress_valid(self, contract, params) then
			local contract_session_progress = session_progress[contract_id]

			if contract_session_progress and not contract_session_progress.commited then
				session_progress[contract_id] = nil
			end
		else
			if not session_progress[contract_id] then
				session_progress[contract_id] = {
					changed = false,
					commited = false,
					amount = 0
				}
			end

			local progress = session_progress[contract_id]
			local amount = progress.amount
			local session_amount = self._calculate_contract_session_progress(self, contract, params, false)

			if amount ~= session_amount then
				local task = contract.requirements.task
				local amount = task.amount
				local acquired = amount.acquired
				local required = amount.required
				local missing_progress = required - acquired
				progress.amount = math.min(session_amount, missing_progress)
				progress.changed = true
			end
		end
	end

	if self._poll then
		self._poll_backend(self, dt, t)
	end

	return 
end
QuestManager.has_contract_session_changes = function (self, contract_id)
	local session_progress = self.session_progress
	local progress = session_progress[contract_id]

	if progress then
		local changed = progress.changed
		progress.changed = false

		return changed
	end

	return 
end
QuestManager.get_session_progress_by_contract_id = function (self, contract_id)
	local session_progress = self.session_progress
	local progress = session_progress[contract_id]

	if progress then
		return progress.amount
	end

	return 
end
QuestManager._progress_valid = function (self, contract, params)
	local requirements = contract.requirements
	local level_key = params.level_key
	local required_level = requirements.level

	if required_level and required_level ~= level_key then
		return false
	end

	local difficulty_rank = params.difficulty_rank
	local required_difficulty = requirements.difficulty

	if required_difficulty then
		local required_rank = DifficultySettings[required_difficulty].rank
		local correct_difficulty = required_rank <= difficulty_rank

		if not correct_difficulty then
			return false
		end
	end

	local task = requirements.task

	if task then
		local amount = task.amount
		local acquired = amount.acquired
		local required = amount.required

		if required <= acquired then
			return false
		end
	end

	return true
end
local SPECIALS = {}

for breed_name, breed in pairs(Breeds) do
	if breed.special then
		SPECIALS[#SPECIALS + 1] = breed_name
	end
end

QuestManager._calculate_contract_session_progress = function (self, contract, params, finished_level)
	local requirements = contract.requirements
	local task = requirements.task

	if task then
		local task_type = task.type
		local statistics_db = params.statistics_db
		local stats_id = Managers.player:local_player(1):stats_id()
		local mission_system = Managers.state.entity:system("mission_system")

		if task_type == "level" then
			return (finished_level and 1) or 0
		elseif task_type == "ogre" then
			local local_player = Managers.player:local_player()
			local stats_id = local_player.stats_id(local_player)
			local player_killed = statistics_db.get_stat(statistics_db, stats_id, "kills_per_breed", "skaven_rat_ogre")
			local player_assists = statistics_db.get_stat(statistics_db, stats_id, "kill_assists_per_breed", "skaven_rat_ogre")

			return player_killed + player_assists
		elseif task_type == "tome" then
			local mission_data = mission_system.get_level_end_mission_data(mission_system, "tome_bonus_mission")
			local num_collected = (mission_data and mission_data.get_current_amount(mission_data)) or 0

			return num_collected
		elseif task_type == "grimoire" then
			local mission_data = mission_system.get_level_end_mission_data(mission_system, "grimoire_hidden_mission")
			local num_collected = (mission_data and mission_data.get_current_amount(mission_data)) or 0

			return num_collected
		elseif task_type == "grenade_kills" then
			local local_player = Managers.player:local_player()
			local stats_id = local_player.stats_id(local_player)
			local player_killed = statistics_db.get_stat(statistics_db, stats_id, "kills_grenade")
			local player_assists = statistics_db.get_stat(statistics_db, stats_id, "kill_assists_grenade")
			local grenade_kills = player_killed + player_assists

			return grenade_kills
		elseif task_type == "open_chests" then
			return statistics_db.get_stat(statistics_db, "session", "chests_opened")
		elseif task_type == "damage_taken_individual" then
			local local_player = Managers.player:local_player()
			local stats_id = local_player.stats_id(local_player)
			local dmg_taken = statistics_db.get_stat(statistics_db, stats_id, "damage_taken")
			local join_percent = statistics_db.get_stat(statistics_db, stats_id, "level_progress_on_join")
			local progress_percent = statistics_db.get_stat(statistics_db, "session", "level_progress") - join_percent
			local allowed_damage = 300
			local penalty = math.max(dmg_taken/allowed_damage, 1)

			return math.floor(progress_percent/penalty)
		elseif task_type == "avoid_deaths_team" then
			local allowed_deaths = 0
			local starting_points = 4
			local deaths = statistics_db.get_stat(statistics_db, "session", "deaths")

			return starting_points - math.max(0, deaths - allowed_deaths)
		elseif task_type == "avoid_specials_damage_team" then
			local allowed_damage = 150
			local damage = 0

			for _, breed_name in ipairs(SPECIALS) do
				damage = damage + statistics_db.get_stat(statistics_db, "session", "damage_taken_per_breed", breed_name)
			end

			local penalty = math.max(damage/allowed_damage, 1)

			return math.floor(penalty/100)
		elseif task_type == "avoid_globadier_damage_individual" then
			local local_player = Managers.player:local_player()
			local stats_id = local_player.stats_id(local_player)
			local dmg_taken = statistics_db.get_stat(statistics_db, stats_id, "damage_taken_per_breed", "skaven_poison_wind_globadier")
			local join_percent = statistics_db.get_stat(statistics_db, stats_id, "level_progress_on_join")
			local progress_percent = statistics_db.get_stat(statistics_db, "session", "level_progress") - join_percent
			local allowed_damage = 75
			local penalty = math.max(dmg_taken/allowed_damage, 1)

			return math.floor(progress_percent/penalty)
		end

		fassert(false, "trying to calculate session progress on a contract with an unsuported task: %s", task_type)
	end

	return 0
end
QuestManager._commit_contract_progress = function (self, contract_id, contract, params)
	if not self._progress_valid(self, contract, params) then
		return 
	end

	local task_amount = self._calculate_contract_session_progress(self, contract, params, true)
	local local_player = Managers.player:local_player(1)
	local requirements = contract.requirements
	local task = requirements.task

	if task and local_player then
		local acquired = task.amount.acquired
		local required = task.amount.required
		local progress = acquired + task_amount
		local difficulty = Managers.state.difficulty:get_difficulty()

		Managers.telemetry.events:contract_progress(local_player, task.type, acquired, task_amount, required, required <= progress, params.level_key, contract.requirements, difficulty)
	end

	if 0 < task_amount then
		local level_key = params.level_key

		self.quest_interface:add_contract_progress(contract_id, level_key, task_amount)
	end

	return 
end
QuestManager.get_contract_progress = function (self, contract_id)
	local contract = self.get_contract_by_id(self, contract_id)
	local task = contract.requirements.task

	if not task then
		return 0
	end

	local progress = task.amount.acquired

	return progress
end
QuestManager.has_contract_progressed = function (self, contract_id)
	local progress = self.get_contract_progress(self, contract_id)

	if progress and 0 < progress then
		return true
	end

	return false
end
QuestManager.get_contracts = function (self)
	return self.all_contracts
end
QuestManager.get_available_contracts = function (self)
	return self.available_contracts
end
QuestManager.get_contract_by_id = function (self, contract_id)
	local quest_interface = self.quest_interface
	local contracts = quest_interface.get_contracts(quest_interface)
	local contract = contracts[contract_id]

	return contract
end
QuestManager.accept_contract_by_id = function (self, contract_id)
	local quest_interface = self.quest_interface

	quest_interface.set_contract_active(quest_interface, contract_id, true)

	return 
end
QuestManager.decline_contract_by_id = function (self, contract_id)
	local quest_interface = self.quest_interface

	quest_interface.set_contract_active(quest_interface, contract_id, false)

	return 
end
QuestManager.complete_contract_by_id = function (self, contract_id)
	local quest_interface = self.quest_interface

	quest_interface.complete_contract(quest_interface, contract_id)

	return 
end
QuestManager.is_contract_requirements_met_by_id = function (self, contract_id)
	local contract = self.get_contract_by_id(self, contract_id)
	local requirements_met = contract.requirements_met

	return requirements_met
end
local active_contract_ids = {}
QuestManager.get_active_contract_ids = function (self)
	table.clear(active_contract_ids)

	local quest_interface = self.quest_interface
	local active_contracts = self.active_contracts

	for contract_id, data in pairs(active_contracts) do
		active_contract_ids[#active_contract_ids + 1] = contract_id
	end

	return active_contract_ids
end
QuestManager.get_active_contracts = function (self)
	local active_contracts = self.active_contracts

	return active_contracts
end
QuestManager.is_contract_able_to_progress = function (self, contract_id)
	local params = self.evaluation_params
	local contract = self.get_contract_by_id(self, contract_id)
	local progress_valid = self._progress_valid(self, contract, params)

	return progress_valid
end
QuestManager.are_contracts_dirty = function (self)
	local quest_interface = self.quest_interface
	local dirty = quest_interface.are_contracts_dirty(quest_interface)

	return dirty
end
QuestManager.get_title_for_contract_id = function (self, contract_id)
	local contract = self.get_contract_by_id(self, contract_id)
	local task = contract.requirements.task
	local task_type = task and task.type
	local dlc_type = contract.type
	local titles = QuestSettings.task_type_titles[task_type]
	local title = Localize(titles[1])

	return title
end
QuestManager.get_description_for_contract_id = function (self, contract_id)
	local contract = self.get_contract_by_id(self, contract_id)
	local task = contract.requirements.task
	local task_type = task and task.type

	if task_type == "grimoire" then
		task_type = "grim"
	end

	local start_seed = self.get_random_seed_from_id(self, contract_id)
	local max_range = QuestTextSettings.task_type_max_range[task_type]

	if not max_range then
		printf("QuestManager:get_description_for_contract_id() ERROR! Missing max_range for task type %q in QuestSettings, defaulting to 1", task_type)

		max_range = 1
	end

	local seed, value = Math.next_random(start_seed, max_range)
	local index = (value < 10 and "0" .. tostring(value)) or tostring(value)
	local localization_key = "dlc1_3_1_task_description_" .. task_type .. "_" .. index

	return localization_key
end
QuestManager.get_quest_progress = function (self, quest_id)
	local quest = self.get_quest_by_id(self, quest_id)
	local progress = quest.requirements.task.amount.acquired

	return progress
end
QuestManager.has_quest_progressed = function (self, contract_id)
	local progress = self.get_quest_progress(self, contract_id)

	if progress and 0 < progress then
		return true
	end

	return false
end
QuestManager.get_quests = function (self)
	return self.all_quests
end
QuestManager.get_available_quests = function (self)
	return self.available_quests
end
QuestManager.get_quest_by_id = function (self, quest_id)
	local quest_interface = self.quest_interface
	local quests = quest_interface.get_quests(quest_interface)
	local quest = quests[quest_id]

	return quest
end
QuestManager.accept_quest_by_id = function (self, quest_id)
	local quest_interface = self.quest_interface

	self.quest_interface:set_active_quest(quest_id, true)

	return 
end
QuestManager.decline_quest_by_id = function (self, quest_id)
	local quest_interface = self.quest_interface

	quest_interface.set_active_quest(quest_interface, quest_id, false)

	return 
end
QuestManager.complete_quest_by_id = function (self, quest_id)
	local quest_interface = self.quest_interface

	quest_interface.complete_quest(quest_interface, quest_id)

	return 
end
QuestManager.is_quest_requirements_met_by_id = function (self, quest_id)
	local quest = self.get_quest_by_id(self, quest_id)
	local requirements_met = quest.requirements_met

	return requirements_met
end
QuestManager.get_active_quest = function (self)
	local active_quest = self.active_quest

	return active_quest
end
QuestManager.are_quests_dirty = function (self)
	local quest_interface = self.quest_interface
	local dirty = quest_interface.are_quests_dirty(quest_interface)

	return dirty
end
QuestManager.get_title_for_quest_id = function (self, quest_id)
	local quest = self.get_quest_by_id(self, quest_id)
	local start_seed = self.get_random_seed_from_id(self, quest_id)
	local seed, value = Math.next_random(start_seed, NUM_QUEST_GIVERS)
	local giver = QuestTextSettings.quest_givers[value]
	local max_range = QuestTextSettings.quest_giver_max_range[giver]
	seed, value = Math.next_random(seed, max_range)
	local index = (value < 10 and "0" .. tostring(value)) or tostring(value)
	local localization_key = "dlc1_3_1_quest_title_" .. giver .. "_" .. index

	return localization_key
end
QuestManager.get_description_for_quest_id = function (self, quest_id)
	local quest = self.get_quest_by_id(self, quest_id)
	local start_seed = self.get_random_seed_from_id(self, quest_id)
	local seed, value = Math.next_random(start_seed, NUM_QUEST_GIVERS)
	local giver = QuestTextSettings.quest_givers[value]
	local max_range = QuestTextSettings.quest_giver_max_range[giver]
	seed, value = Math.next_random(seed, max_range)
	local index = (value < 10 and "0" .. tostring(value)) or tostring(value)
	local localization_key = "dlc1_3_1_quest_description_" .. giver .. "_" .. index

	return localization_key
end
QuestManager._refresh_expire_times = function (self)
	self.quest_interface:query_expire_times()

	self._query_expire_times = true

	return 
end
QuestManager._update_expire_times = function (self, dt, t)
	local quest_interface = self.quest_interface

	if quest_interface.are_expire_times_dirty(quest_interface) then
		self.expire_times = quest_interface.get_expire_times(quest_interface)
		local lowest_time_left = math.min(self.expire_times.quests_ttl, self.expire_times.contracts_ttl)
		self._expire_check_cooldown = math.min(lowest_time_left + QuestSettings.EXPIRE_CHECK_MARGIN, QuestSettings.EXPIRE_CHECK_COOLDOWN)
		self._query_expire_times = nil
	end

	if self.expire_times then
		local quests_expired = self.has_time_expired(self, self.expire_times.quests_ttl)
		local contracts_expired = self.has_time_expired(self, self.expire_times.contracts_ttl)
		self.quests_expired = quests_expired
		self.contracts_expired = contracts_expired

		if quests_expired or contracts_expired then
			self.query_quests_and_contracts(self)
		elseif not self._query_expire_times then
			self._expire_check_cooldown = self._expire_check_cooldown - dt

			if self._expire_check_cooldown <= 0 then
				self._refresh_expire_times(self)
			end
		end
	end

	return 
end
QuestManager.has_quests_expired = function (self)
	return self.quests_expired
end
QuestManager.has_contracts_expired = function (self)
	return self.contracts_expired
end
QuestManager.are_status_dirty = function (self)
	local quest_interface = self.quest_interface
	local dirty = quest_interface.are_status_dirty(quest_interface)

	return dirty
end
QuestManager.get_status = function (self)
	return self.status
end
QuestManager.set_poll_active = function (self, poll)
	self._poll = poll

	if poll and not self.expire_times then
		self.query_quests_and_contracts(self)
	end

	return 
end
QuestManager.query_quests_and_contracts = function (self)
	local quest_interface = self.quest_interface

	quest_interface.query_quests_and_contracts(quest_interface)

	self._query_quests_and_contracts = true

	return 
end
QuestManager.is_querying_quests_and_contracts = function (self)
	return self._query_quests_and_contracts
end
QuestManager.prepare_for_new_quests_and_contracts = function (self)
	local expire_times = self.expire_times

	if expire_times then
		local duration = QuestSettings.PREPARE_MENU_FOR_SYNC_DURATION
		local lowest_time_left = math.min(self.expire_times.quests_ttl, self.expire_times.contracts_ttl)

		if lowest_time_left < QuestSettings.EXPIRE_CHECK_COOLDOWN and self._expire_check_cooldown < duration then
			return true
		end
	end

	return false
end
QuestManager.is_quests_and_contracts_dirty = function (self)
	return self._quests_and_contracts_dirty
end
QuestManager._poll_backend = function (self, dt, t)
	local dirty_quests = self.are_quests_dirty(self)
	local dirty_contracts = self.are_contracts_dirty(self)
	local dirty = dirty_quests or dirty_contracts

	if self._query_quests_and_contracts then
		if dirty then
			self._query_quests_and_contracts = nil

			self._refresh_expire_times(self)
		end
	else
		self._update_expire_times(self, dt, t)
	end

	self._quests_and_contracts_dirty = dirty

	return 
end
QuestManager.poll_reward = function (self)
	local quest_interface = self.quest_interface
	local reward = quest_interface.poll_reward(quest_interface)

	return reward
end
QuestManager.get_random_seed_from_id = function (self, id)
	local id_seed = nil

	if type(id) == "number" then
		id_seed = id
	else
		id_seed = id.sub(id, -12, -6) + id.sub(id, -6)
	end

	local seed = Math.next_random(id_seed)

	return seed
end
QuestManager.has_time_expired = function (self, ttl)
	return ttl < 0
end

return 
