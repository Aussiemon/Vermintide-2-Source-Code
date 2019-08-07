WeaveDoomWheelExtension = class(WeaveDoomWheelExtension)
WeaveDoomWheelExtension.NAME = "WeaveDoomWheelExtension"

WeaveDoomWheelExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._extension_init_context = extension_init_context
	self._extension_init_data = extension_init_data
	self._is_server = extension_init_context.is_server
	self._objective_name = extension_init_data.objective_name
	self._score = extension_init_data.score or 0
	self._game_object_id = nil
	self._unit = unit
	self._is_done = false
	self._num_sockets = 0
	self._num_closed_sockets = 0
	self._on_socket_start_func = extension_init_data.on_socket_start_func
	self._on_socket_progress_func = extension_init_data.on_socket_progress_func
	self._on_socket_complete_func = extension_init_data.on_socket_complete_func
	self._on_fuze_start_func = extension_init_data.on_fuze_start_func
	self._on_fuze_progress_func = extension_init_data.on_fuze_progress_func
	self._on_fuze_complete_func = extension_init_data.on_fuze_complete_func
	self._max_timer = extension_init_data.timer or 10
	self._timer = self._max_timer
	self.keep_alive = true
	self._weave_objective_system = Managers.state.entity:system("weave_objective_system")
	local terror_event_spawner_id = extension_init_data.terror_event_spawner_id

	Unit.set_data(unit, "terror_event_spawner_id", terror_event_spawner_id)
end

WeaveDoomWheelExtension.get_objective_settings = function (self)
	return WeaveObjectiveSettings[WeaveDoomWheelExtension.NAME]
end

WeaveDoomWheelExtension.score = function (self)
	return self._score
end

WeaveDoomWheelExtension.activate = function (self, game_object_id, objective_data)
	self._objective_socket_extension = ScriptUnit.extension(self._unit, "objective_socket_system")
	self._objective_socket_extension.distance = math.huge
	self._num_sockets = self._objective_socket_extension.num_sockets

	if self._is_server then
		local game_object_data_table = {
			go_type = NetworkLookup.go_types.weave_objective,
			objective_name = NetworkLookup.weave_objective_names[self._objective_name],
			value = self:get_percentage_done() * 100
		}
		local callback = callback(self, "cb_game_session_disconnect")
		self._game_object_id = Managers.state.network:create_game_object("weave_objective", game_object_data_table, callback)
	else
		self._game_object_id = game_object_id
	end
end

WeaveDoomWheelExtension.complete = function (self)
	if not self._disabled and self._on_fuze_complete_func then
		self._on_fuze_complete_func(self._unit)
	end

	self:deactivate()
end

WeaveDoomWheelExtension.should_disable = function (self)
	return not self._is_server or self._num_sockets <= self._num_closed_sockets
end

WeaveDoomWheelExtension.disable = function (self)
	self._disabled = true
end

WeaveDoomWheelExtension.deactivate = function (self)
	if self._is_server then
		local game_session = Network.game_session()

		if game_session then
			GameSession.destroy_game_object(game_session, self._game_object_id)
		end
	end

	Unit.flow_event(self._unit, "force_destroy")

	local position = Unit.local_position(self._unit, 0)

	for i = 1, 15, 1 do
		local x_offset = math.random(-10, 10) / 10
		local y_offset = math.random(-10, 10) / 10
		local z_offset = math.random(-10, 10) / 10

		self._weave_objective_system:spawn_essence_unit(position + Vector3(0, 0, 0.5) + Vector3(x_offset, y_offset, z_offset))
	end

	self._game_object_id = nil
end

WeaveDoomWheelExtension.cb_game_session_disconnect = function (self)
	return
end

WeaveDoomWheelExtension.objective_name = function (self)
	return self._objective_name
end

WeaveDoomWheelExtension.update = function (self, dt, t)
	if not self._game_object_id then
		return
	end

	if self._is_server then
		self:_server_update(dt, t)
	else
		self:_client_update(dt, t)
	end
end

WeaveDoomWheelExtension._server_update = function (self, dt, t)
	local num_closed_sockets = self._objective_socket_extension.num_closed_sockets

	if self._num_closed_sockets < num_closed_sockets then
		self._num_closed_sockets = num_closed_sockets

		if self._on_socket_start_func then
			self._on_socket_start_func(self._unit)

			self._on_socket_start_func = nil
		end

		if self._on_socket_progress_func then
			self._on_socket_progress_func(self._unit, num_closed_sockets, self._num_sockets)
		end

		local game_session = Network.game_session()

		if game_session and self._game_object_id then
			GameSession.set_game_object_field(game_session, self._game_object_id, "value", self:get_percentage_done() * 100)
		end
	end

	if self._num_sockets <= num_closed_sockets then
		if self._on_socket_complete_func then
			self._on_socket_complete_func(self._unit)

			self._on_socket_complete_func = nil
		end

		if self._timer <= 0 then
			self._is_done = true
		else
			self._timer = self._timer - dt

			if self._on_fuze_start_func then
				self._on_fuze_start_func(self._unit)

				self._on_fuze_start_func = nil
			end

			if self._on_fuze_progress_func and not self._disabled then
				self._on_fuze_progress_func(self._unit, self._timer, self._max_timer)
			end

			local game_session = Network.game_session()

			if game_session and self._game_object_id then
				GameSession.set_game_object_field(game_session, self._game_object_id, "value", self:get_percentage_done() * 100)
			end
		end
	end
end

WeaveDoomWheelExtension._client_update = function (self, dt, t)
	return
end

WeaveDoomWheelExtension.is_done = function (self)
	return self._is_done
end

WeaveDoomWheelExtension.get_percentage_done = function (self)
	local socket_percentage = self._num_closed_sockets / self._num_sockets
	local timer_percentage = 1 - self._timer / self._max_timer

	return math.clamp((socket_percentage + timer_percentage) / 2, 0, 1)
end

WeaveDoomWheelExtension.get_score = function (self)
	return self._score
end

return
