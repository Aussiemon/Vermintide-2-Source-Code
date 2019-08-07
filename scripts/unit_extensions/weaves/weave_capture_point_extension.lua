WeaveCapturePointExtension = class(WeaveCapturePointExtension)
WeaveCapturePointExtension.NAME = "WeaveCapturePointExtension"

WeaveCapturePointExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._extension_init_context = extension_init_context
	self._extension_init_data = extension_init_data
	self._is_server = extension_init_context.is_server
	self._objective_name = extension_init_data.objective_name
	self._score = extension_init_data.score or 0
	self._game_object_id = nil
	self._unit = unit
	self._is_already_inside = false
	self._num_players = 0
	self._num_players_required = 0
	self._on_start_func = extension_init_data.on_start_func
	self._on_enter_func = extension_init_data.on_enter_func
	self._on_progress_func = extension_init_data.on_progress_func
	self._on_exit_func = extension_init_data.on_exit_func
	self._on_complete_func = extension_init_data.on_complete_func
	self._percentage_of_players_required = extension_init_data.percentage_of_players_required or 0.25
	self._timer_recharge_per_second = extension_init_data.timer_recharge_per_second or 0
	self._max_time = extension_init_data.timer or 45
	self._capture_rate_multiplier = extension_init_data.capture_rate_multiplier or 5
	self._timer = self._max_time
	self._weave_objective_system = Managers.state.entity:system("weave_objective_system")
	local scale = extension_init_data.scale

	Unit.set_local_scale(unit, 0, scale)

	local terror_event_spawner_id = extension_init_data.terror_event_spawner_id

	Unit.set_data(unit, "terror_event_spawner_id", terror_event_spawner_id)
	self:_calculate_size()
end

WeaveCapturePointExtension.get_objective_settings = function (self)
	return WeaveObjectiveSettings[WeaveCapturePointExtension.NAME]
end

WeaveCapturePointExtension.score = function (self)
	return self._score
end

WeaveCapturePointExtension._calculate_size = function (self)
	local scale = Unit.local_scale(self._unit, 0)
	local _, extents = Unit.box(self._unit)

	if extents[2] < extents[1] then
		self._size = extents[1] * scale[1]
	else
		self._size = extents[2] * scale[2]
	end
end

WeaveCapturePointExtension.activate = function (self, game_object_id, objective_data)
	local extension = ScriptUnit.has_extension(self._unit, "tutorial_system")

	if extension then
		extension:set_active(true)
	end

	if self._is_server then
		local game_object_data_table = {
			value = 0,
			go_type = NetworkLookup.go_types.weave_objective,
			objective_name = NetworkLookup.weave_objective_names[self._objective_name]
		}
		local callback = callback(self, "cb_game_session_disconnect")
		self._game_object_id = Managers.state.network:create_game_object("weave_objective", game_object_data_table, callback)
	else
		self._game_object_id = game_object_id
		self._current_value = 0
		self._lerp_step = 0
		self._new_value = 0
	end

	local mesh = Unit.mesh(self._unit, "g_projector002")
	self._material = Mesh.material(mesh, "projector")
	local frame_color, runes_color = nil
	local wind = Managers.weave:get_active_wind()
	self._wind = wind

	if wind == "fire" then
		frame_color = Vector3(0.5, 0.3, 0.1)
		runes_color = Vector3(1, 0.1, 0)
	elseif wind == "beasts" then
		frame_color = Vector3(0.4, 0.1, 0.02)
		runes_color = Vector3(0.72, 0.5, 0.4)
	elseif wind == "death" then
		frame_color = Vector3(0.2, 0.15, 0.2)
		runes_color = Vector3(0.5, 0.25, 1)
	elseif wind == "heavens" then
		frame_color = Vector3(0.2, 0.4, 1)
		runes_color = Vector3(0.8, 0.8, 0.6)
	elseif wind == "light" then
		frame_color = Vector3(0.5, 0.72, 0.85)
		runes_color = Vector3(1, 1, 1)
	elseif wind == "shadow" then
		frame_color = Vector3(0.35, 0.35, 0.35)
		runes_color = Vector3(0.1, 0.1, 0.1)
	elseif wind == "life" then
		frame_color = Vector3(0.2, 0.35, 0.15)
		runes_color = Vector3(0.3, 0.75, 0)
	elseif wind == "metal" then
		frame_color = Vector3(0.5, 0.5, 0.3)
		runes_color = Vector3(1, 0.5, 0)
	end

	Material.set_vector3(self._material, "runes_color", runes_color)
	Material.set_vector3(self._material, "frame_color", frame_color)
	Material.set_scalar(self._material, "radial_cutoff", self:get_percentage_done())

	if self._is_server then
		self._num_start_players = Managers.weave:get_num_players()

		self:_update_num_players_required(self._num_start_players)

		local num_extra_players = self._num_start_players - self._num_players_required

		if num_extra_players == 0 then
			num_extra_players = 1
		end

		self._capture_rate_multiplier = 1 / num_extra_players
	end
end

WeaveCapturePointExtension.complete = function (self)
	local audio_system = Managers.state.entity:system("audio_system")

	audio_system:play_audio_unit_event("Play_winds_gameplay_capture_success", self._unit)

	if self._on_complete_func then
		self._on_complete_func(self._unit)
	end

	self:deactivate()
end

WeaveCapturePointExtension.deactivate = function (self)
	if self._is_server then
		local game_session = Network.game_session()

		if game_session then
			GameSession.destroy_game_object(game_session, self._game_object_id)
		end
	end

	local size = self._size

	for i = 1, size * 15, 1 do
		local x_offset = math.random(-size * 10, size * 10) / 10
		local y_offset = math.random(-size * 10, size * 10) / 10
		local unit_position = Unit.local_position(self._unit, 0)
		local spawn_pos = unit_position + Vector3(x_offset, y_offset, 0)

		self._weave_objective_system:spawn_essence_unit(spawn_pos)
	end

	self._game_object_id = nil
end

WeaveCapturePointExtension.cb_game_session_disconnect = function (self)
	return
end

WeaveCapturePointExtension.objective_name = function (self)
	return self._objective_name
end

WeaveCapturePointExtension.update = function (self, dt, t)
	if not self._game_object_id then
		return
	end

	if self._is_server then
		self:_server_update(dt, t)
	else
		self:_client_update(dt, t)
	end
end

WeaveCapturePointExtension._update_num_players_required = function (self, num_players)
	local percentage = self._percentage_of_players_required
	local num_players_req = math.floor(num_players * percentage)
	self._num_players_required = (num_players_req == 0 and 1) or num_players_req
	self._num_players = num_players
end

WeaveCapturePointExtension._server_update = function (self, dt, t)
	local position = Unit.local_position(self._unit, 0)
	local num_players_inside = 0
	local players = Managers.player:human_players()
	local inside_radius = self._size * self._size
	local num_players_disabled = 0

	for _, player in pairs(players) do
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local status_extension = ScriptUnit.has_extension(player_unit, "status_system")

			if status_extension:is_disabled() then
				num_players_disabled = num_players_disabled + 1
			else
				local player_position = POSITION_LOOKUP[player_unit]
				local distance = Vector3.distance_squared(position, player_position)

				if distance <= inside_radius then
					num_players_inside = num_players_inside + 1
				end
			end
		end
	end

	local num_players = Managers.player:num_human_players()

	if self._num_players ~= num_players then
		self:_update_num_players_required(num_players)
	end

	local new_time = nil
	local num_players_required = self._num_players_required

	if num_players_required <= num_players_inside then
		if not self._is_already_inside then
			if self._on_start_func then
				self._on_start_func(self._unit)

				self._on_start_func = nil
			end

			if self._on_enter_func then
				self._on_enter_func(self._unit)
			end

			local audio_system = Managers.state.entity:system("audio_system")

			audio_system:play_audio_unit_event("Play_winds_gameplay_capture_loop", self._unit)

			self._is_already_inside = true
		end

		local capture_rate = nil

		if num_players_inside == self._num_start_players and num_players_inside == num_players_required then
			capture_rate = 1 + self._capture_rate_multiplier
		else
			capture_rate = 1 + self._capture_rate_multiplier * (num_players_inside - num_players_required)
		end

		new_time = math.clamp(self._timer - dt * capture_rate, 0, self._max_time)

		if self._on_progress_func then
			self._on_progress_func(self._unit, self._timer, self._max_time)
		end
	else
		if self._is_already_inside then
			if self._on_exit_func then
				self._on_exit_func(self._unit)
			end

			local audio_system = Managers.state.entity:system("audio_system")

			audio_system:play_audio_unit_event("Stop_winds_gameplay_capture_loop", self._unit)

			self._is_already_inside = false
		end

		new_time = math.clamp(self._timer + self._timer_recharge_per_second * dt, 0, self._max_time)
	end

	if new_time ~= self._timer then
		self._timer = new_time
		local percentage_done = self:get_percentage_done()

		Material.set_scalar(self._material, "radial_cutoff", percentage_done)

		local game_session = Network.game_session()

		if game_session and self._game_object_id then
			GameSession.set_game_object_field(game_session, self._game_object_id, "value", percentage_done * 100)
		end
	end
end

WeaveCapturePointExtension._client_update = function (self, dt, t)
	local game_session = Network.game_session()

	if not game_session then
		return
	end

	local value = GameSession.game_object_field(game_session, self._game_object_id, "value")

	if self._new_value < value then
		value = (value + 2) * 0.01
	end

	if value ~= self._new_value then
		self._current_value = math.lerp(self._current_value, self._new_value, self._lerp_step)
		self._new_value = value
		self._lerp_step = 0
	end

	if self._current_value == self._new_value then
		return
	end

	self._lerp_step = math.clamp(self._lerp_step + dt, 0, 1)

	if self._lerp_step > 1 then
		self._current_value = self._new_value
	end

	local lerp = math.lerp(self._current_value, self._new_value, self._lerp_step)

	Material.set_scalar(self._material, "radial_cutoff", lerp)
end

WeaveCapturePointExtension.is_done = function (self)
	return self._timer <= 0
end

WeaveCapturePointExtension.get_percentage_done = function (self)
	return math.clamp(1 - self._timer / self._max_time, 0, 1)
end

WeaveCapturePointExtension.get_score = function (self)
	return self._score
end

return
