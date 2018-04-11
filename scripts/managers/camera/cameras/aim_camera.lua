require("scripts/managers/camera/cameras/base_camera")

AimCamera = class(AimCamera, BaseCamera)
AimCamera.init = function (self, root_node)
	BaseCamera.init(self, root_node)

	self._root_node = root_node

	return 
end
AimCamera.parse_parameters = function (self, camera_settings, parent_node)
	BaseCamera.parse_parameters(self, camera_settings, parent_node)

	return 
end
AimCamera.set_root_unit = function (self, unit, object)
	BaseCamera.set_root_unit(self, unit, object)

	return 
end
AimCamera.set_root_rotation = function (self, rotation)
	BaseCamera.set_root_rotation(self, rotation)

	return 
end
AimCamera.update = function (self, dt, position, rotation, data)
	local root_node = self._root_node
	local aim_pitch = root_node.aim_pitch(root_node)
	local aim_yaw = root_node.aim_yaw(root_node)
	local rotation_pitch = Quaternion(Vector3(1, 0, 0), aim_pitch)
	local rotation_yaw = Quaternion(Vector3(0, 0, 1), aim_yaw - math.pi * 0.5)
	local new_rotation = Quaternion.multiply(rotation_yaw, rotation_pitch)

	BaseCamera.update(self, dt, position, new_rotation, data)

	return 
end

return 
