local buff_tweak_data = {
	kerillian_shade_ability_cooldown_on_hit = {
		bonus = 0.5
	},
	kerillian_shade_ability_cooldown_on_damage_taken = {
		bonus = 0.2
	},
	kerillian_shade_passive = {
		multiplier = 0.5
	},
	kerillian_shade_passive_crit = {
		bonus = 0.05
	},
	kerillian_shade_activated_ability = {
		duration = 10
	},
	kerillian_shade_attack_speed = {
		multiplier = 0.05
	},
	kerillian_shade_stamina_regen = {
		multiplier = 0.3
	},
	kerillian_shade_dodge_range = {
		multiplier = 1.1
	},
	kerillian_shade_dodge_speed = {
		multiplier = 1.1
	},
	kerillian_shade_movement_speed = {
		multiplier = 1.05
	},
	kerillian_shade_defence_debuff = {
		multiplier = 0.25,
		duration = 5
	},
	kerillian_shade_damage_on_grimoire_picked_up = {
		multiplier = 0.25
	},
	kerillian_shade_passive_improved = {
		multiplier = 0.25
	},
	kerillian_shade_backstabs_replenishes_ammunition = {
		bonus = 1
	},
	kerillian_shade_heal_on_melee_headshot = {
		bonus = 2
	},
	kerillian_shade_activated_ability_duration = {
		duration = 15
	},
	kerillian_shade_activated_ability_cooldown = {
		multiplier = -0.3
	},
	kerillian_maidenguard_ability_cooldown_on_hit = {
		bonus = 0.25
	},
	kerillian_maidenguard_ability_cooldown_on_damage_taken = {
		bonus = 0.5
	},
	kerillian_maidenguard_passive_dodge = {
		multiplier = 1.125
	},
	kerillian_maidenguard_passive_dodge_speed = {
		multiplier = 1.125
	},
	kerillian_maidenguard_passive_increased_stamina = {
		bonus = 0.3
	},
	kerillian_maidenguard_passive_damage_reduction = {
		multiplier = 0.2
	},
	kerillian_maidenguard_passive_stamina_regen_aura = {
		range = 5
	},
	kerillian_maidenguard_passive_stamina_regen_buff = {
		multiplier = 1
	},
	kerillian_maidenguard_activated_ability = {
		duration = 0.45
	},
	kerillian_maidenguard_max_stamina = {
		bonus = 2
	},
	kerillian_maidenguard_push_arc = {
		multiplier = 0.3
	},
	kerillian_maidenguard_max_ammo = {
		multiplier = 0.4
	},
	kerillian_maidenguard_slower_hits = {
		multiplier = -0.05
	},
	kerillian_maidenguard_heavy_hits = {
		multiplier = 0.1
	},
	kerillian_maidenguard_defence_on_last_standing = {
		multiplier = -0.5
	},
	kerillian_maidenguard_movement_speed = {
		multiplier = 1.05
	},
	kerillian_maidenguard_improved_stamina_regen = {
		multiplier = 0.3
	},
	kerillian_maidenguard_improved_dodge = {
		multiplier = 1.05
	},
	kerillian_maidenguard_improved_dodge_speed = {
		multiplier = 1.05
	},
	kerillian_maidenguard_activated_ability_damage = {
		multiplier = 1
	},
	kerillian_maidenguard_activated_ability_cooldown = {
		multiplier = -0.3
	},
	kerillian_maidenguard_activated_ability_invis_duration = {
		duration = 3
	},
	kerillian_waywatcher_ability_cooldown_on_hit = {
		bonus = 0.35
	},
	kerillian_waywatcher_ability_cooldown_on_damage_taken = {
		bonus = 0.3
	},
	kerillian_waywatcher_passive = {
		time_between_heals = 7,
		heal_amount = 2
	},
	kerillian_waywatcher_passive_increased_ammunition = {
		multiplier = 1
	},
	kerillian_waywatcher_crit_chance = {
		bonus = 0.05
	},
	kerillian_waywatcher_stamina_regen = {
		multiplier = 0.3
	},
	kerillian_waywatcher_attack_speed = {
		multiplier = 0.05
	},
	kerillian_waywatcher_gain_ammo_on_boss_death = {
		ammo_bonus_fraction = 0.5
	},
	kerillian_waywatcher_increased_crit_hit_damage_on_high_health = {
		activation_health = 0.25
	},
	kerillian_waywatcher_crit_hit_damage_on_high_health = {
		multiplier = 0.3
	},
	kerillian_waywatcher_headshot_multiplier = {
		multiplier = 0.5
	},
	kerillian_waywatcher_improved_regen = {
		bonus = 3
	},
	kerillian_waywatcher_regenerate_ammunition = {
		bonus = 1
	},
	kerillian_waywatcher_heal_on_ranged_headshot = {
		bonus = 2
	},
	kerillian_waywatcher_movement_speed = {
		multiplier = 1.05
	},
	kerillian_waywatcher_activated_ability_cooldown = {
		multiplier = -0.3
	},
	kerillian_waywatcher_activated_ability_heal = {
		bonus = 35
	},
	kerillian_waywatcher_activated_ability_restore_ammo = {
		multiplier = 0.5
	}
}
TalentBuffTemplates = TalentBuffTemplates or {}
TalentBuffTemplates.wood_elf = {
	kerillian_shade_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown
			}
		}
	},
	kerillian_shade_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown_on_damage_taken
			}
		}
	},
	kerillian_shade_passive = {
		buffs = {
			{
				stat_buff = StatBuffIndex.BACKSTAB_MULTIPLIER
			}
		}
	},
	kerillian_shade_passive_crit = {
		buffs = {
			{
				stat_buff = StatBuffIndex.CRITICAL_STRIKE_CHANCE
			}
		}
	},
	kerillian_shade_passive_backstab_killing_blow = {
		buffs = {
			{
				perk = "crit_backstab_killing_blow"
			}
		}
	},
	kerillian_shade_end_activated_ability = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.end_shade_activated_ability
			}
		}
	},
	kerillian_shade_activated_ability = {
		deactivation_effect = "fx/screenspace_shade_skill_02",
		continuous_effect = "fx/screenspace_shade_skill_01",
		buffs = {
			{
				icon = "passive_bonus_kerillian_shade",
				name = "kerillian_shade_activated_ability",
				max_stacks = 1,
				remove_buff_func = "end_shade_activated_ability",
				dormant = true
			}
		}
	},
	kerillian_shade_attack_speed = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	kerillian_shade_stamina_regen = {
		buffs = {
			{
				stat_buff = StatBuffIndex.FATIGUE_REGEN
			}
		}
	},
	kerillian_shade_dodge_range = {
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
	kerillian_shade_dodge_speed = {
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
	kerillian_shade_movement_speed = {
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
	kerillian_shade_debuff_defence_on_disabler = {
		buffs = {
			{
				event = "on_damage_taken",
				buff_to_add = "kerillian_shade_defence_debuff",
				event_buff = true,
				buff_func = ProcFunctions.activate_buff_on_disabler
			}
		}
	},
	kerillian_shade_defence_debuff = {
		buffs = {
			{
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	kerillian_shade_increased_damage_on_grimoire_picked_up = {
		buffs = {
			{
				buff_to_add = "kerillian_shade_damage_on_grimoire_picked_up",
				update_func = "activate_buff_on_grimoire_picked_up"
			}
		}
	},
	kerillian_shade_damage_on_grimoire_picked_up = {
		buffs = {
			{
				max_stacks = 1,
				icon = "kerillian_shade_increased_damage_on_grimoire_picked_up",
				stat_buff = StatBuffIndex.POWER_LEVEL
			}
		}
	},
	kerillian_shade_passive_improved = {
		buffs = {
			{
				stat_buff = StatBuffIndex.BACKSTAB_MULTIPLIER
			}
		}
	},
	kerillian_shade_backstabs_replenishes_ammunition = {
		buffs = {
			{
				event = "on_backstab",
				event_buff = true,
				buff_func = ProcFunctions.ammo_gain
			}
		}
	},
	kerillian_shade_heal_on_melee_headshot = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.heal_on_melee_headshot
			}
		}
	},
	kerillian_shade_debuff_defence_on_crit = {
		buffs = {
			{
				event = "on_critical_hit",
				buff_to_add = "defence_debuff_enemies",
				event_buff = true,
				buff_func = ProcFunctions.on_hit_debuff_enemy_defence
			}
		}
	},
	kerillian_shade_activated_ability_duration = {
		deactivation_effect = "fx/screenspace_shade_skill_02",
		continuous_effect = "fx/screenspace_shade_skill_01",
		buffs = {
			{
				max_stacks = 1,
				remove_buff_func = "end_shade_activated_ability"
			}
		}
	},
	kerillian_shade_activated_ability_cooldown = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ACTIVATED_COOLDOWN
			}
		}
	},
	kerillian_maidenguard_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown
			}
		}
	},
	kerillian_maidenguard_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown_on_damage_taken
			}
		}
	},
	kerillian_maidenguard_passive_increased_stamina = {
		buffs = {
			{
				stat_buff = StatBuffIndex.MAX_FATIGUE
			}
		}
	},
	kerillian_maidenguard_passive_damage_reduction = {
		buffs = {
			{
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	kerillian_maidenguard_passive_dodge = {
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
	kerillian_maidenguard_passive_dodge_speed = {
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
	kerillian_maidenguard_passive_stamina_regen_aura = {
		buffs = {
			{
				buff_to_add = "kerillian_maidenguard_passive_stamina_regen_buff",
				update_func = "activate_buff_on_distance"
			}
		}
	},
	kerillian_maidenguard_passive_uninterruptible_revive = {
		buffs = {
			{
				perk = "uninterruptible_revive"
			}
		}
	},
	kerillian_maidenguard_passive_stamina_regen_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "kerillian_maidenguard_passive",
				stat_buff = StatBuffIndex.FATIGUE_REGEN
			}
		}
	},
	kerillian_maidenguard_activated_ability = {
		buffs = {
			{
				apply_buff_func = "start_maidenguard_activated_ability",
				remove_buff_func = "end_maidenguard_activated_ability"
			}
		}
	},
	kerillian_maidenguard_max_stamina = {
		buffs = {
			{
				stat_buff = StatBuffIndex.MAX_FATIGUE
			}
		}
	},
	kerillian_maidenguard_push_arc = {
		buffs = {
			{
				stat_buff = StatBuffIndex.BLOCK_ANGLE
			}
		}
	},
	kerillian_maidenguard_max_ammo = {
		buffs = {
			{
				stat_buff = StatBuffIndex.TOTAL_AMMO
			}
		}
	},
	kerillian_maidenguard_remove_wounded_on_boss_death = {
		buffs = {
			{
				event = "on_boss_killed",
				event_buff = true,
				buff_func = ProcFunctions.remove_wounded
			}
		}
	},
	kerillian_maidenguard_slower_hits = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	kerillian_maidenguard_heavy_hits = {
		buffs = {
			{
				stat_buff = StatBuffIndex.POWER_LEVEL
			}
		}
	},
	kerillian_maidenguard_damage_reduction_on_last_standing = {
		buffs = {
			{
				buff_to_add = "kerillian_maidenguard_defence_on_last_standing",
				update_func = "activate_buff_on_last_standing"
			}
		}
	},
	kerillian_maidenguard_defence_on_last_standing = {
		buffs = {
			{
				max_stacks = 1,
				icon = "kerillian_maidenguard_damage_reduction_on_last_standing",
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	kerillian_maidenguard_movement_speed = {
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
	kerillian_maidenguard_improved_stamina_regen = {
		buffs = {
			{
				multiplier = 0.3,
				stat_buff = StatBuffIndex.FATIGUE_REGEN
			}
		}
	},
	kerillian_maidenguard_improved_dodge = {
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
	kerillian_maidenguard_improved_dodge_speed = {
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
	kerillian_maidenguard_activated_ability_cooldown = {
		buffs = {
			{
				name = "kerillian_maidenguard_activated_ability_cooldown",
				stat_buff = StatBuffIndex.ACTIVATED_COOLDOWN
			}
		}
	},
	kerillian_maidenguard_activated_ability_invis_duration = {
		buffs = {
			{
				remove_buff_func = "end_maidenguard_activated_ability",
				name = "kerillian_maidenguard_activated_ability"
			}
		}
	},
	kerillian_waywatcher_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown
			}
		}
	},
	kerillian_waywatcher_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown_on_damage_taken
			}
		}
	},
	kerillian_waywatcher_passive_increased_ammunition = {
		buffs = {
			{
				stat_buff = StatBuffIndex.TOTAL_AMMO
			}
		}
	},
	kerillian_waywatcher_passive = {
		buffs = {
			{
				max_stacks = 1,
				icon = "kerillian_waywatcher_passive",
				update_func = "update_kerillian_waywatcher_regen"
			}
		}
	},
	kerillian_waywatcher_passive_increased_zoom = {
		buffs = {
			{
				perk = "increased_zoom"
			}
		}
	},
	kerillian_waywatcher_passive_no_damage_dropoff = {
		buffs = {
			{
				perk = "no_damage_dropoff"
			}
		}
	},
	kerillian_waywatcher_crit_chance = {
		buffs = {
			{
				stat_buff = StatBuffIndex.CRITICAL_STRIKE_CHANCE
			}
		}
	},
	kerillian_waywatcher_stamina_regen = {
		buffs = {
			{
				stat_buff = StatBuffIndex.FATIGUE_REGEN
			}
		}
	},
	kerillian_waywatcher_attack_speed = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	kerillian_waywatcher_gain_ammo_on_boss_death = {
		buffs = {
			{
				event = "on_boss_killed",
				event_buff = true,
				buff_func = ProcFunctions.ammo_fraction_gain
			}
		}
	},
	kerillian_waywatcher_increased_crit_hit_damage_on_high_health = {
		buffs = {
			{
				buff_to_add = "kerillian_waywatcher_crit_hit_damage_on_high_health",
				update_func = "activate_buff_on_health_percent"
			}
		}
	},
	kerillian_waywatcher_crit_hit_damage_on_high_health = {
		buffs = {
			{
				max_stacks = 1,
				icon = "kerillian_waywatcher_increased_crit_hit_damage_on_high_health",
				priority_buff = true,
				stat_buff = StatBuffIndex.CRITICAL_STRIKE_EFFECTIVENESS
			}
		}
	},
	kerillian_waywatcher_headshot_multiplier = {
		buffs = {
			{
				stat_buff = StatBuffIndex.HEADSHOT_MULTIPLIER
			}
		}
	},
	kerillian_waywatcher_heal_on_ranged_headshot = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.heal_on_ranged_headshot
			}
		}
	},
	kerillian_waywatcher_movement_speed = {
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
	kerillian_waywatcher_activated_ability_cooldown = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ACTIVATED_COOLDOWN
			}
		}
	}
}
TalentTrees = TalentTrees or {}
TalentTrees.wood_elf = {
	{
		{
			"kerillian_shade_stamina_regen",
			"kerillian_shade_attack_speed",
			"kerillian_shade_dodge_range"
		},
		{
			"kerillian_shade_movement_speed",
			"kerillian_shade_debuff_defence_on_disabler",
			"kerillian_shade_increased_damage_on_grimoire_picked_up"
		},
		{
			"kerillian_shade_passive_improved",
			"kerillian_shade_wider_backstab_angle",
			"kerillian_shade_backstabs_replenishes_ammunition"
		},
		{
			"kerillian_regrowth",
			"kerillian_bloodlust",
			"kerillian_conqueror"
		},
		{
			"kerillian_shade_activated_ability_duration",
			"kerillian_shade_activated_ability_no_break_on_ranged",
			"kerillian_shade_activated_ability_cooldown"
		}
	},
	{
		{
			"kerillian_maidenguard_max_stamina",
			"kerillian_maidenguard_push_arc",
			"kerillian_maidenguard_max_ammo"
		},
		{
			"kerillian_maidenguard_remove_wounded_on_boss_death",
			"kerillian_maidenguard_slower_heavy_hits",
			"kerillian_maidenguard_damage_reduction_on_last_standing"
		},
		{
			"kerillian_maidenguard_movement_speed",
			"kerillian_maidenguard_improved_dodge",
			"kerillian_maidenguard_improved_stamina_regen"
		},
		{
			"kerillian_regrowth",
			"kerillian_bloodlust",
			"kerillian_conqueror"
		},
		{
			"kerillian_maidenguard_activated_ability_invis_duration",
			"kerillian_maidenguard_activated_ability_damage",
			"kerillian_maidenguard_activated_ability_cooldown"
		}
	},
	{
		{
			"kerillian_waywatcher_attack_speed",
			"kerillian_waywatcher_crit_chance",
			"kerillian_waywatcher_stamina_regen"
		},
		{
			"kerillian_waywatcher_gain_ammo_on_boss_death",
			"kerillian_waywatcher_increased_crit_hit_damage_on_high_health",
			"kerillian_waywatcher_headshot_multiplier"
		},
		{
			"kerillian_waywatcher_improved_regen",
			"kerillian_waywatcher_regenerate_ammunition",
			"kerillian_waywatcher_group_regen"
		},
		{
			"kerillian_regrowth",
			"kerillian_bloodlust",
			"kerillian_conqueror"
		},
		{
			"kerillian_waywatcher_activated_ability_cooldown",
			"kerillian_waywatcher_activated_ability_heal",
			"kerillian_waywatcher_activated_ability_restore_ammo"
		}
	}
}
Talents = Talents or {}
Talents.wood_elf = {
	{
		description = "kerillian_shade_dodge_range_desc",
		name = "kerillian_shade_dodge_range",
		num_ranks = 1,
		icon = "kerillian_shade_dodge_range",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.kerillian_shade_dodge_range.multiplier
			}
		},
		requirements = {},
		buffs = {
			"kerillian_shade_dodge_range",
			"kerillian_shade_dodge_speed"
		},
		buff_data = {}
	},
	{
		description = "kerillian_shade_stamina_regen_desc",
		name = "kerillian_shade_stamina_regen",
		num_ranks = 1,
		icon = "kerillian_shade_stamina_regen",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_shade_stamina_regen.multiplier
			}
		},
		requirements = {},
		buffs = {
			"kerillian_shade_stamina_regen"
		},
		buff_data = {}
	},
	{
		description = "kerillian_shade_attack_speed_desc",
		name = "kerillian_shade_attack_speed",
		num_ranks = 1,
		icon = "kerillian_shade_attack_speed",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_shade_attack_speed.multiplier
			}
		},
		requirements = {},
		buffs = {
			"kerillian_shade_attack_speed"
		},
		buff_data = {}
	},
	{
		description = "kerillian_shade_movement_speed_desc",
		name = "kerillian_shade_movement_speed",
		num_ranks = 1,
		icon = "kerillian_shade_movement_speed",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.kerillian_shade_movement_speed.multiplier
			}
		},
		requirements = {},
		buffs = {
			"kerillian_shade_movement_speed"
		},
		buff_data = {}
	},
	{
		description = "kerillian_shade_debuff_defence_on_disabler_desc",
		name = "kerillian_shade_debuff_defence_on_disabler",
		num_ranks = 1,
		buffer = "server",
		icon = "kerillian_shade_debuff_defence_on_disabler",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_shade_defence_debuff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"kerillian_shade_debuff_defence_on_disabler"
		},
		buff_data = {}
	},
	{
		description = "kerillian_shade_increased_damage_on_grimoire_picked_up_desc",
		name = "kerillian_shade_increased_damage_on_grimoire_picked_up",
		num_ranks = 1,
		buffer = "server",
		icon = "kerillian_shade_increased_damage_on_grimoire_picked_up",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_shade_damage_on_grimoire_picked_up.multiplier
			}
		},
		requirements = {},
		buffs = {
			"kerillian_shade_increased_damage_on_grimoire_picked_up"
		},
		buff_data = {}
	},
	{
		description = "kerillian_shade_passive_improved_desc",
		name = "kerillian_shade_passive_improved",
		num_ranks = 1,
		icon = "kerillian_shade_passive_improved",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_shade_passive_improved.multiplier
			}
		},
		requirements = {},
		buffs = {
			"kerillian_shade_passive_improved"
		},
		buff_data = {}
	},
	{
		description = "kerillian_shade_wider_backstab_angle_desc",
		name = "kerillian_shade_wider_backstab_angle",
		num_ranks = 1,
		icon = "kerillian_shade_wider_backstab_angle",
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "kerillian_shade_backstabs_replenishes_ammunition_desc",
		name = "kerillian_shade_backstabs_replenishes_ammunition",
		num_ranks = 1,
		icon = "kerillian_shade_backstabs_replenishes_ammunition",
		description_values = {
			{
				value = buff_tweak_data.kerillian_shade_backstabs_replenishes_ammunition.bonus
			}
		},
		requirements = {},
		buffs = {
			"kerillian_shade_backstabs_replenishes_ammunition"
		},
		buff_data = {}
	},
	{
		description = "regrowth_desc",
		name = "kerillian_regrowth",
		num_ranks = 1,
		buffer = "server",
		icon = "kerillian_shade_regrowth",
		description_values = {},
		requirements = {},
		buffs = {
			"regrowth"
		},
		buff_data = {}
	},
	{
		description = "bloodlust_desc",
		name = "kerillian_bloodlust",
		num_ranks = 1,
		buffer = "server",
		icon = "kerillian_shade_bloodlust",
		description_values = {},
		requirements = {},
		buffs = {
			"bloodlust"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc",
		name = "kerillian_conqueror",
		num_ranks = 1,
		buffer = "server",
		icon = "kerillian_shade_conqueror",
		description_values = {},
		requirements = {},
		buffs = {
			"conqueror"
		},
		buff_data = {}
	},
	{
		description = "kerillian_shade_activated_ability_duration_desc",
		name = "kerillian_shade_activated_ability_duration",
		num_ranks = 1,
		icon = "kerillian_shade_activated_ability_duration",
		description_values = {
			{
				value = buff_tweak_data.kerillian_shade_activated_ability_duration.duration
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "kerillian_shade_activated_ability_no_break_on_ranged_desc",
		name = "kerillian_shade_activated_ability_no_break_on_ranged",
		num_ranks = 1,
		icon = "kerillian_shade_activated_ability_no_break_on_ranged",
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "kerillian_shade_activated_ability_cooldown_desc",
		name = "kerillian_shade_activated_ability_cooldown",
		num_ranks = 1,
		icon = "kerillian_shade_activated_ability_cooldown",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_shade_activated_ability_cooldown.multiplier
			}
		},
		requirements = {},
		buffs = {
			"kerillian_shade_activated_ability_cooldown"
		},
		buff_data = {}
	},
	{
		description = "kerillian_maidenguard_max_stamina_desc",
		name = "kerillian_maidenguard_max_stamina",
		num_ranks = 1,
		icon = "kerillian_maidenguard_max_stamina",
		description_values = {
			{
				value = buff_tweak_data.kerillian_maidenguard_max_stamina.bonus
			}
		},
		requirements = {},
		buffs = {
			"kerillian_maidenguard_max_stamina"
		},
		buff_data = {}
	},
	{
		description = "kerillian_maidenguard_push_arc_desc",
		name = "kerillian_maidenguard_push_arc",
		num_ranks = 1,
		icon = "kerillian_maidenguard_push_arc",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_maidenguard_push_arc.multiplier
			}
		},
		requirements = {},
		buffs = {
			"kerillian_maidenguard_push_arc"
		},
		buff_data = {}
	},
	{
		description = "kerillian_maidenguard_max_ammo_desc",
		name = "kerillian_maidenguard_max_ammo",
		num_ranks = 1,
		icon = "kerillian_maidenguard_max_ammo",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_maidenguard_max_ammo.multiplier
			}
		},
		requirements = {},
		buffs = {
			"kerillian_maidenguard_max_ammo"
		},
		buff_data = {}
	},
	{
		description = "kerillian_maidenguard_remove_wounded_on_boss_death_desc",
		name = "kerillian_maidenguard_remove_wounded_on_boss_death",
		buffer = "server",
		num_ranks = 1,
		icon = "kerillian_maidenguard_remove_wounded_on_boss_death",
		requirements = {},
		buffs = {
			"kerillian_maidenguard_remove_wounded_on_boss_death"
		},
		buff_data = {}
	},
	{
		description = "kerillian_maidenguard_slower_heavy_hits_desc",
		name = "kerillian_maidenguard_slower_heavy_hits",
		num_ranks = 1,
		icon = "kerillian_maidenguard_slower_heavy_hits",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_maidenguard_heavy_hits.multiplier
			},
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_maidenguard_slower_hits.multiplier
			}
		},
		requirements = {},
		buffs = {
			"kerillian_maidenguard_heavy_hits",
			"kerillian_maidenguard_slower_hits"
		},
		buff_data = {}
	},
	{
		description = "kerillian_maidenguard_damage_reduction_on_last_standing_desc",
		name = "kerillian_maidenguard_damage_reduction_on_last_standing",
		num_ranks = 1,
		buffer = "server",
		icon = "kerillian_maidenguard_damage_reduction_on_last_standing",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_maidenguard_defence_on_last_standing.multiplier
			}
		},
		requirements = {},
		buffs = {
			"kerillian_maidenguard_damage_reduction_on_last_standing"
		},
		buff_data = {}
	},
	{
		description = "kerillian_maidenguard_movement_speed_desc",
		name = "kerillian_maidenguard_movement_speed",
		num_ranks = 1,
		icon = "kerillian_maidenguard_movement_speed",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.kerillian_maidenguard_movement_speed.multiplier
			}
		},
		requirements = {},
		buffs = {
			"kerillian_maidenguard_movement_speed"
		},
		buff_data = {}
	},
	{
		description = "kerillian_maidenguard_improved_dodge_desc",
		name = "kerillian_maidenguard_improved_dodge",
		num_ranks = 1,
		icon = "kerillian_maidenguard_improved_dodge",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.kerillian_maidenguard_improved_dodge.multiplier
			}
		},
		requirements = {},
		buffs = {
			"kerillian_maidenguard_improved_dodge",
			"kerillian_maidenguard_improved_dodge_speed"
		},
		buff_data = {}
	},
	{
		description = "kerillian_maidenguard_improved_stamina_regen_desc",
		name = "kerillian_maidenguard_improved_stamina_regen",
		num_ranks = 1,
		icon = "kerillian_maidenguard_improved_stamina_regen",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_maidenguard_improved_stamina_regen.multiplier
			}
		},
		requirements = {},
		buffs = {
			"kerillian_maidenguard_improved_stamina_regen"
		},
		buff_data = {}
	},
	{
		description = "kerillian_maidenguard_activated_ability_cooldown_desc",
		name = "kerillian_maidenguard_activated_ability_cooldown",
		num_ranks = 1,
		icon = "kerillian_maidenguard_activated_ability_cooldown",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_maidenguard_activated_ability_cooldown.multiplier
			}
		},
		requirements = {},
		buffs = {
			"kerillian_maidenguard_activated_ability_cooldown"
		},
		buff_data = {}
	},
	{
		description = "kerillian_maidenguard_activated_ability_invis_duration_desc",
		name = "kerillian_maidenguard_activated_ability_invis_duration",
		num_ranks = 1,
		icon = "kerillian_maidenguard_activated_ability_invis_duration",
		description_values = {
			{
				value = buff_tweak_data.kerillian_maidenguard_activated_ability_invis_duration.duration
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "kerillian_maidenguard_activated_ability_damage_desc",
		name = "kerillian_maidenguard_activated_ability_damage",
		num_ranks = 1,
		icon = "kerillian_maidenguard_activated_ability_damage",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_maidenguard_activated_ability_damage.multiplier
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "kerillian_waywatcher_crit_chance_desc",
		name = "kerillian_waywatcher_crit_chance",
		num_ranks = 1,
		icon = "kerillian_waywatcher_crit_chance",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_waywatcher_crit_chance.bonus
			}
		},
		requirements = {},
		buffs = {
			"kerillian_waywatcher_crit_chance"
		},
		buff_data = {}
	},
	{
		description = "kerillian_waywatcher_stamina_regen_desc",
		name = "kerillian_waywatcher_stamina_regen",
		num_ranks = 1,
		icon = "kerillian_waywatcher_stamina_regen",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_waywatcher_stamina_regen.multiplier
			}
		},
		requirements = {},
		buffs = {
			"kerillian_waywatcher_stamina_regen"
		},
		buff_data = {}
	},
	{
		description = "kerillian_waywatcher_attack_speed_desc",
		name = "kerillian_waywatcher_attack_speed",
		num_ranks = 1,
		icon = "kerillian_waywatcher_attack_speed",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_waywatcher_attack_speed.multiplier
			}
		},
		requirements = {},
		buffs = {
			"kerillian_waywatcher_attack_speed"
		},
		buff_data = {}
	},
	{
		description = "kerillian_waywatcher_gain_ammo_on_boss_death_desc",
		name = "kerillian_waywatcher_gain_ammo_on_boss_death",
		num_ranks = 1,
		buffer = "server",
		icon = "kerillian_waywatcher_gain_ammo_on_boss_death",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_waywatcher_gain_ammo_on_boss_death.ammo_bonus_fraction
			}
		},
		requirements = {},
		buffs = {
			"kerillian_waywatcher_gain_ammo_on_boss_death"
		},
		buff_data = {}
	},
	{
		description = "kerillian_waywatcher_increased_crit_hit_damage_on_high_health_desc",
		name = "kerillian_waywatcher_increased_crit_hit_damage_on_high_health",
		num_ranks = 1,
		buffer = "server",
		icon = "kerillian_waywatcher_increased_crit_hit_damage_on_high_health",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_waywatcher_increased_crit_hit_damage_on_high_health.activation_health
			},
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_waywatcher_crit_hit_damage_on_high_health.multiplier
			}
		},
		requirements = {},
		buffs = {
			"kerillian_waywatcher_increased_crit_hit_damage_on_high_health"
		},
		buff_data = {}
	},
	{
		description = "kerillian_waywatcher_headshot_multiplier_desc",
		name = "kerillian_waywatcher_headshot_multiplier",
		num_ranks = 1,
		buffer = "server",
		icon = "kerillian_waywatcher_headshot_multiplier",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_waywatcher_headshot_multiplier.multiplier
			}
		},
		requirements = {},
		buffs = {
			"kerillian_waywatcher_headshot_multiplier"
		},
		buff_data = {}
	},
	{
		description = "kerillian_waywatcher_improved_regen_desc",
		name = "kerillian_waywatcher_improved_regen",
		num_ranks = 1,
		icon = "kerillian_waywatcher_improved_regen",
		description_values = {
			{
				value = buff_tweak_data.kerillian_waywatcher_improved_regen.bonus
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "kerillian_waywatcher_regenerate_ammunition_desc",
		name = "kerillian_waywatcher_regenerate_ammunition",
		num_ranks = 1,
		icon = "kerillian_waywatcher_regenerate_ammunition",
		description_values = {
			{
				value = buff_tweak_data.kerillian_waywatcher_regenerate_ammunition.bonus
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "kerillian_waywatcher_group_regen_desc",
		name = "kerillian_waywatcher_group_regen",
		num_ranks = 1,
		icon = "kerillian_waywatcher_group_regen",
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "kerillian_waywatcher_activated_ability_cooldown_desc",
		name = "kerillian_waywatcher_activated_ability_cooldown",
		num_ranks = 1,
		icon = "kerillian_waywatcher_activated_ability_cooldown",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_waywatcher_activated_ability_cooldown.multiplier
			}
		},
		requirements = {},
		buffs = {
			"kerillian_waywatcher_activated_ability_cooldown"
		},
		buff_data = {}
	},
	{
		description = "kerillian_waywatcher_activated_ability_heal_desc",
		name = "kerillian_waywatcher_activated_ability_heal",
		num_ranks = 1,
		icon = "kerillian_waywatcher_activated_ability_heal",
		description_values = {
			{
				value = buff_tweak_data.kerillian_waywatcher_activated_ability_heal.bonus
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "kerillian_waywatcher_activated_ability_restore_ammo_desc",
		name = "kerillian_waywatcher_activated_ability_restore_ammo",
		num_ranks = 1,
		icon = "kerillian_waywatcher_activated_ability_restore_ammo",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_waywatcher_activated_ability_restore_ammo.multiplier
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	}
}

for name, data in pairs(TalentBuffTemplates.wood_elf) do
	local buffs = data.buffs

	fassert(#buffs == 1, "talent buff has more than one sub buff, add multiple buffs from the talent instead")

	local buff = buffs[1]
	buff.name = name
end

BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.wood_elf, buff_tweak_data)

return 
