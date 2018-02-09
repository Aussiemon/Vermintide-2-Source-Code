require("scripts/managers/camera/cameras/base_camera")

RootCamera = class(RootCamera, BaseCamera)
RootCamera.init = function (self)
	BaseCamera.init(self, self)

	self._aim_pitch = 0
	self._aim_yaw = 0
	self._pitch_min = -math.huge
	self._pitch_max = math.huge
	self._environment_params = {}

	return 
end
RootCamera.set_root_unit = function (self, unit, object, preserve_yaw)
	BaseCamera.set_root_unit(self, unit, object)

	if not preserve_yaw then
		local rotation = Unit.world_rotation(unit, 0)
		local forward = Quaternion.forward(rotation)
		local forward_flat = Vector3(forward.x, forward.y, 0)
		local forward_flat_normalized = Vector3.normalize(forward_flat)
		local init_yaw = math.atan2(forward_flat_normalized.x, forward_flat_normalized.y)

		if script_data.spawn_debug then
			local drawer = Managers.state.debug:drawer({
				name = "spawn"
			})

			drawer.quaternion(drawer, Unit.world_position(unit, 0), Unit.world_rotation(unit, 0), 1)
		end

		self._aim_yaw = -init_yaw
	end

	return 
end
RootCamera.parse_parameters = function (self, camera_settings, parent_node)
	if camera_settings.name then
		self._name = camera_settings.name
	end

	local degrees_to_radians = math.pi/180
	self._vertical_fov = camera_settings.vertical_fov and camera_settings.vertical_fov*degrees_to_radians
	self._should_apply_fov_multiplier = camera_settings.should_apply_fov_multiplier or false
	self._default_fov = (camera_settings.default_fov and camera_settings.default_fov*degrees_to_radians) or self._vertical_fov
	self._near_range = camera_settings.near_range
	self._far_range = camera_settings.far_range
	self._pitch_min = camera_settings.pitch_min and camera_settings.pitch_min*degrees_to_radians
	self._pitch_max = camera_settings.pitch_max and camera_settings.pitch_max*degrees_to_radians
	self._pitch_speed = camera_settings.pitch_speed and camera_settings.pitch_speed*degrees_to_radians
	self._yaw_speed = camera_settings.yaw_speed and camera_settings.yaw_speed*degrees_to_radians
	self._pitch_offset = camera_settings.pitch_offset and camera_settings.pitch_offset*degrees_to_radians
	self._safe_position_offset = camera_settings.safe_position_offset
	self._tree_transitions = camera_settings.tree_transitions
	self._node_transitions = camera_settings.node_transitions
	self._fade_to_black = camera_settings.fade_to_black or 0

	if camera_settings.root_object_name then
		self._object_name = camera_settings.root_object_name
	end

	return 
end
RootCamera.update = function (self, dt, data, pitch_speed, yaw_speed)
	if not self.active(self) then
		return 
	end

	local position, rotation = nil
	local root_unit = self._root_unit
	local root_object = self._root_object

	if root_unit and Unit.alive(root_unit) then
		position = Unit.world_position(root_unit, root_object)
		rotation = Unit.world_rotation(root_unit, root_object)

		self._root_position:store(position)
		self._root_rotation:store(rotation)
	else
		position = self._root_position:unbox()
		rotation = self._root_rotation:unbox()
	end

	BaseCamera.update(self, dt, position, rotation, data)

	return 
end
RootCamera.update_pitch_yaw = function (self, dt, data, current_node)
	local pitch_speed = data.pitch_speed or self._pitch_speed
	local yaw_speed = data.yaw_speed or self._yaw_speed
	local dyn_pitch_scale = 1
	local dyn_yaw_scale = 1
	local max_yaw_speed = nil
	local look_vec = (data.look_controller_input and data.look_controller_input:unbox()) or Vector3(0, 0, 0)

	if self._root_unit and Unit.alive(self._root_unit) then
		dyn_pitch_scale = 1
		dyn_yaw_scale = 1
		max_yaw_speed = Unit.get_data(self._root_unit, "camera", "dynamic_max_yaw_speed")
	end

	local yaw_delta_value = nil

	if max_yaw_speed and yaw_speed then
		self._accumulated_dt = self._accumulated_dt or 0

		if 0 < math.abs(look_vec.x) then
			local total_dt = self._accumulated_dt + dt
			local max_speed = max_yaw_speed*total_dt
			yaw_delta_value = math.clamp(look_vec.x*yaw_speed*dyn_yaw_scale, -max_speed, max_speed)
			self._accumulated_dt = 0
		else
			yaw_delta_value = 0
			self._accumulated_dt = self._accumulated_dt + dt

			if 0.1 < self._accumulated_dt then
				self._accumulated_dt = 0
			end
		end
	elseif yaw_speed then
		self._accumulated_dt = 0
		yaw_delta_value = look_vec.x*yaw_speed*dyn_yaw_scale
	end

	local pitch_delta_value = look_vec.y*pitch_speed*dyn_pitch_scale
	local constraint_function = current_node.constraint_function(current_node)

	if constraint_function then
		local rot = Unit.local_rotation(self._root_unit, 0)
		local dir = Quaternion.forward(rot)
		local norm_flat_dir = Vector3.normalize(Vector3.flat(dir))
		local yaw = math.atan2(norm_flat_dir.x, norm_flat_dir.y)
		local yaw_diff = (yaw + self._aim_yaw + math.pi)%(math.pi*2) - math.pi
		local relative_pitch = self._aim_pitch
		local new_yaw, new_pitch = constraint_function(yaw_diff, relative_pitch, yaw_delta_value, pitch_delta_value)
		self._aim_yaw = (new_yaw - yaw)%(math.pi*2)

		if not new_pitch then
			if pitch_speed then
				self._aim_pitch = math.clamp(self._aim_pitch + pitch_delta_value, self._pitch_min, self._pitch_max)
			end
		else
			self._aim_pitch = new_pitch
		end
	else
		if pitch_speed then
			self._aim_pitch = math.clamp(self._aim_pitch + pitch_delta_value, self._pitch_min, self._pitch_max)
		end

		if yaw_speed then
			self._aim_yaw = (self._aim_yaw - yaw_delta_value)%(math.pi*2)
		end
	end

	return 
end
RootCamera.aim_pitch = function (self)
	return self._aim_pitch
end
RootCamera.aim_yaw = function (self)
	return self._aim_yaw
end
RootCamera.set_aim_pitch = function (self, pitch)
	self._aim_pitch = pitch

	return 
end
RootCamera.set_aim_yaw = function (self, yaw)
	self._aim_yaw = yaw

	return 
end

return 
