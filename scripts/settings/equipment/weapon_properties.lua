WeaponProperties = WeaponProperties or {}
local buff_tweak_data = {
	properties_crit_chance = {
		variable_bonus = {
			0.02,
			0.04,
			0.06,
			0.08,
			0.1
		}
	},
	properties_crit_boost = {
		variable_multiplier = {
			0.1,
			0.2
		}
	},
	properties_attack_speed = {
		variable_multiplier = {
			0.02,
			0.1
		}
	},
	properties_stamina = {
		variable_bonus = {
			0.5,
			1,
			1.5,
			2,
			2.5
		}
	},
	properties_health = {
		variable_multiplier = {
			0.1,
			0.25
		}
	},
	properties_ability_cooldown_reduction = {
		variable_multiplier = {
			-0.05,
			-0.2
		}
	},
	properties_curse_resistance = {
		variable_multiplier = {
			-0.11,
			-0.33
		}
	},
	properties_respawn_speed = {
		variable_multiplier = {
			-0.1,
			-0.3
		}
	},
	properties_revive_speed = {
		variable_multiplier = {
			-0.1,
			-0.3
		}
	},
	properties_push_block_arc = {
		variable_multiplier = {
			0.1,
			0.3
		}
	},
	properties_power_vs_skaven = {
		variable_multiplier = {
			0.05,
			0.2
		}
	},
	properties_power_vs_chaos = {
		variable_multiplier = {
			0.05,
			0.2
		}
	},
	properties_power_vs_unarmoured = {
		variable_multiplier = {
			0.05,
			0.2
		}
	},
	properties_power_vs_armoured = {
		variable_multiplier = {
			0.05,
			0.2
		}
	},
	properties_power_vs_large = {
		variable_multiplier = {
			0.05,
			0.2
		}
	},
	properties_power_vs_frenzy = {
		variable_multiplier = {
			0.05,
			0.2
		}
	},
	properties_block_cost = {
		variable_multiplier = {
			-0.1,
			-0.3
		}
	},
	properties_fatigue_regen = {
		variable_multiplier = {
			0.1,
			0.3
		}
	},
	properties_protection_skaven = {
		variable_multiplier = {
			-0.1,
			-0.3
		}
	},
	properties_protection_chaos = {
		variable_multiplier = {
			-0.1,
			-0.3
		}
	},
	properties_protection_aoe = {
		variable_multiplier = {
			-0.1,
			-0.3
		}
	},
	properties_movespeed = {
		multiplier = 1.05,
		displayed_multiplier = {
			0.05,
			0.1
		}
	}
}
WeaponProperties.buff_templates = {
	properties_crit_chance = {
		buffs = {
			{
				stat_buff = StatBuffIndex.CRITICAL_STRIKE_CHANCE
			}
		}
	},
	properties_crit_boost = {
		buffs = {
			{
				stat_buff = StatBuffIndex.CRITICAL_STRIKE_EFFECTIVENESS
			}
		}
	},
	properties_stamina = {
		buffs = {
			{
				stat_buff = StatBuffIndex.MAX_FATIGUE
			}
		}
	},
	properties_attack_speed = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	properties_health = {
		buffs = {
			{
				stat_buff = StatBuffIndex.MAX_HEALTH
			}
		}
	},
	properties_ability_cooldown_reduction = {
		buffs = {
			{
				stat_buff = StatBuffIndex.ACTIVATED_COOLDOWN
			}
		}
	},
	properties_curse_resistance = {
		buffs = {
			{
				stat_buff = StatBuffIndex.CURSE_PROTECTION
			}
		}
	},
	properties_respawn_speed = {
		buffs = {
			{
				stat_buff = StatBuffIndex.FASTER_RESPAWN
			}
		}
	},
	properties_revive_speed = {
		buffs = {
			{
				stat_buff = StatBuffIndex.FASTER_REVIVE
			}
		}
	},
	properties_push_block_arc = {
		buffs = {
			{
				stat_buff = StatBuffIndex.BLOCK_ANGLE
			}
		}
	},
	properties_power_vs_skaven = {
		buffs = {
			{
				stat_buff = StatBuffIndex.POWER_LEVEL_SKAVEN
			}
		}
	},
	properties_power_vs_chaos = {
		buffs = {
			{
				stat_buff = StatBuffIndex.POWER_LEVEL_CHAOS
			}
		}
	},
	properties_power_vs_unarmoured = {
		buffs = {
			{
				stat_buff = StatBuffIndex.POWER_LEVEL_UNARMOURED
			}
		}
	},
	properties_power_vs_armoured = {
		buffs = {
			{
				stat_buff = StatBuffIndex.POWER_LEVEL_ARMOURED
			}
		}
	},
	properties_power_vs_large = {
		buffs = {
			{
				stat_buff = StatBuffIndex.POWER_LEVEL_LARGE
			}
		}
	},
	properties_power_vs_frenzy = {
		buffs = {
			{
				stat_buff = StatBuffIndex.POWER_LEVEL_FRENZY
			}
		}
	},
	properties_block_cost = {
		buffs = {
			{
				stat_buff = StatBuffIndex.BLOCK_COST
			}
		}
	},
	properties_fatigue_regen = {
		buffs = {
			{
				stat_buff = StatBuffIndex.FATIGUE_REGEN
			}
		}
	},
	properties_protection_skaven = {
		buffs = {
			{
				stat_buff = StatBuffIndex.PROTECTION_SKAVEN
			}
		}
	},
	properties_protection_chaos = {
		buffs = {
			{
				stat_buff = StatBuffIndex.PROTECTION_CHAOS
			}
		}
	},
	properties_protection_aoe = {
		buffs = {
			{
				stat_buff = StatBuffIndex.PROTECTION_AOE
			}
		}
	},
	properties_movespeed = {
		buffs = {
			{
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	}
}
WeaponProperties.properties = {
	attack_speed = {
		advanced_description = "description_properties_attack_speed",
		display_name = "properties_attack_speed",
		buff_name = "properties_attack_speed",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.properties_attack_speed.variable_multiplier
			}
		}
	},
	crit_boost = {
		advanced_description = "description_properties_crit_boost",
		display_name = "properties_crit_boost",
		buff_name = "properties_crit_boost",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.properties_crit_boost.variable_multiplier
			}
		}
	},
	power_vs_skaven = {
		advanced_description = "description_properties_power_vs_skaven",
		display_name = "properties_power_vs_skaven",
		buff_name = "properties_power_vs_skaven",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.properties_power_vs_skaven.variable_multiplier
			}
		}
	},
	power_vs_chaos = {
		advanced_description = "description_properties_power_vs_chaos",
		display_name = "properties_power_vs_chaos",
		buff_name = "properties_power_vs_chaos",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.properties_power_vs_chaos.variable_multiplier
			}
		}
	},
	power_vs_unarmoured = {
		advanced_description = "description_properties_power_vs_unarmoured",
		display_name = "properties_power_vs_unarmoured",
		buff_name = "properties_power_vs_unarmoured",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.properties_power_vs_unarmoured.variable_multiplier
			}
		}
	},
	power_vs_armoured = {
		advanced_description = "description_properties_power_vs_armoured",
		display_name = "properties_power_vs_armoured",
		buff_name = "properties_power_vs_armoured",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.properties_power_vs_armoured.variable_multiplier
			}
		}
	},
	power_vs_large = {
		advanced_description = "description_properties_power_vs_large",
		display_name = "properties_power_vs_large",
		buff_name = "properties_power_vs_large",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.properties_power_vs_large.variable_multiplier
			}
		}
	},
	power_vs_frenzy = {
		advanced_description = "description_properties_power_vs_frenzy",
		display_name = "properties_power_vs_frenzy",
		buff_name = "properties_power_vs_frenzy",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.properties_power_vs_frenzy.variable_multiplier
			}
		}
	},
	stamina = {
		advanced_description = "description_properties_stamina",
		display_name = "properties_stamina",
		buff_name = "properties_stamina",
		description_values = {
			{
				value_type = "bonus",
				value = buff_tweak_data.properties_stamina.variable_bonus
			}
		}
	},
	health = {
		advanced_description = "description_properties_health",
		display_name = "properties_health",
		buff_name = "properties_health",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.properties_health.variable_multiplier
			}
		}
	},
	push_block_arc = {
		advanced_description = "description_properties_push_block_arc",
		display_name = "properties_push_block_arc",
		buff_name = "properties_push_block_arc",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.properties_push_block_arc.variable_multiplier
			}
		}
	},
	block_cost = {
		advanced_description = "description_properties_block_cost",
		display_name = "properties_block_cost",
		buff_name = "properties_block_cost",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.properties_block_cost.variable_multiplier
			}
		}
	},
	protection_skaven = {
		advanced_description = "description_properties_protection_skaven",
		display_name = "properties_protection_skaven",
		buff_name = "properties_protection_skaven",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.properties_protection_skaven.variable_multiplier
			}
		}
	},
	protection_chaos = {
		advanced_description = "description_properties_protection_chaos",
		display_name = "properties_protection_chaos",
		buff_name = "properties_protection_chaos",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.properties_protection_chaos.variable_multiplier
			}
		}
	},
	protection_aoe = {
		advanced_description = "description_properties_protection_aoe",
		display_name = "properties_protection_aoe",
		buff_name = "properties_protection_aoe",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.properties_protection_aoe.variable_multiplier
			}
		}
	},
	crit_chance = {
		advanced_description = "description_properties_crit_chance",
		display_name = "properties_crit_chance",
		buff_name = "properties_crit_chance",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.properties_crit_chance.variable_bonus
			}
		}
	},
	ability_cooldown_reduction = {
		advanced_description = "description_properties_ability_cooldown_reduction",
		display_name = "properties_ability_cooldown_reduction",
		buff_name = "properties_ability_cooldown_reduction",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.properties_ability_cooldown_reduction.variable_multiplier
			}
		}
	},
	curse_resistance = {
		display_name = "properties_curse_resistance",
		buffer = "both",
		advanced_description = "description_properties_curse_resistance",
		buff_name = "properties_curse_resistance",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.properties_curse_resistance.variable_multiplier
			}
		}
	},
	respawn_speed = {
		advanced_description = "description_properties_respawn_speed",
		display_name = "properties_respawn_speed",
		buff_name = "properties_respawn_speed",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.properties_respawn_speed.variable_multiplier
			}
		}
	},
	revive_speed = {
		advanced_description = "description_properties_revive_speed",
		display_name = "properties_revive_speed",
		buff_name = "properties_revive_speed",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.properties_revive_speed.variable_multiplier
			}
		}
	},
	fatigue_regen = {
		advanced_description = "description_properties_fatigue_regen",
		display_name = "properties_fatigue_regen",
		buff_name = "properties_fatigue_regen",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.properties_fatigue_regen.variable_multiplier
			}
		}
	},
	movespeed = {
		advanced_description = "description_properties_movespeed",
		display_name = "properties_movespeed",
		buff_name = "properties_movespeed",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.properties_movespeed.displayed_multiplier
			}
		}
	}
}

for name, data in pairs(WeaponProperties.properties) do
	data.name = name
end

WeaponProperties.combinations = {
	melee = {
		common = {
			{
				"crit_chance"
			},
			{
				"crit_boost"
			},
			{
				"stamina"
			},
			{
				"attack_speed"
			},
			{
				"stamina"
			},
			{
				"block_cost"
			},
			{
				"power_vs_skaven"
			},
			{
				"power_vs_chaos"
			}
		},
		rare = {
			{
				"crit_boost",
				"push_block_arc"
			},
			{
				"crit_chance",
				"push_block_arc"
			},
			{
				"crit_chance",
				"crit_boost"
			},
			{
				"attack_speed",
				"push_block_arc"
			},
			{
				"attack_speed",
				"crit_boost"
			},
			{
				"attack_speed",
				"crit_chance"
			},
			{
				"stamina",
				"push_block_arc"
			},
			{
				"stamina",
				"crit_boost"
			},
			{
				"stamina",
				"crit_chance"
			},
			{
				"stamina",
				"attack_speed"
			},
			{
				"block_cost",
				"push_block_arc"
			},
			{
				"block_cost",
				"crit_boost"
			},
			{
				"block_cost",
				"crit_chance"
			},
			{
				"block_cost",
				"attack_speed"
			},
			{
				"block_cost",
				"stamina"
			},
			{
				"power_vs_skaven",
				"push_block_arc"
			},
			{
				"power_vs_skaven",
				"crit_boost"
			},
			{
				"power_vs_skaven",
				"crit_chance"
			},
			{
				"power_vs_skaven",
				"attack_speed"
			},
			{
				"power_vs_skaven",
				"stamina"
			},
			{
				"power_vs_skaven",
				"block_cost"
			},
			{
				"power_vs_chaos",
				"push_block_arc"
			},
			{
				"power_vs_chaos",
				"crit_boost"
			},
			{
				"power_vs_chaos",
				"crit_chance"
			},
			{
				"power_vs_chaos",
				"attack_speed"
			},
			{
				"power_vs_chaos",
				"stamina"
			},
			{
				"power_vs_chaos",
				"block_cost"
			}
		},
		exotic = {
			{
				"crit_boost",
				"push_block_arc"
			},
			{
				"crit_chance",
				"push_block_arc"
			},
			{
				"crit_chance",
				"crit_boost"
			},
			{
				"attack_speed",
				"push_block_arc"
			},
			{
				"attack_speed",
				"crit_boost"
			},
			{
				"attack_speed",
				"crit_chance"
			},
			{
				"stamina",
				"push_block_arc"
			},
			{
				"stamina",
				"crit_boost"
			},
			{
				"stamina",
				"crit_chance"
			},
			{
				"stamina",
				"attack_speed"
			},
			{
				"block_cost",
				"push_block_arc"
			},
			{
				"block_cost",
				"crit_boost"
			},
			{
				"block_cost",
				"crit_chance"
			},
			{
				"block_cost",
				"attack_speed"
			},
			{
				"block_cost",
				"stamina"
			},
			{
				"power_vs_skaven",
				"push_block_arc"
			},
			{
				"power_vs_skaven",
				"crit_boost"
			},
			{
				"power_vs_skaven",
				"crit_chance"
			},
			{
				"power_vs_skaven",
				"attack_speed"
			},
			{
				"power_vs_skaven",
				"stamina"
			},
			{
				"power_vs_skaven",
				"block_cost"
			},
			{
				"power_vs_chaos",
				"push_block_arc"
			},
			{
				"power_vs_chaos",
				"crit_boost"
			},
			{
				"power_vs_chaos",
				"crit_chance"
			},
			{
				"power_vs_chaos",
				"attack_speed"
			},
			{
				"power_vs_chaos",
				"stamina"
			},
			{
				"power_vs_chaos",
				"block_cost"
			}
		},
		unique = {
			{
				"crit_boost",
				"push_block_arc"
			},
			{
				"crit_chance",
				"push_block_arc"
			},
			{
				"crit_chance",
				"crit_boost"
			},
			{
				"attack_speed",
				"push_block_arc"
			},
			{
				"attack_speed",
				"crit_boost"
			},
			{
				"attack_speed",
				"crit_chance"
			},
			{
				"stamina",
				"push_block_arc"
			},
			{
				"stamina",
				"crit_boost"
			},
			{
				"stamina",
				"crit_chance"
			},
			{
				"stamina",
				"attack_speed"
			},
			{
				"block_cost",
				"push_block_arc"
			},
			{
				"block_cost",
				"crit_boost"
			},
			{
				"block_cost",
				"crit_chance"
			},
			{
				"block_cost",
				"attack_speed"
			},
			{
				"block_cost",
				"stamina"
			},
			{
				"power_vs_skaven",
				"push_block_arc"
			},
			{
				"power_vs_skaven",
				"crit_boost"
			},
			{
				"power_vs_skaven",
				"crit_chance"
			},
			{
				"power_vs_skaven",
				"attack_speed"
			},
			{
				"power_vs_skaven",
				"stamina"
			},
			{
				"power_vs_skaven",
				"block_cost"
			},
			{
				"power_vs_chaos",
				"push_block_arc"
			},
			{
				"power_vs_chaos",
				"crit_boost"
			},
			{
				"power_vs_chaos",
				"crit_chance"
			},
			{
				"power_vs_chaos",
				"attack_speed"
			},
			{
				"power_vs_chaos",
				"stamina"
			},
			{
				"power_vs_chaos",
				"block_cost"
			}
		}
	},
	ranged = {
		common = {
			{
				"crit_boost"
			},
			{
				"crit_chance"
			},
			{
				"power_vs_unarmoured"
			},
			{
				"power_vs_armoured"
			},
			{
				"power_vs_large"
			},
			{
				"power_vs_frenzy"
			},
			{
				"power_vs_skaven"
			},
			{
				"power_vs_chaos"
			}
		},
		rare = {
			{
				"crit_chance",
				"crit_boost"
			},
			{
				"power_vs_unarmoured",
				"crit_boost"
			},
			{
				"power_vs_unarmoured",
				"crit_chance"
			},
			{
				"power_vs_armoured",
				"crit_boost"
			},
			{
				"power_vs_armoured",
				"crit_chance"
			},
			{
				"power_vs_armoured",
				"power_vs_unarmoured"
			},
			{
				"power_vs_large",
				"crit_boost"
			},
			{
				"power_vs_large",
				"crit_chance"
			},
			{
				"power_vs_large",
				"power_vs_unarmoured"
			},
			{
				"power_vs_large",
				"power_vs_armoured"
			},
			{
				"power_vs_frenzy",
				"crit_boost"
			},
			{
				"power_vs_frenzy",
				"crit_chance"
			},
			{
				"power_vs_frenzy",
				"power_vs_unarmoured"
			},
			{
				"power_vs_frenzy",
				"power_vs_armoured"
			},
			{
				"power_vs_frenzy",
				"power_vs_large"
			},
			{
				"power_vs_skaven",
				"crit_boost"
			},
			{
				"power_vs_skaven",
				"crit_chance"
			},
			{
				"power_vs_skaven",
				"power_vs_unarmoured"
			},
			{
				"power_vs_skaven",
				"power_vs_armoured"
			},
			{
				"power_vs_skaven",
				"power_vs_large"
			},
			{
				"power_vs_skaven",
				"power_vs_frenzy"
			},
			{
				"power_vs_chaos",
				"crit_boost"
			},
			{
				"power_vs_chaos",
				"crit_chance"
			},
			{
				"power_vs_chaos",
				"power_vs_unarmoured"
			},
			{
				"power_vs_chaos",
				"power_vs_armoured"
			},
			{
				"power_vs_chaos",
				"power_vs_large"
			},
			{
				"power_vs_chaos",
				"power_vs_frenzy"
			}
		},
		exotic = {
			{
				"crit_chance",
				"crit_boost"
			},
			{
				"power_vs_unarmoured",
				"crit_boost"
			},
			{
				"power_vs_unarmoured",
				"crit_chance"
			},
			{
				"power_vs_armoured",
				"crit_boost"
			},
			{
				"power_vs_armoured",
				"crit_chance"
			},
			{
				"power_vs_armoured",
				"power_vs_unarmoured"
			},
			{
				"power_vs_large",
				"crit_boost"
			},
			{
				"power_vs_large",
				"crit_chance"
			},
			{
				"power_vs_large",
				"power_vs_unarmoured"
			},
			{
				"power_vs_large",
				"power_vs_armoured"
			},
			{
				"power_vs_frenzy",
				"crit_boost"
			},
			{
				"power_vs_frenzy",
				"crit_chance"
			},
			{
				"power_vs_frenzy",
				"power_vs_unarmoured"
			},
			{
				"power_vs_frenzy",
				"power_vs_armoured"
			},
			{
				"power_vs_frenzy",
				"power_vs_large"
			},
			{
				"power_vs_skaven",
				"crit_boost"
			},
			{
				"power_vs_skaven",
				"crit_chance"
			},
			{
				"power_vs_skaven",
				"power_vs_unarmoured"
			},
			{
				"power_vs_skaven",
				"power_vs_armoured"
			},
			{
				"power_vs_skaven",
				"power_vs_large"
			},
			{
				"power_vs_skaven",
				"power_vs_frenzy"
			},
			{
				"power_vs_chaos",
				"crit_boost"
			},
			{
				"power_vs_chaos",
				"crit_chance"
			},
			{
				"power_vs_chaos",
				"power_vs_unarmoured"
			},
			{
				"power_vs_chaos",
				"power_vs_armoured"
			},
			{
				"power_vs_chaos",
				"power_vs_large"
			},
			{
				"power_vs_chaos",
				"power_vs_frenzy"
			}
		},
		unique = {
			{
				"crit_chance",
				"crit_boost"
			},
			{
				"power_vs_unarmoured",
				"crit_boost"
			},
			{
				"power_vs_unarmoured",
				"crit_chance"
			},
			{
				"power_vs_armoured",
				"crit_boost"
			},
			{
				"power_vs_armoured",
				"crit_chance"
			},
			{
				"power_vs_armoured",
				"power_vs_unarmoured"
			},
			{
				"power_vs_large",
				"crit_boost"
			},
			{
				"power_vs_large",
				"crit_chance"
			},
			{
				"power_vs_large",
				"power_vs_unarmoured"
			},
			{
				"power_vs_large",
				"power_vs_armoured"
			},
			{
				"power_vs_frenzy",
				"crit_boost"
			},
			{
				"power_vs_frenzy",
				"crit_chance"
			},
			{
				"power_vs_frenzy",
				"power_vs_unarmoured"
			},
			{
				"power_vs_frenzy",
				"power_vs_armoured"
			},
			{
				"power_vs_frenzy",
				"power_vs_large"
			},
			{
				"power_vs_skaven",
				"crit_boost"
			},
			{
				"power_vs_skaven",
				"crit_chance"
			},
			{
				"power_vs_skaven",
				"power_vs_unarmoured"
			},
			{
				"power_vs_skaven",
				"power_vs_armoured"
			},
			{
				"power_vs_skaven",
				"power_vs_large"
			},
			{
				"power_vs_skaven",
				"power_vs_frenzy"
			},
			{
				"power_vs_chaos",
				"crit_boost"
			},
			{
				"power_vs_chaos",
				"crit_chance"
			},
			{
				"power_vs_chaos",
				"power_vs_unarmoured"
			},
			{
				"power_vs_chaos",
				"power_vs_armoured"
			},
			{
				"power_vs_chaos",
				"power_vs_large"
			},
			{
				"power_vs_chaos",
				"power_vs_frenzy"
			}
		}
	},
	offence_accessory = {
		common = {
			{
				"crit_boost"
			},
			{
				"power_vs_unarmoured"
			},
			{
				"power_vs_armoured"
			},
			{
				"power_vs_large"
			},
			{
				"power_vs_frenzy"
			},
			{
				"attack_speed"
			},
			{
				"power_vs_skaven"
			},
			{
				"power_vs_chaos"
			}
		},
		rare = {
			{
				"power_vs_unarmoured",
				"crit_boost"
			},
			{
				"power_vs_armoured",
				"crit_boost"
			},
			{
				"power_vs_armoured",
				"power_vs_unarmoured"
			},
			{
				"power_vs_large",
				"crit_boost"
			},
			{
				"power_vs_large",
				"power_vs_unarmoured"
			},
			{
				"power_vs_frenzy",
				"crit_boost"
			},
			{
				"power_vs_frenzy",
				"power_vs_unarmoured"
			},
			{
				"attack_speed",
				"crit_boost"
			},
			{
				"attack_speed",
				"power_vs_unarmoured"
			},
			{
				"attack_speed",
				"power_vs_armoured"
			},
			{
				"attack_speed",
				"power_vs_large"
			},
			{
				"attack_speed",
				"power_vs_frenzy"
			},
			{
				"power_vs_skaven",
				"crit_boost"
			},
			{
				"power_vs_skaven",
				"power_vs_unarmoured"
			},
			{
				"power_vs_skaven",
				"power_vs_armoured"
			},
			{
				"power_vs_skaven",
				"power_vs_large"
			},
			{
				"power_vs_skaven",
				"power_vs_frenzy"
			},
			{
				"power_vs_skaven",
				"attack_speed"
			},
			{
				"power_vs_chaos",
				"crit_boost"
			},
			{
				"power_vs_chaos",
				"power_vs_unarmoured"
			},
			{
				"power_vs_chaos",
				"power_vs_armoured"
			},
			{
				"power_vs_chaos",
				"power_vs_large"
			},
			{
				"power_vs_chaos",
				"power_vs_frenzy"
			},
			{
				"power_vs_chaos",
				"attack_speed"
			},
			{
				"power_vs_chaos",
				"power_vs_skaven"
			}
		},
		exotic = {
			{
				"power_vs_unarmoured",
				"crit_boost"
			},
			{
				"power_vs_armoured",
				"crit_boost"
			},
			{
				"power_vs_armoured",
				"power_vs_unarmoured"
			},
			{
				"power_vs_large",
				"crit_boost"
			},
			{
				"power_vs_large",
				"power_vs_unarmoured"
			},
			{
				"power_vs_frenzy",
				"crit_boost"
			},
			{
				"power_vs_frenzy",
				"power_vs_unarmoured"
			},
			{
				"attack_speed",
				"crit_boost"
			},
			{
				"attack_speed",
				"power_vs_unarmoured"
			},
			{
				"attack_speed",
				"power_vs_armoured"
			},
			{
				"attack_speed",
				"power_vs_large"
			},
			{
				"attack_speed",
				"power_vs_frenzy"
			},
			{
				"power_vs_skaven",
				"crit_boost"
			},
			{
				"power_vs_skaven",
				"power_vs_unarmoured"
			},
			{
				"power_vs_skaven",
				"power_vs_armoured"
			},
			{
				"power_vs_skaven",
				"power_vs_large"
			},
			{
				"power_vs_skaven",
				"power_vs_frenzy"
			},
			{
				"power_vs_skaven",
				"attack_speed"
			},
			{
				"power_vs_chaos",
				"crit_boost"
			},
			{
				"power_vs_chaos",
				"power_vs_unarmoured"
			},
			{
				"power_vs_chaos",
				"power_vs_armoured"
			},
			{
				"power_vs_chaos",
				"power_vs_large"
			},
			{
				"power_vs_chaos",
				"power_vs_frenzy"
			},
			{
				"power_vs_chaos",
				"attack_speed"
			},
			{
				"power_vs_chaos",
				"power_vs_skaven"
			}
		},
		unique = {
			{
				"power_vs_unarmoured",
				"crit_boost"
			},
			{
				"power_vs_armoured",
				"crit_boost"
			},
			{
				"power_vs_armoured",
				"power_vs_unarmoured"
			},
			{
				"power_vs_large",
				"crit_boost"
			},
			{
				"power_vs_large",
				"power_vs_unarmoured"
			},
			{
				"power_vs_frenzy",
				"crit_boost"
			},
			{
				"power_vs_frenzy",
				"power_vs_unarmoured"
			},
			{
				"attack_speed",
				"crit_boost"
			},
			{
				"attack_speed",
				"power_vs_unarmoured"
			},
			{
				"attack_speed",
				"power_vs_armoured"
			},
			{
				"attack_speed",
				"power_vs_large"
			},
			{
				"attack_speed",
				"power_vs_frenzy"
			},
			{
				"power_vs_skaven",
				"crit_boost"
			},
			{
				"power_vs_skaven",
				"power_vs_unarmoured"
			},
			{
				"power_vs_skaven",
				"power_vs_armoured"
			},
			{
				"power_vs_skaven",
				"power_vs_large"
			},
			{
				"power_vs_skaven",
				"power_vs_frenzy"
			},
			{
				"power_vs_skaven",
				"attack_speed"
			},
			{
				"power_vs_chaos",
				"crit_boost"
			},
			{
				"power_vs_chaos",
				"power_vs_unarmoured"
			},
			{
				"power_vs_chaos",
				"power_vs_armoured"
			},
			{
				"power_vs_chaos",
				"power_vs_large"
			},
			{
				"power_vs_chaos",
				"power_vs_frenzy"
			},
			{
				"power_vs_chaos",
				"attack_speed"
			},
			{
				"power_vs_chaos",
				"power_vs_skaven"
			}
		}
	},
	defence_accessory = {
		common = {
			{
				"health"
			},
			{
				"stamina"
			},
			{
				"push_block_arc"
			},
			{
				"protection_aoe"
			},
			{
				"block_cost"
			},
			{
				"protection_skaven"
			},
			{
				"protection_chaos"
			}
		},
		rare = {
			{
				"stamina",
				"health"
			},
			{
				"push_block_arc",
				"health"
			},
			{
				"push_block_arc",
				"stamina"
			},
			{
				"protection_aoe",
				"health"
			},
			{
				"protection_aoe",
				"stamina"
			},
			{
				"protection_aoe",
				"push_block_arc"
			},
			{
				"block_cost",
				"health"
			},
			{
				"block_cost",
				"stamina"
			},
			{
				"block_cost",
				"push_block_arc"
			},
			{
				"block_cost",
				"protection_aoe"
			},
			{
				"protection_skaven",
				"health"
			},
			{
				"protection_skaven",
				"stamina"
			},
			{
				"protection_skaven",
				"push_block_arc"
			},
			{
				"protection_skaven",
				"protection_aoe"
			},
			{
				"protection_skaven",
				"block_cost"
			},
			{
				"protection_chaos",
				"health"
			},
			{
				"protection_chaos",
				"stamina"
			},
			{
				"protection_chaos",
				"push_block_arc"
			},
			{
				"protection_chaos",
				"protection_aoe"
			},
			{
				"protection_chaos",
				"block_cost"
			}
		},
		exotic = {
			{
				"stamina",
				"health"
			},
			{
				"push_block_arc",
				"health"
			},
			{
				"push_block_arc",
				"stamina"
			},
			{
				"protection_aoe",
				"health"
			},
			{
				"protection_aoe",
				"stamina"
			},
			{
				"protection_aoe",
				"push_block_arc"
			},
			{
				"block_cost",
				"health"
			},
			{
				"block_cost",
				"stamina"
			},
			{
				"block_cost",
				"push_block_arc"
			},
			{
				"block_cost",
				"protection_aoe"
			},
			{
				"protection_skaven",
				"health"
			},
			{
				"protection_skaven",
				"stamina"
			},
			{
				"protection_skaven",
				"push_block_arc"
			},
			{
				"protection_skaven",
				"protection_aoe"
			},
			{
				"protection_skaven",
				"block_cost"
			},
			{
				"protection_chaos",
				"health"
			},
			{
				"protection_chaos",
				"stamina"
			},
			{
				"protection_chaos",
				"push_block_arc"
			},
			{
				"protection_chaos",
				"protection_aoe"
			},
			{
				"protection_chaos",
				"block_cost"
			}
		},
		unique = {
			{
				"stamina",
				"health"
			},
			{
				"push_block_arc",
				"health"
			},
			{
				"push_block_arc",
				"stamina"
			},
			{
				"protection_aoe",
				"health"
			},
			{
				"protection_aoe",
				"stamina"
			},
			{
				"protection_aoe",
				"push_block_arc"
			},
			{
				"block_cost",
				"health"
			},
			{
				"block_cost",
				"stamina"
			},
			{
				"block_cost",
				"push_block_arc"
			},
			{
				"block_cost",
				"protection_aoe"
			},
			{
				"protection_skaven",
				"health"
			},
			{
				"protection_skaven",
				"stamina"
			},
			{
				"protection_skaven",
				"push_block_arc"
			},
			{
				"protection_skaven",
				"protection_aoe"
			},
			{
				"protection_skaven",
				"block_cost"
			},
			{
				"protection_chaos",
				"health"
			},
			{
				"protection_chaos",
				"stamina"
			},
			{
				"protection_chaos",
				"push_block_arc"
			},
			{
				"protection_chaos",
				"protection_aoe"
			},
			{
				"protection_chaos",
				"block_cost"
			}
		}
	},
	utility_accessory = {
		common = {
			{
				"revive_speed"
			},
			{
				"respawn_speed"
			},
			{
				"curse_resistance"
			},
			{
				"crit_chance"
			},
			{
				"ability_cooldown_reduction"
			},
			{
				"fatigue_regen"
			}
		},
		rare = {
			{
				"respawn_speed",
				"revive_speed"
			},
			{
				"curse_resistance",
				"revive_speed"
			},
			{
				"curse_resistance",
				"respawn_speed"
			},
			{
				"crit_chance",
				"revive_speed"
			},
			{
				"crit_chance",
				"respawn_speed"
			},
			{
				"crit_chance",
				"curse_resistance"
			},
			{
				"ability_cooldown_reduction",
				"revive_speed"
			},
			{
				"ability_cooldown_reduction",
				"respawn_speed"
			},
			{
				"ability_cooldown_reduction",
				"curse_resistance"
			},
			{
				"ability_cooldown_reduction",
				"crit_chance"
			},
			{
				"fatigue_regen",
				"revive_speed"
			},
			{
				"fatigue_regen",
				"respawn_speed"
			},
			{
				"fatigue_regen",
				"curse_resistance"
			},
			{
				"fatigue_regen",
				"crit_chance"
			},
			{
				"fatigue_regen",
				"ability_cooldown_reduction"
			}
		},
		exotic = {
			{
				"respawn_speed",
				"revive_speed"
			},
			{
				"curse_resistance",
				"revive_speed"
			},
			{
				"curse_resistance",
				"respawn_speed"
			},
			{
				"crit_chance",
				"revive_speed"
			},
			{
				"crit_chance",
				"respawn_speed"
			},
			{
				"crit_chance",
				"curse_resistance"
			},
			{
				"ability_cooldown_reduction",
				"revive_speed"
			},
			{
				"ability_cooldown_reduction",
				"respawn_speed"
			},
			{
				"ability_cooldown_reduction",
				"curse_resistance"
			},
			{
				"ability_cooldown_reduction",
				"crit_chance"
			},
			{
				"fatigue_regen",
				"revive_speed"
			},
			{
				"fatigue_regen",
				"respawn_speed"
			},
			{
				"fatigue_regen",
				"curse_resistance"
			},
			{
				"fatigue_regen",
				"crit_chance"
			},
			{
				"fatigue_regen",
				"ability_cooldown_reduction"
			}
		},
		unique = {
			{
				"respawn_speed",
				"revive_speed"
			},
			{
				"curse_resistance",
				"revive_speed"
			},
			{
				"curse_resistance",
				"respawn_speed"
			},
			{
				"crit_chance",
				"revive_speed"
			},
			{
				"crit_chance",
				"respawn_speed"
			},
			{
				"crit_chance",
				"curse_resistance"
			},
			{
				"ability_cooldown_reduction",
				"revive_speed"
			},
			{
				"ability_cooldown_reduction",
				"respawn_speed"
			},
			{
				"ability_cooldown_reduction",
				"curse_resistance"
			},
			{
				"ability_cooldown_reduction",
				"crit_chance"
			},
			{
				"fatigue_regen",
				"revive_speed"
			},
			{
				"fatigue_regen",
				"respawn_speed"
			},
			{
				"fatigue_regen",
				"curse_resistance"
			},
			{
				"fatigue_regen",
				"crit_chance"
			},
			{
				"fatigue_regen",
				"ability_cooldown_reduction"
			}
		}
	}
}

for name, data in pairs(WeaponProperties.buff_templates) do
	local buffs = data.buffs

	fassert(#buffs == 1, "property buff has more than one sub buff, add multiple buffs from the property instead")

	local buff = buffs[1]
	buff.name = name
end

BuffUtils.apply_buff_tweak_data(WeaponProperties.buff_templates, buff_tweak_data)

return 
