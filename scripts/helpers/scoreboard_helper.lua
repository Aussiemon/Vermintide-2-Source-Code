-- chunkname: @scripts/helpers/scoreboard_helper.lua

ScoreboardHelper = ScoreboardHelper or {}
ScoreboardHelper.scoreboard_topic_stats = {
	{
		display_text = "scoreboard_topic_kills_elites",
		name = "kills_elites",
		stat_types = {
			{
				"kills_per_breed",
				"skaven_storm_vermin",
			},
			{
				"kills_per_breed",
				"skaven_storm_vermin_commander",
			},
			{
				"kills_per_breed",
				"skaven_storm_vermin_with_shield",
			},
			{
				"kills_per_breed",
				"skaven_plague_monk",
			},
			{
				"kills_per_breed",
				"chaos_warrior",
			},
			{
				"kills_per_breed",
				"chaos_bulwark",
			},
			{
				"kills_per_breed",
				"chaos_berzerker",
			},
			{
				"kills_per_breed",
				"chaos_raider",
			},
			{
				"kills_per_breed",
				"beastmen_bestigor",
			},
		},
		sort_function = function (a, b)
			return a.score > b.score
		end,
	},
	{
		display_text = "scoreboard_topic_kills_specials",
		name = "kills_specials",
		stat_types = {
			{
				"kills_per_breed",
				"skaven_gutter_runner",
			},
			{
				"kills_per_breed",
				"skaven_poison_wind_globadier",
			},
			{
				"kills_per_breed",
				"skaven_pack_master",
			},
			{
				"kills_per_breed",
				"skaven_ratling_gunner",
			},
			{
				"kills_per_breed",
				"skaven_warpfire_thrower",
			},
			{
				"kills_per_breed",
				"chaos_corruptor_sorcerer",
			},
			{
				"kills_per_breed",
				"chaos_vortex_sorcerer",
			},
			{
				"kills_per_breed",
				"beastmen_standard_bearer",
			},
		},
		sort_function = function (a, b)
			return a.score > b.score
		end,
	},
	{
		display_text = "scoreboard_topic_kills_total",
		name = "kills_total",
		stat_type = "kills_total",
		sort_function = function (a, b)
			return a.score > b.score
		end,
	},
	{
		display_text = "scoreboard_topic_kills_melee",
		name = "kills_melee",
		stat_type = "kills_melee",
		sort_function = function (a, b)
			return a.score > b.score
		end,
	},
	{
		display_text = "scoreboard_topic_kills_ranged",
		name = "kills_ranged",
		stat_type = "kills_ranged",
		sort_function = function (a, b)
			return a.score > b.score
		end,
	},
	{
		display_text = "scoreboard_topic_damage_taken",
		name = "damage_taken",
		stat_type = "damage_taken",
		sort_function = function (a, b)
			return a.score < b.score
		end,
	},
	{
		display_text = "scoreboard_topic_damage_dealt",
		name = "damage_dealt",
		stat_type = "damage_dealt",
		sort_function = function (a, b)
			return a.score > b.score
		end,
	},
	{
		display_text = "scoreboard_topic_damage_dealt_bosses",
		name = "damage_dealt_bosses",
		stat_types = {
			{
				"damage_dealt_per_breed",
				"skaven_rat_ogre",
			},
			{
				"damage_dealt_per_breed",
				"skaven_stormfiend",
			},
			{
				"damage_dealt_per_breed",
				"chaos_spawn",
			},
			{
				"damage_dealt_per_breed",
				"chaos_troll",
			},
			{
				"damage_dealt_per_breed",
				"beastmen_minotaur",
			},
		},
		sort_function = function (a, b)
			return a.score > b.score
		end,
	},
	{
		display_text = "scoreboard_topic_headshots",
		name = "headshots",
		stat_type = "headshots",
		sort_function = function (a, b)
			return a.score > b.score
		end,
	},
	{
		display_text = "scoreboard_topic_saves",
		name = "saves",
		stat_type = "saves",
		sort_function = function (a, b)
			return a.score > b.score
		end,
	},
	{
		display_text = "scoreboard_topic_revives",
		name = "revives",
		stat_type = "revives",
		sort_function = function (a, b)
			return a.score > b.score
		end,
	},
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
			"revives",
		},
	},
	{
		group_name = "defense",
		stats = {},
	},
}

local score_count_per_player = 0

for _, group_settings in ipairs(ScoreboardHelper.scoreboard_grouped_topic_stats) do
	score_count_per_player = score_count_per_player + #group_settings.stats
end

ScoreboardHelper.num_stats_per_player = score_count_per_player

local TEMP_TABLE = {}

local function get_score(statistics_db, stats_id, stat_type)
	if type(stat_type) == "table" then
		return statistics_db:get_stat(stats_id, unpack(stat_type))
	else
		return statistics_db:get_stat(stats_id, stat_type)
	end
end

local function get_score_by_name(statistics_db, stats_id, stat_name, saved_scoreboard_data)
	local topic

	for _, topic_data in ipairs(ScoreboardHelper.scoreboard_topic_stats) do
		if topic_data.name == stat_name then
			topic = topic_data

			break
		end
	end

	assert(topic, "Could not find stats topic with name: %s", stat_name)

	local score_amount
	local stat_types = topic.stat_types

	if stat_types ~= nil then
		local stat_types_n = #stat_types
		local score = 0

		for i = 1, stat_types_n do
			local stat_type = stat_types[i]

			score = score + get_score(statistics_db, stats_id, stat_type)
		end

		score_amount = score
	else
		local stat_type = topic.stat_type
		local score = get_score(statistics_db, stats_id, stat_type)

		score_amount = score
	end

	if saved_scoreboard_data then
		table.clear(TEMP_TABLE)

		local player_data = saved_scoreboard_data[stats_id]
		local player_data_scores = player_data and player_data.scores or TEMP_TABLE
		local saved_score_amount = player_data_scores[stat_name] or 0

		if saved_score_amount > 0 then
			print(string.format("### Adding saved score for %q: %i ID: %s", stat_name, saved_score_amount, stats_id))
		end

		score_amount = score_amount + saved_score_amount
	end

	assert(score_amount ~= nil, "Couldn't find scoreboard statistic for '%s'", topic.name)

	return {
		score = score_amount,
		stat_name = stat_name,
		display_text = topic.display_text,
	}
end

ScoreboardHelper.get_weave_stats = function (statistics_db, profile_synchronizer)
	assert(statistics_db, "Missing statistics_database reference.")
	assert(profile_synchronizer, "Missing profile_synchronizer reference.")

	local bots_and_players = ScoreboardHelper.get_current_players()
	local player_list = {}

	for _, player in pairs(bots_and_players) do
		local player_peer_id = player:network_id()
		local player_name = player:name()
		local stats_id = player:stats_id()
		local profile_index = profile_synchronizer:profile_by_peer(player_peer_id, player:local_player_id())
		local is_player_controlled = player:is_player_controlled()

		player_list[stats_id] = {
			name = player_name,
			peer_id = player_peer_id,
			local_player_id = player:local_player_id(),
			stats_id = stats_id,
			profile_index = profile_index,
			is_player_controlled = is_player_controlled,
			scores = {},
		}
	end

	local scoreboard_topic_stats = ScoreboardHelper.scoreboard_topic_stats

	for i, topic in ipairs(scoreboard_topic_stats) do
		local stat_types = topic.stat_types

		for stats_id, player_data in pairs(player_list) do
			if stat_types ~= nil then
				local stat_types_n = #stat_types
				local score = 0

				for i = 1, stat_types_n do
					local stat_type = stat_types[i]

					score = score + get_score(statistics_db, player_data.stats_id, stat_type)
				end

				local data = player_list[stats_id]

				data.scores[topic.name] = score
			else
				local stat_type = topic.stat_type
				local score = get_score(statistics_db, player_data.stats_id, stat_type)
				local data = player_list[stats_id]

				data.scores[topic.name] = score
			end
		end
	end

	return player_list
end

ScoreboardHelper.get_grouped_topic_statistics = function (statistics_db, profile_synchronizer, saved_scoreboard_data)
	assert(statistics_db, "Missing statistics_database reference.")
	assert(profile_synchronizer, "Missing profile_synchronizer reference.")

	local bots_and_players = ScoreboardHelper.get_current_players()
	local player_list = {}

	for _, player in pairs(bots_and_players) do
		local player_peer_id = player:network_id()
		local player_name = player:name()
		local stats_id = player:stats_id()
		local profile_index = profile_synchronizer:profile_by_peer(player_peer_id, player:local_player_id())
		local player_unit = player.player_unit
		local unit_alive = Unit.alive(player_unit)
		local career_extension = unit_alive and ScriptUnit.extension(player_unit, "career_system")
		local career_index = career_extension and career_extension:career_index() or player:career_index()
		local is_player_controlled = player:is_player_controlled()
		local player_level = ExperienceSettings.get_player_level(player)
		local profile = SPProfiles[profile_index]
		local careers = profile.careers
		local career_settings = careers[career_index]
		local preview_wield_slot_type = career_settings.preview_wield_slot
		local preview_wield_slot = InventorySettings.slot_names_by_type[preview_wield_slot_type]
		local preview_wield_slot_name = preview_wield_slot[1]
		local portrait_frame = CosmeticUtils.get_cosmetic_slot(player, "slot_frame")
		local hero_skin = CosmeticUtils.get_cosmetic_slot(player, "slot_skin")
		local hat = CosmeticUtils.get_cosmetic_slot(player, "slot_hat")
		local weapon = CosmeticUtils.get_cosmetic_slot(player, preview_wield_slot_name)

		if not CosmeticUtils.is_valid(hero_skin) then
			hero_skin = CosmeticUtils.get_default_cosmetic_slot(career_settings, "slot_skin")
		end

		if not CosmeticUtils.is_valid(hat) then
			hat = CosmeticUtils.get_default_cosmetic_slot(career_settings, "slot_hat")
		end

		if not CosmeticUtils.is_valid(weapon) then
			weapon = CosmeticUtils.get_default_cosmetic_slot(career_settings, preview_wield_slot_name)
		end

		player_list[stats_id] = {
			name = player_name,
			peer_id = player_peer_id,
			local_player_id = player:local_player_id(),
			career_index = career_index,
			stats_id = stats_id,
			profile_index = profile_index,
			is_player_controlled = is_player_controlled,
			player_level = player_level,
			portrait_frame = portrait_frame and portrait_frame.item_name,
			hero_skin = hero_skin and hero_skin.item_name,
			weapon = weapon,
			hat = hat,
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
				local score_data = get_score_by_name(statistics_db, stats_id, stat_name, saved_scoreboard_data)

				group_scores[#group_scores + 1] = score_data
			end
		end

		player_data.group_scores = scores
	end

	return player_list
end

local PLAYERS = {}
local OCCUPIED_SLOTS = {}

ScoreboardHelper.get_current_players = function (optional_profile_synchronizer)
	local max_members = Managers.mechanism:max_instance_members()
	local human_and_bot_players = Managers.player:human_and_bot_players()

	if max_members >= table.size(human_and_bot_players) then
		return human_and_bot_players
	else
		table.clear(PLAYERS)
		table.clear(OCCUPIED_SLOTS)

		local gathered_players = PLAYERS
		local human_players = Managers.player:human_players()
		local bot_players = Managers.player:bots()

		for _, player in pairs(human_players) do
			local player_profile_index

			if optional_profile_synchronizer then
				local player_peer_id = player:network_id()
				local local_player_id = player:local_player_id()

				player_profile_index = optional_profile_synchronizer:profile_by_peer(player_peer_id, local_player_id)
			else
				player_profile_index = player:profile_index()
			end

			if not OCCUPIED_SLOTS[player_profile_index] then
				gathered_players[#gathered_players + 1] = player
				OCCUPIED_SLOTS[player_profile_index] = true
			end

			if max_members <= #gathered_players then
				break
			end
		end

		for _, bot_player in pairs(bot_players) do
			if max_members <= #gathered_players then
				break
			end

			local bot_profile_index = bot_player:profile_index()

			if not OCCUPIED_SLOTS[bot_profile_index] then
				gathered_players[#gathered_players + 1] = bot_player
			end
		end

		return gathered_players
	end
end

ScoreboardHelper.debug_get_grouped_topic_statistics = function ()
	local player_list = {}

	for i = 1, 4 do
		player_list[i] = {
			career_index = 1,
			player_level = 1,
			portrait_frame = "default",
			name = "player_name_" .. tostring(i),
			peer_id = "fake_peer_id_" .. tostring(i),
			local_player_id = i,
			stats_id = i,
			profile_index = i,
			is_player_controlled = i == 1 and true or false,
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
					display_text = "display_text!",
					score = 10,
					stat_name = "stat_name_" .. tostring(_),
				}

				group_scores[#group_scores + 1] = score_data
			end
		end

		player_data.group_scores = scores
	end

	return player_list
end

ScoreboardHelper.scoreboard_topic_stats_versus = {
	{
		display_text = "scoreboard_topic_kills_specials",
		name = "kills_specials",
		stat_types = {
			{
				"kills_per_breed",
				"vs_gutter_runner",
			},
			{
				"kills_per_breed",
				"vs_packmaster",
			},
			{
				"kills_per_breed",
				"vs_poison_wind_globadier",
			},
			{
				"kills_per_breed",
				"vs_ratling_gunner",
			},
			{
				"kills_per_breed",
				"vs_warpfire_thrower",
			},
		},
		sort_function = function (a, b)
			return a.score > b.score
		end,
	},
	{
		display_text = "scoreboard_topic_kills_heroes",
		name = "kills_heroes",
		stat_types = {
			{
				"kills_per_breed",
				"hero_wh_captain",
			},
			{
				"kills_per_breed",
				"hero_dr_slayer",
			},
			{
				"kills_per_breed",
				"hero_wh_priest",
			},
			{
				"kills_per_breed",
				"hero_dr_ironbreaker",
			},
			{
				"kills_per_breed",
				"hero_we_maidenguard",
			},
			{
				"kills_per_breed",
				"hero_bw_necromancer",
			},
			{
				"kills_per_breed",
				"hero_es_questingknight",
			},
			{
				"kills_per_breed",
				"hero_we_thornsister",
			},
			{
				"kills_per_breed",
				"hero_es_knight",
			},
			{
				"kills_per_breed",
				"hero_es_huntsman",
			},
			{
				"kills_per_breed",
				"hero_wh_bountyhunter",
			},
			{
				"kills_per_breed",
				"hero_dr_ranger",
			},
			{
				"kills_per_breed",
				"hero_dr_engineer",
			},
			{
				"kills_per_breed",
				"hero_es_mercenary",
			},
			{
				"kills_per_breed",
				"hero_bw_scholar",
			},
			{
				"kills_per_breed",
				"hero_bw_unchained",
			},
			{
				"kills_per_breed",
				"hero_bw_adept",
			},
			{
				"kills_per_breed",
				"hero_wh_zealot",
			},
			{
				"kills_per_breed",
				"hero_we_shade",
			},
			{
				"kills_per_breed",
				"hero_we_waywatcher",
			},
		},
		sort_function = function (a, b)
			return a.score > b.score
		end,
	},
	{
		display_text = "scoreboard_topic_damage_dealt_heroes",
		name = "damage_dealt_heroes",
		stat_types = {
			{
				"damage_dealt_per_breed",
				"hero_wh_captain",
			},
			{
				"damage_dealt_per_breed",
				"hero_dr_slayer",
			},
			{
				"damage_dealt_per_breed",
				"hero_wh_priest",
			},
			{
				"damage_dealt_per_breed",
				"hero_dr_ironbreaker",
			},
			{
				"damage_dealt_per_breed",
				"hero_we_maidenguard",
			},
			{
				"damage_dealt_per_breed",
				"hero_bw_necromancer",
			},
			{
				"damage_dealt_per_breed",
				"hero_es_questingknight",
			},
			{
				"damage_dealt_per_breed",
				"hero_we_thornsister",
			},
			{
				"damage_dealt_per_breed",
				"hero_es_knight",
			},
			{
				"damage_dealt_per_breed",
				"hero_es_huntsman",
			},
			{
				"damage_dealt_per_breed",
				"hero_wh_bountyhunter",
			},
			{
				"damage_dealt_per_breed",
				"hero_dr_ranger",
			},
			{
				"damage_dealt_per_breed",
				"hero_dr_engineer",
			},
			{
				"damage_dealt_per_breed",
				"hero_es_mercenary",
			},
			{
				"damage_dealt_per_breed",
				"hero_bw_scholar",
			},
			{
				"damage_dealt_per_breed",
				"hero_bw_unchained",
			},
			{
				"damage_dealt_per_breed",
				"hero_bw_adept",
			},
			{
				"damage_dealt_per_breed",
				"hero_wh_zealot",
			},
			{
				"damage_dealt_per_breed",
				"hero_we_shade",
			},
			{
				"damage_dealt_per_breed",
				"hero_we_waywatcher",
			},
		},
		sort_function = function (a, b)
			return a.score > b.score
		end,
	},
	{
		display_text = "scoreboard_topic_damage_dealt_pactsworn",
		name = "vs_damage_dealt_to_pactsworn",
		stat_type = "vs_damage_dealt_to_pactsworn",
		sort_function = function (a, b)
			return a.score > b.score
		end,
	},
	{
		display_text = "scoreboard_topic_saves",
		name = "saves",
		stat_type = "saves",
		sort_function = function (a, b)
			return a.score > b.score
		end,
	},
	{
		display_text = "scoreboard_topic_revives",
		name = "revives",
		stat_type = "revives",
		sort_function = function (a, b)
			return a.score > b.score
		end,
	},
	{
		display_text = "scoreboard_topic_disables",
		name = "disables",
		stat_type = "vs_disables_per_breed",
		stat_types = {
			{
				"vs_disables_per_breed",
				"vs_gutter_runner",
			},
			{
				"vs_disables_per_breed",
				"vs_packmaster",
			},
		},
		sort_function = function (a, b)
			return a.score > b.score
		end,
	},
}
ScoreboardHelper.scoreboard_grouped_topic_stats_versus = {
	{
		group_name = "heroes",
		stats = {
			"kills_specials",
			"vs_damage_dealt_to_pactsworn",
			"saves",
			"revives",
		},
	},
	{
		group_name = "pactsworn",
		stats = {
			"kills_heroes",
			"damage_dealt_heroes",
			"disables",
		},
	},
}

ScoreboardHelper.get_versus_stats = function (statistics_db, saved_scoreboard_stats)
	assert(statistics_db, "Missing statistics_database reference.")

	local human_players = Managers.player:human_players()
	local mechanism = Managers.mechanism:game_mechanism()
	local party_manager = Managers.party
	local player_list = {}

	for _, player in pairs(human_players) do
		local player_peer_id = player:network_id()
		local player_name = player:name()
		local stats_id = player:stats_id()
		local local_player_id = player:local_player_id()
		local player_level = ExperienceSettings.get_player_level(player)
		local portrait_frame = CosmeticUtils.get_cosmetic_slot(player, "slot_frame")
		local profile_index, career_index = mechanism:get_saved_hero(player_peer_id, local_player_id)
		local weapon, hero_skin, hat = mechanism:get_hero_cosmetics(player_peer_id, local_player_id)

		player_list[stats_id] = {
			name = player_name,
			peer_id = player_peer_id,
			local_player_id = local_player_id,
			stats_id = stats_id,
			profile_index = profile_index,
			career_index = career_index,
			player_level = player_level,
			portrait_frame = portrait_frame and portrait_frame.item_name,
			hero_skin = hero_skin,
			weapon = {
				item_name = weapon,
			},
			hat = {
				item_name = hat,
			},
			scores = {},
		}
	end

	local scoreboard_topic_stats = ScoreboardHelper.scoreboard_topic_stats_versus

	for i, topic in ipairs(scoreboard_topic_stats) do
		local stat_types = topic.stat_types

		for stats_id, player_data in pairs(player_list) do
			if stat_types ~= nil then
				local stat_types_n = #stat_types
				local score = 0

				for i = 1, stat_types_n do
					local stat_type = stat_types[i]

					score = score + get_score(statistics_db, player_data.stats_id, stat_type)
				end

				local data = player_list[stats_id]
				local saved_data = saved_scoreboard_stats and saved_scoreboard_stats[stats_id]

				data.scores[topic.name] = score + (saved_data and saved_data.scores and saved_data.scores[topic.name] or 0)
			else
				local stat_type = topic.stat_type
				local score = get_score(statistics_db, player_data.stats_id, stat_type)
				local data = player_list[stats_id]
				local saved_data = saved_scoreboard_stats and saved_scoreboard_stats[stats_id]

				data.scores[topic.name] = score + (saved_data and saved_data.scores and saved_data.scores[topic.name] or 0)
			end
		end
	end

	return player_list, #scoreboard_topic_stats
end
