local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local buff_tweak_data = {
	thorn_sister_ability_cooldown_on_hit = {
		bonus = 0.3
	},
	thorn_sister_ability_cooldown_on_damage_taken = {
		bonus = 0.4
	},
	kerillian_thorn_sister_ability_on_elite_buff = {
		max_stacks = 20,
		amount_to_restore = 0.05
	},
	kerillian_thorn_sister_passive_healing_received_aura_buff = {
		multiplier = 0.25
	},
	kerillian_thorn_sister_passive_temp_health_funnel_aura_buff = {
		multiplier = 1
	},
	kerillian_power_on_health_gain_buff = {
		max_stacks = 3,
		multiplier = 0.05,
		duration = 8
	},
	kerillian_thorn_sister_attack_speed_on_full = {
		health_threshold = 0.9
	},
	kerillian_thorn_sister_attack_speed_on_full_buff = {
		multiplier = 0.15
	},
	kerillian_double_passive = {
		visualizer_max_stacks = 2
	},
	kerillian_improved_surge = {
		max_stacks = 20,
		visualizer_percent = 0.3,
		amount_to_restore_improved = 0.065
	},
	kerillian_thorn_sister_avatar = {
		max_stacks = 1
	},
	kerillian_thorn_sister_avatar_buff_1 = {
		duration = 10
	},
	kerillian_thorn_sister_reduce_passive_on_elite = {
		time_removed_per_kill = 1
	},
	kerillian_thorn_sister_big_push_buff = {
		duration = 0.2,
		bonus = 10
	},
	kerillian_thorn_sister_big_push_buff_2 = {
		duration = 0.2,
		multiplier = 1
	},
	kerillian_thorn_sister_crit_on_any_ability = {
		amount_to_add = 3
	},
	kerillian_thorn_sister_free_throw_timer = {
		duration = 8
	},
	kerillian_thorn_sister_free_throw_handler = {
		time_removed_per_kill = 0
	},
	kerillian_thorn_sister_free_throw_buff = {
		amount_to_heal = 3
	},
	kerillian_thorn_sister_tanky_wall = {
		visualizer_extra_duration = 10
	},
	kerillian_thorn_sister_debuff_wall_buff = {
		duration = 10,
		multiplier = 0.2,
		radius = 3
	}
}
local talent_buff_templates = {
	thorn_sister_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				buff_func = "reduce_activated_ability_cooldown"
			}
		}
	},
	thorn_sister_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken"
			}
		}
	},
	kerillian_thorn_sister_passive_healing_received_aura = {
		buffs = {
			{
				buff_to_add = "kerillian_thorn_sister_passive_healing_received_aura_buff",
				range = 100,
				remove_buff_func = "remove_aura_buff",
				update_func = "activate_buff_on_distance",
				perk = buff_perks.overcharge_no_slow
			}
		}
	},
	kerillian_thorn_sister_passive_healing_received_aura_buff = {
		buffs = {
			{
				stat_buff = "healing_received",
				max_stacks = 1
			}
		}
	},
	kerillian_thorn_sister_passive_temp_health_funnel_aura = {
		buffs = {
			{
				buff_to_add = "kerillian_thorn_sister_passive_temp_health_funnel_aura_buff",
				update_func = "activate_buff_on_distance",
				remove_buff_func = "remove_aura_buff",
				range = 100
			}
		}
	},
	kerillian_thorn_sister_passive_temp_health_funnel_aura_buff = {
		buffs = {
			{
				max_stacks = 1,
				name = "kerillian_thorn_sister_passive_temp_health_funnel",
				authority = "server",
				buff_func = "thorn_sister_transfer_temp_health_at_full",
				event = "on_healed"
			}
		}
	},
	kerillian_thorn_sister_damage_vs_wounded_enemies = {
		buffs = {
			{
				perk = buff_perks.missing_health_damage
			}
		}
	},
	kerillian_thorn_sister_health_on_ability = {
		buffs = {
			{
				event = "on_ability_cooldown_started",
				amount_to_convert = 0.1,
				buff_func = "kerillian_thorn_sister_health_conversion"
			}
		}
	},
	kerillian_thorn_sister_free_ability_stack = {
		buffs = {
			{
				max_stacks = 99,
				name = "kerillian_thorn_sister_free_ability_stack",
				priority_buff = true,
				icon = "kerillian_thornsister_passive"
			}
		}
	},
	kerillian_thorn_sister_free_ability_cooldown = {
		buffs = {
			{
				is_cooldown = true,
				name = "kerillian_thorn_sister_free_ability_cooldown",
				duration = 40,
				max_stacks = 1,
				icon = "kerillian_thornsister_passive"
			}
		}
	},
	kerillian_thorn_sister_attack_speed_on_full = {
		buffs = {
			{
				buff_to_add = "kerillian_thorn_sister_attack_speed_on_full_buff",
				update_func = "update_server_buff_on_health_percent",
				remove_buff_func = "remove_server_buff_on_health_percent",
				update_frequency = 0.2
			}
		}
	},
	kerillian_thorn_sister_attack_speed_on_full_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "kerillian_thornsister_attack_speed_on_full",
				stat_buff = "attack_speed"
			}
		}
	},
	kerillian_power_on_health_gain = {
		buffs = {
			{
				buff_to_add = "kerillian_power_on_health_gain_buff",
				health_threshold = 1,
				event = "on_healed",
				buff_func = "add_buff_on_proc_thorn"
			}
		}
	},
	kerillian_power_on_health_gain_buff = {
		buffs = {
			{
				refresh_durations = true,
				icon = "kerillian_thornsister_power_on_health_gain",
				stat_buff = "power_level"
			}
		}
	},
	kerillian_thorn_sister_big_bleed = {
		buffs = {
			{
				event = "on_hit",
				bleed = "thorn_sister_big_bleed",
				buff_func = "thorn_sister_add_bleed_on_hit"
			}
		}
	},
	kerillian_thorn_sister_buff_on_passive_crit = {
		buffs = {
			{
				max_stacks = 1,
				icon = "placeholder_icon",
				stat_buff = "critical_strike_chance",
				bonus = 1
			}
		}
	},
	kerillian_thorn_sister_buff_on_passive_healing = {
		buffs = {
			{
				max_stacks = 1,
				multiplier = 2,
				stat_buff = "healing_received"
			}
		}
	},
	kerillian_thorn_sister_reduce_passive_on_elite = {
		buffs = {
			{
				event = "on_elite_killed",
				buff_func = "kerillian_thorn_sister_reduce_passive_on_elite"
			}
		}
	},
	kerillian_thorn_sister_avatar_add = {
		buffs = {
			{
				event = "on_extra_ability_consumed",
				buff_to_add = "kerillian_thorn_sister_avatar",
				buff_func = "add_buff"
			}
		}
	},
	kerillian_thorn_sister_avatar = {
		buffs = {
			{
				reset_on_max_stacks = true,
				on_max_stacks_func = "kerillian_thorn_sister_avatar",
				icon = "kerillian_thornsister_avatar",
				is_cooldown = true,
				duration = math.huge,
				max_stack_data = {
					buffs_to_add = {
						"kerillian_thorn_sister_avatar_buff_1",
						"kerillian_thorn_sister_avatar_buff_2",
						"kerillian_thorn_sister_avatar_buff_3",
						"kerillian_thorn_sister_avatar_buff_4"
					}
				}
			}
		}
	},
	kerillian_thorn_sister_avatar_buff_1 = {
		activation_effect = "fx/thornsister_avatar_screenspace",
		deactivation_sound = "stop_career_ability_kerilian_power_loop",
		activation_sound = "play_career_ability_kerilian_power_loop",
		buffs = {
			{
				refresh_durations = true,
				multiplier = 0.2,
				stat_buff = "attack_speed",
				continuous_effect = "fx/thornsister_avatar_screenspace_loop",
				max_stacks = 1,
				icon = "kerillian_thornsister_avatar",
				priority_buff = true,
				particles = {
					{
						orphaned_policy = "stop",
						first_person = false,
						third_person = true,
						effect = "fx/thornsister_avatar_3p",
						continuous = true,
						destroy_policy = "stop"
					}
				}
			}
		}
	},
	kerillian_thorn_sister_avatar_buff_2 = {
		buffs = {
			{
				refresh_durations = true,
				multiplier = 1.2,
				remove_buff_func = "remove_movement_buff",
				max_stacks = 1,
				apply_buff_func = "apply_movement_buff",
				duration = buff_tweak_data.kerillian_thorn_sister_avatar_buff_1.duration,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	kerillian_thorn_sister_avatar_buff_3 = {
		buffs = {
			{
				refresh_durations = true,
				multiplier = 0.2,
				stat_buff = "power_level",
				max_stacks = 1,
				duration = buff_tweak_data.kerillian_thorn_sister_avatar_buff_1.duration
			}
		}
	},
	kerillian_thorn_sister_avatar_buff_4 = {
		buffs = {
			{
				refresh_durations = true,
				multiplier = 0.2,
				stat_buff = "critical_strike_effectiveness",
				max_stacks = 1,
				duration = buff_tweak_data.kerillian_thorn_sister_avatar_buff_1.duration
			}
		}
	},
	kerillian_thorn_sister_free_throw_handler = {
		buffs = {
			{
				buff_to_add = "kerillian_thorn_sister_free_throw_buff",
				max_stacks = 1,
				heal_buff = "kerillian_thorn_sister_free_throw_buff_heal",
				timer_buff = "kerillian_thorn_sister_free_throw_timer",
				update_func = "kerillian_thorn_sister_free_throw_handler_update",
				update_frequency = 0.1
			}
		}
	},
	kerillian_thorn_sister_free_throw_timer = {
		buffs = {
			{
				is_cooldown = true,
				icon = "kerillian_thornsister_free_throw",
				max_stacks = 1
			}
		}
	},
	kerillian_thorn_sister_free_throw_buff = {
		buffs = {
			{
				buff_to_add = "kerillian_thorn_sister_free_throw_buff_heal",
				multiplier = -1,
				stat_buff = "reduced_overcharge",
				buff_func = "kerillian_thorn_sister_add_buff_remove",
				max_stacks = 1,
				icon = "kerillian_thornsister_free_throw",
				event = "on_ammo_used",
				perk = buff_perks.infinite_ammo
			}
		}
	},
	kerillian_thorn_sister_free_throw_buff_heal = {
		buffs = {
			{
				event = "on_damage_dealt",
				buff_func = "kerillian_thorn_sister_restore_health_on_ranged_hit",
				max_stacks = 1,
				duration = 0.5,
				amount_to_heal = 3
			}
		}
	},
	kerillian_thorn_sister_crit_on_any_ability = {
		buffs = {
			{
				buff_to_add = "kerillian_thorn_sister_crit_on_any_ability_buff",
				event = "on_ability_activated",
				buff_func = "add_buff_reff_buff_stack",
				max_stacks = 1,
				reference_buff = "kerillian_thorn_sister_crit_on_any_ability_handler"
			}
		}
	},
	kerillian_thorn_sister_crit_on_any_ability_handler = {
		buffs = {
			{
				event = "on_critical_action",
				max_stacks = 1,
				buff_to_remove = "kerillian_thorn_sister_crit_on_any_ability_buff",
				buff_func = "remove_ref_buff_stack_woods"
			}
		}
	},
	kerillian_thorn_sister_crit_on_any_ability_buff = {
		buffs = {
			{
				icon = "kerillian_thornsister_crit_on_any_ability",
				perk = buff_perks.guaranteed_crit,
				max_stacks = math.huge
			}
		}
	},
	kerillian_thorn_sister_big_push = {
		buffs = {
			{
				event = "on_start_action",
				buff_to_add = "kerillian_thorn_sister_big_push_buff",
				buff_to_add_2 = "kerillian_thorn_sister_big_push_buff_2",
				buff_func = "thorn_sister_big_push"
			}
		}
	},
	kerillian_thorn_sister_big_push_buff = {
		activation_sound = "career_ability_kerilian_push",
		buffs = {
			{
				stat_buff = "push_range",
				buff_func = "thorn_sister_big_push"
			}
		}
	},
	kerillian_thorn_sister_big_push_buff_2 = {
		buffs = {
			{
				stat_buff = "push_power",
				buff_func = "thorn_sister_big_push"
			}
		}
	},
	kerillian_thorn_sister_debuff_wall_buff = {
		buffs = {
			{
				start_flow_event = "poisoned",
				name = "kerillian_thorn_sister_debuff_wall_buff",
				stat_buff = "damage_taken",
				death_flow_event = "poisoned_death",
				refresh_durations = true,
				end_flow_event = "poisoned_end",
				apply_buff_func = "start_dot_damage",
				time_between_dot_damages = 1,
				max_stacks = 1,
				multiplier = buff_tweak_data.kerillian_thorn_sister_debuff_wall_buff.multiplier,
				duration = buff_tweak_data.kerillian_thorn_sister_debuff_wall_buff.duration
			}
		}
	}
}
local talent_trees = {
	{
		{
			"kerillian_thorn_sister_regrowth",
			"kerillian_thorn_sister_bloodlust",
			"kerillian_thorn_sister_heal_share"
		},
		{
			"kerillian_thorn_sister_attack_speed_on_full",
			"kerillian_thorn_sister_crit_big_bleed",
			"kerillian_power_on_health_gain"
		},
		{
			"kerillian_thorn_sister_smiter_unbalance",
			"kerillian_thorn_sister_linesman_unbalance",
			"kerillian_thorn_sister_power_level_unbalance"
		},
		{
			"kerillian_double_passive",
			"kerillian_thorn_sister_reduce_passive_on_elite",
			"kerillian_thorn_sister_avatar"
		},
		{
			"kerillian_thorn_sister_free_throw",
			"kerillian_thorn_sister_crit_on_any_ability",
			"kerillian_thorn_sister_big_push"
		},
		{
			"kerillian_thorn_sister_tanky_wall",
			"kerillian_thorn_sister_explosive_wall",
			"kerillian_thorn_sister_debuff_wall"
		}
	}
}
local talents = {
	{
		description = "regrowth_desc_3",
		name = "kerillian_thorn_sister_regrowth",
		buffer = "both",
		num_ranks = 1,
		icon = "kerillian_thornsister_regrowth",
		description_values = {
			{
				value = BuffTemplates.regrowth.buffs[1].bonus
			}
		},
		buffs = {
			"kerillian_waywatcher_regrowth"
		}
	},
	{
		description = "bloodlust_desc_3",
		name = "kerillian_thorn_sister_bloodlust",
		buffer = "server",
		num_ranks = 1,
		icon = "kerillian_thornsister_bloodlust",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.bloodlust.buffs[1].multiplier
			}
		},
		buffs = {
			"kerillian_shade_bloodlust"
		}
	},
	{
		description = "conqueror_desc_3",
		name = "kerillian_thorn_sister_heal_share",
		buffer = "server",
		num_ranks = 1,
		icon = "kerillian_thornsister_heal_share",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		buffs = {
			"kerillian_maidenguard_conqueror"
		}
	},
	{
		description = "kerillian_thorn_sister_attack_speed_on_full_desc",
		name = "kerillian_thorn_sister_attack_speed_on_full",
		buffer = "server",
		num_ranks = 1,
		icon = "kerillian_thornsister_attack_speed_on_full",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_thorn_sister_attack_speed_on_full.health_threshold
			},
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_thorn_sister_attack_speed_on_full_buff.multiplier
			}
		},
		buffs = {
			"kerillian_thorn_sister_attack_speed_on_full"
		}
	},
	{
		description = "kerillian_thorn_sister_crit_big_bleed_desc",
		name = "kerillian_thorn_sister_crit_big_bleed",
		num_ranks = 1,
		icon = "kerillian_thornsister_crit_big_bleed",
		description_values = {},
		buffs = {
			"kerillian_thorn_sister_big_bleed"
		}
	},
	{
		description = "kerillian_power_on_health_gain_desc",
		name = "kerillian_power_on_health_gain",
		buffer = "server",
		num_ranks = 1,
		icon = "kerillian_thornsister_power_on_health_gain",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_power_on_health_gain_buff.multiplier
			},
			{
				value = buff_tweak_data.kerillian_power_on_health_gain_buff.duration
			},
			{
				value = buff_tweak_data.kerillian_power_on_health_gain_buff.max_stacks
			}
		},
		buffs = {
			"kerillian_power_on_health_gain"
		}
	},
	{
		description = "smiter_unbalance_desc",
		name = "kerillian_thorn_sister_smiter_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "kerillian_thornsister_smiter_unbalance",
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
		buffs = {
			"smiter_unbalance"
		}
	},
	{
		description = "linesman_unbalance_desc",
		name = "kerillian_thorn_sister_linesman_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "kerillian_thornsister_linesman_unbalance",
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
		buffs = {
			"linesman_unbalance"
		}
	},
	{
		description = "power_level_unbalance_desc",
		name = "kerillian_thorn_sister_power_level_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "kerillian_thornsister_power_level_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.power_level_unbalance.buffs[1].multiplier
			}
		},
		buffs = {
			"power_level_unbalance"
		}
	},
	{
		description = "kerillian_double_passive_desc",
		name = "kerillian_double_passive",
		buffer = "server",
		num_ranks = 1,
		icon = "kerillian_thornsister_double_passive",
		description_values = {
			{
				value = buff_tweak_data.kerillian_double_passive.visualizer_max_stacks
			}
		},
		buffs = {}
	},
	{
		description = "kerillian_thorn_sister_reduce_passive_on_elite_desc",
		name = "kerillian_thorn_sister_reduce_passive_on_elite",
		num_ranks = 1,
		icon = "kerillian_thornsister_reduce_passive_on_elite",
		description_values = {
			{
				value = buff_tweak_data.kerillian_thorn_sister_reduce_passive_on_elite.time_removed_per_kill
			}
		},
		buffs = {
			"kerillian_thorn_sister_reduce_passive_on_elite"
		}
	},
	{
		description = "kerillian_thorn_sister_avatar_desc",
		name = "kerillian_thorn_sister_avatar",
		num_ranks = 1,
		icon = "kerillian_thornsister_avatar",
		description_values = {
			{
				value = buff_tweak_data.kerillian_thorn_sister_avatar_buff_1.duration
			}
		},
		buffs = {
			"kerillian_thorn_sister_avatar_add"
		}
	},
	{
		description = "kerillian_thorn_sister_crit_on_any_ability_desc",
		name = "kerillian_thorn_sister_crit_on_any_ability",
		num_ranks = 1,
		icon = "kerillian_thornsister_crit_on_any_ability",
		description_values = {
			{
				value = buff_tweak_data.kerillian_thorn_sister_crit_on_any_ability.amount_to_add
			}
		},
		buffs = {
			"kerillian_thorn_sister_crit_on_any_ability",
			"kerillian_thorn_sister_crit_on_any_ability_handler"
		}
	},
	{
		description = "kerillian_thorn_sister_big_push_desc",
		name = "kerillian_thorn_sister_big_push",
		num_ranks = 1,
		icon = "kerillian_thornsister_big_push",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_thorn_sister_big_push_buff_2.multiplier
			}
		},
		buffs = {
			"kerillian_thorn_sister_big_push"
		}
	},
	{
		description = "kerillian_thorn_sister_free_throw_desc_2",
		name = "kerillian_thorn_sister_free_throw",
		num_ranks = 1,
		icon = "kerillian_thornsister_free_throw",
		description_values = {
			{
				value = buff_tweak_data.kerillian_thorn_sister_free_throw_timer.duration
			},
			{
				value = buff_tweak_data.kerillian_thorn_sister_free_throw_buff.amount_to_heal
			}
		},
		buffs = {
			"kerillian_thorn_sister_free_throw_handler"
		}
	},
	{
		description = "kerillian_thorn_sister_tanky_wall_desc",
		name = "kerillian_thorn_sister_tanky_wall",
		num_ranks = 1,
		icon = "kerillian_thornsister_healing_wall",
		description_values = {
			{
				value = buff_tweak_data.kerillian_thorn_sister_tanky_wall.visualizer_extra_duration
			}
		},
		buffs = {}
	},
	{
		description = "kerillian_thorn_sister_explosive_wall_desc",
		name = "kerillian_thorn_sister_explosive_wall",
		num_ranks = 1,
		icon = "kerillian_thornsister_explosive_wall",
		description_values = {},
		buffs = {}
	},
	{
		description = "kerillian_thorn_sister_debuff_wall_desc",
		name = "kerillian_thorn_sister_debuff_wall",
		num_ranks = 1,
		icon = "kerillian_thornsister_debuff_wall",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_thorn_sister_debuff_wall_buff.multiplier
			},
			{
				value = buff_tweak_data.kerillian_thorn_sister_debuff_wall_buff.duration
			}
		},
		buffs = {}
	}
}
local hero_name = "wood_elf"

table.merge(TalentBuffTemplates[hero_name], talent_buff_templates)
table.append(TalentTrees[hero_name], talent_trees)
table.append(Talents[hero_name], talents)

WeaveLoadoutSettings = WeaveLoadoutSettings or {}
WeaveLoadoutSettings.we_thornsister = {
	talent_tree = talent_trees[1],
	properties = {},
	traits = {}
}

for name, data in pairs(talent_buff_templates) do
	local buffs = data.buffs

	fassert(#buffs == 1, "talent buff has more than one sub buff, add multiple buffs from the talent instead")

	local buff = buffs[1]
	buff.name = name
end

BuffUtils.apply_buff_tweak_data(talent_buff_templates, buff_tweak_data)

return
