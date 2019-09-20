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
require("scripts/managers/matchmaking/matchmaking_state_search_for_weave_group")
require("scripts/managers/matchmaking/matchmaking_state_host_weave_find_group")
require("scripts/managers/matchmaking/matchmaking_handshaker")

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
	max_distance_filter = (GameSettingsDevelopment.network_mode == "lan" and LobbyDistanceFilter.MEDIUM) or Application.user_setting("max_quick_play_search_range") or DefaultUserSettings.get("user_settings", "max_quick_play_search_range"),
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
	"rpc_matchmaking_update_profiles_data",
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
	"rpc_matchmaking_verify_dlc_reply"
}
MatchmakingBrokenLobbies = MatchmakingBrokenLobbies or {}

MatchmakingManager.init = function (self, params)
	self.params = params
	self.network_transmit = params.network_transmit
	self.lobby = params.lobby
	self.peer_id = params.peer_id
	self.is_server = params.is_server
	self.level_transition_handler = params.level_transition_handler
	self.profile_synchronizer = params.profile_synchronizer
	self.statistics_db = params.statistics_db
	self.network_server = params.network_server
	self.slot_allocator = params.slot_allocator
	self._network_hash = self.lobby.network_hash
	self._host_matchmaking_data = {}
	self._power_level_timer = 0
	self.party_owned_dlcs = {}
	self._level_weights = {}
	self.requested_profiles = {}
	self._quick_game = params.quick_game
	self.handshaker_host = MatchmakingHandshakerHost:new(self.network_transmit)

	if not DEDICATED_SERVER then
		self.handshaker_client = MatchmakingHandshakerClient:new()
	end

	self.peers_to_sync = {}
	local network_options = Managers.lobby:network_options()

	if not DEDICATED_SERVER then
		self:apply_server_settings()

		local lobby_finder = LobbyFinder:new(network_options, MatchmakingSettings.MAX_NUM_LOBBIES, true)
		self.lobby_finder = lobby_finder
		params.lobby_finder = lobby_finder
		params.handshaker_client = self.handshaker_client
	end

	params.network_options = network_options
	params.matchmaking_manager = self
	params.network_hash = self.lobby.network_hash
	params.handshaker_host = self.handshaker_host
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
		self.handshaker_client:start_handshake(self.lobby:lobby_host())
		self:_change_state(MatchmakingStateIdle, self.params, {})
	else
		self:_change_state(MatchmakingStateIdle, self.params, {})
	end

	self:reset_lobby_filters()
	mm_printf("initializing")
	mm_printf("my_peer_id: %s, I am %s", Network:peer_id(), (self.is_server and "server") or "client")

	self.lobby_finder_timer = 0
	self.profile_update_time = 0
	self._leader_peer_id = nil
	self.countdown_has_finished = false
end

MatchmakingManager.apply_server_settings = function (self)
	if self._game_server_finder then
		self._game_server_finder:destroy()

		self._game_server_finder = nil
		self.params.game_server_finder = nil
	end

	local disable_dedicated_servers = Development.parameter("use_lan_backend") or rawget(_G, "Steam") == nil
	local supported_on_platform = PLATFORM == "win32"
	local network_options = Managers.lobby:network_options()
	local game_server_finder = nil

	if disable_dedicated_servers or not supported_on_platform then
		game_server_finder = GameServerFinderLan:new(network_options, MatchmakingSettings.MAX_NUM_SERVERS)
	else
		game_server_finder = GameServerFinder:new(network_options, MatchmakingSettings.MAX_NUM_SERVERS)
	end

	self._game_server_finder = game_server_finder
	self.params.game_server_finder = game_server_finder
end

MatchmakingManager.game_server_finder = function (self)
	return self._game_server_finder
end

MatchmakingManager.reset_ping = function (self)
	self.handshaker_host:reset_ping()
end

MatchmakingManager.reset_lobby_filters = function (self)
	if DEDICATED_SERVER then
		return
	end

	LobbyInternal.clear_filter_requirements()
end

MatchmakingManager.get_players_ping = function (self)
	if self.is_server then
		return self.handshaker_host.pings_by_peer_id
	else
		return self.handshaker_client.pings_by_peer_id
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

MatchmakingManager.set_ingame_ui = function (self, ingame_ui)
	self._ingame_ui = ingame_ui
	self.params.ingame_ui = ingame_ui
end

MatchmakingManager.waystone_is_active = function (self)
	return self._waystone_is_active or false, self._waystone_type or 0
end

MatchmakingManager.activate_waystone_portal = function (self, enable, waystone_type)
	self._waystone_is_active = enable
	self._waystone_type = waystone_type
	local ingame_ui = self._ingame_ui
	local ingame_hud = ingame_ui and ingame_ui.ingame_hud
	local countdown_ui = ingame_hud and ingame_hud:component("LevelCountdownUI")

	if countdown_ui then
		countdown_ui:set_waystone_activation(enable, waystone_type)
	elseif DEDICATED_SERVER then
		LevelCountdownUI.set_waystone_activation_without_ui(enable, waystone_type)
	end
end

MatchmakingManager.destroy = function (self)
	mm_printf("destroying")

	if self._state and self._state.on_exit then
		self._state:on_exit()
	end

	if self._game_server_finder then
		self._game_server_finder:destroy()
	end

	if self.lobby_finder then
		self.lobby_finder:destroy()
	end

	self.handshaker_host:destroy()

	if self.handshaker_client then
		self.handshaker_client:destroy()
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
	self.handshaker_host:register_rpcs(network_event_delegate)

	if self.handshaker_client then
		self.handshaker_client:register_rpcs(network_event_delegate)
	end
end

MatchmakingManager.unregister_rpcs = function (self)
	mm_printf("unregister rpcs")
	fassert(self.network_event_delegate ~= nil, "trying to unregister rpcs without a network_event_delegate..")

	if self.handshaker_client then
		self.handshaker_client:unregister_rpcs()
	end

	self.handshaker_host:unregister_rpcs()
	self.network_event_delegate:unregister(self)

	self.params.network_event_delegate = nil
	self.network_event_delegate = nil
end

MatchmakingManager._change_state = function (self, new_state, params, state_context)
	if self._state and self._state.NAME == new_state.NAME then
		mm_printf("Ignoring state transision %s because we are already there", new_state.NAME)

		return
	end

	if self._state then
		if self._state.on_exit then
			mm_printf("Exiting state %s with on_exit()", self._state.NAME)
			self._state:on_exit()
		else
			mm_printf("Exiting %s", self._state.NAME)
		end
	end

	self._state = new_state:new(params)
	self._state.parent = self._parent
	self.state_context = state_context

	if self._state.on_enter then
		mm_printf("Entering %s on_enter() ", new_state.NAME)
		self._state:on_enter(state_context)
	else
		mm_printf("Entering %s", new_state.NAME)
	end
end

MatchmakingManager.update = function (self, dt, t)
	if self._state then
		local state_name = self._state.NAME
		local new_state, state_context = self._state:update(dt, t)

		if new_state then
			self:_change_state(new_state, self.params, state_context)
		end
	end

	self:_update_power_level(t)
	self:_update_afk_logic(dt, t)

	local MatchmakingBrokenLobbies = MatchmakingBrokenLobbies

	for lobby_id, time_to_clear in pairs(MatchmakingBrokenLobbies) do
		if time_to_clear < t then
			mm_printf("Removing broken lobby %s, perhaps it will now work again?!", tostring(lobby_id))

			MatchmakingBrokenLobbies[lobby_id] = nil
		end
	end

	if self.is_server then
		if next(self.peers_to_sync) then
			local is_matchmaking, private_game = self:is_game_matchmaking()
			local search_info = self:search_info()
			local level_key = search_info.level_key
			local difficulty = search_info.difficulty
			local quick_game = search_info.quick_game or false
			local level_key_lookup = (level_key and NetworkLookup.level_keys[level_key]) or NetworkLookup.level_keys["n/a"]
			local difficulty_lookup = (difficulty and NetworkLookup.difficulties[difficulty]) or NetworkLookup.difficulties.normal

			for peer_id, _ in pairs(self.peers_to_sync) do
				if self.handshaker_host:handshake_done(peer_id) then
					self.peers_to_sync[peer_id] = nil

					self.handshaker_host:send_rpc_to_client("rpc_set_matchmaking", peer_id, is_matchmaking, private_game, level_key_lookup, difficulty_lookup, quick_game)
				end
			end
		end

		self.handshaker_host:update(t)
	end

	if self.handshaker_client and self.handshaker_client.host_peer_id and self.network_transmit.connection_handler.current_connections[self.handshaker_client.host_peer_id] == nil then
		mm_printf_force("No connection to host, cancelling matchmaking")
		self:cancel_matchmaking()
		self.network_transmit:queue_local_rpc("rpc_stop_enter_game_countdown")
	end
end

MatchmakingManager._update_afk_logic = function (self, dt, t)
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
end

local remove_peer_power_level_table = {}

MatchmakingManager._update_power_level = function (self, t)
	if t < self._power_level_timer then
		return
	end

	self._power_level_timer = t + 5
	local own_peer_id = Network.peer_id()
	local is_server = self.is_server
	local local_player = Managers.player:local_player()

	if local_player then
		local sync_data_active = local_player:sync_data_active()
		local hero_name = local_player:profile_display_name()
		local career_name = local_player:career_name()

		if sync_data_active and hero_name and career_name then
			local power_level = BackendUtils.get_total_power_level(hero_name, career_name)

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

MatchmakingManager.set_popup_join_lobby_handler = function (self, popup_join_lobby_handler)
	self.params.popup_join_lobby_handler = popup_join_lobby_handler
end

MatchmakingManager.set_popup_handler = function (self, popup_handler)
	self.params.popup_handler = popup_handler
end

MatchmakingManager.is_join_popup_visible = function (self)
	return self._ingame_ui and self._ingame_ui:unavailable_hero_popup_active()
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

		if (level_key and level_weights_by_index[chosen_index] > 0) or event_mode then
			preferred_levels[#preferred_levels + 1] = level_key
		end

		level_weights_by_index[chosen_index] = -1
	end

	preferred_levels[#preferred_levels + 1] = "inn_level"

	return level_keys[result], preferred_levels
end

MatchmakingManager._calculate_level_weights = function (self, level_keys, recent_games_played)
	fassert(#level_keys > 0, "Empty level_keys list")

	local settings = MatchmakingSettings.quickplay_level_select_settings
	local player = Managers.player:local_player()
	local statistics_db = self.statistics_db
	local lookup_level_keys = NetworkLookup.level_keys
	local stats_id = player:stats_id()
	local last_played_games = recent_games_played or {}
	local level_weight_by_lookup = {}

	for i = 1, #NetworkLookup.level_keys, 1 do
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
	local lookup_level_keys = NetworkLookup.level_keys

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
	local has_full_game = not script_data.settings.use_beta_overlay

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

MatchmakingManager.set_matchmaking_data = function (self, next_level_key, difficulty, act_key, game_mode, private_game, quick_game, eac_authorized, weave_name)
	local level_transition_handler = self.level_transition_handler
	local current_level_key = level_transition_handler:get_current_level_keys()
	local lobby_members = self.lobby:members()
	local members = lobby_members:get_members()
	local num_players = #members
	local is_matchmaking = not private_game
	local lobby_data = self.lobby:get_stored_lobby_data()
	lobby_data.level_key = current_level_key
	lobby_data.game_mode = (PLATFORM ~= "ps4" and NetworkLookup.game_modes[game_mode]) or game_mode
	lobby_data.act_key = act_key
	lobby_data.matchmaking = (is_matchmaking and "true") or "false"
	lobby_data.selected_level_key = next_level_key or LevelHelper:current_level_settings().level_id
	lobby_data.unique_server_name = LobbyAux.get_unique_server_name()
	lobby_data.host = Network.peer_id()
	lobby_data.num_players = num_players
	lobby_data.difficulty = difficulty
	lobby_data.weave_name = weave_name
	lobby_data.quick_game = (quick_game and "true") or "false"
	lobby_data.country_code = (rawget(_G, "Steam") and Steam.user_country_code()) or Managers.account:region()
	lobby_data.twitch_enabled = (GameSettingsDevelopment.twitch_enabled and Managers.twitch:is_connected() and Managers.twitch:game_mode_supported(game_mode) and "true") or "false"
	lobby_data.eac_authorized = (eac_authorized and "true") or "false"

	print("[MATCHMAKING] - Hosting game on level:", current_level_key, next_level_key)
	level_transition_handler:set_next_level(next_level_key)
	self.lobby:set_lobby_data(lobby_data)
end

MatchmakingManager.on_dedicated_server = function (self)
	return self.lobby:is_dedicated_server()
end

MatchmakingManager.weave_vote_result = function (self, accepted)
	print(self._state.NAME)

	if self._state.NAME == "MatchmakingStateSearchForWeaveGroup" then
		self._state:weave_vote_result(accepted)
	else
		self:cancel_matchmaking()
	end
end

MatchmakingManager.find_game = function (self, search_config)
	if self.is_server then
		self.state_context = {
			search_config = table.clone(search_config),
			started_matchmaking_t = Managers.time:time("main")
		}
		local private_game = search_config.private_game

		fassert(private_game ~= nil, "Private game wasn't set!")

		local quick_game = search_config.quick_game

		fassert(quick_game ~= nil, "Quick game wasn't set!")
		self:set_quick_game(quick_game)

		local game_mode = search_config.game_mode
		local next_state = nil

		if Development.parameter("auto_host_dedicated") then
			next_state = MatchmakingStateSearchGameServer
		else
			local num_active_peers = self.network_server:num_active_peers()
			local people_in_local_hosted_party = num_active_peers > 1
			local always_host = search_config.always_host

			if private_game or people_in_local_hosted_party or always_host or ALWAYS_HOST_GAME then
				if quick_game and PLATFORM == "xb1" then
					local ignore_dlc_check = false

					if Managers.account:offline_mode() then
						ignore_dlc_check = false
					end

					local excluded_level_keys = search_config.excluded_level_keys
					self.state_context.search_config.level_key = self:get_weighed_random_unlocked_level(ignore_dlc_check, false, excluded_level_keys)
				end

				if game_mode == "weave_find_group" then
					next_state = MatchmakingStateHostFindWeaveGroup
				else
					next_state = MatchmakingStateHostGame
				end
			elseif game_mode == "weave_find_group" then
				next_state = MatchmakingStateSearchForWeaveGroup
			else
				next_state = MatchmakingStateSearchGame
			end
		end

		local search_info = self:search_info()
		local level_key = search_info.level_key
		local difficulty = search_info.difficulty
		local quick_game = search_info.quick_game
		local level_key_lookup = (level_key and NetworkLookup.level_keys[level_key]) or NetworkLookup.level_keys["n/a"]
		local difficulty_lookup = (difficulty and NetworkLookup.difficulties[difficulty]) or NetworkLookup.difficulties.normal

		self.handshaker_host:send_rpc_to_clients("rpc_set_matchmaking", true, private_game, level_key_lookup, difficulty_lookup, quick_game)
		self:_change_state(next_state, self.params, self.state_context)

		self.start_matchmaking_time = 1000000
	end
end

MatchmakingManager.cancel_matchmaking = function (self)
	mm_printf("Cancelling matchmaking")

	local is_matchmaking = self:is_game_matchmaking()

	if not is_matchmaking then
		if not self.is_server and not self.lobby:is_dedicated_server() then
			self.handshaker_client:reset()
		end

		mm_printf("Wasn't really matchmaking to begin with...")

		return
	end

	local party = Managers.party

	if not self.is_server and self.lobby:is_dedicated_server() then
		if party.is_leader(self.peer_id) then
			self.handshaker_client:send_rpc_to_host("rpc_cancel_matchmaking")
		end

		return
	end

	if PLATFORM == "win32" then
		local player = Managers.player:local_player(1)
		local connection_state = "cancelled"
		local started_matchmaking_t = self.state_context.started_matchmaking_t

		if started_matchmaking_t ~= nil then
			local t = Managers.time:time("main") or started_matchmaking_t
			local time_taken = t - started_matchmaking_t
			local using_strict_matchmaking = self.state_context.search_config.strict_matchmaking

			Managers.telemetry.events:matchmaking_cancelled(player, time_taken)
		end
	end

	self.state_context = {}

	if self._state then
		if self._state.lobby_client then
			self._state.lobby_client:destroy()

			self._state.lobby_client = nil
		end

		if self._state._lobby_unclaimed then
			self._state._lobby_unclaimed:destroy()

			self._state._lobby_unclaimed = nil
		end

		if self._ingame_ui and self._ingame_ui:unavailable_hero_popup_active() then
			self._ingame_ui:hide_unavailable_hero_popup()
		end

		self:_change_state(MatchmakingStateIdle, self.params, self.state_context)
	end

	if self.is_server then
		local stored_lobby_data = self.lobby:get_stored_lobby_data()
		stored_lobby_data.matchmaking = "false"
		stored_lobby_data.difficulty = "normal"
		stored_lobby_data.selected_level_key = LevelHelper:current_level_settings().level_id
		stored_lobby_data.game_mode = (PLATFORM ~= "ps4" and NetworkLookup.game_modes["n/a"]) or "n/a"

		self.lobby:set_lobby_data(stored_lobby_data)

		local level_key_lookup = NetworkLookup.level_keys["n/a"]
		local difficulty_lookup = NetworkLookup.difficulties.normal
		local quick_game = false

		Managers.state.difficulty:set_difficulty("normal")

		if PLATFORM == "xb1" then
			self.lobby:enable_matchmaking(false)
		end

		self.handshaker_host:send_rpc_to_clients("rpc_set_matchmaking", false, false, level_key_lookup, difficulty_lookup, quick_game)
		self:reset_lobby_filters()

		if not DEDICATED_SERVER then
			party:set_leader(self.network_server.lobby_host:lobby_host())
		end
	else
		party:set_leader(nil)
	end

	if self.handshaker_client ~= nil then
		self.handshaker_client:reset()
	end

	self.level_transition_handler:set_next_level(nil)
end

MatchmakingManager.is_matchmaking_in_inn = function (self)
	local name = self._state.NAME
	local is_matchmaking = name ~= "MatchmakingStateIdle"

	return self.is_in_inn and is_matchmaking
end

MatchmakingManager.is_game_matchmaking = function (self)
	local name = self._state.NAME
	local is_matchmaking = name ~= "MatchmakingStateIdle"
	local search_config = self.state_context.search_config
	local private_game = (search_config and search_config.private_game) or false

	return is_matchmaking, private_game
end

MatchmakingManager.active_game_mode = function (self)
	local name = self._state.NAME
	local is_matchmaking = name ~= "MatchmakingStateIdle"
	local game_mode = is_matchmaking and self.lobby:lobby_data("game_mode")

	if PLATFORM ~= "ps4" then
		game_mode = game_mode and NetworkLookup.game_modes[tonumber(game_mode)]
	end

	return game_mode
end

MatchmakingManager.rpc_set_matchmaking = function (self, sender, client_cookie, host_cookie, is_matchmaking, private_game, level_key_id, difficulty_id, quick_game)
	if not self.handshaker_client:validate_cookies(client_cookie, host_cookie) then
		return
	end

	if not self.is_server then
		mm_printf_force("Set matchmaking=%s, private_game=%s", tostring(is_matchmaking), tostring(private_game))

		if is_matchmaking then
			local level_key = NetworkLookup.level_keys[level_key_id]
			local difficulty = NetworkLookup.difficulties[difficulty_id]
			self._host_matchmaking_data.level_key = level_key
			self._host_matchmaking_data.difficulty = difficulty
			self._host_matchmaking_data.quick_game = quick_game
			local state_context = {
				private_game = private_game
			}

			self:_change_state(MatchmakingStateFriendClient, self.params, state_context)
		else
			local current_state = self._state

			if current_state.lobby_client then
				current_state.lobby_client:destroy()

				current_state.lobby_client = nil
			end

			table.clear(self._host_matchmaking_data)
			self:_change_state(MatchmakingStateIdle, self.params, {})
		end
	end
end

MatchmakingManager.rpc_set_game_mode_event_data = function (self, sender, mutator_lookup_array)
	local mutators = {}

	for i = 1, #mutator_lookup_array, 1 do
		local mutator_id = mutator_lookup_array[i]
		mutators[i] = NetworkLookup.mutator_templates[mutator_id]
	end

	self._game_mode_event_data = {
		mutators = mutators
	}
end

MatchmakingManager.rpc_clear_game_mode_event_data = function (self, sender)
	self:clear_game_mode_event_data()
end

MatchmakingManager.rpc_cancel_matchmaking = function (self, sender)
	if not self.is_server then
		return
	end

	if not Managers.party:is_leader(sender) then
		return
	end

	self:cancel_matchmaking()
end

MatchmakingManager.rpc_matchmaking_request_profiles_data = function (self, sender, client_cookie, host_cookie)
	if not self.handshaker_host:validate_cookies(sender, client_cookie, host_cookie) then
		return
	end

	local peer_ids, player_indices = self.slot_allocator:pack_for_transmission()

	mm_printf("PROFILES REQUESTED BY %s REPLY wh:%s | we:%s | dr:%s | bw:%s | es:%s", sender, peer_ids[1], peer_ids[4], peer_ids[3], peer_ids[2], peer_ids[5])
	self.network_transmit:send_rpc("rpc_matchmaking_request_profiles_data_reply", sender, client_cookie, host_cookie, peer_ids, player_indices)
end

MatchmakingManager.update_profiles_data_on_clients = function (self)
	local peer_ids, player_indices = self.slot_allocator:pack_for_transmission()

	mm_printf("PROFILES UPDATED ON ALL CLIENTS wh:%s | we:%s | dr:%s | bw:%s | es:%s", peer_ids[1], peer_ids[4], peer_ids[3], peer_ids[2], peer_ids[5])
	self.handshaker_host:send_rpc_to_clients("rpc_matchmaking_update_profiles_data", peer_ids, player_indices)
end

MatchmakingManager._extract_dlcs = function (self, client_dlc_unlocked_array)
	local client_unlocked_dlcs = {}

	for idx, dlc_id in ipairs(client_dlc_unlocked_array) do
		local dlc_name = NetworkLookup.dlcs[dlc_id]
		client_unlocked_dlcs[dlc_name] = true
	end

	return client_unlocked_dlcs
end

MatchmakingManager._missing_required_dlc = function (self, game_mode_key, difficulty_key, client_unlocked_dlcs)
	if game_mode_key == "weave_find_group" then
		game_mode_key = "weave"
	end

	local game_mode_settings = game_mode_key and GameModeSettings[game_mode_key]

	if game_mode_settings and game_mode_settings.required_dlc and not client_unlocked_dlcs[game_mode_settings.required_dlc] then
		return game_mode_settings.required_dlc
	end

	local difficulty_settings = difficulty_key and DifficultySettings[difficulty_key]

	if difficulty_settings and difficulty_settings.dlc_requirement and not client_unlocked_dlcs[difficulty_settings.dlc_requirement] then
		return difficulty_settings.dlc_requirement
	end

	return nil
end

MatchmakingManager.rpc_matchmaking_request_join_lobby = function (self, sender, client_cookie, host_cookie, lobby_id, friend_join, client_dlc_unlocked_array)
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

	local client_unlocked_dlcs = self:_extract_dlcs(client_dlc_unlocked_array)
	local game_mode_manager = Managers.state.game_mode
	local difficulty_manager = Managers.state.difficulty
	local game_mode_key = game_mode_manager and game_mode_manager:game_mode_key()
	local difficulty_key = difficulty_manager and difficulty_manager:get_difficulty()
	local is_game_mode_ended = (game_mode_manager and game_mode_manager:is_game_mode_ended()) or false
	local is_searching_for_players = self._state.NAME == "MatchmakingStateHostGame" or self._state.NAME == "MatchmakingStateIngame" or self._state.NAME == "MatchmakingStateWaitForCountdown" or self._state.NAME == "MatchmakingStateHostFindWeaveGroup"
	local handshaker_host = self.handshaker_host
	local valid_cookies = (handshaker_host and handshaker_host:validate_cookies(sender, client_cookie, host_cookie)) or false
	local matchmaking = self.lobby:lobby_data("matchmaking")
	local lobby_game_mode_id = self.lobby:lobby_data("game_mode")
	local lobby_game_mode_index = tonumber(lobby_game_mode_id)
	local lobby_game_mode = (PLATFORM == "ps4" and lobby_game_mode_id) or (lobby_game_mode_index and NetworkLookup.game_modes[lobby_game_mode_index]) or "n/a"
	local lobby_difficulty = self.lobby:lobby_data("difficulty")
	local is_friend = false

	if not DEDICATED_SERVER then
		is_friend = LobbyInternal.is_friend(sender) or friend_join
	end

	local missing_dlc = self:_missing_required_dlc(game_mode_key, difficulty_key, client_unlocked_dlcs) or self:_missing_required_dlc(lobby_game_mode, lobby_difficulty, client_unlocked_dlcs)

	if not lobby_id_match then
		reply = "lobby_id_mismatch"
	elseif is_game_mode_ended then
		reply = "game_mode_ended"
	elseif not DEDICATED_SERVER and not is_friend and not is_searching_for_players then
		reply = "not_searching_for_players"
	elseif Managers.deed:has_deed() then
		reply = "lobby_has_active_deed"
	elseif not valid_cookies then
		reply = "obsolete_request"
	elseif missing_dlc then
		reply_variable = NetworkLookup.dlcs[missing_dlc]
		reply = "dlc_required"
	elseif not Development.parameter("allow_weave_joining") then
		if game_mode_key == "weave" and matchmaking == "false" then
			local weave_manager = Managers.weave
			local player_ids = weave_manager:get_player_ids()

			if not player_ids[sender] then
				reply = "cannot_join_weave"
			end
		elseif lobby_game_mode == "weave" and matchmaking == "false" then
			local loading_context = Boot.loading_context
			local weave_data = loading_context and loading_context.weave_data
			local player_ids = weave_data and weave_data.player_ids

			if player_ids then
				if not player_ids[sender] then
					reply = "cannot_join_weave"
				end
			else
				reply = "cannot_join_weave"
			end
		end
	end

	mm_printf_force("Got request to join matchmaking lobby %s from %s, replying %s", lobby_id, sender, reply)

	local reply_id = NetworkLookup.game_ping_reply[reply]

	self.network_transmit:send_rpc("rpc_matchmaking_request_join_lobby_reply", sender, client_cookie, host_cookie, reply_id, reply_variable)
end

MatchmakingManager.rpc_matchmaking_request_profile = function (self, sender, client_cookie, host_cookie, profile)
	if not self.handshaker_host:validate_cookies(sender, client_cookie, host_cookie) then
		return
	end

	local hero_profile_index = GetHeroAffiliationIndex(profile)
	local player_slot_available = true
	local reply = true

	if Managers.mechanism:current_mechanism_name() == "adventure" and hero_profile_index then
		player_slot_available = self.slot_allocator:is_free(hero_profile_index)
		reply = player_slot_available
	end

	if player_slot_available and hero_profile_index then
		mm_printf("Assigning profile slot %d to %s", profile, sender)

		local local_player_id = 1

		self.slot_allocator:allocate_slot(hero_profile_index, sender, local_player_id)
		self:update_profiles_data_on_clients()
	end

	if reply then
		self.requested_profiles[sender] = profile
	end

	self.network_transmit:send_rpc("rpc_matchmaking_request_profile_reply", sender, client_cookie, host_cookie, profile, reply)
end

MatchmakingManager.get_requested_profiles = function (self)
	return self.requested_profiles
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

	if self._game_server_post_game_params then
		return "leave_game_server", self._game_server_post_game_params
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
	if SlotAllocator.is_free_in_lobby(hero_index, lobby_data) then
		mm_printf("HERO %d IS AVAILABLE", hero_index)

		return true
	end

	local local_player = Managers.player:local_player()
	local peer_id = local_player.peer_id
	local local_player_id = local_player:profile_id()
	local owner_peer, owner_player_id = SlotAllocator.owner_in_lobby(hero_index, lobby_data)

	if owner_peer == peer_id and owner_player_id == local_player_id then
		mm_printf("HERO %d IS OWNED BY SELF", hero_index)

		return true
	end

	mm_printf("HERO %d IS OWNED BY %s:%d", hero_index, owner_peer, owner_player_id)

	return false
end

MatchmakingManager.lobby_match = function (self, lobby_data, act_key, level_key, difficulty, game_mode, player_peer_id, weave_name)
	local lobby_id = lobby_data.id
	local broken_lobby = self:lobby_listed_as_broken(lobby_id)

	if broken_lobby then
		return false, "lobby listed as broken"
	end

	if lobby_data.host == player_peer_id then
		return false, "players own lobby"
	end

	local valid_lobby = lobby_data.matchmaking ~= "false" and lobby_data.valid

	if not valid_lobby then
		return false, "lobby is not valid"
	end

	local lobby_level_key = lobby_data.level_key

	if lobby_level_key == "prologue" then
		return false, "in prologue"
	end

	if level_key then
		local correct_level = false

		if lobby_data.selected_level_key then
			correct_level = lobby_data.selected_level_key == level_key
		elseif lobby_data.level_key then
			correct_level = lobby_data.level_key == level_key
		end

		if not correct_level then
			return false, "wrong level"
		end
	end

	if act_key and lobby_data.act_key ~= act_key then
		return false, "wrong act"
	end

	if game_mode == "event" or game_mode == "weave" then
		local lobby_game_mode = lobby_data.game_mode

		if PLATFORM ~= "ps4" then
			local lobby_data_game_mode_index = tonumber(lobby_game_mode)
			lobby_game_mode = lobby_data_game_mode_index and NetworkLookup.game_modes[lobby_data_game_mode_index]
		end

		if game_mode ~= lobby_game_mode then
			return false, "wrong game mode"
		end

		if game_mode == "weave" and weave_name ~= lobby_data.weave_name then
			return false, "wrong weave name"
		end
	elseif game_mode == "weave_find_group" then
		local lobby_game_mode = lobby_data.game_mode

		if PLATFORM ~= "ps4" then
			local lobby_data_game_mode_index = tonumber(lobby_game_mode)
			lobby_game_mode = lobby_data_game_mode_index and NetworkLookup.game_modes[lobby_data_game_mode_index]
		end

		if lobby_game_mode ~= "weave" and lobby_game_mode ~= "weave_find_group" then
			return false, "wrong game mode"
		end
	end

	if difficulty then
		local correct_difficulty = lobby_data.difficulty == difficulty

		if not correct_difficulty then
			return false, "wrong difficulty"
		end
	end

	local num_players = lobby_data.num_players and tonumber(lobby_data.num_players)
	local has_empty_slot = num_players and num_players < MatchmakingSettings.MAX_NUMBER_OF_PLAYERS

	if not has_empty_slot then
		return false, "no empty slot"
	end

	if script_data.unique_server_name and lobby_data.unique_server_name ~= script_data.unique_server_name then
		Debug.text("Ignoring lobby due to mismatching unique_server_name")

		return false, "mismatching unique_server_name"
	end

	return true
end

MatchmakingManager.add_broken_lobby = function (self, lobby_id, t, is_bad_connection_or_otherwise_not_nice)
	local time_to_ignore = (is_bad_connection_or_otherwise_not_nice and 120) or 20

	mm_printf("Adding broken lobby: %s Due to bad connection or something: %s, ignoring it for %d seconds", tostring(lobby_id), tostring(is_bad_connection_or_otherwise_not_nice), time_to_ignore)

	MatchmakingBrokenLobbies[lobby_id] = t + time_to_ignore
end

MatchmakingManager.lobby_listed_as_broken = function (self, lobby_id)
	return MatchmakingBrokenLobbies[lobby_id]
end

MatchmakingManager.rpc_matchmaking_request_join_lobby_reply = function (self, sender, client_cookie, host_cookie, reply_id, reply_variable)
	if self._state and self._state.NAME == "MatchmakingStateRequestJoinGame" then
		self._state:rpc_matchmaking_request_join_lobby_reply(sender, client_cookie, host_cookie, reply_id, reply_variable)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_request_join_lobby_reply, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_notify_connected = function (self, sender)
	local state_name = (self._state and self._state.NAME) or "none"

	if state_name == "MatchmakingStateRequestJoinGame" or state_name == "MatchmakingStateRequestGameServerOwnership" then
		self._state:rpc_notify_connected(sender)
	else
		mm_printf_force("rpc_notify_connected, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_matchmaking_join_game = function (self, sender, client_cookie, host_cookie)
	if self._state and self._state.NAME == "MatchmakingStateJoinGame" then
		self._state:rpc_matchmaking_join_game(sender, client_cookie, host_cookie)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_join_game, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_matchmaking_update_profiles_data = function (self, sender, client_cookie, host_cookie, profile_array, player_id_array)
	if self._state and (self._state.NAME == "MatchmakingStateJoinGame" or self._state.NAME == "MatchmakingStateRequestProfiles") then
		self._state:rpc_matchmaking_update_profiles_data(sender, client_cookie, host_cookie, profile_array, player_id_array)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_update_profiles_data, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_matchmaking_request_profile_reply = function (self, sender, client_cookie, host_cookie, profile, reply)
	if self._state and self._state.NAME == "MatchmakingStateJoinGame" then
		self._state:rpc_matchmaking_request_profile_reply(sender, client_cookie, host_cookie, profile, reply)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_request_profile_reply, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_matchmaking_request_profiles_data_reply = function (self, sender, client_cookie, host_cookie, profile_array, player_id_array)
	if self._state and self._state.NAME == "MatchmakingStateRequestProfiles" then
		self._state:rpc_matchmaking_request_profiles_data_reply(sender, client_cookie, host_cookie, profile_array, player_id_array)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_request_profiles_data_reply, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_matchmaking_request_selected_level = function (self, sender, client_cookie, host_cookie)
	if self._state and self._state.NAME == "MatchmakingStateHostGame" then
		if not self.handshaker_host:validate_cookies(sender, client_cookie, host_cookie) then
			return
		end

		local lobby_data = self.lobby:get_stored_lobby_data()
		local selected_level = lobby_data.selected_level_key
		local selected_level_id = NetworkLookup.level_keys[selected_level]

		self.handshaker_host:send_rpc_to_client("rpc_matchmaking_request_selected_level_reply", sender, selected_level_id)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_request_selected_level, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_matchmaking_request_selected_level_reply = function (self, sender, client_cookie, host_cookie, selected_level_id)
	if self._state and self._state.NAME == "MatchmakingStateFriendClient" then
		self._state:rpc_matchmaking_request_selected_level_reply(sender, client_cookie, host_cookie, selected_level_id)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_request_selected_level_reply, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_matchmaking_request_selected_difficulty = function (self, sender, client_cookie, host_cookie)
	if self._state and self._state.NAME == "MatchmakingStateHostGame" then
		if not self.handshaker_host:validate_cookies(sender, client_cookie, host_cookie) then
			return
		end

		local lobby_data = self.lobby:get_stored_lobby_data()
		local difficulty = lobby_data.difficulty
		local difficulty_id = NetworkLookup.difficulties[difficulty]

		self.handshaker_host:send_rpc_to_client("rpc_matchmaking_request_selected_difficulty_reply", sender, difficulty_id)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_request_selected_difficulty, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_matchmaking_request_selected_difficulty_reply = function (self, sender, client_cookie, host_cookie, difficulty_id)
	if self._state and self._state.NAME == "MatchmakingStateFriendClient" then
		self._state:rpc_matchmaking_request_selected_difficulty_reply(sender, client_cookie, host_cookie, difficulty_id)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_request_selected_difficulty_reply, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_matchmaking_request_status_message = function (self, sender, client_cookie, host_cookie)
	if self._state and self._state.NAME == "MatchmakingStateHostGame" then
		if not self.handshaker_host:validate_cookies(sender, client_cookie, host_cookie) then
			return
		end

		local status_message = self.current_status_message

		if not status_message then
			return
		end

		self.handshaker_host:send_rpc_to_client("rpc_matchmaking_status_message", sender, status_message)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_request_status_message, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_matchmaking_status_message = function (self, sender, client_cookie, host_cookie, status_message)
	if self._state and self._state.NAME == "MatchmakingStateFriendClient" then
		self._state:rpc_matchmaking_status_message(sender, client_cookie, host_cookie, status_message)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_status_message, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_game_server_set_group_leader = function (self, sender, peer_id)
	Managers.party:set_leader(peer_id)
end

MatchmakingManager.rpc_matchmaking_broadcast_game_server_ip_address = function (self, sender, client_cookie, host_cookie, ip_address)
	if self._state and self._state.NAME == "MatchmakingStateFriendClient" then
		self._state:rpc_matchmaking_broadcast_game_server_ip_address(sender, client_cookie, host_cookie, ip_address)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_broadcast_game_server_ip_address, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.rpc_game_server_reserve_slots = function (self, sender, client_cookie, host_cookie, peer_table)
	if not self.handshaker_host:validate_cookies(client_cookie, host_cookie) then
		return
	end

	for _, peer_id in ipairs(peer_table) do
		self.network_server:add_reserve_slot(peer_id)
	end
end

MatchmakingManager.rpc_set_quick_game = function (self, sender, quick_game)
	self:set_quick_game(quick_game)
end

MatchmakingManager.rpc_start_game_countdown_finished = function (self, sender)
	self:countdown_completed()
end

MatchmakingManager.rpc_matchmaking_sync_quickplay_data = function (self, sender, weight_array)
	self:_add_level_weight(sender, weight_array)
end

MatchmakingManager.rpc_matchmaking_request_quickplay_data = function (self, sender)
	local unlocked_levels = self:_get_unlocked_levels()
	local recent_games_played_json = Managers.backend:get_read_only_data("recent_quickplay_games")
	local recent_games_played = (recent_games_played_json and cjson.decode(recent_games_played_json)) or {}
	local ignore_dlc_check = false
	local weight_array = self:_calculate_level_weights(unlocked_levels, recent_games_played, ignore_dlc_check)

	self.network_transmit:send_rpc_server("rpc_matchmaking_sync_quickplay_data", weight_array)
end

MatchmakingManager.rpc_matchmaking_verify_dlc = function (self, sender, dlc_name_ids)
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

MatchmakingManager.rpc_matchmaking_verify_dlc_reply = function (self, sender, success)
	if self._state and self._state.NAME == "MatchmakingStateStartGame" then
		self._state:rpc_matchmaking_verify_dlc_reply(sender, success)
	else
		local state_name = (self._state and self._state.NAME) or "none"

		mm_printf_force("rpc_matchmaking_verify_dlc_reply, got this in wrong state current_state:%s", state_name)
	end
end

MatchmakingManager.hot_join_sync = function (self, peer_id)
	self.peers_to_sync[peer_id] = true
	local player_slot_index = self.profile_synchronizer:profile_by_peer(peer_id, 1)
	local hero_profile_index = player_slot_index and GetHeroAffiliationIndex(player_slot_index)

	if hero_profile_index then
		local local_player_index = 1

		self.slot_allocator:allocate_slot(hero_profile_index, peer_id, local_player_index)
		mm_printf("Assigned player %s to slot %d when hot join syncing", peer_id, hero_profile_index)
	end

	local game_mode_event_data = self._game_mode_event_data

	if game_mode_event_data then
		local mutators = game_mode_event_data.mutators
		local mutator_lookup_array = {}

		for i = 1, #mutators, 1 do
			local mutator_name = mutators[i]
			mutator_lookup_array[i] = NetworkLookup.mutator_templates[mutator_name]
		end

		RPC.rpc_set_game_mode_event_data(peer_id, mutator_lookup_array)
	else
		RPC.rpc_clear_game_mode_event_data(peer_id)
	end

	RPC.rpc_set_client_game_privacy(peer_id, self:is_game_private())
	RPC.rpc_matchmaking_request_quickplay_data(peer_id)
end

MatchmakingManager.countdown_completed = function (self)
	local tell_server = not self.countdown_has_finished and not self.is_server and Managers.party:is_leader(self.peer_id) and self:on_dedicated_server()

	if tell_server then
		self.countdown_has_finished = false

		self.handshaker_client:send_rpc_to_host("rpc_start_game_countdown_finished")

		return
	end

	self.countdown_has_finished = true
end

MatchmakingManager.everyone_has_profile = function (self)
	local num_peers = self.handshaker_host.num_clients + 1
	local num_profiles_taken = 0

	for i = 1, self.slot_allocator:num_slots(), 1 do
		if not self.slot_allocator:is_free(i) then
			num_profiles_taken = num_profiles_taken + 1
		end
	end

	return num_peers == num_profiles_taken
end

MatchmakingManager.set_status_message = function (self, status_message)
	if status_message == self.current_status_message then
		return
	end

	self.current_status_message = status_message

	if self.is_server then
		self.handshaker_host:send_rpc_to_clients("rpc_matchmaking_status_message", status_message)
	end
end

MatchmakingManager.setup_filter_requirements = function (self, number_of_players, distance_filter, filters, near_filters)
	filters.network_hash = {
		value = self._network_hash,
		comparison = LobbyComparison.EQUAL
	}
	filters.matchmaking = {
		value = "true",
		comparison = LobbyComparison.EQUAL
	}
	local requirements = {
		free_slots = number_of_players,
		distance_filter = distance_filter,
		filters = table.clone(filters),
		near_filters = table.clone(near_filters)
	}

	self.lobby_finder:add_filter_requirements(requirements)

	local game_server_requirements = {
		server_browser_filters = {
			dedicated = "valuenotused",
			full = "valuenotused",
			gamedir = "vermintide2"
		},
		matchmaking_filters = requirements.filters
	}

	self._game_server_finder:add_filter_requirements(game_server_requirements)
	self._game_server_finder:refresh()
end

MatchmakingManager.request_join_lobby = function (self, lobby, state_context_params)
	local friend_join = state_context_params and state_context_params.friend_join

	if self._state.NAME ~= "MatchmakingStateIdle" and not friend_join then
		mm_printf("trying to join lobby from lobby browser in wrong state %s", self._state.NAME)

		return
	end

	mm_printf("Joining lobby %s from lobby browser.", tostring(lobby))

	local state_context = {
		join_by_lobby_browser = true,
		join_lobby_data = lobby
	}

	table.merge(state_context, state_context_params or {})

	local t = Managers.time:time("main")
	self.started_matchmaking_t = t

	table.dump(state_context, "STATE_CONTEXT", 2)
	self:_change_state(MatchmakingStateRequestJoinGame, self.params, state_context)
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

		Managers.state.event:trigger("ui_dlc_upsell", dlc_name)
	elseif reason == "failure_start_join_server_difficulty_requirements_failed" then
		local text = Localize(reason)
		text = string.format(text, reason_variable or "")

		Managers.simple_popup:queue_popup(text, Localize("popup_error_topic"), "ok", Localize("popup_choice_ok"))
	elseif reason ~= "cancelled" then
		Managers.simple_popup:queue_popup(Localize(reason), Localize("popup_error_topic"), "ok", Localize("popup_choice_ok"))
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

MatchmakingManager.rpc_set_client_game_privacy = function (self, peer_id, is_private)
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
	elseif state_name == "MatchmakingStateHostGame" or state_name == "MatchmakingStateWaitForCountdown" or state_name == "MatchmakingStateStartGame" or state_name == "MatchmakingStateSearchGameServer" or state_name == "MatchmakingStateRequestGameServerOwnership" then
		return "hosting_game"
	elseif state_name == "MatchmakingStateRequestJoinGame" or state_name == "MatchmakingStateRequestProfiles" or state_name == "MatchmakingStateJoinGame" then
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

local info = {}

MatchmakingManager.search_info = function (self)
	table.clear(info)

	if self.is_server then
		local search_config = self.state_context.search_config

		if search_config then
			info.level_key = search_config.level_key
			info.difficulty = search_config.difficulty
			info.quick_game = search_config.quick_game
			info.game_mode = search_config.game_mode
			info.weave_name = search_config.weave_name
		else
			local lobby = self._state.lobby_client

			if lobby then
				local level_key = lobby:lobby_data("level_key")
				local difficulty = lobby:lobby_data("difficulty")
				local game_mode = lobby:lobby_data("game_mode")
				local weave_name = lobby:lobby_data("weave_name")
				local quick_game = self:is_quick_game()
				info.level_key = level_key
				info.difficulty = difficulty
				info.quick_game = quick_game
				info.game_mode = (PLATFORM == "ps4" and game_mode) or (game_mode and NetworkLookup.game_modes[tonumber(game_mode)])
				info.weave_name = weave_name
			end
		end
	elseif PLATFORM ~= "xb1" then
		local lobby = self.lobby
		local level_key = lobby:lobby_data("selected_level_key")
		local difficulty = lobby:lobby_data("difficulty")
		local game_mode = lobby:lobby_data("game_mode")
		local weave_name = lobby:lobby_data("weave_name")
		local quick_game = self:is_quick_game()
		info.level_key = level_key
		info.difficulty = difficulty
		info.quick_game = quick_game
		info.game_mode = (PLATFORM == "ps4" and game_mode) or (game_mode and NetworkLookup.game_modes[tonumber(game_mode)])
		info.weave_name = weave_name
	elseif not table.is_empty(self._host_matchmaking_data) then
		info.level_key = self._host_matchmaking_data.level_key
		info.difficulty = self._host_matchmaking_data.difficulty
		info.quick_game = self._host_matchmaking_data.quick_game
	else
		info.no_lobby_data = true
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
		local comparison = filter_data.comparison
		filter_table[filter_name] = {
			value = value,
			comparison = comparison
		}
	end
end

MatchmakingManager.setup_weave_near_filters = function (self, state_context, filter_table)
	local expansion_rule_index = math.min(self.state_context.expansion_rule_index or 1, WeaveMatchmakingSettings.num_expansion_rules)
	local expansion_rules = WeaveMatchmakingSettings.expansion_rules[expansion_rule_index]
	local current_filter_rules = expansion_rules.near_filters

	for filter_name, filter_data in pairs(current_filter_rules) do
		local value = filter_data.value or filter_data.fetch_function(self._state)
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

		if filter_data.debug_format then
			value = filter_data.debug_format(value)
		end

		Debug.text(" - " .. name .. ": " .. tostring(value))
	end

	Debug.text("")
	Debug.text("Near Filters:")

	for name, filter_data in pairs(expansion_rule_settings.near_filters) do
		local value = filter_data.fetch_function(state)
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
