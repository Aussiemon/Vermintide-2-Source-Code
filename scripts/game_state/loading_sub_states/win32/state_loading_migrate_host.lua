local function network_printf(format, ...)
	if script_data.network_debug_connections then
		printf("[StateLoadingMigrateHost] " .. format, ...)
	end

	return 
end

StateLoadingMigrateHost = class(StateLoadingMigrateHost)
StateLoadingMigrateHost.NAME = "StateLoadingMigrateHost"
StateLoadingMigrateHost.on_enter = function (self, params)
	print("[Gamestate] Enter Substate StateLoadingMigrateHost")
	self._init_params(self, params)
	self._init_network(self)

	return 
end
StateLoadingMigrateHost._init_params = function (self, params)
	self._loading_view = params.loading_view
	self._lobby_client = params.lobby_client
	self._level_transition_handler = params.level_transition_handler
	self._lobby_joined = false
	self._server_created = false

	return 
end
StateLoadingMigrateHost._init_network = function (self)
	self.parent:setup_network_options()

	if not self.parent:has_registered_rpcs() then
		self.parent:register_rpcs()
	end

	local loading_context = self.parent.parent.loading_context
	local host_migration_info = loading_context.host_migration_info
	local host_to_migrate_to = host_migration_info.host_to_migrate_to
	local host_peer_id = host_to_migrate_to and host_to_migrate_to.peer_id

	if host_peer_id == Network.peer_id() then
		network_printf("creating host for people to migrate to")

		local level_to_load = host_migration_info.level_to_load

		if level_to_load then
			self._level_transition_handler:set_next_level(level_to_load)

			loading_context.host_migration_level_to_load = nil
		end

		self.parent:setup_lobby_host(callback(self, "cb_server_created"))
		self.parent:start_matchmaking()
	else
		network_printf("Migrating to host %s, trying to find its lobby...", host_to_migrate_to)
		self.parent:setup_lobby_finder(callback(self, "cb_lobby_joined"), nil, host_to_migrate_to)

		local requirements = {
			free_slots = 1,
			distance_filter = LobbyDistanceFilter.WORLD,
			filters = {
				host = {
					value = host_peer_id,
					comparison = LobbyComparison.EQUAL
				}
			},
			near_filters = {}
		}

		LobbyInternal.clear_filter_requirements()
		LobbyInternal.add_filter_requirements(requirements)
	end

	return 
end
StateLoadingMigrateHost.update = function (self, dt, t)
	if self._server_created or self._lobby_joined then
		return StateLoadingRunning
	end

	return 
end
StateLoadingMigrateHost.on_exit = function (self, application_shutdown)
	self.parent.parent.loading_context.host_migration_info = nil

	return 
end
StateLoadingMigrateHost.cb_server_created = function (self)
	network_printf("cb_server_created")

	local lobby_host = self.parent:get_lobby()
	local stored_lobby_data = lobby_host.get_stored_lobby_data(lobby_host) or {}
	local lobby_data = self.parent.parent.loading_context.host_migration_info.lobby_data

	for key, value in pairs(lobby_data) do
		stored_lobby_data[key] = value
	end

	lobby_host.set_lobby_data(lobby_host, stored_lobby_data)

	self._server_created = true

	return 
end
StateLoadingMigrateHost.cb_lobby_joined = function (self)
	network_printf("cb_lobby_joined")

	self._lobby_joined = true

	return 
end

return 
