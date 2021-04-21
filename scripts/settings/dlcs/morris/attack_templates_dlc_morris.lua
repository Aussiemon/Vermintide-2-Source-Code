AttackTemplates = AttackTemplates or {}
AttackTemplates.armor_breaker = {
	sound_type = "heavy",
	damage_type = "blade_storm"
}
AttackTemplates.staff_magma = {
	sound_type = "heavy",
	damage_type = "burn"
}
AttackTemplates.staff_magma_charge = {
	sound_type = "light",
	damage_type = "burn"
}
AttackTemplates.wizard_staff_geiser_magma = {
	dot_template_name = "burning_1W_dot",
	sound_type = "light",
	damage_type = "burn",
	dot_type = "burning_dot",
	damage = {
		0,
		0,
		4,
		0,
		0
	}
}
AttackTemplates.skulls_of_fury = {
	stagger_value = 2,
	damage_type = "skulls_of_fury"
}

return
