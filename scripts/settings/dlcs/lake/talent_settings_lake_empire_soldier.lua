-- chunkname: @scripts/settings/dlcs/lake/talent_settings_lake_empire_soldier.lua

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local buff_tweak_data = {
	markus_questing_knight_ability_cooldown_on_hit = {
		bonus = 0.25,
	},
	markus_questing_knight_ability_cooldown_on_damage_taken = {
		bonus = 0.25,
	},
	markus_questing_knight_perk_movement_speed = {
		multiplier = 1.1,
	},
	markus_questing_knight_perk_first_target_damage = {
		multiplier = 0.25,
	},
	markus_questing_knight_vanguard = {
		multiplier = 1,
	},
	markus_questing_knight_bloodlust = {
		heal_cap = 0.25,
		multiplier = 0.45,
	},
	markus_questing_knight_conqueror = {
		multiplier = 0.2,
		range = 10,
	},
	markus_questing_knight_charged_attacks_increased_power = {
		multiplier = 0.3,
	},
	markus_questing_knight_crit_can_insta_kill = {
		boss_damage_multiplier = 2,
		damage_multiplier = 4,
		proc_chance = 1,
	},
	markus_questing_knight_kills_buff_power_stacking = {},
	markus_questing_knight_kills_buff_power_stacking_buff = {
		duration = 10,
		max_stacks = 3,
		multiplier = 0.08,
	},
	markus_questing_knight_passive_improved_reward = {
		display_multiplier = 0.5,
	},
	markus_questing_knight_health_refund_over_time = {
		heal_amount_fraction = 0.5,
	},
	markus_questing_knight_health_refund_over_time_delayed_heal = {
		duration = 5,
	},
	markus_questing_knight_parry_increased_power_buff = {
		duration = 6,
		max_stacks = 1,
		multiplier = 0.2,
	},
	markus_questing_knight_push_arc = {
		multiplier = 0.3,
	},
	markus_questing_knight_stamina_reg = {
		multiplier = 0.3,
	},
	markus_questing_knight_ability_buff_on_kill_movement_speed = {
		duration = 15,
		multiplier = 1.35,
	},
}
local talent_buff_templates = {
	markus_questing_knight_ability_cooldown_on_hit = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown",
				event = "on_hit",
			},
		},
	},
	markus_questing_knight_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	markus_questing_knight_perk_movement_speed = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
	markus_questing_knight_perk_first_target_damage = {
		buffs = {
			{
				stat_buff = "first_melee_hit_damage",
			},
		},
	},
	markus_questing_knight_perk_power_block = {
		buffs = {
			{
				perks = {
					buff_perks.power_block,
				},
			},
		},
	},
	markus_questing_knight_vanguard = {
		buffs = {
			{
				buff_func = "heal_stagger_targets_on_melee",
				event = "on_stagger",
				name = "vanguard",
				perks = {
					buff_perks.tank_healing,
				},
			},
		},
	},
	markus_questing_knight_bloodlust = {
		buffs = {
			{
				buff_func = "heal_percentage_of_enemy_hp_on_melee_kill",
				event = "on_kill",
				name = "bloodlust",
				perks = {
					buff_perks.smiter_healing,
				},
			},
		},
	},
	markus_questing_knight_conqueror = {
		buffs = {
			{
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable",
				name = "conqueror",
			},
		},
	},
	markus_questing_knight_charged_attacks_increased_power = {
		buffs = {
			{
				name = "markus_questing_knight_charged_attacks_increased_power",
				stat_buff = "increased_weapon_damage_heavy_attack",
			},
		},
	},
	markus_questing_knight_crit_can_insta_kill = {
		buffs = {
			{
				buff_func = "check_for_instantly_killing_crit",
				event = "on_player_damage_dealt",
				name = "markus_questing_knight_crit_can_insta_kill",
			},
		},
	},
	markus_questing_knight_kills_buff_power_stacking = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "markus_questing_knight_kills_buff_power_stacking_buff",
				event = "on_kill",
				name = "markus_questing_knight_kills_buff_power_stacking",
			},
		},
	},
	markus_questing_knight_kills_buff_power_stacking_buff = {
		buffs = {
			{
				icon = "markus_questing_knight_kills_buff_power_stacking",
				name = "markus_questing_knight_kills_buff_power_stacking_buff",
				refresh_durations = true,
				stat_buff = "power_level",
			},
		},
	},
	markus_questing_knight_health_refund_over_time = {
		buffs = {
			{
				buff_func = "add_heal_percent_of_damage_taken_over_time_buff",
				buff_to_add = "markus_questing_knight_health_refund_over_time_delayed_heal",
				event = "on_damage_taken",
			},
		},
	},
	markus_questing_knight_health_refund_over_time_delayed_heal = {
		buffs = {
			{
				icon = "markus_questing_knight_health_refund_over_time",
				max_stacks = 1,
				refresh_durations = true,
				remove_buff_func = "refund_damage_taken",
			},
		},
	},
	markus_questing_knight_parry_increased_power = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "markus_questing_knight_parry_increased_power_buff",
				event = "on_timed_block",
			},
		},
	},
	markus_questing_knight_parry_increased_power_buff = {
		buffs = {
			{
				icon = "markus_questing_knight_parry_increased_power",
				refresh_durations = true,
				stat_buff = "power_level",
			},
		},
	},
	markus_questing_knight_push_arc = {
		buffs = {
			{
				stat_buff = "block_angle",
			},
		},
	},
	markus_questing_knight_stamina_reg = {
		buffs = {
			{
				stat_buff = "fatigue_regen",
			},
		},
	},
	markus_questing_knight_ability_buff_on_kill = {
		buffs = {
			{
				buff_func = "markus_questing_knight_ability_kill_buff_func",
				buff_to_add = "markus_questing_knight_ability_buff_on_kill_movement_speed",
				event = "on_kill",
			},
		},
	},
	markus_questing_knight_ability_buff_on_kill_movement_speed = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				icon = "markus_questing_knight_ability_buff_on_kill",
				max_stacks = 1,
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
}
local talent_trees = {
	{
		{
			"markus_questing_knight_vanguard",
			"markus_questing_knight_bloodlust_2",
			"markus_questing_knight_heal_share",
		},
		{
			"markus_questing_knight_kills_buff_power_stacking",
			"markus_questing_knight_crit_can_insta_kill",
			"markus_questing_knight_charged_attacks_increased_power",
		},
		{
			"markus_questing_knight_tank_unbalance",
			"markus_questing_knight_smiter_unbalance",
			"markus_questing_knight_power_level_unbalance",
		},
		{
			"markus_questing_knight_passive_additional_quest",
			"markus_questing_knight_passive_improved_reward",
			"markus_questing_knight_passive_side_quest",
		},
		{
			"markus_questing_knight_health_refund_over_time",
			"markus_questing_knight_parry_increased_power",
			"markus_questing_knight_push_arc_stamina_reg",
		},
		{
			"markus_questing_knight_ability_double_activation",
			"markus_questing_knight_ability_buff_on_kill",
			"markus_questing_knight_ability_tank_attack",
		},
	},
}
local talents = {
	{
		buffer = "server",
		description = "vanguard_desc",
		icon = "markus_questing_knight_vanguard",
		name = "markus_questing_knight_vanguard",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"markus_questing_knight_vanguard",
		},
	},
	{
		buffer = "server",
		description = "bloodlust_desc_3",
		icon = "markus_questing_knight_bloodlust_2",
		name = "markus_questing_knight_bloodlust_2",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.bloodlust.buffs[1].multiplier,
			},
		},
		buffs = {
			"markus_questing_knight_bloodlust",
		},
	},
	{
		buffer = "server",
		description = "conqueror_desc_3",
		icon = "markus_questing_knight_heal_share",
		name = "markus_questing_knight_heal_share",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier,
			},
		},
		buffs = {
			"markus_questing_knight_conqueror",
		},
	},
	{
		buffer = "server",
		description = "markus_questing_knight_kills_buff_power_stacking_desc",
		icon = "markus_questing_knight_kills_buff_power_stacking",
		name = "markus_questing_knight_kills_buff_power_stacking",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_questing_knight_kills_buff_power_stacking_buff.multiplier,
			},
			{
				value = buff_tweak_data.markus_questing_knight_kills_buff_power_stacking_buff.duration,
			},
			{
				value = buff_tweak_data.markus_questing_knight_kills_buff_power_stacking_buff.max_stacks,
			},
		},
		buffs = {
			"markus_questing_knight_kills_buff_power_stacking",
		},
	},
	{
		buffer = "server",
		description = "markus_questing_knight_crit_can_insta_kill_desc",
		icon = "markus_questing_knight_crit_can_insta_kill",
		name = "markus_questing_knight_crit_can_insta_kill",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.markus_questing_knight_crit_can_insta_kill.damage_multiplier,
			},
		},
		buffs = {
			"markus_questing_knight_crit_can_insta_kill",
		},
	},
	{
		buffer = "server",
		description = "markus_questing_knight_charged_attacks_increased_power_desc",
		icon = "markus_questing_knight_charged_attacks_increased_power",
		name = "markus_questing_knight_charged_attacks_increased_power",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_questing_knight_charged_attacks_increased_power.multiplier,
			},
		},
		buffs = {
			"markus_questing_knight_charged_attacks_increased_power",
		},
	},
	{
		buffer = "server",
		description = "tank_unbalance_desc",
		icon = "markus_questing_knight_tank_unbalance",
		name = "markus_questing_knight_tank_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.tank_unbalance_buff.buffs[1].bonus,
			},
			{
				value = BuffTemplates.tank_unbalance_buff.buffs[1].duration,
			},
			{
				value_type = "percent",
				value = BuffTemplates.tank_unbalance.buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffTemplates.tank_unbalance.buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"tank_unbalance",
		},
	},
	{
		buffer = "server",
		description = "smiter_unbalance_desc",
		icon = "markus_questing_knight_smiter_unbalance",
		name = "markus_questing_knight_smiter_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.smiter_unbalance.buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffTemplates.smiter_unbalance.buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"smiter_unbalance",
		},
	},
	{
		buffer = "server",
		description = "power_level_unbalance_desc",
		icon = "markus_questing_knight_power_level_unbalance",
		name = "markus_questing_knight_power_level_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.power_level_unbalance.buffs[1].multiplier,
			},
		},
		buffs = {
			"power_level_unbalance",
		},
	},
	{
		description = "markus_questing_knight_passive_additional_quest_desc",
		icon = "markus_questing_knight_passive_additional_quest",
		name = "markus_questing_knight_passive_additional_quest",
		num_ranks = 1,
		buffs = {},
	},
	{
		description = "markus_questing_knight_passive_side_quest_desc",
		icon = "markus_questing_knight_passive_side_quest",
		name = "markus_questing_knight_passive_side_quest",
		num_ranks = 1,
		buffs = {},
	},
	{
		description = "markus_questing_knight_passive_improved_reward_desc",
		icon = "markus_questing_knight_passive_improved_reward",
		name = "markus_questing_knight_passive_improved_reward",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_questing_knight_passive_improved_reward.display_multiplier,
			},
		},
		buffs = {},
	},
	{
		buffer = "both",
		description = "markus_questing_knight_health_refund_over_time_desc",
		icon = "markus_questing_knight_health_refund_over_time",
		name = "markus_questing_knight_health_refund_over_time",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_questing_knight_health_refund_over_time.heal_amount_fraction,
			},
			{
				value = buff_tweak_data.markus_questing_knight_health_refund_over_time_delayed_heal.duration,
			},
		},
		buffs = {
			"markus_questing_knight_health_refund_over_time",
		},
	},
	{
		buffer = "both",
		description = "markus_questing_knight_parry_increased_power_desc",
		icon = "markus_questing_knight_parry_increased_power",
		name = "markus_questing_knight_parry_increased_power",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_questing_knight_parry_increased_power_buff.multiplier,
			},
			{
				value = buff_tweak_data.markus_questing_knight_parry_increased_power_buff.duration,
			},
		},
		buffs = {
			"markus_questing_knight_parry_increased_power",
		},
	},
	{
		description = "markus_questing_knight_push_arc_stamina_reg_desc",
		icon = "markus_questing_knight_push_arc_stamina_reg",
		name = "markus_questing_knight_push_arc_stamina_reg",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_questing_knight_push_arc.multiplier,
			},
		},
		buffs = {
			"markus_questing_knight_push_arc",
			"markus_questing_knight_stamina_reg",
		},
	},
	{
		description = "markus_questing_knight_ability_double_activation_desc",
		icon = "markus_questing_knight_ability_double_activation",
		name = "markus_questing_knight_ability_double_activation",
		num_ranks = 1,
		buffs = {},
	},
	{
		description = "markus_questing_knight_ability_buff_on_kill_desc",
		icon = "markus_questing_knight_ability_buff_on_kill",
		name = "markus_questing_knight_ability_buff_on_kill",
		num_ranks = 1,
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.markus_questing_knight_ability_buff_on_kill_movement_speed.multiplier,
			},
			{
				value = buff_tweak_data.markus_questing_knight_ability_buff_on_kill_movement_speed.duration,
			},
		},
		buffs = {
			"markus_questing_knight_ability_buff_on_kill",
		},
	},
	{
		description = "markus_questing_knight_ability_tank_attack_desc",
		icon = "markus_questing_knight_ability_tank_attack",
		name = "markus_questing_knight_ability_tank_attack",
		num_ranks = 1,
		buffs = {},
	},
}
local hero_name = "empire_soldier"

table.merge(TalentBuffTemplates[hero_name], talent_buff_templates)
table.append(TalentTrees[hero_name], talent_trees)
table.append(Talents[hero_name], talents)

WeaveLoadoutSettings = WeaveLoadoutSettings or {}
WeaveLoadoutSettings.es_questingknight = {
	talent_tree = talent_trees[1],
	properties = {},
	traits = {},
}

BuffUtils.copy_talent_buff_names(talent_buff_templates)
BuffUtils.apply_buff_tweak_data(talent_buff_templates, buff_tweak_data)
