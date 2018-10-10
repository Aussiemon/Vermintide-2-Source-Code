TimedExplosionExtension = class(TimedExplosionExtension)

TimedExplosionExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self._area_damage_system = extension_init_context.entity_manager:system("area_damage_system")
	self._explosion_template_name = extension_init_data.explosion_template_name
	local explosion_template = ExplosionTemplates[extension_init_data.explosion_template_name]
	self._time_to_explode = explosion_template.time_to_explode
	self._state = "waiting_to_explode"
	self._deletion_timer = 1
end

TimedExplosionExtension.update = function (self, unit, input, dt, context, t)
	local state = self._state

	if state == "waiting_to_explode" then
		self._time_to_explode = math.max(self._time_to_explode - dt, 0)

		if self._time_to_explode == 0 then
			self:_explode()

			self._state = "exploded"
		end
	elseif state == "exploded" then
		self._deletion_timer = math.max(self._deletion_timer - dt, 0)

		if self._deletion_timer == 0 then
			Managers.state.unit_spawner:mark_for_deletion(unit)

			self._state = "waiting_for_deletion"
		end
	elseif state == "waiting_for_deletion" then
	else
		ferror("Unknown state (%s)", state)
	end
end

TimedExplosionExtension._explode = function (self)
	local explosion_template = ExplosionTemplates[self._explosion_template_name]
	local attacker_unit = self._unit
	local position = Unit.world_position(attacker_unit, 0)
	local rotation = Unit.world_rotation(attacker_unit, 0)
	local explosion_template_name = self._explosion_template_name
	local scale = 1
	local damage_source = explosion_template.damage_source or "undefined"
	local attacker_power_level = explosion_template.attacker_power_level or 0

	self._area_damage_system:create_explosion(attacker_unit, position, rotation, explosion_template_name, scale, damage_source, attacker_power_level, false)
end

return
