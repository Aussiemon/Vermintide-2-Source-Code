﻿-- chunkname: @scripts/managers/achievements/achievement_templates_wizards_part_1.lua

local add_event_challenge = AchievementTemplateHelper.add_event_challenge
local add_levels_complete_challenge = AchievementTemplateHelper.add_levels_complete_challenge
local add_meta_challenge = AchievementTemplateHelper.add_meta_challenge
local PLACEHOLDER_ICON = AchievementTemplateHelper.PLACEHOLDER_ICON
local achievements = AchievementTemplates.achievements
local PLACEHOLDER_ICON = AchievementTemplateHelper.PLACEHOLDER_ICON
local add_console_achievements = AchievementTemplateHelper.add_console_achievements
local XB1_ACHIEVEMENT_ID = {
	onions_complete_trail_legend = 106,
	trail_beacons_are_lit = 105,
	trail_cog_strike = 103,
	trail_shatterer = 102,
	trail_sleigher = 104,
}
local PS4_ACHIEVEMENT_ID = {
	trail_beacons_are_lit = "087",
}
local all_difficulties = {}
local portals = {
	LevelSettings.dlc_wizards_trail,
}
local difficulties = {
	"normal",
	"hard",
	"harder",
	"hardest",
	"cataclysm",
}

for i = 1, #difficulties do
	local difficulty_key = difficulties[i]
	local difficulty_name = DifficultyMapping[difficulty_key]
	local name = "onions_complete_trail_" .. difficulty_name

	all_difficulties[i] = name

	add_levels_complete_challenge(achievements, name, portals, DifficultySettings[difficulty_key].rank, "achievement_wizards_trail_complete_" .. difficulty_name, nil, XB1_ACHIEVEMENT_ID[name], PS4_ACHIEVEMENT_ID[name])
end

achievements.trail_cog_strike = {
	desc = "achv_onions_cog_strike_desc",
	display_completion_ui = true,
	icon = "achievement_wizards_trail_push_enemies_with_cog",
	name = "achv_onions_cog_strike_name",
	events = {
		"on_trail_cog_strike",
		"on_trail_cog_reset_stat",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "trail_cog_strike") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if event_name == "on_trail_cog_strike" then
			if not template_data.current_hits or not template_data.units then
				template_data.current_hits = 0
				template_data.units = {}
			end

			local hit_unit = event_data[1]

			if template_data.units[hit_unit] then
				return
			end

			template_data.units[hit_unit] = true
			template_data.current_hits = template_data.current_hits + 1

			if template_data.current_hits >= 10 then
				statistics_db:increment_stat(stats_id, "trail_cog_strike")

				template_data.current_hits = 0
			end
		elseif event_name == "on_trail_cog_reset_stat" then
			template_data.current_hits = 0
			template_data.units = {}
		end
	end,
}
achievements.trail_shatterer = {
	desc = "achv_onions_icicles_desc",
	display_completion_ui = true,
	icon = "achievement_wizards_trail_break_icicles",
	name = "achv_onions_icicles_name",
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "trail_shatterer") >= 1
	end,
}
achievements.trail_sleigher = {
	desc = "achv_onions_sleigh_kills_desc",
	display_completion_ui = true,
	icon = "achievement_wizards_trail_kill_enemies_with_sleigh",
	name = "achv_onions_sleigh_kills_name",
	progress = function (statistics_db, stats_id, template_data)
		local kills = statistics_db:get_persistent_stat(stats_id, "trail_sleigher") or 0

		return {
			kills,
			50,
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "trail_sleigher") >= 50
	end,
}
achievements.trail_beacons_are_lit = {
	desc = "achv_onions_light_beacons_desc",
	display_completion_ui = true,
	icon = "achievement_wizards_trail_light_bonfires",
	name = "achv_onions_light_beacons_name",
	progress = function (statistics_db, stats_id, template_data)
		local watch_tower_beacon = statistics_db:get_persistent_stat(stats_id, "trail_bonfire_watch_tower") or 0
		local river_path_beacon = statistics_db:get_persistent_stat(stats_id, "trail_bonfire_river_path") or 0
		local look_out_beacon = statistics_db:get_persistent_stat(stats_id, "trail_bonfire_lookout_point") or 0

		if watch_tower_beacon > 1 then
			watch_tower_beacon = 1
		end

		if river_path_beacon > 1 then
			river_path_beacon = 1
		end

		if look_out_beacon > 1 then
			look_out_beacon = 1
		end

		local number_of_beacons = 0

		number_of_beacons = watch_tower_beacon + river_path_beacon + look_out_beacon

		return {
			number_of_beacons,
			3,
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		local watch_tower_beacon = statistics_db:get_persistent_stat(stats_id, "trail_bonfire_watch_tower")
		local river_path_beacon = statistics_db:get_persistent_stat(stats_id, "trail_bonfire_river_path")
		local look_out_beacon = statistics_db:get_persistent_stat(stats_id, "trail_bonfire_lookout_point")

		if watch_tower_beacon >= 1 and river_path_beacon >= 1 and look_out_beacon >= 1 then
			return true
		end
	end,
}
all_trail_challenges = table.clone(all_difficulties)

table.remove(all_trail_challenges, #all_trail_challenges)

all_trail_challenges[#all_trail_challenges + 1] = "trail_cog_strike"
all_trail_challenges[#all_trail_challenges + 1] = "trail_shatterer"
all_trail_challenges[#all_trail_challenges + 1] = "trail_sleigher"
all_trail_challenges[#all_trail_challenges + 1] = "trail_beacons_are_lit"

add_meta_challenge(achievements, "onions_complete_all", all_trail_challenges, "achievement_wizards_trail_complete_all_challenges", nil, XB1_ACHIEVEMENT_ID[name], PS4_ACHIEVEMENT_ID[name])
add_console_achievements(XB1_ACHIEVEMENT_ID, PS4_ACHIEVEMENT_ID)
