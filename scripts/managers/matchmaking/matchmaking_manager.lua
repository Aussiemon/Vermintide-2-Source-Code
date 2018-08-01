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
	}
}
local network_options = {
	project_hash = "bulldozer",
	config_file_name = "global",
	lobby_port = GameSettingsDevelopment.network_port,
	max_members = MAX_NUMBER_OF_PLAYERS
}
local RPCS = {
	"rpc_matchmaking_request_profiles_data",
	"rpc_matchmaking_request_join_lobby",
	"rpc_matchmaking_request_profile",
	"rpc_set_matchmaking",
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
	"rpc_start_game_countdown_finished"
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
	self._quick_game = params.quick_game
	self.handshaker_host = MatchmakingHandshakerHost:new(self.network_transmit)

	if not DEDICATED_SERVER then
		self.handshaker_client = MatchmakingHandshakerClient:new()
	end

	self.peers_to_sync = {}

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
end

MatchmakingManager.set_ingame_ui = function (self, ingame_ui)
	self._ingame_ui = ingame_ui
	self.params.ingame_ui = ingame_ui
end

MatchmakingManager.activate_waystone_portal = function (self, enable)
	LevelCountdownUI.set_waystone_activation(enable)
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

	if self._state.on_enter then
		mm_printf("Entering %s on_enter() ", new_state.NAME)
		self._state:on_enter(state_context)
	else
		mm_printf("Entering %s", new_state.NAME)
	end
end

MatchmakingManager.update = function (self, dt, t)
	if self._state then
		self.debug.statename = self._state.NAME
		local state_name = self._state.NAME
		local new_state, state_context = self._state:update(dt, t)

		if new_state then
			local new_state_name = new_state.NAME

			self:_change_state(new_state, self.params, state_context)
		end
	end

	self:_update_afk_logic(dt, t)
	self:_update_power_level(dt, t)

	local MatchmakingBrokenLobbies = MatchmakingBrokenLobbies

	for lobby_id, time_to_clear in pairs(MatchmakingBrokenLobbies) do
		if time_to_clear < t then
			mm_printf("Removing broken lobby %s, perhaps it will now work again?!", tostring(lobby_id))

			MatchmakingBrokenLobbies[lobby_id] = nil
		end
	end

	if self.is_server then
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

		self.handshaker_host:update(t)
	end

	if self.handshaker_client and self.handshaker_client.host_peer_id and self.network_transmit.connection_handler.current_connections[self.handshaker_client.host_peer_id] == nil then
		mm_printf_force("No connection to host, cancelling matchmaking")
		self:cancel_matchmaking()
		self.network_transmit:queue_local_rpc("rpc_stop_enter_game_countdown")
	end

	self:_update_debug(dt, t)
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

MatchmakingManager._update_power_level = function (self, dt, t)
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

MatchmakingManager._update_debug = function (self, dt, t)
	if DebugKeyHandler.key_pressed("f6", "start quick search", "network", "left shift") then
		self:find_game("whitebox_tutorial", "normal", false, false, t)
	end

	if script_data.debug_lobbies then
		if self._state == MatchmakingStateSearchGame then
			return
		end

		self.debug.lobby_timer = self.debug.lobby_timer - dt

		if self.debug.lobby_timer < 0 then
			self.debug.lobbies = self.lobby_finder:lobbies()
			self.debug.lobby_timer = MatchmakingSettings.TIME_BETWEEN_EACH_SEARCH
		end

		if DebugKeyHandler.key_pressed("f7", "join your other client", "network", "left shift") then
			local lobbies = self.lobby_finder:lobbies()

			for i = 1, #lobbies, 1 do
				local lobby_data = lobbies[i]

				if lobby_data.host ~= self.peer_id and lobby_data.unique_server_name == Development.parameter("unique_server_name") then
					mm_printf("Joining 'friend' lobby using F7")

					self.lobby_to_join = lobby_data

					break
				end
			end
		end

		if #self.lobby_finder:lobbies() > 1 and self._state.NAME == "MatchmakingStateIdle" then
			local start_matchmaking_timer = Development.parameter("start_matchmaking_timer")

			if start_matchmaking_timer and self.start_matchmaking_time == nil then
				self.start_matchmaking_time = t + start_matchmaking_timer
			end

			if self.start_matchmaking_time and self.start_matchmaking_time < t then
				self.start_matchmaking_time = t + 1000000

				self:find_game("whitebox_tutorial", "normal", false, true, t)
			end
		end
	end

	if DebugKeyHandler.key_pressed("l", "show lobbies", "network", "left shift") then
		if not script_data.debug_lobbies then
			script_data.debug_lobbies = true
		else
			script_data.debug_lobbies = not script_data.debug_lobbies
		end
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
	return self.params.popup_join_lobby_handler and self.params.popup_join_lobby_handler.visible
end

MatchmakingManager.party_has_level_unlocked = function (self, level_key)
	local players = Managers.player:human_players()
	local statistics_db = self.statistics_db

	for _, player in pairs(players) do
		local stats_id = player:stats_id()

		if not LevelUnlockUtils.level_unlocked(statistics_db, stats_id, level_key) then
			return false
		end
	end

	return true
end

MatchmakingManager._get_unlocked_levels_by_party = function (self)
	local unlocked_levels = {}
	local players = Managers.player:human_players()
	local statistics_db = self.statistics_db
	local level_keys = UnlockableLevelsByGameMode.adventure

	for _, level_key in ipairs(level_keys) do
		if self:party_has_level_unlocked(level_key) then
			unlocked_levels[#unlocked_levels + 1] = level_key
		end
	end

	return unlocked_levels
end

MatchmakingManager._get_level_key_by_amount_played_by_party = function (self, level_keys, debug_completed_times, debug_last_played_level, ignore_prints)
	fassert(#level_keys > 0, "Empty level_keys list")

	local times_played_list = {}
	local players = Managers.player:human_players()
	local statistics_db = self.statistics_db

	for _, player in pairs(players) do
		local stats_id = player:stats_id()

		for i, level_key in ipairs(level_keys) do
			local times_played = (debug_completed_times and debug_completed_times[level_key]) or statistics_db:get_persistent_stat(stats_id, "played_levels_quickplay", level_key)
			times_played_list[i] = (times_played_list[i] or 0) + times_played
		end
	end

	if not ignore_prints then
		table.dump(times_played_list, "times_played_list raw")
	end

	local modify_level_keys = {}

	for _, player in pairs(players) do
		local stats_id = player:stats_id()
		local last_completed_level_id = statistics_db:get_persistent_stat(stats_id, "last_played_level_id")
		local level_key = debug_last_played_level or UnlockableLevels[last_completed_level_id]

		if level_key then
			local i = table.find(level_keys, level_key)

			if i then
				modify_level_keys[level_key] = i
			end
		end
	end

	local increase_last_played_amount = 5

	for level_key, i in pairs(modify_level_keys) do
		if not ignore_prints then
			printf("increasing level_key(%s) by (%s) because of last_played_level_id", level_key, tostring(increase_last_played_amount))
		end

		times_played_list[i] = times_played_list[i] + increase_last_played_amount
	end

	if not ignore_prints then
		table.dump(times_played_list, "times_played_list after last played")
	end

	local highest_completed_count = 0

	for i, amount in ipairs(times_played_list) do
		local new_amount = amount
		times_played_list[i] = new_amount

		if highest_completed_count < new_amount then
			highest_completed_count = new_amount
		end
	end

	for i, amount in ipairs(times_played_list) do
		times_played_list[i] = highest_completed_count - amount + 1
	end

	local p, a = LoadedDice.create(times_played_list, false)
	local result = LoadedDice.roll(p, a)

	if not ignore_prints then
		table.dump(level_keys, "level_keys")
		table.dump(times_played_list, "times_played_list after roll")
		printf("Winning level (%s)", level_keys[result])
	end

	return level_keys[result]
end

MatchmakingManager.get_random_unlocked_level = function (self)
	local level_keys = self:_get_unlocked_levels_by_party()

	return level_keys[math.random(1, #level_keys)]
end

MatchmakingManager.get_weighed_random_unlocked_level = function (self)
	local level_keys = self:_get_unlocked_levels_by_party()
	local level_key = self:_get_level_key_by_amount_played_by_party(level_keys)

	return level_key
end

local function dump_array(t, name)
	printf("[%s]", name)

	for key, value in ipairs(t) do
		printf("[%s] = (%s)", tostring(key), tostring(value))
	end

	printf("[/%s]", name)
end

MatchmakingManager.debug_get_weighed_level = function (self)
	local level_keys = {
		"farmlands",
		"ussingen",
		"nurgle",
		"warcamp",
		"catacombs",
		"fort",
		"military",
		"skittergate",
		"elven_ruins",
		"skaven_stronghold",
		"ground_zero",
		"bell",
		"mines"
	}
	local times_played = {
		farmlands = 1,
		ussingen = 3,
		nurgle = 0,
		warcamp = 2,
		catacombs = 1,
		fort = 0,
		military = 1,
		skittergate = 0,
		elven_ruins = 1,
		skaven_stronghold = 1,
		ground_zero = 1,
		bell = 1,
		mines = 1
	}
	local last_played_level = "ussingen"
	local results = {}

	for _, level_key in ipairs(level_keys) do
		results[level_key] = 0
	end

	local results_percentage = {}
	local test_times = 10000

	for i = 1, test_times, 1 do
		local level_key = self:_get_level_key_by_amount_played_by_party(level_keys, times_played, last_played_level, true)
		results[level_key] = results[level_key] + 1
	end

	for result, amount in pairs(results) do
		results_percentage[result] = amount / test_times
	end

	local function sort(a, b)
		local picked_a = results[a]
		local picked_b = results[b]

		return picked_b < picked_a
	end

	table.sort(level_keys, sort)

	for _, level_key in ipairs(level_keys) do
		local last_played = level_key == last_played_level

		printf("(%s)\t\tplayed(%s)\t\tlast_played(%s)\t\tpicked: (%s) - (%.2f%%)", level_key, tostring(times_played[level_key]), tostring(last_played), tostring(results[level_key]), tostring(results_percentage[level_key]))
	end
end

MatchmakingManager.set_matchmaking_data = function (self, next_level_key, difficulty, act_key, game_mode, private_game, quick_game, eac_authorized)
	local level_transition_handler = self.level_transition_handler
	local current_level_key = level_transition_handler:get_current_level_keys()
	local lobby_members = self.lobby:members()
	local members = lobby_members:get_members()
	local num_players = #members
	local is_matchmaking = not private_game
	local lobby_data = self.lobby:get_stored_lobby_data()
	lobby_data.level_key = current_level_key
	lobby_data.game_mode = game_mode
	lobby_data.act_key = act_key
	lobby_data.matchmaking = (is_matchmaking and "true") or "false"
	lobby_data.selected_level_key = next_level_key
	lobby_data.unique_server_name = LobbyAux.get_unique_server_name()
	lobby_data.host = Network.peer_id()
	lobby_data.num_players = num_players
	lobby_data.difficulty = difficulty
	lobby_data.quick_game = (quick_game and "true") or "false"
	lobby_data.country_code = rawget(_G, "Steam") and Steam.user_country_code()
	lobby_data.twitch_enabled = (GameSettingsDevelopment.twitch_enabled and Managers.twitch:is_connected() and "true") or "false"
	lobby_data.eac_authorized = (eac_authorized and "true") or "false"

	print("[MATCHMAKING] - Hosting game on level:", current_level_key, next_level_key)
	level_transition_handler:set_next_level(next_level_key)
	self.lobby:set_lobby_data(lobby_data)
end

MatchmakingManager.on_dedicated_server = function (self)
	return self.lobby:is_dedicated_server()
end

MatchmakingManager.find_game = function (self, search_config)
	if self.is_server then
		self.state_context = {
			search_config = table.clone(search_config),
			started_matchmaking_t = Managers.time:time("main")
		}
		local private_game = search_config.private_game

		assert(private_game ~= nil)

		local quick_game = search_config.quick_game

		assert(quick_game ~= nil)
		self:set_quick_game(quick_game)

		local next_state = nil

		if Development.parameter("auto_host_dedicated") then
			next_state = MatchmakingStateSearchGameServer
		else
			local num_active_peers = self.network_server:num_active_peers()
			local people_in_local_hosted_party = num_active_peers > 1
			local always_host = search_config.always_host

			if private_game or people_in_local_hosted_party or always_host or ALWAYS_HOST_GAME then
				next_state = MatchmakingStateHostGame
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
		if not self.is_server then
			self.handshaker_client:reset()
		end

		mm_printf("Wasn't really matchmaking to begin with...")

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

			Managers.telemetry.events:matchmaking_connection(player, connection_state, time_taken, using_strict_matchmaking)
		end
	end

	self.state_context = {}

	if self._state then
		if self._state.lobby_client then
			self._state.lobby_client:destroy()

			self._state.lobby_client = nil
		end

		self:_change_state(MatchmakingStateIdle, self.params, self.state_context)
	end

	if self.is_server then
		local stored_lobby_data = self.lobby:get_stored_lobby_data()
		stored_lobby_data.matchmaking = "false"

		self.lobby:set_lobby_data(stored_lobby_data)

		local level_key_lookup = NetworkLookup.level_keys["n/a"]
		local difficulty_lookup = NetworkLookup.difficulties.normal
		local quick_game = false

		self.handshaker_host:send_rpc_to_clients("rpc_set_matchmaking", false, false, level_key_lookup, difficulty_lookup, quick_game)
		self:reset_lobby_filters()

		if not DEDICATED_SERVER then
			Managers.party:set_leader(self.network_server.lobby_host:lobby_host())
		end
	else
		Managers.party:set_leader(nil)
	end

	if self.handshaker_client ~= nil then
		self.handshaker_client:reset()
	end

	self.level_transition_handler:set_next_level(nil)
end

MatchmakingManager.is_game_matchmaking = function (self)
	local name = self._state.NAME
	local is_matchmaking = name ~= "MatchmakingStateIdle"
	local search_config = self.state_context.search_config
	local private_game = (search_config and search_config.private_game) or false

	return is_matchmaking, private_game
end

MatchmakingManager.rpc_set_matchmaking = function (self, sender, client_cookie, host_cookie, is_matchmaking, private_game, level_key, difficulty, quick_game)
	if not self.handshaker_client:validate_cookies(client_cookie, host_cookie) then
		return
	end

	if not self.is_server then
		mm_printf_force("Set matchmaking=%s, private_game=%s", tostring(is_matchmaking), tostring(private_game))

		if is_matchmaking then
			local level_key = NetworkLookup.level_keys[level_key]
			local difficulty = NetworkLookup.difficulties[difficulty]
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

MatchmakingManager.rpc_matchmaking_request_join_lobby = function (self, sender, client_cookie, host_cookie, lobby_id, friend_join)
	local id = self.lobby:id()
	id = tostring(id)
	lobby_id = tostring(lobby_id)
	local reply = "lobby_ok"
	local lobby_id_match = nil

	if DEDICATED_SERVER then
		lobby_id_match = id == lobby_id
	else
		lobby_id_match = (LobbyInternal.lobby_id_match and LobbyInternal.lobby_id_match(id, lobby_id)) or id == lobby_id
	end

	local is_game_mode_ended = (Managers.state.game_mode and Managers.state.game_mode:is_game_mode_ended()) or false
	local is_searching_for_players = self._state.NAME == "MatchmakingStateHostGame" or self._state.NAME == "MatchmakingStateIngame" or self._state.NAME == "MatchmakingStateWaitForCountdown"
	local handshaker_host = self.handshaker_host
	local valid_cookies = (handshaker_host and handshaker_host:validate_cookies(sender, client_cookie, host_cookie)) or false
	local is_friend = false

	if not DEDICATED_SERVER then
		is_friend = LobbyInternal.is_friend(sender) or friend_join
	end

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
	end

	mm_printf_force("Got request to join matchmaking lobby %s from %s, replying %s", lobby_id, sender, reply)

	local reply_id = NetworkLookup.game_ping_reply[reply]

	self.network_transmit:send_rpc("rpc_matchmaking_request_join_lobby_reply", sender, client_cookie, host_cookie, reply_id)
end

MatchmakingManager.rpc_matchmaking_request_profile = function (self, sender, client_cookie, host_cookie, profile)
	if not self.handshaker_host:validate_cookies(sender, client_cookie, host_cookie) then
		return
	end

	local lobby = self.lobby
	local player_slot_available = self.slot_allocator:is_free(profile)
	local reply = player_slot_available

	if player_slot_available then
		mm_printf("Assigning profile slot %d to %s", profile, sender)

		local local_player_id = 1

		self.slot_allocator:allocate_slot(profile, sender, local_player_id)
		self:update_profiles_data_on_clients()
	end

	self.network_transmit:send_rpc("rpc_matchmaking_request_profile_reply", sender, client_cookie, host_cookie, profile, reply)
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

MatchmakingManager.lobby_match = function (self, lobby_data, act_key, level_key, difficulty, game_mode, player_peer_id)
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

	if level_key then
		local correct_level = lobby_data.level_key == level_key or (lobby_data.selected_level_key and lobby_data.selected_level_key == level_key)

		if not correct_level then
			return false, "wrong level"
		end
	end

	if act_key and lobby_data.act_key ~= act_key then
		return false, "wrong act"
	end

	if game_mode and game_mode ~= lobby_data.game_mode then
		return false, "wrong game mode"
	end

	local correct_difficulty = lobby_data.difficulty == difficulty

	if not correct_difficulty then
		return false, "wrong difficulty"
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

MatchmakingManager.rpc_matchmaking_request_join_lobby_reply = function (self, sender, client_cookie, host_cookie, reply_id)
	if self._state and self._state.NAME == "MatchmakingStateRequestJoinGame" then
		self._state:rpc_matchmaking_request_join_lobby_reply(sender, client_cookie, host_cookie, reply_id)
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

MatchmakingManager.hot_join_sync = function (self, peer_id)
	self.peers_to_sync[peer_id] = true
	local player_slot_index = self.profile_synchronizer:profile_by_peer(peer_id, 1)

	if player_slot_index then
		local profile_owner = self.profile_synchronizer:owner(player_slot_index)
		local lobby = self.lobby
		local local_player_index = 1

		self.slot_allocator:allocate_slot(player_slot_index, profile_owner.peer_id, local_player_index)
		mm_printf("Assigned player %s to slot %d when hot join syncing", profile_owner.peer_id, player_slot_index)
	end

	RPC.rpc_set_client_game_privacy(peer_id, self:is_game_private())
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
	local lobby = self.lobby
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

MatchmakingManager.cancel_join_lobby = function (self, reason)
	self.state_context = {}

	if self._lobby_browser then
		self._lobby_browser:cancel_join_lobby(reason)
	end

	if reason ~= "cancelled" then
		Managers.simple_popup:queue_popup(Localize(reason), Localize("popup_error_topic"), "ok", Localize("popup_choice_ok"))
	end
end

MatchmakingManager.allowed_to_initiate_join_lobby = function (self)
	local matchmaking_status = self:_matchmaking_status()

	return matchmaking_status == "idle"
end

MatchmakingManager.send_system_chat_message = function (self, message, localization_param)
	local channel_id = 1
	local localization_param = ""
	local pop_chat = true

	Managers.chat:send_system_chat_message(channel_id, message, localization_param, pop_chat)
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
		else
			local lobby = self._state.lobby_client

			if lobby then
				local level_key = lobby:lobby_data("level_key")
				local difficulty = lobby:lobby_data("difficulty")
				local quick_game = self:is_quick_game()
				info.level_key = level_key
				info.difficulty = difficulty
				info.quick_game = quick_game
			end
		end
	elseif PLATFORM ~= "xb1" then
		local lobby = self.lobby
		local level_key = lobby:lobby_data("selected_level_key")
		local difficulty = lobby:lobby_data("difficulty")
		local quick_game = self:is_quick_game()
		info.level_key = level_key
		info.difficulty = difficulty
		info.quick_game = quick_game
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

return
