-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
CameraStateObserver = class(CameraStateObserver, CameraState)
local NUM_PLAYERS = 4
local LERP_DISTANCE = 50
CameraStateObserver.init = function (self, camera_state_init_context)
	CameraState.init(self, camera_state_init_context, "observer")

	self._observer_targets = {}
	self._follow_node_name = "camera_attach"

	return 
end
CameraStateObserver.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	self._observed_player_id = nil

	self.follow_next_unit(self)
	Managers.state.event:trigger("camera_teleported")

	return 
end
CameraStateObserver.on_exit = function (self, unit, input, dt, context, t, next_state)
	self.camera_extension:set_observed_player_id(nil)
	Managers.state.event:trigger("camera_teleported")

	return 
end
local MAX_MIN_PITCH = math.pi/2 - math.pi/15
CameraStateObserver.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local camera_extension = self.camera_extension
	local viewport_name = camera_extension.viewport_name
	local camera_manager = Managers.state.camera
	local input_source = Managers.input:get_service("Player")

	if input_source.get(input_source, "next_observer_target") or not Unit.alive(self._follow_unit) then
		self.follow_next_unit(self)

		if not Unit.alive(self._follow_unit) then
			csm.change_state(csm, "idle")

			return 
		end
	end

	local external_state_change = camera_extension.external_state_change

	if external_state_change and external_state_change ~= self.name then
		csm.change_state(csm, external_state_change)
		camera_extension.set_external_state_change(camera_extension, nil)

		return 
	end

	local rotation = Unit.local_rotation(unit, 0)
	local look_sensitivity = (camera_manager.has_viewport(camera_manager, viewport_name) and camera_manager.fov(camera_manager, viewport_name)/0.785) or 1
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local look_input = (gamepad_active and input_source.get(input_source, "look_controller_3p")) or input_source.get(input_source, "look")
	local look_delta = Vector3(0, 0, 0)

	if look_input then
		look_delta = look_delta + look_input*look_sensitivity
	end

	local yaw = Quaternion.yaw(rotation) - look_delta.x
	local pitch = math.clamp(Quaternion.pitch(rotation) + look_delta.y, -MAX_MIN_PITCH, MAX_MIN_PITCH)
	local yaw_rotation = Quaternion(Vector3.up(), yaw)
	local pitch_rotation = Quaternion(Vector3.right(), pitch)
	local look_rotation = Quaternion.multiply(yaw_rotation, pitch_rotation)

	Unit.set_local_rotation(unit, 0, look_rotation)

	local follow_unit = self._follow_unit
	local follow_node = Unit.node(follow_unit, self._follow_node_name)
	local position = Unit.world_position(follow_unit, follow_node)
	local previous_position = Unit.world_position(unit, 0)
	local new_position = Vector3.lerp(previous_position, position, dt*10)

	if self._snap_camera then
		new_position = position
		self._snap_camera = false

		Managers.state.event:trigger("camera_teleported")
	end

	assert(Vector3.is_valid(new_position), "Camera position invalid.")
	Unit.set_local_position(unit, 0, new_position)

	return 
end
CameraStateObserver.follow_next_unit = function (self)
	local player_manager = Managers.player
	local players = player_manager.players(player_manager)
	local observed_player_id = self._observed_player_id
	local follow_unit = nil

	for i = 1, table.size(players), 1 do
		if follow_unit then
		end
	end

	local snap_camera = nil

	if follow_unit then
		local unit = self.unit
		local camera_extension = self.camera_extension
		local viewport_name = camera_extension.viewport_name
		local camera_manager = Managers.state.camera
		local root_look_dir = Vector3.normalize(Vector3.flat(Quaternion.forward(Unit.local_rotation(follow_unit, 0))))
		local yaw = math.atan2(root_look_dir.y, root_look_dir.x)

		camera_manager.set_pitch_yaw(camera_manager, viewport_name, -0.6, yaw)
		Unit.set_data(unit, "camera", "settings_node", "observer")

		local current_position = Unit.world_position(follow_unit, 0)
		local follow_node = Unit.node(follow_unit, self._follow_node_name)
		local follow_unit_position = Unit.world_position(unit, 0)
		local distance = Vector3.distance(current_position, follow_unit_position)

		if 50 < distance then
			snap_camera = true
		end
	end

	if follow_unit then
	end

	self._follow_unit = follow_unit
	self._snap_camera = snap_camera
	self._observed_player_id = observed_player_id

	self.camera_extension:set_observed_player_id(observed_player_id)

	return 
end

return 
