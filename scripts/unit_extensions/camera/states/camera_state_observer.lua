CameraStateObserver = class(CameraStateObserver, CameraState)

CameraStateObserver.init = function (self, camera_state_init_context)
	CameraState.init(self, camera_state_init_context, "observer")

	self._follow_node_name = "camera_attach"
	self._game_settings = Managers.state.game_mode:settings()
end

CameraStateObserver.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	self._observed_player_id = nil
	self._network_transmit = context.network_transmit
	self._is_server = context.network_transmit.is_server

	self:follow_next_unit()
	Managers.state.event:trigger("camera_teleported")
end

CameraStateObserver.on_exit = function (self, unit, input, dt, context, t, next_state)
	self.camera_extension:set_observed_player_id(nil)
	Managers.state.event:trigger("camera_teleported")
end

local MAX_MIN_PITCH = math.pi / 2 - math.pi / 15

CameraStateObserver.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local camera_extension = self.camera_extension
	local viewport_name = camera_extension.viewport_name
	local camera_manager = Managers.state.camera
	local input_source = Managers.input:get_service("Player")
	local find_next_observer_target = input_source:get("next_observer_target") or not Unit.alive(self._follow_unit)
	local find_previous_observer_target = input_source:get("previous_observer_target")

	if find_next_observer_target or find_previous_observer_target then
		if find_next_observer_target then
			self:follow_next_unit()
		else
			self:follow_previous_unit()
		end

		if not Unit.alive(self._follow_unit) then
			csm:change_state("idle")

			return
		end
	end

	local external_state_change = camera_extension.external_state_change
	local external_state_change_params = camera_extension.external_state_change_params

	if external_state_change and external_state_change ~= self.name then
		csm:change_state(external_state_change, external_state_change_params)
		camera_extension:set_external_state_change(nil)

		return
	end

	local gamepad_active = Managers.input:is_device_active("gamepad")
	local look_input = (gamepad_active and input_source:get("look_controller_3p")) or input_source:get("look")
	local look_delta = Vector3(0, 0, 0)

	if look_input then
		local look_sensitivity = (camera_manager:has_viewport(viewport_name) and camera_manager:fov(viewport_name) / 0.785) or 1
		look_delta = look_delta + look_input * look_sensitivity
	end

	local rotation = Unit.local_rotation(unit, 0)
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

CameraStateObserver._get_valid_players_to_observe = function (self)
	local player_manager = Managers.player
	local side_manager = Managers.state.side
	local player = self.camera_extension.player
	local unique_id = player:unique_id()
	local player_side = side_manager:get_side_from_player_unique_id(unique_id)
	local player_side_name = player_side:name()
	local side_settings = self._game_settings.side_settings
	local player_side_settings = side_settings and side_settings[player_side_name]
	local observe_sides = player_side_settings and player_side_settings.observe_sides

	if not observe_sides then
		return player_manager:players()
	end

	local allowed_players_to_observe = {}

	for _, side_name in ipairs(observe_sides) do
		local side = side_manager:get_side_from_name(side_name)

		for _, player_unit in ipairs(side.PLAYER_AND_BOT_UNITS) do
			local other_player = player_manager:owner(player_unit)
			local other_unique_id = other_player:unique_id()

			if unique_id ~= other_unique_id then
				allowed_players_to_observe[other_unique_id] = other_player
			end
		end
	end

	return allowed_players_to_observe
end

CameraStateObserver.follow_next_unit = function (self)
	local players = self:_get_valid_players_to_observe()
	local observed_player_id = self._observed_player_id
	local follow_unit = nil

	for i = 1, table.size(players), 1 do
		if players[observed_player_id] then
			observed_player_id = next(players, observed_player_id)
			observed_player_id = not observed_player_id and next(players) and next(players)
			local player = players[observed_player_id]
			local player_unit = player.player_unit

			if Unit.alive(player_unit) then
				follow_unit = player_unit

				break
			end
		end
	end

	self:_set_follow_unit(observed_player_id, follow_unit)
end

CameraStateObserver.follow_previous_unit = function (self)
	local players = self:_get_valid_players_to_observe()
	local observed_player_id = self._observed_player_id
	local current_player_id, current_player, previous_player_id, previous_player_unit = nil

	repeat
		current_player_id, current_player = next(players, current_player_id)

		if current_player_id == observed_player_id and previous_player_id then
			break
		elseif current_player_id then
			local player_unit = current_player.player_unit

			if Unit.alive(player_unit) then
				previous_player_id = current_player_id
				previous_player_unit = player_unit
			end
		end
	until current_player_id == nil

	self:_set_follow_unit(previous_player_id, previous_player_unit)
end

CameraStateObserver._set_follow_unit = function (self, observed_player_id, follow_unit)
	local snap_camera = nil

	if follow_unit then
		local unit = self.unit
		local camera_extension = self.camera_extension
		local viewport_name = camera_extension.viewport_name
		local root_look_dir = Vector3.normalize(Vector3.flat(Quaternion.forward(Unit.local_rotation(follow_unit, 0))))
		local yaw = math.atan2(root_look_dir.y, root_look_dir.x)
		local camera_manager = Managers.state.camera

		camera_manager:set_pitch_yaw(viewport_name, -0.6, yaw)
		Unit.set_data(unit, "camera", "settings_node", "observer")

		local current_position = Unit.world_position(unit, 0)
		local follow_unit_position = Unit.world_position(follow_unit, 0)
		local distance = Vector3.distance(current_position, follow_unit_position)

		if distance > 50 then
			snap_camera = true
		end
	end

	observed_player_id = follow_unit and observed_player_id
	self._follow_unit = follow_unit
	self._snap_camera = snap_camera
	self._observed_player_id = observed_player_id

	self.camera_extension:set_observed_player_id(observed_player_id)

	if not self._is_server then
		local player_to_observe = Managers.player:player_from_unique_id(observed_player_id)

		if player_to_observe then
			local player_to_observe_go_id = player_to_observe.game_object_id
			local local_player = Managers.player:local_player()
			local local_player_go_id = local_player.game_object_id

			self._network_transmit:send_rpc_server("rpc_set_observed_player_id", local_player_go_id, player_to_observe_go_id)
		end
	end
end

return
