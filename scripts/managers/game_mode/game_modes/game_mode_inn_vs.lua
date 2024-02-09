-- chunkname: @scripts/managers/game_mode/game_modes/game_mode_inn_vs.lua

require("scripts/managers/game_mode/game_modes/game_mode_base")
require("scripts/managers/admin/dedicated_server_commands")
require("scripts/managers/game_mode/spawning_components/simple_spawning")

local COMPLETE_LEVEL_VAR = false
local FAIL_LEVEL_VAR = false

GameModeInnVs = class(GameModeInnVs, GameModeBase)

GameModeInnVs.init = function (self, settings, world, network_server, ...)
	GameModeInnVs.super.init(self, settings, world, network_server, ...)

	if DEDICATED_SERVER then
		self._stale_server_time = math.huge
		self._auto_force_start_time = math.huge

		Managers.state.event:register(self, "game_server_reserve_party_slot", "on_game_server_reserve_party_slot")
		Managers.state.event:register(self, "game_server_unreserve_party_slot", "on_game_server_unreserve_party_slot")
	else
		local use_spawn_point_groups = false

		self._simple_spawning = SimpleSpawning:new(self._profile_synchronizer, use_spawn_point_groups)

		Managers.state.event:register(self, "level_start_local_player_spawned", "event_local_player_spawned")
	end

	self._mechanism = Managers.mechanism:game_mechanism()

	if self._is_server then
		self._lobby_host = network_server.lobby_host
	end
end

GameModeInnVs.destroy = function (self)
	if DEDICATED_SERVER then
		Managers.state.event:unregister("game_server_reserve_party_slot", self)
		Managers.state.event:unregister("game_server_unreserve_party_slot", self)
	end
end

GameModeInnVs.register_rpcs = function (self, network_event_delegate, network_transmit)
	GameModeInnVs.super.register_rpcs(self, network_event_delegate, network_transmit)
end

GameModeInnVs.unregister_rpcs = function (self)
	GameModeInnVs.super.unregister_rpcs(self)
end

GameModeInnVs.local_player_ready_to_start = function (self)
	return self._game_mode_state ~= "initial_state"
end

GameModeInnVs.local_player_game_starts = function (self, player, loading_context)
	local show_profile_on_startup = loading_context.show_profile_on_startup

	loading_context.show_profile_on_startup = nil

	if show_profile_on_startup and not LEVEL_EDITOR_TEST and not Development.parameter("skip-start-menu") then
		local platform = PLATFORM

		if IS_CONSOLE then
			Managers.ui:handle_transition("initial_character_selection_force", {
				menu_state_name = "character",
			})
		else
			local first_hero_selection_made = SaveData.first_hero_selection_made
			local backend_waiting_for_input = Managers.backend:is_waiting_for_user_input()
			local show_hero_selection = not backend_waiting_for_input and not first_hero_selection_made

			Managers.ui:handle_transition("initial_start_menu_view_force", {
				menu_state_name = show_hero_selection and "character" or "overview",
			})
		end
	end

	if self._is_initial_spawn then
		LevelHelper:flow_event(self._world, "local_player_spawned")

		if Development.parameter("attract_mode") then
			LevelHelper:flow_event(self._world, "start_benchmark")
		else
			LevelHelper:flow_event(self._world, "level_start_local_player_spawned")
		end
	end
end

GameModeInnVs.evaluate_end_conditions = function (self, round_started)
	if COMPLETE_LEVEL_VAR then
		COMPLETE_LEVEL_VAR = false

		return true, "won"
	end

	if self:_is_time_up() then
		return true, "reload"
	end

	if FAIL_LEVEL_VAR then
		FAIL_LEVEL_VAR = false

		return true, "lost"
	end

	if self._level_completed then
		return true, "start_game"
	else
		return false
	end
end

GameModeInnVs.setup_done = function (self)
	if DEDICATED_SERVER then
		self:change_game_mode_state("dedicated_server_waiting_for_fully_reserved")
		self._mechanism:set_side_order_state(1)
	else
		self:change_game_mode_state("party_lobby")
		self:play_sound("Stop_versus_hud_last_hero_down_riser")
	end
end

GameModeInnVs.COMPLETE_LEVEL = function (self)
	COMPLETE_LEVEL_VAR = true
end

GameModeInnVs.FAIL_LEVEL = function (self)
	FAIL_LEVEL_VAR = true
end

GameModeInnVs.player_entered_game_session = function (self, peer_id, local_player_id, wanted_party_index)
	local current_party_id, wanted_party_id = self._mechanism:handle_party_assignment_for_joining_peer(peer_id, local_player_id, wanted_party_index)

	if wanted_party_index ~= current_party_id then
		Managers.party:request_join_party(peer_id, local_player_id, wanted_party_index)
	elseif wanted_party_id ~= current_party_id then
		Managers.party:request_join_party(peer_id, local_player_id, wanted_party_id)
	end

	local profile_index, career_index = self._network_server:peer_wanted_profile(peer_id, local_player_id)

	if profile_index and career_index then
		local profile_settings = SPProfiles[profile_index]
		local careers = profile_settings.careers
		local hero_name = profile_settings.display_name

		if not careers[career_index]:is_unlocked_function(hero_name, ExperienceSettings.max_level) then
			profile_index, career_index = self._profile_synchronizer:get_first_free_profile()
		end

		local is_bot = false

		self._profile_synchronizer:assign_full_profile(peer_id, local_player_id, profile_index, career_index, is_bot)
	end

	if not DEDICATED_SERVER then
		self._simple_spawning:setup_data(peer_id, local_player_id)
	end
end

GameModeInnVs.player_left_game_session = function (self, peer_id, local_player_id)
	local party_manager = Managers.party
	local status = party_manager:get_player_status(peer_id, local_player_id)

	if status then
		status.game_mode_data = {}
	end
end

GameModeInnVs.player_joined_party = function (self, peer_id, local_player_id, party_id, slot_id)
	if not DEDICATED_SERVER then
		self._simple_spawning:setup_data(peer_id, local_player_id)
	end
end

GameModeInnVs.player_left_party = function (self, peer_id, local_player_id, party_id, slot_id)
	return
end

GameModeInnVs.on_game_server_reserve_party_slot = function (self, index, peer_id, is_reserver)
	local t = Managers.time:time("game")

	self._stale_server_time = t + 60 + Math.random_range(-5, 5)
end

GameModeInnVs.on_game_server_unreserve_party_slot = function (self, slot_index, peer_id)
	if DEDICATED_SERVER and self._mechanism:get_slot_reservation_handler():is_empty() then
		self._transition_state = "restart_game_server"
	end
end

GameModeInnVs.flow_callback_add_spawn_point = function (self, unit)
	if not DEDICATED_SERVER then
		self._simple_spawning:flow_callback_add_spawn_point(unit)
	end
end

GameModeInnVs.hero_profile_available_for_party = function (self, party_id, profile_index, peer_id, local_player_id, ignore_bots)
	local profile = SPProfiles[profile_index]

	if profile.affiliation ~= "heroes" then
		return false
	end

	return true
end

GameModeInnVs.profile_available = function (self, profile_synchronizer, profile_name, career_name)
	return true
end

GameModeInnVs.profile_available_for_peer = function (self, peer_id, local_player_id, profile_name, career_name)
	return true
end

GameModeInnVs.hot_join_sync = function (self, sender)
	GameModeInnVs.super.hot_join_sync(self, sender)
end

GameModeInnVs._send_system_message = function (self, message, ...)
	local localize_parameters = false
	local pop_chat = true

	Managers.chat:send_system_chat_message(1, message, nil, localize_parameters, pop_chat)
end

GameModeInnVs.force_map_pool = function (self, pool)
	self._force_map_pool = pool
end

GameModeInnVs.event_local_player_spawned = function (self, is_initial_spawn)
	self._local_player_spawned = true
	self._is_initial_spawn = is_initial_spawn
end

GameModeInnVs.server_update = function (self, t, dt)
	if DEDICATED_SERVER then
		self:_handle_dedicated_start_game(t, dt)
		self:_handle_dedicated_input(t, dt)
		self:_handle_kick_idle_players(t, dt)
		self:_handle_auto_force_start(t, dt)
	else
		local parties = Managers.party:parties()

		for party_id = 1, #parties do
			local party = parties[party_id]

			self._simple_spawning:update(t, dt, party)
		end
	end
end

GameModeInnVs._game_mode_state_changed = function (self, new_state)
	if self._is_server and new_state == "dedicated_server_starting_game" then
		self:_start_hosting_server()
	end
end

GameModeInnVs._handle_dedicated_start_game = function (self, t, dt)
	if self._game_mode_state == "dedicated_server_waiting_for_fully_reserved" and self._mechanism:is_game_server_fully_reserved() then
		Network.log("spew")
		self:change_game_mode_state("dedicated_server_starting_game")
	end
end

GameModeInnVs._handle_dedicated_input = function (self, t, dt)
	CommandWindow.update()

	local input = CommandWindow.read_line()

	if input then
		Managers.admin:execute_command(input)
	end
end

GameModeInnVs._verify_stale_state = function (self)
	local peers_to_be_kicked = self._stale_kicking_peers
	local num_active_peers = Managers.state.network.network_server.peer_state_machines

	for peer_id in pairs(num_active_peers) do
		fassert(peers_to_be_kicked[peer_id], "[GameModeInnVs] A peer %s was added while server was stale. This may lead to a race condition where servers start while going stale.", peer_id)
	end
end

GameModeInnVs._handle_kick_idle_players = function (self, t, dt)
	local network_manager = Managers.state.network

	if self._stale_kicking_peers then
		self:_verify_stale_state()

		local num_active_peers = network_manager.network_server:num_active_peers()

		if num_active_peers > 0 then
			return
		end

		self._stale_kicking_peers = nil
	end

	if self._game_mode_state ~= "dedicated_server_waiting_for_fully_reserved" or self._mechanism:is_game_server_fully_reserved() then
		return
	end

	local force_start_scheduled = t + self._settings.auto_force_start.start_after_seconds > self._auto_force_start_time

	if t < self._stale_server_time or force_start_scheduled then
		return
	end

	local mechanism = Managers.mechanism:game_mechanism()
	local reservation_handler = mechanism:get_slot_reservation_handler()

	self._stale_server_time = math.huge
	self._stale_kicking_peers = {}

	cprintf("[GameMode] Stale Server - Restarting")

	local reserved_peer_ids = reservation_handler:reservers()

	self._lobby_host:kick_all_except(table.mirror_array(reserved_peer_ids))

	for _, peer_id in pairs(reserved_peer_ids) do
		self._stale_kicking_peers[peer_id] = true

		network_manager.network_server:kick_peer(peer_id)
	end
end

GameModeInnVs._start_hosting_server = function (self)
	local map_pool = self._force_map_pool or Managers.mechanism:mechanism_setting_for_title("map_pool")
	local difficulty = self._settings.forced_difficulty
	local override_level_key = Managers.mechanism:game_mechanism():get_level_override_key()
	local override_map_pool = override_level_key and {
		override_level_key,
	}
	local search_config = {
		always_host = true,
		dedicated_server = false,
		game_mode = "versus",
		matchmaking_type = "versus",
		mechanism = "versus",
		private_game = true,
		quick_game = false,
		skip_waystone = true,
		preferred_level_keys = override_map_pool or table.clone(map_pool),
		difficulty = difficulty,
	}

	Managers.matchmaking:find_game(search_config)

	self._force_map_pool = nil
end

GameModeInnVs.wanted_transition = function (self)
	local state = self._transition_state

	if state == "restart_game_server" then
		return "restart_game_server"
	end
end

GameModeInnVs.is_joinable = function (self)
	return not self._stale_kicking_peers
end

GameModeInnVs.update_auto_force_start_conditions = function (self)
	local slot_reservation_handler = self._mechanism:get_slot_reservation_handler()
	local balanced_teams = slot_reservation_handler:is_evenly_distributed() or slot_reservation_handler:try_balance_teams()

	if balanced_teams then
		self:_set_auto_force_start_time()
	end
end

GameModeInnVs._set_auto_force_start_time = function (self)
	local settings = self._settings.auto_force_start

	if not settings.enabled then
		return
	end

	self._auto_force_start_time = Managers.time:time("game") + settings.start_after_seconds

	printf("[GameModeInnVS:_set_auto_force_start_time]: Automatic force start in %s seconds if teams remain unchanged", settings.start_after_seconds)
end

GameModeInnVs._handle_auto_force_start = function (self, t, dt)
	if t < self._auto_force_start_time then
		return
	end

	local slot_reservation_handler = self._mechanism:get_slot_reservation_handler()

	if slot_reservation_handler:is_evenly_distributed() or slot_reservation_handler:try_balance_teams() then
		printf("[GameModeInnVS:_handle_auto_force_start]: Automatically force starting game after %s seconds", self._settings.auto_force_start.start_after_seconds)
		self._mechanism:force_start_dedicated_server()

		self._stale_server_time = math.huge
	end

	self._auto_force_start_time = math.huge
end

GameModeInnVs.play_sound = function (self, event)
	local wwise_world = Managers.world:wwise_world(self._world)

	WwiseWorld.trigger_event(wwise_world, event)
end
