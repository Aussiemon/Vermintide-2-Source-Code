-- chunkname: @scripts/managers/talents/talent_settings_sienna.lua

require("scripts/settings/profiles/career_constants")

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local buff_tweak_data = {
	sienna_scholar_ability_cooldown_on_hit = {
		bonus = 0.25,
	},
	sienna_scholar_ability_cooldown_on_damage_taken = {
		bonus = 0.3,
	},
	sienna_scholar_passive = {
		chunk_size = 6,
	},
	sienna_scholar_passive_crit_chance = {
		bonus = 0.06,
		max_stacks = 5,
	},
	sienna_scholar_passive_ranged_damage = {
		multiplier = 0.1,
	},
	sienna_scholar_activated_ability_heal = {
		bonus = 35,
	},
	sienna_scholar_reaper = {},
	sienna_scholar_bloodlust = {},
	sienna_scholar_conqueror = {},
	sienna_scholar_ranged_power_ascending_descending = {
		max_sub_buff_stacks = 20,
		update_frequency = 1,
	},
	sienna_scholar_ranged_power_ascending_descending_buff = {
		max_stacks = 20,
		multiplier = 0.01,
	},
	sienna_scholar_crit_chance_above_health_threshold = {
		activation_health = 0.8,
	},
	sienna_scholar_crit_chance_above_health_threshold_buff = {
		bonus = 0.1,
	},
	sienna_scholar_increased_attack_speed = {
		multiplier = 0.05,
	},
	sienna_scholar_passive_increased_attack_speed_from_overcharge = {
		chunk_size = 6,
	},
	sienna_scholar_passive_increased_attack_speed = {
		max_stacks = 5,
		multiplier = 0.02,
	},
	sienna_scholar_passive_increased_power_level_on_high_overcharge = {
		chunk_size = 30,
	},
	sienna_scholar_passive_increased_power_level_on_high_overcharge_buff = {
		multiplier = 0.15,
	},
	sienna_scholar_passive_overcharge_pause_on_special_kill_buff = {
		duration = 10,
		multiplier = -1,
	},
	sienna_scholar_damage_taken_on_elite_or_special_kill_buff = {
		duration = 10,
		max_stacks = 3,
		multiplier = -0.1,
	},
	sienna_scholar_move_speed_on_critical_hit_buff = {
		duration = 10,
		max_stacks = 3,
		multiplier = 1.05,
	},
	sienna_adept_ability_cooldown_on_hit = {
		bonus = 0.25,
	},
	sienna_adept_ability_cooldown_on_damage_taken = {
		bonus = 0.5,
	},
	sienna_adept_passive = {
		duration = 6,
	},
	sienna_adept_passive_ranged_damage = {
		multiplier = 0.1,
	},
	sienna_adept_passive_overcharge_charge_speed_increased = {
		chunk_size = 6,
	},
	sienna_adept_passive_overcharge_charge_speed_increased_buff = {
		multiplier = -0.1,
	},
	tranquility = {
		multiplier = 3,
	},
	sienna_adept_activated_ability = {
		duration = 0.4,
	},
	sienna_adept_vanguard = {},
	sienna_adept_bloodlust = {},
	sienna_adept_conqueror = {},
	sienna_adept_power_level_on_full_charge = {
		multiplier = 0.5,
	},
	sienna_adept_attack_speed_on_enemies_hit = {
		required_targets = 4,
	},
	sienna_adept_attack_speed_on_enemies_hit_buff = {
		duration = 5,
		multiplier = 0.15,
	},
	sienna_adept_improved_tranquility = {
		multiplier = 1,
	},
	sienna_adept_passive_cooldown = {
		duration = 3,
	},
	sienna_adept_passive_charge_speed_increased_buff = {
		multiplier = -0.4,
	},
	sienna_adept_damage_reduction_on_ignited_enemy_buff = {
		duration = 5,
		max_stacks = 3,
		multiplier = -0.1,
	},
	sienna_adept_cooldown_reduction_on_burning_enemy_killed = {
		cooldown_reduction = 0.03,
		internal_cooldown = 0.5,
	},
	sienna_adept_increased_burn_damage = {
		multiplier = 1.5,
	},
	sienna_adept_reduced_non_burn_damage = {
		multiplier = -0.3,
	},
	sienna_adept_ability_trail_double = {
		duration = 10,
	},
	sienna_adept_activated_ability_distance = {
		display_multiplier = 0.5,
	},
	sienna_adept_activated_ability_cooldown = {
		multiplier = -0.3,
	},
	sienna_unchained_ability_cooldown_on_hit = {
		bonus = 0.25,
	},
	sienna_unchained_ability_cooldown_on_damage_taken = {
		bonus = 0.5,
	},
	sienna_unchained_passive = {
		multiplier = -0.5,
	},
	sienna_unchained_passive_increased_melee_power_on_overcharge = {
		chunk_size = 6,
	},
	sienna_unchained_passive_melee_power_on_overcharge = {
		max_stacks = 5,
		multiplier = 0.12,
	},
	sienna_unchained_activated_ability = {
		duration = 2,
	},
	sienna_unchained_push_arc_buff = {
		multiplier = 0.7,
	},
	sienna_unchained_vanguard = {},
	sienna_unchained_reaper = {},
	sienna_unchained_conqueror = {},
	sienna_unchained_attack_speed_on_high_overcharge_buff = {
		multiplier = 0.15,
	},
	sienna_unchained_exploding_burning_enemies = {
		display_proc_chance = 0.25,
	},
	sienna_unchained_passive_overcharged_blocks = {
		multiplier = 0.5,
	},
	sienna_unchained_reduced_vent_damage = {
		multiplier = -0.5,
	},
	sienna_unchained_increased_vent_speed = {
		multiplier = 0.3,
	},
	sienna_unchained_reduced_damage_taken_after_venting_buff = {
		duration = 15,
		max_stacks = 3,
		multiplier = -0.05,
	},
	sienna_unchained_reduced_passive_overcharge_after_venting_buff = {
		duration = 15,
		max_stacks = 3,
		multiplier = -0.166,
	},
	sienna_unchained_burning_enemies_reduced_damage = {
		multiplier = -0.3,
	},
	sienna_unchained_reduced_overcharge = {
		multiplier = -0.1,
	},
	sienna_unchained_activated_ability_pulse = {
		duration = 10,
	},
	sienna_unchained_activated_ability_temp_health = {
		display_bonus = 30,
	},
	sienna_unchained_activated_ability_power_on_enemies_hit_buff = {
		duration = 15,
		max_stacks = 5,
		multiplier = 0.05,
	},
}

TalentBuffTemplates = TalentBuffTemplates or {}
TalentBuffTemplates.bright_wizard = {
	sienna_scholar_ability_cooldown_on_hit = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown",
				event = "on_hit",
			},
		},
	},
	sienna_scholar_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	sienna_scholar_passive = {
		buffs = {
			{
				buff_to_add = "sienna_scholar_passive_crit_chance",
				max_stacks = 5,
				update_func = "activate_buff_stacks_based_on_overcharge_chunks",
			},
		},
	},
	sienna_scholar_passive_crit_chance = {
		buffs = {
			{
				icon = "sienna_scholar_passive",
				max_stacks = 10,
				stat_buff = "critical_strike_chance",
			},
		},
	},
	sienna_scholar_passive_ranged_damage = {
		buffs = {
			{
				stat_buff = "increased_weapon_damage_ranged",
			},
		},
	},
	sienna_scholar_reaper = {
		buffs = {
			{
				bonus = 0.25,
				buff_func = "heal_damage_targets_on_melee",
				event = "on_player_damage_dealt",
				max_targets = 5,
				multiplier = -0.05,
				name = "reaper",
				perks = {
					buff_perks.linesman_healing,
				},
			},
		},
	},
	sienna_scholar_bloodlust = {
		buffs = {
			{
				buff_func = "heal_percentage_of_enemy_hp_on_melee_kill",
				event = "on_kill",
				heal_cap = 0.25,
				multiplier = 0.45,
				name = "bloodlust",
				perks = {
					buff_perks.smiter_healing,
				},
			},
		},
	},
	sienna_scholar_conqueror = {
		buffs = {
			{
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable",
				multiplier = 0.2,
				name = "conqueror",
				range = 10,
			},
		},
	},
	sienna_scholar_ranged_power_ascending_descending = {
		buffs = {
			{
				buff_to_add = "sienna_scholar_ranged_power_ascending_descending_buff",
				update_func = "update_ascending_descending_buff_stacks_on_time",
			},
		},
	},
	sienna_scholar_ranged_power_ascending_descending_buff = {
		buffs = {
			{
				icon = "sienna_scholar_ranged_power_ascending_descending",
				max_stacks = 20,
				stat_buff = "power_level_ranged",
			},
		},
	},
	sienna_scholar_crit_chance_above_health_threshold = {
		buffs = {
			{
				activation_health = 0.8,
				buff_to_add = "sienna_scholar_crit_chance_above_health_threshold_buff",
				update_func = "activate_buff_on_health_percent",
			},
		},
	},
	sienna_scholar_crit_chance_above_health_threshold_buff = {
		buffs = {
			{
				icon = "sienna_scholar_crit_chance_above_health_threshold",
				max_stacks = 1,
				stat_buff = "critical_strike_chance",
			},
		},
	},
	sienna_scholar_increased_attack_speed = {
		buffs = {
			{
				stat_buff = "attack_speed",
			},
		},
	},
	sienna_scholar_passive_increased_attack_speed_from_overcharge = {
		buffs = {
			{
				buff_to_add = "sienna_scholar_passive_increased_attack_speed",
				max_stacks = 5,
				update_func = "activate_buff_stacks_based_on_overcharge_chunks",
			},
		},
	},
	sienna_scholar_passive_increased_attack_speed = {
		buffs = {
			{
				icon = "sienna_scholar_passive_increased_attack_speed_from_overcharge",
				stat_buff = "attack_speed",
			},
		},
	},
	sienna_scholar_passive_increased_power_level_on_high_overcharge = {
		buffs = {
			{
				buff_to_add = "sienna_scholar_passive_increased_power_level_on_high_overcharge_buff",
				update_func = "activate_server_buff_stacks_based_on_overcharge_chunks",
			},
		},
	},
	sienna_scholar_passive_increased_power_level_on_high_overcharge_buff = {
		buffs = {
			{
				icon = "sienna_scholar_passive_increased_power_level_on_high_overcharge",
				stat_buff = "power_level_ranged",
			},
		},
	},
	sienna_scholar_passive_overcharge_pause_on_special_kill = {
		buffs = {
			{
				buff_func = "add_buff_on_special_kill",
				buff_to_add = "sienna_scholar_passive_overcharge_pause_on_special_kill_buff",
				event = "on_kill",
			},
		},
	},
	sienna_scholar_passive_overcharge_pause_on_special_kill_buff = {
		buffs = {
			{
				icon = "sienna_scholar_passive_overcharge_pause_on_special_kill",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "reduced_overcharge",
			},
		},
	},
	sienna_scholar_damage_taken_on_elite_or_special_kill = {
		buffs = {
			{
				buff_func = "add_buff_on_elite_or_special_kill",
				buff_to_add = "sienna_scholar_damage_taken_on_elite_or_special_kill_buff",
				event = "on_kill",
			},
		},
	},
	sienna_scholar_damage_taken_on_elite_or_special_kill_buff = {
		buffs = {
			{
				icon = "sienna_scholar_damage_taken_on_elite_or_special_kill",
				refresh_durations = true,
				stat_buff = "damage_taken",
			},
		},
	},
	sienna_scholar_move_speed_on_critical_hit = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "sienna_scholar_move_speed_on_critical_hit_buff",
				event = "on_critical_hit",
			},
		},
	},
	sienna_scholar_move_speed_on_critical_hit_buff = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				icon = "sienna_scholar_move_speed_on_critical_hit",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
	sienna_scholar_overcharge_no_slow = {
		buffs = {
			{
				perks = {
					buff_perks.overcharge_no_slow,
				},
			},
		},
	},
	sienna_scholar_activated_ability_crit_refresh_cooldown = {
		buffs = {
			{
				buff_func = "sienna_scholar_refund_activated_ability_cooldown",
				event = "on_hit",
			},
		},
	},
	sienna_adept_ability_cooldown_on_hit = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown",
				event = "on_hit",
			},
		},
	},
	sienna_adept_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	sienna_adept_passive = {
		buffs = {
			{
				buff_to_add = "tranquility",
				duration_end_func = "add_buff_local",
				icon = "sienna_adept_passive",
				is_cooldown = true,
				max_stacks = 1,
				refresh_durations = true,
			},
		},
	},
	sienna_adept_passive_cooldown = {
		buffs = {
			{
				buff_to_add = "tranquility",
				duration_end_func = "add_buff_local",
				icon = "sienna_adept_passive",
				is_cooldown = true,
				max_stacks = 1,
				refresh_durations = true,
			},
		},
	},
	sienna_adept_passive_ranged_damage = {
		buffs = {
			{
				stat_buff = "increased_weapon_damage_ranged",
			},
		},
	},
	sienna_adept_passive_overcharge_charge_speed_increased = {
		buffs = {
			{
				buff_to_add = "sienna_adept_passive_overcharge_charge_speed_increased_buff",
				max_stacks = 5,
				update_func = "activate_buff_stacks_based_on_overcharge_chunks",
			},
		},
	},
	sienna_adept_passive_overcharge_charge_speed_increased_buff = {
		buffs = {
			{
				icon = "sienna_scholar_activated_ability_dump_overcharge",
				max_stacks = 3,
				stat_buff = "reduced_ranged_charge_time",
			},
		},
	},
	sienna_adept_passive_reset_on_damage_taken = {
		buffs = {
			{
				buff_func = "reset_tranquility",
				event = "on_damage_taken",
			},
		},
	},
	sienna_adept_passive_reset_on_spell_used = {
		buffs = {
			{
				buff_func = "reset_tranquility",
				event = "on_spell_used",
			},
		},
	},
	tranquility = {
		buffs = {
			{
				icon = "sienna_adept_passive",
				max_stacks = 1,
				priority_buff = true,
				stat_buff = "overcharge_regen",
			},
		},
	},
	sienna_adept_activated_ability = {
		buffs = {
			{
				remove_buff_func = "end_sienna_adept_activated_ability",
			},
		},
	},
	sienna_adept_vanguard = {
		buffs = {
			{
				buff_func = "heal_stagger_targets_on_melee",
				event = "on_stagger",
				multiplier = 1,
				name = "vanguard",
				perks = {
					buff_perks.tank_healing,
				},
			},
		},
	},
	sienna_adept_bloodlust = {
		buffs = {
			{
				buff_func = "heal_percentage_of_enemy_hp_on_melee_kill",
				event = "on_kill",
				heal_cap = 0.25,
				multiplier = 0.45,
				name = "bloodlust",
				perks = {
					buff_perks.smiter_healing,
				},
			},
		},
	},
	sienna_adept_conqueror = {
		buffs = {
			{
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable",
				multiplier = 0.2,
				name = "conqueror",
				range = 10,
			},
		},
	},
	sienna_adept_power_level_on_full_charge = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "sienna_adept_power_level_on_full_charge_buff",
				event = "on_full_charge",
				stat_buff = "full_charge_boost",
				perks = {
					buff_perks.full_charge_boost,
				},
			},
		},
	},
	sienna_adept_power_level_on_full_charge_buff = {
		buffs = {
			{
				buff_func = "dummy_function",
				event = "on_charge_finished",
				icon = "sienna_adept_power_level_on_full_charge",
				max_stacks = 1,
				priority_buff = true,
				remove_on_proc = true,
			},
		},
	},
	sienna_adept_attack_speed_on_enemies_hit = {
		buffs = {
			{
				buff_func = "sienna_adept_add_attack_speed_buff_on_enemies_hit",
				buff_to_add = "sienna_adept_attack_speed_on_enemies_hit_buff",
				event = "on_hit",
			},
		},
	},
	sienna_adept_attack_speed_on_enemies_hit_buff = {
		buffs = {
			{
				icon = "sienna_adept_attack_speed_on_enemies_hit",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
		},
	},
	sienna_adept_passive_improved = {
		buffs = {
			{
				activation_buff = "tranquility",
				buff_to_add = "sienna_adept_improved_tranquility",
				update_func = "activate_buff_on_other_buff",
			},
		},
	},
	sienna_adept_improved_tranquility = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "overcharge_regen",
			},
		},
	},
	sienna_adept_passive_charge_speed_increased = {
		buffs = {
			{
				activation_buff = "tranquility",
				buff_to_add = "sienna_adept_passive_charge_speed_increased_buff",
				update_func = "activate_buff_on_other_buff",
			},
		},
	},
	sienna_adept_passive_charge_speed_increased_buff = {
		buffs = {
			{
				icon = "sienna_adept_passive_charge_speed_increased",
				max_stacks = 1,
				stat_buff = "reduced_ranged_charge_time",
			},
		},
	},
	sienna_adept_damage_reduction_on_ignited_enemy = {
		buffs = {
			{
				buff_func = "sienna_adept_add_damage_reduction_buff_on_ignited_enemy",
				buff_to_add = "sienna_adept_damage_reduction_on_ignited_enemy_buff",
				event = "on_enemy_ignited",
				require_alive_enemy = true,
			},
		},
	},
	sienna_adept_damage_reduction_on_ignited_enemy_buff = {
		buffs = {
			{
				icon = "sienna_adept_damage_reduction_on_ignited_enemy",
				refresh_durations = true,
				stat_buff = "damage_taken",
			},
		},
	},
	sienna_adept_cooldown_reduction_on_burning_enemy_killed = {
		buffs = {
			{
				buff_func = "sienna_adept_reduce_activated_ability_cooldown_on_burning_enemy_killed",
				event = "on_kill",
			},
		},
	},
	sienna_adept_increased_burn_damage = {
		buffs = {
			{
				stat_buff = "increased_burn_dot_damage",
			},
		},
	},
	sienna_adept_reduced_non_burn_damage = {
		buffs = {
			{
				stat_buff = "reduced_non_burn_damage",
			},
		},
	},
	sienna_adept_ability_trail_double = {
		buffs = {
			{
				buff_to_add = "sienna_adept_ability_trail_double_remove",
				icon = "sienna_adept_activated_ability_dump_overcharge",
				max_stacks = 1,
				remove_buff_func = "sienna_adept_double_trail_talent_start_ability_cooldown_add",
				perks = {
					buff_perks.free_ability,
				},
			},
		},
	},
	sienna_adept_ability_trail_double_remove = {
		buffs = {
			{
				duration = 0,
				max_stacks = 1,
				remove_buff_func = "sienna_adept_double_trail_talent_start_ability_cooldown",
			},
		},
	},
	sienna_adept_activated_ability_cooldown = {
		buffs = {
			{
				stat_buff = "activated_cooldown",
			},
		},
	},
	sienna_unchained_ability_cooldown_on_hit = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown",
				event = "on_hit",
			},
		},
	},
	sienna_unchained_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	sienna_unchained_passive = {
		buffs = {
			{
				stat_buff = "damage_taken_to_overcharge",
				perks = {
					buff_perks.sienna_unchained,
				},
			},
		},
	},
	sienna_unchained_passive_overcharged_blocks = {
		buffs = {
			{
				perks = {
					buff_perks.overcharged_block,
				},
			},
		},
	},
	sienna_unchained_passive_increased_melee_power_on_overcharge = {
		buffs = {
			{
				buff_to_add = "sienna_unchained_passive_melee_power_on_overcharge",
				update_func = "activate_server_buff_stacks_based_on_overcharge_chunks",
			},
		},
	},
	sienna_unchained_passive_melee_power_on_overcharge = {
		buffs = {
			{
				icon = "sienna_unchained_passive",
				stat_buff = "power_level_melee",
			},
		},
	},
	sienna_unchained_activated_ability = {
		buffs = {
			{
				apply_buff_func = "enter_sienna_unchained_activated_ability",
				remove_buff_func = "end_sienna_unchained_activated_ability",
			},
		},
	},
	sienna_unchained_vanguard = {
		buffs = {
			{
				buff_func = "heal_stagger_targets_on_melee",
				event = "on_stagger",
				multiplier = 1,
				name = "vanguard",
				perks = {
					buff_perks.tank_healing,
				},
			},
		},
	},
	sienna_unchained_reaper = {
		buffs = {
			{
				bonus = 0.25,
				buff_func = "heal_damage_targets_on_melee",
				event = "on_player_damage_dealt",
				max_targets = 5,
				multiplier = -0.05,
				name = "reaper",
				perks = {
					buff_perks.linesman_healing,
				},
			},
		},
	},
	sienna_unchained_conqueror = {
		buffs = {
			{
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable",
				multiplier = 0.2,
				name = "conqueror",
				range = 10,
			},
		},
	},
	sienna_unchained_attack_speed_on_high_overcharge = {
		buffs = {
			{
				buff_to_add = "sienna_unchained_attack_speed_on_high_overcharge_buff",
				chunk_size = 20,
				max_stacks = 1,
				update_func = "activate_buff_stacks_based_on_overcharge_chunks",
			},
		},
	},
	sienna_unchained_attack_speed_on_high_overcharge_buff = {
		buffs = {
			{
				icon = "sienna_unchained_attack_speed_on_high_overcharge",
				max_stacks = 1,
				stat_buff = "attack_speed",
			},
		},
	},
	sienna_unchained_burn_push = {
		buffs = {
			{
				buff_func = "sienna_burn_push_on_charged_attacks",
				buff_to_add = "sienna_unchained_push_arc_buff",
				event = "on_hit",
				perks = {
					buff_perks.sienna_unchained_burn_push,
				},
			},
		},
	},
	sienna_unchained_push_arc_buff = {
		buffs = {
			{
				buff_func = "sienna_burn_push_on_charged_attacks_remove",
				event = "on_push",
				icon = "sienna_unchained_burn_push",
				max_stacks = 1,
				stat_buff = "block_angle",
			},
		},
	},
	sienna_unchained_exploding_burning_enemies = {
		buffs = {
			{
				buff_func = "sienna_on_kill_explosion",
				event = "on_kill",
				proc_chance = 0.4,
			},
		},
	},
	sienna_unchained_reduced_vent_damage = {
		buffs = {
			{
				stat_buff = "vent_damage",
			},
		},
	},
	sienna_unchained_increased_vent_speed = {
		buffs = {
			{
				stat_buff = "vent_speed",
			},
		},
	},
	sienna_unchained_reduced_damage_taken_after_venting = {
		buffs = {
			{
				buff_func = "sienna_unchained_add_buff_on_vent_damage",
				event = "on_damage_taken",
				buffs_to_add = {
					"sienna_unchained_reduced_damage_taken_after_venting_buff",
					"sienna_unchained_reduced_passive_overcharge_after_venting_buff",
				},
			},
		},
	},
	sienna_unchained_reduced_damage_taken_after_venting_buff = {
		buffs = {
			{
				icon = "sienna_unchained_reduced_damage_taken_after_venting",
				refresh_durations = true,
				stat_buff = "damage_taken",
			},
		},
	},
	sienna_unchained_reduced_passive_overcharge_after_venting_buff = {
		buffs = {
			{
				refresh_durations = true,
				stat_buff = "reduced_overcharge_from_passive",
			},
		},
	},
	sienna_unchained_burning_enemies_reduced_damage = {
		buffs = {
			{
				stat_buff = "damage_taken_burning_enemy",
			},
		},
	},
	sienna_unchained_health_to_ult = {
		buffs = {
			{
				buff_to_add = "sienna_unchained_health_to_cooldown_buff",
				chunk_size = 40,
				max_stacks = 1,
				update_func = "activate_buff_stacks_based_on_overcharge_chunks",
			},
		},
	},
	sienna_unchained_health_to_cooldown_buff = {
		buffs = {
			{
				frequency = 0.5,
				icon = "sienna_unchained_attack_speed_on_high_overcharge",
				update_func = "sienna_unchained_health_to_cooldown_update",
			},
		},
	},
	sienna_unchained_reduced_overcharge = {
		buffs = {
			{
				stat_buff = "reduced_overcharge",
			},
		},
	},
	sienna_unchained_activated_ability_pulse = {
		buffs = {
			{
				icon = "sienna_unchained_activated_ability_power_on_enemies_hit",
				max_stacks = 1,
				pulse_frequency = 0.5,
				refresh_durations = true,
				remove_buff_func = "sienna_unchained_activated_ability_pulse_remove",
				update_func = "sienna_unchained_activated_ability_pulse_update",
			},
		},
	},
	sienna_unchained_activated_ability_power_on_enemies_hit = {
		buffs = {
			{
				buff_func = "sienna_unchained_activated_ability_power_on_enemies_hit",
				buff_to_add = "sienna_unchained_activated_ability_power_on_enemies_hit_buff",
				event = "on_hit",
				max_stacks = 1,
			},
		},
	},
	sienna_unchained_activated_ability_power_on_enemies_hit_buff = {
		buffs = {
			{
				icon = "sienna_unchained_activated_ability_radius",
				refresh_durations = true,
				stat_buff = "power_level",
			},
		},
	},
}
TalentTrees = TalentTrees or {}
TalentTrees.bright_wizard = {
	{
		{
			"sienna_scholar_reaper",
			"sienna_scholar_bloodlust_2",
			"sienna_scholar_heal_share",
		},
		{
			"sienna_scholar_ranged_power_ascending_descending",
			"sienna_scholar_increased_attack_speed",
			"sienna_scholar_crit_chance_above_health_threshold",
		},
		{
			"sienna_scholar_smiter_unbalance",
			"sienna_scholar_linesman_unbalance",
			"sienna_scholar_power_level_unbalance",
		},
		{
			"sienna_scholar_passive_overcharge_pause_on_special_kill",
			"sienna_scholar_passive_increased_power_level_on_high_overcharge",
			"sienna_scholar_passive_increased_attack_speed_from_overcharge",
		},
		{
			"sienna_scholar_damage_taken_on_elite_or_special_kill",
			"sienna_scholar_overcharge_no_slow",
			"sienna_scholar_move_speed_on_critical_hit",
		},
		{
			"sienna_scholar_activated_ability_dump_overcharge",
			"sienna_scholar_activated_ability_heal",
			"sienna_scholar_activated_ability_crit_refresh_cooldown",
		},
	},
	{
		{
			"sienna_adept_vanguard",
			"sienna_adept_bloodlust_2",
			"sienna_adept_heal_share",
		},
		{
			"sienna_adept_power_level_on_full_charge",
			"sienna_adept_increased_burn_damage_reduced_non_burn_damage",
			"sienna_adept_infinite_burn",
		},
		{
			"sienna_adept_tank_unbalance",
			"sienna_adept_smiter_unbalance",
			"sienna_adept_power_level_unbalance",
		},
		{
			"sienna_adept_passive_cooldown",
			"sienna_adept_passive_charge_speed_increased",
			"sienna_adept_passive_improved",
		},
		{
			"sienna_adept_damage_reduction_on_ignited_enemy",
			"sienna_adept_cooldown_reduction_on_burning_enemy_killed",
			"sienna_adept_attack_speed_on_enemies_hit",
		},
		{
			"sienna_adept_activated_ability_cooldown",
			"sienna_adept_activated_ability_explosion",
			"sienna_adept_ability_trail_double",
		},
	},
	{
		{
			"sienna_unchained_vanguard",
			"sienna_unchained_reaper",
			"sienna_unchained_heal_share",
		},
		{
			"sienna_unchained_attack_speed_on_high_overcharge",
			"sienna_unchained_burn_push_2",
			"sienna_unchained_exploding_burning_enemies",
		},
		{
			"sienna_unchained_tank_unbalance",
			"sienna_unchained_linesman_unbalance",
			"sienna_unchained_power_level_unbalance",
		},
		{
			"sienna_unchained_overcharged_blocks",
			"sienna_unchained_increased_vent_speed",
			"sienna_unchained_reduced_damage_taken_after_venting_2",
		},
		{
			"sienna_unchained_burning_enemies_reduced_damage",
			"sienna_unchained_health_to_ult",
			"sienna_unchained_reduced_overcharge",
		},
		{
			"sienna_unchained_activated_ability_power_on_enemies_hit",
			"sienna_unchained_activated_ability_fire_aura",
			"sienna_unchained_activated_ability_temp_health",
		},
	},
}
Talents.bright_wizard = {
	{
		buffer = "server",
		description = "reaper_desc",
		icon = "sienna_scholar_regrowth",
		name = "sienna_scholar_reaper",
		num_ranks = 1,
		description_values = {
			{
				value = BuffTemplates.reaper.buffs[1].max_targets,
			},
		},
		buffs = {
			"sienna_scholar_reaper",
		},
	},
	{
		buffer = "server",
		description = "bloodlust_desc_3",
		icon = "sienna_scholar_bloodlust",
		name = "sienna_scholar_bloodlust_2",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.bloodlust.buffs[1].multiplier,
			},
		},
		buffs = {
			"sienna_scholar_bloodlust",
		},
	},
	{
		buffer = "server",
		description = "conqueror_desc_3",
		icon = "sienna_scholar_conqueror",
		name = "sienna_scholar_heal_share",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier,
			},
		},
		buffs = {
			"sienna_scholar_conqueror",
		},
	},
	{
		description = "sienna_scholar_increased_attack_speed_desc",
		icon = "sienna_scholar_increased_attack_speed",
		name = "sienna_scholar_increased_attack_speed",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_scholar_increased_attack_speed.multiplier,
			},
		},
		buffs = {
			"sienna_scholar_increased_attack_speed",
		},
	},
	{
		buffer = "server",
		description = "sienna_scholar_crit_chance_above_health_threshold_desc",
		icon = "sienna_scholar_crit_chance_above_health_threshold",
		name = "sienna_scholar_crit_chance_above_health_threshold",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_scholar_crit_chance_above_health_threshold_buff.bonus,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_scholar_crit_chance_above_health_threshold.activation_health,
			},
		},
		buffs = {
			"sienna_scholar_crit_chance_above_health_threshold",
		},
	},
	{
		buffer = "server",
		description = "sienna_scholar_ranged_power_ascending_descending_desc",
		icon = "sienna_scholar_ranged_power_ascending_descending",
		name = "sienna_scholar_ranged_power_ascending_descending",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_scholar_ranged_power_ascending_descending_buff.multiplier,
			},
			{
				value = buff_tweak_data.sienna_scholar_ranged_power_ascending_descending.update_frequency,
			},
			{
				value = buff_tweak_data.sienna_scholar_ranged_power_ascending_descending.max_sub_buff_stacks,
			},
		},
		buffs = {
			"sienna_scholar_ranged_power_ascending_descending",
		},
	},
	{
		description = "sienna_scholar_passive_increased_attack_speed_from_overcharge_desc",
		icon = "sienna_scholar_passive_increased_attack_speed_from_overcharge",
		name = "sienna_scholar_passive_increased_attack_speed_from_overcharge",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_scholar_passive_increased_attack_speed.multiplier,
			},
			{
				value = buff_tweak_data.sienna_scholar_passive_increased_attack_speed_from_overcharge.chunk_size,
			},
			{
				value = buff_tweak_data.sienna_scholar_passive_increased_attack_speed.max_stacks,
			},
		},
		buffs = {
			"sienna_scholar_passive_increased_attack_speed_from_overcharge",
		},
	},
	{
		buffer = "server",
		description = "sienna_scholar_passive_increased_power_level_on_high_overcharge_desc",
		icon = "sienna_scholar_passive_increased_power_level_on_high_overcharge",
		name = "sienna_scholar_passive_increased_power_level_on_high_overcharge",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_scholar_passive_increased_power_level_on_high_overcharge_buff.multiplier,
			},
		},
		buffs = {
			"sienna_scholar_passive_increased_power_level_on_high_overcharge",
		},
	},
	{
		description = "sienna_scholar_passive_overcharge_pause_on_special_kill_desc",
		icon = "sienna_scholar_passive_overcharge_pause_on_special_kill",
		name = "sienna_scholar_passive_overcharge_pause_on_special_kill",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.sienna_scholar_passive_overcharge_pause_on_special_kill_buff.duration,
			},
		},
		buffs = {
			"sienna_scholar_passive_overcharge_pause_on_special_kill",
		},
	},
	{
		buffer = "server",
		description = "sienna_scholar_damage_taken_on_elite_or_special_kill_desc",
		icon = "sienna_scholar_damage_taken_on_elite_or_special_kill",
		name = "sienna_scholar_damage_taken_on_elite_or_special_kill",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_scholar_damage_taken_on_elite_or_special_kill_buff.multiplier,
			},
			{
				value = buff_tweak_data.sienna_scholar_damage_taken_on_elite_or_special_kill_buff.duration,
			},
		},
		buffs = {
			"sienna_scholar_damage_taken_on_elite_or_special_kill",
		},
	},
	{
		description = "sienna_scholar_overcharge_no_slow_desc",
		icon = "sienna_scholar_overcharge_no_slow",
		name = "sienna_scholar_overcharge_no_slow",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"sienna_scholar_overcharge_no_slow",
		},
	},
	{
		description = "sienna_scholar_move_speed_on_critical_hit_desc",
		icon = "sienna_scholar_move_speed_on_critical_hit",
		name = "sienna_scholar_move_speed_on_critical_hit",
		num_ranks = 1,
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.sienna_scholar_move_speed_on_critical_hit_buff.multiplier,
			},
			{
				value = buff_tweak_data.sienna_scholar_move_speed_on_critical_hit_buff.duration,
			},
			{
				value = buff_tweak_data.sienna_scholar_move_speed_on_critical_hit_buff.max_stacks,
			},
		},
		buffs = {
			"sienna_scholar_move_speed_on_critical_hit",
		},
	},
	{
		description = "sienna_scholar_activated_ability_dump_overcharge_desc",
		icon = "sienna_scholar_activated_ability_dump_overcharge",
		name = "sienna_scholar_activated_ability_dump_overcharge",
		num_ranks = 1,
		buffs = {},
	},
	{
		description = "sienna_scholar_activated_ability_heal_desc",
		icon = "sienna_scholar_activated_ability_heal",
		name = "sienna_scholar_activated_ability_heal",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.sienna_scholar_activated_ability_heal.bonus,
			},
		},
		buffs = {},
	},
	{
		description = "sienna_scholar_activated_ability_crit_refresh_cooldown_desc",
		icon = "sienna_scholar_activated_ability_crit_refresh_cooldown",
		name = "sienna_scholar_activated_ability_crit_refresh_cooldown",
		num_ranks = 1,
		buffs = {
			"sienna_scholar_activated_ability_crit_refresh_cooldown",
		},
	},
	{
		buffer = "server",
		description = "smiter_unbalance_desc",
		icon = "sienna_scholar_smiter_unbalance",
		name = "sienna_scholar_smiter_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.smiter_unbalance.buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffTemplates.smiter_unbalance.buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"smiter_unbalance",
		},
	},
	{
		buffer = "server",
		description = "linesman_unbalance_desc",
		icon = "sienna_scholar_linesman_unbalance",
		name = "sienna_scholar_linesman_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.linesman_unbalance.buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffTemplates.linesman_unbalance.buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"linesman_unbalance",
		},
	},
	{
		buffer = "server",
		description = "power_level_unbalance_desc",
		icon = "sienna_scholar_power_level_unbalance",
		name = "sienna_scholar_power_level_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.power_level_unbalance.buffs[1].multiplier,
			},
		},
		buffs = {
			"power_level_unbalance",
		},
	},
	{
		buffer = "server",
		description = "vanguard_desc",
		icon = "sienna_adept_regrowth",
		name = "sienna_adept_vanguard",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"sienna_adept_vanguard",
		},
	},
	{
		buffer = "server",
		description = "bloodlust_desc_3",
		icon = "sienna_adept_bloodlust",
		name = "sienna_adept_bloodlust_2",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.bloodlust.buffs[1].multiplier,
			},
		},
		buffs = {
			"sienna_adept_bloodlust",
		},
	},
	{
		buffer = "server",
		description = "conqueror_desc_3",
		icon = "sienna_adept_conqueror",
		name = "sienna_adept_heal_share",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier,
			},
		},
		buffs = {
			"sienna_adept_conqueror",
		},
	},
	{
		description = "sienna_adept_infinite_burn_desc",
		icon = "sienna_adept_stun_resistance",
		name = "sienna_adept_infinite_burn",
		num_ranks = 1,
		description_values = {},
		buffs = {},
	},
	{
		description = "sienna_adept_power_level_on_full_charge_desc",
		icon = "sienna_adept_power_level_on_full_charge",
		name = "sienna_adept_power_level_on_full_charge",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_adept_power_level_on_full_charge.multiplier,
			},
		},
		buffs = {
			"sienna_adept_power_level_on_full_charge",
		},
	},
	{
		description = "sienna_adept_attack_speed_on_enemies_hit_desc",
		icon = "sienna_adept_attack_speed_on_enemies_hit",
		name = "sienna_adept_attack_speed_on_enemies_hit",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.sienna_adept_attack_speed_on_enemies_hit.required_targets,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_adept_attack_speed_on_enemies_hit_buff.multiplier,
			},
			{
				value = buff_tweak_data.sienna_adept_attack_speed_on_enemies_hit_buff.duration,
			},
		},
		buffs = {
			"sienna_adept_attack_speed_on_enemies_hit",
		},
	},
	{
		description = "sienna_adept_passive_charge_speed_increased_desc",
		icon = "sienna_adept_passive_charge_speed_increased",
		name = "sienna_adept_passive_charge_speed_increased",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_adept_passive_charge_speed_increased_buff.multiplier,
			},
		},
		buffs = {
			"sienna_adept_passive_charge_speed_increased",
		},
	},
	{
		description = "sienna_adept_passive_improved_desc_2",
		icon = "sienna_adept_passive_improved",
		name = "sienna_adept_passive_improved",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_adept_improved_tranquility.multiplier,
			},
		},
		buffs = {
			"sienna_adept_passive_improved",
		},
	},
	{
		description = "sienna_adept_passive_cooldown_desc",
		icon = "sienna_adept_passive_cooldown",
		name = "sienna_adept_passive_cooldown",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.sienna_adept_passive_cooldown.duration,
			},
		},
		buffs = {},
	},
	{
		buffer = "server",
		description = "sienna_adept_damage_reduction_on_ignited_enemy_desc",
		icon = "sienna_adept_damage_reduction_on_ignited_enemy",
		name = "sienna_adept_damage_reduction_on_ignited_enemy",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_adept_damage_reduction_on_ignited_enemy_buff.multiplier,
			},
			{
				value = buff_tweak_data.sienna_adept_damage_reduction_on_ignited_enemy_buff.duration,
			},
			{
				value = buff_tweak_data.sienna_adept_damage_reduction_on_ignited_enemy_buff.max_stacks,
			},
		},
		buffs = {
			"sienna_adept_damage_reduction_on_ignited_enemy",
		},
	},
	{
		description = "sienna_adept_cooldown_reduction_on_burning_enemy_killed_desc",
		icon = "sienna_adept_cooldown_reduction_on_burning_enemy_killed",
		name = "sienna_adept_cooldown_reduction_on_burning_enemy_killed",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_adept_cooldown_reduction_on_burning_enemy_killed.cooldown_reduction,
			},
		},
		buffs = {
			"sienna_adept_cooldown_reduction_on_burning_enemy_killed",
		},
	},
	{
		buffer = "server",
		description = "sienna_adept_increased_burn_damage_reduced_non_burn_damage_desc",
		icon = "sienna_adept_increased_burn_damage_reduced_non_burn_damage",
		name = "sienna_adept_increased_burn_damage_reduced_non_burn_damage",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_adept_increased_burn_damage.multiplier,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_adept_reduced_non_burn_damage.multiplier,
			},
		},
		buffs = {
			"sienna_adept_increased_burn_damage",
			"sienna_adept_reduced_non_burn_damage",
		},
	},
	{
		description = "sienna_adept_ability_trail_double_desc",
		icon = "sienna_adept_activated_ability_dump_overcharge",
		name = "sienna_adept_ability_trail_double",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.sienna_adept_ability_trail_double.duration,
			},
		},
		buffs = {},
	},
	{
		description = "sienna_adept_activated_ability_explosion_desc",
		icon = "sienna_adept_activated_ability_explosion",
		name = "sienna_adept_activated_ability_explosion",
		num_ranks = 1,
		description_values = {},
		buffs = {},
	},
	{
		description = "sienna_adept_activated_ability_distance_desc",
		icon = "sienna_adept_activated_ability_distance",
		name = "sienna_adept_activated_ability_distance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_adept_activated_ability_distance.display_multiplier,
			},
		},
		buffs = {},
	},
	{
		description = "sienna_adept_activated_ability_cooldown_desc",
		icon = "sienna_adept_activated_ability_cooldown",
		name = "sienna_adept_activated_ability_cooldown",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_adept_activated_ability_cooldown.multiplier,
			},
		},
		buffs = {
			"sienna_adept_activated_ability_cooldown",
		},
	},
	{
		buffer = "server",
		description = "tank_unbalance_desc",
		icon = "sienna_adept_tank_unbalance",
		name = "sienna_adept_tank_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.tank_unbalance_buff.buffs[1].bonus,
			},
			{
				value = BuffTemplates.tank_unbalance_buff.buffs[1].duration,
			},
			{
				value_type = "percent",
				value = BuffTemplates.tank_unbalance.buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffTemplates.tank_unbalance.buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"tank_unbalance",
		},
	},
	{
		buffer = "server",
		description = "smiter_unbalance_desc",
		icon = "sienna_adept_smiter_unbalance",
		name = "sienna_adept_smiter_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.smiter_unbalance.buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffTemplates.smiter_unbalance.buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"smiter_unbalance",
		},
	},
	{
		buffer = "server",
		description = "power_level_unbalance_desc",
		icon = "sienna_adept_power_level_unbalance",
		name = "sienna_adept_power_level_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.power_level_unbalance.buffs[1].multiplier,
			},
		},
		buffs = {
			"power_level_unbalance",
		},
	},
	{
		buffer = "server",
		description = "vanguard_desc",
		icon = "sienna_unchained_regrowth",
		name = "sienna_unchained_vanguard",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"sienna_unchained_vanguard",
		},
	},
	{
		buffer = "server",
		description = "reaper_desc",
		icon = "sienna_unchained_bloodlust",
		name = "sienna_unchained_reaper",
		num_ranks = 1,
		description_values = {
			{
				value = BuffTemplates.reaper.buffs[1].max_targets,
			},
		},
		buffs = {
			"sienna_unchained_reaper",
		},
	},
	{
		buffer = "server",
		description = "conqueror_desc_3",
		icon = "sienna_unchained_conqueror",
		name = "sienna_unchained_heal_share",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier,
			},
		},
		buffs = {
			"sienna_unchained_conqueror",
		},
	},
	{
		description = "sienna_unchained_attack_speed_on_high_overcharge_desc",
		icon = "sienna_unchained_attack_speed_on_high_overcharge",
		name = "sienna_unchained_attack_speed_on_high_overcharge",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_unchained_attack_speed_on_high_overcharge_buff.multiplier,
			},
		},
		buffs = {
			"sienna_unchained_attack_speed_on_high_overcharge",
		},
	},
	{
		buffer = "both",
		description = "sienna_unchained_burn_push_desc_2",
		icon = "sienna_unchained_burn_push",
		name = "sienna_unchained_burn_push_2",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_unchained_push_arc_buff.multiplier,
			},
		},
		buffs = {
			"sienna_unchained_burn_push",
		},
	},
	{
		buffer = "server",
		description = "sienna_unchained_exploding_burning_enemies_desc",
		icon = "sienna_unchained_exploding_burning_enemies",
		name = "sienna_unchained_exploding_burning_enemies",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"sienna_unchained_exploding_burning_enemies",
		},
	},
	{
		buffer = "both",
		description = "sienna_unchained_overcharged_blocks_desc",
		icon = "sienna_unchained_reduced_vent_damage",
		name = "sienna_unchained_overcharged_blocks",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_unchained_passive_overcharged_blocks.multiplier,
			},
		},
		buffs = {
			"sienna_unchained_passive_overcharged_blocks",
		},
	},
	{
		description = "sienna_unchained_increased_vent_speed_desc_2",
		icon = "sienna_unchained_increased_vent_speed",
		name = "sienna_unchained_increased_vent_speed",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_unchained_increased_vent_speed.multiplier,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_unchained_reduced_vent_damage.multiplier,
			},
		},
		buffs = {
			"sienna_unchained_increased_vent_speed",
			"sienna_unchained_reduced_vent_damage",
		},
	},
	{
		buffer = "server",
		description = "sienna_unchained_reduced_damage_taken_after_venting_desc_2",
		icon = "sienna_unchained_reduced_damage_taken_after_venting",
		name = "sienna_unchained_reduced_damage_taken_after_venting_2",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_unchained_reduced_damage_taken_after_venting_buff.multiplier,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_unchained_reduced_passive_overcharge_after_venting_buff.multiplier,
			},
			{
				value = buff_tweak_data.sienna_unchained_reduced_damage_taken_after_venting_buff.duration,
			},
			{
				value = buff_tweak_data.sienna_unchained_reduced_damage_taken_after_venting_buff.max_stacks,
			},
		},
		buffs = {
			"sienna_unchained_reduced_damage_taken_after_venting",
		},
	},
	{
		buffer = "server",
		description = "sienna_unchained_burning_enemies_reduced_damage_desc",
		icon = "sienna_unchained_burning_enemies_reduced_damage",
		name = "sienna_unchained_burning_enemies_reduced_damage",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_unchained_burning_enemies_reduced_damage.multiplier,
			},
		},
		buffs = {},
	},
	{
		buffer = "both",
		description = "sienna_unchained_health_to_ult_desc",
		icon = "sienna_unchained_vent_overheat_on_low_health",
		name = "sienna_unchained_health_to_ult",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"sienna_unchained_health_to_ult",
		},
	},
	{
		description = "sienna_unchained_reduced_overcharge_desc",
		icon = "sienna_unchained_reduced_overcharge",
		name = "sienna_unchained_reduced_overcharge",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_unchained_reduced_overcharge.multiplier,
			},
		},
		buffs = {
			"sienna_unchained_reduced_overcharge",
		},
	},
	{
		buffer = "server",
		description = "sienna_unchained_activated_ability_power_on_enemies_hit_desc",
		icon = "sienna_unchained_activated_ability_radius",
		name = "sienna_unchained_activated_ability_power_on_enemies_hit",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_unchained_activated_ability_power_on_enemies_hit_buff.multiplier,
			},
			{
				value = buff_tweak_data.sienna_unchained_activated_ability_power_on_enemies_hit_buff.duration,
			},
			{
				value = buff_tweak_data.sienna_unchained_activated_ability_power_on_enemies_hit_buff.max_stacks,
			},
		},
		buffs = {
			"sienna_unchained_activated_ability_power_on_enemies_hit",
		},
	},
	{
		buffer = "server",
		description = "sienna_unchained_activated_ability_fire_aura_desc",
		icon = "sienna_unchained_activated_ability_power_on_enemies_hit",
		name = "sienna_unchained_activated_ability_fire_aura",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.sienna_unchained_activated_ability_pulse.duration,
			},
		},
		buffs = {},
	},
	{
		description = "sienna_unchained_activated_ability_temp_health_desc",
		icon = "sienna_unchained_activated_ability_temp_health",
		name = "sienna_unchained_activated_ability_temp_health",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.sienna_unchained_activated_ability_temp_health.display_bonus,
			},
		},
		buffs = {},
	},
	{
		buffer = "server",
		description = "tank_unbalance_desc",
		icon = "sienna_unchained_tank_unbalance",
		name = "sienna_unchained_tank_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.tank_unbalance_buff.buffs[1].bonus,
			},
			{
				value = BuffTemplates.tank_unbalance_buff.buffs[1].duration,
			},
			{
				value_type = "percent",
				value = BuffTemplates.tank_unbalance.buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffTemplates.tank_unbalance.buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"tank_unbalance",
		},
	},
	{
		buffer = "server",
		description = "linesman_unbalance_desc",
		icon = "sienna_unchained_linesman_unbalance",
		name = "sienna_unchained_linesman_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.linesman_unbalance.buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffTemplates.linesman_unbalance.buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"linesman_unbalance",
		},
	},
	{
		buffer = "server",
		description = "power_level_unbalance_desc",
		icon = "sienna_unchained_power_level_unbalance",
		name = "sienna_unchained_power_level_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.power_level_unbalance.buffs[1].multiplier,
			},
		},
		buffs = {
			"power_level_unbalance",
		},
	},
	{
		description = "sienna_placeholder",
		name = "sienna_placeholder",
	},
}

BuffUtils.copy_talent_buff_names(TalentBuffTemplates.bright_wizard)
BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.bright_wizard, buff_tweak_data)
