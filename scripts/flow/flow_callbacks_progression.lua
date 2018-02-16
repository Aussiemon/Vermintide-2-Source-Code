local flow_return_table = Boot.flow_return_table

function flow_callback_check_progression_unlocked(params)
	flow_return_table.is_unlocked = false
	flow_return_table.is_locked = true

	return flow_return_table
end

function flow_callback_get_current_inn_level_progression(params)
	local player_manager = Managers.player
	local statistics_db = player_manager.statistics_db(player_manager)
	local server_player = Managers.player:server_player()

	if server_player then
		local stats_id = server_player.stats_id(server_player)
		local result = LevelUnlockUtils.current_act_progression_index(statistics_db, stats_id)
		flow_return_table.progression_step = result
	else
		flow_return_table.progression_step = 0
	end

	return flow_return_table
end

function flow_callback_get_completed_game_difficulty(params)
	local player_manager = Managers.player
	local statistics_db = player_manager.statistics_db(player_manager)
	local server_player = Managers.player:server_player()

	if server_player then
		local stats_id = server_player.stats_id(server_player)
		local result = LevelUnlockUtils.completed_adventure_difficulty(statistics_db, stats_id)

		return {
			completed_difficulty = result
		}
	end

	return {
		completed_difficulty = 0
	}
end

function flow_callback_get_completed_drachenfels_difficulty(params)
	local player_manager = Managers.player
	local statistics_db = player_manager.statistics_db(player_manager)
	local server_player = Managers.player:server_player()

	if server_player then
		local levels = {
			"dlc_portals",
			"dlc_castle",
			"dlc_castle_dungeon"
		}
		local result = nil
		local stats_id = server_player.stats_id(server_player)

		for _, level_key in ipairs(levels) do
			local difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, level_key)

			if not result or difficulty_index < result then
				result = difficulty_index
			end
		end

		return {
			completed_difficulty = result
		}
	end

	return {
		completed_difficulty = 0
	}
end

function flow_callback_get_completed_dwarf_levels_difficulty(params)
	local player_manager = Managers.player
	local statistics_db = player_manager.statistics_db(player_manager)
	local server_player = Managers.player:server_player()

	if server_player then
		local levels = {
			"dlc_dwarf_exterior",
			"dlc_dwarf_interior",
			"dlc_dwarf_beacons"
		}
		local result = nil
		local stats_id = server_player.stats_id(server_player)

		for _, level_key in ipairs(levels) do
			local difficulty_index = LevelUnlockUtils.completed_level_difficulty(statistics_db, stats_id, level_key)

			if not result or difficulty_index < result then
				result = difficulty_index
			end
		end

		return {
			completed_difficulty = result
		}
	end

	return {
		completed_difficulty = 0
	}
end

function flow_callback_get_completed_survival_waves(params)
	local player_manager = Managers.player
	local server_player = player_manager.server_player(player_manager)
	local returns = {
		dlc_survival_ruins = 0,
		dlc_survival_magnus = 0
	}

	if server_player then
		local statistics_db = player_manager.statistics_db(player_manager)
		local start_waves = SurvivalStartWaveByDifficulty
		local stats_id = server_player.stats_id(server_player)

		for level_key, _ in pairs(returns) do
			local hard = StatisticsUtil.get_survival_stat(statistics_db, level_key, "survival_hard", "waves", stats_id)

			if 0 < hard then
				hard = hard + start_waves.survival_hard
			end

			local harder = StatisticsUtil.get_survival_stat(statistics_db, level_key, "survival_harder", "waves", stats_id)

			if 0 < harder then
				harder = harder + start_waves.survival_harder
			end

			local hardest = StatisticsUtil.get_survival_stat(statistics_db, level_key, "survival_hardest", "waves", stats_id)

			if 0 < hardest then
				hardest = hardest + start_waves.survival_hardest
			end

			returns[level_key] = math.max(hard, harder, hardest)
		end
	end

	return returns
end

function flow_callback_override_level_progression_for_experience(params)
	local progression = params.progression

	fassert(0 <= progression and progression <= 1, "Level progression needs to be a number between 0 and 1, not %d", progression)

	local mission_system = Managers.state.entity:system("mission_system")

	mission_system.override_percentage_completed(mission_system, progression)

	return 
end

function flow_query_leader_hero_level(params)
	local leader_peer_id = Managers.party:leader()
	local local_peer_id = Network.peer_id()

	fassert(leader_peer_id == local_peer_id, "Flow node \"Leader Hero Level\" should only be called by the leader player")

	local hero_name = params.hero_name
	local experience = ExperienceSettings.get_experience(hero_name)
	local level = ExperienceSettings.get_level(experience)
	flow_return_table.value = level

	return flow_return_table
end

function flow_query_leader_hero_prestige(params)
	local leader_peer_id = Managers.party:leader()
	local local_peer_id = Network.peer_id()

	fassert(leader_peer_id == local_peer_id, "Flow node \"Leader Hero Prestige\" should only be called by the leader player")

	local hero_name = params.hero_name
	local prestige_level = ProgressionUnlocks.get_prestige_level(hero_name)
	flow_return_table.value = prestige_level

	return flow_return_table
end

function flow_query_leader_completed_difficulty(params)
	local leader_peer_id = Managers.party:leader()
	local local_peer_id = Network.peer_id()

	fassert(leader_peer_id == local_peer_id, "Flow node \"Leader Completed Difficulty\" should only be called by the leader player")

	local player_manager = Managers.player
	local statistics_db = player_manager.statistics_db(player_manager)
	local leader_player = player_manager.player(player_manager, leader_peer_id, 1)
	local stats_id = leader_player.stats_id(leader_player)
	local completed_difficulty = LevelUnlockUtils.completed_adventure_difficulty(statistics_db, stats_id)
	flow_return_table.value = completed_difficulty

	return flow_return_table
end

function flow_query_leader_achievement_completed(params)
	local leader_peer_id = Managers.party:leader()
	local local_peer_id = Network.peer_id()

	fassert(leader_peer_id == local_peer_id, "Flow node \"Leader Achievement Completed\" should only be called by the leader player")

	if script_data.achievement_completed_flow_override ~= nil then
		flow_return_table.value = script_data.achievement_completed_flow_override

		return flow_return_table
	end

	local achievement_name = params.achievement_name
	local achievement_template = AchievementTemplates[achievement_name]

	fassert(achievement_template, "Flow node \"Leader Achievement Completed\" tried to fetch non-existing achievement \"" .. tostring(achievement_name) .. "\"")

	local player_manager = Managers.player
	local statistics_db = player_manager.statistics_db(player_manager)
	local leader_player = player_manager.player(player_manager, leader_peer_id, 1)
	local stats_id = leader_player.stats_id(leader_player)
	local is_completed = achievement_template.evaluate(statistics_db, stats_id)
	flow_return_table.value = is_completed

	return flow_return_table
end

function flow_query_leader_hero_xp(params)
	local leader_peer_id = Managers.party:leader()
	local local_peer_id = Network.peer_id()

	fassert(leader_peer_id == local_peer_id, "Flow node \"Leader Hero XP\" should only be called by the leader player")

	local hero_name = params.hero_name
	local experience = ExperienceSettings.get_experience(hero_name)
	flow_return_table.value = experience

	return flow_return_table
end

function flow_query_leader_num_acts_completed(params)
	local leader_peer_id = Managers.party:leader()
	local local_peer_id = Network.peer_id()

	fassert(leader_peer_id == local_peer_id, "Flow node \"Leader Number of Acts Completed\" should only be called by the leader player")

	local player_manager = Managers.player
	local statistics_db = player_manager.statistics_db(player_manager)
	local leader_player = player_manager.player(player_manager, leader_peer_id, 1)
	local stats_id = leader_player.stats_id(leader_player)
	local num_completed = LevelUnlockUtils.num_acts_completed(statistics_db, stats_id)
	flow_return_table.value = num_completed

	return flow_return_table
end

function flow_query_leader_num_crafted_items(params)
	local leader_peer_id = Managers.party:leader()
	local local_peer_id = Network.peer_id()

	fassert(leader_peer_id == local_peer_id, "Flow node \"Leader Number of Crafted Items\" should only be called by the leader player")

	local player_manager = Managers.player
	local statistics_db = player_manager.statistics_db(player_manager)
	local leader_player = player_manager.player(player_manager, leader_peer_id, 1)
	local stats_id = leader_player.stats_id(leader_player)
	local num_crafted = statistics_db.get_persistent_stat(statistics_db, stats_id, "crafted_items")
	flow_return_table.value = num_crafted

	return flow_return_table
end

function flow_query_local_player_has_loot_chest(params)
	local has_chest = BackendUtils.has_loot_chest()
	flow_return_table.value = has_chest

	return flow_return_table
end

function flow_callback_leader_sum_best_power_levels(params)
	local leader_peer_id = Managers.party:leader()
	local local_peer_id = Network.peer_id()

	fassert(leader_peer_id == local_peer_id, "Flow node \"Leader Sum of Best Power Levels\" should only be called by the leader player")

	local result_event = params.result_event
	local result_parameter = params.result_parameter

	local function on_complete(value)
		local world = Managers.world:world("level_world")

		LevelHelper:set_flow_parameter(world, result_parameter, value)
		LevelHelper:flow_event(world, result_event)

		return 
	end

	local item_interface = Managers.backend:get_interface("items")

	item_interface.sum_best_power_levels(item_interface, on_complete)

	return 
end

function flow_query_leader_has_dlc(params)
	local leader_peer_id = Managers.party:leader()
	local local_peer_id = Network.peer_id()

	fassert(leader_peer_id == local_peer_id, "Flow node \"Leader Has DLC\" should only be called by the leader player")

	local dlc_name = params.dlc_name

	if dlc_name == "pre_order" and script_data.has_dlc_pre_order_flow_override ~= nil then
		flow_return_table.value = script_data.has_dlc_pre_order_flow_override

		return flow_return_table
	end

	local has_dlc = Managers.unlock:is_dlc_unlocked(dlc_name)
	flow_return_table.value = has_dlc

	return flow_return_table
end

return 
