ProjectileExtrapolatedHuskLocomotionExtension = class(ProjectileExtrapolatedHuskLocomotionExtension)

ProjectileExtrapolatedHuskLocomotionExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local t = Managers.time:time("game")
	self._spawn_time = t
	self._last_lerp_position = Vector3Box(Unit.local_position(unit, 0))
	self._last_lerp_position_offset = Vector3Box()
	self._accumulated_movement = Vector3Box()
	self._pos_lerp_time = 0
end

local POS_EPSILON = 0.01
local POS_EPSILON_SQ = POS_EPSILON * POS_EPSILON
local POS_LERP_TIME = 0.1

ProjectileExtrapolatedHuskLocomotionExtension.update = function (self, unit, input, dt, context, t)
	if self._stopped then
		return
	end

	local game = Managers.state.network:game()
	local id = Managers.state.unit_storage:go_id(unit)

	if game and id then
		local network_pos = GameSession.game_object_field(game, id, "position")
		local network_rotation = GameSession.game_object_field(game, id, "rotation")
		local network_velocity = GameSession.game_object_field(game, id, "velocity")
		local VELOCITY_EPSILON_SQ = NetworkConstants.VELOCITY_EPSILON * NetworkConstants.VELOCITY_EPSILON

		if Vector3.length_squared(network_velocity) < VELOCITY_EPSILON_SQ then
			network_velocity = Vector3(0, 0, 0)
		end

		local last_pos = self._last_lerp_position:unbox()
		local last_pos_offset = self._last_lerp_position_offset:unbox()
		local accumulated_movement = self._accumulated_movement:unbox()
		self._pos_lerp_time = self._pos_lerp_time + dt
		local lerp_t = self._pos_lerp_time / POS_LERP_TIME
		local move_delta = network_velocity * dt
		accumulated_movement = accumulated_movement + move_delta
		local lerp_pos_offset = Vector3.lerp(last_pos_offset, Vector3.zero(), math.min(lerp_t, 1))
		local lerp_pos = last_pos + accumulated_movement + lerp_pos_offset

		if POS_EPSILON_SQ < Vector3.length_squared(network_pos - last_pos) then
			self._pos_lerp_time = 0

			self._last_lerp_position:store(network_pos)
			self._last_lerp_position_offset:store(lerp_pos - network_pos)
			self._accumulated_movement:store(Vector3.zero())
		else
			self._accumulated_movement:store(accumulated_movement)
		end

		Unit.set_local_position(unit, 0, lerp_pos)

		local old_rot = Unit.local_rotation(unit, 0)
		local rotation_lerp_amount = math.min(dt * 15, 1)

		Unit.set_local_rotation(unit, 0, Quaternion.lerp(old_rot, network_rotation, rotation_lerp_amount))
	end
end

ProjectileExtrapolatedHuskLocomotionExtension.destroy = function (self)
	return
end

ProjectileExtrapolatedHuskLocomotionExtension.stop = function (self)
	self._stopped = true
end
