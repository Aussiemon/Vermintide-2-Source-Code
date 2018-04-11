require("scripts/settings/explosion_templates")

ProjectileGravitySettings = {
	bounty_hunter_shot = -0.01,
	default = -9.82,
	drakegun = -9.82,
	bolts = -5,
	spark = -0.5,
	drake_pistols = 0,
	arrows = -9.82,
	fireball = -9.82,
	gaze_fireball = -0.01,
	sniper_arrows = -12.82,
	staff = -9.82,
	flame_wave_fireball = -6
}
Projectiles = {
	normal_arrow = {
		impact_type = "raycast",
		trajectory_template_name = "throw_trajectory",
		projectile_unit_template_name = "player_projectile_unit",
		gravity_settings = "arrows",
		dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1_3p",
		projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1_3ps",
		dummy_linker_broken_units = {
			"units/weapons/player/wpn_we_quiver_t1/wpn_we_broken_arrow_01_3ps",
			"units/weapons/player/wpn_we_quiver_t1/wpn_we_broken_arrow_02_3ps",
			"units/weapons/player/wpn_we_quiver_t1/wpn_we_broken_arrow_03_3ps"
		},
		impact_data = {
			wall_nail = true,
			depth = 0.08,
			targets = 1,
			link = true,
			depth_offset = -0.6,
			damage = {
				enemy_unit_hit = {
					default_target = {
						attack_template = "arrow_carbine"
					},
					critical_strike = {}
				},
				damagable_prop_hit = {
					attack_template = "arrow_carbine"
				}
			}
		}
	}
}
Projectiles.default = table.create_copy(Projectiles.normal_arrow, Projectiles.normal_arrow) or table.clone(Projectiles.normal_arrow)
Projectiles.normal_arrow = table.create_copy(Projectiles.normal_arrow, Projectiles.normal_arrow) or table.clone(Projectiles.default)
Projectiles.machinegun_arrow = {
	dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1_3p",
	impact_type = "raycast",
	trajectory_template_name = "throw_trajectory",
	projectile_unit_template_name = "player_projectile_unit",
	gravity_settings = "arrows",
	projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1_3ps",
	dummy_linker_broken_units = {
		"units/weapons/player/wpn_we_quiver_t1/wpn_we_broken_arrow_01_3ps",
		"units/weapons/player/wpn_we_quiver_t1/wpn_we_broken_arrow_02_3ps",
		"units/weapons/player/wpn_we_quiver_t1/wpn_we_broken_arrow_03_3ps"
	}
}
Projectiles.machinegun_arrow = table.clone(Projectiles.machinegun_arrow) or table.clone(Projectiles.default)
Projectiles.machinegun_arrow_t2 = table.clone(Projectiles.machinegun_arrow)
Projectiles.machinegun_arrow_t2.projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t2_3ps"
Projectiles.machinegun_arrow_t2.dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t2_3p"
Projectiles.machinegun_arrow_t3 = table.clone(Projectiles.machinegun_arrow)
Projectiles.machinegun_arrow_t3.projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t3_3ps"
Projectiles.machinegun_arrow_t3.dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t3_3p"
Projectiles.carbine_arrow = {
	dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1_3p",
	static_impact_type = "raycast",
	impact_type = "sphere_sweep",
	radius = 0.075,
	trajectory_template_name = "throw_trajectory",
	projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1_3ps",
	gravity_settings = "arrows",
	projectile_unit_template_name = "player_projectile_unit",
	dummy_linker_broken_units = {
		"units/weapons/player/wpn_we_quiver_t1/wpn_we_broken_arrow_01_3ps",
		"units/weapons/player/wpn_we_quiver_t1/wpn_we_broken_arrow_02_3ps",
		"units/weapons/player/wpn_we_quiver_t1/wpn_we_broken_arrow_03_3ps"
	}
}
Projectiles.carbine_arrow = table.clone(Projectiles.carbine_arrow) or table.clone(Projectiles.default)
Projectiles.carbine_arrow_t2 = table.clone(Projectiles.carbine_arrow)
Projectiles.carbine_arrow_t2.projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t2_3ps"
Projectiles.carbine_arrow_t2.dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t2_3p"
Projectiles.carbine_arrow_t3 = table.clone(Projectiles.carbine_arrow)
Projectiles.carbine_arrow_t3.projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t3_3ps"
Projectiles.carbine_arrow_t3.dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t3_3p"
Projectiles.sniper_arrow = {
	dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1_3p",
	static_impact_type = "raycast",
	impact_type = "sphere_sweep",
	radius = 0.05,
	trajectory_template_name = "throw_trajectory",
	projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1_3ps",
	gravity_settings = "sniper_arrows",
	projectile_unit_template_name = "player_projectile_unit",
	dummy_linker_broken_units = {
		"units/weapons/player/wpn_we_quiver_t1/wpn_we_broken_arrow_01_3ps",
		"units/weapons/player/wpn_we_quiver_t1/wpn_we_broken_arrow_02_3ps",
		"units/weapons/player/wpn_we_quiver_t1/wpn_we_broken_arrow_03_3ps"
	}
}
Projectiles.sniper_arrow = table.clone(Projectiles.sniper_arrow) or table.clone(Projectiles.default)
Projectiles.sniper_arrow_t2 = table.clone(Projectiles.sniper_arrow)
Projectiles.sniper_arrow_t2.projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t2_3ps"
Projectiles.sniper_arrow_t2.dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t2_3p"
Projectiles.sniper_arrow_t3 = table.clone(Projectiles.sniper_arrow)
Projectiles.sniper_arrow_t3.projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t3_3ps"
Projectiles.sniper_arrow_t3.dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t3_3p"
Projectiles.machinegun_bodkin_arrow = table.clone(Projectiles.machinegun_arrow) or table.clone(Projectiles.default)
Projectiles.machinegun_bodkin_arrow_t2 = table.clone(Projectiles.machinegun_bodkin_arrow)
Projectiles.machinegun_bodkin_arrow_t2.projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t2_3ps"
Projectiles.machinegun_bodkin_arrow_t2.dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t2_3p"
Projectiles.machinegun_bodkin_arrow_t3 = table.clone(Projectiles.machinegun_bodkin_arrow)
Projectiles.machinegun_bodkin_arrow_t3.projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t3_3ps"
Projectiles.machinegun_bodkin_arrow_t3.dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t3_3p"
Projectiles.carbine_arrow_bodkin = table.clone(Projectiles.carbine_arrow) or table.clone(Projectiles.default)
Projectiles.carbine_arrow_bodkin_t2 = table.clone(Projectiles.carbine_arrow_bodkin)
Projectiles.carbine_arrow_bodkin_t2.projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t2_3ps"
Projectiles.carbine_arrow_bodkin_t2.dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t2_3p"
Projectiles.carbine_arrow_bodkin_t3 = table.clone(Projectiles.carbine_arrow_bodkin)
Projectiles.carbine_arrow_bodkin_t3.projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t3_3ps"
Projectiles.carbine_arrow_bodkin_t3.dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t3_3p"
Projectiles.sniper_arrow_bodkin = table.clone(Projectiles.sniper_arrow) or table.clone(Projectiles.default)
Projectiles.sniper_arrow_bodkin_t2 = table.clone(Projectiles.sniper_arrow_bodkin)
Projectiles.sniper_arrow_bodkin_t2.projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t2_3ps"
Projectiles.sniper_arrow_bodkin_t2.dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t2_3p"
Projectiles.sniper_arrow_bodkin_t3 = table.clone(Projectiles.sniper_arrow_bodkin)
Projectiles.sniper_arrow_bodkin_t3.projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t3_3ps"
Projectiles.sniper_arrow_bodkin_t3.dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t3_3p"
Projectiles.true_flight_machinegun = table.clone(Projectiles.machinegun_arrow) or table.clone(Projectiles.default)
Projectiles.true_flight_machinegun.projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_homing_arrow_t1_3ps"
Projectiles.true_flight_machinegun.dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_homing_arrow_t1_3p"
Projectiles.true_flight_machinegun_t2 = table.clone(Projectiles.machinegun_arrow_t2) or table.clone(Projectiles.default)
Projectiles.true_flight_machinegun_t3 = table.clone(Projectiles.machinegun_arrow_t3) or table.clone(Projectiles.default)
Projectiles.true_flight_carbine = table.clone(Projectiles.carbine_arrow) or table.clone(Projectiles.default)
Projectiles.true_flight_carbine.projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_homing_arrow_t1_3ps"
Projectiles.true_flight_carbine.dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_homing_arrow_t1_3p"
Projectiles.true_flight_carbine_t2 = table.clone(Projectiles.carbine_arrow_t2) or table.clone(Projectiles.default)
Projectiles.true_flight_carbine_t3 = table.clone(Projectiles.carbine_arrow_t3) or table.clone(Projectiles.default)
Projectiles.kerillian_ability_true_flight = table.clone(Projectiles.true_flight_carbine) or table.clone(Projectiles.default)
Projectiles.sniper_poison_arrow = {
	projectile_unit_template_name = "player_projectile_unit",
	dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_poison_arrow_t1_3p",
	impact_type = "raycast",
	gravity_settings = "arrows",
	trajectory_template_name = "throw_trajectory",
	projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_poison_arrow_t1_3ps"
}
Projectiles.sniper_poison_arrow = table.clone(Projectiles.sniper_poison_arrow) or table.clone(Projectiles.default)
Projectiles.machinegun_poison_arrow = {
	projectile_unit_template_name = "player_projectile_unit",
	dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_poison_arrow_t1_3p",
	impact_type = "sphere_sweep",
	gravity_settings = "arrows",
	trajectory_template_name = "throw_trajectory",
	radius = 0.1,
	projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_poison_arrow_t1_3ps"
}
Projectiles.machinegun_poison_arrow = table.clone(Projectiles.machinegun_poison_arrow) or table.clone(Projectiles.default)
Projectiles.carbine_poison_arrow = {
	projectile_unit_template_name = "player_projectile_unit",
	dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_poison_arrow_t1_3p",
	impact_type = "sphere_sweep",
	gravity_settings = "arrows",
	trajectory_template_name = "throw_trajectory",
	radius = 0.1,
	projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_poison_arrow_t1_3ps"
}
Projectiles.carbine_poison_arrow = table.clone(Projectiles.carbine_poison_arrow) or table.clone(Projectiles.default)
Projectiles.crossbow_bolt = {
	projectile_unit_template_name = "player_projectile_unit",
	dummy_linker_unit_name = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3p",
	gravity_settings = "bolts",
	impact_type = "sphere_sweep",
	trajectory_template_name = "throw_trajectory",
	static_impact_type = "raycast",
	radius = 0.05,
	projectile_unit_name = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3ps"
}
Projectiles.crossbow_bolt = table.clone(Projectiles.crossbow_bolt) or table.clone(Projectiles.default)
Projectiles.repeating_crossbow_bolt = table.clone(Projectiles.crossbow_bolt) or table.clone(Projectiles.default)
Projectiles.brace_of_drake_pistols_shot = {
	projectile_unit_template_name = "player_projectile_unit",
	radius = 0.15,
	impact_type = "sphere_sweep",
	gravity_settings = "drakegun",
	trajectory_template_name = "throw_trajectory",
	projectile_unit_name = "units/weapons/player/drake_pistol_projectile/drake_pistol_projectile_3ps"
}
Projectiles.brace_of_drake_pistols_shot = table.clone(Projectiles.brace_of_drake_pistols_shot) or table.clone(Projectiles.default)
Projectiles.fireball = {
	impact_type = "sphere_sweep",
	static_impact_type = "raycast",
	fire_from_muzzle = false,
	gaze_override_gravity_settings = "gaze_fireball",
	trajectory_template_name = "throw_trajectory",
	muzzle_name = "fx_01",
	radius = 0.15,
	projectile_unit_name = "units/weapons/player/fireball_projectile/fireball_projectile_3ps",
	gravity_settings = "drakegun",
	projectile_unit_template_name = "player_projectile_unit"
}
Projectiles.fireball = table.clone(Projectiles.fireball) or table.clone(Projectiles.default)
Projectiles.fireball_charged = {
	impact_type = "sphere_sweep",
	static_impact_type = "sphere_sweep",
	fire_from_muzzle = false,
	radius_max = 0.75,
	trajectory_template_name = "throw_trajectory",
	muzzle_name = "fx_01",
	radius_min = 0.2,
	projectile_unit_name = "units/weapons/player/fireball_projectile/charged_fireball_projectile_3ps",
	forced_hitzone = "torso",
	gravity_settings = "drakegun",
	times_bigger = 4,
	projectile_unit_template_name = "player_projectile_unit"
}
Projectiles.fireball_charged = table.clone(Projectiles.fireball_charged) or table.clone(Projectiles.default)
local flame_wave_fireball = {
	projectile_unit_template_name = "player_projectile_unit",
	radius = 0.2,
	gravity_settings = "flame_wave_fireball",
	impact_type = "sphere_sweep",
	trajectory_template_name = "throw_trajectory",
	projectile_unit_name = "units/weapons/player/fireball_projectile/fireball_projectile_3ps"
}
Projectiles.flame_wave_fireball = table.create_copy(Projectiles.flame_wave_fireball, flame_wave_fireball)
local flame_wave = {
	collision_filter = "filter_enemy_unit",
	radius = 1,
	impact_type = "sphere_sweep",
	scene_query_height_offset = 1,
	trajectory_template_name = "throw_trajectory",
	projectile_unit_name = "units/weapons/player/flame_wave_projectile/flame_wave_projectile_3ps",
	gravity_settings = "drakegun",
	times_bigger = 4,
	projectile_unit_template_name = "flame_wave_projectile_unit"
}
Projectiles.flame_wave = table.create_copy(Projectiles.flame_wave, flame_wave)
local bouncing_fireball = {
	projectile_unit_template_name = "player_projectile_unit",
	radius = 0.2,
	gravity_settings = "drakegun",
	impact_type = "sphere_sweep",
	trajectory_template_name = "throw_trajectory",
	projectile_unit_name = "units/weapons/player/fireball_projectile/fireball_projectile_3ps"
}
Projectiles.bouncing_fireball = table.create_copy(Projectiles.bouncing_fireball, bouncing_fireball)
Projectiles.spark = {
	projectile_unit_template_name = "player_projectile_unit",
	radius = 0.075,
	impact_type = "sphere_sweep",
	gravity_settings = "spark",
	trajectory_template_name = "throw_trajectory",
	projectile_unit_name = "units/weapons/player/spear_projectile/spark_3ps"
}
Projectiles.spark = table.clone(Projectiles.spark) or table.clone(Projectiles.default)
Projectiles.spear = {
	projectile_unit_template_name = "player_projectile_unit",
	gravity_settings = "spark",
	impact_type = "sphere_sweep",
	radius_max = 0.1,
	trajectory_template_name = "throw_trajectory",
	radius_min = 0.1,
	projectile_unit_name = "units/weapons/player/spear_projectile/spear_3ps"
}
Projectiles.spear = table.clone(Projectiles.spear) or table.clone(Projectiles.default)
Projectiles.burning_head = {
	projectile_unit_template_name = "player_projectile_unit",
	gravity_settings = "spark",
	impact_type = "sphere_sweep",
	radius_max = 0.1,
	trajectory_template_name = "throw_trajectory",
	radius_min = 0.1,
	projectile_unit_name = "units/weapons/projectile/burning_head/burning_head"
}
Projectiles.burning_head = table.clone(Projectiles.burning_head) or table.clone(Projectiles.default)
Projectiles.markus_huntsman_career_weapon = {
	projectile_unit_template_name = "player_projectile_unit",
	life_time = 3,
	gravity_settings = "drakegun",
	impact_type = "sphere_sweep",
	trajectory_template_name = "throw_trajectory",
	radius = 0.1,
	projectile_unit_name = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_01_t1_3p"
}
Projectiles.bardin_ranger_career_weapon = {
	projectile_unit_template_name = "player_projectile_unit",
	radius = 0.1,
	gravity_settings = "drakegun",
	impact_type = "sphere_sweep",
	trajectory_template_name = "throw_trajectory",
	projectile_unit_name = "units/weapons/player/wpn_emp_grenade_02_t2/wpn_emp_grenade_02_t2_3p"
}
Projectiles.victor_bounty_hunter = table.clone(Projectiles.crossbow_bolt) or table.clone(Projectiles.default)
Projectiles.victor_bounty_hunter.radius = 0.15
Projectiles.victor_bounty_hunter.gravity_settings = "bounty_hunter_shot"
Projectiles.kerillian_waywatcher_career_arrows = {
	projectile_unit_template_name = "player_projectile_unit",
	dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_tripple_arrow_t1_3ps",
	impact_type = "raycast",
	gravity_settings = "arrows",
	trajectory_template_name = "throw_trajectory",
	projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_tripple_arrow_t1_3p"
}
Projectiles.sniper_poison_arrow = table.clone(Projectiles.sniper_poison_arrow) or table.clone(Projectiles.default)
Projectiles.grenade = {
	impact_type = "sphere_sweep",
	radius = 0.1,
	show_warning_icon = true,
	trajectory_template_name = "throw_trajectory",
	pickup_name = "grenade",
	projectile_unit_name = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_01_t1_3p",
	life_time = 3,
	gravity_settings = "drakegun",
	projectile_unit_template_name = "player_projectile_unit",
	rotate_around = true
}
Projectiles.grenade_fire = {
	impact_type = "sphere_sweep",
	radius = 0.1,
	show_warning_icon = true,
	trajectory_template_name = "throw_trajectory",
	pickup_name = "grenade",
	projectile_unit_name = "units/weapons/player/wpn_emp_grenade_03_t1/wpn_emp_grenade_03_t1_3p",
	life_time = 3,
	gravity_settings = "drakegun",
	projectile_unit_template_name = "player_projectile_unit",
	rotate_around = true
}
Projectiles.grenade_gas = {
	impact_type = "sphere_sweep",
	radius = 0.1,
	show_warning_icon = true,
	trajectory_template_name = "throw_trajectory",
	pickup_name = "grenade",
	projectile_unit_name = "units/weapons/player/wpn_emp_grenade_02_t1/wpn_emp_grenade_02_t1_3p",
	life_time = 3,
	gravity_settings = "drakegun",
	projectile_unit_template_name = "player_projectile_unit",
	rotate_around = true
}

for name, data in pairs(Projectiles) do
	data.name = name
end

return 
