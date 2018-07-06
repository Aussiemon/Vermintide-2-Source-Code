local Unit_alive = Unit.alive
local Unit_get_data = Unit.get_data
StatisticsUtil = {}
local StatisticsUtil = StatisticsUtil

StatisticsUtil.register_kill = function (victim_unit, damage_data, statistics_db, is_server)
	local attacker_unit = AiUtils.get_actual_attacker_unit(damage_data[DamageDataIndex.ATTACKER])
	local damaging_unit = damage_data[DamageDataIndex.DAMAGING_UNIT]
	local player_manager = Managers.player
	local attacker_player = player_manager:owner(attacker_unit)
	local grenade_kill = false
	local breed = Unit_get_data(victim_unit, "breed")

	if attacker_player then
		local stats_id = attacker_player:stats_id()

		statistics_db:increment_stat(stats_id, "kills_total")

		if breed ~= nil then
			local breed_name = breed.name
			local print_message = breed.awards_positive_reinforcement_message

			if print_message then
				local predicate = "killed_special"
				local local_human = not attacker_player.remote and not attacker_player.bot_player
				local profile_index = attacker_player:profile_index()
				local stats_id = attacker_player:stats_id()
				local attacker_player_unit = attacker_player.player_unit

				if Unit.alive(attacker_player_unit) then
					local career_extension = ScriptUnit.extension(attacker_player_unit, "career_system")
					local career_index = (career_extension and career_extension:career_index()) or attacker_player:career_index()

					Managers.state.event:trigger("add_coop_feedback_kill", stats_id .. breed_name, local_human, predicate, profile_index, career_index, breed_name)
				end
			end

			statistics_db:increment_stat(stats_id, "kills_per_breed", breed_name)

			local hit_zone = damage_data[DamageDataIndex.HIT_ZONE]

			if hit_zone == "head" then
				statistics_db:increment_stat(stats_id, "headshots")
			end

			local damage_source = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]
			local master_list_item = rawget(ItemMasterList, damage_source)

			if master_list_item then
				local slot_type = master_list_item.slot_type

				if slot_type == "melee" then
					statistics_db:increment_stat(stats_id, "kills_melee")
				elseif slot_type == "ranged" then
					statistics_db:increment_stat(stats_id, "kills_ranged")
				end
			end
		end
	end

	if (breed ~= nil and breed.elite) or breed.boss then
		local human_and_bot_players = player_manager:human_and_bot_players()

		for _, player in pairs(human_and_bot_players) do
			if player ~= attacker_player then
				local stats_id = player:stats_id()

				if breed ~= nil then
					local breed_name = breed.name

					statistics_db:increment_stat(stats_id, "kill_assists_per_breed", breed_name)
				end
			end
		end
	end
end

StatisticsUtil.check_save = function (savior_unit, enemy_unit)
	local blackboard = BLACKBOARDS[enemy_unit]
	local saved_unit = blackboard.target_unit
	local player_manager = Managers.player

	if not savior_unit or not saved_unit then
		return
	end

	local savior_is_player = player_manager:is_player_unit(savior_unit)
	local saved_is_player = player_manager:is_player_unit(saved_unit)

	if not savior_is_player or not saved_is_player then
		return
	end

	local savior_player = player_manager:owner(savior_unit)
	local saved_player = player_manager:owner(saved_unit)

	if savior_player == saved_player then
		return
	end

	local saved_unit_dir = nil
	local network_manager = Managers.state.network
	local game = network_manager:game()
	local game_object_id = game and network_manager:unit_game_object_id(saved_unit)

	if game_object_id then
		saved_unit_dir = Vector3.normalize(Vector3.flat(GameSession.game_object_field(game, game_object_id, "aim_direction")))
	else
		saved_unit_dir = Quaternion.forward(Unit.local_rotation(saved_unit, 0))
	end

	local enemy_unit_dir = Quaternion.forward(Unit.local_rotation(enemy_unit, 0))
	local saved_unit_pos = POSITION_LOOKUP[saved_unit]
	local enemy_unit_pos = POSITION_LOOKUP[enemy_unit]
	local attack_dir = saved_unit_pos - enemy_unit_pos
	local is_behind = Vector3.distance(saved_unit_pos, enemy_unit_pos) < 3 and Vector3.dot(attack_dir, saved_unit_dir) > 0 and Vector3.dot(attack_dir, enemy_unit_dir) > 0
	local status_ext = ScriptUnit.extension(saved_unit, "status_system")
	local grabber_unit = status_ext:get_pouncer_unit() or status_ext:get_pack_master_grabber()
	local is_disabled = status_ext:is_disabled()
	local predicate = nil
	local statistics_db = player_manager:statistics_db()
	local savior_player_stats_id = savior_player:stats_id()

	if enemy_unit == grabber_unit then
		predicate = "save"

		statistics_db:increment_stat(savior_player_stats_id, "saves")
	elseif is_behind or is_disabled then
		predicate = "aid"

		statistics_db:increment_stat(savior_player_stats_id, "aidings")
	end

	if predicate then
		local local_human = not savior_player.remote and not savior_player.bot_player

		Managers.state.event:trigger("add_coop_feedback", savior_player_stats_id .. saved_player:stats_id(), local_human, predicate, savior_player, saved_player)

		local buff_extension = ScriptUnit.extension(saved_unit, "buff_system")

		buff_extension:trigger_procs("on_assisted", savior_unit, enemy_unit)

		local savior_buff_extension = ScriptUnit.extension(savior_unit, "buff_system")

		savior_buff_extension:trigger_procs("on_assisted_ally", saved_unit, enemy_unit)

		local network_transmit = Managers.state.network.network_transmit
		local savior_player_id = savior_player:network_id()
		local savior_local_player_id = savior_player:local_player_id()
		local saved_player_id = saved_player:network_id()
		local saved_local_player_id = saved_player:local_player_id()
		local predicate_id = NetworkLookup.coop_feedback[predicate]
		local enemy_unit_id = network_manager:unit_game_object_id(enemy_unit)

		network_transmit:send_rpc_clients("rpc_assist", savior_player_id, savior_local_player_id, saved_player_id, saved_local_player_id, predicate_id, enemy_unit_id)
	end
end

StatisticsUtil.register_pull_up = function (puller_up_unit, pulled_up_unit, statistics_db)
	local player_manager = Managers.player
	local player1 = player_manager:owner(puller_up_unit)
	local player2 = player_manager:owner(pulled_up_unit)

	if player1 and player2 then
		local predicate = "assisted_respawn"
		local local_human = not player1.remote and not player1.bot_player

		Managers.state.event:trigger("add_coop_feedback", player1:stats_id() .. player2:stats_id(), local_human, predicate, player1, player2)
	end
end

StatisticsUtil.register_assisted_respawn = function (reviver_unit, revivee_unit, statistics_db)
	local player_manager = Managers.player
	local player1 = player_manager:owner(reviver_unit)
	local player2 = player_manager:owner(revivee_unit)

	if player1 and player2 then
		local predicate = "assisted_respawn"
		local local_human = not player1.remote and not player1.bot_player

		Managers.state.event:trigger("add_coop_feedback", player1:stats_id() .. player2:stats_id(), local_human, predicate, player1, player2)
	end
end

StatisticsUtil.register_revive = function (reviver_unit, revivee_unit, statistics_db)
	local player_manager = Managers.player
	local player1 = player_manager:owner(reviver_unit)

	if player1 then
		local stats_id = player1:stats_id()

		statistics_db:increment_stat(stats_id, "revives")
	end

	local player2 = player_manager:owner(revivee_unit)

	if player2 then
		local stats_id = player2:stats_id()

		statistics_db:increment_stat(stats_id, "times_revived")
	end

	if player1 and player2 then
		local predicate = "revive"
		local local_human = not player1.remote and not player1.bot_player

		Managers.state.event:trigger("add_coop_feedback", player1:stats_id() .. player2:stats_id(), local_human, predicate, player1, player2)
	end
end

StatisticsUtil.register_heal = function (healer_unit, healed_unit, statistics_db)
	local player_manager = Managers.player
	local player1 = player_manager:owner(healer_unit)
	local player2 = player_manager:owner(healed_unit)

	if player1 and player2 and player1 ~= player2 then
		local predicate = "heal"
		local local_human = not player1.remote and not player1.bot_player

		Managers.state.event:trigger("add_coop_feedback", player1:stats_id() .. player2:stats_id(), local_human, predicate, player1, player2)

		local stats_id = player1:stats_id()

		statistics_db:increment_stat(stats_id, "times_friend_healed")
	end
end

StatisticsUtil.register_damage = function (victim_unit, damage_data, statistics_db)
	local damage_amount = damage_data[DamageDataIndex.DAMAGE_AMOUNT]
	local player_manager = Managers.player
	local player = player_manager:owner(victim_unit)

	if player then
		local stats_id = player:stats_id()

		statistics_db:modify_stat_by_amount(stats_id, "damage_taken", damage_amount)
	end

	local attacker_unit = damage_data[DamageDataIndex.ATTACKER]
	attacker_unit = AiUtils.get_actual_attacker_unit(attacker_unit)
	player = player_manager:owner(attacker_unit)

	if player then
		local breed = Unit_alive(victim_unit) and Unit_get_data(victim_unit, "breed")

		if breed then
			local breed_name = breed.name
			local health_extension = ScriptUnit.extension(victim_unit, "health_system")
			local current_health = health_extension:current_health()

			if current_health > 0 then
				local stats_id = player:stats_id()
				damage_amount = math.clamp(damage_amount, 0, current_health)

				statistics_db:modify_stat_by_amount(stats_id, "damage_dealt", damage_amount)
				statistics_db:modify_stat_by_amount(stats_id, "damage_dealt_per_breed", breed_name, damage_amount)
			end
		end
	end
end

StatisticsUtil.won_games = function (statistics_db)
	local local_player = Managers.player:local_player()
	local stats_id = local_player:stats_id()
	local completed = 0

	for _, level_name in ipairs(UnlockableLevels) do
		completed = completed + statistics_db:get_persistent_stat(stats_id, "completed_levels", level_name)
	end

	return completed
end

StatisticsUtil.register_collected_grimoires = function (collected_grimoires, statistics_db)
	local local_player = Managers.player:local_player()
	local stats_id = local_player:stats_id()

	for i = 1, collected_grimoires, 1 do
		statistics_db:increment_stat(stats_id, "total_collected_grimoires")
	end

	local level_settings = LevelHelper:current_level_settings()
	local level_id = level_settings.level_id

	if not table.find(UnlockableLevels, level_id) then
		return
	end

	local current_collected_grimoires = statistics_db:get_persistent_stat(stats_id, "collected_grimoires", level_id)

	if current_collected_grimoires < collected_grimoires then
		statistics_db:set_stat(stats_id, "collected_grimoires", level_id, collected_grimoires)
	end
end

StatisticsUtil.register_collected_tomes = function (collected_tomes, statistics_db)
	local local_player = Managers.player:local_player()
	local stats_id = local_player:stats_id()

	for i = 1, collected_tomes, 1 do
		statistics_db:increment_stat(stats_id, "total_collected_tomes")
	end

	local level_settings = LevelHelper:current_level_settings()
	local level_id = level_settings.level_id

	if not table.find(UnlockableLevels, level_id) then
		return
	end

	local current_collected_tomes = statistics_db:get_persistent_stat(stats_id, "collected_tomes", level_id)

	if current_collected_tomes < collected_tomes then
		statistics_db:set_stat(stats_id, "collected_tomes", level_id, collected_tomes)
	end
end

StatisticsUtil.register_complete_level = function (statistics_db)
	local level_settings = LevelHelper:current_level_settings()
	local level_id = level_settings.level_id

	if not table.find(UnlockableLevels, level_id) then
		return
	end

	local local_player = Managers.player:local_player()
	local stats_id = local_player:stats_id()
	local profile_index = local_player:profile_index()
	local profile = SPProfiles[profile_index]

	statistics_db:increment_stat(stats_id, "completed_levels_" .. profile.display_name, level_id)

	local mission_system = Managers.state.entity:system("mission_system")
	local grimoire_mission_data = mission_system:get_level_end_mission_data("grimoire_hidden_mission")
	local tome_mission_data = mission_system:get_level_end_mission_data("tome_bonus_mission")

	if grimoire_mission_data then
		StatisticsUtil.register_collected_grimoires(grimoire_mission_data.current_amount, statistics_db)
	end

	if tome_mission_data then
		StatisticsUtil.register_collected_tomes(tome_mission_data.current_amount, statistics_db)
	end

	statistics_db:increment_stat(stats_id, "completed_levels", level_id)

	if Managers.deed and Managers.deed:has_deed() then
		statistics_db:increment_stat(stats_id, "completed_heroic_deeds")
	end

	local difficulty_manager = Managers.state.difficulty
	local difficulty_name = difficulty_manager:get_difficulty()
	local career_index = local_player:career_index()
	local career_data = profile.careers[career_index]
	local career_name = career_data.name

	StatisticsUtil._register_completed_level_difficulty(statistics_db, level_id, career_name, difficulty_name)
end

StatisticsUtil.register_complete_tutorial = function (statistics_db)
	local level_settings = LevelHelper:current_level_settings()
	local local_player = Managers.player:local_player()
	local stats_id = local_player:stats_id()
	local level_id = level_settings.level_id

	statistics_db:increment_stat(stats_id, "completed_levels", level_id)
end

StatisticsUtil.register_played_quickplay_level = function (statistics_db, player, level_key)
	if not table.find(UnlockableLevels, level_key) then
		return
	end

	statistics_db:increment_stat(player:stats_id(), "played_levels_quickplay", level_key)
	StatisticsUtil.register_last_played_level_id(statistics_db, player, level_key)
end

StatisticsUtil.register_last_played_level_id = function (statistics_db, player, level_key)
	local unlockable_level_id = table.find(UnlockableLevels, level_key)

	if unlockable_level_id then
		statistics_db:set_stat(player:stats_id(), "last_played_level_id", unlockable_level_id)
	end
end

StatisticsUtil.get_game_progress = function (statistics_db)
	local local_player = Managers.player:local_player()
	local stats_id = local_player:stats_id()
	local max_value = #MainGameLevels * 5
	local current_value = 0
	local level_difficulty_name, level_completed_difficulty = nil

	for _, level_id in pairs(MainGameLevels) do
		level_difficulty_name = LevelDifficultyDBNames[level_id]
		level_completed_difficulty = statistics_db:get_persistent_stat(stats_id, "completed_levels_difficulty", level_difficulty_name)

		print("Completed Level Difficulty", level_difficulty_name, level_completed_difficulty, level_id)

		current_value = current_value + level_completed_difficulty
	end

	local game_progress = current_value / max_value * 100

	return game_progress
end

StatisticsUtil._register_completed_level_difficulty = function (statistics_db, level_id, career_name, difficulty_name)
	local local_player = Managers.player:local_player()
	local stats_id = local_player:stats_id()
	local level_difficulty_name = LevelDifficultyDBNames[level_id]
	local current_completed_difficulty = statistics_db:get_persistent_stat(stats_id, "completed_levels_difficulty", level_difficulty_name)
	local difficulty_manager = Managers.state.difficulty
	local difficulties = difficulty_manager:get_level_difficulties(level_id)
	local difficulty = table.find(difficulties, difficulty_name)

	if current_completed_difficulty < difficulty then
		statistics_db:set_stat(stats_id, "completed_levels_difficulty", level_difficulty_name, difficulty)
	end

	statistics_db:increment_stat(stats_id, "completed_career_levels", career_name, level_id, difficulty_name)
	statistics_db:increment_stat(stats_id, "played_difficulty", difficulty_name)
end

StatisticsUtil.unlock_lorebook_page = function (page_id, statistics_db)
	local player = Managers.player:local_player()

	if player then
		local stats_id = player:stats_id()

		print("unlock_lorebook_page", page_id)
		statistics_db:set_array_stat(stats_id, "lorebook_unlocks", page_id, true)

		local category_name = LorebookCategoryNames[page_id]

		LoreBookHelper.mark_page_id_as_new(category_name)
	end
end

local function survival_stat_name(level_id, difficulty, stat_suffix)
	assert(stat_suffix == "waves" or stat_suffix == "time" or stat_suffix == "kills")

	local stat_name = string.format("survival_%s_%s_%s", level_id, difficulty, stat_suffix)

	return stat_name
end

StatisticsUtil.get_survival_stat = function (statistics_db, level_id, difficulty, stat_name, stats_id)
	local stat = survival_stat_name(level_id, difficulty, stat_name)
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	stats_id = stats_id or local_player:stats_id()
	local value = statistics_db:get_persistent_stat(stats_id, stat)

	return value
end

StatisticsUtil._set_survival_stat = function (statistics_db, level_id, difficulty, stat_name, value)
	local stat = survival_stat_name(level_id, difficulty, stat_name)
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	local stats_id = local_player:stats_id()

	statistics_db:set_stat(stats_id, stat, value)
end

StatisticsUtil._modify_survival_stat = function (statistics_db, level_id, difficulty, stat_name, value)
	local stat = survival_stat_name(level_id, difficulty, stat_name)
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	local stats_id = local_player:stats_id()

	statistics_db:modify_stat_by_amount(stats_id, stat, value)
end

StatisticsUtil.register_complete_survival_level = function (statistics_db)
	local mission_system = Managers.state.entity:system("mission_system")
	local active_missions, completed_missions = mission_system:get_missions()
	local mission_data = active_missions.survival_wave

	if not mission_data then
		return
	end

	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	local stats_id = local_player:stats_id()
	local level_settings = LevelHelper:current_level_settings()
	local level_id = level_settings.level_id
	local start_wave = mission_data.starting_wave
	local start_difficulty = SurvivalDifficultyByStartWave[start_wave]
	local kills = statistics_db:get_stat(stats_id, "kills_total")

	StatisticsUtil._modify_survival_stat(statistics_db, level_id, start_difficulty, "kills", kills)

	local wave_completed = mission_data.wave_completed

	if wave_completed ~= 0 then
		local completed_waves = wave_completed - start_wave
		local current_completed_waves = StatisticsUtil.get_survival_stat(statistics_db, level_id, start_difficulty, "waves")

		if current_completed_waves < completed_waves then
			StatisticsUtil._set_survival_stat(statistics_db, level_id, start_difficulty, "waves", completed_waves)
		end

		local completed_time = mission_data.wave_completed_time - mission_data.start_time
		local current_completed_time = StatisticsUtil.get_survival_stat(statistics_db, level_id, start_difficulty, "time")

		if current_completed_waves < completed_waves or (completed_waves == current_completed_waves and completed_time < current_completed_time) then
			StatisticsUtil._set_survival_stat(statistics_db, level_id, start_difficulty, "time", completed_time)
		end

		local completed_difficulty = nil
		local difficulty_manager = Managers.state.difficulty
		local level_difficulties = difficulty_manager:get_level_difficulties(level_id)
		local start_difficulty_index = table.find(level_difficulties, start_difficulty)
		local level_difficulty_name = LevelDifficultyDBNames[level_id]
		local current_completed_difficulty_index = statistics_db:get_persistent_stat(stats_id, "completed_levels_difficulty", level_difficulty_name)
		local started_on_unlocked_difficulty = current_completed_difficulty_index >= start_difficulty_index - 1

		if started_on_unlocked_difficulty then
			local difficulty = difficulty_manager:get_difficulty()
			local difficulty_index = table.find(level_difficulties, difficulty)
			local completed_difficulty_index = (difficulty_index == #level_difficulties and completed_waves >= 13 * (difficulty_index - start_difficulty_index + 1) and difficulty_index) or difficulty_index - 1

			if completed_difficulty_index > 0 then
				completed_difficulty = level_difficulties[completed_difficulty_index]
			end

			if completed_difficulty_index and completed_difficulty_index < 3 and completed_waves >= 13 then
				ScriptApplication.send_to_crashify("StatisticsUtil", "Error in survival mode data. completed_difficulty_index = %s, completed_waves = %s, started_on_unlocked_difficulty = true", completed_difficulty_index, completed_waves)
			end
		else
			local completed_difficulty_index = nil

			for i = #level_difficulties, 1, -1 do
				local difficulty = level_difficulties[i]
				local difficulty_end_wave = SurvivalEndWaveByDifficulty[difficulty]

				if difficulty_end_wave <= wave_completed then
					completed_difficulty_index = i
					completed_difficulty = difficulty

					break
				end
			end

			if completed_difficulty_index and completed_difficulty_index < 3 and completed_waves >= 13 then
				ScriptApplication.send_to_crashify("StatisticsUtil", "Error in survival mode data. completed_difficulty_index = %s, completed_waves = %s, started_on_unlocked_difficulty = false", completed_difficulty_index, completed_waves)
			end
		end

		if completed_difficulty then
			StatisticsUtil._register_completed_level_difficulty(statistics_db, level_id, completed_difficulty)
		end
	end
end

return
