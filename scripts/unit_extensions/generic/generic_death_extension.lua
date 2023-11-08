require("scripts/unit_extensions/generic/death_reactions")

GenericDeathExtension = class(GenericDeathExtension)

GenericDeathExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.network_type = extension_init_data.is_husk
	local is_husk = extension_init_data.is_husk or not Managers.player.is_server
	self.is_husk = is_husk
	self.network_type = is_husk and "husk" or "unit"
	self.is_alive = true
	self.unit = unit
	self.extension_init_data = extension_init_data
	self.wall_nail_data = {}
	self.second_hit_ragdoll = not extension_init_data.disable_second_hit_ragdoll
end

GenericDeathExtension.freeze = function (self)
	self.play_effect = nil
	self.despawn_after_time = nil
end

GenericDeathExtension.override_death_behavior = function (self, despawn_after_time, play_effect)
	self.despawn_after_time = despawn_after_time
	self.play_effect = play_effect
end

GenericDeathExtension.force_end = function (self)
	if not self.death_is_done and Unit.alive(self.unit) and not self.is_alive then
		Managers.state.unit_spawner:mark_for_deletion(self.unit)

		self.death_is_done = true
	end
end

GenericDeathExtension.is_wall_nailed = function (self)
	return next(self.wall_nail_data) and true or false
end

GenericDeathExtension.nailing_hit = function (self, hit_ragdoll_actor, attack_direction, hit_speed)
	fassert(Vector3.is_valid(attack_direction), "Attack direction is not valid.")

	local data = self.wall_nail_data
	data[hit_ragdoll_actor] = data[hit_ragdoll_actor] or {
		attack_direction = Vector3Box(attack_direction),
		hit_speed = hit_speed
	}
end

GenericDeathExtension.enable_second_hit_ragdoll = function (self)
	self.second_hit_ragdoll = true
end

GenericDeathExtension.second_hit_ragdoll_allowed = function (self)
	return self.second_hit_ragdoll
end

GenericDeathExtension.has_death_started = function (self)
	return self.death_has_started
end
