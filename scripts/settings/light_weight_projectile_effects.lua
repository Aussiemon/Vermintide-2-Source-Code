local function INVENTORY_UNIT(owner_unit)
	local breed = Unit.get_data(owner_unit, "breed")
	local inventory_template = breed.default_inventory_template
	local inventory_extension = ScriptUnit.extension(owner_unit, "ai_inventory_system")
	local inventory_unit = inventory_extension:get_unit(inventory_template)

	return inventory_unit
end

local function INVENTORY_UNIT_VS(owner_unit)
	local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	local inventory_unit = inventory_extension:get_weapon_unit()

	return inventory_unit
end

local function IS_HUSK_UNIT(owner_unit)
	local is_network_unit = NetworkUnit.is_network_unit(owner_unit)
	local is_husk = is_network_unit and NetworkUnit.is_husk_unit(owner_unit)

	return is_husk
end

local function IS_UNIT_1P(owner_unit)
	return not IS_HUSK_UNIT(owner_unit)
end

local function IS_UNIT_3P(owner_unit)
	return IS_HUSK_UNIT(owner_unit)
end

LightWeightProjectileEffects = {
	ratling_gun_bullet = {
		vfx = {
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
		sfx = {
			{
				looping_sound_event_name = "Play_weapon_warpbullet_flyby_proximity",
				looping_sound_stop_event_name = "Stop_weapon_warpbullet_flyby_proximity"
			}
		}
	},
	ratling_gun_bullet_vs = {
		vfx = {
			{
				particle_name = "fx/wpnfx_skaven_ratlinggun_bullet_trail_vs",
				kill_policy = "stop",
				condition_function = IS_UNIT_1P
			},
			{
				particle_name = "fx/wpnfx_skaven_ratlinggun_muzzlefx_vs",
				link = "p_fx",
				unit_function = INVENTORY_UNIT_VS,
				condition_function = IS_UNIT_1P
			},
			{
				particle_name = "fx/wpnfx_skaven_ratlinggun_bullet",
				kill_policy = "destroy",
				condition_function = IS_UNIT_3P
			},
			{
				particle_name = "fx/wpnfx_skaven_ratlinggun_bullet_trail",
				kill_policy = "stop",
				condition_function = IS_UNIT_3P
			},
			{
				particle_name = "fx/wpnfx_skaven_ratlinggun_muzzlefx",
				link = "p_fx",
				unit_function = INVENTORY_UNIT_VS,
				condition_function = IS_UNIT_3P
			}
		},
		sfx = {
			{
				looping_sound_event_name = "Play_weapon_warpbullet_flyby_proximity",
				looping_sound_stop_event_name = "Stop_weapon_warpbullet_flyby_proximity"
			}
		}
	},
	autocannon_backdrop_bullet = {
		vfx = {
			{
				particle_name = "fx/wpnfx_skaven_autocannon_bullet",
				kill_policy = "destroy"
			},
			{
				particle_name = "fx/wpnfx_skaven_autocannon_bullet_trail",
				kill_policy = "stop"
			}
		},
		sfx = {
			{
				looping_sound_event_name = "Play_weapon_warpbullet_flyby_proximity",
				looping_sound_stop_event_name = "Stop_weapon_warpbullet_flyby_proximity"
			}
		}
	},
	stormfiend_gun_bullet = {
		vfx = {
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
		},
		sfx = {
			{
				looping_sound_event_name = "Play_weapon_warpbullet_flyby_proximity",
				looping_sound_stop_event_name = "Stop_weapon_warpbullet_flyby_proximity"
			}
		}
	}
}

DLCUtils.merge("light_weight_projectile_effects", LightWeightProjectileEffects)
