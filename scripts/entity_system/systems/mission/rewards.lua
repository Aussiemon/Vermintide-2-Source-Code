require("scripts/settings/economy")

local dice_textures = {
	gold = "dice_04",
	metal = "dice_02",
	warpstone = "dice_05",
	wood = "dice_01"
}
local token_textures = {
	iron_tokens = "token_icon_01",
	silver_tokens = "token_icon_03",
	bronze_tokens = "token_icon_02",
	gold_tokens = "token_icon_04"
}
Rewards = class(Rewards)
local EXPERIENCE_REWARD = 400
Rewards.init = function (self, level_key, game_mode_key, quickplay_bonus)
	self._level_key = level_key
	self._game_mode_key = game_mode_key
	self._multiplier = ExperienceSettings.multiplier
	self._end_of_level_loot_id = nil
	self._quickplay_bonus = quickplay_bonus

	return 
end
Rewards.award_end_of_level_rewards = function (self, game_won, hero_name)
	local deed_manager = Managers.deed

	if game_won and deed_manager.has_deed(deed_manager) and not deed_manager.is_deed_owner(deed_manager) then
		self._consuming_deed = true
		self._end_of_level_info = {
			game_won = game_won,
			hero_name = hero_name
		}
		local cb = callback(self, "cb_deed_consumed")

		Managers.deed:consume_deed(cb)
	else
		self._award_end_of_level_rewards(self, game_won, hero_name)
	end

	return 
end
Rewards._award_end_of_level_rewards = function (self, game_won, hero_name)
	local backend_manager = Managers.backend
	local hero_attributes = backend_manager.get_interface(backend_manager, "hero_attributes")
	local start_experience = hero_attributes.get(hero_attributes, hero_name, "experience")
	local deed_item_name, deed_item_backend_id = nil

	if Managers.deed:has_deed() then
		local deed_data, deed_backend_id = Managers.deed:active_deed()
		deed_item_name = deed_data.name
		deed_item_backend_id = deed_backend_id
	end

	self._mission_results = self._mission_results(self, game_won)
	self._start_experience = start_experience
	local level_end, end_experience = self.get_level_end(self)

	self._generate_end_of_level_loot(self, game_won, hero_name, start_experience, end_experience, deed_item_name, deed_item_backend_id)
	hero_attributes.set(hero_attributes, hero_name, "experience", end_experience)
	backend_manager.commit(backend_manager)

	return 
end
Rewards._mission_results = function (self, game_won)
	local game_mode_key = self._game_mode_key
	local mission_results = {}
	local difficulty_manager = Managers.state.difficulty
	local difficulty = difficulty_manager.get_difficulty(difficulty_manager)
	local difficulty_rank = difficulty_manager.get_difficulty_rank(difficulty_manager)

	if game_mode_key == "survival" then
		self._add_missions_from_mission_system(self, mission_results, 1, 1)
	elseif game_won then
		self._add_missions_from_mission_system(self, mission_results, difficulty_rank)

		local mission_complete_reward = {
			text = "mission_completed_" .. difficulty,
			experience = EXPERIENCE_REWARD*self.difficulty_experience_multiplier(self)
		}

		table.insert(mission_results, 1, mission_complete_reward)
	else
		local mission_system = Managers.state.entity:system("mission_system")
		local completed_distance = mission_system.percentage_completed(mission_system) or 0
		local mission_failed_reward = {
			text = "mission_failed_" .. difficulty,
			experience = EXPERIENCE_REWARD*self.difficulty_experience_multiplier(self)*math.clamp(completed_distance, 0.25, math.huge)
		}

		table.insert(mission_results, 1, mission_failed_reward)
	end

	return mission_results
end
Rewards._add_missions_from_mission_system = function (self, mission_rewards, difficulty_rank)
	local mission_rewards_n = 0
	local mission_system = Managers.state.entity:system("mission_system")
	local active_missions, completed_missions = mission_system.get_missions(mission_system)

	for mission_name, data in pairs(completed_missions) do
		if not data.is_goal then
			local experience = data.experience or 0
			local bonus_dice = data.bonus_dice or 0
			local bonus_tokens = data.bonus_tokens or 0
			local dice_type = data.dice_type
			local token_type = data.token_type

			if 0 < experience then
				mission_rewards_n = mission_rewards_n + 1
				mission_rewards[mission_rewards_n] = {
					text = data.mission_data.text,
					experience = experience
				}
			end
		end
	end

	for mission_name, data in pairs(active_missions) do
		if not data.is_goal then
			local mission_template_name = data.mission_data.mission_template_name
			local template = MissionTemplates[mission_template_name]
			local done, amount = template.evaluate_mission(data)

			fassert(not done, "mission was active AND done...")

			local experience = 0
			local bonus_dice = 0
			local dice_type = data.dice_type
			local bonus_tokens = 0
			local token_type = data.token_type

			if data.evaluation_type == "percent" then
				local percent_completed = amount*100
				local experience_per_percent = data.experience_per_percent or 0
				local dice_per_percent = data.dice_per_percent or 0
				local tokens_per_percent = data.tokens_per_percent or 0
				experience = math.ceil(percent_completed*experience_per_percent)
				bonus_dice = math.floor(percent_completed*dice_per_percent)
				bonus_tokens = math.floor(percent_completed*tokens_per_percent)

				if 0 < experience then
					mission_rewards_n = mission_rewards_n + 1
					mission_rewards[mission_rewards_n] = {
						text = data.mission_data.text,
						experience = experience
					}
				end
			elseif data.evaluation_type == "amount" then
				local collected_amount = amount
				local experience_per_amount = data.experience_per_amount or 0
				local dice_per_amount = data.dice_per_amount or 0
				local tokens_per_amount = data.tokens_per_amount or 0
				experience = collected_amount*experience_per_amount
				bonus_dice = collected_amount*dice_per_amount
				bonus_tokens = collected_amount*tokens_per_amount

				if 0 < experience then
					mission_rewards_n = mission_rewards_n + 1
					mission_rewards[mission_rewards_n] = {
						text = data.mission_data.text,
						experience = experience
					}
				end
			end
		end
	end

	return 
end
Rewards._generate_end_of_level_loot = function (self, game_won, hero_name, start_experience, end_experience, deed_item_name, deed_item_backend_id)
	local difficulty_manager = Managers.state.difficulty
	local difficulty = difficulty_manager.get_difficulty(difficulty_manager)
	local mission_system = Managers.state.entity:system("mission_system")
	local num_tomes = 0
	local num_grims = 0
	local num_loot_dice = 0
	local loot_interface = Managers.backend:get_interface("loot")
	local quickplay = self._quickplay_bonus

	if game_won then
		local tome_mission_data = mission_system.get_level_end_mission_data(mission_system, "tome_bonus_mission")
		local grimoire_mission_data = mission_system.get_level_end_mission_data(mission_system, "grimoire_hidden_mission")
		local loot_dice_mission_data = mission_system.get_level_end_mission_data(mission_system, "bonus_dice_hidden_mission")
		num_tomes = (tome_mission_data and tome_mission_data.current_amount) or 0
		num_grims = (grimoire_mission_data and grimoire_mission_data.current_amount) or 0
		num_loot_dice = (loot_dice_mission_data and loot_dice_mission_data.current_amount) or 0
	end

	self._end_of_level_loot_id = loot_interface.generate_end_of_level_loot(loot_interface, game_won, quickplay, difficulty, self._level_key, num_tomes, num_grims, num_loot_dice, hero_name, start_experience, end_experience, deed_item_name, deed_item_backend_id)

	return 
end
Rewards.cb_deed_consumed = function (self)
	self._consuming_deed = nil
	local end_of_level_info = self._end_of_level_info
	self._end_of_level_info = nil
	local game_won = end_of_level_info.game_won
	local hero_name = end_of_level_info.hero_name

	self._award_end_of_level_rewards(self, game_won, hero_name)

	return 
end
Rewards.rewards_generated = function (self)
	local loot_interface = Managers.backend:get_interface("loot")
	local loot_id = self._end_of_level_loot_id

	if loot_id then
		local loot_generated = loot_interface.is_loot_generated(loot_interface, loot_id)

		if loot_generated then
			local deed_manager = Managers.deed

			if deed_manager.has_deed(deed_manager) and deed_manager.is_deed_owner(deed_manager) then
				deed_manager.consume_deed(deed_manager)
			end
		end

		return loot_generated
	end

	return false
end
Rewards.consuming_deed = function (self)
	return self._consuming_deed
end
Rewards.get_rewards = function (self)
	local loot_interface = Managers.backend:get_interface("loot")
	local loot_id = self._end_of_level_loot_id
	local loot = loot_interface.get_loot(loot_interface, loot_id)

	return loot
end
Rewards.get_mission_results = function (self)
	return self._mission_results
end
Rewards.get_level_start = function (self)
	local start_experience = self._start_experience or 0

	return ExperienceSettings.get_level(start_experience), start_experience
end
Rewards.get_level_end = function (self)
	local mission_results = self._mission_results
	local gained_xp = 0

	for _, mission_reward in ipairs(mission_results) do
		gained_xp = gained_xp + (mission_reward.experience or 0)
	end

	local start_experience = self._start_experience or 0
	local experience = math.min(start_experience + gained_xp, ExperienceSettings.max_experience)

	return ExperienceSettings.get_level(experience), experience
end
Rewards.difficulty_experience_multiplier = function (self)
	local difficulty_manager = Managers.state.difficulty
	local difficulty_settings = difficulty_manager.get_difficulty_settings(difficulty_manager)
	local xp_multiplier = difficulty_settings.xp_multiplier or 1

	return xp_multiplier
end

return 
