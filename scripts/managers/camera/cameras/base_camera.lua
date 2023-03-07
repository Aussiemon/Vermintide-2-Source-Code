BaseCamera = class(BaseCamera)

BaseCamera.init = function (self, root_node)
	self._root_node = root_node
	self._children = {}
	self._name = ""
	self._root_unit = nil
	self._root_object = nil
	self._root_position = Vector3Box()
	self._root_rotation = QuaternionBox()
	self._position = Vector3Box()
	self._rotation = QuaternionBox()
	self._vertical_fov = nil
	self._near_range = nil
	self._far_range = nil
	self._pitch_offset = nil
	self._active = 0
	self._active_children = 0
end

BaseCamera.parse_parameters = function (self, camera_settings, parent_node)
	if camera_settings.name then
		self._name = camera_settings.name
	end

	local degrees_to_radians = math.pi / 180
	self._fade_to_black = camera_settings.fade_to_black
	self._vertical_fov = camera_settings.vertical_fov and camera_settings.vertical_fov * degrees_to_radians
	self._should_apply_fov_multiplier = camera_settings.should_apply_fov_multiplier or parent_node:should_apply_fov_multiplier()
	self._default_fov = camera_settings.default_fov and camera_settings.default_fov * degrees_to_radians or parent_node:default_fov()
	self._near_range = camera_settings.near_range or parent_node:near_range()
	self._far_range = camera_settings.far_range or parent_node:far_range()
	self._pitch_min = camera_settings.pitch_min and camera_settings.pitch_min * degrees_to_radians or parent_node:pitch_min()
	self._pitch_max = camera_settings.pitch_max and camera_settings.pitch_max * degrees_to_radians or parent_node:pitch_max()
	self._pitch_speed = camera_settings.pitch_speed and camera_settings.pitch_speed * degrees_to_radians or parent_node:pitch_speed()
	self._yaw_speed = camera_settings.yaw_speed and camera_settings.yaw_speed * degrees_to_radians or parent_node:yaw_speed()
	self._pitch_offset = camera_settings.pitch_offset and camera_settings.pitch_offset * degrees_to_radians or parent_node:pitch_offset()
	self._safe_position_offset = camera_settings.safe_position_offset or parent_node:safe_position_offset()
	self._tree_transitions = camera_settings.tree_transitions or parent_node:tree_transitions()
	self._node_transitions = camera_settings.node_transitions or parent_node:node_transitions()

	if camera_settings.dof_enabled then
		self._environment_params = self._environment_params or {}
		self._environment_params.dof_enabled = camera_settings.dof_enabled
		self._environment_params.focal_distance = camera_settings.focal_distance
		self._environment_params.focal_region = camera_settings.focal_region
		self._environment_params.focal_padding = camera_settings.focal_padding
		self._environment_params.focal_scale = camera_settings.focal_scale
	end

	self._yaw_origin = camera_settings.yaw_origin and camera_settings.yaw_origin * math.pi / 180
	self._pitch_origin = camera_settings.pitch_origin and camera_settings.pitch_origin * math.pi / 180
	self._constraint_function = camera_settings.constraint or parent_node:constraint_function()
end

BaseCamera.should_apply_fov_multiplier = function (self)
	return self._should_apply_fov_multiplier
end

BaseCamera.default_fov = function (self)
	return self._default_fov
end

BaseCamera.constraint_function = function (self)
	return self._constraint_function
end

BaseCamera.node_transitions = function (self)
	return self._node_transitions
end

BaseCamera.tree_transitions = function (self)
	return self._tree_transitions
end

BaseCamera.safe_position_offset = function (self)
	return self._safe_position_offset
end

BaseCamera.pitch_offset = function (self)
	return self._pitch_offset
end

BaseCamera.pitch_speed = function (self)
	return self._pitch_speed
end

BaseCamera.yaw_speed = function (self)
	return self._yaw_speed
end

BaseCamera.pitch_min = function (self)
	return self._pitch_min
end

BaseCamera.pitch_max = function (self)
	return self._pitch_max
end

BaseCamera.name = function (self)
	return self._name
end

BaseCamera.pose = function (self)
	local pose = Matrix4x4.identity()

	Matrix4x4.set_translation(pose, self:position())
	Matrix4x4.set_rotation(pose, self:rotation())

	return pose
end

BaseCamera.position = function (self)
	return self._position:unbox()
end

BaseCamera.rotation = function (self)
	return self._rotation:unbox()
end

BaseCamera.vertical_fov = function (self)
	return self._vertical_fov or self._parent_node:vertical_fov()
end

BaseCamera.fade_to_black = function (self)
	return self._fade_to_black or self._parent_node:fade_to_black()
end

BaseCamera.shading_environment = function (self)
	return self._environment_params or self._parent_node and self._parent_node:shading_environment()
end

BaseCamera.near_range = function (self)
	return self._near_range
end

BaseCamera.far_range = function (self)
	return self._far_range
end

BaseCamera.dof_enabled = function (self)
	return self._environment_params.dof_enabled
end

BaseCamera.focal_distance = function (self)
	return self._environment_params.focal_distance
end

BaseCamera.focal_region = function (self)
	return self._environment_params.focal_region
end

BaseCamera.focal_padding = function (self)
	return self._environment_params.focal_padding
end

BaseCamera.focal_scale = function (self)
	return self._environment_params.focal_scale
end

BaseCamera.parent_node = function (self)
	return self._parent_node
end

BaseCamera.root_node = function (self)
	return self._root_node
end

BaseCamera.set_parent_node = function (self, parent)
	self._parent_node = parent
end

BaseCamera.add_child_node = function (self, node)
	self._children[#self._children + 1] = node

	node:set_parent_node(self)
end

BaseCamera.set_active = function (self, active)
	local old_active = self:active()

	if active then
		self._active = self._active + 1
	else
		self._active = self._active - 1
	end

	local new_active = self:active()

	if self._parent_node and old_active ~= new_active then
		self._parent_node:set_active_child(new_active)
	end
end

BaseCamera.active = function (self)
	return self._active > 0 or self._active_children > 0
end

BaseCamera.set_active_child = function (self, active)
	local old_active = self:active()

	if active then
		self._active_children = self._active_children + 1
	else
		self._active_children = self._active_children - 1
	end

	local new_active = self:active()

	if self._parent_node and old_active ~= new_active then
		self._parent_node:set_active_child(new_active)
	end
end

BaseCamera.set_root_unit = function (self, unit, object_name)
	self._root_unit = unit
	object_name = object_name or self._object_name
	self._root_object = Unit.node(unit, object_name)

	for _, child in ipairs(self._children) do
		child:set_root_unit(unit, object_name)
	end
end

BaseCamera.root_unit = function (self)
	return self._root_unit, self._object_name
end

BaseCamera.set_root_position = function (self, position)
	self._root_position:store(position)

	for _, child in ipairs(self._children) do
		child:set_root_position(position)
	end
end

BaseCamera.set_root_rotation = function (self, rotation)
	self._root_rotation:store(rotation)

	for _, child in ipairs(self._children) do
		child:set_root_rotation(rotation)
	end
end

BaseCamera.set_root_vertical_fov = function (self, vertical_fov)
	self._vertical_fov = vertical_fov

	for _, child in ipairs(self._children) do
		child:set_root_vertical_fov(vertical_fov)
	end
end

BaseCamera.set_root_near_range = function (self, near_range)
	self._near_range = near_range

	for _, child in ipairs(self._children) do
		child:set_root_near_range(near_range)
	end
end

BaseCamera.set_root_far_range = function (self, far_range)
	self._far_range = far_range

	for _, child in ipairs(self._children) do
		child:set_root_far_range(far_range)
	end
end

BaseCamera.set_root_dof_enabled = function (self, dof_enabled)
	self._environment_params.dof_enabled = dof_enabled

	for _, child in ipairs(self._children) do
		child:set_root_dof_enabled(dof_enabled)
	end
end

BaseCamera.set_root_focal_distance = function (self, focal_distance)
	self._environment_params.focal_distance = focal_distance

	for _, child in ipairs(self._children) do
		child:set_root_focal_distance(focal_distance)
	end
end

BaseCamera.set_root_focal_region = function (self, focal_region)
	self._environment_params.focal_region = focal_region

	for _, child in ipairs(self._children) do
		child:set_root_focal_region(focal_region)
	end
end

BaseCamera.set_root_focal_padding = function (self, focal_padding)
	self._environment_params.focal_padding = focal_padding

	for _, child in ipairs(self._children) do
		child:set_root_focal_padding(focal_padding)
	end
end

BaseCamera.set_root_focal_scale = function (self, focal_scale)
	self._environment_params.focal_scale = focal_scale

	for _, child in ipairs(self._children) do
		child:set_root_focal_scale(focal_scale)
	end
end

BaseCamera.update = function (self, dt, position, rotation, data)
	assert(Vector3.is_valid(position), "Trying to set invalid camera position")
	self._position:store(position)
	self._rotation:store(rotation)

	if script_data.camera_debug and Managers.state.debug then
		self:_debug_draw()
	end

	for _, child in ipairs(self._children) do
		if child:active() then
			child:update(dt, position, rotation, data)
		end
	end
end

BaseCamera.destroy = function (self)
	for _, child in ipairs(self._children) do
		child:destroy()
	end

	self._children = {}
	self._parent_node = nil
end

BaseCamera._debug_draw = function (self)
	local parent_pos = self._parent_node and self._parent_node:position()
	local pos = self._position
	local rot = self._rotation
	local drawer = Managers.state.debug:drawer({
		name = "CAMERA_DEBUG_DRAW" .. self:name()
	})

	if DebugKeyHandler.key_pressed("z", "clear camera debug") then
		drawer:reset()
	end

	if parent_pos then
		drawer:vector(parent_pos, pos:unbox() - parent_pos, Color(70, 255, 255, 255))
	end

	drawer:quaternion(pos:unbox(), rot:unbox())
end
