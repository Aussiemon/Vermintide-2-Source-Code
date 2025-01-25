-- chunkname: @foundation/scripts/util/script_camera.lua

ScriptCamera = ScriptCamera or {}

ScriptCamera.position = function (camera)
	local camera_unit = Camera.get_data(camera, "unit")

	return Unit.local_position(camera_unit, 0)
end

ScriptCamera.rotation = function (camera)
	local camera_unit = Camera.get_data(camera, "unit")

	return Unit.local_rotation(camera_unit, 0)
end

ScriptCamera.pose = function (camera)
	local camera_unit = Camera.get_data(camera, "unit")

	return Unit.local_pose(camera_unit, 0)
end

ScriptCamera.set_local_position = function (camera, position)
	local camera_unit = Camera.get_data(camera, "unit")

	Camera.set_local_position(camera, camera_unit, position)
end

ScriptCamera.set_local_rotation = function (camera, rotation)
	local camera_unit = Camera.get_data(camera, "unit")

	Camera.set_local_rotation(camera, camera_unit, rotation)
end

ScriptCamera.set_local_pose = function (camera, pose)
	local camera_unit = Camera.get_data(camera, "unit")

	Camera.set_local_pose(camera, camera_unit, pose)
end

ScriptCamera.force_update = function (world, camera)
	local camera_unit = Camera.get_data(camera, "unit")

	World.update_unit(world, camera_unit)
end

ScriptCamera.world_to_screen_uv = function (...)
	local pos = Camera.world_to_screen(...)
	local resolution_x, resolution_y = Application.resolution()

	return Vector3(pos[1] / resolution_x, pos[2] / resolution_y, 0)
end
