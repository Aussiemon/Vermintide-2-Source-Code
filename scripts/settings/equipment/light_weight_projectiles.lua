LightWeightProjectiles = {
	ratling_gunner = {
		damage_profile = "ratling_gunner",
		projectile_speed = 80,
		projectile_max_range = 50,
		impact_push_speed = 1.5,
		light_weight_projectile_particle_effect = "ratling_gun_bullet",
		afro_hit_sound = "bullet_pass_by",
		hit_effect = "ratling_gunner",
		attack_power_level = {
			50,
			100,
			150,
			200,
			250
		},
		spread = math.degrees_to_radians(7)
	},
	stormfiend_boss = {
		damage_profile = "stormfiend_boss",
		projectile_speed = 80,
		projectile_max_range = 50,
		impact_push_speed = 3,
		light_weight_projectile_particle_effect = "stormfiend_gun_bullet",
		afro_hit_sound = "bullet_pass_by",
		hit_effect = "ratling_gunner",
		attack_power_level = {
			20,
			40,
			60,
			80,
			120
		},
		spread = math.degrees_to_radians(4.5)
	},
	stormfiend_boss_narrow = {
		damage_profile = "stormfiend_boss_narrow",
		projectile_speed = 80,
		projectile_max_range = 50,
		impact_push_speed = 2.5,
		light_weight_projectile_particle_effect = "stormfiend_gun_bullet",
		afro_hit_sound = "bullet_pass_by",
		hit_effect = "ratling_gunner",
		attack_power_level = {
			40,
			80,
			120,
			160,
			180
		},
		spread = math.degrees_to_radians(4)
	},
	stormfiend_boss_dual_intro = {
		damage_profile = "stormfiend_boss_dual_intro",
		projectile_speed = 80,
		projectile_max_range = 50,
		impact_push_speed = 2.5,
		light_weight_projectile_particle_effect = "stormfiend_gun_bullet",
		afro_hit_sound = "bullet_pass_by",
		hit_effect = "ratling_gunner",
		attack_power_level = {
			40,
			80,
			120,
			160,
			180
		},
		spread = math.degrees_to_radians(4)
	},
	ratling_gunner_backdrop = {
		damage_profile = "ratling_gunner_backdrop",
		projectile_speed = 80,
		projectile_max_range = 500,
		impact_push_speed = 2.5,
		light_weight_projectile_particle_effect = "autocannon_backdrop_bullet",
		afro_hit_sound = "Play_bullet_pass_by_fake",
		hit_effect = "autocannon",
		attack_power_level = {
			200,
			400,
			500,
			600,
			800
		},
		spread = math.degrees_to_radians(2.5)
	}
}

return
