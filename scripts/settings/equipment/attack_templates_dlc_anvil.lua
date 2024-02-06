-- chunkname: @scripts/settings/equipment/attack_templates_dlc_anvil.lua

AttackTemplates = AttackTemplates or {}
AttackTemplates.pull_smiter = {
	always_stagger = true,
	damage_type = "pull_smiter",
	sound_type = "medium",
	stagger_angle = "pull",
	stagger_value = 2,
}
AttackTemplates.projectile_axe = {
	damage_type = "projectile_axe",
	ranged_stagger = true,
	shield_break = true,
	sound_type = "heavy",
	stagger_angle = "stab",
	stagger_value = 2,
}
