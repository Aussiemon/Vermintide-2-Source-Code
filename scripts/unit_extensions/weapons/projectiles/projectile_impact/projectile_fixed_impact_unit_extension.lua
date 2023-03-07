ProjectileFixedImpactUnitExtension = class(ProjectileFixedImpactUnitExtension, ProjectileBaseImpactUnitExtension)

ProjectileFixedImpactUnitExtension.init = function (self, extension_init_context, unit, extension_init_data)
	ProjectileFixedImpactUnitExtension.super.init(self, extension_init_context, unit, extension_init_data)

	self.is_server = Managers.player.is_server
	self.owner_unit = extension_init_data.owner_unit
	local owner_player = Managers.player:owner(self.owner_unit)
	self.owner_is_local = owner_player and owner_player.local_player or owner_player and owner_player.bot_player or false
	self.last_position = nil
	self.impact_data = extension_init_data.impact_data
	self._time_to_impact = self.impact_data.time
end

ProjectileFixedImpactUnitExtension.extensions_ready = function (self, world, unit)
	self.locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
end

ProjectileFixedImpactUnitExtension.update = function (self, unit, input, dt, context, t)
	ProjectileFixedImpactUnitExtension.super.update(self, unit, input, dt, context, t)

	if not self.is_server then
		return
	end

	if not self.has_hit and self._time_to_impact <= 0 then
		self.has_hit = true
		local impact_data = self.impact_data
		local hit_unit = impact_data.hit_unit
		local hit_position = impact_data.position:unbox()
		local direction = impact_data.direction:unbox()
		local hit_normal = impact_data.hit_normal:unbox()
		local actor_index = impact_data.actor_index

		self:impact(hit_unit, hit_position, direction, hit_normal, actor_index)
	end

	self._time_to_impact = self._time_to_impact - dt
end
