-- chunkname: @scripts/managers/achievements/achievement_templates_holly.lua

local check_level_list = AchievementTemplateHelper.check_level_list
local check_level_difficulty = AchievementTemplateHelper.check_level_difficulty
local hero_level = AchievementTemplateHelper.hero_level
local equipped_items_of_rarity = AchievementTemplateHelper.equipped_items_of_rarity

AchievementTemplates.achievements.holly_complete_recruit = {
	ID_PS4 = "061",
	ID_XB1 = 62,
	desc = "achv_holly_complete_all_recruit_desc",
	icon = "achievement_holly_complete_all_recruit_desc",
	name = "achv_holly_complete_all_recruit_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.normal.rank

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
		local diff = DifficultySettings.normal.rank

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
		local diff = DifficultySettings.normal.rank
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
AchievementTemplates.achievements.holly_complete_veteran = {
	ID_PS4 = "062",
	ID_XB1 = 63,
	desc = "achv_holly_complete_all_veteran_desc",
	icon = "achievement_holly_complete_all_veteran_desc",
	name = "achv_holly_complete_all_veteran_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.hard.rank

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
		local diff = DifficultySettings.hard.rank

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
		local diff = DifficultySettings.hard.rank
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
AchievementTemplates.achievements.holly_complete_champion = {
	ID_PS4 = "063",
	ID_XB1 = 64,
	desc = "achv_holly_complete_all_champion_desc",
	icon = "achievement_holly_complete_all_champion_desc",
	name = "achv_holly_complete_all_champion_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.harder.rank

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
		local diff = DifficultySettings.harder.rank

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
		local diff = DifficultySettings.harder.rank
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
AchievementTemplates.achievements.holly_complete_legend = {
	ID_PS4 = "064",
	ID_XB1 = 65,
	desc = "achv_holly_complete_all_legend_desc",
	icon = "achievement_holly_complete_all_legend_desc",
	name = "achv_holly_complete_all_legend_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.hardest.rank

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
		local diff = DifficultySettings.hardest.rank

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
		local diff = DifficultySettings.hardest.rank
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
AchievementTemplates.achievements.holly_complete_plaza_recruit = {
	desc = "achv_holly_plaza_recruit_desc",
	icon = "achievement_holly_plaza_recruit_desc",
	name = "achv_holly_plaza_recruit_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.normal.rank

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.plaza.level_id, diff) then
			count = count + 1
		end

		return count >= 1
	end,
}
AchievementTemplates.achievements.holly_complete_plaza_veteran = {
	desc = "achv_holly_plaza_veteran_desc",
	icon = "achievement_holly_plaza_veteran_desc",
	name = "achv_holly_plaza_veteran_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.hard.rank

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.plaza.level_id, diff) then
			count = count + 1
		end

		return count >= 1
	end,
}
AchievementTemplates.achievements.holly_complete_plaza_champion = {
	desc = "achv_holly_plaza_champion_desc",
	icon = "achievement_holly_plaza_champion_desc",
	name = "achv_holly_plaza_champion_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.harder.rank

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.plaza.level_id, diff) then
			count = count + 1
		end

		return count >= 1
	end,
}
AchievementTemplates.achievements.holly_complete_plaza_legend = {
	desc = "achv_holly_plaza_legend_desc",
	icon = "achievement_holly_plaza_legend_desc",
	name = "achv_holly_plaza_legend_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		local count = 0
		local diff = DifficultySettings.hardest.rank

		if check_level_difficulty(statistics_db, stats_id, LevelSettings.plaza.level_id, diff) then
			count = count + 1
		end

		return count >= 1
	end,
}
AchievementTemplates.achievements.holly_find_all_runes = {
	ID_PS4 = "065",
	ID_XB1 = 66,
	desc = "achv_holly_find_all_runes_desc",
	display_completion_ui = true,
	icon = "achievement_holly_find_all_runes_desc",
	name = "achv_holly_find_all_runes_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		if statistics_db:get_persistent_stat(stats_id, "holly_find_all_runes") == 0 then
			local cemetery = statistics_db:get_persistent_stat(stats_id, "holly_cemetery_rune") > 0
			local forest = statistics_db:get_persistent_stat(stats_id, "holly_forest_ambush_rune") > 0
			local magnus = statistics_db:get_persistent_stat(stats_id, "holly_magnus_rune") > 0
			local fulfill = cemetery and forest and magnus

			if fulfill then
				statistics_db:increment_stat(stats_id, "holly_find_all_runes")

				return true
			end

			return false
		end

		return statistics_db:get_persistent_stat(stats_id, "holly_find_all_runes") > 0
	end,
	progress = function (statistics_db, stats_id)
		local count = 0

		if statistics_db:get_persistent_stat(stats_id, "holly_cemetery_rune") > 0 then
			count = count + 1
		end

		if statistics_db:get_persistent_stat(stats_id, "holly_forest_ambush_rune") > 0 then
			count = count + 1
		end

		if statistics_db:get_persistent_stat(stats_id, "holly_magnus_rune") > 0 then
			count = count + 1
		end

		return {
			count,
			3,
		}
	end,
	requirements = function (statistics_db, stats_id)
		local cemetery = statistics_db:get_persistent_stat(stats_id, "holly_cemetery_rune") > 0
		local forest = statistics_db:get_persistent_stat(stats_id, "holly_forest_ambush_rune") > 0
		local magnus = statistics_db:get_persistent_stat(stats_id, "holly_magnus_rune") > 0

		return {
			{
				name = "holly_cemetery_rune",
				completed = cemetery,
			},
			{
				name = "holly_forest_ambush_rune",
				completed = forest,
			},
			{
				name = "holly_magnus_rune",
				completed = magnus,
			},
		}
	end,
}
AchievementTemplates.achievements.holly_magnus_barrel_relay_race = {
	ID_PS4 = "066",
	ID_XB1 = 67,
	desc = "achv_holly_magnus_barrel_relay_race_desc",
	display_completion_ui = true,
	icon = "achievement_holly_magnus_barrel_relay_race_desc",
	name = "achv_holly_magnus_barrel_relay_race_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "holly_magnus_barrel_relay_race") > 0
	end,
}
AchievementTemplates.achievements.holly_magnus_barrel_relay_race_hardest = {
	desc = "achv_holly_magnus_barrel_relay_race_hardest_desc",
	display_completion_ui = true,
	icon = "achievement_holly_magnus_barrel_relay_race_hardest_desc",
	name = "achv_holly_magnus_barrel_relay_race_hardest_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "holly_magnus_barrel_relay_race_hardest") > 0
	end,
}
AchievementTemplates.achievements.holly_magnus_secret_room = {
	desc = "achv_holly_magnus_secret_room_desc",
	display_completion_ui = true,
	icon = "achievement_holly_magnus_secret_room_desc",
	name = "achv_holly_magnus_secret_room_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "holly_magnus_secret_room") > 0
	end,
}
AchievementTemplates.achievements.holly_magnus_gutter_runner_treasure = {
	ID_PS4 = "070",
	ID_XB1 = 71,
	desc = "achv_holly_magnus_gutter_runner_treasure_desc",
	display_completion_ui = true,
	icon = "achievement_holly_magnus_gutter_runner_treasure_desc",
	name = "achv_holly_magnus_gutter_runner_treasure_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "holly_magnus_gutter_runner_treasure") > 0
	end,
}
AchievementTemplates.achievements.holly_magnus_gutter_runner_treasure_hardest = {
	desc = "achv_holly_magnus_gutter_runner_treasure_hardest_desc",
	display_completion_ui = true,
	icon = "achievement_holly_magnus_gutter_runner_treasure_hardest_desc",
	name = "achv_holly_magnus_gutter_runner_treasure_hardest_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "holly_magnus_gutter_runner_treasure_hardest") > 0
	end,
}
AchievementTemplates.achievements.holly_forest_ambush_synchronized_explosives = {
	ID_PS4 = "068",
	ID_XB1 = 69,
	desc = "achv_holly_forest_ambush_synchronized_explosives_desc",
	display_completion_ui = true,
	icon = "achievement_holly_forest_ambush_synchronized_explosives_desc",
	name = "achv_holly_forest_ambush_synchronized_explosives_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "holly_forest_ambush_synchronized_explosives") > 0
	end,
}
AchievementTemplates.achievements.holly_forest_ambush_synchronized_explosives_hardest = {
	desc = "achv_holly_forest_ambush_synchronized_explosives_hardest_desc",
	display_completion_ui = true,
	icon = "achievement_holly_forest_ambush_synchronized_explosives_hardest_desc",
	name = "achv_holly_forest_ambush_synchronized_explosives_hardest_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "holly_forest_ambush_synchronized_explosives_hardest") > 0
	end,
}
AchievementTemplates.achievements.holly_forest_ambush_bretonnian_dance = {
	desc = "achv_holly_forest_ambush_bretonnian_dance_desc",
	display_completion_ui = true,
	icon = "achievement_holly_forest_ambush_bretonnian_dance_desc",
	name = "achv_holly_forest_ambush_bretonnian_dance_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "holly_forest_ambush_bretonnian_dance") > 0
	end,
}
AchievementTemplates.achievements.holly_forest_ambush_dragonbane_gem = {
	desc = "achv_holly_forest_ambush_dragonbane_gem_desc",
	display_completion_ui = true,
	icon = "achievement_holly_forest_ambush_dragonbane_gem_desc",
	name = "achv_holly_forest_ambush_dragonbane_gem_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "holly_forest_ambush_dragonbane_gem") > 0
	end,
}
AchievementTemplates.achievements.holly_cemetery_sleep = {
	desc = "achv_holly_cemetery_sleep_desc",
	display_completion_ui = true,
	icon = "achievement_holly_cemetery_sleep_desc",
	name = "achv_holly_cemetery_sleep_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "holly_cemetery_sleep") > 0
	end,
}
AchievementTemplates.achievements.holly_cemetery_synchronized_chains = {
	ID_PS4 = "067",
	ID_XB1 = 68,
	desc = "achv_holly_cemetery_synchronized_chains_desc",
	display_completion_ui = true,
	icon = "achievement_holly_cemetery_synchronized_chains_desc",
	name = "achv_holly_cemetery_synchronized_chains_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "holly_cemetery_synchronized_chains") > 0
	end,
}
AchievementTemplates.achievements.holly_cemetery_synchronized_chains_hardest = {
	desc = "achv_holly_cemetery_synchronized_chains_hardest_desc",
	display_completion_ui = true,
	icon = "achievement_holly_cemetery_synchronized_chains_hardest_desc",
	name = "achv_holly_cemetery_synchronized_chains_hardest_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "holly_cemetery_synchronized_chains_hardest") > 0
	end,
}
AchievementTemplates.achievements.holly_cemetery_bones = {
	ID_PS4 = "069",
	ID_XB1 = 70,
	desc = "achv_holly_cemetery_bones_desc",
	display_completion_ui = true,
	icon = "achievement_holly_cemetery_bones_desc",
	name = "achv_holly_cemetery_bones",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "holly_cemetery_bones") > 0
	end,
}
AchievementTemplates.achievements.holly_cemetery_rune = {
	desc = "achv_holly_cemetery_rune_desc",
	name = "achv_holly_cemetery_rune_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "holly_cemetery_rune") > 0
	end,
}
AchievementTemplates.achievements.holly_forest_ambush_rune = {
	desc = "achv_holly_forest_ambush_rune_desc",
	name = "achv_holly_forest_ambush_rune_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "holly_forest_ambush_rune") > 0
	end,
}
AchievementTemplates.achievements.holly_magnus_rune = {
	desc = "achv_holly_magnus_rune_desc",
	name = "achv_holly_magnus_rune_name",
	required_dlc = "holly",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "holly_magnus_rune") > 0
	end,
}
