require("scripts/managers/camera/cameras/base_camera")

SwayCamera = class(SwayCamera, BaseCamera)
SwayCamera.init = function (self, root_node)
	BaseCamera.init(self, root_node)

	return 
end
SwayCamera.parse_parameters = function (self, camera_settings, parent_node)
	BaseCamera.parse_parameters(self, camera_settings, parent_node)

	return 
end
SwayCamera.update = function (self, dt, position, rotation, data)
	local new_rot = data.final_rotation:unbox()
	local final_rot = Quaternion.multiply(rotation, new_rot)

	BaseCamera.update(self, dt, position, final_rot, data)

	return 
end

return 
