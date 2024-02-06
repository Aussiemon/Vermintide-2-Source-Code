-- chunkname: @scripts/unit_extensions/default_player_unit/buffs/rune_buff_templates.lua

RuneBuffTemplates = RuneBuffTemplates or {}
RuneBuffTemplates.rune_square_damage = {
	buffs = {
		{
			apply_on = "wield",
			description = "Damage",
			multiplier = 0.1,
			name = "rune_square_damage",
			stat_buff = "increased_weapon_damage",
		},
	},
}
RuneBuffTemplates.rune_circle_stamina = {
	buffs = {
		{
			apply_on = "wield",
			bonus = 4,
			description = "Stamina",
			name = "rune_circle_stamina",
			stat_buff = "max_fatigue",
		},
	},
}
RuneBuffTemplates.rune_triangle_attackspeed = {
	buffs = {
		{
			apply_on = "wield",
			description = "Attack Speed",
			multiplier = 1.1,
			name = "rune_triangle_attackspeed",
			stat_buff = "attack_speed",
		},
	},
}
