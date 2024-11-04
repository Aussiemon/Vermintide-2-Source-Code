-- chunkname: @scripts/game_state/components/network_state.lua

require("scripts/network/shared_state")

local shared_state_spec = require("scripts/game_state/components/network_state_spec")

NetworkState = class(NetworkState)

NetworkState.init = function (self, is_server, network_handler, server_peer_id, own_peer_id)
	self._shared_state = SharedState:new("network_state_" .. server_peer_id, shared_state_spec, is_server, network_handler, server_peer_id, own_peer_id)
	self._loaded_or_loading_packages = {}
	self._is_server = is_server
	self._server_peer_id = server_peer_id
	self._own_peer_id = own_peer_id

	local key = self._shared_state:get_key("peers")

	if is_server then
		self._shared_state:set_server(key, {
			server_peer_id,
		})
	else
		self._shared_state:set_server(key, {
			server_peer_id,
			own_peer_id,
		})
	end
end

NetworkState.register_callback = function (self, cb_type, obj, func_name, ...)
	self._shared_state:register_callback(cb_type, obj, func_name, ...)
end

NetworkState.unregister_callback = function (self, obj, cb_type)
	self._shared_state:register_callback(obj, cb_type)
end

NetworkState.full_sync = function (self)
	self._shared_state:full_sync()
end

NetworkState.register_rpcs = function (self, network_event_delegate, network_transmit)
	self._shared_state:register_rpcs(network_event_delegate)
end

NetworkState.unregister_network_events = function (self)
	self._shared_state:unregister_rpcs()
end

NetworkState.destroy = function (self)
	self._shared_state:destroy()

	self._shared_state = nil
end

NetworkState.get_revision = function (self)
	return self._shared_state:get_revision()
end

NetworkState.is_peer_fully_synced = function (self, peer_id)
	return self._shared_state:is_peer_fully_synced(peer_id)
end

NetworkState.is_server = function (self)
	return self._is_server
end

NetworkState.get_server_peer_id = function (self)
	return self._server_peer_id
end

NetworkState.get_own_peer_id = function (self)
	return self._own_peer_id
end

NetworkState.get_peers = function (self)
	local key = self._shared_state:get_key("peers")

	return self._shared_state:get_server(key)
end

NetworkState.add_peer = function (self, peer_id)
	local key = self._shared_state:get_key("peers")
	local peers = self._shared_state:get_server(key)

	if not table.contains(peers, peer_id) then
		local skip_metatable = true

		peers = table.clone(peers, skip_metatable)
		peers[#peers + 1] = peer_id

		self._shared_state:set_server(key, peers)
	end
end

NetworkState.remove_peer = function (self, peer_id)
	local key = self._shared_state:get_key("peers")
	local peers = self._shared_state:get_server(key)
	local index = table.index_of(peers, peer_id)

	if index ~= -1 then
		local skip_metatable = true

		peers = table.clone(peers, skip_metatable)

		table.swap_delete(peers, index)
		self._shared_state:set_server(key, peers)
	end
end

NetworkState.get_peer_initialized = function (self, peer_id)
	local key = self._shared_state:get_key("peer_initialized", peer_id)

	return self._shared_state:get_server(key)
end

NetworkState.set_peer_initialized = function (self, peer_id, value)
	local key = self._shared_state:get_key("peer_initialized", peer_id)

	return self._shared_state:set_server(key, value)
end

NetworkState.get_level_key = function (self)
	local key = self._shared_state:get_key("level_key")

	return self._shared_state:get_server(key)
end

NetworkState.get_level_seed = function (self)
	local key = self._shared_state:get_key("level_seed")

	return self._shared_state:get_server(key)
end

NetworkState.get_conflict_director = function (self)
	local key = self._shared_state:get_key("conflict_director")

	return self._shared_state:get_server(key)
end

NetworkState.get_game_mode = function (self)
	local key = self._shared_state:get_key("game_mode")

	return self._shared_state:get_server(key)
end

NetworkState.get_environment_variation_id = function (self)
	local key = self._shared_state:get_key("environment_variation_id")

	return self._shared_state:get_server(key)
end

NetworkState.get_locked_director_functions = function (self)
	local key = self._shared_state:get_key("locked_director_functions")

	return self._shared_state:get_server(key)
end

NetworkState.get_difficulty = function (self)
	local key = self._shared_state:get_key("difficulty")

	return self._shared_state:get_server(key)
end

NetworkState.get_difficulty_tweak = function (self)
	local key = self._shared_state:get_key("difficulty_tweak")

	return self._shared_state:get_server(key)
end

NetworkState.get_extra_packages = function (self)
	local key = self._shared_state:get_key("extra_packages")

	return self._shared_state:get_server(key)
end

NetworkState.get_mechanism = function (self)
	local key = self._shared_state:get_key("mechanism")

	return self._shared_state:get_server(key)
end

NetworkState.get_level_session_id = function (self)
	local key = self._shared_state:get_key("level_session_id")

	return self._shared_state:get_server(key)
end

NetworkState.get_level_transition_type = function (self)
	local key = self._shared_state:get_key("level_transition_type")

	return self._shared_state:get_server(key)
end

NetworkState.set_level_data = function (self, level_key, environment_variation_id, level_seed, mechanism, game_mode, conflict_director, locked_director_functions, difficulty, difficulty_tweak, level_session_id, level_transition_type, extra_packages)
	local shared_state = self._shared_state

	shared_state:start_atomic_set_server("set_level_data")
	shared_state:set_server(shared_state:get_key("level_key"), level_key)
	shared_state:set_server(shared_state:get_key("level_seed"), level_seed)
	shared_state:set_server(shared_state:get_key("conflict_director"), conflict_director)
	shared_state:set_server(shared_state:get_key("locked_director_functions"), locked_director_functions)
	shared_state:set_server(shared_state:get_key("game_mode"), game_mode)
	shared_state:set_server(shared_state:get_key("mechanism"), mechanism)
	shared_state:set_server(shared_state:get_key("environment_variation_id"), environment_variation_id)
	shared_state:set_server(shared_state:get_key("difficulty"), difficulty)
	shared_state:set_server(shared_state:get_key("difficulty_tweak"), difficulty_tweak)
	shared_state:set_server(shared_state:get_key("level_session_id"), level_session_id)
	shared_state:set_server(shared_state:get_key("level_transition_type"), level_transition_type)
	shared_state:set_server(shared_state:get_key("extra_packages"), extra_packages)
	shared_state:end_atomic_set_server("set_level_data")
end

NetworkState.is_peer_ingame = function (self, peer_id)
	local key = self._shared_state:get_key("peer_ingame", peer_id)

	return self._shared_state:get_server(key)
end

NetworkState.set_peer_ingame = function (self, peer_id, ingame)
	local key = self._shared_state:get_key("peer_ingame", peer_id)

	self._shared_state:set_server(key, ingame)
end

NetworkState.is_peer_hot_join_synced = function (self, peer_id)
	local key = self._shared_state:get_key("peer_hot_join_synced", peer_id)

	return self._shared_state:get_server(key)
end

NetworkState.set_peer_hot_join_synced = function (self, peer_id, synced)
	local key = self._shared_state:get_key("peer_hot_join_synced", peer_id)

	return self._shared_state:set_server(key, synced)
end

NetworkState.get_loaded_or_loading_packages = function (self)
	return self._loaded_or_loading_packages
end

NetworkState.set_loaded_or_loading_packages = function (self, loaded_or_loading_packages)
	self._loaded_or_loading_packages = loaded_or_loading_packages
end

NetworkState.get_profile_index_reservation = function (self, profile_index)
	local key = self._shared_state:get_key("profile_index_reservation", nil, nil, profile_index)
	local value = self._shared_state:get_server(key)

	return value ~= "" and value or nil
end

NetworkState.set_profile_index_reservation = function (self, profile_index, peer_id)
	local key = self._shared_state:get_key("profile_index_reservation", nil, nil, profile_index)

	self._shared_state:set_server(key, peer_id or "")
end

NetworkState.get_peers_with_full_profiles = function (self)
	local key = self._shared_state:get_key("full_profile_peers")

	return self._shared_state:get_server(key)
end

NetworkState.get_profile = function (self, peer_id, local_player_id)
	local key = self._shared_state:get_key("full_profile_peers")
	local peers_with_full_profiles = self._shared_state:get_server(key)

	for _, peer in ipairs(peers_with_full_profiles) do
		if peer.peer_id == peer_id and peer.local_player_id == local_player_id then
			return peer.profile_index, peer.career_index
		end
	end

	return nil, nil
end

NetworkState.set_profile = function (self, peer_id, local_player_id, profile_index, career_index, is_bot)
	fassert(profile_index > 0, "use :delete_profile_data instead")

	local key = self._shared_state:get_key("full_profile_peers")
	local peers_with_full_profiles = self._shared_state:get_server(key)
	local skip_metatable = true
	local full_profile_peers = table.clone(peers_with_full_profiles, skip_metatable)
	local already_existed = false

	for _, other_peer in ipairs(full_profile_peers) do
		if other_peer.peer_id == peer_id and other_peer.local_player_id == local_player_id then
			other_peer.profile_index = profile_index
			other_peer.career_index = career_index
			other_peer.is_bot = is_bot
			already_existed = true
		end
	end

	if not already_existed then
		full_profile_peers[#full_profile_peers + 1] = {
			peer_id = peer_id,
			local_player_id = local_player_id,
			profile_index = profile_index,
			career_index = career_index,
			is_bot = is_bot,
		}
	end

	self._shared_state:set_server(key, full_profile_peers)
end

NetworkState.get_inventory_data = function (self, peer_id, local_player_id)
	local key = self._shared_state:get_key("inventory_list", nil, local_player_id)

	return self._shared_state:get_peer(peer_id, key)
end

NetworkState.set_inventory_data = function (self, peer_id, local_player_id, inventory)
	local inventory_list_key = self._shared_state:get_key("inventory_list", nil, local_player_id)

	self._shared_state:set_peer(peer_id, inventory_list_key, inventory)
end

NetworkState.get_loaded_inventory_id = function (self, peer_id, for_peer_id, for_local_player_id)
	local loaded_inventory_key = self._shared_state:get_key("loaded_inventory_id", for_peer_id, for_local_player_id)
	local loaded_id = self._shared_state:get_peer(peer_id, loaded_inventory_key)

	return loaded_id
end

NetworkState.set_own_loaded_inventory_id = function (self, for_peer_id, for_local_player_id, inventory_id)
	local loaded_inventory_key = self._shared_state:get_key("loaded_inventory_id", for_peer_id, for_local_player_id)

	self._shared_state:set_own(loaded_inventory_key, inventory_id)
end

NetworkState.delete_profile_data = function (self, peer_id, local_player_id)
	local full_profile_peers = self:get_peers_with_full_profiles()
	local new_full_profile_peers = {}

	for _, other_peer in ipairs(full_profile_peers) do
		if other_peer.peer_id ~= peer_id or other_peer.local_player_id ~= local_player_id then
			new_full_profile_peers[#new_full_profile_peers + 1] = other_peer
		end
	end

	local key = self._shared_state:get_key("full_profile_peers")

	self._shared_state:set_server(key, new_full_profile_peers)
end

NetworkState.get_actually_ingame = function (self, peer_id)
	local key = self._shared_state:get_key("actually_ingame", peer_id)

	return self._shared_state:get_peer(peer_id, key)
end

NetworkState.set_own_actually_ingame = function (self, actually_ingame)
	local key = self._shared_state:get_key("actually_ingame", self._own_peer_id)

	self._shared_state:set_peer(self._own_peer_id, key, actually_ingame)
end

NetworkState.set_side_order_state = function (self, side_order_state)
	local key = self._shared_state:get_key("side_order_state")

	self._shared_state:set_server(key, side_order_state)
end

NetworkState.get_side_order_state = function (self)
	local key = self._shared_state:get_key("side_order_state")

	return self._shared_state:get_server(key)
end

NetworkState.get_game_mode_event_data = function (self)
	local key = self._shared_state:get_key("game_mode_event_data")

	return self._shared_state:get_server(key)
end

NetworkState.set_game_mode_event_data = function (self, data)
	local key = self._shared_state:get_key("game_mode_event_data")

	self._shared_state:set_server(key, data)
end
