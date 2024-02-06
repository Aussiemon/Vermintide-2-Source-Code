﻿-- chunkname: @scripts/settings/equipment/weave_properties.lua

WeaveProperties = WeaveProperties or {}

local buff_tweak_data = {
	weave_properties_crit_chance = {
		variable_bonus_max = 0.05,
	},
	weave_properties_crit_boost = {
		variable_multiplier_max = 0.2,
	},
	weave_properties_attack_speed = {
		variable_multiplier_max = 0.05,
	},
	weave_properties_stamina = {
		variable_bonus_max = 2,
	},
	weave_properties_health = {
		variable_multiplier_max = 0.2,
	},
	weave_properties_ability_cooldown_reduction = {
		variable_multiplier_max = -0.1,
	},
	weave_properties_curse_resistance = {
		variable_multiplier_max = -0.33,
	},
	weave_properties_respawn_speed = {
		variable_multiplier_max = -0.3,
	},
	weave_properties_revive_speed = {
		variable_multiplier_max = -0.3,
	},
	weave_properties_push_block_arc = {
		variable_multiplier_max = 0.3,
	},
	weave_properties_power_vs_skaven = {
		variable_multiplier_max = 0.1,
	},
	weave_properties_power_vs_chaos = {
		variable_multiplier_max = 0.1,
	},
	weave_properties_power_vs_unarmoured = {
		variable_multiplier_max = 0.1,
	},
	weave_properties_power_vs_armoured = {
		variable_multiplier_max = 0.1,
	},
	weave_properties_power_vs_large = {
		variable_multiplier_max = 0.1,
	},
	weave_properties_power_vs_frenzy = {
		variable_multiplier_max = 0.1,
	},
	weave_properties_block_cost = {
		variable_multiplier_max = -0.3,
	},
	weave_properties_fatigue_regen = {
		variable_multiplier_max = 0.3,
	},
	weave_properties_protection_skaven = {
		variable_multiplier_max = -0.1,
	},
	weave_properties_protection_chaos = {
		variable_multiplier_max = -0.1,
	},
	weave_properties_protection_aoe = {
		variable_multiplier_max = -0.1,
	},
	weave_properties_movespeed = {
		variable_multiplier_max = 1.05,
	},
}

WeaveProperties.buff_templates = {
	weave_properties_crit_chance = {
		buffs = {
			{
				stat_buff = "critical_strike_chance",
			},
		},
	},
	weave_properties_crit_boost = {
		buffs = {
			{
				stat_buff = "critical_strike_effectiveness",
			},
		},
	},
	weave_properties_stamina = {
		buffs = {
			{
				stat_buff = "max_fatigue",
			},
		},
	},
	weave_properties_attack_speed = {
		buffs = {
			{
				stat_buff = "attack_speed",
			},
		},
	},
	weave_properties_health = {
		buffs = {
			{
				stat_buff = "max_health",
			},
		},
	},
	weave_properties_ability_cooldown_reduction = {
		buffs = {
			{
				stat_buff = "activated_cooldown",
			},
		},
	},
	weave_properties_curse_resistance = {
		buffs = {
			{
				stat_buff = "curse_protection",
			},
		},
	},
	weave_properties_respawn_speed = {
		buffs = {
			{
				stat_buff = "faster_respawn",
			},
		},
	},
	weave_properties_revive_speed = {
		buffs = {
			{
				stat_buff = "faster_revive",
			},
		},
	},
	weave_properties_push_block_arc = {
		buffs = {
			{
				stat_buff = "block_angle",
			},
		},
	},
	weave_properties_power_vs_skaven = {
		buffs = {
			{
				stat_buff = "power_level_skaven",
			},
		},
	},
	weave_properties_power_vs_chaos = {
		buffs = {
			{
				stat_buff = "power_level_chaos",
			},
		},
	},
	weave_properties_power_vs_unarmoured = {
		buffs = {
			{
				stat_buff = "power_level_unarmoured",
			},
		},
	},
	weave_properties_power_vs_armoured = {
		buffs = {
			{
				stat_buff = "power_level_armoured",
			},
		},
	},
	weave_properties_power_vs_large = {
		buffs = {
			{
				stat_buff = "power_level_large",
			},
		},
	},
	weave_properties_power_vs_frenzy = {
		buffs = {
			{
				stat_buff = "power_level_frenzy",
			},
		},
	},
	weave_properties_block_cost = {
		buffs = {
			{
				stat_buff = "block_cost",
			},
		},
	},
	weave_properties_fatigue_regen = {
		buffs = {
			{
				stat_buff = "fatigue_regen",
			},
		},
	},
	weave_properties_protection_skaven = {
		buffs = {
			{
				stat_buff = "protection_skaven",
			},
		},
	},
	weave_properties_protection_chaos = {
		buffs = {
			{
				stat_buff = "protection_chaos",
			},
		},
	},
	weave_properties_protection_aoe = {
		buffs = {
			{
				stat_buff = "protection_aoe",
			},
		},
	},
	weave_properties_movespeed = {
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
}
WeaveProperties.properties = {
	weave_attack_speed = {
		advanced_description = "description_properties_attack_speed",
		buff_name = "weave_properties_attack_speed",
		category = "offensive",
		display_name = "properties_attack_speed",
		icon = "icon_property_attack_speed",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_properties_attack_speed.variable_multiplier_max,
			},
		},
	},
	weave_crit_boost = {
		advanced_description = "description_properties_crit_boost",
		buff_name = "weave_properties_crit_boost",
		buffer = "server",
		category = "offensive",
		display_name = "properties_crit_boost",
		icon = "icon_property_crit_boost",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_properties_crit_boost.variable_multiplier_max,
			},
		},
	},
	weave_power_vs_skaven = {
		advanced_description = "description_properties_power_vs_skaven",
		buff_name = "weave_properties_power_vs_skaven",
		buffer = "server",
		category = "offensive",
		display_name = "properties_power_vs_skaven",
		icon = "icon_property_power_skaven",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_properties_power_vs_skaven.variable_multiplier_max,
			},
		},
	},
	weave_power_vs_chaos = {
		advanced_description = "description_properties_power_vs_chaos",
		buff_name = "weave_properties_power_vs_chaos",
		buffer = "server",
		category = "offensive",
		display_name = "properties_power_vs_chaos",
		icon = "icon_property_power_chaos",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_properties_power_vs_chaos.variable_multiplier_max,
			},
		},
	},
	weave_power_vs_unarmoured = {
		advanced_description = "description_properties_power_vs_unarmoured",
		buff_name = "weave_properties_power_vs_unarmoured",
		buffer = "server",
		category = "offensive",
		display_name = "properties_power_vs_unarmoured",
		icon = "icon_property_power_unarmoured",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_properties_power_vs_unarmoured.variable_multiplier_max,
			},
		},
	},
	weave_power_vs_armoured = {
		advanced_description = "description_properties_power_vs_armoured",
		buff_name = "weave_properties_power_vs_armoured",
		buffer = "server",
		category = "offensive",
		display_name = "properties_power_vs_armoured",
		icon = "icon_property_power_armoured",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_properties_power_vs_armoured.variable_multiplier_max,
			},
		},
	},
	weave_power_vs_large = {
		advanced_description = "description_properties_power_vs_large",
		buff_name = "weave_properties_power_vs_large",
		buffer = "server",
		category = "offensive",
		display_name = "properties_power_vs_large",
		icon = "icon_property_power_large",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_properties_power_vs_large.variable_multiplier_max,
			},
		},
	},
	weave_power_vs_frenzy = {
		advanced_description = "description_properties_power_vs_frenzy",
		buff_name = "weave_properties_power_vs_frenzy",
		buffer = "server",
		category = "offensive",
		display_name = "properties_power_vs_frenzy",
		icon = "icon_property_power_frenzy",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_properties_power_vs_frenzy.variable_multiplier_max,
			},
		},
	},
	weave_stamina = {
		advanced_description = "description_properties_stamina",
		buff_name = "weave_properties_stamina",
		category = "defensive",
		display_name = "properties_stamina",
		icon = "icon_property_stamina",
		description_values = {
			{
				value_type = "bonus",
				value = buff_tweak_data.weave_properties_stamina.variable_bonus_max,
			},
		},
	},
	weave_health = {
		advanced_description = "description_properties_health",
		buff_name = "weave_properties_health",
		buffer = "both",
		category = "defensive",
		display_name = "properties_health",
		icon = "icon_property_health_increase",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_properties_health.variable_multiplier_max,
			},
		},
	},
	weave_push_block_arc = {
		advanced_description = "description_properties_push_block_arc",
		buff_name = "weave_properties_push_block_arc",
		category = "defensive",
		display_name = "properties_push_block_arc",
		icon = "icon_property_block_arc",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_properties_push_block_arc.variable_multiplier_max,
			},
		},
	},
	weave_block_cost = {
		advanced_description = "description_properties_block_cost",
		buff_name = "weave_properties_block_cost",
		category = "defensive",
		display_name = "properties_block_cost",
		icon = "icon_property_block_cost_reduction",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_properties_block_cost.variable_multiplier_max,
			},
		},
	},
	weave_protection_skaven = {
		advanced_description = "description_properties_protection_skaven",
		buff_name = "weave_properties_protection_skaven",
		buffer = "server",
		category = "defensive",
		display_name = "properties_protection_skaven",
		icon = "icon_property_dmg_reduction_skaven",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_properties_protection_skaven.variable_multiplier_max,
			},
		},
	},
	weave_protection_chaos = {
		advanced_description = "description_properties_protection_chaos",
		buff_name = "weave_properties_protection_chaos",
		buffer = "server",
		category = "defensive",
		display_name = "properties_protection_chaos",
		icon = "icon_property_dmg_reduction_chaos",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_properties_protection_chaos.variable_multiplier_max,
			},
		},
	},
	weave_protection_aoe = {
		advanced_description = "description_properties_protection_aoe",
		buff_name = "weave_properties_protection_aoe",
		buffer = "server",
		category = "defensive",
		display_name = "properties_protection_aoe",
		icon = "icon_property_dmg_reduction_aoe",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_properties_protection_aoe.variable_multiplier_max,
			},
		},
	},
	weave_crit_chance = {
		advanced_description = "description_properties_crit_chance",
		buff_name = "weave_properties_crit_chance",
		category = "utility",
		display_name = "properties_crit_chance",
		icon = "icon_property_crit_chance",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_properties_crit_chance.variable_bonus_max,
			},
		},
	},
	weave_ability_cooldown_reduction = {
		advanced_description = "description_properties_ability_cooldown_reduction",
		buff_name = "weave_properties_ability_cooldown_reduction",
		category = "utility",
		display_name = "properties_ability_cooldown_reduction",
		icon = "icon_property_activated_cdr",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_properties_ability_cooldown_reduction.variable_multiplier_max,
			},
		},
	},
	weave_curse_resistance = {
		advanced_description = "description_properties_curse_resistance",
		buff_name = "weave_properties_curse_resistance",
		buffer = "both",
		category = "utility",
		display_name = "properties_curse_resistance",
		icon = "icon_property_grimoire_resistance",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_properties_curse_resistance.variable_multiplier_max,
			},
		},
	},
	weave_respawn_speed = {
		advanced_description = "description_properties_respawn_speed",
		buff_name = "weave_properties_respawn_speed",
		category = "utility",
		display_name = "properties_respawn_speed",
		icon = "icon_property_speed_respawn",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_properties_respawn_speed.variable_multiplier_max,
			},
		},
	},
	weave_revive_speed = {
		advanced_description = "description_properties_revive_speed",
		buff_name = "weave_properties_revive_speed",
		buffer = "both",
		category = "utility",
		display_name = "properties_revive_speed",
		icon = "icon_property_speed_revive",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_properties_revive_speed.variable_multiplier_max,
			},
		},
	},
	weave_fatigue_regen = {
		advanced_description = "description_properties_fatigue_regen",
		buff_name = "weave_properties_fatigue_regen",
		category = "utility",
		display_name = "properties_fatigue_regen",
		icon = "icon_property_speed_stamina_regen",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.weave_properties_fatigue_regen.variable_multiplier_max,
			},
		},
	},
	weave_movespeed = {
		advanced_description = "description_properties_movespeed",
		buff_name = "weave_properties_movespeed",
		category = "utility",
		display_name = "properties_movespeed",
		icon = "icon_property_movement_speed",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.weave_properties_movespeed.variable_multiplier_max,
			},
		},
	},
}

for name, data in pairs(WeaveProperties.properties) do
	data.name = name
end

BuffUtils.copy_talent_buff_names(WeaveProperties.buff_templates)
BuffUtils.apply_buff_tweak_data(WeaveProperties.buff_templates, buff_tweak_data)

WeaveProperties.categories = {
	melee = {
		"weave_crit_chance",
		"weave_crit_boost",
		"weave_stamina",
		"weave_attack_speed",
		"weave_block_cost",
		"weave_push_block_arc",
		"weave_power_vs_skaven",
		"weave_power_vs_chaos",
	},
	ranged = {
		"weave_crit_boost",
		"weave_crit_chance",
		"weave_power_vs_unarmoured",
		"weave_power_vs_armoured",
		"weave_power_vs_large",
		"weave_power_vs_frenzy",
		"weave_power_vs_skaven",
		"weave_power_vs_chaos",
	},
	offence_accessory = {
		"weave_crit_boost",
		"weave_power_vs_unarmoured",
		"weave_power_vs_armoured",
		"weave_power_vs_large",
		"weave_power_vs_frenzy",
		"weave_attack_speed",
		"weave_power_vs_skaven",
		"weave_power_vs_chaos",
	},
	defence_accessory = {
		"weave_health",
		"weave_stamina",
		"weave_push_block_arc",
		"weave_protection_aoe",
		"weave_block_cost",
		"weave_protection_skaven",
		"weave_protection_chaos",
	},
	utility_accessory = {
		"weave_revive_speed",
		"weave_respawn_speed",
		"weave_curse_resistance",
		"weave_crit_chance",
		"weave_ability_cooldown_reduction",
		"weave_fatigue_regen",
		"weave_movespeed",
	},
}
