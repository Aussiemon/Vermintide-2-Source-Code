local buff_tweak_data = {
	markus_huntsman_ability_cooldown_on_hit = {
		bonus = 0.3
	},
	markus_huntsman_ability_cooldown_on_damage_taken = {
		bonus = 0.4
	},
	markus_huntsman_passive = {
		bonus = 1
	},
	markus_huntsman_passive_crit_aura = {
		range = 5
	},
	markus_huntsman_passive_crit_aura_buff = {
		bonus = 0.05
	},
	markus_huntsman_passive_increased_ammunition = {
		multiplier = 0.5
	},
	markus_huntsman_activated_ability = {
		dodge_distance_multiplier = 0.95,
		attack_speed_multiplier = 1,
		dodge_speed_multiplier = 0.95,
		headshot_multiplier = 0.5,
		move_speed_multiplier = 0.9,
		duration = 6,
		reload_speed_multiplier = -0.4
	},
	markus_huntsman_reduced_spread = {
		multiplier = -0.25
	},
	markus_huntsman_max_stamina = {
		bonus = 2
	},
	markus_huntsman_reload_speed = {
		multiplier = -0.2
	},
	markus_huntsman_gain_ammo_on_boss_death = {
		ammo_bonus_fraction = 1
	},
	markus_huntsman_defence_debuff = {
		multiplier = 1,
		duration = 5
	},
	markus_huntsman_passive_crit_buff = {
		bonus = 0.25
	},
	markus_huntsman_headshots_increase_reload_speed_buff = {
		duration = 5,
		multiplier = -0.2
	},
	markus_huntsman_passive_improved = {
		bonus = 2
	},
	markus_huntsman_critical_hit_damage = {
		multiplier = 0.2
	},
	markus_huntsman_movement_speed = {
		multiplier = 1.1
	},
	markus_huntsman_heal_party_on_special_killed = {
		bonus = 5
	},
	markus_huntsman_activated_ability_cooldown = {
		multiplier = -0.3
	},
	markus_huntsman_activated_ability_regen_buff = {
		heal_amount = 4,
		time_between_heals = 1
	},
	markus_huntsman_activated_ability_damage = {
		multiplier = 0.2
	},
	markus_knight_ability_cooldown_on_hit = {
		bonus = 0.25
	},
	markus_knight_ability_cooldown_on_damage_taken = {
		bonus = 0.5
	},
	markus_knight_passive = {
		range = 5
	},
	markus_knight_passive_damage_reduction = {
		multiplier = -0.1
	},
	markus_knight_passive_increased_stamina = {
		bonus = 2
	},
	markus_knight_passive_defence_aura = {
		multiplier = -0.15
	},
	markus_knight_activated_ability = {
		duration = 1.7
	},
	markus_knight_push_arc = {
		multiplier = 0.5
	},
	markus_knight_max_health = {
		multiplier = 0.25
	},
	markus_knight_attack_speed = {
		multiplier = 0.05
	},
	markus_knight_defence_buff = {
		duration = 10,
		multiplier = -0.5
	},
	markus_knight_uninterruptible_on_block_broken_buff = {
		duration = 5
	},
	markus_knight_stamina_regen_buff = {
		duration = 2,
		multiplier = 0.4
	},
	markus_knight_improved_passive_defence_aura_buff = {
		multiplier = -0.05
	},
	markus_knight_passive_stamina_aura_buff = {
		bonus = 2
	},
	markus_knight_passive_movement_speed_aura_buff = {
		multiplier = 1.05
	},
	markus_knight_activated_ability_damage_buff = {
		duration = 10,
		multiplier = 0.25
	},
	markus_knight_activated_ability_infinite_block = {
		duration = 10,
		multiplier = -1
	},
	markus_knight_activated_ability_cooldown = {
		multiplier = -0.3
	},
	markus_mercenary_ability_cooldown_on_hit = {
		bonus = 0.5
	},
	markus_mercenary_ability_cooldown_on_damage_taken = {
		bonus = 0.5
	},
	markus_mercenary_passive = {
		targets = 3
	},
	markus_mercenary_passive_crit_chance = {
		bonus = 0.05
	},
	markus_mercenary_passive_proc = {
		duration = 6,
		multiplier = 0.1
	},
	markus_mercenary_crit_chance = {
		bonus = 0.05
	},
	markus_mercenary_stamina_regen = {
		multiplier = 0.3
	},
	markus_mercenary_healing_received = {
		multiplier = 0.3
	},
	markus_mercenary_increased_damage_on_enemy_proximity = {
		chunk_size = 1,
		range = 3
	},
	markus_mercenary_damage_on_enemy_proximity = {
		max_stacks = 5,
		multiplier = 0.03
	},
	markus_mercenary_reduced_stun_duration = {
		multiplier = -0.35
	},
	markus_mercenary_increased_defence_on_low_health = {
		activation_health = 0.5
	},
	markus_mercenary_defence_on_low_health = {
		multiplier = -0.35
	},
	markus_mercenary_passive_defence = {
		multiplier = -0.25
	},
	markus_mercenary_passive_power_level = {
		multiplier = 0.15
	},
	markus_mercenary_activated_ability_cooldown = {
		multiplier = -0.3
	},
	markus_mercenary_activated_ability_improved_healing = {
		bonus = 45
	}
}
TalentBuffTemplates = TalentBuffTemplates or {}
TalentBuffTemplates.empire_soldier = {
	markus_huntsman_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown
			}
		}
	},
	markus_huntsman_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown_on_damage_taken
			}
		}
	},
	markus_huntsman_end_activated_on_ranged_hit = {
		buffs = {
			{
				event = "on_ranged_hit",
				event_buff = true,
				buff_func = ProcFunctions.end_huntsman_stealth,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_end_activated_on_melee_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.end_huntsman_stealth,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_passive = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.markus_huntsman_passive_proc
			}
		}
	},
	markus_huntsman_passive_crit_aura = {
		buffs = {
			{
				buff_to_add = "markus_huntsman_passive_crit_aura_buff",
				update_func = "activate_buff_on_distance"
			}
		}
	},
	markus_huntsman_passive_crit_aura_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "markus_huntsman_crit_aura",
				stat_buff = StatBuffIndex.CRITICAL_STRIKE_CHANCE
			}
		}
	},
	markus_huntsman_passive_increased_ammunition = {
		buffs = {
			{
				stat_buff = StatBuffIndex.TOTAL_AMMO
			}
		}
	},
	markus_huntsman_passive_no_damage_dropoff = {
		buffs = {
			{
				perk = "no_damage_dropoff"
			}
		}
	},
	markus_huntsman_activated_ability = {
		deactivation_effect = "fx/screenspace_huntsman_skill_02",
		buffs = {
			{
				remove_buff_func = "end_huntsman_activated_ability",
				name = "markus_huntsman_activated_ability",
				continuous_effect = "fx/screenspace_huntsman_skill_01",
				max_stacks = 1,
				icon = "markus_huntsman_activated_ability",
				apply_buff_func = "apply_huntsman_activated_ability",
				refresh_durations = true,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_activated_ability_increased_zoom = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_increased_zoom",
				refresh_durations = true,
				max_stacks = 1,
				perk = "increased_zoom",
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_activated_ability_headshot_multiplier = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_headshot_multiplier",
				refresh_durations = true,
				max_stacks = 1,
				stat_buff = StatBuffIndex.HEADSHOT_MULTIPLIER,
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.headshot_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_activated_ability_increased_reload_speed = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_increased_reload_speed",
				refresh_durations = true,
				max_stacks = 1,
				stat_buff = StatBuffIndex.RELOAD_SPEED,
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.reload_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_activated_ability_decrease_move_speed = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_decrease_move_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				lerp_time = 1,
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.move_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_activated_ability_decrease_crouch_move_speed = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_decrease_crouch_move_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				lerp_time = 1,
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.move_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_activated_ability_decrease_walk_move_speed = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_decrease_walk_move_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				lerp_time = 1,
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.move_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_activated_ability_decrease_dodge_speed = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_decrease_dodge_speed",
				lerp_time = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.dodge_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_activated_ability_decrease_dodge_distance = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_decrease_dodge_distance",
				lerp_time = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier"
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.dodge_distance_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_reduced_spread = {
		buffs = {
			{
				stat_buff = StatBuffIndex.REDUCED_SPREAD
			}
		}
	},
	markus_huntsman_max_stamina = {
		buffs = {
			{
				stat_buff = StatBuffIndex.MAX_FATIGUE
			}
		}
	},
	markus_huntsman_reload_speed = {
		buffs = {
			{
				stat_buff = StatBuffIndex.RELOAD_SPEED
			}
		}
	},
	markus_huntsman_gain_ammo_on_boss_death = {
		buffs = {
			{
				event = "on_boss_killed",
				event_buff = true,
				buff_func = ProcFunctions.ammo_fraction_gain
			}
		}
	},
	markus_huntsman_debuff_defence_on_crit = {
		buffs = {
			{
				event = "on_critical_hit",
				buff_to_add = "defence_debuff_enemies",
				event_buff = true,
				buff_func = ProcFunctions.on_hit_debuff_enemy_defence
			}
		}
	},
	markus_huntsman_debuff_defence_on_disabler = {
		buffs = {
			{
				event = "on_damage_taken",
				buff_to_add = "markus_huntsman_defence_debuff",
				event_buff = true,
				buff_func = ProcFunctions.activate_buff_on_disabler
			}
		}
	},
	markus_huntsman_defence_debuff = {
		buffs = {
			{
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	markus_huntsman_passive_crit_buff = {
		buffs = {
			{
				max_stacks = 1,
				is_cooldown = true,
				icon = "markus_huntsman_passive_crit_buff_on_headshot",
				dormant = true,
				stat_buff = StatBuffIndex.CRITICAL_STRIKE_CHANCE
			}
		}
	},
	markus_huntsman_passive_crit_buff_removal = {
		buffs = {
			{
				name = "markus_huntsman_passive_crit_buff_removal",
				event_buff = true,
				event = "on_critical_action",
				dormant = true,
				buff_func = ProcFunctions.remove_markus_huntsman_passive_crit_buff
			}
		}
	},
	markus_huntsman_headshots_increase_reload_speed = {
		buffs = {
			{
				max_stacks = 1,
				name = "markus_huntsman_headshots_restore_health",
				event_buff = true,
				event = "on_hit",
				buff_func = ProcFunctions.markus_huntsman_increase_reload_speed
			}
		}
	},
	markus_huntsman_headshots_increase_reload_speed_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "markus_huntsman_headshots_increase_reload_speed",
				refresh_durations = true,
				stat_buff = StatBuffIndex.RELOAD_SPEED
			}
		}
	},
	markus_huntsman_critical_hit_damage = {
		buffs = {
			{
				stat_buff = StatBuffIndex.CRITICAL_STRIKE_EFFECTIVENESS
			}
		}
	},
	markus_huntsman_movement_speed = {
		buffs = {
			{
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	markus_huntsman_heal_party_on_special_killed = {
		buffs = {
			{
				event = "on_special_killed",
				event_buff = true,
				buff_func = ProcFunctions.heal_party
			}
		}
	},
	markus_huntsman_activated_ability_cooldown = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ACTIVATED_COOLDOWN
			}
		}
	},
	markus_huntsman_activated_ability_regen = {
		buffs = {
			{
				buff_to_add = "markus_huntsman_activated_ability_regen_buff",
				activation_buff = "markus_huntsman_activated_ability_headshot_multiplier",
				update_func = "activate_buff_on_other_buff"
			}
		}
	},
	markus_huntsman_activated_ability_regen_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "markus_huntsman_activated_ability_regen",
				update_func = "markus_huntsman_update_heal_ticks"
			}
		}
	},
	markus_huntsman_activated_ability_damage = {
		buffs = {
			{
				max_stacks = 1,
				icon = "markus_huntsman_activated_ability_damage",
				dormant = true,
				stat_buff = StatBuffIndex.POWER_LEVEL,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_knight_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown
			}
		}
	},
	markus_knight_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown_on_damage_taken
			}
		}
	},
	markus_knight_passive = {
		buffs = {
			{
				buff_to_add = "markus_knight_passive_defence_aura",
				update_func = "activate_buff_on_distance"
			}
		}
	},
	markus_knight_passive_damage_reduction = {
		buffs = {
			{
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	markus_knight_passive_increased_stamina = {
		buffs = {
			{
				stat_buff = StatBuffIndex.MAX_FATIGUE
			}
		}
	},
	markus_knight_passive_defence_aura = {
		buffs = {
			{
				max_stacks = 1,
				icon = "markus_knight_passive",
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	markus_knight_activated_ability = {
		buffs = {
			{
				remove_buff_func = "end_knight_activated_ability",
				icon = "markus_knight_activated_ability"
			}
		}
	},
	markus_knight_push_arc = {
		buffs = {
			{
				stat_buff = StatBuffIndex.BLOCK_ANGLE
			}
		}
	},
	markus_knight_max_health = {
		buffs = {
			{
				stat_buff = StatBuffIndex.MAX_HEALTH_ALIVE
			}
		}
	},
	markus_knight_attack_speed = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	markus_knight_buff_defense_on_revived_target = {
		buffs = {
			{
				event = "on_revived_ally",
				buff_to_add = "markus_knight_defence_buff",
				event_buff = true,
				buff_func = ProcFunctions.buff_defence_on_revived_target
			}
		}
	},
	markus_knight_defence_buff = {
		buffs = {
			{
				priority_buff = true,
				refresh_durations = true,
				max_stacks = 1,
				icon = "markus_knight_buff_defense_on_revived_target",
				dormant = true,
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	markus_knight_uninterruptible_on_block_broken = {
		buffs = {
			{
				event = "on_block_broken",
				event_buff = true,
				buff_func = ProcFunctions.gain_markus_knight_uninterruptible_on_block_broken_buff
			}
		}
	},
	markus_knight_uninterruptible_on_block_broken_buff = {
		buffs = {
			{
				icon = "markus_knight_uninterruptible_on_block_broken",
				max_stacks = 1,
				refresh_durations = true,
				is_cooldown = true,
				perk = "uninterruptible",
				dormant = true
			}
		}
	},
	markus_knight_regen_stamina_on_charged_attacks = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.markus_knight_regen_stamina_on_charged_attacks
			}
		}
	},
	markus_knight_stamina_regen_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "markus_knight_regen_stamina_on_charged_attacks",
				refresh_durations = true,
				stat_buff = StatBuffIndex.FATIGUE_REGEN
			}
		}
	},
	markus_knight_improved_passive_defence_aura = {
		buffs = {
			{
				buff_to_add = "markus_knight_improved_passive_defence_aura_buff",
				update_func = "activate_buff_on_distance",
				range = buff_tweak_data.markus_knight_passive.range
			}
		}
	},
	markus_knight_improved_passive_defence_aura_buff = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	markus_knight_passive_stamina_aura = {
		buffs = {
			{
				buff_to_add = "markus_knight_passive_stamina_aura_buff",
				update_func = "activate_buff_on_distance",
				range = buff_tweak_data.markus_knight_passive.range
			}
		}
	},
	markus_knight_passive_stamina_aura_buff = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = StatBuffIndex.MAX_FATIGUE
			}
		}
	},
	markus_knight_passive_movement_speed_aura = {
		buffs = {
			{
				buff_to_add = "markus_knight_passive_movement_speed_aura_buff",
				update_func = "activate_buff_on_distance",
				range = buff_tweak_data.markus_knight_passive.range
			}
		}
	},
	markus_knight_passive_movement_speed_aura_buff = {
		buffs = {
			{
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	markus_knight_activated_ability_damage_buff = {
		buffs = {
			{
				icon = "markus_knight_activated_ability_damage_buff",
				max_stacks = 1,
				refresh_durations = true,
				dormant = true,
				stat_buff = StatBuffIndex.POWER_LEVEL
			}
		}
	},
	markus_knight_activated_ability_infinite_block = {
		buffs = {
			{
				icon = "markus_knight_activated_ability_infinite_block",
				max_stacks = 1,
				refresh_durations = true,
				dormant = true,
				stat_buff = StatBuffIndex.BLOCK_COST
			}
		}
	},
	markus_knight_activated_ability_cooldown = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ACTIVATED_COOLDOWN
			}
		}
	},
	markus_mercenary_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown
			}
		}
	},
	markus_mercenary_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown_on_damage_taken
			}
		}
	},
	markus_mercenary_passive = {
		buffs = {
			{
				event = "on_hit",
				buff_to_add = "markus_mercenary_passive_proc",
				event_buff = true,
				buff_func = ProcFunctions.gain_markus_mercenary_passive_proc
			}
		}
	},
	markus_mercenary_passive_crit_chance = {
		buffs = {
			{
				stat_buff = StatBuffIndex.CRITICAL_STRIKE_CHANCE
			}
		}
	},
	markus_mercenary_passive_uninterruptible_heavy = {
		buffs = {
			{
				perk = "uninterruptible_heavy"
			}
		}
	},
	markus_mercenary_passive_hit_mass_override = {
		buffs = {
			{
				perk = "hit_mass_override"
			}
		}
	},
	markus_mercenary_passive_proc = {
		buffs = {
			{
				dormant = true,
				refresh_durations = true,
				max_stacks = 1,
				icon = "markus_mercenary_passive",
				priority_buff = true,
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	markus_mercenary_crit_chance = {
		buffs = {
			{
				stat_buff = StatBuffIndex.CRITICAL_STRIKE_CHANCE
			}
		}
	},
	markus_mercenary_stamina_regen = {
		buffs = {
			{
				stat_buff = StatBuffIndex.FATIGUE_REGEN
			}
		}
	},
	markus_mercenary_healing_received = {
		buffs = {
			{
				stat_buff = StatBuffIndex.HEALING_RECEIVED
			}
		}
	},
	markus_mercenary_increased_damage_on_enemy_proximity = {
		buffs = {
			{
				buff_to_add = "markus_mercenary_damage_on_enemy_proximity",
				update_func = "activate_buff_stacks_based_on_enemy_proximity"
			}
		}
	},
	markus_mercenary_damage_on_enemy_proximity = {
		buffs = {
			{
				icon = "markus_mercenary_increased_damage_on_enemy_proximity",
				stat_buff = StatBuffIndex.POWER_LEVEL
			}
		}
	},
	markus_mercenary_reduced_stun_duration = {
		buffs = {
			{
				stat_buff = StatBuffIndex.STUN_DURATION
			}
		}
	},
	markus_mercenary_increased_defence_on_low_health = {
		buffs = {
			{
				buff_to_add = "markus_mercenary_defence_on_low_health",
				update_func = "activate_buff_on_health_percent",
				activate_below = true
			}
		}
	},
	markus_mercenary_defence_on_low_health = {
		buffs = {
			{
				max_stacks = 1,
				icon = "markus_mercenary_increased_defence_on_low_health",
				priority_buff = true,
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	markus_mercenary_passive_defence_on_proc = {
		buffs = {
			{
				buff_to_add = "markus_mercenary_passive_defence",
				activation_buff = "markus_mercenary_passive_proc",
				update_func = "activate_buff_on_other_buff"
			}
		}
	},
	markus_mercenary_passive_defence = {
		buffs = {
			{
				max_stacks = 1,
				icon = "markus_mercenary_passive_defence_on_proc",
				dormant = true,
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	markus_mercenary_passive_power_level_on_proc = {
		buffs = {
			{
				buff_to_add = "markus_mercenary_passive_power_level",
				activation_buff = "markus_mercenary_passive_proc",
				update_func = "activate_buff_on_other_buff"
			}
		}
	},
	markus_mercenary_passive_power_level = {
		buffs = {
			{
				max_stacks = 1,
				icon = "markus_mercenary_passive_power_level_on_proc",
				dormant = true,
				stat_buff = StatBuffIndex.POWER_LEVEL
			}
		}
	},
	markus_mercenary_activated_ability_cooldown = {
		buffs = {
			{
				name = "markus_mercenary_activated_ability_cooldown",
				stat_buff = StatBuffIndex.ACTIVATED_COOLDOWN
			}
		}
	}
}
TalentTrees = TalentTrees or {}
TalentTrees.empire_soldier = {
	{
		{
			"markus_huntsman_reload_speed",
			"markus_huntsman_reduced_spread",
			"markus_huntsman_max_stamina"
		},
		{
			"markus_huntsman_gain_ammo_on_boss_death",
			"markus_huntsman_debuff_defence_on_crit",
			"markus_huntsman_debuff_defence_on_disabler"
		},
		{
			"markus_huntsman_passive_improved",
			"markus_huntsman_passive_crit_buff_on_headshot",
			"markus_huntsman_headshots_increase_reload_speed"
		},
		{
			"markus_huntsman_regrowth",
			"markus_huntsman_bloodlust",
			"markus_huntsman_conqueror"
		},
		{
			"markus_huntsman_activated_ability_cooldown",
			"markus_huntsman_activated_ability_regen",
			"markus_huntsman_activated_ability_damage"
		}
	},
	{
		{
			"markus_knight_push_arc",
			"markus_knight_max_health",
			"markus_knight_attack_speed"
		},
		{
			"markus_knight_buff_defense_on_revived_target",
			"markus_knight_uninterruptible_on_block_broken",
			"markus_knight_regen_stamina_on_charged_attacks"
		},
		{
			"markus_knight_passive_stamina_aura",
			"markus_knight_improved_passive_defence_aura",
			"markus_knight_passive_movement_speed_aura"
		},
		{
			"markus_knight_regrowth",
			"markus_knight_bloodlust",
			"markus_knight_conqueror"
		},
		{
			"markus_knight_activated_ability_cooldown",
			"markus_knight_activated_ability_damage_buff",
			"markus_knight_activated_ability_infinite_block"
		}
	},
	{
		{
			"markus_mercenary_stamina_regen",
			"markus_mercenary_crit_chance",
			"markus_mercenary_healing_received"
		},
		{
			"markus_mercenary_increased_damage_on_enemy_proximity",
			"markus_mercenary_increased_defence_on_low_health",
			"markus_mercenary_reduced_stun_duration"
		},
		{
			"markus_mercenary_passive_power_level_on_proc",
			"markus_mercenary_passive_defence_on_proc",
			"markus_mercenary_passive_group_proc"
		},
		{
			"markus_mercenary_regrowth",
			"markus_mercenary_bloodlust",
			"markus_mercenary_conqueror"
		},
		{
			"markus_mercenary_activated_ability_cooldown",
			"markus_mercenary_activated_ability_improved_healing",
			"markus_mercenary_activated_ability_revive"
		}
	}
}
Talents = Talents or {}
Talents.empire_soldier = {
	{
		description = "markus_huntsman_reduced_spread_desc",
		name = "markus_huntsman_reduced_spread",
		num_ranks = 1,
		icon = "markus_huntsman_reduced_spread",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_reduced_spread.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_huntsman_reduced_spread"
		},
		buff_data = {}
	},
	{
		description = "markus_huntsman_reload_speed_desc",
		name = "markus_huntsman_reload_speed",
		num_ranks = 1,
		icon = "markus_huntsman_reload_speed",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_reload_speed.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_huntsman_reload_speed"
		},
		buff_data = {}
	},
	{
		description = "markus_huntsman_max_stamina_desc_2",
		name = "markus_huntsman_max_stamina",
		num_ranks = 1,
		icon = "markus_huntsman_max_stamina",
		description_values = {
			{
				value = buff_tweak_data.markus_huntsman_max_stamina.bonus
			}
		},
		requirements = {},
		buffs = {
			"markus_huntsman_max_stamina"
		},
		buff_data = {}
	},
	{
		description = "markus_huntsman_gain_ammo_on_boss_death_desc",
		name = "markus_huntsman_gain_ammo_on_boss_death",
		num_ranks = 1,
		icon = "markus_huntsman_gain_ammo_on_boss_death",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_gain_ammo_on_boss_death.ammo_bonus_fraction
			}
		},
		requirements = {},
		buffs = {
			"markus_huntsman_gain_ammo_on_boss_death"
		},
		buff_data = {}
	},
	{
		description = "markus_huntsman_debuff_defence_on_crit_desc_2",
		name = "markus_huntsman_debuff_defence_on_crit",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_huntsman_debuff_defence_on_crit",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.defence_debuff_enemies.buffs[1].multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_huntsman_debuff_defence_on_crit"
		},
		buff_data = {}
	},
	{
		description = "markus_huntsman_debuff_defence_on_disabler_desc",
		name = "markus_huntsman_debuff_defence_on_disabler",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_huntsman_debuff_defence_on_disabler",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_defence_debuff.multiplier
			},
			{
				value = buff_tweak_data.markus_huntsman_defence_debuff.duration
			}
		},
		requirements = {},
		buffs = {
			"markus_huntsman_debuff_defence_on_disabler"
		},
		buff_data = {}
	},
	{
		description = "markus_huntsman_passive_improved_desc",
		name = "markus_huntsman_passive_improved",
		num_ranks = 1,
		icon = "markus_huntsman_passive_improved",
		description_values = {
			{
				value = buff_tweak_data.markus_huntsman_passive_improved.bonus
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "markus_huntsman_passive_crit_buff_on_headshot_desc",
		name = "markus_huntsman_passive_crit_buff_on_headshot",
		num_ranks = 1,
		icon = "markus_huntsman_passive_crit_buff_on_headshot",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_passive_crit_buff.bonus
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "markus_huntsman_headshots_increase_reload_speed_desc",
		name = "markus_huntsman_headshots_increase_reload_speed",
		num_ranks = 1,
		icon = "markus_huntsman_headshots_increase_reload_speed",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_headshots_increase_reload_speed_buff.multiplier
			},
			{
				value = buff_tweak_data.markus_huntsman_headshots_increase_reload_speed_buff.duration
			}
		},
		requirements = {},
		buffs = {
			"markus_huntsman_headshots_increase_reload_speed"
		},
		buff_data = {}
	},
	{
		description = "regrowth_desc_2",
		name = "markus_huntsman_regrowth",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_huntsman_regrowth",
		description_values = {
			{
				value = BuffTemplates.regrowth.buffs[1].bonus
			}
		},
		requirements = {},
		buffs = {
			"regrowth"
		},
		buff_data = {}
	},
	{
		description = "bloodlust_desc_2",
		name = "markus_huntsman_bloodlust",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_huntsman_bloodlust",
		description_values = {
			{
				value = BuffTemplates.bloodlust.buffs[1].bonus
			}
		},
		requirements = {},
		buffs = {
			"bloodlust"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc_2",
		name = "markus_huntsman_conqueror",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_huntsman_conqueror",
		description_values = {
			{
				value = BuffTemplates.conqueror.buffs[1].bonus
			}
		},
		requirements = {},
		buffs = {
			"conqueror"
		},
		buff_data = {}
	},
	{
		description = "markus_huntsman_activated_ability_cooldown_desc",
		name = "markus_huntsman_activated_ability_cooldown",
		num_ranks = 1,
		icon = "markus_huntsman_activated_ability_cooldown",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_activated_ability_cooldown.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_huntsman_activated_ability_cooldown"
		},
		buff_data = {}
	},
	{
		description = "markus_huntsman_activated_ability_regen_desc",
		name = "markus_huntsman_activated_ability_regen",
		num_ranks = 1,
		buffer = "both",
		icon = "markus_huntsman_activated_ability_regen",
		description_values = {
			{
				value = buff_tweak_data.markus_huntsman_activated_ability_regen_buff.heal_amount
			}
		},
		requirements = {},
		buffs = {
			"markus_huntsman_activated_ability_regen"
		},
		buff_data = {}
	},
	{
		description = "markus_huntsman_activated_ability_damage_desc",
		name = "markus_huntsman_activated_ability_damage",
		num_ranks = 1,
		buffer = "both",
		icon = "markus_huntsman_activated_ability_damage",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_activated_ability_damage.multiplier
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "markus_knight_push_arc_desc",
		name = "markus_knight_push_arc",
		num_ranks = 1,
		icon = "markus_knight_push_arc",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_push_arc.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_push_arc"
		},
		buff_data = {}
	},
	{
		description = "markus_knight_max_health_desc",
		name = "markus_knight_max_health",
		num_ranks = 1,
		buffer = "both",
		icon = "markus_knight_max_health",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_max_health.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_max_health"
		},
		buff_data = {}
	},
	{
		description = "markus_knight_attack_speed_desc",
		name = "markus_knight_attack_speed",
		num_ranks = 1,
		icon = "markus_knight_attack_speed",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_attack_speed.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_attack_speed"
		},
		buff_data = {}
	},
	{
		description = "markus_knight_buff_defense_on_revived_target_desc",
		name = "markus_knight_buff_defense_on_revived_target",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_knight_buff_defense_on_revived_target",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_defence_buff.multiplier
			},
			{
				value = buff_tweak_data.markus_knight_defence_buff.duration
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_buff_defense_on_revived_target"
		},
		buff_data = {}
	},
	{
		description = "markus_knight_uninterruptible_on_block_broken_desc",
		name = "markus_knight_uninterruptible_on_block_broken",
		num_ranks = 1,
		icon = "markus_knight_uninterruptible_on_block_broken",
		description_values = {
			{
				value = buff_tweak_data.markus_knight_uninterruptible_on_block_broken_buff.duration
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_uninterruptible_on_block_broken"
		},
		buff_data = {}
	},
	{
		description = "markus_knight_regen_stamina_on_charged_attacks_desc",
		name = "markus_knight_regen_stamina_on_charged_attacks",
		num_ranks = 1,
		icon = "markus_knight_regen_stamina_on_charged_attacks",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_stamina_regen_buff.multiplier
			},
			{
				value = buff_tweak_data.markus_knight_stamina_regen_buff.duration
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_regen_stamina_on_charged_attacks"
		},
		buff_data = {}
	},
	{
		description = "markus_knight_passive_stamina_aura_desc_2",
		name = "markus_knight_passive_stamina_aura",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_knight_passive_stamina_aura",
		description_values = {
			{
				value = buff_tweak_data.markus_knight_passive_stamina_aura_buff.bonus
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_passive_stamina_aura"
		},
		buff_data = {}
	},
	{
		description = "markus_knight_passive_movement_speed_aura_desc",
		name = "markus_knight_passive_movement_speed_aura",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_knight_passive_movement_speed_aura",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.markus_knight_passive_movement_speed_aura_buff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_passive_movement_speed_aura"
		},
		buff_data = {}
	},
	{
		description = "markus_knight_improved_passive_defence_aura_desc",
		name = "markus_knight_improved_passive_defence_aura",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_knight_improved_passive_defence_aura",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_improved_passive_defence_aura_buff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_improved_passive_defence_aura"
		},
		buff_data = {}
	},
	{
		description = "regrowth_desc_2",
		name = "markus_knight_regrowth",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_knight_regrowth",
		description_values = {
			{
				value = BuffTemplates.regrowth.buffs[1].bonus
			}
		},
		requirements = {},
		buffs = {
			"regrowth"
		},
		buff_data = {}
	},
	{
		description = "bloodlust_desc_2",
		name = "markus_knight_bloodlust",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_knight_bloodlust",
		description_values = {
			{
				value = BuffTemplates.bloodlust.buffs[1].bonus
			}
		},
		requirements = {},
		buffs = {
			"bloodlust"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc_2",
		name = "markus_knight_conqueror",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_knight_conqueror",
		description_values = {
			{
				value = BuffTemplates.conqueror.buffs[1].bonus
			}
		},
		requirements = {},
		buffs = {
			"conqueror"
		},
		buff_data = {}
	},
	{
		description = "markus_knight_activated_ability_cooldown_desc",
		name = "markus_knight_activated_ability_cooldown",
		num_ranks = 1,
		icon = "markus_knight_activated_ability_cooldown",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_activated_ability_cooldown.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_activated_ability_cooldown"
		},
		buff_data = {}
	},
	{
		description = "markus_knight_activated_ability_damage_buff_desc",
		name = "markus_knight_activated_ability_damage_buff",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_knight_activated_ability_damage_buff",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_activated_ability_damage_buff.multiplier
			},
			{
				value = buff_tweak_data.markus_knight_activated_ability_damage_buff.duration
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "markus_knight_activated_ability_infinite_block_desc",
		name = "markus_knight_activated_ability_infinite_block",
		num_ranks = 1,
		icon = "markus_knight_activated_ability_infinite_block",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_activated_ability_infinite_block.multiplier
			},
			{
				value = buff_tweak_data.markus_knight_activated_ability_infinite_block.duration
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "markus_mercenary_healing_received_desc",
		name = "markus_mercenary_healing_received",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_mercenary_healing_received",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_healing_received.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_mercenary_healing_received"
		},
		buff_data = {}
	},
	{
		description = "markus_mercenary_stamina_regen_desc",
		name = "markus_mercenary_stamina_regen",
		num_ranks = 1,
		icon = "markus_mercenary_stamina_regen",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_stamina_regen.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_mercenary_stamina_regen"
		},
		buff_data = {}
	},
	{
		description = "markus_mercenary_crit_chance_desc",
		name = "markus_mercenary_crit_chance",
		num_ranks = 1,
		icon = "markus_mercenary_crit_chance",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_crit_chance.bonus
			}
		},
		requirements = {},
		buffs = {
			"markus_mercenary_crit_chance"
		},
		buff_data = {}
	},
	{
		description = "markus_mercenary_increased_damage_on_enemy_proximity_desc",
		name = "markus_mercenary_increased_damage_on_enemy_proximity",
		num_ranks = 1,
		buffer = "both",
		icon = "markus_mercenary_increased_damage_on_enemy_proximity",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_damage_on_enemy_proximity.multiplier
			},
			{
				value = buff_tweak_data.markus_mercenary_damage_on_enemy_proximity.max_stacks
			}
		},
		requirements = {},
		buffs = {
			"markus_mercenary_increased_damage_on_enemy_proximity"
		},
		buff_data = {}
	},
	{
		description = "markus_mercenary_increased_defence_on_low_health_desc",
		name = "markus_mercenary_increased_defence_on_low_health",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_mercenary_increased_defence_on_low_health",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_defence_on_low_health.multiplier
			},
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_increased_defence_on_low_health.activation_health
			}
		},
		requirements = {},
		buffs = {
			"markus_mercenary_increased_defence_on_low_health"
		},
		buff_data = {}
	},
	{
		description = "markus_mercenary_reduced_stun_duration_desc",
		name = "markus_mercenary_reduced_stun_duration",
		num_ranks = 1,
		icon = "markus_mercenary_reduced_stun_duration",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_reduced_stun_duration.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_mercenary_reduced_stun_duration"
		},
		buff_data = {}
	},
	{
		description = "markus_mercenary_passive_defence_on_proc_desc",
		name = "markus_mercenary_passive_defence_on_proc",
		num_ranks = 1,
		buffer = "both",
		icon = "markus_mercenary_passive_defence_on_proc",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_passive_defence.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_mercenary_passive_defence_on_proc"
		},
		buff_data = {}
	},
	{
		description = "markus_mercenary_passive_power_level_on_proc_desc",
		name = "markus_mercenary_passive_power_level_on_proc",
		num_ranks = 1,
		buffer = "both",
		icon = "markus_mercenary_passive_power_level_on_proc",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_passive_power_level.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_mercenary_passive_power_level_on_proc"
		},
		buff_data = {}
	},
	{
		description = "markus_mercenary_passive_group_proc_desc",
		name = "markus_mercenary_passive_group_proc",
		num_ranks = 1,
		icon = "markus_mercenary_passive_group_proc",
		description_values = {},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "regrowth_desc_2",
		name = "markus_mercenary_regrowth",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_mercenary_regrowth",
		description_values = {
			{
				value = BuffTemplates.regrowth.buffs[1].bonus
			}
		},
		requirements = {},
		buffs = {
			"regrowth"
		},
		buff_data = {}
	},
	{
		description = "bloodlust_desc_2",
		name = "markus_mercenary_bloodlust",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_mercenary_bloodlust",
		description_values = {
			{
				value = BuffTemplates.bloodlust.buffs[1].bonus
			}
		},
		requirements = {},
		buffs = {
			"bloodlust"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc_2",
		name = "markus_mercenary_conqueror",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_mercenary_conqueror",
		description_values = {
			{
				value = BuffTemplates.conqueror.buffs[1].bonus
			}
		},
		requirements = {},
		buffs = {
			"conqueror"
		},
		buff_data = {}
	},
	{
		description = "markus_mercenary_activated_ability_cooldown_desc",
		name = "markus_mercenary_activated_ability_cooldown",
		num_ranks = 1,
		icon = "markus_mercenary_activated_ability_cooldown",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_activated_ability_cooldown.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_mercenary_activated_ability_cooldown"
		},
		buff_data = {}
	},
	{
		description = "markus_mercenary_activated_ability_improved_healing_desc_2",
		name = "markus_mercenary_activated_ability_improved_healing",
		num_ranks = 1,
		icon = "markus_mercenary_activated_ability_improved_healing",
		description_values = {
			{
				value = buff_tweak_data.markus_mercenary_activated_ability_improved_healing.bonus
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "markus_mercenary_activated_ability_revive_desc",
		name = "markus_mercenary_activated_ability_revive",
		num_ranks = 1,
		icon = "markus_mercenary_activated_ability_revive",
		requirements = {},
		buffs = {},
		buff_data = {}
	}
}

for name, data in pairs(TalentBuffTemplates.empire_soldier) do
	local buffs = data.buffs

	fassert(#buffs == 1, "talent buff has more than one sub buff, add multiple buffs from the talent instead")

	local buff = buffs[1]
	buff.name = name
end

BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.empire_soldier, buff_tweak_data)

return
