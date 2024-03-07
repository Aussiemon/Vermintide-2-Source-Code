-- chunkname: @scripts/entity_system/systems/objective/objective_system.lua

local objective_system_testify = script_data.testify and require("scripts/entity_system/systems/objective/objective_system_testify")

ObjectiveSystem = class(ObjectiveSystem, ExtensionSystemBase)

local RPCS = {
	"rpc_sync_objectives",
}

ObjectiveSystem.init = function (self, entity_system_creation_context, system_name, extensions)
	ExtensionSystemBase.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate

	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self._game_session = Network.game_session()
	self._entity_system_creation_context = entity_system_creation_context
	self._is_server = entity_system_creation_context.is_server
	self._world = entity_system_creation_context.world
	self._main_objectives = {}
	self._sub_objectives = {}
	self._objectives_by_name = {}
	self._activated = false
	self._all_objectives_completed = false
	self._total_num_main_objectives = 0
	self._num_completed_main_objectives = 0
	self._num_completed_sub_objectives = 0

	self:_reset_current_statistics()

	self._current_objective_index = 1
	self._item_spawner = nil
	self._initial_activation_done = false
	self._last_main_objective_completed = nil
end

ObjectiveSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)
end

ObjectiveSystem.deactivate = function (self)
	local main_objectives = self._main_objectives
	local sub_objectives = self._sub_objectives
	local objects_to_remove = {}

	for idx, extension in ipairs(main_objectives) do
		if extension.should_disable and extension:should_disable() then
			extension:disable()
		else
			extension:deactivate()

			if not extension.keep_alive then
				local objective_name = extension:objective_name()

				self._item_spawner:destroy_objective(objective_name)
			end

			objects_to_remove[#objects_to_remove + 1] = idx
		end
	end

	for i = #objects_to_remove, 1, -1 do
		local index = objects_to_remove[i]

		table.remove(main_objectives, index)

		objects_to_remove[i] = nil
	end

	for _, objective_context in pairs(sub_objectives) do
		local extensions = objective_context.extensions

		for idx, extension in ipairs(extensions) do
			if extension.should_disable and extension:should_disable() then
				extension:disable()
			else
				extension:deactivate()

				if not extension.keep_alive then
					local objective_name = extension:objective_name()

					self._item_spawner:destroy_objective(objective_name)
				end

				objects_to_remove[#objects_to_remove + 1] = idx
			end
		end

		for i = #objects_to_remove, 1, -1 do
			local index = objects_to_remove[i]

			table.remove(extensions, index)
		end
	end
end

ObjectiveSystem.activate_objectives = function (self, objective_sets)
	if self._is_server then
		self:_server_activate_objectives(objective_sets)
	elseif not self._activated then
		self:_client_activate_objectives(objective_sets)
	end
end

ObjectiveSystem._server_activate_objectives = function (self, objective_sets)
	self._objective_lists = objective_sets

	local num_main_objectives = 0

	for _, objective_set in ipairs(objective_sets) do
		local have_optional = false
		local num_required_objectives = 0

		for _, data in pairs(objective_set) do
			if not data.optional then
				num_required_objectives = num_required_objectives + 1
			else
				have_optional = true
			end
		end

		if num_required_objectives == 0 and have_optional then
			num_required_objectives = 1
		end

		num_main_objectives = num_main_objectives + num_required_objectives
	end

	self._total_num_main_objectives = num_main_objectives
	self._initial_activation_done = true

	local current_objectives = self._objective_lists[self._current_objective_index]

	if current_objectives then
		self:_activate_objectives(current_objectives)

		self._activated = true
		self._all_objectives_completed = false

		if self.objective_started_telemetry then
			self:objective_started_telemetry(self._current_objective_index)
		end
	else
		self._all_objectives_completed = true
	end
end

ObjectiveSystem._client_activate_objectives = function (self, objective_sets)
	self._objective_lists = objective_sets

	local num_main_objectives = 0

	for _, objective_set in ipairs(objective_sets) do
		local have_optional = false
		local num_required_objectives = 0

		for _, data in pairs(objective_set) do
			if not data.optional then
				num_required_objectives = num_required_objectives + 1
			else
				have_optional = true
			end
		end

		if num_required_objectives == 0 and have_optional then
			num_required_objectives = 1
		end

		num_main_objectives = num_main_objectives + num_required_objectives
	end

	local parent_container_lookup = {}

	for i = 1, #objective_sets do
		local objective_set = objective_sets[i]

		for name, data in pairs(objective_set) do
			if data.sub_objectives then
				for sub_name, sub_data in pairs(data.sub_objectives) do
					parent_container_lookup[sub_name] = name

					if sub_data.sub_objectives then
						for sub_sub_name, sub_sub_data in pairs(sub_data.sub_objectives) do
							parent_container_lookup[sub_sub_name] = sub_name
						end
					end
				end
			end
		end
	end

	self._parent_container_lookup = parent_container_lookup
	self._total_num_main_objectives = num_main_objectives
	self._initial_activation_done = true

	local current_objectives = self._objective_lists[self._current_objective_index]

	if current_objectives then
		self:_activate_objectives(current_objectives)

		self._activated = true
		self._all_objectives_completed = false
	else
		self._all_objectives_completed = true
	end
end

ObjectiveSystem._reset_current_statistics = function (self)
	self._current_num_completed_sub_objectives = 0
	self._current_num_completed_main_objectives = 0
	self._current_num_sub_objectives = 0
	self._current_num_optional_sub_objectives = 0
end

ObjectiveSystem._activate_objectives = function (self, objectives, parent_objective, items_spawned)
	if not self._item_spawner then
		return
	end

	if not items_spawned then
		self:_reset_current_statistics()

		if self._is_server then
			self._item_spawner:spawn_items(objectives)
		end
	end

	for objective_name, objective_data in pairs(objectives) do
		if objective_data.sub_objectives then
			self._sub_objectives[objective_name] = {
				data = objective_data,
				extensions = {},
				parent_data = objective_data,
				is_root_parent = not parent_objective,
			}

			self:_activate_objectives(objective_data.sub_objectives, objective_name, true)
		else
			if parent_objective then
				objective_data.parent_objective_name = parent_objective
			end

			local objective_extension = self._objectives_by_name[objective_name]

			if objective_extension then
				if objective_extension.activate then
					objective_extension:activate(nil, objective_data)
					Managers.state.event:trigger("obj_objective_activated", objective_extension, objective_name, parent_objective)
				end

				if objective_extension.is_optional and objective_extension:is_optional() then
					self._current_num_optional_sub_objectives = self._current_num_optional_sub_objectives + 1
				end

				if self._is_server then
					if parent_objective then
						self._current_num_sub_objectives = self._current_num_sub_objectives + 1

						local parent_sub_objectives = self._sub_objectives[parent_objective]
						local extensions = parent_sub_objectives.extensions

						extensions[#extensions + 1] = objective_extension
					else
						self._main_objectives[#self._main_objectives + 1] = objective_extension
					end
				else
					self._current_num_sub_objectives = self._current_num_sub_objectives + 1
				end
			end
		end
	end
end

ObjectiveSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension_alias = self.NAME
	local extension_pool_table
	local extension = ScriptUnit.add_extension(self.extension_init_context, unit, extension_name, extension_alias, extension_init_data, extension_pool_table)

	self.extensions[extension_name] = (self.extensions[extension_name] or 0) + 1

	local objective_name = extension:objective_name()

	if objective_name then
		self._objectives_by_name[objective_name] = extension
	end

	return extension
end

ObjectiveSystem.update = function (self, context, t)
	if script_data.testify then
		Testify:poll_requests_through_handler(objective_system_testify, self)
	end

	if not self._activated or self._all_objectives_completed or Managers.state.game_mode:is_game_mode_ended() then
		return
	end

	local dt = context.dt

	if self._is_server then
		self:_update_server(dt, t)
	else
		self:_update_client(dt, t)
	end
end

ObjectiveSystem.game_object_destroyed = function (self, game_object_id)
	local extension = self._main_objectives[game_object_id]
	local event_name

	if extension then
		self._main_objectives[game_object_id] = nil
		self._current_num_completed_main_objectives = self._current_num_completed_main_objectives + 1

		if not self._temp_optional then
			self._num_completed_main_objectives = self._num_completed_main_objectives + 1
			self._temp_optional = extension.is_optional and extension:is_optional()
		end

		event_name = "main_objective_completed"
	else
		extension = self._sub_objectives[game_object_id]
		self._sub_objectives[game_object_id] = nil
		self._num_completed_sub_objectives = self._num_completed_sub_objectives + 1
		self._current_num_completed_sub_objectives = self._current_num_completed_sub_objectives + 1

		if self._current_num_completed_sub_objectives >= self._current_num_sub_objectives then
			self._num_completed_main_objectives = self._num_completed_main_objectives + 1
			self._current_num_completed_main_objectives = self._current_num_completed_main_objectives + 1
		end

		event_name = "sub_objective_completed"
	end

	if not self._server then
		LevelHelper:flow_event(self._world, event_name)
		Managers.state.event:trigger("obj_" .. event_name, self._num_completed_main_objectives, self._current_num_completed_main_objectives, extension)
		extension:complete()
	end

	if table.size(self._main_objectives) < 1 and table.size(self._sub_objectives) < 1 then
		self:_reset_current_statistics()

		self._temp_optional = false
	end
end

ObjectiveSystem._update_server = function (self, dt, t)
	local main_objectives = self._main_objectives
	local sub_objectives = self._sub_objectives
	local objects_to_remove = {}
	local parent_objectives_to_remove = {}

	for idx, extension in ipairs(main_objectives) do
		extension:update(dt, t)

		if extension:is_done() then
			self:_complete_objective(idx, extension, objects_to_remove)
		end
	end

	for parent_objective_name, objective_context in pairs(sub_objectives) do
		local num_completed = 0
		local sub_objects_to_remove = {}
		local extensions = objective_context.extensions

		for idx, extension in ipairs(extensions) do
			extension:update(dt, t)

			if extension:is_done() then
				self:_complete_objective(idx, extension, sub_objects_to_remove, true)

				num_completed = num_completed + 1
			end
		end

		for i = #sub_objects_to_remove, 1, -1 do
			local index = sub_objects_to_remove[i]

			table.remove(extensions, index)
		end

		if #extensions < 1 then
			parent_objectives_to_remove[#parent_objectives_to_remove + 1] = parent_objective_name

			if not objective_context.is_root_parent then
				self:_complete_parent_objective(objective_context)
			end
		end
	end

	for i = #objects_to_remove, 1, -1 do
		local index = objects_to_remove[i]

		table.remove(main_objectives, index)
	end

	for _, name in pairs(parent_objectives_to_remove) do
		sub_objectives[name] = nil
	end

	self:_update_activate_objectives()
end

ObjectiveSystem._update_client = function (self, dt, t)
	local main_objectives = self._main_objectives

	for _, extension in pairs(main_objectives) do
		extension:update(dt, t)
	end

	local sub_objectives = self._sub_objectives

	for _, extension in pairs(sub_objectives) do
		if extension.update then
			extension:update(dt, t)
		end
	end
end

ObjectiveSystem._update_activate_objectives = function (self)
	if self._current_num_completed_main_objectives < 1 then
		return
	end

	local main_objectives = self._main_objectives
	local sub_objectives = self._sub_objectives
	local only_optional_objectives_left = false

	for _, extension in ipairs(main_objectives) do
		only_optional_objectives_left = extension.is_optional and extension:is_optional()

		if not only_optional_objectives_left then
			break
		end
	end

	if only_optional_objectives_left then
		for _, objective_context in pairs(sub_objectives) do
			local extensions = objective_context.extensions

			for _, extension in ipairs(extensions) do
				only_optional_objectives_left = extension.is_optional and extension:is_optional()

				if not only_optional_objectives_left then
					break
				end
			end
		end
	end

	if not only_optional_objectives_left and (#main_objectives > 0 or table.size(sub_objectives) > 0) then
		return
	end

	for _, extension in ipairs(main_objectives) do
		extension:deactivate()

		if not extension.keep_alive then
			local objective_name = extension:objective_name()

			self._item_spawner:destroy_objective(objective_name)
		end
	end

	for _, data in pairs(sub_objectives) do
		local extensions = data.extensions

		for _, extension in ipairs(extensions) do
			extension:deactivate()

			if not extension.keep_alive then
				local objective_name = extension:objective_name()

				self._item_spawner:destroy_objective(objective_name)
			end
		end
	end

	local next_objective_index = self._current_objective_index + 1
	local next_objectives = self._objective_lists[next_objective_index]

	if next_objectives then
		table.clear(main_objectives)
		table.clear(sub_objectives)
		self:_activate_objectives(next_objectives)

		self._current_objective_index = next_objective_index
		self._main_objective_scratch = {}

		if self.objective_started_telemetry then
			self:objective_started_telemetry(self._current_objective_index)
		end
	else
		self._all_objectives_completed = true
	end
end

ObjectiveSystem._complete_objective = function (self, id, extension, objects_to_remove, is_sub_objective)
	objects_to_remove[#objects_to_remove + 1] = id

	if not is_sub_objective then
		self:_complete_main_objective(extension)
	else
		self._num_completed_sub_objectives = self._num_completed_sub_objectives + 1
		self._current_num_completed_sub_objectives = self._current_num_completed_sub_objectives + 1

		LevelHelper:flow_event(self._world, "sub_objective_completed")
		Managers.state.event:trigger("obj_sub_objective_completed", self._num_completed_main_objectives, self._current_num_completed_main_objectives, extension)

		local num_left = self._current_num_completed_sub_objectives - self._current_num_sub_objectives

		if num_left == 0 then
			self:_complete_main_objective(extension)
		end
	end

	extension:complete()

	if not extension.keep_alive then
		local objective_name = extension:objective_name()

		self._item_spawner:destroy_objective(objective_name)
	end
end

ObjectiveSystem._complete_main_objective = function (self, extension)
	self._num_completed_main_objectives = self._num_completed_main_objectives + 1
	self._current_num_completed_main_objectives = self._current_num_completed_main_objectives + 1
	self._last_main_objective_completed = extension

	LevelHelper:flow_event(self._world, "main_objective_completed")
	Managers.state.event:trigger("obj_main_objective_completed", self._num_completed_main_objectives, self._current_num_completed_main_objectives, extension)
end

ObjectiveSystem._complete_parent_objective = function (self, objective_context)
	Managers.state.event:trigger("obj_parent_objective_completed", self._num_completed_main_objectives, self._current_num_completed_main_objectives, objective_context.data)
end

ObjectiveSystem.is_active = function (self)
	return self._activated and not self._all_objectives_completed
end

ObjectiveSystem.all_objectives_completed = function (self)
	return self._all_objectives_completed
end

ObjectiveSystem.hot_join_sync = function (self, sender)
	self.network_transmit:send_rpc("rpc_sync_objectives", sender, self._total_num_main_objectives, self._num_completed_main_objectives, self._num_completed_sub_objectives, self._current_num_completed_sub_objectives, self._current_num_sub_objectives)
end

ObjectiveSystem.current_main_objectives = function (self)
	return self._main_objectives
end

ObjectiveSystem.current_sub_objectives = function (self)
	return self._sub_objectives
end

ObjectiveSystem.current_objective_index = function (self)
	return self._current_objective_index
end

ObjectiveSystem.num_main_objectives = function (self)
	return self._total_num_main_objectives
end

ObjectiveSystem.num_completed_main_objectives = function (self)
	return self._num_completed_main_objectives
end

ObjectiveSystem.num_current_sub_objectives = function (self)
	return self._current_num_sub_objectives
end

ObjectiveSystem.num_current_completed_sub_objectives = function (self)
	return self._current_num_completed_sub_objectives
end

ObjectiveSystem.num_total_completed_objectives = function (self)
	return self._num_completed_main_objectives + self._num_completed_sub_objectives
end

ObjectiveSystem.num_current_optional_sub_objectives = function (self)
	return self._current_num_optional_sub_objectives
end

ObjectiveSystem.rpc_sync_objectives = function (self, sender, total_num_main_objectives, num_completed_main_objectives, num_completed_sub_objectives, current_num_completed_sub_objectives, current_num_sub_objectives)
	fassert(not self._is_server, "Should only be sent to clients")

	self._total_num_main_objectives = total_num_main_objectives
	self._num_completed_main_objectives = num_completed_main_objectives
	self._num_completed_sub_objectives = num_completed_sub_objectives
	self._current_num_completed_sub_objectives = current_num_completed_sub_objectives
	self._current_num_sub_objectives = current_num_sub_objectives
	self._current_objective_index = self._num_completed_main_objectives + 1
	self._main_objective_scratch = {}
end

ObjectiveSystem.complete_objective = function (self, objective_name)
	self._objectives_by_name[objective_name]._completed = true
end
