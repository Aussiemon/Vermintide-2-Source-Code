PeerStates = {}
local time_between_resend_rpc_notify_connected = 2
PeerStates.Connecting = {
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s connecting", self.peer_id))

		local ban_list_manager = Managers.ban_list

		if ban_list_manager ~= nil and ban_list_manager.is_banned(ban_list_manager, self.peer_id) then
			printf("[PSM] Disconnecting banned player (%s)", self.peer_id)

			self._disconnect_peer = true

			return 
		end

		if self.server.level_key == "prologue" and self.peer_id ~= self.server.my_peer_id then
			self._disconnect_peer = true

			return 
		end

		self.server.network_transmit:send_rpc("rpc_notify_connected", self.peer_id)

		self.loaded_level = nil
		self.resend_timer = time_between_resend_rpc_notify_connected
		self.resend_post_game_timer = time_between_resend_rpc_notify_connected

		return 
	end,
	rpc_notify_lobby_joined = function (self, wanted_profile_index, clan_tag)
		self.num_players = 1
		self.has_received_rpc_notify_lobby_joined = true
		self.clan_tag = clan_tag

		printf("[PSM] Peer %s joined. Want to use profile index %q", tostring(self.peer_id), tostring(wanted_profile_index), tostring(clan_tag))

		self.wanted_profile_index = wanted_profile_index

		return 
	end,
	rpc_post_game_notified = function (self, in_post_game)
		self._has_been_notfied_of_post_game_state = true
		self._in_post_game = in_post_game

		return 
	end,
	rpc_level_loaded = function (self, level_id)
		self.loaded_level = NetworkLookup.level_keys[level_id]

		return 
	end,
	update = function (self, dt)
		if self._disconnect_peer then
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

		local server_in_post_game = self.server:is_in_post_game()

		if self._has_been_notfied_of_post_game_state then
			if not server_in_post_game then
				local server_was_in_post_game = self._in_post_game

				if server_was_in_post_game then
					self._has_been_notfied_of_post_game_state = nil
				elseif self.has_received_rpc_notify_lobby_joined then
					local num_peers = self.server:num_active_peers()
					local num_reserved_slots = self.server:num_reserved_slots()
					local max_members = self.server.lobby_host:get_max_members()

					if max_members < num_peers + num_reserved_slots then
						if self.server:is_reserved(self.peer_id) then
							self.server:remove_reserved_slot(self.peer_id)
						else
							printf("[PSM] No free slots and peer not reserved, disconnecting peer (%s)", self.peer_id)
							self.server:disconnect_peer(self.peer_id, "full_server")

							return PeerStates.Disconnecting
						end
					end

					if PLATFORM == "win32" and rawget(_G, "EAC") then
						return PeerStates.VerifyEAC
					else
						return PeerStates.Loading
					end
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

		return 
	end,
	on_exit = function (self, new_state)
		self._has_been_notfied_of_post_game_state = nil
		self.has_received_rpc_notify_lobby_joined = nil
		self._in_post_game = nil

		return 
	end
}
PeerStates.VerifyEAC = {
	on_enter = function (self, previous_state)
		self._server_id = Network.peer_id()

		printf("[PSM] Wait for a determined EAC state for peer(%s)", self.peer_id)

		return 
	end,
	update = function (self, dt)
		local server_state, peer_state = nil

		if DEDICATED_SERVER then
			local gs = Managers.game_server
			server_state = "untrusted"
			peer_state = gs.eac_state(gs, self.peer_id)
		else
			local host = self.server.lobby_host
			server_state = EAC.state()

			if self.peer_id == Network.peer_id() then
				peer_state = server_state
			else
				peer_state = host.eac_state(host, self.peer_id)
			end
		end

		if server_state == "undetermined" then
			return 
		end

		if peer_state == "undetermined" then
			return 
		end

		printf("[PSM] Host EAC state is %s, peer %s's state is %s", server_state, self.peer_id, peer_state)

		local match = nil
		match = ((server_state ~= "banned" and peer_state ~= "banned") or false) and server_state == peer_state

		if match then
			return PeerStates.Loading
		else
			printf("[PSM] Peer's EAC status doesn't match the server, disconnecting peer (%s)", self.peer_id)
			self.server:disconnect_peer(self.peer_id, "eac_authorize_failed")

			return PeerStates.Disconnecting
		end

		return 
	end,
	on_exit = function (self, new_state)
		self.eac_request_id = nil
		self.authorized = nil

		return 
	end
}
PeerStates.Loading = {
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s loading", self.peer_id))

		self.game_started = false
		self.is_ingame = nil
		local level_key = self.server.level_key
		local game_mode_manager = Managers.state.game_mode
		local level_seed = self.server.level_transition_handler.level_seed

		if level_seed == nil then
			Application.warning("[PSM] No level seed set, fallbacking to 0")

			level_seed = 0
		end

		print("SENDING RPC_LOAD_LEVEL FROM PEER_STATE", self.peer_id)
		self.server.network_transmit:send_rpc("rpc_load_level", self.peer_id, NetworkLookup.level_keys[level_key], level_seed)

		return 
	end,
	rpc_is_ingame = function (self)
		print("[PSM] Got rpc_is_ingame in PeerStates.Loading, is that ok?")

		self.is_ingame = true

		return 
	end,
	rpc_level_loaded = function (self, level_id)
		self.loaded_level = NetworkLookup.level_keys[level_id]

		return 
	end,
	update = function (self, dt)
		local server_level_key = self.server.level_key

		if self.loaded_level == server_level_key then
			return PeerStates.LoadingProfilePackages
		end

		return 
	end,
	on_exit = function (self, new_state)
		return 
	end
}
PeerStates.LoadingProfilePackages = {
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s loading profile packages", self.peer_id))

		local server = self.server
		local profile_synchronizer = server.profile_synchronizer
		local peer_id = self.peer_id
		local local_player_id = 1
		local old_index = profile_synchronizer.profile_by_peer(profile_synchronizer, peer_id, local_player_id)
		local wanted_profile_index = self.wanted_profile_index
		self.wait_for_bot_despawn = false
		local loaded_level = self.loaded_level
		local level_settings = LevelSettings[loaded_level]
		local is_tutorial = level_settings and level_settings.game_mode == "tutorial"

		if is_tutorial then
			wanted_profile_index = TUTORIAL_PROFILE_INDEX
		elseif old_index == TUTORIAL_PROFILE_INDEX then
			old_index = nil
		end

		if old_index and not is_tutorial then
			self.my_profile_index = old_index

			return 
		elseif wanted_profile_index == 0 then
			self.my_profile_index = profile_synchronizer.get_first_free_profile(profile_synchronizer)
		else
			local owner_type = profile_synchronizer.owner_type(profile_synchronizer, wanted_profile_index)

			if owner_type == "human" then
				self.my_profile_index = profile_synchronizer.get_first_free_profile(profile_synchronizer)
			elseif owner_type == "bot" then
				self.my_profile_index = wanted_profile_index
				self.wait_for_bot_despawn = true
			elseif owner_type == "available" then
				self.my_profile_index = wanted_profile_index
			else
				Application.error("owner type unknown", owner_type)
			end
		end

		if self.wait_for_bot_despawn then
			profile_synchronizer.reserve_profile(profile_synchronizer, self.my_profile_index, peer_id, local_player_id)
		else
			profile_synchronizer.peer_entered_session(profile_synchronizer, peer_id)
			profile_synchronizer.set_profile_peer_id(profile_synchronizer, self.my_profile_index, peer_id, local_player_id)
			profile_synchronizer.hot_join_sync(profile_synchronizer, peer_id, {
				local_player_id
			})
		end

		return 
	end,
	rpc_is_ingame = function (self)
		self.is_ingame = true

		return 
	end,
	update = function (self, dt)
		local server = self.server
		local synchronizer = server.profile_synchronizer

		if self.wait_for_bot_despawn then
			local profile_index = self.my_profile_index
			local owner = synchronizer.owner(synchronizer, profile_index)

			if not owner then
				local peer_id = self.peer_id
				local local_player_id = 1

				synchronizer.unreserve_profile(synchronizer, profile_index, peer_id, local_player_id)
				synchronizer.peer_entered_session(synchronizer, peer_id)
				synchronizer.set_profile_peer_id(synchronizer, profile_index, peer_id, local_player_id)
				synchronizer.hot_join_sync(synchronizer, peer_id, {
					local_player_id
				})

				self.wait_for_bot_despawn = false
			end
		elseif synchronizer.all_synced(synchronizer) then
			server.network_transmit:send_rpc("rpc_loading_synced", self.peer_id)

			return PeerStates.WaitingForEnterGame
		end

		return 
	end,
	on_exit = function (self, new_state)
		if self.wait_for_bot_despawn then
			local peer_id = self.peer_id
			local local_player_id = 1
			local profile_index = self.my_profile_index

			synchronizer:unreserve_profile(profile_index, peer_id, local_player_id)
		end

		return 
	end
}
PeerStates.WaitingForEnterGame = {
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s waiting for enter game", self.peer_id))

		return 
	end,
	rpc_is_ingame = function (self)
		self.is_ingame = true

		return 
	end,
	update = function (self, dt)
		local server = self.server

		if self.is_ingame and server.game_network_manager then
			local peer_id = self.peer_id

			if not server.peers_added_to_gamesession[peer_id] then
				server.game_network_manager:set_peer_synchronizing(peer_id)

				local game_session = server.game_session
				local all_synced = server.profile_synchronizer:all_synced()

				if game_session and all_synced then
					GameSession.add_peer(game_session, peer_id)

					server.peers_added_to_gamesession[peer_id] = true
				else
					return 
				end
			end

			self.change_state(self, PeerStates.WaitingForGameObjectSync)
		end

		return 
	end,
	on_exit = function (self, new_state)
		return 
	end
}
PeerStates.WaitingForGameObjectSync = {
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s waiting for game object sync", self.peer_id))

		return 
	end,
	update = function (self, dt)
		local peer_id = self.peer_id

		if self.server.peers_completed_game_object_sync[peer_id] then
			if not self.game_started then
				if PLATFORM == "xb1" then
					self.server.network_transmit:send_rpc("rpc_game_started", self.peer_id, Managers.account:round_id() or "")
				else
					self.server.network_transmit:send_rpc("rpc_game_started", self.peer_id, "")
				end

				self.game_started = true
			end

			return PeerStates.WaitingForPlayers
		end

		return 
	end,
	on_exit = function (self, new_state)
		return 
	end
}
PeerStates.WaitingForPlayers = {
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s waiting for players", self.peer_id))

		return 
	end,
	update = function (self, dt)
		local cutscene_system = Managers.state.entity:system("cutscene_system")

		if not cutscene_system.cutscene_started then
			local server = self.server

			if server.are_all_peers_ready(server) then
				return PeerStates.SpawningPlayer
			end
		elseif cutscene_system.has_intro_cutscene_finished_playing(cutscene_system) then
			return PeerStates.SpawningPlayer
		end

		return 
	end,
	on_exit = function (self, new_state)
		return 
	end
}
PeerStates.SpawningPlayer = {
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s spawning player", self.peer_id))

		return 
	end,
	update = function (self, dt)
		local server = self.server

		if server.profile_synchronizer:all_synced() then
			local peer_id = self.peer_id

			for i = 1, self.num_players, 1 do
				self.server.game_network_manager:spawn_peer_player(peer_id, i, self.clan_tag)
			end

			return PeerStates.InGame
		end

		return 
	end,
	on_exit = function (self, new_state)
		return 
	end
}
PeerStates.InGame = {
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s in game", self.peer_id))

		return 
	end,
	respawn_player = function (self)
		assert(self.despawned_player, "[PeerStates] - Trying to respawn player without having despawned the player.")

		self.respawn_player = true

		return 
	end,
	despawned_player = function (self)
		self.despawned_player = true

		return 
	end,
	update = function (self, dt)
		if self.respawn_player then
			self.respawn_player = nil

			return PeerStates.SpawningPlayer
		elseif self.despawned_player then
			local profile_index = self.server.profile_synchronizer:profile_by_peer(self.peer_id, 1)

			if profile_index ~= self.my_profile_index then
				self.my_profile_index = profile_index
				self.despawned_player = nil

				return PeerStates.LoadingProfilePackages
			end
		end

		return 
	end,
	on_exit = function (self, new_state)
		self.despawned_player = nil
		self.respawn_player = nil

		return 
	end
}
PeerStates.InPostGame = {
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s in post game", self.peer_id))

		return 
	end,
	update = function (self, dt)
		return 
	end,
	on_exit = function (self, new_state)
		return 
	end
}
PeerStates.Disconnecting = {
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s disconnecting", self.peer_id))

		self.is_ingame = nil
		local server = self.server
		local game_session = server.game_session
		local peer_id = self.peer_id
		local game_network_manager = server.game_network_manager

		if game_session and server.peers_added_to_gamesession[peer_id] then
			printf("[PSM] Disconnected peer %s is being removed from session.", peer_id)

			local in_session = server.game_network_manager:in_game_session()

			if in_session then
				GameSession.remove_peer(game_session, peer_id, game_network_manager)
			end

			server.peers_added_to_gamesession[peer_id] = nil
		end

		if game_network_manager then
			game_network_manager.remove_peer(game_network_manager, peer_id)
		end

		server.peers_completed_game_object_sync[peer_id] = nil

		return 
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
	on_enter = function (self, previous_state)
		Network.write_dump_tag(string.format("%s disconnected", self.peer_id))

		local peer_id = self.peer_id
		local server = self.server
		local profile_synchronizer = server.profile_synchronizer
		local local_player_id = 1
		local old_index = profile_synchronizer.profile_by_peer(profile_synchronizer, peer_id, local_player_id)

		if old_index then
			profile_synchronizer.set_profile_peer_id(profile_synchronizer, old_index, nil)
		else
			server.slot_allocator:free_peer_slots(peer_id, local_player_id)
		end

		profile_synchronizer.peer_left_session(profile_synchronizer, peer_id)
		server.connection_handler:disconnect_peers(peer_id)

		return 
	end,
	update = function (self, dt)
		return 
	end,
	on_exit = function (self, new_state)
		Network.write_dump_tag(string.format("%s leaving disconnected", self.peer_id))

		return 
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
