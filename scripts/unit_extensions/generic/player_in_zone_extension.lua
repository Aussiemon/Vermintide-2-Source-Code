PlayerInZoneExtension = class(PlayerInZoneExtension)

PlayerInZoneExtension.init = function (self, extension_init_context, unit)
	self._unit = unit

	self:_get_script_data()

	self._world = extension_init_context.world
	self._extension_init_context = extension_init_context
	self._activated = false
	self._state = "_idle"
	self._client_state = "progress_inactive"
	self._is_server = extension_init_context.is_server
	self._state_data = {}
	self._closest_player_distance = math.huge
	self._player_distances = {}
	self._progress_time = 0
	self._unit_in_progress = false
	self._state_data.end_progression_timer = 0
	self._progress_is_frozen = false
	self._game = Managers.state.network:game()
	self._has_register_count_up = false
	self._has_been_in_zone = false
	self._progression_percentage = {}

	for i = 1, 3 do
		self._progression_percentage[i * 25] = false
	end
end

PlayerInZoneExtension._get_script_data = function (self)
	self._num_player_in_zone = Unit.get_data(self._unit, "player_in_zone", "num_player_in_zone")
	self._animation_time = Unit.get_data(self._unit, "player_in_zone", "start_stop_animation_time")
	self._timer = Unit.get_data(self._unit, "player_in_zone", "timer")
	self._progress_bar_countdown = Unit.get_data(self._unit, "player_in_zone", "progression_countdown")
	self._progress_bar_smooth_back = Unit.get_data(self._unit, "player_in_zone", "progress_bar_smooth_back")
	self._progress_bar_freeze = Unit.get_data(self._unit, "player_in_zone", "progress_bar_freeze")
	self._show_progress_bar_global = Unit.get_data(self._unit, "player_in_zone", "show_progress_bar_global")
	self._show_progress_bar_personal = Unit.get_data(self._unit, "player_in_zone", "show_progress_bar_personal")
	self._progress_zone_size = Unit.get_data(self._unit, "player_in_zone", "zone_radius")
	local time_modifier_has_data = Unit.has_data(self._unit, "player_in_zone", "time_modifier_per_player")
	self._time_modifier_per_player = time_modifier_has_data and Unit.get_data(self._unit, "player_in_zone", "time_modifier_per_player") or 0
	local player_side = Unit.get_data(self._unit, "player_in_zone", "player_side")
	local side_name = player_side or "heroes"
	local side = Managers.state.side:get_side_from_name(side_name)
	self._player_units = side.PLAYER_UNITS
end

PlayerInZoneExtension._create_game_object = function (self)
	local level = LevelHelper:current_level(self._world)
	self._level_unit_index = Level.unit_index(level, self._unit)
	local go_data_table = {
		progress_time = 0,
		go_type = NetworkLookup.go_types.progress_timer,
		level_unit_index = self._level_unit_index,
		unit_in_progress = self._unit_in_progress,
		progress_is_frozen = self._progress_is_frozen,
		counting_up = self._progress_bar_countdown
	}
	local callback = callback(self, "cb_game_session_disconnect")
	self._go_id = Managers.state.network:create_game_object("progress_timer", go_data_table, callback)
end

PlayerInZoneExtension.cb_game_session_disconnect = function (self)
	self._go_id = nil
end

PlayerInZoneExtension.on_game_object_created = function (self, go_id)
	self._go_id = go_id
end

PlayerInZoneExtension.on_game_object_destroyed = function (self)
	self._go_id = nil
end

PlayerInZoneExtension.extensions_ready = function (self)
	if not self._is_server then
		return
	end

	if Managers.state.network:in_game_session() then
		self:_create_game_object()
	else
		self._waiting_for_game_session = true
	end
end

PlayerInZoneExtension.activated = function (self)
	return self._activated
end

PlayerInZoneExtension._current_time = function (self)
	return self._state_data.end_progression_timer
end

PlayerInZoneExtension.should_progress_count_down = function (self)
	return self._progress_bar_countdown
end

PlayerInZoneExtension.progress_bar_personal = function (self)
	return self._show_progress_bar_personal
end

PlayerInZoneExtension.progress_bar_global = function (self)
	return self._show_progress_bar_global
end

PlayerInZoneExtension.player_been_in_zone = function (self)
	return self._has_been_in_zone
end

PlayerInZoneExtension.progress = function (self)
	return self._state_data.end_progression_timer
end

PlayerInZoneExtension.update = function (self, unit, input, dt, context, t)
	if not self._activated then
		return
	end

	self:_update_distances()

	if self._is_server then
		self:_update_state(dt, t)
	else
		self:_update_client(dt)
	end
end

PlayerInZoneExtension._update_client = function (self, dt)
	local go_id = self._go_id

	if not go_id then
		return
	end

	local game = self._game
	local progress_time = GameSession.game_object_field(game, go_id, "progress_time")
	local unit_in_progress = GameSession.game_object_field(game, go_id, "unit_in_progress")
	local counting_up = GameSession.game_object_field(game, go_id, "counting_up")
	local progress_is_frozen = GameSession.game_object_field(game, go_id, "progress_is_frozen")
	local state = self._client_state

	if state == "progress_inactive" then
		if unit_in_progress then
			self._client_state = "progress_active"
			self._state_data.end_progression_timer = progress_time

			self:_trigger_start_events()
		end
	elseif state == "progress_active" then
		if not self._has_been_in_zone and self:_local_player_in_zone() then
			self._has_been_in_zone = true
		end

		if progress_is_frozen then
			self._state_data.end_progression_timer = progress_time
		else
			self:_client_progress(counting_up, progress_time, dt)
		end

		if not unit_in_progress then
			self._client_state = "progress_inactive"

			self:_client_unit_inactive(progress_time)
		end
	end

	self:_check_progress_percent(self._state_data.end_progression_timer)
end

PlayerInZoneExtension._client_unit_inactive = function (self, progress_time)
	self._state_data.end_progression_timer = progress_time
	self._progress_time = progress_time
	self._has_been_in_zone = false

	self:_trigger_stop_events()
end

PlayerInZoneExtension._client_progress = function (self, counting_up, progress_time, dt)
	if counting_up then
		local _, num_players = self:_fulfill_in_zone_check()
		self._state_data.end_progression_timer = self:_count_up(dt, num_players)
	else
		self._state_data.end_progression_timer = self:_count_down(dt)
	end
end

PlayerInZoneExtension.set_active = function (self)
	if self._activated then
		return
	end

	local network_manager = Managers.state.network
	local unit_index = LevelHelper:unit_index(self._world, self._unit)

	if self._is_server then
		if unit_index then
			network_manager.network_transmit:send_rpc_clients("rpc_player_in_zone_set_active", unit_index)
		end
	elseif unit_index then
		network_manager.network_transmit:send_rpc_server("rpc_player_in_zone_set_active", unit_index)
	end

	self:set_active_rpc()
end

PlayerInZoneExtension.set_active_rpc = function (self)
	self._activated = true
end

PlayerInZoneExtension._update_state = function (self, dt, t)
	self[self._state](self, dt, t, self._state_data)
end

PlayerInZoneExtension.hot_join_sync = function (self, peer_id)
	if self._activated then
		local network_manager = Managers.state.network
		local unit_index = LevelHelper:unit_index(self._world, self._unit)

		if unit_index then
			network_manager.network_transmit:send_rpc("rpc_player_in_zone_set_active", peer_id, unit_index)
		end
	end
end

PlayerInZoneExtension.destroy = function (self)
	local network_event_delegate = Managers.state.network.network_transmit.network_event_delegate

	network_event_delegate:unregister(self)
end

PlayerInZoneExtension._update_distances = function (self)
	local unit_pos = Unit.local_position(self._unit, 0)
	local human_players = self._player_units
	local player_distances = self._player_distances

	table.clear(player_distances)

	local closest_player_distance = math.huge

	for _, unit in pairs(human_players) do
		local player_pos = POSITION_LOOKUP[unit]

		if player_pos then
			local distance_squared = Vector3.distance_squared(unit_pos, player_pos)

			if distance_squared < closest_player_distance then
				closest_player_distance = distance_squared
			end

			player_distances[unit] = distance_squared
		end
	end

	self._closest_player_distance = closest_player_distance
end

PlayerInZoneExtension._idle = function (self, dt, t)
	if self:_fulfill_in_zone_check() then
		self._state = "_progress_check"
	end
end

PlayerInZoneExtension._fulfill_in_zone_check = function (self)
	local progress_zone_size = self._progress_zone_size * self._progress_zone_size
	local closest_player = self._closest_player_distance

	if closest_player > progress_zone_size then
		return false, 0
	end

	local players_in_zone = 0
	local total_players = 0

	for _, distance_squared in pairs(self._player_distances) do
		total_players = total_players + 1

		if distance_squared < progress_zone_size then
			players_in_zone = players_in_zone + 1
		end
	end

	local all_inside = total_players == players_in_zone

	return all_inside or self._num_player_in_zone <= players_in_zone, players_in_zone
end

PlayerInZoneExtension._local_player_in_zone = function (self)
	local player = Managers.player:local_player()

	if not player then
		return false
	end

	local player_unit = player.player_unit

	if not player_unit then
		return false
	end

	local player_distance = self._player_distances[player_unit]

	if not player_distance then
		return false
	end

	local progress_zone_size = self._progress_zone_size * self._progress_zone_size

	if player_distance > progress_zone_size then
		return false
	end

	return true
end

PlayerInZoneExtension._progress_frozen = function (self)
	local fulfill_in_zone_check, _ = self:_fulfill_in_zone_check()

	if fulfill_in_zone_check then
		self._state = "_progress_check"
	end

	local go_id = self._go_id
	local game = self._game

	if go_id and not GameSession.game_object_field(game, go_id, "progress_is_frozen") then
		GameSession.set_game_object_field(game, go_id, "progress_is_frozen", true)
	end
end

PlayerInZoneExtension._progress_check = function (self, dt, t)
	local go_id = self._go_id
	local game = self._game
	local new_state = nil

	if not self._progress_check_entered then
		self._progress_check_entered = true

		if go_id then
			if not GameSession.game_object_field(game, go_id, "unit_in_progress") then
				GameSession.set_game_object_field(game, go_id, "unit_in_progress", true)
			end

			if GameSession.game_object_field(game, go_id, "progress_is_frozen") then
				GameSession.set_game_object_field(game, go_id, "progress_is_frozen", false)
			end
		end

		self:_trigger_start_events()
	end

	local fulfill_in_zone_check, num_players = self:_fulfill_in_zone_check()

	if fulfill_in_zone_check then
		if not self._has_register_count_up then
			self._has_register_count_up = true

			self:_register_count_up(true)
		end

		if not self._has_been_in_zone and self:_local_player_in_zone() then
			self._has_been_in_zone = true
		end

		self._state_data.end_progression_timer = self:_count_up(dt, num_players)

		if self._state_data.end_progression_timer == 1 then
			new_state = "_progress_finished"
		end
	else
		if self._progress_bar_smooth_back then
			if self._has_register_count_up then
				self._has_register_count_up = false

				self:_register_count_up(false)
			end

			self._state_data.end_progression_timer = self:_count_down(dt)
		elseif self._progress_bar_freeze then
			new_state = "_progress_frozen"
		else
			self._state_data.end_progression_timer = 0
		end

		if self._state_data.end_progression_timer == 0 then
			if go_id and GameSession.game_object_field(game, go_id, "unit_in_progress") then
				GameSession.set_game_object_field(game, go_id, "unit_in_progress", false)
			end

			new_state = "_idle"
		end
	end

	self:_check_progress_percent(self._state_data.end_progression_timer)

	if go_id then
		GameSession.set_game_object_field(game, go_id, "progress_time", self._state_data.end_progression_timer)
	end

	if new_state then
		if new_state ~= "_progress_frozen" then
			self._has_been_in_zone = false

			self:_trigger_stop_events()
		end

		self._progress_check_entered = nil
		self._state = new_state
	end
end

PlayerInZoneExtension._progress_finished = function (self)
	local network_manager = Managers.state.network
	local unit_id = LevelHelper:unit_index(self._world, self._unit)

	network_manager.network_transmit:send_rpc_clients("rpc_player_in_zone_end_event", unit_id)
	self:end_event()
end

PlayerInZoneExtension._trigger_start_events = function (self)
	Managers.state.event:trigger("start_progression_zone", self._unit, self)
	Unit.flow_event(self._unit, "lua_start_progression")
end

PlayerInZoneExtension._trigger_stop_events = function (self)
	Managers.state.event:trigger("stop_progression_zone", self._unit, self)
	Unit.flow_event(self._unit, "lua_stop_progression")
end

PlayerInZoneExtension._check_progress_percent = function (self, end_progression_timer)
	local progression_percentage = self._progression_percentage
	local unit = self._unit

	for percent, is_triggerd in pairs(self._progression_percentage) do
		local small_percent = percent / 100

		if end_progression_timer > small_percent and not is_triggerd then
			Unit.flow_event(unit, "lua_check_progression_" .. percent .. "_start")

			progression_percentage[percent] = true
		elseif end_progression_timer < small_percent and is_triggerd then
			Unit.flow_event(unit, "lua_check_progression_" .. percent .. "_stop")

			progression_percentage[percent] = false
		end
	end
end

PlayerInZoneExtension._count_up = function (self, dt, num_players)
	local timer = self._timer
	local time_tweak_modifier = 1

	if num_players and num_players > 1 then
		time_tweak_modifier = time_tweak_modifier + self._time_modifier_per_player * num_players
	end

	return math.clamp(self:_current_time() + dt / timer * time_tweak_modifier, 0, 1)
end

PlayerInZoneExtension._count_down = function (self, dt)
	local timer = self._timer

	return math.clamp(self:_current_time() - dt / timer, 0, 1)
end

PlayerInZoneExtension._reset = function (self)
	self._activated = false

	Managers.state.event:trigger("stop_progression_zone", self._unit)

	self._state_data.end_progression_timer = 0

	self:_check_progress_percent(self._state_data.end_progression_timer)

	if self._is_server then
		local go_id = self._go_id

		if go_id then
			local game = self._game

			GameSession.set_game_object_field(game, go_id, "progress_time", self._state_data.end_progression_timer)
		end
	end
end

PlayerInZoneExtension.end_event = function (self)
	self:_reset()
	Unit.flow_event(self._unit, "lua_start_end_event")
end

PlayerInZoneExtension._register_count_up = function (self, is_counting_up)
	local go_id = self._go_id
	local game = self._game

	GameSession.set_game_object_field(game, go_id, "counting_up", is_counting_up)
end

PlayerInZoneExtension._debug_drawer = function (self, current_debug_state)
	if current_debug_state == "counting" then
		self._drawer = self._drawer or Managers.state.debug:drawer({
			mode = "immediate"
		})

		self._drawer:reset()

		local timer_progress = self._state_data.end_progression_timer
		local red = math.lerp(1, 0, timer_progress) * 255
		local green = math.lerp(0, 1, timer_progress) * 255

		self._drawer:sphere(Unit.local_position(self._unit, 0), self._progress_zone_size, Color(red, green, 0), 30, 30)
	elseif current_debug_state == "stop" then
		self._drawer = self._drawer or Managers.state.debug:drawer({
			mode = "immediate"
		})

		self._drawer:reset()
		self._drawer:sphere(Unit.local_position(self._unit, 0), self._progress_zone_size, Color(255, 255, 0), 10, 10)
	elseif current_debug_state == "idle" then
		self._drawer = self._drawer or Managers.state.debug:drawer({
			mode = "immediate"
		})

		self._drawer:reset()
		self._drawer:sphere(Unit.local_position(self._unit, 0), self._progress_zone_size, Color(255, 255, 0), 30, 30)
	end
end
