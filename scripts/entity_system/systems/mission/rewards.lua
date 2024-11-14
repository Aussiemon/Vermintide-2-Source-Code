-- chunkname: @scripts/entity_system/systems/mission/rewards.lua

require("scripts/settings/economy")

local dice_textures = {
	gold = "dice_04",
	metal = "dice_02",
	warpstone = "dice_05",
	wood = "dice_01",
}
local token_textures = {
	bronze_tokens = "token_icon_02",
	gold_tokens = "token_icon_04",
	iron_tokens = "token_icon_01",
	silver_tokens = "token_icon_03",
}

Rewards = class(Rewards)

local EXPERIENCE_REWARD = 800
local FIRST_TIME_LEVEL_EXPERIENCE = 500

Rewards.init = function (self, level_key, game_mode_key, quickplay_bonus)
	self._level_key = level_key
	self._game_mode_key = game_mode_key
	self._multiplier = ExperienceSettings.multiplier
	self._end_of_level_loot_id = nil
	self._quickplay_bonus = quickplay_bonus
end

Rewards.award_end_of_level_rewards = function (self, game_won, hero_name, is_in_event_game_mode, game_time, end_of_level_rewards_arguments, extra_mission_results)
	local deed_manager = Managers.deed

	if game_won and deed_manager:has_deed() and not deed_manager:is_deed_owner() then
		print("Awarding end of level rewards, found deed! Waiting for owner to consume.")

		self._consuming_deed = true
		self._end_of_level_info = {
			game_won = game_won,
			hero_name = hero_name,
			game_time = game_time,
			end_of_level_rewards_arguments = end_of_level_rewards_arguments,
		}

		local cb = callback(self, "cb_deed_consumed")

		Managers.deed:consume_deed(cb)
	else
		self._end_of_level_info = {
			game_won = game_won,
		}

		local loot_profile_name = is_in_event_game_mode and "event" or "default"

		self:_award_end_of_level_rewards(game_won, hero_name, loot_profile_name, game_time, end_of_level_rewards_arguments, extra_mission_results)
	end
end

Rewards._award_end_of_level_rewards = function (self, game_won, hero_name, loot_profile_name, game_time, end_of_level_rewards_arguments, extra_mission_results)
	local backend_manager = Managers.backend
	local hero_attributes = backend_manager:get_interface("hero_attributes")
	local start_experience = hero_attributes:get(hero_name, "experience")
	local start_experience_pool = hero_attributes:get(hero_name, "experience_pool")
	local versus_interface = backend_manager:get_interface("versus")
	local versus_start_experience = versus_interface:get_profile_data("experience")

	self._versus_start_experience = versus_start_experience

	local deed_item_name, deed_item_backend_id

	if Managers.deed:has_deed() then
		print("Awarding end of level rewards, found deed!")

		local deed_data, deed_backend_id = Managers.deed:active_deed()

		deed_item_name = deed_data.name
		deed_item_backend_id = deed_backend_id
	end

	self._mission_results = self:_mission_results(game_won, extra_mission_results, end_of_level_rewards_arguments)
	self._start_experience = start_experience
	self._start_experience_pool = start_experience_pool

	local win_track_interface = Managers.backend:get_interface("win_tracks")

	if win_track_interface then
		local win_track_id = win_track_interface:get_current_win_track_id()
		local start_win_track_experience = win_track_interface:get_win_track_experience(win_track_id)

		self._start_win_track_experience = start_win_track_experience
	end

	local level_end, end_experience = self:get_level_end()
	local versus_level_end, versus_end_experience = self:get_versus_level_end()

	self:_generate_end_of_level_loot(game_won, hero_name, start_experience, end_experience, versus_start_experience, versus_end_experience, loot_profile_name, deed_item_name, deed_item_backend_id, game_time, end_of_level_rewards_arguments)
end

Rewards._mission_results = function (self, game_won, extra_mission_results, end_of_level_rewards_arguments)
	local game_mode_key = self._game_mode_key
	local mission_results = {}
	local difficulty_manager = Managers.state.difficulty
	local difficulty = difficulty_manager:get_difficulty()
	local difficulty_rank = difficulty_manager:get_difficulty_rank()
	local allow_commendation = true

	if game_won then
		if game_mode_key == "weave" then
			local difficulty_settings = difficulty_manager:get_difficulty_settings()
			local weave_settings = difficulty_settings.weave_settings
			local experience_reward = weave_settings.experience_reward_on_complete

			mission_results[1] = {
				affected_by_multipliers = true,
				text = "end_screen_mission_completed",
				experience = experience_reward,
			}
		elseif game_mode_key == "versus" then
			local settings = Managers.state.game_mode:settings()
			local experience_settings = settings.experience

			mission_results[#mission_results + 1] = {
				affected_by_multipliers = true,
				text = "vs_match_won",
				experience = experience_settings.win_match,
			}
		elseif game_mode_key == "deus" then
			local expedition_complete_reward = {
				affected_by_multipliers = true,
				text = "expedition_completed_" .. difficulty,
				experience = EXPERIENCE_REWARD,
			}

			table.insert(mission_results, 1, expedition_complete_reward)
		else
			self:_add_missions_from_mission_system(mission_results, difficulty_rank)

			local mission_complete_reward = {
				affected_by_multipliers = true,
				text = "end_screen_mission_completed",
				experience = EXPERIENCE_REWARD,
			}

			table.insert(mission_results, 1, mission_complete_reward)
		end

		if game_mode_key == "adventure" and end_of_level_rewards_arguments.first_time_completion then
			mission_results[#mission_results + 1] = {
				text = "xp_first_time_completion",
				experience = FIRST_TIME_LEVEL_EXPERIENCE,
				format_values = {
					{
						localize = true,
						value = end_of_level_rewards_arguments.ingame_display_name,
					},
				},
			}
		end
	elseif game_mode_key == "weave" then
		local difficulty_settings = difficulty_manager:get_difficulty_settings()
		local weave_settings = difficulty_settings.weave_settings
		local experience_reward = weave_settings.experience_reward_on_complete
		local mission_system = Managers.state.entity:system("mission_system")
		local percentages_completed = mission_system:percentages_completed()
		local best_completed_distance = 0

		for _, completed_distance in pairs(percentages_completed) do
			if best_completed_distance < completed_distance then
				best_completed_distance = completed_distance
			end
		end

		local current_level_settings = LevelHelper:current_level_settings()
		local disable_percentage_completed = current_level_settings and current_level_settings.disable_percentage_completed

		best_completed_distance = disable_percentage_completed and 0 or math.clamp(best_completed_distance, 0, 1)

		local mission_failed_reward = {
			affected_by_multipliers = true,
			text = "mission_failed",
			experience = experience_reward * best_completed_distance,
		}

		table.insert(mission_results, 1, mission_failed_reward)
	elseif game_mode_key == "versus" then
		local settings = Managers.state.game_mode:settings()
		local experience_settings = settings.experience
		local mission_failed_reward = {
			affected_by_multipliers = true,
			text = "mission_failed",
			experience = experience_settings.lose_match,
		}

		table.insert(mission_results, 1, mission_failed_reward)
	elseif game_mode_key == "deus" then
		local mission_system = Managers.state.entity:system("mission_system")
		local percentages_completed = mission_system:percentages_completed()
		local best_completed_distance = 0

		for _, completed_distance in pairs(percentages_completed) do
			if best_completed_distance < completed_distance then
				best_completed_distance = completed_distance
			end
		end

		local current_level_settings = LevelHelper:current_level_settings()
		local disable_percentage_completed = current_level_settings and current_level_settings.disable_percentage_completed

		best_completed_distance = disable_percentage_completed and 0 or math.clamp(best_completed_distance, 0, 1)

		local expedition_failed_reward = {
			affected_by_multipliers = true,
			text = difficulty == "cataclysm" and "expedition_failed_cataclysm" or "expedition_failed",
			experience = EXPERIENCE_REWARD * best_completed_distance,
		}

		table.insert(mission_results, 1, expedition_failed_reward)
	else
		local mission_system = Managers.state.entity:system("mission_system")
		local percentages_completed = mission_system:percentages_completed()
		local best_completed_distance = 0

		for _, completed_distance in pairs(percentages_completed) do
			if best_completed_distance < completed_distance then
				best_completed_distance = completed_distance
			end
		end

		local current_level_settings = LevelHelper:current_level_settings()
		local disable_percentage_completed = current_level_settings and current_level_settings.disable_percentage_completed

		best_completed_distance = disable_percentage_completed and 0 or math.clamp(best_completed_distance, 0, 1)

		local mission_failed_reward = {
			affected_by_multipliers = true,
			text = "mission_failed_" .. difficulty,
			experience = EXPERIENCE_REWARD * best_completed_distance,
		}

		table.insert(mission_results, 1, mission_failed_reward)
	end

	if game_mode_key == "versus" then
		local settings = Managers.state.game_mode:settings()
		local experience_settings = settings.experience

		allow_commendation = false

		table.insert(mission_results, 1, {
			affected_by_multipliers = true,
			text = "vs_match_completed",
			experience = experience_settings.complete_match,
		})

		mission_results[#mission_results + 1] = {
			affected_by_multipliers = true,
			text = "vs_rounds_played",
			experience = Managers.mechanism:game_mechanism():num_sets() * experience_settings.rounds_played,
		}

		local statistics_db = Managers.venture.statistics
		local profile_synchronizer = Managers.mechanism:profile_synchronizer()
		local players_session_score = Managers.mechanism:get_players_session_score(statistics_db, profile_synchronizer)
		local stats_id = Managers.player:local_player():unique_id()
		local local_player_session_score = players_session_score[stats_id]
		local scores = local_player_session_score and local_player_session_score.scores or {}
		local hero_kills = scores and scores.kills_heroes or 0
		local hero_kill_score = hero_kills * experience_settings.hero_kills
		local special_kills = scores and scores.kills_specials or 0
		local special_kill_score = special_kills * experience_settings.special_kills

		mission_results[#mission_results + 1] = {
			affected_by_multipliers = true,
			text = "vs_scoreboard_eliminations",
			experience = hero_kill_score + special_kill_score,
		}

		local num_finished_challenges = 0
		local stored_challenge_progression_status = Managers.mechanism:get_stored_challenge_progression_status()
		local end_challenge_progression_status = Managers.mechanism:get_challenge_progression_status()

		for challenge_name, progression_status in pairs(stored_challenge_progression_status) do
			local end_status = end_challenge_progression_status[challenge_name]

			if progression_status < 1 and end_status == 1 then
				num_finished_challenges = num_finished_challenges + 1
			end
		end

		local challenge_score = experience_settings.challenges

		mission_results[#mission_results + 1] = {
			affected_by_multipliers = true,
			text = "achv_menu_achievements_category_title",
			experience = num_finished_challenges * challenge_score,
			value = num_finished_challenges,
		}
	end

	if extra_mission_results then
		for _, extra_mission_result in ipairs(extra_mission_results) do
			extra_mission_result.experience = extra_mission_result.experience
			extra_mission_result.affected_by_multipliers = true
			mission_results[#mission_results + 1] = extra_mission_result
		end
	end

	local experience_affected_by_multipliers = 0
	local num_results = #mission_results

	for i = 1, num_results do
		local mission_result = mission_results[i]

		if mission_result.affected_by_multipliers then
			experience_affected_by_multipliers = experience_affected_by_multipliers + mission_result.experience
		end
	end

	local multipliers = self:_experience_multipliers(allow_commendation)
	local num_multipliers = #multipliers

	if num_multipliers > 0 then
		local game_mode_settings = Managers.state.game_mode:settings()
		local max_rewards = game_mode_settings.max_num_rewards_displayed or 0
		local can_display_all = max_rewards >= num_results + num_multipliers

		if can_display_all then
			for i = 1, num_multipliers do
				local data = multipliers[i]
				local multiplier = data.multiplier

				mission_results[#mission_results + 1] = {
					text = data.text,
					format_values = {
						{
							value = multiplier,
						},
					},
					experience = experience_affected_by_multipliers * (multiplier - 1),
				}
			end
		else
			local total_multiplier = 1

			for i = 1, num_multipliers do
				total_multiplier = total_multiplier + (multipliers[i].multiplier - 1)
			end

			if max_rewards <= num_results then
				for i = 1, num_results do
					local result = mission_results

					if result.experience then
						result.experience = result.experience * total_multiplier
					end
				end
			else
				mission_results[#mission_results + 1] = {
					text = "xp_multipliers",
					format_values = {
						{
							value = total_multiplier,
						},
					},
					experience = experience_affected_by_multipliers * (total_multiplier - 1),
				}
			end
		end
	end

	return mission_results
end

Rewards._add_missions_from_mission_system = function (self, mission_rewards, difficulty_rank)
	local mission_rewards_n = 0
	local mission_system = Managers.state.entity:system("mission_system")
	local active_missions, completed_missions = mission_system:get_missions()

	for mission_name, data in pairs(completed_missions) do
		if not data.is_goal and not data.mission_data.disable_rewards then
			local experience = data.experience or 0
			local bonus_dice = data.bonus_dice or 0
			local bonus_tokens = data.bonus_tokens or 0
			local dice_type = data.dice_type
			local token_type = data.token_type

			if experience > 0 then
				mission_rewards_n = mission_rewards_n + 1
				mission_rewards[mission_rewards_n] = {
					text = data.mission_data.text,
					experience = experience,
				}
			end
		end
	end

	for mission_name, data in pairs(active_missions) do
		if not data.is_goal and not data.mission_data.disable_rewards then
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
				local percent_completed = amount * 100
				local experience_per_percent = data.experience_per_percent or 0
				local dice_per_percent = data.dice_per_percent or 0
				local tokens_per_percent = data.tokens_per_percent or 0

				experience = math.ceil(percent_completed * experience_per_percent)
				bonus_dice = math.floor(percent_completed * dice_per_percent)
				bonus_tokens = math.floor(percent_completed * tokens_per_percent)

				if experience > 0 then
					mission_rewards_n = mission_rewards_n + 1
					mission_rewards[mission_rewards_n] = {
						affected_by_multipliers = true,
						text = data.mission_data.text,
						experience = experience,
					}
				end
			elseif data.evaluation_type == "amount" then
				local collected_amount = amount
				local experience_per_amount = data.experience_per_amount or 0
				local dice_per_amount = data.dice_per_amount or 0
				local tokens_per_amount = data.tokens_per_amount or 0

				experience = collected_amount * experience_per_amount
				bonus_dice = collected_amount * dice_per_amount
				bonus_tokens = collected_amount * tokens_per_amount

				if experience > 0 then
					mission_rewards_n = mission_rewards_n + 1
					mission_rewards[mission_rewards_n] = {
						affected_by_multipliers = true,
						text = data.mission_data.text,
						experience = experience,
					}
				end
			end
		end
	end
end

Rewards._generate_end_of_level_loot = function (self, game_won, hero_name, start_experience, end_experience, versus_start_experience, versus_end_experience, loot_profile_name, deed_item_name, deed_item_backend_id, game_time, end_of_level_rewards_arguments)
	local difficulty_manager = Managers.state.difficulty
	local difficulty = difficulty_manager:get_difficulty()
	local loot_interface = Managers.backend:get_interface("loot")
	local quickplay = self._quickplay_bonus

	self._end_of_level_loot_id = loot_interface:generate_end_of_level_loot(game_won, quickplay, difficulty, self._level_key, hero_name, start_experience, end_experience, versus_start_experience, versus_end_experience, loot_profile_name, deed_item_name, deed_item_backend_id, self._game_mode_key, game_time, end_of_level_rewards_arguments)
	self._end_of_level_rewards_arguments = end_of_level_rewards_arguments
	self._is_loot_handled = false
end

Rewards.cb_deed_consumed = function (self)
	print("Deed has been consumed callback!")

	self._consuming_deed = nil

	local end_of_level_info = self._end_of_level_info

	self._end_of_level_info = nil

	local game_won = end_of_level_info.game_won
	local hero_name = end_of_level_info.hero_name
	local loot_profile_name = "default"
	local game_time = end_of_level_info.game_time
	local end_of_level_rewards_arguments = end_of_level_info.end_of_level_rewards_arguments

	self:_award_end_of_level_rewards(game_won, hero_name, loot_profile_name, game_time, end_of_level_rewards_arguments)
end

Rewards.rewards_generated = function (self)
	local loot_interface = Managers.backend:get_interface("loot")
	local loot_id = self._end_of_level_loot_id

	if loot_id then
		local loot_generated = loot_interface:is_loot_generated(loot_id)

		if loot_generated then
			local deed_manager = Managers.deed

			if deed_manager:has_deed() and deed_manager:is_deed_owner() and not self._sent_consuming_deed then
				deed_manager:consume_deed()

				self._sent_consuming_deed = true
			end

			if not self._is_loot_handled then
				local rewards = loot_interface:get_loot(loot_id)

				for k, v in pairs(rewards) do
					if string.find(k, "experience_reward") == 1 then
						self._mission_results[#self._mission_results + 1] = {
							text = "bonus_experience_earned",
							experience = v.amount,
						}
					end
				end

				self._is_loot_handled = true
			end

			if not self._backend_mission_results_evaluated then
				self:_evaluate_backend_mission_results()
			end
		end

		return loot_generated
	end

	return false
end

Rewards._evaluate_backend_mission_results = function (self)
	local game_mode_key = self._game_mode_key

	if game_mode_key == "versus" and self._end_of_level_info.game_won then
		local settings = Managers.state.game_mode:settings()
		local experience_settings = settings.experience
		local versus_interface = Managers.backend:get_interface("versus")
		local first_win_of_the_day_timestamp = versus_interface:get_profile_data("first_win_of_the_day_timestamp") or 0
		local last_win_timestamp = versus_interface:get_profile_data("last_win_timestamp") or 0

		if last_win_timestamp == first_win_of_the_day_timestamp then
			table.insert(self._mission_results, 3, {
				text = "vs_first_win_of_the_day",
				experience = experience_settings.first_win_of_the_day,
			})
		end
	end

	self._end_of_level_info = nil
	self._backend_mission_results_evaluated = true
end

Rewards.consuming_deed = function (self)
	return self._consuming_deed
end

Rewards.get_rewards = function (self)
	local loot_interface = Managers.backend:get_interface("loot")
	local loot_id = self._end_of_level_loot_id
	local loot = loot_interface:get_loot(loot_id)

	return loot, self._end_of_level_rewards_arguments
end

Rewards.get_end_of_level_rewards_arguments = function (self)
	return self._end_of_level_rewards_arguments
end

Rewards.get_mission_results = function (self)
	return self._mission_results
end

Rewards.get_level_start = function (self)
	local start_experience = self._start_experience or 0
	local start_experience_pool = self._start_experience_pool or 0

	return ExperienceSettings.get_level(start_experience), start_experience, start_experience_pool
end

Rewards.get_versus_level_start = function (self)
	local versus_start_experience = self._versus_start_experience or 0

	return ExperienceSettings.get_versus_level_from_experience(versus_start_experience), versus_start_experience
end

Rewards.get_win_track_experience_start = function (self)
	return self._start_win_track_experience
end

Rewards.get_level_end = function (self)
	local mission_results = self._mission_results
	local gained_xp = 0

	for _, mission_reward in ipairs(mission_results) do
		gained_xp = gained_xp + (mission_reward.experience or 0)
	end

	local start_experience = self._start_experience or 0
	local experience = start_experience + gained_xp

	return ExperienceSettings.get_level(experience), experience
end

Rewards.get_versus_level_end = function (self)
	local mission_results = self._mission_results
	local gained_xp = 0

	for _, mission_reward in ipairs(mission_results) do
		gained_xp = gained_xp + (mission_reward.experience or 0)
	end

	local start_experience = self._versus_start_experience or 0
	local experience = start_experience + gained_xp

	return ExperienceSettings.get_versus_level_from_experience(experience), experience
end

Rewards._experience_multipliers = function (self, allow_commendation)
	local multipliers = {}
	local backend_manager = Managers.backend
	local event_xp_multiplier = backend_manager:get_title_data("experience_multiplier") or 1

	if event_xp_multiplier > 1 then
		multipliers[#multipliers + 1] = {
			text = "xp_multiplier_event",
			multiplier = event_xp_multiplier,
		}
	end

	local difficulty_manager = Managers.state.difficulty
	local difficulty_settings = difficulty_manager:get_difficulty_settings()
	local xp_multiplier = difficulty_settings.xp_multiplier or 1

	if xp_multiplier > 1 then
		multipliers[#multipliers + 1] = {
			text = "xp_multiplier_difficulty",
			multiplier = xp_multiplier,
		}
	end

	if allow_commendation then
		local hero_commendation = ExperienceSettings.hero_commendation_experience_multiplier()

		if hero_commendation > 1 then
			multipliers[#multipliers + 1] = {
				text = "xp_multiplier_hero_commendation",
				multiplier = hero_commendation,
			}
		end
	end

	return multipliers
end
