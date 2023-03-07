MatchmakingStateStartGame = class(MatchmakingStateStartGame)
MatchmakingStateStartGame.NAME = "MatchmakingStateStartGame"

MatchmakingStateStartGame.init = function (self, params)
	self._lobby = params.lobby
	self._network_server = params.network_server
	self._statistics_db = params.statistics_db
	self._matchmaking_manager = params.matchmaking_manager
	self._network_transmit = params.network_transmit
end

MatchmakingStateStartGame.on_enter = function (self, state_context)
	self.state_context = state_context
	self.search_config = state_context.search_config

	self:_verify_requirements()

	if not self._verifying_dlcs and self._matchmaking_manager:is_game_matchmaking() then
		self:_initiate_start_game()
	end
end

DLCS_TO_CHECK = {}
ADDED_DLCS = {}

MatchmakingStateStartGame._verify_requirements = function (self)
	table.clear(DLCS_TO_CHECK)
	table.clear(ADDED_DLCS)

	local search_config = self.search_config
	local human_players = Managers.player:human_players()
	local matchmaking_type = search_config.matchmaking_type
	local mechanism = search_config.mechanism
	local mechanism_settings = {}

	if matchmaking_type or mechanism then
		mechanism_settings = MechanismSettings[mechanism] or mechanism_settings

		if mechanism_settings.required_dlc and not ADDED_DLCS[mechanism_settings.required_dlc] then
			DLCS_TO_CHECK[#DLCS_TO_CHECK + 1] = NetworkLookup.dlcs[mechanism_settings.required_dlc]
			ADDED_DLCS[mechanism_settings.required_dlc] = true
		end

		if mechanism_settings.extra_requirements_function then
			local statistics_db = Managers.player:statistics_db()

			for _, player in pairs(human_players) do
				local stats_id = player:stats_id()

				if not mechanism_settings.extra_requirements_function(statistics_db, stats_id) then
					self._matchmaking_manager:cancel_matchmaking()
					self._matchmaking_manager:send_system_chat_message("matchmaking_status_game_mode_requirements_failed")

					return
				end
			end
		end
	end

	local difficulty = search_config.difficulty

	if difficulty then
		local difficulty_settings = DifficultySettings[difficulty]

		if difficulty_settings.extra_requirement_name and not mechanism_settings.disable_difficulty_check and not Development.parameter("unlock_all_difficulties") then
			local players_not_meeting_requirements = DifficultyManager.players_below_difficulty_rank(difficulty, human_players)

			if #players_not_meeting_requirements > 0 then
				self._matchmaking_manager:cancel_matchmaking()
				self._matchmaking_manager:send_system_chat_message("matchmaking_status_difficulty_requirements_failed")

				return
			end
		end

		if difficulty_settings.dlc_requirement and not ADDED_DLCS[difficulty_settings.dlc_requirement] then
			DLCS_TO_CHECK[#DLCS_TO_CHECK + 1] = NetworkLookup.dlcs[difficulty_settings.dlc_requirement]
			ADDED_DLCS[difficulty_settings.dlc_requirement] = true
		end
	end

	if #DLCS_TO_CHECK > 0 then
		self._verifying_dlcs = true
		self._verify_dlc_data = {
			voters = self:_active_peers(),
			results = {}
		}

		Managers.state.network.network_transmit:send_rpc_all("rpc_matchmaking_verify_dlc", DLCS_TO_CHECK)
	end
end

MatchmakingStateStartGame._initiate_start_game = function (self)
	self:_setup_lobby_data()
	self._network_server:enter_post_game()
	self:_start_game()
end

MatchmakingStateStartGame.update = function (self, dt, t)
	if self._verifying_dlcs then
		return self:_handle_verify_dlcs()
	end

	return nil
end

MatchmakingStateStartGame._setup_lobby_data = function (self)
	local mission_id, difficulty, difficulty_tweak, act_key, quick_game, private_game, excluded_level_keys, weave_name, conflict_settings = nil
	local search_config = self.search_config
	local matchmaking_type = search_config.matchmaking_type
	local mechanism = search_config.mechanism

	if self.state_context.join_by_lobby_browser then
		mission_id = Managers.mechanism:default_level_key()
		difficulty, difficulty_tweak = Managers.state.difficulty:get_difficulty()
		act_key = nil
		quick_game = false
		private_game = false
		excluded_level_keys = {}
	else
		mission_id = search_config.mission_id
		difficulty = search_config.difficulty
		difficulty_tweak = 0
		act_key = search_config.act_key
		quick_game = search_config.quick_game
		private_game = search_config.private_game
		excluded_level_keys = search_config.excluded_level_keys
	end

	if quick_game or mission_id == nil then
		local ignore_dlc_check = false

		if Managers.account:offline_mode() then
			ignore_dlc_check = false
		end

		if mechanism == "weave" then
			local weave_index = Math.random(#WeaveSettings.templates_ordered)
			local weave_template = WeaveSettings.templates_ordered[weave_index]
			weave_name = weave_template.name
			mission_id = weave_name

			Managers.weave:set_next_weave(weave_name)
			Managers.weave:set_next_objective(1)
		elseif mechanism == "deus" then
			local unlocked_journeys = self._matchmaking_manager:gather_party_unlocked_journeys()
			mission_id = unlocked_journeys[Math.random(1, #unlocked_journeys)]
			local backend_deus = Managers.backend:get_interface("deus")
			local journey_cycle = backend_deus:get_journey_cycle()
			local journey_data = journey_cycle.journey_data
			local journey_settings = journey_data[mission_id]
			local dominant_god = journey_settings.dominant_god
			local vote_data = {
				private_game = false,
				quick_game = true,
				strict_matchmaking = false,
				mission_id = mission_id,
				difficulty = difficulty,
				dominant_god = dominant_god,
				matchmaking_type = matchmaking_type
			}

			Managers.mechanism:set_vote_data(vote_data)
		else
			local preferred_level_keys = search_config.preferred_level_keys

			print("MatchmakingStateStartGame preferred_level_keys", preferred_level_keys)

			if preferred_level_keys then
				table.dump(preferred_level_keys, "preferred_level_keys")

				mission_id = preferred_level_keys[Math.random(1, #preferred_level_keys)]
			else
				mission_id = self._matchmaking_manager:get_weighed_random_unlocked_level(ignore_dlc_check, false, excluded_level_keys)
			end
		end
	elseif mechanism == "weave" then
		mission_id = search_config.mission_id

		if not quick_game then
			private_game = true
		end
	end

	local eac_authorized = false

	if IS_WINDOWS or IS_LINUX then
		if DEDICATED_SERVER then
			local eac_server = Managers.matchmaking.network_server:eac_server()
			eac_authorized = EACServer.state(eac_server, Network.peer_id()) == "trusted"
		else
			local eac_state = EAC.state()

			fassert(eac_state ~= nil, "Couldn't fetch EAC state!")

			eac_authorized = eac_state == "trusted"
		end
	end

	if IS_XB1 then
		local hopper_name = LobbyInternal.HOPPER_NAME
		local DIFFICULTY_LUT = {
			"easy",
			"normal",
			"hard",
			"harder",
			"hardest",
			"cataclysm",
			"cataclysm_2",
			"cataclysm_3"
		}
		local ticket_mission_id = mission_id
		local matchmaking_types = nil

		if matchmaking_type == "event" then
			matchmaking_types = {
				"event"
			}
		elseif mechanism == "weave" then
			if quick_game then
				ticket_mission_id = "weave_any"
				matchmaking_types = {
					"weave_quick_game"
				}
			else
				hopper_name = LobbyInternal.WEAVE_HOPPER_NAME
				matchmaking_types = {
					"weave",
					mission_id
				}
			end
		elseif mechanism == "deus" then
			matchmaking_types = {
				"deus_quick_game",
				"deus_custom_game"
			}
		else
			matchmaking_types = {
				"quick_game",
				"custom_game"
			}
		end

		local lobby_members_class = self._lobby:members()
		local lobby_members = lobby_members_class:get_members()
		local profiles = {}

		for _, peer_id in ipairs(lobby_members) do
			local player = Managers.player:player_from_peer_id(peer_id)

			if player then
				profiles[#profiles + 1] = player:profile_index()
			end
		end

		local difficulty_id = table.find(DIFFICULTY_LUT, difficulty)
		local powerlevel = self._matchmaking_manager:get_average_power_level()
		local strict_matchmaking = 0
		local network_hash = self._lobby:get_network_hash()
		local weave_template = WeaveSettings.templates[mission_id]
		local weave_index = weave_template and table.find(WeaveSettings.templates_ordered, weave_template)
		local ticket_params = {
			level = {
				ticket_mission_id
			},
			matchmaking_types = matchmaking_types,
			difficulty = difficulty_id,
			powerlevel = powerlevel,
			strict_matchmaking = strict_matchmaking,
			profiles = profiles,
			network_hash = network_hash,
			weave_index = weave_index
		}

		self._lobby:enable_matchmaking(not private_game, ticket_params, 600, hopper_name)
	end

	local lobby_matchmaking_type = matchmaking_type

	if lobby_matchmaking_type == "standard" then
		lobby_matchmaking_type = "custom"
	end

	local environment_variation_id = LevelHelper:get_environment_variation_id(mission_id)

	self._matchmaking_manager:set_matchmaking_data(mission_id, difficulty, act_key, lobby_matchmaking_type, private_game, quick_game, eac_authorized, environment_variation_id, mechanism)

	local level_transition_handler = Managers.level_transition_handler
	local level_seed = Managers.mechanism:generate_level_seed()
	local level_key = mission_id

	if mechanism == "weave" then
		local weave_template = WeaveSettings.templates[mission_id]

		if weave_template then
			local objective_index = Managers.weave:get_next_objective()
			local objective = weave_template.objectives[objective_index]
			level_key = objective.level_id
			conflict_settings = objective.conflict_settings
		end
	end

	local locked_director_functions = Managers.mechanism:generate_locked_director_functions(level_key)

	level_transition_handler:set_next_level(level_key, environment_variation_id, level_seed, nil, nil, conflict_settings, locked_director_functions, difficulty, nil)
end

MatchmakingStateStartGame.get_transition = function (self)
	if self.next_transition_state and self.start_lobby_data then
		return self.next_transition_state, self.start_lobby_data
	end
end

MatchmakingStateStartGame._send_rpc_clients = function (self, rpc_name, ...)
	if self.state_context.clients_not_in_game_session then
		local my_peer_id = Network.peer_id()
		local lobby_members = self._lobby:members()
		local members = lobby_members:get_members()

		for _, peer_id in pairs(members) do
			if peer_id ~= my_peer_id then
				self._network_transmit:send_rpc(rpc_name, peer_id, ...)
			end
		end
	else
		self._network_transmit:send_rpc_clients(rpc_name, ...)
	end
end

MatchmakingStateStartGame._start_game = function (self)
	self:_capture_telemetry()
	self:_send_rpc_clients("rpc_matchmaking_join_game")

	local game_server_lobby_client = self.state_context.game_server_lobby_client

	if game_server_lobby_client then
		self.next_transition_state = "start_lobby"
		self.start_lobby_data = {
			lobby_client = game_server_lobby_client
		}
		local ip_address = game_server_lobby_client:ip_address()

		self:_send_rpc_clients("rpc_matchmaking_broadcast_game_server_ip_address", ip_address)
	else
		Managers.state.game_mode:complete_level()
	end
end

MatchmakingStateStartGame._capture_telemetry = function (self)
	local lobby_members = self._lobby:members()
	local members = lobby_members:get_members()
	local nr_friends = 0

	for _, peer_id in pairs(members) do
		if rawget(_G, "Steam") and rawget(_G, "Friends") then
			local is_friend = Friends.in_category(peer_id, Friends.FRIEND_FLAG)

			if is_friend then
				nr_friends = nr_friends + 1
			end
		end
	end

	local player = Managers.player:local_player(1)
	local time_taken = Managers.time:time("main") - self.state_context.started_matchmaking_t
	local using_strict_matchmaking = self.search_config.strict_matchmaking

	Managers.telemetry.events:matchmaking_starting_game(player, time_taken, self.search_config)
end

MatchmakingStateStartGame._handle_verify_dlcs = function (self, dt, t)
	local verify_dlc_data = self._verify_dlc_data
	local active_peers = self:_active_peers()

	self:_update_voter_list_by_active_peers(active_peers, verify_dlc_data.voters, verify_dlc_data.results)

	local is_done, success = self:_handle_results(verify_dlc_data)

	if is_done then
		if success then
			self:_initiate_start_game()
		else
			self._matchmaking_manager:cancel_matchmaking()
			self._matchmaking_manager:send_system_chat_message("matchmaking_status_dlc_check_failed")

			return nil
		end

		self._verifying_dlcs = false
		self._verifying_dlcs_data = nil
	end
end

MatchmakingStateStartGame._handle_results = function (self, verify_dlc_data)
	local is_done = true
	local success = true

	for peer_id, _ in pairs(verify_dlc_data.voters) do
		if verify_dlc_data.results[peer_id] == nil then
			is_done = false
		elseif not verify_dlc_data.results[peer_id] then
			success = false
		end
	end

	return is_done, success
end

MatchmakingStateStartGame.rpc_matchmaking_verify_dlc_reply = function (self, channel_id, success)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]
	self._verify_dlc_data.results[peer_id] = success
end

local removed_peers = {}

MatchmakingStateStartGame._update_voter_list_by_active_peers = function (self, active_peers, voter_list, results)
	table.clear(removed_peers)

	local human_players = Managers.player:human_players()

	for _, player in pairs(human_players) do
		local peer_id = player.peer_id
		active_peers[peer_id] = true
	end

	local changed = false

	for i = #voter_list, 1, -1 do
		local voter_peer_id = voter_list[i]

		if not active_peers[voter_peer_id] then
			table.remove(voter_list, i)

			removed_peers[#removed_peers + 1] = voter_peer_id
			changed = true
		end
	end

	for i = 1, #removed_peers do
		local peer_id = removed_peers[i]

		if results[peer_id] ~= nil then
			results[peer_id] = nil
		end
	end
end

local peers_local = {}

MatchmakingStateStartGame._active_peers = function (self)
	table.clear(peers_local)

	local human_players = Managers.player:human_players()

	for _, player in pairs(human_players) do
		local peer_id = player.peer_id
		peers_local[peer_id] = true
	end

	return peers_local
end
