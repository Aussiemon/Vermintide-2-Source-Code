RuneBuffTemplates = RuneBuffTemplates or {}
RuneBuffTemplates.rune_square_damage = {
	buffs = {
		{
			description = "Damage",
			multiplier = 0.1,
			apply_on = "wield",
			name = "rune_square_damage",
			stat_buff = StatBuffIndex.INCREASED_WEAPON_DAMAGE
		}
	}
}
RuneBuffTemplates.rune_circle_stamina = {
	buffs = {
		{
			description = "Stamina",
			name = "rune_circle_stamina",
			apply_on = "wield",
			bonus = 4,
			stat_buff = StatBuffIndex.MAX_FATIGUE
		}
	}
}
RuneBuffTemplates.rune_triangle_attackspeed = {
	buffs = {
		{
			description = "Attack Speed",
			multiplier = 1.1,
			apply_on = "wield",
			name = "rune_triangle_attackspeed",
			stat_buff = StatBuffIndex.ATTACK_SPEED
		}
	}
}

return
