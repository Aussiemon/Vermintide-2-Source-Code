-- chunkname: @scripts/unit_extensions/camera/states/camera_state_observer.lua

local camera_state_observer_testify = script_data.testify and require("scripts/unit_extensions/camera/states/camera_state_observer_testify")

CameraStateObserver = class(CameraStateObserver, CameraState)

CameraStateObserver.init = function (self, camera_state_init_context)
	CameraState.init(self, camera_state_init_context, "observer")

	self._game_settings = Managers.state.game_mode:settings()
end

CameraStateObserver.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	self._observed_unit = nil
	self._network_transmit = context.network_transmit
	self._is_server = context.network_transmit.is_server
	self._default_observed_node_name = "camera_attach"
	self._input_service_name = params.input_service_name or "Player"

	local override_observed_node = params.override_observed_node

	self._observed_node_name = override_observed_node or self._default_observed_node_name

	local observed_unit = params.override_follow_unit or self._observed_unit

	if Unit.alive(observed_unit) then
		local observed_node = Unit.node(observed_unit, self._observed_node_name)

		self:_set_observed_unit(observed_unit, observed_node)
	else
		self:follow_next_unit(false)
	end

	Managers.state.event:trigger("camera_teleported")
end

CameraStateObserver.on_exit = function (self, unit, input, dt, context, t, next_state)
	Managers.player:local_player():set_observed_unit(nil)
	Managers.state.event:trigger("camera_teleported")
end

CameraStateObserver.refresh_follow_unit = function (self, follow_unit, follow_node)
	self:_set_observed_unit(follow_unit, follow_node)
end

local MAX_MIN_PITCH = math.pi / 2 - math.pi / 15

CameraStateObserver.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local camera_extension = self.camera_extension
	local external_state_change = camera_extension.external_state_change
	local external_state_change_params = camera_extension.external_state_change_params

	if external_state_change and external_state_change ~= self.name then
		csm:change_state(external_state_change, external_state_change_params)
		camera_extension:set_external_state_change(nil)

		return
	end

	local input_source = Managers.input:get_service(self._input_service_name)
	local find_next_observer_target = input_source:get("next_observer_target") or not Unit.alive(self._observed_unit)
	local find_previous_observer_target = input_source:get("previous_observer_target")

	if find_next_observer_target or find_previous_observer_target then
		if find_next_observer_target then
			self:follow_next_unit(false)
		else
			self:follow_next_unit(true)
		end
	end

	CameraStateHelper.set_camera_rotation(unit, camera_extension)

	local observed_unit = self._observed_unit

	if not Unit.alive(observed_unit) then
		self._observed_unit = nil

		return
	end

	local observed_node = self._observed_node
	local snap_camera = self._snap_camera
	local position = Unit.world_position(observed_unit, observed_node)

	if observed_node == 0 and not Managers.player:owner(observed_unit) then
		position = position + Vector3(0, 0, 1.5)
	end

	CameraStateHelper.set_follow_camera_position(unit, position, nil, snap_camera, dt)

	self._snap_camera = false

	if script_data.testify then
		Testify:poll_requests_through_handler(camera_state_observer_testify, self)
	end
end

CameraStateObserver.follow_next_unit = function (self, reverse)
	local player = self.camera_extension.player
	local unique_id = player:unique_id()
	local player_side = Managers.state.side:get_side_from_player_unique_id(unique_id)
	local next_unit = CameraStateHelper.get_valid_unit_to_observe(reverse, player_side, self._observed_unit, player)
	local new_target = next_unit ~= self._observed_unit

	if new_target then
		local observed_node = Unit.alive(next_unit) and Unit.has_node(next_unit, self._observed_node_name) and Unit.node(next_unit, self._observed_node_name) or 0

		self:_set_observed_unit(next_unit, observed_node)
	end

	return next_unit, new_target
end

CameraStateObserver._set_observed_unit = function (self, observed_unit, observed_node)
	self._observed_unit = observed_unit
	self._observed_node = observed_node or observed_unit and (Unit.has_node(observed_unit, self._default_observed_node_name) and Unit.node(observed_unit, self._default_observed_node_name) or 0)

	if not Unit.alive(observed_unit) then
		return false
	end

	local snap_camera
	local unit = self.unit
	local camera_extension = self.camera_extension
	local viewport_name = camera_extension.viewport_name
	local root_look_dir = Vector3.normalize(Vector3.flat(Quaternion.forward(Unit.local_rotation(observed_unit, 0))))
	local yaw = math.atan2(root_look_dir.y, root_look_dir.x)
	local camera_manager = Managers.state.camera

	camera_manager:set_pitch_yaw(viewport_name, -0.6, yaw)
	Unit.set_data(unit, "camera", "settings_node", "observer")

	local current_position = Unit.world_position(unit, 0)
	local observed_unit_position = Unit.world_position(observed_unit, 0)
	local distance = Vector3.distance(current_position, observed_unit_position)

	if distance > 50 then
		snap_camera = true
	end

	self._snap_camera = snap_camera

	local player = self.camera_extension.player

	player:set_observed_unit(observed_unit)

	if not self._is_server then
		local local_player = Managers.player:local_player()
		local local_player_go_id = local_player.game_object_id
		local observed_unit_id, is_level_unit = Managers.state.network:game_object_or_level_id(observed_unit)

		observed_unit_id = observed_unit_id or NetworkConstants.invalid_game_object_id
		is_level_unit = not not is_level_unit

		self._network_transmit:send_rpc_server("rpc_set_observed_unit", local_player_go_id, observed_unit_id, is_level_unit)
	end

	return true
end
