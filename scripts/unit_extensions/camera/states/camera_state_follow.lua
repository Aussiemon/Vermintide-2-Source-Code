CameraStateFollow = class(CameraStateFollow, CameraState)
CameraStateFollow.init = function (self, camera_state_init_context)
	CameraState.init(self, camera_state_init_context, "follow")

	self._follow_unit = nil
	self._follow_node = 0

	return 
end
CameraStateFollow.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local follow_unit, follow_node = self.camera_extension:get_follow_data()
	self._follow_unit = follow_unit
	self._follow_node = follow_node

	Unit.set_data(unit, "camera", "settings_node", "first_person_node")

	if previous_state == "camera_state_map" then
		self.total_lerp_time = UISettings.map.camera_time_exit
		self.lerp_time = 0
		self.progress = 0
		self.calculate_lerp = true
		self.camera_start_pose = Matrix4x4Box(Unit.world_pose(unit, 0))
	end

	return 
end
CameraStateFollow.on_exit = function (self, unit, input, dt, context, t, next_state)
	self._follow_unit = nil

	return 
end
CameraStateFollow.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local unit = self.unit
	local camera_extension = self.camera_extension
	local follow_unit = self._follow_unit
	local follow_node = self._follow_node

	if not Unit.alive(follow_unit) then
		csm.change_state(csm, "idle")

		return 
	end

	local external_state_change = camera_extension.external_state_change

	if external_state_change and external_state_change ~= self.name then
		csm.change_state(csm, external_state_change)
		camera_extension.set_external_state_change(camera_extension, nil)

		return 
	end

	CameraStateHelper.set_local_pose(unit, follow_unit, follow_node)

	if self.calculate_lerp then
		local total_lerp_time = self.total_lerp_time
		local lerp_time = self.lerp_time
		local progress = self.progress
		local current_lerp_time = math.min(lerp_time + dt, total_lerp_time)
		local current_progress = current_lerp_time/total_lerp_time
		local smoothstep = math.smoothstep(current_progress, 0, 1)
		local camera_target_pose = Unit.world_pose(follow_unit, 0)
		local camera_pose = self.camera_start_pose:unbox()
		local lerp_pose = Matrix4x4.lerp(camera_pose, camera_target_pose, smoothstep)

		assert(Matrix4x4.is_valid(lerp_pose), "Camera unit lerp pose invalid.")
		Unit.set_local_pose(unit, 0, lerp_pose)

		if progress == 1 then
			self.calculate_lerp = nil
			self.camera_start_pose = nil
			self.total_lerp_time = nil
			self.lerp_time = nil
			self.progress = nil
		else
			self.progress = current_progress
			self.lerp_time = current_lerp_time
		end
	end

	return 
end

return 
