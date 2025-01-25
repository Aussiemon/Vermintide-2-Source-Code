-- chunkname: @scripts/managers/game_mode/game_modes/game_mode_inn_vs.lua

require("scripts/managers/game_mode/game_modes/game_mode_base")
require("scripts/managers/admin/dedicated_server_commands")
require("scripts/managers/game_mode/spawning_components/simple_spawning")

local COMPLETE_LEVEL_VAR = false
local FAIL_LEVEL_VAR = false

GameModeInnVs = class(GameModeInnVs, GameModeBase)

GameModeInnVs.init = function (self, settings, world, network_server, ...)
	GameModeInnVs.super.init(self, settings, world, network_server, ...)

	self._mechanism = Managers.mechanism:game_mechanism()
	self._adventure_profile_rules = AdventureProfileRules:new(self._profile_synchronizer, self._network_server)

	if DEDICATED_SERVER then
		self._auto_force_start_time = math.huge

		Managers.state.event:register(self, "game_server_unreserve_party_slot", "on_game_server_unreserve_party_slot")
	else
		local use_spawn_point_groups = true

		self._simple_spawning = SimpleSpawning:new(self._profile_synchronizer, use_spawn_point_groups)

		Managers.state.event:register(self, "level_start_local_player_spawned", "event_local_player_spawned")
	end

	if self._is_server then
		self._lobby_host = network_server.lobby_host
	end

	if self._mechanism:is_hosting_versus_custom_game() then
		self._mechanism:set_is_hosting_versus_custom_game(false)
	end

	if not DEDICATED_SERVER then
		self._mechanism:set_custom_game_settings_handler_enabled(false)
	end
end

GameModeInnVs.destroy = function (self)
	if DEDICATED_SERVER then
		Managers.state.event:unregister("game_server_unreserve_party_slot", self)
	end
end

GameModeInnVs.register_rpcs = function (self, network_event_delegate, network_transmit)
	GameModeInnVs.super.register_rpcs(self, network_event_delegate, network_transmit)

	if self._simple_spawning then
		self._simple_spawning:register_rpcs(network_event_delegate, network_transmit)
	end
end

GameModeInnVs.unregister_rpcs = function (self)
	GameModeInnVs.super.unregister_rpcs(self)

	if self._simple_spawning then
		self._simple_spawning:unregister_rpcs()
	end
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
				on_exit_callback = callback(self, "_cb_start_menu_closed"),
			})
		elseif GameSettingsDevelopment.skip_start_screen or Development.parameter("skip_start_screen") then
			local first_hero_selection_made = SaveData.first_hero_selection_made
			local backend_waiting_for_input = Managers.backend:is_waiting_for_user_input()
			local show_hero_selection = not backend_waiting_for_input and not first_hero_selection_made

			Managers.ui:handle_transition("initial_start_menu_view_force", {
				menu_state_name = show_hero_selection and "character" or "overview",
				on_exit_callback = callback(self, "_cb_start_menu_closed"),
			})
		else
			Managers.ui:handle_transition("initial_character_selection_force", {
				menu_state_name = "character",
				on_exit_callback = callback(self, "_cb_start_menu_closed"),
			})
		end
	else
		self:_cb_start_menu_closed()
	end

	if self._is_initial_spawn then
		LevelHelper:flow_event(self._world, "local_player_spawned")

		if Development.parameter("attract_mode") then
			LevelHelper:flow_event(self._world, "start_benchmark")
		else
			LevelHelper:flow_event(self._world, "level_start_local_player_spawned")
		end
	end

	if not DEDICATED_SERVER and Development.parameter("vs_auto_search") then
		Managers.mechanism:request_vote({
			dedicated_servers_aws = true,
			dedicated_servers_win = false,
			difficulty = "versus_base",
			join_method = "party",
			matchmaking_type = "standard",
			mechanism = "versus",
			player_hosted = false,
			private_game = false,
			quick_game = true,
			request_type = "versus_quickplay",
		})
	end
end

GameModeInnVs._cb_start_menu_closed = function (self)
	Managers.state.event:trigger("tutorial_trigger", "keep_menu_left")
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

GameModeInnVs.player_entered_game_session = function (self, peer_id, local_player_id, requested_party_index)
	local assigned_party_id = self._mechanism:handle_party_assignment_for_joining_peer(peer_id, local_player_id)
	local _, current_party_id = Managers.party:get_party_from_player_id(peer_id, local_player_id)

	if assigned_party_id ~= current_party_id then
		Managers.party:request_join_party(peer_id, local_player_id, assigned_party_id)
	end

	if LAUNCH_MODE ~= "attract_benchmark" then
		self._adventure_profile_rules:handle_profile_delegation_for_joining_player(peer_id, local_player_id)
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

GameModeInnVs.get_initial_inventory = function (self, healthkit, potion, grenade, additional_items, profile)
	local initial_inventory

	if profile.affiliation == "heroes" then
		initial_inventory = {
			slot_packmaster_claw = "packmaster_claw_combo",
			slot_healthkit = healthkit,
			slot_potion = potion,
			slot_grenade = grenade,
			additional_items = additional_items,
		}
	else
		initial_inventory = {}
	end

	return initial_inventory
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
		self:_handle_auto_force_start(t, dt)
	else
		local parties = Managers.party:parties()

		for party_id = 1, #parties do
			local party = parties[party_id]

			self._simple_spawning:update(t, dt, party)
		end
	end

	local reservation_handler = self._mechanism:get_slot_reservation_handler()

	if reservation_handler and reservation_handler.handle_dangling_peers then
		reservation_handler:handle_dangling_peers()
	end
end

GameModeInnVs._game_mode_state_changed = function (self, new_state)
	if self._is_server and new_state == "dedicated_server_starting_game" then
		self:_start_hosting_server()
	end
end

GameModeInnVs._handle_dedicated_start_game = function (self, t, dt)
	if self._game_mode_state == "dedicated_server_waiting_for_fully_reserved" and self._mechanism:should_game_server_start_game() then
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

GameModeInnVs.is_reservable = function (self)
	return true
end

GameModeInnVs.is_joinable = function (self)
	return self:is_reservable() and self:game_mode_state() ~= "dedicated_server_waiting_for_fully_reserved"
end

GameModeInnVs.update_auto_force_start_conditions = function (self, peers)
	return
end

GameModeInnVs._set_auto_force_start_time = function (self)
	local settings = self._settings.auto_force_start

	if not settings.enabled then
		return
	end

	if self._auto_force_start_time < math.huge then
		return
	end

	local start_after_seconds = settings.start_after_seconds
	local t = Managers.time:time("game")

	self._auto_force_start_time = t + start_after_seconds
	self._check_all_players_reserved_time = t + 2

	printf("[GameModeInnVS:_set_auto_force_start_time]: Automatic force start in %s seconds if teams remain unchanged", settings.start_after_seconds)
end

GameModeInnVs._handle_auto_force_start = function (self, t, dt)
	if t < self._auto_force_start_time then
		return
	end

	self._auto_force_start_time = math.huge
end

GameModeInnVs.play_sound = function (self, event)
	local wwise_world = Managers.world:wwise_world(self._world)

	WwiseWorld.trigger_event(wwise_world, event)
end
