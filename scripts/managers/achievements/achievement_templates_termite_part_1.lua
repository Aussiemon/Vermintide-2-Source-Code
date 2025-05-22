-- chunkname: @scripts/managers/achievements/achievement_templates_termite_part_1.lua

local add_event_challenge = AchievementTemplateHelper.add_event_challenge
local add_levels_complete_challenge = AchievementTemplateHelper.add_levels_complete_challenge
local add_meta_challenge = AchievementTemplateHelper.add_meta_challenge
local PLACEHOLDER_ICON = AchievementTemplateHelper.PLACEHOLDER_ICON
local achievements = AchievementTemplates.achievements
local add_console_achievements = AchievementTemplateHelper.add_console_achievements
local XB1_ACHIEVEMENT_ID = {
	termite1_bell_challenge = 124,
	termite1_complete_legend = 122,
	termite1_towers_challenge = 123,
	termite1_waystone_timer_challenge_easy = 131,
}
local PS4_ACHIEVEMENT_ID = {
	termite1_bell_challenge = "093",
}
local portals = {
	LevelSettings.dlc_termite_1,
}
local difficulties = {
	"normal",
	"hard",
	"harder",
	"hardest",
	"cataclysm",
}
local player_facing_diff_names = {
	cataclysm = "cataclysm",
	hard = "veteran",
	harder = "champion",
	hardest = "legend",
	normal = "recruit",
}
local all_difficulties = {}

for i = 1, #difficulties do
	local difficulty_name = difficulties[i]
	local name = "termite1_complete_" .. player_facing_diff_names[difficulty_name]
	local icon = "achv_termite1_complete_" .. player_facing_diff_names[difficulty_name] .. "_icon"

	all_difficulties[i] = name

	add_levels_complete_challenge(achievements, name, portals, DifficultySettings[difficulty_name].rank, icon, nil, XB1_ACHIEVEMENT_ID[name], PS4_ACHIEVEMENT_ID[name])
end

achievements.termite1_skaven_markings_challenge = {
	desc = "achv_termite1_skaven_markings_desc",
	display_completion_ui = true,
	icon = "achv_termite1_skaven_markings_icon",
	name = "achv_termite1_skaven_markings_name",
	events = {
		"termite1_skaven_markings_challenge",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "termite1_skaven_markings_challenge") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:increment_stat(stats_id, "termite1_skaven_markings_challenge")
	end,
}
achievements.termite1_bell_challenge = {
	desc = "achv_termite1_bell_desc",
	display_completion_ui = true,
	icon = "achv_termite1_bell_icon",
	name = "achv_termite1_bell_name",
	events = {
		"termite1_bell_challenge",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "termite1_bell_challenge") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:increment_stat(stats_id, "termite1_bell_challenge")
	end,
}
achievements.termite1_towers_challenge = {
	desc = "achv_termite1_towers_desc",
	display_completion_ui = true,
	icon = "achv_termite1_towers_icon",
	name = "achv_termite1_towers_name",
	events = {
		"termite1_towers_challenge",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "termite1_towers_challenge") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:increment_stat(stats_id, "termite1_towers_challenge")
	end,
}

local WAYSTONE_CHALLENGE_TIME_LIMIT_EASY = 180
local WAYSTONE_CHALLENGE_TIME_LIMIT_HARD = 90

achievements.termite1_waystone_timer_challenge_easy = {
	display_completion_ui = true,
	icon = "achv_termite1_waystone_timer_easy_icon",
	name = "achv_termite1_waystone_timer_easy_name",
	desc = function ()
		return string.format(Localize("achv_termite1_waystone_timer_easy_desc"), WAYSTONE_CHALLENGE_TIME_LIMIT_EASY)
	end,
	events = {
		"termite1_waystone_timer_challenge_easy",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "termite1_waystone_timer_challenge_easy") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:increment_stat(stats_id, "termite1_waystone_timer_challenge_easy")
	end,
}
achievements.termite1_waystone_timer_challenge_hard = {
	display_completion_ui = true,
	icon = "achv_termite1_waystone_timer_hard_icon",
	name = "achv_termite1_waystone_timer_hard_name",
	desc = function ()
		return string.format(Localize("achv_termite1_waystone_timer_hard_desc"), WAYSTONE_CHALLENGE_TIME_LIMIT_HARD)
	end,
	events = {
		"termite1_waystone_timer_challenge_hard",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "termite1_waystone_timer_challenge_hard") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:increment_stat(stats_id, "termite1_waystone_timer_challenge_hard")
	end,
}
termite1_all_challenges = table.clone(all_difficulties)

table.remove(termite1_all_challenges, #termite1_all_challenges)

termite1_all_challenges[#termite1_all_challenges + 1] = "termite1_skaven_markings_challenge"
termite1_all_challenges[#termite1_all_challenges + 1] = "termite1_bell_challenge"
termite1_all_challenges[#termite1_all_challenges + 1] = "termite1_towers_challenge"
termite1_all_challenges[#termite1_all_challenges + 1] = "termite1_waystone_timer_challenge_easy"

add_meta_challenge(achievements, "termite1_all_challenges", termite1_all_challenges, "achv_termite1_complete_all_icon", nil, nil, nil)
add_console_achievements(XB1_ACHIEVEMENT_ID, PS4_ACHIEVEMENT_ID)
