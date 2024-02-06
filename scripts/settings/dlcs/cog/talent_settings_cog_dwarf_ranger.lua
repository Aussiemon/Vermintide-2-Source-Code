-- chunkname: @scripts/settings/dlcs/cog/talent_settings_cog_dwarf_ranger.lua

require("scripts/settings/profiles/career_constants")

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local buff_tweak_data = {
	bardin_engineer_passive_no_ability_regen = {
		multiplier = -1,
	},
	bardin_engineer_passive_ranged_power_aura = {
		range = 10,
		update_frequency = 0.1,
	},
	bardin_engineer_passive_ranged_power_aura_buff = {
		multiplier = 0.1,
	},
	bardin_engineer_passive_max_ammo = {
		multiplier = 0.5,
	},
	bardin_engineer_pump_buff = {
		multiplier = 0.4,
	},
	bardin_engineer_vanguard = {},
	bardin_engineer_reaper = {},
	bardin_engineer_heal_share = {},
	bardin_engineer_2_1 = {},
	bardin_engineer_2_1_cooldown = {
		duration = 120,
	},
	bardin_engineer_ranged_pierce = {
		bonus = 1,
	},
	bardin_engineer_melee_power_free_shot = {},
	bardin_engineer_melee_power_free_shot_stat = {
		multiplier = 0.1,
	},
	bardin_engineer_melee_power_free_shot_counter = {
		max_stacks = 5,
	},
	bardin_engineer_melee_power_free_shot_counter_buff = {},
	bardin_engineer_melee_power_range_power_buff = {
		duration = 10,
		max_stacks = 1,
		multiplier = 0.15,
	},
	bardin_engineer_power_on_max_pump_buff = {
		duration = 10,
		max_stacks = 1,
		multiplier = 0.15,
	},
	bardin_engineer_power_on_max_pump = {
		stacks_for_buff = 5,
	},
	bardin_engineer_4_1_buff = {
		multiplier = 0.15,
	},
	bardin_engineer_pump_buff_power = {
		multiplier = 0.04,
	},
	bardin_engineer_tank_unbalance = {},
	bardin_engineer_linesman_unbalance = {},
	bardin_engineer_power_level_unbalance = {},
	bardin_engineer_stacking_damage_reduction = {
		update_frequency = 5,
	},
	bardin_engineer_stacking_damage_reduction_buff = {
		max_stacks = 5,
		multiplier = -0.05,
	},
	bardin_engineer_piston_powered_delay = {
		duration = 15,
	},
	bardin_engineer_armor_piercing_ability = {},
	bardin_engineer_reduced_ability_fire_slowdown = {
		display_multiplier = 0.1,
	},
	bardin_engineer_increased_ability_bar = {
		multiplier = 0.5,
	},
	bardin_engineer_increased_ability_bar_buff = {
		duration = 4,
	},
}
local talent_buff_templates = {
	bardin_engineer_passive_no_ability_regen = {
		buffs = {
			{
				stat_buff = "cooldown_regen",
			},
		},
	},
	bardin_engineer_passive_ranged_power_aura = {
		buffs = {
			{
				buff_to_add = "bardin_engineer_passive_ranged_power_aura_buff",
				remove_buff_func = "remove_aura_buff",
				update_func = "activate_buff_on_distance",
			},
		},
	},
	bardin_engineer_passive_ranged_power_aura_buff = {
		buffs = {
			{
				icon = "bardin_engineer_passive_ranged_power_aura_buff_icon",
				max_stacks = 1,
				stat_buff = "power_level_ranged",
			},
		},
	},
	bardin_engineer_passive_max_ammo = {
		buffs = {
			{
				stat_buff = "total_ammo",
			},
		},
	},
	bardin_engineer_pump_buff = {
		buffs = {
			{
				apply_buff_func = "add_buffs",
				buff_to_remove = "bardin_engineer_pump_buff_power",
				duration = 12,
				icon = "bardin_engineer_passive",
				max_stacks = 5,
				multiplier = 0.4,
				on_max_stacks_func = "add_remove_buffs",
				on_max_stacks_overflow_func = "add_remove_buffs",
				refresh_durations = true,
				remove_buff_func = "remove_buff_local",
				stat_buff = "cooldown_regen",
				duration_modifier_func = function (owner_unit, sub_buff_template, duration, buff_extension, params)
					local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")

					if talent_extension:has_talent("bardin_engineer_pump_buff_long") then
						return nil, nil
					end

					return duration, sub_buff_template.ticks
				end,
				max_stack_data = {
					buffs_to_add = {
						"bardin_engineer_pump_max_overheat_check",
					},
					talent_buffs = {
						bardin_engineer_power_on_max_pump = {
							buffs_to_add = {
								{
									name = "bardin_engineer_4_1_buff",
								},
							},
						},
					},
				},
				add_buffs_data = {
					sync_buffs = true,
					buffs_to_add = {
						"bardin_engineer_pump_buff_power",
					},
				},
				buffs_to_remove_on_remove = {
					"bardin_engineer_4_1_buff",
					"bardin_engineer_pump_overclock_buff",
					"bardin_engineer_pump_max_exhaustion_buff",
				},
			},
		},
	},
	bardin_engineer_pump_buff_power = {
		buffs = {
			{
				max_stacks = 5,
				stat_buff = "power_level",
				apply_condition = function (owner_unit, template, params)
					local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")

					return talent_extension:has_talent("bardin_engineer_pump_buff_long")
				end,
			},
		},
	},
	bardin_engineer_vanguard = {
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
	bardin_engineer_reaper = {
		buffs = {
			{
				bonus = 0.25,
				buff_func = "heal_damage_targets_on_melee",
				event = "on_damage_dealt",
				max_targets = 5,
				multiplier = -0.05,
				name = "reaper",
				perks = {
					buff_perks.linesman_healing,
				},
			},
		},
	},
	bardin_engineer_heal_share = {
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
	bardin_engineer_2_1 = {
		buffs = {
			{
				cooldown_buff = "bardin_engineer_2_1_cooldown",
				update_frequency = 80,
				update_func = "bardin_engineer_bomb_grant",
				update_start_delay = 80,
				perks = {
					buff_perks.no_explosion_friendly_fire,
				},
			},
		},
	},
	bardin_engineer_2_1_cooldown = {
		buffs = {
			{
				icon = "bardin_engineer_fast_ability_charge",
				is_cooldown = true,
				max_stacks = 1,
				refresh_durations = true,
			},
		},
	},
	bardin_engineer_ranged_pierce = {
		buffs = {
			{
				stat_buff = "ranged_additional_penetrations",
			},
		},
	},
	bardin_engineer_melee_power_ranged_power = {
		buffs = {
			{
				buff_func = "add_buff_on_first_target_hit",
				buff_to_add = "bardin_engineer_melee_power_range_power_buff_counter",
				event = "on_hit",
				max_stacks = 1,
				valid_attack_types = {
					heavy_attack = true,
					light_attack = true,
				},
			},
		},
	},
	bardin_engineer_melee_power_range_power_buff_counter = {
		buffs = {
			{
				icon = "bardin_engineer_melee_power_free_shot",
				is_cooldown = true,
				max_stacks = 5,
				on_max_stacks_func = "add_remove_buffs",
				reset_on_max_stacks = true,
				max_stack_data = {
					buffs_to_add = {
						"bardin_engineer_melee_power_range_power_starter",
					},
				},
			},
		},
	},
	bardin_engineer_melee_power_range_power_starter = {
		buffs = {
			{
				buff_func = "bardin_engineer_power_on_next_range",
				buff_to_add = "bardin_engineer_melee_power_range_power_buff",
				event = "on_start_action",
				icon = "bardin_engineer_melee_power_free_shot",
				max_stacks = 1,
			},
		},
	},
	bardin_engineer_melee_power_range_power_buff = {
		buffs = {
			{
				duration = 10,
				icon = "bardin_engineer_melee_power_free_shot",
				max_stacks = 1,
				multiplier = 0.15,
				stat_buff = "power_level_ranged",
			},
		},
	},
	bardin_engineer_melee_power_free_shot = {
		buffs = {
			{
				buff_func = "on_kill_add_remove",
				event = "on_kill",
				max_stacks = 1,
				stat_buff = "power_level_melee",
				on_kill_add_remove_data = {
					weapon_type = "melee",
					requirements = {
						buffs_not_exist = {
							"bardin_engineer_melee_power_free_shot_counter_buff",
						},
					},
					buffs_to_add = {
						"bardin_engineer_melee_power_free_shot_counter",
					},
				},
			},
		},
	},
	bardin_engineer_melee_power_free_shot_stat = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "power_level_melee",
			},
		},
	},
	bardin_engineer_melee_power_free_shot_counter = {
		buffs = {
			{
				icon = "bardin_ranger_increased_melee_damage_on_no_ammo",
				max_stacks = 5,
				on_max_stacks_func = "add_remove_buffs",
				reset_on_max_stacks = true,
				max_stack_data = {
					buffs_to_add = {
						"bardin_engineer_melee_power_free_shot_counter_buff",
					},
				},
			},
		},
	},
	bardin_engineer_melee_power_free_shot_counter_buff = {
		buffs = {
			{
				buff_func = "dummy_function",
				event = "on_ammo_used",
				icon = "victor_bountyhunter_passive_infinite_ammo",
				max_stacks = 1,
				priority_buff = true,
				remove_on_proc = true,
				perks = {
					buff_perks.infinite_ammo,
				},
			},
		},
	},
	bardin_engineer_4_1_buff = {
		buffs = {
			{
				icon = "bardin_engineer_party_ability_charge",
				max_stacks = 1,
				stat_buff = "attack_speed",
			},
		},
	},
	bardin_engineer_4th_row_cleanup = {
		buffs = {
			{
				buffs_to_remove_on_remove = {
					"bardin_engineer_pump_buff",
				},
			},
		},
	},
	bardin_engineer_stacking_damage_reduction = {
		buffs = {
			{
				buff_func = "remove_buff_stack",
				buff_to_add = "bardin_engineer_stacking_damage_reduction_buff",
				event = "on_damage_taken",
				remove_buff_func = "remove_buff_server_controlled",
				update_func = "add_buff_server_controlled",
				remove_buff_stack_data = {
					{
						buff_to_remove = "bardin_engineer_stacking_damage_reduction_buff",
						num_stacks = 1,
						reset_update_timer = true,
						server_controlled = true,
						ignored_damage_sources = {
							"overcharge",
						},
					},
				},
			},
		},
	},
	bardin_engineer_stacking_damage_reduction_buff = {
		buffs = {
			{
				icon = "bardin_engineer_stacking_damage_reduction",
				stat_buff = "damage_taken",
			},
		},
	},
	bardin_engineer_5_2 = {
		buffs = {
			{
				perks = {
					buff_perks.frag_fire_grenades,
				},
			},
		},
	},
	bardin_engineer_piston_powered = {
		buffs = {
			{
				apply_buff_func = "bardin_engineer_piston_power_add_apply",
				buff_func = "bardin_engineer_piston_power_add",
				buff_to_add = "bardin_engineer_piston_powered_buff",
				buff_to_check = "bardin_engineer_piston_powered_delay",
				buff_to_remove = "bardin_engineer_piston_powered_ready",
				event = "on_hit",
				buffs_to_remove_on_remove = {
					"bardin_engineer_piston_powered_delay",
					"bardin_engineer_piston_powered_ready",
				},
			},
		},
	},
	bardin_engineer_piston_powered_buff = {
		activation_sound = "hud_talent_engineer_piston_power",
		buffs = {
			{
				duration = 0.2,
				multiplier = 2,
				stat_buff = "power_level_impact",
				perks = {
					buff_perks.explosive_stagger,
				},
			},
		},
	},
	bardin_engineer_piston_powered_delay = {
		buffs = {
			{
				buff_to_add = "bardin_engineer_piston_powered_ready",
				duration_end_func = "add_buff_local",
				icon = "bardin_engineer_no_overheat_explosion",
				is_cooldown = true,
				max_stacks = 1,
				refresh_durations = true,
			},
		},
	},
	bardin_engineer_piston_powered_ready = {
		buffs = {
			{
				buff_func = "bardin_engineer_piston_power_sound",
				event = "on_start_action",
				icon = "bardin_engineer_no_overheat_explosion",
				max_stacks = 1,
			},
		},
	},
	bardin_engineer_increased_ability_bar = {
		buffs = {
			{
				apply_buff_func = "add_modify_ability_max_cooldown",
				buff_func = "add_buff_on_special_kill",
				buff_to_add = "bardin_engineer_increased_ability_bar_buff",
				event = "on_kill",
				remove_buff_func = "remove_modify_ability_max_cooldown",
			},
		},
	},
	bardin_engineer_increased_ability_bar_buff = {
		buffs = {
			{
				icon = "bardin_engineer_increased_ability_bar",
				max_stacks = 1,
				refresh_durations = true,
				perks = {
					buff_perks.free_ability_engineer,
				},
			},
		},
	},
}
local talent_trees = {
	{
		{
			"bardin_engineer_vanguard",
			"bardin_engineer_reaper",
			"bardin_engineer_heal_share",
		},
		{
			"bardin_engineer_improved_explosives",
			"bardin_engineer_ranged_pierce",
			"bardin_engineer_melee_power_ranged_power",
		},
		{
			"bardin_engineer_tank_unbalance",
			"bardin_engineer_linesman_unbalance",
			"bardin_engineer_power_level_unbalance",
		},
		{
			"bardin_engineer_power_on_max_pump",
			"bardin_engineer_overclock",
			"bardin_engineer_pump_buff_long",
		},
		{
			"bardin_engineer_stacking_damage_reduction",
			"bardin_engineer_upgraded_grenades",
			"bardin_engineer_piston_powered",
		},
		{
			"bardin_engineer_armor_piercing_ability",
			"bardin_engineer_reduced_ability_fire_slowdown",
			"bardin_engineer_increased_ability_bar",
		},
	},
}
local talents = {
	{
		buffer = "server",
		description = "vanguard_desc",
		icon = "bardin_engineer_vanguard",
		name = "bardin_engineer_vanguard",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"bardin_engineer_vanguard",
		},
	},
	{
		buffer = "server",
		description = "reaper_desc",
		icon = "bardin_engineer_reaper",
		name = "bardin_engineer_reaper",
		num_ranks = 1,
		description_values = {
			{
				value = BuffTemplates.reaper.buffs[1].max_targets,
			},
		},
		buffs = {
			"bardin_engineer_reaper",
		},
	},
	{
		buffer = "server",
		description = "conqueror_desc_3",
		icon = "bardin_engineer_heal_share",
		name = "bardin_engineer_heal_share",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier,
			},
		},
		buffs = {
			"bardin_engineer_heal_share",
		},
	},
	{
		buffer = "both",
		description = "bardin_engineer_improved_explosives_desc",
		icon = "bardin_engineer_fast_ability_charge",
		name = "bardin_engineer_improved_explosives",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.bardin_engineer_2_1_cooldown.duration,
			},
		},
		buffs = {
			"bardin_engineer_2_1",
			"bardin_engineer_2_1_cooldown",
		},
	},
	{
		description = "bardin_engineer_ranged_pierce_desc_2",
		icon = "bardin_engineer_ranged_pierce",
		name = "bardin_engineer_ranged_pierce",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.bardin_engineer_ranged_pierce.bonus,
			},
		},
		buffs = {
			"bardin_engineer_ranged_pierce",
		},
	},
	{
		description = "bardin_engineer_melee_power_ranged_power_desc",
		icon = "bardin_engineer_melee_power_free_shot",
		name = "bardin_engineer_melee_power_ranged_power",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_engineer_melee_power_free_shot_stat.multiplier,
			},
			{
				value = buff_tweak_data.bardin_engineer_melee_power_free_shot_counter.max_stacks,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_engineer_melee_power_range_power_buff.multiplier,
			},
			{
				value = buff_tweak_data.bardin_engineer_melee_power_range_power_buff.duration,
			},
		},
		client_buffs = {
			"bardin_engineer_melee_power_ranged_power",
		},
		server_buffs = {
			"bardin_engineer_melee_power_free_shot_stat",
		},
	},
	{
		buffer = "server",
		description = "tank_unbalance_desc",
		icon = "bardin_engineer_tank_unbalance",
		name = "bardin_engineer_tank_unbalance",
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
		description = "linesman_unbalance_desc",
		icon = "bardin_engineer_linesman_unbalance",
		name = "bardin_engineer_linesman_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.linesman_unbalance.buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffTemplates.linesman_unbalance.buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"linesman_unbalance",
		},
	},
	{
		buffer = "server",
		description = "power_level_unbalance_desc",
		icon = "bardin_engineer_power_level_unbalance",
		name = "bardin_engineer_power_level_unbalance",
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
		description = "bardin_engineer_power_on_max_pump_desc_b",
		icon = "bardin_engineer_party_ability_charge",
		name = "bardin_engineer_power_on_max_pump",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.bardin_engineer_power_on_max_pump.stacks_for_buff,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_engineer_power_on_max_pump_buff.multiplier,
			},
		},
		buffs = {
			"bardin_engineer_4th_row_cleanup",
		},
	},
	{
		description = "bardin_engineer_overclock_desc",
		icon = "bardin_engineer_4_2",
		name = "bardin_engineer_overclock",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = CareerConstants.dr_engineer.talent_4_2_cooldown,
			},
			{
				value_type = "percent",
				value = CareerConstants.dr_engineer.talent_4_2_crit,
			},
			{
				value_type = "percent",
				value = CareerConstants.dr_engineer.talent_4_2_damage_taken,
			},
		},
		buffs = {
			"bardin_engineer_4th_row_cleanup",
		},
	},
	{
		description = "bardin_engineer_pump_buff_long_desc_b",
		icon = "bardin_engineer_passive_ability_charge",
		name = "bardin_engineer_pump_buff_long",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_engineer_pump_buff_power.multiplier,
			},
		},
		buffs = {
			"bardin_engineer_4th_row_cleanup",
		},
	},
	{
		buffer = "server",
		description = "bardin_engineer_stacking_damage_reduction_desc",
		icon = "bardin_engineer_stacking_damage_reduction",
		name = "bardin_engineer_stacking_damage_reduction",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.bardin_engineer_stacking_damage_reduction.update_frequency,
			},
			{
				value = buff_tweak_data.bardin_engineer_stacking_damage_reduction_buff.max_stacks,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_engineer_stacking_damage_reduction_buff.multiplier,
			},
		},
		buffs = {
			"bardin_engineer_stacking_damage_reduction",
		},
	},
	{
		buffer = "both",
		description = "bardin_engineer_upgraded_grenades_desc_b",
		icon = "bardin_engineer_upgraded_grenades",
		name = "bardin_engineer_upgraded_grenades",
		num_ranks = 1,
		description_values = {
			{
				value = CareerConstants.dr_engineer.num_starting_bombs,
			},
		},
		buffs = {
			"bardin_engineer_5_2",
		},
	},
	{
		buffer = "both",
		description = "bardin_engineer_piston_powered_desc_b",
		icon = "bardin_engineer_no_overheat_explosion",
		name = "bardin_engineer_piston_powered",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.bardin_engineer_piston_powered_delay.duration,
			},
		},
		buffs = {
			"bardin_engineer_piston_powered",
		},
	},
	{
		description = "bardin_engineer_armor_piercing_ability_desc",
		icon = "bardin_engineer_armor_piercing_ability",
		name = "bardin_engineer_armor_piercing_ability",
		num_ranks = 1,
		talent_career_weapon_index = 2,
		description_values = {},
		buffs = {},
	},
	{
		description = "bardin_engineer_reduced_ability_fire_slowdown_desc",
		icon = "bardin_engineer_reduced_ability_fire_slowdown",
		name = "bardin_engineer_reduced_ability_fire_slowdown",
		num_ranks = 1,
		talent_career_weapon_index = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_engineer_reduced_ability_fire_slowdown.display_multiplier,
			},
		},
		buffs = {},
	},
	{
		description = "bardin_engineer_increased_ability_bar_desc",
		icon = "bardin_engineer_increased_ability_bar",
		name = "bardin_engineer_increased_ability_bar",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_engineer_increased_ability_bar.multiplier,
			},
			{
				value = buff_tweak_data.bardin_engineer_increased_ability_bar_buff.duration,
			},
		},
		buffs = {
			"bardin_engineer_increased_ability_bar",
		},
	},
}
local hero_name = "dwarf_ranger"

table.merge(TalentBuffTemplates[hero_name], talent_buff_templates)
table.append(TalentTrees[hero_name], talent_trees)
table.append(Talents[hero_name], talents)

WeaveLoadoutSettings = WeaveLoadoutSettings or {}
WeaveLoadoutSettings.dr_engineer = {
	talent_tree = talent_trees[1],
	properties = {},
	traits = {},
}

BuffUtils.copy_talent_buff_names(talent_buff_templates)
BuffUtils.apply_buff_tweak_data(talent_buff_templates, buff_tweak_data)
