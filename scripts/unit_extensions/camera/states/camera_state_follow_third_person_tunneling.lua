﻿-- chunkname: @scripts/unit_extensions/camera/states/camera_state_follow_third_person_tunneling.lua

CameraStateFollowThirdPersonTunneling = class(CameraStateFollowThirdPersonTunneling, CameraState)

CameraStateFollowThirdPersonTunneling.init = function (self, camera_state_init_context)
	CameraState.init(self, camera_state_init_context, "follow_third_person_tunneling")
end

CameraStateFollowThirdPersonTunneling.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local camera_extension = self.camera_extension
	local follow_unit, follow_node = camera_extension:get_follow_data()
	local viewport_name = camera_extension.viewport_name

	self._follow_unit = follow_unit
	self._follow_node = follow_node
	self._unit = unit

	local camera_manager = Managers.state.camera
	local root_look_dir = Vector3.normalize(Vector3.flat(Quaternion.forward(Unit.local_rotation(follow_unit, 0))))
	local yaw = math.atan2(root_look_dir.y, root_look_dir.x)

	camera_manager:set_pitch_yaw(viewport_name, -0.6, yaw)
	Unit.set_data(unit, "camera", "settings_node", "tunneling")

	self.total_lerp_time = 2
	self.lerp_time = 0
	self.progress = 0
	self.calculate_lerp = true
	self.camera_start_pose = Matrix4x4Box(Unit.local_pose(unit, 0))
end

CameraStateFollowThirdPersonTunneling.on_exit = function (self, unit, input, dt, context, t, next_state)
	self._follow_unit = nil
end

CameraStateFollowThirdPersonTunneling.update_tunnel_camera_position = function (self, position)
	local unit = self._unit

	Unit.set_local_position(unit, 0, position)

	local follow_unit = self._follow_unit
	local follow_unit_pos = Unit.local_position(follow_unit, 0)
	local direction = follow_unit_pos - position
	local look_rotation = Quaternion.look(direction)

	Unit.set_local_rotation(unit, 0, look_rotation)

	self.calculate_lerp = true
	self.total_lerp_time = 2
	self.lerp_time = 0
	self.progress = 0
	self.calculate_lerp = true
	self.camera_start_pose = Matrix4x4Box(Unit.local_pose(unit, 0))
end

CameraStateFollowThirdPersonTunneling.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local camera_extension = self.camera_extension
	local follow_unit = self._follow_unit

	if not Unit.alive(follow_unit) then
		csm:change_state("idle")

		return
	end

	local external_state_change = camera_extension.external_state_change
	local external_state_change_params = camera_extension.external_state_change_params

	if external_state_change and external_state_change ~= self.name then
		csm:change_state(external_state_change, external_state_change_params)
		camera_extension:set_external_state_change(nil)

		return
	end

	if self.calculate_lerp then
		local total_lerp_time = self.total_lerp_time
		local lerp_time = self.lerp_time
		local progress = self.progress
		local current_lerp_time = math.min(lerp_time + dt, total_lerp_time)
		local current_progress = current_lerp_time / total_lerp_time
		local smoothstep = math.smoothstep(current_progress, 0, 1)
		local camera_target_pose = Unit.local_pose(follow_unit, 0)
		local camera_pose = self.camera_start_pose:unbox()
		local lerp_pose = Matrix4x4.lerp(camera_pose, camera_target_pose, smoothstep)

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
end
