-- chunkname: @scripts/managers/achievements/achievement_templates_termite_part_3.lua

local add_event_challenge = AchievementTemplateHelper.add_event_challenge
local add_levels_complete_challenge = AchievementTemplateHelper.add_levels_complete_challenge
local add_meta_challenge = AchievementTemplateHelper.add_meta_challenge
local PLACEHOLDER_ICON = AchievementTemplateHelper.PLACEHOLDER_ICON
local achievements = AchievementTemplates.achievements
local add_console_achievements = AchievementTemplateHelper.add_console_achievements
local XB1_ACHIEVEMENT_ID = {
	termite3_collectible_challenge = 129,
	termite3_complete_legend = 128,
	termite3_generator_challenge = 130,
}
local PS4_ACHIEVEMENT_ID = {
	termite3_generator_challenge = "095",
}
local portals = {
	LevelSettings.dlc_termite_3,
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
	local name = "termite3_complete_" .. player_facing_diff_names[difficulty_name]
	local icon = "achv_termite3_complete_" .. player_facing_diff_names[difficulty_name] .. "_icon"

	all_difficulties[i] = name

	add_levels_complete_challenge(achievements, name, portals, DifficultySettings[difficulty_name].rank, icon, nil, XB1_ACHIEVEMENT_ID[name], PS4_ACHIEVEMENT_ID[name])
end

local COLLECTIBLE_AMOUNT = 20

achievements.termite3_collectible_challenge = {
	display_completion_ui = true,
	icon = "achv_termite3_collectibles",
	name = "achv_termite3_collectible_challenge_name",
	desc = function ()
		return string.format(Localize("achv_termite3_collectible_challenge_desc"), COLLECTIBLE_AMOUNT)
	end,
	events = {
		"termite3_collectible_challenge",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "termite3_collectible_challenge") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:increment_stat(stats_id, "termite3_collectible_challenge")
	end,
}
achievements.termite3_searchlight_challenge = {
	desc = "achv_termite3_searchlight_challenge_desc",
	display_completion_ui = true,
	icon = "achv_termite3_searchlight_icon",
	name = "achv_termite3_searchlight_challenge_name",
	events = {
		"termite3_searchlight_challenge",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "termite3_searchlight_challenge") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:increment_stat(stats_id, "termite3_searchlight_challenge")
	end,
}

local GENERATOR_AMOUNT = 4

achievements.termite3_generator_challenge = {
	display_completion_ui = true,
	icon = "achv_termite3_generator",
	name = "achv_termite3_generator_challenge_name",
	desc = function ()
		return string.format(Localize("achv_termite3_generator_challenge_desc"), GENERATOR_AMOUNT)
	end,
	events = {
		"termite3_generator_challenge",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "termite3_generator_challenge") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:increment_stat(stats_id, "termite3_generator_challenge")
	end,
}

local PORTAL_CHALLENGE_TIME_LIMIT = 3

achievements.termite3_portal_challenge = {
	display_completion_ui = true,
	icon = "achv_termite3_portal_icon",
	name = "achv_termite3_portal_challenge_name",
	desc = function ()
		return string.format(Localize("achv_termite3_portal_challenge_desc"), PORTAL_CHALLENGE_TIME_LIMIT)
	end,
	events = {
		"termite3_portal_challenge",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "termite3_portal_challenge") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:increment_stat(stats_id, "termite3_portal_challenge")
	end,
}
termite3_all_challenges = table.clone(all_difficulties)

table.remove(termite3_all_challenges, #termite3_all_challenges)

termite3_all_challenges[#termite3_all_challenges + 1] = "termite3_collectible_challenge"
termite3_all_challenges[#termite3_all_challenges + 1] = "termite3_searchlight_challenge"
termite3_all_challenges[#termite3_all_challenges + 1] = "termite3_generator_challenge"

add_meta_challenge(achievements, "termite3_all_challenges", termite3_all_challenges, "achv_termite3_complete_all_icon", nil, nil, nil)
add_console_achievements(XB1_ACHIEVEMENT_ID, PS4_ACHIEVEMENT_ID)
