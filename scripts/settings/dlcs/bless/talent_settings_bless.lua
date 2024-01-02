local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local buff_tweak_data = {
	victor_priest_ability_cooldown_on_hit = {
		bonus = 0.25
	},
	victor_priest_ability_cooldown_on_damage_taken = {
		bonus = 0.25
	},
	victor_priest_2_1 = {
		num_targets = 3
	},
	victor_priest_2_1_buff = {
		duration = 4
	},
	victor_priest_2_2_timer = {
		duration = 2
	},
	victor_priest_2_2_buff = {
		max_stacks = 5,
		multiplier = 0.08
	},
	victor_priest_2_3_buff = {
		max_stacks = 3,
		duration = 12,
		bonus = 0.05
	},
	victor_priest_4_3 = {
		percent_fury_to_gain = 0.02,
		chunk_size = 40
	},
	victor_priest_5_1_buff = {
		multiplier = 0.25
	},
	victor_priest_5_2_buff = {
		multiplier = 0.25
	},
	victor_priest_5_3_buff = {
		multiplier = 0.15
	},
	victor_priest_6_3_buff = {
		heal_window = 3
	}
}
local talent_buff_templates = {
	victor_priest_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				buff_func = "reduce_activated_ability_cooldown"
			}
		}
	},
	victor_priest_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken"
			}
		}
	},
	victor_priest_passive_damage_stagger = {
		buffs = {
			{
				buff_to_add = "damage_stagger",
				multiplier = -0.4,
				stat_buff = "damage_taken",
				buff_func = "victor_priest_damage_stagger",
				staggered_damage_taken = 0.4,
				percentage_to_take = 0.2,
				event = "on_damage_taken"
			}
		}
	},
	damage_stagger = {
		buffs = {
			{
				icon = "victor_priest_perk_1",
				damage_per_tick = 5,
				value = 0,
				update_func = "damage_stagger_dot",
				max_stacks = 1,
				duration = 3,
				update_start_delay = 1,
				update_frequency = 0.9
			}
		}
	},
	victor_priest_super_armour_damage = {
		buffs = {
			{
				stat_buff = "power_level_super_armour",
				multiplier = 0.3
			}
		}
	},
	victor_priest_curse_resistance = {
		buffs = {
			{
				stat_buff = "curse_protection",
				multiplier = -1
			}
		}
	},
	victor_priest_vanguard = {
		buffs = {
			{
				name = "vanguard",
				multiplier = 1,
				buff_func = "heal_stagger_targets_on_melee",
				event = "on_stagger",
				perks = {
					buff_perks.tank_healing
				}
			}
		}
	},
	victor_priest_reaper = {
		buffs = {
			{
				multiplier = -0.05,
				name = "reaper",
				buff_func = "heal_damage_targets_on_melee",
				event = "on_player_damage_dealt",
				max_targets = 5,
				bonus = 0.25,
				perks = {
					buff_perks.linesman_healing
				}
			}
		}
	},
	victor_priest_conqueror = {
		buffs = {
			{
				name = "conqueror",
				multiplier = 0.2,
				range = 10,
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable"
			}
		}
	},
	victor_priest_2_1 = {
		buffs = {
			{
				event = "on_hit",
				buff_to_add = "victor_priest_2_1_buff",
				block_buff = "victor_priest_2_1_cooldown",
				buff_func = "add_buff_on_num_targets_hit"
			}
		}
	},
	victor_priest_2_1_buff = {
		buffs = {
			{
				icon = "victor_priest_2_1",
				max_stacks = 1,
				refresh_durations = true,
				priority_buff = true,
				perks = {
					"slayer_stamina"
				}
			}
		}
	},
	victor_priest_2_1_cooldown = {
		buffs = {
			{
				max_stacks = 1,
				duration = 0.3,
				refresh_durations = true
			}
		}
	},
	victor_priest_2_2 = {
		buffs = {
			{
				event = "on_hit",
				buff_to_add = "victor_priest_2_2_buff",
				max_stacks = 1,
				buff_func = "victor_priest_add_buff_first_target"
			}
		}
	},
	victor_priest_2_2_buff = {
		buffs = {
			{
				stat_buff = "increased_weapon_damage_heavy_attack",
				icon = "victor_priest_2_2"
			}
		}
	},
	victor_priest_2_2_remover = {
		buffs = {
			{
				event = "on_hit",
				buff_to_add = "victor_priest_2_2_delay",
				buff_func = "add_buff_on_first_target_hit",
				valid_attack_types = {
					heavy_attack = true
				}
			}
		}
	},
	victor_priest_2_2_delay = {
		buffs = {
			{
				buff_list_buff = "victor_priest_2_2",
				duration = 0.2,
				remove_buff_func = "victor_priest_delayed_buff_remove"
			}
		}
	},
	victor_priest_2_3 = {
		buffs = {
			{
				buff_to_add = "victor_priest_2_3_buff",
				event = "on_elite_killed",
				buff_func = "add_buff_on_elite_kill"
			}
		}
	},
	victor_priest_2_3_buff = {
		buffs = {
			{
				icon = "victor_priest_2_3",
				refresh_durations = true,
				stat_buff = "critical_strike_chance"
			}
		}
	},
	victor_priest_4_1 = {
		buffs = {
			{
				event = "on_damage_taken",
				buff_func = "victor_priest_4_1_on_damage_taken"
			}
		}
	},
	victor_priest_4_3 = {
		buffs = {
			{
				event = "on_kill",
				buff_func = "victor_priest_4_3_heal_on_kill"
			}
		}
	},
	victor_priest_5_1 = {
		buffs = {
			{
				buff_to_add = "victor_priest_5_1_buff",
				update_func = "activate_buff_on_distance",
				remove_buff_func = "remove_aura_buff",
				range = 100
			}
		}
	},
	victor_priest_5_1_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "victor_priest_5_1",
				stat_buff = "power_level_large"
			}
		}
	},
	victor_priest_5_2 = {
		buffs = {
			{
				buff_to_add = "victor_priest_5_2_buff",
				update_func = "activate_buff_on_distance",
				remove_buff_func = "remove_aura_buff",
				range = 100
			}
		}
	},
	victor_priest_5_2_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "victor_priest_5_2",
				stat_buff = "power_level_impact"
			}
		}
	},
	victor_priest_5_3 = {
		buffs = {
			{
				buff_to_add = "victor_priest_5_3_buff",
				update_func = "activate_buff_on_distance",
				remove_buff_func = "remove_aura_buff",
				range = 100
			}
		}
	},
	victor_priest_5_3_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "victor_priest_5_3",
				stat_buff = "max_health"
			}
		}
	},
	victor_priest_6_3 = {
		buffs = {
			{
				buff_to_add = "victor_priest_6_3_buff",
				range = 100,
				update_func = "activate_buff_on_distance",
				max_stacks = 1,
				remove_buff_func = "remove_aura_buff"
			}
		}
	},
	victor_priest_6_3_buff = {
		buffs = {
			{
				event = "on_damage_taken",
				max_stacks = 1,
				buff_func = "victor_priest_store_damage"
			}
		}
	},
	victor_priest_6_3_delayed_heal = {
		buffs = {
			{
				remove_buff_func = "victor_priest_6_1_removed",
				duration = 0.2
			}
		}
	}
}
local talent_trees = {
	{
		{
			"victor_priest_vanguard",
			"victor_priest_reaper",
			"victor_priest_heal_share"
		},
		{
			"victor_priest_2_1",
			"victor_priest_2_2",
			"victor_priest_2_3"
		},
		{
			"victor_priest_3_1",
			"victor_priest_3_2",
			"victor_priest_3_3"
		},
		{
			"victor_priest_4_1_new",
			"victor_priest_4_2_new",
			"victor_priest_4_3"
		},
		{
			"victor_priest_5_1",
			"victor_priest_5_2",
			"victor_priest_5_3"
		},
		{
			"victor_priest_6_1",
			"victor_priest_6_2",
			"victor_priest_6_3"
		}
	}
}
local talents = {
	{
		description = "vanguard_desc",
		name = "victor_priest_vanguard",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_priest_1_1",
		description_values = {},
		buffs = {
			"victor_priest_vanguard"
		}
	},
	{
		description = "reaper_desc",
		name = "victor_priest_reaper",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_priest_1_2",
		description_values = {
			{
				value = BuffTemplates.reaper.buffs[1].max_targets
			}
		},
		buffs = {
			"victor_priest_reaper"
		}
	},
	{
		description = "conqueror_desc_3",
		name = "victor_priest_heal_share",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_priest_1_3",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		buffs = {
			"victor_priest_conqueror"
		}
	},
	{
		description = "victor_priest_2_1_desc",
		name = "victor_priest_2_1",
		num_ranks = 1,
		icon = "victor_priest_2_1",
		description_values = {
			{
				value = buff_tweak_data.victor_priest_2_1.num_targets
			},
			{
				value = buff_tweak_data.victor_priest_2_1_buff.duration
			}
		},
		buffs = {
			"victor_priest_2_1"
		}
	},
	{
		description = "victor_priest_2_2_desc",
		name = "victor_priest_2_2",
		buffer = "both",
		num_ranks = 1,
		icon = "victor_priest_2_2",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_priest_2_2_buff.multiplier
			},
			{
				value = buff_tweak_data.victor_priest_2_2_buff.max_stacks
			}
		},
		buffs = {
			"victor_priest_2_2",
			"victor_priest_2_2_remover"
		}
	},
	{
		description = "victor_priest_2_3_desc",
		name = "victor_priest_2_3",
		num_ranks = 1,
		icon = "victor_priest_2_3",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_priest_2_3_buff.bonus
			},
			{
				value = buff_tweak_data.victor_priest_2_3_buff.duration
			},
			{
				value = buff_tweak_data.victor_priest_2_3_buff.max_stacks
			}
		},
		buffs = {
			"victor_priest_2_3"
		}
	},
	{
		description = "smiter_unbalance_desc",
		name = "victor_priest_3_1",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_priest_3_1",
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
		name = "victor_priest_3_2",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_priest_3_2",
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
		name = "victor_priest_3_3",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_priest_3_3",
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
		description = "victor_priest_4_1_desc_new",
		name = "victor_priest_4_1_new",
		num_ranks = 1,
		icon = "victor_priest_4_1",
		description_values = {},
		buffs = {
			"victor_priest_4_1"
		}
	},
	{
		description = "victor_priest_4_2_desc_new",
		name = "victor_priest_4_2_new",
		num_ranks = 1,
		icon = "victor_priest_4_2",
		description_values = {
			{
				value_type = "percent",
				value = CareerConstants.wh_priest.talent_4_2_fury_to_gain_percent
			},
			{
				value_type = "percent",
				value = CareerConstants.wh_priest.talent_4_2_smite_improved_damage
			}
		},
		buffs = {}
	},
	{
		description = "victor_priest_4_3_desc_new",
		name = "victor_priest_4_3",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_priest_4_3",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_priest_4_3.percent_fury_to_gain
			}
		},
		buffs = {
			"victor_priest_4_3"
		}
	},
	{
		description = "victor_priest_5_1_desc_new",
		name = "victor_priest_5_1",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_priest_5_1",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_priest_5_1_buff.multiplier
			}
		},
		buffs = {
			"victor_priest_5_1"
		}
	},
	{
		description = "victor_priest_5_2_desc",
		name = "victor_priest_5_2",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_priest_5_2",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_priest_5_2_buff.multiplier
			}
		},
		buffs = {
			"victor_priest_5_2"
		}
	},
	{
		description = "victor_priest_5_3_desc",
		name = "victor_priest_5_3",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_priest_5_3",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_priest_5_3_buff.multiplier
			}
		},
		buffs = {
			"victor_priest_5_3"
		}
	},
	{
		description = "victor_priest_6_1_desc_new",
		name = "victor_priest_6_1",
		num_ranks = 1,
		icon = "victor_priest_6_1",
		description_values = {
			{
				value = CareerConstants.wh_priest.talent_6_1_improved_ability_duration
			}
		},
		buffs = {}
	},
	{
		description = "victor_priest_6_3_desc",
		name = "victor_priest_6_3",
		buffer = "server",
		num_ranks = 1,
		icon = "victor_priest_6_3",
		description_values = {
			{
				value = buff_tweak_data.victor_priest_6_3_buff.heal_window
			}
		},
		buffs = {
			"victor_priest_6_3"
		}
	},
	{
		description = "victor_priest_6_2_desc",
		name = "victor_priest_6_2",
		num_ranks = 1,
		icon = "victor_priest_6_2",
		description_values = {},
		buffs = {}
	}
}
local hero_name = "witch_hunter"

table.merge(TalentBuffTemplates[hero_name], talent_buff_templates)
table.append(TalentTrees[hero_name], talent_trees)
table.append(Talents[hero_name], talents)

WeaveLoadoutSettings = WeaveLoadoutSettings or {}
WeaveLoadoutSettings.wh_priest = {
	talent_tree = talent_trees[1],
	properties = {},
	traits = {}
}

BuffUtils.copy_talent_buff_names(talent_buff_templates)
BuffUtils.apply_buff_tweak_data(talent_buff_templates, buff_tweak_data)
