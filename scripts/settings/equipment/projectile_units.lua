ProjectileUnits = ProjectileUnits or {}
ProjectileUnits.we_arrow = {
	dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1_3p",
	projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1_3ps",
	dummy_linker_broken_units = {
		"units/weapons/player/wpn_we_quiver_t1/wpn_we_broken_arrow_01_3ps",
		"units/weapons/player/wpn_we_quiver_t1/wpn_we_broken_arrow_02_3ps",
		"units/weapons/player/wpn_we_quiver_t1/wpn_we_broken_arrow_03_3ps"
	}
}
ProjectileUnits.we_poison_arrow = {
	dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_poison_arrow_t1_3p",
	projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_poison_arrow_t1_3ps"
}
ProjectileUnits.we_trueflight_arrow = {
	dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_homing_arrow_t1_3p",
	projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_homing_arrow_t1_3ps"
}
ProjectileUnits.bolt = {
	dummy_linker_unit_name = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3p",
	projectile_unit_name = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3ps"
}
ProjectileUnits.drake_pistol_shot = {
	projectile_unit_name = "units/weapons/player/drake_pistol_projectile/drake_pistol_projectile_3ps"
}
ProjectileUnits.fireball = {
	projectile_unit_name = "units/weapons/player/fireball_projectile/fireball_projectile_3ps"
}
ProjectileUnits.fireball_charged = {
	projectile_unit_name = "units/weapons/player/fireball_projectile/charged_fireball_projectile_3ps"
}
ProjectileUnits.spark = {
	projectile_unit_name = "units/weapons/player/spear_projectile/spark_3ps"
}
ProjectileUnits.spear = {
	projectile_unit_name = "units/weapons/player/spear_projectile/spear_3ps"
}
ProjectileUnits.burning_head = {
	projectile_unit_name = "units/weapons/player/wpn_burning_head/wpn_burning_head_3ps"
}
ProjectileUnits.bullet_temp = {
	projectile_unit_name = "units/weapons/player/wpn_bullet_temp/wpn_bullet_temp_3ps"
}
ProjectileUnits.grenade = {
	projectile_unit_name = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_01_t1_3p"
}
ProjectileUnits.grenade_fire = {
	projectile_unit_name = "units/weapons/player/wpn_emp_grenade_03_t1/wpn_emp_grenade_03_t1_3p"
}

for _, dlc in pairs(DLCSettings) do
	local projectile_units = dlc.projectile_units

	if projectile_units then
		for name, data in pairs(projectile_units) do
			ProjectileUnits[name] = table.clone(data)
		end
	end
end

return
