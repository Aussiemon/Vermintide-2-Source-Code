WeaveSocketExtension = class(WeaveSocketExtension)
WeaveSocketExtension.NAME = "WeaveSocketExtension"

WeaveSocketExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._extension_init_data = extension_init_data
	self._extension_init_context = extension_init_context
	self._is_server = extension_init_context.is_server
	self._objective_name = extension_init_data.objective_name or Unit.get_data(unit, "weave_objective_id")
	self._unit = unit
	self._value = 0
	self._is_done = false
	self.keep_alive = true
	self._num_sockets = 0
	self._num_closed_sockets = 0
	self._weave_objective_system = Managers.state.entity:system("weave_objective_system")
end

WeaveSocketExtension.get_objective_settings = function (self)
	return WeaveObjectiveSettings[WeaveSocketExtension.NAME]
end

WeaveSocketExtension.score = function (self)
	return self._score
end

WeaveSocketExtension.activate = function (self, game_object_id, objective_data)
	self._objective_socket_extension = ScriptUnit.extension(self._unit, "objective_socket_system")
	self._objective_socket_extension.distance = math.huge
	self._num_sockets = self._objective_socket_extension.num_sockets

	if objective_data then
		self._score = objective_data.score
		self._on_start_func = objective_data.on_start_func
		self._on_progress_func = objective_data.on_progress_func
		self._on_complete_func = objective_data.on_complete_func
	else
		self._score = 0
	end

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

	Unit.flow_event(self._unit, "enable_socket")
end

WeaveSocketExtension.complete = function (self)
	if self._is_server and self._on_complete_func then
		self._on_complete_func(self._unit)
	end

	self:deactivate()
end

WeaveSocketExtension.deactivate = function (self)
	if self._is_server then
		local game_session = Network.game_session()

		if game_session then
			GameSession.destroy_game_object(game_session, self._game_object_id)
		end
	end

	local position = Unit.local_position(self._unit, 0)

	for i = 1, 15 do
		local x_offset = math.random(-10, 10) / 10
		local y_offset = math.random(-10, 10) / 10
		local z_offset = math.random(-10, 10) / 10

		self._weave_objective_system:spawn_essence_unit(position + Vector3(0, 0, 0.5) + Vector3(x_offset, y_offset, z_offset))
	end

	self._game_object_id = nil
end

WeaveSocketExtension.objective_name = function (self)
	return self._objective_name
end

WeaveSocketExtension.update = function (self, dt, t)
	if not self._game_object_id then
		return
	end

	if self._is_server then
		self:_server_update(dt, t)
	else
		self:_client_update(dt, t)
	end
end

WeaveSocketExtension.cb_game_session_disconnect = function (self)
	return
end

WeaveSocketExtension.is_done = function (self)
	return self._is_done
end

WeaveSocketExtension._server_update = function (self, dt, t)
	local num_closed_sockets = self._objective_socket_extension.num_closed_sockets

	if self._num_closed_sockets < num_closed_sockets then
		self._num_closed_sockets = num_closed_sockets

		if self._on_start_func then
			self._on_start_func(self._unit)

			self._on_start_func = nil
		end

		if self._on_progress_func then
			self._on_progress_func(self._unit, num_closed_sockets, self._num_sockets)
		end

		local game_session = Network.game_session()

		if game_session and self._game_object_id then
			GameSession.set_game_object_field(game_session, self._game_object_id, "value", self:get_percentage_done() * 100)
		end

		if self._num_sockets <= num_closed_sockets then
			self._is_done = true
		end
	end
end

WeaveSocketExtension._client_update = function (self, dt, t)
	return
end

WeaveSocketExtension.get_percentage_done = function (self)
	return math.clamp(self._num_closed_sockets / self._num_sockets, 0, 1)
end

WeaveSocketExtension.get_score = function (self)
	return self._score
end
