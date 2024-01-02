require("scripts/settings/profiles/career_constants")

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
	bardin_engineer_vanguard = {},
	bardin_engineer_reaper = {},
	bardin_engineer_heal_share = {},
	bardin_engineer_2_1 = {},
	bardin_engineer_2_1_cooldown = {
		duration = 80
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
	bardin_engineer_4_1_buff = {
		multiplier = 0.15
	},
	bardin_engineer_pump_buff_power = {
		multiplier = 0.04
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
	bardin_engineer_pump_buff = {
		buffs = {
			{
				max_stacks = 5,
				multiplier = 0.4,
				stat_buff = "cooldown_regen",
				icon = "bardin_engineer_passive",
				on_max_stacks_overflow_func = "add_remove_buffs",
				refresh_durations = true,
				duration = 12,
				apply_buff_func = "add_buffs",
				buff_to_remove = "bardin_engineer_pump_buff_power",
				on_max_stacks_func = "add_remove_buffs",
				remove_buff_func = "remove_buff_local",
				duration_modifier_func = function (owner_unit, sub_buff_template, duration, buff_extension, params)
					local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")

					if talent_extension:has_talent("bardin_engineer_pump_buff_long") then
						return nil, nil
					end

					return duration, sub_buff_template.ticks
				end,
				max_stack_data = {
					buffs_to_add = {
						"bardin_engineer_pump_max_overheat_check"
					},
					talent_buffs = {
						bardin_engineer_power_on_max_pump = {
							buffs_to_add = {
								{
									name = "bardin_engineer_4_1_buff"
								}
							}
						}
					}
				},
				add_buffs_data = {
					sync_buffs = true,
					buffs_to_add = {
						"bardin_engineer_pump_buff_power"
					}
				},
				buffs_to_remove_on_remove = {
					"bardin_engineer_4_1_buff",
					"bardin_engineer_pump_overclock_buff",
					"bardin_engineer_pump_max_exhaustion_buff"
				}
			}
		}
	},
	bardin_engineer_pump_buff_power = {
		buffs = {
			{
				max_stacks = 5,
				stat_buff = "power_level",
				apply_condition = function (owner_unit, template, params)
					local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")

					return talent_extension:has_talent("bardin_engineer_pump_buff_long")
				end
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
				perks = {
					buff_perks.tank_healing
				}
			}
		}
	},
	bardin_engineer_reaper = {
		buffs = {
			{
				multiplier = -0.05,
				name = "reaper",
				buff_func = "heal_damage_targets_on_melee",
				event = "on_damage_dealt",
				max_targets = 5,
				bonus = 0.25,
				perks = {
					buff_perks.linesman_healing
				}
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
	bardin_engineer_2_1 = {
		buffs = {
			{
				update_start_delay = 80,
				update_func = "bardin_engineer_bomb_grant",
				cooldown_buff = "bardin_engineer_2_1_cooldown",
				update_frequency = 80,
				perks = {
					buff_perks.no_explosion_friendly_fire
				}
			}
		}
	},
	bardin_engineer_2_1_cooldown = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_engineer_fast_ability_charge",
				is_cooldown = true,
				refresh_durations = true
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
				max_stacks = 1,
				buff_func = "dummy_function",
				remove_on_proc = true,
				icon = "victor_bountyhunter_passive_infinite_ammo",
				priority_buff = true,
				perks = {
					buff_perks.infinite_ammo
				}
			}
		}
	},
	bardin_engineer_4_1_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_engineer_party_ability_charge",
				stat_buff = "attack_speed"
			}
		}
	},
	bardin_engineer_4th_row_cleanup = {
		buffs = {
			{
				buffs_to_remove_on_remove = {
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
	bardin_engineer_5_2 = {
		buffs = {
			{
				perks = {
					buff_perks.frag_fire_grenades
				}
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
				perks = {
					buff_perks.explosive_stagger
				}
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
				perks = {
					buff_perks.free_ability_engineer
				}
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
			"bardin_engineer_improved_explosives",
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
			"bardin_engineer_overclock",
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
		description = "bardin_engineer_improved_explosives_desc",
		name = "bardin_engineer_improved_explosives",
		buffer = "both",
		num_ranks = 1,
		icon = "bardin_engineer_fast_ability_charge",
		description_values = {
			{
				value = buff_tweak_data.bardin_engineer_2_1_cooldown.duration
			}
		},
		buffs = {
			"bardin_engineer_2_1",
			"bardin_engineer_2_1_cooldown"
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
		description = "bardin_engineer_power_on_max_pump_desc_b",
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
			}
		},
		buffs = {
			"bardin_engineer_4th_row_cleanup"
		}
	},
	{
		description = "bardin_engineer_overclock_desc",
		name = "bardin_engineer_overclock",
		num_ranks = 1,
		icon = "bardin_engineer_4_2",
		description_values = {
			{
				value_type = "percent",
				value = CareerConstants.dr_engineer.talent_4_2_cooldown
			},
			{
				value_type = "percent",
				value = CareerConstants.dr_engineer.talent_4_2_crit
			},
			{
				value_type = "percent",
				value = CareerConstants.dr_engineer.talent_4_2_damage_taken
			}
		},
		buffs = {
			"bardin_engineer_4th_row_cleanup"
		}
	},
	{
		description = "bardin_engineer_pump_buff_long_desc_b",
		name = "bardin_engineer_pump_buff_long",
		num_ranks = 1,
		icon = "bardin_engineer_passive_ability_charge",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_engineer_pump_buff_power.multiplier
			}
		},
		buffs = {
			"bardin_engineer_4th_row_cleanup"
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
		description = "bardin_engineer_upgraded_grenades_desc_b",
		name = "bardin_engineer_upgraded_grenades",
		buffer = "both",
		num_ranks = 1,
		icon = "bardin_engineer_upgraded_grenades",
		description_values = {
			{
				value = CareerConstants.dr_engineer.num_starting_bombs
			}
		},
		buffs = {
			"bardin_engineer_5_2"
		}
	},
	{
		description = "bardin_engineer_piston_powered_desc_b",
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
		talent_career_weapon_index = 1,
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
