-- chunkname: @scripts/settings/dlcs/bless/talent_settings_bless.lua

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local buff_tweak_data = {
	victor_priest_ability_cooldown_on_hit = {
		bonus = 0.25,
	},
	victor_priest_ability_cooldown_on_damage_taken = {
		bonus = 0.25,
	},
	victor_priest_2_1 = {
		num_targets = 3,
	},
	victor_priest_2_1_buff = {
		duration = 4,
	},
	victor_priest_2_2_timer = {
		duration = 2,
	},
	victor_priest_2_2_buff = {
		max_stacks = 5,
		multiplier = 0.08,
	},
	victor_priest_2_3_buff = {
		bonus = 0.05,
		duration = 12,
		max_stacks = 3,
	},
	victor_priest_4_3 = {
		chunk_size = 40,
		percent_fury_to_gain = 0.02,
	},
	victor_priest_5_1_buff = {
		multiplier = 0.25,
	},
	victor_priest_5_2_buff = {
		multiplier = 0.25,
	},
	victor_priest_5_3_buff = {
		multiplier = 0.15,
	},
	victor_priest_6_3_buff = {
		heal_window = 3,
	},
}
local talent_buff_templates = {
	victor_priest_ability_cooldown_on_hit = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown",
				event = "on_hit",
			},
		},
	},
	victor_priest_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	victor_priest_passive_damage_stagger = {
		buffs = {
			{
				buff_func = "victor_priest_damage_stagger",
				buff_to_add = "damage_stagger",
				event = "on_damage_taken",
				multiplier = -0.4,
				percentage_to_take = 0.2,
				staggered_damage_taken = 0.4,
				stat_buff = "damage_taken",
			},
		},
	},
	damage_stagger = {
		buffs = {
			{
				damage_per_tick = 5,
				duration = 3,
				icon = "victor_priest_perk_1",
				max_stacks = 1,
				update_frequency = 0.9,
				update_func = "damage_stagger_dot",
				update_start_delay = 1,
				value = 0,
			},
		},
	},
	victor_priest_super_armour_damage = {
		buffs = {
			{
				multiplier = 0.3,
				stat_buff = "power_level_super_armour",
			},
		},
	},
	victor_priest_curse_resistance = {
		buffs = {
			{
				multiplier = -1,
				stat_buff = "curse_protection",
			},
		},
	},
	victor_priest_vanguard = {
		buffs = {
			{
				buff_func = "heal_stagger_targets_on_melee",
				event = "on_stagger",
				multiplier = 1,
				name = "vanguard",
				perks = {
					buff_perks.tank_healing,
				},
			},
		},
	},
	victor_priest_reaper = {
		buffs = {
			{
				bonus = 0.25,
				buff_func = "heal_damage_targets_on_melee",
				event = "on_player_damage_dealt",
				max_targets = 5,
				multiplier = -0.05,
				name = "reaper",
				perks = {
					buff_perks.linesman_healing,
				},
			},
		},
	},
	victor_priest_conqueror = {
		buffs = {
			{
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable",
				multiplier = 0.2,
				name = "conqueror",
				range = 10,
			},
		},
	},
	victor_priest_2_1 = {
		buffs = {
			{
				block_buff = "victor_priest_2_1_cooldown",
				buff_func = "add_buff_on_num_targets_hit",
				buff_to_add = "victor_priest_2_1_buff",
				event = "on_hit",
			},
		},
	},
	victor_priest_2_1_buff = {
		buffs = {
			{
				icon = "victor_priest_2_1",
				max_stacks = 1,
				priority_buff = true,
				refresh_durations = true,
				perks = {
					"slayer_stamina",
				},
			},
		},
	},
	victor_priest_2_1_cooldown = {
		buffs = {
			{
				duration = 0.3,
				max_stacks = 1,
				refresh_durations = true,
			},
		},
	},
	victor_priest_2_2 = {
		buffs = {
			{
				buff_func = "victor_priest_add_buff_first_target",
				buff_to_add = "victor_priest_2_2_buff",
				event = "on_hit",
				max_stacks = 1,
			},
		},
	},
	victor_priest_2_2_buff = {
		buffs = {
			{
				icon = "victor_priest_2_2",
				stat_buff = "increased_weapon_damage_heavy_attack",
			},
		},
	},
	victor_priest_2_2_remover = {
		buffs = {
			{
				buff_func = "add_buff_on_first_target_hit",
				buff_to_add = "victor_priest_2_2_delay",
				event = "on_hit",
				valid_attack_types = {
					heavy_attack = true,
				},
			},
		},
	},
	victor_priest_2_2_delay = {
		buffs = {
			{
				buff_list_buff = "victor_priest_2_2",
				duration = 0.2,
				remove_buff_func = "victor_priest_delayed_buff_remove",
			},
		},
	},
	victor_priest_2_3 = {
		buffs = {
			{
				buff_func = "add_buff_on_elite_kill",
				buff_to_add = "victor_priest_2_3_buff",
				event = "on_elite_killed",
			},
		},
	},
	victor_priest_2_3_buff = {
		buffs = {
			{
				icon = "victor_priest_2_3",
				refresh_durations = true,
				stat_buff = "critical_strike_chance",
			},
		},
	},
	victor_priest_4_1 = {
		buffs = {
			{
				buff_func = "victor_priest_4_1_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	victor_priest_4_3 = {
		buffs = {
			{
				buff_func = "victor_priest_4_3_heal_on_kill",
				event = "on_kill",
			},
		},
	},
	victor_priest_5_1 = {
		buffs = {
			{
				buff_to_add = "victor_priest_5_1_buff",
				range = 100,
				remove_buff_func = "remove_aura_buff",
				update_func = "activate_buff_on_distance",
			},
		},
	},
	victor_priest_5_1_buff = {
		buffs = {
			{
				icon = "victor_priest_5_1",
				max_stacks = 1,
				stat_buff = "power_level_large",
			},
		},
	},
	victor_priest_5_2 = {
		buffs = {
			{
				buff_to_add = "victor_priest_5_2_buff",
				range = 100,
				remove_buff_func = "remove_aura_buff",
				update_func = "activate_buff_on_distance",
			},
		},
	},
	victor_priest_5_2_buff = {
		buffs = {
			{
				icon = "victor_priest_5_2",
				max_stacks = 1,
				stat_buff = "power_level_impact",
			},
		},
	},
	victor_priest_5_3 = {
		buffs = {
			{
				buff_to_add = "victor_priest_5_3_buff",
				range = 100,
				remove_buff_func = "remove_aura_buff",
				update_func = "activate_buff_on_distance",
			},
		},
	},
	victor_priest_5_3_buff = {
		buffs = {
			{
				icon = "victor_priest_5_3",
				max_stacks = 1,
				stat_buff = "max_health",
			},
		},
	},
	victor_priest_6_3 = {
		buffs = {
			{
				buff_to_add = "victor_priest_6_3_buff",
				max_stacks = 1,
				range = 100,
				remove_buff_func = "remove_aura_buff",
				update_func = "activate_buff_on_distance",
			},
		},
	},
	victor_priest_6_3_buff = {
		buffs = {
			{
				buff_func = "victor_priest_store_damage",
				event = "on_damage_taken",
				max_stacks = 1,
			},
		},
	},
	victor_priest_6_3_delayed_heal = {
		buffs = {
			{
				duration = 0.2,
				remove_buff_func = "victor_priest_6_1_removed",
			},
		},
	},
}
local talent_trees = {
	{
		{
			"victor_priest_vanguard",
			"victor_priest_reaper",
			"victor_priest_heal_share",
		},
		{
			"victor_priest_2_1",
			"victor_priest_2_2",
			"victor_priest_2_3",
		},
		{
			"victor_priest_3_1",
			"victor_priest_3_2",
			"victor_priest_3_3",
		},
		{
			"victor_priest_4_1_new",
			"victor_priest_4_2_new",
			"victor_priest_4_3",
		},
		{
			"victor_priest_5_1",
			"victor_priest_5_2",
			"victor_priest_5_3",
		},
		{
			"victor_priest_6_1",
			"victor_priest_6_2",
			"victor_priest_6_3",
		},
	},
}
local talents = {
	{
		buffer = "server",
		description = "vanguard_desc",
		icon = "victor_priest_1_1",
		name = "victor_priest_vanguard",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"victor_priest_vanguard",
		},
	},
	{
		buffer = "server",
		description = "reaper_desc",
		icon = "victor_priest_1_2",
		name = "victor_priest_reaper",
		num_ranks = 1,
		description_values = {
			{
				value = BuffUtils.get_buff_template("reaper", "adventure").buffs[1].max_targets,
			},
		},
		buffs = {
			"victor_priest_reaper",
		},
	},
	{
		buffer = "server",
		description = "conqueror_desc_3",
		icon = "victor_priest_1_3",
		name = "victor_priest_heal_share",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("conqueror", "adventure").buffs[1].multiplier,
			},
		},
		buffs = {
			"victor_priest_conqueror",
		},
	},
	{
		description = "victor_priest_2_1_desc",
		icon = "victor_priest_2_1",
		name = "victor_priest_2_1",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.victor_priest_2_1.num_targets,
			},
			{
				value = buff_tweak_data.victor_priest_2_1_buff.duration,
			},
		},
		buffs = {
			"victor_priest_2_1",
		},
	},
	{
		buffer = "both",
		description = "victor_priest_2_2_desc",
		icon = "victor_priest_2_2",
		name = "victor_priest_2_2",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_priest_2_2_buff.multiplier,
			},
			{
				value = buff_tweak_data.victor_priest_2_2_buff.max_stacks,
			},
		},
		buffs = {
			"victor_priest_2_2",
			"victor_priest_2_2_remover",
		},
	},
	{
		description = "victor_priest_2_3_desc",
		icon = "victor_priest_2_3",
		name = "victor_priest_2_3",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_priest_2_3_buff.bonus,
			},
			{
				value = buff_tweak_data.victor_priest_2_3_buff.duration,
			},
			{
				value = buff_tweak_data.victor_priest_2_3_buff.max_stacks,
			},
		},
		buffs = {
			"victor_priest_2_3",
		},
	},
	{
		buffer = "server",
		description = "smiter_unbalance_desc",
		icon = "victor_priest_3_1",
		name = "victor_priest_3_1",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("smiter_unbalance", "adventure").buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("smiter_unbalance", "adventure").buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"smiter_unbalance",
		},
	},
	{
		buffer = "server",
		description = "linesman_unbalance_desc",
		icon = "victor_priest_3_2",
		name = "victor_priest_3_2",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("linesman_unbalance", "adventure").buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("linesman_unbalance", "adventure").buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"linesman_unbalance",
		},
	},
	{
		buffer = "server",
		description = "power_level_unbalance_desc",
		icon = "victor_priest_3_3",
		name = "victor_priest_3_3",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("power_level_unbalance", "adventure").buffs[1].multiplier,
			},
		},
		buffs = {
			"power_level_unbalance",
		},
	},
	{
		description = "victor_priest_4_1_desc_new",
		icon = "victor_priest_4_1",
		name = "victor_priest_4_1_new",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"victor_priest_4_1",
		},
	},
	{
		description = "victor_priest_4_2_desc_new",
		icon = "victor_priest_4_2",
		name = "victor_priest_4_2_new",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = CareerConstants.wh_priest.talent_4_2_fury_to_gain_percent,
			},
			{
				value_type = "percent",
				value = CareerConstants.wh_priest.talent_4_2_smite_improved_damage,
			},
		},
		buffs = {},
	},
	{
		buffer = "server",
		description = "victor_priest_4_3_desc_new",
		icon = "victor_priest_4_3",
		name = "victor_priest_4_3",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_priest_4_3.percent_fury_to_gain,
			},
		},
		buffs = {
			"victor_priest_4_3",
		},
	},
	{
		buffer = "server",
		description = "victor_priest_5_1_desc_new",
		icon = "victor_priest_5_1",
		name = "victor_priest_5_1",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_priest_5_1_buff.multiplier,
			},
		},
		buffs = {
			"victor_priest_5_1",
		},
	},
	{
		buffer = "server",
		description = "victor_priest_5_2_desc",
		icon = "victor_priest_5_2",
		name = "victor_priest_5_2",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_priest_5_2_buff.multiplier,
			},
		},
		buffs = {
			"victor_priest_5_2",
		},
	},
	{
		buffer = "server",
		description = "victor_priest_5_3_desc",
		icon = "victor_priest_5_3",
		name = "victor_priest_5_3",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_priest_5_3_buff.multiplier,
			},
		},
		buffs = {
			"victor_priest_5_3",
		},
	},
	{
		description = "victor_priest_6_1_desc_new",
		icon = "victor_priest_6_1",
		name = "victor_priest_6_1",
		num_ranks = 1,
		description_values = {
			{
				value = CareerConstants.wh_priest.talent_6_1_improved_ability_duration,
			},
		},
		mechanism_overrides = {
			versus = {
				description_values = {
					{
						value = CareerConstants.wh_priest.talent_6_1_improved_ability_duration_versus,
					},
				},
			},
		},
		buffs = {},
	},
	{
		buffer = "server",
		description = "victor_priest_6_3_desc",
		icon = "victor_priest_6_3",
		name = "victor_priest_6_3",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.victor_priest_6_3_buff.heal_window,
			},
		},
		buffs = {
			"victor_priest_6_3",
		},
	},
	{
		description = "victor_priest_6_2_desc",
		icon = "victor_priest_6_2",
		name = "victor_priest_6_2",
		num_ranks = 1,
		description_values = {},
		buffs = {},
	},
}
local hero_name = "witch_hunter"

table.merge(TalentBuffTemplates[hero_name], talent_buff_templates)
table.append(TalentTrees[hero_name], talent_trees)
table.append(Talents[hero_name], talents)

WeaveLoadoutSettings = WeaveLoadoutSettings or {}
WeaveLoadoutSettings.wh_priest = {
	talent_tree = talent_trees[1],
	properties = {},
	traits = {},
}

BuffUtils.copy_talent_buff_names(talent_buff_templates)
BuffUtils.apply_buff_tweak_data(talent_buff_templates, buff_tweak_data)
