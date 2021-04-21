PeerStates = {}
local time_between_resend_rpc_notify_connected = 2
PeerStates.Connecting = {
	approved_for_joining = false,
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s connecting", self.peer_id))
		self.server.network_transmit:send_rpc("rpc_notify_connected", self.peer_id)

		self.loaded_level = nil
		self.resend_timer = time_between_resend_rpc_notify_connected
		self.resend_post_game_timer = time_between_resend_rpc_notify_connected
	end,
	rpc_notify_lobby_joined = function (self, wanted_profile_index, wanted_career_index, wanted_party_index, clan_tag, account_id)
		self.num_players = 1
		self.has_received_rpc_notify_lobby_joined = true
		self.clan_tag = clan_tag
		self.account_id = account_id

		printf("[PSM] Peer %s joined. Want to use profile index %q and join party %q", tostring(self.peer_id), tostring(wanted_profile_index), tostring(wanted_party_index))

		self.wanted_profile_index = wanted_profile_index
		self.wanted_career_index = wanted_career_index
		self.wanted_party_index = wanted_party_index

		self.server:peer_connected(self.peer_id)
	end,
	rpc_post_game_notified = function (self, in_post_game)
		self._has_been_notfied_of_post_game_state = true
		self._in_post_game = in_post_game
	end,
	rpc_level_loaded = function (self, level_id)
		self.loaded_level = NetworkLookup.level_keys[level_id]
	end,
	update = function (self, dt)
		local ban_list_manager = Managers.ban_list

		if ban_list_manager ~= nil and ban_list_manager:is_banned(self.peer_id) then
			printf("[PSM] Disconnecting banned player (%s)", self.peer_id)
			self.server:disconnect_peer(self.peer_id, "client_is_banned")

			return PeerStates.Disconnecting
		end

		if Managers.level_transition_handler:get_current_level_key() == "prologue" and self.peer_id ~= self.server.my_peer_id then
			self.server:disconnect_peer(self.peer_id, "host_plays_prologue")

			return PeerStates.Disconnecting
		end

		if self.server.lobby_host:lost_connection_to_lobby() and self.peer_id ~= self.server.my_peer_id then
			printf("[PSM] Disconnecting player (%s) due to no connection with our own lobby", self.peer_id)
			self.server:disconnect_peer(self.peer_id, "host_left_game")

			return PeerStates.Disconnecting
		end

		local backend_manager = Managers.backend

		if not backend_manager:signed_in() then
			printf("[PSM] Disconnecting player (%s) due to no connection with backend", self.peer_id)
			self.server:disconnect_peer(self.peer_id, "host_has_no_backend_connection")

			return PeerStates.Disconnecting
		end

		if not self.has_received_rpc_notify_lobby_joined then
			self.resend_timer = self.resend_timer - dt
			local resend_rpc_notify_connected = self.resend_timer < 0

			if resend_rpc_notify_connected then
				self.server.network_transmit:send_rpc("rpc_notify_connected", self.peer_id)

				self.resend_timer = time_between_resend_rpc_notify_connected
			end
		end

		if not Development.parameter("allow_weave_joining") then
			local lobby = self.server.lobby_host
			local mechanism = lobby:lobby_data("mechanism")
			local matchmaking = lobby:lobby_data("matchmaking")
			local matchmaking_type_id = lobby:lobby_data("matchmaking_type")
			local matchmaking_type = "n/a"

			if matchmaking_type_id then
				matchmaking_type = (IS_PS4 and matchmaking_type_id) or NetworkLookup.matchmaking_types[tonumber(matchmaking_type_id)]
			end

			if mechanism == "weave" and matchmaking == "false" then
				local player_ids = Managers.weave:get_player_ids()

				if player_ids then
					if not player_ids[self.peer_id] then
						self.server:disconnect_peer(self.peer_id, "cannot_join_weave")

						return PeerStates.Disconnecting
					end
				else
					self.server:disconnect_peer(self.peer_id, "cannot_join_weave")

					return PeerStates.Disconnecting
				end
			end
		end

		local server_in_post_game = self.server:is_in_post_game()

		if self._has_been_notfied_of_post_game_state then
			if not server_in_post_game then
				local server_was_in_post_game = self._in_post_game

				if server_was_in_post_game then
					self._has_been_notfied_of_post_game_state = nil
				elseif self.has_received_rpc_notify_lobby_joined then
					local num_joining_peers = self.server:num_joining_peers()
					local num_peers = self.server:num_active_peers()
					local peers_ingame = num_peers - num_joining_peers
					local num_reserved_slots = self.server:num_reserved_slots()
					local max_members = self.server.lobby_host:get_max_members()

					if max_members < peers_ingame + num_reserved_slots then
						if self.server:is_reserved(self.peer_id) then
							self.server:remove_reserved_slot(self.peer_id)
						else
							printf("[PSM] No free slots and peer not reserved, disconnecting peer (%s)", self.peer_id)
							self.server:disconnect_peer(self.peer_id, "full_server")

							return PeerStates.Disconnecting
						end
					end

					local local_player_id = 1
					local wanted_party = 0
					local party_manager = Managers.party

					party_manager:hot_join_sync(self.peer_id, local_player_id)
					party_manager:server_peer_hot_join_synced(self.peer_id)
					party_manager:assign_peer_to_party(self.peer_id, local_player_id, wanted_party)

					local server = self.server
					local profile_synchronizer = server.profile_synchronizer

					profile_synchronizer:hot_join_sync(self.peer_id)

					return PeerStates.Loading
				end
			end
		else
			self.resend_post_game_timer = self.resend_post_game_timer - dt
			local resend_rpc_notify_in_post_game = self.resend_post_game_timer < 0

			if resend_rpc_notify_in_post_game then
				self.server.network_transmit:send_rpc("rpc_notify_in_post_game", self.peer_id, server_in_post_game)

				self.resend_post_game_timer = time_between_resend_rpc_notify_connected
			end
		end
	end,
	on_exit = function (self, new_state)
		self._has_been_notfied_of_post_game_state = nil
		self.has_received_rpc_notify_lobby_joined = nil
		self._in_post_game = nil
	end
}
PeerStates.Loading = {
	approved_for_joining = true,
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s loading", self.peer_id))

		local party = Managers.party

		if DEDICATED_SERVER and party:leader() == nil then
			Managers.game_server:set_leader_peer_id(self.peer_id)
		end

		self.game_started = false
		self.is_ingame = nil
		local mechanism_manager = Managers.mechanism
		local network_transmit = self.server.network_transmit
		local peer_id = self.peer_id
		self._sent_rpc_load_level = false

		mechanism_manager:sync_game_mode_data_to_peer(network_transmit, peer_id)
	end,
	rpc_is_ingame = function (self)
		print("[PSM] Got rpc_is_ingame in PeerStates.Loading, is that ok?")

		self.is_ingame = true
	end,
	rpc_level_loaded = function (self, level_id)
		self.loaded_level = NetworkLookup.level_keys[level_id]
		local enemies_are_loaded = Managers.level_transition_handler.enemy_package_loader:load_sync_done_for_peer(self.peer_id)

		if enemies_are_loaded then
			printf("Peer %s has loaded the level and all enemies are loaded", self.peer_id)
		else
			printf("Peer %s has loaded the level but not all enemies, so we wait", self.peer_id)
		end
	end,
	update = function (self, dt)
		local server = self.server

		if not self._sent_rpc_load_level and server.server_peer_id ~= self.peer_id then
			if self.server:is_network_state_fully_synced_for_peer(self.peer_id) then
				print("SENDING RPC_LOAD_LEVEL FROM PEER_STATE", self.peer_id)

				local network_transmit = self.server.network_transmit

				network_transmit:send_rpc("rpc_load_level", self.peer_id)

				self._sent_rpc_load_level = true
			else
				return
			end
		end

		if not self._client_joined_done then
			Managers.mechanism:client_joined(self.peer_id)

			self._client_joined_done = true
		end

		local level_transition_handler = Managers.level_transition_handler
		local level_key = level_transition_handler:get_current_level_key()

		if self.loaded_level == level_key then
			local enemies_are_loaded = level_transition_handler.enemy_package_loader:load_sync_done_for_peer(self.peer_id)
			local state_determined, can_play = server:eac_check_peer(self.peer_id)

			if enemies_are_loaded and state_determined and can_play then
				return PeerStates.LoadingProfilePackages
			end
		end
	end,
	on_exit = function (self, new_state)
		return
	end
}
PeerStates.LoadingProfilePackages = {
	approved_for_joining = true,
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s loading profile packages", self.peer_id))

		local server = self.server
		local profile_synchronizer = server.profile_synchronizer
		local peer_id = self.peer_id
		local local_player_id = 1
		local old_profile_index, old_career_index = profile_synchronizer:profile_by_peer(peer_id, local_player_id)
		local wanted_profile_index = self.wanted_profile_index
		local wanted_career_index = self.wanted_career_index
		local loaded_level = self.loaded_level
		local level_settings = LevelSettings[loaded_level]
		local is_tutorial = level_settings and level_settings.game_mode == "tutorial"

		if is_tutorial then
			wanted_profile_index = TUTORIAL_PROFILE_INDEX
		elseif old_profile_index == TUTORIAL_PROFILE_INDEX then
			old_profile_index = nil
		end

		if old_profile_index and not is_tutorial then
			self.wanted_profile_index = old_profile_index
			self.wanted_career_index = old_career_index
		elseif wanted_profile_index == 0 then
			self.wanted_profile_index, self.wanted_career_index = profile_synchronizer:get_first_free_profile()
		elseif is_tutorial then
		else
			self.wanted_profile_index = wanted_profile_index
			self.wanted_career_index = wanted_career_index
		end
	end,
	rpc_is_ingame = function (self)
		self.is_ingame = true
	end,
	update = function (self, dt)
		local server = self.server
		local synchronizer = server.profile_synchronizer

		if synchronizer:all_synced() then
			server.network_transmit:send_rpc("rpc_loading_synced", self.peer_id)

			return PeerStates.WaitingForEnterGame
		end
	end,
	on_exit = function (self, new_state)
		return
	end
}
PeerStates.WaitingForEnterGame = {
	approved_for_joining = true,
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s waiting for enter game", self.peer_id))
	end,
	rpc_is_ingame = function (self)
		self.is_ingame = true
	end,
	update = function (self, dt)
		local server = self.server

		if self.is_ingame and server.game_network_manager then
			local game_session_host = server.game_network_manager:game_session_host()

			if game_session_host then
				local peer_id = self.peer_id

				if not server.peers_added_to_gamesession[peer_id] then
					server.game_network_manager:set_peer_synchronizing(peer_id)

					local game_session = server.game_session
					local all_synced = server.profile_synchronizer:is_peer_all_synced(peer_id)
					local in_session = server.game_network_manager:in_game_session()

					if game_session and in_session and all_synced then
						if peer_id ~= Network.peer_id() then
							local channel_id = PEER_ID_TO_CHANNEL[peer_id]

							GameSession.add_peer(game_session, channel_id)

							server.peers_added_to_gamesession[peer_id] = true
						end
					else
						return
					end
				end

				self:change_state(PeerStates.WaitingForGameObjectSync)
			end
		end
	end,
	on_exit = function (self, new_state)
		return
	end
}
PeerStates.WaitingForGameObjectSync = {
	approved_for_joining = true,
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s waiting for game object sync", self.peer_id))
	end,
	update = function (self, dt)
		local peer_id = self.peer_id

		if self.server.peers_completed_game_object_sync[peer_id] then
			if not self.game_started then
				if IS_XB1 then
					self.server.network_transmit:send_rpc("rpc_game_started", self.peer_id, Managers.account:round_id() or "")
				else
					self.server.network_transmit:send_rpc("rpc_game_started", self.peer_id, "")
				end

				self.game_started = true
			end

			if self.peer_id ~= Network.peer_id() then
				local player_controlled = true
				local local_player_id = 1

				Managers.player:add_remote_player(self.peer_id, player_controlled, local_player_id, self.clan_tag, self.account_id)
			end

			local wanted_party_index = self.wanted_party_index or 0

			Managers.state.game_mode:player_entered_game_session(self.peer_id, 1, wanted_party_index)

			if Managers.venture.challenge then
				Managers.venture.challenge:player_entered_game_session(self.peer_id, 1)
			end

			return PeerStates.WaitingForPlayers
		end
	end,
	on_exit = function (self, new_state)
		return
	end
}
PeerStates.WaitingForPlayers = {
	approved_for_joining = true,
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s waiting for players", self.peer_id))
	end,
	update = function (self, dt)
		local cutscene_system = Managers.state.entity:system("cutscene_system")

		if not cutscene_system.cutscene_started then
			local server = self.server

			if server:are_all_peers_ready() then
				return PeerStates.InGame
			end
		elseif cutscene_system:has_intro_cutscene_finished_playing() then
			return PeerStates.InGame
		end
	end,
	on_exit = function (self, new_state)
		return
	end
}
PeerStates.InGame = {
	approved_for_joining = true,
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s in game", self.peer_id))
	end,
	respawn_player = function (self)
		assert(self.despawned_player, "[PeerStates] - Trying to respawn player without having despawned the player.")

		self.respawn_player = true
	end,
	despawned_player = function (self)
		self.despawned_player = true
	end,
	update = function (self, dt)
		return
	end,
	on_exit = function (self, new_state)
		self.despawned_player = nil
		self.respawn_player = nil
	end
}
PeerStates.InPostGame = {
	approved_for_joining = true,
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s in post game", self.peer_id))
	end,
	update = function (self, dt)
		return
	end,
	on_exit = function (self, new_state)
		return
	end
}
PeerStates.Disconnecting = {
	approved_for_joining = false,
	on_enter = function (self, previous_state)
		printf("[PSM] Disconnecting peer %s", self.peer_id)
		Network.write_dump_tag(string.format("%s disconnecting", self.peer_id))

		self.is_ingame = nil
		local server = self.server
		local game_session = server.game_session
		local peer_id = self.peer_id
		local game_network_manager = server.game_network_manager
		local party = Managers.party

		if DEDICATED_SERVER and party:leader() == self.peer_id then
			local leader_candidates = server:players_past_connecting()
			local _, leader_id = next(leader_candidates)

			if leader_id == nil then
				printf("[PSM] None to set to leader, so restarting now")
				Managers.game_server:set_leader_peer_id(nil)
				Managers.game_server:restart()
			else
				printf("[PSM] Selecting %s as the new leader", leader_id)
				Managers.game_server:set_leader_peer_id(leader_id)
			end
		end

		if game_session and server.peers_added_to_gamesession[peer_id] then
			printf("[PSM] Disconnected peer %s is being removed from session.", peer_id)

			local in_session = server.game_network_manager:in_game_session()

			if in_session then
				local channel_id = PEER_ID_TO_CHANNEL[peer_id]

				GameSession.remove_peer(game_session, channel_id, game_network_manager)
			end

			server.peers_added_to_gamesession[peer_id] = nil
		end

		if game_network_manager then
			game_network_manager:remove_peer(peer_id)
		end

		server.peers_completed_game_object_sync[peer_id] = nil
	end,
	update = function (self, dt)
		local peer_id = self.peer_id

		return PeerStates.Disconnected
	end,
	on_exit = function (self, new_state)
		return
	end
}
PeerStates.Disconnected = {
	approved_for_joining = false,
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s disconnected", self.peer_id))

		local peer_id = self.peer_id
		local server = self.server
		local local_player_id = 1

		if Managers.state.game_mode then
			Managers.state.game_mode:player_left_game_session(peer_id, local_player_id)
		end

		if Managers.venture.challenge then
			Managers.venture.challenge:player_left_game_session(peer_id, local_player_id)
		end

		Managers.party:server_peer_left_session(peer_id)

		local is_client = peer_id ~= Network.peer_id()

		if is_client then
			Managers.mechanism:client_left(peer_id)

			local enemy_package_loader = Managers.level_transition_handler.enemy_package_loader

			enemy_package_loader:client_disconnected(peer_id)
		end

		server:peer_disconnected(peer_id)
		server:close_channel(peer_id)
	end,
	update = function (self, dt)
		return
	end,
	on_exit = function (self, new_state)
		Network.write_dump_tag(string.format("%s leaving disconnected", self.peer_id))
	end
}

for state_name, state_table in pairs(PeerStates) do
	state_table.state_name = state_name

	setmetatable(state_table, {
		__tostring = function ()
			return state_name
		end
	})
end

return
