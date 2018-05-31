local buff_tweak_data = {
	sienna_scholar_ability_cooldown_on_hit = {
		bonus = 0.25
	},
	sienna_scholar_ability_cooldown_on_damage_taken = {
		bonus = 0.3
	},
	sienna_scholar_passive = {
		chunk_size = 8
	},
	sienna_scholar_passive_crit_chance = {
		max_stacks = 5,
		bonus = 0.06
	},
	sienna_scholar_passive_ranged_damage = {
		multiplier = 0.1
	},
	sienna_scholar_reduced_overcharge = {
		multiplier = -0.1
	},
	sienna_scholar_increased_attack_speed = {
		multiplier = 0.05
	},
	sienna_scholar_reduced_spread = {
		multiplier = -0.25
	},
	sienna_scholar_defence_on_disabled = {
		multiplier = -0.5
	},
	sienna_scholar_overcharge_regen_on_grimoire_pickup_buff = {
		multiplier = 1
	},
	sienna_scholar_increased_ranged_charge_speed_on_low_health = {
		activation_health = 0.5
	},
	sienna_scholar_ranged_charge_speed_on_low_health = {
		multiplier = -0.25
	},
	sienna_scholar_passive_reduced_block_cost_from_overcharge = {
		chunk_size = 8
	},
	sienna_scholar_passive_reduced_block_cost = {
		max_stacks = 5,
		multiplier = -0.1
	},
	sienna_scholar_passive_reduced_overcharge_from_overcharge = {
		chunk_size = 8
	},
	sienna_scholar_passive_reduced_overcharge = {
		max_stacks = 5,
		multiplier = -0.05
	},
	sienna_scholar_passive_increased_attack_speed_from_overcharge = {
		chunk_size = 8
	},
	sienna_scholar_passive_increased_attack_speed = {
		max_stacks = 5,
		multiplier = 0.02
	},
	sienna_scholar_activated_ability_cooldown = {
		multiplier = -0.3
	},
	sienna_scholar_activated_ability_heal = {
		bonus = 20
	},
	sienna_adept_ability_cooldown_on_hit = {
		bonus = 0.25
	},
	sienna_adept_ability_cooldown_on_damage_taken = {
		bonus = 0.5
	},
	sienna_adept_passive = {
		duration = 8
	},
	sienna_adept_passive_ranged_damage = {
		multiplier = 0.1
	},
	sienna_adept_passive_overcharge_charge_speed_increased = {
		chunk_size = 8
	},
	sienna_adept_passive_overcharge_charge_speed_increased_buff = {
		multiplier = -0.1
	},
	tranquility = {
		multiplier = 2
	},
	sienna_adept_activated_ability = {
		duration = 0.4
	},
	sienna_adept_charge_speed_increase = {
		multiplier = -0.15
	},
	sienna_adept_healing_received = {
		multiplier = 0.3
	},
	sienna_adept_max_stamina = {
		bonus = 2
	},
	sienna_adept_increased_damage_on_enemy_proximity = {
		chunk_size = 1,
		range = 3
	},
	sienna_adept_damage_on_enemy_proximity = {
		max_stacks = 5,
		multiplier = 0.05
	},
	sienna_adept_stun_resistance = {
		multiplier = -0.35
	},
	sienna_adept_defence_on_last_standing = {
		multiplier = -0.5
	},
	sienna_adept_decreased_block_cost = {
		multiplier = -0.4
	},
	sienna_adept_improved_tranquility = {
		multiplier = 1
	},
	sienna_adept_passive_charge_speed_increased_buff = {
		multiplier = -0.4
	},
	sienna_adept_activated_ability_cooldown = {
		multiplier = -0.3
	},
	sienna_adept_ability_trail_increased_duration = {
		duration = 10
	},
	sienna_unchained_ability_cooldown_on_hit = {
		bonus = 0.25
	},
	sienna_unchained_ability_cooldown_on_damage_taken = {
		bonus = 0.5
	},
	sienna_unchained_passive = {
		multiplier = -0.5
	},
	sienna_unchained_passive_increased_melee_power_on_overcharge = {
		chunk_size = 8
	},
	sienna_unchained_passive_melee_power_on_overcharge = {
		max_stacks = 5,
		multiplier = 0.12
	},
	sienna_unchained_activated_ability = {
		duration = 2
	},
	sienna_unchained_push_arc = {
		multiplier = 0.5
	},
	sienna_unchained_max_health = {
		multiplier = 0.2
	},
	sienna_unchained_max_overcharge = {
		multiplier = 0.25
	},
	sienna_unchained_stamina_regen = {
		duration = 2,
		multiplier = 0.4
	},
	sienna_unchained_block_cost_on_last_standing = {
		multiplier = -0.5
	},
	sienna_unchained_defence_buff = {
		duration = 10,
		multiplier = -0.5
	},
	sienna_unchained_reduced_vent_damage = {
		multiplier = -0.5
	},
	sienna_unchained_increased_vent_speed = {
		multiplier = 0.5
	},
	sienna_unchained_reduced_overcharge = {
		multiplier = -0.15
	},
	sienna_unchained_activated_ability_cooldown = {
		multiplier = -0.3
	},
	sienna_unchained_activated_ability_damage = {
		multiplier = 0.5
	},
	sienna_unchained_activated_ability_radius = {
		multiplier = 0.5
	}
}
TalentBuffTemplates = TalentBuffTemplates or {}
TalentBuffTemplates.bright_wizard = {
	sienna_scholar_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown
			}
		}
	},
	sienna_scholar_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown_on_damage_taken
			}
		}
	},
	sienna_scholar_passive = {
		buffs = {
			{
				buff_to_add = "sienna_scholar_passive_crit_chance",
				update_func = "activate_buff_stacks_based_on_overcharge_chunks"
			}
		}
	},
	sienna_scholar_passive_crit_chance = {
		buffs = {
			{
				max_stacks = 10,
				icon = "sienna_scholar_passive",
				stat_buff = StatBuffIndex.CRITICAL_STRIKE_CHANCE
			}
		}
	},
	sienna_scholar_passive_ranged_damage = {
		buffs = {
			{
				stat_buff = StatBuffIndex.INCREASED_WEAPON_DAMAGE_RANGED
			}
		}
	},
	sienna_scholar_reduced_overcharge = {
		buffs = {
			{
				stat_buff = StatBuffIndex.REDUCED_OVERCHARGE
			}
		}
	},
	sienna_scholar_increased_attack_speed = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	sienna_scholar_reduced_spread = {
		buffs = {
			{
				stat_buff = StatBuffIndex.REDUCED_SPREAD
			}
		}
	},
	sienna_scholar_increased_defence_on_disabled = {
		buffs = {
			{
				buff_to_add = "sienna_scholar_defence_on_disabled",
				update_func = "activate_buff_on_disabled"
			}
		}
	},
	sienna_scholar_defence_on_disabled = {
		buffs = {
			{
				max_stacks = 1,
				icon = "sienna_scholar_increased_defence_on_disabled",
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	sienna_scholar_overcharge_regen_on_grimoire_pickup = {
		buffs = {
			{
				buff_to_add = "sienna_scholar_overcharge_regen_on_grimoire_pickup_buff",
				update_func = "activate_buff_on_grimoire_picked_up"
			}
		}
	},
	sienna_scholar_overcharge_regen_on_grimoire_pickup_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "sienna_scholar_overcharge_regen_on_grimoire_pickup",
				stat_buff = StatBuffIndex.OVERCHARGE_REGEN
			}
		}
	},
	sienna_scholar_increased_ranged_charge_speed_on_low_health = {
		buffs = {
			{
				buff_to_add = "sienna_scholar_ranged_charge_speed_on_low_health",
				activate_below = true,
				update_func = "activate_buff_on_health_percent"
			}
		}
	},
	sienna_scholar_ranged_charge_speed_on_low_health = {
		buffs = {
			{
				max_stacks = 1,
				icon = "sienna_scholar_increased_ranged_charge_speed_on_low_health",
				priority_buff = true,
				stat_buff = StatBuffIndex.REDUCED_RANGED_CHARGE_TIME
			}
		}
	},
	sienna_scholar_passive_reduced_block_cost_from_overcharge = {
		buffs = {
			{
				buff_to_add = "sienna_scholar_passive_reduced_block_cost",
				update_func = "activate_buff_stacks_based_on_overcharge_chunks"
			}
		}
	},
	sienna_scholar_passive_reduced_block_cost = {
		buffs = {
			{
				icon = "sienna_scholar_passive_reduced_block_cost_from_overcharge",
				stat_buff = StatBuffIndex.BLOCK_COST
			}
		}
	},
	sienna_scholar_passive_reduced_overcharge_from_overcharge = {
		buffs = {
			{
				buff_to_add = "sienna_scholar_passive_reduced_overcharge",
				update_func = "activate_buff_stacks_based_on_overcharge_chunks"
			}
		}
	},
	sienna_scholar_passive_reduced_overcharge = {
		buffs = {
			{
				icon = "sienna_scholar_passive_reduced_overcharge_from_overcharge",
				stat_buff = StatBuffIndex.REDUCED_OVERCHARGE
			}
		}
	},
	sienna_scholar_passive_increased_attack_speed_from_overcharge = {
		buffs = {
			{
				buff_to_add = "sienna_scholar_passive_increased_attack_speed",
				update_func = "activate_buff_stacks_based_on_overcharge_chunks"
			}
		}
	},
	sienna_scholar_passive_increased_attack_speed = {
		buffs = {
			{
				icon = "sienna_scholar_passive_increased_attack_speed_from_overcharge",
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	sienna_scholar_activated_ability_cooldown = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ACTIVATED_COOLDOWN
			}
		}
	},
	sienna_adept_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown
			}
		}
	},
	sienna_adept_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown_on_damage_taken
			}
		}
	},
	sienna_adept_passive = {
		buffs = {
			{
				buff_after_delay = true,
				refresh_durations = true,
				is_cooldown = true,
				max_stacks = 1,
				icon = "sienna_adept_passive",
				dormant = true,
				delayed_buff_name = "tranquility"
			}
		}
	},
	sienna_adept_passive_ranged_damage = {
		buffs = {
			{
				stat_buff = StatBuffIndex.INCREASED_WEAPON_DAMAGE_RANGED
			}
		}
	},
	sienna_adept_passive_overcharge_charge_speed_increased = {
		buffs = {
			{
				buff_to_add = "sienna_adept_passive_overcharge_charge_speed_increased_buff",
				update_func = "activate_buff_stacks_based_on_overcharge_chunks"
			}
		}
	},
	sienna_adept_passive_overcharge_charge_speed_increased_buff = {
		buffs = {
			{
				max_stacks = 3,
				icon = "sienna_scholar_activated_ability_dump_overcharge",
				stat_buff = StatBuffIndex.REDUCED_RANGED_CHARGE_TIME
			}
		}
	},
	sienna_adept_passive_reset_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = ProcFunctions.reset_tranquility
			}
		}
	},
	sienna_adept_passive_reset_on_spell_used = {
		buffs = {
			{
				event = "on_spell_used",
				event_buff = true,
				buff_func = ProcFunctions.reset_tranquility
			}
		}
	},
	tranquility = {
		buffs = {
			{
				dormant = true,
				max_stacks = 1,
				icon = "sienna_adept_passive",
				priority_buff = true,
				stat_buff = StatBuffIndex.OVERCHARGE_REGEN
			}
		}
	},
	sienna_adept_activated_ability = {
		buffs = {
			{
				apply_buff_func = "enter_sienna_adept_activated_ability",
				remove_buff_func = "end_sienna_adept_activated_ability"
			}
		}
	},
	sienna_adept_charge_speed_increase = {
		buffs = {
			{
				stat_buff = StatBuffIndex.REDUCED_RANGED_CHARGE_TIME
			}
		}
	},
	sienna_adept_healing_received = {
		buffs = {
			{
				stat_buff = StatBuffIndex.HEALING_RECEIVED
			}
		}
	},
	sienna_adept_max_stamina = {
		buffs = {
			{
				stat_buff = StatBuffIndex.MAX_FATIGUE
			}
		}
	},
	sienna_adept_increased_damage_on_enemy_proximity = {
		buffs = {
			{
				buff_to_add = "sienna_adept_damage_on_enemy_proximity",
				update_func = "activate_buff_stacks_based_on_enemy_proximity"
			}
		}
	},
	sienna_adept_damage_on_enemy_proximity = {
		buffs = {
			{
				icon = "sienna_adept_increased_damage_on_enemy_proximity",
				stat_buff = StatBuffIndex.POWER_LEVEL
			}
		}
	},
	sienna_adept_stun_resistance = {
		buffs = {
			{
				stat_buff = StatBuffIndex.STUN_DURATION
			}
		}
	},
	sienna_adept_increased_defence_on_last_standing = {
		buffs = {
			{
				buff_to_add = "sienna_adept_defence_on_last_standing",
				update_func = "activate_buff_on_last_standing"
			}
		}
	},
	sienna_adept_defence_on_last_standing = {
		buffs = {
			{
				max_stacks = 1,
				icon = "sienna_adept_increased_defence_on_last_standing",
				priority_buff = true,
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	sienna_adept_passive_decreased_block_cost = {
		buffs = {
			{
				buff_to_add = "sienna_adept_decreased_block_cost",
				activation_buff = "tranquility",
				update_func = "activate_buff_on_other_buff"
			}
		}
	},
	sienna_adept_decreased_block_cost = {
		buffs = {
			{
				max_stacks = 1,
				icon = "sienna_adept_passive_decreased_block_cost",
				dormant = true,
				stat_buff = StatBuffIndex.BLOCK_COST
			}
		}
	},
	sienna_adept_passive_improved = {
		buffs = {
			{
				buff_to_add = "sienna_adept_improved_tranquility",
				activation_buff = "tranquility",
				update_func = "activate_buff_on_other_buff"
			}
		}
	},
	sienna_adept_improved_tranquility = {
		buffs = {
			{
				max_stacks = 1,
				dormant = true,
				stat_buff = StatBuffIndex.OVERCHARGE_REGEN
			}
		}
	},
	sienna_adept_passive_charge_speed_increased = {
		buffs = {
			{
				buff_to_add = "sienna_adept_passive_charge_speed_increased_buff",
				activation_buff = "tranquility",
				update_func = "activate_buff_on_other_buff"
			}
		}
	},
	sienna_adept_passive_charge_speed_increased_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "sienna_adept_passive_charge_speed_increased",
				dormant = true,
				stat_buff = StatBuffIndex.REDUCED_RANGED_CHARGE_TIME
			}
		}
	},
	sienna_adept_activated_ability_cooldown = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ACTIVATED_COOLDOWN
			}
		}
	},
	sienna_unchained_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown
			}
		}
	},
	sienna_unchained_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown_on_damage_taken
			}
		}
	},
	sienna_unchained_passive = {
		buffs = {
			{
				stat_buff = StatBuffIndex.DAMAGE_TAKEN_TO_OVERCHARGE
			}
		}
	},
	sienna_unchained_passive_overcharged_blocks = {
		buffs = {
			{
				perk = "overcharged_block"
			}
		}
	},
	sienna_unchained_passive_increased_melee_power_on_overcharge = {
		buffs = {
			{
				buff_to_add = "sienna_unchained_passive_melee_power_on_overcharge",
				update_func = "activate_buff_stacks_based_on_overcharge_chunks"
			}
		}
	},
	sienna_unchained_passive_melee_power_on_overcharge = {
		buffs = {
			{
				icon = "sienna_unchained_passive",
				stat_buff = StatBuffIndex.POWER_LEVEL_MELEE
			}
		}
	},
	sienna_unchained_activated_ability = {
		buffs = {
			{
				apply_buff_func = "enter_sienna_unchained_activated_ability",
				remove_buff_func = "end_sienna_unchained_activated_ability"
			}
		}
	},
	sienna_unchained_push_arc = {
		buffs = {
			{
				stat_buff = StatBuffIndex.BLOCK_ANGLE
			}
		}
	},
	sienna_unchained_max_health = {
		buffs = {
			{
				stat_buff = StatBuffIndex.MAX_HEALTH_ALIVE
			}
		}
	},
	sienna_unchained_max_overcharge = {
		buffs = {
			{
				stat_buff = StatBuffIndex.MAX_OVERCHARGE
			}
		}
	},
	sienna_unchained_regen_stamina_on_charged_attacks = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.sienna_unchained_regen_stamina_on_charged_attacks
			}
		}
	},
	sienna_unchained_stamina_regen = {
		buffs = {
			{
				max_stacks = 1,
				refresh_durations = true,
				is_cooldown = true,
				icon = "sienna_unchained_regen_stamina_on_charged_attacks",
				dormant = true,
				stat_buff = StatBuffIndex.FATIGUE_REGEN
			}
		}
	},
	sienna_unchained_remove_wounded_on_boss_death = {
		buffs = {
			{
				event = "on_boss_killed",
				event_buff = true,
				buff_func = ProcFunctions.remove_wounded
			}
		}
	},
	sienna_unchained_buff_defense_on_revived_target = {
		buffs = {
			{
				event = "on_revived_ally",
				buff_to_add = "sienna_unchained_defence_buff",
				event_buff = true,
				buff_func = ProcFunctions.buff_defence_on_revived_target
			}
		}
	},
	sienna_unchained_defence_buff = {
		buffs = {
			{
				priority_buff = true,
				refresh_durations = true,
				max_stacks = 1,
				icon = "sienna_unchained_buff_defense_on_revived_target",
				dormant = true,
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	sienna_unchained_reduced_vent_damage = {
		buffs = {
			{
				stat_buff = StatBuffIndex.VENT_DAMAGE
			}
		}
	},
	sienna_unchained_increased_vent_speed = {
		buffs = {
			{
				stat_buff = StatBuffIndex.VENT_SPEED
			}
		}
	},
	sienna_unchained_reduced_overcharge = {
		buffs = {
			{
				stat_buff = StatBuffIndex.REDUCED_OVERCHARGE
			}
		}
	},
	sienna_unchained_heal_on_boss_death = {
		buffs = {
			{
				event = "on_boss_killed",
				event_buff = true,
				buff_func = ProcFunctions.heal
			}
		}
	},
	sienna_unchained_max_stamina = {
		buffs = {
			{
				stat_buff = StatBuffIndex.MAX_FATIGUE
			}
		}
	},
	sienna_unchained_activated_ability_cooldown = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ACTIVATED_COOLDOWN
			}
		}
	}
}
TalentTrees = TalentTrees or {}
TalentTrees.bright_wizard = {
	{
		{
			"sienna_scholar_reduced_spread",
			"sienna_scholar_increased_attack_speed",
			"sienna_scholar_reduced_overcharge"
		},
		{
			"sienna_scholar_increased_defence_on_disabled",
			"sienna_scholar_overcharge_regen_on_grimoire_pickup",
			"sienna_scholar_increased_ranged_charge_speed_on_low_health"
		},
		{
			"sienna_scholar_passive_reduced_block_cost_from_overcharge",
			"sienna_scholar_passive_reduced_overcharge_from_overcharge",
			"sienna_scholar_passive_increased_attack_speed_from_overcharge"
		},
		{
			"sienna_scholar_regrowth",
			"sienna_scholar_bloodlust",
			"sienna_scholar_conqueror"
		},
		{
			"sienna_scholar_activated_ability_dump_overcharge",
			"sienna_scholar_activated_ability_heal",
			"sienna_scholar_activated_ability_cooldown"
		}
	},
	{
		{
			"sienna_adept_healing_received",
			"sienna_adept_max_stamina",
			"sienna_adept_charge_speed_increase"
		},
		{
			"sienna_adept_increased_damage_on_enemy_proximity",
			"sienna_adept_increased_defence_on_last_standing",
			"sienna_adept_stun_resistance"
		},
		{
			"sienna_adept_passive_decreased_block_cost",
			"sienna_adept_passive_charge_speed_increased",
			"sienna_adept_passive_improved"
		},
		{
			"sienna_adept_regrowth",
			"sienna_adept_bloodlust",
			"sienna_adept_conqueror"
		},
		{
			"sienna_adept_activated_ability_cooldown",
			"sienna_adept_ability_trail_increased_duration",
			"sienna_adept_activated_ability_dump_overcharge"
		}
	},
	{
		{
			"sienna_unchained_push_arc",
			"sienna_unchained_max_overcharge",
			"sienna_unchained_max_health"
		},
		{
			"sienna_unchained_regen_stamina_on_charged_attacks",
			"sienna_unchained_remove_wounded_on_boss_death",
			"sienna_unchained_buff_defense_on_revived_target"
		},
		{
			"sienna_unchained_reduced_vent_damage",
			"sienna_unchained_increased_vent_speed",
			"sienna_unchained_reduced_overcharge"
		},
		{
			"sienna_unchained_regrowth",
			"sienna_unchained_bloodlust",
			"sienna_unchained_conqueror"
		},
		{
			"sienna_unchained_activated_ability_radius",
			"sienna_unchained_activated_ability_damage",
			"sienna_unchained_activated_ability_cooldown"
		}
	}
}
Talents = Talents or {}
Talents.bright_wizard = {
	{
		description = "sienna_scholar_reduced_overcharge_desc",
		name = "sienna_scholar_reduced_overcharge",
		num_ranks = 1,
		icon = "sienna_scholar_reduced_overcharge",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_scholar_reduced_overcharge.multiplier
			}
		},
		requirements = {},
		buffs = {
			"sienna_scholar_reduced_overcharge"
		},
		buff_data = {}
	},
	{
		description = "sienna_scholar_increased_attack_speed_desc",
		name = "sienna_scholar_increased_attack_speed",
		num_ranks = 1,
		icon = "sienna_scholar_increased_attack_speed",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_scholar_increased_attack_speed.multiplier
			}
		},
		requirements = {},
		buffs = {
			"sienna_scholar_increased_attack_speed"
		},
		buff_data = {}
	},
	{
		description = "sienna_scholar_reduced_spread_desc",
		name = "sienna_scholar_reduced_spread",
		num_ranks = 1,
		icon = "sienna_scholar_reduced_spread",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_scholar_reduced_spread.multiplier
			}
		},
		requirements = {},
		buffs = {
			"sienna_scholar_reduced_spread"
		},
		buff_data = {}
	},
	{
		description = "sienna_scholar_overcharge_regen_on_grimoire_pickup_desc",
		name = "sienna_scholar_overcharge_regen_on_grimoire_pickup",
		num_ranks = 1,
		icon = "sienna_scholar_overcharge_regen_on_grimoire_pickup",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_scholar_overcharge_regen_on_grimoire_pickup_buff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"sienna_scholar_overcharge_regen_on_grimoire_pickup"
		},
		buff_data = {}
	},
	{
		description = "sienna_scholar_increased_ranged_charge_speed_on_low_health_desc",
		name = "sienna_scholar_increased_ranged_charge_speed_on_low_health",
		num_ranks = 1,
		icon = "sienna_scholar_increased_ranged_charge_speed_on_low_health",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_scholar_ranged_charge_speed_on_low_health.multiplier
			},
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_scholar_increased_ranged_charge_speed_on_low_health.activation_health
			}
		},
		requirements = {},
		buffs = {
			"sienna_scholar_increased_ranged_charge_speed_on_low_health"
		},
		buff_data = {}
	},
	{
		description = "sienna_scholar_increased_defence_on_disabled_desc",
		name = "sienna_scholar_increased_defence_on_disabled",
		num_ranks = 1,
		buffer = "server",
		icon = "sienna_scholar_increased_defence_on_disabled",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_scholar_defence_on_disabled.multiplier
			}
		},
		requirements = {},
		buffs = {
			"sienna_scholar_increased_defence_on_disabled"
		},
		buff_data = {}
	},
	{
		description = "sienna_scholar_passive_reduced_block_cost_from_overcharge_desc",
		name = "sienna_scholar_passive_reduced_block_cost_from_overcharge",
		num_ranks = 1,
		icon = "sienna_scholar_passive_reduced_block_cost_from_overcharge",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_scholar_passive_reduced_block_cost.multiplier
			},
			{
				value = buff_tweak_data.sienna_scholar_passive_reduced_block_cost_from_overcharge.chunk_size
			},
			{
				value = buff_tweak_data.sienna_scholar_passive_reduced_block_cost.max_stacks
			}
		},
		requirements = {},
		buffs = {
			"sienna_scholar_passive_reduced_block_cost_from_overcharge"
		},
		buff_data = {}
	},
	{
		description = "sienna_scholar_passive_reduced_overcharge_from_overcharge_desc",
		name = "sienna_scholar_passive_reduced_overcharge_from_overcharge",
		num_ranks = 1,
		icon = "sienna_scholar_passive_reduced_overcharge_from_overcharge",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_scholar_passive_reduced_overcharge.multiplier
			},
			{
				value = buff_tweak_data.sienna_scholar_passive_reduced_overcharge_from_overcharge.chunk_size
			},
			{
				value = buff_tweak_data.sienna_scholar_passive_reduced_overcharge.max_stacks
			}
		},
		requirements = {},
		buffs = {
			"sienna_scholar_passive_reduced_overcharge_from_overcharge"
		},
		buff_data = {}
	},
	{
		description = "sienna_scholar_passive_increased_attack_speed_from_overcharge_desc",
		name = "sienna_scholar_passive_increased_attack_speed_from_overcharge",
		num_ranks = 1,
		icon = "sienna_scholar_passive_increased_attack_speed_from_overcharge",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_scholar_passive_increased_attack_speed.multiplier
			},
			{
				value = buff_tweak_data.sienna_scholar_passive_increased_attack_speed_from_overcharge.chunk_size
			},
			{
				value = buff_tweak_data.sienna_scholar_passive_increased_attack_speed.max_stacks
			}
		},
		requirements = {},
		buffs = {
			"sienna_scholar_passive_increased_attack_speed_from_overcharge"
		},
		buff_data = {}
	},
	{
		description = "regrowth_desc",
		name = "sienna_scholar_regrowth",
		num_ranks = 1,
		buffer = "server",
		icon = "sienna_scholar_regrowth",
		description_values = {},
		requirements = {},
		buffs = {
			"regrowth"
		},
		buff_data = {}
	},
	{
		description = "bloodlust_desc",
		name = "sienna_scholar_bloodlust",
		num_ranks = 1,
		buffer = "server",
		icon = "sienna_scholar_bloodlust",
		description_values = {},
		requirements = {},
		buffs = {
			"bloodlust"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc",
		name = "sienna_scholar_conqueror",
		num_ranks = 1,
		buffer = "server",
		icon = "sienna_scholar_conqueror",
		description_values = {},
		requirements = {},
		buffs = {
			"conqueror"
		},
		buff_data = {}
	},
	{
		description = "sienna_scholar_activated_ability_cooldown_desc",
		name = "sienna_scholar_activated_ability_cooldown",
		num_ranks = 1,
		icon = "sienna_scholar_activated_ability_cooldown",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_scholar_activated_ability_cooldown.multiplier
			}
		},
		requirements = {},
		buffs = {
			"sienna_scholar_activated_ability_cooldown"
		},
		buff_data = {}
	},
	{
		description = "sienna_scholar_activated_ability_dump_overcharge_desc",
		name = "sienna_scholar_activated_ability_dump_overcharge",
		num_ranks = 1,
		icon = "sienna_scholar_activated_ability_dump_overcharge",
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "sienna_scholar_activated_ability_heal_desc",
		name = "sienna_scholar_activated_ability_heal",
		num_ranks = 1,
		icon = "sienna_scholar_activated_ability_heal",
		description_values = {
			{
				value = buff_tweak_data.sienna_scholar_activated_ability_heal.bonus
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "sienna_adept_healing_received_desc",
		name = "sienna_adept_healing_received",
		num_ranks = 1,
		buffer = "server",
		icon = "sienna_adept_healing_received",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_adept_healing_received.multiplier
			}
		},
		requirements = {},
		buffs = {
			"sienna_adept_healing_received"
		},
		buff_data = {}
	},
	{
		description = "sienna_adept_max_stamina_desc",
		name = "sienna_adept_max_stamina",
		num_ranks = 1,
		icon = "sienna_adept_max_stamina",
		description_values = {
			{
				value = buff_tweak_data.sienna_adept_max_stamina.bonus
			}
		},
		requirements = {},
		buffs = {
			"sienna_adept_max_stamina"
		},
		buff_data = {}
	},
	{
		description = "sienna_adept_charge_speed_increase_desc",
		name = "sienna_adept_charge_speed_increase",
		num_ranks = 1,
		icon = "sienna_adept_charge_speed_increase",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_adept_charge_speed_increase.multiplier
			}
		},
		requirements = {},
		buffs = {
			"sienna_adept_charge_speed_increase"
		},
		buff_data = {}
	},
	{
		description = "sienna_adept_increased_damage_on_enemy_proximity_desc",
		name = "sienna_adept_increased_damage_on_enemy_proximity",
		num_ranks = 1,
		buffer = "both",
		icon = "sienna_adept_increased_damage_on_enemy_proximity",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_adept_damage_on_enemy_proximity.multiplier
			},
			{
				value = buff_tweak_data.sienna_adept_damage_on_enemy_proximity.max_stacks
			}
		},
		requirements = {},
		buffs = {
			"sienna_adept_increased_damage_on_enemy_proximity"
		},
		buff_data = {}
	},
	{
		description = "sienna_adept_stun_resistance_desc",
		name = "sienna_adept_stun_resistance",
		num_ranks = 1,
		icon = "sienna_adept_stun_resistance",
		requirements = {},
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_adept_stun_resistance.multiplier
			}
		},
		buffs = {
			"sienna_adept_stun_resistance"
		},
		buff_data = {}
	},
	{
		description = "sienna_adept_increased_defence_on_last_standing_desc",
		name = "sienna_adept_increased_defence_on_last_standing",
		num_ranks = 1,
		buffer = "server",
		icon = "sienna_adept_increased_defence_on_last_standing",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_adept_defence_on_last_standing.multiplier
			}
		},
		requirements = {},
		buffs = {
			"sienna_adept_increased_defence_on_last_standing"
		},
		buff_data = {}
	},
	{
		description = "sienna_adept_passive_decreased_block_cost_desc",
		name = "sienna_adept_passive_decreased_block_cost",
		num_ranks = 1,
		icon = "sienna_adept_passive_decreased_block_cost",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_adept_decreased_block_cost.multiplier
			}
		},
		requirements = {},
		buffs = {
			"sienna_adept_passive_decreased_block_cost"
		},
		buff_data = {}
	},
	{
		description = "sienna_adept_passive_charge_speed_increased_desc",
		name = "sienna_adept_passive_charge_speed_increased",
		num_ranks = 1,
		icon = "sienna_adept_passive_charge_speed_increased",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_adept_passive_charge_speed_increased_buff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"sienna_adept_passive_charge_speed_increased"
		},
		buff_data = {}
	},
	{
		description = "sienna_adept_passive_improved_desc",
		name = "sienna_adept_passive_improved",
		num_ranks = 1,
		icon = "sienna_adept_passive_improved",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_adept_improved_tranquility.multiplier
			}
		},
		requirements = {},
		buffs = {
			"sienna_adept_passive_improved"
		},
		buff_data = {}
	},
	{
		description = "regrowth_desc",
		name = "sienna_adept_regrowth",
		num_ranks = 1,
		buffer = "server",
		icon = "sienna_adept_regrowth",
		description_values = {},
		requirements = {},
		buffs = {
			"regrowth"
		},
		buff_data = {}
	},
	{
		description = "bloodlust_desc",
		name = "sienna_adept_bloodlust",
		num_ranks = 1,
		buffer = "server",
		icon = "sienna_adept_bloodlust",
		description_values = {},
		requirements = {},
		buffs = {
			"bloodlust"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc",
		name = "sienna_adept_conqueror",
		num_ranks = 1,
		buffer = "server",
		icon = "sienna_adept_conqueror",
		description_values = {},
		requirements = {},
		buffs = {
			"conqueror"
		},
		buff_data = {}
	},
	{
		description = "sienna_adept_activated_ability_cooldown_desc",
		name = "sienna_adept_activated_ability_cooldown",
		num_ranks = 1,
		icon = "sienna_adept_activated_ability_cooldown",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_adept_activated_ability_cooldown.multiplier
			}
		},
		requirements = {},
		buffs = {
			"sienna_adept_activated_ability_cooldown"
		},
		buff_data = {}
	},
	{
		description = "sienna_adept_ability_trail_increased_duration_desc",
		name = "sienna_adept_ability_trail_increased_duration",
		num_ranks = 1,
		icon = "sienna_adept_ability_trail_increased_duration",
		description_values = {
			{
				value = buff_tweak_data.sienna_adept_ability_trail_increased_duration.duration
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "sienna_adept_activated_ability_dump_overcharge_desc",
		name = "sienna_adept_activated_ability_dump_overcharge",
		num_ranks = 1,
		icon = "sienna_adept_activated_ability_dump_overcharge",
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "sienna_unchained_push_arc_desc",
		name = "sienna_unchained_push_arc",
		num_ranks = 1,
		icon = "sienna_unchained_push_arc",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_unchained_push_arc.multiplier
			}
		},
		requirements = {},
		buffs = {
			"sienna_unchained_push_arc"
		},
		buff_data = {}
	},
	{
		description = "sienna_unchained_max_health_desc",
		name = "sienna_unchained_max_health",
		num_ranks = 1,
		icon = "sienna_unchained_max_health",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_unchained_max_health.multiplier
			}
		},
		requirements = {},
		buffs = {
			"sienna_unchained_max_health"
		},
		buff_data = {}
	},
	{
		description = "sienna_unchained_max_overcharge_desc",
		name = "sienna_unchained_max_overcharge",
		num_ranks = 1,
		icon = "sienna_unchained_max_overcharge",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_unchained_max_overcharge.multiplier
			}
		},
		requirements = {},
		buffs = {
			"sienna_unchained_max_overcharge"
		},
		buff_data = {}
	},
	{
		description = "sienna_unchained_buff_defense_on_revived_target_desc",
		name = "sienna_unchained_buff_defense_on_revived_target",
		num_ranks = 1,
		buffer = "server",
		icon = "sienna_unchained_buff_defense_on_revived_target",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_unchained_defence_buff.multiplier
			},
			{
				value = buff_tweak_data.sienna_unchained_defence_buff.duration
			}
		},
		requirements = {},
		buffs = {
			"sienna_unchained_buff_defense_on_revived_target"
		},
		buff_data = {}
	},
	{
		description = "sienna_unchained_regen_stamina_on_charged_attacks_desc",
		name = "sienna_unchained_regen_stamina_on_charged_attacks",
		num_ranks = 1,
		icon = "sienna_unchained_regen_stamina_on_charged_attacks",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_unchained_stamina_regen.multiplier
			},
			{
				value = buff_tweak_data.sienna_unchained_stamina_regen.duration
			}
		},
		requirements = {},
		buffs = {
			"sienna_unchained_regen_stamina_on_charged_attacks"
		},
		buff_data = {}
	},
	{
		description = "sienna_unchained_remove_wounded_on_boss_death_desc",
		name = "sienna_unchained_remove_wounded_on_boss_death",
		buffer = "server",
		num_ranks = 1,
		icon = "sienna_unchained_remove_wounded_on_boss_death",
		requirements = {},
		buffs = {
			"sienna_unchained_remove_wounded_on_boss_death"
		},
		buff_data = {}
	},
	{
		description = "sienna_unchained_reduced_vent_damage_desc",
		name = "sienna_unchained_reduced_vent_damage",
		num_ranks = 1,
		buffer = "server",
		icon = "sienna_unchained_reduced_vent_damage",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_unchained_reduced_vent_damage.multiplier
			}
		},
		requirements = {},
		buffs = {
			"sienna_unchained_reduced_vent_damage"
		},
		buff_data = {}
	},
	{
		description = "sienna_unchained_increased_vent_speed_desc",
		name = "sienna_unchained_increased_vent_speed",
		num_ranks = 1,
		icon = "sienna_unchained_increased_vent_speed",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_unchained_increased_vent_speed.multiplier
			}
		},
		requirements = {},
		buffs = {
			"sienna_unchained_increased_vent_speed"
		},
		buff_data = {}
	},
	{
		description = "sienna_unchained_reduced_overcharge_desc",
		name = "sienna_unchained_reduced_overcharge",
		num_ranks = 1,
		icon = "sienna_unchained_reduced_overcharge",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_unchained_reduced_overcharge.multiplier
			}
		},
		requirements = {},
		buffs = {
			"sienna_unchained_reduced_overcharge"
		},
		buff_data = {}
	},
	{
		description = "regrowth_desc",
		name = "sienna_unchained_regrowth",
		num_ranks = 1,
		buffer = "server",
		icon = "sienna_unchained_regrowth",
		description_values = {},
		requirements = {},
		buffs = {
			"regrowth"
		},
		buff_data = {}
	},
	{
		description = "bloodlust_desc",
		name = "sienna_unchained_bloodlust",
		num_ranks = 1,
		buffer = "server",
		icon = "sienna_unchained_bloodlust",
		description_values = {},
		requirements = {},
		buffs = {
			"bloodlust"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc",
		name = "sienna_unchained_conqueror",
		num_ranks = 1,
		buffer = "server",
		icon = "sienna_unchained_conqueror",
		description_values = {},
		requirements = {},
		buffs = {
			"conqueror"
		},
		buff_data = {}
	},
	{
		description = "sienna_unchained_activated_ability_radius_desc",
		name = "sienna_unchained_activated_ability_radius",
		num_ranks = 1,
		icon = "sienna_unchained_activated_ability_radius",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_unchained_activated_ability_radius.multiplier
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "sienna_unchained_activated_ability_damage_desc",
		name = "sienna_unchained_activated_ability_damage",
		num_ranks = 1,
		icon = "sienna_unchained_activated_ability_damage",
		description_values = {},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "sienna_unchained_activated_ability_cooldown_desc",
		name = "sienna_unchained_activated_ability_cooldown",
		num_ranks = 1,
		icon = "sienna_unchained_activated_ability_cooldown",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.sienna_unchained_activated_ability_cooldown.multiplier
			}
		},
		requirements = {},
		buffs = {
			"sienna_unchained_activated_ability_cooldown"
		},
		buff_data = {}
	}
}

for name, data in pairs(TalentBuffTemplates.bright_wizard) do
	local buffs = data.buffs

	fassert(#buffs == 1, "talent buff has more than one sub buff, add multiple buffs from the talent instead")

	local buff = buffs[1]
	buff.name = name
end

BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.bright_wizard, buff_tweak_data)

return
