-- chunkname: @scripts/settings/equipment/projectiles.lua

require("scripts/settings/equipment/projectile_units")
require("scripts/settings/explosion_templates")

ProjectileGravitySettings = {
	arrows = -9.82,
	bolts = -5,
	bounty_hunter_shot = -0.01,
	default = -9.82,
	drake_pistols = 0,
	drakegun = -9.82,
	fireball = -9.82,
	gaze_fireball = -0.01,
	sniper_arrows = -12.82,
	spark = -0.5,
	staff = -9.82,
}

DLCUtils.merge("projectile_gravity_settings", ProjectileGravitySettings)

Projectiles = {}
Projectiles.normal_arrow = {
	gravity_settings = "arrows",
	impact_type = "raycast",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "we_arrow",
	trajectory_template_name = "throw_trajectory",
}
Projectiles.default = table.create_copy(Projectiles.normal_arrow, Projectiles.normal_arrow) or table.clone(Projectiles.normal_arrow)
Projectiles.normal_arrow = table.create_copy(Projectiles.normal_arrow, Projectiles.normal_arrow) or table.clone(Projectiles.default)
Projectiles.machinegun_arrow = {
	gravity_settings = "arrows",
	impact_type = "sphere_sweep",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "we_arrow",
	radius = 0.05,
	static_impact_type = "raycast",
	trajectory_template_name = "throw_trajectory",
}
Projectiles.machinegun_arrow = table.clone(Projectiles.machinegun_arrow) or table.clone(Projectiles.default)
Projectiles.carbine_arrow = {
	gravity_settings = "arrows",
	impact_type = "sphere_sweep",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "we_arrow",
	radius = 0.075,
	static_impact_type = "raycast",
	trajectory_template_name = "throw_trajectory",
}
Projectiles.carbine_arrow = table.clone(Projectiles.carbine_arrow) or table.clone(Projectiles.default)
Projectiles.sniper_arrow = {
	gravity_settings = "sniper_arrows",
	impact_type = "sphere_sweep",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "we_arrow",
	radius = 0.05,
	static_impact_type = "raycast",
	trajectory_template_name = "throw_trajectory",
}
Projectiles.sniper_arrow = table.clone(Projectiles.sniper_arrow) or table.clone(Projectiles.default)
Projectiles.machinegun_poison_arrow = {
	gravity_settings = "arrows",
	impact_type = "sphere_sweep",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "we_poison_arrow",
	radius = 0.1,
	trajectory_template_name = "throw_trajectory",
}
Projectiles.machinegun_poison_arrow = table.clone(Projectiles.machinegun_poison_arrow) or table.clone(Projectiles.default)
Projectiles.carbine_poison_arrow = {
	gravity_settings = "arrows",
	impact_type = "sphere_sweep",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "we_poison_arrow",
	radius = 0.1,
	trajectory_template_name = "throw_trajectory",
}
Projectiles.carbine_poison_arrow = table.clone(Projectiles.carbine_poison_arrow) or table.clone(Projectiles.default)
Projectiles.crossbow_bolt = {
	gravity_settings = "bolts",
	impact_type = "sphere_sweep",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "bolt",
	radius = 0.05,
	static_impact_type = "raycast",
	trajectory_template_name = "throw_trajectory",
}
Projectiles.crossbow_bolt = table.clone(Projectiles.crossbow_bolt) or table.clone(Projectiles.default)
Projectiles.repeating_crossbow_bolt = table.clone(Projectiles.crossbow_bolt) or table.clone(Projectiles.default)
Projectiles.brace_of_drake_pistols_shot = {
	gravity_settings = "drakegun",
	impact_type = "sphere_sweep",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "drake_pistol_shot",
	radius = 0.15,
	trajectory_template_name = "throw_trajectory",
}
Projectiles.brace_of_drake_pistols_shot = table.clone(Projectiles.brace_of_drake_pistols_shot) or table.clone(Projectiles.default)
Projectiles.fireball = {
	fire_from_muzzle = false,
	gaze_override_gravity_settings = "gaze_fireball",
	gravity_settings = "drakegun",
	impact_type = "sphere_sweep",
	muzzle_name = "fx_01",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "fireball",
	radius = 0.15,
	static_impact_type = "raycast",
	trajectory_template_name = "throw_trajectory",
}
Projectiles.fireball = table.clone(Projectiles.fireball) or table.clone(Projectiles.default)
Projectiles.fireball_charged = {
	fire_from_muzzle = false,
	forced_hitzone = "torso",
	gravity_settings = "drakegun",
	impact_type = "sphere_sweep",
	muzzle_name = "fx_01",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "fireball_charged",
	radius_max = 0.75,
	radius_min = 0.2,
	static_impact_type = "sphere_sweep",
	times_bigger = 4,
	trajectory_template_name = "throw_trajectory",
}
Projectiles.fireball_charged = table.clone(Projectiles.fireball_charged) or table.clone(Projectiles.default)
Projectiles.spark = {
	gravity_settings = "spark",
	impact_type = "sphere_sweep",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "spark",
	radius = 0.075,
	trajectory_template_name = "throw_trajectory",
}
Projectiles.spark = table.clone(Projectiles.spark) or table.clone(Projectiles.default)
Projectiles.spear = {
	gravity_settings = "spark",
	impact_type = "sphere_sweep",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "spear",
	radius_max = 0.1,
	radius_min = 0.1,
	trajectory_template_name = "throw_trajectory",
}
Projectiles.spear = table.clone(Projectiles.spear) or table.clone(Projectiles.default)
Projectiles.burning_head = {
	gravity_settings = "spark",
	impact_type = "sphere_sweep",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "burning_head",
	radius_max = 0.1,
	radius_min = 0.1,
	trajectory_template_name = "throw_trajectory",
}
Projectiles.burning_head = table.clone(Projectiles.burning_head) or table.clone(Projectiles.default)
Projectiles.kerillian_ability_true_flight = {
	gravity_settings = "arrows",
	impact_type = "sphere_sweep",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "we_trueflight_arrow",
	radius = 0.075,
	static_impact_type = "raycast",
	trajectory_template_name = "throw_trajectory",
}
Projectiles.kerillian_ability_true_flight = table.clone(Projectiles.kerillian_ability_true_flight) or table.clone(Projectiles.default)
Projectiles.kerillian_ability_true_flight_piercing = {
	gravity_settings = "bounty_hunter_shot",
	impact_type = "sphere_sweep",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "we_trueflight_arrow",
	radius = 0.1,
	static_impact_type = "raycast",
	trajectory_template_name = "throw_trajectory",
}
Projectiles.kerillian_ability_true_flight_piercing = table.clone(Projectiles.kerillian_ability_true_flight_piercing) or table.clone(Projectiles.default)
Projectiles.victor_bounty_hunter = {
	gravity_settings = "bounty_hunter_shot",
	impact_type = "sphere_sweep",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "bullet_temp",
	radius = 0.05,
	static_impact_type = "raycast",
	trajectory_template_name = "throw_trajectory",
}
Projectiles.victor_bounty_hunter = table.clone(Projectiles.victor_bounty_hunter) or table.clone(Projectiles.default)
Projectiles.necromancer_trapped_soul = {
	gravity_settings = "drake_pistols",
	impact_type = "sphere_sweep",
	projectile_unit_template_name = "ai_true_flight_projectile_unit",
	projectile_units_template = "necromancer_trapped_soul",
	radius = 0.05,
	static_impact_type = "raycast",
	trajectory_template_name = "throw_trajectory",
}
Projectiles.bw_necromancy_staff = {
	fire_from_muzzle = false,
	friendly_fire_grace_period = 0.05,
	gaze_override_gravity_settings = "gaze_fireball",
	gravity_settings = "bounty_hunter_shot",
	impact_type = "sphere_sweep",
	muzzle_name = "fx_01",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "necromancer_curse_spirit",
	radius = 0.15,
	static_impact_type = "raycast",
	trajectory_template_name = "throw_trajectory",
}
Projectiles.pistol_shot = table.clone(Projectiles.victor_bounty_hunter) or table.clone(Projectiles.default)
Projectiles.pistol_shot.radius = 0.05
Projectiles.grenade = {
	gravity_settings = "drakegun",
	impact_type = "sphere_sweep",
	life_time = 3,
	pickup_name = "grenade",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "grenade",
	radius = 0.1,
	rotation_speed = 10,
	show_warning_icon = true,
	trajectory_template_name = "throw_trajectory",
}
Projectiles.grenade_fire = {
	gravity_settings = "drakegun",
	impact_type = "sphere_sweep",
	life_time = 3,
	pickup_name = "grenade",
	projectile_unit_template_name = "player_projectile_unit",
	projectile_units_template = "grenade_fire",
	radius = 0.1,
	rotation_speed = 10,
	show_warning_icon = true,
	trajectory_template_name = "throw_trajectory",
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
