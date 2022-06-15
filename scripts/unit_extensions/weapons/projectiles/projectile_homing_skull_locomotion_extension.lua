ProjectileHomingSkullLocomotionExtension = class(ProjectileHomingSkullLocomotionExtension)

ProjectileHomingSkullLocomotionExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local t = Managers.time:time("game")
	self._spawn_time = t
	local max_speed_multiplier = BelakorBalancing.homing_skulls_min_speed_multiplier
	local min_speed_multiplier = BelakorBalancing.homing_skulls_max_speed_multiplier
	local delta = max_speed_multiplier - min_speed_multiplier
	self._speed_multiplier = min_speed_multiplier + math.random() * delta
	self._use_sin_for_vertical_trajectory = Math.random(1, 2) == 1
	self._base_position = Vector3Box(Unit.local_position(unit, 0))
end

local function get_target_head_node_position(unit, node_name)
	local blackboard = BLACKBOARDS[unit]
	local breed = blackboard and blackboard.breed

	if breed and breed.target_head_node then
		return Unit.world_position(unit, Unit.node(unit, breed.target_head_node))
	else
		return Unit.world_position(unit, Unit.node(unit, node_name))
	end
end

local function valid_position(position)
	local pmin = NetworkConstants.position.min
	local pmax = NetworkConstants.position.max

	for i = 1, 3, 1 do
		local coord = position[i]

		if coord < pmin or pmax < coord then
			print("[ProjectileHomingSkullLocomotionExtension] position is not valid, outside of NetworkConstants.position")

			return false
		end
	end

	return true
end

ProjectileHomingSkullLocomotionExtension.update = function (self, unit, input, dt, context, t)
	self.moved = false

	if self.stopped then
		return
	end

	local blackboard = BLACKBOARDS[unit]
	local target_unit = blackboard.target_unit

	if not target_unit or not ALIVE[target_unit] then
		return
	end

	local base_position = self._base_position:unbox()
	local current_rotation = Unit.local_rotation(unit, 0)
	local target_position = get_target_head_node_position(target_unit, "c_head")
	local target_vector = target_position - base_position
	local target_direction = Vector3.normalize(target_vector)
	local target_movement_rotation = Quaternion.look(target_direction)
	local lerp_value = dt * BelakorBalancing.homing_skulls_lerp_constant
	local new_rotation = Quaternion.lerp(current_rotation, target_movement_rotation, lerp_value)
	local new_direction = Quaternion.forward(new_rotation)
	local speed_multiplier = self._speed_multiplier
	local speed = BelakorBalancing.homing_skulls_base_speed * speed_multiplier
	local spawn_time = self._spawn_time
	local lifetime = t - spawn_time
	speed = speed * BelakorBalancing.homing_skulls_speed_multiplier_curve_func(lifetime)
	local cross_vector = Vector3(target_direction.x, target_direction.y, math.abs(new_direction.z) + 1)
	local u_vector = Vector3.cross(target_direction, cross_vector)
	local v_vector = Vector3.cross(target_direction, u_vector)
	local curve_func = (self._use_sin_for_vertical_trajectory and math.sin) or math.cos
	local v_offset = Vector3.normalize(v_vector) * BelakorBalancing.homing_skulls_vertical_offset_multiplier * curve_func(lifetime * BelakorBalancing.homing_skulls_vertical_offset_frequency_multiplier)
	local new_base_position = base_position + new_direction * speed * dt

	self._base_position:store(new_base_position)

	local new_position = new_base_position + v_offset

	if not valid_position(new_position) then
		self:stop()

		return
	end

	local current_position = Unit.local_position(unit, 0)
	local velocity = new_position - current_position
	local length = Vector3.length(velocity)

	if length <= 0.001 then
		return
	end

	Unit.set_local_rotation(unit, 0, new_rotation)
	Unit.set_local_position(unit, 0, new_position)

	local game = Managers.state.network:game()
	local id = Managers.state.unit_storage:go_id(unit)

	if game and id then
		GameSession.set_game_object_field(game, id, "position", new_position)
		GameSession.set_game_object_field(game, id, "rotation", new_rotation)

		local constant = NetworkConstants.enemy_velocity
		local vel_min = constant.min
		local vel_max = constant.max
		local vel_min_v3 = Vector3(vel_min, vel_min, vel_min)
		local vel_max_v3 = Vector3(vel_max, vel_max, vel_max)
		velocity = Vector3.min(Vector3.max(velocity, vel_min_v3), vel_max_v3)

		GameSession.set_game_object_field(game, id, "velocity", velocity)
	end

	self.moved = true
end

ProjectileHomingSkullLocomotionExtension.moved_this_frame = function (self)
	return not self.stopped and self.moved
end

ProjectileHomingSkullLocomotionExtension.destroy = function (self)
	self.stopped = true
end

ProjectileHomingSkullLocomotionExtension.stop = function (self)
	self.stopped = true
end

return
