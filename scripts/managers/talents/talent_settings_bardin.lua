local buff_tweak_data = {
	bardin_ironbreaker_ability_cooldown_on_hit = {
		bonus = 0.25
	},
	bardin_ironbreaker_ability_cooldown_on_damage_taken = {
		bonus = 0.5
	},
	bardin_ironbreaker_passive_increased_defence = {
		multiplier = -0.3
	},
	bardin_ironbreaker_passive_increased_stamina = {
		bonus = 2
	},
	bardin_ironbreaker_passive_reduced_stun_duration = {
		multiplier = 0.5
	},
	bardin_ironbreaker_gromril_delay = {
		duration = 20
	},
	bardin_ironbreaker_gromril_antistun = {
		multiplier = -0.5
	},
	bardin_ironbreaker_activated_ability = {
		duration = 10,
		range = 10,
		multiplier_damage_taken = -0.5,
		multiplier_block_cost = -1
	},
	bardin_ironbreaker_push_arc = {
		multiplier = 0.5
	},
	bardin_ironbreaker_max_health = {
		multiplier = 0.2
	},
	bardin_ironbreaker_max_stamina = {
		bonus = 2
	},
	bardin_ironbreaker_defence_buff = {
		duration = 10,
		multiplier = -0.5
	},
	bardin_ironbreaker_reduced_overcharge = {
		multiplier = -0.3
	},
	bardin_ironbreaker_regen_stamina_on_charged_attacks_buff = {
		duration = 2,
		multiplier = 0.4
	},
	bardin_ironbreaker_gromril_stamina_regen = {
		multiplier = 0.5
	},
	bardin_ironbreaker_gromril_armour_heal = {
		bonus = 10
	},
	bardin_ironbreaker_gromril_delay_short = {
		duration = 13
	},
	bardin_ironbreaker_activated_ability_duration = {
		duration = 15
	},
	bardin_ironbreaker_activated_ability_taunt_range = {
		range = 15
	},
	bardin_slayer_ability_cooldown_on_hit = {
		bonus = 0.5
	},
	bardin_slayer_ability_cooldown_on_damage_taken = {
		bonus = 0.1
	},
	bardin_slayer_passive_stacking_damage_buff = {
		max_stacks = 3,
		multiplier = 0.1,
		duration = 2
	},
	bardin_slayer_passive_attack_speed = {
		multiplier = 0.075
	},
	bardin_slayer_activated_ability = {
		duration = 10,
		multiplier = 0.3
	},
	bardin_slayer_crit_chance = {
		bonus = 0.05
	},
	bardin_slayer_max_health = {
		multiplier = 0.25
	},
	bardin_slayer_dodge_range = {
		multiplier = 1.2
	},
	bardin_slayer_damage_taken_capped = {
		bonus = 10
	},
	bardin_slayer_movement_speed = {
		multiplier = 1.15
	},
	bardin_slayer_passive_stacking_damage_buff_increased_duration = {
		duration = 5,
		multiplier = 0.1
	},
	bardin_slayer_passive_stacking_defence_buff = {
		duration = 2,
		multiplier = -0.1
	},
	bardin_slayer_passive_cooldown_reduction_on_max_stacks = {
		multiplier = 2
	},
	bardin_slayer_activated_ability_movement = {
		multiplier = 1.25
	},
	bardin_ranger_ability_cooldown_on_hit = {
		bonus = 0.3
	},
	bardin_ranger_ability_cooldown_on_damage_taken = {
		bonus = 0.3
	},
	bardin_ranger_passive = {
		drop_chance = 1
	},
	bardin_ranger_passive_reload_speed = {
		multiplier = -0.15
	},
	bardin_ranger_passive_increased_ammunition = {
		multiplier = 0.5
	},
	bardin_ranger_activated_ability = {
		duration = 10
	},
	bardin_ranger_reduced_spread = {
		multiplier = -0.25
	},
	bardin_ranger_attack_speed = {
		multiplier = 0.05
	},
	bardin_ranger_healing_received = {
		multiplier = 0.3
	},
	bardin_ranger_melee_damage_on_no_ammo = {
		multiplier = 0.25
	},
	bardin_ranger_movement_speed = {
		multiplier = 1.05
	},
	bardin_ranger_defence_on_disabled = {
		multiplier = -0.5
	},
	bardin_ranger_increased_ammunition = {
		multiplier = 0.5
	},
	bardin_ranger_increased_damage_on_enemy_proximity = {
		chunk_size = 1,
		range = 3
	},
	bardin_ranger_damage_on_enemy_proximity = {
		max_stacks = 5,
		multiplier = 0.05
	},
	bardin_ranger_heal_on_ranged_headshot = {
		bonus = 2
	},
	bardin_ranger_activated_ability_duration = {
		duration = 14
	},
	bardin_ranger_activated_ability_cooldown = {
		multiplier = -0.3
	},
	bardin_ranger_activated_ability_heal = {
		bonus = 20
	}
}
TalentBuffTemplates = TalentBuffTemplates or {}
TalentBuffTemplates.dwarf_ranger = {
	bardin_ironbreaker_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown
			}
		}
	},
	bardin_ironbreaker_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown_on_damage_taken
			}
		}
	},
	bardin_ironbreaker_passive_increased_defence = {
		buffs = {
			{
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	bardin_ironbreaker_passive_increased_stamina = {
		buffs = {
			{
				stat_buff = StatBuffIndex.MAX_FATIGUE
			}
		}
	},
	bardin_ironbreaker_passive_reduced_stun_duration = {
		buffs = {
			{
				stat_buff = StatBuffIndex.STUN_DURATION
			}
		}
	},
	bardin_ironbreaker_gromril_delay = {
		buffs = {
			{
				buff_after_delay = true,
				max_stacks = 1,
				refresh_durations = true,
				is_cooldown = true,
				icon = "bardin_ironbreaker_gromril_armour",
				dormant = true,
				delayed_buff_name = "bardin_ironbreaker_gromril_armour"
			}
		}
	},
	bardin_ironbreaker_refresh_gromril_armour = {
		buffs = {
			{
				event = "on_gromril_armour_removed",
				event_buff = true,
				buff_func = ProcFunctions.add_gromril_delay
			}
		}
	},
	bardin_ironbreaker_gromril_armour = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_ironbreaker_gromril_armour",
				dormant = true,
				refresh_durations = true
			}
		}
	},
	bardin_ironbreaker_gromril_antistun = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = StatBuffIndex.STUN_DURATION
			}
		}
	},
	bardin_ironbreaker_push_arc = {
		buffs = {
			{
				stat_buff = StatBuffIndex.BLOCK_ANGLE
			}
		}
	},
	bardin_ironbreaker_max_health = {
		buffs = {
			{
				stat_buff = StatBuffIndex.MAX_HEALTH_ALIVE
			}
		}
	},
	bardin_ironbreaker_max_stamina = {
		buffs = {
			{
				stat_buff = StatBuffIndex.MAX_FATIGUE
			}
		}
	},
	bardin_ironbreaker_buff_defense_on_revived_target = {
		buffs = {
			{
				event = "on_revived_ally",
				buff_to_add = "bardin_ironbreaker_defence_buff",
				event_buff = true,
				buff_func = ProcFunctions.buff_defence_on_revived_target
			}
		}
	},
	bardin_ironbreaker_defence_buff = {
		buffs = {
			{
				refresh_durations = true,
				max_stacks = 1,
				icon = "bardin_ironbreaker_buff_defense_on_revived_target",
				priority_buff = true,
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	bardin_ironbreaker_reduced_overcharge = {
		buffs = {
			{
				stat_buff = StatBuffIndex.REDUCED_OVERCHARGE
			}
		}
	},
	bardin_ironbreaker_regen_stamina_on_charged_attacks = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.bardin_ironbreaker_regen_stamina_on_charged_attacks
			}
		}
	},
	bardin_ironbreaker_regen_stamina_on_charged_attacks_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_ironbreaker_regen_stamina_on_charged_attacks",
				refresh_durations = true,
				stat_buff = StatBuffIndex.FATIGUE_REGEN
			}
		}
	},
	bardin_ironbreaker_stamina_regen_during_gromril = {
		buffs = {
			{
				buff_to_add = "bardin_ironbreaker_gromril_stamina_regen",
				activation_buff = "bardin_ironbreaker_gromril_armour",
				update_func = "activate_buff_on_other_buff"
			}
		}
	},
	bardin_ironbreaker_gromril_stamina_regen = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_ironbreaker_stamina_regen_during_gromril",
				stat_buff = StatBuffIndex.FATIGUE_REGEN
			}
		}
	},
	bardin_ironbreaker_gromril_armour_heal = {
		buffs = {
			{
				event = "on_gromril_armour_removed",
				event_buff = true,
				buff_func = ProcFunctions.heal
			}
		}
	},
	bardin_ironbreaker_gromril_delay_short = {
		buffs = {
			{
				buff_after_delay = true,
				name = "gromril_delay",
				max_stacks = 1,
				refresh_durations = true,
				is_cooldown = true,
				icon = "bardin_ironbreaker_gromril_armour",
				dormant = true,
				delayed_buff_name = "bardin_ironbreaker_gromril_armour"
			}
		}
	},
	bardin_ironbreaker_activated_ability = {
		activation_effect = "fx/screenspace_potion_03",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_tank_activate",
		buffs = {
			{
				update_func = "update_bardin_ironbreaker_activated_ability",
				perk = "reduced_hit_react",
				name = "bardin_ironbreaker_activated_ability",
				remove_buff_func = "end_bardin_ironbreaker_activated_ability",
				refresh_durations = true,
				max_stacks = 1,
				icon = "bardin_ironbreaker_activated_ability",
				stat_buff = StatBuffIndex.DAMAGE_TAKEN,
				multiplier = buff_tweak_data.bardin_ironbreaker_activated_ability.multiplier_damage_taken
			}
		}
	},
	bardin_ironbreaker_activated_ability_block_cost = {
		buffs = {
			{
				name = "bardin_ironbreaker_ability_stamina",
				refresh_durations = true,
				max_stacks = 1,
				stat_buff = StatBuffIndex.BLOCK_COST,
				multiplier = buff_tweak_data.bardin_ironbreaker_activated_ability.multiplier_block_cost,
				duration = buff_tweak_data.bardin_ironbreaker_activated_ability.duration
			}
		}
	},
	bardin_ironbreaker_activated_ability_duration = {
		activation_effect = "fx/screenspace_potion_03",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_tank_activate",
		buffs = {
			{
				update_func = "update_bardin_ironbreaker_activated_ability",
				perk = "reduced_hit_react",
				name = "bardin_ironbreaker_activated_ability_duration",
				remove_buff_func = "end_bardin_ironbreaker_activated_ability",
				refresh_durations = true,
				max_stacks = 1,
				icon = "bardin_ironbreaker_activated_ability",
				stat_buff = StatBuffIndex.DAMAGE_TAKEN,
				multiplier = buff_tweak_data.bardin_ironbreaker_activated_ability.multiplier_damage_taken
			}
		}
	},
	bardin_ironbreaker_activated_ability_duration_block_cost = {
		buffs = {
			{
				refresh_durations = true,
				max_stacks = 1,
				stat_buff = StatBuffIndex.BLOCK_COST,
				multiplier = buff_tweak_data.bardin_ironbreaker_activated_ability.multiplier_block_cost,
				duration = buff_tweak_data.bardin_ironbreaker_activated_ability_duration.duration
			}
		}
	},
	bardin_slayer_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown
			}
		}
	},
	bardin_slayer_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown_on_damage_taken
			}
		}
	},
	bardin_slayer_passive_attack_speed = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	bardin_slayer_passive_uninterruptible_heavy = {
		buffs = {
			{
				perk = "uninterruptible_heavy"
			}
		}
	},
	bardin_slayer_passive_stacking_damage_buff_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				max_stacks = buff_tweak_data.bardin_slayer_passive_stacking_damage_buff.max_stacks,
				buff_func = ProcFunctions.add_bardin_slayer_passive_buff
			}
		}
	},
	bardin_slayer_passive_stacking_damage_buff = {
		buffs = {
			{
				refresh_durations = true,
				icon = "bardin_slayer_passive",
				stat_buff = StatBuffIndex.INCREASED_WEAPON_DAMAGE_MELEE
			}
		}
	},
	bardin_slayer_activated_ability = {
		buffs = {
			{
				icon = "bardin_slayer_activated_ability",
				name = "bardin_slayer_frenzy",
				remove_buff_func = "end_slayer_activated_ability",
				max_stacks = 1,
				perk = "no_ranged_knockback",
				dormant = true,
				refresh_durations = true,
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	bardin_slayer_crit_chance = {
		buffs = {
			{
				stat_buff = StatBuffIndex.CRITICAL_STRIKE_CHANCE
			}
		}
	},
	bardin_slayer_max_health = {
		buffs = {
			{
				stat_buff = StatBuffIndex.MAX_HEALTH_ALIVE
			}
		}
	},
	bardin_slayer_dodge_range = {
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
	bardin_slayer_dodge_speed = {
		buffs = {
			{
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				multiplier = buff_tweak_data.bardin_slayer_dodge_range.multiplier,
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				}
			}
		}
	},
	bardin_slayer_movement_speed_on_last_standing = {
		buffs = {
			{
				buff_to_add = "bardin_slayer_movement_speed",
				update_func = "activate_buff_on_last_standing"
			}
		}
	},
	bardin_slayer_movement_speed = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				remove_buff_func = "remove_movement_buff",
				max_stacks = 1,
				icon = "bardin_slayer_movement_speed",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	bardin_slayer_damage_taken_capped = {
		buffs = {
			{
				stat_buff = StatBuffIndex.MAX_DAMAGE_TAKEN
			}
		}
	},
	bardin_slayer_debuff_defence_on_crit = {
		buffs = {
			{
				event = "on_critical_hit",
				buff_to_add = "defence_debuff_enemies",
				event_buff = true,
				buff_func = ProcFunctions.on_hit_debuff_enemy_defence
			}
		}
	},
	bardin_slayer_passive_stacking_damage_buff_increased_duration = {
		buffs = {
			{
				max_stacks = 3,
				icon = "bardin_slayer_passive",
				refresh_durations = true,
				stat_buff = StatBuffIndex.INCREASED_WEAPON_DAMAGE_MELEE
			}
		}
	},
	bardin_slayer_passive_stacking_defence_buff = {
		buffs = {
			{
				max_stacks = 3,
				icon = "bardin_slayer_passive_stacking_damage_buff_grants_defence",
				refresh_durations = true,
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	bardin_slayer_passive_cooldown_reduction_on_max_stacks = {
		buffs = {
			{
				icon = "bardin_slayer_passive_cooldown_reduction_on_max_stacks",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = StatBuffIndex.COOLDOWN_REGEN,
				duration = buff_tweak_data.bardin_slayer_passive_stacking_damage_buff.duration
			}
		}
	},
	bardin_slayer_heal_on_kill = {
		buffs = {
			{
				event = "on_kill",
				event_buff = true,
				buff_func = ProcFunctions.heal
			}
		}
	},
	bardin_slayer_slower_hits = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	bardin_slayer_heavy_hits = {
		buffs = {
			{
				stat_buff = StatBuffIndex.INCREASED_WEAPON_DAMAGE
			}
		}
	},
	bardin_slayer_activated_ability_movement = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				duration = buff_tweak_data.bardin_slayer_activated_ability.duration,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	bardin_slayer_activated_ability_uninterruptible = {
		buffs = {
			{
				max_stacks = 1,
				perk = "uninterruptible",
				refresh_durations = true,
				duration = buff_tweak_data.bardin_slayer_activated_ability.duration
			}
		}
	},
	bardin_ranger_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown
			}
		}
	},
	bardin_ranger_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown_on_damage_taken
			}
		}
	},
	bardin_ranger_passive = {
		buffs = {
			{
				event = "on_special_killed",
				event_buff = true,
				buff_func = ProcFunctions.bardin_ranger_scavenge_proc
			}
		}
	},
	bardin_ranger_passive_reload_speed = {
		buffs = {
			{
				stat_buff = StatBuffIndex.RELOAD_SPEED
			}
		}
	},
	bardin_ranger_passive_increased_ammunition = {
		buffs = {
			{
				stat_buff = StatBuffIndex.TOTAL_AMMO
			}
		}
	},
	bardin_ranger_activated_ability = {
		deactivation_effect = "fx/screenspace_ranger_skill_02",
		continuous_effect = "fx/screenspace_ranger_skill_01",
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_ranger_activated_ability",
				remove_buff_func = "end_ranger_activated_ability",
				refresh_durations = true
			}
		}
	},
	bardin_ranger_attack_speed = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	bardin_ranger_reduced_spread = {
		buffs = {
			{
				stat_buff = StatBuffIndex.REDUCED_SPREAD
			}
		}
	},
	bardin_ranger_healing_received = {
		buffs = {
			{
				stat_buff = StatBuffIndex.HEALING_RECEIVED
			}
		}
	},
	bardin_ranger_increased_melee_damage_on_no_ammo = {
		buffs = {
			{
				buff_to_add = "bardin_ranger_melee_damage_on_no_ammo",
				update_func = "activate_buff_on_no_ammo"
			}
		}
	},
	bardin_ranger_melee_damage_on_no_ammo = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_ranger_increased_melee_damage_on_no_ammo",
				priority_buff = true,
				stat_buff = StatBuffIndex.POWER_LEVEL
			}
		}
	},
	bardin_ranger_movement_speed = {
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
	bardin_ranger_increased_defence_on_disabled = {
		buffs = {
			{
				buff_to_add = "bardin_ranger_defence_on_disabled",
				update_func = "activate_buff_on_disabled"
			}
		}
	},
	bardin_ranger_defence_on_disabled = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_ranger_increased_defence_on_disabled",
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	bardin_ranger_activated_ability_duration = {
		deactivation_effect = "fx/screenspace_ranger_skill_02",
		continuous_effect = "fx/screenspace_ranger_skill_01",
		buffs = {
			{
				icon = "bardin_ranger_activated_ability",
				name = "bardin_ranger_activated_ability",
				refresh_durations = true,
				max_stacks = 1,
				remove_buff_func = "end_ranger_activated_ability"
			}
		}
	},
	bardin_ranger_activated_ability_cooldown = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ACTIVATED_COOLDOWN
			}
		}
	}
}
TalentTrees = TalentTrees or {}
TalentTrees.dwarf_ranger = {
	{
		{
			"bardin_ironbreaker_push_arc",
			"bardin_ironbreaker_max_health",
			"bardin_ironbreaker_max_stamina"
		},
		{
			"bardin_ironbreaker_buff_defense_on_revived_target",
			"bardin_ironbreaker_reduced_overcharge",
			"bardin_ironbreaker_regen_stamina_on_charged_attacks"
		},
		{
			"bardin_ironbreaker_stamina_regen_during_gromril",
			"bardin_ironbreaker_gromril_armour_heal",
			"bardin_ironbreaker_max_gromril_delay"
		},
		{
			"bardin_ironbreaker_regrowth",
			"bardin_ironbreaker_bloodlust",
			"bardin_ironbreaker_conqueror"
		},
		{
			"bardin_ironbreaker_activated_ability_duration",
			"bardin_ironbreaker_activated_ability_taunt_range",
			"bardin_ironbreaker_activated_ability_taunt_bosses"
		}
	},
	{
		{
			"bardin_slayer_max_health",
			"bardin_slayer_crit_chance",
			"bardin_slayer_dodge_range"
		},
		{
			"bardin_slayer_damage_taken_capped",
			"bardin_slayer_movement_speed",
			"bardin_slayer_debuff_defence_on_crit"
		},
		{
			"bardin_slayer_passive_stacking_damage_buff_increased_duration",
			"bardin_slayer_passive_stacking_damage_buff_grants_defence",
			"bardin_slayer_passive_cooldown_reduction_on_max_stacks"
		},
		{
			"bardin_slayer_regrowth",
			"bardin_slayer_bloodlust",
			"bardin_slayer_conqueror"
		},
		{
			"bardin_slayer_activated_ability_impact_damage",
			"bardin_slayer_activated_ability_uninterruptible",
			"bardin_slayer_activated_ability_movement"
		}
	},
	{
		{
			"bardin_ranger_reduced_spread",
			"bardin_ranger_healing_received",
			"bardin_ranger_attack_speed"
		},
		{
			"bardin_ranger_increased_melee_damage_on_no_ammo",
			"bardin_ranger_movement_speed",
			"bardin_ranger_increased_defence_on_disabled"
		},
		{
			"bardin_ranger_passive_spawn_healing_draught",
			"bardin_ranger_passive_improved_ammo",
			"bardin_ranger_passive_spawn_potions"
		},
		{
			"bardin_ranger_regrowth",
			"bardin_ranger_bloodlust",
			"bardin_ranger_conqueror"
		},
		{
			"bardin_ranger_activated_ability_duration",
			"bardin_ranger_activated_ability_cooldown",
			"bardin_ranger_activated_ability_heal"
		}
	}
}
Talents = Talents or {}
Talents.dwarf_ranger = {
	{
		description = "bardin_ironbreaker_push_arc_desc",
		name = "bardin_ironbreaker_push_arc",
		num_ranks = 1,
		icon = "bardin_ironbreaker_push_arc",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_push_arc.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_ironbreaker_push_arc"
		},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_max_health_desc",
		name = "bardin_ironbreaker_max_health",
		num_ranks = 1,
		buffer = "both",
		icon = "bardin_ironbreaker_max_health",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_max_health.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_ironbreaker_max_health"
		},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_max_stamina_desc",
		name = "bardin_ironbreaker_max_stamina",
		num_ranks = 1,
		icon = "bardin_ironbreaker_max_stamina",
		description_values = {
			{
				value = buff_tweak_data.bardin_ironbreaker_max_stamina.bonus
			}
		},
		requirements = {},
		buffs = {
			"bardin_ironbreaker_max_stamina"
		},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_buff_defense_on_revived_target_desc",
		name = "bardin_ironbreaker_buff_defense_on_revived_target",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ironbreaker_buff_defense_on_revived_target",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_defence_buff.multiplier
			},
			{
				value = buff_tweak_data.bardin_ironbreaker_defence_buff.duration
			}
		},
		requirements = {},
		buffs = {
			"bardin_ironbreaker_buff_defense_on_revived_target"
		},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_reduced_overcharge_desc",
		name = "bardin_ironbreaker_reduced_overcharge",
		num_ranks = 1,
		icon = "bardin_ironbreaker_reduced_overcharge",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_reduced_overcharge.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_ironbreaker_reduced_overcharge"
		},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_regen_stamina_on_charged_attacks_desc",
		name = "bardin_ironbreaker_regen_stamina_on_charged_attacks",
		num_ranks = 1,
		icon = "bardin_ironbreaker_regen_stamina_on_charged_attacks",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_regen_stamina_on_charged_attacks_buff.multiplier
			},
			{
				value = buff_tweak_data.bardin_ironbreaker_regen_stamina_on_charged_attacks_buff.duration
			}
		},
		requirements = {},
		buffs = {
			"bardin_ironbreaker_regen_stamina_on_charged_attacks"
		},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_stamina_regen_during_gromril_desc",
		name = "bardin_ironbreaker_stamina_regen_during_gromril",
		num_ranks = 1,
		icon = "bardin_ironbreaker_stamina_regen_during_gromril",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_gromril_stamina_regen.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_ironbreaker_stamina_regen_during_gromril"
		},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_gromril_armour_heal_desc",
		name = "bardin_ironbreaker_gromril_armour_heal",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ironbreaker_gromril_armour_heal",
		description_values = {
			{
				value = buff_tweak_data.bardin_ironbreaker_gromril_armour_heal.bonus
			}
		},
		requirements = {},
		buffs = {
			"bardin_ironbreaker_gromril_armour_heal"
		},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_max_gromril_delay_desc",
		name = "bardin_ironbreaker_max_gromril_delay",
		num_ranks = 1,
		icon = "bardin_ironbreaker_max_gromril_delay",
		description_values = {
			{
				value = buff_tweak_data.bardin_ironbreaker_gromril_delay_short.duration
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "regrowth_desc",
		name = "bardin_ironbreaker_regrowth",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ironbreaker_regrowth",
		description_values = {},
		requirements = {},
		buffs = {
			"regrowth"
		},
		buff_data = {}
	},
	{
		description = "bloodlust_desc",
		name = "bardin_ironbreaker_bloodlust",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ironbreaker_bloodlust",
		description_values = {},
		requirements = {},
		buffs = {
			"bloodlust"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc",
		name = "bardin_ironbreaker_conqueror",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ironbreaker_conqueror",
		description_values = {},
		requirements = {},
		buffs = {
			"conqueror"
		},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_activated_ability_duration_desc",
		name = "bardin_ironbreaker_activated_ability_duration",
		num_ranks = 1,
		icon = "bardin_ironbreaker_activated_ability_duration",
		description_values = {
			{
				value = buff_tweak_data.bardin_ironbreaker_activated_ability_duration.duration
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_activated_ability_taunt_range_desc",
		name = "bardin_ironbreaker_activated_ability_taunt_range",
		num_ranks = 1,
		icon = "bardin_ironbreaker_activated_ability_taunt_range",
		description_values = {
			{
				value = buff_tweak_data.bardin_ironbreaker_activated_ability_taunt_range.range
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_activated_ability_taunt_bosses_desc",
		name = "bardin_ironbreaker_activated_ability_taunt_bosses",
		num_ranks = 1,
		icon = "bardin_ironbreaker_activated_ability_taunt_bosses",
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_slayer_dodge_range_desc",
		name = "bardin_slayer_dodge_range",
		num_ranks = 1,
		icon = "bardin_slayer_dodge_range",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.bardin_slayer_dodge_range.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_slayer_dodge_range",
			"bardin_slayer_dodge_speed"
		},
		buff_data = {}
	},
	{
		description = "bardin_slayer_max_health_desc",
		name = "bardin_slayer_max_health",
		num_ranks = 1,
		icon = "bardin_slayer_max_health",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_max_health.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_slayer_max_health"
		},
		buff_data = {}
	},
	{
		description = "bardin_slayer_crit_chance_desc",
		name = "bardin_slayer_crit_chance",
		num_ranks = 1,
		icon = "bardin_slayer_crit_chance",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_crit_chance.bonus
			}
		},
		requirements = {},
		buffs = {
			"bardin_slayer_crit_chance"
		},
		buff_data = {}
	},
	{
		description = "bardin_slayer_movement_speed_desc",
		name = "bardin_slayer_movement_speed",
		num_ranks = 1,
		icon = "bardin_slayer_movement_speed",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.bardin_slayer_movement_speed.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_slayer_movement_speed_on_last_standing"
		},
		buff_data = {}
	},
	{
		description = "bardin_slayer_damage_taken_capped_desc",
		name = "bardin_slayer_damage_taken_capped",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_slayer_damage_taken_capped",
		description_values = {
			{
				value = buff_tweak_data.bardin_slayer_damage_taken_capped.bonus
			}
		},
		requirements = {},
		buffs = {
			"bardin_slayer_damage_taken_capped"
		},
		buff_data = {}
	},
	{
		description = "bardin_slayer_debuff_defence_on_crit_desc",
		name = "bardin_slayer_debuff_defence_on_crit",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_slayer_debuff_defence_on_crit",
		description_values = {},
		requirements = {},
		buffs = {
			"bardin_slayer_debuff_defence_on_crit"
		},
		buff_data = {}
	},
	{
		description = "bardin_slayer_passive_stacking_damage_buff_increased_duration_desc",
		name = "bardin_slayer_passive_stacking_damage_buff_increased_duration",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_slayer_passive_stacking_damage_buff_increased_duration",
		description_values = {},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_slayer_passive_stacking_damage_buff_grants_defence_desc",
		name = "bardin_slayer_passive_stacking_damage_buff_grants_defence",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_slayer_passive_stacking_damage_buff_grants_defence",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_passive_stacking_defence_buff.multiplier
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_slayer_passive_cooldown_reduction_on_max_stacks_desc",
		name = "bardin_slayer_passive_cooldown_reduction_on_max_stacks",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_slayer_passive_cooldown_reduction_on_max_stacks",
		description_values = {},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "regrowth_desc",
		name = "bardin_slayer_regrowth",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_slayer_regrowth",
		description_values = {},
		requirements = {},
		buffs = {
			"regrowth"
		},
		buff_data = {}
	},
	{
		description = "bloodlust_desc",
		name = "bardin_slayer_bloodlust",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_slayer_bloodlust",
		description_values = {},
		requirements = {},
		buffs = {
			"bloodlust"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc",
		name = "bardin_slayer_conqueror",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_slayer_conqueror",
		description_values = {},
		requirements = {},
		buffs = {
			"conqueror"
		},
		buff_data = {}
	},
	{
		description = "bardin_slayer_activated_ability_impact_damage_desc",
		name = "bardin_slayer_activated_ability_impact_damage",
		num_ranks = 1,
		icon = "bardin_slayer_activated_ability_impact_damage",
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_slayer_activated_ability_movement_desc",
		name = "bardin_slayer_activated_ability_movement",
		num_ranks = 1,
		icon = "bardin_slayer_activated_ability_movement",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.bardin_slayer_activated_ability_movement.multiplier
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_slayer_activated_ability_uninterruptible_desc",
		name = "bardin_slayer_activated_ability_uninterruptible",
		num_ranks = 1,
		icon = "bardin_slayer_activated_ability_uninterruptible",
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_ranger_reduced_spread_desc",
		name = "bardin_ranger_reduced_spread",
		num_ranks = 1,
		icon = "bardin_ranger_reduced_spread",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_reduced_spread.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_ranger_reduced_spread"
		},
		buff_data = {}
	},
	{
		description = "bardin_ranger_healing_received_desc",
		name = "bardin_ranger_healing_received",
		num_ranks = 1,
		icon = "bardin_ranger_healing_received",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_healing_received.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_ranger_healing_received"
		},
		buff_data = {}
	},
	{
		description = "bardin_ranger_attack_speed_desc",
		name = "bardin_ranger_attack_speed",
		num_ranks = 1,
		icon = "bardin_ranger_attack_speed",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_attack_speed.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_ranger_attack_speed"
		},
		buff_data = {}
	},
	{
		description = "bardin_ranger_increased_melee_damage_on_no_ammo_desc",
		name = "bardin_ranger_increased_melee_damage_on_no_ammo",
		num_ranks = 1,
		icon = "bardin_ranger_increased_melee_damage_on_no_ammo",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_melee_damage_on_no_ammo.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_ranger_increased_melee_damage_on_no_ammo"
		},
		buff_data = {}
	},
	{
		description = "bardin_ranger_movement_speed_desc",
		name = "bardin_ranger_movement_speed",
		num_ranks = 1,
		icon = "bardin_ranger_movement_speed",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.bardin_ranger_movement_speed.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_ranger_movement_speed"
		},
		buff_data = {}
	},
	{
		description = "bardin_ranger_increased_defence_on_disabled_desc",
		name = "bardin_ranger_increased_defence_on_disabled",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ranger_increased_defence_on_disabled",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_defence_on_disabled.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_ranger_increased_defence_on_disabled"
		},
		buff_data = {}
	},
	{
		description = "bardin_ranger_passive_spawn_healing_draught_desc",
		name = "bardin_ranger_passive_spawn_healing_draught",
		num_ranks = 1,
		icon = "bardin_ranger_passive_spawn_healing_draught",
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_ranger_passive_spawn_potions_desc",
		name = "bardin_ranger_passive_spawn_potions",
		num_ranks = 1,
		icon = "bardin_ranger_passive_spawn_potions",
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_ranger_passive_improved_ammo_desc",
		name = "bardin_ranger_passive_improved_ammo",
		num_ranks = 1,
		icon = "bardin_ranger_passive_improved_ammo",
		description_values = {},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "regrowth_desc",
		name = "bardin_ranger_regrowth",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ranger_regrowth",
		description_values = {},
		requirements = {},
		buffs = {
			"regrowth"
		},
		buff_data = {}
	},
	{
		description = "bloodlust_desc",
		name = "bardin_ranger_bloodlust",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ranger_bloodlust",
		description_values = {},
		requirements = {},
		buffs = {
			"bloodlust"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc",
		name = "bardin_ranger_conqueror",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ranger_conqueror",
		description_values = {},
		requirements = {},
		buffs = {
			"conqueror"
		},
		buff_data = {}
	},
	{
		description = "bardin_ranger_activated_ability_duration_desc",
		name = "bardin_ranger_activated_ability_duration",
		num_ranks = 1,
		icon = "bardin_ranger_activated_ability_duration",
		description_values = {
			{
				value = buff_tweak_data.bardin_ranger_activated_ability_duration.duration
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_ranger_activated_ability_cooldown_desc",
		name = "bardin_ranger_activated_ability_cooldown",
		num_ranks = 1,
		icon = "bardin_ranger_activated_ability_cooldown",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_activated_ability_cooldown.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_ranger_activated_ability_cooldown"
		},
		buff_data = {}
	},
	{
		description = "bardin_ranger_activated_ability_heal_desc",
		name = "bardin_ranger_activated_ability_heal",
		num_ranks = 1,
		icon = "bardin_ranger_activated_ability_heal",
		description_values = {
			{
				value = buff_tweak_data.bardin_ranger_activated_ability_heal.bonus
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	}
}

for name, data in pairs(TalentBuffTemplates.dwarf_ranger) do
	local buffs = data.buffs

	fassert(#buffs == 1, "talent buff has more than one sub buff, add multiple buffs from the talent instead")

	local buff = buffs[1]
	buff.name = name
end

BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.dwarf_ranger, buff_tweak_data)

return
