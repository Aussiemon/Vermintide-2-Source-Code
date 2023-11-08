local FreeFlightManagerTestify = {}

FreeFlightManagerTestify.move_free_flight_camera = function (free_flight_manager, data)
	local position = MainPathUtils.point_on_mainpath(nil, data.position)
	local rotation = stingray.Quaternion.from_euler_angles_xyz(data.rotation.x, data.rotation.y, data.rotation.z)
	position.z = position.z + 1

	printf("Moving camera to position x:%f, y:%f, z:%f and rotation x:%f, y:%f, z:%f", position.x, position.y, position.z, data.rotation.x, data.rotation.y, data.rotation.z)
	free_flight_manager:teleport_camera(1, position, rotation)
end

return FreeFlightManagerTestify
