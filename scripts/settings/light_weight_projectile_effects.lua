local function INVENTORY_UNIT(owner_unit)
	local breed = Unit.get_data(owner_unit, "breed")
	local inventory_template = breed.default_inventory_template
	local inventory_extension = ScriptUnit.extension(owner_unit, "ai_inventory_system")
	local inventory_unit = inventory_extension:get_unit(inventory_template)

	return inventory_unit
end

LightWeightProjectileEffects = {
	ratling_gun_bullet = {
		{
			vfx = {
				particle_name = "fx/wpnfx_skaven_ratlinggun_bullet",
				kill_policy = "destroy"
			}
		},
		{
			vfx = {
				particle_name = "fx/wpnfx_skaven_ratlinggun_bullet_trail",
				kill_policy = "stop"
			},
			sfx = {
				looping_sound_event_name = "Play_weapon_warpbullet_flyby_proximity",
				looping_sound_stop_event_name = "Stop_weapon_warpbullet_flyby_proximity"
			}
		},
		{
			vfx = {
				particle_name = "fx/wpnfx_skaven_ratlinggun_muzzlefx",
				link = "p_fx",
				unit_function = INVENTORY_UNIT
			}
		}
	},
	autocannon_backdrop_bullet = {
		{
			vfx = {
				particle_name = "fx/wpnfx_skaven_autocannon_bullet",
				kill_policy = "destroy"
			}
		},
		{
			vfx = {
				particle_name = "fx/wpnfx_skaven_autocannon_bullet_trail",
				kill_policy = "stop"
			},
			sfx = {
				looping_sound_event_name = "Play_weapon_warpbullet_flyby_proximity",
				looping_sound_stop_event_name = "Stop_weapon_warpbullet_flyby_proximity"
			}
		}
	},
	stormfiend_gun_bullet = {
		{
			vfx = {
				particle_name = "fx/wpnfx_skaven_ratlinggun_bullet",
				kill_policy = "destroy"
			}
		},
		{
			vfx = {
				particle_name = "fx/wpnfx_skaven_ratlinggun_bullet_trail",
				kill_policy = "stop"
			},
			sfx = {
				looping_sound_event_name = "Play_weapon_warpbullet_flyby_proximity",
				looping_sound_stop_event_name = "Stop_weapon_warpbullet_flyby_proximity"
			}
		},
		{
			vfx = {
				particle_name = "fx/wpnfx_skaven_ratlinggun_muzzlefx"
			}
		}
	}
}

for _, dlc in pairs(DLCSettings) do
	local effect_settings = dlc.light_weight_projectile_effects

	if effect_settings then
		for name, settings in pairs(effect_settings) do
			LightWeightProjectileEffects[name] = settings
		end
	end
end

return
