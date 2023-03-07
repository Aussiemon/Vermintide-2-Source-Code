require("foundation/scripts/util/api_verification")
require("scripts/managers/blood/blood_manager")

BloodManagerDummy = class(BloodManagerDummy)

BloodManagerDummy.init = function (self, world)
	return
end

BloodManagerDummy.update = function (self, dt, t)
	return
end

BloodManagerDummy.get_blood_enabled = function (self)
	return
end

BloodManagerDummy.despawn_blood_ball = function (self, unit)
	return
end

BloodManagerDummy.clear_blood_decals = function (self)
	return
end

BloodManagerDummy.clear_unit_decals = function (self, unit)
	return
end

BloodManagerDummy.clear_weapon_blood = function (self, attacker, weapon)
	return
end

BloodManagerDummy.add_blood_ball = function (self, position, direction, damage_type, hit_unit)
	return
end

BloodManagerDummy.add_weapon_blood = function (self, attacker, damage_type)
	return
end

BloodManagerDummy.add_enemy_blood = function (self, position, normal, actor)
	return
end

BloodManagerDummy.play_screen_space_blood = function (self, particle_name, position, optional_offset, option_rotation_offset, optional_scale)
	return
end

BloodManagerDummy.destroy = function (self)
	return
end

BloodManagerDummy.update_blood_enabled = function (self, blood_enabled)
	return
end

BloodManagerDummy.update_num_blood_decals = function (self, num_blood_decals)
	return
end

BloodManagerDummy.update_screen_blood_enabled = function (self, screen_blood_enabled)
	return
end

BloodManagerDummy.update_dismemberment_enabled = function (self, dismemberment_enabled)
	return
end

BloodManagerDummy.update_ragdoll_enabled = function (self, ragdoll_enabled)
	return
end

ApiVerification.ensure_public_api(BloodManager, BloodManagerDummy)
