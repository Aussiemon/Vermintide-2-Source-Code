-- chunkname: @scripts/unit_extensions/weaves/weave_capture_point_extension.lua

WeaveCapturePointExtension = class(WeaveCapturePointExtension, BaseObjectiveExtension)
WeaveCapturePointExtension.NAME = "WeaveCapturePointExtension"

local CLIENT_PROGRESS_BUFFER_SIZE = 10

WeaveCapturePointExtension.init = function (self, extension_init_context, unit, extension_init_data)
	WeaveCapturePointExtension.super.init(self, extension_init_context, unit, extension_init_data)

	self._is_already_inside = false
	self._num_players = 0
	self._num_players_required = 0
	self._on_start_func = extension_init_data.on_start_func
	self._on_enter_func = extension_init_data.on_enter_func
	self._on_progress_func = extension_init_data.on_progress_func
	self._on_exit_func = extension_init_data.on_exit_func
	self._on_complete_func = extension_init_data.on_complete_func
	self._percentage_of_players_required = extension_init_data.percentage_of_players_required or 0.25
	self._max_time = extension_init_data.timer or 45
	self._capture_rate_multiplier = extension_init_data.capture_rate_multiplier or 5
	self._timer = self._max_time

	if not self._is_server then
		self._progress_buffer_index = 0
		self._client_progress_buffer = {}
	end

	local terror_event_spawner_id = extension_init_data.terror_event_spawner_id

	Unit.set_data(unit, "terror_event_spawner_id", terror_event_spawner_id)
	self:_calculate_size()

	self._last_set_value = 0
	self._latest_value = 0
	self._predicted_value = 0
end

WeaveCapturePointExtension.display_name = function (self)
	return "objective_capture_points_name_single"
end

WeaveCapturePointExtension._calculate_size = function (self)
	local scale = Unit.local_scale(self._unit, 0)
	local _, extents = Unit.box(self._unit)

	if extents[1] > extents[2] then
		self._size = extents[1] * scale[1]
	else
		self._size = extents[2] * scale[2]
	end
end

WeaveCapturePointExtension._set_objective_data = function (self, objective_data)
	return
end

WeaveCapturePointExtension._activate = function (self)
	local extension = ScriptUnit.has_extension(self._unit, "tutorial_system")

	if extension then
		extension:set_active(true)
	end

	local mesh = Unit.mesh(self._unit, "g_projector002")

	self._material = Mesh.material(mesh, "projector")

	local frame_color, runes_color
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

		num_extra_players = num_extra_players == 0 and 1 or num_extra_players
		self._capture_rate_multiplier = 1 / num_extra_players
	end
end

WeaveCapturePointExtension.complete = function (self, ...)
	WeaveCapturePointExtension.super.complete(self, ...)

	local audio_system = Managers.state.entity:system("audio_system")

	audio_system:play_audio_unit_event("Play_winds_gameplay_capture_success", self._unit)
end

WeaveCapturePointExtension._deactivate = function (self)
	local size = self._size

	for i = 1, size * 15 do
		local x_offset = math.random(-size * 10, size * 10) / 10
		local y_offset = math.random(-size * 10, size * 10) / 10
		local unit_position = Unit.local_position(self._unit, 0)
		local spawn_pos = unit_position + Vector3(x_offset, y_offset, 0)
		local objective_system = Managers.state.entity:system("objective_system")
		local weave_essence_handler = objective_system:weave_essence_handler()

		weave_essence_handler:spawn_essence_unit(spawn_pos)
	end
end

WeaveCapturePointExtension._update_num_players_required = function (self, num_players)
	local percentage = self._percentage_of_players_required
	local num_players_req = math.floor(num_players * percentage)

	self._num_players_required = num_players_req == 0 and 1 or num_players_req
	self._num_players = num_players
end

WeaveCapturePointExtension._server_update = function (self, dt, t)
	local position = Unit.local_position(self._unit, 0)
	local num_players_inside = 0
	local side = Managers.state.side:get_side_from_name("heroes")
	local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
	local inside_radius = self._size * self._size
	local num_players_disabled = 0

	for _, unit in pairs(player_and_bot_units) do
		if Unit.alive(unit) then
			local status_extension = ScriptUnit.has_extension(unit, "status_system")

			if status_extension:is_disabled() then
				num_players_disabled = num_players_disabled + 1
			else
				local player_position = POSITION_LOOKUP[unit]
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

	local new_time = self._timer
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

		local capture_rate

		if num_players_inside == self._num_start_players and num_players_inside == num_players_required then
			capture_rate = 1 + self._capture_rate_multiplier
		else
			capture_rate = 1 + self._capture_rate_multiplier * (num_players_inside - num_players_required)
		end

		new_time = math.clamp(self._timer - dt * capture_rate, 0, self._max_time)

		if self._on_progress_func then
			self._on_progress_func(self._unit, self._timer, self._max_time)
		end
	elseif self._is_already_inside then
		if self._on_exit_func then
			self._on_exit_func(self._unit)
		end

		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_unit_event("Stop_winds_gameplay_capture_loop", self._unit)

		self._is_already_inside = false
	end

	if new_time ~= self._timer then
		self._timer = new_time

		local percentage_done = self:get_percentage_done()

		Material.set_scalar(self._material, "radial_cutoff", percentage_done)
		self:server_set_value(percentage_done)
	end
end

WeaveCapturePointExtension._client_average_progress_speed = function (self)
	local buffer = self._client_progress_buffer
	local buffer_size = #buffer

	if buffer_size == 0 then
		return 0
	end

	local buffer_start = math.index_wrapper(self._progress_buffer_index + 1, buffer_size)
	local last_value = buffer[buffer_start] and buffer[buffer_start].value
	local last_t = buffer[buffer_start] and buffer[buffer_start].t
	local average_speed = 0

	for i = 1, buffer_size - 1 do
		local buffer_idx = math.index_wrapper(buffer_start + i, buffer_size)
		local data = buffer[buffer_idx]
		local value = data.value
		local t = data.t

		average_speed = average_speed + (value - last_value) / (t - last_t)
		last_value = value
		last_t = t
	end

	return average_speed / buffer_size
end

WeaveCapturePointExtension._client_register_value_progress = function (self, value, t)
	self._progress_buffer_index = math.index_wrapper(self._progress_buffer_index + 1, CLIENT_PROGRESS_BUFFER_SIZE)

	local data = self._client_progress_buffer[self._progress_buffer_index] or {}

	data.value = value
	data.t = t
	self._client_progress_buffer[self._progress_buffer_index] = data
end

WeaveCapturePointExtension._client_update = function (self, dt, t)
	local real_value = self:client_get_value()

	if real_value > self._latest_value then
		self:_client_register_value_progress(real_value, t)

		self._latest_value = real_value
	end

	local predict_limit = 1
	local speed = self:_client_average_progress_speed()
	local predicted_value = math.clamp(self._predicted_value + speed * dt, real_value, real_value + speed * predict_limit)

	self._predicted_value = predicted_value

	local set_value = math.lerp(self._last_set_value, predicted_value, dt)

	self._last_set_value = set_value

	Material.set_scalar(self._material, "radial_cutoff", set_value)
end

WeaveCapturePointExtension.get_percentage_done = function (self)
	return math.clamp(1 - self._timer / self._max_time, 0, 1)
end
