local quest_templates = {}
local stat_names_by_quest_key = {
	daily_quest_1 = {
		"daily_quest_1_stat_1",
		"daily_quest_1_stat_2",
		"daily_quest_1_stat_3"
	},
	daily_quest_2 = {
		"daily_quest_2_stat_1",
		"daily_quest_2_stat_2",
		"daily_quest_2_stat_3"
	},
	daily_quest_3 = {
		"daily_quest_3_stat_1",
		"daily_quest_3_stat_2",
		"daily_quest_3_stat_3"
	}
}
quest_templates.quests = {}
local daily_complete_quickplay_missions_mappings = {
	{
		played_levels_quickplay = {}
	}
}

for i = 1, #MainGameLevels, 1 do
	local level_key = MainGameLevels[i]
	local complete_quickplay_missions_mapping = daily_complete_quickplay_missions_mappings[1].played_levels_quickplay
	complete_quickplay_missions_mapping[level_key] = true
end

quest_templates.quests.daily_complete_quickplay_missions = {
	reward = "level_chest",
	name = "quest_daily_complete_quickplay_missions_name",
	icon = "achievement_trophy_14",
	desc = function ()
		return string.format(Localize("quest_daily_complete_quickplay_missions_desc"), QuestSettings.daily_complete_quickplay_missions)
	end,
	stat_mappings = daily_complete_quickplay_missions_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = stat_names_by_quest_key[quest_key][1]

		return QuestSettings.daily_complete_quickplay_missions <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = stat_names_by_quest_key[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_complete_quickplay_missions
		}
	end
}
local daily_collect_tomes_mappings = {
	{
		collected_tomes = {}
	}
}

for i = 1, #MainGameLevels, 1 do
	local level_key = MainGameLevels[i]
	local collect_tomes_mapping = daily_collect_tomes_mappings[1].collected_tomes
	collect_tomes_mapping[level_key] = true
end

quest_templates.quests.daily_collect_tomes = {
	reward = "level_chest",
	name = "quest_daily_collect_tomes_name",
	icon = "achievement_trophy_14",
	desc = function ()
		return string.format(Localize("quest_daily_collect_tomes_desc"), QuestSettings.daily_collect_tomes)
	end,
	stat_mappings = daily_collect_tomes_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = stat_names_by_quest_key[quest_key][1]

		return QuestSettings.daily_collect_tomes <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = stat_names_by_quest_key[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_collect_tomes
		}
	end
}
local daily_collect_grimoires_mappings = {
	{
		collected_grimoires = {}
	}
}

for i = 1, #MainGameLevels, 1 do
	local level_key = MainGameLevels[i]
	local collect_grimoires_mapping = daily_collect_grimoires_mappings[1].collected_grimoires
	collect_grimoires_mapping[level_key] = true
end

quest_templates.quests.daily_collect_grimoires = {
	reward = "level_chest",
	name = "quest_daily_collect_grimoires_name",
	icon = "achievement_trophy_14",
	desc = function ()
		return string.format(Localize("quest_daily_collect_grimoires_desc"), QuestSettings.daily_collect_grimoires)
	end,
	stat_mappings = daily_collect_grimoires_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = stat_names_by_quest_key[quest_key][1]

		return QuestSettings.daily_collect_grimoires <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = stat_names_by_quest_key[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_collect_grimoires
		}
	end
}
local daily_kill_bosses_mappings = {
	{
		kills_per_breed = {
			chaos_troll = true,
			skaven_rat_ogre = true,
			chaos_spawn = true,
			skaven_stormfiend = true
		}
	}
}
quest_templates.quests.daily_kill_bosses = {
	reward = "level_chest",
	name = "quest_daily_kill_bosses_name",
	icon = "achievement_trophy_14",
	desc = function ()
		return string.format(Localize("quest_daily_kill_bosses_desc"), QuestSettings.daily_kill_bosses)
	end,
	stat_mappings = daily_kill_bosses_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = stat_names_by_quest_key[quest_key][1]

		return QuestSettings.daily_kill_bosses <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = stat_names_by_quest_key[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_kill_bosses
		}
	end
}
local daily_kill_elites_mappings = {
	{
		kills_per_breed = {}
	}
}

for breed_name, _ in pairs(ELITES) do
	local kill_elites_mapping = daily_kill_elites_mappings[1].kills_per_breed
	kill_elites_mapping[breed_name] = true
end

quest_templates.quests.daily_kill_elites = {
	reward = "level_chest",
	name = "quest_daily_kill_elites_name",
	icon = "achievement_trophy_14",
	desc = function ()
		return string.format(Localize("quest_daily_kill_elites_desc"), QuestSettings.daily_kill_elites)
	end,
	stat_mappings = daily_kill_elites_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = stat_names_by_quest_key[quest_key][1]

		return QuestSettings.daily_kill_elites <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = stat_names_by_quest_key[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_kill_elites
		}
	end
}
local daily_complete_levels_hero_wood_elf_mappings = {
	{
		completed_levels_wood_elf = {}
	}
}

for i = 1, #MainGameLevels, 1 do
	local level_key = MainGameLevels[i]
	local complete_levels_hero_wood_elf_mapping = daily_complete_levels_hero_wood_elf_mappings[1].completed_levels_wood_elf
	complete_levels_hero_wood_elf_mapping[level_key] = true
end

quest_templates.quests.daily_complete_levels_hero_wood_elf = {
	reward = "level_chest",
	name = "quest_daily_complete_levels_hero_wood_elf_name",
	icon = "achievement_trophy_14",
	desc = function ()
		return string.format(Localize("quest_daily_complete_levels_hero_wood_elf_desc"), QuestSettings.daily_complete_levels_hero_wood_elf)
	end,
	stat_mappings = daily_complete_levels_hero_wood_elf_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = stat_names_by_quest_key[quest_key][1]

		return QuestSettings.daily_complete_levels_hero_wood_elf <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = stat_names_by_quest_key[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_complete_levels_hero_wood_elf
		}
	end
}
local daily_complete_levels_hero_witch_hunter_mappings = {
	{
		completed_levels_witch_hunter = {}
	}
}

for i = 1, #MainGameLevels, 1 do
	local level_key = MainGameLevels[i]
	local complete_levels_hero_witch_hunter_mapping = daily_complete_levels_hero_witch_hunter_mappings[1].completed_levels_witch_hunter
	complete_levels_hero_witch_hunter_mapping[level_key] = true
end

quest_templates.quests.daily_complete_levels_hero_witch_hunter = {
	reward = "level_chest",
	name = "quest_daily_complete_levels_hero_witch_hunter_name",
	icon = "achievement_trophy_14",
	desc = function ()
		return string.format(Localize("quest_daily_complete_levels_hero_witch_hunter_desc"), QuestSettings.daily_complete_levels_hero_witch_hunter)
	end,
	stat_mappings = daily_complete_levels_hero_witch_hunter_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = stat_names_by_quest_key[quest_key][1]

		return QuestSettings.daily_complete_levels_hero_witch_hunter <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = stat_names_by_quest_key[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_complete_levels_hero_witch_hunter
		}
	end
}
local daily_complete_levels_hero_dwarf_ranger_mappings = {
	{
		completed_levels_dwarf_ranger = {}
	}
}

for i = 1, #MainGameLevels, 1 do
	local level_key = MainGameLevels[i]
	local complete_levels_hero_dwarf_ranger_mapping = daily_complete_levels_hero_dwarf_ranger_mappings[1].completed_levels_dwarf_ranger
	complete_levels_hero_dwarf_ranger_mapping[level_key] = true
end

quest_templates.quests.daily_complete_levels_hero_dwarf_ranger = {
	reward = "level_chest",
	name = "quest_daily_complete_levels_hero_dwarf_ranger_name",
	icon = "achievement_trophy_14",
	desc = function ()
		return string.format(Localize("quest_daily_complete_levels_hero_dwarf_ranger_desc"), QuestSettings.daily_complete_levels_hero_dwarf_ranger)
	end,
	stat_mappings = daily_complete_levels_hero_dwarf_ranger_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = stat_names_by_quest_key[quest_key][1]

		return QuestSettings.daily_complete_levels_hero_dwarf_ranger <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = stat_names_by_quest_key[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_complete_levels_hero_dwarf_ranger
		}
	end
}
local daily_complete_levels_hero_bright_wizard_mappings = {
	{
		completed_levels_bright_wizard = {}
	}
}

for i = 1, #MainGameLevels, 1 do
	local level_key = MainGameLevels[i]
	local complete_levels_hero_bright_wizard_mapping = daily_complete_levels_hero_bright_wizard_mappings[1].completed_levels_bright_wizard
	complete_levels_hero_bright_wizard_mapping[level_key] = true
end

quest_templates.quests.daily_complete_levels_hero_bright_wizard = {
	reward = "level_chest",
	name = "quest_daily_complete_levels_hero_bright_wizard_name",
	icon = "achievement_trophy_14",
	desc = function ()
		return string.format(Localize("quest_daily_complete_levels_hero_bright_wizard_desc"), QuestSettings.daily_complete_levels_hero_bright_wizard)
	end,
	stat_mappings = daily_complete_levels_hero_bright_wizard_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = stat_names_by_quest_key[quest_key][1]

		return QuestSettings.daily_complete_levels_hero_bright_wizard <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = stat_names_by_quest_key[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_complete_levels_hero_bright_wizard
		}
	end
}
local daily_complete_levels_hero_empire_soldier_mappings = {
	{
		completed_levels_empire_soldier = {}
	}
}

for i = 1, #MainGameLevels, 1 do
	local level_key = MainGameLevels[i]
	local complete_levels_hero_empire_soldier_mapping = daily_complete_levels_hero_empire_soldier_mappings[1].completed_levels_empire_soldier
	complete_levels_hero_empire_soldier_mapping[level_key] = true
end

quest_templates.quests.daily_complete_levels_hero_empire_soldier = {
	reward = "level_chest",
	name = "quest_daily_complete_levels_hero_empire_soldier_name",
	icon = "achievement_trophy_14",
	desc = function ()
		return string.format(Localize("quest_daily_complete_levels_hero_empire_soldier_desc"), QuestSettings.daily_complete_levels_hero_empire_soldier)
	end,
	stat_mappings = daily_complete_levels_hero_empire_soldier_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = stat_names_by_quest_key[quest_key][1]

		return QuestSettings.daily_complete_levels_hero_empire_soldier <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = stat_names_by_quest_key[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_complete_levels_hero_empire_soldier
		}
	end
}

return quest_templates
