local function INVENTORY_UNIT(owner_unit)
	local breed = Unit.get_data(owner_unit, "breed")
	local inventory_template = breed.default_inventory_template
	local inventory_extension = ScriptUnit.extension(owner_unit, "ai_inventory_system")
	local inventory_unit = inventory_extension:get_unit(inventory_template)

	return inventory_unit
end

LightWeightProjectileParticleEffects = {
	ratling_gun_bullet = {
		{
			particle_name = "fx/wpnfx_skaven_ratlinggun_bullet",
			kill_policy = "destroy"
		},
		{
			particle_name = "fx/wpnfx_skaven_ratlinggun_bullet_trail",
			kill_policy = "stop"
		},
		{
			particle_name = "fx/wpnfx_skaven_ratlinggun_muzzlefx",
			link = "p_fx",
			unit_function = INVENTORY_UNIT
		}
	},
	stormfiend_gun_bullet = {
		{
			particle_name = "fx/wpnfx_skaven_ratlinggun_bullet",
			kill_policy = "destroy"
		},
		{
			particle_name = "fx/wpnfx_skaven_ratlinggun_bullet_trail",
			kill_policy = "stop"
		},
		{
			particle_name = "fx/wpnfx_skaven_ratlinggun_muzzlefx"
		}
	}
}

return
