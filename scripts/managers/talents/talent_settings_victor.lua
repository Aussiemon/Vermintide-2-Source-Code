local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local buff_tweak_data = {
	victor_zealot_ability_cooldown_on_hit = {
		bonus = 0.5
	},
	victor_zealot_ability_cooldown_on_damage_taken = {
		bonus = 0.2
	},
	victor_zealot_passive_increased_damage = {
		chunk_size = 25
	},
	victor_zealot_passive_damage = {
		description_stacks = 6,
		multiplier = 0.05
	},
	victor_zealot_passive_attack_speed_aura_buff = {
		multiplier = 0.05
	},
	victor_zealot_passive_attack_speed_aura = {
		range = 5
	},
	victor_zealot_invulnerability_cooldown = {
		duration = 120
	},
	victor_zealot_invulnerability_on_lethal_damage_taken = {
		duration = 5,
		multiplier = -1
	},
	victor_zealot_activated_ability = {
		duration = 5,
		multiplier = 0.25
	},
	victor_zealot_reaper = {},
	victor_zealot_bloodlust = {},
	victor_zealot_conqueror = {},
	victor_zealot_crit_count = {
		buff_on_stacks = 5
	},
	victor_zealot_power = {
		multiplier = 0.05
	},
	victor_zealot_attack_speed_on_health_percent_buff = {
		max_stacks = 2,
		multiplier = 0.1
	},
	victor_zealot_attack_speed_on_health_percent = {
		threshold_1 = 0.5,
		threshold_2 = 0.2
	},
	victor_zealot_passive_move_speed_buff = {
		multiplier = 1.05
	},
	victor_zealot_passive_healing_received_buff = {
		multiplier = 0.15
	},
	victor_zealot_passive_damage_taken_buff = {
		multiplier = -0.05
	},
	victor_zealot_move_speed_on_damage_taken_buff = {
		duration = 2,
		multiplier = 1.3
	},
	victor_zealot_reduced_damage_taken_buff = {
		multiplier = -0.1
	},
	victor_zealot_activated_ability_power_on_hit_buff = {
		max_stacks = 10,
		multiplier = 0.02,
		duration = 5
	},
	victor_zealot_activated_ability_cooldown_stack_on_hit_buff = {
		max_stacks = 10,
		multiplier = 0.05
	},
	victor_bountyhunter_ability_cooldown_on_hit = {
		bonus = 0.25
	},
	victor_bountyhunter_ability_cooldown_on_damage_taken = {
		bonus = 0.3
	},
	victor_bountyhunter_passive_crit_buff = {
		bonus = 1
	},
	victor_bountyhunter_passive_reload_speed = {
		multiplier = -0.2
	},
	victor_bountyhunter_passive_crit_cooldown = {
		duration = 10
	},
	victor_bountyhunter_passive_increased_ammunition = {
		multiplier = 0.5
	},
	victor_bountyhunter_regrowth = {},
	victor_bountyhunter_bloodlust = {},
	victor_bountyhunter_conqueror = {},
	victor_bountyhunter_melee_damage_on_no_ammo_buff = {
		multiplier = 0.25
	},
	victor_bountyhunter_power_level_on_clip_size_buff = {
		multiplier = 0.01
	},
	victor_bountyhunter_attack_speed_on_no_ammo_buff = {
		duration = 15,
		multiplier = 0.15
	},
	victor_bountyhunter_power_on_no_ammo_buff = {
		duration = 15,
		multiplier = 0.15
	},
	victor_bountyhunter_blessed_melee_damage_buff = {
		presentation_stacks = 6,
		multiplier = 0.15
	},
	victor_bountyhunter_blessed_ranged_damage_buff = {
		presentation_stacks = 6,
		multiplier = 0.15
	},
	victor_bountyhunter_passive_reduced_cooldown = {
		duration = 6
	},
	victor_bountyhunter_party_movespeed_on_ranged_crit_buff = {
		multiplier = 1.1,
		duration = 10
	},
	victor_bountyhunter_restore_ammo_on_elite_kill = {
		ammo_bonus_fraction = 0.2
	},
	victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill_buff = {
		max_stacks = 30,
		multiplier = -0.01
	},
	victor_bountyhunter_activated_ability_passive_cooldown_reduction = {
		cooldown = 10,
		multiplier = 0.2
	},
	victor_bountyhunter_activated_ability_blast_shotgun = {
		required_target_number = 4,
		multiplier = -0.25
	},
	victor_bountyhunter_activated_ability_railgun = {
		multiplier = 0.4
	},
	victor_bountyhunter_activated_ability_reset_cooldown_on_stacks = {
		multiplier = 0.02
	},
	victor_bountyhunter_activated_ability_reset_cooldown_on_stacks_buff = {
		max_stacks = 25,
		multiplier = 0.02
	},
	victor_witchhunter_ability_cooldown_on_hit = {
		bonus = 0.5
	},
	victor_witchhunter_ability_cooldown_on_damage_taken = {
		bonus = 0.2
	},
	victor_witchhunter_passive_debuff = {
		multiplier = 0.2
	},
	victor_witchhunter_passive_block_cost_reduction = {
		multiplier = -1
	},
	victor_witchhunter_passive_dodge_range = {
		multiplier = 1.1
	},
	victor_witchhunter_passive_dodge_speed = {
		multiplier = 1.1
	},
	victor_witchhunter_headshot_multiplier_increase = {
		multiplier = 0.25
	},
	victor_witchhunter_activated_ability_crit_buff = {
		max_stacks = 1,
		duration = 6,
		bonus = 0.25
	},
	victor_witchhunter_regrowth = {},
	victor_witchhunter_reaper = {},
	victor_witchhunter_conqueror = {},
	victor_witchhunter_headshot_damage_increase = {
		multiplier = 0.5
	},
	victor_witchhunter_guaranteed_crit_on_timed_block_buff = {
		duration = 2,
		bonus = 1
	},
	victor_witchhunter_ping_target_crit_chance = {
		bonus = 0.05,
		duration = 5
	},
	victor_witchhunter_attack_speed_on_enemy_pinged_buff = {
		multiplier = 0.1,
		duration = 15
	},
	victor_witchhunter_improved_damage_taken_ping = {
		multiplier = 0.05,
		duration = 5
	},
	victor_witchhunter_max_ammo = {
		multiplier = 0.3
	},
	victor_witchhunter_stamina_regen_on_push_buff = {
		duration = 2,
		multiplier = 0.4
	},
	victor_witchhunter_dodge_range = {
		multiplier = 1.2
	},
	victor_witchhunter_dodge_speed = {
		multiplier = 1.2
	},
	victor_witchhunter_activated_ability_guaranteed_crit_self_buff = {
		duration = 6,
		bonus = 1
	},
	victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit = {
		cooldown_reduction = 0.4,
		required_targets = 10
	}
}
TalentBuffTemplates = TalentBuffTemplates or {}
TalentBuffTemplates.witch_hunter = {
	victor_zealot_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				buff_func = "reduce_activated_ability_cooldown"
			}
		}
	},
	victor_zealot_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken"
			}
		}
	},
	victor_zealot_passive_increased_damage = {
		buffs = {
			{
				buff_to_add = "victor_zealot_passive_damage",
				update_func = "activate_buff_stacks_based_on_health_chunks",
				max_stacks = 6
			}
		}
	},
	victor_zealot_passive_damage = {
		buffs = {
			{
				max_stacks = 6,
				icon = "victor_zealot_passive",
				stat_buff = "power_level"
			}
		}
	},
	victor_zealot_passive_uninterruptible_heavy = {
		buffs = {
			{
				perks = {
					buff_perks.uninterruptible_heavy
				}
			}
		}
	},
	victor_zealot_invulnerability_cooldown = {
		buffs = {
			{
				buff_to_add = "victor_zealot_gain_invulnerability_on_lethal_damage_taken",
				max_stacks = 1,
				refresh_durations = true,
				duration_end_func = "add_buff_local",
				is_cooldown = true,
				icon = "victor_zealot_passive_invulnerability"
			}
		}
	},
	victor_zealot_gain_invulnerability_on_lethal_damage_taken = {
		buffs = {
			{
				buff_to_add = "victor_zealot_invulnerability_on_lethal_damage_taken",
				remove_on_proc = true,
				proc_weight = 5,
				buff_func = "victor_zealot_gain_invulnerability",
				event = "on_damage_taken",
				icon = "victor_zealot_passive_invulnerability",
				max_stacks = 1
			}
		}
	},
	victor_zealot_invulnerability_on_lethal_damage_taken = {
		activation_effect = "fx/screenspace_potion_03",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_tank_activate",
		buffs = {
			{
				remove_buff_func = "add_victor_zealot_invulnerability_cooldown",
				stat_buff = "damage_taken",
				max_stacks = 1,
				icon = "victor_zealot_passive_invulnerability",
				priority_buff = true,
				perks = {
					buff_perks.ignore_death
				}
			}
		}
	},
	victor_zealot_activated_ability = {
		buffs = {
			{
				remove_buff_func = "end_zealot_activated_ability",
				stat_buff = "attack_speed",
				max_stacks = 1,
				icon = "victor_zealot_activated_ability",
				priority_buff = true,
				perks = {
					buff_perks.victor_zealot_activated_ability
				}
			}
		}
	},
	victor_zealot_reaper = {
		buffs = {
			{
				multiplier = -0.05,
				name = "reaper",
				buff_func = "heal_damage_targets_on_melee",
				event = "on_player_damage_dealt",
				max_targets = 5,
				bonus = 0.25,
				perks = {
					buff_perks.linesman_healing
				}
			}
		}
	},
	victor_zealot_bloodlust = {
		buffs = {
			{
				name = "bloodlust",
				multiplier = 0.45,
				heal_cap = 0.25,
				buff_func = "heal_percentage_of_enemy_hp_on_melee_kill",
				event = "on_kill",
				perks = {
					buff_perks.smiter_healing
				}
			}
		}
	},
	victor_zealot_conqueror = {
		buffs = {
			{
				name = "conqueror",
				multiplier = 0.2,
				range = 10,
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable"
			}
		}
	},
	victor_zealot_crit_count = {
		buffs = {
			{
				event = "on_hit",
				buff_to_add = "victor_zealot_counter_buff",
				buff_func = "add_buff_on_first_target_hit"
			}
		}
	},
	victor_zealot_counter_buff = {
		buffs = {
			{
				reset_on_max_stacks = true,
				on_max_stacks_func = "add_remove_buffs",
				max_stacks = 5,
				is_cooldown = true,
				icon = "victor_zealot_crit_count",
				max_stack_data = {
					buffs_to_add = {
						"victor_zealot_crit_count_buff"
					}
				}
			}
		}
	},
	victor_zealot_crit_count_buff = {
		buffs = {
			{
				event = "on_critical_action",
				max_stacks = 1,
				buff_func = "dummy_function",
				remove_on_proc = true,
				icon = "victor_zealot_crit_count",
				priority_buff = true,
				perks = {
					buff_perks.guaranteed_crit
				}
			}
		}
	},
	victor_zealot_power = {
		buffs = {
			{
				stat_buff = "power_level",
				max_stacks = 1
			}
		}
	},
	victor_zealot_attack_speed_on_health_percent = {
		buffs = {
			{
				buff_to_add = "victor_zealot_attack_speed_on_health_percent_buff",
				update_func = "victor_zealot_activate_buff_stacks_based_on_health_percent"
			}
		}
	},
	victor_zealot_attack_speed_on_health_percent_buff = {
		buffs = {
			{
				multiplier = 0.1,
				icon = "victor_zealot_attack_speed_on_health_percent",
				stat_buff = "attack_speed"
			}
		}
	},
	victor_zealot_passive_move_speed = {
		buffs = {
			{
				buff_to_add = "victor_zealot_passive_move_speed_buff",
				update_func = "activate_buff_stacks_based_on_health_chunks",
				chunk_size = 25,
				max_stacks = 6
			}
		}
	},
	victor_zealot_passive_move_speed_buff = {
		buffs = {
			{
				remove_buff_func = "remove_movement_buff",
				max_stacks = 6,
				icon = "victor_zealot_passive_move_speed",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	victor_zealot_passive_healing_received = {
		buffs = {
			{
				buff_to_add = "victor_zealot_passive_healing_received_buff",
				update_func = "activate_buff_stacks_based_on_health_chunks",
				chunk_size = 25,
				max_stacks = 6
			}
		}
	},
	victor_zealot_passive_healing_received_buff = {
		buffs = {
			{
				max_stacks = 6,
				multiplier = 0.2,
				stat_buff = "healing_received",
				icon = "victor_zealot_passive_healing_received"
			}
		}
	},
	victor_zealot_passive_damage_taken = {
		buffs = {
			{
				buff_to_add = "victor_zealot_passive_damage_taken_buff",
				update_func = "activate_buff_stacks_based_on_health_chunks",
				chunk_size = 25,
				max_stacks = 6
			}
		}
	},
	victor_zealot_passive_damage_taken_buff = {
		buffs = {
			{
				max_stacks = 6,
				icon = "victor_zealot_passive_damage_taken",
				stat_buff = "damage_taken"
			}
		}
	},
	victor_zealot_move_speed_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				buff_to_add = "victor_zealot_move_speed_on_damage_taken_buff",
				buff_func = "add_buff_on_enemy_damage_taken",
				perks = {
					buff_perks.no_moveslow_on_hit
				}
			}
		}
	},
	victor_zealot_move_speed_on_damage_taken_buff = {
		buffs = {
			{
				multiplier = 1.5,
				icon = "victor_zealot_move_speed_on_damage_taken",
				refresh_durations = true,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	victor_zealot_max_stamina_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				buff_func = "restore_stamina_on_enemy_damage_taken"
			}
		}
	},
	victor_zealot_reduced_damage_taken_buff = {
		buffs = {
			{
				stat_buff = "damage_taken",
				multiplier = -0.1
			}
		}
	},
	victor_zealot_activated_ability_power_on_hit = {
		buffs = {
			{
				event = "on_hit",
				duration = 5,
				buff_to_add = "victor_zealot_activated_ability_power_on_hit_buff",
				buff_func = "add_buff"
			}
		}
	},
	victor_zealot_activated_ability_power_on_hit_buff = {
		buffs = {
			{
				refresh_durations = true,
				icon = "victor_zealot_activated_ability_power_on_hit",
				stat_buff = "power_level"
			}
		}
	},
	victor_zealot_activated_ability_ignore_death = {
		activation_effect = "fx/screenspace_potion_03",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_tank_activate",
		buffs = {
			{
				max_stacks = 1,
				icon = "victor_zealot_activated_ability_ignore_death",
				duration = 5,
				perks = {
					buff_perks.ignore_death
				}
			}
		}
	},
	victor_zealot_activated_ability_cooldown_stack_on_hit = {
		buffs = {
			{
				event = "on_hit",
				duration = 5,
				buff_to_add = "victor_zealot_activated_ability_cooldown_stack_on_hit_buff",
				buff_func = "add_buff"
			}
		}
	},
	victor_zealot_activated_ability_cooldown_stack_on_hit_buff = {
		buffs = {
			{
				refresh_durations = true,
				icon = "victor_zealot_activated_ability_cooldown_stack_on_hit",
				remove_buff_func = "reduce_cooldown_on_buff_removed",
				duration = 5
			}
		}
	},
	victor_bountyhunter_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				buff_func = "reduce_activated_ability_cooldown"
			}
		}
	},
	victor_bountyhunter_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken"
			}
		}
	},
	victor_bountyhunter_passive_crit_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "victor_bountyhunter_passive",
				stat_buff = "critical_strike_chance_ranged"
			}
		}
	},
	victor_bountyhunter_passive_crit_buff_removal = {
		buffs = {
			{
				event = "on_critical_action",
				buff_func = "remove_victor_bountyhunter_passive_crit_buff"
			}
		}
	},
	victor_bountyhunter_passive_crit_cooldown = {
		buffs = {
			{
				buff_to_add = "victor_bountyhunter_passive_crit_buff",
				max_stacks = 1,
				refresh_durations = true,
				duration_end_func = "add_buff_local",
				is_cooldown = true,
				icon = "victor_bountyhunter_passive"
			}
		}
	},
	victor_bountyhunter_passive_reload_speed = {
		buffs = {
			{
				stat_buff = "reload_speed"
			}
		}
	},
	victor_bountyhunter_passive_increased_ammunition = {
		buffs = {
			{
				stat_buff = "total_ammo"
			}
		}
	},
	victor_bountyhunter_regrowth = {
		buffs = {
			{
				name = "regrowth",
				buff_func = "heal_finesse_damage_on_melee",
				event = "on_hit",
				bonus = 2,
				perks = {
					buff_perks.ninja_healing
				}
			}
		}
	},
	victor_bountyhunter_conqueror = {
		buffs = {
			{
				name = "conqueror",
				multiplier = 0.2,
				range = 10,
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable"
			}
		}
	},
	victor_bountyhunter_bloodlust = {
		buffs = {
			{
				name = "bloodlust",
				multiplier = 0.45,
				heal_cap = 0.25,
				buff_func = "heal_percentage_of_enemy_hp_on_melee_kill",
				event = "on_kill",
				perks = {
					buff_perks.smiter_healing
				}
			}
		}
	},
	victor_bountyhunter_increased_melee_damage_on_no_ammo_add = {
		buffs = {
			{
				event = "on_last_ammo_used",
				buff_func = "add_buff_on_out_of_ammo",
				buffs_to_add = {
					"victor_bountyhunter_attack_speed_on_no_ammo_buff",
					"victor_bountyhunter_power_on_no_ammo_buff"
				}
			}
		}
	},
	victor_bountyhunter_attack_speed_on_no_ammo_buff = {
		buffs = {
			{
				refresh_durations = true,
				name = "bardin_slayer_frenzy",
				stat_buff = "attack_speed",
				max_stacks = 1,
				icon = "victor_bountyhunter_melee_damage_on_no_ammo"
			}
		}
	},
	victor_bountyhunter_power_on_no_ammo_buff = {
		buffs = {
			{
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "power_level",
				priority_buff = true
			}
		}
	},
	victor_bountyhunter_debuff_defence_on_crit = {
		buffs = {
			{
				buff_to_add = "defence_debuff_enemies",
				event = "on_critical_hit",
				buff_func = "on_hit_debuff_enemy_defence"
			}
		}
	},
	victor_bountyhunter_power_level_on_clip_size = {
		buffs = {
			{
				buff_to_add = "victor_bountyhunter_power_level_on_clip_size_buff",
				update_func = "activate_buff_stacks_based_on_clip_size",
				remove_buff_func = "remove_buff_stacks_based_on_clip_size"
			}
		}
	},
	victor_bountyhunter_power_level_on_clip_size_buff = {
		buffs = {
			{
				max_stacks = 20,
				icon = "victor_bountyhunter_power_level_on_clip_size",
				stat_buff = "power_level_ranged"
			}
		}
	},
	victor_bountyhunter_passive_reduced_cooldown = {
		buffs = {
			{
				buff_to_add = "victor_bountyhunter_passive_crit_buff",
				max_stacks = 1,
				refresh_durations = true,
				duration_end_func = "add_buff_local",
				is_cooldown = true,
				icon = "victor_bountyhunter_passive"
			}
		}
	},
	victor_bountyhunter_activate_passive_on_melee_kill = {
		buffs = {
			{
				event = "on_kill",
				buff_func = "victor_bountyhunter_activate_passive_on_melee_kill"
			}
		}
	},
	victor_bountyhunter_weapon_swap_buff = {
		buffs = {
			{
				melee_buff = "victor_bountyhunter_blessed_melee_buff",
				ranged_buff_to_add = "victor_bountyhunter_blessed_ranged_damage_buff",
				melee_buff_to_add = "victor_bountyhunter_blessed_melee_damage_buff",
				buff_func = "victor_bountyhunter_blessed_combat",
				event = "on_hit",
				ranged_buff = "victor_bountyhunter_blessed_ranged_buff",
				update_func = "victor_bountyhunter_blessed_combat_update",
				melee_buff_ids = {},
				ranged_buff_ids = {}
			}
		}
	},
	victor_bountyhunter_blessed_melee_buff = {
		buffs = {
			{
				max_stacks = 6,
				icon = "victor_bountyhunter_passive_infinite_ammo"
			}
		}
	},
	victor_bountyhunter_blessed_melee_damage_buff = {
		buffs = {
			{
				stat_buff = "power_level_melee",
				max_stacks = 1
			}
		}
	},
	victor_bountyhunter_blessed_ranged_buff = {
		buffs = {
			{
				max_stacks = 6,
				icon = "victor_bountyhunter_heal_on_critical_hit"
			}
		}
	},
	victor_bountyhunter_blessed_ranged_damage_buff = {
		buffs = {
			{
				stat_buff = "power_level_ranged",
				max_stacks = 1
			}
		}
	},
	victor_bountyhunter_passive_infinite_ammo = {
		buffs = {
			{
				buff_to_add = "victor_bountyhunter_passive_infinite_ammo_buff",
				activation_buff = "victor_bountyhunter_passive_crit_buff",
				update_func = "activate_buff_on_other_buff"
			}
		}
	},
	victor_bountyhunter_passive_infinite_ammo_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "victor_bountyhunter_passive_infinite_ammo",
				perks = {
					buff_perks.infinite_ammo
				}
			}
		}
	},
	victor_bountyhunter_party_movespeed_on_ranged_crit = {
		buffs = {
			{
				buff_to_add = "victor_bountyhunter_party_movespeed_on_ranged_crit_buff",
				event = "on_hit",
				buff_func = "add_team_buff_on_ranged_critical_hit"
			}
		}
	},
	victor_bountyhunter_reload_on_kill = {
		buffs = {
			{
				event = "on_kill",
				buff_func = "victor_bounty_hunter_reload_on_kill"
			}
		}
	},
	victor_bountyhunter_restore_ammo_on_elite_kill = {
		buffs = {
			{
				event = "on_kill",
				buff_func = "victor_bounty_hunter_ammo_fraction_gain_out_of_ammo"
			}
		}
	},
	victor_bountyhunter_restore_ammo_on_kill_buff = {
		buffs = {
			{
				max_stacks = 1,
				refresh_durations = true,
				duration = 5,
				buff_func = "victor_bounty_hunter_ammo_regen",
				event = "on_hit",
				icon = "bardin_slayer_activated_ability",
				priority_buff = true
			}
		}
	},
	victor_bountyhunter_party_movespeed_on_ranged_crit_buff = {
		buffs = {
			{
				remove_buff_func = "remove_movement_buff",
				refresh_durations = true,
				max_stacks = 1,
				icon = "victor_bountyhunter_movespeed_on_ranged_crit",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill = {
		buffs = {
			{
				event = "on_kill",
				buff_to_add = "victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill_buff",
				restore_sub_buffs = true,
				buff_func = "add_buff_on_elite_or_special_kill"
			}
		}
	},
	victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill_buff = {
		buffs = {
			{
				stat_buff = "damage_taken",
				icon = "victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill"
			}
		}
	},
	victor_bountyhunter_activated_ability_passive_cooldown_reduction = {
		buffs = {
			{
				event = "on_critical_hit",
				buff_func = "victor_bountyhunter_reduce_activated_ability_cooldown_on_passive_crit"
			}
		}
	},
	victor_bountyhunter_activated_ability_reset_cooldown_on_stacks = {
		buffs = {
			{
				event = "on_kill",
				buff_func = "victor_bountyhunter_reduce_activated_ability_cooldown_ignore_paused_on_kill"
			}
		}
	},
	victor_bountyhunter_activated_ability_blast_shotgun = {
		buffs = {
			{
				event = "on_kill",
				buff_to_add = "victor_bounty_blast_streak_buff",
				stat_buff = "activated_cooldown",
				buff_func = "victor_bounty_blast_streak_activation"
			}
		}
	},
	victor_bounty_blast_streak_buff = {
		buffs = {
			{
				event = "on_hit",
				icon = "victor_bountyhunter_activated_ability_reset_cooldown_on_stacks",
				max_stacks = 20,
				buff_func = "victor_bounty_blast_streak_buff"
			}
		}
	},
	victor_bountyhunter_activated_ability_railgun = {
		buffs = {
			{
				event = "on_hit",
				buff_to_add = "victor_bountyhunter_activated_ability_railgun_delayed_add",
				buff_func = "victor_bounty_hunter_reduce_activated_ability_cooldown_railgun"
			}
		}
	},
	victor_bountyhunter_activated_ability_railgun_delayed_add = {
		buffs = {
			{
				max_stacks = 2,
				duration = 0.15,
				multiplier = 0.4,
				remove_buff_func = "victor_bountyhunter_activated_ability_railgun_delayed"
			}
		}
	},
	victor_witchhunter_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				buff_func = "reduce_activated_ability_cooldown"
			}
		}
	},
	victor_witchhunter_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken"
			}
		}
	},
	victor_witchhunter_passive = {
		buffs = {
			{
				max_stacks = 1
			}
		}
	},
	victor_witchhunter_passive_debuff = {
		buffs = {
			{
				stat_buff = "damage_taken",
				max_stacks = 1
			}
		}
	},
	victor_witchhunter_passive_dodge_range = {
		buffs = {
			{
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier"
				}
			}
		}
	},
	victor_witchhunter_passive_dodge_speed = {
		buffs = {
			{
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				}
			}
		}
	},
	victor_witchhunter_passive_block_cost_reduction = {
		buffs = {
			{
				perks = {
					buff_perks.in_arc_block_cost_reduction
				}
			}
		}
	},
	victor_witchhunter_headshot_multiplier_increase = {
		buffs = {
			{
				stat_buff = "headshot_multiplier"
			}
		}
	},
	victor_witchhunter_headshot_crit_killing_blow = {
		buffs = {
			{
				perks = {
					buff_perks.crit_headshot_killing_blow
				}
			}
		}
	},
	victor_witchhunter_activated_ability_crit_buff = {
		buffs = {
			{
				stat_buff = "critical_strike_chance",
				icon = "victor_witchhunter_activated_ability",
				priority_buff = true,
				refresh_durations = true
			}
		}
	},
	victor_witchhunter_regrowth = {
		buffs = {
			{
				name = "regrowth",
				buff_func = "heal_finesse_damage_on_melee",
				event = "on_hit",
				bonus = 2,
				perks = {
					buff_perks.ninja_healing
				}
			}
		}
	},
	victor_witchhunter_reaper = {
		buffs = {
			{
				multiplier = -0.05,
				name = "reaper",
				buff_func = "heal_damage_targets_on_melee",
				event = "on_player_damage_dealt",
				max_targets = 5,
				bonus = 0.25,
				perks = {
					buff_perks.linesman_healing
				}
			}
		}
	},
	victor_witchhunter_conqueror = {
		buffs = {
			{
				name = "conqueror",
				multiplier = 0.2,
				range = 10,
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable"
			}
		}
	},
	victor_witchhunter_headshot_damage_increase = {
		buffs = {
			{
				stat_buff = "headshot_multiplier"
			}
		}
	},
	victor_witchhunter_guaranteed_crit_on_timed_block_add = {
		buffs = {
			{
				event = "on_timed_block",
				buff_to_add = "victor_witchhunter_guaranteed_crit_on_timed_block_buff",
				buff_func = "add_buff"
			}
		}
	},
	victor_witchhunter_guaranteed_crit_on_timed_block_buff = {
		buffs = {
			{
				event = "on_hit",
				max_stacks = 1,
				stat_buff = "critical_strike_chance",
				buff_func = "dummy_function",
				remove_on_proc = true,
				icon = "victor_witchhunter_guaranteed_crit_on_timed_block",
				refresh_durations = true
			}
		}
	},
	victor_witchhunter_bleed_on_critical_hit = {
		buffs = {
			{
				perks = {
					buff_perks.victor_witchhunter_bleed_on_critical_hit
				}
			}
		}
	},
	victor_witchhunter_critical_hit_chance_on_ping_target_killed = {
		buffs = {
			{
				event = "on_ping_target_killed",
				buff_to_add = "victor_witchhunter_ping_target_crit_chance",
				buff_func = "add_buff_to_all_players"
			}
		}
	},
	victor_witchhunter_ping_target_crit_chance = {
		buffs = {
			{
				max_stacks = 1,
				icon = "victor_witchhunter_critical_hit_chance_on_ping_target_killed",
				stat_buff = "critical_strike_chance",
				refresh_durations = true
			}
		}
	},
	victor_witchhunter_attack_speed_on_enemy_pinged = {
		buffs = {
			{
				event = "on_pinged",
				buff_to_add = "victor_witchhunter_attack_speed_on_enemy_pinged_buff",
				buff_func = "victor_witchhunter_ping_enemy_attack_speed"
			}
		}
	},
	victor_witchhunter_attack_speed_on_enemy_pinged_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "victor_witchhunter_attack_speed_on_enemy_pinged",
				stat_buff = "attack_speed",
				refresh_durations = true
			}
		}
	},
	victor_witchhunter_improved_damage_taken_ping = {
		buffs = {
			{
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "damage_taken"
			}
		}
	},
	victor_witchhunter_max_ammo = {
		buffs = {
			{
				stat_buff = "total_ammo"
			}
		}
	},
	victor_witchhunter_stamina_regen_on_push = {
		buffs = {
			{
				event = "on_push",
				buff_to_add = "victor_witchhunter_stamina_regen_on_push_buff",
				buff_func = "add_buff"
			}
		}
	},
	victor_witchhunter_stamina_regen_on_push_buff = {
		buffs = {
			{
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "fatigue_regen",
				icon = "victor_witchhunter_stamina_regen_on_push"
			}
		}
	},
	victor_witchhunter_dodge_range = {
		buffs = {
			{
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier"
				}
			}
		}
	},
	victor_witchhunter_dodge_speed = {
		buffs = {
			{
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				}
			}
		}
	},
	victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit = {
		buffs = {
			{
				event = "on_hit",
				buff_func = "victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit"
			}
		}
	},
	victor_witchhunter_activated_ability_guaranteed_crit_self_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "victor_witchhunter_activated_ability_guaranteed_crit_self_buff",
				stat_buff = "critical_strike_chance_melee",
				refresh_durations = true
			}
		}
	}
}
TalentTrees = TalentTrees or {}
TalentTrees.witch_hunter = {
	{
		{
			"victor_zealot_reaper",
			"victor_zealot_bloodlust_2",
			"victor_zealot_heal_share"
		},
		{
			"victor_zealot_attack_speed_on_health_percent",
			"victor_zealot_crit_count",
			"victor_zealot_power"
		},
		{
			"victor_zealot_smiter_unbalance",
			"victor_zealot_linesman_unbalance",
			"victor_zealot_power_level_unbalance"
		},
		{
			"victor_zealot_passive_move_speed",
			"victor_zealot_passive_healing_received",
			"victor_zealot_passive_damage_taken"
		},
		{
			"victor_zealot_move_speed_on_damage_taken",
			"victor_zealot_max_stamina_on_damage_taken",
			"victor_zealot_reduced_damage_taken"
		},
		{
			"victor_zealot_activated_ability_power_on_hit",
			"victor_zealot_activated_ability_ignore_death",
			"victor_zealot_activated_ability_cooldown_stack_on_hit"
		}
	},
	{
		{
			"victor_bountyhunter_regrowth_2",
			"victor_bountyhunter_bloodlust_2",
			"victor_bountyhunter_heal_share"
		},
		{
			"victor_bountyhunter_debuff_defence_on_crit",
			"victor_bountyhunter_power_burst_on_no_ammo",
			"victor_bountyhunter_power_level_on_clip_size"
		},
		{
			"victor_bounty_hunter_smiter_unbalance",
			"victor_bounty_hunter_finesse_unbalance",
			"victor_bounty_hunter_power_level_unbalance"
		},
		{
			"victor_bountyhunter_weapon_swap_buff",
			"victor_bountyhunter_passive_reduced_cooldown",
			"victor_bountyhunter_passive_infinite_ammo"
		},
		{
			"victor_bountyhunter_party_movespeed_on_ranged_crit",
			"victor_bountyhunter_reload_on_kill",
			"victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill"
		},
		{
			"victor_bountyhunter_activated_ability_reset_cooldown_on_stacks",
			"victor_bountyhunter_activated_ability_railgun",
			"victor_bountyhunter_activated_ability_blast_shotgun"
		}
	},
	{
		{
			"victor_witchhunter_regrowth_2",
			"victor_witchhunter_reaper",
			"victor_witchhunter_heal_share"
		},
		{
			"victor_witchhunter_guaranteed_crit_on_timed_block",
			"victor_witchhunter_headshot_damage_increase",
			"victor_witchhunter_bleed_on_critical_hit"
		},
		{
			"victor_witchhunter_linesman_unbalance",
			"victor_witchhunter_finesse_unbalance",
			"victor_witchhunter_power_level_unbalance"
		},
		{
			"victor_witchhunter_improved_damage_taken_ping",
			"victor_witchhunter_attack_speed_on_enemy_pinged",
			"victor_witchhunter_critical_hit_chance_on_ping_target_killed"
		},
		{
			"victor_witchhunter_dodge_range",
			"victor_witchhunter_stamina_regen_on_push",
			"victor_witchhunter_max_ammo"
		},
		{
			"victor_captain_activated_ability_stagger_ping_debuff",
			"victor_witchhunter_activated_ability_guaranteed_crit_self_buff",
			"victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit"
		}
	}
}
Talents = Talents or {}
Talents.witch_hunter = {
	{
		description = "reaper_desc",
		name = "victor_zealot_reaper",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_zealot_regrowth",
		description_values = {
			{
				value = BuffTemplates.reaper.buffs[1].max_targets
			}
		},
		buffs = {
			"victor_zealot_reaper"
		}
	},
	{
		description = "bloodlust_desc_3",
		name = "victor_zealot_bloodlust_2",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_zealot_bloodlust",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.bloodlust.buffs[1].multiplier
			}
		},
		buffs = {
			"victor_zealot_bloodlust"
		}
	},
	{
		description = "conqueror_desc_3",
		name = "victor_zealot_heal_share",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_zealot_conqueror",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		buffs = {
			"victor_zealot_conqueror"
		}
	},
	{
		description = "victor_zealot_crit_count_desc",
		name = "victor_zealot_crit_count",
		num_ranks = 1,
		icon = "victor_zealot_crit_count",
		description_values = {
			{
				value = buff_tweak_data.victor_zealot_crit_count.buff_on_stacks
			}
		},
		buffs = {
			"victor_zealot_crit_count"
		},
		perks = {
			"no_random_crits"
		}
	},
	{
		description = "victor_zealot_power_desc",
		name = "victor_zealot_power",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_zealot_power",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_power.multiplier
			}
		},
		buffs = {
			"victor_zealot_power"
		}
	},
	{
		description = "victor_zealot_attack_speed_on_health_percent_desc",
		name = "victor_zealot_attack_speed_on_health_percent",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_zealot_attack_speed_on_health_percent",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_attack_speed_on_health_percent_buff.multiplier
			},
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_attack_speed_on_health_percent.threshold_1
			},
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_attack_speed_on_health_percent.threshold_2
			}
		},
		buffs = {
			"victor_zealot_attack_speed_on_health_percent"
		}
	},
	{
		description = "victor_zealot_passive_move_speed_desc",
		name = "victor_zealot_passive_move_speed",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_zealot_passive_move_speed",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.victor_zealot_passive_move_speed_buff.multiplier
			}
		},
		buffs = {
			"victor_zealot_passive_move_speed"
		}
	},
	{
		description = "victor_zealot_passive_healing_received_desc",
		name = "victor_zealot_passive_healing_received",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_zealot_passive_healing_received",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_passive_healing_received_buff.multiplier
			}
		},
		buffs = {
			"victor_zealot_passive_healing_received"
		}
	},
	{
		description = "victor_zealot_passive_damage_taken_desc",
		name = "victor_zealot_passive_damage_taken",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_zealot_passive_damage_taken",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_passive_damage_taken_buff.multiplier
			}
		},
		buffs = {
			"victor_zealot_passive_damage_taken"
		}
	},
	{
		description = "victor_zealot_move_speed_on_damage_taken_desc",
		name = "victor_zealot_move_speed_on_damage_taken",
		num_ranks = 1,
		icon = "victor_zealot_move_speed_on_damage_taken",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.victor_zealot_move_speed_on_damage_taken_buff.multiplier
			},
			{
				value = buff_tweak_data.victor_zealot_move_speed_on_damage_taken_buff.duration
			}
		},
		buffs = {
			"victor_zealot_move_speed_on_damage_taken"
		}
	},
	{
		description = "victor_zealot_max_stamina_on_damage_taken_desc",
		name = "victor_zealot_max_stamina_on_damage_taken",
		num_ranks = 1,
		icon = "victor_zealot_max_stamina_on_damage_taken",
		buffs = {
			"victor_zealot_max_stamina_on_damage_taken"
		}
	},
	{
		description = "victor_zealot_reduced_damage_taken_desc",
		name = "victor_zealot_reduced_damage_taken",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_zealot_reduced_damage_taken",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_reduced_damage_taken_buff.multiplier
			}
		},
		buffs = {
			"victor_zealot_reduced_damage_taken_buff"
		}
	},
	{
		description = "victor_zealot_activated_ability_power_on_hit_desc",
		name = "victor_zealot_activated_ability_power_on_hit",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_zealot_activated_ability_power_on_hit",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_activated_ability_power_on_hit_buff.multiplier
			},
			{
				value = buff_tweak_data.victor_zealot_activated_ability_power_on_hit_buff.duration
			},
			{
				value = buff_tweak_data.victor_zealot_activated_ability_power_on_hit_buff.max_stacks
			}
		},
		buffs = {}
	},
	{
		description = "victor_zealot_activated_ability_ignore_death_desc",
		name = "victor_zealot_activated_ability_ignore_death",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_zealot_activated_ability_ignore_death",
		buffs = {}
	},
	{
		description = "victor_zealot_activated_ability_cooldown_stack_on_hit_desc",
		name = "victor_zealot_activated_ability_cooldown_stack_on_hit",
		num_ranks = 1,
		icon = "victor_zealot_activated_ability_cooldown_stack_on_hit",
		description_values = {
			{
				value = buff_tweak_data.victor_zealot_activated_ability_cooldown_stack_on_hit_buff.max_stacks
			},
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_activated_ability_cooldown_stack_on_hit_buff.multiplier
			}
		},
		buffs = {}
	},
	{
		description = "smiter_unbalance_desc",
		name = "victor_zealot_smiter_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_zealot_smiter_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.smiter_unbalance.buffs[1].display_multiplier
			},
			{
				value_type = "percent",
				value = BuffTemplates.smiter_unbalance.buffs[1].max_display_multiplier
			}
		},
		buffs = {
			"smiter_unbalance"
		}
	},
	{
		description = "linesman_unbalance_desc",
		name = "victor_zealot_linesman_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_zealot_linesman_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.linesman_unbalance.buffs[1].display_multiplier
			},
			{
				value_type = "percent",
				value = BuffTemplates.linesman_unbalance.buffs[1].max_display_multiplier
			}
		},
		buffs = {
			"linesman_unbalance"
		}
	},
	{
		description = "power_level_unbalance_desc",
		name = "victor_zealot_power_level_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_zealot_power_level_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.power_level_unbalance.buffs[1].multiplier
			}
		},
		buffs = {
			"power_level_unbalance"
		}
	},
	{
		description = "regrowth_desc_3",
		name = "victor_bountyhunter_regrowth_2",
		buffer = "both",
		num_ranks = 1,
		icon = "victor_bountyhunter_regrowth",
		description_values = {
			{
				value = BuffTemplates.regrowth.buffs[1].bonus
			}
		},
		buffs = {
			"victor_bountyhunter_regrowth"
		}
	},
	{
		description = "bloodlust_desc_3",
		name = "victor_bountyhunter_bloodlust_2",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_bountyhunter_bloodlust",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.bloodlust.buffs[1].multiplier
			}
		},
		buffs = {
			"victor_bountyhunter_bloodlust"
		}
	},
	{
		description = "conqueror_desc_3",
		name = "victor_bountyhunter_heal_share",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_bountyhunter_conqueror",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		buffs = {
			"victor_bountyhunter_conqueror"
		}
	},
	{
		description = "victor_bountyhunter_power_burst_on_no_ammo_desc",
		name = "victor_bountyhunter_power_burst_on_no_ammo",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_bountyhunter_melee_damage_on_no_ammo",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_attack_speed_on_no_ammo_buff.multiplier
			},
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_power_on_no_ammo_buff.multiplier
			},
			{
				value = buff_tweak_data.victor_bountyhunter_attack_speed_on_no_ammo_buff.duration
			}
		},
		buffs = {
			"victor_bountyhunter_increased_melee_damage_on_no_ammo_add"
		}
	},
	{
		description = "victor_bountyhunter_debuff_defence_on_crit_desc",
		name = "victor_bountyhunter_debuff_defence_on_crit",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_bountyhunter_debuff_defence_on_crit",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.defence_debuff_enemies.buffs[1].multiplier
			},
			{
				value = BuffTemplates.defence_debuff_enemies.buffs[1].duration
			}
		},
		buffs = {
			"victor_bountyhunter_debuff_defence_on_crit"
		}
	},
	{
		description = "victor_bountyhunter_power_level_on_clip_size_desc",
		name = "victor_bountyhunter_power_level_on_clip_size",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_bountyhunter_power_level_on_clip_size",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_power_level_on_clip_size_buff.multiplier
			}
		},
		buffs = {
			"victor_bountyhunter_power_level_on_clip_size"
		}
	},
	{
		description = "victor_bountyhunter_weapon_swap_buff_desc",
		name = "victor_bountyhunter_weapon_swap_buff",
		buffer = "both",
		num_ranks = 1,
		icon = "victor_bountyhunter_heal_on_critical_hit",
		description_values = {
			{
				value = buff_tweak_data.victor_bountyhunter_blessed_melee_damage_buff.presentation_stacks
			},
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_blessed_melee_damage_buff.multiplier
			},
			{
				value = buff_tweak_data.victor_bountyhunter_blessed_ranged_damage_buff.presentation_stacks
			},
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_blessed_ranged_damage_buff.multiplier
			}
		},
		buffs = {
			"victor_bountyhunter_weapon_swap_buff",
			"victor_bountyhunter_activate_passive_on_melee_kill"
		}
	},
	{
		description = "victor_bountyhunter_passive_reduced_cooldown_desc",
		name = "victor_bountyhunter_passive_reduced_cooldown",
		num_ranks = 1,
		icon = "victor_bountyhunter_passive_reduced_cooldown",
		description_values = {
			{
				value = buff_tweak_data.victor_bountyhunter_passive_reduced_cooldown.duration
			}
		},
		buffs = {}
	},
	{
		description = "victor_bountyhunter_passive_infinite_ammo_desc",
		name = "victor_bountyhunter_passive_infinite_ammo",
		num_ranks = 1,
		icon = "victor_bountyhunter_passive_infinite_ammo",
		buffs = {
			"victor_bountyhunter_passive_infinite_ammo"
		}
	},
	{
		description = "victor_bountyhunter_party_movespeed_on_ranged_crit_desc",
		name = "victor_bountyhunter_party_movespeed_on_ranged_crit",
		num_ranks = 1,
		icon = "victor_bountyhunter_movespeed_on_ranged_crit",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.victor_bountyhunter_party_movespeed_on_ranged_crit_buff.multiplier
			},
			{
				value = buff_tweak_data.victor_bountyhunter_party_movespeed_on_ranged_crit_buff.duration
			}
		},
		buffs = {
			"victor_bountyhunter_party_movespeed_on_ranged_crit"
		}
	},
	{
		description = "victor_bountyhunter_reload_on_kill_desc",
		name = "victor_bountyhunter_reload_on_kill",
		num_ranks = 1,
		icon = "victor_bountyhunter_restore_ammo_on_elite_kill",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_restore_ammo_on_elite_kill.ammo_bonus_fraction
			}
		},
		buffs = {
			"victor_bountyhunter_reload_on_kill",
			"victor_bountyhunter_restore_ammo_on_elite_kill"
		}
	},
	{
		description = "victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill_desc",
		name = "victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill_buff.multiplier
			},
			{
				value = buff_tweak_data.victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill_buff.max_stacks
			}
		},
		buffs = {
			"victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill"
		}
	},
	{
		description = "victor_bountyhunter_activated_ability_railgun_desc_2",
		name = "victor_bountyhunter_activated_ability_railgun",
		num_ranks = 1,
		icon = "victor_bountyhunter_activated_ability_railgun",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_activated_ability_railgun.multiplier
			}
		},
		buffs = {
			"victor_bountyhunter_activated_ability_railgun"
		}
	},
	{
		description = "victor_bountyhunter_activated_ability_blast_shotgun_desc",
		name = "victor_bountyhunter_activated_ability_blast_shotgun",
		num_ranks = 1,
		icon = "victor_bountyhunter_activated_ability_shotgun",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_activated_ability_blast_shotgun.multiplier
			},
			{
				value = buff_tweak_data.victor_bountyhunter_activated_ability_blast_shotgun.required_target_number
			}
		},
		buffs = {
			"victor_bountyhunter_activated_ability_blast_shotgun"
		}
	},
	{
		description = "victor_bountyhunter_activated_ability_reset_cooldown_on_stacks_2_desc",
		name = "victor_bountyhunter_activated_ability_reset_cooldown_on_stacks",
		num_ranks = 1,
		icon = "victor_bountyhunter_activated_ability_reset_cooldown_on_stacks",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_activated_ability_passive_cooldown_reduction.multiplier
			},
			{
				value = buff_tweak_data.victor_bountyhunter_activated_ability_passive_cooldown_reduction.cooldown
			}
		},
		buffs = {
			"victor_bountyhunter_activated_ability_passive_cooldown_reduction"
		}
	},
	{
		description = "smiter_unbalance_desc",
		name = "victor_bounty_hunter_smiter_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_bounty_hunter_smiter_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.smiter_unbalance.buffs[1].display_multiplier
			},
			{
				value_type = "percent",
				value = BuffTemplates.smiter_unbalance.buffs[1].max_display_multiplier
			}
		},
		buffs = {
			"smiter_unbalance"
		}
	},
	{
		description = "finesse_unbalance_desc",
		name = "victor_bounty_hunter_finesse_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_bounty_hunter_ninja_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.finesse_unbalance.buffs[1].display_multiplier
			},
			{
				value_type = "percent",
				value = BuffTemplates.finesse_unbalance.buffs[1].max_display_multiplier
			}
		},
		buffs = {
			"finesse_unbalance"
		}
	},
	{
		description = "power_level_unbalance_desc",
		name = "victor_bounty_hunter_power_level_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_bounty_hunter_power_level_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.power_level_unbalance.buffs[1].multiplier
			}
		},
		buffs = {
			"power_level_unbalance"
		}
	},
	{
		description = "regrowth_desc_3",
		name = "victor_witchhunter_regrowth_2",
		buffer = "both",
		num_ranks = 1,
		icon = "victor_witchhunter_regrowth",
		description_values = {
			{
				value = BuffTemplates.regrowth.buffs[1].bonus
			}
		},
		buffs = {
			"victor_witchhunter_regrowth"
		}
	},
	{
		description = "reaper_desc",
		name = "victor_witchhunter_reaper",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_witchhunter_bloodlust",
		description_values = {
			{
				value = BuffTemplates.reaper.buffs[1].max_targets
			}
		},
		buffs = {
			"victor_witchhunter_reaper"
		}
	},
	{
		description = "conqueror_desc_3",
		name = "victor_witchhunter_heal_share",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_witchhunter_conqueror",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		buffs = {
			"victor_witchhunter_conqueror"
		}
	},
	{
		description = "victor_witchhunter_headshot_damage_increase_desc_2",
		name = "victor_witchhunter_headshot_damage_increase",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_witchhunter_headshot_damage_increase",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_witchhunter_headshot_damage_increase.multiplier
			}
		},
		buffs = {
			"victor_witchhunter_headshot_damage_increase"
		}
	},
	{
		description = "victor_witchhunter_bleed_on_critical_hit_desc",
		name = "victor_witchhunter_bleed_on_critical_hit",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_witchhunter_bleed_on_critical_hit",
		description_values = {},
		buffs = {
			"victor_witchhunter_bleed_on_critical_hit"
		}
	},
	{
		description = "victor_witchhunter_guaranteed_crit_on_timed_block_desc",
		name = "victor_witchhunter_guaranteed_crit_on_timed_block",
		num_ranks = 1,
		icon = "victor_witchhunter_guaranteed_crit_on_timed_block",
		description_values = {
			{
				value = buff_tweak_data.victor_witchhunter_guaranteed_crit_on_timed_block_buff.duration
			}
		},
		buffs = {
			"victor_witchhunter_guaranteed_crit_on_timed_block_add"
		}
	},
	{
		description = "victor_witchhunter_critical_hit_chance_on_ping_target_killed_desc_2",
		name = "victor_witchhunter_critical_hit_chance_on_ping_target_killed",
		buffer = "both",
		num_ranks = 1,
		icon = "victor_witchhunter_critical_hit_chance_on_ping_target_killed",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_witchhunter_ping_target_crit_chance.bonus
			},
			{
				value = buff_tweak_data.victor_witchhunter_ping_target_crit_chance.duration
			}
		},
		buffs = {
			"victor_witchhunter_critical_hit_chance_on_ping_target_killed"
		}
	},
	{
		description = "victor_witchhunter_attack_speed_on_enemy_pinged_desc",
		name = "victor_witchhunter_attack_speed_on_enemy_pinged",
		buffer = "client",
		num_ranks = 1,
		icon = "victor_witchhunter_attack_speed_on_enemy_pinged",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_witchhunter_attack_speed_on_enemy_pinged_buff.multiplier
			},
			{
				value = buff_tweak_data.victor_witchhunter_attack_speed_on_enemy_pinged_buff.duration
			}
		},
		buffs = {
			"victor_witchhunter_attack_speed_on_enemy_pinged"
		}
	},
	{
		description = "victor_witchhunter_improved_damage_taken_ping_desc",
		name = "victor_witchhunter_improved_damage_taken_ping",
		buffer = "both",
		num_ranks = 1,
		icon = "victor_witchhunter_improved_damage_taken_ping",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_witchhunter_improved_damage_taken_ping.multiplier
			}
		},
		buffs = {}
	},
	{
		description = "victor_witchhunter_max_ammo_desc",
		name = "victor_witchhunter_max_ammo",
		num_ranks = 1,
		icon = "victor_witchhunter_max_ammo",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_witchhunter_max_ammo.multiplier
			}
		},
		buffs = {
			"victor_witchhunter_max_ammo"
		}
	},
	{
		description = "victor_witchhunter_stamina_regen_on_push_desc",
		name = "victor_witchhunter_stamina_regen_on_push",
		num_ranks = 1,
		icon = "victor_witchhunter_stamina_regen_on_push",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_witchhunter_stamina_regen_on_push_buff.multiplier
			},
			{
				value = buff_tweak_data.victor_witchhunter_stamina_regen_on_push_buff.duration
			}
		},
		buffs = {
			"victor_witchhunter_stamina_regen_on_push"
		}
	},
	{
		description = "victor_witchhunter_dodge_range_desc",
		name = "victor_witchhunter_dodge_range",
		num_ranks = 1,
		icon = "victor_witchhunter_dodge_range",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.victor_witchhunter_dodge_range.multiplier
			}
		},
		buffs = {
			"victor_witchhunter_dodge_range",
			"victor_witchhunter_dodge_speed"
		}
	},
	{
		description = "victor_captain_activated_ability_stagger_ping_debuff_desc",
		name = "victor_captain_activated_ability_stagger_ping_debuff",
		num_ranks = 1,
		icon = "victor_captain_activated_ability_stagger_ping_debuff",
		description_values = {},
		buffs = {}
	},
	{
		description = "victor_witchhunter_activated_ability_guaranteed_crit_self_buff_desc",
		name = "victor_witchhunter_activated_ability_guaranteed_crit_self_buff",
		num_ranks = 1,
		icon = "victor_witchhunter_activated_ability_guaranteed_crit_self_buff",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.victor_witchhunter_activated_ability_guaranteed_crit_self_buff.bonus
			},
			{
				value = buff_tweak_data.victor_witchhunter_activated_ability_guaranteed_crit_self_buff.duration
			}
		},
		buffs = {}
	},
	{
		description = "victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit_desc",
		name = "victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit",
		num_ranks = 1,
		icon = "victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit",
		description_values = {
			{
				value = buff_tweak_data.victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit.required_targets
			},
			{
				value_type = "percent",
				value = buff_tweak_data.victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit.cooldown_reduction
			}
		},
		buffs = {
			"victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit"
		}
	},
	{
		description = "linesman_unbalance_desc",
		name = "victor_witchhunter_linesman_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_witchhunter_linesman_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.linesman_unbalance.buffs[1].display_multiplier
			},
			{
				value_type = "percent",
				value = BuffTemplates.linesman_unbalance.buffs[1].max_display_multiplier
			}
		},
		buffs = {
			"linesman_unbalance"
		}
	},
	{
		description = "finesse_unbalance_desc",
		name = "victor_witchhunter_finesse_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_witchhunter_ninja_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.finesse_unbalance.buffs[1].display_multiplier
			},
			{
				value_type = "percent",
				value = BuffTemplates.finesse_unbalance.buffs[1].max_display_multiplier
			}
		},
		buffs = {
			"finesse_unbalance"
		}
	},
	{
		description = "power_level_unbalance_desc",
		name = "victor_witchhunter_power_level_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_witchhunter_power_level_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.power_level_unbalance.buffs[1].multiplier
			}
		},
		buffs = {
			"power_level_unbalance"
		}
	},
	{
		description = "victor_placeholder",
		name = "victor_placeholder"
	}
}

BuffUtils.copy_talent_buff_names(TalentBuffTemplates.witch_hunter)
BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.witch_hunter, buff_tweak_data)
