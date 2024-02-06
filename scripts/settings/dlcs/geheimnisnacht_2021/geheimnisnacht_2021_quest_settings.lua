-- chunkname: @scripts/settings/dlcs/geheimnisnacht_2021/geheimnisnacht_2021_quest_settings.lua

local settings = DLCSettings.geheimnisnacht_2021
local quest_meta_mapping = {
	event_geheimnisnacht_2023_disrupt_all = {
		"event_geheimnisnacht_2023_disrupt_bardin",
		"event_geheimnisnacht_2023_disrupt_markus",
		"event_geheimnisnacht_2023_disrupt_kerillian",
		"event_geheimnisnacht_2023_disrupt_victor",
		"event_geheimnisnacht_2023_disrupt_sienna",
	},
	event_geheimnisnacht_2023_complete_all = {
		"event_geheimnisnacht_2023_play_5",
		"event_geheimnisnacht_2023_kill_cultists",
		"event_geheimnisnacht_2023_disrupt_bardin",
		"event_geheimnisnacht_2023_disrupt_markus",
		"event_geheimnisnacht_2023_disrupt_kerillian",
		"event_geheimnisnacht_2023_disrupt_victor",
		"event_geheimnisnacht_2023_disrupt_sienna",
		"event_geheimnisnacht_2023_disrupt_all",
		"event_geheimnisnacht_2023_play_5_hardmode",
	},
	event_geheimnisnacht_2022_disrupt_all = {
		"event_geheimnisnacht_2022_disrupt_bardin",
		"event_geheimnisnacht_2022_disrupt_markus",
		"event_geheimnisnacht_2022_disrupt_kerillian",
		"event_geheimnisnacht_2022_disrupt_victor",
		"event_geheimnisnacht_2022_disrupt_sienna",
	},
	event_geheimnisnacht_2022_complete_all = {
		"event_geheimnisnacht_2022_play_5",
		"event_geheimnisnacht_2022_kill_cultists",
		"event_geheimnisnacht_2022_disrupt_bardin",
		"event_geheimnisnacht_2022_disrupt_markus",
		"event_geheimnisnacht_2022_disrupt_kerillian",
		"event_geheimnisnacht_2022_disrupt_victor",
		"event_geheimnisnacht_2022_disrupt_sienna",
		"event_geheimnisnacht_2022_disrupt_all",
		"event_geheimnisnacht_2022_play_5_hardmode",
	},
	event_geheimnisnacht_2021_disrupt_all = {
		"event_geheimnisnacht_2021_disrupt_bardin",
		"event_geheimnisnacht_2021_disrupt_markus",
		"event_geheimnisnacht_2021_disrupt_kerillian",
		"event_geheimnisnacht_2021_disrupt_victor",
		"event_geheimnisnacht_2021_disrupt_sienna",
	},
	event_geheimnisnacht_2021_complete_all = {
		"event_geheimnisnacht_2021_play_5",
		"event_geheimnisnacht_2021_kill_cultists",
		"event_geheimnisnacht_2021_disrupt_bardin",
		"event_geheimnisnacht_2021_disrupt_markus",
		"event_geheimnisnacht_2021_disrupt_kerillian",
		"event_geheimnisnacht_2021_disrupt_victor",
		"event_geheimnisnacht_2021_disrupt_sienna",
		"event_geheimnisnacht_2021_disrupt_all",
		"event_geheimnisnacht_2021_play_5_hardmode",
	},
}
local hard_mode_levels = table.mirror_array_inplace({
	"warcamp",
	"dlc_dwarf_beacons",
	"nurgle",
	"dlc_bastion",
	"dlc_wizards_tower",
})

local function make_meta_progress(meta_quest_map)
	local num_meta_quests = #meta_quest_map

	return function (statistics_db, stats_id, quest_key, quest_templates, claimed_quests)
		local count = 0

		for i = 1, num_meta_quests do
			local quest_name = meta_quest_map[i]
			local completed = claimed_quests[quest_name]

			if completed then
				count = count + 1
			end
		end

		return {
			count,
			num_meta_quests,
		}
	end
end

local function make_meta_completed(meta_quest_map)
	local num_meta_quests = #meta_quest_map

	return function (statistics_db, stats_id, quest_key, quest_templates, claimed_quests)
		for i = 1, num_meta_quests do
			local quest_name = meta_quest_map[i]
			local completed = claimed_quests[quest_name]

			if not completed then
				return false
			end
		end

		return true
	end
end

local function make_meta_requirements(meta_quest_map)
	local num_meta_quests = #meta_quest_map

	return function (statistics_db, stats_id, quest_key, quest_templates, claimed_quests)
		local reqs = {}

		for i = 1, num_meta_quests do
			local quest_name = meta_quest_map[i]
			local completed = claimed_quests[quest_name]
			local quest_display_name = quest_templates[quest_name].name

			reqs[i] = {
				name = quest_display_name,
				completed = completed,
			}
		end

		return reqs
	end
end

local register_kill_stats_id = 1
local register_kill_victim_unit = 2
local register_kill_damage_data = 3
local register_kill_victim_breed = 4

settings.quest_templates = {
	event_geheimnisnacht_2023_play_5 = {
		desc = "quest_event_geheimnisnacht_2023_play_5_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2023_play_5",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 5
		end,
		progress = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				5,
			}
		end,
		events = {
			"register_completed_level",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			if Managers.state.game_mode:has_activated_mutator("night_mode") then
				local stat_name = QuestSettings.stat_mappings[quest_key][1]

				statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
			end
		end,
	},
	event_geheimnisnacht_2023_disrupt_markus = {
		desc = "quest_event_geheimnisnacht_2023_disrupt_markus_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2023_disrupt_markus",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 1
		end,
		events = {
			"altar_destroyed",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			local level_transition_handler = Managers.level_transition_handler
			local level_key = level_transition_handler:get_current_level_keys()

			if level_key ~= "dlc_bastion" then
				return
			end

			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
		end,
	},
	event_geheimnisnacht_2023_disrupt_bardin = {
		desc = "quest_event_geheimnisnacht_2023_disrupt_bardin_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2023_disrupt_bardin",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 1
		end,
		events = {
			"altar_destroyed",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			local level_transition_handler = Managers.level_transition_handler
			local level_key = level_transition_handler:get_current_level_keys()

			if level_key ~= "dlc_dwarf_beacons" then
				return
			end

			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
		end,
	},
	event_geheimnisnacht_2023_kill_cultists = {
		desc = "quest_event_geheimnisnacht_2023_kill_cultists_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2023_kill_cultists",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 250
		end,
		progress = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				250,
			}
		end,
		events = {
			"register_kill",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			local killed_unit = event_data[register_kill_victim_unit]

			if not killed_unit then
				return
			end

			local killed_buff_extension = ScriptUnit.has_extension(killed_unit, "buff_system")

			if not killed_buff_extension or not killed_buff_extension:has_buff_type("geheimnisnacht_2021_event_eye_glow") then
				return
			end

			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
		end,
	},
	event_geheimnisnacht_2023_disrupt_kerillian = {
		desc = "quest_event_geheimnisnacht_2023_disrupt_kerillian_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2023_disrupt_kerillian",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 1
		end,
		events = {
			"altar_destroyed",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			local level_transition_handler = Managers.level_transition_handler
			local level_key = level_transition_handler:get_current_level_keys()

			if level_key ~= "nurgle" then
				return
			end

			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
		end,
	},
	event_geheimnisnacht_2023_disrupt_victor = {
		desc = "quest_event_geheimnisnacht_2023_disrupt_victor_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2023_disrupt_victor",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 1
		end,
		events = {
			"altar_destroyed",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			local level_transition_handler = Managers.level_transition_handler
			local level_key = level_transition_handler:get_current_level_keys()

			if level_key ~= "warcamp" then
				return
			end

			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
		end,
	},
	event_geheimnisnacht_2023_disrupt_sienna = {
		desc = "quest_event_geheimnisnacht_2023_disrupt_sienna_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2023_disrupt_sienna",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 1
		end,
		events = {
			"altar_destroyed",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			local level_transition_handler = Managers.level_transition_handler
			local level_key = level_transition_handler:get_current_level_keys()

			if level_key ~= "dlc_wizards_tower" then
				return
			end

			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
		end,
	},
	event_geheimnisnacht_2023_disrupt_all = {
		desc = "quest_event_geheimnisnacht_2023_disrupt_all_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2023_disrupt_all",
		completed = make_meta_completed(quest_meta_mapping.event_geheimnisnacht_2023_disrupt_all),
		progress = make_meta_progress(quest_meta_mapping.event_geheimnisnacht_2023_disrupt_all),
		requirements = make_meta_requirements(quest_meta_mapping.event_geheimnisnacht_2023_disrupt_all),
	},
	event_geheimnisnacht_2023_complete_all = {
		desc = "quest_event_geheimnisnacht_2023_complete_all_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2023_complete_all",
		completed = make_meta_completed(quest_meta_mapping.event_geheimnisnacht_2023_complete_all),
		progress = make_meta_progress(quest_meta_mapping.event_geheimnisnacht_2023_complete_all),
		requirements = make_meta_requirements(quest_meta_mapping.event_geheimnisnacht_2023_complete_all),
	},
	event_geheimnisnacht_2023_play_5_hardmode = {
		desc = "quest_event_geheimnisnacht_2023_play_5_hardmode_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2023_play_5_hardmode",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			for i = 1, #hard_mode_levels do
				local stat_name = QuestSettings.stat_mappings[quest_key][i]

				if statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) <= 0 then
					return false
				end
			end

			return true
		end,
		progress = function (statistics_db, stats_id, quest_key, quest_templates)
			local count = 0

			for i = 1, #hard_mode_levels do
				local stat_name = QuestSettings.stat_mappings[quest_key][i]

				if statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) > 0 then
					count = count + 1
				end
			end

			return {
				count,
				5,
			}
		end,
		requirements = function (statistics_db, stats_id, quest_key, quest_templates, claimed_quests)
			local reqs = {}

			for i = 1, #hard_mode_levels do
				local level_id = hard_mode_levels[i]
				local stat_name = QuestSettings.stat_mappings[quest_key][i]
				local completed = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) > 0

				reqs[i] = {
					name = LevelSettings[level_id].display_name,
					completed = completed,
				}
			end

			return reqs
		end,
		events = {
			"register_completed_level",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			if Managers.state.game_mode:has_activated_mutator("geheimnisnacht_2021_hard_mode") then
				local stat_id = hard_mode_levels[event_data[2]]
				local stat_name = QuestSettings.stat_mappings[quest_key][stat_id]

				statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
			end
		end,
	},
	event_geheimnisnacht_2022_play_5 = {
		desc = "quest_event_geheimnisnacht_2022_play_5_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2022_play_5",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 5
		end,
		progress = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				5,
			}
		end,
		events = {
			"register_completed_level",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			if Managers.state.game_mode:has_activated_mutator("night_mode") then
				local stat_name = QuestSettings.stat_mappings[quest_key][1]

				statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
			end
		end,
	},
	event_geheimnisnacht_2022_disrupt_markus = {
		desc = "quest_event_geheimnisnacht_2022_disrupt_markus_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2022_disrupt_markus",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 1
		end,
		events = {
			"altar_destroyed",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			local level_transition_handler = Managers.level_transition_handler
			local level_key = level_transition_handler:get_current_level_keys()

			if level_key ~= "catacombs" then
				return
			end

			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
		end,
	},
	event_geheimnisnacht_2022_disrupt_bardin = {
		desc = "quest_event_geheimnisnacht_2022_disrupt_bardin_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2022_disrupt_bardin",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 1
		end,
		events = {
			"altar_destroyed",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			local level_transition_handler = Managers.level_transition_handler
			local level_key = level_transition_handler:get_current_level_keys()

			if level_key ~= "mines" then
				return
			end

			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
		end,
	},
	event_geheimnisnacht_2022_kill_cultists = {
		desc = "quest_event_geheimnisnacht_2022_kill_cultists_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2022_kill_cultists",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 250
		end,
		progress = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				250,
			}
		end,
		events = {
			"register_kill",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			local killed_unit = event_data[register_kill_victim_unit]

			if not killed_unit then
				return
			end

			local killed_buff_extension = ScriptUnit.has_extension(killed_unit, "buff_system")

			if not killed_buff_extension or not killed_buff_extension:has_buff_type("geheimnisnacht_2021_event_eye_glow") then
				return
			end

			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
		end,
	},
	event_geheimnisnacht_2022_disrupt_kerillian = {
		desc = "quest_event_geheimnisnacht_2022_disrupt_kerillian_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2022_disrupt_kerillian",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 1
		end,
		events = {
			"altar_destroyed",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			local level_transition_handler = Managers.level_transition_handler
			local level_key = level_transition_handler:get_current_level_keys()

			if level_key ~= "elven_ruins" then
				return
			end

			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
		end,
	},
	event_geheimnisnacht_2022_disrupt_victor = {
		desc = "quest_event_geheimnisnacht_2022_disrupt_victor_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2022_disrupt_victor",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 1
		end,
		events = {
			"altar_destroyed",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			local level_transition_handler = Managers.level_transition_handler
			local level_key = level_transition_handler:get_current_level_keys()

			if level_key ~= "ground_zero" then
				return
			end

			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
		end,
	},
	event_geheimnisnacht_2022_disrupt_sienna = {
		desc = "quest_event_geheimnisnacht_2022_disrupt_sienna_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2022_disrupt_sienna",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 1
		end,
		events = {
			"altar_destroyed",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			local level_transition_handler = Managers.level_transition_handler
			local level_key = level_transition_handler:get_current_level_keys()

			if level_key ~= "farmlands" then
				return
			end

			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
		end,
	},
	event_geheimnisnacht_2022_disrupt_all = {
		desc = "quest_event_geheimnisnacht_2022_disrupt_all_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2022_disrupt_all",
		completed = make_meta_completed(quest_meta_mapping.event_geheimnisnacht_2022_disrupt_all),
		progress = make_meta_progress(quest_meta_mapping.event_geheimnisnacht_2022_disrupt_all),
		requirements = make_meta_requirements(quest_meta_mapping.event_geheimnisnacht_2022_disrupt_all),
	},
	event_geheimnisnacht_2022_complete_all = {
		desc = "quest_event_geheimnisnacht_2022_complete_all_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2022_complete_all",
		completed = make_meta_completed(quest_meta_mapping.event_geheimnisnacht_2022_complete_all),
		progress = make_meta_progress(quest_meta_mapping.event_geheimnisnacht_2022_complete_all),
		requirements = make_meta_requirements(quest_meta_mapping.event_geheimnisnacht_2022_complete_all),
	},
	event_geheimnisnacht_2022_play_5_hardmode = {
		desc = "quest_event_geheimnisnacht_2022_play_5_hardmode_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2022_play_5_hardmode",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			for i = 1, #hard_mode_levels do
				local stat_name = QuestSettings.stat_mappings[quest_key][i]

				if statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) <= 0 then
					return false
				end
			end

			return true
		end,
		progress = function (statistics_db, stats_id, quest_key, quest_templates)
			local count = 0

			for i = 1, #hard_mode_levels do
				local stat_name = QuestSettings.stat_mappings[quest_key][i]

				if statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) > 0 then
					count = count + 1
				end
			end

			return {
				count,
				5,
			}
		end,
		requirements = function (statistics_db, stats_id, quest_key, quest_templates, claimed_quests)
			local reqs = {}

			for i = 1, #hard_mode_levels do
				local level_id = hard_mode_levels[i]
				local stat_name = QuestSettings.stat_mappings[quest_key][i]
				local completed = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) > 0

				reqs[i] = {
					name = LevelSettings[level_id].display_name,
					completed = completed,
				}
			end

			return reqs
		end,
		events = {
			"register_completed_level",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			if Managers.state.game_mode:has_activated_mutator("geheimnisnacht_2021_hard_mode") then
				local stat_id = hard_mode_levels[event_data[2]]
				local stat_name = QuestSettings.stat_mappings[quest_key][stat_id]

				statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
			end
		end,
	},
	event_geheimnisnacht_2021_play_5 = {
		desc = "quest_event_geheimnisnacht_2021_play_5_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2021_play_5",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 5
		end,
		progress = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				5,
			}
		end,
		events = {
			"register_completed_level",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			if Managers.state.game_mode:has_activated_mutator("night_mode") then
				local stat_name = QuestSettings.stat_mappings[quest_key][1]

				statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
			end
		end,
	},
	event_geheimnisnacht_2021_kill_cultists = {
		desc = "quest_event_geheimnisnacht_2021_kill_cultists_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2021_kill_cultists",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 250
		end,
		progress = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]
			local count = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name)

			return {
				count,
				250,
			}
		end,
		events = {
			"register_kill",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			local killed_unit = event_data[register_kill_victim_unit]

			if not killed_unit then
				return
			end

			local killed_buff_extension = ScriptUnit.has_extension(killed_unit, "buff_system")

			if not killed_buff_extension or not killed_buff_extension:has_buff_type("geheimnisnacht_2021_event_eye_glow") then
				return
			end

			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
		end,
	},
	event_geheimnisnacht_2021_disrupt_bardin = {
		desc = "quest_event_geheimnisnacht_2021_disrupt_bardin_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2021_disrupt_bardin",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 1
		end,
		events = {
			"altar_destroyed",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			local level_transition_handler = Managers.level_transition_handler
			local level_key = level_transition_handler:get_current_level_keys()

			if level_key ~= "bell" then
				return
			end

			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
		end,
	},
	event_geheimnisnacht_2021_disrupt_markus = {
		desc = "quest_event_geheimnisnacht_2021_disrupt_markus_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2021_disrupt_markus",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 1
		end,
		events = {
			"altar_destroyed",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			local level_transition_handler = Managers.level_transition_handler
			local level_key = level_transition_handler:get_current_level_keys()

			if level_key ~= "military" then
				return
			end

			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
		end,
	},
	event_geheimnisnacht_2021_disrupt_kerillian = {
		desc = "quest_event_geheimnisnacht_2021_disrupt_kerillian_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2021_disrupt_kerillian",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 1
		end,
		events = {
			"altar_destroyed",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			local level_transition_handler = Managers.level_transition_handler
			local level_key = level_transition_handler:get_current_level_keys()

			if level_key ~= "dlc_portals" then
				return
			end

			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
		end,
	},
	event_geheimnisnacht_2021_disrupt_victor = {
		desc = "quest_event_geheimnisnacht_2021_disrupt_victor_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2021_disrupt_victor",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 1
		end,
		events = {
			"altar_destroyed",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			local level_transition_handler = Managers.level_transition_handler
			local level_key = level_transition_handler:get_current_level_keys()

			if level_key ~= "dlc_castle" then
				return
			end

			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
		end,
	},
	event_geheimnisnacht_2021_disrupt_sienna = {
		desc = "quest_event_geheimnisnacht_2021_disrupt_sienna_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2021_disrupt_sienna",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			return statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) >= 1
		end,
		events = {
			"altar_destroyed",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			local level_transition_handler = Managers.level_transition_handler
			local level_key = level_transition_handler:get_current_level_keys()

			if level_key ~= "ussingen" then
				return
			end

			local stat_name = QuestSettings.stat_mappings[quest_key][1]

			statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
		end,
	},
	event_geheimnisnacht_2021_disrupt_all = {
		desc = "quest_event_geheimnisnacht_2021_disrupt_all_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2021_disrupt_all",
		completed = make_meta_completed(quest_meta_mapping.event_geheimnisnacht_2021_disrupt_all),
		progress = make_meta_progress(quest_meta_mapping.event_geheimnisnacht_2021_disrupt_all),
		requirements = make_meta_requirements(quest_meta_mapping.event_geheimnisnacht_2021_disrupt_all),
	},
	event_geheimnisnacht_2021_complete_all = {
		desc = "quest_event_geheimnisnacht_2021_complete_all_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2021_complete_all",
		completed = make_meta_completed(quest_meta_mapping.event_geheimnisnacht_2021_complete_all),
		progress = make_meta_progress(quest_meta_mapping.event_geheimnisnacht_2021_complete_all),
		requirements = make_meta_requirements(quest_meta_mapping.event_geheimnisnacht_2021_complete_all),
	},
	event_geheimnisnacht_2021_play_5_hardmode = {
		desc = "quest_event_geheimnisnacht_2021_play_5_hardmode_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_2021_play_5_hardmode",
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			for i = 1, #hard_mode_levels do
				local stat_name = QuestSettings.stat_mappings[quest_key][i]

				if statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) <= 0 then
					return false
				end
			end

			return true
		end,
		progress = function (statistics_db, stats_id, quest_key, quest_templates)
			local count = 0

			for i = 1, #hard_mode_levels do
				local stat_name = QuestSettings.stat_mappings[quest_key][i]

				if statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) > 0 then
					count = count + 1
				end
			end

			return {
				count,
				5,
			}
		end,
		requirements = function (statistics_db, stats_id, quest_key, quest_templates, claimed_quests)
			local reqs = {}

			for i = 1, #hard_mode_levels do
				local level_id = hard_mode_levels[i]
				local stat_name = QuestSettings.stat_mappings[quest_key][i]
				local completed = statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) > 0

				reqs[i] = {
					name = LevelSettings[level_id].display_name,
					completed = completed,
				}
			end

			return reqs
		end,
		events = {
			"register_completed_level",
		},
		on_event = function (statistics_db, stats_id, template_data, event_name, event_data, quest_key)
			if Managers.state.game_mode:has_activated_mutator("geheimnisnacht_2021_hard_mode") then
				local stat_id = hard_mode_levels[event_data[2]]
				local stat_name = QuestSettings.stat_mappings[quest_key][stat_id]

				statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
			end
		end,
	},
}
