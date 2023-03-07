local camera_state_observer_testify = script_data.testify and require("scripts/unit_extensions/camera/states/camera_state_observer_testify")
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
	local external_state_change = camera_extension.external_state_change
	local external_state_change_params = camera_extension.external_state_change_params

	if external_state_change and external_state_change ~= self.name then
		csm:change_state(external_state_change, external_state_change_params)
		camera_extension:set_external_state_change(nil)

		return
	end

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

	local follow_unit = self._follow_unit
	local follow_node = Unit.node(follow_unit, self._follow_node_name)
	local snap_camera = self._snap_camera

	CameraStateHelper.set_camera_rotation(unit, camera_extension)
	CameraStateHelper.set_follow_camera_position(unit, follow_unit, follow_node, nil, snap_camera, dt)

	self._snap_camera = false

	if script_data.testify then
		Testify:poll_requests_through_handler(camera_state_observer_testify, self)
	end
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
		local valid_players = {}
		local players = player_manager:players()

		for _, player in pairs(players) do
			if player.player_unit and ALIVE[player.player_unit] then
				valid_players[#valid_players + 1] = player
			end
		end

		return valid_players
	end

	local allowed_players_to_observe = {}

	for side_name, is_allowed_func in pairs(observe_sides) do
		if is_allowed_func() then
			local side = side_manager:get_side_from_name(side_name)

			for _, player_unit in ipairs(side:player_units()) do
				local other_player = player_manager:owner(player_unit)
				local other_unique_id = other_player:unique_id()
				allowed_players_to_observe[other_unique_id] = other_player
			end
		end
	end

	local allowed_num_players = table.size(allowed_players_to_observe)

	return allowed_num_players > 0 and allowed_players_to_observe or nil
end

CameraStateObserver.follow_next_unit = function (self)
	local players = self:_get_valid_players_to_observe()

	if not players or table.is_empty(players) then
		return false
	end

	local observed_player_id = self._observed_player_id
	local follow_unit = nil
	local num_players = table.size(players)

	for i = 1, num_players do
		if players[observed_player_id] then
			observed_player_id = next(players, observed_player_id)

			if not observed_player_id then
				observed_player_id = next(players)
			end
		else
			observed_player_id = next(players)
		end

		local player = players[observed_player_id]
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			follow_unit = player_unit

			break
		end
	end

	return self:_set_follow_unit(observed_player_id, follow_unit)
end

CameraStateObserver.follow_previous_unit = function (self)
	local players = self:_get_valid_players_to_observe()

	if not players then
		return false
	end

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

	return self:_set_follow_unit(previous_player_id, previous_player_unit)
end

CameraStateObserver._set_follow_unit = function (self, observed_player_id, follow_unit)
	if not follow_unit or not Unit.alive(follow_unit) then
		return false
	end

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

	return true
end
