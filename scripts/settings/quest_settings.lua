﻿-- chunkname: @scripts/settings/quest_settings.lua

QuestSettings = {}
QuestSettings.rules = {
	daily = {
		max_quests = 3,
		num_criterias = 3,
	},
	weekly = {
		max_quests = 7,
		num_criterias = 3,
	},
	event = {
		max_quests = 10,
		num_criterias = 12,
	},
}
QuestSettings.elven_ruins_speed_event = 30
QuestSettings.farmlands_speed_event = 60
QuestSettings.bell_speed_event = 85
QuestSettings.mines_speed_event = 15
QuestSettings.skittergate_speed_event = 20
QuestSettings.elven_ruins_speed_event_cata = 30
QuestSettings.farmlands_speed_event_cata = 60
QuestSettings.bell_speed_event_cata = 85
QuestSettings.mines_speed_event_cata = 15
QuestSettings.skittergate_speed_event_cata = 20
QuestSettings.exalted_champion_charge_chaos_warrior = 5
QuestSettings.halescourge_tornado_enemies = 15
QuestSettings.storm_vermin_warlord_kills_enemies = 40
QuestSettings.nurgle_bathed_all = 27
QuestSettings.forest_fort_kill_cannonball = 25
QuestSettings.volume_corpse_pit_damage = 120
QuestSettings.exalted_champion_charge_chaos_warrior_cata = 5
QuestSettings.halescourge_tornado_enemies_cata = 15
QuestSettings.storm_vermin_warlord_kills_enemies_cata = 40
QuestSettings.nurgle_bathed_all_cata = 27
QuestSettings.forest_fort_kill_cannonball_cata = 25
QuestSettings.volume_corpse_pit_damage_cata = 120
QuestSettings.scrap_count_level = {
	3,
	30,
}
QuestSettings.scrap_count_generic = {
	150,
	260,
	370,
	540,
}
QuestSettings.num_enemies_killed_by_warpfire = 10
QuestSettings.num_enemies_killed_by_poison = 10
QuestSettings.corruptor_killed_at_teleport_time = 2
QuestSettings.standard_bearer_alive_seconds = 120
QuestSettings.num_gors_killed_by_warpfire = 3
QuestSettings.bladestorm_duration = 120
QuestSettings.daily_complete_quickplay_missions = 3
QuestSettings.daily_complete_weekly_event_missions = 3
QuestSettings.daily_collect_tomes = 4
QuestSettings.daily_collect_grimoires = 3
QuestSettings.daily_collect_loot_die = 5
QuestSettings.daily_collect_painting_scrap = 9
QuestSettings.daily_kill_bosses = 3
QuestSettings.daily_kill_elites = 25
QuestSettings.daily_kill_critters = 5
QuestSettings.daily_complete_levels_hero_wood_elf = 2
QuestSettings.daily_complete_levels_hero_witch_hunter = 2
QuestSettings.daily_complete_levels_hero_dwarf_ranger = 2
QuestSettings.daily_complete_levels_hero_empire_soldier = 2
QuestSettings.daily_complete_levels_hero_bright_wizard = 2
QuestSettings.daily_score_headshots = 50
QuestSettings.event_skulls_quickplay = 8
QuestSettings.event_skulls_collect_painting_scraps = 8
QuestSettings.event_skulls_kill_critters = 8
QuestSettings.event_sonnstill_quickplay_levels = 10
QuestSettings.event_sonnstill_difficulty_levels = 10
QuestSettings.event_geheimnisnacht_quickplay_levels = 10
QuestSettings.event_geheimnisnacht_difficulty_levels = 10
QuestSettings.event_mondstille_quickplay_legend_levels = 5
QuestSettings.event_crawl_drink_all_ale_amount = 99
QuestSettings.event_celebration_collect_painting_scraps = 9
QuestSettings.quest_event_rat_kill_skaven_2020 = 1000
QuestSettings.weekly_complete_quickplay_missions = {
	10,
	10,
	10,
}
QuestSettings.weekly_complete_weekly_event_missions = {
	1,
	1,
	1,
}
QuestSettings.weekly_collect_tomes = {
	15,
	15,
	15,
}
QuestSettings.weekly_collect_grimoires = {
	8,
	8,
	8,
}
QuestSettings.weekly_collect_dice = {
	15,
	15,
	15,
}
QuestSettings.weekly_collect_painting_scrap = {
	10,
	10,
	10,
}
QuestSettings.weekly_kill_bosses = {
	6,
	6,
	6,
}
QuestSettings.weekly_kill_elites = {
	55,
	55,
	55,
}
QuestSettings.weekly_complete_levels_hero_wood_elf = {
	6,
	6,
	6,
}
QuestSettings.weekly_complete_levels_hero_witch_hunter = {
	6,
	6,
	6,
}
QuestSettings.weekly_complete_levels_hero_dwarf_ranger = {
	6,
	6,
	6,
}
QuestSettings.weekly_complete_levels_hero_empire_soldier = {
	6,
	6,
	6,
}
QuestSettings.weekly_complete_levels_hero_bright_wizard = {
	6,
	6,
	6,
}
QuestSettings.weekly_kill_critters = {
	15,
	15,
	15,
}
QuestSettings.weekly_score_headshots = {
	150,
	150,
	150,
}
QuestSettings.weekly_daily_quests = {
	3,
	3,
	3,
}
QuestSettings.allowed_difficulties = {
	elven_ruins_speed_event = {
		hardest = true,
	},
	elven_ruins_speed_event_cata = {
		cataclysm = true,
	},
	farmlands_speed_event = {
		hardest = true,
	},
	farmlands_speed_event_cata = {
		cataclysm = true,
	},
	bell_speed_event = {
		hardest = true,
	},
	bell_speed_event_cata = {
		cataclysm = true,
	},
	mines_speed_event = {
		hardest = true,
	},
	mines_speed_event_cata = {
		cataclysm = true,
	},
	skittergate_speed_event = {
		hardest = true,
	},
	skittergate_speed_event_cata = {
		cataclysm = true,
	},
	exalted_champion_charge_chaos_warrior = {
		hardest = true,
	},
	exalted_champion_charge_chaos_warrior_cata = {
		cataclysm = true,
	},
	halescourge_tornado_enemies = {
		hardest = true,
	},
	halescourge_tornado_enemies_cata = {
		cataclysm = true,
	},
	storm_vermin_warlord_kills_enemies = {
		hardest = true,
	},
	storm_vermin_warlord_kills_enemies_cata = {
		cataclysm = true,
	},
	forest_fort_kill_cannonball = {
		hardest = true,
	},
	forest_fort_kill_cannonball_cata = {
		cataclysm = true,
	},
	nurgle_bathed_all = {
		hardest = true,
	},
	nurgle_bathed_all_cata = {
		cataclysm = true,
	},
	volume_corpse_pit_damage = {
		hardest = true,
	},
	volume_corpse_pit_damage_cata = {
		cataclysm = true,
	},
	ussingen_used_no_barrels = {
		hardest = true,
	},
	ussingen_used_no_barrels_cata = {
		cataclysm = true,
	},
	military_statue_kill_chaos_warriors = {
		hardest = true,
	},
	military_statue_kill_chaos_warriors_cata = {
		cataclysm = true,
	},
}

local level_challenge_name_lookup = {
	bell_speed_event = "achv_bell_destroy_bell_flee_timed_name",
	bell_speed_event_cata = "achv_bell_destroy_bell_flee_timed_cata_name",
	catacombs_added_souls = "achv_catacombs_stay_inside_ritual_pool_name",
	catacombs_added_souls_cata = "achv_catacombs_stay_inside_ritual_pool_cata_name",
	elven_ruins_speed_event = "achv_elven_ruins_align_leylines_timed_name",
	elven_ruins_speed_event_cata = "achv_elven_ruins_align_leylines_timed_cata_name",
	exalted_champion_charge_chaos_warrior = "achv_warcamp_bodvarr_charge_warriors_name",
	exalted_champion_charge_chaos_warrior_cata = "achv_warcamp_bodvarr_charge_warriors_cata_name",
	farmlands_speed_event = "achv_farmlands_rescue_prisoners_timed_name",
	farmlands_speed_event_cata = "achv_farmlands_rescue_prisoners_timed_cata_name",
	forest_fort_kill_cannonball = "achv_fort_kill_enemies_cannonball_name",
	forest_fort_kill_cannonball_cata = "achv_fort_kill_enemies_cannonball_cata_name",
	halescourge_tornado_enemies = "achv_ground_zero_burblespew_tornado_enemies_name",
	halescourge_tornado_enemies_cata = "achv_ground_zero_burblespew_tornado_enemies_cata_name",
	military_statue_kill_chaos_warriors = "achv_military_kill_chaos_warriors_in_event_name",
	military_statue_kill_chaos_warriors_cata = "achv_military_kill_chaos_warriors_in_event_cata_name",
	mines_speed_event = "achv_mines_kill_final_troll_timed_name",
	mines_speed_event_cata = "achv_mines_kill_final_troll_timed_cata_name",
	nurgle_bathed_all = "achv_nurgle_player_showered_in_pus_name",
	nurgle_bathed_all_cata = "achv_nurgle_player_showered_in_pus_cata_name",
	skittergate_speed_event = "achv_skittergate_deathrattler_rasknitt_timed_name",
	skittergate_speed_event_cata = "achv_skittergate_deathrattler_rasknitt_timed_cata_name",
	storm_vermin_warlord_kills_enemies = "achv_skaven_stronghold_skarrik_kill_skaven_name",
	storm_vermin_warlord_kills_enemies_cata = "achv_skaven_stronghold_skarrik_kill_skaven_cata_name",
	ussingen_used_no_barrels = "achv_ussingen_no_event_barrels_name",
	ussingen_used_no_barrels_cata = "achv_ussingen_no_event_barrels_cata_name",
}
local stat_mappings = {}

for quest_type, data in pairs(QuestSettings.rules) do
	local quest_prefix = string.format("%s_quest", quest_type)

	for i = 1, data.max_quests do
		local quest_name = string.format("%s_%d", quest_prefix, i)
		local stat_map = {}

		for j = 1, data.num_criterias do
			stat_map[#stat_map + 1] = string.format("%s_stat_%d", quest_name, j)
		end

		stat_mappings[quest_name] = stat_map
	end
end

QuestSettings.stat_mappings = stat_mappings

QuestSettings.send_completed_message = function (challenge_stat_id)
	local has_not_completed_challenge = false
	local human_players = Managers.player:human_players()
	local statistics_db = Managers.player:statistics_db()

	for _, player in pairs(human_players) do
		local saved_stat = statistics_db:get_persistent_stat(player:stats_id(), challenge_stat_id)

		if not saved_stat or saved_stat == 0 then
			has_not_completed_challenge = true

			break
		end

		if false then
			-- Nothing
		end
	end

	if has_not_completed_challenge then
		local challenge_name = level_challenge_name_lookup[challenge_stat_id]

		if challenge_name then
			local message = challenge_name
			local localize_parameters = false

			Managers.chat:send_system_chat_message(1, message, 1, localize_parameters, true)
		end

		if false then
			-- Nothing
		end
	end
end

local function increment_stat(unit, stat_name)
	local player = Managers.player:unit_owner(unit)

	if player and not player.bot_player then
		local peer_id = player:network_id()
		local network_manager = Managers.state.network
		local stat_id = NetworkLookup.statistics[stat_name]

		network_manager.network_transmit:send_rpc("rpc_increment_stat", peer_id, stat_id)
	end
end

local function increment_stat_on_all(stat_name)
	local statistics_db = Managers.player:statistics_db()

	statistics_db:increment_stat_and_sync_to_clients(stat_name)
end

QuestSettings.check_globadier_kill_before_throwing = function (blackboard, killer_unit)
	if not blackboard.has_thrown_first_globe then
		local stat_name = "globadier_kill_before_throwing"

		increment_stat(killer_unit, stat_name)

		blackboard.has_thrown_first_globe = nil
	end
end

QuestSettings.check_globadier_kill_during_suicide = function (blackboard, unit, killer_unit)
	if unit ~= killer_unit and blackboard.action and blackboard.action.name and blackboard.action.name == "suicide_run" then
		local stat_name = "globadier_kill_during_suicide"

		increment_stat(killer_unit, stat_name)
	end
end

QuestSettings.check_num_enemies_killed_by_poison = function (unit, extension_unit)
	local globadier_unit = AiUtils.get_actual_attacker_unit(extension_unit)
	local blackboard = BLACKBOARDS[globadier_unit]

	if blackboard then
		blackboard.num_killed_by_poison = (blackboard.num_killed_by_poison or 0) + 1

		if blackboard.num_killed_by_poison >= QuestSettings.num_enemies_killed_by_poison then
			local stat_name = "globadier_enemies_killed_by_poison"

			increment_stat_on_all(stat_name)

			blackboard.num_killed_by_poison = 0
		end
	end
end

QuestSettings.check_warpfire_kill_before_shooting = function (blackboard, killer_unit)
	if not blackboard.has_fired then
		local stat_name = "warpfire_kill_before_shooting"

		increment_stat(killer_unit, stat_name)
	end
end

QuestSettings.check_warpfire_kill_on_power_cell = function (death_hit_zone, killer_unit)
	if death_hit_zone == "aux" then
		local stat_name = "warpfire_kill_on_power_cell"

		increment_stat(killer_unit, stat_name)
	end
end

QuestSettings.check_num_enemies_killed_by_warpfire = function (unit, attacker_unit)
	local blackboard = BLACKBOARDS[attacker_unit]

	blackboard.hit_units_warpfire_challenge = blackboard.hit_units_warpfire_challenge or {}

	if not blackboard.hit_units_warpfire_challenge[unit] then
		local num_ai_killed_by_warpfire = blackboard.num_ai_killed_by_warpfire or 0

		blackboard.num_ai_killed_by_warpfire = num_ai_killed_by_warpfire + 1
		blackboard.hit_units_warpfire_challenge[unit] = true

		if blackboard.num_ai_killed_by_warpfire >= QuestSettings.num_enemies_killed_by_warpfire then
			blackboard.num_ai_killed_by_warpfire = nil
			blackboard.hit_units_warpfire_challenge = nil

			local stat_name = "warpfire_enemies_killed_by_warpfire"

			increment_stat_on_all(stat_name)
		end
	end
end

QuestSettings.check_pack_master_dodge = function (target_unit)
	local stat_name = "pack_master_dodged_attack"

	increment_stat(target_unit, stat_name)
end

QuestSettings.check_pack_master_kill_abducting_ally = function (blackboard, killer_unit)
	if blackboard.action and (blackboard.action.name == "drag" or blackboard.action.name == "initial_pull") then
		local stat_name = "pack_master_kill_abducting_ally"

		increment_stat(killer_unit, stat_name)
	end
end

QuestSettings.check_pack_master_rescue_hoisted_ally = function (unit)
	local stat_name = "pack_master_rescue_hoisted_ally"

	increment_stat(unit, stat_name)
end

QuestSettings.check_gutter_killed_while_pouncing = function (blackboard, killer_unit, damage_source)
	local master_list_item = rawget(ItemMasterList, damage_source)

	if master_list_item and blackboard.action then
		local slot_type = master_list_item.slot_type

		if slot_type and slot_type == "ranged" and blackboard.action.name == "jump" then
			local stat_name = "gutter_runner_killed_on_pounce"

			increment_stat(killer_unit, stat_name)
		end
	end
end

QuestSettings.check_gutter_runner_push_on_pounce = function (blackboard, pushing_unit)
	local unit = blackboard.unit
	local ai_extension = ScriptUnit.extension(unit, "ai_system")
	local bt_node_name = ai_extension:current_action_name()

	if bt_node_name == "jump" and Unit.alive(pushing_unit) then
		local stat_name = "gutter_runner_push_on_pounce"

		increment_stat(pushing_unit, stat_name)
	end
end

QuestSettings.check_gutter_runner_push_on_target_pounced = function (blackboard, pushing_unit)
	local unit = blackboard.unit
	local ai_extension = ScriptUnit.extension(unit, "ai_system")
	local bt_node_name = ai_extension:current_action_name()

	if bt_node_name == "target_pounced" and Unit.alive(pushing_unit) then
		local stat_name = "gutter_runner_push_on_target_pounced"

		increment_stat(pushing_unit, stat_name)
	end
end

QuestSettings.check_corruptor_killed_at_teleport_time = function (blackboard, teleport_at_t, t, killer_unit)
	local time_diff = t - teleport_at_t

	if time_diff <= QuestSettings.corruptor_killed_at_teleport_time then
		local stat_name = "corruptor_killed_at_teleport_time"

		increment_stat(killer_unit, stat_name)

		blackboard.teleport_at_t = nil
	end
end

QuestSettings.check_corruptor_dodge = function (target_unit)
	local stat_name = "corruptor_dodged_attack"

	increment_stat(target_unit, stat_name)
end

QuestSettings.check_corruptor_killed_while_grabbing = function (blackboard, killer_unit)
	if blackboard.grabbed_unit and not blackboard.has_dealed_damage and Unit.alive(killer_unit) then
		local stat_name = "corruptor_killed_while_grabbing"

		increment_stat(killer_unit, stat_name)
	end
end

QuestSettings.check_vortex_sorcerer_killed_while_summoning = function (blackboard, killer_unit)
	local unit = blackboard.unit
	local ai_extension = ScriptUnit.extension(unit, "ai_system")
	local bt_node_name = ai_extension:current_action_name()

	if bt_node_name == "spawn_vortex" and Unit.alive(killer_unit) then
		local stat_name = "vortex_sorcerer_killed_while_summoning"

		increment_stat(killer_unit, stat_name)
	end
end

QuestSettings.check_vortex_sorcerer_killed_while_ally_in_vortex = function (blackboard, killer_unit)
	local players = Managers.player:players()

	for _, player in pairs(players) do
		local player_unit = player.player_unit
		local status_extension = player_unit and ScriptUnit.extension(player_unit, "status_system")

		if player_unit ~= killer_unit and status_extension and status_extension:is_in_vortex() then
			local stat_name = "vortex_sorcerer_killed_while_ally_in_vortex"

			increment_stat(killer_unit, stat_name)

			break
		end
	end
end

QuestSettings.check_vortex_sorcerer_killed_by_melee = function (killer_unit, damage_source)
	local master_list_item = rawget(ItemMasterList, damage_source)

	if master_list_item then
		local slot_type = master_list_item.slot_type

		if slot_type == "melee" then
			local stat_name = "vortex_sorcerer_killed_by_melee"

			increment_stat(killer_unit, stat_name)
		end
	end
end

QuestSettings.check_ratling_gunner_killed_by_melee = function (killer_unit, damage_source)
	local master_list_item = rawget(ItemMasterList, damage_source)

	if master_list_item then
		local slot_type = master_list_item.slot_type

		if slot_type == "melee" then
			local stat_name = "ratling_gunner_killed_by_melee"

			increment_stat(killer_unit, stat_name)
		end
	end
end

QuestSettings.check_ratling_gunner_killed_while_shooting = function (blackboard, killer_unit)
	local unit = blackboard.unit
	local ai_extension = ScriptUnit.extension(unit, "ai_system")
	local bt_node_name = ai_extension:current_action_name()
	local target_unit = blackboard.attack_pattern_data and blackboard.attack_pattern_data.target_unit

	if target_unit ~= killer_unit and bt_node_name == "shoot_ratling_gun" then
		local stat_name = "ratling_gunner_killed_while_shooting"

		increment_stat(killer_unit, stat_name)
	end
end

QuestSettings.check_ratling_gunner_blocked_shot = function (unit, attacking_unit)
	local blackboard = BLACKBOARDS[attacking_unit]

	if blackboard then
		local is_ratling_gunner = blackboard.breed.name == "skaven_ratling_gunner"

		if is_ratling_gunner then
			blackboard.has_completed_block_challenge_units = blackboard.has_completed_block_challenge_units or {}

			if not blackboard.has_completed_block_challenge_units[unit] then
				local stat_name = "ratling_gunner_blocked_shot"

				increment_stat(unit, stat_name)

				blackboard.has_completed_block_challenge_units[unit] = true
			end
		end
	end
end

QuestSettings.check_chaos_spawn_killed_while_grabbing = function (blackboard, killer_unit)
	local unit = blackboard.unit
	local ai_extension = ScriptUnit.extension(unit, "ai_system")
	local bt_node_name = ai_extension:current_action_name()

	if bt_node_name == "attack_grabbed_chew" or bt_node_name == "attack_grabbed_smash" or bt_node_name == "attack_grabbed_throw" then
		local stat_name = "chaos_spawn_killed_while_grabbing"

		increment_stat(killer_unit, stat_name)
	end
end

QuestSettings.check_chaos_spawn_killed_without_having_grabbed = function (blackboard, killer_unit)
	local has_grabbed = blackboard.has_grabbed

	if not has_grabbed then
		local stat_name = "chaos_spawn_killed_without_having_grabbed"

		increment_stat_on_all(stat_name)

		blackboard.has_grabbed = nil
	end
end

QuestSettings.check_chaos_troll_killed_without_regen = function (blackboard, killer_unit)
	local has_not_regenerated = blackboard.num_regen == 1

	if has_not_regenerated then
		local stat_name = "chaos_troll_killed_without_regen"

		increment_stat_on_all(stat_name)
	end
end

QuestSettings.check_chaos_troll_killed_without_bile_damage = function (blackboard, killer_unit)
	local has_damaged_any_player = blackboard.has_done_bile_damage

	if not has_damaged_any_player then
		local stat_name = "chaos_troll_killed_without_bile_damage"

		increment_stat_on_all(stat_name)
	end
end

QuestSettings.check_rat_ogre_killed_mid_leap = function (blackboard, killer_unit)
	local unit = blackboard.unit
	local ai_extension = ScriptUnit.extension(unit, "ai_system")
	local bt_node_name = ai_extension:current_action_name()

	if bt_node_name == "jump_slam" then
		local stat_name = "rat_ogre_killed_mid_leap"

		increment_stat(killer_unit, stat_name)
	end
end

QuestSettings.check_rat_ogre_killed_without_dealing_damage = function (blackboard, killer_unit)
	local has_dealt_damage = blackboard.has_dealt_damage

	if not has_dealt_damage then
		local stat_name = "rat_ogre_killed_without_dealing_damage"

		increment_stat_on_all(stat_name)
	end
end

QuestSettings.check_stormfiend_killed_without_burn_damage = function (blackboard, killer_unit)
	local has_dealt_burn_damage = blackboard.has_dealt_burn_damage

	if not has_dealt_burn_damage then
		local stat_name = "stormfiend_killed_without_burn_damage"

		increment_stat_on_all(stat_name)
	end
end

QuestSettings.check_stormfiend_killed_on_controller = function (death_hit_zone, killer_unit)
	if death_hit_zone == "weakspot" then
		local stat_name = "stormfiend_killed_on_controller"

		increment_stat(killer_unit, stat_name)
	end
end

QuestSettings.check_killed_lord_as_last_player_standing = function (killer_unit)
	local player = Managers.player:unit_owner(killer_unit)
	local num_alive_allies = Managers.player:num_alive_allies(player)
	local last_man_standing = num_alive_allies == 0

	if last_man_standing then
		local stat_name = "killed_lord_as_last_player_standing"

		increment_stat(killer_unit, stat_name)
	end
end

QuestSettings.track_bastard_block_breeds = {}

QuestSettings.handle_bastard_block = function (target_unit, attacker_unit, blocked)
	local player_breed = Unit.get_data(target_unit, "breed")

	if not player_breed or not QuestSettings.track_bastard_block_breeds[player_breed.name] then
		return false
	end

	local boss_bb = BLACKBOARDS[attacker_unit]

	if not boss_bb then
		return false
	end

	if boss_bb.failed_boss then
		return false
	end

	if not blocked then
		boss_bb.bastard_block = 0
		boss_bb.failed_boss = true

		return false
	end

	local status_extension = ScriptUnit.has_extension(target_unit, "status_system")
	local charge_blocking = status_extension.charge_blocking

	if charge_blocking then
		local bastard_block_count = boss_bb.bastard_block or 0

		boss_bb.bastard_block = bastard_block_count + 1
	end
end

QuestSettings.handle_bastard_block_on_death = function (attacker_breed, attacker_unit, killing_blow, statistics_db)
	if attacker_breed.boss then
		local player_unit = killing_blow[3]
		local boss_bb = BLACKBOARDS[attacker_unit]

		if not boss_bb or not boss_bb.bastard_block then
			return false
		end

		if not player_unit then
			return false
		end

		local player_breed = Unit.get_data(player_unit, "breed")

		if not player_breed or not QuestSettings.track_bastard_block_breeds[player_breed.name] then
			return false
		end

		if boss_bb.bastard_block >= 3 then
			local stat_name = "lake_bastard_block"

			increment_stat(player_unit, stat_name)
		end

		boss_bb.failed_boss = nil
		boss_bb.bastard_block = nil
	end
end

QuestSettings.track_charge_stagger_breeds = {}

QuestSettings.handle_charge_stagger = function (unit, blackboard, attacker_unit)
	local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

	if not career_extension then
		return
	end

	local career_name = career_extension:career_name()

	if not QuestSettings.track_charge_stagger_breeds[career_name] then
		return
	end

	local health_extension = ScriptUnit.has_extension(unit, "health_system")
	local recent_damage_type = health_extension:recent_damage_source()
	local damage_type = career_extension:career_skill_weapon_name(nil)

	if recent_damage_type == damage_type then
		local current_action = blackboard.action

		if current_action and current_action.name == "charge" then
			local t = Managers.time:time("game")
			local attack_started_t = blackboard.attack_started_at_t

			if attack_started_t and t - attack_started_t > 2 then
				local stat_name = "lake_charge_stagger"

				increment_stat(attacker_unit, stat_name)
			end
		end
	end
end
