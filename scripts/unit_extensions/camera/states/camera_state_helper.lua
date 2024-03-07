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

CameraStateHelper.set_follow_camera_position = function (camera_unit, position, position_offset, snap_camera, dt)
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

CameraStateHelper.get_valid_unit_to_observe = function (reverse, optional_side, optional_current_unit, optional_observer_player)
	local units_to_spectate = FrameTable.alloc_table()
	local players = table.values(Managers.player:human_and_bot_players())

	table.sort(players, function (a, b)
		return (a.game_object_id or 0) <= (b.game_object_id or 0)
	end)

	for i = 1, #players do
		units_to_spectate[#units_to_spectate + 1] = players[i].player_unit
	end

	local game_mode = Managers.state.game_mode:game_mode()

	if game_mode.get_extra_observer_units then
		local optional_slot_id

		if optional_observer_player then
			local player_status = Managers.party:get_status_from_unique_id(optional_observer_player:unique_id())

			optional_slot_id = player_status.slot_id
		end

		local game_mode_units = game_mode:get_extra_observer_units(optional_slot_id)

		if game_mode_units then
			table.append(units_to_spectate, game_mode_units)
		end
	end

	local side_manager = Managers.state.side
	local side_name = optional_side and optional_side:name()
	local observe_sides

	if side_name then
		local game_settings = Managers.state.game_mode:settings()
		local side_settings = game_settings.side_settings and game_settings.side_settings[side_name]

		observe_sides = side_settings and side_settings.observe_sides
	end

	local num_units = #units_to_spectate

	if num_units <= 0 then
		return
	end

	local index = optional_current_unit and table.index_of(units_to_spectate, optional_current_unit)

	if not index or index < 1 then
		index = 1
	end

	index = math.index_wrapper(index, num_units)

	local first_index = index
	local last_valid_unit = units_to_spectate[index]
	local diff = reverse and -1 or 1

	repeat
		index = math.index_wrapper(index + diff, num_units)

		local next_unit = units_to_spectate[index]
		local valid_unit = Unit.alive(next_unit)

		if observe_sides then
			local as_player = Managers.player:owner(next_unit)
			local valid_player = as_player and as_player.player_unit

			if valid_player then
				local player_side = as_player and side_manager:get_side_from_player_unique_id(as_player:unique_id())
				local valid_func = player_side and observe_sides[player_side:name()]

				valid_unit = not valid_func or valid_func()
			end
		end

		if valid_unit then
			last_valid_unit = next_unit

			break
		end

		if index == first_index then
			break
		end
	until false

	return last_valid_unit
end
