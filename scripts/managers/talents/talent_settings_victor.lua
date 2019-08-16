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
	victor_zealot_activated_ability_ignore_death_buff = {
		multiplier = -1
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
	victor_bountyhunter_passive_reduced_cooldown = {
		duration = 6
	},
	victor_bountyhunter_movespeed_on_ranged_crit_buff = {
		multiplier = 1.2,
		duration = 10
	},
	victor_bountyhunter_restore_ammo_on_elite_kill = {
		ammo_bonus_fraction = 0.3
	},
	victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill_buff = {
		max_stacks = 30,
		multiplier = -0.01
	},
	victor_bountyhunter_activated_ability_reset_cooldown_on_stacks = {
		multiplier = 0.02
	},
	victor_bountyhunter_activated_ability_reset_cooldown_on_stacks_buff = {
		max_stacks = 25,
		multiplier = 0.02
	},
	victor_bountyhunter_activated_ability_passive_cooldown_reduction = {
		cooldown = 10,
		multiplier = 0.15
	},
	victor_bountyhunter_activated_ability_shotgun = {
		required_target_number = 4,
		multiplier = -0.25
	},
	victor_bountyhunter_activated_ability_railgun = {
		multiplier = 0.4
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
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown
			}
		}
	},
	victor_zealot_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown_on_damage_taken
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
				perk = "uninterruptible_heavy"
			}
		}
	},
	victor_zealot_invulnerability_cooldown = {
		buffs = {
			{
				buff_after_delay = true,
				max_stacks = 1,
				refresh_durations = true,
				is_cooldown = true,
				icon = "victor_zealot_passive_invulnerability",
				delayed_buff_name = "victor_zealot_gain_invulnerability_on_lethal_damage_taken"
			}
		}
	},
	victor_zealot_gain_invulnerability_on_lethal_damage_taken = {
		buffs = {
			{
				buff_to_add = "victor_zealot_invulnerability_on_lethal_damage_taken",
				remove_on_proc = true,
				event_buff = true,
				event = "on_damage_taken",
				icon = "victor_zealot_passive_invulnerability",
				max_stacks = 1,
				buff_func = ProcFunctions.victor_zealot_gain_invulnerability
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
				priority_buff = true
			}
		}
	},
	victor_zealot_activated_ability = {
		buffs = {
			{
				remove_buff_func = "end_zealot_activated_ability",
				perk = "victor_zealot_activated_ability",
				stat_buff = "attack_speed",
				max_stacks = 1,
				icon = "victor_zealot_activated_ability",
				priority_buff = true
			}
		}
	},
	victor_zealot_reaper = {
		buffs = {
			{
				multiplier = -0.05,
				name = "reaper",
				event_buff = true,
				event = "on_damage_dealt",
				perk = "linesman_healing",
				max_targets = 5,
				bonus = 0.25,
				buff_func = ProcFunctions.heal_damage_targets_on_melee
			}
		}
	},
	victor_zealot_bloodlust = {
		buffs = {
			{
				multiplier = 0.45,
				name = "bloodlust",
				event_buff = true,
				event = "on_damage_dealt",
				perk = "smiter_healing",
				heal_cap = 0.25,
				buff_func = ProcFunctions.heal_percent_of_damage_dealt_on_melee
			}
		}
	},
	victor_zealot_conqueror = {
		buffs = {
			{
				multiplier = 0.2,
				name = "conqueror",
				event_buff = true,
				event = "on_healed_consumeable",
				range = 10,
				buff_func = ProcFunctions.heal_other_players_percent_at_range
			}
		}
	},
	victor_zealot_crit_count = {
		buffs = {
			{
				event = "on_hit",
				buff_to_add = "victor_zealot_counter_buff",
				event_buff = true,
				buff_func = ProcFunctions.add_buff_on_first_target_hit
			}
		}
	},
	victor_zealot_counter_buff = {
		buffs = {
			{
				reset_on_max_stacks = true,
				max_stacks = 5,
				icon = "victor_zealot_crit_count",
				dormant = true,
				on_max_stacks_func = function (player, sub_buff_template)
					if not Managers.state.network.is_server then
						return
					end

					local player_unit = player.player_unit

					if Unit.alive(player_unit) then
						local buff_to_add = "victor_zealot_crit_count_buff"
						local buff_system = Managers.state.entity:system("buff_system")

						buff_system:add_buff(player_unit, buff_to_add, player_unit, true)
					end
				end
			}
		}
	},
	victor_zealot_crit_count_buff = {
		buffs = {
			{
				event = "on_critical_action",
				icon = "victor_zealot_crit_count",
				event_buff = true,
				remove_on_proc = true,
				perk = "guaranteed_crit",
				max_stacks = 1,
				buff_func = ProcFunctions.dummy_function
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
				dormant = true,
				icon = "victor_zealot_attack_speed_on_health_percent",
				stat_buff = "attack_speed",
				multiplier = 0.1
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
				stat_buff = "damage_taken_secondary"
			}
		}
	},
	victor_zealot_move_speed_on_damage_taken = {
		buffs = {
			{
				buff_to_add = "victor_zealot_move_speed_on_damage_taken_buff",
				event_buff = true,
				event = "on_damage_taken",
				perk = "no_moveslow_on_hit",
				buff_func = ProcFunctions.add_buff_on_enemy_damage_taken
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
				event_buff = true,
				buff_func = ProcFunctions.restore_stamina_on_enemy_damage_taken
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
				buff_to_add = "victor_zealot_activated_ability_power_on_hit_buff",
				event_buff = true,
				event = "on_hit",
				duration = 5,
				buff_func = ProcFunctions.add_buff
			}
		}
	},
	victor_zealot_activated_ability_power_on_hit_buff = {
		buffs = {
			{
				refresh_durations = true,
				icon = "victor_zealot_activated_ability_power_on_hit",
				stat_buff = "power_level",
				dormant = true
			}
		}
	},
	victor_zealot_activated_ability_ignore_death = {
		buffs = {
			{
				buff_to_add = "victor_zealot_activated_ability_ignore_death_buff",
				remove_on_proc = true,
				event_buff = true,
				event = "on_damage_taken",
				icon = "victor_zealot_passive_invulnerability",
				max_stacks = 1,
				duration = 5,
				buff_func = ProcFunctions.victor_zealot_gain_invulnerability
			}
		}
	},
	victor_zealot_activated_ability_ignore_death_buff = {
		activation_effect = "fx/screenspace_potion_03",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_tank_activate",
		buffs = {
			{
				duration = 5,
				stat_buff = "damage_taken",
				max_stacks = 1,
				icon = "victor_zealot_passive_invulnerability",
				dormant = true
			}
		}
	},
	victor_zealot_activated_ability_cooldown_stack_on_hit = {
		buffs = {
			{
				buff_to_add = "victor_zealot_activated_ability_cooldown_stack_on_hit_buff",
				event_buff = true,
				event = "on_hit",
				duration = 5,
				buff_func = ProcFunctions.add_buff
			}
		}
	},
	victor_zealot_activated_ability_cooldown_stack_on_hit_buff = {
		buffs = {
			{
				icon = "victor_zealot_activated_ability_cooldown_stack_on_hit",
				refresh_durations = true,
				duration = 5,
				remove_buff_func = "reduce_cooldown_on_buff_removed",
				dormant = true
			}
		}
	},
	victor_bountyhunter_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown
			}
		}
	},
	victor_bountyhunter_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown_on_damage_taken
			}
		}
	},
	victor_bountyhunter_passive_crit_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "victor_bountyhunter_passive",
				dormant = true,
				stat_buff = "critical_strike_chance_ranged"
			}
		}
	},
	victor_bountyhunter_passive_crit_buff_removal = {
		buffs = {
			{
				event = "on_critical_action",
				event_buff = true,
				buff_func = ProcFunctions.remove_victor_bountyhunter_passive_crit_buff
			}
		}
	},
	victor_bountyhunter_passive_crit_cooldown = {
		buffs = {
			{
				buff_after_delay = true,
				max_stacks = 1,
				refresh_durations = true,
				is_cooldown = true,
				icon = "victor_bountyhunter_passive",
				dormant = true,
				delayed_buff_name = "victor_bountyhunter_passive_crit_buff"
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
				event_buff = true,
				event = "on_hit",
				perk = "ninja_healing",
				bonus = 2,
				buff_func = ProcFunctions.heal_finesse_damage_on_melee
			}
		}
	},
	victor_bountyhunter_conqueror = {
		buffs = {
			{
				multiplier = 0.2,
				name = "conqueror",
				event_buff = true,
				event = "on_healed_consumeable",
				range = 10,
				buff_func = ProcFunctions.heal_other_players_percent_at_range
			}
		}
	},
	victor_bountyhunter_bloodlust = {
		buffs = {
			{
				multiplier = 0.45,
				name = "bloodlust",
				event_buff = true,
				event = "on_damage_dealt",
				perk = "smiter_healing",
				heal_cap = 0.25,
				buff_func = ProcFunctions.heal_percent_of_damage_dealt_on_melee
			}
		}
	},
	victor_bountyhunter_increased_melee_damage_on_no_ammo_add = {
		buffs = {
			{
				buff_to_add = "victor_bountyhunter_melee_damage_on_no_ammo_buff",
				event = "on_last_ammo_used",
				event_buff = true,
				buff_func = ProcFunctions.bardin_ranger_add_power_on_no_ammo_proc
			}
		}
	},
	victor_bountyhunter_increased_melee_damage_on_no_ammo_remove = {
		buffs = {
			{
				event = "on_gained_ammo_from_no_ammo",
				buff_to_remove = "victor_bountyhunter_melee_damage_on_no_ammo_buff",
				event_buff = true,
				buff_func = ProcFunctions.bardin_ranger_remove_power_on_no_ammo_proc
			}
		}
	},
	victor_bountyhunter_melee_damage_on_no_ammo_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "victor_bountyhunter_melee_damage_on_no_ammo",
				priority_buff = true,
				stat_buff = "power_level"
			}
		}
	},
	victor_bountyhunter_debuff_defence_on_crit = {
		buffs = {
			{
				event = "on_critical_hit",
				buff_to_add = "defence_debuff_enemies",
				event_buff = true,
				buff_func = ProcFunctions.on_hit_debuff_enemy_defence
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
				stat_buff = "power_level_ranged",
				dormant = true
			}
		}
	},
	victor_bountyhunter_passive_reduced_cooldown = {
		buffs = {
			{
				buff_after_delay = true,
				max_stacks = 1,
				refresh_durations = true,
				is_cooldown = true,
				icon = "victor_bountyhunter_passive",
				dormant = true,
				delayed_buff_name = "victor_bountyhunter_passive_crit_buff"
			}
		}
	},
	victor_bountyhunter_activate_passive_on_melee_kill = {
		buffs = {
			{
				event = "on_kill",
				event_buff = true,
				buff_func = ProcFunctions.victor_bountyhunter_activate_passive_on_melee_kill
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
				icon = "victor_bountyhunter_passive_infinite_ammo"
			}
		}
	},
	victor_bountyhunter_movespeed_on_ranged_crit = {
		buffs = {
			{
				event = "on_hit",
				buff_to_add = "victor_bountyhunter_movespeed_on_ranged_crit_buff",
				event_buff = true,
				buff_func = ProcFunctions.add_buff_on_ranged_critical_hit
			}
		}
	},
	victor_bountyhunter_restore_ammo_on_elite_kill = {
		buffs = {
			{
				event = "on_kill",
				event_buff = true,
				buff_func = ProcFunctions.victor_bounty_hunter_ammo_fraction_gain_out_of_ammo
			}
		}
	},
	victor_bountyhunter_movespeed_on_ranged_crit_buff = {
		buffs = {
			{
				remove_buff_func = "remove_movement_buff",
				refresh_durations = true,
				dormant = true,
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
				event_buff = true,
				buff_func = ProcFunctions.add_buff_on_elite_or_special_kill
			}
		}
	},
	victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill_buff = {
		buffs = {
			{
				dormant = true,
				icon = "victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill",
				stat_buff = "damage_taken_secondary"
			}
		}
	},
	victor_bountyhunter_activated_ability_reset_cooldown_on_stacks = {
		buffs = {
			{
				event = "on_kill",
				event_buff = true,
				buff_func = ProcFunctions.victor_bountyhunter_reduce_activated_ability_cooldown_ignore_paused_on_kill
			}
		}
	},
	victor_bountyhunter_activated_ability_passive_cooldown_reduction = {
		buffs = {
			{
				event = "on_critical_hit",
				event_buff = true,
				buff_func = ProcFunctions.victor_bountyhunter_reduce_activated_ability_cooldown_on_passive_crit
			}
		}
	},
	victor_bountyhunter_activated_ability_reset_cooldown_on_stacks_buff = {
		buffs = {
			{
				icon = "victor_bountyhunter_activated_ability_reset_cooldown_on_stacks",
				dormant = true,
				reset_on_max_stacks = true,
				on_max_stacks_func = function (player, sub_buff_template)
					local player_unit = player.player_unit

					if Unit.alive(player_unit) then
						local career_extension = ScriptUnit.has_extension(player_unit, "career_system")

						career_extension:set_activated_ability_cooldown_unpaused()
						career_extension:reduce_activated_ability_cooldown_percent(1)
					end
				end
			}
		}
	},
	victor_bountyhunter_activated_ability_shotgun = {
		buffs = {
			{
				stat_buff = "activated_cooldown"
			}
		}
	},
	victor_bountyhunter_activated_ability_railgun = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.victor_bounty_hunter_reduce_activated_ability_cooldown_railgun
			}
		}
	},
	victor_witchhunter_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown
			}
		}
	},
	victor_witchhunter_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown_on_damage_taken
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
				perk = "in_arc_block_cost_reduction"
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
				perk = "crit_headshot_killing_blow"
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
				event_buff = true,
				event = "on_hit",
				perk = "ninja_healing",
				bonus = 2,
				buff_func = ProcFunctions.heal_finesse_damage_on_melee
			}
		}
	},
	victor_witchhunter_reaper = {
		buffs = {
			{
				multiplier = -0.05,
				name = "reaper",
				event_buff = true,
				event = "on_damage_dealt",
				perk = "linesman_healing",
				max_targets = 5,
				bonus = 0.25,
				buff_func = ProcFunctions.heal_damage_targets_on_melee
			}
		}
	},
	victor_witchhunter_conqueror = {
		buffs = {
			{
				multiplier = 0.2,
				name = "conqueror",
				event_buff = true,
				event = "on_healed_consumeable",
				range = 10,
				buff_func = ProcFunctions.heal_other_players_percent_at_range
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
				event_buff = true,
				buff_func = ProcFunctions.add_buff
			}
		}
	},
	victor_witchhunter_guaranteed_crit_on_timed_block_buff = {
		buffs = {
			{
				stat_buff = "critical_strike_chance",
				event = "on_hit",
				event_buff = true,
				remove_on_proc = true,
				icon = "victor_witchhunter_guaranteed_crit_on_timed_block",
				dormant = true,
				max_stacks = 1,
				buff_func = ProcFunctions.dummy_function
			}
		}
	},
	victor_witchhunter_bleed_on_critical_hit = {
		buffs = {
			{
				perk = "victor_witchhunter_bleed_on_critical_hit"
			}
		}
	},
	victor_witchhunter_critical_hit_chance_on_ping_target_killed = {
		buffs = {
			{
				event = "on_ping_target_killed",
				buff_to_add = "victor_witchhunter_ping_target_crit_chance",
				event_buff = true,
				buff_func = ProcFunctions.add_buff_to_all_players
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
				event = "on_enemy_pinged",
				buff_to_add = "victor_witchhunter_attack_speed_on_enemy_pinged_buff",
				event_buff = true,
				buff_func = ProcFunctions.add_buff
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
				event_buff = true,
				buff_func = ProcFunctions.add_buff
			}
		}
	},
	victor_witchhunter_stamina_regen_on_push_buff = {
		buffs = {
			{
				icon = "victor_witchhunter_stamina_regen_on_push",
				stat_buff = "fatigue_regen",
				max_stacks = 1,
				refresh_durations = true,
				dormant = true
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
				event_buff = true,
				buff_func = ProcFunctions.victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit
			}
		}
	},
	victor_witchhunter_activated_ability_guaranteed_crit_self_buff = {
		buffs = {
			{
				refresh_durations = true,
				stat_buff = "critical_strike_chance_melee",
				max_stacks = 1,
				icon = "victor_witchhunter_activated_ability_guaranteed_crit_self_buff",
				dormant = true
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
			"victor_bountyhunter_melee_damage_on_no_ammo",
			"victor_bountyhunter_power_level_on_clip_size"
		},
		{
			"victor_bounty_hunter_smiter_unbalance",
			"victor_bounty_hunter_finesse_unbalance",
			"victor_bounty_hunter_power_level_unbalance"
		},
		{
			"victor_bountyhunter_activate_passive_on_melee_kill",
			"victor_bountyhunter_passive_reduced_cooldown",
			"victor_bountyhunter_passive_infinite_ammo"
		},
		{
			"victor_bountyhunter_movespeed_on_ranged_crit",
			"victor_bountyhunter_restore_ammo_on_elite_kill",
			"victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill"
		},
		{
			"victor_bountyhunter_activated_ability_reset_cooldown_on_stacks",
			"victor_bountyhunter_activated_ability_railgun",
			"victor_bountyhunter_activated_ability_shotgun"
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
		num_ranks = 1,
		buffer = "server",
		icon = "victor_zealot_regrowth",
		description_values = {
			{
				value = BuffTemplates.reaper.buffs[1].max_targets
			}
		},
		requirements = {},
		buffs = {
			"victor_zealot_reaper"
		},
		buff_data = {}
	},
	{
		description = "bloodlust_desc_3",
		name = "victor_zealot_bloodlust_2",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_zealot_bloodlust",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.bloodlust.buffs[1].multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_zealot_bloodlust"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc_3",
		name = "victor_zealot_heal_share",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_zealot_conqueror",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_zealot_conqueror"
		},
		buff_data = {}
	},
	{
		description = "victor_zealot_crit_count_desc",
		name = "victor_zealot_crit_count",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_zealot_crit_count",
		description_values = {
			{
				value = buff_tweak_data.victor_zealot_crit_count.buff_on_stacks
			}
		},
		requirements = {},
		buffs = {
			"victor_zealot_crit_count"
		},
		buff_data = {},
		perks = {
			"no_random_crits"
		}
	},
	{
		description = "victor_zealot_power_desc",
		name = "victor_zealot_power",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_zealot_power",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_power.multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_zealot_power"
		},
		buff_data = {}
	},
	{
		description = "victor_zealot_attack_speed_on_health_percent_desc",
		name = "victor_zealot_attack_speed_on_health_percent",
		num_ranks = 1,
		buffer = "server",
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
		requirements = {},
		buffs = {
			"victor_zealot_attack_speed_on_health_percent"
		},
		buff_data = {}
	},
	{
		description = "victor_zealot_passive_move_speed_desc",
		name = "victor_zealot_passive_move_speed",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_zealot_passive_move_speed",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.victor_zealot_passive_move_speed_buff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_zealot_passive_move_speed"
		},
		buff_data = {}
	},
	{
		description = "victor_zealot_passive_healing_received_desc",
		name = "victor_zealot_passive_healing_received",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_zealot_passive_healing_received",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_passive_healing_received_buff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_zealot_passive_healing_received"
		},
		buff_data = {}
	},
	{
		description = "victor_zealot_passive_damage_taken_desc",
		name = "victor_zealot_passive_damage_taken",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_zealot_passive_damage_taken",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_passive_damage_taken_buff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_zealot_passive_damage_taken"
		},
		buff_data = {}
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
		requirements = {},
		buffs = {
			"victor_zealot_move_speed_on_damage_taken"
		},
		buff_data = {}
	},
	{
		description = "victor_zealot_max_stamina_on_damage_taken_desc",
		name = "victor_zealot_max_stamina_on_damage_taken",
		num_ranks = 1,
		icon = "victor_zealot_max_stamina_on_damage_taken",
		requirements = {},
		buffs = {
			"victor_zealot_max_stamina_on_damage_taken"
		},
		buff_data = {}
	},
	{
		description = "victor_zealot_reduced_damage_taken_desc",
		name = "victor_zealot_reduced_damage_taken",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_zealot_reduced_damage_taken",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_reduced_damage_taken_buff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_zealot_reduced_damage_taken_buff"
		},
		buff_data = {}
	},
	{
		description = "victor_zealot_activated_ability_power_on_hit_desc",
		name = "victor_zealot_activated_ability_power_on_hit",
		num_ranks = 1,
		buffer = "server",
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
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "victor_zealot_activated_ability_ignore_death_desc",
		name = "victor_zealot_activated_ability_ignore_death",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_zealot_activated_ability_ignore_death",
		requirements = {},
		buffs = {},
		buff_data = {}
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
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "smiter_unbalance_desc",
		name = "victor_zealot_smiter_unbalance",
		num_ranks = 1,
		buffer = "server",
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
		requirements = {},
		buffs = {
			"smiter_unbalance"
		},
		buff_data = {}
	},
	{
		description = "linesman_unbalance_desc",
		name = "victor_zealot_linesman_unbalance",
		num_ranks = 1,
		buffer = "server",
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
		requirements = {},
		buffs = {
			"linesman_unbalance"
		},
		buff_data = {}
	},
	{
		description = "power_level_unbalance_desc",
		name = "victor_zealot_power_level_unbalance",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_zealot_power_level_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.power_level_unbalance.buffs[1].multiplier
			}
		},
		requirements = {},
		buffs = {
			"power_level_unbalance"
		},
		buff_data = {}
	},
	{
		description = "regrowth_desc_3",
		name = "victor_bountyhunter_regrowth_2",
		num_ranks = 1,
		buffer = "both",
		icon = "victor_bountyhunter_regrowth",
		description_values = {
			{
				value = BuffTemplates.regrowth.buffs[1].bonus
			}
		},
		requirements = {},
		buffs = {
			"victor_bountyhunter_regrowth"
		},
		buff_data = {}
	},
	{
		description = "bloodlust_desc_3",
		name = "victor_bountyhunter_bloodlust_2",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_bountyhunter_bloodlust",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.bloodlust.buffs[1].multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_bountyhunter_bloodlust"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc_3",
		name = "victor_bountyhunter_heal_share",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_bountyhunter_conqueror",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_bountyhunter_conqueror"
		},
		buff_data = {}
	},
	{
		description = "victor_bountyhunter_melee_damage_on_no_ammo_desc",
		name = "victor_bountyhunter_melee_damage_on_no_ammo",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_bountyhunter_melee_damage_on_no_ammo",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_melee_damage_on_no_ammo_buff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_bountyhunter_increased_melee_damage_on_no_ammo_add",
			"victor_bountyhunter_increased_melee_damage_on_no_ammo_remove"
		},
		buff_data = {}
	},
	{
		description = "victor_bountyhunter_debuff_defence_on_crit_desc",
		name = "victor_bountyhunter_debuff_defence_on_crit",
		num_ranks = 1,
		buffer = "server",
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
		requirements = {},
		buffs = {
			"victor_bountyhunter_debuff_defence_on_crit"
		},
		buff_data = {}
	},
	{
		description = "victor_bountyhunter_power_level_on_clip_size_desc",
		name = "victor_bountyhunter_power_level_on_clip_size",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_bountyhunter_power_level_on_clip_size",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_power_level_on_clip_size_buff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_bountyhunter_power_level_on_clip_size"
		},
		buff_data = {}
	},
	{
		description = "victor_bountyhunter_activate_passive_on_melee_kill_desc",
		name = "victor_bountyhunter_activate_passive_on_melee_kill",
		num_ranks = 1,
		buffer = "both",
		icon = "victor_bountyhunter_heal_on_critical_hit",
		description_values = {},
		requirements = {},
		buffs = {
			"victor_bountyhunter_activate_passive_on_melee_kill"
		},
		buff_data = {}
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
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "victor_bountyhunter_passive_infinite_ammo_desc",
		name = "victor_bountyhunter_passive_infinite_ammo",
		num_ranks = 1,
		icon = "victor_bountyhunter_passive_infinite_ammo",
		requirements = {},
		buffs = {
			"victor_bountyhunter_passive_infinite_ammo"
		},
		buff_data = {}
	},
	{
		description = "victor_bountyhunter_movespeed_on_ranged_crit_desc",
		name = "victor_bountyhunter_movespeed_on_ranged_crit",
		num_ranks = 1,
		icon = "victor_bountyhunter_movespeed_on_ranged_crit",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.victor_bountyhunter_movespeed_on_ranged_crit_buff.multiplier
			},
			{
				value = buff_tweak_data.victor_bountyhunter_movespeed_on_ranged_crit_buff.duration
			}
		},
		requirements = {},
		buffs = {
			"victor_bountyhunter_movespeed_on_ranged_crit"
		},
		buff_data = {}
	},
	{
		description = "victor_bountyhunter_restore_ammo_on_elite_kill_desc",
		name = "victor_bountyhunter_restore_ammo_on_elite_kill",
		num_ranks = 1,
		icon = "victor_bountyhunter_restore_ammo_on_elite_kill",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_restore_ammo_on_elite_kill.ammo_bonus_fraction
			}
		},
		requirements = {},
		buffs = {
			"victor_bountyhunter_restore_ammo_on_elite_kill"
		},
		buff_data = {}
	},
	{
		description = "victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill_desc",
		name = "victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill",
		num_ranks = 1,
		buffer = "server",
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
		requirements = {},
		buffs = {
			"victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill"
		},
		buff_data = {}
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
		requirements = {},
		buffs = {
			"victor_bountyhunter_activated_ability_railgun"
		},
		buff_data = {}
	},
	{
		description = "victor_bountyhunter_activated_ability_shotgun_desc_2",
		name = "victor_bountyhunter_activated_ability_shotgun",
		num_ranks = 1,
		icon = "victor_bountyhunter_activated_ability_shotgun",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_activated_ability_shotgun.multiplier
			},
			{
				value = buff_tweak_data.victor_bountyhunter_activated_ability_shotgun.required_target_number
			}
		},
		requirements = {},
		buffs = {
			"victor_bountyhunter_activated_ability_shotgun"
		},
		buff_data = {}
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
		requirements = {},
		buffs = {
			"victor_bountyhunter_activated_ability_passive_cooldown_reduction"
		},
		buff_data = {}
	},
	{
		description = "smiter_unbalance_desc",
		name = "victor_bounty_hunter_smiter_unbalance",
		num_ranks = 1,
		buffer = "server",
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
		requirements = {},
		buffs = {
			"smiter_unbalance"
		},
		buff_data = {}
	},
	{
		description = "finesse_unbalance_desc",
		name = "victor_bounty_hunter_finesse_unbalance",
		num_ranks = 1,
		buffer = "server",
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
		requirements = {},
		buffs = {
			"finesse_unbalance"
		},
		buff_data = {}
	},
	{
		description = "power_level_unbalance_desc",
		name = "victor_bounty_hunter_power_level_unbalance",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_bounty_hunter_power_level_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.power_level_unbalance.buffs[1].multiplier
			}
		},
		requirements = {},
		buffs = {
			"power_level_unbalance"
		},
		buff_data = {}
	},
	{
		description = "regrowth_desc_3",
		name = "victor_witchhunter_regrowth_2",
		num_ranks = 1,
		buffer = "both",
		icon = "victor_witchhunter_regrowth",
		description_values = {
			{
				value = BuffTemplates.regrowth.buffs[1].bonus
			}
		},
		requirements = {},
		buffs = {
			"victor_witchhunter_regrowth"
		},
		buff_data = {}
	},
	{
		description = "reaper_desc",
		name = "victor_witchhunter_reaper",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_witchhunter_bloodlust",
		description_values = {
			{
				value = BuffTemplates.reaper.buffs[1].max_targets
			}
		},
		requirements = {},
		buffs = {
			"victor_witchhunter_reaper"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc_3",
		name = "victor_witchhunter_heal_share",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_witchhunter_conqueror",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_witchhunter_conqueror"
		},
		buff_data = {}
	},
	{
		description = "victor_witchhunter_headshot_damage_increase_desc_2",
		name = "victor_witchhunter_headshot_damage_increase",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_witchhunter_headshot_damage_increase",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_witchhunter_headshot_damage_increase.multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_witchhunter_headshot_damage_increase"
		},
		buff_data = {}
	},
	{
		description = "victor_witchhunter_bleed_on_critical_hit_desc",
		name = "victor_witchhunter_bleed_on_critical_hit",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_witchhunter_bleed_on_critical_hit",
		description_values = {},
		requirements = {},
		buffs = {
			"victor_witchhunter_bleed_on_critical_hit"
		},
		buff_data = {}
	},
	{
		description = "victor_witchhunter_guaranteed_crit_on_timed_block_desc",
		name = "victor_witchhunter_guaranteed_crit_on_timed_block",
		num_ranks = 1,
		icon = "victor_witchhunter_guaranteed_crit_on_timed_block",
		description_values = {},
		requirements = {},
		buffs = {
			"victor_witchhunter_guaranteed_crit_on_timed_block_add"
		},
		buff_data = {}
	},
	{
		description = "victor_witchhunter_critical_hit_chance_on_ping_target_killed_desc_2",
		name = "victor_witchhunter_critical_hit_chance_on_ping_target_killed",
		num_ranks = 1,
		buffer = "both",
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
		requirements = {},
		buffs = {
			"victor_witchhunter_critical_hit_chance_on_ping_target_killed"
		},
		buff_data = {}
	},
	{
		description = "victor_witchhunter_attack_speed_on_enemy_pinged_desc",
		name = "victor_witchhunter_attack_speed_on_enemy_pinged",
		num_ranks = 1,
		buffer = "both",
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
		requirements = {},
		buffs = {
			"victor_witchhunter_attack_speed_on_enemy_pinged"
		},
		buff_data = {}
	},
	{
		description = "victor_witchhunter_improved_damage_taken_ping_desc",
		name = "victor_witchhunter_improved_damage_taken_ping",
		num_ranks = 1,
		buffer = "both",
		icon = "victor_witchhunter_improved_damage_taken_ping",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_witchhunter_improved_damage_taken_ping.multiplier
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
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
		requirements = {},
		buffs = {
			"victor_witchhunter_max_ammo"
		},
		buff_data = {}
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
		requirements = {},
		buffs = {
			"victor_witchhunter_stamina_regen_on_push"
		},
		buff_data = {}
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
		requirements = {},
		buffs = {
			"victor_witchhunter_dodge_range",
			"victor_witchhunter_dodge_speed"
		},
		buff_data = {}
	},
	{
		description = "victor_captain_activated_ability_stagger_ping_debuff_desc",
		name = "victor_captain_activated_ability_stagger_ping_debuff",
		num_ranks = 1,
		icon = "victor_captain_activated_ability_stagger_ping_debuff",
		description_values = {},
		requirements = {},
		buffs = {},
		buff_data = {}
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
		requirements = {},
		buffs = {},
		buff_data = {}
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
		requirements = {},
		buffs = {
			"victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit"
		},
		buff_data = {}
	},
	{
		description = "linesman_unbalance_desc",
		name = "victor_witchhunter_linesman_unbalance",
		num_ranks = 1,
		buffer = "server",
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
		requirements = {},
		buffs = {
			"linesman_unbalance"
		},
		buff_data = {}
	},
	{
		description = "finesse_unbalance_desc",
		name = "victor_witchhunter_finesse_unbalance",
		num_ranks = 1,
		buffer = "server",
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
		requirements = {},
		buffs = {
			"finesse_unbalance"
		},
		buff_data = {}
	},
	{
		description = "power_level_unbalance_desc",
		name = "victor_witchhunter_power_level_unbalance",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_witchhunter_power_level_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.power_level_unbalance.buffs[1].multiplier
			}
		},
		requirements = {},
		buffs = {
			"power_level_unbalance"
		},
		buff_data = {}
	},
	{
		description = "victor_placeholder",
		name = "victor_placeholder"
	}
}

for name, data in pairs(TalentBuffTemplates.witch_hunter) do
	local buffs = data.buffs

	fassert(#buffs == 1, "talent buff has more than one sub buff, add multiple buffs from the talent instead")

	local buff = buffs[1]
	buff.name = name
end

BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.witch_hunter, buff_tweak_data)

return
