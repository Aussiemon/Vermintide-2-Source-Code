local check_level_list_difficulty = AchievementTemplateHelper.check_level_list_difficulty
local hero_level = AchievementTemplateHelper.hero_level
AchievementTemplates.achievements.scorpion_bardin_reach_level_35 = {
	name = "achv_scorpion_bardin_reach_level_35_name",
	icon = "achievement_trophy_scorpion_bardin_reach_level_35",
	desc = "achv_scorpion_bardin_reach_level_35_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("dwarf_ranger") >= 35
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("dwarf_ranger")
		level = math.min(level, 35)

		return {
			level,
			35
		}
	end
}
AchievementTemplates.achievements.scorpion_kerillian_reach_level_35 = {
	name = "achv_scorpion_kerillian_reach_level_35_name",
	icon = "achievement_trophy_scorpion_kerillian_reach_level_35",
	desc = "achv_scorpion_kerillian_reach_level_35_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("wood_elf") >= 35
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("wood_elf")
		level = math.min(level, 35)

		return {
			level,
			35
		}
	end
}
AchievementTemplates.achievements.scorpion_markus_reach_level_35 = {
	name = "achv_scorpion_markus_reach_level_35_name",
	icon = "achievement_trophy_scorpion_markus_reach_level_35",
	desc = "achv_scorpion_markus_reach_level_35_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("empire_soldier") >= 35
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("empire_soldier")
		level = math.min(level, 35)

		return {
			level,
			35
		}
	end
}
AchievementTemplates.achievements.scorpion_sienna_reach_level_35 = {
	name = "achv_scorpion_sienna_reach_level_35_name",
	icon = "achievement_trophy_scorpion_sienna_reach_level_35",
	desc = "achv_scorpion_sienna_reach_level_35_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("bright_wizard") >= 35
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("bright_wizard")
		level = math.min(level, 35)

		return {
			level,
			35
		}
	end
}
AchievementTemplates.achievements.scorpion_victor_reach_level_35 = {
	name = "achv_scorpion_victor_reach_level_35_name",
	icon = "achievement_trophy_scorpion_victor_reach_level_35",
	desc = "achv_scorpion_victor_reach_level_35_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("witch_hunter") >= 35
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("witch_hunter")
		level = math.min(level, 35)

		return {
			level,
			35
		}
	end
}
AchievementTemplates.achievements.scorpion_complete_helmgart_act_one_cataclysm = {
	required_dlc = "scorpion",
	name = "achv_scorpion_complete_helmgart_act_one_cataclysm_name",
	icon = "achievement_trophy_scorpion_complete_act_one_cataclysm",
	desc = "achv_scorpion_complete_helmgart_act_one_cataclysm_desc",
	completed = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.military.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.catacombs.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.mines.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.ground_zero.level_id
		}, diff) then
			count = count + 1
		end

		return count >= 4
	end,
	progress = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.military.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.catacombs.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.mines.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.ground_zero.level_id
		}, diff) then
			count = count + 1
		end

		return {
			count,
			4
		}
	end,
	requirements = function (statistics_db, stats_id)
		local diff = DifficultySettings.cataclysm.rank
		local complete_military = check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.military.level_id
		}, diff)
		local complete_catacombs = check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.catacombs.level_id
		}, diff)
		local complete_mines = check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.mines.level_id
		}, diff)
		local complete_ground_zero = check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.ground_zero.level_id
		}, diff)

		return {
			{
				name = "level_name_military",
				completed = complete_military
			},
			{
				name = "level_name_catacombs",
				completed = complete_catacombs
			},
			{
				name = "level_name_mines",
				completed = complete_mines
			},
			{
				name = "level_name_ground_zero",
				completed = complete_ground_zero
			}
		}
	end
}
AchievementTemplates.achievements.scorpion_complete_helmgart_act_two_cataclysm = {
	required_dlc = "scorpion",
	name = "achv_scorpion_complete_helmgart_act_two_cataclysm_name",
	icon = "achievement_trophy_scorpion_complete_act_two_cataclysm",
	desc = "achv_scorpion_complete_helmgart_act_two_cataclysm_desc",
	completed = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.elven_ruins.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.bell.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.fort.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.skaven_stronghold.level_id
		}, diff) then
			count = count + 1
		end

		return count >= 4
	end,
	progress = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.elven_ruins.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.bell.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.fort.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.skaven_stronghold.level_id
		}, diff) then
			count = count + 1
		end

		return {
			count,
			4
		}
	end,
	requirements = function (statistics_db, stats_id)
		local diff = DifficultySettings.cataclysm.rank
		local complete_elven_ruins = check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.elven_ruins.level_id
		}, diff)
		local complete_bell = check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.bell.level_id
		}, diff)
		local complete_fort = check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.fort.level_id
		}, diff)
		local complete_skaven_stronghold = check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.skaven_stronghold.level_id
		}, diff)

		return {
			{
				name = "level_name_elven_ruins",
				completed = complete_elven_ruins
			},
			{
				name = "level_name_bell",
				completed = complete_bell
			},
			{
				name = "level_name_forest_fort",
				completed = complete_fort
			},
			{
				name = "level_name_skaven_stronghold",
				completed = complete_skaven_stronghold
			}
		}
	end
}
AchievementTemplates.achievements.scorpion_complete_helmgart_act_three_cataclysm = {
	required_dlc = "scorpion",
	name = "achv_scorpion_complete_helmgart_act_three_cataclysm_name",
	icon = "achievement_trophy_scorpion_complete_act_three_cataclysm",
	desc = "achv_scorpion_complete_helmgart_act_three_cataclysm_desc",
	completed = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.farmlands.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.ussingen.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.nurgle.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.warcamp.level_id
		}, diff) then
			count = count + 1
		end

		return count >= 4
	end,
	progress = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.farmlands.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.ussingen.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.nurgle.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.warcamp.level_id
		}, diff) then
			count = count + 1
		end

		return {
			count,
			4
		}
	end,
	requirements = function (statistics_db, stats_id)
		local diff = DifficultySettings.cataclysm.rank
		local complete_farmlands = check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.farmlands.level_id
		}, diff)
		local complete_ussingen = check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.ussingen.level_id
		}, diff)
		local complete_nurgle = check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.nurgle.level_id
		}, diff)
		local complete_warcamp = check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.warcamp.level_id
		}, diff)

		return {
			{
				name = "level_name_farmlands",
				completed = complete_farmlands
			},
			{
				name = "level_name_ussingen",
				completed = complete_ussingen
			},
			{
				name = "level_name_nurgle",
				completed = complete_nurgle
			},
			{
				name = "level_name_warcamp",
				completed = complete_warcamp
			}
		}
	end
}
AchievementTemplates.achievements.scorpion_complete_skittergate_cataclysm = {
	required_dlc = "scorpion",
	name = "achv_scorpion_complete_skittergate_cataclysm_name",
	icon = "achievement_trophy_scorpion_complete_skittergate_cataclysm",
	desc = "achv_scorpion_complete_skittergate_cataclysm_desc",
	completed = function (statistics_db, stats_id)
		local diff = DifficultySettings.cataclysm.rank

		return check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.skittergate.level_id
		}, diff)
	end
}

local function remove_prologue(levels)
	local prologue_index = nil

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
	required_dlc = "scorpion",
	name = "achv_scorpion_complete_all_helmgart_levels_cataclysm_name",
	icon = "achievement_trophy_scorpion_complete_all_helmgart_levels_cataclysm",
	desc = "achv_scorpion_complete_all_helmgart_levels_cataclysm_desc",
	completed = function (statistics_db, stats_id)
		local rank = DifficultySettings.cataclysm.rank

		return check_level_list_difficulty(statistics_db, stats_id, main_game_levels, rank)
	end,
	progress = function (statistics_db, stats_id)
		local rank = DifficultySettings.cataclysm.rank
		local num_completed = 0

		for _, level in ipairs(main_game_levels) do
			if check_level_list_difficulty(statistics_db, stats_id, {
				level
			}, rank) then
				num_completed = num_completed + 1
			end
		end

		return {
			num_completed,
			#main_game_levels
		}
	end,
	requirements = function (statistics_db, stats_id)
		local reqs = {}
		local rank = DifficultySettings.cataclysm.rank

		for _, level in ipairs(main_game_levels) do
			local completed = check_level_list_difficulty(statistics_db, stats_id, {
				level
			}, rank)

			table.insert(reqs, {
				name = LevelSettings[level].display_name,
				completed = completed
			})
		end

		return reqs
	end
}
AchievementTemplates.achievements.scorpion_complete_bogenhafen_cataclysm = {
	required_dlc = "scorpion",
	name = "achv_scorpion_complete_bogenhafen_cataclysm_name",
	icon = "achievement_trophy_scorpion_complete_bogenhafen_cataclysm",
	desc = "achv_scorpion_complete_bogenhafen_cataclysm_desc",
	completed = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.dlc_bogenhafen_slum.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.dlc_bogenhafen_city.level_id
		}, diff) then
			count = count + 1
		end

		return count >= 2
	end,
	progress = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.dlc_bogenhafen_slum.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.dlc_bogenhafen_city.level_id
		}, diff) then
			count = count + 1
		end

		return {
			count,
			2
		}
	end,
	requirements = function (statistics_db, stats_id)
		local diff = DifficultySettings.cataclysm.rank
		local complete_bogenhafen_slum = check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.dlc_bogenhafen_slum.level_id
		}, diff)
		local complete_bogenhafen_city = check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.dlc_bogenhafen_city.level_id
		}, diff)

		return {
			{
				name = "level_name_bogenhafen_slum",
				completed = complete_bogenhafen_slum
			},
			{
				name = "level_name_bogenhafen_city",
				completed = complete_bogenhafen_city
			}
		}
	end
}
AchievementTemplates.achievements.scorpion_complete_back_to_ubersreik_cataclysm = {
	required_dlc = "scorpion",
	name = "achv_scorpion_complete_back_to_ubersreik_cataclysm_name",
	icon = "achievement_trophy_scorpion_complete_back_to_ubersreik_cataclysm",
	desc = "achv_scorpion_complete_back_to_ubersreik_cataclysm_desc",
	completed = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.magnus.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.cemetery.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.forest_ambush.level_id
		}, diff) then
			count = count + 1
		end

		return count >= 3
	end,
	progress = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.magnus.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.cemetery.level_id
		}, diff) then
			count = count + 1
		end

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.forest_ambush.level_id
		}, diff) then
			count = count + 1
		end

		return {
			count,
			3
		}
	end,
	requirements = function (statistics_db, stats_id)
		local diff = DifficultySettings.cataclysm.rank
		local complete_holly_magnus = check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.magnus.level_id
		}, diff)
		local complete_holly_cemetery = check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.cemetery.level_id
		}, diff)
		local complete_holly_forest_ambush = check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.forest_ambush.level_id
		}, diff)

		return {
			{
				name = "level_name_magnus",
				completed = complete_holly_magnus
			},
			{
				name = "level_name_cemetery",
				completed = complete_holly_cemetery
			},
			{
				name = "level_name_forest_ambush",
				completed = complete_holly_forest_ambush
			}
		}
	end
}
AchievementTemplates.achievements.scorpion_complete_plaza_cataclysm = {
	required_dlc = "scorpion",
	name = "achv_scorpion_complete_plaza_cataclysm_name",
	icon = "achievement_trophy_scorpion_complete_plaza_cataclysm",
	desc = "achv_scorpion_complete_plaza_cataclysm_desc",
	completed = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.cataclysm.rank

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.plaza.level_id
		}, diff) then
			count = count + 1
		end

		return count >= 1
	end
}

local function _has_completed_tier(statistics_db, stats_id, from, to)
	local complete = false
	local counter = 0

	for tier = from, to, 1 do
		for player = 1, 4, 1 do
			local stat_name = "weave_score_weave_" .. tier .. "_" .. player .. "_players"
			complete = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name) > 0

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
			for player = 1, 4, 1 do
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

AchievementTemplates.complete_weaves_list_season_1 = {
	5,
	10,
	15,
	20,
	25,
	30,
	35,
	40
}

for i, weave_number in ipairs(AchievementTemplates.complete_weaves_list_season_1) do
	local id = "scorpion_weaves_" .. i .. "_season_1"
	AchievementTemplates.achievements[id] = {
		required_dlc = "scorpion",
		name = "achv_scorpion_weaves_" .. i .. "_season_1_name",
		desc = "achv_scorpion_weaves_" .. i .. "_season_1_desc",
		icon = "achievement_trophy_scorpion_weaves_" .. i .. "_season_1",
		completed = function (statistics_db, stats_id)
			local from = 1
			local to = weave_number

			return _has_completed_tier(statistics_db, stats_id, from, to)
		end
	}
end

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
	120
}

for i, weave_number in ipairs(AchievementTemplates.complete_weaves_list) do
	local id = "scorpion_complete_weaves_" .. i
	AchievementTemplates.achievements[id] = {
		required_dlc = "scorpion",
		name = "achv_scorpion_complete_weaves_" .. i .. "_name",
		desc = function ()
			return string.format(Localize("achv_scorpion_complete_weaves_" .. i .. "_desc"), weave_number)
		end,
		icon = "achievement_trophy_scorpion_complete_weaves_" .. i,
		completed = function (statistics_db, stats_id)
			local from = 1
			local to = weave_number

			return _has_completed_tier(statistics_db, stats_id, from, to)
		end
	}
end

AchievementTemplates._list_of_weaves_from_to = {
	weaves_9 = {
		from = 41,
		to = 60
	},
	weaves_10 = {
		from = 61,
		to = 80
	},
	weaves_11 = {
		from = 81,
		to = 120
	}
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
			local has_completed, _ = _has_completed_tier(statistics_db, stats_id, from, to)

			return has_completed
		end,
		progress = function (statistics_db, stats_id)
			local from = table.from
			local to = table.to
			local total = to - from + 1
			local _, completed_amunt = _has_completed_tier(statistics_db, stats_id, from, to)

			return {
				completed_amunt,
				total
			}
		end
	}
end

local profiles = PROFILES_BY_AFFILIATION.heroes

for i = 1, #profiles, 1 do
	local profile_index = FindProfileIndex(profiles[i])

	for career_index, career in pairs(SPProfiles[profile_index].careers) do
		local mapped_career_name = CareerNameAchievementMapping[career.display_name]
		local id = "scorpion_weaves_complete_" .. career.display_name .. "_season_1"
		AchievementTemplates.achievements[id] = {
			required_dlc = "scorpion",
			name = "achv_scorpion_weaves_complete_" .. mapped_career_name .. "_season_1_name",
			desc = "achv_scorpion_weaves_complete_" .. mapped_career_name .. "_season_1_desc",
			icon = "achievement_trophy_scorpion_weaves_complete_" .. mapped_career_name .. "_season_1",
			completed = function (statistics_db, stats_id)
				local stat_name = "weaves_complete_" .. career.display_name .. "_season_1"
				local amount_of_weaves = 40
				local completed = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name)

				return amount_of_weaves <= completed
			end,
			progress = function (statistics_db, stats_id)
				local stat_name = "weaves_complete_" .. career.display_name .. "_season_1"
				local amount_of_weaves = 40
				local completed = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name)

				return {
					completed,
					amount_of_weaves
				}
			end
		}
		id = "scorpion_weaves_rainbow_" .. career.display_name .. "_season_1"
		AchievementTemplates.achievements[id] = {
			required_dlc = "scorpion",
			name = "achv_scorpion_weaves_rainbow_" .. mapped_career_name .. "_season_1_name",
			desc = "achv_scorpion_weaves_rainbow_" .. mapped_career_name .. "_season_1_desc",
			icon = "achievement_trophy_scorpion_weaves_rainbow_" .. mapped_career_name .. "_season_1",
			completed = function (statistics_db, stats_id)
				return _weave_completed_career_rainbow(statistics_db, stats_id, career.display_name)
			end,
			progress = function (statistics_db, stats_id)
				local total_winds = #WeaveSettings.winds
				local _, amount_finished = _weave_completed_career_rainbow(statistics_db, stats_id, career.display_name)

				return {
					amount_finished,
					total_winds
				}
			end
		}
	end
end

AchievementTemplates.achievements.scorpion_weaves_life_season_1 = {
	required_dlc = "scorpion",
	name = "achv_scorpion_weaves_life_season_1_name",
	icon = "achievement_trophy_scorpion_weaves_life_season_1",
	desc = "achv_scorpion_weaves_life_season_1_desc",
	completed = function (statistics_db, stats_id)
		local stat_name = "scorpion_weaves_life_season_1"
		local completed = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name) > 0

		return completed
	end
}
AchievementTemplates.achievements.scorpion_weaves_heavens_season_1 = {
	required_dlc = "scorpion",
	name = "achv_scorpion_weaves_heavens_season_1_name",
	display_completion_ui = true,
	icon = "achievement_trophy_scorpion_weaves_heavens_season_1",
	desc = "achv_scorpion_weaves_heavens_season_1_desc",
	completed = function (statistics_db, stats_id)
		local stat_name = "scorpion_weaves_heavens_season_1"
		local completed = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name) > 0

		return completed
	end
}
AchievementTemplates.achievements.scorpion_weaves_death_season_1 = {
	required_dlc = "scorpion",
	name = "achv_scorpion_weaves_death_season_1_name",
	icon = "achievement_trophy_scorpion_weaves_death_season_1",
	desc = "achv_scorpion_weaves_death_season_1_desc",
	completed = function (statistics_db, stats_id)
		local stat_name = "scorpion_weaves_death_season_1"
		local completed = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name) > 0

		return completed
	end
}
AchievementTemplates.achievements.scorpion_weaves_beasts_season_1 = {
	required_dlc = "scorpion",
	name = "achv_scorpion_weaves_beasts_season_1_name",
	icon = "achievement_trophy_scorpion_weaves_beasts_season_1",
	desc = "achv_scorpion_weaves_beasts_season_1_desc",
	completed = function (statistics_db, stats_id)
		local stat_name = "scorpion_weaves_beasts_season_1"
		local completed = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name) > 0

		return completed
	end
}
AchievementTemplates.achievements.scorpion_weaves_light_season_1 = {
	required_dlc = "scorpion",
	name = "achv_scorpion_weaves_light_season_1_name",
	icon = "achievement_trophy_scorpion_weaves_light_season_1",
	desc = "achv_scorpion_weaves_light_season_1_desc",
	completed = function (statistics_db, stats_id)
		local stat_name = "scorpion_weaves_light_season_1"
		local completed = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name) > 0

		return completed
	end
}
AchievementTemplates.achievements.scorpion_weaves_fire_season_1 = {
	required_dlc = "scorpion",
	name = "achv_scorpion_weaves_fire_season_1_name",
	display_completion_ui = true,
	icon = "achievement_trophy_scorpion_weaves_fire_season_1",
	desc = "achv_scorpion_weaves_fire_season_1_desc",
	completed = function (statistics_db, stats_id)
		local stat_name = "scorpion_weaves_fire_season_1"
		local completed = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name) > 0

		return completed
	end
}
AchievementTemplates.achievements.scorpion_weaves_shadow_season_1 = {
	required_dlc = "scorpion",
	name = "achv_scorpion_weaves_shadow_season_1_name",
	icon = "achievement_trophy_scorpion_weaves_shadow_season_1",
	desc = "achv_scorpion_weaves_shadow_season_1_desc",
	completed = function (statistics_db, stats_id)
		local stat_name = "scorpion_weaves_shadow_season_1"
		local completed = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name) > 0

		return completed
	end
}
AchievementTemplates.achievements.scorpion_weaves_metal_season_1 = {
	required_dlc = "scorpion",
	name = "achv_scorpion_weaves_metal_season_1_name",
	display_completion_ui = true,
	icon = "achievement_trophy_scorpion_weaves_metal_season_1",
	desc = function ()
		return string.format(Localize("achv_scorpion_weaves_metal_season_1_desc"), QuestSettings.bladestorm_duration)
	end,
	completed = function (statistics_db, stats_id)
		local stat_name = "scorpion_weaves_metal_season_1"
		local completed = statistics_db:get_persistent_stat(stats_id, "season_1", stat_name) > 0

		return completed
	end
}
AchievementTemplates.achievements.elven_ruins_align_leylines_timed_cata = {
	required_dlc = "scorpion",
	name = "achv_elven_ruins_align_leylines_timed_cata_name",
	display_completion_ui = true,
	icon = "achievement_trophy_elven_ruins_align_leylines_timed_cata",
	desc = function ()
		return string.format(Localize("achv_elven_ruins_align_leylines_timed_cata_desc"), QuestSettings.elven_ruins_speed_event_cata)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "elven_ruins_speed_event_cata") > 0
	end
}
AchievementTemplates.achievements.farmlands_rescue_prisoners_timed_cata = {
	required_dlc = "scorpion",
	name = "achv_farmlands_rescue_prisoners_timed_cata_name",
	display_completion_ui = true,
	icon = "achievement_trophy_farmlands_rescue_prisoners_timed_cata",
	desc = function ()
		return string.format(Localize("achv_farmlands_rescue_prisoners_timed_cata_desc"), QuestSettings.farmlands_speed_event)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "farmlands_speed_event_cata") > 0
	end
}
AchievementTemplates.achievements.military_kill_chaos_warriors_in_event_cata = {
	required_dlc = "scorpion",
	name = "achv_military_kill_chaos_warriors_in_event_cata_name",
	display_completion_ui = true,
	icon = "achievement_trophy_military_kill_chaos_warriors_in_event_cata",
	desc = function ()
		return string.format(Localize("achv_military_kill_chaos_warriors_in_event_cata_desc"), 3)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "military_statue_kill_chaos_warriors_cata") > 0
	end
}
AchievementTemplates.achievements.ground_zero_burblespew_tornado_enemies_cata = {
	required_dlc = "scorpion",
	name = "achv_ground_zero_burblespew_tornado_enemies_cata_name",
	display_completion_ui = true,
	icon = "achievement_trophy_ground_zero_burblespew_tornado_enemies_cata",
	desc = function ()
		return string.format(Localize("achv_ground_zero_burblespew_tornado_enemies_cata_desc"), QuestSettings.halescourge_tornado_enemies_cata)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "halescourge_tornado_enemies_cata") > 0
	end
}
AchievementTemplates.achievements.fort_kill_enemies_cannonball_cata = {
	required_dlc = "scorpion",
	name = "achv_fort_kill_enemies_cannonball_cata_name",
	display_completion_ui = true,
	icon = "achievement_trophy_fort_kill_enemies_cannonball_cata",
	desc = function ()
		return string.format(Localize("achv_fort_kill_enemies_cannonball_cata_desc"), QuestSettings.forest_fort_kill_cannonball_cata)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "forest_fort_kill_cannonball_cata") > 0
	end
}
AchievementTemplates.achievements.nurgle_player_showered_in_pus_cata = {
	required_dlc = "scorpion",
	name = "achv_nurgle_player_showered_in_pus_cata_name",
	display_completion_ui = true,
	icon = "achievement_trophy_nurgle_player_showered_in_pus",
	desc = function ()
		return string.format(Localize("achv_nurgle_player_showered_in_pus_cata_desc"), QuestSettings.nurgle_bathed_all_cata)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "nurgle_bathed_all_cata") > 0
	end
}
AchievementTemplates.achievements.bell_destroy_bell_flee_timed_cata = {
	required_dlc = "scorpion",
	name = "achv_bell_destroy_bell_flee_timed_cata_name",
	display_completion_ui = true,
	icon = "achievement_trophy_bell_destroy_bell_flee_timed_cata",
	desc = function ()
		return string.format(Localize("achv_bell_destroy_bell_flee_timed_cata_desc"), QuestSettings.bell_speed_event_cata)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "bell_speed_event_cata") > 0
	end
}
AchievementTemplates.achievements.catacombs_stay_inside_ritual_pool_cata = {
	required_dlc = "scorpion",
	name = "achv_catacombs_stay_inside_ritual_pool_cata_name",
	display_completion_ui = true,
	icon = "achievement_trophy_catacombs_stay_inside_ritual_pool_cata",
	desc = function ()
		return string.format(Localize("achv_catacombs_stay_inside_ritual_pool_cata_desc"), QuestSettings.volume_corpse_pit_damage_cata)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "catacombs_added_souls_cata") > 0
	end
}
AchievementTemplates.achievements.mines_kill_final_troll_timed_cata = {
	required_dlc = "scorpion",
	name = "achv_mines_kill_final_troll_timed_cata_name",
	display_completion_ui = true,
	icon = "achievement_trophy_mines_kill_final_troll_timed_cata",
	desc = function ()
		return string.format(Localize("achv_mines_kill_final_troll_timed_cata_desc"), QuestSettings.mines_speed_event_cata)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "mines_speed_event_cata") > 0
	end
}
AchievementTemplates.achievements.warcamp_bodvarr_charge_warriors_cata = {
	required_dlc = "scorpion",
	name = "achv_warcamp_bodvarr_charge_warriors_cata_name",
	display_completion_ui = true,
	icon = "achievement_trophy_warcamp_bodvarr_charge_warriors_cata",
	desc = function ()
		return string.format(Localize("achv_warcamp_bodvarr_charge_warriors_cata_desc"), QuestSettings.exalted_champion_charge_chaos_warrior_cata)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "exalted_champion_charge_chaos_warrior_cata") > 0
	end
}
AchievementTemplates.achievements.skaven_stronghold_skarrik_kill_skaven_cata = {
	required_dlc = "scorpion",
	name = "achv_skaven_stronghold_skarrik_kill_skaven_cata_name",
	display_completion_ui = true,
	icon = "achievement_trophy_skaven_stronghold_skarrik_kill_skaven_cata",
	desc = function ()
		return string.format(Localize("achv_skaven_stronghold_skarrik_kill_skaven_cata_desc"), QuestSettings.storm_vermin_warlord_kills_enemies_cata)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "storm_vermin_warlord_kills_enemies_cata") > 0
	end
}
AchievementTemplates.achievements.ussingen_no_event_barrels_cata = {
	required_dlc = "scorpion",
	name = "achv_ussingen_no_event_barrels_cata_name",
	display_completion_ui = true,
	icon = "achievement_trophy_ussingen_no_event_barrels_cata",
	desc = "achv_ussingen_no_event_barrels_cata_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "ussingen_used_no_barrels_cata") > 0
	end
}
AchievementTemplates.achievements.skittergate_deathrattler_rasknitt_timed_cata = {
	required_dlc = "scorpion",
	name = "achv_skittergate_deathrattler_rasknitt_timed_cata_name",
	display_completion_ui = true,
	icon = "achievement_trophy_skittergate_deathrattler_rasknitt_timed_cata",
	desc = function ()
		return string.format(Localize("achv_skittergate_deathrattler_rasknitt_timed_cata_desc"), QuestSettings.skittergate_speed_event_cata)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "skittergate_speed_event_cata") > 0
	end
}
local helmgart_cata_level_name_stats = {
	achv_mines_kill_final_troll_timed_cata_name = "mines_speed_event_cata",
	achv_ussingen_no_event_barrels_cata_name = "ussingen_used_no_barrels_cata",
	achv_military_kill_chaos_warriors_in_event_cata_name = "military_statue_kill_chaos_warriors_cata",
	achv_bell_destroy_bell_flee_timed_cata_name = "bell_speed_event_cata",
	achv_ground_zero_burblespew_tornado_enemies_cata_name = "halescourge_tornado_enemies_cata",
	achv_catacombs_stay_inside_ritual_pool_cata_name = "catacombs_added_souls_cata",
	achv_elven_ruins_align_leylines_timed_cata_name = "elven_ruins_speed_event_cata",
	achv_fort_kill_enemies_cannonball_cata_name = "forest_fort_kill_cannonball_cata",
	achv_farmlands_rescue_prisoners_timed_cata_name = "farmlands_speed_event_cata",
	achv_skaven_stronghold_skarrik_kill_skaven_cata_name = "storm_vermin_warlord_kills_enemies_cata",
	achv_skittergate_deathrattler_rasknitt_timed_cata_name = "skittergate_speed_event_cata",
	achv_nurgle_player_showered_in_pus_cata_name = "nurgle_bathed_all_cata",
	achv_warcamp_bodvarr_charge_warriors_cata_name = "exalted_champion_charge_chaos_warrior_cata"
}
AchievementTemplates.achievements.complete_all_helmgart_level_achievements_cata = {
	name = "achv_complete_all_helmgart_level_achievements_cata_name",
	icon = "achievement_trophy_complete_all_helmgart_level_achievements_cata",
	desc = "achv_complete_all_helmgart_level_achievements_cata_desc",
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
			total
		}
	end,
	requirements = function (statistics_db, stats_id)
		local reqs = {}

		for achv_name, stat_name in pairs(helmgart_cata_level_name_stats) do
			local completed = statistics_db:get_persistent_stat(stats_id, stat_name) > 0

			table.insert(reqs, {
				name = achv_name,
				completed = completed
			})
		end

		return reqs
	end
}
AchievementTemplates.achievements.scorpion_cataclysm_unlock_kill_all_lords = {
	required_dlc = "scorpion",
	name = "achv_scorpion_cataclysm_unlock_kill_all_lords_name",
	icon = "achivement_trophy_scorpion_cataclysm_unlock_kill_all_lords",
	desc = "achv_scorpion_cataclysm_unlock_kill_all_lords_desc",
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
				completed = champion_completed
			},
			{
				name = "chaos_exalted_sorcerer",
				completed = sorcerer_completed
			},
			{
				name = "skaven_storm_vermin_warlord",
				completed = storm_vermin_completed
			},
			{
				name = "skaven_grey_seer",
				completed = gray_seer_completed
			}
		}
	end
}

return
