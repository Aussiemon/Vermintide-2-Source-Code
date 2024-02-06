-- chunkname: @scripts/settings/equipment/attack_templates_dlc_shovel.lua

AttackTemplates = AttackTemplates or {}
AttackTemplates.cursed_blood_spread = {
	always_stagger = true,
	damage_type = "cursed_blood_spread",
	is_push = true,
	sound_type = "stun_heavy",
	stagger_angle = "stab",
	stagger_value = 2,
}
AttackTemplates.necromancer_ability_spawn_stagger = {
	damage_type = "kinetic",
	stagger_value = 2,
}
