HordeSurgeHandler = class(HordeSurgeHandler)
local RPCS = {
	"rpc_horde_surge_freeze",
	"rpc_horde_surge_set_level"
}

HordeSurgeHandler.init = function (self, is_server, world, events, seed, activate_on_init)
	self._is_server = is_server
	self._world = world

	if not events then
		self.disabled = true
	end

	self._events = events
	self._current_event = nil
	self._seed = seed
	self._level_index = 0
	self._current_terror_event_index = 0
	self._end_time = nil
	self._start_time = 0
	self._freeze_time = 0
	self._frozen = false
	self._active = activate_on_init
	self._first_update = true
	self._time_modifier = 1
	self._game_object_id = nil
	self._progress = 0
	self._time_to_next = 0
	self._current_terror_event = nil

	if self._is_server then
		local game_object_data_table = {
			progress = 0,
			go_type = NetworkLookup.go_types.horde_surge
		}
		self._game_object_id = Managers.state.network:create_game_object("horde_surge", game_object_data_table)
	else
		self._target_progress = 0
		self._time_until_next_update = 0
		self._last_update_time = 0
	end
end

HordeSurgeHandler.register_rpcs = function (self, network_event_delegate, network_transmit)
	network_event_delegate:register(self, unpack(RPCS))

	self._network_event_delegate = network_event_delegate
	self._network_transmit = network_transmit
end

HordeSurgeHandler.unregister_rpcs = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil
	self._network_transmit = nil
end

HordeSurgeHandler.destroy = function (self)
	if self._is_server then
		local game_session = Network.game_session()

		GameSession.destroy_game_object(game_session, self._game_object_id)
	end
end

HordeSurgeHandler.server_update = function (self, t, dt)
	if not self._active or not self._game_object_id or script_data.disable_horde_surge or self.disabled then
		return
	end

	local game_session = Network.game_session()

	if not game_session then
		return
	end

	Profiler.start("HordeSurgeHandler")

	local frozen = self._freeze_time ~= 0

	if not frozen and self._events then
		if self._first_update then
			self:_next_level(t, game_session)

			self._first_update = false
		end

		if self._end_time < t then
			self:_trigger_event()
			self:_next_level(t, game_session)
		end

		self._time_to_next = self._end_time - t
		self._progress = (t - self._start_time) / (self._end_time - self._start_time) * 100

		GameSession.set_game_object_field(game_session, self._game_object_id, "progress", self._progress)
	else
		self._freeze_time = math.max(self._freeze_time - dt, 0)
	end

	self._frozen = frozen

	Profiler.stop("HordeSurgeHandler")
end

HordeSurgeHandler.client_update = function (self, t, dt)
	if not self._game_object_id or script_data.disable_horde_surge or self.disabled then
		return
	end

	local game_session = Network.game_session()

	if not game_session then
		return
	end

	Profiler.start("HordeSurgeHandler")

	local host_progress = GameSession.game_object_field(game_session, self._game_object_id, "progress")

	if host_progress < self._target_progress then
		self._target_progress = 0
		self._progress = 0
	end

	if host_progress ~= self._target_progress then
		self._progress = self._target_progress
		self._target_progress = host_progress
		self._time_until_next_update = t - self._last_update_time
		self._last_update_time = t
	end

	if self._progress ~= self._target_progress then
		local progress_dif = self._target_progress - self._progress
		self._progress = math.min(self._progress + progress_dif / self._time_until_next_update * dt, self._target_progress)
		self._time_until_next_update = self._time_until_next_update - dt
	end

	self._time_to_next = math.max(0, self._time_to_next - dt)

	if self._frozen then
		self._freeze_time = math.max(0, self._freeze_time - dt)

		if self._freeze_time == 0 then
			self._frozen = false
		end
	end

	Profiler.stop("HordeSurgeHandler")
end

HordeSurgeHandler._trigger_event = function (self)
	local event_data = {}
	local seed, index = Math.next_random(self._seed, 1, #self._current_event.terror_events)
	self._seed = seed
	local terror_event = self._current_event.terror_events[index]

	TerrorEventMixer.start_event(terror_event, event_data)

	self._current_terror_event = terror_event
	self._current_terror_event_index = index
end

HordeSurgeHandler._next_level = function (self, t, game_session)
	fassert(self._is_server, "This should only be called on the server")

	if self._events[self._level_index + 1] then
		self._level_index = self._level_index + 1
		self._current_event = self._events[self._level_index]
	else
		self._time_modifier = math.max(self._time_modifier * 0.9, 0.5)
	end

	local time = self._current_event.time * self._time_modifier
	self._start_time = t
	self._end_time = t + time

	Managers.state.event:trigger("horde_surge_level_changed", self._level_index)
	self._network_transmit:send_rpc_clients("rpc_horde_surge_set_level", self._level_index, self._current_terror_event_index, self._time_to_next)
end

HordeSurgeHandler.freeze_timer = function (self, freeze_time)
	fassert(self._is_server, "This should only be called on the server")

	if self._frozen then
		freeze_time = freeze_time - self._freeze_time
	end

	self._freeze_time = self._freeze_time + freeze_time
	self._end_time = self._end_time + freeze_time
	self._start_time = self._start_time + freeze_time

	self._network_transmit:send_rpc_clients("rpc_horde_surge_freeze", self._freeze_time)
end

HordeSurgeHandler.activate = function (self)
	self._active = true
end

HordeSurgeHandler.deactivate = function (self)
	self._active = false
end

HordeSurgeHandler.get_progress = function (self)
	return self._progress
end

HordeSurgeHandler.get_freeze_time = function (self)
	return self._freeze_time
end

HordeSurgeHandler.is_frozen = function (self)
	return self._frozen
end

HordeSurgeHandler.get_level = function (self)
	return self._level_index
end

HordeSurgeHandler.rpc_horde_surge_freeze = function (self, sender, duration)
	self._freeze_time = duration
	self._frozen = true
end

HordeSurgeHandler.rpc_horde_surge_set_level = function (self, sender, level_index, terror_event_index, duration)
	self._level_index = level_index

	if terror_event_index ~= 0 then
		self._current_terror_event_index = terror_event_index
		self._current_terror_event = self._events[level_index - 1].terror_events[terror_event_index]
	end

	self._time_to_next = duration

	Managers.state.event:trigger("horde_surge_changed_level", level_index)
end

HordeSurgeHandler.hot_join_sync = function (self, peer_id)
	self._network_transmit:send_rpc("rpc_horde_surge_set_level", peer_id, self._level_index, self._current_terror_event_index, self._time_to_next)

	if self._frozen then
		self._network_transmit:send_rpc("rpc_horde_surge_freeze", peer_id, self._freeze_time)
	end
end

return
