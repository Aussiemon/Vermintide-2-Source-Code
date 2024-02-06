-- chunkname: @scripts/managers/achievements/achievement_templates_karak_azgaraz_part_2.lua

local add_event_challenge = AchievementTemplateHelper.add_event_challenge
local add_levels_complete_challenge = AchievementTemplateHelper.add_levels_complete_challenge
local add_meta_challenge = AchievementTemplateHelper.add_meta_challenge
local achievements = AchievementTemplates.achievements
local add_console_achievements = AchievementTemplateHelper.add_console_achievements
local XB1_ACHIEVEMENT_ID = {
	dwarf_jump_puzzle = 116,
	dwarf_towers = 117,
	karak_azgaraz_complete_dlc_dwarf_exterior_legend = 120,
}
local PS4_ACHIEVEMENT_ID = {
	dwarf_jump_puzzle = "090",
}
local all_difficulties = {}
local portals = {
	LevelSettings.dlc_dwarf_exterior,
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
	local name = "karak_azgaraz_complete_dlc_dwarf_exterior_" .. player_facing_diff_names[difficulty_name]
	local icon = "achievement_exterior_" .. player_facing_diff_names[difficulty_name]

	all_difficulties[i] = name

	add_levels_complete_challenge(achievements, name, portals, DifficultySettings[difficulty_name].rank, icon, nil, XB1_ACHIEVEMENT_ID[name], PS4_ACHIEVEMENT_ID[name])
end

achievements.dwarf_towers = {
	desc = "achv_dwarf_towers_desc",
	display_completion_ui = true,
	icon = "achievement_dwarf_towers",
	name = "achv_dwarf_towers_name",
	events = {
		"progress_dwarf_towers_challenge",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if not template_data.num_fires then
			template_data.num_fires = 1

			return
		end

		template_data.num_fires = template_data.num_fires + 1

		if template_data.num_fires >= 4 then
			statistics_db:increment_stat(stats_id, "dwarf_towers")
		end
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "dwarf_towers") >= 1
	end,
}

local DWARF_CHAIN_TIME_LIMIT = 6

achievements.dwarf_chain_speed = {
	display_completion_ui = true,
	icon = "achievement_dwarf_chain_speed",
	name = "achv_dwarf_chain_speed_name",
	desc = function ()
		return string.format(Localize("achv_dwarf_chain_speed_desc"), DWARF_CHAIN_TIME_LIMIT)
	end,
	events = {
		"progress_dwarf_chain_speed_challenge",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "dwarf_chain_speed") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if template_data.failed then
			return
		end

		local t = Managers.time:time("game")

		if not template_data.num_chains then
			template_data.num_chains = 0
		end

		if template_data.start_t and t > template_data.start_t + DWARF_CHAIN_TIME_LIMIT then
			template_data.failed = true

			return
		end

		template_data.num_chains = template_data.num_chains + 1
		template_data.start_t = t

		if template_data.num_chains >= 6 then
			local network_transmit = Managers.state.network.network_transmit
			local stat_id = NetworkLookup.statistics.dwarf_chain_speed

			if Managers.state.network.is_server then
				network_transmit:send_rpc_clients("rpc_increment_stat_party", stat_id)
			else
				network_transmit:send_rpc_server("rpc_increment_stat_party", stat_id)
			end
		end
	end,
}
achievements.dwarf_jump_puzzle = {
	desc = "achv_dwarf_jump_puzzle_desc",
	display_completion_ui = true,
	icon = "achievement_dwarf_jump_puzzle",
	name = "achv_dwarf_jump_puzzle_name",
	events = {
		"complete_dwarf_jump_puzzle_challenge",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "dwarf_jump_puzzle") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:increment_stat(stats_id, "dwarf_jump_puzzle")
	end,
}

local DWARF_PUSH_AMOUNT = 200

achievements.dwarf_push = {
	display_completion_ui = true,
	icon = "achievement_dwarf_push",
	name = "achv_dwarf_push_name",
	desc = function ()
		return string.format(Localize("achv_dwarf_push_desc"), DWARF_PUSH_AMOUNT)
	end,
	events = {
		"register_kill",
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "dwarf_push")

		return {
			completed,
			DWARF_PUSH_AMOUNT,
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "dwarf_push") >= DWARF_PUSH_AMOUNT
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local level_key = Managers.state.game_mode:level_key()

		if not level_key or level_key ~= "dlc_dwarf_exterior" then
			return
		end

		local damage_data = event_data[3]
		local damage_type = damage_data[DamageDataIndex.DAMAGE_TYPE]

		if not damage_type or damage_type ~= "volume_insta_kill" and damage_type ~= "forced" then
			return
		end

		local weapon_type = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]

		if not weapon_type or weapon_type ~= "suicide" then
			return
		end

		local victim_unit = event_data[2]
		local target_health_extension = ScriptUnit.has_extension(victim_unit, "health_system")

		if target_health_extension then
			local recent_damages = target_health_extension:recent_damages()
			local attacker_unit = damage_data[DamageDataIndex.SOURCE_ATTACKER_UNIT]
			local local_player_unit = Managers.player:local_player().player_unit

			if not attacker_unit or local_player_unit ~= attacker_unit then
				return
			end

			statistics_db:increment_stat(stats_id, "dwarf_push")
		end
	end,
}
exterior_all_challenges = table.clone(all_difficulties)

table.remove(exterior_all_challenges, #exterior_all_challenges)

exterior_all_challenges[#exterior_all_challenges + 1] = "dwarf_towers"
exterior_all_challenges[#exterior_all_challenges + 1] = "dwarf_chain_speed"
exterior_all_challenges[#exterior_all_challenges + 1] = "dwarf_jump_puzzle"
exterior_all_challenges[#exterior_all_challenges + 1] = "dwarf_push"

add_meta_challenge(achievements, "exterior_all_challenges", exterior_all_challenges, "achievement_exterior_meta", nil, XB1_ACHIEVEMENT_ID[name], PS4_ACHIEVEMENT_ID[name])
add_console_achievements(XB1_ACHIEVEMENT_ID, PS4_ACHIEVEMENT_ID)
