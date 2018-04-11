ScoreboardHelper = ScoreboardHelper or {}
ScoreboardHelper.scoreboard_topic_stats = {
	{
		name = "kills_elites",
		display_text = "scoreboard_topic_kills_elites",
		stat_types = {
			{
				"kills_per_breed",
				"skaven_storm_vermin"
			},
			{
				"kills_per_breed",
				"skaven_storm_vermin_commander"
			},
			{
				"kills_per_breed",
				"skaven_storm_vermin_with_shield"
			},
			{
				"kills_per_breed",
				"skaven_plague_monk"
			},
			{
				"kills_per_breed",
				"chaos_warrior"
			},
			{
				"kills_per_breed",
				"chaos_berzerker"
			},
			{
				"kills_per_breed",
				"chaos_raider"
			}
		},
		sort_function = function (a, b)
			return b.score < a.score
		end
	},
	{
		name = "kills_specials",
		display_text = "scoreboard_topic_kills_specials",
		stat_types = {
			{
				"kills_per_breed",
				"skaven_gutter_runner"
			},
			{
				"kills_per_breed",
				"skaven_poison_wind_globadier"
			},
			{
				"kills_per_breed",
				"skaven_pack_master"
			},
			{
				"kills_per_breed",
				"skaven_ratling_gunner"
			},
			{
				"kills_per_breed",
				"skaven_warpfire_thrower"
			},
			{
				"kills_per_breed",
				"chaos_corruptor_sorcerer"
			},
			{
				"kills_per_breed",
				"chaos_vortex_sorcerer"
			}
		},
		sort_function = function (a, b)
			return b.score < a.score
		end
	},
	{
		name = "kills_total",
		stat_type = "kills_total",
		display_text = "scoreboard_topic_kills_total",
		sort_function = function (a, b)
			return b.score < a.score
		end
	},
	{
		name = "kills_melee",
		stat_type = "kills_melee",
		display_text = "scoreboard_topic_kills_melee",
		sort_function = function (a, b)
			return b.score < a.score
		end
	},
	{
		name = "kills_ranged",
		stat_type = "kills_ranged",
		display_text = "scoreboard_topic_kills_ranged",
		sort_function = function (a, b)
			return b.score < a.score
		end
	},
	{
		name = "damage_taken",
		stat_type = "damage_taken",
		display_text = "scoreboard_topic_damage_taken",
		sort_function = function (a, b)
			return a.score < b.score
		end
	},
	{
		name = "damage_dealt",
		stat_type = "damage_dealt",
		display_text = "scoreboard_topic_damage_dealt",
		sort_function = function (a, b)
			return b.score < a.score
		end
	},
	{
		name = "damage_dealt_bosses",
		display_text = "scoreboard_topic_damage_dealt_bosses",
		stat_types = {
			{
				"damage_dealt_per_breed",
				"skaven_rat_ogre"
			},
			{
				"damage_dealt_per_breed",
				"skaven_stormfiend"
			},
			{
				"damage_dealt_per_breed",
				"chaos_spawn"
			},
			{
				"damage_dealt_per_breed",
				"chaos_troll"
			}
		},
		sort_function = function (a, b)
			return b.score < a.score
		end
	},
	{
		name = "headshots",
		stat_type = "headshots",
		display_text = "scoreboard_topic_headshots",
		sort_function = function (a, b)
			return b.score < a.score
		end
	},
	{
		name = "saves",
		stat_type = "saves",
		display_text = "scoreboard_topic_saves",
		sort_function = function (a, b)
			return b.score < a.score
		end
	},
	{
		name = "revives",
		stat_type = "revives",
		display_text = "scoreboard_topic_revives",
		sort_function = function (a, b)
			return b.score < a.score
		end
	}
}
ScoreboardHelper.scoreboard_grouped_topic_stats = {
	{
		group_name = "offense",
		stats = {
			"kills_total",
			"kills_specials",
			"kills_elites",
			"kills_ranged",
			"kills_melee",
			"damage_dealt",
			"damage_dealt_bosses",
			"damage_taken",
			"headshots",
			"saves",
			"revives"
		}
	},
	{
		group_name = "defense",
		stats = {}
	}
}

local function get_score(statistics_db, stats_id, stat_type)
	if type(stat_type) == "table" then
		return statistics_db.get_stat(statistics_db, stats_id, unpack(stat_type))
	else
		return statistics_db.get_stat(statistics_db, stats_id, stat_type)
	end

	return 
end

local function get_score_by_name(statistics_db, stats_id, stat_name)
	local topic = nil

	for _, topic_data in ipairs(ScoreboardHelper.scoreboard_topic_stats) do
		if topic_data.name == stat_name then
			topic = topic_data

			break
		end
	end

	assert(topic, "Could not find stats topic with name: %s", stat_name)

	local score_amount = nil
	local stat_types = topic.stat_types

	if stat_types ~= nil then
		local stat_types_n = #stat_types
		local score = 0

		for i = 1, stat_types_n, 1 do
			local stat_type = stat_types[i]
			score = score + get_score(statistics_db, stats_id, stat_type)
		end

		score_amount = score
	else
		local stat_type = topic.stat_type
		local score = get_score(statistics_db, stats_id, stat_type)
		score_amount = score
	end

	assert(score_amount ~= nil, "Couldn't find scoreboard statistic for '%s'", topic.name)

	return {
		score = score_amount,
		stat_name = stat_name,
		display_text = topic.display_text
	}
end

ScoreboardHelper.get_sorted_topic_statistics = function (statistics_db, profile_synchronizer)
	assert(statistics_db, "Missing statistics_database reference.")
	assert(profile_synchronizer, "Missing profile_synchronizer reference.")

	local bots_and_players = Managers.player:human_and_bot_players()
	local own_player_stats_id = nil
	local player_list = {}

	for _, player in pairs(bots_and_players) do
		local is_local_player = player.local_player
		local player_peer_id = player.network_id(player)
		local player_name = player.name(player)
		local stats_id = player.stats_id(player)
		local profile_index = profile_synchronizer.profile_by_peer(profile_synchronizer, player_peer_id, player.local_player_id(player))
		local is_player_controlled = player.is_player_controlled(player)
		player_list[stats_id] = {
			name = player_name,
			peer_id = player_peer_id,
			local_player_id = player.local_player_id(player),
			stats_id = stats_id,
			profile_index = profile_index,
			is_player_controlled = is_player_controlled
		}

		if is_local_player then
			own_player_stats_id = stats_id
		end
	end

	local topic_stats_table = {}
	local scoreboard_topic_stats = ScoreboardHelper.scoreboard_topic_stats

	local function sort_by_player_performance(a, b)
		local a_scores = a.scores
		local b_scores = b.scores
		local my_position_a = math.huge
		local my_position_b = math.huge

		for i = 1, #a_scores, 1 do
			if a_scores[i].stats_id == own_player_stats_id then
				my_position_a = i
			end
		end

		for i = 1, #b_scores, 1 do
			if b_scores[i].stats_id == own_player_stats_id then
				my_position_b = i
			end
		end

		return my_position_a < my_position_b
	end

	for i, topic in ipairs(scoreboard_topic_stats) do
		local stat_types = topic.stat_types
		local scores = {}
		local scores_n = 0

		for stats_id, player_data in pairs(player_list) do
			scores_n = scores_n + 1

			if stat_types ~= nil then
				local stat_types_n = #stat_types
				local score = 0

				for i = 1, stat_types_n, 1 do
					local stat_type = stat_types[i]
					score = score + get_score(statistics_db, player_data.stats_id, stat_type)
				end

				scores[scores_n] = {
					score = score,
					stats_id = stats_id
				}
			else
				local stat_type = topic.stat_type
				local score = get_score(statistics_db, player_data.stats_id, stat_type)
				scores[scores_n] = {
					score = score,
					stats_id = stats_id
				}
			end

			assert(scores[scores_n].score ~= nil, "Couldn't find scoreboard statistic for '%s'", topic.display_text)
		end

		table.sort(scores, topic.sort_function)

		topic_stats_table[i] = {
			scores = scores,
			display_text = topic.display_text
		}

		if own_player_stats_id then
			table.sort(topic_stats_table, sort_by_player_performance)
		end
	end

	return {
		topic_stats_table,
		player_list
	}
end
ScoreboardHelper.get_grouped_topic_statistics = function (statistics_db, profile_synchronizer)
	assert(statistics_db, "Missing statistics_database reference.")
	assert(profile_synchronizer, "Missing profile_synchronizer reference.")

	local bots_and_players = Managers.player:human_and_bot_players()
	local own_player_stats_id = nil
	local cosmetic_system = Managers.state.entity:system("cosmetic_system")
	local player_list = {}

	for _, player in pairs(bots_and_players) do
		local is_local_player = player.local_player
		local player_peer_id = player.network_id(player)
		local player_name = player.name(player)
		local stats_id = player.stats_id(player)
		local profile_index = profile_synchronizer.profile_by_peer(profile_synchronizer, player_peer_id, player.local_player_id(player))
		local career_index = player.career_index(player)
		local is_player_controlled = player.is_player_controlled(player)
		local portrait_frame = cosmetic_system.get_equipped_frame(cosmetic_system, player.player_unit)
		local player_level = ExperienceSettings.get_player_level(player)
		player_list[stats_id] = {
			name = player_name,
			peer_id = player_peer_id,
			local_player_id = player.local_player_id(player),
			career_index = career_index,
			stats_id = stats_id,
			profile_index = profile_index,
			is_player_controlled = is_player_controlled,
			portrait_frame = portrait_frame,
			player_level = player_level
		}

		if is_local_player then
			own_player_stats_id = stats_id
		end
	end

	for stats_id, player_data in pairs(player_list) do
		local scores = {}

		for _, grouped_stat_data in ipairs(ScoreboardHelper.scoreboard_grouped_topic_stats) do
			local group_name = grouped_stat_data.group_name
			local stats = grouped_stat_data.stats
			scores[group_name] = {}
			local group_scores = scores[group_name]

			for _, stat_name in pairs(stats) do
				local score_data = get_score_by_name(statistics_db, stats_id, stat_name)
				group_scores[#group_scores + 1] = score_data
			end
		end

		player_data.group_scores = scores
	end

	return player_list
end
ScoreboardHelper.debug_get_sorted_topic_statistics = function ()
	local player_list = {}

	for i = 1, 4, 1 do
		player_list[i] = {
			name = "player_name_" .. tostring(i),
			peer_id = "fake_peer_id_" .. tostring(i),
			local_player_id = i,
			stats_id = i,
			profile_index = i,
			is_player_controlled = (i == 1 and true) or false
		}
	end

	local topic_stats_table = {}
	local scoreboard_topic_stats = ScoreboardHelper.scoreboard_topic_stats

	for i, topic in ipairs(scoreboard_topic_stats) do
		local stat_types = topic.stat_types
		local scores = {}
		local scores_n = 0

		for stats_id, player_data in pairs(player_list) do
			scores_n = scores_n + 1

			if stat_types ~= nil then
				local stat_types_n = #stat_types
				local score = 0

				for i = 1, stat_types_n, 1 do
					local stat_type = stat_types[i]
					score = score + math.random(0, 10)
				end

				scores[scores_n] = {
					score = score,
					stats_id = stats_id
				}
			else
				local stat_type = topic.stat_type
				local score = math.random(0, 10)
				scores[scores_n] = {
					score = score,
					stats_id = stats_id
				}
			end

			assert(scores[scores_n].score ~= nil, "Couldn't find scoreboard statistic for '%s'", topic.display_text)
		end

		table.sort(scores, topic.sort_function)

		topic_stats_table[i] = {
			scores = scores,
			display_text = topic.display_text
		}
	end

	return {
		topic_stats_table,
		player_list
	}
end
ScoreboardHelper.debug_get_grouped_topic_statistics = function ()
	local player_list = {}

	for i = 1, 4, 1 do
		player_list[i] = {
			career_index = 1,
			portrait_frame = "default",
			player_level = 1,
			name = "player_name_" .. tostring(i),
			peer_id = "fake_peer_id_" .. tostring(i),
			local_player_id = i,
			stats_id = i,
			profile_index = i,
			is_player_controlled = (i == 1 and true) or false
		}
	end

	for stats_id, player_data in pairs(player_list) do
		local scores = {}

		for _, grouped_stat_data in ipairs(ScoreboardHelper.scoreboard_grouped_topic_stats) do
			local group_name = grouped_stat_data.group_name
			local stats = grouped_stat_data.stats
			scores[group_name] = {}
			local group_scores = scores[group_name]

			for _, stat_name in pairs(stats) do
				local score_data = {
					score = 10,
					display_text = "display_text!",
					stat_name = "stat_name_" .. tostring(_)
				}
				group_scores[#group_scores + 1] = score_data
			end
		end

		player_data.group_scores = scores
	end

	return player_list
end

return 
