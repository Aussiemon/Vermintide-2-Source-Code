-- chunkname: @scripts/settings/dlcs/geheimnisnacht_2025/generate_geheimnisnacht_quests.lua

local GeheimnisnachtUtils = require("scripts/settings/dlcs/geheimnisnacht_2025/geheimnisnacht_utils")
local geheim_quest_templates = {}

local function _make_meta_progress(meta_quest_map)
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

local function _make_meta_completed(meta_quest_map)
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

local function _make_meta_requirements(meta_quest_map)
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

local function generate_geheimnisnacht_quests(year)
	local maps = table.mirror_array(GeheimnisnachtUtils.maps_by_year(year))
	local meta_disrupt_all = {
		"event_geheimnisnacht_" .. year .. "_disrupt_1",
		"event_geheimnisnacht_" .. year .. "_disrupt_2",
		"event_geheimnisnacht_" .. year .. "_disrupt_3",
		"event_geheimnisnacht_" .. year .. "_disrupt_4",
		"event_geheimnisnacht_" .. year .. "_disrupt_5",
	}
	local meta_complete_all = {
		"event_geheimnisnacht_" .. year .. "_participation",
		"event_geheimnisnacht_" .. year .. "_kill_cultists",
		"event_geheimnisnacht_" .. year .. "_disrupt_all",
		"event_geheimnisnacht_" .. year .. "_skull",
	}
	local ENEMY_AMOUNT = 250
	local MISSION_AMOUNT = 5
	local SKULL_AMOUNT = 5
	local REGISTER_KILL_VICTIM_UNIT = 2

	geheim_quest_templates["event_geheimnisnacht_" .. year .. "_disrupt_all"] = {
		custom_order = 4,
		desc = "quest_event_geheimnisnacht_disrupt_all_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_disrupt_all",
		completed = _make_meta_completed(meta_disrupt_all),
		progress = _make_meta_progress(meta_disrupt_all),
		requirements = _make_meta_requirements(meta_disrupt_all),
	}
	geheim_quest_templates["event_geheimnisnacht_" .. year .. "_complete_all"] = {
		custom_order = 0,
		desc = "quest_event_geheimnisnacht_complete_all_desc",
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_complete_all",
		completed = _make_meta_completed(meta_complete_all),
		progress = _make_meta_progress(meta_complete_all),
		requirements = _make_meta_requirements(meta_complete_all),
	}

	for i = 1, #maps do
		local map_name = maps[i]

		geheim_quest_templates["event_geheimnisnacht_" .. year .. "_disrupt_" .. i] = {
			icon = "quest_book_geheimnisnacht",
			name = function ()
				return string.format(Localize(LevelSettings[map_name].display_name))
			end,
			desc = function ()
				return string.format(Localize("quest_event_geheimnisnacht_disrupt_ritual_desc"), Localize(LevelSettings[map_name].display_name))
			end,
			custom_order = 4 + i,
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

				if level_key ~= maps[i] then
					return
				end

				local stat_name = QuestSettings.stat_mappings[quest_key][1]

				statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
			end,
		}
	end

	geheim_quest_templates["event_geheimnisnacht_" .. year .. "_skull"] = {
		custom_order = 3,
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_skull",
		desc = function ()
			return string.format(Localize("quest_event_geheimnisnacht_skull_desc"), SKULL_AMOUNT)
		end,
		completed = function (statistics_db, stats_id, quest_key, quest_templates)
			for i = 1, #maps do
				local stat_name = QuestSettings.stat_mappings[quest_key][i]

				if statistics_db:get_persistent_stat(stats_id, "quest_statistics", stat_name) <= 0 then
					return false
				end
			end

			return true
		end,
		progress = function (statistics_db, stats_id, quest_key, quest_templates)
			local count = 0

			for i = 1, #maps do
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

			for i = 1, #maps do
				local level_id = maps[i]
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
				local completed_level_key = event_data[2]
				local stat_id = maps[completed_level_key]

				if not stat_id then
					Application.warning("Failed to increment stat for completing level %s due to not being featured in the map list: (%s)", completed_level_key, table.concat(maps, ", "))

					return
				end

				local stat_name = QuestSettings.stat_mappings[quest_key][stat_id]

				statistics_db:increment_stat(stats_id, "quest_statistics", stat_name)
			end
		end,
	}
	geheim_quest_templates["event_geheimnisnacht_" .. year .. "_kill_cultists"] = {
		custom_order = 2,
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_kill_cultists",
		desc = function ()
			return string.format(Localize("quest_event_geheimnisnacht_kill_cultists_desc"), ENEMY_AMOUNT)
		end,
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
			local killed_unit = event_data[REGISTER_KILL_VICTIM_UNIT]

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
	}
	geheim_quest_templates["event_geheimnisnacht_" .. year .. "_participation"] = {
		custom_order = 1,
		icon = "quest_book_geheimnisnacht",
		name = "quest_event_geheimnisnacht_participation",
		desc = function ()
			return string.format(Localize("quest_event_geheimnisnacht_participation_desc"), MISSION_AMOUNT)
		end,
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
	}

	local settings = DLCSettings.geheimnisnacht_2021

	table.merge(settings.quest_templates, geheim_quest_templates)
end

return generate_geheimnisnacht_quests
