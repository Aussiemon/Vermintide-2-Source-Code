﻿-- chunkname: @scripts/settings/equipment/weapon_properties_morris.lua

local morris_weapon_properties = {}
local buff_tweak_data = {
	stockpile = {
		variable_multiplier = {
			0.2,
			0.4,
		},
	},
	deus_coins_greed = {
		variable_multiplier = {
			0.1,
			0.3,
		},
	},
	deus_power_vs_chaos = {
		variable_multiplier = {
			0.05,
			0.1,
		},
	},
}

morris_weapon_properties.buff_templates = {
	stockpile = {
		buffs = {
			{
				delay = 0,
				name = "stockpile",
				remove_buff_func = "remove_stockpile_buff",
				stat_buff = "total_ammo",
				update_func = "update_stockpile_buff",
			},
		},
	},
	deus_coins_greed = {
		buffs = {
			{
				name = "deus_coins_greed",
				stat_buff = "deus_coins_greed",
			},
		},
	},
	properties_deus_power_vs_chaos = {
		buffs = {
			{
				stat_buff = "power_level_chaos",
			},
		},
	},
}
morris_weapon_properties.properties = {
	stockpile = {
		advanced_description = "description_properties_stockpile",
		buff_name = "stockpile",
		display_name = "properties_stockpile",
		icon = "bardin_ironbreaker_gromril_armour",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.stockpile.variable_multiplier,
			},
		},
	},
	deus_coins_greed = {
		advanced_description = "description_properties_deus_coins_greed",
		buff_name = "deus_coins_greed",
		display_name = "properties_deus_coins_greed",
		icon = "bardin_ironbreaker_gromril_armour",
		no_wield_required = true,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.deus_coins_greed.variable_multiplier,
			},
		},
	},
	deus_power_vs_chaos = {
		advanced_description = "description_properties_power_vs_chaos",
		buff_name = "properties_deus_power_vs_chaos",
		buffer = "server",
		display_name = "properties_power_vs_chaos",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.deus_power_vs_chaos.variable_multiplier,
			},
		},
	},
}

for name, data in pairs(morris_weapon_properties.properties) do
	data.name = name
end

morris_weapon_properties.combinations = {
	deus_melee = {
		common = {
			{
				"crit_chance",
			},
			{
				"crit_boost",
			},
			{
				"stamina",
			},
			{
				"attack_speed",
			},
			{
				"stamina",
			},
			{
				"block_cost",
			},
			{
				"power_vs_skaven",
			},
			{
				"power_vs_chaos",
			},
			{
				"deus_coins_greed",
			},
		},
		rare = {
			{
				"crit_boost",
				"push_block_arc",
			},
			{
				"crit_chance",
				"push_block_arc",
			},
			{
				"crit_chance",
				"crit_boost",
			},
			{
				"attack_speed",
				"push_block_arc",
			},
			{
				"attack_speed",
				"crit_boost",
			},
			{
				"attack_speed",
				"crit_chance",
			},
			{
				"stamina",
				"push_block_arc",
			},
			{
				"stamina",
				"crit_boost",
			},
			{
				"stamina",
				"crit_chance",
			},
			{
				"stamina",
				"attack_speed",
			},
			{
				"block_cost",
				"push_block_arc",
			},
			{
				"block_cost",
				"crit_boost",
			},
			{
				"block_cost",
				"crit_chance",
			},
			{
				"block_cost",
				"attack_speed",
			},
			{
				"block_cost",
				"stamina",
			},
			{
				"power_vs_skaven",
				"push_block_arc",
			},
			{
				"power_vs_skaven",
				"crit_boost",
			},
			{
				"power_vs_skaven",
				"crit_chance",
			},
			{
				"power_vs_skaven",
				"attack_speed",
			},
			{
				"power_vs_skaven",
				"stamina",
			},
			{
				"power_vs_skaven",
				"block_cost",
			},
			{
				"power_vs_skaven",
				"deus_coins_greed",
			},
			{
				"power_vs_chaos",
				"push_block_arc",
			},
			{
				"power_vs_chaos",
				"crit_boost",
			},
			{
				"power_vs_chaos",
				"crit_chance",
			},
			{
				"power_vs_chaos",
				"attack_speed",
			},
			{
				"power_vs_chaos",
				"stamina",
			},
			{
				"power_vs_chaos",
				"block_cost",
			},
			{
				"power_vs_chaos",
				"deus_coins_greed",
			},
			{
				"deus_coins_greed",
				"push_block_arc",
			},
			{
				"deus_coins_greed",
				"crit_boost",
			},
			{
				"deus_coins_greed",
				"crit_chance",
			},
			{
				"deus_coins_greed",
				"attack_speed",
			},
			{
				"deus_coins_greed",
				"stamina",
			},
			{
				"deus_coins_greed",
				"block_cost",
			},
		},
		exotic = {
			{
				"crit_boost",
				"push_block_arc",
			},
			{
				"crit_chance",
				"push_block_arc",
			},
			{
				"crit_chance",
				"crit_boost",
			},
			{
				"attack_speed",
				"push_block_arc",
			},
			{
				"attack_speed",
				"crit_boost",
			},
			{
				"attack_speed",
				"crit_chance",
			},
			{
				"stamina",
				"push_block_arc",
			},
			{
				"stamina",
				"crit_boost",
			},
			{
				"stamina",
				"crit_chance",
			},
			{
				"stamina",
				"attack_speed",
			},
			{
				"block_cost",
				"push_block_arc",
			},
			{
				"block_cost",
				"crit_boost",
			},
			{
				"block_cost",
				"crit_chance",
			},
			{
				"block_cost",
				"attack_speed",
			},
			{
				"block_cost",
				"stamina",
			},
			{
				"power_vs_skaven",
				"push_block_arc",
			},
			{
				"power_vs_skaven",
				"crit_boost",
			},
			{
				"power_vs_skaven",
				"crit_chance",
			},
			{
				"power_vs_skaven",
				"attack_speed",
			},
			{
				"power_vs_skaven",
				"stamina",
			},
			{
				"power_vs_skaven",
				"block_cost",
			},
			{
				"power_vs_skaven",
				"deus_coins_greed",
			},
			{
				"power_vs_chaos",
				"push_block_arc",
			},
			{
				"power_vs_chaos",
				"crit_boost",
			},
			{
				"power_vs_chaos",
				"crit_chance",
			},
			{
				"power_vs_chaos",
				"attack_speed",
			},
			{
				"power_vs_chaos",
				"stamina",
			},
			{
				"power_vs_chaos",
				"block_cost",
			},
			{
				"power_vs_chaos",
				"deus_coins_greed",
			},
			{
				"deus_coins_greed",
				"push_block_arc",
			},
			{
				"deus_coins_greed",
				"crit_boost",
			},
			{
				"deus_coins_greed",
				"crit_chance",
			},
			{
				"deus_coins_greed",
				"attack_speed",
			},
			{
				"deus_coins_greed",
				"stamina",
			},
			{
				"deus_coins_greed",
				"block_cost",
			},
		},
		unique = {
			{
				"crit_boost",
				"push_block_arc",
			},
			{
				"crit_chance",
				"push_block_arc",
			},
			{
				"crit_chance",
				"crit_boost",
			},
			{
				"attack_speed",
				"push_block_arc",
			},
			{
				"attack_speed",
				"crit_boost",
			},
			{
				"attack_speed",
				"crit_chance",
			},
			{
				"stamina",
				"push_block_arc",
			},
			{
				"stamina",
				"crit_boost",
			},
			{
				"stamina",
				"crit_chance",
			},
			{
				"stamina",
				"attack_speed",
			},
			{
				"block_cost",
				"push_block_arc",
			},
			{
				"block_cost",
				"crit_boost",
			},
			{
				"block_cost",
				"crit_chance",
			},
			{
				"block_cost",
				"attack_speed",
			},
			{
				"block_cost",
				"stamina",
			},
			{
				"power_vs_skaven",
				"push_block_arc",
			},
			{
				"power_vs_skaven",
				"crit_boost",
			},
			{
				"power_vs_skaven",
				"crit_chance",
			},
			{
				"power_vs_skaven",
				"attack_speed",
			},
			{
				"power_vs_skaven",
				"stamina",
			},
			{
				"power_vs_skaven",
				"block_cost",
			},
			{
				"power_vs_skaven",
				"deus_coins_greed",
			},
			{
				"power_vs_chaos",
				"push_block_arc",
			},
			{
				"power_vs_chaos",
				"crit_boost",
			},
			{
				"power_vs_chaos",
				"crit_chance",
			},
			{
				"power_vs_chaos",
				"attack_speed",
			},
			{
				"power_vs_chaos",
				"stamina",
			},
			{
				"power_vs_chaos",
				"block_cost",
			},
			{
				"power_vs_chaos",
				"deus_coins_greed",
			},
			{
				"deus_coins_greed",
				"push_block_arc",
			},
			{
				"deus_coins_greed",
				"crit_boost",
			},
			{
				"deus_coins_greed",
				"crit_chance",
			},
			{
				"deus_coins_greed",
				"attack_speed",
			},
			{
				"deus_coins_greed",
				"stamina",
			},
			{
				"deus_coins_greed",
				"block_cost",
			},
		},
	},
	deus_ranged = {
		common = {
			{
				"crit_boost",
			},
			{
				"crit_chance",
			},
			{
				"power_vs_unarmoured",
			},
			{
				"power_vs_armoured",
			},
			{
				"power_vs_large",
			},
			{
				"power_vs_frenzy",
			},
			{
				"power_vs_skaven",
			},
			{
				"power_vs_chaos",
			},
			{
				"deus_coins_greed",
			},
		},
		rare = {
			{
				"crit_chance",
				"crit_boost",
			},
			{
				"power_vs_unarmoured",
				"crit_boost",
			},
			{
				"power_vs_unarmoured",
				"crit_chance",
			},
			{
				"power_vs_armoured",
				"crit_boost",
			},
			{
				"power_vs_armoured",
				"crit_chance",
			},
			{
				"power_vs_armoured",
				"power_vs_unarmoured",
			},
			{
				"power_vs_large",
				"crit_boost",
			},
			{
				"power_vs_large",
				"crit_chance",
			},
			{
				"power_vs_large",
				"power_vs_unarmoured",
			},
			{
				"power_vs_large",
				"power_vs_armoured",
			},
			{
				"power_vs_frenzy",
				"crit_boost",
			},
			{
				"power_vs_frenzy",
				"crit_chance",
			},
			{
				"power_vs_frenzy",
				"power_vs_unarmoured",
			},
			{
				"power_vs_frenzy",
				"power_vs_armoured",
			},
			{
				"power_vs_frenzy",
				"power_vs_large",
			},
			{
				"power_vs_skaven",
				"crit_boost",
			},
			{
				"power_vs_skaven",
				"crit_chance",
			},
			{
				"power_vs_skaven",
				"power_vs_unarmoured",
			},
			{
				"power_vs_skaven",
				"power_vs_armoured",
			},
			{
				"power_vs_skaven",
				"power_vs_large",
			},
			{
				"power_vs_skaven",
				"power_vs_frenzy",
			},
			{
				"power_vs_skaven",
				"deus_coins_greed",
			},
			{
				"power_vs_chaos",
				"crit_boost",
			},
			{
				"power_vs_chaos",
				"crit_chance",
			},
			{
				"power_vs_chaos",
				"power_vs_unarmoured",
			},
			{
				"power_vs_chaos",
				"power_vs_armoured",
			},
			{
				"power_vs_chaos",
				"power_vs_large",
			},
			{
				"power_vs_chaos",
				"power_vs_frenzy",
			},
			{
				"power_vs_chaos",
				"deus_coins_greed",
			},
			{
				"deus_coins_greed",
				"crit_boost",
			},
			{
				"deus_coins_greed",
				"crit_chance",
			},
			{
				"deus_coins_greed",
				"power_vs_unarmoured",
			},
			{
				"deus_coins_greed",
				"power_vs_armoured",
			},
			{
				"deus_coins_greed",
				"power_vs_large",
			},
			{
				"deus_coins_greed",
				"power_vs_frenzy",
			},
		},
		exotic = {
			{
				"crit_chance",
				"crit_boost",
			},
			{
				"power_vs_unarmoured",
				"crit_boost",
			},
			{
				"power_vs_unarmoured",
				"crit_chance",
			},
			{
				"power_vs_armoured",
				"crit_boost",
			},
			{
				"power_vs_armoured",
				"crit_chance",
			},
			{
				"power_vs_armoured",
				"power_vs_unarmoured",
			},
			{
				"power_vs_large",
				"crit_boost",
			},
			{
				"power_vs_large",
				"crit_chance",
			},
			{
				"power_vs_large",
				"power_vs_unarmoured",
			},
			{
				"power_vs_large",
				"power_vs_armoured",
			},
			{
				"power_vs_frenzy",
				"crit_boost",
			},
			{
				"power_vs_frenzy",
				"crit_chance",
			},
			{
				"power_vs_frenzy",
				"power_vs_unarmoured",
			},
			{
				"power_vs_frenzy",
				"power_vs_armoured",
			},
			{
				"power_vs_frenzy",
				"power_vs_large",
			},
			{
				"power_vs_skaven",
				"crit_boost",
			},
			{
				"power_vs_skaven",
				"crit_chance",
			},
			{
				"power_vs_skaven",
				"power_vs_unarmoured",
			},
			{
				"power_vs_skaven",
				"power_vs_armoured",
			},
			{
				"power_vs_skaven",
				"power_vs_large",
			},
			{
				"power_vs_skaven",
				"power_vs_frenzy",
			},
			{
				"power_vs_skaven",
				"deus_coins_greed",
			},
			{
				"power_vs_chaos",
				"crit_boost",
			},
			{
				"power_vs_chaos",
				"crit_chance",
			},
			{
				"power_vs_chaos",
				"power_vs_unarmoured",
			},
			{
				"power_vs_chaos",
				"power_vs_armoured",
			},
			{
				"power_vs_chaos",
				"power_vs_large",
			},
			{
				"power_vs_chaos",
				"power_vs_frenzy",
			},
			{
				"power_vs_chaos",
				"deus_coins_greed",
			},
			{
				"deus_coins_greed",
				"crit_boost",
			},
			{
				"deus_coins_greed",
				"crit_chance",
			},
			{
				"deus_coins_greed",
				"power_vs_unarmoured",
			},
			{
				"deus_coins_greed",
				"power_vs_armoured",
			},
			{
				"deus_coins_greed",
				"power_vs_large",
			},
			{
				"deus_coins_greed",
				"power_vs_frenzy",
			},
		},
		unique = {
			{
				"crit_chance",
				"crit_boost",
			},
			{
				"power_vs_unarmoured",
				"crit_boost",
			},
			{
				"power_vs_unarmoured",
				"crit_chance",
			},
			{
				"power_vs_armoured",
				"crit_boost",
			},
			{
				"power_vs_armoured",
				"crit_chance",
			},
			{
				"power_vs_armoured",
				"power_vs_unarmoured",
			},
			{
				"power_vs_large",
				"crit_boost",
			},
			{
				"power_vs_large",
				"crit_chance",
			},
			{
				"power_vs_large",
				"power_vs_unarmoured",
			},
			{
				"power_vs_large",
				"power_vs_armoured",
			},
			{
				"power_vs_frenzy",
				"crit_boost",
			},
			{
				"power_vs_frenzy",
				"crit_chance",
			},
			{
				"power_vs_frenzy",
				"power_vs_unarmoured",
			},
			{
				"power_vs_frenzy",
				"power_vs_armoured",
			},
			{
				"power_vs_frenzy",
				"power_vs_large",
			},
			{
				"power_vs_skaven",
				"crit_boost",
			},
			{
				"power_vs_skaven",
				"crit_chance",
			},
			{
				"power_vs_skaven",
				"power_vs_unarmoured",
			},
			{
				"power_vs_skaven",
				"power_vs_armoured",
			},
			{
				"power_vs_skaven",
				"power_vs_large",
			},
			{
				"power_vs_skaven",
				"power_vs_frenzy",
			},
			{
				"power_vs_skaven",
				"deus_coins_greed",
			},
			{
				"power_vs_chaos",
				"crit_boost",
			},
			{
				"power_vs_chaos",
				"crit_chance",
			},
			{
				"power_vs_chaos",
				"power_vs_unarmoured",
			},
			{
				"power_vs_chaos",
				"power_vs_armoured",
			},
			{
				"power_vs_chaos",
				"power_vs_large",
			},
			{
				"power_vs_chaos",
				"power_vs_frenzy",
			},
			{
				"power_vs_chaos",
				"deus_coins_greed",
			},
			{
				"deus_coins_greed",
				"crit_boost",
			},
			{
				"deus_coins_greed",
				"crit_chance",
			},
			{
				"deus_coins_greed",
				"power_vs_unarmoured",
			},
			{
				"deus_coins_greed",
				"power_vs_armoured",
			},
			{
				"deus_coins_greed",
				"power_vs_large",
			},
			{
				"deus_coins_greed",
				"power_vs_frenzy",
			},
		},
	},
	deus_ranged_ammo = {
		common = {
			{
				"crit_boost",
			},
			{
				"crit_chance",
			},
			{
				"power_vs_unarmoured",
			},
			{
				"power_vs_armoured",
			},
			{
				"power_vs_large",
			},
			{
				"power_vs_frenzy",
			},
			{
				"power_vs_skaven",
			},
			{
				"power_vs_chaos",
			},
			{
				"deus_coins_greed",
			},
		},
		rare = {
			{
				"crit_chance",
				"crit_boost",
			},
			{
				"power_vs_unarmoured",
				"crit_boost",
			},
			{
				"power_vs_unarmoured",
				"crit_chance",
			},
			{
				"power_vs_armoured",
				"crit_boost",
			},
			{
				"power_vs_armoured",
				"crit_chance",
			},
			{
				"power_vs_armoured",
				"power_vs_unarmoured",
			},
			{
				"power_vs_large",
				"crit_boost",
			},
			{
				"power_vs_large",
				"crit_chance",
			},
			{
				"power_vs_large",
				"power_vs_unarmoured",
			},
			{
				"power_vs_large",
				"power_vs_armoured",
			},
			{
				"power_vs_frenzy",
				"crit_boost",
			},
			{
				"power_vs_frenzy",
				"crit_chance",
			},
			{
				"power_vs_frenzy",
				"power_vs_unarmoured",
			},
			{
				"power_vs_frenzy",
				"power_vs_armoured",
			},
			{
				"power_vs_frenzy",
				"power_vs_large",
			},
			{
				"power_vs_skaven",
				"crit_boost",
			},
			{
				"power_vs_skaven",
				"crit_chance",
			},
			{
				"power_vs_skaven",
				"power_vs_unarmoured",
			},
			{
				"power_vs_skaven",
				"power_vs_armoured",
			},
			{
				"power_vs_skaven",
				"power_vs_large",
			},
			{
				"power_vs_skaven",
				"power_vs_frenzy",
			},
			{
				"power_vs_chaos",
				"crit_boost",
			},
			{
				"power_vs_chaos",
				"crit_chance",
			},
			{
				"power_vs_chaos",
				"power_vs_unarmoured",
			},
			{
				"power_vs_chaos",
				"power_vs_armoured",
			},
			{
				"power_vs_chaos",
				"power_vs_large",
			},
			{
				"power_vs_chaos",
				"power_vs_frenzy",
			},
			{
				"power_vs_chaos",
				"deus_coins_greed",
			},
			{
				"deus_coins_greed",
				"crit_boost",
			},
			{
				"deus_coins_greed",
				"crit_chance",
			},
			{
				"deus_coins_greed",
				"power_vs_unarmoured",
			},
			{
				"deus_coins_greed",
				"power_vs_armoured",
			},
			{
				"deus_coins_greed",
				"power_vs_large",
			},
			{
				"deus_coins_greed",
				"power_vs_frenzy",
			},
			{
				"power_vs_skaven",
				"deus_coins_greed",
			},
		},
		exotic = {
			{
				"crit_chance",
				"crit_boost",
			},
			{
				"power_vs_unarmoured",
				"crit_boost",
			},
			{
				"power_vs_unarmoured",
				"crit_chance",
			},
			{
				"power_vs_armoured",
				"crit_boost",
			},
			{
				"power_vs_armoured",
				"crit_chance",
			},
			{
				"power_vs_armoured",
				"power_vs_unarmoured",
			},
			{
				"power_vs_large",
				"crit_boost",
			},
			{
				"power_vs_large",
				"crit_chance",
			},
			{
				"power_vs_large",
				"power_vs_unarmoured",
			},
			{
				"power_vs_large",
				"power_vs_armoured",
			},
			{
				"power_vs_frenzy",
				"crit_boost",
			},
			{
				"power_vs_frenzy",
				"crit_chance",
			},
			{
				"power_vs_frenzy",
				"power_vs_unarmoured",
			},
			{
				"power_vs_frenzy",
				"power_vs_armoured",
			},
			{
				"power_vs_frenzy",
				"power_vs_large",
			},
			{
				"power_vs_skaven",
				"crit_boost",
			},
			{
				"power_vs_skaven",
				"crit_chance",
			},
			{
				"power_vs_skaven",
				"power_vs_unarmoured",
			},
			{
				"power_vs_skaven",
				"power_vs_armoured",
			},
			{
				"power_vs_skaven",
				"power_vs_large",
			},
			{
				"power_vs_skaven",
				"power_vs_frenzy",
			},
			{
				"power_vs_chaos",
				"crit_boost",
			},
			{
				"power_vs_chaos",
				"crit_chance",
			},
			{
				"power_vs_chaos",
				"power_vs_unarmoured",
			},
			{
				"power_vs_chaos",
				"power_vs_armoured",
			},
			{
				"power_vs_chaos",
				"power_vs_large",
			},
			{
				"power_vs_chaos",
				"power_vs_frenzy",
			},
			{
				"power_vs_chaos",
				"deus_coins_greed",
			},
			{
				"deus_coins_greed",
				"crit_boost",
			},
			{
				"deus_coins_greed",
				"crit_chance",
			},
			{
				"deus_coins_greed",
				"power_vs_unarmoured",
			},
			{
				"deus_coins_greed",
				"power_vs_armoured",
			},
			{
				"deus_coins_greed",
				"power_vs_large",
			},
			{
				"deus_coins_greed",
				"power_vs_frenzy",
			},
			{
				"power_vs_skaven",
				"deus_coins_greed",
			},
		},
		unique = {
			{
				"crit_chance",
				"crit_boost",
			},
			{
				"power_vs_unarmoured",
				"crit_boost",
			},
			{
				"power_vs_unarmoured",
				"crit_chance",
			},
			{
				"power_vs_armoured",
				"crit_boost",
			},
			{
				"power_vs_armoured",
				"crit_chance",
			},
			{
				"power_vs_armoured",
				"power_vs_unarmoured",
			},
			{
				"power_vs_large",
				"crit_boost",
			},
			{
				"power_vs_large",
				"crit_chance",
			},
			{
				"power_vs_large",
				"power_vs_unarmoured",
			},
			{
				"power_vs_large",
				"power_vs_armoured",
			},
			{
				"power_vs_frenzy",
				"crit_boost",
			},
			{
				"power_vs_frenzy",
				"crit_chance",
			},
			{
				"power_vs_frenzy",
				"power_vs_unarmoured",
			},
			{
				"power_vs_frenzy",
				"power_vs_armoured",
			},
			{
				"power_vs_frenzy",
				"power_vs_large",
			},
			{
				"power_vs_skaven",
				"crit_boost",
			},
			{
				"power_vs_skaven",
				"crit_chance",
			},
			{
				"power_vs_skaven",
				"power_vs_unarmoured",
			},
			{
				"power_vs_skaven",
				"power_vs_armoured",
			},
			{
				"power_vs_skaven",
				"power_vs_large",
			},
			{
				"power_vs_skaven",
				"power_vs_frenzy",
			},
			{
				"power_vs_chaos",
				"crit_boost",
			},
			{
				"power_vs_chaos",
				"crit_chance",
			},
			{
				"power_vs_chaos",
				"power_vs_unarmoured",
			},
			{
				"power_vs_chaos",
				"power_vs_armoured",
			},
			{
				"power_vs_chaos",
				"power_vs_large",
			},
			{
				"power_vs_chaos",
				"power_vs_frenzy",
			},
			{
				"power_vs_chaos",
				"deus_coins_greed",
			},
			{
				"deus_coins_greed",
				"crit_boost",
			},
			{
				"deus_coins_greed",
				"crit_chance",
			},
			{
				"deus_coins_greed",
				"power_vs_unarmoured",
			},
			{
				"deus_coins_greed",
				"power_vs_armoured",
			},
			{
				"deus_coins_greed",
				"power_vs_large",
			},
			{
				"deus_coins_greed",
				"power_vs_frenzy",
			},
			{
				"power_vs_skaven",
				"deus_coins_greed",
			},
		},
	},
}

for name, data in pairs(morris_weapon_properties.buff_templates) do
	local buffs = data.buffs

	fassert(#buffs == 1, "property buff has more than one sub buff, add multiple buffs from the property instead")

	local buff = buffs[1]

	buff.name = name
end

BuffUtils.apply_buff_tweak_data(morris_weapon_properties.buff_templates, buff_tweak_data)

for key, value in pairs(morris_weapon_properties.buff_templates) do
	fassert(not WeaponProperties.buff_templates[key], "duplicate buff_template found between WeaponProperties.buff_templates and buff_templates added by morris dlc")

	WeaponProperties.buff_templates[key] = value
end

for key, value in pairs(morris_weapon_properties.properties) do
	fassert(not WeaponProperties.properties[key], "duplicate properties found between WeaponProperties.properties and properties added by morris dlc")

	WeaponProperties.properties[key] = value
end

for key, value in pairs(morris_weapon_properties.combinations) do
	fassert(not WeaponProperties.combinations[key], "duplicate combinations found between WeaponProperties.combinations and combinations added by morris dlc")

	WeaponProperties.combinations[key] = value
end
