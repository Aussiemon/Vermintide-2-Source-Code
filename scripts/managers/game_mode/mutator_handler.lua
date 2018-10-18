require("scripts/managers/game_mode/mutator_templates")

function mutator_dprint(text, ...)
	if script_data.debug_mutators then
		local s = string.format(text, ...)

		printf("[Mutator] %s", s)
	end
end

MutatorHandler = class(MutatorHandler)

MutatorHandler.init = function (self, mutators, is_server, has_local_client)
	self._mutators_by_name = {}

	for _, name in ipairs(mutators) do
		self._mutators_by_name[name] = true
	end

	self._active_mutators = {}
	self._mutator_context = {}
	self._is_server = is_server
	self._has_local_client = has_local_client

	self:_activate_mutators(mutators)
end

MutatorHandler.destroy = function (self)
	local active_mutators = self._active_mutators

	for name, mutator_data in pairs(active_mutators) do
		self:_deactivate_mutator(name, active_mutators, self._mutator_context)
	end

	self._active_mutators = nil
end

MutatorHandler.update = function (self, dt, t)
	Profiler.start("MutatorHandler")

	local active_mutators = self._active_mutators
	local mutator_context = self._mutator_context
	local is_server = self._is_server

	for name, mutator_data in pairs(active_mutators) do
		Profiler.start(name)

		local template = mutator_data.template

		if is_server and template.server.update then
			template.server.update(mutator_context, mutator_data, dt, t)
		end

		if self._has_local_client and template.client.update then
			template.client.update(mutator_context, mutator_data, dt, t)
		end

		Profiler.stop(name)
	end

	Profiler.stop("MutatorHandler")
end

MutatorHandler.has_mutator = function (self, name)
	return self._mutators_by_name[name] ~= nil
end

MutatorHandler.setup_done = function (self)
	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators
	local is_server = self._is_server
	local has_local_client = self._has_local_client

	for name, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if is_server then
			template.server.start_game_mode_function(mutator_context, mutator_data)
		end

		if has_local_client then
			template.client.start_game_mode_function(mutator_context, mutator_data)
		end
	end
end

MutatorHandler.ai_killed = function (self, killed_unit, killer_unit)
	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators
	local is_server = self._is_server
	local has_local_client = self._has_local_client

	for name, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if is_server then
			template.server.ai_killed_function(mutator_context, mutator_data, killed_unit, killer_unit)
		end

		if has_local_client then
			template.client.ai_killed_function(mutator_context, mutator_data, killed_unit, killer_unit)
		end
	end
end

MutatorHandler.conflict_director_updated_settings = function (self)
	fassert(self._is_server, "conflict_director_updated_settings only runs on server")

	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators

	for name, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if template.update_conflict_settings then
			mutator_dprint("Updating settings for mutator '%s'", name)
			template.update_conflict_settings(mutator_context, mutator_data)
		end
	end
end

MutatorHandler._activate_mutators = function (self, mutators)
	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators

	for i, name in ipairs(mutators) do
		self:_activate_mutator(name, active_mutators, mutator_context)
	end
end

MutatorHandler._activate_mutator = function (self, name, active_mutators, mutator_context)
	fassert(active_mutators[name] == nil, "Can't have multiple of same mutator running at the same time (%s)", name)
	fassert(MutatorTemplates[name], "No such template (%s)", name)
	mutator_dprint("Activating mutator '%s'", name)

	local template = MutatorTemplates[name]
	local mutator_data = {
		template = template
	}

	if self._is_server then
		local server_template = template.server

		if server_template.start_function then
			server_template.start_function(mutator_context, mutator_data)
		end
	end

	if self._has_local_client then
		local client_template = template.client

		if client_template.start_function then
			client_template.start_function(mutator_context, mutator_data)
		end
	end

	active_mutators[name] = mutator_data
end

MutatorHandler._deactivate_mutator = function (self, name, active_mutators, mutator_context)
	fassert(active_mutators[name], "Trying to deactivate mutator (%s) but it isn't active", name)
	mutator_dprint("Deactivating mutator '%s'", name)

	local template = MutatorTemplates[name]
	local mutator_data = active_mutators[name]

	if self._is_server then
		local server_template = template.server

		if server_template.stop_function then
			server_template.stop_function(mutator_context, mutator_data)
		end
	end

	if self._has_local_client then
		local client_template = template.client

		if client_template.stop_function then
			client_template.stop_function(mutator_context, mutator_data)
		end
	end

	active_mutators[name] = nil
end

return
