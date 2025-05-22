-- chunkname: @scripts/settings/equipment/weave_traits.lua

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")

WeaveTraits = WeaveTraits or {}

local buff_tweak_data = {
	weave_traits_melee_attack_speed_on_crit_proc = {
		duration = 5,
		multiplier = 0.2,
	},
	weave_traits_melee_timed_block_cost = {
		multiplier = -1,
	},
	weave_traits_melee_counter_push_power = {
		multiplier = 0.5,
	},
	weave_traits_melee_increase_damage_on_block_proc = {
		duration = 5,
		multiplier = 0.2,
	},
	weave_traits_melee_shield_on_assist = {
		bonus = 15,
	},
	weave_traits_ranged_replenish_ammo_headshot = {
		bonus = 1,
	},
	weave_traits_ranged_reduced_overcharge = {
		multiplier = -0.2,
	},
	weave_traits_ranged_movespeed_on_damage_taken = {
		inherited_duration = 3,
		inherited_multiplier = 1.5,
	},
	weave_traits_ranged_replenish_ammo_on_crit = {
		ammo_bonus_fraction = 0.05,
	},
	weave_traits_ranged_remove_overcharge_on_crit = {
		bonus = 0,
	},
	weave_consecutive_shot_buff = {
		duration = 5,
		multiplier = 0.05,
	},
	weave_traits_reduce_cooldown_on_crit = {
		bonus = 0.05,
	},
	weave_traits_reduce_cooldown_on_crit_internal_cooldown = {
		duration = 4,
	},
	weave_traits_heal_on_crit = {
		bonus = 5,
	},
	weave_ranged_power_vs_unarmored = {
		multiplier = 0.25,
	},
	weave_ranged_power_vs_armored = {
		multiplier = 0.25,
	},
	weave_ranged_power_vs_large = {
		multiplier = 0.25,
	},
	weave_ranged_power_vs_frenzy = {
		multiplier = 0.25,
	},
	weave_trait_ring_not_consume_potion = {
		proc_chance = 0.25,
	},
	weave_trait_ring_potion_spread = {
		distance = 10,
	},
	weave_trait_ring_not_consume_potion_damage = {
		proc_chance = 1,
	},
	weave_trait_ring_all_potions = {
		multiplier = -0.5,
	},
	weave_trait_ring_potion_duration = {
		multiplier = 0.5,
	},
	weave_trait_necklace_not_consume_healing = {
		proc_chance = 0.25,
	},
	weave_trait_necklace_heal_self_on_heal_other = {
		multiplier = 0.5,
	},
	weave_trait_necklace_heal_share = {
		multiplier = 0.2,
	},
	weave_trait_necklace_increased_healing_received = {
		multiplier = 0.3,
	},
	weave_trait_necklace_damage_taken_reduction_buff = {
		duration = 2,
		multiplier = -0.4,
	},
	weave_trait_necklace_no_healing_health_regen = {
		heal_amount = 1,
		time_between_heals = 5,
	},
	weave_trait_trinket_not_consume_grenade = {
		proc_chance = 0.25,
	},
	weave_trait_trinket_increase_grenade_radius = {
		multiplier = 0.5,
	},
	weave_trait_trinket_grenade_damage_taken_buff = {
		duration = 10,
		multiplier = 0.2,
	},
}

WeaveTraits.buff_templates = {
	weave_traits_melee_attack_speed_on_crit_proc = {
		buffs = {
			{
				icon = "melee_attack_speed_on_crit",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
		},
	},
	weave_traits_melee_attack_speed_on_crit = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "weave_traits_melee_attack_speed_on_crit_proc",
				event = "on_critical_hit",
			},
		},
	},
	weave_traits_melee_timed_block_cost = {
		buffs = {
			{
				stat_buff = "timed_block_cost",
			},
		},
	},
	weave_traits_melee_counter_push_power = {
		buffs = {
			{
				stat_buff = "counter_push_power",
			},
		},
	},
	weave_traits_melee_increase_damage_on_block = {
		buffs = {
			{
				buff_func = "block_increase_enemy_damage_taken",
				event = "on_block",
			},
		},
	},
	weave_traits_melee_increase_damage_on_block_proc = {
		buffs = {
			{
				refresh_durations = true,
				stat_buff = "damage_taken",
			},
		},
	},
	weave_traits_melee_shield_on_assist = {
		buffs = {
			{
				buff_func = "heal_assisted_and_self_on_assist",
				event = "on_assisted_ally",
			},
		},
	},
	weave_traits_ranged_replenish_ammo_headshot = {
		buffs = {
			{
				buff_func = "replenish_ammo_on_headshot_ranged",
				event = "on_hit",
			},
		},
	},
	weave_traits_ranged_restore_stamina_headshot = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "coop_stamina",
			},
		},
	},
	weave_traits_ranged_movespeed_on_damage_taken = {
		buffs = {
			{
				buff_func = "increased_movement_speed",
				event = "on_damage_taken",
			},
		},
	},
	weave_traits_ranged_reduced_overcharge = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "reduced_overcharge",
			},
		},
	},
	weave_traits_ranged_replenish_ammo_on_crit = {
		buffs = {
			{
				buff_func = "ammo_fraction_gain_on_crit_trait",
				event = "on_critical_hit",
			},
		},
	},
	weave_traits_ranged_remove_overcharge_on_crit = {
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
	weave_traits_ranged_consecutive_hits_increase_power = {
		buffs = {
			{
				buff_func = "buff_consecutive_shots_damage",
				event = "on_hit",
			},
		},
	},
	weave_consecutive_shot_debuff = {
		buffs = {
			{
				duration = 10,
				max_stacks = 1,
				refresh_durations = true,
			},
		},
	},
	weave_consecutive_shot_buff = {
		buffs = {
			{
				icon = "ranged_consecutive_hits_increase_power",
				max_stacks = 5,
				refresh_durations = true,
				stat_buff = "power_level",
			},
		},
	},
	weave_traits_ranged_increase_power_level_vs_armour_crit = {
		buffs = {
			{
				buff_func = "ranged_crits_increase_dmg_vs_armour_type",
				event = "on_critical_hit",
			},
		},
	},
	weave_ranged_power_vs_unarmored = {
		buffs = {
			{
				duration = 10,
				icon = "ranged_increase_power_level_vs_armour_crit",
				max_stacks = 1,
				stat_buff = "power_level_unarmoured",
			},
		},
	},
	weave_ranged_power_vs_armored = {
		buffs = {
			{
				duration = 10,
				icon = "ranged_increase_power_level_vs_armour_crit",
				max_stacks = 1,
				stat_buff = "power_level_armoured",
			},
		},
	},
	weave_ranged_power_vs_large = {
		buffs = {
			{
				duration = 10,
				icon = "ranged_increase_power_level_vs_armour_crit",
				max_stacks = 1,
				stat_buff = "power_level_large",
			},
		},
	},
	weave_ranged_power_vs_frenzy = {
		buffs = {
			{
				duration = 10,
				icon = "ranged_increase_power_level_vs_armour_crit",
				max_stacks = 1,
				stat_buff = "power_level_frenzy",
			},
		},
	},
	weave_traits_reduce_cooldown_on_crit = {
		buffs = {
			{
				bonus = 1,
				buff_func = "reduce_activated_ability_cooldown_with_internal_cooldown_on_crit",
				buff_to_add = "weave_traits_reduce_cooldown_on_crit_internal_cooldown",
				event = "on_critical_hit",
			},
		},
	},
	weave_traits_reduce_cooldown_on_crit_internal_cooldown = {
		buffs = {
			{
				perks = {
					buff_perks.cooldown_delay,
				},
			},
		},
	},
	weave_traits_heal_on_crit = {
		buffs = {
			{
				bonus = 5,
				buff_func = "heal",
				event = "on_critical_hit",
			},
		},
	},
	weave_trait_ring_not_consume_potion = {
		buffs = {
			{
				stat_buff = "not_consume_potion",
			},
		},
	},
	weave_trait_ring_potion_spread = {
		buffs = {
			{},
		},
	},
	weave_trait_ring_not_consume_potion_damage = {
		buffs = {
			{
				stat_buff = "not_consume_potion",
			},
		},
	},
	weave_trait_ring_all_potions = {
		buffs = {
			{
				stat_buff = "potion_duration",
			},
		},
	},
	weave_trait_ring_potion_duration = {
		buffs = {
			{
				perks = {
					buff_perks.potion_duration,
				},
			},
		},
	},
	weave_trait_necklace_not_consume_healing = {
		buffs = {
			{
				stat_buff = "not_consume_medpack",
			},
		},
	},
	weave_trait_necklace_heal_self_on_heal_other = {
		buffs = {
			{
				stat_buff = "heal_self_on_heal_other",
			},
		},
	},
	weave_trait_necklace_heal_share = {
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
	weave_trait_necklace_increased_healing_received = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "healing_received",
			},
		},
	},
	weave_trait_necklace_no_healing_health_regen = {
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
	weave_trait_necklace_damage_taken_reduction_on_heal = {
		buffs = {
			{
				buff_func = "buff_defence_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	weave_trait_necklace_damage_taken_reduction_buff = {
		buffs = {
			{
				icon = "necklace_damage_taken_reduction_on_heal",
				max_stacks = 1,
				stat_buff = "damage_taken",
			},
		},
	},
	weave_trait_trinket_not_consume_grenade = {
		buffs = {
			{
				stat_buff = "not_consume_grenade",
			},
		},
	},
	weave_trait_trinket_increase_grenade_radius = {
		buffs = {
			{
				stat_buff = "grenade_radius",
			},
		},
	},
	weave_trait_trinket_grenade_damage_taken = {
		buffs = {
			{
				buff_func = "debuff_defence_grenade_hit",
				event = "on_hit",
			},
		},
	},
	weave_trait_trinket_grenade_damage_taken_buff = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "damage_taken",
			},
		},
	},
}
WeaveTraits.traits = {
	weave_melee_attack_speed_on_crit = {
		advanced_description = "description_traits_melee_attack_speed_on_crit",
		buff_name = "weave_traits_melee_attack_speed_on_crit",
		display_name = "traits_melee_attack_speed_on_crit",
		icon = "melee_attack_speed_on_crit",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_traits_melee_attack_speed_on_crit_proc.multiplier,
			},
			{
				value = buff_tweak_data.weave_traits_melee_attack_speed_on_crit_proc.duration,
			},
		},
	},
	weave_melee_timed_block_cost = {
		advanced_description = "description_traits_melee_timed_block_cost",
		buff_name = "weave_traits_melee_timed_block_cost",
		display_name = "traits_melee_timed_block_cost",
		icon = "melee_timed_block_cost",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_traits_melee_timed_block_cost.multiplier,
			},
		},
	},
	weave_melee_counter_push_power = {
		advanced_description = "description_traits_melee_counter_push_power",
		buff_name = "weave_traits_melee_counter_push_power",
		buffer = "both",
		display_name = "traits_melee_counter_push_power",
		icon = "melee_counter_push_power",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_traits_melee_counter_push_power.multiplier,
			},
		},
	},
	weave_melee_reduce_cooldown_on_crit = {
		advanced_description = "description_traits_melee_reduce_cooldown_on_crit_2",
		buff_name = "weave_traits_reduce_cooldown_on_crit",
		display_name = "traits_melee_reduce_cooldown_on_crit",
		icon = "melee_reduce_cooldown_on_crit",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_traits_reduce_cooldown_on_crit.bonus,
			},
			{
				value_type = "duration",
				value = buff_tweak_data.weave_traits_reduce_cooldown_on_crit_internal_cooldown.duration,
			},
		},
	},
	weave_melee_increase_damage_on_block = {
		advanced_description = "description_traits_melee_increase_damage_on_block",
		buff_name = "weave_traits_melee_increase_damage_on_block",
		buffer = "server",
		display_name = "traits_melee_increase_damage_on_block",
		icon = "melee_increase_damage_on_block",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_traits_melee_increase_damage_on_block_proc.multiplier,
			},
			{
				value_type = "duration",
				value = buff_tweak_data.weave_traits_melee_increase_damage_on_block_proc.duration,
			},
		},
	},
	weave_melee_shield_on_assist = {
		advanced_description = "description_traits_melee_shield_on_assist",
		buff_name = "weave_traits_melee_shield_on_assist",
		buffer = "server",
		display_name = "traits_melee_shield_on_assist",
		icon = "melee_shield_on_assist",
		description_values = {
			{
				value_type = "bonus",
				value = buff_tweak_data.weave_traits_melee_shield_on_assist.bonus,
			},
		},
	},
	weave_ranged_replenish_ammo_headshot = {
		advanced_description = "description_traits_ranged_replenish_ammo_headshot",
		buff_name = "weave_traits_ranged_replenish_ammo_headshot",
		display_name = "traits_ranged_replenish_ammo_headshot",
		icon = "ranged_replenish_ammo_headshot",
		description_values = {
			{
				value_type = "bonus",
				value = buff_tweak_data.weave_traits_ranged_replenish_ammo_headshot.bonus,
			},
		},
	},
	weave_ranged_restore_stamina_headshot = {
		advanced_description = "description_traits_ranged_restore_stamina_headshot",
		buff_name = "weave_traits_ranged_restore_stamina_headshot",
		buffer = "both",
		display_name = "traits_ranged_restore_stamina_headshot",
		icon = "ranged_restore_stamina_headshot",
	},
	weave_ranged_reduced_overcharge = {
		advanced_description = "description_traits_ranged_reduced_overcharge",
		buff_name = "weave_traits_ranged_reduced_overcharge",
		display_name = "traits_ranged_reduced_overcharge",
		icon = "ranged_reduced_overcharge",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_traits_ranged_reduced_overcharge.multiplier,
			},
		},
	},
	weave_ranged_reduce_cooldown_on_crit = {
		advanced_description = "description_traits_ranged_reduce_cooldown_on_crit_2",
		buff_name = "weave_traits_reduce_cooldown_on_crit",
		display_name = "traits_ranged_reduce_cooldown_on_crit",
		icon = "ranged_reduce_cooldown_on_crit",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_traits_reduce_cooldown_on_crit.bonus,
			},
			{
				value_type = "bonus",
				value = buff_tweak_data.weave_traits_reduce_cooldown_on_crit_internal_cooldown.duration,
			},
		},
	},
	weave_ranged_replenish_ammo_on_crit = {
		advanced_description = "description_traits_ranged_replenish_ammo_on_crit_2",
		buff_name = "weave_traits_ranged_replenish_ammo_on_crit",
		display_name = "traits_ranged_replenish_ammo_on_crit",
		icon = "ranged_replenish_ammo_on_crit",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_traits_ranged_replenish_ammo_on_crit.ammo_bonus_fraction,
			},
		},
	},
	weave_ranged_remove_overcharge_on_crit = {
		advanced_description = "description_traits_ranged_remove_overcharge_on_crit_2",
		buff_name = "weave_traits_ranged_remove_overcharge_on_crit",
		display_name = "traits_ranged_remove_overcharge_on_crit",
		icon = "ranged_remove_overcharge_on_crit",
		description_values = {},
	},
	weave_ranged_increase_power_level_vs_armour_crit = {
		advanced_description = "description_traits_ranged_increase_power_level_vs_armour_crit",
		buff_name = "weave_traits_ranged_increase_power_level_vs_armour_crit",
		buffer = "both",
		display_name = "traits_ranged_increase_power_level_vs_armour_crit",
		icon = "ranged_increase_power_level_vs_armour_crit",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_ranged_power_vs_unarmored.multiplier,
			},
		},
	},
	weave_ranged_consecutive_hits_increase_power = {
		advanced_description = "description_traits_ranged_consecutive_hits_increase_power",
		buff_name = "weave_traits_ranged_consecutive_hits_increase_power",
		buffer = "both",
		display_name = "traits_ranged_consecutive_hits_increase_power",
		icon = "ranged_consecutive_hits_increase_power",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_consecutive_shot_buff.multiplier,
			},
			{
				value_type = "duration",
				value = buff_tweak_data.weave_consecutive_shot_buff.duration,
			},
		},
	},
	weave_ring_not_consume_potion = {
		advanced_description = "description_trait_ring_not_consume_potion",
		buff_name = "weave_trait_ring_not_consume_potion",
		display_name = "trait_ring_not_consume_potion",
		icon = "charm_not_consume_potion",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_trait_ring_not_consume_potion.proc_chance,
			},
		},
	},
	weave_ring_potion_spread = {
		advanced_description = "description_trait_ring_potion_spread",
		buff_name = "weave_trait_ring_potion_spread",
		buffer = "both",
		display_name = "trait_ring_potion_spread",
		icon = "charm_potion_spread",
	},
	weave_ring_all_potions = {
		advanced_description = "description_trait_ring_all_potions",
		buff_name = "weave_trait_ring_all_potions",
		display_name = "trait_ring_all_potions",
		icon = "charm_all_potions",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_trait_ring_all_potions.multiplier,
			},
		},
	},
	weave_ring_potion_duration = {
		advanced_description = "description_trait_ring_potion_duration",
		buff_name = "weave_trait_ring_potion_duration",
		display_name = "trait_ring_potion_duration",
		icon = "charm_potion_duration_increased",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_trait_ring_potion_duration.multiplier,
			},
		},
	},
	weave_necklace_not_consume_healing = {
		advanced_description = "description_trait_necklace_not_consume_healing",
		buff_name = "weave_trait_necklace_not_consume_healing",
		display_name = "trait_necklace_not_consume_healing",
		icon = "necklace_not_consume_healing",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_trait_necklace_not_consume_healing.proc_chance,
			},
		},
	},
	weave_necklace_heal_self_on_heal_other = {
		advanced_description = "conqueror_desc_3",
		buff_name = "weave_trait_necklace_heal_share",
		buffer = "server",
		display_name = "trait_necklace_heal_self_on_heal_other",
		icon = "necklace_heal_self_on_heal_other",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_trait_necklace_heal_share.multiplier,
			},
		},
	},
	weave_necklace_increased_healing_received = {
		advanced_description = "description_trait_necklace_increased_healing_received",
		buff_name = "weave_trait_necklace_increased_healing_received",
		buffer = "server",
		display_name = "trait_necklace_increased_healing_received",
		icon = "necklace_increased_healing_received",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_trait_necklace_increased_healing_received.multiplier,
			},
		},
	},
	weave_necklace_no_healing_health_regen = {
		advanced_description = "description_trait_necklace_no_healing_health_regen_2",
		buff_name = "weave_trait_necklace_no_healing_health_regen",
		buffer = "both",
		display_name = "trait_necklace_no_healing_health_regen",
		icon = "necklace_no_healing_health_regen",
		description_values = {
			{
				value = buff_tweak_data.weave_trait_necklace_no_healing_health_regen.heal_amount,
			},
			{
				value = buff_tweak_data.weave_trait_necklace_no_healing_health_regen.time_between_heals,
			},
		},
	},
	weave_necklace_damage_taken_reduction_on_heal = {
		advanced_description = "description_trait_necklace_damage_taken_reduction_on_heal_2",
		buff_name = "weave_trait_necklace_damage_taken_reduction_on_heal",
		buffer = "server",
		display_name = "trait_necklace_damage_taken_reduction_on_heal",
		icon = "necklace_damage_taken_reduction_on_heal",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_trait_necklace_damage_taken_reduction_buff.multiplier,
			},
			{
				value_type = "duration",
				value = buff_tweak_data.weave_trait_necklace_damage_taken_reduction_buff.duration,
			},
			{
				value_type = "duration",
				value = buff_tweak_data.weave_trait_necklace_damage_taken_reduction_buff.duration,
			},
		},
	},
	weave_trinket_not_consume_grenade = {
		advanced_description = "description_trait_trinket_not_consume_grenade",
		buff_name = "weave_trait_trinket_not_consume_grenade",
		display_name = "trait_trinket_not_consume_grenade",
		icon = "trait_trinket_not_consume_grenade",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_trait_trinket_not_consume_grenade.proc_chance,
			},
		},
	},
	weave_trinket_increase_grenade_radius = {
		advanced_description = "description_trait_trinket_increase_grenade_radius",
		buff_name = "weave_trait_trinket_increase_grenade_radius",
		display_name = "trait_trinket_increase_grenade_radius",
		icon = "trinket_increase_grenade_radius",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_trait_trinket_increase_grenade_radius.multiplier,
			},
		},
	},
	weave_trinket_grenade_damage_taken = {
		advanced_description = "description_trait_trinket_grenade_damage_taken",
		buff_name = "weave_trait_trinket_grenade_damage_taken",
		buffer = "server",
		display_name = "trait_trinket_grenade_damage_taken",
		icon = "trinket_reduce_radius_by_50_increase_power_by_50",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_trait_trinket_grenade_damage_taken_buff.multiplier,
			},
			{
				value_type = "duration",
				value = buff_tweak_data.weave_trait_trinket_grenade_damage_taken_buff.duration,
			},
		},
	},
}

for name, data in pairs(WeaveTraits.traits) do
	data.name = name
end

BuffUtils.copy_talent_buff_names(WeaveTraits.buff_templates)
BuffUtils.apply_buff_tweak_data(WeaveTraits.buff_templates, buff_tweak_data)

WeaveTraits.categories = {
	melee = {
		"weave_melee_attack_speed_on_crit",
		"weave_melee_timed_block_cost",
		"weave_melee_counter_push_power",
		"weave_melee_increase_damage_on_block",
		"weave_melee_reduce_cooldown_on_crit",
		"weave_melee_shield_on_assist",
	},
	ranged_ammo = {
		"weave_ranged_restore_stamina_headshot",
		"weave_ranged_replenish_ammo_headshot",
		"weave_ranged_reduce_cooldown_on_crit",
		"weave_ranged_replenish_ammo_on_crit",
		"weave_ranged_increase_power_level_vs_armour_crit",
		"weave_ranged_consecutive_hits_increase_power",
	},
	ranged_heat = {
		"weave_ranged_restore_stamina_headshot",
		"weave_ranged_reduced_overcharge",
		"weave_ranged_reduce_cooldown_on_crit",
		"weave_ranged_remove_overcharge_on_crit",
		"weave_ranged_increase_power_level_vs_armour_crit",
		"weave_ranged_consecutive_hits_increase_power",
	},
	offence_accessory = {
		"weave_ring_not_consume_potion",
		"weave_ring_potion_spread",
		"weave_ring_all_potions",
		"weave_ring_potion_duration",
	},
	defence_accessory = {
		"weave_necklace_not_consume_healing",
		"weave_necklace_heal_self_on_heal_other",
		"weave_necklace_increased_healing_received",
		"weave_necklace_no_healing_health_regen",
		"weave_necklace_damage_taken_reduction_on_heal",
	},
	utility_accessory = {
		"weave_trinket_not_consume_grenade",
		"weave_trinket_increase_grenade_radius",
		"weave_trinket_grenade_damage_taken",
	},
}

DLCUtils.merge("weave_traits", WeaveTraits.categories)
