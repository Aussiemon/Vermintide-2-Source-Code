ObjectiveSystem = class(ObjectiveSystem, ExtensionSystemBase)

ObjectiveSystem.init = function (self, entity_system_creation_context, system_name, extensions)
	ExtensionSystemBase.init(self, entity_system_creation_context, system_name, extensions)

	self._game_session = Network.game_session()
	self._entity_system_creation_context = entity_system_creation_context
	self._is_server = entity_system_creation_context.is_server
	self._world = entity_system_creation_context.world
	self._current_objective_index = 1
	self._objectives_by_name = {}
	self._update_list = {}
	self._activated = false
	self._objectives_completed = 0
	self._num_objectives = 0
	self._initial_activation_done = false
	self._num_completed_objectives = 0
	self._item_spawner_system = nil
end

ObjectiveSystem.destroy = function (self)
	return
end

ObjectiveSystem.deactivate = function (self)
	local objects_to_remove = {}

	for idx, extension in pairs(self._update_list) do
		if extension.should_disable and extension:should_disable() then
			extension:disable()
		else
			extension:deactivate()

			if not extension.keep_alive then
				local objective_name = extension:objective_name()

				self._item_spawner_system:destroy_objective(objective_name)
			end

			objects_to_remove[#objects_to_remove + 1] = idx
		end
	end

	for i = #objects_to_remove, 1, -1 do
		local index = objects_to_remove[i]

		table.remove(self._update_list, index)
	end
end

ObjectiveSystem.activate_objectives = function (self, objective_lists)
	if self._is_server then
		self:_server_activate_objectives(objective_lists)
	else
		self:_client_activate_objectives(objective_lists)
	end
end

ObjectiveSystem._server_activate_objectives = function (self, objective_lists)
	fassert(self._is_server, "[ObjectiveSystem] Only the server should call _server_activate_objectives")

	local num_objectives = 0

	for _, objective_list in ipairs(objective_lists) do
		for _, _ in pairs(objective_list) do
			num_objectives = num_objectives + 1
		end
	end

	self._num_objectives = num_objectives
	self._objective_lists = objective_lists
	local current_objectives = self._objective_lists[self._current_objective_index]

	if num_objectives > 0 then
		self._activated = true

		self:_activate_next_objectives(current_objectives)
	end
end

ObjectiveSystem._client_activate_objectives = function (self, objective_lists)
	self._objective_lists = objective_lists
	local update_list = self._update_list

	if not update_list then
		return
	end

	for go_id, extension in pairs(update_list) do
		extension:activate(go_id)
	end

	self._initial_activation_done = true
	self._activated = true
end

ObjectiveSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension_alias = self.NAME
	local extension_pool_table = nil
	local extension = ScriptUnit.add_extension(self.extension_init_context, unit, extension_name, extension_alias, extension_init_data, extension_pool_table)
	self.extensions[extension_name] = (self.extensions[extension_name] or 0) + 1
	local objective_name = extension:objective_name()

	if objective_name then
		self._objectives_by_name[objective_name] = extension
	end

	return extension
end

ObjectiveSystem.update = function (self, context, t)
	if not self._activated then
		return
	end

	local dt = context.dt

	if self._is_server then
		self:_update_server(dt, t)
	else
		self:_update_client(dt, t)
	end
end

ObjectiveSystem._update_server = function (self, dt, t)
	if not self._activated then
		return
	end

	local update_list = self._update_list

	for _, extension in ipairs(update_list) do
		extension:update(dt, t)
	end

	local objects_to_remove = {}

	for idx, extension in ipairs(update_list) do
		if extension:is_done() then
			self:_complete_objective(idx, extension, objects_to_remove)
		end
	end

	if #objects_to_remove == 0 then
		return
	end

	for i = #objects_to_remove, 1, -1 do
		local index = objects_to_remove[i]

		table.remove(self._update_list, index)
	end

	self:_update_activate_next_objectives()
end

ObjectiveSystem._update_activate_next_objectives = function (self)
	local update_list = self._update_list
	local only_optional_objectives_left = false

	for _, extension in ipairs(update_list) do
		only_optional_objectives_left = extension:is_optional()

		if not only_optional_objectives_left then
			break
		end
	end

	if #self._update_list > 0 and not only_optional_objectives_left then
		return
	end

	for _, extension in ipairs(update_list) do
		extension:deactivate()
	end

	local next_objective_index = self._current_objective_index + 1
	local next_objectives = self._objective_lists[next_objective_index]

	if next_objectives then
		table.clear(self._update_list)
		self:_activate_next_objectives(next_objectives)

		self._current_objective_index = next_objective_index
	else
		self._activated = false
	end
end

ObjectiveSystem._update_client = function (self, dt, t)
	for _, extension in pairs(self._update_list) do
		extension:update(dt, t)
	end
end

ObjectiveSystem._complete_objective = function (self, id, extension, objects_to_remove)
	local objective_name = extension:objective_name()
	objects_to_remove[#objects_to_remove + 1] = id

	extension:complete()

	self._num_completed_objectives = self._num_completed_objectives + 1

	if not extension.keep_alive then
		self._item_spawner_system:destroy_objective(objective_name)
	end
end

ObjectiveSystem._activate_next_objectives = function (self, objectives)
	if not self._item_spawner_system then
		return
	end

	self._item_spawner_system:spawn_items(objectives)

	for objective_name, objective_data in pairs(objectives) do
		local objective_extension = self._objectives_by_name[objective_name]

		fassert(objective_extension, "[VersusObjectiveSystem] There is no objective called %q in the current level", objective_name)

		if objective_extension.activate then
			objective_extension:activate(nil, objective_data)
		end

		self._update_list[#self._update_list + 1] = objective_extension
	end
end

ObjectiveSystem.current_objectives = function (self)
	return self._update_list
end

ObjectiveSystem.game_object_destroyed = function (self, game_object_id)
	local extension = self._update_list[game_object_id]

	extension:deactivate()

	self._deactivated_objective = true
	self._update_list[game_object_id] = nil
end

ObjectiveSystem.hot_join_sync = function (self, sender)
	return
end

ObjectiveSystem.num_completed_objectives = function (self)
	return self._num_completed_objectives
end

return
