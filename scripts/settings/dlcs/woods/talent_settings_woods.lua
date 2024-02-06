-- chunkname: @scripts/settings/dlcs/woods/talent_settings_woods.lua

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local buff_tweak_data = {
	thorn_sister_ability_cooldown_on_hit = {
		bonus = 0.3,
	},
	thorn_sister_ability_cooldown_on_damage_taken = {
		bonus = 0.4,
	},
	kerillian_thorn_sister_ability_on_elite_buff = {
		amount_to_restore = 0.05,
		max_stacks = 20,
	},
	kerillian_thorn_sister_passive_healing_received_aura_buff = {
		multiplier = 0.25,
	},
	kerillian_thorn_sister_passive_temp_health_funnel_aura_buff = {
		multiplier = 1,
	},
	kerillian_power_on_health_gain_buff = {
		duration = 8,
		max_stacks = 3,
		multiplier = 0.05,
	},
	kerillian_crit_on_career_buff = {
		bonus = 0.1,
		duration = 10,
		max_stacks = 3,
	},
	kerillian_speed_on_career_buff = {
		duration = 10,
		max_stacks = 3,
		multiplier = 1.1,
	},
	kerillian_thorn_sister_attack_speed_on_full = {
		health_threshold = 0.9,
	},
	kerillian_thorn_sister_attack_speed_on_full_buff = {
		multiplier = 0.15,
	},
	kerillian_double_passive = {
		visualizer_max_stacks = 2,
	},
	kerillian_improved_surge = {
		amount_to_restore_improved = 0.065,
		max_stacks = 20,
		visualizer_percent = 0.3,
	},
	kerillian_thorn_sister_passive_team_buff = {
		crit_multiplier_visualizer = 0.05,
		duration_visualizer = 10,
		power_multiplier_visualizer = 0.15,
	},
	kerillian_thorn_sister_passive_set_back = {
		reduction_amount_vizualiser = 0.5,
		set_back = 2,
	},
	kerillian_thorn_sister_crit_on_any_ability = {
		amount_to_add = 2,
	},
	kerillian_thorn_sister_double_poison = {
		max_stacks = 2,
	},
	kerillian_thorn_sister_drain_poison_phasing_buff = {
		visualizer_duration = 5,
		visualizer_movementspeed = 0.2,
		visualizer_num_targets = 5,
	},
	kerillian_thorn_sister_big_push_buff = {
		bonus = 10,
		duration = 0.2,
	},
	kerillian_thorn_sister_big_push_buff_2 = {
		duration = 0.2,
		multiplier = 1,
	},
	kerillian_thorn_sister_tanky_wall = {
		visualizer_extra_duration = 10,
	},
	kerillian_thorn_sister_debuff_wall_buff = {
		duration = 10,
		multiplier = 0.2,
		radius = 3,
	},
}
local talent_buff_templates = {
	thorn_sister_ability_cooldown_on_hit = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown",
				event = "on_hit",
			},
		},
	},
	thorn_sister_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	kerillian_thorn_sister_passive_healing_received_aura = {
		buffs = {
			{
				buff_to_add = "kerillian_thorn_sister_passive_healing_received_aura_buff",
				range = 100,
				remove_buff_func = "remove_aura_buff",
				update_func = "activate_buff_on_distance",
				perks = {
					buff_perks.overcharge_no_slow,
				},
			},
		},
	},
	kerillian_thorn_sister_passive_healing_received_aura_buff = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "healing_received",
			},
		},
	},
	kerillian_thorn_sister_passive_temp_health_funnel_aura = {
		buffs = {
			{
				buff_to_add = "kerillian_thorn_sister_passive_temp_health_funnel_aura_buff",
				range = 100,
				remove_buff_func = "remove_aura_buff",
				update_func = "activate_buff_on_distance",
			},
		},
	},
	kerillian_thorn_sister_passive_temp_health_funnel_aura_buff = {
		buffs = {
			{
				authority = "server",
				buff_func = "thorn_sister_transfer_temp_health_at_full",
				event = "on_healed",
				max_stacks = 1,
				name = "kerillian_thorn_sister_passive_temp_health_funnel",
			},
		},
	},
	kerillian_thorn_sister_damage_vs_wounded_enemies = {
		buffs = {
			{
				perks = {
					buff_perks.missing_health_damage,
				},
			},
		},
	},
	kerillian_thorn_sister_health_on_ability = {
		buffs = {
			{
				amount_to_convert = 0.1,
				buff_func = "kerillian_thorn_sister_health_conversion",
				event = "on_ability_cooldown_started",
			},
		},
	},
	kerillian_thorn_sister_free_ability_stack = {
		buffs = {
			{
				icon = "kerillian_thornsister_passive",
				max_stacks = 99,
				name = "kerillian_thorn_sister_free_ability_stack",
				priority_buff = true,
			},
		},
	},
	kerillian_thorn_sister_free_ability_cooldown = {
		buffs = {
			{
				duration = 40,
				icon = "kerillian_thornsister_passive",
				is_cooldown = true,
				max_stacks = 1,
				name = "kerillian_thorn_sister_free_ability_cooldown",
			},
		},
	},
	kerillian_thorn_sister_poison_on_hit = {
		buffs = {
			{
				buff_func = "thorn_sister_add_melee_poison",
				event = "on_hit",
				improved_poison = "thorn_sister_passive_poison_improved",
				poison = "thorn_sister_passive_poison",
				proc_weight = 5,
			},
		},
	},
	kerillian_thorn_sister_attack_speed_on_full = {
		buffs = {
			{
				buff_to_add = "kerillian_thorn_sister_attack_speed_on_full_buff",
				remove_buff_func = "remove_server_buff_on_health_percent",
				update_frequency = 0.2,
				update_func = "update_server_buff_on_health_percent",
			},
		},
	},
	kerillian_thorn_sister_attack_speed_on_full_buff = {
		buffs = {
			{
				icon = "kerillian_thornsister_attack_speed_on_full",
				max_stacks = 1,
				stat_buff = "attack_speed",
			},
		},
	},
	kerillian_thorn_sister_big_bleed = {
		buffs = {
			{
				bleed = "thorn_sister_big_bleed",
				buff_func = "thorn_sister_add_bleed_on_hit",
				event = "on_melee_hit",
				proc_weight = 10,
			},
		},
	},
	kerillian_thorn_sister_crit_on_any_ability = {
		buffs = {
			{
				buff_func = "add_buff_reff_buff_stack",
				buff_to_add = "kerillian_thorn_sister_crit_on_any_ability_buff",
				event = "on_ability_activated",
				max_stacks = 1,
				reference_buff = "kerillian_thorn_sister_crit_on_any_ability_handler",
			},
		},
	},
	kerillian_thorn_sister_crit_on_any_ability_handler = {
		buffs = {
			{
				buff_func = "remove_ref_buff_stack_woods",
				buff_to_remove = "kerillian_thorn_sister_crit_on_any_ability_buff",
				event = "on_critical_action",
				max_stacks = 1,
			},
		},
	},
	kerillian_thorn_sister_crit_on_any_ability_buff = {
		buffs = {
			{
				icon = "kerillian_thornsister_crit_on_any_ability",
				perks = {
					buff_perks.guaranteed_crit,
				},
				max_stacks = math.huge,
			},
		},
	},
	kerillian_thorn_sister_passive_set_back = {
		buffs = {
			{
				amount = -2,
				buff_func = "kerillian_thorn_sister_set_back",
				event = "on_damage_taken",
			},
		},
	},
	kerillian_thorn_sister_passive_set_back_cooldown = {
		buffs = {
			{
				duration = 0.8,
			},
		},
	},
	kerillian_thorn_sister_passive_team_buff = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "kerillian_thorn_sister_team_buff_aura",
				event = "on_extra_ability_consumed",
			},
		},
	},
	kerillian_thorn_sister_team_buff_aura = {
		buffs = {
			{
				buff_to_add = "kerillian_thorn_passive_team_buff",
				duration = 10,
				icon = "kerillian_thornsister_avatar",
				max_stacks = 1,
				range = 20,
				remove_buff_func = "remove_aura_buff",
				update_func = "activate_buff_on_distance",
			},
		},
	},
	kerillian_thorn_sister_drain_poison_phasing_tracker = {
		buffs = {
			{},
		},
	},
	kerillian_thorn_sister_crit_aoe_poison = {
		buffs = {
			{
				buff_func = "kerillian_thorn_sister_crit_aoe_poison_func",
				event = "on_critical_hit",
			},
		},
	},
	kerillian_thorn_sister_big_push = {
		buffs = {
			{
				buff_func = "thorn_sister_big_push",
				buff_to_add = "kerillian_thorn_sister_big_push_buff",
				buff_to_add_2 = "kerillian_thorn_sister_big_push_buff_2",
				event = "on_start_action",
			},
		},
	},
	kerillian_thorn_sister_big_push_buff = {
		activation_sound = "career_ability_kerilian_push",
		buffs = {
			{
				buff_func = "thorn_sister_big_push",
				stat_buff = "push_range",
			},
		},
	},
	kerillian_thorn_sister_big_push_buff_2 = {
		buffs = {
			{
				buff_func = "thorn_sister_big_push",
				stat_buff = "push_power",
			},
		},
	},
	kerillian_thorn_sister_debuff_wall_buff = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				max_stacks = 1,
				name = "kerillian_thorn_sister_debuff_wall_buff",
				refresh_durations = true,
				stat_buff = "damage_taken",
				time_between_dot_damages = 1,
				update_start_delay = 1,
				multiplier = buff_tweak_data.kerillian_thorn_sister_debuff_wall_buff.multiplier,
				duration = buff_tweak_data.kerillian_thorn_sister_debuff_wall_buff.duration,
			},
		},
	},
}
local talent_trees = {
	{
		{
			"kerillian_thorn_sister_regrowth",
			"kerillian_thorn_sister_bloodlust",
			"kerillian_thorn_sister_heal_share",
		},
		{
			"kerillian_thorn_sister_attack_speed_on_full",
			"kerillian_thorn_sister_crit_big_bleed",
			"kerillian_thorn_sister_crit_on_cast",
		},
		{
			"kerillian_thorn_sister_smiter_unbalance",
			"kerillian_thorn_sister_linesman_unbalance",
			"kerillian_thorn_sister_power_level_unbalance",
		},
		{
			"kerillian_double_passive",
			"kerillian_thorn_sister_faster_passive",
			"kerillian_thorn_sister_passive_team_buff",
		},
		{
			"kerillian_thorn_sister_double_poison",
			"kerillian_thorn_sister_crit_aoe_poison",
			"kerillian_thorn_sister_big_push",
		},
		{
			"kerillian_thorn_sister_tanky_wall",
			"kerillian_thorn_sister_wall_push",
			"kerillian_thorn_sister_debuff_wall",
		},
	},
}
local talents = {
	{
		buffer = "both",
		description = "regrowth_desc_3",
		icon = "kerillian_thornsister_regrowth",
		name = "kerillian_thorn_sister_regrowth",
		num_ranks = 1,
		description_values = {
			{
				value = BuffTemplates.regrowth.buffs[1].bonus,
			},
		},
		buffs = {
			"kerillian_waywatcher_regrowth",
		},
	},
	{
		buffer = "server",
		description = "bloodlust_desc_3",
		icon = "kerillian_thornsister_bloodlust",
		name = "kerillian_thorn_sister_bloodlust",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.bloodlust.buffs[1].multiplier,
			},
		},
		buffs = {
			"kerillian_shade_bloodlust",
		},
	},
	{
		buffer = "server",
		description = "conqueror_desc_3",
		icon = "kerillian_thornsister_heal_share",
		name = "kerillian_thorn_sister_heal_share",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier,
			},
		},
		buffs = {
			"kerillian_maidenguard_conqueror",
		},
	},
	{
		buffer = "server",
		description = "kerillian_thorn_sister_attack_speed_on_full_desc",
		icon = "kerillian_thornsister_attack_speed_on_full",
		name = "kerillian_thorn_sister_attack_speed_on_full",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_thorn_sister_attack_speed_on_full.health_threshold,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_thorn_sister_attack_speed_on_full_buff.multiplier,
			},
		},
		buffs = {
			"kerillian_thorn_sister_attack_speed_on_full",
		},
	},
	{
		description = "kerillian_thorn_sister_crit_big_bleed_desc_2",
		icon = "kerillian_thornsister_crit_big_bleed",
		name = "kerillian_thorn_sister_crit_big_bleed",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"kerillian_thorn_sister_big_bleed",
		},
	},
	{
		description = "kerillian_thorn_sister_crit_on_cast_desc_2",
		icon = "kerillian_thornsister_crit_on_any_ability",
		name = "kerillian_thorn_sister_crit_on_cast",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.kerillian_thorn_sister_crit_on_any_ability.amount_to_add,
			},
		},
		buffs = {
			"kerillian_thorn_sister_crit_on_any_ability",
			"kerillian_thorn_sister_crit_on_any_ability_handler",
		},
	},
	{
		buffer = "server",
		description = "smiter_unbalance_desc",
		icon = "kerillian_thornsister_smiter_unbalance",
		name = "kerillian_thorn_sister_smiter_unbalance",
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
		description = "linesman_unbalance_desc",
		icon = "kerillian_thornsister_linesman_unbalance",
		name = "kerillian_thorn_sister_linesman_unbalance",
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
		icon = "kerillian_thornsister_power_level_unbalance",
		name = "kerillian_thorn_sister_power_level_unbalance",
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
		buffer = "server",
		description = "kerillian_double_passive_desc",
		icon = "kerillian_thornsister_double_passive",
		name = "kerillian_double_passive",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.kerillian_double_passive.visualizer_max_stacks,
			},
		},
		buffs = {},
	},
	{
		buffer = "server",
		description = "kerillian_thorn_sister_faster_passive_desc",
		icon = "kerillian_thornsister_reduce_passive_on_elite",
		name = "kerillian_thorn_sister_faster_passive",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_thorn_sister_passive_set_back.reduction_amount_vizualiser,
			},
			{
				value = buff_tweak_data.kerillian_thorn_sister_passive_set_back.set_back,
			},
		},
		buffs = {
			"kerillian_thorn_sister_passive_set_back",
		},
	},
	{
		description = "kerillian_thorn_sister_passive_team_buff_desc",
		icon = "kerillian_thornsister_avatar",
		name = "kerillian_thorn_sister_passive_team_buff",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_thorn_sister_passive_team_buff.power_multiplier_visualizer,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_thorn_sister_passive_team_buff.crit_multiplier_visualizer,
			},
			{
				value = buff_tweak_data.kerillian_thorn_sister_passive_team_buff.duration_visualizer,
			},
		},
		buffs = {
			"kerillian_thorn_sister_passive_team_buff",
		},
	},
	{
		buffer = "server",
		description = "kerillian_thorn_sister_crit_aoe_poison_desc",
		icon = "kerillian_thornsister_veinburst_strike",
		name = "kerillian_thorn_sister_crit_aoe_poison",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"kerillian_thorn_sister_crit_aoe_poison",
		},
	},
	{
		description = "kerillian_thorn_sister_big_push_desc",
		icon = "kerillian_thornsister_big_push",
		name = "kerillian_thorn_sister_big_push",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_thorn_sister_big_push_buff_2.multiplier,
			},
		},
		buffs = {
			"kerillian_thorn_sister_big_push",
		},
	},
	{
		description = "kerillian_thorn_sister_double_poison_desc",
		icon = "kerillian_thornsister_blackvenom",
		name = "kerillian_thorn_sister_double_poison",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.kerillian_thorn_sister_double_poison.max_stacks,
			},
		},
		buffs = {},
	},
	{
		description = "kerillian_thorn_sister_tanky_wall_desc_2",
		icon = "kerillian_thornsister_healing_wall",
		name = "kerillian_thorn_sister_tanky_wall",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.kerillian_thorn_sister_tanky_wall.visualizer_extra_duration,
			},
		},
		buffs = {},
	},
	{
		description = "kerillian_thorn_sister_wall_push_desc",
		icon = "kerillian_thornsister_explosive_wall",
		name = "kerillian_thorn_sister_wall_push",
		num_ranks = 1,
		description_values = {},
		buffs = {},
		requires_packages = {
			wall_units = {
				"units/beings/player/way_watcher_thornsister/abilities/ww_thornsister_thorn_wall_01",
				"units/beings/player/way_watcher_thornsister/abilities/ww_thornsister_thorn_wave_01",
			},
		},
	},
	{
		description = "kerillian_thorn_sister_debuff_wall_desc_2",
		icon = "kerillian_thornsister_debuff_wall",
		name = "kerillian_thorn_sister_debuff_wall",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_thorn_sister_debuff_wall_buff.multiplier,
			},
			{
				value = buff_tweak_data.kerillian_thorn_sister_debuff_wall_buff.duration,
			},
		},
		buffs = {},
		requires_packages = {
			wall_units = {
				"units/beings/player/way_watcher_thornsister/abilities/ww_thornsister_thorn_wall_01_bleed",
			},
		},
	},
}
local hero_name = "wood_elf"

table.merge(TalentBuffTemplates[hero_name], talent_buff_templates)
table.append(TalentTrees[hero_name], talent_trees)
table.append(Talents[hero_name], talents)

WeaveLoadoutSettings = WeaveLoadoutSettings or {}
WeaveLoadoutSettings.we_thornsister = {
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

BuffUtils.apply_buff_tweak_data(talent_buff_templates, buff_tweak_data)
