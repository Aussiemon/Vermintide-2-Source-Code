ACHIEVEMENT_VERSION_NUMBER = 1

local function check_level_list(statistics_db, stats_id, levels_to_complete)
	if Development.parameter("beta_level_progression") then
		return false
	end

	assert(type(levels_to_complete) == "table", "levels_to_complete needs to be a list of levels")

	for i = 1, #levels_to_complete, 1 do
		local level_id = levels_to_complete[i]
		local level_stat = statistics_db.get_persistent_stat(statistics_db, stats_id, "completed_levels", level_id)

		if not level_stat or level_stat == 0 then
			return false
		end
	end

	return true
end

local function check_level_list_difficulty(statistics_db, stats_id, levels_to_complete, difficulty_rank)
	if Development.parameter("beta_level_progression") then
		return false
	end

	assert(type(levels_to_complete) == "table", "levels_to_complete needs to be a list of levels")

	local difficulty_manager = Managers.state.difficulty

	if not difficulty_manager then
		return false
	end

	for i = 1, #levels_to_complete, 1 do
		local level_id = levels_to_complete[i]
		local difficulties = difficulty_manager.get_level_difficulties(difficulty_manager, level_id)
		local difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, level_id)
		local difficulty_key = difficulties[difficulty_index]

		if not difficulty_key then
			return false
		end

		local completed_rank = DifficultySettings[difficulty_key].rank

		if completed_rank < difficulty_rank then
			return false
		end
	end

	return true
end

local function check_unlock(unlock_name)
	local backend_manager = Managers.backend

	return false
end

AchievementTemplates = {
	complete_tutorial = {
		ID_XB1 = "TROP001",
		ID_PS4 = "TROP001",
		evaluate = function (statistics_db, stats_id)
			return check_level_list(statistics_db, stats_id, {
				LevelSettings.prologue.level_id
			})
		end
	},
	complete_act_one = {
		ID_XB1 = "TROP002",
		ID_PS4 = "TROP002",
		evaluate = function (statistics_db, stats_id)
			return LevelUnlockUtils.act_completed(statistics_db, stats_id, "act_1")
		end
	},
	complete_act_two = {
		ID_XB1 = "TROP003",
		ID_PS4 = "TROP003",
		evaluate = function (statistics_db, stats_id)
			return LevelUnlockUtils.act_completed(statistics_db, stats_id, "act_2")
		end
	},
	complete_act_three = {
		ID_XB1 = "TROP004",
		ID_PS4 = "TROP004",
		evaluate = function (statistics_db, stats_id)
			return LevelUnlockUtils.act_completed(statistics_db, stats_id, "act_3")
		end
	},
	complete_skittergate_normal = {
		ID_XB1 = "TROP005",
		ID_PS4 = "TROP005",
		evaluate = function (statistics_db, stats_id)
			local diff = DifficultySettings.normal.rank

			return check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.skittergate.level_id
			}, diff)
		end
	},
	complete_skittergate_hard = {
		ID_XB1 = "TROP006",
		ID_PS4 = "TROP006",
		evaluate = function (statistics_db, stats_id)
			local diff = DifficultySettings.hard.rank

			return check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.skittergate.level_id
			}, diff)
		end
	},
	complete_skittergate_nightmare = {
		ID_XB1 = "TROP007",
		ID_PS4 = "TROP007",
		evaluate = function (statistics_db, stats_id)
			local diff = DifficultySettings.harder.rank

			return check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.skittergate.level_id
			}, diff)
		end
	},
	complete_skittergate_cataclysm = {
		ID_XB1 = "TROP008",
		ID_PS4 = "TROP008",
		evaluate = function (statistics_db, stats_id)
			local diff = DifficultySettings.hardest.rank

			return check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.skittergate.level_id
			}, diff)
		end
	}
}

local function completed_levels(statistics_db, stats_id)
	local levels_completed = 0

	for slot6, slot7 in ipairs(MainGameLevels) do
	end

	for slot6, slot7 in ipairs(NoneActLevels) do
	end

	return levels_completed
end

local function collected_tomes(statistics_db, stats_id)
	local mission_system = Managers.state.entity:system("mission_system")
	local tome_mission_data = mission_system.get_level_end_mission_data(mission_system, "tome_bonus_mission")

	if not tome_mission_data then
		return 0
	end

	return tome_mission_data.current_amount
end

local function collected_grimoires(statistics_db, stats_id)
	local mission_system = Managers.state.entity:system("mission_system")
	local grimoire_mission_data = mission_system.get_level_end_mission_data(mission_system, "grimoire_hidden_mission")

	if not grimoire_mission_data then
		return 0
	end

	return grimoire_mission_data.current_amount
end

HeroStats = {
	mission_completed = {
		persistent = true,
		stat_name = "HeroMissionCompleted",
		evaluate = function (statistics_db, stats_id)
			return completed_levels(statistics_db, stats_id)
		end
	},
	skaven_killed = {
		persistent = false,
		stat_name = "HeroSkavenKilled",
		evaluate = function (statistics_db, stats_id)
			return statistics_db.get_stat(statistics_db, stats_id, "kills_total")
		end
	},
	rat_ogres_killed = {
		persistent = false,
		stat_name = "HeroOgresKilled",
		evaluate = function (statistics_db, stats_id)
			return statistics_db.get_stat(statistics_db, stats_id, "kills_per_breed", "skaven_rat_ogre")
		end
	},
	tomes_collected = {
		persistent = false,
		stat_name = "HeroTomesCollected",
		evaluate = function (statistics_db, stats_id)
			return collected_tomes(statistics_db, stats_id)
		end
	},
	grimoires_collected = {
		persistent = false,
		stat_name = "HeroGrimoiresCollected",
		evaluate = function (statistics_db, stats_id)
			return collected_grimoires(statistics_db, stats_id)
		end
	}
}
AchievementTemplates_n = 0
local templates = {}

for name, template in pairs(AchievementTemplates) do
	template.name = name
	AchievementTemplates_n = AchievementTemplates_n + 1
	templates[AchievementTemplates_n] = template
	templates[name] = template
end

AchievementTemplates = templates

return 
