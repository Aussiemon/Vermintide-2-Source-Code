require("scripts/managers/game_mode/mutator_templates")

function mutator_dprint(text, ...)
	if script_data.debug_mutators then
		local s = string.format(text, ...)

		printf("[Mutator] %s", s)
	end
end

MutatorHandler = class(MutatorHandler)
local RPCS = {
	"rpc_activate_mutator_client",
	"rpc_deactivate_mutator_client"
}

MutatorHandler.init = function (self, mutators, is_server, has_local_client, world, network_event_delegate, network_transmit)
	self._is_server = is_server
	self._has_local_client = has_local_client
	self._network_transmit = network_transmit
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	local mutator_context = {
		world = world
	}
	self._mutator_context = mutator_context
	local active_mutators = {}
	self._active_mutators = active_mutators
	self._mutators = {}

	if is_server and mutators then
		for i = 1, #mutators, 1 do
			local name = mutators[i]

			self:_server_initialize_mutator(name, active_mutators, mutator_context)
		end
	end
end

MutatorHandler.destroy = function (self)
	local active_mutators = self._active_mutators
	local mutator_context = self._mutator_context
	mutator_context.is_destroy = true

	for name, _ in pairs(active_mutators) do
		self:_deactivate_mutator(name, active_mutators, mutator_context, true)
	end

	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
	self._mutators = nil
	self._active_mutators = nil
end

MutatorHandler.activate_mutators = function (self)
	if self._is_server then
		local mutator_context = self._mutator_context
		local active_mutators = self._active_mutators
		local mutators = self._mutators

		for name, data in pairs(mutators) do
			self:_activate_mutator(name, active_mutators, mutator_context, data)
		end
	end
end

MutatorHandler.hot_join_sync = function (self, peer_id)
	local network_transmit = self._network_transmit
	local active_mutators = self._active_mutators

	for name, _ in pairs(active_mutators) do
		local mutator_id = NetworkLookup.mutator_templates[name]

		network_transmit:send_rpc("rpc_activate_mutator_client", peer_id, mutator_id)
	end
end

MutatorHandler.update = function (self, dt, t)
	local active_mutators = self._active_mutators
	local mutator_context = self._mutator_context
	local is_server = self._is_server

	for name, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if is_server and template.server.update then
			template.server.update(mutator_context, mutator_data, dt, t)
		end

		if self._has_local_client and template.client.update then
			template.client.update(mutator_context, mutator_data, dt, t)
		end
	end
end

MutatorHandler.has_activated_mutator = function (self, name)
	return self._active_mutators[name] ~= nil
end

MutatorHandler.activated_mutators = function (self)
	return self._active_mutators
end

MutatorHandler.ai_killed = function (self, killed_unit, killer_unit, death_data)
	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators
	local is_server = self._is_server
	local has_local_client = self._has_local_client

	for _, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if is_server then
			template.server.ai_killed_function(mutator_context, mutator_data, killed_unit, killer_unit, death_data)
		end

		if has_local_client then
			template.client.ai_killed_function(mutator_context, mutator_data, killed_unit, killer_unit, death_data)
		end
	end
end

MutatorHandler.players_left_safe_zone = function (self)
	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators
	local is_server = self._is_server

	for _, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if is_server then
			template.server.server_players_left_safe_zone(mutator_context, mutator_data)
		end
	end
end

MutatorHandler.evaluate_lose_conditions = function (self)
	fassert(self._is_server, "evaluate_lose_conditions only runs on server")

	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators
	local lost = false
	local lost_delay = nil

	for _, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if template.lose_condition_function then
			local result, delay = template.lose_condition_function(mutator_context, mutator_data)

			if result then
				if delay and (lost_delay == nil or lost_delay < delay) then
					lost_delay = delay
				end

				lost = result
			end
		end
	end

	return lost, lost_delay
end

MutatorHandler.evaluate_end_zone_activation_conditions = function (self)
	fassert(self._is_server, "evaluate_end_zone_activation_conditions only runs on server")

	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators

	for _, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if template.end_zone_activation_condition_function then
			local result = template.end_zone_activation_condition_function(mutator_context, mutator_data)

			if not result then
				return false
			end
		end
	end

	return true
end

MutatorHandler.conflict_director_updated_settings = function (self)
	fassert(self._is_server, "conflict_director_updated_settings only runs on server")

	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators

	for name, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if template.update_conflict_settings then
			template.update_conflict_settings(mutator_context, mutator_data)
		end
	end
end

MutatorHandler._server_initialize_mutator = function (self, name, active_mutators, mutator_context)
	fassert(self._is_server, "Only server is allowed to run mutator initialization function.")
	fassert(MutatorTemplates[name], "No such template (%s)", name)

	local mutators = self._mutators

	fassert(mutators[name] == nil, "Can't initialize an already initialized mutator (%s)", name)
	fassert(active_mutators[name] == nil, "Can't initialize an activated mutator (%s)", name)

	local template = MutatorTemplates[name]
	local mutator_data = {
		template = template
	}
	local server_template = template.server

	if server_template.initialize_function then
		server_template.initialize_function(mutator_context, mutator_data)
	end

	self._mutators[name] = mutator_data
end

MutatorHandler._activate_mutator = function (self, name, active_mutators, mutator_context, mutator_data)
	fassert(active_mutators[name] == nil, "Can't have multiple of same mutator running at the same time (%s)", name)
	fassert(MutatorTemplates[name], "No such template (%s)", name)

	local template = MutatorTemplates[name]
	mutator_data = mutator_data or {
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

	if self._is_server then
		local mutator_id = NetworkLookup.mutator_templates[name]

		self._network_transmit:send_rpc_clients("rpc_activate_mutator_client", mutator_id)
	end
end

MutatorHandler._deactivate_mutator = function (self, name, active_mutators, mutator_context, is_destroy)
	fassert(active_mutators[name], "Trying to deactivate mutator (%s) but it isn't active", name)

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

	if self._is_server and not is_destroy then
		local mutator_id = NetworkLookup.mutator_templates[name]

		self._network_transmit:send_rpc_clients("rpc_deactivate_mutator_client", mutator_id)
	end
end

MutatorHandler.rpc_activate_mutator_client = function (self, sender, mutator_id)
	fassert(not self._is_server, "Only call rpc_activate_mutator_client on clients.")

	local mutator_name = NetworkLookup.mutator_templates[mutator_id]
	local active_mutators = self._active_mutators
	local mutator_context = self._mutator_context

	self:_activate_mutator(mutator_name, active_mutators, mutator_context)
end

MutatorHandler.rpc_deactivate_mutator_client = function (self, sender, mutator_id)
	fassert(not self._is_server, "Only call rpc_deactivate_mutator_client on clients.")

	local mutator_name = NetworkLookup.mutator_templates[mutator_id]
	local active_mutators = self._active_mutators
	local mutator_context = self._mutator_context

	self:_deactivate_mutator(mutator_name, active_mutators, mutator_context)
end

return
