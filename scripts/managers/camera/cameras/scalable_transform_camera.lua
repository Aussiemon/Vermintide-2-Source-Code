require("scripts/managers/camera/cameras/transform_camera")

ScalableTransformCamera = class(ScalableTransformCamera, TransformCamera)
ScalableTransformCamera.parse_parameters = function (self, camera_settings, parent_node)
	ScalableTransformCamera.super.parse_parameters(self, camera_settings, parent_node)

	self._scale_function = camera_settings.scale_function
	self._scale_variable = camera_settings.scale_variable
	self._max_fov = camera_settings.vertical_fov and (camera_settings.vertical_fov * math.pi) / 180

	return 
end
ScalableTransformCamera.update = function (self, dt, position, rotation, data)
	local scale = data[self._scale_variable] or 1
	local scale_value = self._scale_function(scale)
	local offset_position = self._offset_position
	local offset_x = offset_position.x * scale_value * Quaternion.right(rotation)
	local offset_y = offset_position.y * scale_value * Quaternion.forward(rotation)
	local offset_z = offset_position.z * scale_value * Quaternion.up(rotation)
	position = position + offset_x + offset_y + offset_z
	local fov = self._max_fov

	if fov then
		local parent_fov = self._parent_node:vertical_fov()
		self._vertical_fov = parent_fov + (fov - parent_fov) * scale_value
		self._settings_vertical_fov = self._vertical_fov
	end

	ScalableTransformCamera.super.super.update(self, dt, position, rotation, data)

	return 
end

return 
