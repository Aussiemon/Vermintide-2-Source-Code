-- chunkname: @scripts/settings/dlcs/shovel/talent_settings_shovel.lua

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")

require("scripts/entity_system/systems/buff/buff_sync_type")
require("scripts/settings/profiles/career_constants")

SHOVEL_BUFF_TWEAK_DATA = {
	sienna_necromancer_passive_balefire = {
		multiplier = 0.2,
	},
	sienna_necromancer_perk_dot_duration = {
		multiplier = CareerConstants.bw_necromancer.passive_dot_duration,
	},
	sienna_necromancer_ability_cooldown_on_hit = {
		bonus = 0.25,
	},
	sienna_necromancer_ability_cooldown_on_damage_taken = {
		bonus = 0.25,
	},
	sienna_necromancer_2_1 = {
		skeleton_count = 4,
	},
	sienna_necromancer_2_1_attack_speed = {
		multiplier = 0.12,
	},
	sienna_necromancer_2_2_buff = {
		duration = 6,
		max_stacks = 5,
		multiplier = 0.05,
	},
	sienna_necromancer_2_3 = {
		multiplier = 0.25,
	},
	sienna_necromancer_4_2_soul_rip_stack = {
		max_stacks = 8,
	},
	sienna_necromancer_4_3_withering_touch = {
		duration = 15,
	},
	sienna_necromancer_5_1_reduced_overcharge = {
		multiplier = 0.15,
	},
	sienna_necromancer_5_1_buff = {
		duration = 6,
		multiplier = 0.3,
	},
	sienna_necromancer_5_2_counter = {
		max_stacks = 3,
	},
	sienna_necromancer_5_2_buff = {
		multiplier = -0.8,
	},
	sienna_necromancer_5_3 = {
		overcharge_threshold = 0.12,
	},
	sienna_necromancer_6_1 = {
		breed_to_spawn = "pet_skeleton",
		controlled_unit_template = "necromancer_pet",
		num_skeletons = 5,
	},
	sienna_necromancer_cursed_area = {
		duration = 10,
	},
	sienna_necromancer_command_item_sacrifice = {
		multiplier = 0.7,
	},
	sienna_necromancer_command_item_attack = {
		duration = 8,
		multiplier = 0.6,
	},
	sienna_necromancer_command_item_defend = {
		multiplier = 0.8,
	},
}

local talent_buff_templates = {
	sienna_necromancer_passive_balefire = {
		buffs = {
			{
				name = "sienna_necromancer_passive_balefire",
				stat_buff = "increased_damage_to_balefire",
			},
		},
	},
	sienna_necromancer_perk_dot_duration = {
		buffs = {
			{
				name = "sienna_necromancer_perk_dot_duration",
				stat_buff = "increased_balefire_dot_duration",
			},
		},
	},
	sienna_necromancer_ability_cooldown_on_hit = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown",
				event = "on_hit",
			},
		},
	},
	sienna_necromancer_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	sienna_necromancer_1_1 = {
		buffs = {
			{
				bonus = 0.25,
				buff_func = "heal_damage_targets_on_melee",
				event = "on_player_damage_dealt",
				max_targets = 5,
				multiplier = -0.05,
				perks = {
					buff_perks.linesman_healing,
				},
			},
		},
	},
	sienna_necromancer_1_2 = {
		buffs = {
			{
				buff_func = "heal_percentage_of_enemy_hp_on_melee_kill",
				event = "on_kill",
				heal_cap = 0.25,
				multiplier = 0.45,
				perks = {
					buff_perks.smiter_healing,
				},
			},
		},
	},
	sienna_necromancer_1_3 = {
		buffs = {
			{
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable",
				multiplier = 0.2,
				range = 10,
			},
		},
	},
	sienna_necromancer_2_1 = {
		buffs = {
			{
				buff_func = "thank_you_skeletal_add",
				buff_to_add = "sienna_necromancer_2_1_attack_speed",
				event = "on_controlled_unit_added",
			},
		},
	},
	sienna_necromancer_2_1_removed_tracker = {
		buffs = {
			{
				buff_func = "thank_you_skeletal_remove",
				buff_to_remove = "sienna_necromancer_2_1_attack_speed",
				event = "on_controlled_unit_removed",
				skeleton_count = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_2_1.skeleton_count,
			},
		},
	},
	sienna_necromancer_2_1_attack_speed = {
		buffs = {
			{
				icon = "sienna_necromancer_2_1",
				max_stacks = 1,
				stat_buff = "attack_speed",
			},
		},
	},
	sienna_necromancer_2_2 = {
		buffs = {
			{
				buff_func = "add_buff_local",
				buff_to_add = "sienna_necromancer_2_2_buff",
				event = "on_spell_used",
			},
		},
	},
	sienna_necromancer_2_2_buff = {
		buffs = {
			{
				icon = "sienna_necromancer_2_2",
				refresh_durations = true,
				stat_buff = "power_level_ranged",
			},
		},
	},
	sienna_necromancer_2_3 = {
		buffs = {
			{
				stat_buff = "power_level_critical_strike",
				perks = {
					buff_perks.crit_unlimited_cleave,
				},
			},
		},
	},
	sienna_necromancer_4_1_cursed_blood = {
		buffs = {
			{
				buff_func = "necromancer_crit_burst",
				event = "on_damage_dealt",
				propagation_multiplier = 0.25,
				radius = 3.5,
			},
		},
	},
	sienna_necromancer_4_2_soul_rip = {
		buffs = {
			{
				buff_func = "spawn_ripped_soul",
				event = "on_kill",
				remove_buff_func = "necromancer_remove_orb_buffs",
				orb_settings = {
					orb_name = "necromancer_ripped_soul",
				},
			},
		},
	},
	sienna_necromancer_4_2_soul_rip_stack = {
		buffs = {
			{
				icon = "sienna_necromancer_4_2",
				is_cooldown = true,
				on_max_stacks_func = "add_remove_buffs",
				reset_on_max_stacks = true,
				max_stack_data = {
					buffs_to_add = {
						"sienna_necromancer_4_2_execute",
					},
				},
			},
		},
	},
	sienna_necromancer_4_2_soul_rip_handler = {
		buffs = {
			{
				buff_func = "remove_ref_buff_stack_woods",
				buff_to_remove = "sienna_necromancer_4_2_execute",
				event = "on_critical_action",
				max_stacks = 1,
			},
		},
	},
	sienna_necromancer_4_2_execute = {
		buffs = {
			{
				icon = "sienna_necromancer_4_2",
				priority_buff = true,
				perks = {
					buff_perks.guaranteed_crit,
				},
				max_stacks = math.huge,
			},
		},
	},
	sienna_necromancer_4_3_withering_touch = {
		buffs = {
			{
				buff_func = "apply_dot_on_hit",
				dot_template_name = "sienna_necromancer_4_3_dot",
				event = "on_hit",
				icon = "sienna_necromancer_4_3",
				max_stacks = 1,
				refresh_durations = true,
			},
		},
	},
	sienna_necromancer_4_3_dot = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "sienna_necromancer_4_3_dot_damage",
				damage_type = "burninating",
				duration = 4,
				max_stacks = 3,
				name = "sienna_necromancer_4_3_dot",
				time_between_dot_damages = 0.9,
				update_func = "apply_dot_damage",
				update_start_delay = 0.9,
				perks = {
					buff_perks.burning_balefire,
				},
			},
		},
	},
	sienna_necromancer_5_1_reduced_overcharge = {
		buffs = {
			{
				buff_func = "sienna_necromancer_5_1_on_kill",
				event = "on_kill",
			},
		},
	},
	sienna_necromancer_5_1_buff = {
		buffs = {
			{
				icon = "sienna_necromancer_5_1",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "cooldown_regen",
			},
		},
	},
	sienna_necromancer_5_1_cdr = {
		buffs = {
			{
				multiplier = 0.3,
				stat_buff = "cooldown_regen",
			},
		},
	},
	sienna_necromancer_5_1_reduce_hp = {
		buffs = {
			{
				multiplier = -0.3,
				stat_buff = "max_health",
			},
		},
	},
	sienna_necromancer_5_2 = {
		buffs = {
			{
				buff_func = "cursed_vigor_proc",
				event = "on_ability_activated",
				buffs_to_add = table.fill({}, SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_5_2_counter.max_stacks, "sienna_necromancer_5_2_counter"),
			},
		},
	},
	sienna_necromancer_5_2_counter = {
		buffs = {
			{
				icon = "sienna_necromancer_5_2",
				on_last_stack_removed = "remove_buff_synced",
				on_stack_buff_first_add = "add_buff_synced",
				synced_buff_to_add = "sienna_necromancer_5_2_buff",
				synced_buff_to_remove = "sienna_necromancer_5_2_buff",
				sync_type = BuffSyncType.ClientAndServer,
			},
		},
	},
	sienna_necromancer_5_2_counter_remover = {
		buffs = {
			{
				buff_func = "remove_buff_stack",
				event = "on_damage_taken",
				remove_buff_stack_data = {
					{
						buff_to_remove = "sienna_necromancer_5_2_counter",
						num_stacks = 1,
					},
				},
			},
		},
	},
	sienna_necromancer_5_2_buff = {
		buffs = {
			{
				stat_buff = "damage_taken",
			},
		},
	},
	sienna_necromancer_5_3 = {
		buffs = {
			{
				apply_buff_func = "necromancer_5_3_setup",
				buff_func = "trapped_souls_overcharge_lost",
				event = "on_overcharge_lost",
			},
		},
	},
	sienna_necromancer_6_1 = {
		buffs = {
			{},
		},
	},
	sienna_necromancer_6_2_pet_buff = {
		buffs = {
			{
				buff_func = "apply_dot_on_hit",
				dot_template_name = "sienna_necromancer_4_3_dot",
				event = "on_damage_dealt",
			},
		},
	},
	sienna_necromancer_cursed_area = {
		buffs = {
			{
				area_radius = 8,
				area_unit_name = "units/hub_elements/empty",
				buff_area = true,
				buff_area_buff = "sienna_necromancer_empowered_overcharge",
				buff_self = true,
				icon = "sienna_necromancer_6_3",
				max_stacks = 1,
				name = "sienna_necromancer_cursed_area",
				refresh_buff_area_position = true,
				refresh_durations = false,
			},
		},
	},
	sienna_necromancer_cursed_area_buff = {
		buffs = {
			{
				apply_buff_func = "necromancer_cursed_area_buff",
				icon = "sienna_necromancer_6_3",
				max_stacks = 1,
				remove_buff_func = "necromancer_cursed_area_buff_remove",
			},
		},
	},
	sienna_necromancer_6_3_available_charge = {
		buffs = {
			{},
		},
	},
	sienna_necromancer_6_3_cooldown_charge = {
		buffs = {
			{
				buff_to_add = "sienna_necromancer_6_3_available_charge",
				duration = 2,
				duration_end_func = "add_buff_local",
				icon = "sienna_necromancer_6_3",
				is_cooldown = true,
			},
		},
	},
}
local talent_trees = {
	{
		{
			"sienna_necromancer_thp_linesman",
			"sienna_necromancer_thp_smiter",
			"sienna_necromancer_thp_ninjafencer",
		},
		{
			"sienna_necromancer_2_1",
			"sienna_necromancer_2_2",
			"sienna_necromancer_2_3",
		},
		{
			"sienna_necromancer_3_1",
			"sienna_necromancer_3_2",
			"sienna_necromancer_3_3",
		},
		{
			"sienna_necromancer_4_1",
			"sienna_necromancer_4_2",
			"sienna_necromancer_4_3",
		},
		{
			"sienna_necromancer_5_1",
			"sienna_necromancer_5_2",
			"sienna_necromancer_5_3",
		},
		{
			"sienna_necromancer_6_1",
			"sienna_necromancer_6_2",
			"sienna_necromancer_6_3",
		},
	},
}
local talents = {
	{
		buffer = "server",
		description = "reaper_desc",
		icon = "sienna_necromancer_1_1",
		name = "sienna_necromancer_1_1",
		num_ranks = 1,
		description_values = {
			{
				value = BuffUtils.get_buff_template("reaper", "adventure").buffs[1].max_targets,
			},
		},
		buffs = {
			"sienna_necromancer_1_1",
		},
	},
	{
		buffer = "server",
		description = "bloodlust_desc_3",
		icon = "sienna_necromancer_1_2",
		name = "sienna_necromancer_1_2",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("bloodlust", "adventure").buffs[1].multiplier,
			},
		},
		buffs = {
			"sienna_necromancer_1_2",
		},
	},
	{
		buffer = "server",
		description = "conqueror_desc_3",
		icon = "sienna_necromancer_1_3",
		name = "sienna_necromancer_1_3",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("conqueror", "adventure").buffs[1].multiplier,
			},
		},
		buffs = {
			"sienna_necromancer_1_3",
		},
	},
	{
		buffer = "server",
		icon = "sienna_necromancer_1_1",
		name = "sienna_necromancer_thp_linesman",
		num_ranks = 1,
		display_name = BuffUtils.get_buff_template("thp_linesman", "adventure").buffs[1].display_name,
		description = BuffUtils.get_buff_template("thp_linesman", "adventure").buffs[1].description,
		description_values = BuffUtils.get_buff_template("thp_linesman", "adventure").buffs[1].description_values,
		buffs = {
			"thp_linesman",
		},
	},
	{
		buffer = "server",
		icon = "sienna_necromancer_1_2",
		name = "sienna_necromancer_thp_smiter",
		num_ranks = 1,
		display_name = BuffUtils.get_buff_template("thp_smiter", "adventure").buffs[1].display_name,
		description = BuffUtils.get_buff_template("thp_smiter", "adventure").buffs[1].description,
		description_values = BuffUtils.get_buff_template("thp_smiter", "adventure").buffs[1].description_values,
		buffs = {
			"thp_smiter",
		},
	},
	{
		buffer = "server",
		icon = "sienna_necromancer_1_3",
		name = "sienna_necromancer_thp_ninjafencer",
		num_ranks = 1,
		display_name = BuffUtils.get_buff_template("thp_ninjafencer", "adventure").buffs[1].display_name,
		description = BuffUtils.get_buff_template("thp_ninjafencer", "adventure").buffs[1].description,
		description_values = BuffUtils.get_buff_template("thp_ninjafencer", "adventure").buffs[1].description_values,
		buffs = {
			"thp_ninjafencer",
		},
	},
	{
		buffer = "client",
		description = "sienna_necromancer_2_1_desc",
		icon = "sienna_necromancer_2_1",
		name = "sienna_necromancer_2_1",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_2_1_attack_speed.multiplier,
			},
			{
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_2_1.skeleton_count,
			},
		},
		buffs = {
			"sienna_necromancer_2_1",
			"sienna_necromancer_2_1_removed_tracker",
		},
	},
	{
		buffer = "client",
		description = "sienna_necromancer_2_2_desc",
		icon = "sienna_necromancer_2_2",
		name = "sienna_necromancer_2_2",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_2_2_buff.multiplier,
			},
			{
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_2_2_buff.duration,
			},
			{
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_2_2_buff.max_stacks,
			},
		},
		buffs = {
			"sienna_necromancer_2_2",
		},
	},
	{
		buffer = "both",
		description = "sienna_necromancer_2_3_desc",
		icon = "sienna_necromancer_2_3",
		name = "sienna_necromancer_2_3",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_2_3.multiplier,
			},
		},
		buffs = {
			"sienna_necromancer_2_3",
		},
	},
	{
		buffer = "server",
		description = "linesman_unbalance_desc",
		icon = "sienna_necromancer_3_2",
		name = "sienna_necromancer_3_1",
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
		description = "smiter_unbalance_desc",
		icon = "sienna_necromancer_3_1",
		name = "sienna_necromancer_3_2",
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
		description = "power_level_unbalance_desc",
		icon = "sienna_necromancer_3_3",
		name = "sienna_necromancer_3_3",
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
		buffer = "server",
		description = "sienna_necromancer_4_1_desc",
		icon = "sienna_necromancer_4_1",
		name = "sienna_necromancer_4_1",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"sienna_necromancer_4_1_cursed_blood",
		},
	},
	{
		description = "sienna_necromancer_4_2_desc",
		icon = "sienna_necromancer_4_2",
		name = "sienna_necromancer_4_2",
		num_ranks = 1,
		description_values = {
			{
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_4_2_soul_rip_stack.max_stacks,
			},
		},
		buffs = {
			"sienna_necromancer_4_2_soul_rip",
			"sienna_necromancer_4_2_soul_rip_handler",
		},
	},
	{
		buffer = "client",
		description = "sienna_necromancer_4_3_desc",
		icon = "sienna_necromancer_4_3",
		name = "sienna_necromancer_4_3",
		num_ranks = 1,
		description_values = {
			{
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_4_3_withering_touch.duration,
			},
		},
		buffs = {},
	},
	{
		buffer = "both",
		description = "sienna_necromancer_5_1_desc",
		icon = "sienna_necromancer_5_1",
		name = "sienna_necromancer_5_1",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_5_1_reduced_overcharge.multiplier,
			},
			{
				value = 6,
			},
		},
		buffs = {
			"sienna_necromancer_5_1_reduced_overcharge",
		},
	},
	{
		buffer = "client",
		description = "sienna_necromancer_5_2_desc",
		icon = "sienna_necromancer_5_2",
		name = "sienna_necromancer_5_2",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = -SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_5_2_buff.multiplier,
			},
			{
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_5_2_counter.max_stacks,
			},
		},
		buffs = {
			"sienna_necromancer_5_2",
			"sienna_necromancer_5_2_counter_remover",
		},
	},
	{
		buffer = "client",
		description = "sienna_necromancer_5_3_desc",
		icon = "sienna_necromancer_5_3",
		name = "sienna_necromancer_5_3",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = SHOVEL_BUFF_TWEAK_DATA.sienna_necromancer_5_3.overcharge_threshold,
			},
			{
				value = 2,
			},
		},
		buffs = {
			"sienna_necromancer_5_3",
		},
		requires_packages = {
			trapped_soul_skull = {
				"units/beings/player/bright_wizard_necromancer/talents/trapped_soul_skull",
			},
		},
	},
	{
		buffer = "both",
		description = "sienna_necromancer_6_1_desc_b",
		icon = "sienna_necromancer_6_1",
		name = "sienna_necromancer_6_1",
		num_ranks = 1,
		description_values = {
			{
				value = 6,
			},
			{
				value = 20,
			},
		},
		buffs = {
			"sienna_necromancer_6_1",
		},
	},
	{
		buffer = "both",
		description = "sienna_necromancer_6_2_desc",
		icon = "sienna_necromancer_6_2",
		name = "sienna_necromancer_6_2",
		num_ranks = 1,
		description_values = {},
		buffs = {},
	},
	{
		buffer = "client",
		description = "sienna_necromancer_6_3_desc",
		icon = "sienna_necromancer_6_3",
		name = "sienna_necromancer_6_3",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = CareerConstants.bw_necromancer.armored_pet_health_additional_modifier - 1,
			},
		},
		buffs = {},
	},
}
local hero_name = "bright_wizard"

table.merge(TalentBuffTemplates[hero_name], talent_buff_templates)
table.append(TalentTrees[hero_name], talent_trees)
table.append(Talents[hero_name], talents)

WeaveLoadoutSettings = WeaveLoadoutSettings or {}
WeaveLoadoutSettings.bw_necromancer = {
	talent_tree = talent_trees[1],
	properties = {},
	traits = {},
}

for name, data in pairs(talent_buff_templates) do
	local buffs = data.buffs

	fassert(#buffs == 1, "talent buff has more than one sub buff, add multiple buffs from the talent instead")

	local buff = buffs[1]

	buff.name = name
end

BuffUtils.apply_buff_tweak_data(talent_buff_templates, SHOVEL_BUFF_TWEAK_DATA)
