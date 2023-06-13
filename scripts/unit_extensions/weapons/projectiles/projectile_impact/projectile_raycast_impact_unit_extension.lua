ProjectileRaycastImpactUnitExtension = class(ProjectileRaycastImpactUnitExtension, ProjectileBaseImpactUnitExtension)

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

local INDEX_POSITION = 1
local INDEX_DISTANCE = 2
local INDEX_NORMAL = 3
local INDEX_ACTOR = 4

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
		self:_do_raycast(unit, self.last_position:unbox(), current_position, physics_world, collision_filter)
	else
		self.last_position = Vector3Box()
	end

	self.last_position:store(previous_position)

	if not self.has_hit then
		self:_do_raycast(unit, previous_position, current_position, physics_world, collision_filter)
	end
end

ProjectileRaycastImpactUnitExtension._do_raycast = function (self, unit, from, to, physics_world, collision_filter)
	local direction = to - from
	local length = Vector3.length(direction)
	direction = Vector3.normalize(direction)

	if length < 0.001 then
		length = 0.001
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
		local hit_position = hit[INDEX_POSITION]
		local hit_distance = hit[INDEX_DISTANCE]
		local hit_normal = hit[INDEX_NORMAL]
		local hit_actor = hit[INDEX_ACTOR]
		local hit_unit = Actor.unit(hit_actor)
		local valid = self:_valid_target(unit, hit_unit)

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

			assert(actor_index, "How does this happen?")

			self.has_hit = true

			self:impact(hit_unit, hit_position, direction, hit_normal, actor_index)
		end
	end
end

ProjectileRaycastImpactUnitExtension._valid_target = function (self, unit, hit_unit)
	if unit == hit_unit or unit == self.owner_unit then
		return false
	end

	if self._dont_target_friendly then
		local side_manager = Managers.state.side
		local has_side = side_manager.side_by_unit[hit_unit]

		if has_side and not side_manager:is_enemy(self.owner_unit, hit_unit) then
			return false
		end
	end

	if self._ignore_dead and not AiUtils.unit_alive(hit_unit) then
		return false
	end

	return true
end
