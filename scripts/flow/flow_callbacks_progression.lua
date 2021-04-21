local flow_return_table = Boot.flow_return_table

function flow_callback_check_progression_unlocked(params)
	flow_return_table.is_unlocked = false
	flow_return_table.is_locked = true

	return flow_return_table
end

function flow_callback_get_last_level_played(params)
	local last_played_level = SaveData.last_played_level or "N/A"
	local last_played_level_won = SaveData.last_played_level_result == "won"
	flow_return_table.level_key = last_played_level
	flow_return_table.won = last_played_level_won

	return flow_return_table
end

function flow_callback_last_level_played_was_weave(params)
	local last_played_level = SaveData.last_played_level or "N/A"
	local last_played_level_won = SaveData.last_played_level_result == "won"
	local weave_templates = WeaveSettings.templates
	local was_weave_level = false
	local was_boss_level = false

	for weave, template in pairs(weave_templates) do
		local objectives = template.objectives
		local weave_level = objectives[1]
		local boss_level = objectives[2]

		if weave_level.level_id == last_played_level then
			was_weave_level = true
		elseif boss_level.level_id == last_played_level then
			was_boss_level = true
		end
	end

	flow_return_table.was_weave_level = was_weave_level
	flow_return_table.was_boss_level = was_boss_level
	flow_return_table.won = last_played_level_won

	return flow_return_table
end

function flow_callback_ui_onboarding_tutorial_completed(params)
	local completed = false
	local player_manager = Managers.player

	if player_manager then
		local statistics_db = player_manager:statistics_db()
		local local_player = player_manager:local_player()

		if statistics_db and local_player then
			local tutorial = params.tutorial_name and WeaveUITutorials[params.tutorial_name]

			if tutorial then
				local ui_onboarding_state = WeaveOnboardingUtils.get_ui_onboarding_state(statistics_db, local_player:stats_id())
				completed = WeaveOnboardingUtils.tutorial_completed(ui_onboarding_state, tutorial)
			end
		end
	end

	flow_return_table.completed = completed

	return flow_return_table
end

function flow_callback_get_completed_game_difficulty(params)
	local player_manager = Managers.player
	local statistics_db = player_manager:statistics_db()
	local server_player = Managers.player:server_player()

	if server_player then
		local stats_id = server_player:stats_id()
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
	local statistics_db = player_manager:statistics_db()
	local server_player = Managers.player:server_player()

	if server_player then
		local levels = {
			"dlc_portals",
			"dlc_castle",
			"dlc_castle_dungeon"
		}
		local result = nil
		local stats_id = server_player:stats_id()

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
	local statistics_db = player_manager:statistics_db()
	local server_player = Managers.player:server_player()

	if server_player then
		local levels = {
			"dlc_dwarf_exterior",
			"dlc_dwarf_interior",
			"dlc_dwarf_beacons"
		}
		local result = nil
		local stats_id = server_player:stats_id()

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
	local server_player = player_manager:server_player()
	local returns = {
		dlc_survival_ruins = 0,
		dlc_survival_magnus = 0
	}

	if server_player then
		local statistics_db = player_manager:statistics_db()
		local start_waves = SurvivalStartWaveByDifficulty
		local stats_id = server_player:stats_id()

		for level_key, _ in pairs(returns) do
			local hard = StatisticsUtil.get_survival_stat(statistics_db, level_key, "cataclysm", "waves", stats_id)

			if hard > 0 then
				hard = hard + start_waves.cataclysm
			end

			local harder = StatisticsUtil.get_survival_stat(statistics_db, level_key, "cataclysm_2", "waves", stats_id)

			if harder > 0 then
				harder = harder + start_waves.cataclysm_2
			end

			local hardest = StatisticsUtil.get_survival_stat(statistics_db, level_key, "cataclysm_3", "waves", stats_id)

			if hardest > 0 then
				hardest = hardest + start_waves.cataclysm_3
			end

			returns[level_key] = math.max(hard, harder, hardest)
		end
	end

	return returns
end

function flow_callback_override_level_progression_for_experience(params)
	local progression = params.progression

	fassert(progression >= 0 and progression <= 1, "Level progression needs to be a number between 0 and 1, not %d", progression)

	local mission_system = Managers.state.entity:system("mission_system")

	mission_system:override_percentage_completed(progression)
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
	local statistics_db = player_manager:statistics_db()
	local leader_player = player_manager:player(leader_peer_id, 1)
	local stats_id = leader_player:stats_id()
	local completed_difficulty = LevelUnlockUtils.completed_main_game_difficulty(statistics_db, stats_id)
	flow_return_table.value = completed_difficulty

	return flow_return_table
end

function flow_query_leader_completed_dlc_difficulty(params)
	local leader_peer_id = Managers.party:leader()
	local local_peer_id = Network.peer_id()

	fassert(leader_peer_id == local_peer_id, "Flow node \"Leader Completed DLC Difficulty\" should only be called by the leader player")

	local dlc_name = params.dlc_name
	local player_manager = Managers.player
	local statistics_db = player_manager:statistics_db()
	local leader_player = player_manager:player(leader_peer_id, 1)
	local stats_id = leader_player:stats_id()
	local completed_difficulty = LevelUnlockUtils.completed_dlc_difficulty(statistics_db, stats_id, dlc_name)
	flow_return_table.value = completed_difficulty

	return flow_return_table
end

local function get_presistent_stat_from_peer_id(peer_id, ...)
	local player_manager = Managers.player
	local statistics_db = player_manager:statistics_db()
	local player = player_manager:player(peer_id, 1)
	local stat_value = nil

	if player then
		local stats_id = player:stats_id()
		stat_value = statistics_db:get_persistent_stat(stats_id, ...)
	end

	return stat_value
end

function flow_query_leader_completed_exalted_champion_difficulty(params)
	local leader_peer_id = Managers.party:leader()
	local local_peer_id = Network.peer_id()

	fassert(leader_peer_id == local_peer_id, "Flow node \"Leader Completed Bodvarr Difficulty\" should only be called by the leader player")

	local completed_difficulty = get_presistent_stat_from_peer_id(leader_peer_id, "kill_chaos_exalted_champion_difficulty_rank")
	flow_return_table.value = completed_difficulty

	return flow_return_table
end

function flow_query_leader_completed_exalted_sorcerer_difficulty(params)
	local leader_peer_id = Managers.party:leader()
	local local_peer_id = Network.peer_id()

	fassert(leader_peer_id == local_peer_id, "Flow node \"Leader Completed Haleschmorg Burglederp Difficulty\" should only be called by the leader player")

	local completed_difficulty = get_presistent_stat_from_peer_id(leader_peer_id, "kill_chaos_exalted_sorcerer_difficulty_rank")
	flow_return_table.value = completed_difficulty

	return flow_return_table
end

function flow_query_leader_completed_grey_seer_difficulty(params)
	local leader_peer_id = Managers.party:leader()
	local local_peer_id = Network.peer_id()

	fassert(leader_peer_id == local_peer_id, "Flow node \"Leader Completed Rasknitt Difficulty\" should only be called by the leader player")

	local completed_difficulty = get_presistent_stat_from_peer_id(leader_peer_id, "kill_skaven_grey_seer_difficulty_rank")
	flow_return_table.value = completed_difficulty

	return flow_return_table
end

function flow_query_leader_completed_storm_vermin_warlord_difficulty(params)
	local leader_peer_id = Managers.party:leader()
	local local_peer_id = Network.peer_id()

	fassert(leader_peer_id == local_peer_id, "Flow node \"Leader Completed Skarrik Spinemanglr Difficulty\" should only be called by the leader player")

	local completed_difficulty = get_presistent_stat_from_peer_id(leader_peer_id, "kill_skaven_storm_vermin_warlord_difficulty_rank")
	flow_return_table.value = completed_difficulty

	return flow_return_table
end

function flow_query_leader_completed_celebrate_event_2019(params)
	local leader_peer_id = Managers.party:leader()
	local local_peer_id = Network.peer_id()

	fassert(leader_peer_id == local_peer_id, "Flow node \"Leader Completed Celebrate Event 2019\" should only be called by the leader player")

	local completed = get_presistent_stat_from_peer_id(leader_peer_id, "completed_levels", "dlc_celebrate_crawl") > 0
	flow_return_table.value = completed

	return flow_return_table
end

function flow_query_leader_achievement_completed(params)
	if script_data.settings.use_beta_mode or not Managers.state.achievement:is_enabled() then
		flow_return_table.value = false

		return flow_return_table
	end

	local leader_peer_id = Managers.party:leader()
	local local_peer_id = Network.peer_id()

	fassert(leader_peer_id == local_peer_id, "Flow node \"Leader Achievement Completed\" should only be called by the leader player")

	if script_data.achievement_completed_flow_override ~= nil then
		flow_return_table.value = script_data.achievement_completed_flow_override

		return flow_return_table
	end

	local achievement_name = params.achievement_name
	local achievement_data = AchievementTemplates.achievements[achievement_name]

	fassert(achievement_data, "Achievement [\"%s\"] not found in AchievementTemplates!", achievement_name)

	local player_manager = Managers.player
	local statistics_db = player_manager:statistics_db()
	local player = player_manager:player(leader_peer_id, 1)
	local stats_id = player:stats_id()
	local completed = achievement_data.completed(statistics_db, stats_id)
	flow_return_table.value = completed

	return flow_return_table
end

function flow_query_local_player_achievement_completed(params)
	if script_data.settings.use_beta_mode or not Managers.state.achievement:is_enabled() then
		flow_return_table.value = false

		return flow_return_table
	end

	if script_data.achievement_completed_flow_override ~= nil then
		flow_return_table.value = script_data.achievement_completed_flow_override

		return flow_return_table
	end

	local achievement_name = params.achievement_name
	local achievement_data = AchievementTemplates.achievements[achievement_name]

	fassert(achievement_data, "Achievement [\"%s\"] not found in AchievementTemplates!", achievement_name)

	local player_manager = Managers.player
	local statistics_db = player_manager:statistics_db()
	local player = player_manager:local_player()
	local completed = false

	if player then
		local stats_id = player:stats_id()
		completed = achievement_data.completed(statistics_db, stats_id)
	end

	flow_return_table.value = completed

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
	local statistics_db = player_manager:statistics_db()
	local leader_player = player_manager:player(leader_peer_id, 1)
	local stats_id = leader_player:stats_id()
	local num_completed = LevelUnlockUtils.num_acts_completed(statistics_db, stats_id)
	flow_return_table.value = num_completed

	return flow_return_table
end

function flow_query_leader_num_crafted_items(params)
	local leader_peer_id = Managers.party:leader()
	local local_peer_id = Network.peer_id()

	fassert(leader_peer_id == local_peer_id, "Flow node \"Leader Number of Crafted Items\" should only be called by the leader player")

	local player_manager = Managers.player
	local statistics_db = player_manager:statistics_db()
	local leader_player = player_manager:player(leader_peer_id, 1)
	local stats_id = leader_player:stats_id()
	local num_crafted = statistics_db:get_persistent_stat(stats_id, "crafted_items")
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

	local world_manager = Managers.world
	local world_name = "level_world"

	if world_manager:has_world(world_name) then
		local world = world_manager:world(world_name)
		local result_event = params.result_event
		local result_parameter = params.result_parameter
		local item_interface = Managers.backend:get_interface("items")
		local value = item_interface:sum_best_power_levels()

		LevelHelper:set_flow_parameter(world, result_parameter, value)
		LevelHelper:flow_event(world, result_event)
	end
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

function flow_query_local_player_has_dlc(params)
	local dlc_name = params.dlc_name

	if dlc_name == "pre_order" and script_data.has_dlc_pre_order_flow_override ~= nil then
		flow_return_table.value = script_data.has_dlc_pre_order_flow_override

		return flow_return_table
	end

	local has_dlc = Managers.unlock:is_dlc_unlocked(dlc_name)
	flow_return_table.value = has_dlc

	return flow_return_table
end

function flow_query_leader_owns_vt1(params)
	local leader_peer_id = Managers.party:leader()
	local local_peer_id = Network.peer_id()

	fassert(leader_peer_id == local_peer_id, "Flow node \"Leader Owns VT1\" should only be called by the leader player")

	local owns_vt1 = false

	if IS_WINDOWS and rawget(_G, "Steam") then
		owns_vt1 = Steam.owns_app(235540)
	end

	flow_return_table.value = owns_vt1

	return flow_return_table
end

function flow_query_leader_completed_all_dlc_levels(params)
	local leader_peer_id = Managers.party:leader()
	local local_peer_id = Network.peer_id()

	fassert(leader_peer_id == local_peer_id, "Flow node \"Leader Completed All DLC Levels\" should only be called by the leader player")

	local dlc_name = params.dlc_name
	local player_manager = Managers.player
	local statistics_db = player_manager:statistics_db()
	local leader_player = player_manager:player(leader_peer_id, 1)
	local stats_id = leader_player:stats_id()
	local all_completed = LevelUnlockUtils.all_dlc_levels_completed(statistics_db, stats_id, dlc_name)
	flow_return_table.value = all_completed

	return flow_return_table
end

function flow_query_leader_early_owner(params)
	local leader_peer_id = Managers.party:leader()
	local local_peer_id = Network.peer_id()

	fassert(leader_peer_id == local_peer_id, "Flow node \"Leader Early Owner\" should only be called by the leader player")

	local backend_manager = Managers.backend
	local eary_owner = backend_manager:get_read_only_data("early_owner")
	flow_return_table.value = eary_owner

	return flow_return_table
end

function flow_query_leader_get_persistant_stat(params)
	local leader_peer_id = Managers.party:leader()
	local local_peer_id = Network.peer_id()

	fassert(leader_peer_id == local_peer_id, "Flow node \"Leader Get Persistant Stat\" should only be called by the leader player")

	local stat_name = params.stat_name
	local stat_value = get_presistent_stat_from_peer_id(local_peer_id, stat_name)
	flow_return_table.value = stat_value

	return flow_return_table
end

function flow_query_local_player_get_persistant_stat(params)
	local stat_name = params.stat_name
	local stat_value = get_presistent_stat_from_peer_id(Network.peer_id(), stat_name)
	flow_return_table.value = stat_value

	return flow_return_table
end

return
