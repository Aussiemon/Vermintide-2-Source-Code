LightWeightProjectiles = {
	ratling_gunner = {
		projectile_speed = 80,
		light_weight_projectile_effect = "ratling_gun_bullet",
		damage_profile = "ratling_gunner",
		projectile_max_range = 50,
		hit_effect = "ratling_gunner",
		impact_push_speed = 1.5,
		spread = math.degrees_to_radians(7),
		attack_power_level = {
			20,
			40,
			120,
			200,
			250,
			250,
			250,
			250
		}
	},
	ratling_gunner_vs = {
		projectile_speed = 80,
		light_weight_projectile_effect = "ratling_gun_bullet_vs",
		damage_profile = "ratling_gunner",
		projectile_max_range = 50,
		hit_effect = "ratling_gunner",
		impact_push_speed = 2.5,
		spread = math.degrees_to_radians(5),
		attack_power_level = {
			13,
			26,
			90,
			130,
			160,
			160,
			160,
			160
		}
	},
	stormfiend_boss = {
		projectile_speed = 80,
		light_weight_projectile_effect = "stormfiend_gun_bullet",
		damage_profile = "stormfiend_boss",
		projectile_max_range = 50,
		hit_effect = "ratling_gunner",
		impact_push_speed = 3,
		spread = math.degrees_to_radians(4.5),
		attack_power_level = {
			20,
			40,
			60,
			80,
			120,
			120,
			120,
			120
		}
	},
	stormfiend_boss_narrow = {
		projectile_speed = 80,
		light_weight_projectile_effect = "stormfiend_gun_bullet",
		damage_profile = "stormfiend_boss_narrow",
		projectile_max_range = 50,
		hit_effect = "ratling_gunner",
		impact_push_speed = 2.5,
		spread = math.degrees_to_radians(4),
		attack_power_level = {
			40,
			80,
			120,
			160,
			180,
			180,
			180,
			180
		}
	},
	stormfiend_boss_dual_intro = {
		projectile_speed = 80,
		light_weight_projectile_effect = "stormfiend_gun_bullet",
		damage_profile = "stormfiend_boss_dual_intro",
		projectile_max_range = 50,
		hit_effect = "ratling_gunner",
		impact_push_speed = 2.5,
		spread = math.degrees_to_radians(4),
		attack_power_level = {
			40,
			80,
			120,
			160,
			180,
			180,
			180,
			180
		}
	},
	ratling_gunner_backdrop = {
		projectile_speed = 80,
		light_weight_projectile_effect = "autocannon_backdrop_bullet",
		damage_profile = "ratling_gunner_backdrop",
		projectile_max_range = 500,
		hit_effect = "autocannon",
		impact_push_speed = 2.5,
		spread = math.degrees_to_radians(2.5),
		attack_power_level = {
			200,
			300,
			450,
			600,
			650,
			650,
			650,
			650
		}
	}
}

DLCUtils.merge("light_weight_projectiles", LightWeightProjectiles)
