ProjectileRaycastImpactUnitExtension = class(ProjectileRaycastImpactUnitExtension, ProjectileBaseImpactUnitExtension)
local INDEX_POSITION = 1
local INDEX_DISTANCE = 2
local INDEX_NORMAL = 3
local INDEX_ACTOR = 4

ProjectileRaycastImpactUnitExtension.init = function (self, extension_init_context, unit, extension_init_data)
	ProjectileRaycastImpactUnitExtension.super.init(self, extension_init_context, unit, extension_init_data)

	self.collision_filter = extension_init_data.collision_filter or "filter_player_ray_projectile"
	self.network_manager = Managers.state.network
	self.is_server = Managers.player.is_server
	self.owner_unit = extension_init_data.owner_unit
	local owner_player = Managers.player:owner(self.owner_unit)
	self.owner_is_local = owner_player and owner_player.local_player or owner_player and owner_player.bot_player or false
	self.server_side_raycast = extension_init_data.server_side_raycast
	self.is_server = Managers.player.is_server
	self._dont_target_friendly = extension_init_data.dont_target_friendly
	self._ignore_dead = extension_init_data.ignore_dead
	self.last_position = nil
end

ProjectileRaycastImpactUnitExtension.extensions_ready = function (self, world, unit)
	self.locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
end

ProjectileRaycastImpactUnitExtension.update = function (self, unit, input, dt, context, t)
	ProjectileRaycastImpactUnitExtension.super.update(self, unit, input, dt, context, t)

	if self.server_side_raycast and not self.is_server then
		return
	end

	if not self.server_side_raycast and not self.owner_is_local then
		return
	end

	local locomotion_extension = self.locomotion_extension

	if not locomotion_extension:moved_this_frame() then
		return
	end

	local physics_world = self.physics_world
	local collision_filter = self.collision_filter
	local previous_position = POSITION_LOOKUP[unit]
	local current_position = Unit.local_position(unit, 0)

	if self.last_position then
		self:_do_raycast(unit, self.last_position:unbox(), current_position, physics_world, collision_filter, t, dt)
	else
		self.last_position = Vector3Box()
	end

	self.last_position:store(previous_position)
	self:_do_raycast(unit, previous_position, current_position, physics_world, collision_filter, t, dt)
end

ProjectileRaycastImpactUnitExtension._do_raycast = function (self, unit, from, to, physics_world, collision_filter, t, dt)
	local direction, length = Vector3.direction_length(to - from)

	if length < math.epsilon then
		length = math.epsilon
	end

	if script_data.debug_projectiles then
		QuickDrawerStay:vector(from, direction, Color(255, 255, 255, 0))
	end

	PhysicsWorld.prepare_actors_for_raycast(physics_world, from, direction, 0.1, 9, length * length)

	local result = PhysicsWorld.immediate_raycast(physics_world, from, direction, length, "all", "collision_filter", collision_filter)

	if not result then
		return
	end

	local num_hits = #result

	for i = 1, num_hits do
		local hit = result[i]
		local hit_actor = hit[INDEX_ACTOR]
		local hit_unit = Actor.unit(hit_actor)
		local valid = self:_valid_target(unit, hit_unit, hit_actor)

		if valid then
			local num_actors = Unit.num_actors(hit_unit)
			local actor_index = nil

			for j = 0, num_actors - 1 do
				local actor = Unit.actor(hit_unit, j)

				if hit_actor == actor then
					actor_index = j

					break
				end
			end

			local hit_position = hit[INDEX_POSITION]
			local hit_distance = hit[INDEX_DISTANCE]
			local hit_normal = hit[INDEX_NORMAL]

			self:impact(hit_unit, hit_position, direction, hit_normal, actor_index)
		end
	end
end

ProjectileRaycastImpactUnitExtension._valid_target = function (self, unit, hit_unit, hit_actor)
	if hit_unit == unit or hit_unit == self.owner_unit then
		return false
	end

	if Unit.actor(hit_unit, "c_afro") == hit_actor then
		return false
	end

	if self._dont_target_friendly then
		local side_manager = Managers.state.side
		local has_side = side_manager.side_by_unit[hit_unit]

		if has_side and not side_manager:is_enemy(self.owner_unit, hit_unit) then
			return false
		end
	end

	if self._ignore_dead and ScriptUnit.has_extension(hit_unit, "health_system") and not HEALTH_ALIVE[hit_unit] then
		return false
	end

	return true
end
