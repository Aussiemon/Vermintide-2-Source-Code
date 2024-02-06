-- chunkname: @scripts/settings/dlcs/morris/attack_templates_dlc_morris.lua

AttackTemplates = AttackTemplates or {}
AttackTemplates.armor_breaker = {
	damage_type = "blade_storm",
	sound_type = "heavy",
}
AttackTemplates.staff_magma = {
	damage_type = "burn",
	sound_type = "heavy",
}
AttackTemplates.wizard_staff_geiser_magma = {
	damage_type = "burninating",
	dot_type = "burning_dot",
	sound_type = "light",
	damage = {
		0,
		0,
		4,
		0,
		0,
	},
}
AttackTemplates.skulls_of_fury = {
	damage_type = "skulls_of_fury",
	stagger_value = 2,
}
AttackTemplates.thorn_skin = {
	damage_type = "blade_storm",
	sound_type = "light",
}
AttackTemplates.belakor_arena_finish = {
	damage_type = "belakor_arena_finish",
	sound_type = "medium",
	stagger_value = 2,
}
