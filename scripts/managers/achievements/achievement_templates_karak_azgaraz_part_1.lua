local add_event_challenge = AchievementTemplateHelper.add_event_challenge
local add_levels_complete_challenge = AchievementTemplateHelper.add_levels_complete_challenge
local add_meta_challenge = AchievementTemplateHelper.add_meta_challenge
local achievements = AchievementTemplates.achievements
local add_console_achievements = AchievementTemplateHelper.add_console_achievements
local XB1_ACHIEVEMENT_ID = {
	dwarf_valaya_emote = 113,
	dwarf_barrel_carry = 112,
	karak_azgaraz_complete_dlc_dwarf_interior_legend = 119
}
local PS4_ACHIEVEMENT_ID = {
	dwarf_valaya_emote = "092"
}
local all_difficulties = {}
local portals = {
	LevelSettings.dlc_dwarf_interior
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
	local name = "karak_azgaraz_complete_dlc_dwarf_interior_" .. player_facing_diff_names[difficulty_name]
	local icon = "achievement_interior_" .. player_facing_diff_names[difficulty_name]
	all_difficulties[i] = name

	add_levels_complete_challenge(achievements, name, portals, DifficultySettings[difficulty_name].rank, icon, nil, XB1_ACHIEVEMENT_ID[name], PS4_ACHIEVEMENT_ID[name])
end

achievements.dwarf_valaya_emote = {
	name = "achv_dwarf_valaya_emote_name",
	display_completion_ui = true,
	icon = "achievement_dwarf_valaya_emote",
	desc = "achv_dwarf_valaya_emote_desc",
	events = {
		"dwarf_valaya_emote"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "dwarf_valaya_emote") >= 1
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
		local is_emoting = current_state and current_state.name == "emote" and current_state.current_emote == "anim_pose_unarmed_05"

		if not is_emoting then
			template_data.end_t = nil

			return
		end

		local t = Managers.time:time("game")

		if not template_data.end_t then
			template_data.end_t = t + 5
			template_data.completed = false

			return
		end

		if template_data.end_t < t and not template_data.completed then
			local audio_system_extension = Managers.state.entity:system("audio_system")

			audio_system_extension:_play_event("Play_hud_small_puzzle_cue", unit)

			local health_extension = ScriptUnit.extension(unit, "health_system")
			local amount_to_heal = health_extension:get_max_health() / 2

			if Managers.player.is_server then
				DamageUtils.heal_network(unit, unit, amount_to_heal, "healing_draught")
			else
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_id = network_manager:unit_game_object_id(unit)
				local heal_type_id = NetworkLookup.heal_types.healing_draught

				network_transmit:send_rpc_server("rpc_request_heal", unit_id, amount_to_heal, heal_type_id)
			end

			statistics_db:increment_stat(stats_id, "dwarf_valaya_emote")

			template_data.completed = true
		end
	end
}
achievements.dwarf_rune = {
	name = "achv_dwarf_rune_name",
	display_completion_ui = true,
	icon = "achievement_dwarf_rune",
	desc = "achv_dwarf_rune_desc",
	events = {
		"dwarf_rune"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "dwarf_rune") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:increment_stat(stats_id, "dwarf_rune")
	end
}
achievements.dwarf_barrel_carry = {
	name = "achv_dwarf_barrel_carry_name",
	display_completion_ui = true,
	icon = "achievement_dwarf_barrel_carry",
	desc = "achv_dwarf_barrel_carry_desc",
	events = {
		"objective_entered_socket_zone",
		"dwarf_barrel_carry"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "dwarf_barrel_carry") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local level_key = Managers.state.game_mode:level_key()

		if not level_key or level_key ~= "dlc_dwarf_interior" then
			return
		end

		if template_data.failed then
			return
		end

		local is_limited = event_data[2]

		if is_limited then
			template_data.failed = true

			return
		end

		local success = event_data[1]

		if success then
			statistics_db:increment_stat(stats_id, "dwarf_barrel_carry")
		end
	end
}
achievements.dwarf_bells = {
	name = "achv_dwarf_bells_name",
	display_completion_ui = true,
	icon = "achievement_dwarf_bells",
	desc = "achv_dwarf_bells_desc",
	events = {
		"dwarf_bells"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "dwarf_bells") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:increment_stat(stats_id, "dwarf_bells")
	end
}
local DWARF_PRESSURE_TIME_LIMIT = 8
achievements.dwarf_pressure = {
	name = "achv_dwarf_pressure_name",
	display_completion_ui = true,
	icon = "achievement_dwarf_pressure",
	desc = function ()
		return string.format(Localize("achv_dwarf_pressure_desc"), DWARF_PRESSURE_TIME_LIMIT)
	end,
	events = {
		"dwarf_pressure"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "dwarf_pressure") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if template_data.failed then
			return
		end

		local start_timer = event_data[1]
		local t = Managers.time:time("game")

		if not template_data.num_valves then
			template_data.num_valves = 0
		end

		if start_timer then
			template_data.start_t = t

			return
		end

		template_data.num_valves = template_data.num_valves + 1

		if template_data.num_valves >= 4 then
			local network_transmit = Managers.state.network.network_transmit
			local stat_id = NetworkLookup.statistics.dwarf_pressure

			if Managers.state.network.is_server then
				network_transmit:send_rpc_clients("rpc_increment_stat_party", stat_id)
			else
				network_transmit:send_rpc_server("rpc_increment_stat_party", stat_id)
			end
		end

		if template_data.start_t and t > template_data.start_t + DWARF_PRESSURE_TIME_LIMIT then
			template_data.failed = true

			return
		end
	end
}
interior_all_challenges = table.clone(all_difficulties)

table.remove(interior_all_challenges, #interior_all_challenges)

interior_all_challenges[#interior_all_challenges + 1] = "dwarf_valaya_emote"
interior_all_challenges[#interior_all_challenges + 1] = "dwarf_rune"
interior_all_challenges[#interior_all_challenges + 1] = "dwarf_barrel_carry"
interior_all_challenges[#interior_all_challenges + 1] = "dwarf_bells"
interior_all_challenges[#interior_all_challenges + 1] = "dwarf_pressure"

add_meta_challenge(achievements, "interior_all_challenges", interior_all_challenges, "achievement_interior_meta", nil, XB1_ACHIEVEMENT_ID[name], PS4_ACHIEVEMENT_ID[name])
add_console_achievements(XB1_ACHIEVEMENT_ID, PS4_ACHIEVEMENT_ID)
