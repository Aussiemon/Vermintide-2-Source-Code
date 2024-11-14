-- chunkname: @scripts/game_state/loading_sub_states/win32/state_loading_migrate_host.lua

local function network_printf(format, ...)
	if script_data.network_debug_connections then
		printf("[StateLoadingMigrateHost] " .. format, ...)
	end
end

StateLoadingMigrateHost = class(StateLoadingMigrateHost)
StateLoadingMigrateHost.NAME = "StateLoadingMigrateHost"

local XB1_WAIT_TIME = 5

StateLoadingMigrateHost.on_enter = function (self, params)
	print("[Gamestate] Enter Substate StateLoadingMigrateHost")
	self:_init_params(params)
	self:_init_network()
end

StateLoadingMigrateHost._init_params = function (self, params)
	self._loading_view = params.loading_view
	self._lobby_client = params.lobby_client
	self._lobby_joined = false
	self._server_created = false
end

StateLoadingMigrateHost._init_network = function (self)
	LobbySetup.setup_network_options()

	if not self.parent:has_registered_rpcs() then
		self.parent:register_rpcs()
	end

	if IS_XB1 then
		Managers.voice_chat:reset()
	end

	local loading_context = self.parent.parent.loading_context
	local host_migration_info = loading_context.host_migration_info
	local host_to_migrate_to = host_migration_info.host_to_migrate_to
	local host_peer_id = host_to_migrate_to and host_to_migrate_to.peer_id

	if host_peer_id == Network.peer_id() then
		network_printf("creating host for people to migrate to")

		local level_transition_handler = Managers.level_transition_handler

		if host_migration_info.level_data then
			local level_data = host_migration_info.level_data

			host_migration_info.level_data = nil

			level_transition_handler:set_next_level(level_data.level_key, level_data.environment_variation_id, level_data.level_seed, level_data.mechanism, level_data.game_mode_key, level_data.conflict_settings, level_data.locked_director_functions, level_data.difficulty, level_data.difficulty_tweak, level_data.extra_packages)
		elseif host_migration_info.level_to_load then
			local level_to_load = host_migration_info.level_to_load

			level_transition_handler:set_next_level(level_to_load)

			host_migration_info.level_to_load = nil
		end

		if IS_XB1 then
			print("#########################################")
			print("#### SETTING UP HOST MIGRATION LOBBY ####")
			print("#########################################")
			print(host_to_migrate_to.session_id, host_to_migrate_to.session_template_name)
			self.parent:setup_lobby_host(callback(self, "cb_server_created"), nil, host_to_migrate_to.session_id, host_to_migrate_to.session_template_name)
		else
			self.parent:setup_lobby_host(callback(self, "cb_server_created"))
			self.parent:start_matchmaking()
		end
	elseif IS_XB1 then
		print("#################################")
		print("#### JOINING MIGRATION LOBBY ####")
		print("#################################")
		print(host_to_migrate_to.session_id, host_to_migrate_to.session_template_name)

		self.parent.parent.loading_context.join_lobby_data = {
			name = host_to_migrate_to.session_id,
			session_template_name = host_to_migrate_to.session_template_name,
		}

		self.parent:setup_join_lobby(XB1_WAIT_TIME)
	else
		network_printf("Migrating to host %s, trying to find its lobby...", host_to_migrate_to)

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

StateLoadingMigrateHost.update = function (self, dt, t)
	if self._server_created or self._lobby_joined then
		return StateLoadingRunning
	elseif IS_XB1 and self.parent:lobby_verified() then
		return StateLoadingRunning
	end
end

StateLoadingMigrateHost.on_exit = function (self, application_shutdown)
	local host_migration_info = self.parent.parent.loading_context.host_migration_info
	local game_mode_event_data = host_migration_info and host_migration_info.game_mode_event_data

	if game_mode_event_data then
		self.parent.parent.loading_context.host_migration_info = {
			game_mode_event_data = game_mode_event_data,
		}
	else
		self.parent.parent.loading_context.host_migration_info = nil
	end
end

StateLoadingMigrateHost.cb_server_created = function (self)
	network_printf("cb_server_created")

	if IS_XB1 then
		self.parent:start_matchmaking()
	end

	local lobby_host = self.parent:get_lobby()
	local stored_lobby_data = lobby_host:get_stored_lobby_data() or {}
	local lobby_data = self.parent.parent.loading_context.host_migration_info.lobby_data

	for key, value in pairs(lobby_data) do
		stored_lobby_data[key] = value
	end

	lobby_host:set_lobby_data(stored_lobby_data)

	self._server_created = true
end

StateLoadingMigrateHost.cb_lobby_joined = function (self)
	network_printf("cb_lobby_joined")

	self._lobby_joined = true
end
