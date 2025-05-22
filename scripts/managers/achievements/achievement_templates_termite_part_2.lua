-- chunkname: @scripts/managers/achievements/achievement_templates_termite_part_2.lua

local add_event_challenge = AchievementTemplateHelper.add_event_challenge
local add_levels_complete_challenge = AchievementTemplateHelper.add_levels_complete_challenge
local add_meta_challenge = AchievementTemplateHelper.add_meta_challenge
local PLACEHOLDER_ICON = AchievementTemplateHelper.PLACEHOLDER_ICON
local achievements = AchievementTemplates.achievements
local add_console_achievements = AchievementTemplateHelper.add_console_achievements
local XB1_ACHIEVEMENT_ID = {
	termite2_complete_legend = 125,
	termite2_mushroom_challenge = 126,
	termite2_water_challenge = 127,
}
local PS4_ACHIEVEMENT_ID = {
	termite2_mushroom_challenge = "094",
}
local portals = {
	LevelSettings.dlc_termite_2,
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
	local name = "termite2_complete_" .. player_facing_diff_names[difficulty_name]
	local icon = "achv_termite2_complete_" .. player_facing_diff_names[difficulty_name] .. "_icon"

	all_difficulties[i] = name

	add_levels_complete_challenge(achievements, name, portals, DifficultySettings[difficulty_name].rank, icon, nil, XB1_ACHIEVEMENT_ID[name], PS4_ACHIEVEMENT_ID[name])
end

achievements.termite2_mushroom_challenge = {
	desc = "achv_termite2_mushrooms_desc",
	display_completion_ui = true,
	icon = "achv_termite2_mushrooms_icon",
	name = "achv_termite2_mushrooms_name",
	events = {
		"termite2_mushroom_challenge",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "termite2_mushroom_challenge") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:increment_stat(stats_id, "termite2_mushroom_challenge")
	end,
}
achievements.termite2_water_challenge = {
	desc = "achv_termite2_water_desc",
	display_completion_ui = true,
	icon = "achv_termite2_water_icon",
	name = "achv_termite2_water_name",
	events = {
		"register_damage_taken",
		"register_completed_level",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "termite2_water_challenge") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local level_key = Managers.state.game_mode:level_key()

		if not level_key or level_key ~= "dlc_termite_2" then
			return
		end

		if event_name == "register_damage_taken" then
			local victim_unit = event_data[1]
			local victim_player = Managers.player:owner(victim_unit)

			if victim_player ~= Managers.player:local_player() then
				return
			end

			if not victim_player or victim_player.player_unit ~= victim_unit then
				return
			end

			local damage_data = event_data[2]
			local attacker_unit = damage_data and damage_data[DamageDataIndex.ATTACKER]

			if not Unit.alive(attacker_unit) then
				return
			end

			local is_termite_water = Unit.get_data(attacker_unit, "is_termite_water")

			if not is_termite_water then
				return
			end

			template_data.damaged_by_termite_water = true
		elseif event_name == "register_completed_level" and not template_data.damaged_by_termite_water then
			statistics_db:increment_stat(stats_id, "termite2_water_challenge")
		end
	end,
}

local OBJECTIVE_AMOUNT = 5
local TIMER_CHALLENGE_TIME_LIMIT = 4

achievements.termite2_timer_challenge = {
	display_completion_ui = true,
	icon = "achv_termite2_timer_icon",
	name = "achv_termite2_timer_name",
	desc = function ()
		return string.format(Localize("achv_termite2_timer_desc"), OBJECTIVE_AMOUNT, TIMER_CHALLENGE_TIME_LIMIT)
	end,
	events = {
		"termite2_timer_challenge",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "termite2_timer_challenge") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:increment_stat(stats_id, "termite2_timer_challenge")
	end,
}
termite2_all_challenges = table.clone(all_difficulties)

table.remove(termite2_all_challenges, #termite2_all_challenges)

termite2_all_challenges[#termite2_all_challenges + 1] = "termite2_mushroom_challenge"
termite2_all_challenges[#termite2_all_challenges + 1] = "termite2_water_challenge"

add_meta_challenge(achievements, "termite2_all_challenges", termite2_all_challenges, "achv_termite2_all_challenges_icon", nil, nil, nil)
add_console_achievements(XB1_ACHIEVEMENT_ID, PS4_ACHIEVEMENT_ID)
