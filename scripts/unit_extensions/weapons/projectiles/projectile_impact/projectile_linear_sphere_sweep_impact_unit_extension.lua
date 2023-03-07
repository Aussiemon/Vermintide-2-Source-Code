local CHECK_DELTA = 0.01
ProjectileLinearSphereSweepImpactUnitExtension = class(ProjectileLinearSphereSweepImpactUnitExtension, ProjectileBaseImpactUnitExtension)

ProjectileLinearSphereSweepImpactUnitExtension.init = function (self, extension_init_context, unit, extension_init_data)
	ProjectileLinearSphereSweepImpactUnitExtension.super.init(self, extension_init_context, unit, extension_init_data)

	self.collision_filter = extension_init_data.collision_filter or "filter_player_ray_projectile"
	self.sphere_radius = extension_init_data.sphere_radius
	self.only_one_impact = extension_init_data.only_one_impact
	self.owner_unit = extension_init_data.owner_unit
	self._next_check_t = 0
	local current_position = Unit.local_position(unit, 0)
	self._last_position = Vector3Box(current_position)
end

ProjectileLinearSphereSweepImpactUnitExtension.extensions_ready = function (self, world, unit)
	self.locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
end

ProjectileLinearSphereSweepImpactUnitExtension.update = function (self, unit, input, dt, context, t)
	ProjectileLinearSphereSweepImpactUnitExtension.super.update(self, unit, input, dt, context, t)

	local locomotion_extension = self.locomotion_extension

	if not locomotion_extension:moved_this_frame() then
		return
	end

	if self._next_check_t < t then
		local physics_world = self.physics_world
		local collision_filter = self.collision_filter
		local radius = self.sphere_radius
		local last_position = self._last_position:unbox()
		local current_position = Unit.local_position(unit, 0)
		local only_one_impact = self.only_one_impact
		local direction = last_position - current_position
		local length = Vector3.length(direction)
		direction = Vector3.normalize(direction)
		local halfway_position = last_position + direction * length * 0.5
		local radius_for_preparation = length

		PhysicsWorld.prepare_actors_for_overlap(physics_world, halfway_position, radius_for_preparation)

		local result = PhysicsWorld.linear_sphere_sweep(physics_world, last_position, current_position, radius, 100, "collision_filter", collision_filter, "report_initial_overlap")

		if result then
			local num_hits = #result

			for i = 1, num_hits do
				local hit = result[i]
				local hit_position = hit.position
				local hit_normal = hit.normal
				local hit_actor = hit.actor
				local hit_unit = Actor.unit(hit_actor)

				if hit_unit ~= unit and not Unit.is_frozen(hit_unit) and hit_actor ~= Unit.actor(hit_unit, "c_afro") then
					local hit_self = hit_unit == unit

					if not hit_self then
						local num_actors = Unit.num_actors(hit_unit)
						local actor_index = nil

						for j = 0, num_actors - 1 do
							local actor = Unit.actor(hit_unit, j)

							if hit_actor == actor then
								actor_index = j

								break
							end
						end

						fassert(actor_index, "No actor index found for unit [\"%s\"] that was hit on actor [\"%s\"]", hit_unit, hit_actor)
						self:impact(hit_unit, hit_position, direction, hit_normal, actor_index)

						if only_one_impact then
							break
						end
					end
				end
			end
		end

		self._last_position:store(current_position)

		self._next_check_t = t + CHECK_DELTA
	end
end
