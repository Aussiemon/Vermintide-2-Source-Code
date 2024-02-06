-- chunkname: @scripts/managers/quest/quest_templates.lua

local quest_templates = {}

quest_templates.quests = {}

local daily_complete_quickplay_missions_mappings = {
	{
		played_levels_quickplay = {},
	},
}

for i = 1, #UnlockableLevels do
	local level_key = UnlockableLevels[i]
	local complete_quickplay_missions_mapping = daily_complete_quickplay_missions_mappings[1].played_levels_quickplay

	complete_quickplay_missions_mapping[level_key] = true
end

quest_templates.quests.daily_complete_quickplay_missions = {
	icon = "quest_book_skull",
	name = "quest_daily_complete_quickplay_missions_name",
	desc = function ()
		return string.format(Localize("quest_daily_complete_quickplay_missions_desc"), QuestSettings.daily_complete_quickplay_missions)
	end,
	stat_mappings = daily_complete_quickplay_missions_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.daily_complete_quickplay_missions
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_complete_quickplay_missions,
		}
	end,
}

local daily_collect_tomes_mappings = {
	{
		total_collected_tomes = true,
	},
}

quest_templates.quests.daily_collect_tomes = {
	icon = "quest_book_tome",
	name = "quest_daily_collect_tomes_name",
	desc = function ()
		return string.format(Localize("quest_daily_collect_tomes_desc"), QuestSettings.daily_collect_tomes)
	end,
	stat_mappings = daily_collect_tomes_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.daily_collect_tomes
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_collect_tomes,
		}
	end,
}

local daily_collect_grimoires_mappings = {
	{
		total_collected_grimoires = true,
	},
}

quest_templates.quests.daily_collect_grimoires = {
	icon = "quest_book_grimoire",
	name = "quest_daily_collect_grimoires_name",
	desc = function ()
		return string.format(Localize("quest_daily_collect_grimoires_desc"), QuestSettings.daily_collect_grimoires)
	end,
	stat_mappings = daily_collect_grimoires_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.daily_collect_grimoires
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_collect_grimoires,
		}
	end,
}

local daily_collect_loot_die_mappings = {
	{
		total_collected_dice = true,
	},
}

quest_templates.quests.daily_collect_loot_die = {
	icon = "quest_book_generic_pickup",
	name = "quest_daily_collect_loot_die_name",
	desc = function ()
		return string.format(Localize("quest_daily_collect_loot_die_desc"), QuestSettings.daily_collect_loot_die)
	end,
	stat_mappings = daily_collect_loot_die_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.daily_collect_loot_die
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_collect_loot_die,
		}
	end,
}

local daily_collect_painting_scrap_mappings = {
	{
		collected_painting_scraps_unlimited = true,
	},
}

quest_templates.quests.daily_collect_painting_scrap = {
	icon = "quest_book_generic_pickup",
	name = "quest_daily_collect_painting_scrap_name",
	desc = function ()
		return string.format(Localize("quest_daily_collect_painting_scrap_desc"), QuestSettings.daily_collect_painting_scrap)
	end,
	stat_mappings = daily_collect_painting_scrap_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.daily_collect_painting_scrap
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_collect_painting_scrap,
		}
	end,
}

local daily_kill_bosses_mappings = {
	{
		kills_per_breed = {
			beastmen_minotaur = true,
			chaos_spawn = true,
			chaos_troll = true,
			skaven_rat_ogre = true,
			skaven_stormfiend = true,
		},
		kill_assists_per_breed = {
			beastmen_minotaur = true,
			chaos_spawn = true,
			chaos_troll = true,
			skaven_rat_ogre = true,
			skaven_stormfiend = true,
		},
	},
}

quest_templates.quests.daily_kill_bosses = {
	icon = "quest_book_skull",
	name = "quest_daily_kill_bosses_name",
	desc = function ()
		return string.format(Localize("quest_daily_kill_bosses_desc"), QuestSettings.daily_kill_bosses)
	end,
	stat_mappings = daily_kill_bosses_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.daily_kill_bosses
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_kill_bosses,
		}
	end,
}

local daily_kill_elites_mappings = {
	{
		kills_per_breed = {},
		kill_assists_per_breed = {},
	},
}

for breed_name, _ in pairs(ELITES) do
	local kill_elites_mapping = daily_kill_elites_mappings[1].kills_per_breed
	local assist_kill_elites_mapping = daily_kill_elites_mappings[1].kill_assists_per_breed

	kill_elites_mapping[breed_name] = true
	assist_kill_elites_mapping[breed_name] = true
end

quest_templates.quests.daily_kill_elites = {
	icon = "quest_book_skull",
	name = "quest_daily_kill_elites_name",
	desc = function ()
		return string.format(Localize("quest_daily_kill_elites_desc"), QuestSettings.daily_kill_elites)
	end,
	stat_mappings = daily_kill_elites_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.daily_kill_elites
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_kill_elites,
		}
	end,
}

local daily_kill_critter_mappings = {
	{
		kills_critter_total = true,
	},
}

quest_templates.quests.daily_kill_critters = {
	icon = "quest_book_skull",
	name = "quest_daily_kill_critters_name",
	desc = function ()
		return string.format(Localize("quest_daily_kill_critters_desc"), QuestSettings.daily_kill_critters)
	end,
	stat_mappings = daily_kill_critter_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.daily_kill_critters
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_kill_critters,
		}
	end,
}

local daily_complete_levels_hero_wood_elf_mappings = {
	{
		completed_levels_wood_elf = {},
	},
}

for i = 1, #UnlockableLevels do
	local level_key = UnlockableLevels[i]
	local complete_levels_hero_wood_elf_mapping = daily_complete_levels_hero_wood_elf_mappings[1].completed_levels_wood_elf

	complete_levels_hero_wood_elf_mapping[level_key] = true
end

quest_templates.quests.daily_complete_levels_hero_wood_elf = {
	icon = "quest_book_kerillian",
	name = "quest_daily_complete_levels_hero_wood_elf_name",
	desc = function ()
		return string.format(Localize("quest_daily_complete_levels_hero_wood_elf_desc"), QuestSettings.daily_complete_levels_hero_wood_elf)
	end,
	stat_mappings = daily_complete_levels_hero_wood_elf_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.daily_complete_levels_hero_wood_elf
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_complete_levels_hero_wood_elf,
		}
	end,
}

local daily_complete_levels_hero_witch_hunter_mappings = {
	{
		completed_levels_witch_hunter = {},
	},
}

for i = 1, #UnlockableLevels do
	local level_key = UnlockableLevels[i]
	local complete_levels_hero_witch_hunter_mapping = daily_complete_levels_hero_witch_hunter_mappings[1].completed_levels_witch_hunter

	complete_levels_hero_witch_hunter_mapping[level_key] = true
end

quest_templates.quests.daily_complete_levels_hero_witch_hunter = {
	icon = "quest_book_saltzpyre",
	name = "quest_daily_complete_levels_hero_witch_hunter_name",
	desc = function ()
		return string.format(Localize("quest_daily_complete_levels_hero_witch_hunter_desc"), QuestSettings.daily_complete_levels_hero_witch_hunter)
	end,
	stat_mappings = daily_complete_levels_hero_witch_hunter_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.daily_complete_levels_hero_witch_hunter
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_complete_levels_hero_witch_hunter,
		}
	end,
}

local daily_complete_levels_hero_dwarf_ranger_mappings = {
	{
		completed_levels_dwarf_ranger = {},
	},
}

for i = 1, #UnlockableLevels do
	local level_key = UnlockableLevels[i]
	local complete_levels_hero_dwarf_ranger_mapping = daily_complete_levels_hero_dwarf_ranger_mappings[1].completed_levels_dwarf_ranger

	complete_levels_hero_dwarf_ranger_mapping[level_key] = true
end

quest_templates.quests.daily_complete_levels_hero_dwarf_ranger = {
	icon = "quest_book_bardin",
	name = "quest_daily_complete_levels_hero_dwarf_ranger_name",
	desc = function ()
		return string.format(Localize("quest_daily_complete_levels_hero_dwarf_ranger_desc"), QuestSettings.daily_complete_levels_hero_dwarf_ranger)
	end,
	stat_mappings = daily_complete_levels_hero_dwarf_ranger_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.daily_complete_levels_hero_dwarf_ranger
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_complete_levels_hero_dwarf_ranger,
		}
	end,
}

local daily_complete_levels_hero_bright_wizard_mappings = {
	{
		completed_levels_bright_wizard = {},
	},
}

for i = 1, #UnlockableLevels do
	local level_key = UnlockableLevels[i]
	local complete_levels_hero_bright_wizard_mapping = daily_complete_levels_hero_bright_wizard_mappings[1].completed_levels_bright_wizard

	complete_levels_hero_bright_wizard_mapping[level_key] = true
end

quest_templates.quests.daily_complete_levels_hero_bright_wizard = {
	icon = "quest_book_sienna",
	name = "quest_daily_complete_levels_hero_bright_wizard_name",
	desc = function ()
		return string.format(Localize("quest_daily_complete_levels_hero_bright_wizard_desc"), QuestSettings.daily_complete_levels_hero_bright_wizard)
	end,
	stat_mappings = daily_complete_levels_hero_bright_wizard_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.daily_complete_levels_hero_bright_wizard
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_complete_levels_hero_bright_wizard,
		}
	end,
}

local daily_complete_levels_hero_empire_soldier_mappings = {
	{
		completed_levels_empire_soldier = {},
	},
}

for i = 1, #UnlockableLevels do
	local level_key = UnlockableLevels[i]
	local complete_levels_hero_empire_soldier_mapping = daily_complete_levels_hero_empire_soldier_mappings[1].completed_levels_empire_soldier

	complete_levels_hero_empire_soldier_mapping[level_key] = true
end

quest_templates.quests.daily_complete_levels_hero_empire_soldier = {
	icon = "quest_book_kruber",
	name = "quest_daily_complete_levels_hero_empire_soldier_name",
	desc = function ()
		return string.format(Localize("quest_daily_complete_levels_hero_empire_soldier_desc"), QuestSettings.daily_complete_levels_hero_empire_soldier)
	end,
	stat_mappings = daily_complete_levels_hero_empire_soldier_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.daily_complete_levels_hero_empire_soldier
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_complete_levels_hero_empire_soldier,
		}
	end,
}

local daily_score_headshots_mappings = {
	{
		headshots = true,
	},
}

quest_templates.quests.daily_score_headshots = {
	icon = "quest_book_skull",
	name = "quest_daily_score_headshots_name",
	desc = function ()
		return string.format(Localize("quest_daily_score_headshots_desc"), QuestSettings.daily_score_headshots)
	end,
	stat_mappings = daily_score_headshots_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.daily_score_headshots
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.daily_score_headshots,
		}
	end,
}

local event_quickplay_mappings = {
	{
		played_levels_quickplay = {},
	},
}
local event_weekly_mappings = {
	{
		played_levels_weekly_event = {},
	},
}

for i = 1, #UnlockableLevels do
	local level_key = UnlockableLevels[i]

	event_quickplay_mappings[1].played_levels_quickplay[level_key] = true
	event_weekly_mappings[1].played_levels_weekly_event[level_key] = true
end

quest_templates.quests.event_skulls_for_the_skull_throne = {
	icon = "quest_book_event_skull",
	name = "quest_event_skull_2018_name",
	summary_icon = "achievement_symbol_book_event_skull",
	desc = function ()
		return string.format(Localize("quest_event_skull_2018_desc"), QuestSettings.event_skulls_quickplay)
	end,
	stat_mappings = event_quickplay_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.event_skulls_quickplay
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.event_skulls_quickplay,
		}
	end,
}
quest_templates.quests.event_sonnstill_quickplay_2018 = {
	icon = "quest_book_event_summer",
	name = "quest_event_summer_2018_quickplay_name",
	desc = function ()
		return string.format(Localize("quest_event_summer_2018_quickplay_desc"), QuestSettings.event_sonnstill_quickplay_levels)
	end,
	stat_mappings = event_quickplay_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.event_sonnstill_quickplay_levels
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.event_sonnstill_quickplay_levels,
		}
	end,
}

local event_sonnstill_played_champion_mappings_2018 = {
	{
		played_difficulty = {
			harder = true,
			hardest = true,
		},
	},
}

quest_templates.quests.event_sonnstill_played_champion_2018 = {
	icon = "quest_book_event_summer",
	name = "quest_event_summer_2018_champion_name",
	desc = function ()
		return string.format(Localize("quest_event_summer_2018_champion_desc"), QuestSettings.event_sonnstill_difficulty_levels)
	end,
	stat_mappings = event_sonnstill_played_champion_mappings_2018,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.event_sonnstill_difficulty_levels
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.event_sonnstill_quickplay_levels,
		}
	end,
}

local event_sonnstill_played_legend_mappings_2018 = {
	{
		played_difficulty = {
			hardest = true,
		},
	},
}

quest_templates.quests.event_sonnstill_played_legend_2018 = {
	icon = "quest_book_event_summer",
	name = "quest_event_summer_2018_legend_name",
	desc = function ()
		return string.format(Localize("quest_event_summer_2018_legend_desc"), QuestSettings.event_sonnstill_difficulty_levels)
	end,
	stat_mappings = event_sonnstill_played_legend_mappings_2018,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.event_sonnstill_difficulty_levels
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.event_sonnstill_quickplay_levels,
		}
	end,
}
quest_templates.quests.event_geheimnisnacht_quickplay_2018 = {
	icon = "quest_book_geheimnisnacht",
	name = "quest_event_geheimnisnacht_2018_quickplay_name",
	desc = function ()
		return string.format(Localize("quest_event_summer_2018_quickplay_desc"), QuestSettings.event_geheimnisnacht_quickplay_levels)
	end,
	stat_mappings = event_quickplay_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.event_geheimnisnacht_quickplay_levels
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.event_geheimnisnacht_quickplay_levels,
		}
	end,
}
quest_templates.quests.event_geheimnisnacht_quickplay_2019 = {
	icon = "quest_book_geheimnisnacht",
	name = "quest_event_geheimnisnacht_2019_quickplay_name",
	desc = function ()
		return string.format(Localize("quest_event_summer_2018_quickplay_desc"), QuestSettings.event_geheimnisnacht_quickplay_levels)
	end,
	stat_mappings = event_quickplay_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.event_geheimnisnacht_quickplay_levels
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.event_geheimnisnacht_quickplay_levels,
		}
	end,
}
quest_templates.quests.event_geheimnisnacht_weekly_event_2019 = {
	desc = "complete_one_weekly_event",
	icon = "quest_book_geheimnisnacht",
	name = "quest_event_geheimnisnacht_weekly_event_2019_name",
	stat_mappings = event_weekly_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) > 0
	end,
}

local event_geheimnisnacht_played_champion_mappings_2018 = {
	{
		played_difficulty = {
			harder = true,
			hardest = true,
		},
	},
}

quest_templates.quests.event_geheimnisnacht_played_champion_2018 = {
	icon = "quest_book_geheimnisnacht",
	name = "quest_event_geheimnisnacht_2018_champion_name",
	desc = function ()
		return string.format(Localize("quest_event_summer_2018_champion_desc"), QuestSettings.event_geheimnisnacht_difficulty_levels)
	end,
	stat_mappings = event_geheimnisnacht_played_champion_mappings_2018,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.event_geheimnisnacht_difficulty_levels
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.event_geheimnisnacht_quickplay_levels,
		}
	end,
}

local event_geheimnisnacht_played_legend_mappings_2018 = {
	{
		played_difficulty = {
			hardest = true,
		},
	},
}

quest_templates.quests.event_geheimnisnacht_played_legend_2018 = {
	icon = "quest_book_geheimnisnacht",
	name = "quest_event_geheimnisnacht_2018_legend_name",
	desc = function ()
		return string.format(Localize("quest_event_summer_2018_legend_desc"), QuestSettings.event_geheimnisnacht_difficulty_levels)
	end,
	stat_mappings = event_geheimnisnacht_played_legend_mappings_2018,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.event_geheimnisnacht_difficulty_levels
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.event_geheimnisnacht_quickplay_levels,
		}
	end,
}
quest_templates.quests.event_mondstille_bonfires_2018 = {
	desc = "quest_mondstille_01_desc",
	icon = "quest_book_mondstille",
	name = "quest_mondstille_01_name",
	completed = function (statistics_db, stats_id)
		if statistics_db:get_persistent_stat(stats_id, "bonfire_lit_mines") > 0 and statistics_db:get_persistent_stat(stats_id, "bonfire_lit_fort") > 0 and statistics_db:get_persistent_stat(stats_id, "bonfire_lit_warcamp") > 0 and statistics_db:get_persistent_stat(stats_id, "bonfire_lit_skittergate") > 0 then
			return true
		end

		return false
	end,
	progress = function (statistics_db, stats_id)
		local count = 0

		if statistics_db:get_persistent_stat(stats_id, "bonfire_lit_mines") > 0 then
			count = count + 1
		end

		if statistics_db:get_persistent_stat(stats_id, "bonfire_lit_fort") > 0 then
			count = count + 1
		end

		if statistics_db:get_persistent_stat(stats_id, "bonfire_lit_warcamp") > 0 then
			count = count + 1
		end

		if statistics_db:get_persistent_stat(stats_id, "bonfire_lit_skittergate") > 0 then
			count = count + 1
		end

		return {
			count,
			4,
		}
	end,
	requirements = function (statistics_db, stats_id)
		local mines = statistics_db:get_persistent_stat(stats_id, "bonfire_lit_mines") > 0
		local fort = statistics_db:get_persistent_stat(stats_id, "bonfire_lit_fort") > 0
		local warcamp = statistics_db:get_persistent_stat(stats_id, "bonfire_lit_warcamp") > 0
		local skittergate = statistics_db:get_persistent_stat(stats_id, "bonfire_lit_skittergate") > 0

		return {
			{
				name = "level_name_mines",
				completed = mines,
			},
			{
				name = "level_name_forest_fort",
				completed = fort,
			},
			{
				name = "level_name_warcamp",
				completed = warcamp,
			},
			{
				name = "level_name_skittergate",
				completed = skittergate,
			},
		}
	end,
}

local event_mondstille_played_legend_mappings_2018 = {
	{
		played_difficulty = {
			hardest = true,
		},
	},
}

quest_templates.quests.event_mondstille_played_legend_2018 = {
	desc = "quest_mondstille_03_desc",
	icon = "quest_book_mondstille",
	name = "quest_mondstille_03_name",
	stat_mappings = event_mondstille_played_legend_mappings_2018,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.event_mondstille_quickplay_legend_levels
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.event_mondstille_quickplay_legend_levels,
		}
	end,
}
quest_templates.quests.event_mondstille_quickplay_console = {
	icon = "quest_book_mondstille",
	name = "quest_mondstille_01_name",
	desc = function ()
		return string.format(Localize("quest_event_summer_2018_quickplay_desc"), QuestSettings.event_sonnstill_quickplay_levels)
	end,
	stat_mappings = event_quickplay_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.event_sonnstill_quickplay_levels
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.event_sonnstill_quickplay_levels,
		}
	end,
}
quest_templates.quests.event_celebration_complete_2020 = {
	desc = "quest_celebration_01_desc",
	icon = "quest_book_event_celebration",
	name = "quest_celebration_01_name",
	stat_mappings = event_weekly_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) > 0
	end,
}
quest_templates.quests.event_celebration_complete_2023 = {
	desc = "quest_celebration_01_desc",
	icon = "quest_book_event_celebration",
	name = "quest_celebration_01_name",
	stat_mappings = event_weekly_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) > 0
	end,
}

local event_celebration_collected_painting_scraps_2019_mappings = {
	{
		collected_painting_scraps_unlimited = true,
	},
}

quest_templates.quests.event_celebration_complete_2019 = {
	desc = "quest_celebration_01_desc",
	icon = "quest_book_event_celebration",
	name = "quest_celebration_01_name",
	completed = function (statistics_db, stats_id, quest_key)
		return statistics_db:get_persistent_stat(stats_id, "completed_levels", "dlc_celebrate_crawl") > 0
	end,
}
quest_templates.quests.event_celebration_drink_all_ale_2019 = {
	desc = "quest_celebration_02_desc",
	icon = "quest_book_event_celebration",
	name = "quest_celebration_02_name",
	completed = function (statistics_db, stats_id, quest_key)
		return statistics_db:get_persistent_stat(stats_id, "crawl_total_ales_drunk") >= QuestSettings.event_crawl_drink_all_ale_amount
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local count = statistics_db:get_persistent_stat(stats_id, "crawl_total_ales_drunk")

		return {
			count,
			QuestSettings.event_crawl_drink_all_ale_amount,
		}
	end,
}
quest_templates.quests.event_celebration_collect_painting_scraps_2019 = {
	icon = "quest_book_event_celebration",
	name = "painting_manaan01_name",
	desc = function ()
		return string.format(Localize("achv_gecko_scraps_generic_1_desc"), QuestSettings.event_celebration_collect_painting_scraps)
	end,
	stat_mappings = event_celebration_collected_painting_scraps_2019_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.event_celebration_collect_painting_scraps
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.event_celebration_collect_painting_scraps,
		}
	end,
}
quest_templates.quests.event_skulls_quickplay_2019 = {
	icon = "quest_book_event_skull",
	name = "quest_event_skulls_quickplay_2019_name",
	summary_icon = "achievement_symbol_book_event_skull",
	desc = function ()
		return string.format(Localize("quest_event_skulls_quickplay_2019_desc"), QuestSettings.event_skulls_quickplay)
	end,
	stat_mappings = event_quickplay_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.event_skulls_quickplay
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.event_skulls_quickplay,
		}
	end,
}
quest_templates.quests.event_skulls_weekly_event_2019 = {
	desc = "complete_one_weekly_event",
	icon = "quest_book_event_skull",
	name = "quest_event_skulls_weekly_event_2019_name",
	summary_icon = "achievement_symbol_book_event_skull",
	stat_mappings = event_weekly_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) > 0
	end,
}

local event_skulls_collected_painting_scraps_2019_mappings = {
	{
		collected_painting_scraps_unlimited = true,
	},
}

quest_templates.quests.event_skulls_painting_scraps_2019 = {
	icon = "quest_book_event_skull",
	name = "quest_event_skulls_painting_scraps_2019_name",
	summary_icon = "achievement_symbol_book_event_skull",
	desc = function ()
		return string.format(Localize("quest_event_skulls_painting_scraps_2019_desc"), QuestSettings.event_skulls_collect_painting_scraps)
	end,
	stat_mappings = event_skulls_collected_painting_scraps_2019_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.event_skulls_collect_painting_scraps
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.event_skulls_collect_painting_scraps,
		}
	end,
}

local event_skulls_warcamp_mapping = {
	{
		completed_levels = {
			warcamp = true,
		},
	},
}

quest_templates.quests.event_skulls_warcamp_2019 = {
	desc = "quest_event_skulls_warcamp_2019_desc",
	icon = "quest_book_event_skull",
	name = "quest_event_skulls_warcamp_2019_name",
	summary_icon = "achievement_symbol_book_event_skull",
	stat_mappings = event_skulls_warcamp_mapping,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) > 0
	end,
	requirements = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local defeated_bodvarr = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) > 0

		return {
			{
				name = "mission_warcamp_kill_chieftain",
				completed = defeated_bodvarr,
			},
		}
	end,
}
quest_templates.quests.event_skulls_quickplay_2020 = {
	icon = "quest_book_event_skull",
	name = "quest_event_skulls_quickplay_2019_name",
	summary_icon = "achievement_symbol_book_event_skull",
	desc = function ()
		return string.format(Localize("quest_event_skulls_quickplay_2019_desc"), QuestSettings.event_skulls_quickplay)
	end,
	stat_mappings = event_quickplay_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.event_skulls_quickplay
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.event_skulls_quickplay,
		}
	end,
}
quest_templates.quests.event_skulls_weekly_event_2020 = {
	desc = "complete_one_weekly_event",
	icon = "quest_book_event_skull",
	name = "quest_event_skulls_weekly_event_2019_name",
	summary_icon = "achievement_symbol_book_event_skull",
	stat_mappings = event_weekly_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) > 0
	end,
}
quest_templates.quests.event_skulls_painting_scraps_2020 = {
	icon = "quest_book_event_skull",
	name = "quest_event_skulls_painting_scraps_2019_name",
	summary_icon = "achievement_symbol_book_event_skull",
	desc = function ()
		return string.format(Localize("quest_event_skulls_painting_scraps_2019_desc"), QuestSettings.event_skulls_collect_painting_scraps)
	end,
	stat_mappings = event_skulls_collected_painting_scraps_2019_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.event_skulls_collect_painting_scraps
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.event_skulls_collect_painting_scraps,
		}
	end,
}
quest_templates.quests.event_skulls_warcamp_2020 = {
	desc = "quest_event_skulls_warcamp_2019_desc",
	icon = "quest_book_event_skull",
	name = "quest_event_skulls_warcamp_2019_name",
	summary_icon = "achievement_symbol_book_event_skull",
	stat_mappings = event_skulls_warcamp_mapping,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) > 0
	end,
	requirements = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local defeated_bodvarr = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) > 0

		return {
			{
				name = "mission_warcamp_kill_chieftain",
				completed = defeated_bodvarr,
			},
		}
	end,
}
quest_templates.quests.quest_event_rat_weekly_event_2020 = {
	desc = "complete_one_weekly_event",
	icon = "quest_book_year_of_the_rat",
	name = "quest_event_rat_weekly_event_2020_name",
	summary_icon = "achievement_symbol_book_event_skull",
	stat_mappings = event_weekly_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) > 0
	end,
}

local quest_event_rat_kill_skaven_2020_mapping = {
	{
		kills_per_race = {
			skaven = true,
		},
	},
}

quest_templates.quests.quest_event_rat_kill_skaven_2020 = {
	icon = "quest_book_year_of_the_rat",
	name = "quest_event_rat_kill_skaven_2020_name",
	summary_icon = "achievement_symbol_book_event_skull",
	desc = function ()
		return string.format(Localize("quest_event_rat_kill_skaven_2020_desc"), QuestSettings.quest_event_rat_kill_skaven_2020)
	end,
	stat_mappings = quest_event_rat_kill_skaven_2020_mapping,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.quest_event_rat_kill_skaven_2020
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			QuestSettings.quest_event_rat_kill_skaven_2020,
		}
	end,
}

local quest_event_rat_kill_skaven_lords_2020_mapping = {
	{
		completed_levels = {
			[LevelSettings.skittergate.level_id] = true,
		},
	},
	{
		completed_levels = {
			[LevelSettings.skaven_stronghold.level_id] = true,
		},
	},
}

quest_templates.quests.quest_event_rat_kill_skaven_lords_2020 = {
	desc = "quest_event_rat_kill_skaven_lords_2020_desc",
	icon = "quest_book_year_of_the_rat",
	name = "quest_event_rat_kill_skaven_lords_2020_name",
	summary_icon = "achievement_symbol_book_event_skull",
	stat_mappings = quest_event_rat_kill_skaven_lords_2020_mapping,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name_1 = QuestSettings.stat_mappings[quest_key][1]
		local gray_seer_completed = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name_1) > 0
		local stat_name_2 = QuestSettings.stat_mappings[quest_key][2]
		local storm_vermin_completed = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name_2) > 0

		return gray_seer_completed and storm_vermin_completed
	end,
	requirements = function (statistics_db, stats_id, quest_key)
		local stat_name_1 = QuestSettings.stat_mappings[quest_key][1]
		local gray_seer_completed = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name_1) > 0
		local stat_name_2 = QuestSettings.stat_mappings[quest_key][2]
		local storm_vermin_completed = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name_2) > 0

		return {
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

local weekly_complete_quickplay_missions_mappings = {
	{
		played_levels_quickplay = {},
	},
}
local weekly_complete_weekly_event_missions_mappings = {
	{
		played_levels_weekly_event = {},
	},
}

for i = 1, #UnlockableLevels do
	local level_key = UnlockableLevels[i]
	local complete_quickplay_missions_mapping = weekly_complete_quickplay_missions_mappings[1].played_levels_quickplay
	local complete_weekly_event_missions_mapping = weekly_complete_weekly_event_missions_mappings[1].played_levels_weekly_event

	complete_quickplay_missions_mapping[level_key] = true
	complete_weekly_event_missions_mapping[level_key] = true
end

quest_templates.quests.weekly_complete_quickplay_missions = {
	icon = "quest_book_skull",
	name = "quest_daily_complete_quickplay_missions_name",
	desc = function ()
		return string.format(Localize("quest_daily_complete_quickplay_missions_desc"), 25)
	end,
	stat_mappings = weekly_complete_quickplay_missions_mappings,
	completed = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]

		return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 25
	end,
	progress = function (statistics_db, stats_id, quest_key)
		local stat_name = QuestSettings.stat_mappings[quest_key][1]
		local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

		return {
			count,
			25,
		}
	end,
}

for i = 1, 3 do
	local id = "weekly_complete_quickplay_missions" .. "_" .. i

	quest_templates.quests[id] = {
		icon = "quest_book_skull",
		name = "quest_daily_complete_quickplay_missions_name",
		desc = function ()
			return string.format(Localize("quest_daily_complete_quickplay_missions_desc"), QuestSettings.weekly_complete_quickplay_missions[i])
		end,
		stat_mappings = weekly_complete_quickplay_missions_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.weekly_complete_quickplay_missions[i]
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_complete_quickplay_missions[i],
			}
		end,
	}
end

for i = 1, 3 do
	local id = "weekly_complete_weekly_event_missions" .. "_" .. i

	quest_templates.quests[id] = {
		icon = "quest_book_skull",
		name = "quest_daily_complete_weekly_quest_missions_name",
		desc = function ()
			return string.format(Localize("quest_daily_complete_weekly_event_missions_desc"), QuestSettings.weekly_complete_weekly_event_missions[i])
		end,
		stat_mappings = weekly_complete_weekly_event_missions_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.weekly_complete_weekly_event_missions[i]
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_complete_weekly_event_missions[i],
			}
		end,
	}
end

local weekly_collect_tomes_mappings = {
	{
		total_collected_tomes = true,
	},
}

for i = 1, 3 do
	local id = "weekly_collect_tomes" .. "_" .. i

	quest_templates.quests[id] = {
		icon = "quest_book_tome",
		name = "quest_daily_collect_tomes_name",
		desc = function ()
			return string.format(Localize("quest_daily_collect_tomes_desc"), QuestSettings.weekly_collect_tomes[i])
		end,
		stat_mappings = weekly_collect_tomes_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.weekly_collect_tomes[i]
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_collect_tomes[i],
			}
		end,
	}
end

local weekly_collect_grimoires_mappings = {
	{
		total_collected_grimoires = true,
	},
}

for i = 1, 3 do
	local id = "weekly_collect_grimoires" .. "_" .. i

	quest_templates.quests[id] = {
		icon = "quest_book_grimoire",
		name = "quest_daily_collect_grimoires_name",
		desc = function ()
			return string.format(Localize("quest_daily_collect_grimoires_desc"), QuestSettings.weekly_collect_grimoires[i])
		end,
		stat_mappings = weekly_collect_grimoires_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.weekly_collect_grimoires[i]
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_collect_grimoires[i],
			}
		end,
	}
end

local weekly_collect_dice_mappings = {
	{
		total_collected_dice = true,
	},
}

for i = 1, 3 do
	local id = "weekly_collect_dice" .. "_" .. i

	quest_templates.quests[id] = {
		icon = "quest_book_generic_pickup",
		name = "quest_daily_collect_loot_die_name",
		desc = function ()
			return string.format(Localize("quest_daily_collect_loot_die_desc"), QuestSettings.weekly_collect_dice[i])
		end,
		stat_mappings = weekly_collect_dice_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.weekly_collect_dice[i]
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_collect_dice[i],
			}
		end,
	}
end

local weekly_collect_painting_scrap_mappings = {
	{
		collected_painting_scraps_unlimited = true,
	},
}

for i = 1, 3 do
	local id = "weekly_collect_painting_scrap" .. "_" .. i

	quest_templates.quests[id] = {
		icon = "quest_book_generic_pickup",
		name = "quest_daily_collect_painting_scrap_name",
		desc = function ()
			return string.format(Localize("quest_daily_collect_painting_scrap_desc"), QuestSettings.weekly_collect_painting_scrap[i])
		end,
		stat_mappings = weekly_collect_painting_scrap_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.weekly_collect_painting_scrap[i]
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_collect_painting_scrap[i],
			}
		end,
	}
end

local weekly_kill_critter_mappings = {
	{
		kills_critter_total = true,
	},
}

for i = 1, 3 do
	local id = "weekly_kill_critters_" .. i

	quest_templates.quests[id] = {
		icon = "quest_book_skull",
		name = "quest_weekly_kill_critters_name",
		desc = function ()
			return string.format(Localize("quest_weekly_kill_critters_desc"), QuestSettings.weekly_kill_critters[i])
		end,
		stat_mappings = weekly_kill_critter_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.weekly_kill_critters[i]
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_kill_critters[i],
			}
		end,
	}
end

local weekly_kill_bosses_mappings = {
	{
		kills_per_breed = {
			beastmen_minotaur = true,
			chaos_spawn = true,
			chaos_troll = true,
			skaven_rat_ogre = true,
			skaven_stormfiend = true,
		},
		kill_assists_per_breed = {
			beastmen_minotaur = true,
			chaos_spawn = true,
			chaos_troll = true,
			skaven_rat_ogre = true,
			skaven_stormfiend = true,
		},
	},
}

for i = 1, 3 do
	local id = "weekly_kill_bosses" .. "_" .. i

	quest_templates.quests[id] = {
		icon = "quest_book_skull",
		name = "quest_daily_kill_bosses_name",
		desc = function ()
			return string.format(Localize("quest_daily_kill_bosses_desc"), QuestSettings.weekly_kill_bosses[i])
		end,
		stat_mappings = weekly_kill_bosses_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.weekly_kill_bosses[i]
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_kill_bosses[i],
			}
		end,
	}
end

local weekly_kill_elites_mappings = {
	{
		kills_per_breed = {},
		kill_assists_per_breed = {},
	},
}

for breed_name, _ in pairs(ELITES) do
	local kill_elites_mapping = weekly_kill_elites_mappings[1].kills_per_breed
	local assist_kill_elites_mapping = weekly_kill_elites_mappings[1].kill_assists_per_breed

	kill_elites_mapping[breed_name] = true
	assist_kill_elites_mapping[breed_name] = true
end

for i = 1, 3 do
	local id = "weekly_kill_elites" .. "_" .. i

	quest_templates.quests[id] = {
		icon = "quest_book_skull",
		name = "quest_daily_kill_elites_name",
		desc = function ()
			return string.format(Localize("quest_daily_kill_elites_desc"), QuestSettings.weekly_kill_elites[i])
		end,
		stat_mappings = weekly_kill_elites_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.weekly_kill_elites[i]
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_kill_elites[i],
			}
		end,
	}
end

local weekly_complete_levels_hero_wood_elf_mappings = {
	{
		completed_levels_wood_elf = {},
	},
}

for i = 1, #UnlockableLevels do
	local level_key = UnlockableLevels[i]
	local complete_levels_hero_wood_elf_mapping = weekly_complete_levels_hero_wood_elf_mappings[1].completed_levels_wood_elf

	complete_levels_hero_wood_elf_mapping[level_key] = true
end

for i = 1, 3 do
	local id = "weekly_complete_levels_hero_wood_elf" .. "_" .. i

	quest_templates.quests[id] = {
		icon = "quest_book_kerillian",
		name = "quest_daily_complete_levels_hero_wood_elf_name",
		desc = function ()
			return string.format(Localize("quest_daily_complete_levels_hero_wood_elf_desc"), QuestSettings.weekly_complete_levels_hero_wood_elf[i])
		end,
		stat_mappings = weekly_complete_levels_hero_wood_elf_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.weekly_complete_levels_hero_wood_elf[i]
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_complete_levels_hero_wood_elf[i],
			}
		end,
	}
end

local weekly_complete_levels_hero_witch_hunter_mappings = {
	{
		completed_levels_witch_hunter = {},
	},
}

for i = 1, #UnlockableLevels do
	local level_key = UnlockableLevels[i]
	local complete_levels_hero_witch_hunter_mapping = weekly_complete_levels_hero_witch_hunter_mappings[1].completed_levels_witch_hunter

	complete_levels_hero_witch_hunter_mapping[level_key] = true
end

for i = 1, 3 do
	local id = "weekly_complete_levels_hero_witch_hunter" .. "_" .. i

	quest_templates.quests[id] = {
		icon = "quest_book_saltzpyre",
		name = "quest_daily_complete_levels_hero_witch_hunter_name",
		desc = function ()
			return string.format(Localize("quest_daily_complete_levels_hero_witch_hunter_desc"), QuestSettings.weekly_complete_levels_hero_witch_hunter[i])
		end,
		stat_mappings = weekly_complete_levels_hero_witch_hunter_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.weekly_complete_levels_hero_witch_hunter[i]
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_complete_levels_hero_witch_hunter[i],
			}
		end,
	}
end

local weekly_complete_levels_hero_dwarf_ranger_mappings = {
	{
		completed_levels_dwarf_ranger = {},
	},
}

for i = 1, #UnlockableLevels do
	local level_key = UnlockableLevels[i]
	local complete_levels_hero_dwarf_ranger_mapping = weekly_complete_levels_hero_dwarf_ranger_mappings[1].completed_levels_dwarf_ranger

	complete_levels_hero_dwarf_ranger_mapping[level_key] = true
end

for i = 1, 3 do
	local id = "weekly_complete_levels_hero_dwarf_ranger" .. "_" .. i

	quest_templates.quests[id] = {
		icon = "quest_book_bardin",
		name = "quest_daily_complete_levels_hero_dwarf_ranger_name",
		desc = function ()
			return string.format(Localize("quest_daily_complete_levels_hero_dwarf_ranger_desc"), QuestSettings.weekly_complete_levels_hero_dwarf_ranger[i])
		end,
		stat_mappings = weekly_complete_levels_hero_dwarf_ranger_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.weekly_complete_levels_hero_dwarf_ranger[i]
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_complete_levels_hero_dwarf_ranger[i],
			}
		end,
	}
end

local weekly_complete_levels_hero_bright_wizard_mappings = {
	{
		completed_levels_bright_wizard = {},
	},
}

for i = 1, #UnlockableLevels do
	local level_key = UnlockableLevels[i]
	local complete_levels_hero_bright_wizard_mapping = weekly_complete_levels_hero_bright_wizard_mappings[1].completed_levels_bright_wizard

	complete_levels_hero_bright_wizard_mapping[level_key] = true
end

for i = 1, 3 do
	local id = "weekly_complete_levels_hero_bright_wizard" .. "_" .. i

	quest_templates.quests[id] = {
		icon = "quest_book_sienna",
		name = "quest_daily_complete_levels_hero_bright_wizard_name",
		desc = function ()
			return string.format(Localize("quest_daily_complete_levels_hero_bright_wizard_desc"), QuestSettings.weekly_complete_levels_hero_bright_wizard[i])
		end,
		stat_mappings = weekly_complete_levels_hero_bright_wizard_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.weekly_complete_levels_hero_bright_wizard[i]
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_complete_levels_hero_bright_wizard[i],
			}
		end,
	}
end

local weekly_complete_levels_hero_empire_soldier_mappings = {
	{
		completed_levels_empire_soldier = {},
	},
}

for i = 1, #UnlockableLevels do
	local level_key = UnlockableLevels[i]
	local complete_levels_hero_empire_soldier_mapping = weekly_complete_levels_hero_empire_soldier_mappings[1].completed_levels_empire_soldier

	complete_levels_hero_empire_soldier_mapping[level_key] = true
end

for i = 1, 3 do
	local id = "weekly_complete_levels_hero_empire_soldier" .. "_" .. i

	quest_templates.quests[id] = {
		icon = "quest_book_kruber",
		name = "quest_daily_complete_levels_hero_empire_soldier_name",
		desc = function ()
			return string.format(Localize("quest_daily_complete_levels_hero_empire_soldier_desc"), QuestSettings.weekly_complete_levels_hero_empire_soldier[i])
		end,
		stat_mappings = weekly_complete_levels_hero_empire_soldier_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.weekly_complete_levels_hero_empire_soldier[i]
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_complete_levels_hero_empire_soldier[i],
			}
		end,
	}
end

local weekly_score_headshots_mappings = {
	{
		headshots = true,
	},
}

for i = 1, 3 do
	local id = "weekly_score_headshots" .. "_" .. i

	quest_templates.quests[id] = {
		icon = "quest_book_skull",
		name = "quest_daily_score_headshots_name",
		desc = function ()
			return string.format(Localize("quest_daily_score_headshots_desc"), QuestSettings.weekly_score_headshots[i])
		end,
		stat_mappings = weekly_score_headshots_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.weekly_score_headshots[i]
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_score_headshots[i],
			}
		end,
	}
end

local weekly_daily_quests_mappings = {
	{
		completed_daily_quests = true,
	},
}

for i = 1, 3 do
	local id = "weekly_daily_quests" .. "_" .. i

	quest_templates.quests[id] = {
		icon = "quest_book_skull",
		name = "quest_weekly_daily_quests_name",
		desc = function ()
			return string.format(Localize("quest_weekly_daily_quests_desc"), QuestSettings.weekly_daily_quests[i])
		end,
		stat_mappings = weekly_daily_quests_mappings,
		completed = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= QuestSettings.weekly_daily_quests[i]
		end,
		progress = function (statistics_db, stats_id, quest_key)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				QuestSettings.weekly_daily_quests[i],
			}
		end,
	}
end

DLCUtils.merge("quest_templates", quest_templates.quests)

return quest_templates
