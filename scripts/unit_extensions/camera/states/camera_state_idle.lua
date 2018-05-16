CameraStateIdle = class(CameraStateIdle, CameraState)

CameraStateIdle.init = function (self, camera_state_init_context)
	CameraState.init(self, camera_state_init_context, "idle")
end

CameraStateIdle.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	return
end

CameraStateIdle.on_exit = function (self, unit, input, dt, context, t, next_state)
	return
end

CameraStateIdle.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local unit = self.unit
	local camera_extension = self.camera_extension
	local follow_unit, _ = camera_extension:get_follow_data()

	if follow_unit then
		csm:change_state("follow")

		return
	end

	local position = camera_extension:get_idle_position()
	local rotation = camera_extension:get_idle_rotation()

	assert(Vector3.is_valid(position), "Camera position invalid.")
	Unit.set_local_position(unit, 0, position)
	Unit.set_local_rotation(unit, 0, rotation)
end

return
