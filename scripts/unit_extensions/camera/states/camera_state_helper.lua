-- chunkname: @scripts/unit_extensions/camera/states/camera_state_helper.lua

CameraStateHelper = CameraStateHelper or {}

CameraStateHelper.set_local_pose = function (camera_unit, unit, node)
	local pose = Unit.local_pose(unit, node)
	local current_node = node

	assert(Matrix4x4.is_valid(pose), "Camera unit pose invalid.")

	while current_node ~= 0 do
		local parent_node = Unit.scene_graph_parent(unit, current_node)
		local parent_pose = Unit.local_pose(unit, parent_node)

		assert(Matrix4x4.is_valid(parent_pose), "Camera unit parent pose invalid.")

		pose = Matrix4x4.multiply(pose, parent_pose)
		current_node = parent_node
	end

	Unit.set_local_pose(camera_unit, 0, pose)
end

local MAX_MIN_PITCH = math.pi / 2 - math.pi / 15

CameraStateHelper.set_camera_rotation = function (camera_unit, camera_extension)
	local input_manager = Managers.input
	local camera_manager = Managers.state.camera
	local input_source = input_manager:get_service("Player")
	local gamepad_active = input_manager:is_device_active("gamepad")
	local look_input = gamepad_active and input_source:get("look_controller_3p") or input_source:get("look")
	local look_delta = Vector3.zero()

	if look_input then
		local viewport_name = camera_extension.viewport_name
		local look_sensitivity = camera_manager:has_viewport(viewport_name) and camera_manager:fov(viewport_name) / 0.785 or 1

		look_delta = look_delta + look_input * look_sensitivity
	end

	local rotation = Unit.local_rotation(camera_unit, 0)
	local yaw = Quaternion.yaw(rotation) - look_delta.x
	local pitch = math.clamp(Quaternion.pitch(rotation) + look_delta.y, -MAX_MIN_PITCH, MAX_MIN_PITCH)
	local yaw_rotation = Quaternion(Vector3.up(), yaw)
	local pitch_rotation = Quaternion(Vector3.right(), pitch)
	local look_rotation = Quaternion.multiply(yaw_rotation, pitch_rotation)

	Unit.set_local_rotation(camera_unit, 0, look_rotation)
end

CameraStateHelper.set_follow_camera_position = function (camera_unit, follow_unit, follow_node, position_offset, snap_camera, dt)
	local position = Unit.world_position(follow_unit, follow_node)

	if position_offset then
		position = position + position_offset
	end

	local new_position

	if snap_camera then
		new_position = position

		Managers.state.event:trigger("camera_teleported")
	else
		local previous_position = Unit.world_position(camera_unit, 0)
		local lerp_t = math.min(dt * 10, 1)

		new_position = Vector3.lerp(previous_position, position, lerp_t)
	end

	fassert(Vector3.is_valid(new_position), "Camera position invalid.")
	Unit.set_local_position(camera_unit, 0, new_position)
end
