require("scripts/managers/matchmaking/matchmaking_state_search_game")
require("scripts/managers/matchmaking/matchmaking_state_request_join_game")
require("scripts/managers/matchmaking/matchmaking_state_request_profiles")
require("scripts/managers/matchmaking/matchmaking_state_start_game")
require("scripts/managers/matchmaking/matchmaking_state_host_game")
require("scripts/managers/matchmaking/matchmaking_state_join_game")
require("scripts/managers/matchmaking/matchmaking_state_idle")
require("scripts/managers/matchmaking/matchmaking_state_ingame")
require("scripts/managers/matchmaking/matchmaking_state_friend_client")
require("scripts/managers/matchmaking/matchmaking_state_wait_for_countdown")
DLCUtils.require_list("matchmaking_state_files")

MatchmakingManager = class(MatchmakingManager)
script_data.matchmaking_debug = script_data.matchmaking_debug or Development.parameter("matchmaking_debug")

function mm_printf(format_text, ...)
	if script_data.matchmaking_debug then
		format_text = "[Matchmaking] " .. format_text

		printf(format_text, ...)
	end
end

function mm_printf_force(format_text, ...)
	format_text = "[Matchmaking] " .. format_text

	printf(format_text, ...)
end

local ALWAYS_HOST_GAME = (DEDICATED_SERVER and true) or false
MatchmakingSettings = {
	TIME_BETWEEN_EACH_SEARCH = 3.4,
	MAX_NUM_LOBBIES = 100,
	START_GAME_TIME = 5,
	REQUEST_JOIN_LOBBY_REPLY_TIME = 30,
	MIN_STATUS_MESSAGE_TIME = 2,
	TOTAL_GAME_SEARCH_TIME = 5,
	afk_force_stop_mm_timer = 180,
	afk_warn_timer = 150,
	MAX_NUMBER_OF_PLAYERS = 4,
	host_games = "auto",
	restart_search_after_host_cancel = true,
	auto_ready = false,
	REQUEST_PROFILES_REPLY_TIME = 10,
	JOIN_LOBBY_TIME_UNTIL_AUTO_CANCEL = 20,
	LOBBY_FINDER_UPDATE_INTERVAL = 1,
	max_distance_filter = (GameSettingsDevelopment.network_mode == "lan" and "close") or (Application.user_setting("max_quick_play_search_range") ~= "medium" and Application.user_setting("max_quick_play_search_range")) or "close" or DefaultUserSettings.get("user_settings", "max_quick_play_search_range"),
	allowed_profiles = {
		true,
		true,
		true,
		true,
		true
	},
	hero_search_filter = {
		true,
		true,
		true,
		true,
		true
	},
	quickplay_level_select_settings = {
		loss_multiplier = 1,
		win_multiplier = 1,
		base_level_weight = 1,
		amount_of_relevant_games = 20,
		progression_multiplier = 10
	}
}
local RPCS = {
	"rpc_matchmaking_request_profiles_data",
	"rpc_matchmaking_request_join_lobby",
	"rpc_matchmaking_request_profile",
	"rpc_set_matchmaking",
	"rpc_cancel_matchmaking",
	"rpc_matchmaking_request_join_lobby_reply",
	"rpc_notify_connected",
	"rpc_matchmaking_join_game",
	"rpc_matchmaking_request_profile_reply",
	"rpc_matchmaking_request_profiles_data_reply",
	"rpc_matchmaking_request_selected_level",
	"rpc_matchmaking_request_selected_level_reply",
	"rpc_matchmaking_request_selected_difficulty",
	"rpc_matchmaking_request_selected_difficulty_reply",
	"rpc_matchmaking_request_status_message",
	"rpc_matchmaking_status_message",
	"rpc_set_client_game_privacy",
	"rpc_game_server_reserve_slots",
	"rpc_game_server_set_group_leader",
	"rpc_matchmaking_broadcast_game_server_ip_address",
	"rpc_set_quick_game",
	"rpc_start_game_countdown_finished",
	"rpc_set_game_mode_event_data",
	"rpc_clear_game_mode_event_data",
	"rpc_matchmaking_sync_quickplay_data",
	"rpc_matchmaking_request_quickplay_data",
	"rpc_matchmaking_verify_dlc",
	"rpc_matchmaking_verify_dlc_reply",
	"rpc_join_reserved_game_server"
}
MatchmakingManager._broken_lobbies = MatchmakingManager._broken_lobbies or {}
MatchmakingManager._broken_servers = MatchmakingManager._broken_servers or {}

MatchmakingManager.init = function (self, params)
	self.params = params
	self.network_transmit = params.network_transmit
	self.lobby = params.lobby
	self.peer_id = params.peer_id
	self.is_server = params.is_server
	self.profile_synchronizer = params.profile_synchronizer
	self.statistics_db = params.statistics_db
	self.network_server = params.network_server
	self._network_hash = self.lobby.network_hash
	self._host_matchmaking_data = {}
	self._power_level_timer = 0
	self.party_owned_dlcs = {}
	self._level_weights = {}
	self._quick_game = params.quick_game

	self:set_local_quick_game(params.local_quick_game)

	self.peers_to_sync = {}
	local network_options = Managers.lobby:network_options()

	if not DEDICATED_SERVER then
		local lobby_finder = LobbyFinder:new(network_options, MatchmakingSettings.MAX_NUM_LOBBIES, true)
		self.lobby_finder = lobby_finder
		params.lobby_finder = lobby_finder
	end

	params.network_options = network_options
	params.matchmaking_manager = self
	params.network_hash = self.lobby.network_hash
	self.state_context = {}
	self.debug = {
		text = "",
		progression = "",
		lobby_timer = 0,
		state = "",
		hero = "",
		difficulty = "",
		level = ""
	}

	if not self.is_server then
		self._joining_this_host_peer_id = self.lobby:lobby_host()

		self:_change_state(MatchmakingStateIdle, self.params, {})
	else
		self:_change_state(MatchmakingStateIdle, self.params, {})
	end

	self:reset_lobby_filters()
	mm_printf("initializing")
	mm_printf("my_peer_id: %s, I am %s", Network.peer_id(), (self.is_server and "server") or "client")

	self.lobby_finder_timer = 0
	self.profile_update_time = 0
	self._leader_peer_id = nil
	self.countdown_has_finished = false
end

MatchmakingManager.reset_lobby_filters = function (self)
	if DEDICATED_SERVER then
		return
	end

	if IS_WINDOWS then
		local engine_lobby_browser = self.lobby_finder:get_lobby_browser()

		LobbyInternal.clear_filter_requirements(engine_lobby_browser)
	else
		LobbyInternal.clear_filter_requirements()
	end
end

MatchmakingManager.game_mode_event_data = function (self)
	return self._game_mode_event_data
end

MatchmakingManager.set_game_mode_event_data = function (self, event_data)
	self._game_mode_event_data = event_data

	if self.is_server then
		local mutators = event_data.mutators

		fassert(#mutators <= NetworkConstants.mutator_array.max_size, "Too many mutators defined for event! (%d|%d)", #mutators, NetworkConstants.mutator_array.max_size)

		local mutator_lookup_array = {}

		for i = 1, #mutators, 1 do
			local mutator_name = mutators[i]
			mutator_lookup_array[i] = NetworkLookup.mutator_templates[mutator_name]
		end

		self.network_transmit:send_rpc_clients("rpc_set_game_mode_event_data", mutator_lookup_array)
	end
end

MatchmakingManager.clear_game_mode_event_data = function (self)
	self._game_mode_event_data = nil

	if self.is_server then
		self.network_transmit:send_rpc_clients("rpc_clear_game_mode_event_data")
	end
end

MatchmakingManager.set_statistics_db = function (self, statistics_db)
	self.statistics_db = statistics_db
	self.params.statistics_db = statistics_db
end

MatchmakingManager.set_active_lobby_browser = function (self, lobby_browser)
	self._lobby_browser = lobby_browser
end

MatchmakingManager.setup_post_init_data = function (self, post_init_data)
	self.is_in_inn = post_init_data.is_in_inn
	self.difficulty_manager = post_init_data.difficulty
	self.params.hero_spawner_handler = post_init_data.hero_spawner_handler
	self.params.difficulty = post_init_data.difficulty
	self.params.wwise_world = post_init_data.wwise_world
	local is_server = self.is_server

	if post_init_data.reset_matchmaking and is_server then
		self:cancel_matchmaking()
	end

	if is_server then
		local is_matchmaking = self.lobby:lobby_data("matchmaking")

		if is_matchmaking == "true" then
			self:_change_state(MatchmakingStateIngame, self.params, {})
		else
			self:_change_state(MatchmakingStateIdle, self.params, {})
		end
	end

	local map_save_data = SaveData.map_save_data

	if map_save_data then
		MatchmakingSettings.host_games = map_save_data.host_option
		MatchmakingSettings.auto_ready = map_save_data.selected_ready_option
	end

	self.profile_update_time = 0
	self._power_level_timer = 0

	self:_update_power_level(0)
end

MatchmakingManager.waystone_is_active = function (self)
	return self._waystone_is_active or false, self._waystone_type or 0
end

MatchmakingManager.activate_waystone_portal = function (self, waystone_type)
	self._waystone_is_active = waystone_type ~= nil
	self._waystone_type = waystone_type
	local event_manager = Managers.state.event

	if event_manager then
		event_manager:trigger("activate_waystone_portal", waystone_type)
	end
end

MatchmakingManager.destroy = function (self)
	mm_printf("destroying")

	if self._state and self._state.on_exit then
		self._state:on_exit()
	end

	if self.lobby_finder then
		self.lobby_finder:destroy()
	end

	if self.afk_popup_id then
		Managers.popup:cancel_popup(self.afk_popup_id)

		self.afk_popup_id = nil
	end
end

MatchmakingManager.register_rpcs = function (self, network_event_delegate)
	mm_printf("register rpcs")
	fassert(self.network_event_delegate == nil, "trying to register rpcs without a network_event_delegate..")

	self.network_event_delegate = network_event_delegate
	self.params.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
end

MatchmakingManager.unregister_rpcs = function (self)
	mm_printf("unregister rpcs")
	fassert(self.network_event_delegate ~= nil, "trying to unregister rpcs without a network_event_delegate..")
	self.network_event_delegate:unregister(self)

	self.params.network_event_delegate = nil
	self.network_event_delegate = nil
end

MatchmakingManager._change_state = function (self, new_state, params, state_context, reason)
	if self._state and self._state.NAME == new_state.NAME then
		mm_printf("Ignoring state transision %s because we are already there", new_state.NAME)

		return
	end

	if self._state then
		if self._state.on_exit then
			mm_printf("Exiting state %s with on_exit()", self._state.NAME)
			self._state:on_exit(self._state.NAME)
		else
			mm_printf("Exiting %s", self._state.NAME)
		end
	end

	self._state = new_state:new(params, reason)
	self._state.parent = self._parent
	self.state_context = state_context

	if self._state.on_enter then
		mm_printf("Entering %s on_enter() ", new_state.NAME)
		self._state:on_enter(state_context)
	else
		mm_printf("Entering %s", new_state.NAME)
	end
end

MatchmakingManager._remove_old_broken_lobbies = function (self, t)
	local broken_lobbies = MatchmakingManager._broken_lobbies

	for lobby_id, time_to_clear in pairs(broken_lobbies) do
		if time_to_clear < t then
			mm_printf("Removing broken lobby %s, perhaps it will now work again?!", tostring(lobby_id))

			broken_lobbies[lobby_id] = nil
		end
	end

	local broken_servers = MatchmakingManager._broken_servers

	for ip_port, time_to_clear in pairs(broken_servers) do
		if time_to_clear < t then
			mm_printf("Removing broken server %s, perhaps it will now work again?!", ip_port)

			broken_servers[ip_port] = nil
		end
	end
end

MatchmakingManager.update = function (self, dt, t)
	if self._state then
		local state_name = self._state.NAME

		Profiler.start(state_name)

		local new_state, state_context, reason = self._state:update(dt, t)

		Profiler.stop(state_name)

		if new_state then
			self:_change_state(new_state, self.params, state_context, reason)
		end
	end

	self:_update_power_level(t)
	self:_update_afk_logic(dt, t)
	self:_remove_old_broken_lobbies(t)

	if self.is_server and next(self.peers_to_sync) then
		local is_matchmaking, private_game = self:is_game_matchmaking()
		local search_info = self:search_info()
		local mission_id = search_info.mission_id
		local difficulty = search_info.difficulty
		local quick_game = search_info.quick_game or false
		local mechanism = search_info.mechanism
		local mission_id_lookup = (mission_id and NetworkLookup.mission_ids[mission_id]) or NetworkLookup.mission_ids["n/a"]
		local difficulty_lookup = (difficulty and NetworkLookup.difficulties[difficulty]) or NetworkLookup.difficulties.normal
		local mechanism_lookup = (mechanism and NetworkLookup.mechanisms[mechanism]) or NetworkLookup.mechanisms.adventure

		for peer_id, _ in pairs(self.peers_to_sync) do
			self.peers_to_sync[peer_id] = nil
			local channel_id = PEER_ID_TO_CHANNEL[peer_id]

			RPC.rpc_set_matchmaking(channel_id, is_matchmaking, private_game, mission_id_lookup, difficulty_lookup, quick_game, mechanism_lookup)
		end
	end

	if not DEDICATED_SERVER and self._joining_this_host_peer_id and PEER_ID_TO_CHANNEL[self._joining_this_host_peer_id] == nil then
		print("No connection to host, cancelling matchmaking")
		self:cancel_matchmaking()
	end
end

MatchmakingManager._update_afk_logic = function (self, dt, t)
	Profiler.start("afk logic")

	local lobby = self.lobby

	if self.is_server and lobby:is_joined() then
		local state_name = self._state and self._state.NAME
		local is_matchmaking = state_name == "MatchmakingStateHostGame" or state_name == "MatchmakingStateSearchGame"

		if is_matchmaking and self.is_in_inn then
			local time_since_input_active = t - Managers.input.last_active_time
			local host_afk_warn = MatchmakingSettings.afk_warn_timer < time_since_input_active
			local host_afk_cancel_mm = MatchmakingSettings.afk_force_stop_mm_timer < time_since_input_active
			local can_flash_window = _G.Window ~= nil and Window.flash_window ~= nil and not Window.has_focus()

			if host_afk_warn and self.afk_popup_id == nil then
				self.afk_popup_id = Managers.popup:queue_popup(Localize("popup_afk_warning"), Localize("popup_error_topic"), "ok", Localize("button_ok"))

				if can_flash_window then
					Window.flash_window(nil, "start", 5)
				end

				self:send_system_chat_message("popup_afk_warning")
			elseif host_afk_cancel_mm then
				if self.afk_popup_id then
					Managers.popup:cancel_popup(self.afk_popup_id)
				end

				self.afk_popup_id = Managers.popup:queue_popup(Localize("popup_afk_mm_cancelled"), Localize("popup_error_topic"), "ok", Localize("button_ok"))

				if can_flash_window then
					Window.flash_window(nil, "start", 1)
				end

				self:send_system_chat_message("popup_afk_mm_cancelled")
				self:cancel_matchmaking()
			end
		end

		if self.afk_popup_id then
			local popup_result = Managers.popup:query_result(self.afk_popup_id)

			if popup_result then
				self.afk_popup_id = nil
			end
		end
	end

	Profiler.stop("afk logic")
end

local remove_peer_power_level_table = {}

MatchmakingManager._update_power_level = function (self, t)
	if t < self._power_level_timer then
		return
	end

	self._power_level_timer = t + 5

	Profiler.start("power level")

	local own_peer_id = Network.peer_id()
	local is_server = self.is_server
	local local_player = Managers.player:local_player()

	if local_player then
		local sync_data_active = local_player:sync_data_active()
		local hero_name = local_player:profile_display_name()
		local career_name = local_player:career_name()
		local matchmaking_type_id = self.lobby:lobby_data("matchmaking_type")
		local matchmaking_type = matchmaking_type_id and ((IS_PS4 and matchmaking_type_id) or NetworkLookup.matchmaking_types[tonumber(matchmaking_type_id)])

		if sync_data_active and hero_name and career_name then
			local power_level = BackendUtils.get_total_power_level(hero_name, career_name, matchmaking_type)

			if power_level ~= local_player:get_data("power_level") then
				local_player:set_data("power_level", power_level)
			end

			local best_aquired_power_level = local_player:best_aquired_power_level()

			if best_aquired_power_level ~= local_player:get_data("best_aquired_power_level") then
				local_player:set_data("best_aquired_power_level", best_aquired_power_level)
				local_player:reevaluate_highest_difficulty()
			end
		end
	end

	if is_server then
		self:_set_power_level()
	end

	Profiler.stop("power level")
end

MatchmakingManager.get_average_power_level = function (self)
	local total_power_level = 0
	local num_players = 0
	local human_players = Managers.player:human_players()

	for unique_id, player in pairs(human_players) do
		if player:sync_data_active() then
			local power_level = player:get_data("power_level")

			if power_level then
				total_power_level = total_power_level + power_level
				num_players = num_players + 1
			end
		end
	end

	if num_players == 0 then
		return 0
	end

	return math.floor(total_power_level / num_players)
end

MatchmakingManager.get_average_weave_progression = function (self)
	return 1
end

MatchmakingManager.has_required_power_level = function (self, lobby_data, profile_name, career_name)
	local difficulty = lobby_data.difficulty

	if not difficulty then
		return false
	end

	local difficulty_settings = DifficultySettings[difficulty]

	if not difficulty_settings then
		return false
	end

	local power_level = BackendUtils.get_total_power_level(profile_name, career_name)
	local required_power_level = difficulty_settings.required_power_level

	if power_level < required_power_level then
		return false
	end

	return true
end

MatchmakingManager._set_power_level = function (self)
	fassert(self.is_server, "You need to be the server.")

	local average_power_level = self:get_average_power_level()
	local lobby_data = self.lobby:get_stored_lobby_data()

	if average_power_level ~= lobby_data.power_level then
		lobby_data.power_level = average_power_level

		self.lobby:set_lobby_data(lobby_data)
	end
end

MatchmakingManager.state = function (self)
	return self._state
end

MatchmakingManager.gather_party_unlocked_journeys = function (self)
	local player_unlocked_journeys = {}
	local players = Managers.player:players()

	for stats_id, player in pairs(players) do
		player_unlocked_journeys[stats_id] = {}
		local unlocked_journeys = LevelUnlockUtils.unlocked_journeys(self.statistics_db, stats_id)
		player_unlocked_journeys[stats_id] = unlocked_journeys
	end

	local unlocked_journeys = {}

	for _, journey_name in ipairs(AvailableJourneyOrder) do
		local unlocked = true

		for stats_id, unlocked_journeys in pairs(player_unlocked_journeys) do
			if not table.find(unlocked_journeys, journey_name) then
				unlocked = false
			end
		end

		if unlocked then
			unlocked_journeys[#unlocked_journeys + 1] = journey_name
		end
	end

	return unlocked_journeys
end

MatchmakingManager.party_has_level_unlocked = function (self, level_key, ignore_dlc_check, ommit_dlc_levels, event_mode)
	local settings = LevelSettings[level_key]
	local players = Managers.player:human_players()
	local statistics_db = self.statistics_db
	local level_weights = self._level_weights
	local level_available = false

	for _, player in pairs(players) do
		local stats_id = player:stats_id()

		if ommit_dlc_levels and settings.dlc_name then
			return false
		end

		if not settings.dlc_name then
			if (not LevelUnlockUtils.level_unlocked(statistics_db, stats_id, level_key, true) and not event_mode) or settings.not_quickplayable then
				return false
			end
		elseif not LevelUnlockUtils.level_unlocked(statistics_db, stats_id, level_key, true) or settings.not_quickplayable then
			return false
		end

		if not ignore_dlc_check then
			if settings.dlc_name then
				local peer_id = player.peer_id

				if level_weights[peer_id] and level_weights[peer_id][level_key] then
					level_available = true
				end
			else
				level_available = true
			end
		end
	end

	if not ignore_dlc_check then
		return level_available
	end

	return true
end

MatchmakingManager._get_unlocked_levels_by_party = function (self, ignore_dlc_check, ommit_dlc_levels, event_mode, excluded_level_keys)
	local unlocked_levels = {}
	excluded_level_keys = excluded_level_keys or {}
	local level_keys = UnlockableLevelsByGameMode.adventure

	for _, level_key in ipairs(level_keys) do
		if self:party_has_level_unlocked(level_key, ignore_dlc_check, ommit_dlc_levels, event_mode) and not table.contains(excluded_level_keys, level_key) then
			unlocked_levels[#unlocked_levels + 1] = level_key
		end
	end

	return unlocked_levels
end

MatchmakingManager._get_unlocked_levels = function (self, ignore_dlc_check)
	local unlocked_levels = {}
	local statistics_db = self.statistics_db
	local player = Managers.player:local_player()
	local level_keys = UnlockableLevelsByGameMode.adventure

	for _, level_key in ipairs(level_keys) do
		local stats_id = player:stats_id()

		if LevelUnlockUtils.level_unlocked(statistics_db, stats_id, level_key) then
			unlocked_levels[#unlocked_levels + 1] = level_key
		end
	end

	return unlocked_levels
end

MatchmakingManager._get_level_key_from_level_weights = function (self, level_keys, event_mode)
	fassert(#level_keys > 0, "Empty level_keys list")

	local level_weights = self._level_weights
	local level_weights_by_index = {}
	local amount_players = 0

	for _, _ in pairs(level_weights) do
		amount_players = amount_players + 1
	end

	for i = 1, #level_keys, 1 do
		level_weights_by_index[i] = 0
		local level_key = level_keys[i]

		for _, weights_table in pairs(level_weights) do
			if weights_table[level_key] then
				level_weights_by_index[i] = level_weights_by_index[i] + weights_table[level_key]
			end
		end

		level_weights_by_index[i] = level_weights_by_index[i] / amount_players
	end

	local p, a = LoadedDice.create(level_weights_by_index, false)
	local result = LoadedDice.roll(p, a)
	local preferred_levels = {}

	for j = 1, #level_weights_by_index, 1 do
		local chosen_index = 1

		for i = 1, #level_weights_by_index, 1 do
			if level_weights_by_index[chosen_index] < level_weights_by_index[i] then
				chosen_index = i
			end
		end

		local level_key = level_keys[chosen_index]

		if (level_key and level_weights_by_index[chosen_index] >= 0) or event_mode then
			preferred_levels[#preferred_levels + 1] = level_key
		end

		level_weights_by_index[chosen_index] = -1
	end

	local mechanism = Managers.mechanism:game_mechanism()
	local inn_level_name = mechanism:get_hub_level_key()
	preferred_levels[#preferred_levels + 1] = inn_level_name

	return level_keys[result], preferred_levels
end

MatchmakingManager._calculate_level_weights = function (self, level_keys, recent_games_played)
	fassert(#level_keys > 0, "Empty level_keys list")

	local settings = MatchmakingSettings.quickplay_level_select_settings
	local player = Managers.player:local_player()
	local statistics_db = self.statistics_db
	local lookup_level_keys = NetworkLookup.unlockable_level_keys
	local stats_id = player:stats_id()
	local last_played_games = recent_games_played or {}
	local level_weight_by_lookup = {}

	for i = 1, #NetworkLookup.unlockable_level_keys, 1 do
		level_weight_by_lookup[i] = -1
	end

	for i = 1, #level_keys, 1 do
		local level_key = level_keys[i]
		local level_index = lookup_level_keys[level_key]
		local base_weight = settings.base_level_weight
		local progression_multiplier = settings.progression_multiplier
		level_weight_by_lookup[level_index] = base_weight
		local level_completed = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, level_key)

		if not level_completed or level_completed == 0 then
			level_weight_by_lookup[level_index] = level_weight_by_lookup[level_index] * progression_multiplier
		end
	end

	local function sort(a, b)
		local picked_a = a.timestamp
		local picked_b = b.timestamp

		return picked_b < picked_a
	end

	table.sort(last_played_games, sort)

	local amount_of_relevant_games = settings.amount_of_relevant_games

	while amount_of_relevant_games < #last_played_games do
		last_played_games[#last_played_games] = nil
	end

	local win_multiplier = settings.win_multiplier
	local loss_multiplier = settings.loss_multiplier

	for i = 1, #last_played_games, 1 do
		local level_key = last_played_games[i].level_name

		if level_key and table.contains(lookup_level_keys, level_key) then
			local level_index = lookup_level_keys[level_key]

			if level_index then
				local multiplier = (last_played_games[i].game_won and win_multiplier) or loss_multiplier
				level_weight_by_lookup[level_index] = level_weight_by_lookup[level_index] - (multiplier * (#last_played_games - i + 1)) / #last_played_games

				if level_weight_by_lookup[level_index] < 0 then
					level_weight_by_lookup[level_index] = 0
				end
			end
		end
	end

	return level_weight_by_lookup
end

MatchmakingManager._add_level_weight = function (self, peer_id, weight_array)
	local level_weights = self._level_weights
	local stripped_weights_array = {}
	local lookup_level_keys = NetworkLookup.unlockable_level_keys

	for key, value in pairs(weight_array) do
		if value ~= -1 then
			local level_key = lookup_level_keys[key]
			stripped_weights_array[level_key] = value
		end
	end

	level_weights[peer_id] = stripped_weights_array
end

MatchmakingManager._remove_irrelevant_level_weights = function (self)
	local level_weights = self._level_weights
	local players = Managers.player:human_players()

	for key_id, _ in pairs(level_weights) do
		local exists = false

		for _, player in pairs(players) do
			if key_id == player.peer_id then
				exists = true

				break
			end
		end

		if not exists then
			level_weights[key_id] = nil
		end
	end

	self._level_weights = level_weights
end

MatchmakingManager.get_weighed_random_unlocked_level = function (self, ignore_dlc_check, custom_game, excluded_level_keys)
	local recent_games_played_json = Managers.backend:get_read_only_data("recent_quickplay_games")
	local recent_games_played = (recent_games_played_json and cjson.decode(recent_games_played_json)) or {}
	local search_config = self.state_context.search_config
	local is_event_mode = search_config.game_mode == "event"

	if not DEDICATED_SERVER then
		local unlocked_levels = self:_get_unlocked_levels()
		local my_level_weights = self:_calculate_level_weights(unlocked_levels, recent_games_played)
		local my_id = Managers.player:local_player().peer_id

		self:_add_level_weight(my_id, my_level_weights)
	end

	self:_remove_irrelevant_level_weights()

	local ommit_dlc_levels = true
	local has_full_game = not script_data.settings.use_beta_mode

	if has_full_game then
		ommit_dlc_levels = not self:_party_has_completed_act("act_4")

		if custom_game then
			ommit_dlc_levels = false
		end
	end

	local level_keys = self:_get_unlocked_levels_by_party(ignore_dlc_check, ommit_dlc_levels, is_event_mode, excluded_level_keys)
	local level_key, preferred_levels = self:_get_level_key_from_level_weights(level_keys, is_event_mode)

	return level_key, preferred_levels
end

MatchmakingManager._party_has_completed_act = function (self, act_name)
	local players = Managers.player:human_players()
	local statistics_db = self.statistics_db

	for _, player in pairs(players) do
		local stats_id = player:stats_id()

		if not LevelUnlockUtils.act_completed(statistics_db, stats_id, act_name) then
			return false
		end
	end

	return true
end

MatchmakingManager.set_matchmaking_data = function (self, next_mission_id, difficulty, act_key, matchmaking_type, private_game, quick_game, eac_authorized, environment_id, mechanism)
	local level_transition_handler = Managers.level_transition_handler
	local current_level_key = level_transition_handler:get_current_level_keys()
	local lobby_members = self.lobby:members()
	local members = lobby_members:get_members()
	local num_players = #members
	local is_matchmaking = not private_game
	local lobby_data = self.lobby:get_stored_lobby_data()
	lobby_data.mission_id = current_level_key
	lobby_data.matchmaking_type = (not IS_PS4 and NetworkLookup.matchmaking_types[matchmaking_type]) or matchmaking_type
	lobby_data.act_key = act_key
	lobby_data.matchmaking = (is_matchmaking and "true") or "false"
	lobby_data.selected_mission_id = next_mission_id or LevelHelper:current_level_settings().level_id
	lobby_data.unique_server_name = LobbyAux.get_unique_server_name()
	lobby_data.host = Network.peer_id()
	lobby_data.num_players = num_players
	lobby_data.difficulty = difficulty
	lobby_data.quick_game = (quick_game and "true") or "false"
	lobby_data.country_code = (rawget(_G, "Steam") and Steam.user_country_code()) or Managers.account:region()
	lobby_data.twitch_enabled = (GameSettingsDevelopment.twitch_enabled and Managers.twitch:is_connected() and Managers.twitch:game_mode_supported(matchmaking_type, difficulty) and "true") or "false"
	lobby_data.eac_authorized = (eac_authorized and "true") or "false"
	lobby_data.mechanism = mechanism
	lobby_data.match_started = "true"

	print("[MATCHMAKING] - Hosting game on mission:", current_level_key, next_mission_id, environment_id)
	self.lobby:set_lobby_data(lobby_data)
end

MatchmakingManager.on_dedicated_server = function (self)
	return self.lobby:is_dedicated_server()
end

MatchmakingManager.weave_vote_result = function (self, accepted)
	if self._state.NAME == "MatchmakingStateSearchForWeaveGroup" then
		self._state:weave_vote_result(accepted)
	elseif IS_XB1 and self._state.NAME == "MatchmakingStateRequestJoinGame" then
		self._state:weave_vote_result(accepted)
	else
		self:cancel_matchmaking()
	end
end

MatchmakingManager.find_game = function (self, search_config)
	if self.is_server then
		local dedicated_server = search_config.dedicated_server

		fassert(dedicated_server ~= nil, "Dedicated server game wasn't set!")

		self.state_context = {
			search_config = table.clone(search_config),
			started_matchmaking_t = Managers.time:time("main")
		}
		local private_game = search_config.private_game

		fassert(private_game ~= nil, "Private game wasn't set!")

		local quick_game = search_config.quick_game

		fassert(quick_game ~= nil, "Quick game wasn't set!")
		self:set_quick_game(quick_game)

		local join_method = search_config.join_method

		if join_method == "party" then
			fassert(search_config.party_members ~= nil, "Missing party members for party join")
			fassert(search_config.party_lobby_host ~= nil, "Missing party lobby for party join")
		end

		local matchmaking_type = search_config.matchmaking_type
		local next_state = nil

		if dedicated_server then
			if join_method == "party" then
				fassert(search_config.wait_for_join_message ~= nil, "Missing wait_for_join_message for dedicated server party join.")

				next_state = MatchmakingStateReserveLobby
			else
				fassert(false, "Join method %s not implemented", join_method)
			end
		else
			local num_active_peers = self.network_server:num_active_peers()
			local people_in_local_hosted_party = num_active_peers > 1
			local always_host = search_config.always_host

			if private_game or people_in_local_hosted_party or always_host or ALWAYS_HOST_GAME then
				if quick_game and IS_XB1 then
					local ignore_dlc_check = false

					if Managers.account:offline_mode() then
						ignore_dlc_check = false
					end

					local excluded_level_keys = search_config.excluded_level_keys
					self.state_context.search_config.mission_id = self:get_weighed_random_unlocked_level(ignore_dlc_check, false, excluded_level_keys)
				end

				if search_config.matchmaking_start_state then
					next_state = rawget(_G, search_config.matchmaking_start_state)
				else
					next_state = MatchmakingStateHostGame
				end
			elseif search_config.matchmaking_start_state then
				next_state = rawget(_G, search_config.matchmaking_start_state)
			else
				next_state = MatchmakingStateSearchGame
			end
		end

		local search_info = self:search_info()
		local mission_id = search_info.mission_id
		local difficulty = search_info.difficulty
		local quick_game = search_info.quick_game
		local mechanism = search_info.mechanism
		local mission_id_lookup = (mission_id and NetworkLookup.mission_ids[mission_id]) or NetworkLookup.mission_ids["n/a"]
		local difficulty_lookup = (difficulty and NetworkLookup.difficulties[difficulty]) or NetworkLookup.difficulties.normal
		local mechanism_lookup = (mechanism and NetworkLookup.mechanisms[mechanism]) or NetworkLookup.mechanisms.adventure

		self.network_transmit:send_rpc_clients("rpc_set_matchmaking", true, private_game, mission_id_lookup, difficulty_lookup, quick_game, mechanism_lookup)
		self:_change_state(next_state, self.params, self.state_context)

		self.start_matchmaking_time = 1000000
	end
end

MatchmakingManager.cancel_matchmaking = function (self)
	self:set_local_quick_game(false)
	mm_printf("Cancelling matchmaking")

	local is_matchmaking = self:is_game_matchmaking()

	if not is_matchmaking then
		if not self.is_server and not self.lobby:is_dedicated_server() then
			self._joining_this_host_peer_id = nil
		end

		mm_printf("Wasn't really matchmaking to begin with...")

		return
	end

	local party = Managers.party

	if not self.is_server and self.lobby:is_dedicated_server() then
		if party.is_leader(self.peer_id) then
			self.network_transmit:send_rpc_server("rpc_cancel_matchmaking")
		end

		return
	end

	if IS_WINDOWS or IS_LINUX then
		local player = Managers.player:local_player(1)
		local connection_state = "cancelled"
		local started_matchmaking_t = self.state_context.started_matchmaking_t

		if started_matchmaking_t ~= nil then
			local t = Managers.time:time("main") or started_matchmaking_t
			local time_taken = t - started_matchmaking_t
			local using_strict_matchmaking = self.state_context.search_config.strict_matchmaking

			Managers.telemetry.events:matchmaking_cancelled(player, time_taken, self.state_context.search_config)
		end
	end

	self.state_context = {}

	if self._state then
		if self._state.terminate then
			self._state:terminate()
		end

		if self._state.lobby_client then
			self._state.lobby_client:destroy()

			self._state.lobby_client = nil
		end

		if self._state._lobby_client then
			self._state._lobby_client:destroy()

			self._state._lobby_client = nil
		end

		if self._state._lobby_unclaimed then
			self._state._lobby_unclaimed:destroy()

			self._state._lobby_unclaimed = nil
		end

		local ui_manager = Managers.ui

		if ui_manager:get_active_popup("profile_picker") then
			ui_manager:close_popup("profile_picker")
		end

		self:_change_state(MatchmakingStateIdle, self.params, self.state_context, "cancel_matchmaking")
	end

	if self.is_server then
		local stored_lobby_data = self.lobby:get_stored_lobby_data()
		stored_lobby_data.matchmaking = "false"
		stored_lobby_data.difficulty = "normal"
		stored_lobby_data.selected_mission_id = LevelHelper:current_level_settings().level_id
		stored_lobby_data.matchmaking_type = (not IS_PS4 and NetworkLookup.matchmaking_types["n/a"]) or "n/a"

		self.lobby:set_lobby_data(stored_lobby_data)

		local mission_id_lookup = NetworkLookup.mission_ids["n/a"]
		local difficulty_lookup = NetworkLookup.difficulties.normal
		local mechanism_lookup = NetworkLookup.mechanisms.adventure
		local quick_game = false

		Managers.state.difficulty:set_difficulty("normal", 0)

		if IS_XB1 then
			self.lobby:enable_matchmaking(false)
		end

		self.network_transmit:send_rpc_clients("rpc_set_matchmaking", false, false, mission_id_lookup, difficulty_lookup, quick_game, mechanism_lookup)
		self:reset_lobby_filters()
		self:set_quick_game(false)

		if not DEDICATED_SERVER then
			party:set_leader(self.network_server.lobby_host:lobby_host())
		end

		Managers.level_transition_handler:clear_next_level()

		local slot_reservation_handler = Managers.mechanism:get_slot_reservation_handler()

		if slot_reservation_handler then
			local my_peer_id = Network.peer_id()
			local group_leaders = slot_reservation_handler:get_group_leaders()

			for _, peer_id in ipairs(group_leaders) do
				if peer_id ~= my_peer_id then
					self.network_transmit:send_rpc("rpc_cancel_matchmaking", peer_id)
				end
			end

			local force_remove_reservations = true

			slot_reservation_handler:remove_peer_reservations(my_peer_id, force_remove_reservations)
		end
	else
		party:set_leader(nil)
	end

	self._joining_this_host_peer_id = nil
end

MatchmakingManager.is_matchmaking_in_inn = function (self)
	local name = self._state.NAME
	local is_matchmaking = name ~= "MatchmakingStateIdle"

	return self.is_in_inn and is_matchmaking, name
end

MatchmakingManager.is_game_matchmaking = function (self)
	local name = self._state.NAME
	local is_matchmaking = name ~= "MatchmakingStateIdle"
	local search_config = self.state_context.search_config
	local private_game = (search_config and search_config.private_game) or false
	local reason = self._state.reason

	return is_matchmaking, private_game, reason
end

MatchmakingManager.active_game_mode = function (self)
	local name = self._state.NAME
	local is_matchmaking = name ~= "MatchmakingStateIdle"
	local matchmaking_type = is_matchmaking and self.lobby:lobby_data("matchmaking_type")

	if not IS_PS4 then
		matchmaking_type = matchmaking_type and NetworkLookup.matchmaking_types[tonumber(matchmaking_type)]
	end

	return matchmaking_type
end

MatchmakingManager.rpc_set_matchmaking = function (self, channel_id, is_matchmaking, private_game, mission_id, difficulty_id, quick_game, mechanism_id)
	if not self.is_server then
		mm_printf_force("Set matchmaking=%s, private_game=%s", tostring(is_matchmaking), tostring(private_game))

		if is_matchmaking then
			local mission_id = NetworkLookup.mission_ids[mission_id]
			local difficulty = NetworkLookup.difficulties[difficulty_id]
			local mechanism = NetworkLookup.mechanisms[mechanism_id]
			self._host_matchmaking_data.mission_id = mission_id
			self._host_matchmaking_data.difficulty = difficulty
			self._host_matchmaking_data.quick_game = quick_game
			self._host_matchmaking_data.mechanism = mechanism
			local state_context = {
				private_game = private_game,
				mechanism = mechanism
			}

			self:_change_state(MatchmakingStateFriendClient, self.params, state_context)
		else
			local current_state = self._state

			if current_state.lobby_client then
				current_state.lobby_client:destroy()

				current_state.lobby_client = nil
			end

			if current_state._lobby_client then
				current_state._lobby_client:destroy()

				current_state._lobby_client = nil
			end

			table.clear(self._host_matchmaking_data)
			self:_change_state(MatchmakingStateIdle, self.params, {})
			self:set_local_quick_game(false)
		end
	end
end

MatchmakingManager.rpc_set_game_mode_event_data = function (self, channel_id, mutator_lookup_array)
	local mutators = {}

	for i = 1, #mutator_lookup_array, 1 do
		local mutator_id = mutator_lookup_array[i]
		mutators[i] = NetworkLookup.mutator_templates[mutator_id]
	end

	self._game_mode_event_data = {
		mutators = mutators
	}
end

MatchmakingManager.rpc_clear_game_mode_event_data = function (self, channel_id)
	self:clear_game_mode_event_data()
end

MatchmakingManager.rpc_cancel_matchmaking = function (self, channel_id)
	if not self.is_server then
		return
	end

	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if not Managers.party:is_leader(peer_id) then
		return
	end

	self:cancel_matchmaking()
end

MatchmakingManager.rpc_matchmaking_request_profiles_data = function (self, channel_id)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]
	local peer_ids, player_indices = self.profile_synchronizer:get_packed_lobby_profile_slots()

	mm_printf("PROFILES REQUESTED BY %s REPLY wh:%s | we:%s | dr:%s | bw:%s | es:%s", peer_id, peer_ids[1], peer_ids[4], peer_ids[3], peer_ids[2], peer_ids[5])
	self.network_transmit:send_rpc("rpc_matchmaking_request_profiles_data_reply", peer_id, peer_ids, player_indices)
end

MatchmakingManager._extract_dlcs = function (self, client_dlc_unlocked_array)
	local client_unlocked_dlcs = {}

	for idx, dlc_id in ipairs(client_dlc_unlocked_array) do
		local dlc_name = NetworkLookup.dlcs[dlc_id]
		client_unlocked_dlcs[dlc_name] = true
	end

	return client_unlocked_dlcs
end

MatchmakingManager._missing_required_dlc = function (self, mechanism, difficulty_key, client_unlocked_dlcs)
	local mechanism_settings = mechanism and MechanismSettings[mechanism]

	if mechanism_settings and mechanism_settings.required_dlc and not client_unlocked_dlcs[mechanism_settings.required_dlc] then
		return mechanism_settings.required_dlc
	end

	local difficulty_settings = difficulty_key and DifficultySettings[difficulty_key]

	if difficulty_settings and difficulty_settings.dlc_requirement and not client_unlocked_dlcs[difficulty_settings.dlc_requirement] then
		return difficulty_settings.dlc_requirement
	end

	return nil
end

MatchmakingManager.rpc_matchmaking_request_join_lobby = function (self, channel_id, lobby_id, friend_join, client_dlc_unlocked_array)
	local id = self.lobby:id()
	id = tostring(id)
	lobby_id = tostring(lobby_id)
	local reply = "lobby_ok"
	local reply_variable = 1
	local lobby_id_match = nil

	if DEDICATED_SERVER then
		lobby_id_match = id == lobby_id
	else
		lobby_id_match = (LobbyInternal.lobby_id_match and LobbyInternal.lobby_id_match(id, lobby_id)) or id == lobby_id
	end

	local peer_id = CHANNEL_TO_PEER_ID[channel_id]
	local client_unlocked_dlcs = self:_extract_dlcs(client_dlc_unlocked_array)
	local game_mode_manager = Managers.state.game_mode
	local difficulty_manager = Managers.state.difficulty
	local mechanism_manager = Managers.mechanism
	local game_mode_key = game_mode_manager and game_mode_manager:game_mode_key()
	local difficulty_key = difficulty_manager and difficulty_manager:get_difficulty()
	local is_venture_over = mechanism_manager:is_venture_over()
	local is_searching_for_players = self._state.NAME == "MatchmakingStateHostGame" or self._state.NAME == "MatchmakingStateIngame" or self._state.NAME == "MatchmakingStateWaitForCountdown" or self._state.NAME == "MatchmakingStateHostFindWeaveGroup"
	local matchmaking = self.lobby:lobby_data("matchmaking")
	local lobby_matchmaking_type_id = self.lobby:lobby_data("matchmaking_type")
	local lobby_matchmaking_type_index = tonumber(lobby_matchmaking_type_id)
	local lobby_matchmaking_type = (IS_PS4 and lobby_matchmaking_type_id) or (lobby_matchmaking_type_index and NetworkLookup.matchmaking_types[lobby_matchmaking_type_index]) or "n/a"
	local lobby_mechanism = self.lobby:lobby_data("mechanism")
	local lobby_difficulty = self.lobby:lobby_data("difficulty")
	local is_friend = false

	if not DEDICATED_SERVER then
		is_friend = LobbyInternal.is_friend(peer_id) or friend_join
	end

	local user_blocked = nil

	if not DEDICATED_SERVER and IS_WINDOWS then
		local relationship = Friends.relationship(peer_id)
		user_blocked = relationship == 5 or relationship == 6
	end

	local missing_dlc = self:_missing_required_dlc(lobby_mechanism, difficulty_key, client_unlocked_dlcs)

	if not lobby_id_match then
		reply = "lobby_id_mismatch"
	elseif user_blocked then
		reply = "user_blocked"
	elseif is_venture_over then
		reply = "game_mode_ended"
	elseif not DEDICATED_SERVER and not is_friend and not is_searching_for_players then
		reply = "not_searching_for_players"
	elseif Managers.deed:has_deed() then
		reply = "lobby_has_active_deed"
	elseif missing_dlc then
		reply_variable = NetworkLookup.dlcs[missing_dlc]
		reply = "dlc_required"
	elseif not Development.parameter("allow_weave_joining") then
		if game_mode_key == "weave" and matchmaking == "false" then
			local weave_manager = Managers.weave
			local player_ids = weave_manager:get_player_ids()

			if not player_ids[peer_id] then
				reply = "cannot_join_weave"
			end
		elseif lobby_mechanism == "weave" and matchmaking == "false" then
			local loading_context = Boot.loading_context
			local weave_data = loading_context and loading_context.weave_data
			local player_ids = weave_data and weave_data.player_ids

			if player_ids then
				if not player_ids[peer_id] then
					reply = "cannot_join_weave"
				end
			else
				reply = "cannot_join_weave"
			end
		end
	end

	local mechanism = Managers.mechanism:game_mechanism()

	if not reply and mechanism.ok_to_friend_join then
		reply = mechanism.ok_to_friend_join(peer_id)
	end

	mm_printf_force("Got request to join matchmaking lobby %s from %s, replying %s", lobby_id, peer_id, reply)

	local reply_id = NetworkLookup.game_ping_reply[reply]

	self.network_transmit:send_rpc("rpc_matchmaking_request_join_lobby_reply", peer_id, reply_id, reply_variable)
end

MatchmakingManager.rpc_matchmaking_request_profile = function (self, channel_id, profile)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]
	local success = self.profile_synchronizer:try_reserve_profile_for_peer(peer_id, profile)

	self.network_transmit:send_rpc("rpc_matchmaking_request_profile_reply", peer_id, profile, success)
end

MatchmakingManager.current_state = function (self)
	return (self._state and self._state.NAME) or "none"
end

MatchmakingManager.get_transition = function (self)
	if self._state and self._state.get_transition then
		local transition, object = self._state:get_transition()

		if transition ~= nil then
			return transition, object
		end
	end

	if self.lobby_to_join then
		return "join_lobby", self.lobby_to_join
	end
end

MatchmakingManager.loading_context = function (self)
	if self._state and self._state.loading_context then
		return self._state:loading_context()
	end
end

MatchmakingManager.active_lobby = function (self)
	if self._state and self._state.active_lobby then
		return self._state:active_lobby()
	end

	return self.lobby
end

MatchmakingManager.hero_available_in_lobby_data = function (self, hero_index, lobby_data)
	local search_config = self.state_context.search_config

	if search_config then
		local allow_duplicate_heroes = search_config.allow_duplicate_heroes

		if allow_duplicate_heroes then
			return true
		end
	end

	if ProfileSynchronizer.is_free_in_lobby(hero_index, lobby_data) then
		return true
	end

	local local_player = Managers.player:local_player()
	local peer_id = local_player.peer_id
	local local_player_id = local_player:profile_id()
	local owner_peer, owner_player_id = ProfileSynchronizer.owner_in_lobby(hero_index, lobby_data)

	if owner_peer == peer_id and owner_player_id == local_player_id then
		return true
	end

	return false
end

MatchmakingManager.lobby_match = function (self, lobby_data, act_key, mission_id, difficulty, matchmaking_type, player_peer_id, weave_name, mechanism)
	local lobby_id = lobby_data.id
	local broken_lobby = self:lobby_listed_as_broken(lobby_id)

	if broken_lobby then
		return false, "lobby listed as broken"
	end

	if lobby_data.host == player_peer_id then
		return false, "players own lobby"
	end

	if IS_WINDOWS then
		local party_members = {
			lobby_data.player_slot_1,
			lobby_data.player_slot_2,
			lobby_data.player_slot_3,
			lobby_data.player_slot_4,
			lobby_data.player_slot_5
		}

		for i = 1, #party_members, 1 do
			local relationship = Friends.relationship(party_members[i])
			local user_blocked = relationship == 5 or relationship == 6

			if user_blocked then
				return false, "user blocked"
			end
		end
	end

	if lobby_data.twitch_enabled == "true" then
		return false, "twitch_mode"
	end

	local valid_lobby = lobby_data.matchmaking ~= "false" and lobby_data.valid

	if not valid_lobby then
		return false, "lobby is not valid"
	end

	local lobby_mission_id = lobby_data.mission_id

	if lobby_mission_id == "prologue" then
		return false, "in prologue"
	end

	local lobby_mechanism = lobby_data.mechanism

	if lobby_mechanism == "deus" and mission_id == "any" then
		local lobby_data_selected_mission_id = lobby_data.selected_mission_id

		if DeusJourneySettings[lobby_data_selected_mission_id] then
			local stats_id = Managers.player:local_player():stats_id()
			local unlocked_journeys = LevelUnlockUtils.unlocked_journeys(self.statistics_db, stats_id)

			if not table.find(unlocked_journeys, lobby_data_selected_mission_id) then
				return false, "Journey is not unlocked"
			end
		end
	end

	if mission_id and mission_id ~= "any" then
		local correct_mission = false
		local reason = "<no lobby level>"

		if lobby_data.selected_mission_id then
			correct_mission = lobby_data.selected_mission_id == mission_id
			reason = string.format("(%s ~= %s)", mission_id, lobby_data.selected_mission_id)
		elseif lobby_data.mission_id then
			correct_mission = lobby_data.mission_id == mission_id
			reason = string.format("(%s ~= %s)", mission_id, lobby_data.mission_id)
		end

		if not correct_mission then
			return false, "wrong mission " .. reason
		end
	end

	if act_key and lobby_data.act_key ~= act_key then
		return false, "wrong act"
	end

	if matchmaking_type == "event" then
		local lobby_matchmaking_type = lobby_data.matchmaking_type

		if not IS_PS4 then
			local lobby_data_matchmaking_type_index = tonumber(lobby_matchmaking_type)
			lobby_matchmaking_type = lobby_data_matchmaking_type_index and NetworkLookup.matchmaking_types[lobby_data_matchmaking_type_index]
		end

		if matchmaking_type ~= lobby_matchmaking_type then
			return false, "wrong game mode"
		end
	end

	if mechanism == "weave" then
		if weave_name ~= "false" then
			local lobby_weave_name = lobby_data.selected_mission_id or lobby_data.mission_id

			if weave_name ~= lobby_weave_name then
				return false, "wrong weave name"
			end
		else
			local lobby_quick_game = lobby_data.quick_game

			if lobby_quick_game ~= "true" then
				return false, "ranked weave"
			end
		end
	end

	if difficulty then
		local correct_difficulty = lobby_data.difficulty == difficulty

		if not correct_difficulty then
			return false, "wrong difficulty"
		end
	end

	local num_players = lobby_data.num_players and tonumber(lobby_data.num_players)
	local search_config = self.state_context.search_config
	local max_number_of_players = search_config.max_number_of_players or MatchmakingSettings.MAX_NUMBER_OF_PLAYERS
	local has_empty_slot = num_players and num_players < max_number_of_players

	if not has_empty_slot then
		return false, "no empty slot"
	end

	if script_data.unique_server_name and lobby_data.unique_server_name ~= script_data.unique_server_name then
		Debug.text("Ignoring lobby due to mismatching unique_server_name")

		return false, "mismatching unique_server_name"
	end

	return true
end

MatchmakingManager.add_broken_lobby_client = function (self, lobby_client, t, is_bad_connection_or_otherwise_not_nice)
	if lobby_client == nil then
		return
	end

	local time_to_ignore = (is_bad_connection_or_otherwise_not_nice and 120) or 20
	local broken_until = t + time_to_ignore

	if lobby_client:is_dedicated_server() then
		local ip_port = lobby_client:ip_address()

		mm_printf("Adding broken server: %s Due to bad connection or something: %s, ignoring it for %d seconds", ip_port, tostring(is_bad_connection_or_otherwise_not_nice), time_to_ignore)

		MatchmakingManager._broken_servers[ip_port] = broken_until
	else
		local lobby_id = lobby_client:id()

		mm_printf("Adding broken lobby: %s Due to bad connection or something: %s, ignoring it for %d seconds", tostring(lobby_id), tostring(is_bad_connection_or_otherwise_not_nice), time_to_ignore)

		MatchmakingManager._broken_lobbies[lobby_id] = broken_until
	end
end

MatchmakingManager.lobby_listed_as_broken = function (self, lobby_id)
	return MatchmakingManager._broken_lobbies[lobby_id]
end

MatchmakingManager.server_listed_as_broken = function (self, ip_port)
	return MatchmakingManager._broken_servers[ip_port]
end

MatchmakingManager.broken_server_map = function (self)
	return MatchmakingManager._broken_servers
end

MatchmakingManager.rpc_matchmaking_request_join_lobby_reply = function (self, channel_id, reply_id, reply_variable)
	if self._state and self._state.NAME == "MatchmakingStateRequestJoinGame" then
		self._state:rpc_matchmaking_request_join_lobby_reply(channel_id, reply_id, reply_variable)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_request_join_lobby_reply, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_notify_connected = function (self, channel_id)
	local state_name = (self._state and self._state.NAME) or "none"

	if state_name == "MatchmakingStateRequestJoinGame" or state_name == "MatchmakingStateRequestGameServerOwnership" or state_name == "MatchmakingStateReserveSlotsPlayerHosted" then
		self._state:rpc_notify_connected(channel_id)
	else
		mm_printf_force("rpc_notify_connected, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_matchmaking_join_game = function (self, channel_id)
	if (self._state and self._state.NAME == "MatchmakingStateJoinGame") or self._state.NAME == "MatchmakingStateWaitJoinPlayerHosted" then
		self._state:rpc_matchmaking_join_game(channel_id)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_join_game, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_matchmaking_request_profile_reply = function (self, channel_id, profile, reply)
	if self._state and self._state.NAME == "MatchmakingStateJoinGame" then
		self._state:rpc_matchmaking_request_profile_reply(channel_id, profile, reply)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_request_profile_reply, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_matchmaking_request_profiles_data_reply = function (self, channel_id, profile_array, player_id_array)
	if self._state and self._state.NAME == "MatchmakingStateRequestProfiles" then
		self._state:rpc_matchmaking_request_profiles_data_reply(channel_id, profile_array, player_id_array)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_request_profiles_data_reply, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_matchmaking_request_selected_level = function (self, channel_id)
	if self._state and self._state.NAME == "MatchmakingStateHostGame" then
		local lobby_data = self.lobby:get_stored_lobby_data()
		local selected_mission_id = lobby_data.selected_mission_id
		local selected_mission_id = NetworkLookup.mission_ids[selected_mission_id]

		RPC.rpc_matchmaking_request_selected_level_reply(channel_id, selected_mission_id)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_request_selected_level, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_matchmaking_request_selected_level_reply = function (self, channel_id, selected_level_id)
	if self._state and self._state.NAME == "MatchmakingStateFriendClient" then
		self._state:rpc_matchmaking_request_selected_level_reply(channel_id, selected_level_id)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_request_selected_level_reply, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_matchmaking_request_selected_difficulty = function (self, channel_id)
	if self._state and self._state.NAME == "MatchmakingStateHostGame" then
		local lobby_data = self.lobby:get_stored_lobby_data()
		local difficulty = lobby_data.difficulty
		local difficulty_id = NetworkLookup.difficulties[difficulty]

		RPC.rpc_matchmaking_request_selected_difficulty_reply(channel_id, difficulty_id)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_request_selected_difficulty, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_matchmaking_request_selected_difficulty_reply = function (self, channel_id, difficulty_id)
	if self._state and self._state.NAME == "MatchmakingStateFriendClient" then
		self._state:rpc_matchmaking_request_selected_difficulty_reply(channel_id, difficulty_id)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_request_selected_difficulty_reply, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_matchmaking_request_status_message = function (self, channel_id)
	if self._state and self._state.NAME == "MatchmakingStateHostGame" then
		local status_message = self.current_status_message

		if not status_message then
			return
		end

		RPC.rpc_matchmaking_status_message(channel_id, status_message)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_request_status_message, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_matchmaking_status_message = function (self, channel_id, status_message)
	if self._state and self._state.NAME == "MatchmakingStateFriendClient" then
		self._state:rpc_matchmaking_status_message(channel_id, status_message)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_status_message, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_game_server_set_group_leader = function (self, channel_id, peer_id)
	if peer_id == "0" then
		peer_id = nil
	end

	Managers.party:set_leader(peer_id)
end

MatchmakingManager.rpc_matchmaking_broadcast_game_server_ip_address = function (self, channel_id, ip_address)
	if self._state and self._state.NAME == "MatchmakingStateFriendClient" then
		self._state:rpc_matchmaking_broadcast_game_server_ip_address(channel_id, ip_address)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_broadcast_game_server_ip_address, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_game_server_reserve_slots = function (self, channel_id, peer_table)
	for _, peer_id in ipairs(peer_table) do
		self.network_server:add_reserve_slot(peer_id)
	end
end

MatchmakingManager.rpc_set_quick_game = function (self, channel_id, quick_game)
	self:set_quick_game(quick_game)
end

MatchmakingManager.rpc_start_game_countdown_finished = function (self, channel_id)
	self:countdown_completed()
end

MatchmakingManager.rpc_matchmaking_sync_quickplay_data = function (self, channel_id, weight_array)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	self:_add_level_weight(peer_id, weight_array)
end

MatchmakingManager.rpc_matchmaking_request_quickplay_data = function (self, channel_id)
	local unlocked_levels = self:_get_unlocked_levels()
	local recent_games_played_json = Managers.backend:get_read_only_data("recent_quickplay_games")
	local recent_games_played = (recent_games_played_json and cjson.decode(recent_games_played_json)) or {}
	local ignore_dlc_check = false
	local weight_array = self:_calculate_level_weights(unlocked_levels, recent_games_played, ignore_dlc_check)

	self.network_transmit:send_rpc_server("rpc_matchmaking_sync_quickplay_data", weight_array)
end

MatchmakingManager.rpc_matchmaking_verify_dlc = function (self, channel_id, dlc_name_ids)
	if self._state then
		local success = true

		for _, dlc_name_id in pairs(dlc_name_ids) do
			local dlc_name = NetworkLookup.dlcs[dlc_name_id]

			if not Managers.unlock:is_dlc_unlocked(dlc_name) then
				success = false

				break
			end
		end

		Managers.state.network.network_transmit:send_rpc_server("rpc_matchmaking_verify_dlc_reply", success)
	end
end

MatchmakingManager.rpc_matchmaking_verify_dlc_reply = function (self, channel_id, success)
	if self._state and self._state.NAME == "MatchmakingStateStartGame" then
		self._state:rpc_matchmaking_verify_dlc_reply(channel_id, success)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_verify_dlc_reply, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_join_reserved_game_server = function (self, channel_id)
	local state_name = (self._state and self._state.NAME) or "none"

	if state_name == "MatchmakingStateReserveLobby" then
		self._state:rpc_join_reserved_game_server(channel_id)
	else
		mm_printf_force("rpc_join_reserved_game_server, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.hot_join_sync = function (self, peer_id)
	self.peers_to_sync[peer_id] = true
	local channel_id = PEER_ID_TO_CHANNEL[peer_id]
	local game_mode_event_data = self._game_mode_event_data

	if game_mode_event_data then
		local mutators = game_mode_event_data.mutators
		local mutator_lookup_array = {}

		for i = 1, #mutators, 1 do
			local mutator_name = mutators[i]
			mutator_lookup_array[i] = NetworkLookup.mutator_templates[mutator_name]
		end

		RPC.rpc_set_game_mode_event_data(channel_id, mutator_lookup_array)
	else
		RPC.rpc_clear_game_mode_event_data(channel_id)
	end

	RPC.rpc_set_client_game_privacy(channel_id, self:is_game_private())
	RPC.rpc_set_quick_game(channel_id, self:is_quick_game())
	RPC.rpc_matchmaking_request_quickplay_data(channel_id)
end

MatchmakingManager.countdown_completed = function (self)
	local tell_server = not self.countdown_has_finished and not self.is_server and Managers.party:is_leader(self.peer_id) and self:on_dedicated_server()

	if tell_server then
		self.countdown_has_finished = false

		self.network_transmit:send_rpc_server("rpc_start_game_countdown_finished")

		return
	end

	self.countdown_has_finished = true
end

MatchmakingManager.set_status_message = function (self, status_message)
	if status_message == self.current_status_message then
		return
	end

	self.current_status_message = status_message

	if self.is_server then
		self.network_transmit:send_rpc_clients("rpc_matchmaking_status_message", status_message)
	end
end

MatchmakingManager.setup_filter_requirements = function (self, number_of_players, distance_filter, filters, near_filters)
	filters.network_hash = {
		comparison = "equal",
		value = self._network_hash
	}
	filters.matchmaking = {
		value = "true",
		comparison = "equal"
	}
	local requirements = {
		free_slots = number_of_players,
		distance_filter = distance_filter,
		filters = table.clone(filters),
		near_filters = table.clone(near_filters)
	}

	self.lobby_finder:add_filter_requirements(requirements)
end

MatchmakingManager.request_join_lobby = function (self, lobby, state_context_params)
	local friend_join = state_context_params and state_context_params.friend_join

	if self._state.NAME ~= "MatchmakingStateIdle" and not friend_join then
		mm_printf("trying to join lobby from lobby browser in wrong state %s", self._state.NAME)

		return
	end

	local new_state = MatchmakingStateRequestJoinGame

	mm_printf("Joining lobby %s.", tostring(lobby))

	local state_context = {
		join_by_lobby_browser = true,
		join_lobby_data = lobby
	}

	table.merge(state_context, state_context_params or {})

	local t = Managers.time:time("main")
	self.started_matchmaking_t = t

	table.dump(state_context, "STATE_CONTEXT", 2)
	self:_change_state(new_state, self.params, state_context)
end

MatchmakingManager.is_joining_friend = function (self)
	return self.state_context.friend_join
end

MatchmakingManager.cancel_join_lobby = function (self, reason, reason_variable)
	self.state_context = {}

	if self._lobby_browser then
		self._lobby_browser:cancel_join_lobby(reason)
	end

	if reason == "dlc_required" and reason_variable then
		local dlc_name = NetworkLookup.dlcs[reason_variable]

		Managers.state.event:trigger("ui_show_popup", dlc_name, "upsell")
	elseif reason == "failure_start_join_server_difficulty_requirements_failed" then
		local text = Localize(reason)
		text = string.format(text, reason_variable or "")

		Managers.simple_popup:queue_popup(text, Localize("popup_error_topic"), "ok", Localize("popup_choice_ok"))
	elseif reason ~= "cancelled" then
		local status_message = "matchmaking_status_join_game_failed_" .. reason

		Managers.simple_popup:queue_popup(Localize(status_message), Localize("popup_error_topic"), "ok", Localize("popup_choice_ok"))
	end
end

MatchmakingManager.allowed_to_initiate_join_lobby = function (self)
	local matchmaking_status = self:_matchmaking_status()

	return matchmaking_status == "idle"
end

MatchmakingManager.allow_cancel_matchmaking = function (self)
	local state = self._state

	if state.lobby_client then
		if state.lobby_client:is_joined() then
			return true
		end
	else
		local state_name = state.NAME

		if state_name ~= "MatchmakingStateIdle" and state_name ~= "MatchmakingStateIngame" then
			return true
		end
	end
end

MatchmakingManager.send_system_chat_message = function (self, message, localization_param)
	local channel_id = 1
	local localization_param = ""
	local pop_chat = true
	local localize_parameters = false

	Managers.chat:send_system_chat_message(channel_id, message, localization_param, localize_parameters, pop_chat)
end

function DEBUG_LOBBIES()
	local lobby = Managers.matchmaking.lobby
	local lobby_data = lobby:get_stored_lobby_data()

	table.dump(lobby_data, "lobby_data")

	local active_lobby = Managers.matchmaking._state and Managers.matchmaking._state.active_lobby and Managers.matchmaking._state:active_lobby()
	local active_lobby_data = active_lobby and active_lobby:get_stored_lobby_data()

	if active_lobby_data then
		table.dump(active_lobby_data, "active_lobby_data")
	else
		print("no active_lobby")
	end
end

MatchmakingManager.rpc_set_client_game_privacy = function (self, channel_id, is_private)
	local lobby = self.lobby

	if not self.is_server then
		local stored_lobby_data = lobby:get_stored_lobby_data()
		stored_lobby_data.is_private = (is_private and "true") or "false"
	end
end

MatchmakingManager.set_game_privacy = function (self, is_private)
	local lobby = self.lobby

	if self.is_server and lobby:is_joined() then
		local value = (is_private and "true") or "false"

		self:_set_lobby_data(lobby, "is_private", value)
		Managers.state.network.network_transmit:send_rpc_clients("rpc_set_client_game_privacy", is_private)
	end
end

MatchmakingManager.set_in_progress_game_privacy = function (self, is_private)
	local lobby = self.lobby

	if self.is_server and lobby:is_joined() then
		self:set_game_privacy(is_private)

		local value = (is_private and "false") or "true"

		self:_set_lobby_data(lobby, "matchmaking", value)

		if not is_private then
			self:_change_state(MatchmakingStateIngame, self.params, {})
		else
			self:_change_state(MatchmakingStateIdle, self.params, {})
		end
	end
end

MatchmakingManager._set_lobby_data = function (self, lobby, field, value)
	local stored_lobby_data = lobby:get_stored_lobby_data()
	stored_lobby_data[field] = value

	lobby:set_lobby_data(stored_lobby_data)
end

MatchmakingManager.is_game_private = function (self)
	local lobby = self.lobby
	local stored_lobby_data = lobby:get_stored_lobby_data()
	local is_private = stored_lobby_data.is_private == "true"

	return is_private
end

MatchmakingManager.set_local_quick_game = function (self, quick_game)
	self._local_quick_game = quick_game or false
end

MatchmakingManager.is_local_quick_game = function (self)
	return self._local_quick_game
end

MatchmakingManager.set_quick_game = function (self, quick_game)
	self._quick_game = quick_game

	if self.is_server then
		Managers.state.network.network_transmit:send_rpc_clients("rpc_set_quick_game", quick_game)
	end
end

MatchmakingManager.is_quick_game = function (self)
	return self._quick_game
end

MatchmakingManager._matchmaking_status = function (self)
	local state_name = self._state.NAME

	if state_name == "MatchmakingStateIdle" then
		return "idle"
	elseif state_name == "MatchmakingStateSearchGame" then
		return "searching_for_game"
	elseif state_name == "MatchmakingStateHostGame" or state_name == "MatchmakingStateWaitForCountdown" or state_name == "MatchmakingStateStartGame" or state_name == "MatchmakingStateRequestGameServerOwnership" or state_name == "MatchmakingStatePlayerHostedGame" then
		return "hosting_game"
	elseif state_name == "MatchmakingStateRequestJoinGame" or state_name == "MatchmakingStateRequestProfiles" or state_name == "MatchmakingStateReserveLobby" or state_name == "MatchmakingStateJoinGame" then
		return "joining_game"
	elseif state_name == "MatchmakingStateFriendClient" then
		return "waiting_for_game_start"
	else
		return state_name
	end
end

MatchmakingManager.are_all_players_spawned = function (self)
	local lobby = self.lobby
	local members = lobby:members():get_members()
	local player_manager = Managers.player

	for i = 1, #members, 1 do
		local peer_id = members[i]
		local player = player_manager:player_from_peer_id(peer_id)

		if not player then
			return false
		end

		local player_unit = player.player_unit

		if not Unit.alive(player_unit) then
			return false
		end
	end

	return true
end

MatchmakingManager.get_reserved_slots = function (self)
	local state_context = self.state_context
	local search_config = state_context.search_config
	local reserved_slots_mask = 0
	local mechanism_name = nil

	if search_config and search_config.is_player_hosted then
		reserved_slots_mask = self.lobby:lobby_data("reserved_slots_mask") or reserved_slots_mask
		mechanism_name = self.lobby:lobby_data("mechanism")
	else
		local lobby = self._state.lobby_client or self._state._lobby_client or self._state._reserved_lobby_client or self.lobby

		if not lobby then
			return
		end

		reserved_slots_mask = lobby:lobby_data("reserved_slots_mask") or reserved_slots_mask
		mechanism_name = lobby:lobby_data("mechanism")
	end

	return self:_decode_reserved_slots_mask(reserved_slots_mask, mechanism_name)
end

local SLOTS = {}
local RESERVATIONS = {}

MatchmakingManager._decode_reserved_slots_mask = function (self, reserved_slots_mask, mechanism_name)
	table.clear(SLOTS)
	table.clear(RESERVATIONS)

	if not mechanism_name then
		return RESERVATIONS
	end

	local mechanism_settings = MechanismSettings[mechanism_name]
	local party_settings = mechanism_settings and mechanism_settings.party_data

	for party_name, party_data in pairs(party_settings) do
		if not party_data.spectator_party then
			SLOTS[party_data.party_id] = party_data.num_slots
		end
	end

	local start_bit = 0

	for party_id, num_slots in ipairs(SLOTS) do
		for i = 1, num_slots, 1 do
			local bit_value = (bit.band(reserved_slots_mask, bit.lshift(1, start_bit + i - 1)) > 0 and 1) or 0
			RESERVATIONS[party_id] = (RESERVATIONS[party_id] or 0) + bit_value
		end

		start_bit = start_bit + num_slots
	end

	return RESERVATIONS
end

local info = {}

MatchmakingManager.search_info = function (self)
	table.clear(info)

	local lobby_client = self._state.lobby_client or self._state._lobby_client

	if self.is_server then
		local search_config = self.state_context.search_config

		if search_config then
			info.mission_id = search_config.mission_id
			info.difficulty = search_config.difficulty
			info.quick_game = search_config.quick_game
			info.matchmaking_type = search_config.matchmaking_type
			info.mechanism = search_config.mechanism
		else
			local lobby = self._state.lobby_client or self._state._lobby_client

			if lobby then
				local mission_id = lobby:lobby_data("mission_id")
				local difficulty = lobby:lobby_data("difficulty")
				local matchmaking_type = lobby:lobby_data("matchmaking_type")
				local lobby_quick_game = lobby:lobby_data("quick_game") == "true"
				local quick_game = lobby_quick_game or self:is_quick_game()
				local mechanism = lobby:lobby_data("mechanism")
				info.mission_id = mission_id
				info.difficulty = difficulty
				info.quick_game = quick_game
				info.mechanism = mechanism
				info.matchmaking_type = (IS_PS4 and matchmaking_type) or (matchmaking_type and NetworkLookup.matchmaking_types[tonumber(matchmaking_type)])
			end
		end
	else
		local lobby = self.lobby
		local selected_mission_id = lobby:lobby_data("selected_mission_id")
		local difficulty = lobby:lobby_data("difficulty")
		local matchmaking_type = lobby:lobby_data("matchmaking_type")
		local mechanism = lobby:lobby_data("mechanism")
		local lobby_quick_game = lobby:lobby_data("quick_game") == "true"
		local quick_game = lobby_quick_game or self:is_quick_game()
		info.mission_id = selected_mission_id
		info.difficulty = difficulty
		info.quick_game = quick_game
		info.mechanism = mechanism
		info.matchmaking_type = (IS_PS4 and matchmaking_type) or (matchmaking_type and NetworkLookup.matchmaking_types[tonumber(matchmaking_type)])
	end

	local status = self:_matchmaking_status()
	info.status = status

	return info
end

MatchmakingManager.setup_weave_filters = function (self, state_context, filter_table)
	local expansion_rule_index = math.min(self.state_context.expansion_rule_index or 1, WeaveMatchmakingSettings.num_expansion_rules)
	local expansion_rules = WeaveMatchmakingSettings.expansion_rules[expansion_rule_index]
	local current_filter_rules = expansion_rules.filters

	for filter_name, filter_data in pairs(current_filter_rules) do
		local value = filter_data.value or filter_data.fetch_function(self._state)

		if filter_data.transform_data_function then
			value = filter_data.transform_data_function(value) or value
		end

		local comparison = filter_data.comparison
		filter_table[filter_name] = {
			value = value,
			comparison = comparison
		}
	end
end

MatchmakingManager.reset_joining = function (self)
	self._joining_this_host_peer_id = nil
end

MatchmakingManager.setup_weave_near_filters = function (self, state_context, filter_table)
	local expansion_rule_index = math.min(self.state_context.expansion_rule_index or 1, WeaveMatchmakingSettings.num_expansion_rules)
	local expansion_rules = WeaveMatchmakingSettings.expansion_rules[expansion_rule_index]
	local current_filter_rules = expansion_rules.near_filters

	for filter_name, filter_data in pairs(current_filter_rules) do
		local value = filter_data.value or filter_data.fetch_function(self._state)

		if filter_data.transform_data_function then
			value = filter_data.transform_data_function(value) or value
		end

		local comparison = filter_data.comparison
		filter_table[#filter_table + 1] = {
			key = filter_name,
			value = value
		}
	end
end

MatchmakingManager.debug_weave_matchmaking = function (self, state_context, state)
	local current_expansion_rule_index = math.min(state_context.expansion_rule_index or 1, WeaveMatchmakingSettings.num_expansion_rules)
	local expansion_rule_settings = WeaveMatchmakingSettings.expansion_rules[current_expansion_rule_index]

	Debug.text("::::: WeaveMatchmakingDebug :::::")
	Debug.text("")
	Debug.text("Filters:")

	for name, filter_data in pairs(expansion_rule_settings.filters) do
		local value = filter_data.fetch_function(state)

		if filter_data.transform_data_function then
			value = filter_data.transform_data_function(value) or value
		end

		if filter_data.debug_format then
			value = filter_data.debug_format(value)
		end

		Debug.text(" - " .. name .. ": " .. tostring(value))
	end

	Debug.text("")
	Debug.text("Near Filters:")

	for name, filter_data in pairs(expansion_rule_settings.near_filters) do
		local value = filter_data.fetch_function(state)

		if filter_data.transform_data_function then
			value = filter_data.transform_data_function(value) or value
		end

		local requirements = filter_data.requirements

		if requirements then
			local max_value = math.max(value + (requirements.range_up or 0), 0)
			local min_value = math.max(value - (requirements.range_down or 0), 0)

			Debug.text(" * " .. name .. ": " .. tostring(value))
			Debug.text("         Min compatible value: " .. min_value)
			Debug.text("         Max Compatible value:" .. max_value)
		else
			Debug.text(" * " .. name .. tostring(value))
		end
	end

	Debug.text("")
	Debug.text("Expansion Rule: " .. current_expansion_rule_index)
	Debug.text("")
	Debug.text("")
	Debug.text(":: Other Rules ::")

	local other_requirements = expansion_rule_settings.other_requirements

	if other_requirements then
		for name, value in pairs(other_requirements) do
			Debug.text(" - " .. name .. " = " .. tostring(value))
		end
	end
end

return
