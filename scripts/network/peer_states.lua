-- chunkname: @scripts/network/peer_states.lua

PeerStates = {}
SlotReservationConnectStatus = table.enum("PENDING", "FAILED", "SUCCEEDED")

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
	rpc_notify_lobby_joined = function (self, wanted_profile_index, wanted_career_index, requested_party_index, clan_tag, account_id)
		self.num_players = 1
		self.has_received_rpc_notify_lobby_joined = true
		self.clan_tag = clan_tag
		self.account_id = account_id

		printf("[PSM] Peer %s joined. Want to use profile index %q and join party %q", tostring(self.peer_id), tostring(wanted_profile_index), tostring(requested_party_index))

		self.wanted_profile_index = wanted_profile_index
		self.wanted_career_index = wanted_career_index
		self.requested_party_index = requested_party_index

		self.server:peer_connected(self.peer_id)
	end,
	rpc_post_game_notified = function (self, in_post_game)
		self._has_been_notfied_of_post_game_state = true
		self._in_post_game = in_post_game
	end,
	rpc_level_loaded = function (self, level_id)
		self.loaded_level = NetworkLookup.level_keys[level_id]
	end,
	rpc_provide_slot_reservation_info = function (self, peers, group_leader)
		local match_handler = self.server:get_match_handler()

		match_handler:register_pending_peer(self.peer_id, group_leader)

		local mechanism_manager = Managers.mechanism
		local slot_reservation_handler = mechanism_manager:get_slot_reservation_handler()

		slot_reservation_handler:connecting_slot_reservation_info_received(self.peer_id, peers, group_leader)
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

		local reservation_status = SlotReservationConnectStatus.SUCCEEDED

		if self.is_remote then
			local mechanism_manager = Managers.mechanism
			local slot_reservation_handler = mechanism_manager:get_slot_reservation_handler()

			if slot_reservation_handler then
				reservation_status = slot_reservation_handler:handle_slot_reservation_for_connecting_peer(self, dt)
			else
				local match_handler = self.server:get_match_handler()

				if not match_handler:has_peer_data(self.peer_id) then
					match_handler:register_pending_peer(self.peer_id, self.server.my_peer_id)
				end
			end
		end

		if reservation_status == SlotReservationConnectStatus.SUCCEEDED then
			if not self.has_received_rpc_notify_lobby_joined then
				self.resend_timer = self.resend_timer - dt

				local resend_rpc_notify_connected = self.resend_timer < 0

				if resend_rpc_notify_connected then
					if PEER_ID_TO_CHANNEL[self.peer_id] then
						local game_mode = Managers.state.game_mode and Managers.state.game_mode:game_mode()

						if game_mode and game_mode:is_joinable() then
							self.server.network_transmit:send_rpc("rpc_notify_connected", self.peer_id)

							self.resend_timer = time_between_resend_rpc_notify_connected
						end
					else
						print("PeerState.Connecting lost connection, cannot send rpc_notify_connected")

						return PeerStates.Disconnecting
					end
				end
			end
		elseif reservation_status == SlotReservationConnectStatus.FAILED then
			printf("[PSM] Disconnecting player (%s) due to not being able to reserve slots", self.peer_id)
			self.server:disconnect_peer(self.peer_id, "host_has_no_backend_connection")

			return PeerStates.Disconnecting
		else
			return
		end

		if not Development.parameter("allow_weave_joining") then
			local lobby = self.server.lobby_host
			local mechanism = lobby:lobby_data("mechanism")
			local matchmaking = lobby:lobby_data("matchmaking")
			local matchmaking_type_id = lobby:lobby_data("matchmaking_type")
			local matchmaking_type = "n/a"

			if matchmaking_type_id then
				matchmaking_type = IS_PS4 and matchmaking_type_id or NetworkLookup.matchmaking_types[tonumber(matchmaking_type_id)]
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

					local peer_id = self.peer_id

					if peer_id == Network.peer_id() then
						self.server:hot_join_sync_party_and_profiles(self.peer_id)

						self.has_hot_join_synced_party_and_profile = true
					end

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
	rpc_level_load_started = function (self, level_session_id)
		if not self.has_hot_join_synced_party_and_profile then
			self.server:hot_join_sync_party_and_profiles(self.peer_id)

			self.has_hot_join_synced_party_and_profile = true
		end
	end,
	on_exit = function (self, new_state)
		self._has_been_notfied_of_post_game_state = nil
		self.has_received_rpc_notify_lobby_joined = nil
		self._in_post_game = nil
	end,
}
PeerStates.Loading = {
	approved_for_joining = true,
	on_enter = function (self, previous_state)
		local peer_id = self.peer_id

		Network.write_dump_tag(string.format("%s loading", peer_id))

		self.game_started = false
		self.is_ingame = nil

		if self.is_remote and not self.has_eac then
			Managers.eac:server_add_peer(self.peer_id)

			self.has_eac = true
		end

		Managers.level_transition_handler.transient_package_loader:hot_join_sync(peer_id)
	end,
	rpc_is_ingame = function (self)
		print("[PSM] Got rpc_is_ingame in PeerStates.Loading, is that ok?")

		self.is_ingame = true
	end,
	rpc_level_load_started = function (self, level_session_id)
		if not self.has_hot_join_synced_party_and_profile then
			self.server:hot_join_sync_party_and_profiles(self.peer_id)

			self.has_hot_join_synced_party_and_profile = true
		end
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
		local level_transition_handler = Managers.level_transition_handler
		local level_key = level_transition_handler:get_current_level_key()

		if self.loaded_level == level_key then
			local enemies_are_loaded = level_transition_handler.enemy_package_loader:load_sync_done_for_peer(self.peer_id)
			local state_determined, can_play = Managers.eac:server_check_peer(self.peer_id)

			if enemies_are_loaded and state_determined and can_play then
				return PeerStates.LoadingProfilePackages
			end
		end
	end,
	on_exit = function (self, new_state)
		return
	end,
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
			local any_party = self.requested_party_index or 1

			self.wanted_profile_index, self.wanted_career_index = profile_synchronizer:get_first_free_profile(any_party)
		elseif is_tutorial then
			-- Nothing
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
	end,
}

local function _has_ongoing_resync(network_server, peer_id)
	local ongoing_resync = not network_server:are_profile_packages_fully_synced_for_peer(peer_id) or not Managers.level_transition_handler.enemy_package_loader:load_sync_done_for_peer(peer_id)

	return ongoing_resync
end

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
					local all_synced = server:is_network_state_fully_synced_for_peer(peer_id) and not _has_ongoing_resync(server, peer_id)
					local in_session = server.game_network_manager:in_game_session()

					if game_session and in_session and all_synced then
						if self.is_remote then
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
	end,
}
PeerStates.WaitingForGameObjectSync = {
	approved_for_joining = true,
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s waiting for game object sync", self.peer_id))
	end,
	update = function (self, dt)
		local peer_id = self.peer_id

		if self.server:has_peer_synced_game_objects(peer_id) then
			if peer_id ~= self.server.my_peer_id then
				local ongoing_resync = _has_ongoing_resync(self.server, peer_id)

				if ongoing_resync then
					if not self._printed_hot_join_sync_delay then
						printf("[PeerSM] %s :: Delaying hot join sync due to ongoing resync", peer_id)

						self._printed_hot_join_sync_delay = true
					end

					return
				end

				self.server.game_network_manager:hot_join_sync(peer_id)
				self.server:set_peer_hot_join_synced(peer_id, true)
			end

			if not self.game_started then
				if IS_XB1 then
					self.server.network_transmit:send_rpc("rpc_game_started", self.peer_id, Managers.account:round_id() or "")
				else
					self.server.network_transmit:send_rpc("rpc_game_started", self.peer_id, "")
				end

				self.game_started = true
			end

			if self.is_remote then
				local player_controlled = true
				local local_player_id = 1

				Managers.player:add_remote_player(self.peer_id, player_controlled, local_player_id, self.clan_tag, self.account_id)
			end

			local requested_party_index = self.requested_party_index

			Managers.state.game_mode:player_entered_game_session(self.peer_id, 1, requested_party_index)

			return PeerStates.WaitingForPlayers
		end
	end,
	on_exit = function (self, new_state)
		return
	end,
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
	end,
}
PeerStates.InGame = {
	approved_for_joining = true,
	on_enter = function (self, previous_state)
		Managers.account:update_presence()
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
	end,
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
	end,
}
PeerStates.Disconnecting = {
	approved_for_joining = false,
	on_enter = function (self, previous_state)
		printf("[PSM] Disconnecting peer %s", self.peer_id)
		Network.write_dump_tag(string.format("%s disconnecting", self.peer_id))

		if self.has_eac then
			Managers.eac:server_remove_peer(self.peer_id)

			self.has_eac = false
		end

		local match_handler = self.server:get_match_handler()

		match_handler:client_disconnected(self.peer_id)

		self.is_ingame = nil

		local server = self.server
		local game_session = server.game_session
		local peer_id = self.peer_id
		local local_player_id = 1
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

		if game_session and (server.peers_added_to_gamesession[peer_id] or DEDICATED_SERVER) then
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

		if Managers.state.game_mode then
			Managers.state.game_mode:player_left_game_session(peer_id, local_player_id)
		end

		Managers.mechanism:remote_client_disconnected(peer_id)
		Managers.party:server_peer_left_session(peer_id, previous_state.approved_for_joining, previous_state.state_name)
		server:set_peer_synced_game_objects(peer_id, false)
	end,
	update = function (self, dt)
		return PeerStates.Disconnected
	end,
	on_exit = function (self, new_state)
		return
	end,
}
PeerStates.Disconnected = {
	approved_for_joining = false,
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s disconnected", self.peer_id))

		local peer_id = self.peer_id
		local server = self.server

		if self.is_remote then
			local enemy_package_loader = Managers.level_transition_handler.enemy_package_loader

			enemy_package_loader:client_disconnected(peer_id)
			Managers.mechanism:remote_client_disconnected(peer_id)
		end

		Managers.account:update_presence()
		server:peer_disconnected(peer_id)
		server:close_channel(peer_id)
	end,
	update = function (self, dt)
		return
	end,
	on_exit = function (self, new_state)
		Network.write_dump_tag(string.format("%s leaving disconnected", self.peer_id))
	end,
}

for state_name, state_table in pairs(PeerStates) do
	state_table.state_name = state_name

	setmetatable(state_table, {
		__tostring = function ()
			return state_name
		end,
	})
end
