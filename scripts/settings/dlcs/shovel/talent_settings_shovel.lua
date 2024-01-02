local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")

require("scripts/entity_system/systems/buff/buff_sync_type")
require("scripts/settings/profiles/career_constants")

SHOVEL_BUFF_TWEAK_DATA = {
	sienna_necromancer_passive_balefire = {
		multiplier = 0.2
	},
	sienna_necromancer_perk_dot_duration = {
		multiplier = CareerConstants.bw_necromancer.passive_dot_duration
	},
	sienna_necromancer_ability_cooldown_on_hit = {
		bonus = 0.25
	},
	sienna_necromancer_ability_cooldown_on_damage_taken = {
		bonus = 0.25
	},
	sienna_necromancer_2_1 = {
		skeleton_count = 4
	},
	sienna_necromancer_2_1_attack_speed = {
		multiplier = 0.12
	},
	sienna_necromancer_2_2_buff = {
		max_stacks = 5,
		multiplier = 0.05,
		duration = 6
	},
	sienna_necromancer_2_3 = {
		multiplier = 0.25
	},
	sienna_necromancer_4_2_soul_rip_stack = {
		max_stacks = 8
	},
	sienna_necromancer_4_3_withering_touch = {
		duration = 15
	},
	sienna_necromancer_5_1_reduced_overcharge = {
		multiplier = 0.15
	},
	sienna_necromancer_5_1_buff = {
		duration = 6,
		multiplier = 0.3
	},
	sienna_necromancer_5_2_counter = {
		max_stacks = 3
	},
	sienna_necromancer_5_2_buff = {
		multiplier = -0.8
	},
	sienna_necromancer_5_3 = {
		overcharge_threshold = 0.12
	},
	sienna_necromancer_6_1 = {
		controlled_unit_template = "necromancer_pet",
		num_skeletons = 5,
		breed_to_spawn = "pet_skeleton"
	},
	sienna_necromancer_cursed_area = {
		duration = 10
	},
	sienna_necromancer_command_item_sacrifice = {
		multiplier = 0.7
	},
	sienna_necromancer_command_item_attack = {
		multiplier = 0.6,
		duration = 8
	},
	sienna_necromancer_command_item_defend = {
		multiplier = 0.8
	}
}
local talent_buff_templates = {
	sienna_necromancer_passive_balefire = {
		buffs = {
			{
				stat_buff = "increased_damage_to_balefire",
				name = "sienna_necromancer_passive_balefire"
			}
		}
	},
	sienna_necromancer_perk_dot_duration = {
		buffs = {
			{
				stat_buff = "increased_balefire_dot_duration",
				name = "sienna_necromancer_perk_dot_duration"
			}
		}
	},
	sienna_necromancer_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				buff_func = "reduce_activated_ability_cooldown"
			}
		}
	},
	sienna_necromancer_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken"
			}
		}
	},
	sienna_necromancer_1_1 = {
		buffs = {
			{
				max_targets = 5,
				multiplier = -0.05,
				buff_func = "heal_damage_targets_on_melee",
				event = "on_player_damage_dealt",
				bonus = 0.25,
				perks = {
					buff_perks.linesman_healing
				}
			}
		}
	},
	sienna_necromancer_1_2 = {
		buffs = {
			{
				multiplier = 0.45,
				heal_cap = 0.25,
				buff_func = "heal_percentage_of_enemy_hp_on_melee_kill",
				event = "on_kill",
				perks = {
					buff_perks.smiter_healing
				}
			}
		}
	},
	sienna_necromancer_1_3 = {
		buffs = {
			{
				event = "on_healed_consumeable",
				multiplier = 0.2,
				range = 10,
				buff_func = "heal_other_players_percent_at_range"
			}
		}
	},
	sienna_necromancer_2_1 = {
		buffs = {
			{
				event = "on_controlled_unit_added",
				buff_to_add = "sienna_necromancer_2_1_attack_speed",
				buff_func = "thank_you_skeletal_add"
			}
		}
	},
	sienna_necromancer_2_1_removed_tracker = {
		buffs = {
			{
				event = "on_controlled_unit_removed",
				buff_to_remove = "sienna_necromancer_2_1_attack_speed",
				buff_func = "thank_you_skeletal_remove",
				skeleton_count = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_2_1.skeleton_count
			}
		}
	},
	sienna_necromancer_2_1_attack_speed = {
		buffs = {
			{
				max_stacks = 1,
				icon = "sienna_necromancer_2_1",
				stat_buff = "attack_speed"
			}
		}
	},
	sienna_necromancer_2_2 = {
		buffs = {
			{
				event = "on_spell_used",
				buff_to_add = "sienna_necromancer_2_2_buff",
				buff_func = "add_buff_local"
			}
		}
	},
	sienna_necromancer_2_2_buff = {
		buffs = {
			{
				refresh_durations = true,
				icon = "sienna_necromancer_2_2",
				stat_buff = "power_level_ranged"
			}
		}
	},
	sienna_necromancer_2_3 = {
		buffs = {
			{
				stat_buff = "power_level_critical_strike",
				perks = {
					buff_perks.crit_unlimited_cleave
				}
			}
		}
	},
	sienna_necromancer_4_1_cursed_blood = {
		buffs = {
			{
				event = "on_damage_dealt",
				radius = 3.5,
				propagation_multiplier = 0.25,
				buff_func = "necromancer_crit_burst"
			}
		}
	},
	sienna_necromancer_4_2_soul_rip = {
		buffs = {
			{
				event = "on_kill",
				remove_buff_func = "necromancer_remove_orb_buffs",
				buff_func = "spawn_ripped_soul",
				orb_settings = {
					orb_name = "necromancer_ripped_soul"
				}
			}
		}
	},
	sienna_necromancer_4_2_soul_rip_stack = {
		buffs = {
			{
				reset_on_max_stacks = true,
				is_cooldown = true,
				on_max_stacks_func = "add_remove_buffs",
				icon = "sienna_necromancer_4_2",
				max_stack_data = {
					buffs_to_add = {
						"sienna_necromancer_4_2_execute"
					}
				}
			}
		}
	},
	sienna_necromancer_4_2_soul_rip_handler = {
		buffs = {
			{
				event = "on_critical_action",
				max_stacks = 1,
				buff_to_remove = "sienna_necromancer_4_2_execute",
				buff_func = "remove_ref_buff_stack_woods"
			}
		}
	},
	sienna_necromancer_4_2_execute = {
		buffs = {
			{
				icon = "sienna_necromancer_4_2",
				priority_buff = true,
				perks = {
					buff_perks.guaranteed_crit
				},
				max_stacks = math.huge
			}
		}
	},
	sienna_necromancer_4_3_withering_touch = {
		buffs = {
			{
				max_stacks = 1,
				refresh_durations = true,
				buff_func = "apply_dot_on_hit",
				event = "on_hit",
				icon = "sienna_necromancer_4_3",
				dot_template_name = "sienna_necromancer_4_3_dot"
			}
		}
	},
	sienna_necromancer_4_3_dot = {
		buffs = {
			{
				damage_profile = "sienna_necromancer_4_3_dot_damage",
				name = "sienna_necromancer_4_3_dot",
				update_func = "apply_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 0.9,
				time_between_dot_damages = 0.9,
				damage_type = "burninating",
				max_stacks = 3,
				duration = 4,
				perks = {
					buff_perks.burning_balefire
				}
			}
		}
	},
	sienna_necromancer_5_1_reduced_overcharge = {
		buffs = {
			{
				event = "on_kill",
				buff_func = "sienna_necromancer_5_1_on_kill"
			}
		}
	},
	sienna_necromancer_5_1_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "sienna_necromancer_5_1",
				stat_buff = "cooldown_regen",
				refresh_durations = true
			}
		}
	},
	sienna_necromancer_5_1_cdr = {
		buffs = {
			{
				stat_buff = "cooldown_regen",
				multiplier = 0.3
			}
		}
	},
	sienna_necromancer_5_1_reduce_hp = {
		buffs = {
			{
				stat_buff = "max_health",
				multiplier = -0.3
			}
		}
	},
	sienna_necromancer_5_2 = {
		buffs = {
			{
				event = "on_ability_activated",
				buff_func = "cursed_vigor_proc",
				buffs_to_add = table.fill({}, SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_5_2_counter.max_stacks, "sienna_necromancer_5_2_counter")
			}
		}
	},
	sienna_necromancer_5_2_counter = {
		buffs = {
			{
				synced_buff_to_add = "sienna_necromancer_5_2_buff",
				on_stack_buff_first_add = "add_buff_synced",
				on_last_stack_removed = "remove_buff_synced",
				icon = "sienna_necromancer_5_2",
				synced_buff_to_remove = "sienna_necromancer_5_2_buff",
				sync_type = BuffSyncType.ClientAndServer
			}
		}
	},
	sienna_necromancer_5_2_counter_remover = {
		buffs = {
			{
				event = "on_damage_taken",
				buff_func = "remove_buff_stack",
				remove_buff_stack_data = {
					{
						buff_to_remove = "sienna_necromancer_5_2_counter",
						num_stacks = 1
					}
				}
			}
		}
	},
	sienna_necromancer_5_2_buff = {
		buffs = {
			{
				stat_buff = "damage_taken"
			}
		}
	},
	sienna_necromancer_5_3 = {
		buffs = {
			{
				event = "on_overcharge_lost",
				apply_buff_func = "necromancer_5_3_setup",
				buff_func = "trapped_souls_overcharge_lost"
			}
		}
	},
	sienna_necromancer_6_1 = {
		buffs = {
			{}
		}
	},
	sienna_necromancer_6_2_pet_buff = {
		buffs = {
			{
				event = "on_damage_dealt",
				dot_template_name = "sienna_necromancer_4_3_dot",
				buff_func = "apply_dot_on_hit"
			}
		}
	},
	sienna_necromancer_cursed_area = {
		buffs = {
			{
				icon = "sienna_necromancer_6_3",
				name = "sienna_necromancer_cursed_area",
				buff_area_buff = "sienna_necromancer_empowered_overcharge",
				area_unit_name = "units/hub_elements/empty",
				enter_area_func = "enter_buff_area",
				refresh_durations = false,
				refresh_buff_area_position = true,
				buff_self = true,
				area_radius = 8,
				buff_area = true,
				max_stacks = 1,
				exit_area_func = "exit_buff_area"
			}
		}
	},
	sienna_necromancer_cursed_area_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "sienna_necromancer_6_3",
				apply_buff_func = "necromancer_cursed_area_buff",
				remove_buff_func = "necromancer_cursed_area_buff_remove"
			}
		}
	},
	sienna_necromancer_6_3_available_charge = {
		buffs = {
			{}
		}
	},
	sienna_necromancer_6_3_cooldown_charge = {
		buffs = {
			{
				buff_to_add = "sienna_necromancer_6_3_available_charge",
				icon = "sienna_necromancer_6_3",
				duration_end_func = "add_buff_local",
				is_cooldown = true,
				duration = 2
			}
		}
	}
}
local talent_trees = {
	{
		{
			"sienna_necromancer_1_1",
			"sienna_necromancer_1_2",
			"sienna_necromancer_1_3"
		},
		{
			"sienna_necromancer_2_1",
			"sienna_necromancer_2_2",
			"sienna_necromancer_2_3"
		},
		{
			"sienna_necromancer_3_1",
			"sienna_necromancer_3_2",
			"sienna_necromancer_3_3"
		},
		{
			"sienna_necromancer_4_1",
			"sienna_necromancer_4_2",
			"sienna_necromancer_4_3"
		},
		{
			"sienna_necromancer_5_1",
			"sienna_necromancer_5_2",
			"sienna_necromancer_5_3"
		},
		{
			"sienna_necromancer_6_1",
			"sienna_necromancer_6_2",
			"sienna_necromancer_6_3"
		}
	}
}
local talents = {
	{
		description = "reaper_desc",
		name = "sienna_necromancer_1_1",
		buffer = "server",
		num_ranks = 1,
		icon = "sienna_necromancer_1_1",
		description_values = {
			{
				value = BuffTemplates.reaper.buffs[1].max_targets
			}
		},
		buffs = {
			"sienna_necromancer_1_1"
		}
	},
	{
		description = "bloodlust_desc_3",
		name = "sienna_necromancer_1_2",
		buffer = "server",
		num_ranks = 1,
		icon = "sienna_necromancer_1_2",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.bloodlust.buffs[1].multiplier
			}
		},
		buffs = {
			"sienna_necromancer_1_2"
		}
	},
	{
		description = "conqueror_desc_3",
		name = "sienna_necromancer_1_3",
		buffer = "server",
		num_ranks = 1,
		icon = "sienna_necromancer_1_3",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		buffs = {
			"sienna_necromancer_1_3"
		}
	},
	{
		description = "sienna_necromancer_2_1_desc",
		name = "sienna_necromancer_2_1",
		buffer = "client",
		num_ranks = 1,
		icon = "sienna_necromancer_2_1",
		description_values = {
			{
				value_type = "percent",
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_2_1_attack_speed.multiplier
			},
			{
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_2_1.skeleton_count
			}
		},
		buffs = {
			"sienna_necromancer_2_1",
			"sienna_necromancer_2_1_removed_tracker"
		}
	},
	{
		description = "sienna_necromancer_2_2_desc",
		name = "sienna_necromancer_2_2",
		buffer = "client",
		num_ranks = 1,
		icon = "sienna_necromancer_2_2",
		description_values = {
			{
				value_type = "percent",
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_2_2_buff.multiplier
			},
			{
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_2_2_buff.duration
			},
			{
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_2_2_buff.max_stacks
			}
		},
		buffs = {
			"sienna_necromancer_2_2"
		}
	},
	{
		description = "sienna_necromancer_2_3_desc",
		name = "sienna_necromancer_2_3",
		buffer = "both",
		num_ranks = 1,
		icon = "sienna_necromancer_2_3",
		description_values = {
			{
				value_type = "percent",
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_2_3.multiplier
			}
		},
		buffs = {
			"sienna_necromancer_2_3"
		}
	},
	{
		description = "linesman_unbalance_desc",
		name = "sienna_necromancer_3_1",
		buffer = "server",
		num_ranks = 1,
		icon = "sienna_necromancer_3_2",
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
		description = "smiter_unbalance_desc",
		name = "sienna_necromancer_3_2",
		buffer = "server",
		num_ranks = 1,
		icon = "sienna_necromancer_3_1",
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
		name = "sienna_necromancer_3_3",
		buffer = "server",
		num_ranks = 1,
		icon = "sienna_necromancer_3_3",
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
		description = "sienna_necromancer_4_1_desc",
		name = "sienna_necromancer_4_1",
		buffer = "server",
		num_ranks = 1,
		icon = "sienna_necromancer_4_1",
		description_values = {},
		buffs = {
			"sienna_necromancer_4_1_cursed_blood"
		}
	},
	{
		description = "sienna_necromancer_4_2_desc",
		name = "sienna_necromancer_4_2",
		num_ranks = 1,
		icon = "sienna_necromancer_4_2",
		description_values = {
			{
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_4_2_soul_rip_stack.max_stacks
			}
		},
		buffs = {
			"sienna_necromancer_4_2_soul_rip",
			"sienna_necromancer_4_2_soul_rip_handler"
		}
	},
	{
		description = "sienna_necromancer_4_3_desc",
		name = "sienna_necromancer_4_3",
		buffer = "client",
		num_ranks = 1,
		icon = "sienna_necromancer_4_3",
		description_values = {
			{
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_4_3_withering_touch.duration
			}
		},
		buffs = {}
	},
	{
		description = "sienna_necromancer_5_1_desc",
		name = "sienna_necromancer_5_1",
		buffer = "both",
		num_ranks = 1,
		icon = "sienna_necromancer_5_1",
		description_values = {
			{
				value_type = "percent",
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_5_1_reduced_overcharge.multiplier
			},
			{
				value = 6
			}
		},
		buffs = {
			"sienna_necromancer_5_1_reduced_overcharge"
		}
	},
	{
		description = "sienna_necromancer_5_2_desc",
		name = "sienna_necromancer_5_2",
		buffer = "client",
		num_ranks = 1,
		icon = "sienna_necromancer_5_2",
		description_values = {
			{
				value_type = "percent",
				value = -SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_5_2_buff.multiplier
			},
			{
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_5_2_counter.max_stacks
			}
		},
		buffs = {
			"sienna_necromancer_5_2",
			"sienna_necromancer_5_2_counter_remover"
		}
	},
	{
		description = "sienna_necromancer_5_3_desc",
		name = "sienna_necromancer_5_3",
		buffer = "client",
		num_ranks = 1,
		icon = "sienna_necromancer_5_3",
		description_values = {
			{
				value_type = "percent",
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_5_3.overcharge_threshold
			},
			{
				value = 2
			}
		},
		buffs = {
			"sienna_necromancer_5_3"
		},
		requires_packages = {
			trapped_soul_skull = {
				"units/beings/player/bright_wizard_necromancer/talents/trapped_soul_skull"
			}
		}
	},
	{
		description = "sienna_necromancer_6_1_desc_b",
		name = "sienna_necromancer_6_1",
		buffer = "both",
		num_ranks = 1,
		icon = "sienna_necromancer_6_1",
		description_values = {
			{
				value = 6
			},
			{
				value = 20
			}
		},
		buffs = {
			"sienna_necromancer_6_1"
		}
	},
	{
		description = "sienna_necromancer_6_2_desc",
		name = "sienna_necromancer_6_2",
		buffer = "both",
		num_ranks = 1,
		icon = "sienna_necromancer_6_2",
		description_values = {},
		buffs = {}
	},
	{
		description = "sienna_necromancer_6_3_desc",
		name = "sienna_necromancer_6_3",
		buffer = "client",
		num_ranks = 1,
		icon = "sienna_necromancer_6_3",
		description_values = {
			{
				value = 0.5,
				value_type = "percent"
			}
		},
		buffs = {}
	}
}
local hero_name = "bright_wizard"

table.merge(TalentBuffTemplates[hero_name], talent_buff_templates)
table.append(TalentTrees[hero_name], talent_trees)
table.append(Talents[hero_name], talents)

WeaveLoadoutSettings = WeaveLoadoutSettings or {}
WeaveLoadoutSettings.bw_necromancer = {
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

BuffUtils.apply_buff_tweak_data(talent_buff_templates, SHOVEL_BUFF_TWEAK_DATA)
