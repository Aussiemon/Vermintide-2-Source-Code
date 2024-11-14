-- chunkname: @scripts/game_state/loading_sub_states/win32/state_loading_versus_migration.lua

local function network_printf(format, ...)
	if script_data.network_debug_connections then
		printf("[StateLoadingVersusMigration] " .. format, ...)
	end
end

StateLoadingVersusMigration = class(StateLoadingVersusMigration)
StateLoadingVersusMigration.NAME = "StateLoadingVersusMigration"

StateLoadingVersusMigration.on_enter = function (self, params)
	print("[Gamestate] Enter Substate StateLoadingVersusMigration")

	self._party_manager = Managers.party

	self:_init_params(params)
	self:_init_network()
end

StateLoadingVersusMigration._init_params = function (self, params)
	self._loading_view = params.loading_view
	self._lobby_client = params.lobby_client
	self._lobby_joined = false
	self._server_created = false
end

StateLoadingVersusMigration._init_network = function (self)
	LobbySetup.setup_network_options()

	if not self.parent:has_registered_rpcs() then
		self.parent:register_rpcs()
	end

	local loading_context = self.parent.parent.loading_context

	self._migration_info = loading_context.versus_migration_info
	self._friend_party = self._migration_info.friend_party

	local host_to_migrate_to = self:get_host_to_migrate_to()
	local host_peer_id = host_to_migrate_to.peer_id

	if not host_peer_id then
		Crashify.print_exception("[VersusMigration]", "Local player does not belong to any friend party")
	end

	if not host_peer_id or host_peer_id == Network.peer_id() then
		self:set_up_lobby()
	else
		network_printf("Versus migration to host %s, trying to find its lobby...", host_to_migrate_to)

		local lobby_finder = self.parent:setup_lobby_finder(callback(self, "cb_lobby_joined"), nil, host_to_migrate_to)
		local requirements = {
			distance_filter = "world",
			free_slots = 1,
			filters = {
				host = {
					comparison = "equal",
					value = host_peer_id,
				},
			},
			near_filters = {},
		}
		local lobby_browser = lobby_finder:get_lobby_browser()

		LobbyInternal.add_filter_requirements(requirements, lobby_browser)
	end
end

StateLoadingVersusMigration.update = function (self, dt, t)
	if self._server_created or self._lobby_joined then
		return StateLoadingRunning
	end
end

StateLoadingVersusMigration.on_exit = function (self, application_shutdown)
	self.parent.parent.loading_context.versus_migration_info = nil
end

StateLoadingVersusMigration.cb_server_created = function (self)
	network_printf("cb_server_created")

	local lobby_data = self._migration_info.lobby_data
	local lobby_host = self.parent:get_lobby()
	local stored_lobby_data = lobby_host:get_stored_lobby_data() or {}

	for key, value in pairs(lobby_data) do
		stored_lobby_data[key] = value
	end

	lobby_host:set_lobby_data(stored_lobby_data)

	self._server_created = true
end

StateLoadingVersusMigration.cb_lobby_joined = function (self)
	network_printf("cb_lobby_joined")

	self._lobby_joined = true
end

StateLoadingVersusMigration.set_up_lobby = function (self)
	local level_transition_handler = Managers.level_transition_handler
	local level_data = self._migration_info.level_data

	level_transition_handler:set_next_level(level_data.level_key, level_data.environment_variation_id, level_data.level_seed)
	self.parent:setup_lobby_host(callback(self, "cb_server_created"))
	self.parent:start_matchmaking()
end

StateLoadingVersusMigration.get_host_to_migrate_to = function (self)
	local friend_party = self._friend_party
	local friend_party_leader_id = 1
	local host_peer_id = friend_party[friend_party_leader_id]
	local name = tostring(host_peer_id)
	local host_to_migrate_to = {
		peer_id = host_peer_id,
		name = name,
	}

	return host_to_migrate_to
end
