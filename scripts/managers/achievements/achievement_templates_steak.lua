local check_level_list_difficulty = AchievementTemplateHelper.check_level_list_difficulty
AchievementTemplates.achievements.scorpion_bardin_weapon_unlock = {
	required_dlc = "scorpion",
	name = "achv_scorpion_bardin_weapon_unlock_name",
	icon = "achievement_trophy_scorpion_bardin_weapon_unlock",
	desc = "achv_scorpion_bardin_weapon_unlock_desc",
	completed = function (statistics_db, stats_id)
		if statistics_db:get_persistent_stat(stats_id, "completed_levels_dwarf_ranger", "crater") > 0 then
			return true
		end

		return false
	end,
	progress = function (statistics_db, stats_id)
		local count = 0

		if statistics_db:get_persistent_stat(stats_id, "completed_levels_dwarf_ranger", "crater") > 0 then
			count = count + 1
		end

		return {
			count,
			1
		}
	end
}
AchievementTemplates.achievements.scorpion_kerillian_weapon_unlock = {
	required_dlc = "scorpion",
	name = "achv_scorpion_kerillian_weapon_unlock_name",
	icon = "achievement_trophy_scorpion_kerillian_weapon_unlock",
	desc = "achv_scorpion_kerillian_weapon_unlock_desc",
	completed = function (statistics_db, stats_id)
		if statistics_db:get_persistent_stat(stats_id, "completed_levels_wood_elf", "crater") > 0 then
			return true
		end

		return false
	end,
	progress = function (statistics_db, stats_id)
		local count = 0

		if statistics_db:get_persistent_stat(stats_id, "completed_levels_wood_elf", "crater") > 0 then
			count = count + 1
		end

		return {
			count,
			1
		}
	end
}
AchievementTemplates.achievements.scorpion_markus_weapon_unlock = {
	required_dlc = "scorpion",
	name = "achv_scorpion_markus_weapon_unlock_name",
	icon = "achievement_trophy_scorpion_markus_weapon_unlock",
	desc = "achv_scorpion_markus_weapon_unlock_desc",
	completed = function (statistics_db, stats_id)
		if statistics_db:get_persistent_stat(stats_id, "completed_levels_empire_soldier", "crater") > 0 then
			return true
		end

		return false
	end,
	progress = function (statistics_db, stats_id)
		local count = 0

		if statistics_db:get_persistent_stat(stats_id, "completed_levels_empire_soldier", "crater") > 0 then
			count = count + 1
		end

		return {
			count,
			1
		}
	end
}
AchievementTemplates.achievements.scorpion_sienna_weapon_unlock = {
	required_dlc = "scorpion",
	name = "achv_scorpion_sienna_weapon_unlock_name",
	icon = "achievement_trophy_scorpion_sienna_weapon_unlock",
	desc = "achv_scorpion_sienna_weapon_unlock_desc",
	completed = function (statistics_db, stats_id)
		if statistics_db:get_persistent_stat(stats_id, "completed_levels_bright_wizard", "crater") > 0 then
			return true
		end

		return false
	end,
	progress = function (statistics_db, stats_id)
		local count = 0

		if statistics_db:get_persistent_stat(stats_id, "completed_levels_bright_wizard", "crater") > 0 then
			count = count + 1
		end

		return {
			count,
			1
		}
	end
}
AchievementTemplates.achievements.scorpion_victor_weapon_unlock = {
	required_dlc = "scorpion",
	name = "achv_scorpion_victor_weapon_unlock_name",
	icon = "achievement_trophy_scorpion_victor_weapon_unlock",
	desc = "achv_scorpion_victor_weapon_unlock_desc",
	completed = function (statistics_db, stats_id)
		if statistics_db:get_persistent_stat(stats_id, "completed_levels_witch_hunter", "crater") > 0 then
			return true
		end

		return false
	end,
	progress = function (statistics_db, stats_id)
		local count = 0

		if statistics_db:get_persistent_stat(stats_id, "completed_levels_witch_hunter", "crater") > 0 then
			count = count + 1
		end

		return {
			count,
			1
		}
	end
}
AchievementTemplates.achievements.scorpion_complete_crater_recruit = {
	ID_XB1 = 72,
	name = "achv_scorpion_complete_crater_recruit_name",
	required_dlc = "scorpion",
	ID_PS4 = "071",
	icon = "achievement_trophy_scorpion_complete_crater_recruit",
	desc = "achv_scorpion_complete_crater_recruit_desc",
	completed = function (statistics_db, stats_id)
		local diff = DifficultySettings.normal.rank
		local unlocked = false

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.crater.level_id
		}, diff) then
			unlocked = true
		end

		return unlocked
	end
}
AchievementTemplates.achievements.scorpion_complete_crater_veteran = {
	required_dlc = "scorpion",
	name = "achv_scorpion_complete_crater_veteran_name",
	icon = "achievement_trophy_scorpion_complete_crater_veteran",
	desc = "achv_scorpion_complete_crater_veteran_desc",
	completed = function (statistics_db, stats_id)
		local diff = DifficultySettings.hard.rank
		local unlocked = false

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.crater.level_id
		}, diff) then
			unlocked = true
		end

		return unlocked
	end
}
AchievementTemplates.achievements.scorpion_complete_crater_champion = {
	required_dlc = "scorpion",
	name = "achv_scorpion_complete_crater_champion_name",
	icon = "achievement_trophy_scorpion_complete_crater_champion",
	desc = "achv_scorpion_complete_crater_champion_desc",
	completed = function (statistics_db, stats_id)
		local diff = DifficultySettings.harder.rank
		local unlocked = false

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.crater.level_id
		}, diff) then
			unlocked = true
		end

		return unlocked
	end
}
AchievementTemplates.achievements.scorpion_complete_crater_legend = {
	required_dlc = "scorpion",
	name = "achv_scorpion_complete_crater_legend_name",
	icon = "achievement_trophy_scorpion_complete_crater_legend",
	desc = "achv_scorpion_complete_crater_legend_desc",
	completed = function (statistics_db, stats_id)
		local diff = DifficultySettings.hardest.rank
		local unlocked = false

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.crater.level_id
		}, diff) then
			unlocked = true
		end

		return unlocked
	end
}
AchievementTemplates.achievements.scorpion_complete_crater_cataclysm = {
	required_dlc = "scorpion",
	name = "achv_scorpion_complete_crater_cataclysm_name",
	icon = "achievement_trophy_scorpion_complete_crater_cataclysm",
	desc = "achv_scorpion_complete_crater_cataclysm_desc",
	completed = function (statistics_db, stats_id)
		local diff = DifficultySettings.cataclysm.rank
		local unlocked = false

		if check_level_list_difficulty(statistics_db, stats_id, {
			LevelSettings.crater.level_id
		}, diff) then
			unlocked = true
		end

		return unlocked
	end
}
AchievementTemplates.achievements.scorpion_crater_pendant = {
	ID_XB1 = 73,
	name = "achv_scorpion_crater_pendant_name",
	ID_PS4 = "072",
	required_dlc = "scorpion",
	icon = "achievement_trophy_scorpion_crater_pendant",
	display_completion_ui = true,
	desc = "achv_scorpion_crater_pendant_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "scorpion_crater_pendant") > 0
	end
}

for i = 1, 3, 1 do
	local id = "scorpion_crater_dark_tongue_" .. i
	AchievementTemplates.achievements[id] = {
		required_dlc = "scorpion",
		display_completion_ui = true,
		ID_XB1 = 73 + i,
		ID_PS4 = "0" .. tostring(72 + i),
		name = "achv_scorpion_crater_dark_tongue_" .. i .. "_name",
		desc = "achv_scorpion_crater_dark_tongue_" .. i .. "_desc",
		icon = "achievement_trophy_scorpion_crater_dark_tongue_" .. i,
		completed = function (statistics_db, stats_id)
			return statistics_db:get_persistent_stat(stats_id, "scorpion_crater_dark_tongue_" .. i) >= 1
		end
	}
end

AchievementTemplates.achievements.scorpion_crater_detour = {
	ID_XB1 = 77,
	name = "achv_scorpion_crater_detour_name",
	ID_PS4 = "076",
	required_dlc = "scorpion",
	icon = "achievement_trophy_scorpion_crater_detour",
	display_completion_ui = true,
	desc = "achv_scorpion_crater_detour_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "scorpion_crater_detour") > 0
	end
}
AchievementTemplates.achievements.scorpion_crater_ambush = {
	required_dlc = "scorpion",
	name = "achv_scorpion_crater_ambush_name",
	display_completion_ui = true,
	icon = "achievement_trophy_scorpion_crater_ambush",
	desc = function ()
		return string.format(Localize("achv_scorpion_crater_ambush_desc"), QuestSettings.nurgle_bathed_all_cata)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "scorpion_crater_ambush") > 0
	end
}

return
