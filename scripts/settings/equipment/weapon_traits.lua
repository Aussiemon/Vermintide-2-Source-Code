WeaponTraits = WeaponTraits or {}
local buff_tweak_data = {
	traits_melee_attack_speed_on_crit_proc = {
		duration = 5,
		multiplier = 0.2
	},
	traits_melee_timed_block_cost = {
		multiplier = -1
	},
	traits_melee_counter_push_power = {
		multiplier = 0.5
	},
	traits_melee_increase_damage_on_block_proc = {
		duration = 3,
		multiplier = 0.5
	},
	traits_melee_shield_on_assist = {
		bonus = 15
	},
	traits_ranged_replenish_ammo_headshot = {
		bonus = 1
	},
	traits_ranged_reduced_overcharge = {
		multiplier = -0.2
	},
	traits_ranged_movespeed_on_damage_taken = {
		inherited_multiplier = 1.5,
		inherited_duration = 3
	},
	traits_ranged_replenish_ammo_headshot = {
		bonus = 1
	},
	traits_ranged_replenish_ammo_on_crit = {
		bonus = 2
	},
	traits_ranged_remove_overcharge_on_crit = {
		bonus = 4
	},
	consecutive_shot_buff = {
		duration = 5,
		multiplier = 0.05
	},
	traits_reduce_cooldown_on_crit = {
		bonus = 2
	},
	traits_heal_on_crit = {
		bonus = 5
	},
	ranged_power_vs_unarmored = {
		multiplier = 0.25
	},
	ranged_power_vs_armored = {
		multiplier = 0.25
	},
	ranged_power_vs_large = {
		multiplier = 0.25
	},
	ranged_power_vs_frenzy = {
		multiplier = 0.25
	},
	trait_ring_not_consume_potion = {
		proc_chance = 0.25
	},
	trait_ring_potion_spread = {
		distance = 10
	},
	trait_ring_not_consume_potion_damage = {
		proc_chance = 1
	},
	trait_ring_all_potions = {
		multiplier = -0.5
	},
	trait_ring_potion_duration = {
		multiplier = 0.5
	},
	trait_necklace_not_consume_healing = {
		proc_chance = 0.25
	},
	trait_necklace_heal_self_on_heal_other = {
		multiplier = 0.35
	},
	trait_necklace_increased_healing_received = {
		multiplier = 0.3
	},
	trait_necklace_damage_taken_reduction_buff = {
		duration = 10,
		multiplier = -0.5
	},
	trait_trinket_not_consume_grenade = {
		proc_chance = 0.25
	},
	trait_trinket_increase_grenade_radius = {
		multiplier = 0.5
	},
	trait_trinket_grenade_damage_taken_buff = {
		duration = 10,
		multiplier = 0.2
	}
}
WeaponTraits.buff_templates = {
	traits_melee_attack_speed_on_crit_proc = {
		buffs = {
			{
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	traits_melee_attack_speed_on_crit = {
		buffs = {
			{
				buff_to_add = "traits_melee_attack_speed_on_crit_proc",
				event_buff = true,
				event = "on_critical_hit",
				dormant = true,
				buff_func = ProcFunctions.add_buff
			}
		}
	},
	traits_melee_timed_block_cost = {
		buffs = {
			{
				dormant = true,
				stat_buff = StatBuffIndex.TIMED_BLOCK_COST
			}
		}
	},
	traits_melee_counter_push_power = {
		buffs = {
			{
				dormant = true,
				stat_buff = StatBuffIndex.COUNTER_PUSH_POWER
			}
		}
	},
	traits_melee_increase_damage_on_block = {
		buffs = {
			{
				event = "on_block",
				dormant = true,
				event_buff = true,
				buff_func = ProcFunctions.block_increase_enemy_damage_taken
			}
		}
	},
	traits_melee_increase_damage_on_block_proc = {
		buffs = {
			{
				refresh_durations = true,
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	traits_melee_shield_on_assist = {
		buffs = {
			{
				event = "on_assisted_ally",
				event_buff = true,
				dormant = true,
				buff_func = ProcFunctions.heal_assisted_and_self_on_assist
			}
		}
	},
	traits_ranged_replenish_ammo_headshot = {
		buffs = {
			{
				event = "on_hit",
				dormant = true,
				event_buff = true,
				buff_func = ProcFunctions.replenish_ammo_on_headshot_ranged
			}
		}
	},
	traits_ranged_restore_stamina_headshot = {
		buffs = {
			{
				max_stacks = 1,
				dormant = true,
				stat_buff = StatBuffIndex.COOP_STAMINA
			}
		}
	},
	traits_ranged_movespeed_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				dormant = true,
				event_buff = true,
				buff_func = ProcFunctions.increased_movement_speed
			}
		}
	},
	traits_ranged_reduced_overcharge = {
		buffs = {
			{
				max_stacks = 1,
				dormant = true,
				stat_buff = StatBuffIndex.REDUCED_OVERCHARGE
			}
		}
	},
	traits_ranged_replenish_ammo_headshot = {
		buffs = {
			{
				event = "on_hit",
				dormant = true,
				event_buff = true,
				buff_func = ProcFunctions.replenish_ammo_on_headshot_ranged
			}
		}
	},
	traits_ranged_replenish_ammo_on_crit = {
		buffs = {
			{
				event = "on_critical_hit",
				dormant = true,
				event_buff = true,
				buff_func = ProcFunctions.ammo_gain
			}
		}
	},
	traits_ranged_remove_overcharge_on_crit = {
		buffs = {
			{
				event = "on_critical_hit",
				dormant = true,
				event_buff = true,
				buff_func = ProcFunctions.remove_overcharge
			}
		}
	},
	traits_ranged_consecutive_hits_increase_power = {
		buffs = {
			{
				event = "on_hit",
				dormant = true,
				event_buff = true,
				buff_func = ProcFunctions.buff_consecutive_shots_damage
			}
		}
	},
	consecutive_shot_debuff = {
		buffs = {
			{
				refresh_durations = true,
				duration = 10
			}
		}
	},
	consecutive_shot_buff = {
		buffs = {
			{
				max_stacks = 5,
				icon = "ranged_consecutive_hits_increase_power",
				refresh_durations = true,
				stat_buff = StatBuffIndex.POWER_LEVEL
			}
		}
	},
	traits_ranged_increase_power_level_vs_armour_crit = {
		buffs = {
			{
				event = "on_critical_hit",
				dormant = true,
				event_buff = true,
				buff_func = ProcFunctions.ranged_crits_increase_dmg_vs_armour_type
			}
		}
	},
	ranged_power_vs_unarmored = {
		buffs = {
			{
				max_stacks = 1,
				icon = "ranged_increase_power_level_vs_armour_crit",
				duration = 10,
				stat_buff = StatBuffIndex.POWER_LEVEL_UNARMOURED
			}
		}
	},
	ranged_power_vs_armored = {
		buffs = {
			{
				max_stacks = 1,
				icon = "ranged_increase_power_level_vs_armour_crit",
				duration = 10,
				stat_buff = StatBuffIndex.POWER_LEVEL_ARMOURED
			}
		}
	},
	ranged_power_vs_large = {
		buffs = {
			{
				max_stacks = 1,
				icon = "ranged_increase_power_level_vs_armour_crit",
				duration = 10,
				stat_buff = StatBuffIndex.POWER_LEVEL_LARGE
			}
		}
	},
	ranged_power_vs_frenzy = {
		buffs = {
			{
				max_stacks = 1,
				icon = "ranged_increase_power_level_vs_armour_crit",
				duration = 10,
				stat_buff = StatBuffIndex.POWER_LEVEL_FRENZY
			}
		}
	},
	traits_reduce_cooldown_on_crit = {
		buffs = {
			{
				event_buff = true,
				event = "on_critical_hit",
				dormant = true,
				bonus = 1,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown
			}
		}
	},
	traits_heal_on_crit = {
		buffs = {
			{
				event_buff = true,
				event = "on_critical_hit",
				dormant = true,
				bonus = 5,
				buff_func = ProcFunctions.heal
			}
		}
	},
	trait_ring_not_consume_potion = {
		buffs = {
			{
				dormant = true,
				stat_buff = StatBuffIndex.NOT_CONSUME_POTION
			}
		}
	},
	trait_ring_potion_spread = {
		buffs = {
			{
				dormant = true
			}
		}
	},
	trait_ring_not_consume_potion_damage = {
		buffs = {
			{
				dormant = true,
				stat_buff = StatBuffIndex.NOT_CONSUME_POTION
			}
		}
	},
	trait_ring_all_potions = {
		buffs = {
			{
				dormant = true,
				stat_buff = StatBuffIndex.POTION_DURATION
			}
		}
	},
	trait_ring_potion_duration = {
		buffs = {
			{
				dormant = true,
				perk = "potion_duration"
			}
		}
	},
	trait_necklace_not_consume_healing = {
		buffs = {
			{
				dormant = true,
				stat_buff = StatBuffIndex.NOT_CONSUME_MEDPACK
			}
		}
	},
	trait_necklace_heal_self_on_heal_other = {
		buffs = {
			{
				dormant = true,
				stat_buff = StatBuffIndex.HEAL_SELF_ON_HEAL_OTHER
			}
		}
	},
	trait_necklace_increased_healing_received = {
		buffs = {
			{
				max_stacks = 1,
				dormant = true,
				stat_buff = StatBuffIndex.HEALING_RECEIVED
			}
		}
	},
	trait_necklace_no_healing_health_regen = {
		buffs = {
			{
				icon = "necklace_no_healing_health_regen",
				heal_amount = 2,
				max_stacks = 1,
				time_between_heals = 10,
				update_func = "update_heal_ticks",
				dormant = true
			}
		}
	},
	trait_necklace_damage_taken_reduction_on_heal = {
		buffs = {
			{
				event = "on_healed",
				dormant = true,
				event_buff = true,
				buff_func = ProcFunctions.buff_defence_on_heal
			}
		}
	},
	trait_necklace_damage_taken_reduction_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "necklace_damage_taken_reduction_on_heal",
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	trait_trinket_not_consume_grenade = {
		buffs = {
			{
				dormant = true,
				stat_buff = StatBuffIndex.NOT_CONSUME_GRENADE
			}
		}
	},
	trait_trinket_increase_grenade_radius = {
		buffs = {
			{
				dormant = true,
				stat_buff = StatBuffIndex.GRENADE_RADIUS
			}
		}
	},
	trait_trinket_grenade_damage_taken = {
		buffs = {
			{
				event = "on_hit",
				dormant = true,
				event_buff = true,
				buff_func = ProcFunctions.debuff_defence_grenade_hit
			}
		}
	},
	trait_trinket_grenade_damage_taken_buff = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	}
}
WeaponTraits.traits = {
	melee_attack_speed_on_crit = {
		display_name = "traits_melee_attack_speed_on_crit",
		advanced_description = "description_traits_melee_attack_speed_on_crit",
		icon = "melee_attack_speed_on_crit",
		buff_name = "traits_melee_attack_speed_on_crit",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.traits_melee_attack_speed_on_crit_proc.multiplier
			},
			{
				value = buff_tweak_data.traits_melee_attack_speed_on_crit_proc.duration
			}
		}
	},
	melee_timed_block_cost = {
		display_name = "traits_melee_timed_block_cost",
		advanced_description = "description_traits_melee_timed_block_cost",
		icon = "melee_timed_block_cost",
		buff_name = "traits_melee_timed_block_cost",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.traits_melee_timed_block_cost.multiplier
			}
		}
	},
	melee_counter_push_power = {
		display_name = "traits_melee_counter_push_power",
		buffer = "both",
		advanced_description = "description_traits_melee_counter_push_power",
		icon = "melee_counter_push_power",
		buff_name = "traits_melee_counter_push_power",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.traits_melee_counter_push_power.multiplier
			}
		}
	},
	melee_reduce_cooldown_on_crit = {
		display_name = "traits_melee_reduce_cooldown_on_crit",
		advanced_description = "description_traits_melee_reduce_cooldown_on_crit",
		icon = "melee_reduce_cooldown_on_crit",
		buff_name = "traits_reduce_cooldown_on_crit",
		description_values = {
			{
				value_type = "bonus",
				value = buff_tweak_data.traits_reduce_cooldown_on_crit.bonus
			}
		}
	},
	melee_increase_damage_on_block = {
		display_name = "traits_melee_increase_damage_on_block",
		buffer = "server",
		advanced_description = "description_traits_melee_increase_damage_on_block",
		icon = "melee_increase_damage_on_block",
		buff_name = "traits_melee_increase_damage_on_block",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.traits_melee_increase_damage_on_block_proc.multiplier
			},
			{
				value_type = "duration",
				value = buff_tweak_data.traits_melee_increase_damage_on_block_proc.duration
			}
		}
	},
	melee_heal_on_crit = {
		display_name = "traits_melee_heal_on_crit",
		buffer = "server",
		advanced_description = "description_traits_melee_heal_on_crit",
		icon = "melee_heal_on_crit",
		buff_name = "traits_heal_on_crit",
		description_values = {
			{
				value_type = "bonus",
				value = buff_tweak_data.traits_heal_on_crit.bonus
			}
		}
	},
	melee_shield_on_assist = {
		display_name = "traits_melee_shield_on_assist",
		buffer = "server",
		advanced_description = "description_traits_melee_shield_on_assist",
		icon = "melee_shield_on_assist",
		buff_name = "traits_melee_shield_on_assist",
		description_values = {
			{
				value_type = "bonus",
				value = buff_tweak_data.traits_melee_shield_on_assist.bonus
			}
		}
	},
	ranged_replenish_ammo_headshot = {
		display_name = "traits_ranged_replenish_ammo_headshot",
		advanced_description = "description_traits_ranged_replenish_ammo_headshot",
		icon = "ranged_replenish_ammo_headshot",
		buff_name = "traits_ranged_replenish_ammo_headshot",
		description_values = {
			{
				value_type = "bonus",
				value = buff_tweak_data.traits_ranged_replenish_ammo_headshot.bonus
			}
		}
	},
	ranged_restore_stamina_headshot = {
		display_name = "traits_ranged_restore_stamina_headshot",
		buffer = "both",
		advanced_description = "description_traits_ranged_restore_stamina_headshot",
		icon = "ranged_restore_stamina_headshot",
		buff_name = "traits_ranged_restore_stamina_headshot"
	},
	ranged_reduced_overcharge = {
		display_name = "traits_ranged_reduced_overcharge",
		advanced_description = "description_traits_ranged_reduced_overcharge",
		icon = "ranged_reduced_overcharge",
		buff_name = "traits_ranged_reduced_overcharge",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.traits_ranged_reduced_overcharge.multiplier
			}
		}
	},
	ranged_reduce_cooldown_on_crit = {
		display_name = "traits_ranged_reduce_cooldown_on_crit",
		advanced_description = "description_traits_ranged_reduce_cooldown_on_crit",
		icon = "ranged_reduce_cooldown_on_crit",
		buff_name = "traits_reduce_cooldown_on_crit",
		description_values = {
			{
				value_type = "bonus",
				value = buff_tweak_data.traits_reduce_cooldown_on_crit.bonus
			}
		}
	},
	ranged_replenish_ammo_on_crit = {
		display_name = "traits_ranged_replenish_ammo_on_crit",
		advanced_description = "description_traits_ranged_replenish_ammo_on_crit",
		icon = "ranged_replenish_ammo_on_crit",
		buff_name = "traits_ranged_replenish_ammo_on_crit",
		description_values = {
			{
				value_type = "bonus",
				value = buff_tweak_data.traits_ranged_replenish_ammo_on_crit.bonus
			}
		}
	},
	ranged_remove_overcharge_on_crit = {
		display_name = "traits_ranged_remove_overcharge_on_crit",
		advanced_description = "description_traits_ranged_remove_overcharge_on_crit",
		icon = "ranged_remove_overcharge_on_crit",
		buff_name = "traits_ranged_remove_overcharge_on_crit",
		description_values = {
			{
				value_type = "bonus",
				value = buff_tweak_data.traits_ranged_remove_overcharge_on_crit.bonus
			}
		}
	},
	ranged_increase_power_level_vs_armour_crit = {
		display_name = "traits_ranged_increase_power_level_vs_armour_crit",
		buffer = "both",
		advanced_description = "description_traits_ranged_increase_power_level_vs_armour_crit",
		icon = "ranged_increase_power_level_vs_armour_crit",
		buff_name = "traits_ranged_increase_power_level_vs_armour_crit",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.ranged_power_vs_unarmored.multiplier
			}
		}
	},
	ranged_consecutive_hits_increase_power = {
		display_name = "traits_ranged_consecutive_hits_increase_power",
		buffer = "both",
		advanced_description = "description_traits_ranged_consecutive_hits_increase_power",
		icon = "ranged_consecutive_hits_increase_power",
		buff_name = "traits_ranged_consecutive_hits_increase_power",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.consecutive_shot_buff.multiplier
			},
			{
				value_type = "duration",
				value = buff_tweak_data.consecutive_shot_buff.duration
			}
		}
	},
	ranged_movespeed_on_damage_taken = {
		display_name = "traits_ranged_movespeed_on_damage_taken",
		advanced_description = "description_traits_ranged_movespeed_on_damage_taken",
		icon = "ranged_movespeed_on_damage_taken",
		buff_name = "traits_ranged_movespeed_on_damage_taken",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.traits_ranged_movespeed_on_damage_taken.inherited_multiplier
			},
			{
				value_type = "duration",
				value = buff_tweak_data.traits_ranged_movespeed_on_damage_taken.inherited_duration
			}
		}
	},
	ring_not_consume_potion = {
		display_name = "trait_ring_not_consume_potion",
		advanced_description = "description_trait_ring_not_consume_potion",
		icon = "charm_not_consume_potion",
		buff_name = "trait_ring_not_consume_potion",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.trait_ring_not_consume_potion.proc_chance
			}
		}
	},
	ring_potion_spread = {
		display_name = "trait_ring_potion_spread",
		buffer = "both",
		advanced_description = "description_trait_ring_potion_spread",
		icon = "charm_potion_spread",
		buff_name = "trait_ring_potion_spread"
	},
	ring_not_consume_potion_damage = {
		advanced_description = "description_trait_ring_not_consume_potion_damage",
		icon = "charm_not_consume_potion_damage",
		display_name = "trait_ring_not_consume_potion_damage",
		buff_name = "trait_ring_not_consume_potion_damage"
	},
	ring_all_potions = {
		display_name = "trait_ring_all_potions",
		advanced_description = "description_trait_ring_all_potions",
		icon = "charm_all_potions",
		buff_name = "trait_ring_all_potions",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.trait_ring_all_potions.multiplier
			}
		}
	},
	ring_potion_duration = {
		display_name = "trait_ring_potion_duration",
		advanced_description = "description_trait_ring_potion_duration",
		icon = "charm_potion_duration_increased",
		buff_name = "trait_ring_potion_duration",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.trait_ring_potion_duration.multiplier
			}
		}
	},
	necklace_not_consume_healing = {
		display_name = "trait_necklace_not_consume_healing",
		advanced_description = "description_trait_necklace_not_consume_healing",
		icon = "necklace_not_consume_healing",
		buff_name = "trait_necklace_not_consume_healing",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.trait_necklace_not_consume_healing.proc_chance
			}
		}
	},
	necklace_heal_self_on_heal_other = {
		display_name = "trait_necklace_heal_self_on_heal_other",
		buffer = "server",
		advanced_description = "description_trait_necklace_heal_self_on_heal_other",
		icon = "necklace_heal_self_on_heal_other",
		buff_name = "trait_necklace_heal_self_on_heal_other",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.trait_necklace_heal_self_on_heal_other.multiplier
			}
		}
	},
	necklace_increased_healing_received = {
		display_name = "trait_necklace_increased_healing_received",
		buffer = "server",
		advanced_description = "description_trait_necklace_increased_healing_received",
		icon = "necklace_increased_healing_received",
		buff_name = "trait_necklace_increased_healing_received",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.trait_necklace_increased_healing_received.multiplier
			}
		}
	},
	necklace_no_healing_health_regen = {
		display_name = "trait_necklace_no_healing_health_regen",
		buffer = "both",
		advanced_description = "description_trait_necklace_no_healing_health_regen",
		icon = "necklace_no_healing_health_regen",
		buff_name = "trait_necklace_no_healing_health_regen"
	},
	necklace_damage_taken_reduction_on_heal = {
		display_name = "trait_necklace_damage_taken_reduction_on_heal",
		buffer = "server",
		advanced_description = "description_trait_necklace_damage_taken_reduction_on_heal",
		icon = "necklace_damage_taken_reduction_on_heal",
		buff_name = "trait_necklace_damage_taken_reduction_on_heal",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.trait_necklace_damage_taken_reduction_buff.multiplier
			},
			{
				value_type = "duration",
				value = buff_tweak_data.trait_necklace_damage_taken_reduction_buff.duration
			}
		}
	},
	trinket_not_consume_grenade = {
		display_name = "trait_trinket_not_consume_grenade",
		advanced_description = "description_trait_trinket_not_consume_grenade",
		icon = "trait_trinket_not_consume_grenade",
		buff_name = "trait_trinket_not_consume_grenade",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.trait_trinket_not_consume_grenade.proc_chance
			}
		}
	},
	trinket_increase_grenade_radius = {
		display_name = "trait_trinket_increase_grenade_radius",
		advanced_description = "description_trait_trinket_increase_grenade_radius",
		icon = "trinket_increase_grenade_radius",
		buff_name = "trait_trinket_increase_grenade_radius",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.trait_trinket_increase_grenade_radius.multiplier
			}
		}
	},
	trinket_grenade_damage_taken = {
		display_name = "trait_trinket_grenade_damage_taken",
		buffer = "server",
		advanced_description = "description_trait_trinket_grenade_damage_taken",
		icon = "trinket_reduce_radius_by_50_Increase_power_by_50",
		buff_name = "trait_trinket_grenade_damage_taken",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.trait_trinket_grenade_damage_taken_buff.multiplier
			},
			{
				value_type = "duration",
				value = buff_tweak_data.trait_trinket_grenade_damage_taken_buff.duration
			}
		}
	}
}

for name, data in pairs(WeaponTraits.traits) do
	data.name = name
end

WeaponTraits.combinations = {
	melee = {
		{
			"melee_attack_speed_on_crit"
		},
		{
			"melee_timed_block_cost"
		},
		{
			"melee_counter_push_power"
		},
		{
			"melee_increase_damage_on_block"
		},
		{
			"melee_reduce_cooldown_on_crit"
		},
		{
			"melee_shield_on_assist"
		},
		{
			"melee_heal_on_crit"
		}
	},
	ranged_ammo = {
		{
			"ranged_restore_stamina_headshot"
		},
		{
			"ranged_replenish_ammo_headshot"
		},
		{
			"ranged_reduce_cooldown_on_crit"
		},
		{
			"ranged_replenish_ammo_on_crit"
		},
		{
			"ranged_increase_power_level_vs_armour_crit"
		},
		{
			"ranged_consecutive_hits_increase_power"
		},
		{
			"ranged_movespeed_on_damage_taken"
		}
	},
	ranged_heat = {
		{
			"ranged_restore_stamina_headshot"
		},
		{
			"ranged_reduced_overcharge"
		},
		{
			"ranged_reduce_cooldown_on_crit"
		},
		{
			"ranged_remove_overcharge_on_crit"
		},
		{
			"ranged_increase_power_level_vs_armour_crit"
		},
		{
			"ranged_consecutive_hits_increase_power"
		},
		{
			"ranged_movespeed_on_damage_taken"
		}
	},
	offence_accessory = {
		{
			"ring_not_consume_potion"
		},
		{
			"ring_potion_spread"
		},
		{
			"ring_not_consume_potion_damage"
		},
		{
			"ring_all_potions"
		},
		{
			"ring_potion_duration"
		}
	},
	defence_accessory = {
		{
			"necklace_not_consume_healing"
		},
		{
			"necklace_heal_self_on_heal_other"
		},
		{
			"necklace_increased_healing_received"
		},
		{
			"necklace_no_healing_health_regen"
		},
		{
			"necklace_damage_taken_reduction_on_heal"
		}
	},
	utility_accessory = {
		{
			"trinket_not_consume_grenade"
		},
		{
			"trinket_increase_grenade_radius"
		},
		{
			"trinket_grenade_damage_taken"
		}
	}
}

for name, data in pairs(WeaponTraits.buff_templates) do
	local buffs = data.buffs

	fassert(#buffs == 1, "trait buff has more than one sub buff, add multiple buffs from the trait instead")

	local buff = buffs[1]
	buff.name = name
end

BuffUtils.apply_buff_tweak_data(WeaponTraits.buff_templates, buff_tweak_data)

return
