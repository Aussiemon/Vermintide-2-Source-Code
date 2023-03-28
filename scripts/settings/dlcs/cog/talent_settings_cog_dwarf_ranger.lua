local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local buff_tweak_data = {
	bardin_engineer_passive_no_ability_regen = {
		multiplier = -1
	},
	bardin_engineer_passive_ranged_power_aura = {
		range = 10,
		update_frequency = 0.1
	},
	bardin_engineer_passive_ranged_power_aura_buff = {
		multiplier = 0.1
	},
	bardin_engineer_passive_max_ammo = {
		multiplier = 0.5
	},
	bardin_engineer_pump_buff = {
		multiplier = 0.4
	},
	bardin_engineer_pump_buff_long = {
		multiplier = 0.4
	},
	bardin_engineer_pump_buff_long_attack_speed = {
		multiplier = 0.025
	},
	bardin_engineer_vanguard = {},
	bardin_engineer_reaper = {},
	bardin_engineer_heal_share = {},
	bardin_engineer_ranged_crit_count = {
		bonus = -1
	},
	bardin_engineer_ranged_crit_counter_buff = {
		max_stacks = 4
	},
	bardin_engineer_ranged_crit_count_buff = {
		bonus = 2
	},
	bardin_engineer_ranged_pierce = {
		bonus = 1
	},
	bardin_engineer_melee_power_free_shot = {},
	bardin_engineer_melee_power_free_shot_stat = {
		multiplier = 0.1
	},
	bardin_engineer_melee_power_free_shot_counter = {
		max_stacks = 5
	},
	bardin_engineer_melee_power_free_shot_counter_buff = {},
	bardin_engineer_melee_power_range_power_buff = {
		max_stacks = 1,
		duration = 10,
		multiplier = 0.15
	},
	bardin_engineer_power_on_max_pump_buff = {
		max_stacks = 1,
		multiplier = 0.15,
		duration = 10
	},
	bardin_engineer_power_on_max_pump = {
		stacks_for_buff = 5
	},
	bardin_engineer_tank_unbalance = {},
	bardin_engineer_linesman_unbalance = {},
	bardin_engineer_power_level_unbalance = {},
	bardin_engineer_stacking_damage_reduction = {
		update_frequency = 5
	},
	bardin_engineer_stacking_damage_reduction_buff = {
		max_stacks = 5,
		multiplier = -0.05
	},
	bardin_engineer_upgraded_grenades = {},
	bardin_engineer_piston_powered_delay = {
		duration = 15
	},
	bardin_engineer_armor_piercing_ability = {},
	bardin_engineer_reduced_ability_fire_slowdown = {
		display_multiplier = 0.1
	},
	bardin_engineer_increased_ability_bar = {
		multiplier = 0.5
	},
	bardin_engineer_increased_ability_bar_buff = {
		duration = 4
	}
}
local talent_buff_templates = {
	bardin_engineer_passive_no_ability_regen = {
		buffs = {
			{
				stat_buff = "cooldown_regen"
			}
		}
	},
	bardin_engineer_passive_ranged_power_aura = {
		buffs = {
			{
				buff_to_add = "bardin_engineer_passive_ranged_power_aura_buff",
				update_func = "activate_buff_on_distance",
				remove_buff_func = "remove_aura_buff"
			}
		}
	},
	bardin_engineer_passive_ranged_power_aura_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_engineer_passive_ranged_power_aura_buff_icon",
				stat_buff = "power_level_ranged"
			}
		}
	},
	bardin_engineer_passive_max_ammo = {
		buffs = {
			{
				stat_buff = "total_ammo"
			}
		}
	},
	bardin_engineer_remove_pump_stacks_fire = {
		buffs = {
			{
				event = "on_start_action",
				buff_func = "bardin_engineer_remove_pump_stacks_on_fire",
				remove_buff_stack_data = {
					{
						buff_to_remove = "bardin_engineer_pump_buff",
						num_stacks = math.huge
					},
					{
						buff_to_remove = "bardin_engineer_pump_buff_long",
						num_stacks = math.huge
					}
				}
			}
		}
	},
	bardin_engineer_remove_pump_stacks = {
		buffs = {
			{
				event = "on_ability_recharged",
				buff_func = "bardin_engineer_remove_pump_stacks",
				remove_buff_stack_data = {
					{
						buff_to_remove = "bardin_engineer_pump_buff",
						num_stacks = math.huge
					},
					{
						buff_to_remove = "bardin_engineer_pump_buff_long",
						num_stacks = math.huge
					}
				}
			}
		}
	},
	bardin_engineer_pump_buff = {
		buffs = {
			{
				icon = "bardin_engineer_passive",
				on_max_stacks_func = "add_remove_buffs",
				stat_buff = "cooldown_regen",
				on_max_stacks_overflow_func = "add_remove_buffs",
				max_stacks = 5,
				duration = 12,
				refresh_durations = true,
				max_stack_data = {
					buffs_to_add = {
						"bardin_engineer_pump_exhaustion_buff"
					},
					talent_buffs_to_add = {
						bardin_engineer_power_on_max_pump = {
							buff_to_add = "bardin_engineer_power_on_max_pump_buff",
							rpc_sync = true
						}
					}
				}
			}
		}
	},
	bardin_engineer_pump_buff_long = {
		buffs = {
			{
				on_max_stacks_func = "add_remove_buffs",
				on_max_stacks_overflow_func = "add_remove_buffs",
				stat_buff = "cooldown_regen",
				max_stacks = 4,
				icon = "bardin_engineer_passive",
				apply_buff_func = "add_buffs",
				max_stack_data = {
					buffs_to_add = {
						"bardin_engineer_pump_exhaustion_buff"
					}
				},
				add_buffs_data = {
					link_buffs = true,
					buffs_to_add = {
						"bardin_engineer_pump_buff_long_attack_speed"
					}
				}
			}
		}
	},
	bardin_engineer_pump_buff_long_attack_speed = {
		buffs = {
			{
				max_stacks = 4,
				stat_buff = "attack_speed"
			}
		}
	},
	bardin_engineer_pump_exhaustion_buff = {
		buffs = {
			{
				max_stacks = 1,
				duration = 2,
				on_max_stacks_overflow_func = "add_remove_buffs",
				max_stack_data = {
					buffs_to_add = {
						"bardin_engineer_pump_max_exhaustion_buff"
					}
				}
			}
		}
	},
	bardin_engineer_pump_max_exhaustion_buff = {
		buffs = {
			{
				duration = 5,
				icon = "bardin_engineer_pump_max_exhaustion_buff_icon",
				remove_buff_func = "bardin_engineer_animation_slow_down_remove",
				debuff = true,
				max_stacks = 1,
				apply_buff_func = "bardin_engineer_animation_slow_down_add",
				priority_buff = true,
				perk = buff_perks.exhausted
			}
		}
	},
	bardin_engineer_vanguard = {
		buffs = {
			{
				name = "vanguard",
				multiplier = 1,
				buff_func = "heal_stagger_targets_on_melee",
				event = "on_stagger",
				perk = buff_perks.tank_healing
			}
		}
	},
	bardin_engineer_reaper = {
		buffs = {
			{
				multiplier = -0.05,
				name = "reaper",
				max_targets = 5,
				buff_func = "heal_damage_targets_on_melee",
				event = "on_damage_dealt",
				bonus = 0.25,
				perk = buff_perks.linesman_healing
			}
		}
	},
	bardin_engineer_heal_share = {
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
	bardin_engineer_ranged_crit_count = {
		buffs = {
			{
				buff_to_add = "bardin_engineer_ranged_crit_counter_buff",
				max_stacks = 1,
				stat_buff = "critical_strike_chance_ranged",
				buff_func = "add_buff_on_first_target_hit",
				event = "on_hit",
				client_side = true,
				valid_attack_types = {
					instant_projectile = true,
					projectile = true
				}
			}
		}
	},
	bardin_engineer_ranged_crit_counter_buff = {
		buffs = {
			{
				reset_on_max_stacks = true,
				on_max_stacks_func = "add_remove_buffs",
				max_stacks = 5,
				is_cooldown = true,
				icon = "bardin_engineer_ranged_crit_count",
				max_stack_data = {
					buffs_to_add = {
						"bardin_engineer_ranged_crit_count_buff"
					}
				}
			}
		}
	},
	bardin_engineer_ranged_crit_count_buff = {
		buffs = {
			{
				event = "on_critical_shot",
				max_stacks = 1,
				stat_buff = "critical_strike_chance_ranged",
				buff_func = "dummy_function",
				remove_on_proc = true,
				icon = "bardin_engineer_ranged_crit_count",
				priority_buff = true
			}
		}
	},
	bardin_engineer_ranged_pierce = {
		buffs = {
			{
				stat_buff = "ranged_additional_penetrations"
			}
		}
	},
	bardin_engineer_melee_power_ranged_power = {
		buffs = {
			{
				buff_to_add = "bardin_engineer_melee_power_range_power_buff_counter",
				max_stacks = 1,
				buff_func = "add_buff_on_first_target_hit",
				event = "on_hit",
				valid_attack_types = {
					heavy_attack = true,
					light_attack = true
				}
			}
		}
	},
	bardin_engineer_melee_power_range_power_buff_counter = {
		buffs = {
			{
				reset_on_max_stacks = true,
				on_max_stacks_func = "add_remove_buffs",
				max_stacks = 5,
				is_cooldown = true,
				icon = "bardin_engineer_melee_power_free_shot",
				max_stack_data = {
					buffs_to_add = {
						"bardin_engineer_melee_power_range_power_starter"
					}
				}
			}
		}
	},
	bardin_engineer_melee_power_range_power_starter = {
		buffs = {
			{
				buff_to_add = "bardin_engineer_melee_power_range_power_buff",
				max_stacks = 1,
				buff_func = "bardin_engineer_power_on_next_range",
				event = "on_start_action",
				icon = "bardin_engineer_melee_power_free_shot"
			}
		}
	},
	bardin_engineer_melee_power_range_power_buff = {
		buffs = {
			{
				icon = "bardin_engineer_melee_power_free_shot",
				multiplier = 0.15,
				stat_buff = "power_level_ranged",
				max_stacks = 1,
				duration = 10
			}
		}
	},
	bardin_engineer_melee_power_free_shot = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "power_level_melee",
				buff_func = "on_kill_add_remove",
				event = "on_kill",
				on_kill_add_remove_data = {
					weapon_type = "melee",
					requirements = {
						buffs_not_exist = {
							"bardin_engineer_melee_power_free_shot_counter_buff"
						}
					},
					buffs_to_add = {
						"bardin_engineer_melee_power_free_shot_counter"
					}
				}
			}
		}
	},
	bardin_engineer_melee_power_free_shot_stat = {
		buffs = {
			{
				stat_buff = "power_level_melee",
				max_stacks = 1
			}
		}
	},
	bardin_engineer_melee_power_free_shot_counter = {
		buffs = {
			{
				reset_on_max_stacks = true,
				max_stacks = 5,
				on_max_stacks_func = "add_remove_buffs",
				icon = "bardin_ranger_increased_melee_damage_on_no_ammo",
				max_stack_data = {
					buffs_to_add = {
						"bardin_engineer_melee_power_free_shot_counter_buff"
					}
				}
			}
		}
	},
	bardin_engineer_melee_power_free_shot_counter_buff = {
		buffs = {
			{
				event = "on_ammo_used",
				icon = "victor_bountyhunter_passive_infinite_ammo",
				max_stacks = 1,
				buff_func = "dummy_function",
				remove_on_proc = true,
				priority_buff = true,
				perk = buff_perks.infinite_ammo
			}
		}
	},
	bardin_engineer_power_on_max_pump_buff = {
		buffs = {
			{
				stat_buff = "power_level",
				icon = "bardin_engineer_party_ability_charge",
				priority_buff = true,
				refresh_durations = true
			}
		}
	},
	bardin_engineer_power_on_max_pump_buff_on_remove = {
		buffs = {
			{
				buffs_to_remove_on_remove = {
					"bardin_engineer_pump_buff_long",
					"bardin_engineer_pump_buff"
				}
			}
		}
	},
	bardin_engineer_stacks_stay = {
		buffs = {
			{
				perk = buff_perks.engineer_persistent_pump_stacks,
				buffs_to_remove_on_remove = {
					"bardin_engineer_pump_buff_long",
					"bardin_engineer_pump_buff"
				}
			}
		}
	},
	bardin_engineer_long_stacks_on_remove = {
		buffs = {
			{
				buffs_to_remove_on_remove = {
					"bardin_engineer_pump_buff_long",
					"bardin_engineer_pump_buff"
				}
			}
		}
	},
	bardin_engineer_stacking_damage_reduction = {
		buffs = {
			{
				buff_to_add = "bardin_engineer_stacking_damage_reduction_buff",
				update_func = "add_buff_server_controlled",
				buff_func = "remove_buff_stack",
				event = "on_damage_taken",
				remove_buff_func = "remove_buff_server_controlled",
				remove_buff_stack_data = {
					{
						reset_update_timer = true,
						buff_to_remove = "bardin_engineer_stacking_damage_reduction_buff",
						num_stacks = 1,
						server_controlled = true,
						ignored_damage_sources = {
							"overcharge"
						}
					}
				}
			}
		}
	},
	bardin_engineer_stacking_damage_reduction_buff = {
		buffs = {
			{
				stat_buff = "damage_taken",
				icon = "bardin_engineer_stacking_damage_reduction"
			}
		}
	},
	bardin_engineer_upgraded_grenades = {
		buffs = {
			{
				perk = buff_perks.frag_fire_grenades
			}
		}
	},
	bardin_engineer_piston_powered = {
		buffs = {
			{
				buff_to_add = "bardin_engineer_piston_powered_buff",
				buff_to_check = "bardin_engineer_piston_powered_delay",
				buff_to_remove = "bardin_engineer_piston_powered_ready",
				buff_func = "bardin_engineer_piston_power_add",
				event = "on_hit",
				apply_buff_func = "bardin_engineer_piston_power_add_apply",
				buffs_to_remove_on_remove = {
					"bardin_engineer_piston_powered_delay",
					"bardin_engineer_piston_powered_ready"
				}
			}
		}
	},
	bardin_engineer_piston_powered_buff = {
		activation_sound = "hud_talent_engineer_piston_power",
		buffs = {
			{
				multiplier = 2,
				stat_buff = "power_level_impact",
				duration = 0.2,
				perk = buff_perks.explosive_stagger
			}
		}
	},
	bardin_engineer_piston_powered_delay = {
		buffs = {
			{
				buff_to_add = "bardin_engineer_piston_powered_ready",
				is_cooldown = true,
				icon = "bardin_engineer_no_overheat_explosion",
				duration_end_func = "add_buff_local",
				max_stacks = 1,
				refresh_durations = true
			}
		}
	},
	bardin_engineer_piston_powered_ready = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_engineer_no_overheat_explosion",
				event = "on_start_action",
				buff_func = "bardin_engineer_piston_power_sound"
			}
		}
	},
	bardin_engineer_increased_ability_bar = {
		buffs = {
			{
				buff_to_add = "bardin_engineer_increased_ability_bar_buff",
				buff_func = "add_buff_on_special_kill",
				event = "on_kill",
				remove_buff_func = "remove_modify_ability_max_cooldown",
				apply_buff_func = "add_modify_ability_max_cooldown"
			}
		}
	},
	bardin_engineer_increased_ability_bar_buff = {
		buffs = {
			{
				max_stacks = 1,
				refresh_durations = true,
				icon = "bardin_engineer_increased_ability_bar",
				perk = buff_perks.free_ability_engineer
			}
		}
	}
}
local talent_trees = {
	{
		{
			"bardin_engineer_vanguard",
			"bardin_engineer_reaper",
			"bardin_engineer_heal_share"
		},
		{
			"bardin_engineer_ranged_crit_count",
			"bardin_engineer_ranged_pierce",
			"bardin_engineer_melee_power_ranged_power"
		},
		{
			"bardin_engineer_tank_unbalance",
			"bardin_engineer_linesman_unbalance",
			"bardin_engineer_power_level_unbalance"
		},
		{
			"bardin_engineer_power_on_max_pump",
			"bardin_engineer_stacks_stay",
			"bardin_engineer_pump_buff_long"
		},
		{
			"bardin_engineer_stacking_damage_reduction",
			"bardin_engineer_upgraded_grenades",
			"bardin_engineer_piston_powered"
		},
		{
			"bardin_engineer_armor_piercing_ability",
			"bardin_engineer_reduced_ability_fire_slowdown",
			"bardin_engineer_increased_ability_bar"
		}
	}
}
local talents = {
	{
		description = "vanguard_desc",
		name = "bardin_engineer_vanguard",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_engineer_vanguard",
		description_values = {},
		buffs = {
			"bardin_engineer_vanguard"
		}
	},
	{
		description = "reaper_desc",
		name = "bardin_engineer_reaper",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_engineer_reaper",
		description_values = {
			{
				value = BuffTemplates.reaper.buffs[1].max_targets
			}
		},
		buffs = {
			"bardin_engineer_reaper"
		}
	},
	{
		description = "conqueror_desc_3",
		name = "bardin_engineer_heal_share",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_engineer_heal_share",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		buffs = {
			"bardin_engineer_heal_share"
		}
	},
	{
		description = "bardin_engineer_ranged_crit_count_desc",
		name = "bardin_engineer_ranged_crit_count",
		num_ranks = 1,
		icon = "bardin_engineer_ranged_crit_count",
		description_values = {
			{
				value = buff_tweak_data.bardin_engineer_ranged_crit_counter_buff.max_stacks
			}
		},
		buffs = {
			"bardin_engineer_ranged_crit_count"
		}
	},
	{
		description = "bardin_engineer_ranged_pierce_desc_2",
		name = "bardin_engineer_ranged_pierce",
		num_ranks = 1,
		icon = "bardin_engineer_ranged_pierce",
		description_values = {
			{
				value = buff_tweak_data.bardin_engineer_ranged_pierce.bonus
			}
		},
		buffs = {
			"bardin_engineer_ranged_pierce"
		}
	},
	{
		description = "bardin_engineer_melee_power_ranged_power_desc",
		name = "bardin_engineer_melee_power_ranged_power",
		icon = "bardin_engineer_melee_power_free_shot",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_engineer_melee_power_free_shot_stat.multiplier
			},
			{
				value = buff_tweak_data.bardin_engineer_melee_power_free_shot_counter.max_stacks
			},
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_engineer_melee_power_range_power_buff.multiplier
			},
			{
				value = buff_tweak_data.bardin_engineer_melee_power_range_power_buff.duration
			}
		},
		client_buffs = {
			"bardin_engineer_melee_power_ranged_power"
		},
		server_buffs = {
			"bardin_engineer_melee_power_free_shot_stat"
		}
	},
	{
		description = "tank_unbalance_desc",
		name = "bardin_engineer_tank_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_engineer_tank_unbalance",
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
		description = "linesman_unbalance_desc",
		name = "bardin_engineer_linesman_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_engineer_linesman_unbalance",
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
		name = "bardin_engineer_power_level_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_engineer_power_level_unbalance",
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
		description = "bardin_engineer_power_on_max_pump_desc",
		name = "bardin_engineer_power_on_max_pump",
		num_ranks = 1,
		icon = "bardin_engineer_party_ability_charge",
		description_values = {
			{
				value = buff_tweak_data.bardin_engineer_power_on_max_pump.stacks_for_buff
			},
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_engineer_power_on_max_pump_buff.multiplier
			},
			{
				value = buff_tweak_data.bardin_engineer_power_on_max_pump_buff.duration
			}
		},
		buffs = {
			"bardin_engineer_power_on_max_pump_buff_on_remove"
		}
	},
	{
		description = "bardin_engineer_stacks_stay_desc",
		name = "bardin_engineer_stacks_stay",
		num_ranks = 1,
		icon = "bardin_engineer_fast_ability_charge",
		description_values = {},
		buffs = {
			"bardin_engineer_stacks_stay"
		}
	},
	{
		description = "bardin_engineer_pump_buff_long_desc",
		name = "bardin_engineer_pump_buff_long",
		num_ranks = 1,
		icon = "bardin_engineer_passive_ability_charge",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_engineer_pump_buff_long_attack_speed.multiplier
			}
		},
		buffs = {
			"bardin_engineer_long_stacks_on_remove"
		}
	},
	{
		description = "bardin_engineer_stacking_damage_reduction_desc",
		name = "bardin_engineer_stacking_damage_reduction",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_engineer_stacking_damage_reduction",
		description_values = {
			{
				value = buff_tweak_data.bardin_engineer_stacking_damage_reduction.update_frequency
			},
			{
				value = buff_tweak_data.bardin_engineer_stacking_damage_reduction_buff.max_stacks
			},
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_engineer_stacking_damage_reduction_buff.multiplier
			}
		},
		buffs = {
			"bardin_engineer_stacking_damage_reduction"
		}
	},
	{
		description = "bardin_engineer_upgraded_grenades_desc",
		name = "bardin_engineer_upgraded_grenades",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_engineer_upgraded_grenades",
		description_values = {},
		buffs = {
			"bardin_engineer_upgraded_grenades"
		}
	},
	{
		description = "bardin_engineer_piston_powered_desc",
		name = "bardin_engineer_piston_powered",
		buffer = "both",
		num_ranks = 1,
		icon = "bardin_engineer_no_overheat_explosion",
		description_values = {
			{
				value = buff_tweak_data.bardin_engineer_piston_powered_delay.duration
			}
		},
		buffs = {
			"bardin_engineer_piston_powered"
		}
	},
	{
		description = "bardin_engineer_armor_piercing_ability_desc",
		name = "bardin_engineer_armor_piercing_ability",
		num_ranks = 1,
		icon = "bardin_engineer_armor_piercing_ability",
		talent_career_weapon_index = 2,
		description_values = {},
		buffs = {}
	},
	{
		description = "bardin_engineer_reduced_ability_fire_slowdown_desc",
		name = "bardin_engineer_reduced_ability_fire_slowdown",
		num_ranks = 1,
		icon = "bardin_engineer_reduced_ability_fire_slowdown",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_engineer_reduced_ability_fire_slowdown.display_multiplier
			}
		},
		buffs = {}
	},
	{
		description = "bardin_engineer_increased_ability_bar_desc",
		name = "bardin_engineer_increased_ability_bar",
		num_ranks = 1,
		icon = "bardin_engineer_increased_ability_bar",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_engineer_increased_ability_bar.multiplier
			},
			{
				value = buff_tweak_data.bardin_engineer_increased_ability_bar_buff.duration
			}
		},
		buffs = {
			"bardin_engineer_increased_ability_bar"
		}
	}
}
local hero_name = "dwarf_ranger"

table.merge(TalentBuffTemplates[hero_name], talent_buff_templates)
table.append(TalentTrees[hero_name], talent_trees)
table.append(Talents[hero_name], talents)

WeaveLoadoutSettings = WeaveLoadoutSettings or {}
WeaveLoadoutSettings.dr_engineer = {
	talent_tree = talent_trees[1],
	properties = {},
	traits = {}
}

BuffUtils.copy_talent_buff_names(talent_buff_templates)
BuffUtils.apply_buff_tweak_data(talent_buff_templates, buff_tweak_data)
