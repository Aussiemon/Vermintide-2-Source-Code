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
		max_stacks = 5,
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
	victor_zealot_crit_chance = {
		bonus = 0.05
	},
	victor_zealot_stamina_regen = {
		multiplier = 0.3
	},
	victor_zealot_stun_reduction = {
		multiplier = 0.35
	},
	victor_zealot_increased_damage_on_enemy_proximity = {
		chunk_size = 1,
		range = 3
	},
	victor_zealot_damage_on_enemy_proximity = {
		max_stacks = 5,
		multiplier = 0.03
	},
	victor_zealot_damage_taken_capped = {
		bonus = 10
	},
	victor_zealot_increased_defence_low_health = {
		activation_health = 0.5
	},
	victor_zealot_defence_on_low_health = {
		multiplier = -0.35
	},
	victor_zealot_increased_block_arc_from_passive = {
		chunk_size = 25
	},
	victor_zealot_block_arc_from_passive = {
		max_stacks = 5,
		multiplier = 0.1
	},
	victor_zealot_increased_critical_hit_damage_from_passive = {
		chunk_size = 25
	},
	victor_zealot_critical_hit_damage_from_passive = {
		max_stacks = 5,
		multiplier = 0.1
	},
	victor_zealot_increased_stamina_from_passive = {
		chunk_size = 25
	},
	victor_zealot_stamina_from_passive = {
		max_stacks = 5,
		bonus = 1
	},
	victor_zealot_activated_ability_duration = {
		duration = 8,
		multiplier = 0.25
	},
	victor_zealot_activated_ability_heal_buff = {
		bonus = 2
	},
	victor_zealot_activated_ability_cooldown = {
		multiplier = -0.3
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
	victor_bountyhunter_reduced_spread = {
		multiplier = -0.25
	},
	victor_bountyhunter_increased_attack_speed = {
		multiplier = 0.05
	},
	victor_bountyhunter_reload_speed = {
		multiplier = -0.2
	},
	victor_bountyhunter_revive_speed = {
		multiplier = 0.3
	},
	victor_bountyhunter_melee_damage_on_no_ammo_buff = {
		multiplier = 0.25
	},
	victor_bountyhunter_critical_hit_damage = {
		multiplier = 0.25
	},
	victor_bountyhunter_passive_reduced_cooldown = {
		duration = 7
	},
	victor_bountyhunter_heal_on_critical_hit = {
		bonus = 2
	},
	victor_bountyhunter_activated_ability_cooldown = {
		multiplier = -0.3
	},
	victor_bountyhunter_activated_ability_shotgun = {
		bonus = 35
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
		bonus = 0.2
	},
	victor_witchhunter_max_ammo = {
		multiplier = 0.3
	},
	victor_witchhunter_max_stamina = {
		bonus = 2
	},
	victor_witchhunter_damage_on_grimoire_picked_up = {
		multiplier = 0.15
	},
	victor_witchhunter_headshot_damage_increase = {
		multiplier = 0.5
	},
	victor_witchhunter_defence_buff_on_disabled = {
		multiplier = -0.5
	},
	victor_witchhunter_ping_target_attack_speed = {
		multiplier = 0.1,
		duration = 4
	},
	victor_witchhunter_ping_target_crit_chance = {
		bonus = 0.08,
		duration = 4
	},
	victor_witchhunter_dodge_range = {
		multiplier = 1.2
	},
	victor_witchhunter_dodge_speed = {
		multiplier = 1.2
	},
	victor_witchhunter_heal_party_on_ping_target_killed = {
		bonus = 2
	},
	victor_witchhunter_activated_ability_cooldown = {
		multiplier = -0.3
	},
	victor_witchhunter_activated_ability_duration = {
		max_stacks = 1,
		duration = 10,
		bonus = 0.2
	},
	victor_witchhunter_activated_ability_radius = {
		multiplier = 0.5
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
				update_func = "activate_buff_stacks_based_on_health_chunks"
			}
		}
	},
	victor_zealot_passive_damage = {
		buffs = {
			{
				icon = "victor_zealot_passive",
				stat_buff = StatBuffIndex.POWER_LEVEL
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
				remove_on_proc = true,
				max_stacks = 1,
				event_buff = true,
				event = "on_damage_taken",
				icon = "victor_zealot_passive_invulnerability",
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
				max_stacks = 1,
				icon = "victor_zealot_passive_invulnerability",
				priority_buff = true,
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	victor_zealot_activated_ability = {
		buffs = {
			{
				remove_buff_func = "end_zealot_activated_ability",
				max_stacks = 1,
				icon = "victor_zealot_activated_ability",
				priority_buff = true,
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	victor_zealot_crit_chance = {
		buffs = {
			{
				stat_buff = StatBuffIndex.CRITICAL_STRIKE_CHANCE
			}
		}
	},
	victor_zealot_stamina_regen = {
		buffs = {
			{
				stat_buff = StatBuffIndex.FATIGUE_REGEN
			}
		}
	},
	victor_zealot_stun_reduction = {
		buffs = {
			{
				stat_buff = StatBuffIndex.STUN_DURATION
			}
		}
	},
	victor_zealot_dodge_speed = {
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
	victor_zealot_increased_damage_on_enemy_proximity = {
		buffs = {
			{
				buff_to_add = "victor_zealot_damage_on_enemy_proximity",
				update_func = "activate_buff_stacks_based_on_enemy_proximity"
			}
		}
	},
	victor_zealot_damage_on_enemy_proximity = {
		buffs = {
			{
				icon = "victor_zealot_increased_damage_on_enemy_proximity",
				stat_buff = StatBuffIndex.POWER_LEVEL
			}
		}
	},
	victor_zealot_damage_taken_capped = {
		buffs = {
			{
				stat_buff = StatBuffIndex.MAX_DAMAGE_TAKEN
			}
		}
	},
	victor_zealot_increased_defence_low_health = {
		buffs = {
			{
				buff_to_add = "victor_zealot_defence_on_low_health",
				activate_below = true,
				update_func = "activate_buff_on_health_percent"
			}
		}
	},
	victor_zealot_defence_on_low_health = {
		buffs = {
			{
				max_stacks = 1,
				icon = "victor_zealot_increased_defence_low_health",
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	victor_zealot_increased_block_arc_from_passive = {
		buffs = {
			{
				buff_to_add = "victor_zealot_block_arc_from_passive",
				update_func = "activate_buff_stacks_based_on_health_chunks"
			}
		}
	},
	victor_zealot_block_arc_from_passive = {
		buffs = {
			{
				icon = "victor_zealot_increased_block_arc_from_passive",
				stat_buff = StatBuffIndex.BLOCK_ANGLE
			}
		}
	},
	victor_zealot_increased_critical_hit_damage_from_passive = {
		buffs = {
			{
				buff_to_add = "victor_zealot_critical_hit_damage_from_passive",
				update_func = "activate_buff_stacks_based_on_health_chunks"
			}
		}
	},
	victor_zealot_critical_hit_damage_from_passive = {
		buffs = {
			{
				icon = "victor_zealot_increased_critical_hit_damage_from_passive",
				stat_buff = StatBuffIndex.CRITICAL_STRIKE_EFFECTIVENESS
			}
		}
	},
	victor_zealot_increased_stamina_from_passive = {
		buffs = {
			{
				buff_to_add = "victor_zealot_stamina_from_passive",
				update_func = "activate_buff_stacks_based_on_health_chunks"
			}
		}
	},
	victor_zealot_stamina_from_passive = {
		buffs = {
			{
				icon = "victor_zealot_increased_stamina_from_passive",
				stat_buff = StatBuffIndex.MAX_FATIGUE
			}
		}
	},
	victor_zealot_activated_ability_duration = {
		buffs = {
			{
				remove_buff_func = "end_zealot_activated_ability",
				icon = "victor_zealot_activated_ability",
				priority_buff = true,
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	victor_zealot_activated_ability_heal = {
		buffs = {
			{
				buff_to_add = "victor_zealot_activated_ability_heal_buff",
				activation_buff = "victor_zealot_activated_ability",
				update_func = "activate_buff_on_other_buff"
			}
		}
	},
	victor_zealot_activated_ability_heal_buff = {
		buffs = {
			{
				max_stacks = 1,
				event_buff = true,
				event = "on_hit",
				icon = "victor_zealot_activated_ability_heal",
				buff_func = ProcFunctions.heal
			}
		}
	},
	victor_zealot_activated_ability_cooldown = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ACTIVATED_COOLDOWN
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
				stat_buff = StatBuffIndex.CRITICAL_STRIKE_CHANCE_RANGED
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
				stat_buff = StatBuffIndex.RELOAD_SPEED
			}
		}
	},
	victor_bountyhunter_passive_increased_ammunition = {
		buffs = {
			{
				stat_buff = StatBuffIndex.TOTAL_AMMO
			}
		}
	},
	victor_bountyhunter_reduced_spread = {
		buffs = {
			{
				stat_buff = StatBuffIndex.REDUCED_SPREAD
			}
		}
	},
	victor_bountyhunter_increased_attack_speed = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	victor_bountyhunter_reload_speed = {
		buffs = {
			{
				stat_buff = StatBuffIndex.RELOAD_SPEED
			}
		}
	},
	victor_bountyhunter_revive_speed = {
		buffs = {
			{
				stat_buff = StatBuffIndex.REVIVE_SPEED
			}
		}
	},
	victor_bountyhunter_melee_damage_on_no_ammo = {
		buffs = {
			{
				buff_to_add = "victor_bountyhunter_melee_damage_on_no_ammo_buff",
				update_func = "activate_buff_on_no_ammo"
			}
		}
	},
	victor_bountyhunter_melee_damage_on_no_ammo_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "victor_bountyhunter_melee_damage_on_no_ammo",
				stat_buff = StatBuffIndex.INCREASED_WEAPON_DAMAGE_MELEE
			}
		}
	},
	victor_bountyhunter_critical_hit_damage = {
		buffs = {
			{
				stat_buff = StatBuffIndex.CRITICAL_STRIKE_EFFECTIVENESS
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
	victor_bountyhunter_heal_on_critical_hit = {
		buffs = {
			{
				event = "on_critical_hit",
				max_stacks = 1,
				event_buff = true,
				buff_func = ProcFunctions.heal
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
	victor_bountyhunter_activated_ability_cooldown = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ACTIVATED_COOLDOWN
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
				max_stacks = 1,
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
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
				stat_buff = StatBuffIndex.HEADSHOT_MULTIPLIER
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
				icon = "victor_witchhunter_activated_ability",
				priority_buff = true,
				stat_buff = StatBuffIndex.CRITICAL_STRIKE_CHANCE
			}
		}
	},
	victor_witchhunter_max_ammo = {
		buffs = {
			{
				stat_buff = StatBuffIndex.TOTAL_AMMO
			}
		}
	},
	victor_witchhunter_max_stamina = {
		buffs = {
			{
				stat_buff = StatBuffIndex.MAX_FATIGUE
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
	victor_witchhunter_increased_damage_on_grimoire_picked_up = {
		buffs = {
			{
				buff_to_add = "victor_witchhunter_damage_on_grimoire_picked_up",
				update_func = "activate_buff_on_grimoire_picked_up"
			}
		}
	},
	victor_witchhunter_damage_on_grimoire_picked_up = {
		buffs = {
			{
				max_stacks = 1,
				icon = "victor_witchhunter_increased_damage_on_grimoire_picked_up",
				priority_buff = true,
				stat_buff = StatBuffIndex.POWER_LEVEL
			}
		}
	},
	victor_witchhunter_headshot_damage_increase = {
		buffs = {
			{
				stat_buff = StatBuffIndex.HEADSHOT_MULTIPLIER
			}
		}
	},
	victor_witchhunter_damage_reduction_on_disabled = {
		buffs = {
			{
				buff_to_add = "victor_witchhunter_defence_buff_on_disabled",
				update_func = "activate_buff_on_disabled"
			}
		}
	},
	victor_witchhunter_defence_buff_on_disabled = {
		buffs = {
			{
				max_stacks = 1,
				icon = "victor_witchhunter_damage_reduction_on_disabled",
				priority_buff = true,
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	victor_witchhunter_attack_speed_on_ping_target_killed = {
		buffs = {
			{
				event = "on_ping_target_killed",
				buff_to_add = "victor_witchhunter_ping_target_attack_speed",
				event_buff = true,
				buff_func = ProcFunctions.add_buff
			}
		}
	},
	victor_witchhunter_ping_target_attack_speed = {
		buffs = {
			{
				max_stacks = 1,
				icon = "victor_witchhunter_attack_speed_on_ping_target_killed",
				refresh_durations = true,
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	victor_witchhunter_critical_hit_chance_on_ping_target_killed = {
		buffs = {
			{
				event = "on_ping_target_killed",
				buff_to_add = "victor_witchhunter_ping_target_crit_chance",
				event_buff = true,
				buff_func = ProcFunctions.add_buff
			}
		}
	},
	victor_witchhunter_ping_target_crit_chance = {
		buffs = {
			{
				max_stacks = 1,
				icon = "victor_witchhunter_critical_hit_chance_on_ping_target_killed",
				refresh_durations = true,
				stat_buff = StatBuffIndex.CRITICAL_STRIKE_CHANCE
			}
		}
	},
	victor_witchhunter_heal_party_on_ping_target_killed = {
		buffs = {
			{
				event = "on_ping_target_killed",
				event_buff = true,
				buff_func = ProcFunctions.heal_party
			}
		}
	},
	victor_witchhunter_activated_ability_cooldown = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ACTIVATED_COOLDOWN
			}
		}
	},
	victor_witchhunter_activated_ability_duration = {
		buffs = {
			{
				icon = "victor_witchhunter_activated_ability",
				priority_buff = true,
				stat_buff = StatBuffIndex.CRITICAL_STRIKE_CHANCE
			}
		}
	}
}
TalentTrees = TalentTrees or {}
TalentTrees.witch_hunter = {
	{
		{
			"victor_zealot_stamina_regen",
			"victor_zealot_crit_chance",
			"victor_zealot_stun_reduction"
		},
		{
			"victor_zealot_increased_damage_on_enemy_proximity",
			"victor_zealot_damage_taken_capped",
			"victor_zealot_increased_defence_low_health"
		},
		{
			"victor_zealot_increased_block_arc_from_passive",
			"victor_zealot_increased_critical_hit_damage_from_passive",
			"victor_zealot_increased_stamina_from_passive"
		},
		{
			"victor_zealot_regrowth",
			"victor_zealot_bloodlust",
			"victor_zealot_conqueror"
		},
		{
			"victor_zealot_activated_ability_cooldown",
			"victor_zealot_activated_ability_heal",
			"victor_zealot_activated_ability_duration"
		}
	},
	{
		{
			"victor_bountyhunter_reload_speed",
			"victor_bountyhunter_reduced_spread",
			"victor_bountyhunter_increased_attack_speed"
		},
		{
			"victor_bountyhunter_revive_speed",
			"victor_bountyhunter_melee_damage_on_no_ammo",
			"victor_bountyhunter_critical_hit_damage"
		},
		{
			"victor_bountyhunter_heal_on_critical_hit",
			"victor_bountyhunter_passive_reduced_cooldown",
			"victor_bountyhunter_passive_infinite_ammo"
		},
		{
			"victor_bountyhunter_regrowth",
			"victor_bountyhunter_bloodlust",
			"victor_bountyhunter_conqueror"
		},
		{
			"victor_bountyhunter_activated_ability_cooldown",
			"victor_bountyhunter_activated_ability_railgun",
			"victor_bountyhunter_activated_ability_shotgun"
		}
	},
	{
		{
			"victor_witchhunter_dodge_range",
			"victor_witchhunter_max_stamina",
			"victor_witchhunter_max_ammo"
		},
		{
			"victor_witchhunter_increased_damage_on_grimoire_picked_up",
			"victor_witchhunter_headshot_damage_increase",
			"victor_witchhunter_damage_reduction_on_disabled"
		},
		{
			"victor_witchhunter_attack_speed_on_ping_target_killed",
			"victor_witchhunter_heal_party_on_ping_target_killed",
			"victor_witchhunter_critical_hit_chance_on_ping_target_killed"
		},
		{
			"victor_witchhunter_regrowth",
			"victor_witchhunter_bloodlust",
			"victor_witchhunter_conqueror"
		},
		{
			"victor_witchhunter_activated_ability_cooldown",
			"victor_witchhunter_activated_ability_duration",
			"victor_witchhunter_activated_ability_radius"
		}
	}
}
Talents = Talents or {}
Talents.witch_hunter = {
	{
		description = "victor_zealot_stun_reduction_desc",
		name = "victor_zealot_stun_reduction",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_zealot_stun_reduction",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_stun_reduction.multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_zealot_stun_reduction"
		},
		buff_data = {}
	},
	{
		description = "victor_zealot_stamina_regen_desc",
		name = "victor_zealot_stamina_regen",
		num_ranks = 1,
		icon = "victor_zealot_stamina_regen",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_stamina_regen.multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_zealot_stamina_regen"
		},
		buff_data = {}
	},
	{
		description = "victor_zealot_crit_chance_desc",
		name = "victor_zealot_crit_chance",
		num_ranks = 1,
		icon = "victor_zealot_crit_chance",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_crit_chance.bonus
			}
		},
		requirements = {},
		buffs = {
			"victor_zealot_crit_chance"
		},
		buff_data = {}
	},
	{
		description = "victor_zealot_increased_damage_on_enemy_proximity_desc",
		name = "victor_zealot_increased_damage_on_enemy_proximity",
		num_ranks = 1,
		buffer = "both",
		icon = "victor_zealot_increased_damage_on_enemy_proximity",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_damage_on_enemy_proximity.multiplier
			},
			{
				value = buff_tweak_data.victor_zealot_damage_on_enemy_proximity.max_stacks
			}
		},
		requirements = {},
		buffs = {
			"victor_zealot_increased_damage_on_enemy_proximity"
		},
		buff_data = {}
	},
	{
		description = "victor_zealot_damage_taken_capped_desc",
		name = "victor_zealot_damage_taken_capped",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_zealot_damage_taken_capped",
		description_values = {
			{
				value = buff_tweak_data.victor_zealot_damage_taken_capped.bonus
			}
		},
		requirements = {},
		buffs = {
			"victor_zealot_damage_taken_capped"
		},
		buff_data = {}
	},
	{
		description = "victor_zealot_increased_defence_low_health_desc",
		name = "victor_zealot_increased_defence_low_health",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_zealot_increased_defence_low_health",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_defence_on_low_health.multiplier
			},
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_increased_defence_low_health.activation_health
			}
		},
		requirements = {},
		buffs = {
			"victor_zealot_increased_defence_low_health"
		},
		buff_data = {}
	},
	{
		description = "victor_zealot_increased_block_arc_from_passive_desc",
		name = "victor_zealot_increased_block_arc_from_passive",
		num_ranks = 1,
		icon = "victor_zealot_increased_block_arc_from_passive",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_block_arc_from_passive.multiplier
			},
			{
				value = buff_tweak_data.victor_zealot_increased_block_arc_from_passive.chunk_size
			},
			{
				value = buff_tweak_data.victor_zealot_block_arc_from_passive.max_stacks
			}
		},
		requirements = {},
		buffs = {
			"victor_zealot_increased_block_arc_from_passive"
		},
		buff_data = {}
	},
	{
		description = "victor_zealot_increased_critical_hit_damage_from_passive_desc",
		name = "victor_zealot_increased_critical_hit_damage_from_passive",
		num_ranks = 1,
		icon = "victor_zealot_increased_critical_hit_damage_from_passive",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_critical_hit_damage_from_passive.multiplier
			},
			{
				value = buff_tweak_data.victor_zealot_increased_critical_hit_damage_from_passive.chunk_size
			},
			{
				value = buff_tweak_data.victor_zealot_critical_hit_damage_from_passive.max_stacks
			}
		},
		requirements = {},
		buffs = {
			"victor_zealot_increased_critical_hit_damage_from_passive"
		},
		buff_data = {}
	},
	{
		description = "victor_zealot_increased_stamina_from_passive_desc",
		name = "victor_zealot_increased_stamina_from_passive",
		num_ranks = 1,
		icon = "victor_zealot_increased_stamina_from_passive",
		description_values = {
			{
				value = buff_tweak_data.victor_zealot_increased_stamina_from_passive.chunk_size
			},
			{
				value = buff_tweak_data.victor_zealot_stamina_from_passive.max_stacks
			}
		},
		requirements = {},
		buffs = {
			"victor_zealot_increased_stamina_from_passive"
		},
		buff_data = {}
	},
	{
		description = "regrowth_desc",
		name = "victor_zealot_regrowth",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_zealot_regrowth",
		description_values = {},
		requirements = {},
		buffs = {
			"regrowth"
		},
		buff_data = {}
	},
	{
		description = "bloodlust_desc",
		name = "victor_zealot_bloodlust",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_zealot_bloodlust",
		description_values = {},
		requirements = {},
		buffs = {
			"bloodlust"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc",
		name = "victor_zealot_conqueror",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_zealot_conqueror",
		description_values = {},
		requirements = {},
		buffs = {
			"conqueror"
		},
		buff_data = {}
	},
	{
		description = "victor_zealot_activated_ability_cooldown_desc",
		name = "victor_zealot_activated_ability_cooldown",
		num_ranks = 1,
		icon = "victor_zealot_activated_ability_cooldown",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_activated_ability_cooldown.multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_zealot_activated_ability_cooldown"
		},
		buff_data = {}
	},
	{
		description = "victor_zealot_activated_ability_heal_desc",
		name = "victor_zealot_activated_ability_heal",
		num_ranks = 1,
		buffer = "both",
		icon = "victor_zealot_activated_ability_heal",
		description_values = {
			{
				value = buff_tweak_data.victor_zealot_activated_ability_heal_buff.bonus
			}
		},
		requirements = {},
		buffs = {
			"victor_zealot_activated_ability_heal"
		},
		buff_data = {}
	},
	{
		description = "victor_zealot_activated_ability_duration_desc",
		name = "victor_zealot_activated_ability_duration",
		num_ranks = 1,
		icon = "victor_zealot_activated_ability_duration",
		description_values = {
			{
				value = buff_tweak_data.victor_zealot_activated_ability_duration.duration
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "victor_bountyhunter_reduced_spread_desc",
		name = "victor_bountyhunter_reduced_spread",
		num_ranks = 1,
		icon = "victor_bountyhunter_reduced_spread",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_reduced_spread.multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_bountyhunter_reduced_spread"
		},
		buff_data = {}
	},
	{
		description = "victor_bountyhunter_reload_speed_desc",
		name = "victor_bountyhunter_reload_speed",
		num_ranks = 1,
		icon = "victor_bountyhunter_reload_speed",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_reload_speed.multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_bountyhunter_reload_speed"
		},
		buff_data = {}
	},
	{
		description = "victor_bountyhunter_increased_attack_speed_desc",
		name = "victor_bountyhunter_increased_attack_speed",
		num_ranks = 1,
		icon = "victor_bountyhunter_increased_attack_speed",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_increased_attack_speed.multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_bountyhunter_increased_attack_speed"
		},
		buff_data = {}
	},
	{
		description = "victor_bountyhunter_revive_speed_desc",
		name = "victor_bountyhunter_revive_speed",
		num_ranks = 1,
		icon = "victor_bountyhunter_revive_speed",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_revive_speed.multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_bountyhunter_revive_speed"
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
			"victor_bountyhunter_melee_damage_on_no_ammo"
		},
		buff_data = {}
	},
	{
		description = "victor_bountyhunter_critical_hit_damage_desc",
		name = "victor_bountyhunter_critical_hit_damage",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_bountyhunter_critical_hit_damage_increase",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_critical_hit_damage.multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_bountyhunter_critical_hit_damage"
		},
		buff_data = {}
	},
	{
		description = "victor_bountyhunter_heal_on_critical_hit_desc",
		name = "victor_bountyhunter_heal_on_critical_hit",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_bountyhunter_heal_on_critical_hit",
		description_values = {
			{
				value = buff_tweak_data.victor_bountyhunter_heal_on_critical_hit.bonus
			}
		},
		requirements = {},
		buffs = {
			"victor_bountyhunter_heal_on_critical_hit"
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
		description = "regrowth_desc",
		name = "victor_bountyhunter_regrowth",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_bountyhunter_regrowth",
		description_values = {},
		requirements = {},
		buffs = {
			"regrowth"
		},
		buff_data = {}
	},
	{
		description = "bloodlust_desc",
		name = "victor_bountyhunter_bloodlust",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_bountyhunter_bloodlust",
		description_values = {},
		requirements = {},
		buffs = {
			"bloodlust"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc",
		name = "victor_bountyhunter_conqueror",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_bountyhunter_conqueror",
		description_values = {},
		requirements = {},
		buffs = {
			"conqueror"
		},
		buff_data = {}
	},
	{
		description = "victor_bountyhunter_activated_ability_cooldown_desc",
		name = "victor_bountyhunter_activated_ability_cooldown",
		num_ranks = 1,
		icon = "victor_bountyhunter_activated_ability_cooldown",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_activated_ability_cooldown.multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_bountyhunter_activated_ability_cooldown"
		},
		buff_data = {}
	},
	{
		description = "victor_bountyhunter_activated_ability_railgun_desc",
		name = "victor_bountyhunter_activated_ability_railgun",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_bountyhunter_activated_ability_railgun",
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "victor_bountyhunter_activated_ability_shotgun_desc",
		name = "victor_bountyhunter_activated_ability_shotgun",
		num_ranks = 1,
		icon = "victor_bountyhunter_activated_ability_shotgun",
		description_values = {
			{
				value = buff_tweak_data.victor_bountyhunter_activated_ability_shotgun.bonus
			}
		},
		requirements = {},
		buffs = {},
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
		description = "victor_witchhunter_max_stamina_desc",
		name = "victor_witchhunter_max_stamina",
		num_ranks = 1,
		icon = "victor_witchhunter_max_stamina",
		description_values = {
			{
				value = buff_tweak_data.victor_witchhunter_max_stamina.bonus
			}
		},
		requirements = {},
		buffs = {
			"victor_witchhunter_max_stamina"
		},
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
		description = "victor_witchhunter_increased_damage_on_grimoire_picked_up_desc",
		name = "victor_witchhunter_increased_damage_on_grimoire_picked_up",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_witchhunter_increased_damage_on_grimoire_picked_up",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_witchhunter_damage_on_grimoire_picked_up.multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_witchhunter_increased_damage_on_grimoire_picked_up"
		},
		buff_data = {}
	},
	{
		description = "victor_witchhunter_headshot_damage_increase_desc",
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
		description = "victor_witchhunter_damage_reduction_on_disabled_desc",
		name = "victor_witchhunter_damage_reduction_on_disabled",
		num_ranks = 1,
		buffer = "both",
		icon = "victor_witchhunter_damage_reduction_on_disabled",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_witchhunter_defence_buff_on_disabled.multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_witchhunter_damage_reduction_on_disabled"
		},
		buff_data = {}
	},
	{
		description = "victor_witchhunter_attack_speed_on_ping_target_killed_desc",
		name = "victor_witchhunter_attack_speed_on_ping_target_killed",
		num_ranks = 1,
		icon = "victor_witchhunter_attack_speed_on_ping_target_killed",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_witchhunter_ping_target_attack_speed.multiplier
			},
			{
				value = buff_tweak_data.victor_witchhunter_ping_target_attack_speed.duration
			}
		},
		requirements = {},
		buffs = {
			"victor_witchhunter_attack_speed_on_ping_target_killed"
		},
		buff_data = {}
	},
	{
		description = "victor_witchhunter_heal_party_on_ping_target_killed_desc",
		name = "victor_witchhunter_heal_party_on_ping_target_killed",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_witchhunter_heal_party_on_ping_target_killed",
		description_values = {
			{
				value = buff_tweak_data.victor_witchhunter_heal_party_on_ping_target_killed.bonus
			}
		},
		requirements = {},
		buffs = {
			"victor_witchhunter_heal_party_on_ping_target_killed"
		},
		buff_data = {}
	},
	{
		description = "victor_witchhunter_critical_hit_chance_on_ping_target_killed_desc",
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
		description = "regrowth_desc",
		name = "victor_witchhunter_regrowth",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_witchhunter_regrowth",
		description_values = {},
		requirements = {},
		buffs = {
			"regrowth"
		},
		buff_data = {}
	},
	{
		description = "bloodlust_desc",
		name = "victor_witchhunter_bloodlust",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_witchhunter_bloodlust",
		description_values = {},
		requirements = {},
		buffs = {
			"bloodlust"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc",
		name = "victor_witchhunter_conqueror",
		num_ranks = 1,
		buffer = "server",
		icon = "victor_witchhunter_conqueror",
		description_values = {},
		requirements = {},
		buffs = {
			"conqueror"
		},
		buff_data = {}
	},
	{
		description = "victor_witchhunter_activated_ability_cooldown_desc",
		name = "victor_witchhunter_activated_ability_cooldown",
		num_ranks = 1,
		icon = "victor_witchhunter_activated_ability_cooldown",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_witchhunter_activated_ability_cooldown.multiplier
			}
		},
		requirements = {},
		buffs = {
			"victor_witchhunter_activated_ability_cooldown"
		},
		buff_data = {}
	},
	{
		description = "victor_witchhunter_activated_ability_duration_desc",
		name = "victor_witchhunter_activated_ability_duration",
		num_ranks = 1,
		icon = "victor_witchhunter_activated_ability_duration",
		description_values = {
			{
				value = buff_tweak_data.victor_witchhunter_activated_ability_duration.duration
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "victor_witchhunter_activated_ability_radius_desc",
		name = "victor_witchhunter_activated_ability_radius",
		num_ranks = 1,
		icon = "victor_witchhunter_activated_ability_radius",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_witchhunter_activated_ability_radius.multiplier
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
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
