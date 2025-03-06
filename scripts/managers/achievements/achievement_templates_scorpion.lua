-- chunkname: @scripts/managers/achievements/achievement_templates_scorpion.lua

require("scripts/settings/weave_settings")

local check_level_difficulty = AchievementTemplateHelper.check_level_difficulty
local check_level_list_difficulty = AchievementTemplateHelper.check_level_list_difficulty
local hero_level = AchievementTemplateHelper.hero_level
local add_weapon_kill_challenge = AchievementTemplateHelper.add_weapon_kill_challenge
local add_weapon_levels_challenge = AchievementTemplateHelper.add_weapon_levels_challenge
local placeholder_icon = AchievementTemplateHelper.PLACEHOLDER_ICON

local function _has_completed_weave_seasonal(statistics_db, stats_id, season_id, weave_id)
	local complete = false
	local season_name = ScorpionSeasonalSettings.get_season_name(season_id)

	for player = 1, 4 do
		local stat_name = ScorpionSeasonalSettings.get_weave_score_stat_for_season(season_id, weave_id, player)

		complete = statistics_db:get_persistent_stat(stats_id, season_name, stat_name) > 0

		if complete then
			break
		end
	end

	return complete
end

local function _has_completed_tier_seasonal(statistics_db, stats_id, season_id, from, to)
	local complete = false
	local counter = 0

	for tier = from, to do
		complete = _has_completed_weave_seasonal(statistics_db, stats_id, season_id, tier)

		if not complete then
			break
		end

		counter = counter + 1
	end

	return complete, counter
end

local seasonal_list_of_weaves_from_to = {
	tier_1 = {
		from = 1,
		to = 40,
	},
	tier_2 = {
		from = 41,
		to = 80,
	},
	tier_3 = {
		from = 81,
		to = 120,
	},
	tier_4 = {
		from = 121,
		to = 160,
		disable_for_seasons = {
			2,
			3,
		},
	},
}
local season_num = ScorpionSeasonalSettings.current_season_id
local season_offset = 2

for season_id = season_offset, season_num do
	local season_name = ScorpionSeasonalSettings.get_season_name(season_id)

	for tier, tbl in pairs(seasonal_list_of_weaves_from_to) do
		local disable_for_seasons = tbl.disable_for_seasons

		if not disable_for_seasons or not table.contains(disable_for_seasons, season_id) then
			local id = "scorpion_" .. tier .. "_season_" .. season_id
			local from = tbl.from
			local to = tbl.to

			AchievementTemplates.achievements[id] = {
				required_dlc = "scorpion",
				name = "achv_scorpion_" .. tier .. "_seasonal_name",
				desc = "achv_scorpion_" .. tier .. "_seasonal_desc",
				icon = "achievement_trophy_scorpion_" .. tier .. "_season_" .. season_id,
				disable_on_consoles = season_id ~= season_num,
				completed = function (statistics_db, stats_id)
					local has_completed, _ = _has_completed_tier_seasonal(statistics_db, stats_id, season_id, from, to)

					return has_completed
				end,
				progress = function (statistics_db, stats_id)
					local total = to - from + 1
					local _, completed_amunt = _has_completed_tier_seasonal(statistics_db, stats_id, season_id, from, to)

					return {
						completed_amunt,
						total,
					}
				end,
			}
		end
	end

	local num_quickplay_weaves_required = 40
	local quickplay_achievement_id = "scorpion_complete_unranked_weaves_season_" .. season_id

	AchievementTemplates.achievements[quickplay_achievement_id] = {
		ID_PS4 = "077",
		ID_XB1 = 78,
		desc = "achv_scorpion_complete_unranked_weaves_desc",
		icon = "achievement_trophy_scorpion_complete_unranked_weaves_season_2",
		name = "achv_scorpion_complete_unranked_weaves_name",
		required_dlc = "scorpion",
		disable_on_consoles = season_id ~= season_num,
		completed = function (statistics_db, stats_id)
			local weave_quickplay_wins = statistics_db:get_persistent_stat(stats_id, season_name, "weave_quickplay_wins")

			return weave_quickplay_wins >= num_quickplay_weaves_required
		end,
		progress = function (statistics_db, stats_id)
			local weave_quickplay_wins = statistics_db:get_persistent_stat(stats_id, season_name, "weave_quickplay_wins")

			return {
				weave_quickplay_wins,
				num_quickplay_weaves_required,
			}
		end,
	}
end

AchievementTemplates.achievements.scorpion_bardin_reach_level_35 = {
	desc = "achv_scorpion_bardin_reach_level_35_desc",
	icon = "achievement_trophy_scorpion_bardin_reach_level_35",
	name = "achv_scorpion_bardin_reach_level_35_name",
	completed = function (statistics_db, stats_id)
		return hero_level("dwarf_ranger") >= 35
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("dwarf_ranger")

		level = math.min(level, 35)

		return {
			level,
			35,
		}
	end,
}
AchievementTemplates.achievements.scorpion_kerillian_reach_level_35 = {
	desc = "achv_scorpion_kerillian_reach_level_35_desc",
	icon = "achievement_trophy_scorpion_kerillian_reach_level_35",
	name = "achv_scorpion_kerillian_reach_level_35_name",
	completed = function (statistics_db, stats_id)
		return hero_level("wood_elf") >= 35
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("wood_elf")

		level = math.min(level, 35)

		return {
			level,
			35,
		}
	end,
}
AchievementTemplates.achievements.scorpion_markus_reach_level_35 = {
	desc = "achv_scorpion_markus_reach_level_35_desc",
	icon = "achievement_trophy_scorpion_markus_reach_level_35",
	name = "achv_scorpion_markus_reach_level_35_name",
	completed = function (statistics_db, stats_id)
		return hero_level("empire_soldier") >= 35
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("empire_soldier")

		level = math.min(level, 35)

		return {
			level,
			35,
		}
	end,
}
AchievementTemplates.achievements.scorpion_sienna_reach_level_35 = {
	desc = "achv_scorpion_sienna_reach_level_35_desc",
	icon = "achievement_trophy_scorpion_sienna_reach_level_35",
	name = "achv_scorpion_sienna_reach_level_35_name",
	completed = function (statistics_db, stats_id)
		return hero_level("bright_wizard") >= 35
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("bright_wizard")

		level = math.min(level, 35)

		return {
			level,
			35,
		}
	end,
}
AchievementTemplates.achievements.scorpion_victor_reach_level_35 = {
	desc = "achv_scorpion_victor_reach_level_35_desc",
	icon = "achievement_trophy_scorpion_victor_reach_level_35",
	name = "achv_scorpion_victor_reach_level_35_name",
	completed = function (statistics_db, stats_id)
		return hero_level("witch_hunter") >= 35
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("witch_hunter")

		level = math.min(level, 35)

		return {
			level,
			35,
		}
	end,
}
AchievementTemplates.achievements.scorpion_complete_helmgart_act_one_cataclysm = {
	desc = "achv_scorpion_complete_helmgart_act_one_cataclysm_desc",
	icon = "achievement_trophy_scorpion_complete_act_one_cataclysm",
	name = "achv_scorpion_complete_helmgart_act_one_cataclysm_name",
	required_dlc = "scorpion",
	completed = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.military.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.catacombs.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.mines.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.ground_zero.level_id, diff) then
			count = count + 1
		end

		return count >= 4
	end,
	progress = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.military.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.catacombs.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.mines.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.ground_zero.level_id, diff) then
			count = count + 1
		end

		return {
			count,
			4,
		}
	end,
	requirements = function (statistics_db, stats_id)
		local diff = DifficultySettings.cataclysm.rank
		local complete_military = check_level_difficulty(statistics_db, stats_id, LevelSettings.military.level_id, diff)
		local complete_catacombs = check_level_difficulty(statistics_db, stats_id, LevelSettings.catacombs.level_id, diff)
		local complete_mines = check_level_difficulty(statistics_db, stats_id, LevelSettings.mines.level_id, diff)
		local complete_ground_zero = check_level_difficulty(statistics_db, stats_id, LevelSettings.ground_zero.level_id, diff)

		return {
			{
				name = "level_name_military",
				completed = complete_military,
			},
			{
				name = "level_name_catacombs",
				completed = complete_catacombs,
			},
			{
				name = "level_name_mines",
				completed = complete_mines,
			},
			{
				name = "level_name_ground_zero",
				completed = complete_ground_zero,
			},
		}
	end,
}
AchievementTemplates.achievements.scorpion_complete_helmgart_act_two_cataclysm = {
	desc = "achv_scorpion_complete_helmgart_act_two_cataclysm_desc",
	icon = "achievement_trophy_scorpion_complete_act_two_cataclysm",
	name = "achv_scorpion_complete_helmgart_act_two_cataclysm_name",
	required_dlc = "scorpion",
	completed = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.elven_ruins.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.bell.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.fort.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.skaven_stronghold.level_id, diff) then
			count = count + 1
		end

		return count >= 4
	end,
	progress = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.elven_ruins.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.bell.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.fort.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.skaven_stronghold.level_id, diff) then
			count = count + 1
		end

		return {
			count,
			4,
		}
	end,
	requirements = function (statistics_db, stats_id)
		local diff = DifficultySettings.cataclysm.rank
		local complete_elven_ruins = check_level_difficulty(statistics_db, stats_id, LevelSettings.elven_ruins.level_id, diff)
		local complete_bell = check_level_difficulty(statistics_db, stats_id, LevelSettings.bell.level_id, diff)
		local complete_fort = check_level_difficulty(statistics_db, stats_id, LevelSettings.fort.level_id, diff)
		local complete_skaven_stronghold = check_level_difficulty(statistics_db, stats_id, LevelSettings.skaven_stronghold.level_id, diff)

		return {
			{
				name = "level_name_elven_ruins",
				completed = complete_elven_ruins,
			},
			{
				name = "level_name_bell",
				completed = complete_bell,
			},
			{
				name = "level_name_forest_fort",
				completed = complete_fort,
			},
			{
				name = "level_name_skaven_stronghold",
				completed = complete_skaven_stronghold,
			},
		}
	end,
}
AchievementTemplates.achievements.scorpion_complete_helmgart_act_three_cataclysm = {
	desc = "achv_scorpion_complete_helmgart_act_three_cataclysm_desc",
	icon = "achievement_trophy_scorpion_complete_act_three_cataclysm",
	name = "achv_scorpion_complete_helmgart_act_three_cataclysm_name",
	required_dlc = "scorpion",
	completed = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.farmlands.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.ussingen.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.nurgle.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.warcamp.level_id, diff) then
			count = count + 1
		end

		return count >= 4
	end,
	progress = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.farmlands.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.ussingen.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.nurgle.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.warcamp.level_id, diff) then
			count = count + 1
		end

		return {
			count,
			4,
		}
	end,
	requirements = function (statistics_db, stats_id)
		local diff = DifficultySettings.cataclysm.rank
		local complete_farmlands = check_level_difficulty(statistics_db, stats_id, LevelSettings.farmlands.level_id, diff)
		local complete_ussingen = check_level_difficulty(statistics_db, stats_id, LevelSettings.ussingen.level_id, diff)
		local complete_nurgle = check_level_difficulty(statistics_db, stats_id, LevelSettings.nurgle.level_id, diff)
		local complete_warcamp = check_level_difficulty(statistics_db, stats_id, LevelSettings.warcamp.level_id, diff)

		return {
			{
				name = "level_name_farmlands",
				completed = complete_farmlands,
			},
			{
				name = "level_name_ussingen",
				completed = complete_ussingen,
			},
			{
				name = "level_name_nurgle",
				completed = complete_nurgle,
			},
			{
				name = "level_name_warcamp",
				completed = complete_warcamp,
			},
		}
	end,
}
AchievementTemplates.achievements.scorpion_complete_skittergate_cataclysm = {
	desc = "achv_scorpion_complete_skittergate_cataclysm_desc",
	icon = "achievement_trophy_scorpion_complete_skittergate_cataclysm",
	name = "achv_scorpion_complete_skittergate_cataclysm_name",
	required_dlc = "scorpion",
	completed = function (statistics_db, stats_id)
		local diff = DifficultySettings.cataclysm.rank

		return check_level_difficulty(statistics_db, stats_id, LevelSettings.skittergate.level_id, diff)
	end,
}

local function remove_prologue(levels)
	local prologue_index

	for i, level in ipairs(levels) do
		if level == "prologue" then
			prologue_index = i
		end
	end

	local ret = levels

	if prologue_index then
		table.remove(ret, prologue_index)
	end

	return ret
end

local main_game_levels = remove_prologue(MainGameLevels)

AchievementTemplates.achievements.scorpion_complete_all_helmgart_levels_cataclysm = {
	desc = "achv_scorpion_complete_all_helmgart_levels_cataclysm_desc",
	icon = "achievement_trophy_scorpion_complete_all_helmgart_levels_cataclysm",
	name = "achv_scorpion_complete_all_helmgart_levels_cataclysm_name",
	required_dlc = "scorpion",
	completed = function (statistics_db, stats_id)
		local rank = DifficultySettings.cataclysm.rank

		return check_level_list_difficulty(statistics_db, stats_id, main_game_levels, rank)
	end,
	progress = function (statistics_db, stats_id)
		local rank = DifficultySettings.cataclysm.rank
		local num_completed = 0

		for _, level in ipairs(main_game_levels) do
			if check_level_difficulty(statistics_db, stats_id, level, rank) then
				num_completed = num_completed + 1
			end
		end

		return {
			num_completed,
			#main_game_levels,
		}
	end,
	requirements = function (statistics_db, stats_id)
		local reqs = {}
		local rank = DifficultySettings.cataclysm.rank

		for _, level in ipairs(main_game_levels) do
			local completed = check_level_difficulty(statistics_db, stats_id, level, rank)

			table.insert(reqs, {
				name = LevelSettings[level].display_name,
				completed = completed,
			})
		end

		return reqs
	end,
}
AchievementTemplates.achievements.scorpion_complete_bogenhafen_cataclysm = {
	desc = "achv_scorpion_complete_bogenhafen_cataclysm_desc",
	icon = "achievement_trophy_scorpion_complete_bogenhafen_cataclysm",
	name = "achv_scorpion_complete_bogenhafen_cataclysm_name",
	required_dlc = "scorpion",
	required_dlc_extra = "bogenhafen",
	completed = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.dlc_bogenhafen_slum.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.dlc_bogenhafen_city.level_id, diff) then
			count = count + 1
		end

		return count >= 2
	end,
	progress = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.dlc_bogenhafen_slum.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.dlc_bogenhafen_city.level_id, diff) then
			count = count + 1
		end

		return {
			count,
			2,
		}
	end,
	requirements = function (statistics_db, stats_id)
		local diff = DifficultySettings.cataclysm.rank
		local complete_bogenhafen_slum = check_level_difficulty(statistics_db, stats_id, LevelSettings.dlc_bogenhafen_slum.level_id, diff)
		local complete_bogenhafen_city = check_level_difficulty(statistics_db, stats_id, LevelSettings.dlc_bogenhafen_city.level_id, diff)

		return {
			{
				name = "level_name_bogenhafen_slum",
				completed = complete_bogenhafen_slum,
			},
			{
				name = "level_name_bogenhafen_city",
				completed = complete_bogenhafen_city,
			},
		}
	end,
}
AchievementTemplates.achievements.scorpion_complete_back_to_ubersreik_cataclysm = {
	desc = "achv_scorpion_complete_back_to_ubersreik_cataclysm_desc",
	icon = "achievement_trophy_scorpion_complete_back_to_ubersreik_cataclysm",
	name = "achv_scorpion_complete_back_to_ubersreik_cataclysm_name",
	required_dlc = "scorpion",
	required_dlc_extra = "holly",
	completed = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.magnus.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.cemetery.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.forest_ambush.level_id, diff) then
			count = count + 1
		end

		return count >= 3
	end,
	progress = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.magnus.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.cemetery.level_id, diff) then
			count = count + 1
		end

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.forest_ambush.level_id, diff) then
			count = count + 1
		end

		return {
			count,
			3,
		}
	end,
	requirements = function (statistics_db, stats_id)
		local diff = DifficultySettings.cataclysm.rank
		local complete_holly_magnus = check_level_difficulty(statistics_db, stats_id, LevelSettings.magnus.level_id, diff)
		local complete_holly_cemetery = check_level_difficulty(statistics_db, stats_id, LevelSettings.cemetery.level_id, diff)
		local complete_holly_forest_ambush = check_level_difficulty(statistics_db, stats_id, LevelSettings.forest_ambush.level_id, diff)

		return {
			{
				name = "level_name_magnus",
				completed = complete_holly_magnus,
			},
			{
				name = "level_name_cemetery",
				completed = complete_holly_cemetery,
			},
			{
				name = "level_name_forest_ambush",
				completed = complete_holly_forest_ambush,
			},
		}
	end,
}
AchievementTemplates.achievements.scorpion_complete_plaza_cataclysm = {
	desc = "achv_scorpion_complete_plaza_cataclysm_desc",
	icon = "achievement_trophy_scorpion_complete_plaza_cataclysm",
	name = "achv_scorpion_complete_plaza_cataclysm_name",
	required_dlc = "scorpion",
	required_dlc_extra = "holly",
	completed = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.plaza.level_id, diff) then
			count = count + 1
		end

		return count >= 1
	end,
}

local function _has_completed_tier(statistics_db, stats_id, from, to)
	local complete = false
	local counter = 0
	local current_season = ScorpionSeasonalSettings.current_season_id

	for tier = from, to do
		for player = 1, 4 do
			local stat_name = "weave_score_weave_" .. tier .. "_" .. player .. "_players"

			if not IS_WINDOWS then
				for season_index = 1, current_season do
					if season_index == 1 then
						stat_name = "weave_score_weave_" .. tier .. "_" .. player .. "_players"
					else
						stat_name = tier .. "_" .. player
					end

					local season_name = ScorpionSeasonalSettings.get_season_name(season_index)

					complete = statistics_db:get_persistent_stat(stats_id, season_name, stat_name) > 0

					if complete then
						break
					end
				end
			else
				complete = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name) > 0
			end

			if complete then
				break
			end
		end

		if not complete then
			break
		end

		counter = counter + 1
	end

	return complete, counter
end

local function _has_completed_wind_in_order(statistics_db, stats_id, wind, amount_of_weaves)
	local complete = false
	local counter = 0

	for _, template in pairs(WeaveSettings.templates_ordered) do
		if wind == template.wind then
			for player = 1, 4 do
				local stat_name = "weave_score_weave_" .. template.tier .. "_" .. player .. "_players"

				complete = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name) > 0

				if complete then
					break
				end
			end

			if not complete then
				break
			end

			counter = counter + 1

			if counter == amount_of_weaves then
				break
			end
		end
	end

	return complete, counter
end

local function _complet_winds(statistics_db, stats_id, wind, amount_of_weaves)
	local counter = 0

	for _, template in pairs(WeaveSettings.templates_ordered) do
		if wind == template.wind then
			local stat_name = "weave_score_weave_" .. template.tier .. "_" .. 1 .. "_players"

			statistics_db:set_stat(stats_id, "season_1", stat_name, 10)

			counter = counter + 1

			if counter == amount_of_weaves then
				break
			end
		end
	end
end

local function _uncomplet_winds(statistics_db, stats_id, wind, amount_of_weaves)
	local counter = 0

	for _, template in pairs(WeaveSettings.templates_ordered) do
		if wind == template.wind then
			local stat_name = "weave_score_weave_" .. template.tier .. "_" .. 1 .. "_players"

			statistics_db:set_stat(stats_id, "season_1", stat_name, 0)

			counter = counter + 1

			if counter == amount_of_weaves then
				break
			end
		end
	end
end

local function _weave_completed_career_rainbow(statistics_db, stats_id, career)
	local complete = false
	local counter = 0
	local amount_of_weaves = #WeaveSettings.winds

	for _, wind in pairs(WeaveSettings.winds) do
		local id_rainbow = "weave_rainbow_" .. wind .. "_" .. career .. "_season_1"

		complete = statistics_db:get_persistent_stat(stats_id, "season_1", id_rainbow) > 0

		if complete then
			counter = counter + 1
		end
	end

	complete = counter == amount_of_weaves

	return complete, counter
end

local wind_order = {
	"life",
	"metal",
	"heavens",
	"light",
	"death",
	"beasts",
	"shadow",
	"fire",
}
local num_weaves_per_wind = 5

for i = 1, #wind_order do
	local id = "scorpion_weaves_" .. i .. "_season_1"
	local wind = wind_order[i]
	local weave_ids = WeaveSettings.weave_wind_ranges[wind]

	AchievementTemplates.achievements[id] = {
		required_dlc = "scorpion",
		name = "achv_scorpion_weaves_" .. i .. "_season_1_name",
		desc = "achv_scorpion_weaves_" .. i .. "_season_1_desc",
		icon = "achievement_trophy_scorpion_weaves_" .. i .. "_season_1",
		completed = function (statistics_db, stats_id)
			local completed = true

			for k = 1, num_weaves_per_wind do
				local weave_id = weave_ids[k]

				completed = completed and _has_completed_weave_seasonal(statistics_db, stats_id, ScorpionSeasonalSettings.current_season_id, weave_id)
			end

			return completed
		end,
		progress = function (statistics_db, stats_id)
			local count = 0

			for k = 1, num_weaves_per_wind do
				local weave_id = weave_ids[k]

				if _has_completed_weave_seasonal(statistics_db, stats_id, ScorpionSeasonalSettings.current_season_id, weave_id) then
					count = count + 1
				end
			end

			return {
				count,
				num_weaves_per_wind,
			}
		end,
	}
end

AchievementTemplates.achievements.scorpion_complete_unranked_weaves = {
	ID_PS4 = "077",
	ID_XB1 = 78,
	desc = "achv_scorpion_complete_unranked_weaves_desc",
	icon = "icons_placeholder",
	name = "achv_scorpion_complete_unranked_weaves_name",
	required_dlc = "scorpion",
	completed = function (statistics_db, stats_id)
		local weave_quickplay_wins = statistics_db:get_persistent_stat(stats_id, "season_1", "weave_quickplay_wins")

		return weave_quickplay_wins >= 40
	end,
	progress = function (statistics_db, stats_id)
		local weave_quickplay_wins = statistics_db:get_persistent_stat(stats_id, "season_1", "weave_quickplay_wins")

		return {
			weave_quickplay_wins,
			40,
		}
	end,
}
AchievementTemplates.complete_weaves_list = {
	5,
	10,
	15,
	20,
	25,
	30,
	35,
	40,
	80,
	120,
}
AchievementTemplates.xbox_achievement_ids = {
	nil,
	nil,
	nil,
	79,
	nil,
	nil,
	nil,
	80,
	81,
}
AchievementTemplates.ps4_achievement_ids = {
	nil,
	nil,
	nil,
	"078",
	nil,
	nil,
	nil,
	"079",
	"080",
}

for i, weave_number in ipairs(AchievementTemplates.complete_weaves_list) do
	local id = "scorpion_complete_weaves_" .. i

	AchievementTemplates.achievements[id] = {
		required_dlc = "scorpion",
		name = "achv_scorpion_complete_weaves_" .. i .. "_name",
		desc = function ()
			return string.format(Localize("achv_scorpion_complete_weaves_" .. i .. "_desc"), weave_number)
		end,
		ID_XB1 = AchievementTemplates.xbox_achievement_ids[i],
		ID_PS4 = AchievementTemplates.ps4_achievement_ids[i],
		icon = "achievement_trophy_scorpion_complete_weaves_" .. i,
		completed = function (statistics_db, stats_id)
			local from = 1
			local to = weave_number
			local completed, count = _has_completed_tier(statistics_db, stats_id, from, to)

			if not IS_WINDOWS then
				return completed
			else
				local weaves_won = statistics_db:get_persistent_stat(stats_id, "scorpion_weaves_won")
				local num_completed_weaves = math.min(count + weaves_won, weave_number)

				return num_completed_weaves >= weave_number
			end
		end,
		progress = function (statistics_db, stats_id)
			local from = 1
			local to = weave_number
			local completed, count = _has_completed_tier(statistics_db, stats_id, from, to)

			if not IS_WINDOWS then
				return {
					count,
					weave_number,
				}
			else
				local weaves_won = statistics_db:get_persistent_stat(stats_id, "scorpion_weaves_won")
				local num_completed_weaves = math.min(count + weaves_won, weave_number)

				return {
					num_completed_weaves,
					weave_number,
				}
			end
		end,
	}
end

AchievementTemplates._list_of_weaves_from_to = {
	weaves_9 = {
		from = 41,
		to = 60,
	},
	weaves_10 = {
		from = 61,
		to = 80,
	},
	weaves_11 = {
		from = 81,
		to = 120,
	},
}

for weave, table in pairs(AchievementTemplates._list_of_weaves_from_to) do
	local id = "scorpion_" .. weave .. "_season_1"

	AchievementTemplates.achievements[id] = {
		required_dlc = "scorpion",
		name = "achv_scorpion_" .. weave .. "_season_1_name",
		desc = "achv_scorpion_" .. weave .. "_season_1_desc",
		icon = "achievement_trophy_scorpion_" .. weave .. "_season_1",
		completed = function (statistics_db, stats_id)
			local from = table.from
			local to = table.to
			local has_completed, _ = _has_completed_tier_seasonal(statistics_db, stats_id, ScorpionSeasonalSettings.current_season_id, from, to)

			return has_completed
		end,
		progress = function (statistics_db, stats_id)
			local from = table.from
			local to = table.to
			local total = to - from + 1
			local _, completed_amunt = _has_completed_tier_seasonal(statistics_db, stats_id, ScorpionSeasonalSettings.current_season_id, from, to)

			return {
				completed_amunt,
				total,
			}
		end,
	}
end

local profiles = PROFILES_BY_AFFILIATION.heroes

for i = 1, #profiles do
	local profile_index = FindProfileIndex(profiles[i])

	for career_index, career in pairs(SPProfiles[profile_index].careers) do
		local career_name = career.name
		local mapped_career_name = CareerNameAchievementMapping[career_name]
		local id = "scorpion_weaves_complete_" .. career_name .. "_season_1"

		AchievementTemplates.achievements[id] = {
			required_dlc = "scorpion",
			name = "achv_scorpion_weaves_complete_" .. mapped_career_name .. "_season_1_name",
			desc = "achv_scorpion_weaves_complete_" .. mapped_career_name .. "_season_1_desc",
			icon = "achievement_trophy_scorpion_weaves_complete_" .. mapped_career_name .. "_season_1",
			completed = function (statistics_db, stats_id)
				local stat_name = "weaves_complete_" .. career_name .. "_season_1"
				local amount_of_weaves = 40
				local completed = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name)

				return amount_of_weaves <= completed
			end,
			progress = function (statistics_db, stats_id)
				local stat_name = "weaves_complete_" .. career_name .. "_season_1"
				local amount_of_weaves = 40
				local completed = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name)

				return {
					completed,
					amount_of_weaves,
				}
			end,
		}
		id = "scorpion_weaves_rainbow_" .. career_name .. "_season_1"
		AchievementTemplates.achievements[id] = {
			required_dlc = "scorpion",
			name = "achv_scorpion_weaves_rainbow_" .. mapped_career_name .. "_season_1_name",
			desc = "achv_scorpion_weaves_rainbow_" .. mapped_career_name .. "_season_1_desc",
			icon = "achievement_trophy_scorpion_weaves_rainbow_" .. mapped_career_name .. "_season_1",
			completed = function (statistics_db, stats_id)
				return _weave_completed_career_rainbow(statistics_db, stats_id, career_name)
			end,
			progress = function (statistics_db, stats_id)
				local total_winds = #WeaveSettings.winds
				local _, amount_finished = _weave_completed_career_rainbow(statistics_db, stats_id, career_name)

				return {
					amount_finished,
					total_winds,
				}
			end,
		}
	end
end

AchievementTemplates.achievements.scorpion_weaves_life_season_1 = {
	desc = "achv_scorpion_weaves_life_season_1_desc",
	icon = "achievement_trophy_scorpion_weaves_life_season_1",
	name = "achv_scorpion_weaves_life_season_1_name",
	required_dlc = "scorpion",
	completed = function (statistics_db, stats_id)
		local stat_name = "scorpion_weaves_life_season_1"
		local completed = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name) > 0

		return completed
	end,
}
AchievementTemplates.achievements.scorpion_weaves_heavens_season_1 = {
	desc = "achv_scorpion_weaves_heavens_season_1_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_scorpion_weaves_heavens_season_1",
	name = "achv_scorpion_weaves_heavens_season_1_name",
	required_dlc = "scorpion",
	completed = function (statistics_db, stats_id)
		local stat_name = "scorpion_weaves_heavens_season_1"
		local completed = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name) > 0

		return completed
	end,
}
AchievementTemplates.achievements.scorpion_weaves_death_season_1 = {
	desc = "achv_scorpion_weaves_death_season_1_desc",
	icon = "achievement_trophy_scorpion_weaves_death_season_1",
	name = "achv_scorpion_weaves_death_season_1_name",
	required_dlc = "scorpion",
	completed = function (statistics_db, stats_id)
		local stat_name = "scorpion_weaves_death_season_1"
		local completed = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name) > 0

		return completed
	end,
}
AchievementTemplates.achievements.scorpion_weaves_beasts_season_1 = {
	desc = "achv_scorpion_weaves_beasts_season_1_desc",
	icon = "achievement_trophy_scorpion_weaves_beasts_season_1",
	name = "achv_scorpion_weaves_beasts_season_1_name",
	required_dlc = "scorpion",
	completed = function (statistics_db, stats_id)
		local stat_name = "scorpion_weaves_beasts_season_1"
		local completed = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name) > 0

		return completed
	end,
}
AchievementTemplates.achievements.scorpion_weaves_light_season_1 = {
	desc = "achv_scorpion_weaves_light_season_1_desc",
	icon = "achievement_trophy_scorpion_weaves_light_season_1",
	name = "achv_scorpion_weaves_light_season_1_name",
	required_dlc = "scorpion",
	completed = function (statistics_db, stats_id)
		local stat_name = "scorpion_weaves_light_season_1"
		local completed = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name) > 0

		return completed
	end,
}
AchievementTemplates.achievements.scorpion_weaves_fire_season_1 = {
	desc = "achv_scorpion_weaves_fire_season_1_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_scorpion_weaves_fire_season_1",
	name = "achv_scorpion_weaves_fire_season_1_name",
	required_dlc = "scorpion",
	completed = function (statistics_db, stats_id)
		local stat_name = "scorpion_weaves_fire_season_1"
		local completed = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name) > 0

		return completed
	end,
}
AchievementTemplates.achievements.scorpion_weaves_shadow_season_1 = {
	desc = "achv_scorpion_weaves_shadow_season_1_desc",
	icon = "achievement_trophy_scorpion_weaves_shadow_season_1",
	name = "achv_scorpion_weaves_shadow_season_1_name",
	required_dlc = "scorpion",
	completed = function (statistics_db, stats_id)
		local stat_name = "scorpion_weaves_shadow_season_1"
		local completed = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name) > 0

		return completed
	end,
}
AchievementTemplates.achievements.scorpion_weaves_metal_season_1 = {
	display_completion_ui = true,
	icon = "achievement_trophy_scorpion_weaves_metal_season_1",
	name = "achv_scorpion_weaves_metal_season_1_name",
	required_dlc = "scorpion",
	desc = function ()
		return string.format(Localize("achv_scorpion_weaves_metal_season_1_desc"), QuestSettings.bladestorm_duration)
	end,
	completed = function (statistics_db, stats_id)
		local stat_name = "scorpion_weaves_metal_season_1"
		local completed = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name) > 0

		return completed
	end,
}
AchievementTemplates.achievements.elven_ruins_align_leylines_timed_cata = {
	display_completion_ui = true,
	icon = "achievement_trophy_elven_ruins_align_leylines_timed_cata",
	name = "achv_elven_ruins_align_leylines_timed_cata_name",
	required_dlc = "scorpion",
	desc = function ()
		return string.format(Localize("achv_elven_ruins_align_leylines_timed_cata_desc"), QuestSettings.elven_ruins_speed_event_cata)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "elven_ruins_speed_event_cata") > 0
	end,
}
AchievementTemplates.achievements.farmlands_rescue_prisoners_timed_cata = {
	display_completion_ui = true,
	icon = "achievement_trophy_farmlands_rescue_prisoners_timed_cata",
	name = "achv_farmlands_rescue_prisoners_timed_cata_name",
	required_dlc = "scorpion",
	desc = function ()
		return string.format(Localize("achv_farmlands_rescue_prisoners_timed_cata_desc"), QuestSettings.farmlands_speed_event)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "farmlands_speed_event_cata") > 0
	end,
}
AchievementTemplates.achievements.military_kill_chaos_warriors_in_event_cata = {
	display_completion_ui = true,
	icon = "achievement_trophy_military_kill_chaos_warriors_in_event_cata",
	name = "achv_military_kill_chaos_warriors_in_event_cata_name",
	required_dlc = "scorpion",
	desc = function ()
		return string.format(Localize("achv_military_kill_chaos_warriors_in_event_cata_desc"), 3)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "military_statue_kill_chaos_warriors_cata") > 0
	end,
}
AchievementTemplates.achievements.ground_zero_burblespew_tornado_enemies_cata = {
	display_completion_ui = true,
	icon = "achievement_trophy_ground_zero_burblespew_tornado_enemies_cata",
	name = "achv_ground_zero_burblespew_tornado_enemies_cata_name",
	required_dlc = "scorpion",
	desc = function ()
		return string.format(Localize("achv_ground_zero_burblespew_tornado_enemies_cata_desc"), QuestSettings.halescourge_tornado_enemies_cata)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "halescourge_tornado_enemies_cata") > 0
	end,
}
AchievementTemplates.achievements.fort_kill_enemies_cannonball_cata = {
	display_completion_ui = true,
	icon = "achievement_trophy_fort_kill_enemies_cannonball_cata",
	name = "achv_fort_kill_enemies_cannonball_cata_name",
	required_dlc = "scorpion",
	desc = function ()
		return string.format(Localize("achv_fort_kill_enemies_cannonball_cata_desc"), QuestSettings.forest_fort_kill_cannonball_cata)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "forest_fort_kill_cannonball_cata") > 0
	end,
}
AchievementTemplates.achievements.nurgle_player_showered_in_pus_cata = {
	display_completion_ui = true,
	icon = "achievement_trophy_nurgle_player_showered_in_pus",
	name = "achv_nurgle_player_showered_in_pus_cata_name",
	required_dlc = "scorpion",
	desc = function ()
		return string.format(Localize("achv_nurgle_player_showered_in_pus_cata_desc"), QuestSettings.nurgle_bathed_all_cata)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "nurgle_bathed_all_cata") > 0
	end,
}
AchievementTemplates.achievements.bell_destroy_bell_flee_timed_cata = {
	display_completion_ui = true,
	icon = "achievement_trophy_bell_destroy_bell_flee_timed_cata",
	name = "achv_bell_destroy_bell_flee_timed_cata_name",
	required_dlc = "scorpion",
	desc = function ()
		return string.format(Localize("achv_bell_destroy_bell_flee_timed_cata_desc"), QuestSettings.bell_speed_event_cata)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "bell_speed_event_cata") > 0
	end,
}
AchievementTemplates.achievements.catacombs_stay_inside_ritual_pool_cata = {
	display_completion_ui = true,
	icon = "achievement_trophy_catacombs_stay_inside_ritual_pool_cata",
	name = "achv_catacombs_stay_inside_ritual_pool_cata_name",
	required_dlc = "scorpion",
	desc = function ()
		return string.format(Localize("achv_catacombs_stay_inside_ritual_pool_cata_desc"), QuestSettings.volume_corpse_pit_damage_cata)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "catacombs_added_souls_cata") > 0
	end,
}
AchievementTemplates.achievements.mines_kill_final_troll_timed_cata = {
	display_completion_ui = true,
	icon = "achievement_trophy_mines_kill_final_troll_timed_cata",
	name = "achv_mines_kill_final_troll_timed_cata_name",
	required_dlc = "scorpion",
	desc = function ()
		return string.format(Localize("achv_mines_kill_final_troll_timed_cata_desc"), QuestSettings.mines_speed_event_cata)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "mines_speed_event_cata") > 0
	end,
}
AchievementTemplates.achievements.warcamp_bodvarr_charge_warriors_cata = {
	display_completion_ui = true,
	icon = "achievement_trophy_warcamp_bodvarr_charge_warriors_cata",
	name = "achv_warcamp_bodvarr_charge_warriors_cata_name",
	required_dlc = "scorpion",
	desc = function ()
		return string.format(Localize("achv_warcamp_bodvarr_charge_warriors_cata_desc"), QuestSettings.exalted_champion_charge_chaos_warrior_cata)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "exalted_champion_charge_chaos_warrior_cata") > 0
	end,
}
AchievementTemplates.achievements.skaven_stronghold_skarrik_kill_skaven_cata = {
	display_completion_ui = true,
	icon = "achievement_trophy_skaven_stronghold_skarrik_kill_skaven_cata",
	name = "achv_skaven_stronghold_skarrik_kill_skaven_cata_name",
	required_dlc = "scorpion",
	desc = function ()
		return string.format(Localize("achv_skaven_stronghold_skarrik_kill_skaven_cata_desc"), QuestSettings.storm_vermin_warlord_kills_enemies_cata)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "storm_vermin_warlord_kills_enemies_cata") > 0
	end,
}
AchievementTemplates.achievements.ussingen_no_event_barrels_cata = {
	desc = "achv_ussingen_no_event_barrels_cata_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_ussingen_no_event_barrels_cata",
	name = "achv_ussingen_no_event_barrels_cata_name",
	required_dlc = "scorpion",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "ussingen_used_no_barrels_cata") > 0
	end,
}
AchievementTemplates.achievements.skittergate_deathrattler_rasknitt_timed_cata = {
	display_completion_ui = true,
	icon = "achievement_trophy_skittergate_deathrattler_rasknitt_timed_cata",
	name = "achv_skittergate_deathrattler_rasknitt_timed_cata_name",
	required_dlc = "scorpion",
	desc = function ()
		return string.format(Localize("achv_skittergate_deathrattler_rasknitt_timed_cata_desc"), QuestSettings.skittergate_speed_event_cata)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "skittergate_speed_event_cata") > 0
	end,
}

local helmgart_cata_level_name_stats = {
	achv_bell_destroy_bell_flee_timed_cata_name = "bell_speed_event_cata",
	achv_catacombs_stay_inside_ritual_pool_cata_name = "catacombs_added_souls_cata",
	achv_elven_ruins_align_leylines_timed_cata_name = "elven_ruins_speed_event_cata",
	achv_farmlands_rescue_prisoners_timed_cata_name = "farmlands_speed_event_cata",
	achv_fort_kill_enemies_cannonball_cata_name = "forest_fort_kill_cannonball_cata",
	achv_ground_zero_burblespew_tornado_enemies_cata_name = "halescourge_tornado_enemies_cata",
	achv_military_kill_chaos_warriors_in_event_cata_name = "military_statue_kill_chaos_warriors_cata",
	achv_mines_kill_final_troll_timed_cata_name = "mines_speed_event_cata",
	achv_nurgle_player_showered_in_pus_cata_name = "nurgle_bathed_all_cata",
	achv_skaven_stronghold_skarrik_kill_skaven_cata_name = "storm_vermin_warlord_kills_enemies_cata",
	achv_skittergate_deathrattler_rasknitt_timed_cata_name = "skittergate_speed_event_cata",
	achv_ussingen_no_event_barrels_cata_name = "ussingen_used_no_barrels_cata",
	achv_warcamp_bodvarr_charge_warriors_cata_name = "exalted_champion_charge_chaos_warrior_cata",
}

AchievementTemplates.achievements.complete_all_helmgart_level_achievements_cata = {
	desc = "achv_complete_all_helmgart_level_achievements_cata_desc",
	icon = "achievement_trophy_complete_all_helmgart_level_achievements_cata",
	name = "achv_complete_all_helmgart_level_achievements_cata_name",
	completed = function (statistics_db, stats_id)
		for _, stat_name in pairs(helmgart_cata_level_name_stats) do
			local completed = statistics_db:get_persistent_stat(stats_id, stat_name) > 0

			if not completed then
				return false
			end
		end

		return true
	end,
	progress = function (statistics_db, stats_id)
		local count = 0
		local total = 0

		for _, stat_name in pairs(helmgart_cata_level_name_stats) do
			total = total + 1

			local completed = statistics_db:get_persistent_stat(stats_id, stat_name) > 0

			if completed then
				count = count + 1
			end
		end

		return {
			count,
			total,
		}
	end,
	requirements = function (statistics_db, stats_id)
		local reqs = {}

		for achv_name, stat_name in pairs(helmgart_cata_level_name_stats) do
			local completed = statistics_db:get_persistent_stat(stats_id, stat_name) > 0

			table.insert(reqs, {
				name = achv_name,
				completed = completed,
			})
		end

		return reqs
	end,
}
AchievementTemplates.achievements.scorpion_cataclysm_unlock_kill_all_lords = {
	desc = "achv_scorpion_cataclysm_unlock_kill_all_lords_desc",
	icon = "achivement_trophy_scorpion_cataclysm_unlock_kill_all_lords",
	name = "achv_scorpion_cataclysm_unlock_kill_all_lords_name",
	required_dlc = "scorpion",
	completed = function (statistics_db, stats_id)
		local champion_completed = statistics_db:get_persistent_stat(stats_id, "kill_chaos_exalted_champion_scorpion_hardest") >= 5
		local sorcerer_completed = statistics_db:get_persistent_stat(stats_id, "kill_chaos_exalted_sorcerer_scorpion_hardest") >= 5
		local gray_seer_completed = statistics_db:get_persistent_stat(stats_id, "kill_skaven_grey_seer_scorpion_hardest") >= 5
		local storm_vermin_completed = statistics_db:get_persistent_stat(stats_id, "kill_skaven_storm_vermin_warlord_scorpion_hardest") >= 5

		return champion_completed and sorcerer_completed and gray_seer_completed and storm_vermin_completed
	end,
	requirements = function (statistics_db, stats_id)
		local champion_completed = statistics_db:get_persistent_stat(stats_id, "kill_chaos_exalted_champion_scorpion_hardest") >= 5
		local sorcerer_completed = statistics_db:get_persistent_stat(stats_id, "kill_chaos_exalted_sorcerer_scorpion_hardest") >= 5
		local gray_seer_completed = statistics_db:get_persistent_stat(stats_id, "kill_skaven_grey_seer_scorpion_hardest") >= 5
		local storm_vermin_completed = statistics_db:get_persistent_stat(stats_id, "kill_skaven_storm_vermin_warlord_scorpion_hardest") >= 5

		return {
			{
				name = "chaos_exalted_champion",
				completed = champion_completed,
			},
			{
				name = "chaos_exalted_sorcerer",
				completed = sorcerer_completed,
			},
			{
				name = "skaven_storm_vermin_warlord",
				completed = storm_vermin_completed,
			},
			{
				name = "skaven_grey_seer",
				completed = gray_seer_completed,
			},
		}
	end,
}

local achievements = AchievementTemplates.achievements
local auto_icon

add_weapon_kill_challenge(achievements, "scorpion_bardin_weapon_skin_1", "dr_1h_throwing_axes", 1000, auto_icon, "scorpion")
add_weapon_kill_challenge(achievements, "scorpion_kerillian_weapon_skin_1", "we_1h_spears_shield", 1000, auto_icon, "scorpion")
add_weapon_kill_challenge(achievements, "scorpion_markus_weapon_skin_1", "es_2h_heavy_spear", 1000, auto_icon, "scorpion")
add_weapon_kill_challenge(achievements, "scorpion_sienna_weapon_skin_1", "bw_1h_flail_flaming", 1000, auto_icon, "scorpion")
add_weapon_kill_challenge(achievements, "scorpion_victor_weapon_skin_1", "wh_2h_billhook", 1000, auto_icon, "scorpion")

local s2_lord_levels = {
	"warcamp",
	"skaven_stronghold",
	"ground_zero",
	"skittergate",
}
local s2_lord_difficulty = "hardest"

add_weapon_levels_challenge(achievements, "scorpion_bardin_weapon_skin_2", "dr_1h_throwing_axes", s2_lord_levels, s2_lord_difficulty, auto_icon, "scorpion")
add_weapon_levels_challenge(achievements, "scorpion_kerillian_weapon_skin_2", "we_1h_spears_shield", s2_lord_levels, s2_lord_difficulty, auto_icon, "scorpion")
add_weapon_levels_challenge(achievements, "scorpion_markus_weapon_skin_2", "es_2h_heavy_spear", s2_lord_levels, s2_lord_difficulty, auto_icon, "scorpion")
add_weapon_levels_challenge(achievements, "scorpion_sienna_weapon_skin_2", "bw_1h_flail_flaming", s2_lord_levels, s2_lord_difficulty, auto_icon, "scorpion")
add_weapon_levels_challenge(achievements, "scorpion_victor_weapon_skin_2", "wh_2h_billhook", s2_lord_levels, s2_lord_difficulty, auto_icon, "scorpion")
