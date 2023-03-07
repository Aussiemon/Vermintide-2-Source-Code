CameraStateObserverSpectator = class(CameraStateObserverSpectator, CameraStateObserver)
local spectator_views = {
	"third_person",
	"first_person"
}
local rotation_states = {
	"free",
	"follow",
	"locked"
}

CameraStateObserverSpectator.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	self._current_view_id = 1
	self._num_views = #spectator_views
	self._locked_rotation = false
	self._follow_rotation = false
	self._offset_scale = 0.5
	self._camera_offset = 0
	self._rotation_state = rotation_states[1]
	self._rotation_state_index = 1
	self._current_view = spectator_views[1]
	self._pinged_units = {}
	local dark_pact_side = Managers.state.side:get_side_from_name("dark_pact")
	local dark_pact_units = dark_pact_side.PLAYER_AND_BOT_UNITS

	for _, unit in ipairs(dark_pact_units) do
		if Unit.alive(unit) then
			local ghost_mode_system = ScriptUnit.extension(unit, "ghost_mode_system")

			if ghost_mode_system:is_in_ghost_mode() then
				ghost_mode_system:leave_ghost_mode(true)
				ghost_mode_system:enter_ghost_mode()
			end
		end
	end

	CameraStateObserver.on_enter(self, unit, input, dt, context, t, previous_state, params)

	if self._follow_unit then
		Managers.state.event:trigger("on_spectator_target_changed", self._follow_unit)
	end
end

local MAX_MIN_PITCH = math.pi / 2 - math.pi / 15

CameraStateObserverSpectator.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local camera_extension = self.camera_extension
	local external_state_change = camera_extension.external_state_change
	local external_state_change_params = camera_extension.external_state_change_params

	if external_state_change and external_state_change ~= self.name then
		csm:change_state(external_state_change, external_state_change_params)
		camera_extension:set_external_state_change(nil)

		return
	end

	local input_manager = Managers.input
	local input_source = input_manager:get_service("Player")
	local find_next_observer_target = input_source:get("next_observer_target")
	local find_previous_observer_target = input_source:get("previous_observer_target")
	local follow_unit_alive = Unit.alive(self._follow_unit)
	local new_spectator_target_found = nil

	if not follow_unit_alive or find_next_observer_target then
		new_spectator_target_found = self:follow_next_unit()

		if not new_spectator_target_found then
			csm:change_state("idle")

			return
		end
	elseif find_previous_observer_target then
		new_spectator_target_found = self:follow_previous_unit()
	end

	if new_spectator_target_found then
		Managers.state.event:trigger("on_spectator_target_changed", self._follow_unit)
	end

	local offset_change = input_source:get("observer_change_offset")
	local offset_y = offset_change.y

	if offset_y ~= 0 then
		self._camera_offset = math.clamp(self._camera_offset + offset_y * self._offset_scale, 0, 5)
	end

	local camera_manager = Managers.state.camera
	local viewport_name = camera_extension.viewport_name
	local gamepad_active = input_manager:is_device_active("gamepad")
	local look_input = gamepad_active and input_source:get("look_controller_3p") or input_source:get("look")
	local look_delta = Vector3(0, 0, 0)

	if look_input then
		local look_sensitivity = camera_manager:has_viewport(viewport_name) and camera_manager:fov(viewport_name) / 0.785 or 1
		look_delta = look_delta + look_input * look_sensitivity
	end

	local next_observer_rotation_state = input_source:get("next_observer_rotation_state")
	local previous_observer_rotation_state = input_source:get("previous_observer_rotation_state")

	if next_observer_rotation_state then
		self._rotation_state_index = self._rotation_state_index % #rotation_states + 1
		self._rotation_state = rotation_states[self._rotation_state_index]
	elseif previous_observer_rotation_state then
		self._rotation_state_index = (self._rotation_state_index - 2) % #rotation_states + 1
		self._rotation_state = rotation_states[self._rotation_state_index]
	end

	local rotation = Unit.local_rotation(unit, 0)
	local pitch = math.clamp(Quaternion.pitch(rotation) + look_delta.y, -MAX_MIN_PITCH, MAX_MIN_PITCH)
	local pitch_rotation = Quaternion(Vector3.right(), pitch)
	local look_rotation = nil

	if self._rotation_state == "follow" then
		look_rotation = Unit.local_rotation(self._follow_unit, 0)
		look_rotation = Quaternion.multiply(look_rotation, pitch_rotation)
	elseif self._rotation_state ~= "locked" then
		local yaw = Quaternion.yaw(rotation) - look_delta.x
		local yaw_rotation = Quaternion(Vector3.up(), yaw)
		look_rotation = Quaternion.multiply(yaw_rotation, pitch_rotation)
	end

	if look_rotation then
		Unit.set_local_rotation(unit, 0, look_rotation)
	end

	local follow_unit = self._follow_unit
	local follow_node = Unit.node(follow_unit, self._follow_node_name)
	local position = Unit.world_position(follow_unit, follow_node) + Vector3(0, 0, self._camera_offset)
	local previous_position = Unit.world_position(unit, 0)
	local lerp_t = math.min(dt * 10, 1)
	local new_position = Vector3.lerp(previous_position, position, lerp_t)

	if self._snap_camera then
		new_position = position
		self._snap_camera = false

		Managers.state.event:trigger("camera_teleported")
	end

	fassert(Vector3.is_valid(new_position), "Camera position invalid.")
	Unit.set_local_position(unit, 0, new_position)
end
