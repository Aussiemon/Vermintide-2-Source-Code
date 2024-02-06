﻿-- chunkname: @scripts/managers/blood/blood_settings.lua

BloodSettingsDefault = BloodSettingsDefault or {
	weapon_blood = {
		default = 0.05,
		dissolve_rate = 0.01,
		enabled = true,
		max_value = 0.6,
		starting_value = 0.05,
	},
	blood_decals = {
		distance_despawn = 10,
		enabled = true,
		life_time = 60,
		num_decals = 100,
		scale = 2.5,
	},
	enemy_blood = {
		enabled = true,
	},
	blood_ball = {
		damage_type_velocities = {
			arrow = "15",
			arrow_carbine = "15",
			arrow_machinegun = "15",
			arrow_poison = "15",
			arrow_sniper = "15",
			bolt_carbine = "15",
			bolt_machinegun = "15",
			bolt_sniper = "15",
			burn_carbine = "15",
			burn_machinegun = "15",
			burn_shotgun = "15",
			burn_sniper = "15",
			default = "5",
			drakegun = "15",
			drakegun_glance = "15",
			drakegun_shot = "15",
			projectile = "15",
			shot_carbine = "15",
			shot_machinegun = "15",
			shot_repeating_handgun = "15",
			shot_shotgun = "15",
			shot_sniper = "15",
		},
	},
	screen_space = {
		enabled = true,
	},
	hit_effects = {
		enabled = true,
		first_person_per_race = {
			beastmen = "fx/impact_blood_beastman",
			chaos = "fx/impact_blood_chaos",
			default = "fx/impact_blood",
			skaven = "fx/impact_blood",
			undead = false,
		},
	},
	dismemberment = {
		enabled = true,
	},
	ragdoll_push = {
		enabled = true,
	},
}
BloodSettings = BloodSettings or table.clone(BloodSettingsDefault)

if IS_WINDOWS then
	local num_decals = Application.user_setting("num_blood_decal") or BloodSettings.blood_decals.num_decals

	BloodSettings.blood_decals.num_decals = num_decals
end

BloodSettings.get_hit_effect_for_race = function (self, race)
	if self.hit_effects.enabled then
		local race_blood = self.hit_effects.first_person_per_race[race]

		return race_blood or race_blood == nil and self.hit_effects.first_person_per_race.default
	end

	return nil
end
