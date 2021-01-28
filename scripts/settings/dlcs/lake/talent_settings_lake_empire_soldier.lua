local buff_tweak_data = {
	markus_questing_knight_ability_cooldown_on_hit = {
		bonus = 0.25
	},
	markus_questing_knight_ability_cooldown_on_damage_taken = {
		bonus = 0.25
	},
	markus_questing_knight_perk_movement_speed = {
		multiplier = 1.1
	},
	markus_questing_knight_perk_first_target_damage = {
		multiplier = 0.25
	},
	markus_questing_knight_vanguard = {
		multiplier = 1
	},
	markus_questing_knight_bloodlust = {
		heal_cap = 0.25,
		multiplier = 0.45
	},
	markus_questing_knight_conqueror = {
		range = 10,
		multiplier = 0.2
	},
	markus_questing_knight_charged_attacks_increased_power = {
		multiplier = 0.25
	},
	markus_questing_knight_crit_can_insta_kill = {
		damage_multiplier = 4,
		proc_chance = 1,
		boss_damage_multiplier = 2
	},
	markus_questing_knight_kills_buff_power_stacking = {},
	markus_questing_knight_kills_buff_power_stacking_buff = {
		max_stacks = 3,
		multiplier = 0.1,
		duration = 10
	},
	markus_questing_knight_passive_improved_reward = {
		display_multiplier = 0.5
	},
	markus_questing_knight_health_refund_over_time = {
		heal_amount_fraction = 0.5
	},
	markus_questing_knight_health_refund_over_time_delayed_heal = {
		duration = 5
	},
	markus_questing_knight_parry_increased_power_buff = {
		max_stacks = 1,
		duration = 6,
		multiplier = 0.2
	},
	markus_questing_knight_push_arc = {
		multiplier = 0.3
	},
	markus_questing_knight_stamina_reg = {
		multiplier = 0.3
	},
	markus_questing_knight_ability_buff_on_kill_movement_speed = {
		duration = 15,
		multiplier = 1.35
	}
}
local talent_buff_templates = {
	markus_questing_knight_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = "reduce_activated_ability_cooldown"
			}
		}
	},
	markus_questing_knight_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken"
			}
		}
	},
	markus_questing_knight_perk_movement_speed = {
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
	markus_questing_knight_perk_first_target_damage = {
		buffs = {
			{
				stat_buff = "first_melee_hit_damage"
			}
		}
	},
	markus_questing_knight_perk_power_block = {
		buffs = {
			{
				perk = "power_block"
			}
		}
	},
	markus_questing_knight_vanguard = {
		buffs = {
			{
				name = "vanguard",
				event_buff = true,
				buff_func = "heal_stagger_targets_on_melee",
				event = "on_stagger",
				perk = "tank_healing"
			}
		}
	},
	markus_questing_knight_bloodlust = {
		buffs = {
			{
				name = "bloodlust",
				event_buff = true,
				buff_func = "heal_percentage_of_enemy_hp_on_melee_kill",
				event = "on_kill",
				perk = "smiter_healing"
			}
		}
	},
	markus_questing_knight_conqueror = {
		buffs = {
			{
				event = "on_healed_consumeable",
				name = "conqueror",
				event_buff = true,
				buff_func = "heal_other_players_percent_at_range"
			}
		}
	},
	markus_questing_knight_charged_attacks_increased_power = {
		buffs = {
			{
				stat_buff = "increased_weapon_damage_heavy_attack",
				name = "markus_questing_knight_charged_attacks_increased_power"
			}
		}
	},
	markus_questing_knight_crit_can_insta_kill = {
		buffs = {
			{
				event = "on_player_damage_dealt",
				name = "markus_questing_knight_crit_can_insta_kill",
				event_buff = true,
				buff_func = "check_for_instantly_killing_crit"
			}
		}
	},
	markus_questing_knight_kills_buff_power_stacking = {
		buffs = {
			{
				buff_to_add = "markus_questing_knight_kills_buff_power_stacking_buff",
				name = "markus_questing_knight_kills_buff_power_stacking",
				event_buff = true,
				buff_func = "add_buff",
				event = "on_kill"
			}
		}
	},
	markus_questing_knight_kills_buff_power_stacking_buff = {
		buffs = {
			{
				refresh_durations = true,
				name = "markus_questing_knight_kills_buff_power_stacking_buff",
				stat_buff = "power_level",
				icon = "markus_questing_knight_kills_buff_power_stacking"
			}
		}
	},
	markus_questing_knight_health_refund_over_time = {
		buffs = {
			{
				event = "on_damage_taken",
				buff_to_add = "markus_questing_knight_health_refund_over_time_delayed_heal",
				event_buff = true,
				buff_func = "add_heal_percent_of_damage_taken_over_time_buff"
			}
		}
	},
	markus_questing_knight_health_refund_over_time_delayed_heal = {
		buffs = {
			{
				max_stacks = 1,
				icon = "markus_questing_knight_health_refund_over_time",
				refresh_durations = true,
				remove_buff_func = "refund_damage_taken"
			}
		}
	},
	markus_questing_knight_parry_increased_power = {
		buffs = {
			{
				event = "on_timed_block",
				buff_to_add = "markus_questing_knight_parry_increased_power_buff",
				event_buff = true,
				buff_func = "add_buff"
			}
		}
	},
	markus_questing_knight_parry_increased_power_buff = {
		buffs = {
			{
				refresh_durations = true,
				icon = "markus_questing_knight_parry_increased_power",
				stat_buff = "power_level"
			}
		}
	},
	markus_questing_knight_push_arc = {
		buffs = {
			{
				stat_buff = "block_angle"
			}
		}
	},
	markus_questing_knight_stamina_reg = {
		buffs = {
			{
				stat_buff = "fatigue_regen"
			}
		}
	},
	markus_questing_knight_ability_buff_on_kill = {
		buffs = {
			{
				event = "on_kill",
				buff_to_add = "markus_questing_knight_ability_buff_on_kill_movement_speed",
				event_buff = true,
				buff_func = "markus_questing_knight_ability_kill_buff_func"
			}
		}
	},
	markus_questing_knight_ability_buff_on_kill_movement_speed = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				remove_buff_func = "remove_movement_buff",
				refresh_durations = true,
				max_stacks = 1,
				icon = "markus_questing_knight_ability_buff_on_kill",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	}
}
local talent_trees = {
	{
		{
			"markus_questing_knight_vanguard",
			"markus_questing_knight_bloodlust_2",
			"markus_questing_knight_heal_share"
		},
		{
			"markus_questing_knight_kills_buff_power_stacking",
			"markus_questing_knight_crit_can_insta_kill",
			"markus_questing_knight_charged_attacks_increased_power"
		},
		{
			"markus_questing_knight_tank_unbalance",
			"markus_questing_knight_smiter_unbalance",
			"markus_questing_knight_power_level_unbalance"
		},
		{
			"markus_questing_knight_passive_additional_quest",
			"markus_questing_knight_passive_improved_reward",
			"markus_questing_knight_passive_side_quest"
		},
		{
			"markus_questing_knight_health_refund_over_time",
			"markus_questing_knight_parry_increased_power",
			"markus_questing_knight_push_arc_stamina_reg"
		},
		{
			"markus_questing_knight_ability_double_activation",
			"markus_questing_knight_ability_buff_on_kill",
			"markus_questing_knight_ability_tank_attack"
		}
	}
}
local talents = {
	{
		description = "vanguard_desc",
		name = "markus_questing_knight_vanguard",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_questing_knight_vanguard",
		description_values = {},
		buffs = {
			"markus_questing_knight_vanguard"
		}
	},
	{
		description = "bloodlust_desc_3",
		name = "markus_questing_knight_bloodlust_2",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_questing_knight_bloodlust_2",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.bloodlust.buffs[1].multiplier
			}
		},
		buffs = {
			"markus_questing_knight_bloodlust"
		}
	},
	{
		description = "conqueror_desc_3",
		name = "markus_questing_knight_heal_share",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_questing_knight_heal_share",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		buffs = {
			"markus_questing_knight_conqueror"
		}
	},
	{
		description = "markus_questing_knight_kills_buff_power_stacking_desc",
		name = "markus_questing_knight_kills_buff_power_stacking",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_questing_knight_kills_buff_power_stacking",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_questing_knight_kills_buff_power_stacking_buff.multiplier
			},
			{
				value = buff_tweak_data.markus_questing_knight_kills_buff_power_stacking_buff.duration
			},
			{
				value = buff_tweak_data.markus_questing_knight_kills_buff_power_stacking_buff.max_stacks
			}
		},
		buffs = {
			"markus_questing_knight_kills_buff_power_stacking"
		}
	},
	{
		description = "markus_questing_knight_crit_can_insta_kill_desc",
		name = "markus_questing_knight_crit_can_insta_kill",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_questing_knight_crit_can_insta_kill",
		description_values = {
			{
				value = buff_tweak_data.markus_questing_knight_crit_can_insta_kill.damage_multiplier
			}
		},
		buffs = {
			"markus_questing_knight_crit_can_insta_kill"
		}
	},
	{
		description = "markus_questing_knight_charged_attacks_increased_power_desc",
		name = "markus_questing_knight_charged_attacks_increased_power",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_questing_knight_charged_attacks_increased_power",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_questing_knight_charged_attacks_increased_power.multiplier
			}
		},
		buffs = {
			"markus_questing_knight_charged_attacks_increased_power"
		}
	},
	{
		description = "tank_unbalance_desc",
		name = "markus_questing_knight_tank_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_questing_knight_tank_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.tank_unbalance_buff.buffs[1].bonus
			},
			{
				value = BuffTemplates.tank_unbalance_buff.buffs[1].duration
			},
			{
				value_type = "percent",
				value = BuffTemplates.tank_unbalance.buffs[1].display_multiplier
			},
			{
				value_type = "percent",
				value = BuffTemplates.tank_unbalance.buffs[1].max_display_multiplier
			}
		},
		buffs = {
			"tank_unbalance"
		}
	},
	{
		description = "smiter_unbalance_desc",
		name = "markus_questing_knight_smiter_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_questing_knight_smiter_unbalance",
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
		description = "power_level_unbalance_desc",
		name = "markus_questing_knight_power_level_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_questing_knight_power_level_unbalance",
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
		description = "markus_questing_knight_passive_additional_quest_desc",
		name = "markus_questing_knight_passive_additional_quest",
		num_ranks = 1,
		icon = "markus_questing_knight_passive_additional_quest",
		buffs = {}
	},
	{
		description = "markus_questing_knight_passive_side_quest_desc",
		name = "markus_questing_knight_passive_side_quest",
		num_ranks = 1,
		icon = "markus_questing_knight_passive_side_quest",
		buffs = {}
	},
	{
		description = "markus_questing_knight_passive_improved_reward_desc",
		name = "markus_questing_knight_passive_improved_reward",
		num_ranks = 1,
		icon = "markus_questing_knight_passive_improved_reward",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_questing_knight_passive_improved_reward.display_multiplier
			}
		},
		buffs = {}
	},
	{
		description = "markus_questing_knight_health_refund_over_time_desc",
		name = "markus_questing_knight_health_refund_over_time",
		buffer = "both",
		num_ranks = 1,
		icon = "markus_questing_knight_health_refund_over_time",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_questing_knight_health_refund_over_time.heal_amount_fraction
			},
			{
				value = buff_tweak_data.markus_questing_knight_health_refund_over_time_delayed_heal.duration
			}
		},
		buffs = {
			"markus_questing_knight_health_refund_over_time"
		}
	},
	{
		description = "markus_questing_knight_parry_increased_power_desc",
		name = "markus_questing_knight_parry_increased_power",
		buffer = "both",
		num_ranks = 1,
		icon = "markus_questing_knight_parry_increased_power",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_questing_knight_parry_increased_power_buff.multiplier
			},
			{
				value = buff_tweak_data.markus_questing_knight_parry_increased_power_buff.duration
			}
		},
		buffs = {
			"markus_questing_knight_parry_increased_power"
		}
	},
	{
		description = "markus_questing_knight_push_arc_stamina_reg_desc",
		name = "markus_questing_knight_push_arc_stamina_reg",
		num_ranks = 1,
		icon = "markus_questing_knight_push_arc_stamina_reg",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_questing_knight_push_arc.multiplier
			}
		},
		buffs = {
			"markus_questing_knight_push_arc",
			"markus_questing_knight_stamina_reg"
		}
	},
	{
		description = "markus_questing_knight_ability_double_activation_desc",
		name = "markus_questing_knight_ability_double_activation",
		num_ranks = 1,
		icon = "markus_questing_knight_ability_double_activation",
		buffs = {}
	},
	{
		description = "markus_questing_knight_ability_buff_on_kill_desc",
		name = "markus_questing_knight_ability_buff_on_kill",
		num_ranks = 1,
		icon = "markus_questing_knight_ability_buff_on_kill",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.markus_questing_knight_ability_buff_on_kill_movement_speed.multiplier
			},
			{
				value = buff_tweak_data.markus_questing_knight_ability_buff_on_kill_movement_speed.duration
			}
		},
		buffs = {
			"markus_questing_knight_ability_buff_on_kill"
		}
	},
	{
		description = "markus_questing_knight_ability_tank_attack_desc",
		name = "markus_questing_knight_ability_tank_attack",
		num_ranks = 1,
		icon = "markus_questing_knight_ability_tank_attack",
		buffs = {}
	}
}
local hero_name = "empire_soldier"

table.merge(TalentBuffTemplates[hero_name], talent_buff_templates)
table.append(TalentTrees[hero_name], talent_trees)
table.append(Talents[hero_name], talents)

WeaveLoadoutSettings = WeaveLoadoutSettings or {}
WeaveLoadoutSettings.es_questingknight = {
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
