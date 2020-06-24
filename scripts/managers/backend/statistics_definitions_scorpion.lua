require("scripts/settings/weave_settings")
require("scripts/settings/dlcs/scorpion/scorpion_seasonal_settings")

local player = StatisticsDefinitions.player
local num_seasons = ScorpionSeasonalSettings.current_season_id
local season_offset = 2
local database_names_repeating = {
	"weave_quickplay_wins"
}

for season_id = season_offset, num_seasons, 1 do
	local season_name = "s" .. season_id
	player[season_name] = {}
	local season_table = player[season_name]

	if season_id == 2 then
		season_table.weave_quickplay_wins = {
			value = 0,
			database_name = "weave_quickplay_wins",
			source = "player_data"
		}
	else
		for db_name_id = 1, #database_names_repeating, 1 do
			local stat_name = database_names_repeating[db_name_id]
			local database_name = season_name .. "_" .. stat_name
			season_table[stat_name] = {
				value = 0,
				source = "player_data",
				database_name = database_name
			}
		end
	end

	for i = 1, 500, 1 do
		for j = 1, 4, 1 do
			local id = i .. "_" .. j
			local db_name = season_name .. "_" .. id
			season_table[id] = {
				value = 0,
				source = "player_data",
				database_name = db_name
			}
		end
	end
end

player.season_1 = {}

for i = 1, 500, 1 do
	local definition = {
		value = 0,
		source = "player_data"
	}

	for j = 1, 4, 1 do
		local id = "weave_score_weave_" .. i .. "_" .. j .. "_players"
		local database_name = "season_1_" .. id
		player.season_1[id] = table.clone(definition)
		player.season_1[id].database_name = database_name
	end
end

local profiles = PROFILES_BY_AFFILIATION.heroes

for i = 1, #profiles, 1 do
	local profile_index = FindProfileIndex(profiles[i])

	for _, career in pairs(SPProfiles[profile_index].careers) do
		local definition = {
			value = 0,
			source = "player_data"
		}
		local id = "weaves_complete_" .. career.display_name .. "_season_1"
		local database_name = "season_1_" .. id
		player.season_1[id] = table.clone(definition)
		player.season_1[id].database_name = database_name

		for _, wind in ipairs(WeaveSettings.winds) do
			local id_rainbow = "weave_rainbow_" .. wind .. "_" .. career.display_name .. "_season_1"
			local database_name_rainbow = "season_1_" .. id_rainbow
			player.season_1[id_rainbow] = table.clone(definition)
			player.season_1[id_rainbow].database_name = database_name_rainbow
		end
	end
end

player.season_1.weave_quickplay_wins = {
	value = 0,
	database_name = "season_1_weave_quickplay_wins",
	source = "player_data"
}
local base_definitions = {
	value = 0,
	source = "player_data"
}

for difficulty, difficulty_data in pairs(DifficultySettings) do
	local id_difficulty_quickplay_wins = "weave_quickplay_" .. difficulty .. "_wins"
	local database_name_weave_quickplay_difficulty_wins = "season_1_" .. id_difficulty_quickplay_wins
	player.season_1[id_difficulty_quickplay_wins] = table.clone(base_definitions)
	player.season_1[id_difficulty_quickplay_wins].database_name = database_name_weave_quickplay_difficulty_wins
end

for _, wind in ipairs(WeaveSettings.winds) do
	local id = "scorpion_weaves_" .. wind .. "_season_1"
	local database_name = "season_1_" .. id
	local definition = {
		value = 0,
		source = "player_data"
	}
	player.season_1[id] = table.clone(definition)
	player.season_1[id].database_name = database_name
end

player.season_1.weave_life_stepped_in_bush = {
	value = 0,
	database_name = "season_1_weave_life_stepped_in_bush",
	source = "player_data"
}
player.season_1.weave_death_hit_by_spirit = {
	value = 0,
	database_name = "season_1_weave_death_hit_by_spirit",
	source = "player_data"
}
player.season_1.weave_beasts_destroyed_totems = {
	value = 0,
	database_name = "season_1_weave_beasts_destroyed_totems",
	source = "player_data"
}
player.season_1.weave_light_low_curse = {
	value = 0,
	database_name = "season_1_weave_light_low_curse",
	source = "player_data"
}
player.season_1.weave_shadow_kill_no_shrouded = {
	value = 0,
	database_name = "season_1_weave_shadow_kill_no_shrouded",
	source = "player_data"
}
local weave_templates = WeaveSettings.templates
player.completed_weaves = {}
player.season_1.weave_won = {}

for weave_name, weave_data in pairs(weave_templates) do
	player.completed_weaves[weave_name] = {
		value = 0,
		source = "player_data",
		database_name = "completed_" .. weave_name
	}
	local weave_season = 1
	local weave_tier = weave_data.tier
	player.season_1.weave_won[weave_tier] = {
		value = 0,
		source = "player_data",
		database_name = "weave_won_" .. weave_season .. "_" .. weave_tier
	}
end

player.scorpion_onboarding_step = {
	value = 0,
	database_name = "scorpion_onboarding_step",
	source = "player_data"
}
player.scorpion_ui_onboarding_state = {
	value = 0,
	database_name = "scorpion_ui_onboarding_state",
	source = "player_data"
}
player.scorpion_weaves_won = {
	value = 0,
	database_name = "scorpion_weaves_won",
	source = "player_data"
}
player.kill_chaos_exalted_champion_scorpion_hardest = {
	value = 0,
	database_name = "kill_chaos_exalted_champion_scorpion_hardest",
	source = "player_data"
}
player.kill_chaos_exalted_sorcerer_scorpion_hardest = {
	value = 0,
	database_name = "kill_chaos_exalted_sorcerer_scorpion_hardest",
	source = "player_data"
}
player.kill_skaven_grey_seer_scorpion_hardest = {
	value = 0,
	database_name = "kill_skaven_grey_seer_scorpion_hardest",
	source = "player_data"
}
player.kill_skaven_storm_vermin_warlord_scorpion_hardest = {
	value = 0,
	database_name = "kill_skaven_storm_vermin_warlord_scorpion_hardest",
	source = "player_data"
}
player.scorpion_onboarding_weave_first_fail_vo_played = {
	value = 0,
	database_name = "scorpion_onboarding_weave_first_fail_vo_played",
	source = "player_data"
}

StatisticsUtil.generate_weapon_kill_stats_dlc(player, "scorpion", {
	value = 0,
	source = "player_data"
})
StatisticsUtil.generate_level_complete_with_weapon_stats_dlc(player, "scorpion", {
	value = 0,
	source = "player_data"
})

return
