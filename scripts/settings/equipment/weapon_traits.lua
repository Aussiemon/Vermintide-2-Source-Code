-- chunkname: @scripts/settings/equipment/weapon_traits.lua

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")

WeaponTraits = WeaponTraits or {}

local buff_tweak_data = {
	traits_melee_attack_speed_on_crit_proc = {
		duration = 5,
		multiplier = 0.2,
	},
	traits_melee_timed_block_cost = {
		multiplier = -1,
	},
	traits_melee_counter_push_power = {
		multiplier = 0.5,
	},
	traits_melee_increase_damage_on_block_proc = {
		duration = 5,
		multiplier = 0.2,
	},
	traits_melee_shield_on_assist = {
		bonus = 15,
	},
	traits_ranged_replenish_ammo_headshot = {
		bonus = 1,
	},
	traits_ranged_reduced_overcharge = {
		multiplier = -0.2,
	},
	traits_ranged_movespeed_on_damage_taken = {
		inherited_duration = 3,
		inherited_multiplier = 1.5,
	},
	traits_ranged_replenish_ammo_headshot = {
		bonus = 1,
	},
	traits_ranged_replenish_ammo_on_crit = {
		ammo_bonus_fraction = 0.05,
	},
	traits_ranged_remove_overcharge_on_crit = {
		bonus = 0,
	},
	consecutive_shot_buff = {
		duration = 5,
		multiplier = 0.05,
	},
	traits_reduce_cooldown_on_crit = {
		bonus = 0.05,
	},
	traits_reduce_cooldown_on_crit_internal_cooldown = {
		duration = 4,
	},
	traits_heal_on_crit = {
		bonus = 5,
	},
	ranged_power_vs_unarmored = {
		multiplier = 0.25,
	},
	ranged_power_vs_armored = {
		multiplier = 0.25,
	},
	ranged_power_vs_large = {
		multiplier = 0.25,
	},
	ranged_power_vs_frenzy = {
		multiplier = 0.25,
	},
	trait_ring_not_consume_potion = {
		proc_chance = 0.25,
	},
	trait_ring_potion_spread = {
		distance = 10,
	},
	trait_ring_not_consume_potion_damage = {
		proc_chance = 1,
	},
	trait_ring_all_potions = {
		multiplier = -0.5,
	},
	trait_ring_potion_duration = {
		multiplier = 0.5,
	},
	trait_necklace_not_consume_healing = {
		proc_chance = 0.25,
	},
	trait_necklace_heal_self_on_heal_other = {
		multiplier = 0.5,
	},
	trait_necklace_heal_share = {
		multiplier = 0.2,
	},
	trait_necklace_increased_healing_received = {
		multiplier = 0.3,
	},
	trait_necklace_damage_taken_reduction_buff = {
		duration = 2,
		multiplier = -0.4,
	},
	trait_necklace_no_healing_health_regen = {
		heal_amount = 1,
		time_between_heals = 5,
	},
	trait_trinket_not_consume_grenade = {
		proc_chance = 0.25,
	},
	trait_trinket_increase_grenade_radius = {
		multiplier = 0.5,
	},
	trait_trinket_grenade_damage_taken_buff = {
		duration = 10,
		multiplier = 0.2,
	},
}

WeaponTraits.buff_templates = {
	traits_melee_attack_speed_on_crit_proc = {
		buffs = {
			{
				icon = "melee_attack_speed_on_crit",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
		},
	},
	traits_melee_attack_speed_on_crit = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "traits_melee_attack_speed_on_crit_proc",
				event = "on_critical_hit",
			},
		},
	},
	traits_melee_timed_block_cost = {
		buffs = {
			{
				stat_buff = "timed_block_cost",
			},
		},
	},
	traits_melee_counter_push_power = {
		buffs = {
			{
				stat_buff = "counter_push_power",
			},
		},
	},
	traits_melee_increase_damage_on_block = {
		buffs = {
			{
				buff_func = "block_increase_enemy_damage_taken",
				event = "on_block",
			},
		},
	},
	traits_melee_increase_damage_on_block_proc = {
		buffs = {
			{
				refresh_durations = true,
				stat_buff = "damage_taken",
			},
		},
	},
	traits_melee_shield_on_assist = {
		buffs = {
			{
				buff_func = "heal_assisted_and_self_on_assist",
				event = "on_assisted_ally",
			},
		},
	},
	traits_ranged_replenish_ammo_headshot = {
		buffs = {
			{
				buff_func = "replenish_ammo_on_headshot_ranged",
				event = "on_hit",
			},
		},
	},
	traits_ranged_restore_stamina_headshot = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "coop_stamina",
			},
		},
	},
	traits_ranged_movespeed_on_damage_taken = {
		buffs = {
			{
				buff_func = "increased_movement_speed",
				event = "on_damage_taken",
			},
		},
	},
	traits_ranged_reduced_overcharge = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "reduced_overcharge",
			},
		},
	},
	traits_ranged_replenish_ammo_headshot = {
		buffs = {
			{
				buff_func = "replenish_ammo_on_headshot_ranged",
				event = "on_hit",
			},
		},
	},
	traits_ranged_replenish_ammo_on_crit = {
		buffs = {
			{
				buff_func = "ammo_fraction_gain_on_crit_trait",
				event = "on_critical_hit",
			},
		},
	},
	traits_ranged_remove_overcharge_on_crit = {
		buffs = {
			{
				buff_func = "remove_overcharge",
				event = "on_critical_hit",
				perks = {
					buff_perks.no_overcharge_crit,
				},
			},
		},
	},
	traits_ranged_consecutive_hits_increase_power = {
		buffs = {
			{
				buff_func = "buff_consecutive_shots_damage",
				event = "on_hit",
			},
		},
	},
	consecutive_shot_debuff = {
		buffs = {
			{
				duration = 10,
				max_stacks = 1,
				refresh_durations = true,
			},
		},
	},
	consecutive_shot_buff = {
		buffs = {
			{
				icon = "ranged_consecutive_hits_increase_power",
				max_stacks = 5,
				refresh_durations = true,
				stat_buff = "power_level",
			},
		},
	},
	traits_ranged_increase_power_level_vs_armour_crit = {
		buffs = {
			{
				buff_func = "ranged_crits_increase_dmg_vs_armour_type",
				event = "on_critical_hit",
			},
		},
	},
	ranged_power_vs_unarmored = {
		buffs = {
			{
				duration = 10,
				icon = "ranged_increase_power_level_vs_armour_crit",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "power_level_unarmoured",
			},
		},
	},
	ranged_power_vs_armored = {
		buffs = {
			{
				duration = 10,
				icon = "ranged_increase_power_level_vs_armour_crit",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "power_level_armoured",
			},
		},
	},
	ranged_power_vs_large = {
		buffs = {
			{
				duration = 10,
				icon = "ranged_increase_power_level_vs_armour_crit",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "power_level_large",
			},
		},
	},
	ranged_power_vs_frenzy = {
		buffs = {
			{
				duration = 10,
				icon = "ranged_increase_power_level_vs_armour_crit",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "power_level_frenzy",
			},
		},
	},
	traits_reduce_cooldown_on_crit = {
		buffs = {
			{
				bonus = 1,
				buff_func = "reduce_activated_ability_cooldown_with_internal_cooldown_on_crit",
				buff_to_add = "traits_reduce_cooldown_on_crit_internal_cooldown",
				event = "on_critical_hit",
			},
		},
	},
	traits_reduce_cooldown_on_crit_internal_cooldown = {
		buffs = {
			{
				perks = {
					buff_perks.cooldown_delay,
				},
			},
		},
	},
	traits_heal_on_crit = {
		buffs = {
			{
				bonus = 5,
				buff_func = "heal",
				event = "on_critical_hit",
			},
		},
	},
	trait_ring_not_consume_potion = {
		buffs = {
			{
				stat_buff = "not_consume_potion",
			},
		},
	},
	trait_ring_potion_spread = {
		buffs = {
			{},
		},
	},
	trait_ring_not_consume_potion_damage = {
		buffs = {
			{
				stat_buff = "not_consume_potion",
			},
		},
	},
	trait_ring_all_potions = {
		buffs = {
			{
				stat_buff = "potion_duration",
			},
		},
	},
	trait_ring_potion_duration = {
		buffs = {
			{
				perks = {
					buff_perks.potion_duration,
				},
			},
		},
	},
	trait_necklace_not_consume_healing = {
		buffs = {
			{
				stat_buff = "not_consume_medpack",
			},
		},
	},
	trait_necklace_heal_self_on_heal_other = {
		buffs = {
			{
				stat_buff = "heal_self_on_heal_other",
			},
		},
	},
	trait_necklace_heal_share = {
		buffs = {
			{
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable",
				multiplier = 0.2,
				name = "necklace_heal_share",
				range = 10,
			},
		},
	},
	trait_necklace_increased_healing_received = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "healing_received",
			},
		},
	},
	trait_necklace_no_healing_health_regen = {
		buffs = {
			{
				max_stacks = 1,
				update_func = "update_heal_ticks",
				perks = {
					buff_perks.no_permanent_health,
				},
			},
		},
	},
	trait_necklace_damage_taken_reduction_on_heal = {
		buffs = {
			{
				buff_func = "buff_defence_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	trait_necklace_damage_taken_reduction_buff = {
		buffs = {
			{
				icon = "necklace_damage_taken_reduction_on_heal",
				max_stacks = 1,
				stat_buff = "damage_taken",
			},
		},
	},
	trait_trinket_not_consume_grenade = {
		buffs = {
			{
				stat_buff = "not_consume_grenade",
			},
		},
	},
	trait_trinket_increase_grenade_radius = {
		buffs = {
			{
				stat_buff = "grenade_radius",
			},
		},
	},
	trait_trinket_grenade_damage_taken = {
		buffs = {
			{
				buff_func = "debuff_defence_grenade_hit",
				event = "on_hit",
			},
		},
	},
	trait_trinket_grenade_damage_taken_buff = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "damage_taken",
			},
		},
	},
}
WeaponTraits.traits = {
	melee_attack_speed_on_crit = {
		advanced_description = "description_traits_melee_attack_speed_on_crit",
		buff_name = "traits_melee_attack_speed_on_crit",
		display_name = "traits_melee_attack_speed_on_crit",
		icon = "melee_attack_speed_on_crit",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.traits_melee_attack_speed_on_crit_proc.multiplier,
			},
			{
				value = buff_tweak_data.traits_melee_attack_speed_on_crit_proc.duration,
			},
		},
	},
	melee_timed_block_cost = {
		advanced_description = "description_traits_melee_timed_block_cost",
		buff_name = "traits_melee_timed_block_cost",
		display_name = "traits_melee_timed_block_cost",
		icon = "melee_timed_block_cost",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.traits_melee_timed_block_cost.multiplier,
			},
		},
	},
	melee_counter_push_power = {
		advanced_description = "description_traits_melee_counter_push_power",
		buff_name = "traits_melee_counter_push_power",
		buffer = "both",
		display_name = "traits_melee_counter_push_power",
		icon = "melee_counter_push_power",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.traits_melee_counter_push_power.multiplier,
			},
		},
	},
	melee_reduce_cooldown_on_crit = {
		advanced_description = "description_traits_melee_reduce_cooldown_on_crit_2",
		buff_name = "traits_reduce_cooldown_on_crit",
		display_name = "traits_melee_reduce_cooldown_on_crit",
		icon = "melee_reduce_cooldown_on_crit",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.traits_reduce_cooldown_on_crit.bonus,
			},
			{
				value_type = "duration",
				value = buff_tweak_data.traits_reduce_cooldown_on_crit_internal_cooldown.duration,
			},
		},
	},
	melee_increase_damage_on_block = {
		advanced_description = "description_traits_melee_increase_damage_on_block",
		buff_name = "traits_melee_increase_damage_on_block",
		buffer = "server",
		display_name = "traits_melee_increase_damage_on_block",
		icon = "melee_increase_damage_on_block",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.traits_melee_increase_damage_on_block_proc.multiplier,
			},
			{
				value_type = "duration",
				value = buff_tweak_data.traits_melee_increase_damage_on_block_proc.duration,
			},
		},
	},
	melee_heal_on_crit = {
		advanced_description = "description_traits_melee_heal_on_crit",
		buff_name = "traits_heal_on_crit",
		buffer = "server",
		display_name = "traits_melee_heal_on_crit",
		icon = "melee_heal_on_crit",
		description_values = {
			{
				value_type = "bonus",
				value = buff_tweak_data.traits_heal_on_crit.bonus,
			},
		},
	},
	melee_shield_on_assist = {
		advanced_description = "description_traits_melee_shield_on_assist",
		buff_name = "traits_melee_shield_on_assist",
		buffer = "server",
		display_name = "traits_melee_shield_on_assist",
		icon = "melee_shield_on_assist",
		description_values = {
			{
				value_type = "bonus",
				value = buff_tweak_data.traits_melee_shield_on_assist.bonus,
			},
		},
	},
	ranged_replenish_ammo_headshot = {
		advanced_description = "description_traits_ranged_replenish_ammo_headshot",
		buff_name = "traits_ranged_replenish_ammo_headshot",
		display_name = "traits_ranged_replenish_ammo_headshot",
		icon = "ranged_replenish_ammo_headshot",
		description_values = {
			{
				value_type = "bonus",
				value = buff_tweak_data.traits_ranged_replenish_ammo_headshot.bonus,
			},
		},
	},
	ranged_restore_stamina_headshot = {
		advanced_description = "description_traits_ranged_restore_stamina_headshot",
		buff_name = "traits_ranged_restore_stamina_headshot",
		buffer = "both",
		display_name = "traits_ranged_restore_stamina_headshot",
		icon = "ranged_restore_stamina_headshot",
	},
	ranged_reduced_overcharge = {
		advanced_description = "description_traits_ranged_reduced_overcharge",
		buff_name = "traits_ranged_reduced_overcharge",
		display_name = "traits_ranged_reduced_overcharge",
		icon = "ranged_reduced_overcharge",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.traits_ranged_reduced_overcharge.multiplier,
			},
		},
	},
	ranged_reduce_cooldown_on_crit = {
		advanced_description = "description_traits_ranged_reduce_cooldown_on_crit_2",
		buff_name = "traits_reduce_cooldown_on_crit",
		display_name = "traits_ranged_reduce_cooldown_on_crit",
		icon = "ranged_reduce_cooldown_on_crit",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.traits_reduce_cooldown_on_crit.bonus,
			},
			{
				value_type = "bonus",
				value = buff_tweak_data.traits_reduce_cooldown_on_crit_internal_cooldown.duration,
			},
		},
	},
	ranged_replenish_ammo_on_crit = {
		advanced_description = "description_traits_ranged_replenish_ammo_on_crit_2",
		buff_name = "traits_ranged_replenish_ammo_on_crit",
		display_name = "traits_ranged_replenish_ammo_on_crit",
		icon = "ranged_replenish_ammo_on_crit",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.traits_ranged_replenish_ammo_on_crit.ammo_bonus_fraction,
			},
		},
	},
	ranged_remove_overcharge_on_crit = {
		advanced_description = "description_traits_ranged_remove_overcharge_on_crit_2",
		buff_name = "traits_ranged_remove_overcharge_on_crit",
		display_name = "traits_ranged_remove_overcharge_on_crit",
		icon = "ranged_remove_overcharge_on_crit",
		description_values = {},
	},
	ranged_increase_power_level_vs_armour_crit = {
		advanced_description = "description_traits_ranged_increase_power_level_vs_armour_crit",
		buff_name = "traits_ranged_increase_power_level_vs_armour_crit",
		buffer = "both",
		display_name = "traits_ranged_increase_power_level_vs_armour_crit",
		icon = "ranged_increase_power_level_vs_armour_crit",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.ranged_power_vs_unarmored.multiplier,
			},
		},
	},
	ranged_consecutive_hits_increase_power = {
		advanced_description = "description_traits_ranged_consecutive_hits_increase_power",
		buff_name = "traits_ranged_consecutive_hits_increase_power",
		buffer = "both",
		display_name = "traits_ranged_consecutive_hits_increase_power",
		icon = "ranged_consecutive_hits_increase_power",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.consecutive_shot_buff.multiplier,
			},
			{
				value_type = "duration",
				value = buff_tweak_data.consecutive_shot_buff.duration,
			},
		},
	},
	ranged_movespeed_on_damage_taken = {
		advanced_description = "description_traits_ranged_movespeed_on_damage_taken",
		buff_name = "traits_ranged_movespeed_on_damage_taken",
		display_name = "traits_ranged_movespeed_on_damage_taken",
		icon = "ranged_movespeed_on_damage_taken",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.traits_ranged_movespeed_on_damage_taken.inherited_multiplier,
			},
			{
				value_type = "duration",
				value = buff_tweak_data.traits_ranged_movespeed_on_damage_taken.inherited_duration,
			},
		},
	},
	ring_not_consume_potion = {
		advanced_description = "description_trait_ring_not_consume_potion",
		buff_name = "trait_ring_not_consume_potion",
		display_name = "trait_ring_not_consume_potion",
		icon = "charm_not_consume_potion",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.trait_ring_not_consume_potion.proc_chance,
			},
		},
	},
	ring_potion_spread = {
		advanced_description = "description_trait_ring_potion_spread",
		buff_name = "trait_ring_potion_spread",
		buffer = "both",
		display_name = "trait_ring_potion_spread",
		icon = "charm_potion_spread",
	},
	ring_not_consume_potion_damage = {
		advanced_description = "description_trait_ring_not_consume_potion_damage",
		buff_name = "trait_ring_not_consume_potion_damage",
		display_name = "trait_ring_not_consume_potion_damage",
		icon = "charm_not_consume_potion_damage",
	},
	ring_all_potions = {
		advanced_description = "description_trait_ring_all_potions",
		buff_name = "trait_ring_all_potions",
		display_name = "trait_ring_all_potions",
		icon = "charm_all_potions",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.trait_ring_all_potions.multiplier,
			},
		},
	},
	ring_potion_duration = {
		advanced_description = "description_trait_ring_potion_duration",
		buff_name = "trait_ring_potion_duration",
		display_name = "trait_ring_potion_duration",
		icon = "charm_potion_duration_increased",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.trait_ring_potion_duration.multiplier,
			},
		},
	},
	necklace_not_consume_healing = {
		advanced_description = "description_trait_necklace_not_consume_healing",
		buff_name = "trait_necklace_not_consume_healing",
		display_name = "trait_necklace_not_consume_healing",
		icon = "necklace_not_consume_healing",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.trait_necklace_not_consume_healing.proc_chance,
			},
		},
	},
	necklace_heal_self_on_heal_other = {
		advanced_description = "conqueror_desc_3",
		buff_name = "trait_necklace_heal_share",
		buffer = "server",
		display_name = "trait_necklace_heal_self_on_heal_other",
		icon = "necklace_heal_self_on_heal_other",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.trait_necklace_heal_share.multiplier,
			},
		},
	},
	necklace_increased_healing_received = {
		advanced_description = "description_trait_necklace_increased_healing_received",
		buff_name = "trait_necklace_increased_healing_received",
		buffer = "server",
		display_name = "trait_necklace_increased_healing_received",
		icon = "necklace_increased_healing_received",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.trait_necklace_increased_healing_received.multiplier,
			},
		},
	},
	necklace_no_healing_health_regen = {
		advanced_description = "description_trait_necklace_no_healing_health_regen_2",
		buff_name = "trait_necklace_no_healing_health_regen",
		buffer = "both",
		display_name = "trait_necklace_no_healing_health_regen",
		icon = "necklace_no_healing_health_regen",
		description_values = {
			{
				value = buff_tweak_data.trait_necklace_no_healing_health_regen.heal_amount,
			},
			{
				value = buff_tweak_data.trait_necklace_no_healing_health_regen.time_between_heals,
			},
		},
	},
	necklace_damage_taken_reduction_on_heal = {
		advanced_description = "description_trait_necklace_damage_taken_reduction_on_heal_2",
		buff_name = "trait_necklace_damage_taken_reduction_on_heal",
		buffer = "server",
		display_name = "trait_necklace_damage_taken_reduction_on_heal",
		icon = "necklace_damage_taken_reduction_on_heal",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.trait_necklace_damage_taken_reduction_buff.multiplier,
			},
			{
				value_type = "duration",
				value = buff_tweak_data.trait_necklace_damage_taken_reduction_buff.duration,
			},
			{
				value_type = "duration",
				value = buff_tweak_data.trait_necklace_damage_taken_reduction_buff.duration,
			},
		},
	},
	trinket_not_consume_grenade = {
		advanced_description = "description_trait_trinket_not_consume_grenade",
		buff_name = "trait_trinket_not_consume_grenade",
		display_name = "trait_trinket_not_consume_grenade",
		icon = "trait_trinket_not_consume_grenade",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.trait_trinket_not_consume_grenade.proc_chance,
			},
		},
	},
	trinket_increase_grenade_radius = {
		advanced_description = "description_trait_trinket_increase_grenade_radius",
		buff_name = "trait_trinket_increase_grenade_radius",
		buffer = "both",
		display_name = "trait_trinket_increase_grenade_radius",
		icon = "trinket_increase_grenade_radius",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.trait_trinket_increase_grenade_radius.multiplier,
			},
		},
	},
	trinket_grenade_damage_taken = {
		advanced_description = "description_trait_trinket_grenade_damage_taken",
		buff_name = "trait_trinket_grenade_damage_taken",
		buffer = "server",
		display_name = "trait_trinket_grenade_damage_taken",
		icon = "trinket_reduce_radius_by_50_increase_power_by_50",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.trait_trinket_grenade_damage_taken_buff.multiplier,
			},
			{
				value_type = "duration",
				value = buff_tweak_data.trait_trinket_grenade_damage_taken_buff.duration,
			},
		},
	},
}

for name, data in pairs(WeaponTraits.traits) do
	data.name = name
end

WeaponTraits.combinations = {
	melee = {
		{
			"melee_attack_speed_on_crit",
		},
		{
			"melee_timed_block_cost",
		},
		{
			"melee_counter_push_power",
		},
		{
			"melee_increase_damage_on_block",
		},
		{
			"melee_reduce_cooldown_on_crit",
		},
		{
			"melee_shield_on_assist",
		},
	},
	ranged_ammo = {
		{
			"ranged_restore_stamina_headshot",
		},
		{
			"ranged_replenish_ammo_headshot",
		},
		{
			"ranged_reduce_cooldown_on_crit",
		},
		{
			"ranged_replenish_ammo_on_crit",
		},
		{
			"ranged_increase_power_level_vs_armour_crit",
		},
		{
			"ranged_consecutive_hits_increase_power",
		},
	},
	ranged_heat = {
		{
			"ranged_restore_stamina_headshot",
		},
		{
			"ranged_reduced_overcharge",
		},
		{
			"ranged_reduce_cooldown_on_crit",
		},
		{
			"ranged_remove_overcharge_on_crit",
		},
		{
			"ranged_increase_power_level_vs_armour_crit",
		},
		{
			"ranged_consecutive_hits_increase_power",
		},
	},
	offence_accessory = {
		{
			"ring_not_consume_potion",
		},
		{
			"ring_potion_spread",
		},
		{
			"ring_all_potions",
		},
		{
			"ring_potion_duration",
		},
	},
	defence_accessory = {
		{
			"necklace_not_consume_healing",
		},
		{
			"necklace_heal_self_on_heal_other",
		},
		{
			"necklace_increased_healing_received",
		},
		{
			"necklace_no_healing_health_regen",
		},
		{
			"necklace_damage_taken_reduction_on_heal",
		},
	},
	utility_accessory = {
		{
			"trinket_not_consume_grenade",
		},
		{
			"trinket_increase_grenade_radius",
		},
		{
			"trinket_grenade_damage_taken",
		},
	},
	trollhammer_torpedo = {
		{
			"ranged_restore_stamina_headshot",
		},
		{
			"ranged_reduce_cooldown_on_crit",
		},
		{
			"ranged_increase_power_level_vs_armour_crit",
		},
		{
			"ranged_consecutive_hits_increase_power",
		},
		{
			"melee_timed_block_cost",
		},
		{
			"melee_increase_damage_on_block",
		},
	},
}

BuffUtils.copy_talent_buff_names(WeaponTraits.buff_templates)
BuffUtils.apply_buff_tweak_data(WeaponTraits.buff_templates, buff_tweak_data)
DLCUtils.require_list("weapon_traits_file_names")
