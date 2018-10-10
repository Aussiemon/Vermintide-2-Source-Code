local quest_templates = {
	quests = {}
}
local daily_complete_quickplay_missions_mappings = {
	{
		played_levels_quickplay = {}
	}
}

for i = 1, #UnlockableLevels, 1 do
	local level_key = UnlockableLevels[i]
	local complete_quickplay_missions_mapping = daily_complete_quickplay_missions_mappings[1].played_levels_quickplay
	complete_quickplay_missions_mapping[level_key] = true
end

quest_templates.quests.daily_complete_quickplay_missions = {
	reward = "loot_chest_03_06",
	name = "quest_daily_complete_quickplay_missions_name",
	icon = "quest_book_skull",
	desc = function ()
		return string.format(Localize("quest_daily_complete_quickplay_missions_desc"), QuestSettings.daily_complete_quickplay_missions)
	end,
	stat_mappings = daily_complete_quickplay_missions_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return QuestSettings.daily_complete_quickplay_missions <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_complete_quickplay_missions
		}
	end
}
local daily_collect_tomes_mappings = {
	{
		total_collected_tomes = true
	}
}
quest_templates.quests.daily_collect_tomes = {
	reward = "loot_chest_03_06",
	name = "quest_daily_collect_tomes_name",
	icon = "quest_book_tome",
	desc = function ()
		return string.format(Localize("quest_daily_collect_tomes_desc"), QuestSettings.daily_collect_tomes)
	end,
	stat_mappings = daily_collect_tomes_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return QuestSettings.daily_collect_tomes <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_collect_tomes
		}
	end
}
local daily_collect_grimoires_mappings = {
	{
		total_collected_grimoires = true
	}
}
quest_templates.quests.daily_collect_grimoires = {
	reward = "loot_chest_03_06",
	name = "quest_daily_collect_grimoires_name",
	icon = "quest_book_grimoire",
	desc = function ()
		return string.format(Localize("quest_daily_collect_grimoires_desc"), QuestSettings.daily_collect_grimoires)
	end,
	stat_mappings = daily_collect_grimoires_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return QuestSettings.daily_collect_grimoires <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
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
		},
		kill_assists_per_breed = {
			chaos_troll = true,
			skaven_rat_ogre = true,
			chaos_spawn = true,
			skaven_stormfiend = true
		}
	}
}
quest_templates.quests.daily_kill_bosses = {
	reward = "loot_chest_03_06",
	name = "quest_daily_kill_bosses_name",
	icon = "quest_book_skull",
	desc = function ()
		return string.format(Localize("quest_daily_kill_bosses_desc"), QuestSettings.daily_kill_bosses)
	end,
	stat_mappings = daily_kill_bosses_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return QuestSettings.daily_kill_bosses <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_kill_bosses
		}
	end
}
local daily_kill_elites_mappings = {
	{
		kills_per_breed = {},
		kill_assists_per_breed = {}
	}
}

for breed_name, _ in pairs(ELITES) do
	local kill_elites_mapping = daily_kill_elites_mappings[1].kills_per_breed
	local assist_kill_elites_mapping = daily_kill_elites_mappings[1].kill_assists_per_breed
	kill_elites_mapping[breed_name] = true
	assist_kill_elites_mapping[breed_name] = true
end

quest_templates.quests.daily_kill_elites = {
	reward = "loot_chest_03_06",
	name = "quest_daily_kill_elites_name",
	icon = "quest_book_skull",
	desc = function ()
		return string.format(Localize("quest_daily_kill_elites_desc"), QuestSettings.daily_kill_elites)
	end,
	stat_mappings = daily_kill_elites_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return QuestSettings.daily_kill_elites <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
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

for i = 1, #UnlockableLevels, 1 do
	local level_key = UnlockableLevels[i]
	local complete_levels_hero_wood_elf_mapping = daily_complete_levels_hero_wood_elf_mappings[1].completed_levels_wood_elf
	complete_levels_hero_wood_elf_mapping[level_key] = true
end

quest_templates.quests.daily_complete_levels_hero_wood_elf = {
	reward = "loot_chest_03_06",
	name = "quest_daily_complete_levels_hero_wood_elf_name",
	icon = "quest_book_kerillian",
	desc = function ()
		return string.format(Localize("quest_daily_complete_levels_hero_wood_elf_desc"), QuestSettings.daily_complete_levels_hero_wood_elf)
	end,
	stat_mappings = daily_complete_levels_hero_wood_elf_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return QuestSettings.daily_complete_levels_hero_wood_elf <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
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

for i = 1, #UnlockableLevels, 1 do
	local level_key = UnlockableLevels[i]
	local complete_levels_hero_witch_hunter_mapping = daily_complete_levels_hero_witch_hunter_mappings[1].completed_levels_witch_hunter
	complete_levels_hero_witch_hunter_mapping[level_key] = true
end

quest_templates.quests.daily_complete_levels_hero_witch_hunter = {
	reward = "loot_chest_03_06",
	name = "quest_daily_complete_levels_hero_witch_hunter_name",
	icon = "quest_book_saltzpyre",
	desc = function ()
		return string.format(Localize("quest_daily_complete_levels_hero_witch_hunter_desc"), QuestSettings.daily_complete_levels_hero_witch_hunter)
	end,
	stat_mappings = daily_complete_levels_hero_witch_hunter_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return QuestSettings.daily_complete_levels_hero_witch_hunter <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
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

for i = 1, #UnlockableLevels, 1 do
	local level_key = UnlockableLevels[i]
	local complete_levels_hero_dwarf_ranger_mapping = daily_complete_levels_hero_dwarf_ranger_mappings[1].completed_levels_dwarf_ranger
	complete_levels_hero_dwarf_ranger_mapping[level_key] = true
end

quest_templates.quests.daily_complete_levels_hero_dwarf_ranger = {
	reward = "loot_chest_03_06",
	name = "quest_daily_complete_levels_hero_dwarf_ranger_name",
	icon = "quest_book_bardin",
	desc = function ()
		return string.format(Localize("quest_daily_complete_levels_hero_dwarf_ranger_desc"), QuestSettings.daily_complete_levels_hero_dwarf_ranger)
	end,
	stat_mappings = daily_complete_levels_hero_dwarf_ranger_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return QuestSettings.daily_complete_levels_hero_dwarf_ranger <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
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

for i = 1, #UnlockableLevels, 1 do
	local level_key = UnlockableLevels[i]
	local complete_levels_hero_bright_wizard_mapping = daily_complete_levels_hero_bright_wizard_mappings[1].completed_levels_bright_wizard
	complete_levels_hero_bright_wizard_mapping[level_key] = true
end

quest_templates.quests.daily_complete_levels_hero_bright_wizard = {
	reward = "loot_chest_03_06",
	name = "quest_daily_complete_levels_hero_bright_wizard_name",
	icon = "quest_book_sienna",
	desc = function ()
		return string.format(Localize("quest_daily_complete_levels_hero_bright_wizard_desc"), QuestSettings.daily_complete_levels_hero_bright_wizard)
	end,
	stat_mappings = daily_complete_levels_hero_bright_wizard_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return QuestSettings.daily_complete_levels_hero_bright_wizard <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
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

for i = 1, #UnlockableLevels, 1 do
	local level_key = UnlockableLevels[i]
	local complete_levels_hero_empire_soldier_mapping = daily_complete_levels_hero_empire_soldier_mappings[1].completed_levels_empire_soldier
	complete_levels_hero_empire_soldier_mapping[level_key] = true
end

quest_templates.quests.daily_complete_levels_hero_empire_soldier = {
	reward = "loot_chest_03_06",
	name = "quest_daily_complete_levels_hero_empire_soldier_name",
	icon = "quest_book_kruber",
	desc = function ()
		return string.format(Localize("quest_daily_complete_levels_hero_empire_soldier_desc"), QuestSettings.daily_complete_levels_hero_empire_soldier)
	end,
	stat_mappings = daily_complete_levels_hero_empire_soldier_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return QuestSettings.daily_complete_levels_hero_empire_soldier <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_complete_levels_hero_empire_soldier
		}
	end
}
local event_quickplay_mappings = {
	{
		played_levels_quickplay = {}
	}
}

for i = 1, #UnlockableLevels, 1 do
	local level_key = UnlockableLevels[i]
	local complete_quickplay_missions_mapping = event_quickplay_mappings[1].played_levels_quickplay
	complete_quickplay_missions_mapping[level_key] = true
end

quest_templates.quests.event_skulls_for_the_skull_throne = {
	reward = "frame_skulls",
	name = "quest_event_skull_2018_name",
	icon = "quest_book_event_skull",
	summary_icon = "achievement_symbol_book_event_skull",
	desc = function ()
		return string.format(Localize("quest_event_skull_2018_desc"), QuestSettings.event_skulls_for_the_skull_throne)
	end,
	stat_mappings = event_quickplay_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return QuestSettings.event_skulls_for_the_skull_throne <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.event_skulls_for_the_skull_throne
		}
	end
}
quest_templates.quests.event_sonnstill_quickplay_2018 = {
	reward = "frame_summer",
	name = "quest_event_summer_2018_quickplay_name",
	icon = "quest_book_event_summer",
	desc = function ()
		return string.format(Localize("quest_event_summer_2018_quickplay_desc"), QuestSettings.event_sonnstill_quickplay_levels)
	end,
	stat_mappings = event_quickplay_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return QuestSettings.event_sonnstill_quickplay_levels <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.event_sonnstill_quickplay_levels
		}
	end
}
local event_sonnstill_played_champion_mappings_2018 = {
	{
		played_difficulty = {
			harder = true,
			hardest = true
		}
	}
}
quest_templates.quests.event_sonnstill_played_champion_2018 = {
	reward = "loot_chest_03_06",
	name = "quest_event_summer_2018_champion_name",
	icon = "quest_book_event_summer",
	desc = function ()
		return string.format(Localize("quest_event_summer_2018_champion_desc"), QuestSettings.event_sonnstill_difficulty_levels)
	end,
	stat_mappings = event_sonnstill_played_champion_mappings_2018,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return QuestSettings.event_sonnstill_difficulty_levels <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.event_sonnstill_quickplay_levels
		}
	end
}
local event_sonnstill_played_legend_mappings_2018 = {
	{
		played_difficulty = {
			hardest = true
		}
	}
}
quest_templates.quests.event_sonnstill_played_legend_2018 = {
	reward = "loot_chest_04_06",
	name = "quest_event_summer_2018_legend_name",
	icon = "quest_book_event_summer",
	desc = function ()
		return string.format(Localize("quest_event_summer_2018_legend_desc"), QuestSettings.event_sonnstill_difficulty_levels)
	end,
	stat_mappings = event_sonnstill_played_legend_mappings_2018,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return QuestSettings.event_sonnstill_difficulty_levels <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.event_sonnstill_quickplay_levels
		}
	end
}
local weekly_complete_quickplay_missions_mappings = {
	{
		played_levels_quickplay = {}
	}
}

for i = 1, #UnlockableLevels, 1 do
	local level_key = UnlockableLevels[i]
	local complete_quickplay_missions_mapping = weekly_complete_quickplay_missions_mappings[1].played_levels_quickplay
	complete_quickplay_missions_mapping[level_key] = true
end

quest_templates.quests.weekly_complete_quickplay_missions = {
	reward = "bogenhafen_chest",
	name = "quest_daily_complete_quickplay_missions_name",
	icon = "quest_book_skull",
	required_dlc = "bogenhafen",
	desc = function ()
		return string.format(Localize("quest_daily_complete_quickplay_missions_desc"), QuestSettings.weekly_complete_quickplay_missions)
	end,
	stat_mappings = weekly_complete_quickplay_missions_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return QuestSettings.weekly_complete_quickplay_missions <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.weekly_complete_quickplay_missions
		}
	end
}

for i = 1, 3, 1 do
	local id = "weekly_complete_quickplay_missions" .. "_" .. i
	quest_templates.quests[id] = {
		name = "quest_daily_complete_quickplay_missions_name",
		icon = "quest_book_skull",
		desc = function ()
			return string.format(Localize("quest_daily_complete_quickplay_missions_desc"), QuestSettings.weekly_complete_quickplay_missions[i])
		end,
		stat_mappings = weekly_complete_quickplay_missions_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return QuestSettings.weekly_complete_quickplay_missions[i] <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_complete_quickplay_missions[i]
			}
		end
	}
end

local weekly_collect_tomes_mappings = {
	{
		total_collected_tomes = true
	}
}

for i = 1, 3, 1 do
	local id = "weekly_collect_tomes" .. "_" .. i
	quest_templates.quests[id] = {
		name = "quest_daily_collect_tomes_name",
		icon = "quest_book_tome",
		desc = function ()
			return string.format(Localize("quest_daily_collect_tomes_desc"), QuestSettings.weekly_collect_tomes[i])
		end,
		stat_mappings = weekly_collect_tomes_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return QuestSettings.weekly_collect_tomes[i] <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_collect_tomes[i]
			}
		end
	}
end

local weekly_collect_grimoires_mappings = {
	{
		total_collected_grimoires = true
	}
}

for i = 1, 3, 1 do
	local id = "weekly_collect_grimoires" .. "_" .. i
	quest_templates.quests[id] = {
		name = "quest_daily_collect_grimoires_name",
		icon = "quest_book_grimoire",
		desc = function ()
			return string.format(Localize("quest_daily_collect_grimoires_desc"), QuestSettings.weekly_collect_grimoires[i])
		end,
		stat_mappings = weekly_collect_grimoires_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return QuestSettings.weekly_collect_grimoires[i] <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_collect_grimoires[i]
			}
		end
	}
end

local weekly_kill_bosses_mappings = {
	{
		kills_per_breed = {
			chaos_troll = true,
			skaven_rat_ogre = true,
			chaos_spawn = true,
			skaven_stormfiend = true
		},
		kill_assists_per_breed = {
			chaos_troll = true,
			skaven_rat_ogre = true,
			chaos_spawn = true,
			skaven_stormfiend = true
		}
	}
}

for i = 1, 3, 1 do
	local id = "weekly_kill_bosses" .. "_" .. i
	quest_templates.quests[id] = {
		name = "quest_daily_kill_bosses_name",
		icon = "quest_book_skull",
		desc = function ()
			return string.format(Localize("quest_daily_kill_bosses_desc"), QuestSettings.weekly_kill_bosses[i])
		end,
		stat_mappings = weekly_kill_bosses_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return QuestSettings.weekly_kill_bosses[i] <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_kill_bosses[i]
			}
		end
	}
end

local weekly_kill_elites_mappings = {
	{
		kills_per_breed = {},
		kill_assists_per_breed = {}
	}
}

for breed_name, _ in pairs(ELITES) do
	local kill_elites_mapping = weekly_kill_elites_mappings[1].kills_per_breed
	local assist_kill_elites_mapping = weekly_kill_elites_mappings[1].kill_assists_per_breed
	kill_elites_mapping[breed_name] = true
	assist_kill_elites_mapping[breed_name] = true
end

for i = 1, 3, 1 do
	local id = "weekly_kill_elites" .. "_" .. i
	quest_templates.quests[id] = {
		name = "quest_daily_kill_elites_name",
		icon = "quest_book_skull",
		desc = function ()
			return string.format(Localize("quest_daily_kill_elites_desc"), QuestSettings.weekly_kill_elites[i])
		end,
		stat_mappings = weekly_kill_elites_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return QuestSettings.weekly_kill_elites[i] <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_kill_elites[i]
			}
		end
	}
end

local weekly_complete_levels_hero_wood_elf_mappings = {
	{
		completed_levels_wood_elf = {}
	}
}

for i = 1, #UnlockableLevels, 1 do
	local level_key = UnlockableLevels[i]
	local complete_levels_hero_wood_elf_mapping = weekly_complete_levels_hero_wood_elf_mappings[1].completed_levels_wood_elf
	complete_levels_hero_wood_elf_mapping[level_key] = true
end

for i = 1, 3, 1 do
	local id = "weekly_complete_levels_hero_wood_elf" .. "_" .. i
	quest_templates.quests[id] = {
		name = "quest_daily_complete_levels_hero_wood_elf_name",
		icon = "quest_book_kerillian",
		desc = function ()
			return string.format(Localize("quest_daily_complete_levels_hero_wood_elf_desc"), QuestSettings.weekly_complete_levels_hero_wood_elf[i])
		end,
		stat_mappings = weekly_complete_levels_hero_wood_elf_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return QuestSettings.weekly_complete_levels_hero_wood_elf[i] <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_complete_levels_hero_wood_elf[i]
			}
		end
	}
end

local weekly_complete_levels_hero_witch_hunter_mappings = {
	{
		completed_levels_witch_hunter = {}
	}
}

for i = 1, #UnlockableLevels, 1 do
	local level_key = UnlockableLevels[i]
	local complete_levels_hero_witch_hunter_mapping = weekly_complete_levels_hero_witch_hunter_mappings[1].completed_levels_witch_hunter
	complete_levels_hero_witch_hunter_mapping[level_key] = true
end

for i = 1, 3, 1 do
	local id = "weekly_complete_levels_hero_witch_hunter" .. "_" .. i
	quest_templates.quests[id] = {
		name = "quest_daily_complete_levels_hero_witch_hunter_name",
		icon = "quest_book_saltzpyre",
		desc = function ()
			return string.format(Localize("quest_daily_complete_levels_hero_witch_hunter_desc"), QuestSettings.weekly_complete_levels_hero_witch_hunter[i])
		end,
		stat_mappings = weekly_complete_levels_hero_witch_hunter_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return QuestSettings.weekly_complete_levels_hero_witch_hunter[i] <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_complete_levels_hero_witch_hunter[i]
			}
		end
	}
end

local weekly_complete_levels_hero_dwarf_ranger_mappings = {
	{
		completed_levels_dwarf_ranger = {}
	}
}

for i = 1, #UnlockableLevels, 1 do
	local level_key = UnlockableLevels[i]
	local complete_levels_hero_dwarf_ranger_mapping = weekly_complete_levels_hero_dwarf_ranger_mappings[1].completed_levels_dwarf_ranger
	complete_levels_hero_dwarf_ranger_mapping[level_key] = true
end

for i = 1, 3, 1 do
	local id = "weekly_complete_levels_hero_dwarf_ranger" .. "_" .. i
	quest_templates.quests[id] = {
		name = "quest_daily_complete_levels_hero_dwarf_ranger_name",
		icon = "quest_book_bardin",
		desc = function ()
			return string.format(Localize("quest_daily_complete_levels_hero_dwarf_ranger_desc"), QuestSettings.weekly_complete_levels_hero_dwarf_ranger[i])
		end,
		stat_mappings = weekly_complete_levels_hero_dwarf_ranger_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return QuestSettings.weekly_complete_levels_hero_dwarf_ranger[i] <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_complete_levels_hero_dwarf_ranger[i]
			}
		end
	}
end

local weekly_complete_levels_hero_bright_wizard_mappings = {
	{
		completed_levels_bright_wizard = {}
	}
}

for i = 1, #UnlockableLevels, 1 do
	local level_key = UnlockableLevels[i]
	local complete_levels_hero_bright_wizard_mapping = weekly_complete_levels_hero_bright_wizard_mappings[1].completed_levels_bright_wizard
	complete_levels_hero_bright_wizard_mapping[level_key] = true
end

for i = 1, 3, 1 do
	local id = "weekly_complete_levels_hero_bright_wizard" .. "_" .. i
	quest_templates.quests[id] = {
		name = "quest_daily_complete_levels_hero_bright_wizard_name",
		icon = "quest_book_sienna",
		desc = function ()
			return string.format(Localize("quest_daily_complete_levels_hero_bright_wizard_desc"), QuestSettings.weekly_complete_levels_hero_bright_wizard[i])
		end,
		stat_mappings = weekly_complete_levels_hero_bright_wizard_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return QuestSettings.weekly_complete_levels_hero_bright_wizard[i] <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_complete_levels_hero_bright_wizard[i]
			}
		end
	}
end

local weekly_complete_levels_hero_empire_soldier_mappings = {
	{
		completed_levels_empire_soldier = {}
	}
}

for i = 1, #UnlockableLevels, 1 do
	local level_key = UnlockableLevels[i]
	local complete_levels_hero_empire_soldier_mapping = weekly_complete_levels_hero_empire_soldier_mappings[1].completed_levels_empire_soldier
	complete_levels_hero_empire_soldier_mapping[level_key] = true
end

for i = 1, 3, 1 do
	local id = "weekly_complete_levels_hero_empire_soldier" .. "_" .. i
	quest_templates.quests[id] = {
		name = "quest_daily_complete_levels_hero_empire_soldier_name",
		icon = "quest_book_kruber",
		desc = function ()
			return string.format(Localize("quest_daily_complete_levels_hero_empire_soldier_desc"), QuestSettings.weekly_complete_levels_hero_empire_soldier[i])
		end,
		stat_mappings = weekly_complete_levels_hero_empire_soldier_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return QuestSettings.weekly_complete_levels_hero_empire_soldier[i] <= statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_complete_levels_hero_empire_soldier[i]
			}
		end
	}
end

return quest_templates
