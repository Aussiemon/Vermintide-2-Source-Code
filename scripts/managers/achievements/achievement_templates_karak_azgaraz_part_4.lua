-- chunkname: @scripts/managers/achievements/achievement_templates_karak_azgaraz_part_4.lua

local add_event_challenge = AchievementTemplateHelper.add_event_challenge
local add_levels_complete_challenge = AchievementTemplateHelper.add_levels_complete_challenge
local add_meta_challenge = AchievementTemplateHelper.add_meta_challenge
local achievements = AchievementTemplates.achievements
local add_console_achievements = AchievementTemplateHelper.add_console_achievements
local XB1_ACHIEVEMENT_ID = {}
local PS4_ACHIEVEMENT_ID = {}
local all_difficulties = {}
local portals = {
	LevelSettings.dlc_dwarf_whaling,
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

for i = 1, #difficulties do
	local difficulty_name = difficulties[i]
	local name = "karak_azgaraz_complete_dlc_dwarf_whaling_" .. player_facing_diff_names[difficulty_name]
	local icon = "achievement_dwarf_" .. player_facing_diff_names[difficulty_name]

	all_difficulties[i] = name

	add_levels_complete_challenge(achievements, name, portals, DifficultySettings[difficulty_name].rank, icon, nil, XB1_ACHIEVEMENT_ID[name], PS4_ACHIEVEMENT_ID[name])
end

achievements.dwarf_feculent_buboes = {
	desc = "achv_dwarf_feculent_buboes_desc",
	display_completion_ui = true,
	icon = "achievement_dwarf_feculent_buboes",
	name = "achv_dwarf_feculent_buboes_name",
	events = {
		"dwarf_feculent_buboes",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "dwarf_feculent_buboes") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:increment_stat(stats_id, "dwarf_feculent_buboes")
	end,
}
achievements.dwarf_statue_emote = {
	desc = "achv_dwarf_statue_emote_desc",
	display_completion_ui = true,
	icon = "achievement_dwarf_statue_emote",
	name = "achv_dwarf_statue_emote_name",
	events = {
		"dwarf_statue_emote",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "dwarf_statue_emote") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local is_inside = event_data[1]

		if not is_inside then
			template_data.end_t = nil

			return
		end

		local player = Managers.player:local_player()
		local unit = player and player.player_unit

		if not unit then
			return
		end

		local character_state_machine_ext = ScriptUnit.extension(unit, "character_state_machine_system")
		local state_machine = character_state_machine_ext.state_machine
		local current_state = state_machine and state_machine.state_current
		local is_emoting = current_state and current_state.name == "emote"

		if not is_emoting then
			template_data.end_t = nil

			return
		end

		statistics_db:increment_stat(stats_id, "dwarf_statue_emote")
	end,
}
achievements.dwarf_go_fish = {
	desc = "achv_dwarf_go_fish_desc",
	display_completion_ui = true,
	icon = "achievement_dwarf_go_fish",
	name = "achv_dwarf_go_fish_name",
	events = {
		"dwarf_go_fish",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "dwarf_go_fish") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:increment_stat(stats_id, "dwarf_go_fish")
	end,
}

local OIL_BARREL_KILL_AMOUNT = 75

achievements.dwarf_barrel_kill = {
	desc = "achv_dwarf_barrel_kill_desc",
	display_completion_ui = true,
	icon = "achievement_dwarf_barrel_kill",
	name = "achv_dwarf_barrel_kill_name",
	events = {
		"register_kill",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "dwarf_barrel_kill") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if not template_data.current_kills then
			template_data.current_kills = 0
		end

		local damage_table = event_data[3]
		local damage_source = damage_table[7]

		if damage_source == "lamp_oil_fire" then
			template_data.current_kills = template_data.current_kills + 1
		end

		if template_data.current_kills >= OIL_BARREL_KILL_AMOUNT then
			statistics_db:increment_stat(stats_id, "dwarf_barrel_kill")
		end
	end,
}
achievements.dwarf_elevator_speedrun = {
	desc = "achv_dwarf_elevator_speedrun_desc",
	display_completion_ui = true,
	icon = "achievement_dwarf_elevator_speedrun",
	name = "achv_dwarf_elevator_speedrun_name",
	events = {
		"dwarf_elevator_speedrun",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "dwarf_elevator_speedrun") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:increment_stat(stats_id, "dwarf_elevator_speedrun")
	end,
}
whaling_all_challenges = table.clone(all_difficulties)

table.remove(whaling_all_challenges, #whaling_all_challenges)

whaling_all_challenges[#whaling_all_challenges + 1] = "dwarf_feculent_buboes"
whaling_all_challenges[#whaling_all_challenges + 1] = "dwarf_statue_emote"
whaling_all_challenges[#whaling_all_challenges + 1] = "dwarf_go_fish"
whaling_all_challenges[#whaling_all_challenges + 1] = "dwarf_barrel_kill"
whaling_all_challenges[#whaling_all_challenges + 1] = "dwarf_elevator_speedrun"

add_meta_challenge(achievements, "whaling_all_challenges", whaling_all_challenges, "achievement_dwarf_meta", nil, nil, nil)
