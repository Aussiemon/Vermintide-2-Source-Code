RuneBuffTemplates = RuneBuffTemplates or {}
RuneBuffTemplates.rune_square_damage = {
	buffs = {
		{
			description = "Damage",
			multiplier = 0.1,
			stat_buff = "increased_weapon_damage",
			apply_on = "wield",
			name = "rune_square_damage"
		}
	}
}
RuneBuffTemplates.rune_circle_stamina = {
	buffs = {
		{
			description = "Stamina",
			name = "rune_circle_stamina",
			stat_buff = "max_fatigue",
			apply_on = "wield",
			bonus = 4
		}
	}
}
RuneBuffTemplates.rune_triangle_attackspeed = {
	buffs = {
		{
			description = "Attack Speed",
			multiplier = 1.1,
			stat_buff = "attack_speed",
			apply_on = "wield",
			name = "rune_triangle_attackspeed"
		}
	}
}
