local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")

require("scripts/settings/dlcs/morris/tweak_data/buff_tweak_data")

local morris_weapon_traits = {}
local buff_tweak_data = {
	armor_breaker_on_armored_kill = {
		trigger_on_breed = {
			chaos_warrior = true,
			skaven_ratling_gunner = true,
			skaven_storm_vermin_with_shield = true,
			beastmen_bestigor = true,
			beastmen_standard_bearer = true,
			skaven_warpfire_thrower = true,
			skaven_storm_vermin_commander = true,
			skaven_storm_vermin = true,
			skaven_storm_vermin_champion = true
		}
	},
	armor_breaker = {
		max_stacks = 1,
		duration = 16,
		default_power_level = 40
	},
	shield_of_isha = {
		value = 20
	},
	bloodthirst = {
		reset_after_time = 30,
		buff_name_to_add = "bloodthirst_attack_speed",
		kills_needed = 5
	},
	bloodthirst_attack_speed = {
		max_stacks = 5,
		multiplier = 0.02
	},
	headhunter = {
		buff_name_to_add = "headhunter_damage",
		remove_amount = 1,
		valid_hit_zones = {
			head = true,
			weakspot = true
		},
		ignore_hit_zones = {
			afro = true
		}
	},
	headhunter_damage = {
		max_stacks = 20,
		multiplier = 0.1
	}
}
morris_weapon_traits.buff_templates = {
	stagger_aoe_on_crit = {
		buffs = {
			{
				explosion_template = "stagger_aoe_on_crit",
				name = "stagger_aoe_on_crit",
				buff_func = "stagger_aoe_on_hit",
				event = "on_critical_hit",
				icon = "bardin_ironbreaker_gromril_armour"
			}
		}
	},
	armor_breaker_on_armored_kill = {
		buffs = {
			{
				event = "on_kill",
				name = "armor_breaker_on_armored_kill",
				buff_func = "armor_breaker_on_armored_kill"
			}
		}
	},
	armor_breaker = {
		buffs = {
			{
				activation_effect = "fx/screenspace_potion_01",
				name = "armor_breaker",
				remove_buff_func = "remove_armor_breaker",
				icon = "teammate_consumable_icon_defence",
				refresh_durations = true,
				update_func = "update_armor_breaker",
				apply_buff_func = "start_armor_breaker"
			}
		}
	},
	shield_of_isha = {
		buffs = {
			{
				name = "shield_of_isha",
				stat_buff = "max_damage_taken",
				value = buff_tweak_data.shield_of_isha.value
			}
		}
	},
	bloodthirst = {
		buffs = {
			{
				update_func = "update_bloodthirst",
				name = "bloodthirst",
				buff_func = "bloodthirst_on_kill",
				event = "on_kill",
				remove_buff_func = "remove_bloodthirst",
				apply_buff_func = "start_bloodthirst"
			}
		}
	},
	bloodthirst_attack_speed = {
		buffs = {
			{
				stat_buff = "attack_speed",
				name = "bloodthirst_attack_speed"
			}
		}
	},
	headhunter = {
		buffs = {
			{
				name = "headhunter",
				buff_func = "headhunter_on_damage_dealt",
				event = "on_damage_dealt",
				remove_buff_func = "remove_headhunter",
				apply_buff_func = "start_headhunter"
			}
		}
	},
	headhunter_damage = {
		buffs = {
			{
				stat_buff = "damage_dealt",
				name = "headhunter_damage"
			}
		}
	}
}
morris_weapon_traits.traits = {
	stagger_aoe_on_crit = {
		display_name = "traits_stagger_aoe_on_crit",
		buffer = "server",
		advanced_description = "description_stagger_aoe_on_crit",
		icon = "bardin_ironbreaker_gromril_armour",
		buff_name = "stagger_aoe_on_crit",
		description_values = {
			{
				value = ExplosionTemplates.stagger_aoe_on_crit.radius
			}
		}
	},
	armor_breaker = {
		display_name = "traits_armor_breaker",
		buffer = "server",
		advanced_description = "description_armor_breaker",
		icon = "bardin_ironbreaker_gromril_armour",
		buff_name = "armor_breaker_on_armored_kill",
		description_values = {
			{
				value = ExplosionTemplates.armor_breaker.radius
			}
		}
	},
	shield_of_isha = {
		display_name = "traits_shield_of_isha",
		advanced_description = "description_shield_of_isha",
		icon = "bardin_ironbreaker_gromril_armour",
		buff_name = "shield_of_isha",
		description_values = {
			{
				value = buff_tweak_data.shield_of_isha.value
			}
		}
	},
	bloodthirst = {
		display_name = "traits_bloodthirst",
		advanced_description = "description_bloodthirst",
		icon = "bardin_ironbreaker_gromril_armour",
		buff_name = "bloodthirst",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bloodthirst_attack_speed.multiplier
			},
			{
				value_type = "bonus",
				value = buff_tweak_data.bloodthirst.kills_needed
			},
			{
				value_type = "bonus",
				value = buff_tweak_data.bloodthirst_attack_speed.max_stacks
			},
			{
				value_type = "duration",
				value = buff_tweak_data.bloodthirst.reset_after_time
			}
		}
	},
	headhunter = {
		display_name = "traits_headhunter",
		buffer = "server",
		advanced_description = "description_headhunter",
		icon = "bardin_ironbreaker_gromril_armour",
		buff_name = "headhunter",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.headhunter_damage.multiplier
			},
			{
				value_type = "bonus",
				value = buff_tweak_data.headhunter_damage.max_stacks
			},
			{
				value_type = "bonus",
				value = buff_tweak_data.headhunter.remove_amount
			}
		}
	}
}

for name, data in pairs(morris_weapon_traits.traits) do
	data.name = name
end

morris_weapon_traits.combinations = {
	deus_melee = {
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
		},
		{
			"armor_breaker"
		},
		{
			"bloodthirst"
		},
		{
			"headhunter"
		}
	},
	deus_shield_melee = {
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
		},
		{
			"armor_breaker"
		},
		{
			"bloodthirst"
		},
		{
			"headhunter"
		},
		{
			"shield_of_isha"
		},
		{
			"melee_increase_damage_on_block"
		},
		{
			"melee_timed_block_cost"
		}
	},
	deus_heavy_melee = {
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
		},
		{
			"armor_breaker"
		},
		{
			"bloodthirst"
		},
		{
			"headhunter"
		},
		{
			"stagger_aoe_on_crit"
		}
	},
	deus_ranged = {
		{
			"ranged_restore_stamina_headshot"
		},
		{
			"ranged_reduce_cooldown_on_crit"
		},
		{
			"ranged_increase_power_level_vs_armour_crit"
		},
		{
			"ranged_consecutive_hits_increase_power"
		},
		{
			"headhunter"
		},
		{
			"stagger_aoe_on_crit"
		}
	},
	deus_ranged_ammo = {
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
			"headhunter"
		},
		{
			"stagger_aoe_on_crit"
		}
	},
	deus_ranged_heat = {
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
			"headhunter"
		},
		{
			"stagger_aoe_on_crit"
		}
	},
	ranged_energy = {
		{
			"ranged_restore_stamina_headshot"
		},
		{
			"ranged_reduce_cooldown_on_crit"
		},
		{
			"ranged_increase_power_level_vs_armour_crit"
		},
		{
			"ranged_consecutive_hits_increase_power"
		}
	},
	deus_ranged_energy = {
		{
			"ranged_restore_stamina_headshot"
		},
		{
			"ranged_reduce_cooldown_on_crit"
		},
		{
			"ranged_increase_power_level_vs_armour_crit"
		},
		{
			"ranged_consecutive_hits_increase_power"
		}
	}
}

BuffUtils.copy_talent_buff_names(morris_weapon_traits.buff_templates)
BuffUtils.apply_buff_tweak_data(morris_weapon_traits.buff_templates, buff_tweak_data)

for key, value in pairs(morris_weapon_traits.buff_templates) do
	fassert(not WeaponTraits.buff_templates[key], "duplicate buff_template found between WeaponTraits.buff_templates and buff_templates added by morris dlc")

	WeaponTraits.buff_templates[key] = value
end

for key, value in pairs(morris_weapon_traits.traits) do
	fassert(not WeaponTraits.traits[key], "duplicate traits found between WeaponTraits.traits and traits added by morris dlc")

	WeaponTraits.traits[key] = value
end

for key, value in pairs(morris_weapon_traits.combinations) do
	fassert(not WeaponTraits.combinations[key], "duplicate combinations found between WeaponTraits.combinations and combinations added by morris dlc")

	WeaponTraits.combinations[key] = value
end

return
