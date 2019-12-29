require("scripts/managers/game_mode/mechanisms/adventure_mechanism")

MechanismSettings = {
	adventure = {
		class_name = "AdventureMechanism",
		max_members = 4,
		server_universe = "vermintide2",
		tobii_available = true,
		states = {
			"inn",
			"ingame",
			"tutorial",
			"weave"
		}
	}
}

for _, dlc in pairs(DLCSettings) do
	local mechanism_settings = dlc.mechanism_settings

	if mechanism_settings then
		for name, settings in pairs(mechanism_settings) do
			if settings.file then
				require(settings.file)
			end

			MechanismSettings[name] = settings
		end
	end
end

GameMechanismManager = class(GameMechanismManager)
local rpcs = {
	"rpc_from_server_set_mechanism",
	"rpc_set_current_mechanism_state",
	"rpc_carousel_set_local_match",
	"rpc_reserved_slots_count",
	"rpc_force_start_dedicated_server",
	"rpc_sync_adventure_data_to_peer"
}

GameMechanismManager.init = function (self)
	self._mechanism_key = nil
	self._game_mechanism = nil
	self._level_seed = nil
	self._locked_director_functions = nil
	self._locked_director_function_ids = nil
	self._joined_peers = {}
	self._difficulty = script_data.current_difficulty_setting or "normal"

	self:_reset()
end

GameMechanismManager.create_level_seed = function (self)
	local time_since_start = (os.clock() * 10000) % 961748927
	local date_time = os.time()
	local low_time = tonumber(tostring(string.format("%d", date_time)):reverse():sub(1, 6))
	local seed = (time_since_start + low_time) % 15485867
	seed = math.floor(seed)

	return seed
end

GameMechanismManager.generate_level_seed = function (self)
	local seed = self._game_mechanism.generate_level_seed and self._game_mechanism:generate_level_seed()

	if seed then
		self._level_seed = seed
	else
		print("[LevelTransitionHandler] Generated new level_seed:", seed)

		self._level_seed = self:create_level_seed()
	end

	return self._level_seed
end

GameMechanismManager.get_level_seed = function (self, optional_system)
	if self._game_mechanism.get_level_seed then
		return self._game_mechanism:get_level_seed(self._level_seed, optional_system)
	else
		return self._level_seed
	end
end

GameMechanismManager.register_network_server = function (self, network_server)
	fassert(self._network_server == nil, "Game is trying to create duplicated instances of NetworkServer")

	self._network_server = network_server
end

GameMechanismManager.unregister_network_server = function (self)
	fassert(self._network_server, "Trying to destroy NetworkServer even though it has already been destroyed?")

	self._network_server = nil
end

GameMechanismManager.network_server = function (self)
	return self._network_server
end

GameMechanismManager.set_level_seed = function (self, seed)
	print("GameMechanismManager setting level seed:", seed)

	self._level_seed = seed
end

GameMechanismManager.set_locked_director_functions_from_ids = function (self, locked_director_function_ids)
	self._locked_director_functions = ConflictUtils.extract_conflict_director_locked_functions(locked_director_function_ids)
	self._locked_director_function_ids = locked_director_function_ids
end

GameMechanismManager.get_locked_director_functions = function (self)
	return self._locked_director_functions
end

GameMechanismManager.get_locked_director_function_ids = function (self)
	return self._locked_director_function_ids
end

GameMechanismManager.generate_locked_director_functions = function (self, level_key)
	self._locked_director_function_ids = ConflictUtils.generate_conflict_director_locked_function_ids(level_key)
	self._locked_director_functions = ConflictUtils.extract_conflict_director_locked_functions(self._locked_director_function_ids)

	return self._locked_director_functions, self._locked_director_function_ids
end

GameMechanismManager._reset = function (self)
	local dev_param_mechanism = Development.parameter("mechanism")
	local key = dev_param_mechanism or "adventure"

	self:_init_mechanism(key)
end

GameMechanismManager.destroy = function (self)
	if self._game_mechanism.destroy then
		self._game_mechanism:destroy()
	end

	if self._network_event_delegate then
		self._network_event_delegate:unregister(self)

		self._network_event_delegate = nil
	end
end

GameMechanismManager.set_profile_synchronizer = function (self, profile_synchronizer)
	self._profile_synchronizer = profile_synchronizer
end

GameMechanismManager.set_difficulty = function (self, difficulty)
	self._difficulty = difficulty
end

GameMechanismManager.get_difficulty = function (self)
	return self._difficulty
end

GameMechanismManager.network_context_created = function (self, lobby, server_peer_id, own_peer_id)
	printf("[GameMechanismManager] network_context_created (server_peer_id=%s, own_peer_id=%s)", server_peer_id, own_peer_id)

	self._lobby = lobby
	self._server_peer_id = server_peer_id
	self._peer_id = own_peer_id
	local is_server = server_peer_id == own_peer_id
	self._is_server = is_server
end

GameMechanismManager.server_peer_id = function (self)
	return self._server_peer_id
end

GameMechanismManager.is_server = function (self)
	return self._is_server
end

GameMechanismManager.network_context_destroyed = function (self)
	print("[GameMechanismManager] network_context_destroyed")

	self._lobby = nil
	self._server_peer_id = nil
	self._peer_id = nil
	self._is_server = nil

	self:_reset()
end

GameMechanismManager.register_rpcs = function (self, network_event_delegate)
	self._network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(rpcs))
end

GameMechanismManager.unregister_rpcs = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil
end

GameMechanismManager._init_mechanism = function (self, mechanism_key)
	print("initializing mechanism to:", mechanism_key)
	fassert(MechanismSettings[mechanism_key], "[GameMechanismManager] Tried to set unknown mechanism %q", tostring(mechanism_key))

	local settings = MechanismSettings[mechanism_key]
	self._mechanism_key = mechanism_key

	if self._game_mechanism then
		self._game_mechanism:reset(settings)
	else
		local class = rawget(_G, settings.class_name)
		self._game_mechanism = class:new(settings)
	end
end

GameMechanismManager.game_round_ended = function (self, t, dt, reason)
	local level_key = self._game_mechanism:game_round_ended(t, dt, reason)

	return level_key
end

GameMechanismManager.start_next_round = function (self, level_transition_handler)
	self._level_transition_handler = level_transition_handler

	if not self._game_mechanism then
		local dev_param_mechanism = Development.parameter("mechanism")
		local key = dev_param_mechanism or "adventure"

		self:_init_mechanism(key)
	end

	local game_mode_key, side_compositions = self._game_mechanism:start_next_round(level_transition_handler)

	return game_mode_key, side_compositions
end

GameMechanismManager.game_mechanism = function (self)
	return self._game_mechanism
end

GameMechanismManager.current_mechanism_name = function (self)
	return self._mechanism_key
end

GameMechanismManager.mechanism_setting = function (self, setting_name)
	fassert(self._mechanism_key, "No mechanism set yet.")

	return MechanismSettings[self._mechanism_key][setting_name]
end

GameMechanismManager.max_members = function (self)
	fassert(self._mechanism_key, "No mechanism set yet.")

	if self._game_mechanism.max_members then
		return self._game_mechanism:max_members()
	end

	return MechanismSettings[self._mechanism_key].max_members
end

GameMechanismManager.server_universe = function (self)
	fassert(self._mechanism_key, "No mechanism set yet.")

	return MechanismSettings[self._mechanism_key].server_universe
end

GameMechanismManager.leaving_game = function (self)
	print("Mechanism leaving game")
	self:_reset()
end

GameMechanismManager.is_packages_loaded = function (self)
	if self._game_mechanism.is_packages_loaded then
		return self._game_mechanism:is_packages_loaded()
	end

	return true
end

GameMechanismManager.load_packages = function (self)
	if self._game_mechanism.load_packages then
		self._game_mechanism:load_packages()
	end
end

GameMechanismManager.client_joined = function (self, peer_id)
	self._joined_peers[peer_id] = true

	print("Mechanism says: a client joined the game!", peer_id)

	local mechanism_id = NetworkLookup.mechanism_keys[self._mechanism_key]

	RPC.rpc_from_server_set_mechanism(peer_id, mechanism_id)

	local state_name = self._game_mechanism:get_state()
	local settings = MechanismSettings[self._mechanism_key]
	local states = settings.states
	local state_id = table.find(states, state_name)

	RPC.rpc_set_current_mechanism_state(peer_id, state_id)

	if self._game_mechanism.client_joined then
		self._game_mechanism:client_joined(peer_id)
	end
end

GameMechanismManager.sync_game_mode_data_to_peer = function (self, network_transmit, peer_id)
	local mechanism = self._game_mechanism

	if mechanism and mechanism.sync_game_mode_data_to_peer then
		mechanism:sync_game_mode_data_to_peer(network_transmit, peer_id)
	end
end

GameMechanismManager.client_left = function (self, peer_id)
	self._joined_peers[peer_id] = nil
end

GameMechanismManager.profile_available = function (self, profile_name, career_name)
	if self._game_mechanism then
		return self._game_mechanism:profile_available(self._profile_synchronizer, profile_name, career_name)
	end

	return true
end

GameMechanismManager.profile_available_for_peer = function (self, peer_id, local_player_id, profile_name, career_name)
	if self._game_mechanism then
		return self._game_mechanism:profile_available_for_peer(self._profile_synchronizer, peer_id, local_player_id, profile_name, career_name)
	end

	return false
end

GameMechanismManager.save_current_score_information = function (self, game_won)
	if self._game_mechanism.save_current_score_information then
		self._game_mechanism:save_current_score_information(game_won)
	end
end

GameMechanismManager.score_information = function (self)
	if self._game_mechanism.score_information then
		return self._game_mechanism:score_information()
	end
end

GameMechanismManager.get_prior_state = function (self)
	return self._game_mechanism:get_prior_state()
end

GameMechanismManager.choose_next_state = function (self, state)
	self._game_mechanism:choose_next_state(state)
end

GameMechanismManager.reset_choose_next_state = function (self)
	self._game_mechanism:reset_choose_next_state()
end

GameMechanismManager.progress_state = function (self)
	local new_state = self._game_mechanism:progress_state()
	local settings = MechanismSettings[self._mechanism_key]
	local states = settings.states
	local state_id = table.find(states, new_state)

	fassert(state_id, "State not found in mechanism settings")
	self:send_rpc_clients("rpc_set_current_mechanism_state", state_id)
end

GameMechanismManager.get_starting_level = function (self)
	local level_key = (self._game_mechanism.get_starting_level and self._game_mechanism:get_starting_level()) or LevelSettings.default_start_level

	return level_key
end

GameMechanismManager.set_lobby_max_members = function (self, max_members)
	self._lobby:set_max_members(max_members)
end

GameMechanismManager.backend_profiles_loaded = function (self)
	if self._game_mechanism.backend_profiles_loaded then
		self._game_mechanism:backend_profiles_loaded()
	end
end

GameMechanismManager.try_reserve_game_server_slots = function (self, reserver, peers)
	if self._game_mechanism.try_reserve_game_server_slots then
		return self._game_mechanism:try_reserve_game_server_slots(reserver, peers)
	end

	printf("[GameMechanismManager] Approving slot reservation by default.")

	return true
end

GameMechanismManager.game_server_slot_reservation_expired = function (self, peer_id)
	if self._game_mechanism.game_server_slot_reservation_expired then
		self._game_mechanism:game_server_slot_reservation_expired(peer_id)
	end
end

GameMechanismManager.rpc_from_server_set_mechanism = function (self, sender, mechanism_id)
	local mechanism_name = NetworkLookup.mechanism_keys[mechanism_id]

	print("Server sends mechanism to client", mechanism_name)
	self:_init_mechanism(mechanism_name)
end

GameMechanismManager.rpc_set_current_mechanism_state = function (self, sender, state_id)
	fassert(not self._is_server, "Server handles the state internally, this should only end up on clients.")

	local settings = MechanismSettings[self._mechanism_key]
	local states = settings.states
	local state_name = states[state_id]

	fassert(state_name, "No corresponding state_name for state_id (mechanism:%s)", self._mechanism_key)
	print("Received new state from server", state_name)
	self._game_mechanism:set_current_state(state_name)
end

GameMechanismManager.rpc_carousel_set_local_match = function (self, sender, local_match)
	if sender ~= self._server_peer_id then
		return
	end

	self._game_mechanism:set_local_match(local_match)
end

GameMechanismManager.rpc_reserved_slots_count = function (self, sender, num_reserved_slots, num_slots_total)
	if not self._game_mechanism.num_dedicated_reserved_slots_changed then
		return
	end

	self._game_mechanism:num_dedicated_reserved_slots_changed(num_reserved_slots, num_slots_total)

	if self._is_server then
		self._dedicated_server_peer_id = sender

		self:send_rpc_clients("rpc_reserved_slots_count", num_reserved_slots, num_slots_total)
	end
end

GameMechanismManager.rpc_force_start_dedicated_server = function (self, sender)
	print("got GameMechanismManager:rpc_force_start_dedicated_server from", sender)

	if self._game_mechanism.force_start_dedicated_server then
		self._game_mechanism:force_start_dedicated_server()
	end
end

GameMechanismManager.rpc_sync_adventure_data_to_peer = function (self, sender, next_weave_name_id, next_weave_objective_index)
	local next_weave_name = NetworkLookup.weave_names[next_weave_name_id]
	local weave_manager = Managers.weave

	if next_weave_name ~= "n/a" then
		weave_manager:set_next_weave(next_weave_name)
		weave_manager:set_next_objective(next_weave_objective_index)
	end
end

GameMechanismManager.dedicated_server_peer_id = function (self)
	return self._dedicated_server_peer_id
end

GameMechanismManager.send_rpc_clients = function (self, rpc_name, ...)
	local rpc_func = RPC[rpc_name]

	for peer_id, _ in pairs(self._joined_peers) do
		rpc_func(peer_id, ...)
	end
end

GameMechanismManager.should_run_tutorial = function (self)
	return self._game_mechanism:should_run_tutorial()
end

return
