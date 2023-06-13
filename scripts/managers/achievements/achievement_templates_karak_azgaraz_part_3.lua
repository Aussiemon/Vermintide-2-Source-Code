local add_event_challenge = AchievementTemplateHelper.add_event_challenge
local add_levels_complete_challenge = AchievementTemplateHelper.add_levels_complete_challenge
local add_meta_challenge = AchievementTemplateHelper.add_meta_challenge
local achievements = AchievementTemplates.achievements
local add_console_achievements = AchievementTemplateHelper.add_console_achievements
local XB1_ACHIEVEMENT_ID = {
	karak_azgaraz_complete_dlc_dwarf_beacons_legend = 121,
	dwarf_big_jump = 118,
	dwarf_pressure_pad = 114,
	dwarf_crows = 115
}
local PS4_ACHIEVEMENT_ID = {
	dwarf_crows = "091"
}
local all_difficulties = {}
local portals = {
	LevelSettings.dlc_dwarf_beacons
}
local difficulties = {
	"normal",
	"hard",
	"harder",
	"hardest",
	"cataclysm"
}
local player_facing_diff_names = {
	hardest = "legend",
	hard = "veteran",
	harder = "champion",
	cataclysm = "cataclysm",
	normal = "recruit"
}

for i = 1, #difficulties do
	local difficulty_name = difficulties[i]
	local name = "karak_azgaraz_complete_dlc_dwarf_beacons_" .. player_facing_diff_names[difficulty_name]
	local icon = "achievement_beacons_" .. player_facing_diff_names[difficulty_name]
	all_difficulties[i] = name

	add_levels_complete_challenge(achievements, name, portals, DifficultySettings[difficulty_name].rank, icon, nil, XB1_ACHIEVEMENT_ID[name], PS4_ACHIEVEMENT_ID[name])
end

achievements.dwarf_pressure_pad = {
	name = "achv_dwarf_pressure_pad_name",
	display_completion_ui = true,
	icon = "achievement_dwarf_pressure_pad",
	desc = "achv_dwarf_pressure_pad_desc",
	events = {
		"dwarf_pressure_pad"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "dwarf_pressure_pad") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local unit = event_data[1]
		local is_on_pad = event_data[2]
		local complete_challenge = event_data[3]

		if not complete_challenge then
			local player = Managers.player:unit_owner(unit)
			local is_bot = player.bot_player

			if is_bot or template_data.challenge_over then
				return
			end
		end

		if not template_data.num_on_pad then
			template_data.num_on_pad = 0
		end

		if complete_challenge and template_data.num_on_pad and template_data.num_on_pad >= 1 then
			statistics_db:increment_stat(stats_id, "dwarf_pressure_pad")

			template_data.challenge_over = true
		elseif is_on_pad then
			template_data.num_on_pad = template_data.num_on_pad + 1
		else
			template_data.num_on_pad = template_data.num_on_pad - 1

			if template_data.num_on_pad < 1 then
				template_data.challenge_over = true
			end
		end
	end
}
achievements.dwarf_big_jump = {
	name = "achv_dwarf_big_jump_name",
	display_completion_ui = true,
	icon = "achievement_dwarf_big_jump",
	desc = "achv_dwarf_big_jump_desc",
	events = {
		"dwarf_big_jump"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "dwarf_big_jump") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local is_landing = event_data[1]
		local t = Managers.time:time("game")

		if is_landing and template_data.exit_t and t < template_data.exit_t then
			statistics_db:increment_stat(stats_id, "dwarf_big_jump")
		elseif not is_landing then
			template_data.exit_t = t + 4
		end
	end
}
achievements.dwarf_crows = {
	name = "achv_dwarf_crows_name",
	display_completion_ui = true,
	icon = "achievement_dwarf_crows",
	desc = "achv_dwarf_crows_desc",
	events = {
		"dwarf_crows"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "dwarf_crows") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:increment_stat(stats_id, "dwarf_crows")
	end
}
achievements.dwarf_speedrun = {
	name = "achv_dwarf_speedrun_name",
	display_completion_ui = true,
	icon = "achievement_dwarf_speedrun",
	desc = "achv_dwarf_speedrun_desc",
	events = {
		"dwarf_speedrun_start",
		"dwarf_speedrun_end"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "dwarf_speedrun") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if event_name == "dwarf_speedrun_start" then
			template_data.started = true

			return
		end

		if event_name == "dwarf_speedrun_end" and template_data.started then
			statistics_db:increment_stat(stats_id, "dwarf_speedrun")
		end
	end
}
beacons_all_challenges = table.clone(all_difficulties)

table.remove(beacons_all_challenges, #beacons_all_challenges)

beacons_all_challenges[#beacons_all_challenges + 1] = "dwarf_pressure_pad"
beacons_all_challenges[#beacons_all_challenges + 1] = "dwarf_big_jump"
beacons_all_challenges[#beacons_all_challenges + 1] = "dwarf_crows"
beacons_all_challenges[#beacons_all_challenges + 1] = "dwarf_speedrun"

add_meta_challenge(achievements, "beacons_all_challenges", beacons_all_challenges, "achievement_beacons_meta", nil, XB1_ACHIEVEMENT_ID[name], PS4_ACHIEVEMENT_ID[name])
add_console_achievements(XB1_ACHIEVEMENT_ID, PS4_ACHIEVEMENT_ID)
