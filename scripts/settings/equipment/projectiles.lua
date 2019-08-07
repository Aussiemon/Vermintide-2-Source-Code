require("scripts/settings/equipment/projectile_units")
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
	sniper_arrows = -12.82,
	staff = -9.82,
	gaze_fireball = -0.01
}

for _, dlc in pairs(DLCSettings) do
	local projectile_gravity_settings = dlc.projectile_gravity_settings

	if projectile_gravity_settings then
		for name, value in pairs(projectile_gravity_settings) do
			ProjectileGravitySettings[name] = value
		end
	end
end

Projectiles = {
	normal_arrow = {
		projectile_unit_template_name = "player_projectile_unit",
		gravity_settings = "arrows",
		impact_type = "raycast",
		trajectory_template_name = "throw_trajectory",
		projectile_units_template = "we_arrow"
	}
}
Projectiles.default = table.create_copy(Projectiles.normal_arrow, Projectiles.normal_arrow) or table.clone(Projectiles.normal_arrow)
Projectiles.normal_arrow = table.create_copy(Projectiles.normal_arrow, Projectiles.normal_arrow) or table.clone(Projectiles.default)
Projectiles.machinegun_arrow = {
	projectile_unit_template_name = "player_projectile_unit",
	static_impact_type = "raycast",
	impact_type = "sphere_sweep",
	radius = 0.05,
	trajectory_template_name = "throw_trajectory",
	gravity_settings = "arrows",
	projectile_units_template = "we_arrow"
}
Projectiles.machinegun_arrow = table.clone(Projectiles.machinegun_arrow) or table.clone(Projectiles.default)
Projectiles.carbine_arrow = {
	projectile_unit_template_name = "player_projectile_unit",
	static_impact_type = "raycast",
	gravity_settings = "arrows",
	impact_type = "sphere_sweep",
	trajectory_template_name = "throw_trajectory",
	radius = 0.075,
	projectile_units_template = "we_arrow"
}
Projectiles.carbine_arrow = table.clone(Projectiles.carbine_arrow) or table.clone(Projectiles.default)
Projectiles.sniper_arrow = {
	projectile_unit_template_name = "player_projectile_unit",
	static_impact_type = "raycast",
	gravity_settings = "sniper_arrows",
	impact_type = "sphere_sweep",
	trajectory_template_name = "throw_trajectory",
	radius = 0.05,
	projectile_units_template = "we_arrow"
}
Projectiles.sniper_arrow = table.clone(Projectiles.sniper_arrow) or table.clone(Projectiles.default)
Projectiles.machinegun_poison_arrow = {
	projectile_unit_template_name = "player_projectile_unit",
	radius = 0.1,
	impact_type = "sphere_sweep",
	gravity_settings = "arrows",
	trajectory_template_name = "throw_trajectory",
	projectile_units_template = "we_poison_arrow"
}
Projectiles.machinegun_poison_arrow = table.clone(Projectiles.machinegun_poison_arrow) or table.clone(Projectiles.default)
Projectiles.carbine_poison_arrow = {
	projectile_unit_template_name = "player_projectile_unit",
	radius = 0.1,
	impact_type = "sphere_sweep",
	gravity_settings = "arrows",
	trajectory_template_name = "throw_trajectory",
	projectile_units_template = "we_poison_arrow"
}
Projectiles.carbine_poison_arrow = table.clone(Projectiles.carbine_poison_arrow) or table.clone(Projectiles.default)
Projectiles.crossbow_bolt = {
	projectile_unit_template_name = "player_projectile_unit",
	static_impact_type = "raycast",
	gravity_settings = "bolts",
	impact_type = "sphere_sweep",
	trajectory_template_name = "throw_trajectory",
	radius = 0.05,
	projectile_units_template = "bolt"
}
Projectiles.crossbow_bolt = table.clone(Projectiles.crossbow_bolt) or table.clone(Projectiles.default)
Projectiles.repeating_crossbow_bolt = table.clone(Projectiles.crossbow_bolt) or table.clone(Projectiles.default)
Projectiles.brace_of_drake_pistols_shot = {
	projectile_unit_template_name = "player_projectile_unit",
	radius = 0.15,
	impact_type = "sphere_sweep",
	gravity_settings = "drakegun",
	trajectory_template_name = "throw_trajectory",
	projectile_units_template = "drake_pistol_shot"
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
	gravity_settings = "drakegun",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "fireball"
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
	forced_hitzone = "torso",
	gravity_settings = "drakegun",
	times_bigger = 4,
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "fireball_charged"
}
Projectiles.fireball_charged = table.clone(Projectiles.fireball_charged) or table.clone(Projectiles.default)
Projectiles.spark = {
	projectile_unit_template_name = "player_projectile_unit",
	radius = 0.075,
	impact_type = "sphere_sweep",
	gravity_settings = "spark",
	trajectory_template_name = "throw_trajectory",
	projectile_units_template = "spark"
}
Projectiles.spark = table.clone(Projectiles.spark) or table.clone(Projectiles.default)
Projectiles.spear = {
	projectile_unit_template_name = "player_projectile_unit",
	gravity_settings = "spark",
	impact_type = "sphere_sweep",
	radius_max = 0.1,
	trajectory_template_name = "throw_trajectory",
	radius_min = 0.1,
	projectile_units_template = "spear"
}
Projectiles.spear = table.clone(Projectiles.spear) or table.clone(Projectiles.default)
Projectiles.burning_head = {
	projectile_unit_template_name = "player_projectile_unit",
	gravity_settings = "spark",
	impact_type = "sphere_sweep",
	radius_max = 0.1,
	trajectory_template_name = "throw_trajectory",
	radius_min = 0.1,
	projectile_units_template = "burning_head"
}
Projectiles.burning_head = table.clone(Projectiles.burning_head) or table.clone(Projectiles.default)
Projectiles.kerillian_ability_true_flight = {
	projectile_unit_template_name = "player_projectile_unit",
	static_impact_type = "raycast",
	gravity_settings = "arrows",
	impact_type = "sphere_sweep",
	trajectory_template_name = "throw_trajectory",
	radius = 0.075,
	projectile_units_template = "we_trueflight_arrow"
}
Projectiles.kerillian_ability_true_flight = table.clone(Projectiles.kerillian_ability_true_flight) or table.clone(Projectiles.default)
Projectiles.kerillian_ability_true_flight_piercing = {
	projectile_unit_template_name = "player_projectile_unit",
	static_impact_type = "raycast",
	gravity_settings = "bounty_hunter_shot",
	impact_type = "sphere_sweep",
	trajectory_template_name = "throw_trajectory",
	radius = 0.1,
	projectile_units_template = "we_trueflight_arrow"
}
Projectiles.kerillian_ability_true_flight_piercing = table.clone(Projectiles.kerillian_ability_true_flight_piercing) or table.clone(Projectiles.default)
Projectiles.victor_bounty_hunter = {
	projectile_unit_template_name = "player_projectile_unit",
	static_impact_type = "raycast",
	gravity_settings = "bounty_hunter_shot",
	impact_type = "sphere_sweep",
	trajectory_template_name = "throw_trajectory",
	radius = 0.15,
	projectile_units_template = "bullet_temp"
}
Projectiles.victor_bounty_hunter = table.clone(Projectiles.victor_bounty_hunter) or table.clone(Projectiles.default)
Projectiles.pistol_shot = table.clone(Projectiles.victor_bounty_hunter) or table.clone(Projectiles.default)
Projectiles.pistol_shot.radius = 0.05
Projectiles.grenade = {
	impact_type = "sphere_sweep",
	radius = 0.1,
	show_warning_icon = true,
	life_time = 3,
	trajectory_template_name = "throw_trajectory",
	pickup_name = "grenade",
	rotation_speed = 10,
	gravity_settings = "drakegun",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "grenade"
}
Projectiles.grenade_fire = {
	impact_type = "sphere_sweep",
	radius = 0.1,
	show_warning_icon = true,
	life_time = 3,
	trajectory_template_name = "throw_trajectory",
	pickup_name = "grenade",
	rotation_speed = 10,
	gravity_settings = "drakegun",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "grenade_fire"
}

for _, dlc in pairs(DLCSettings) do
	local projectiles = dlc.projectiles

	if projectiles then
		for name, data in pairs(projectiles) do
			Projectiles[name] = table.clone(data)
		end
	end
end

for name, data in pairs(Projectiles) do
	data.name = name
end

return
