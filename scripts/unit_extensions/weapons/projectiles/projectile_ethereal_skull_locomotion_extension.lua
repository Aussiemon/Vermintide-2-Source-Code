ProjectileEtherealSkullLocomotionExtension = class(ProjectileEtherealSkullLocomotionExtension)
local settings = DLCSettings.wizards_part_2.ethereal_skull_settings
local group_data = AIGroupTemplates.ethereal_skulls
local unit_local_position = Unit.local_position
local length_squared = Vector3.length_squared
local direction_length = Vector3.direction_length
local rotate = Quaternion.rotate

local function valid_position(position)
	local pmin = NetworkConstants.position.min
	local pmax = NetworkConstants.position.max

	for i = 1, 3 do
		local coord = position[i]

		if coord < pmin or pmax < coord then
			print("[ProjectileEtherealSkullLocomotionExtension] position is not valid, outside of NetworkConstants.position")

			return false
		end
	end

	return true
end

ProjectileEtherealSkullLocomotionExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local t = Managers.time:time("game")
	self._spawn_time = t
	local max_speed_multiplier = settings.min_speed_multiplier
	local min_speed_multiplier = settings.max_speed_multiplier
	local delta = max_speed_multiplier - min_speed_multiplier
	self._speed_multiplier = min_speed_multiplier + math.random() * delta
	self._use_sin_for_vertical_trajectory = math.random(1, 2) == 1
	self._base_position = Vector3Box(unit_local_position(unit, 0))
	self._unit = unit
	local bb = BLACKBOARDS[unit]
	self._patrol_origin = bb.optional_spawn_data.sofia_unit_pos
	local origin = bb.optional_spawn_data.sofia_unit_pos:unbox()
	self._origin_x = origin.x
	self._origin_y = origin.y
	self._current_state = "spawn_traversal"
	self._spawn_traversal_start = t

	if bb.optional_spawn_data.target then
		self:set_target(bb.optional_spawn_data.target)
	end

	Managers.state.event:register(self, "set_tower_skulls_target", "set_target")
end

ProjectileEtherealSkullLocomotionExtension.update = function (self, unit, input, dt, context, t)
	self._moved = false

	if self._stopped then
		return
	end

	local base_position = self._base_position:unbox()
	local target_direction, new_position = nil
	local current_state = self._current_state

	if current_state == "homing" then
		new_position, target_direction = self:get_homing_movement(unit, base_position, t, dt)
	elseif current_state == "patrol" then
		new_position, target_direction = self:get_patrol_movement(unit, base_position, t, dt)
	elseif current_state == "spawn_traversal" then
		new_position, target_direction = self:get_spawn_traversal_movement(unit, base_position, t, dt)
	end

	local game = Managers.state.network:game()
	local id = Managers.state.unit_storage:go_id(unit)

	self:set_rotation(unit, target_direction, game, id, dt)
	self:set_movement(unit, base_position, new_position, game, id, t, dt)

	self._moved = true
end

ProjectileEtherealSkullLocomotionExtension.get_homing_movement = function (self, unit, base_position, t, dt)
	local origin = self._patrol_origin:unbox()
	local origin_dist_sq = Vector3.distance_squared(origin, base_position)

	if settings.despawn_dist_sq < origin_dist_sq then
		AiUtils.kill_unit(self._unit, nil, nil, nil, nil)
	end

	local speed_multiplier = self._speed_multiplier
	local speed = settings.base_speed * speed_multiplier
	local spawn_time = self._spawn_time
	local lifetime = t - spawn_time
	speed = speed * settings.speed_multiplier_curve_func(lifetime)
	local target_direction = self:get_homing_target_direction(base_position)
	local new_position = base_position + target_direction * speed * dt

	return new_position, target_direction
end

ProjectileEtherealSkullLocomotionExtension.get_patrol_movement = function (self, unit, base_position, t, dt)
	local origin = Vector3(self._origin_x, self._origin_y, base_position.z)
	local direction_from_origin, dist_from_origin = direction_length(base_position - origin)
	local target_displacement_horizontal = dist_from_origin - settings.patrol_target_horizontal_dist_from_origin
	local target_displacement_vertical = base_position.z - settings.patrol_target_height
	local target_trajectory_adjusment = Vector3.zero()
	local adjustment_magnitude = settings.patrol_target_adjustment_speed * dt

	if settings.patrol_target_marginal < math.abs(target_displacement_horizontal) then
		local sign = math.sign(target_displacement_horizontal)
		target_trajectory_adjusment = direction_from_origin * adjustment_magnitude * -sign
	end

	if settings.patrol_target_marginal < math.abs(target_displacement_vertical) then
		local sign = math.sign(target_displacement_vertical)
		target_trajectory_adjusment = target_trajectory_adjusment + Vector3.up() * adjustment_magnitude * -sign
	end

	local angle = settings.patrol_speed / (dist_from_origin * math.pi * 2) * dt
	local added_rot = Quaternion(Vector3.up(), angle)
	local new_position = origin + rotate(added_rot, direction_from_origin * dist_from_origin) + target_trajectory_adjusment
	local target_direction = Vector3.normalize(new_position - base_position)

	if self:has_target() then
		local target_pos = Unit.world_position(self._target_unit, 0)
		local target_distance_sq = Vector3.distance_squared(Vector3.flat(new_position), Vector3.flat(target_pos))

		if target_distance_sq < settings.aggro_distance_sq then
			self._current_state = "homing"

			Unit.flow_event(self._unit, "on_aggro")
		end
	end

	return new_position, target_direction
end

ProjectileEtherealSkullLocomotionExtension.get_spawn_traversal_movement = function (self, unit, base_position, t, dt)
	local alpha = (t - self._spawn_traversal_start) / settings.spawn_traversal_duration
	local origin = Vector3(self._origin_x, self._origin_y, base_position.z)
	local origin_to_current_dir, dist_from_origin = direction_length(base_position - origin)
	local outward_displacement_radius = dist_from_origin + settings.spawn_traversal_outward_speed * dt
	local outward_displacement = origin_to_current_dir * outward_displacement_radius
	local downwards_displacement = Vector3(0, 0, -settings.spawn_traversal_downward_speed * dt)
	local angle = settings.patrol_speed / (outward_displacement_radius * math.pi * 2) * dt
	local added_rot = Quaternion(Vector3.up(), angle)
	local rotated_position_downward = origin + rotate(added_rot, origin_to_current_dir * dist_from_origin) + downwards_displacement
	local rotated_position_outward = origin + rotate(added_rot, outward_displacement)
	local new_position = Vector3.smoothstep(alpha, rotated_position_downward, rotated_position_outward)
	local target_direction = Vector3.normalize(new_position - base_position)

	if t > self._spawn_traversal_start + settings.spawn_traversal_duration then
		self._current_state = "patrol"
	end

	return new_position, target_direction
end

ProjectileEtherealSkullLocomotionExtension.set_movement = function (self, unit, current_base_position, new_base_position, game, id, t, dt)
	if not game and id then
		return
	end

	if not new_base_position then
		return
	end

	if self._in_knockback then
		local knockback_end = self._knockback_start + settings.knockback_duration
		local alpha = math.inv_lerp(self._knockback_start, knockback_end, t)
		local alpha_cubic = math.easeOutCubic(alpha)
		local knockback_position = current_base_position + self._knockback_velocity:unbox() * dt
		new_base_position = Vector3.lerp(knockback_position, new_base_position, alpha_cubic)

		if knockback_end < t then
			self._in_knockback = false
		end
	end

	self._base_position:store(new_base_position)

	local v_offset = self:get_vertical_offset(t)
	local new_position = new_base_position + v_offset
	local old_position = unit_local_position(unit, 0)
	local velocity = new_position - old_position
	local magnitude_sq = length_squared(velocity)

	if magnitude_sq <= 1e-06 then
		return
	end

	if not valid_position(new_position) then
		self:stop()

		return
	end

	Unit.set_local_position(unit, 0, new_position)
	GameSession.set_game_object_field(game, id, "position", new_position)

	local constant = NetworkConstants.enemy_velocity
	local vel_min = constant.min
	local vel_max = constant.max
	local vel_min_v3 = Vector3(vel_min, vel_min, vel_min)
	local vel_max_v3 = Vector3(vel_max, vel_max, vel_max)
	velocity = Vector3.min(Vector3.max(velocity, vel_min_v3), vel_max_v3)

	GameSession.set_game_object_field(game, id, "velocity", velocity)
end

ProjectileEtherealSkullLocomotionExtension.set_knockback = function (self, attacker_unit, hit_dir, hit_pos, t)
	hit_dir = Vector3(hit_dir[1], hit_dir[2], hit_dir[3])
	self._knockback_end = t + settings.knockback_duration
	self._knockback_start = t
	self._in_knockback = true
	local current_position = Unit.world_position(self._unit, 0)
	local first_person_extension = ScriptUnit.has_extension(attacker_unit, "first_person_system")
	local look_direction = nil

	if first_person_extension then
		local camera_rotation = first_person_extension:current_rotation()
		look_direction = Quaternion.forward(camera_rotation)
	else
		local target_position = self:get_target_node_position(attacker_unit)
		look_direction = Vector3.normalize(target_position - current_position)
	end

	local velocity = Vector3.normalize(hit_dir + look_direction * 0.5) * settings.knockback_speed
	self._knockback_velocity = Vector3Box(velocity)
	self.death_velocity_boxed = Vector3Box(velocity)
end

ProjectileEtherealSkullLocomotionExtension.set_rotation = function (self, unit, target_direction, game, id, dt)
	if not game and id then
		return
	end

	local target_rotation = Quaternion.look(target_direction)
	local current_rotation = Unit.local_rotation(self._unit, 0)
	local lerp_value = dt * settings.lerp_constant
	local rotation = Quaternion.lerp(current_rotation, target_rotation, lerp_value)

	Unit.set_local_rotation(unit, 0, rotation)
	GameSession.set_game_object_field(game, id, "rotation", rotation)

	self._direction = Quaternion.forward(rotation)
	self._target_direction = target_direction
end

ProjectileEtherealSkullLocomotionExtension.get_vertical_offset = function (self, t)
	local spawn_time = self._spawn_time
	local lifetime = t - spawn_time
	local target_direction = self._target_direction
	local direction = self._direction
	local cross_vector = Vector3(target_direction.x, target_direction.y, math.abs(direction.z) + 1)
	local u_vector = Vector3.cross(target_direction, cross_vector)
	local v_vector = Vector3.cross(target_direction, u_vector)
	local curve_func = self._use_sin_for_vertical_trajectory and math.sin or math.cos
	local v_offset = Vector3.normalize(v_vector) * settings.vertical_offset_multiplier * curve_func(lifetime * settings.vertical_offset_frequency_multiplier)

	return v_offset
end

ProjectileEtherealSkullLocomotionExtension.get_homing_target_direction = function (self, base_position)
	local target_direction = nil

	if not self:has_target() then
		target_direction = self._cached_direction:unbox()
	else
		local target_position = self:get_target_node_position(self._target_unit)
		target_direction = Vector3.normalize(target_position - base_position)
		self._cached_direction = Vector3Box(target_direction)
	end

	return target_direction
end

ProjectileEtherealSkullLocomotionExtension.set_target = function (self, target_unit, thrown)
	if AIGroupTemplates.ethereal_skulls.last_state == "spawned" then
		return
	end

	self._thrown = thrown
	self._target_unit = target_unit
end

ProjectileEtherealSkullLocomotionExtension.get_target_node_position = function (self, unit)
	local blackboard = BLACKBOARDS[unit]
	local breed = blackboard and blackboard.breed
	local is_pickup = ScriptUnit.has_extension(unit, "pickup_system")

	if breed and breed.target_head_node then
		return Unit.world_position(unit, Unit.node(unit, breed.target_head_node))
	elseif is_pickup and is_pickup.pickup_name == "wizards_barrel" then
		return Unit.world_position(unit, Unit.node(unit, "fx_fuse"))
	else
		return Unit.world_position(unit, Unit.node(unit, "c_head"))
	end
end

ProjectileEtherealSkullLocomotionExtension.has_target = function (self)
	return self._target_unit and Unit.alive(self._target_unit)
end

ProjectileEtherealSkullLocomotionExtension.moved_this_frame = function (self)
	return not self._stopped and self._moved
end

ProjectileEtherealSkullLocomotionExtension.destroy = function (self)
	self._stopped = true
	self._target_unit = nil

	Managers.state.event:unregister("set_tower_skulls_target", self)
end

ProjectileEtherealSkullLocomotionExtension.stop = function (self)
	self._stopped = true
end
