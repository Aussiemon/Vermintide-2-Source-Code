-- chunkname: @scripts/unit_extensions/weaves/weave_doom_wheel_extension.lua

WeaveDoomWheelExtension = class(WeaveDoomWheelExtension, BaseObjectiveExtension)
WeaveDoomWheelExtension.NAME = "WeaveDoomWheelExtension"

WeaveDoomWheelExtension.init = function (self, extension_init_context, unit, extension_init_data)
	WeaveDoomWheelExtension.super.init(self, extension_init_context, unit, extension_init_data)

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

	local terror_event_spawner_id = extension_init_data.terror_event_spawner_id

	Unit.set_data(unit, "terror_event_spawner_id", terror_event_spawner_id)
end

WeaveDoomWheelExtension.extensions_ready = function (self)
	self._objective_socket_extension = ScriptUnit.has_extension(self._unit, "objective_socket_system")

	if self._objective_socket_extension then
		self._objective_socket_extension.distance = math.huge
		self._num_sockets = self._objective_socket_extension.num_sockets
	end
end

WeaveDoomWheelExtension.display_name = function (self)
	return "objective_destroy_doom_wheels_name_single"
end

WeaveDoomWheelExtension.initial_sync_data = function (self, game_object_data_table)
	game_object_data_table.value = self:get_percentage_done()
end

WeaveDoomWheelExtension._set_objective_data = function (self, objective_data)
	return
end

WeaveDoomWheelExtension._activate = function (self)
	return
end

WeaveDoomWheelExtension.complete = function (self, last_leaf_objective)
	if self._on_fuze_complete_func then
		self._on_fuze_complete_func(self._unit)
	end

	WeaveDoomWheelExtension.super.complete(self, last_leaf_objective)
end

WeaveDoomWheelExtension._deactivate = function (self)
	Unit.flow_event(self._unit, "force_destroy")

	local position = Unit.local_position(self._unit, 0)

	for i = 1, 15 do
		local x_offset = math.random(-10, 10) / 10
		local y_offset = math.random(-10, 10) / 10
		local z_offset = math.random(-10, 10) / 10
		local objective_system = Managers.state.entity:system("objective_system")
		local weave_essence_handler = objective_system:weave_essence_handler()

		weave_essence_handler:spawn_essence_unit(position + Vector3(0, 0, 0.5) + Vector3(x_offset, y_offset, z_offset))
	end
end

WeaveDoomWheelExtension._server_update = function (self, dt, t)
	local num_closed_sockets = self._objective_socket_extension.num_closed_sockets

	if num_closed_sockets > self._num_closed_sockets then
		self._num_closed_sockets = num_closed_sockets

		if self._on_socket_start_func then
			self._on_socket_start_func(self._unit)

			self._on_socket_start_func = nil
		end

		if self._on_socket_progress_func then
			self._on_socket_progress_func(self._unit, num_closed_sockets, self._num_sockets)
		end

		self:server_set_value(self:get_percentage_done())
	end

	if num_closed_sockets >= self._num_sockets then
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

			if self._on_fuze_progress_func then
				self._on_fuze_progress_func(self._unit, self._timer, self._max_timer)
			end

			self:server_set_value(self:get_percentage_done())
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
	if self._num_sockets == 0 then
		return 0
	end

	local socket_percentage = self._num_closed_sockets / self._num_sockets
	local timer_percentage = 1 - self._timer / self._max_timer

	return math.clamp((socket_percentage + timer_percentage) / 2, 0, 1)
end
