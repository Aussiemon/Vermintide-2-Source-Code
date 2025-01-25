-- chunkname: @scripts/managers/game_mode/game_modes/game_mode_versus.lua

require("scripts/managers/game_mode/game_modes/game_mode_base")
require("scripts/managers/game_mode/spawning_components/adventure_spawning")
require("scripts/managers/game_mode/spawning_components/versus_spawning")
require("scripts/managers/game_mode/versus_win_conditions")
require("scripts/managers/game_mode/versus_dark_pact_career_delegator")
require("scripts/managers/admin/dedicated_server_commands")
require("scripts/ui/views/pactsworn_video_transition_view")
require("scripts/managers/game_mode/versus_party_selection_logic")

script_data.disable_gamemode_end = script_data.disable_gamemode_end or Development.parameter("disable_gamemode_end")

local game_mode_versus_testify = script_data.testify and require("scripts/managers/game_mode/game_modes/game_mode_versus_testify")

GameModeVersus = class(GameModeVersus, GameModeBase)
GameModeVersus.WAIT_FOR_CLIENTS_TO_LEAVE_TIMEOUT = 30

local RPCS = {
	"rpc_rejoin_parties",
	"rpc_sync_next_horde_time",
	"rpc_selectable_careers_request",
	"rpc_selectable_careers_response",
	"rpc_set_playable_boss_can_be_picked",
}

GameModeVersus.init = function (self, settings, world, ...)
	GameModeVersus.super.init(self, settings, world, ...)

	self._game_end_condition_timer = nil
	self._round_id = nil
	self._objectives_completed = nil
	self._total_main_objectives = nil

	local level_settings = LevelSettings[self._level_key]

	self._training_mode = level_settings.training_mode

	local hero_side = Managers.state.side:get_side_from_name("heroes")
	local dark_pact_side = Managers.state.side:get_side_from_name("dark_pact")

	self._mechanism = Managers.mechanism:game_mechanism()
	self._current_mechanism_state = self._mechanism:get_state()
	self._adventure_spawning = AdventureSpawning:new(self._profile_synchronizer, hero_side, self._is_server, self._network_server)
	self._versus_spawning = VersusSpawning:new("dark_pact", self._profile_synchronizer, dark_pact_side.available_profiles, self._is_server, settings, self._dark_pact_career_delegator)
	self.pactsworn_video_transition_view = PactswornVideoTransitionView:new(self._world)

	self:_register_player_spawner(self._adventure_spawning)

	self._active_transporters = {}

	local hero_party = hero_side.party
	local dark_pact_party = dark_pact_side.party

	self._bot_players = {
		[hero_party.party_id] = {},
		[dark_pact_party.party_id] = {},
	}
	self._horde_timer = math.huge
	self._time_until_next_horde = math.huge
	self._hero_side = hero_side
	self._dark_pact_side = dark_pact_side
	self._available_profiles_by_party = {
		[hero_party.party_id] = table.clone(PROFILES_BY_AFFILIATION.heroes),
		[dark_pact_party.party_id] = table.clone(PROFILES_BY_AFFILIATION.dark_pact),
	}

	local event_manager = Managers.state.event

	event_manager:register(self, "level_start_local_player_spawned", "event_local_player_spawned", "gm_event_initial_peers_spawned", "gm_event_initial_peers_spawned", "end_screen_ui_complete", "event_end_screen_ui_complete", "event_set_loadout_items", "event_set_loadout_items")

	local mechanism = Managers.mechanism:game_mechanism()

	self._win_conditions = mechanism:win_conditions()

	local objective_settings = self._mechanism:get_objective_settings()

	self._win_conditions:setup_round(self._is_server, objective_settings)

	if self._is_server then
		self._dark_pact_career_delegator = VersusDarkPactCareerDelegator:new()

		self:_create_game_mode_data_game_object()

		self._lobby_host = self._network_server.lobby_host
		self._profile_requester = self._network_server:profile_requester()

		if DEDICATED_SERVER then
			self._start_game_timeout_timer = 0
		end
	end

	if settings.surge_events and settings.enable_horde_surge then
		local seed = Managers.mechanism:get_level_seed()
		local surge_events = settings.surge_events.events[self._level_key]

		self._horde_surge_handler = HordeSurgeHandler:new(self._is_server, world, surge_events, seed)
	end

	self._boss_has_been_played = false
	self._initial_peers_spawned = false
	self._local_player_spawned = false
	self.pre_round_start_timer = math.huge
	self._transition_state = "idle"
	self._transition_state_time = 0
	self._hero_bots_enabled = true

	if self._mechanism:custom_settings_enabled() then
		self._hero_bots_enabled = self._mechanism:get_custom_game_setting("hero_bots_enabled")
	end
end

GameModeVersus.level_start_objectives = function (self)
	return self:_get_objective_list_name_current_set()
end

GameModeVersus._create_game_mode_data_game_object = function (self)
	local network_manager = Managers.state.network
	local objective_settings = self._mechanism:get_objective_settings()
	local game_mode_data = {
		go_type = NetworkLookup.go_types.game_mode_data,
		round_timer = objective_settings.round_timer or 36000,
	}
	local go_id = network_manager:create_game_object("game_mode_data_carousel", game_mode_data)
	local game_session = network_manager:game()
	local disconnect_callback = callback(self, "game_session_disconnect")

	self._win_conditions:on_game_mode_data_created(game_session, go_id, disconnect_callback)

	self._go_id = go_id
end

GameModeVersus.on_game_mode_data_created = function (self, game_session, go_id)
	self._win_conditions:on_game_mode_data_created(game_session, go_id)
end

GameModeVersus.on_game_mode_data_destroyed = function (self)
	self._win_conditions:on_game_mode_data_destroyed()

	self._go_id = nil
end

GameModeVersus.game_session_disconnect = function (self)
	self._win_conditions:on_game_mode_data_destroyed()

	self._go_id = nil
end

GameModeVersus.cleanup_game_mode_units = function (self)
	self:_clear_bots(true)
end

GameModeVersus.register_rpcs = function (self, network_event_delegate, network_transmit)
	GameModeVersus.super.register_rpcs(self, network_event_delegate, network_transmit)
	network_event_delegate:register(self, unpack(RPCS))
	self._adventure_spawning:register_rpcs(network_event_delegate, network_transmit)
	self._versus_spawning:register_rpcs(network_event_delegate, network_transmit)

	if self._horde_surge_handler then
		self._horde_surge_handler:register_rpcs(network_event_delegate, network_transmit)
	end

	if self._win_conditions then
		self._win_conditions:register_rpcs(network_event_delegate, network_transmit)
	end
end

GameModeVersus.unregister_rpcs = function (self)
	self._adventure_spawning:unregister_rpcs()
	self._versus_spawning:unregister_rpcs()
	self._network_event_delegate:unregister(self)

	if self._horde_surge_handler then
		self._horde_surge_handler:unregister_rpcs()
	end

	if self._win_conditions then
		self._win_conditions:unregister_rpcs()
	end

	GameModeVersus.super.unregister_rpcs(self)
end

GameModeVersus.event_local_player_spawned = function (self, is_initial_spawn)
	local level = LevelHelper:current_level(self._world)
	local versus_safe_zone_name = "versus_activator"

	if Level.has_volume(level, versus_safe_zone_name) then
		Managers.state.entity:system("round_started_system"):set_start_area(versus_safe_zone_name)
	end

	self._is_initial_spawn = is_initial_spawn

	local win_conditions = self._win_conditions
	local player = Managers.player:local_player()
	local side = Managers.state.side:get_side_from_player_unique_id(player:unique_id())
	local is_hero = side and side:name() == "heroes"

	if is_hero and not self._local_player_spawned then
		Managers.transition:force_fade_in()

		self._delayed_fade_out_timer = Managers.time:time("game") + 0.5
	end

	if is_hero and not win_conditions:is_round_timer_started() then
		local player_unit = player.player_unit
		local career_extension = ScriptUnit.has_extension(player_unit, "career_system")

		career_extension:set_activated_ability_cooldown_paused()
	end

	if is_initial_spawn then
		LevelHelper:flow_event(self._world, "local_player_spawned")

		local object_set_name = string.format("versus_%s", side:name())

		Managers.state.game_mode:set_object_set_enabled(object_set_name, true)
	end

	self._local_player_spawned = true
end

GameModeVersus.party_selection_logic = function (self)
	return self._versus_party_selection_logic
end

GameModeVersus.hot_join_sync = function (self, peer_id)
	if self._initial_peers_spawned then
		self._network_transmit:send_rpc("rpc_gm_event_initial_peers_spawned", peer_id)
	end

	if self._versus_party_selection_logic then
		self._versus_party_selection_logic:hot_join_sync(peer_id)
	end

	self._win_conditions:hot_join_sync(peer_id)

	if self._horde_surge_handler then
		self._horde_surge_handler:hot_join_sync(peer_id)
	end

	local state = self._game_mode_state

	if state == "match_running_state" then
		local event_name = "round_started_set_" .. self._mechanism:get_current_set()

		self._network_transmit:send_rpc_clients("rpc_trigger_level_event", event_name)
		self._network_transmit:send_rpc("rpc_trigger_level_event", peer_id, "remove_safe_zone_wall")
	end
end

GameModeVersus.destroy = function (self)
	if self._is_server then
		self._dark_pact_career_delegator:destroy()
	end

	if self._versus_party_selection_logic then
		self._versus_party_selection_logic:destroy()

		self._versus_party_selection_logic = nil
	end

	local event_manager = Managers.state.event

	if event_manager then
		event_manager:unregister("level_start_local_player_spawned", self)
		event_manager:unregister("gm_event_initial_peers_spawned", self)
		event_manager:unregister("end_screen_ui_complete", self)
		event_manager:unregister("event_set_loadout_items", self)
	end
end

GameModeVersus.evaluate_end_conditions = function (self, round_started, dt, t)
	repeat
		if script_data.auto_complete_rounds and (self._game_mode_state == "match_running_state" or self._game_mode_state == "pre_start_round_state") then
			break
		end

		if self._training_mode or script_data.disable_gamemode_end then
			return false
		end

		if not round_started and not self._level_completed and not self._level_failed then
			return false
		end
	until true

	local ignore_bots = true
	local round_ended = false
	local round_timer_over = self._win_conditions:is_round_timer_over()
	local objective_system = Managers.state.entity:system("objective_system")
	local all_objectives_completed = objective_system:all_objectives_completed()
	local party_won_early_data = self._win_conditions.party_won_early
	local humans_dead = GameModeHelper.side_is_dead("heroes", ignore_bots)
	local heroes_disabled = GameModeHelper.side_is_disabled("heroes")
	local heroes_dead_or_disabled = humans_dead or heroes_disabled
	local party = Managers.state.side:get_party_from_side_name("dark_pact")
	local no_pactsworn_players = party.num_used_slots == 0

	if script_data.disable_gamemode_end_hero_check then
		heroes_dead_or_disabled = false
	end

	local game_should_end_early = not self._lose_condition_disabled and (heroes_dead_or_disabled or no_pactsworn_players or self._level_failed) or round_timer_over or all_objectives_completed or party_won_early_data or script_data.auto_complete_rounds or false

	if self._level_completed then
		self._level_complete_timer = self._level_complete_timer or t + 0.4
		round_ended = t >= self._level_complete_timer

		if not self._last_hero_down_riser_played then
			local audio_system = Managers.state.entity:system("audio_system")

			audio_system:play_2d_audio_event("Play_versus_hud_last_hero_down_riser")

			self._last_hero_down_riser_played = true
		end
	elseif self:is_about_to_end_game_early() then
		if game_should_end_early and self._game_end_condition_timer then
			if t > self._game_end_condition_timer then
				round_ended = true
			end
		else
			if self._last_hero_down_riser_played then
				local audio_system = Managers.state.entity:system("audio_system")

				audio_system:play_2d_audio_event("Stop_versus_hud_last_hero_down_riser_interrupted")

				self._last_hero_down_riser_played = false
			end

			self:set_about_to_end_game_early(nil)

			self._game_end_condition_timer = nil
		end
	elseif game_should_end_early then
		self:set_about_to_end_game_early(true)

		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_2d_audio_event("Play_versus_hud_last_hero_down_riser")

		self._last_hero_down_riser_played = true

		if script_data.auto_complete_rounds then
			self._game_end_condition_timer = t
		elseif humans_dead then
			self._game_end_condition_timer = t + GameModeSettings.versus.lose_condition_time_dead
		else
			self._game_end_condition_timer = t + GameModeSettings.versus.lose_condition_time
		end
	end

	if round_ended then
		local reason, reason_data = self:_get_end_reason(party_won_early_data)

		reason = self:_handle_round_end(reason, reason_data, all_objectives_completed)

		self._mechanism:server_decide_side_order()

		if DEDICATED_SERVER or self._mechanism:is_hosting_versus_custom_game() then
			Managers.party:server_update_all_client_friend_parties()
		end

		self._level_complete_timer = nil
		self._game_end_condition_timer = nil
		self._round_timer = nil

		self:change_game_mode_state("post_round_state")

		return true, reason, reason_data
	else
		return false
	end
end

GameModeVersus._handle_round_end = function (self, reason, reason_data, all_objectives_completed)
	local all_rounds_played = Development.parameter("versus_quick_match_end") or self._current_mechanism_state == "round_2" and self._mechanism:is_last_set()
	local hero_party_id = Managers.state.side:get_side_from_name("heroes").party.party_id
	local heroes_won_early = reason_data and reason_data.party_id == hero_party_id or false
	local heroes_won = all_objectives_completed or heroes_won_early

	if reason == "party_one_won_early" or reason == "party_two_won_early" then
		self:_trigger_early_win_vo(reason_data.party_id)
	elseif all_rounds_played then
		reason = self._win_conditions:get_match_results()

		if reason == "draw" then
			self:_trigger_draw_vo()
		end
	elseif not heroes_won then
		local dialogue_system = Managers.state.entity:system("dialogue_system")

		dialogue_system:trigger_mission_giver_event("vs_mg_heroes_team_wipe")
	end

	self:_server_on_round_over(heroes_won)
	self:_round_end_telemetry()

	if reason ~= "round_end" then
		self:_match_end_telemetry(reason)
	end

	return reason
end

GameModeVersus._get_end_reason = function (self, party_won_early_data)
	local reason = "round_end"
	local reason_data

	if not party_won_early_data then
		local _

		_, party_won_early_data = self._win_conditions:update_early_win_conditions()
	end

	if party_won_early_data then
		reason = party_won_early_data.party_id == 1 and "party_one_won_early" or "party_two_won_early"
		reason_data = party_won_early_data
	end

	return reason, reason_data
end

GameModeVersus.ready_to_transition = function (self)
	local all_rounds_played = self._current_mechanism_state == "round_2" and not self._mechanism:should_start_next_set()

	if all_rounds_played or self._win_conditions.party_won_early then
		self._network_transmit:send_rpc_clients("rpc_rejoin_parties")

		if not DEDICATED_SERVER then
			self._transition_state = "versus_migration"
		else
			self._transition_state = "wait_until_empty"
			self._transition_state_time = 0
		end
	else
		self._transition_state = "next_level"

		Managers.level_transition_handler:promote_next_level_data()
	end

	printf("[GameModeVersus] Ready to transition. _transition_state: %s, _is_server: %s, all_rounds_played: %s, party_won-early: %s", self._transition_state, self._is_server, all_rounds_played, self._win_conditions.party_won_early)
end

GameModeVersus.wanted_transition = function (self)
	local state = self._transition_state

	if state == "next_level" then
		return "complete_level"
	elseif state == "restart_game_server" then
		return "restart_game_server"
	elseif state == "quit_game" then
		return "quit_game"
	elseif state == "versus_migration" then
		return "versus_migration"
	end
end

GameModeVersus.server_character_selection_completed = function (self)
	if self._settings.display_parading_view then
		self:change_game_mode_state("player_team_parading_state")
	else
		self:change_game_mode_state("pre_start_round_state")
	end
end

GameModeVersus.pre_update = function (self, t, dt)
	local state = self._game_mode_state

	if self._is_server and self:is_in_round_state() then
		self:_handle_bots(t, dt)
	end

	if self._versus_party_selection_logic then
		self._versus_party_selection_logic:pre_update(t, dt)
	end
end

GameModeVersus.player_ready = function (self)
	return self._local_player_spawned and not self._delayed_fade_out_timer
end

GameModeVersus.update = function (self, t, dt)
	if self._is_server then
		self._dark_pact_career_delegator:update()
		self:_update_hero_rushing(t)
	else
		self:_client_update(t, dt)
	end

	if self._delayed_fade_out_timer and t > self._delayed_fade_out_timer then
		Managers.transition:fade_out(GameSettings.transition_fade_out_speed)

		self._delayed_fade_out_timer = nil
	end

	if self._initial_peers_ready then
		local state = self._game_mode_state

		if self:is_in_round_state() then
			self._adventure_spawning:update(t, dt)

			if state == "match_running_state" then
				-- Nothing
			end
		end

		if self.pactsworn_video_transition_view then
			self.pactsworn_video_transition_view:update(dt)
		end
	end

	if script_data.testify then
		Testify:poll_requests_through_handler(game_mode_versus_testify, self)
	end
end

GameModeVersus._game_mode_state_changed = function (self, state_name, old_state_name)
	if self._current_mechanism_state == "round_1" then
		self._round_id = 1
	else
		self._round_id = 2
	end

	if self._is_server then
		self._start_game_timeout_timer = 0
	end

	if state_name == "waiting_for_players_to_join" then
		self._mechanism:increment_total_rounds_started()
	elseif state_name == "character_selection_state" then
		self._versus_party_selection_logic = VersusPartySelectionLogic:new(self._is_server, self._settings, self._network_server, self._profile_synchronizer, self._network_event_delegate, self._network_transmit)

		self._mechanism:make_profiles_reservable()
		Managers.ui:handle_transition("versus_party_char_selection_view", {
			menu_state_name = "character",
		})

		if not DEDICATED_SERVER then
			self:_disable_side_object_sets()
		end

		self:_stop_advertise_playing()

		if self._mechanism:custom_settings_enabled() then
			self:_custom_settings_telemetry()
		end
	elseif state_name == "player_team_parading_state" then
		local is_hot_joining = old_state_name ~= "character_selection_state"

		if is_hot_joining then
			self._versus_party_selection_logic = VersusPartySelectionLogic:new(self._is_server, self._settings, self._network_server, self._profile_synchronizer, self._network_event_delegate, self._network_transmit)
		end

		local duration = self:_get_parading_screen_duration()

		Managers.ui:handle_transition("versus_team_parading_view", {
			menu_state_name = "parading",
			duration = duration,
		})

		self._parading_timer = Managers.time:time("game") + duration

		self:_stop_advertise_playing()
	elseif state_name == "pre_start_round_state" then
		if self._versus_party_selection_logic then
			self._versus_party_selection_logic:destroy()

			self._versus_party_selection_logic = nil
		end

		self:_advertise_playing()
		self:_update_profiles()
		self:_spawn_pact_sworn("dark_pact")
		self:_init_pact_sworn_camera_state()
		self:_start_objective()
		Managers.state.event:trigger("versus_pre_start_initialized")
		Managers.ui:handle_transition("exit_menu", {
			use_fade = true,
			fade_in_speed = GameSettings.transition_fade_in_speed,
		})

		if self._is_server then
			local ghost_mode = Managers.state.entity:system("ghost_mode_system")

			ghost_mode:set_active(true)
		end
	elseif state_name == "match_running_state" then
		if not DEDICATED_SERVER then
			self:_round_start_telemetry()
		end

		local is_hot_join = old_state_name ~= "pre_start_round_state"

		if is_hot_join then
			self:_init_pact_sworn_camera_state()
			self:_advertise_playing()
		end

		if self._is_server then
			local ghost_mode = Managers.state.entity:system("ghost_mode_system")

			ghost_mode:set_active(true)
		end
	elseif state_name == "post_round_state" then
		self:play_sound("Stop_versus_hud_last_hero_down_riser")
		self:_register_disabled_as_eliminiations()
		self._win_conditions:round_ended()
		self:_stop_advertise_playing()
	end
end

GameModeVersus._advertise_playing = function (self)
	return
end

GameModeVersus._stop_advertise_playing = function (self)
	if not DEDICATED_SERVER then
		local network_handler = Managers.mechanism:network_handler()

		if network_handler.lobby_client and network_handler.lobby_client.stop_advertise_playing then
			network_handler.lobby_client:stop_advertise_playing()
		end
	end
end

GameModeVersus._update_profiles = function (self)
	if not self._is_server then
		return
	end

	local parties = Managers.party:parties()

	for i = 1, #parties do
		local party = parties[i]

		if party.game_participating then
			local occupied_slots = party.occupied_slots

			for j = 1, #occupied_slots do
				local status = occupied_slots[j]

				self:_update_profile_in_party(status.peer_id, status.local_player_id, party.party_id)
			end
		end
	end
end

GameModeVersus._init_pact_sworn_camera_state = function (self)
	local party = Managers.party:get_local_player_party()
	local side = Managers.state.side.side_by_party[party]

	if side and side:name() == "dark_pact" then
		local local_player = Managers.player:local_player()

		CharacterStateHelper.change_camera_state(local_player, "observer", {
			input_service_name = "dark_pact_selection",
		})
	end
end

GameModeVersus._spawn_pact_sworn = function (self)
	local horde_ability_system = Managers.state.entity:system("versus_horde_ability_system")
	local party = Managers.party:get_party_from_name("dark_pact")
	local spawn_time = 0
	local occupied_slots = party.occupied_slots

	for j = 1, #occupied_slots do
		local status = occupied_slots[j]
		local peer_id = status.peer_id
		local local_player_id = status.local_player_id

		self._versus_spawning:setup_data(peer_id, local_player_id)

		if self._is_server then
			self._versus_spawning:set_spawn_state(peer_id, local_player_id, "w8_for_profile", 0, spawn_time, true)
			horde_ability_system:server_register_peer(peer_id)
		end
	end
end

GameModeVersus.assign_temporary_dark_pact_profile = function (self, status)
	local profile = PROFILES_BY_NAME.vs_undecided

	self:set_profile(status, profile.index, 1, false)
end

GameModeVersus.round_started = function (self)
	if self._is_server then
		local dialogue_system = Managers.state.entity:system("dialogue_system")

		dialogue_system:queue_mission_giver_event("vs_mg_heroes_left_safe_room")
	end

	local horde_ability_system = Managers.state.entity:system("versus_horde_ability_system")

	horde_ability_system:on_round_started()
end

GameModeVersus.server_update = function (self, t, dt)
	GameModeVersus.super.server_update(self, t, dt)

	local reservation_handler = self._mechanism:get_slot_reservation_handler()

	if DEDICATED_SERVER then
		self:_handle_dedicated_input(t, dt)
	end

	if reservation_handler and reservation_handler.handle_dangling_peers then
		reservation_handler:handle_dangling_peers()
	end

	if self._initial_peers_ready then
		if not self._initial_peers_spawned then
			self:_update_initial_peers_spawned()
		end

		self._win_conditions:server_update(t, dt)
	end

	local state = self._game_mode_state

	if state == "initial_state" then
		if DEDICATED_SERVER then
			if reservation_handler:is_empty() then
				self:change_game_mode_state("dedicated_server_abort_game")
			else
				self._mechanism:signal_reservers_to_join(t, self._network_server)
				self:change_game_mode_state("waiting_for_players_to_join")
			end
		else
			self:change_game_mode_state("waiting_for_players_to_join")
		end
	elseif state == "waiting_for_players_to_join" then
		self._start_game_timeout_timer = self._start_game_timeout_timer + dt

		local lobby_host = self._network_server.lobby_host
		local members_map = lobby_host:members():members_map()
		local dedicated_server_peers_have_joined = DEDICATED_SERVER and reservation_handler:is_all_reserved_peers_joined(members_map) and self._initial_peers_ready
		local player_hosted_initial_peers_ready = not DEDICATED_SERVER and self._initial_peers_ready

		if dedicated_server_peers_have_joined or player_hosted_initial_peers_ready then
			if self._current_mechanism_state == "round_1" and self._mechanism:get_current_set() == 1 then
				if self._settings.display_character_picking_view then
					self:change_game_mode_state("character_selection_state")
				end
			else
				local ready_to_change_state = self._profile_synchronizer:all_synced()

				if ready_to_change_state then
					self:change_game_mode_state("pre_start_round_state")
				end
			end
		elseif self:_start_game_timeout() then
			self._start_game_timeout_timer = 0

			for peer_id, _ in pairs(members_map) do
				local member_is_done_loading = self._network_server:is_peer_ready(peer_id)

				if not member_is_done_loading then
					printf("[game_mode_versus] kicking timed out peer %s in state %s", peer_id, self._game_mode_state)
					self._network_server:kick_peer(peer_id)
				end
			end
		end
	elseif state == "dedicated_server_abort_game" then
		self._network_server:all_client_peers_disconnected()

		if self._network_server:all_client_peers_disconnected() then
			if script_data.testify then
				self._transition_state = "restart_game_server"
			elseif self:_delay_abort_game(t) then
				-- Nothing
			else
				self._transition_state = "quit_game"
			end
		end
	elseif state == "character_selection_state" then
		-- Nothing
	elseif state == "player_team_parading_state" then
		if t > self._parading_timer then
			self:change_game_mode_state("pre_start_round_state")
		end
	elseif state == "pre_start_round_state" then
		self._adventure_spawning:server_update(t, dt)
		self._versus_spawning:update(t, dt)

		local time_left = math.ceil(self.pre_round_start_timer - t)

		if self._initial_peers_spawned then
			if not self._time_left then
				self._time_left = time_left
			end

			if self._is_server and not self._pre_round_start_vo then
				local dialogue_system = Managers.state.entity:system("dialogue_system")

				if dialogue_system:has_local_player_moved_from_start_position() then
					self._pre_round_start_vo = true

					dialogue_system:queue_mission_giver_event("vs_mg_round_start")
				end
			end

			if time_left < self._time_left then
				self._time_left = time_left

				if self._is_server and not DEDICATED_SERVER then
					Managers.state.event:trigger("ui_update_start_round_counter", time_left)
					Managers.state.event:trigger("ui_tab_update_start_round_counter", time_left)
				end

				Managers.state.network.network_transmit:send_rpc_clients("rpc_update_start_round_countdown_timer", time_left)
			end
		end

		if t > self.pre_round_start_timer and self._initial_peers_spawned then
			local level = LevelHelper:current_level(self._world)
			local event_name = "round_started_set_" .. self._mechanism:get_current_set()

			Level.trigger_event(level, event_name)
			Managers.state.network.network_transmit:send_rpc_clients("rpc_trigger_level_event", event_name)
			Level.trigger_event(level, "remove_safe_zone_wall")
			Managers.state.network.network_transmit:send_rpc_clients("rpc_trigger_level_event", "remove_safe_zone_wall")
			self:change_game_mode_state("match_running_state")

			if self._is_server and not DEDICATED_SERVER then
				Managers.state.event:trigger("ui_round_started")
			end

			Managers.state.network.network_transmit:send_rpc_clients("rpc_ui_round_started")

			self._time_left = nil
		end
	elseif state == "match_running_state" then
		self._adventure_spawning:server_update(t, dt)
		self._versus_spawning:update(t, dt)

		if self._horde_surge_handler then
			self._horde_surge_handler:server_update(t, dt)
		end
	elseif state == "post_round_state" then
		-- Nothing
	else
		fassert(false, "Unknown state", state)
	end

	if DEDICATED_SERVER and self._settings.allow_hotjoining_ongoing_game and self._settings.allowed_hotjoin_states[state] then
		self._mechanism:signal_reservers_to_join(t, self._network_server)
	end

	local state = self._transition_state

	if state == "wait_until_empty" then
		self._transition_state_time = self._transition_state_time + dt

		if not (self._transition_state_time > GameModeVersus.WAIT_FOR_CLIENTS_TO_LEAVE_TIMEOUT) and not self._network_server:all_client_peers_disconnected() or self:_delay_abort_game(t) then
			-- Nothing
		else
			self._transition_state = "quit_game"
		end
	end
end

local MAX_DELAY_ABORT_TIME = 30

GameModeVersus._delay_abort_game = function (self, t)
	local batch_in_flight = Managers.telemetry:batch_in_flight()
	local has_events_to_post = Managers.telemetry:has_events_to_post()
	local should_delay = batch_in_flight or has_events_to_post

	if should_delay then
		self._delay_abort_game_timer = self._delay_abort_game_timer or t + MAX_DELAY_ABORT_TIME
	end

	if has_events_to_post and not batch_in_flight then
		Managers.telemetry:post_batch()
	end

	return self._delay_abort_game_timer and t < self._delay_abort_game_timer
end

GameModeVersus._client_update = function (self, t, dt)
	self._win_conditions:client_update(t, dt)

	local state = self._game_mode_state

	if state == "match_running_state" then
		-- Nothing
	end

	if self._horde_surge_handler then
		self._horde_surge_handler:client_update(t, dt)
	end

	if self.pactsworn_video_transition_view then
		self.pactsworn_video_transition_view:update(dt)
	end
end

GameModeVersus._start_game_timeout = function (self)
	local timeout = 10

	if self._game_mode_state == "waiting_for_players_to_join" then
		timeout = 120
	end

	return timeout < self._start_game_timeout_timer
end

GameModeVersus._update_initial_peers_spawned = function (self)
	local all_spawned = true
	local player_manager = Managers.player
	local party = Managers.party:get_party_from_name("heroes")
	local occupied_slots = party.occupied_slots

	for j = 1, #occupied_slots do
		local status = occupied_slots[j]
		local peer_id = status.peer_id
		local local_player_id = status.local_player_id
		local player = player_manager:player(peer_id, local_player_id)
		local has_player_unit = Unit.alive(player.player_unit)

		if not has_player_unit then
			all_spawned = false
		end
	end

	if all_spawned then
		Managers.state.game_mode:trigger_event("initial_peers_spawned")
	end
end

GameModeVersus._handle_dedicated_input = function (self, t, dt)
	CommandWindow.update()

	local input = CommandWindow.read_line()

	if input then
		Managers.admin:execute_command(input)
	end
end

GameModeVersus.all_peers_ready = function (self)
	GameModeVersus.super.all_peers_ready(self)
end

GameModeVersus.complete_level = function (self, level_key)
	self._level_completed = true
end

GameModeVersus.FAIL_LEVEL = function (self)
	self._level_failed = true
end

GameModeVersus.evaluate_end_condition_outcome = function (self, reason, player)
	if DEDICATED_SERVER or reason == nil then
		return false, false
	end

	local game_won, game_lost = false, false
	local peer_id = player:network_id()
	local local_player_id = player:local_player_id()
	local party = Managers.party:get_party_from_player_id(peer_id, local_player_id)

	if reason == "party_one_won" or reason == "party_one_won_early" then
		if party.party_id == 1 then
			game_won = true
		elseif party.party_id == 2 then
			game_lost = true
		end
	elseif reason == "party_two_won" or reason == "party_two_won_early" then
		if party.party_id == 1 then
			game_lost = true
		elseif party.party_id == 2 then
			game_won = true
		end
	end

	return game_won, game_lost, reason
end

GameModeVersus.gm_event_end_conditions_met = function (self, reason, checkpoint_available, percentages_completed)
	local objective_system = Managers.state.entity:system("objective_system")

	self._objectives_completed = objective_system:num_completed_main_objectives()
	self._total_main_objectives = objective_system:num_main_objectives()
	self._end_reason = reason
end

GameModeVersus.gm_event_initial_peers_spawned = function (self)
	local pre_start_round_duration
	local is_initial_set = Managers.mechanism:game_mechanism():get_current_set() == 1

	if is_initial_set then
		pre_start_round_duration = Managers.state.game_mode:setting("initial_set_pre_start_duration")
	else
		pre_start_round_duration = Managers.state.game_mode:setting("pre_start_round_duration")
	end

	self._pre_start_round_countdown = pre_start_round_duration
	self.pre_round_start_timer = Managers.time:time("game") + pre_start_round_duration
	self._initial_peers_spawned = true
end

GameModeVersus.initial_peers_spawned = function (self)
	return self._initial_peers_spawned
end

GameModeVersus.get_extra_observer_units = function (self, optional_slot_id)
	local extra_units

	if not Managers.state.game_mode:is_round_started() then
		local mechanism = Managers.mechanism:game_mechanism()
		local spawn_group = mechanism:get_current_spawn_group()
		local _, _, unit = self._versus_spawning:get_spawn_point(spawn_group, optional_slot_id)

		if unit then
			extra_units = {
				unit,
			}
		end
	end

	return extra_units
end

GameModeVersus._player_entered_party = function (self, party, side, player)
	local side_name = side:name()

	if player and player.local_player and side_name == "heroes" then
		local peer_id = player.peer_id
		local local_player_id = player:local_player_id()
		local player_status = Managers.party:get_player_status(peer_id, local_player_id)

		if not player_status.preferred_profile_index then
			local profile_index, career_index = self._profile_synchronizer:profile_by_peer(peer_id, local_player_id)

			player_status.preferred_profile_index = profile_index
			player_status.preferred_career_index = career_index
		end
	end
end

GameModeVersus.player_entered_game_session = function (self, peer_id, local_player_id, requested_party_index)
	GameModeVersus.super.player_entered_game_session(self, peer_id, local_player_id, requested_party_index)

	local party_manager = Managers.party
	local assigned_party_id = self._mechanism:handle_party_assignment_for_joining_peer(peer_id, local_player_id)

	printf("[GameModeVersus] player_entered_game_session: %s:%s, party_id: %s", peer_id, local_player_id, assigned_party_id)

	local profile_index, career_index = self._mechanism:update_wanted_hero_character(peer_id, local_player_id, assigned_party_id)
	local bot_players = self._bot_players[assigned_party_id]

	if bot_players and #bot_players > 0 then
		if self._settings.duplicate_hero_profiles_allowed then
			self:_remove_last_added_bot(assigned_party_id)
		else
			local remove_instant = true

			self:_remove_bot_by_profile(assigned_party_id, profile_index, remove_instant)
		end
	end

	local _, current_party_id = Managers.party:get_party_from_player_id(peer_id, local_player_id)

	if assigned_party_id ~= current_party_id then
		party_manager:request_join_party(peer_id, local_player_id, assigned_party_id)
	elseif self._mechanism:profiles_reservable() then
		self:_update_profile_in_party(peer_id, local_player_id, assigned_party_id)
	end
end

GameModeVersus.player_left_game_session = function (self, peer_id, local_player_id)
	if table.size(self._network_server.peer_state_machines) - 1 <= 0 then
		self:change_game_mode_state("dedicated_server_abort_game")
	end
end

GameModeVersus._assign_peer_to_wanted_hero_profile = function (self, peer_id, local_player_id, party_id)
	local party_manager = Managers.party
	local status = party_manager:get_player_status(peer_id, local_player_id)

	assert(not status.is_bot, "this should not be called on a bot, due to profile reservations ")

	local previous_profile_index, previous_career_index = Managers.mechanism:get_persistent_profile_index_reservation(peer_id)
	local profile_index, career_index, reason = self._mechanism:update_wanted_hero_character(peer_id, local_player_id, party_id)

	printf("[GameModeVersus] assigned profile for %s: profile_index: %s, career_index: %s, reason: %s (previous: %s, %s)", peer_id, profile_index, career_index, reason, previous_profile_index, previous_career_index)
	self:set_profile(status, profile_index, career_index, nil)

	return profile_index, career_index
end

GameModeVersus.set_profile = function (self, status, profile_index, career_index, optional_force_respawn)
	local force_respawn

	if optional_force_respawn ~= nil then
		force_respawn = optional_force_respawn
	else
		force_respawn = self:is_in_round_state()
	end

	local profile = SPProfiles[profile_index]

	if self._is_server then
		self._profile_requester:request_profile(status.peer_id, status.local_player_id, profile.display_name, profile.careers[career_index].display_name, force_respawn)
	else
		Managers.state.network:request_profile(status.local_player_id, profile.display_name, profile.careers[career_index].display_name, force_respawn)
	end
end

GameModeVersus._update_profile_in_party = function (self, peer_id, local_player_id, party_id)
	local status = Managers.party:get_player_status(peer_id, local_player_id)

	if status.is_bot then
		return
	end

	self._profile_synchronizer:unassign_profiles_of_peer(peer_id, local_player_id)

	local party = Managers.party:get_party(party_id)

	if party.name == "heroes" then
		local profile_index, career_index = self:_assign_peer_to_wanted_hero_profile(peer_id, local_player_id, party_id)
	elseif party.name == "dark_pact" then
		self:assign_temporary_dark_pact_profile(status)
	end
end

GameModeVersus.player_joined_party = function (self, peer_id, local_player_id, new_party_id, slot_id, old_party_id)
	GameModeVersus.super.player_joined_party(self, peer_id, local_player_id, new_party_id, slot_id, old_party_id)

	local party = Managers.party:get_party(new_party_id)
	local status = party.slots[slot_id]

	if status.is_bot then
		return
	end

	printf("[GAMEMODEVERSUS] player_joined_party: %s, %s, %s, is_bot: %s, game_mode_state: %s, has_party_selection_logic: %s", peer_id, local_player_id, new_party_id, status.is_bot, self._game_mode_state, self._versus_party_selection_logic)

	if new_party_id == 0 then
		return
	end

	if self._versus_party_selection_logic then
		self._versus_party_selection_logic:player_joined_party(peer_id, local_player_id, new_party_id, slot_id)
	elseif self._is_server and self._mechanism:profiles_reservable() then
		self:_update_profile_in_party(peer_id, local_player_id, new_party_id)
	end

	local side = Managers.state.side.side_by_party[party]
	local side_name = side:name()

	if self._is_server and side_name == "dark_pact" and self:is_in_round_state() then
		local spawn_time = self._versus_spawning:get_spawn_time(party)

		self._versus_spawning:setup_data(peer_id, local_player_id)
		self._versus_spawning:set_spawn_state(peer_id, local_player_id, "w8_for_profile", 0, spawn_time, true)

		local horde_ability_system = Managers.state.entity:system("versus_horde_ability_system")

		horde_ability_system:server_register_peer(peer_id)
	end

	local player = status.player

	if player and player.local_player then
		if side_name == "spectators" then
			local camera_system = Managers.state.entity:system("camera_system")
			local profile = PROFILES_BY_NAME.spectator

			camera_system:initialize_camera_states(player, profile.index, 1)
			CharacterStateHelper.change_camera_state(player, "observer")
		elseif side_name == "dark_pact" and self:is_in_round_state() then
			CharacterStateHelper.change_camera_state(player, "observer", {
				input_service_name = "dark_pact_selection",
			})
		end

		local reserved_profile = Managers.mechanism:get_persistent_profile_index_reservation(peer_id)

		if reserved_profile ~= 0 then
			self:update_local_hero_cosmetics()
		end
	end
end

GameModeVersus.profile_changed = function (self, peer_id, local_player_id, profile_index, career_index, is_bot)
	if not is_bot and peer_id == Network.peer_id() then
		self:update_local_hero_cosmetics()
	end
end

GameModeVersus.server_validate_horde_timer = function (self, t)
	local cm = Managers.state.conflict

	if not cm then
		return
	end

	local cm_next_horde_time, horde_delayed = cm:get_horde_timer()

	self._horde_delayed = horde_delayed

	if self._horde_timer ~= cm_next_horde_time or horde_delayed then
		self._horde_timer = cm_next_horde_time

		if not self._horde_timer then
			return
		end

		self._time_until_next_horde = self._horde_timer - t

		if self._time_until_next_horde > 0 then
			Managers.state.network.network_transmit:send_rpc_clients("rpc_sync_next_horde_time", self._time_until_next_horde, horde_delayed)
		end
	end
end

GameModeVersus.rpc_sync_next_horde_time = function (self, channel_id, time_until_next_horde, horde_delayed)
	local t = Managers.time:time("game")

	self._time_until_next_horde = time_until_next_horde + t
	self._horde_delayed = horde_delayed
end

GameModeVersus.display_debug_horde_timer_pactsworn = function (self, t, dt)
	if not self._settings.show_horde_timer_pactsworn then
		return
	end

	local player = Managers.player:local_player()
	local side = Managers.state.side:get_side_from_player_unique_id(player:unique_id())

	if side._name == "dark_pact" then
		local horde_timer = self._time_until_next_horde
		local screen_width = RESOLUTION_LOOKUP.res_w
		local pos_x = screen_width * 0.6
		local color = Color(100, 255, 0)
		local text_pos = Vector3(pos_x, 0, 10)
		local font_size = 40

		if horde_timer and horde_timer >= 0 and horde_timer <= 1000 then
			if self._horde_delayed then
				horde_timer = string.format("Next horde(DELAYED): %2d", horde_timer - t)
			else
				horde_timer = string.format("Next horde: %2d", horde_timer - t)
			end

			Debug.draw_text(horde_timer, text_pos, font_size, color)
		else
			horde_timer = "Next horde: NIL"

			Debug.draw_text(horde_timer, text_pos, font_size, color)
		end
	end
end

GameModeVersus.players_left_safe_zone = function (self)
	if self._horde_surge_handler then
		self._horde_surge_handler:activate()
	end
end

GameModeVersus.player_left_party = function (self, peer_id, local_player_id, party_id, slot_id, old_slot_data)
	if self._versus_party_selection_logic then
		self._versus_party_selection_logic:player_left_party(peer_id, local_player_id, party_id, slot_id, old_slot_data)
	end
end

GameModeVersus.local_player_ready_to_start = function (self, player)
	local state = self._game_mode_state

	if not self._is_server and not self:is_in_round_state() and state ~= "character_selection_state" then
		return false
	end

	if self._is_server and not self._initial_peers_ready then
		return false
	end

	return true
end

GameModeVersus.local_player_game_starts = function (self, player, loading_context)
	local peer_id = player:network_id()
	local local_player_id = player:local_player_id()
	local party = Managers.party:get_party_from_player_id(peer_id, local_player_id)
	local side = Managers.state.side.side_by_party[party]

	self:_player_entered_party(party, side, player)
end

GameModeVersus.level_key = function (self)
	return self._level_key
end

GameModeVersus._start_objective = function (self)
	if not self._is_server then
		return
	end

	local objectives = self:_get_objectives_current_set()

	if objectives then
		local objective_system = Managers.state.entity:system("objective_system")

		objective_system:server_activate_first_objective()
	end
end

GameModeVersus._get_objective_list_name_current_set = function (self)
	local settings = self._mechanism:get_objective_settings()
	local objective_lists = settings.objective_lists

	if objective_lists then
		local current_set = Managers.mechanism:game_mechanism():get_current_set()

		return objective_lists[current_set]
	end
end

GameModeVersus._get_objectives_current_set = function (self)
	return ObjectiveLists[self:_get_objective_list_name_current_set()]
end

GameModeVersus.get_current_objective_data = function (self)
	local objective_system = Managers.state.entity:system("objective_system")
	local objectives = self:_get_objectives_current_set()
	local current_objective_id = objective_system:current_objective_index()

	return objectives[current_objective_id]
end

GameModeVersus.get_next_objective_data = function (self)
	local objective_system = Managers.state.entity:system("objective_system")
	local objectives = self:_get_objectives_current_set()
	local next_objective_id = objective_system:current_objective_index() + 1

	return objectives[next_objective_id]
end

GameModeVersus.disable_player_spawning = function (self)
	self._adventure_spawning:set_spawning_disabled(true)
end

GameModeVersus.enable_player_spawning = function (self, safe_position, safe_rotation)
	self._adventure_spawning:set_spawning_disabled(false)
	self._adventure_spawning:force_update_spawn_positions(safe_position, safe_rotation)
end

GameModeVersus.teleport_despawned_players = function (self, position)
	self._adventure_spawning:teleport_despawned_players(position)
end

GameModeVersus.flow_callback_add_spawn_point = function (self, unit)
	self._adventure_spawning:add_spawn_point(unit)
end

GameModeVersus.flow_callback_add_game_mode_specific_spawn_point = function (self, unit, sides)
	for _, side_name in ipairs(sides) do
		if side_name == "heroes" then
			self._adventure_spawning:add_spawn_point_to_spawn_group(unit)
		elseif side_name == "dark_pact" then
			self._versus_spawning:add_spawn_point(unit)
		end
	end
end

GameModeVersus.respawn_unit_spawned = function (self, unit)
	if self._hero_rescues_enabled then
		self._adventure_spawning:respawn_unit_spawned(unit)
	end
end

GameModeVersus.get_respawn_handler = function (self)
	return self._adventure_spawning:get_respawn_handler()
end

GameModeVersus.respawn_gate_unit_spawned = function (self, unit)
	self._adventure_spawning:respawn_gate_unit_spawned(unit)
end

GameModeVersus.set_respawning_enabled = function (self, enabled)
	self._adventure_spawning:set_respawning_enabled(enabled)
end

GameModeVersus.force_respawn = function (self, peer_id, local_player_id)
	local party = Managers.party:get_party_from_player_id(peer_id, local_player_id)
	local side = Managers.state.side.side_by_party[party]
	local side_name = side:name()

	if self:is_in_round_state() then
		if side_name == "heroes" then
			self._adventure_spawning:force_respawn(peer_id, local_player_id)
		elseif side_name == "dark_pact" then
			self._versus_spawning:force_respawn(peer_id, local_player_id)
		end
	end
end

GameModeVersus._handle_bots = function (self, t, dt)
	if not self._hero_bots_enabled then
		return
	end

	local in_session = Managers.state.network ~= nil and not Managers.state.network.game_session_shutdown

	if not in_session then
		return
	end

	for party_id, bot_players in pairs(self._bot_players) do
		local party = Managers.party:get_party(party_id)

		if self._settings.party_settings[party.name].using_bots then
			self:_remove_partyless_bots(bot_players)

			local num_slots = party.num_slots
			local num_bot_players = #bot_players
			local delta = num_slots - num_bot_players

			if delta > 0 then
				local open_slots = num_slots - party.num_used_slots
				local num_bots_to_add = math.min(delta, open_slots)

				if num_bots_to_add > 0 then
					self:_add_bot(party_id)

					return
				end
			elseif delta < 0 then
				for i = 1, math.abs(delta) do
					self:_remove_last_added_bot(party_id)
				end
			end
		end
	end
end

GameModeVersus.event_set_loadout_items = function (self)
	self:update_local_hero_cosmetics()
end

GameModeVersus.update_local_hero_cosmetics = function (self)
	if DEDICATED_SERVER then
		return
	end

	local local_player = Managers.player:local_player()
	local peer_id = local_player:network_id()
	local local_player_id = local_player:local_player_id()
	local profile_index, career_index = Managers.mechanism:get_persistent_profile_index_reservation(peer_id)
	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career_settings = careers[career_index]
	local career_name = career_settings.name
	local preview_wield_slot_type = career_settings.preview_wield_slot
	local preview_wield_slot = InventorySettings.slot_names_by_type[preview_wield_slot_type]
	local weapon_slot = preview_wield_slot[1]
	local weapon = BackendUtils.get_loadout_item(career_name, weapon_slot)
	local weapon_pose = BackendUtils.get_loadout_item(career_name, "slot_pose")
	local weapon_pose_skin = weapon_pose and CosmeticUtils.get_weapon_pose_skin(weapon_pose.key)
	local hero_skin = BackendUtils.get_loadout_item(career_name, "slot_skin")
	local hat = BackendUtils.get_loadout_item(career_name, "slot_hat")

	weapon = weapon and weapon.data.name or CosmeticUtils.get_default_cosmetic_slot(career_settings, weapon_slot).item_name
	weapon_pose = weapon_pose and weapon_pose.data.name or CosmeticUtils.get_default_cosmetic_slot(career_settings, "slot_pose").item_name
	weapon_pose_skin = weapon_pose_skin and weapon_pose_skin.skin or "n/a"
	hero_skin = hero_skin and hero_skin.data.name or CosmeticUtils.get_default_cosmetic_slot(career_settings, "slot_skin").item_name
	hat = hat and hat.data.name or CosmeticUtils.get_default_cosmetic_slot(career_settings, "slot_hat").item_name

	local pactsworn_cosmetics = self:_pack_pactsworn_cosmetics()
	local existing_weapon, existing_pose, exisiting_weapon_pose_skin, existing_hero_skin, existing_hat, exisiting_pactsworn_cosmetics = self._mechanism:get_hero_cosmetics(peer_id, local_player_id)

	if weapon ~= existing_weapon or weapon_pose ~= existing_pose or exisiting_weapon_pose_skin ~= weapon_pose_skin or hero_skin ~= existing_hero_skin or hat ~= existing_hat or table.recursive_compare(exisiting_pactsworn_cosmetics, pactsworn_cosmetics) then
		self._mechanism:set_hero_cosmetics(peer_id, local_player_id, weapon_slot, weapon, weapon_pose, weapon_pose_skin, hero_skin, hat, pactsworn_cosmetics)
	end
end

GameModeVersus._pack_pactsworn_cosmetics = function (self)
	local pactsworn_cosmetics = {}

	for i = 1, #SPProfiles do
		local profile = SPProfiles[i]

		if profile.affiliation == "dark_pact" then
			local careers = profile.careers
			local career_index = 1
			local career_settings = careers[career_index]
			local career_name = career_settings.name

			if career_name ~= "vs_undecided" then
				local preview_wield_slot_type = career_settings.preview_wield_slot
				local preview_wield_slot = InventorySettings.slot_names_by_type[preview_wield_slot_type]
				local weapon_slot = preview_wield_slot[1]
				local weapon = BackendUtils.get_loadout_item(career_name, weapon_slot)
				local pactsworn_skin = BackendUtils.get_loadout_item(career_name, "slot_skin")

				pactsworn_skin = pactsworn_skin and pactsworn_skin.data.name or CosmeticUtils.get_default_cosmetic_slot(career_settings, "slot_skin").item_name
				weapon = weapon and weapon.data.name or career_settings.base_weapon
				pactsworn_cosmetics[career_name] = {
					weapon_slot = weapon_slot,
					skin = pactsworn_skin,
					weapon = weapon,
				}
			end
		end
	end

	return pactsworn_cosmetics
end

GameModeVersus._get_first_available_bot_profile = function (self, party_id)
	local available_profiles = self._available_profiles_by_party[party_id]
	local profile_synchronizer = self._profile_synchronizer
	local free_profiles = {}

	for i = 1, #available_profiles do
		local name = available_profiles[i]
		local profile_index = FindProfileIndex(name)

		if not profile_synchronizer:is_profile_in_use(profile_index) then
			free_profiles[#free_profiles + 1] = profile_index
		end
	end

	table.shuffle(free_profiles)

	for i = 1, #free_profiles do
		local profile_index = free_profiles[i]
		local profile = SPProfiles[profile_index]
		local display_name = profile.display_name
		local career_indices = {}

		for i = 1, #profile.careers do
			career_indices[i] = i
		end

		table.shuffle(career_indices)

		for j = 1, #career_indices do
			local career_index = career_indices[j]
			local career = profile.careers[career_index]

			if career and career:is_unlocked_function(display_name, math.huge) then
				return profile_index, career_index
			end
		end
	end

	fassert(false, "Failed to find available bot profile profile for party " .. tostring(party_id))
end

GameModeVersus._add_bot = function (self, party_id)
	local party = Managers.party:get_party(party_id)
	local slot_id = Managers.party:find_first_empty_slot_id(party)
	local profile_index, career_index = self._profile_synchronizer:get_bot_profile(party_id, slot_id)

	profile_index = self._mechanism:parse_hero_profile_availability(profile_index, party_id, nil, nil)

	local bot_players = self._bot_players[party_id]

	if profile_index then
		for i = 1, #bot_players do
			local bot_player = bot_players[i]

			if profile_index == bot_player:profile_index() then
				profile_index = nil

				break
			end
		end
	end

	if not profile_index then
		profile_index, career_index = self:_get_first_available_bot_profile(party_id)
	end

	local player = self:_add_bot_to_party(party_id, profile_index, career_index, slot_id)

	bot_players[#bot_players + 1] = player
end

GameModeVersus._remove_bot = function (self, bot_player, remove_instant)
	printf("_remove_bot: %s", tostring(remove_instant))

	for party_id, bot_players in pairs(self._bot_players) do
		local index = table.index_of(bot_players, bot_player)

		if index >= 1 then
			if remove_instant then
				self:_remove_bot_instant(bot_player)
			else
				self:_remove_bot_update_safe(bot_player)
			end

			local last = #bot_players

			bot_players[index] = bot_players[last]
			bot_players[last] = nil

			break
		end
	end
end

GameModeVersus._clear_bots = function (self, remove_instant)
	for key, bot_players in pairs(self._bot_players) do
		for i = #bot_players, 1, -1 do
			self:_remove_bot(bot_players[i], remove_instant)
		end
	end
end

GameModeVersus._remove_partyless_bots = function (self, bot_players)
	local party_manager = Managers.party
	local num_bots = #bot_players

	for i = num_bots, 1, -1 do
		local bot_player = bot_players[i]
		local peer_id = bot_player:network_id()
		local local_player_id = bot_player:local_player_id()
		local party = party_manager:get_party_from_player_id(peer_id, local_player_id)

		if not party then
			self:_remove_bot(bot_players[i])
		end
	end
end

GameModeVersus._remove_last_added_bot = function (self, party_id, remove_instant)
	printf("_remove_last_added_bot")

	local bot_players = self._bot_players[party_id]
	local last = #bot_players

	self:_remove_bot(bot_players[last], remove_instant)
end

GameModeVersus._remove_bot_by_profile = function (self, party_id, profile_index, remove_instant)
	printf("_remove_bot_by_profile: %s, from party: %s", profile_index, party_id)

	local bot_players = self._bot_players[party_id]

	for i, bot_player in ipairs(bot_players) do
		local bot_profile_index = bot_player:profile_index()

		if bot_profile_index == profile_index then
			printf("found bot by profile to remove: %s", profile_index)

			return self:_remove_bot(bot_players[i], remove_instant)
		end
	end

	return self:_remove_last_added_bot(party_id, remove_instant)
end

GameModeVersus.get_active_respawn_units = function (self)
	return self._adventure_spawning:get_active_respawn_units()
end

GameModeVersus.adventure_spawning = function (self)
	return self._adventure_spawning
end

GameModeVersus.horde_surge_handler = function (self)
	return self._horde_surge_handler
end

GameModeVersus.in_training_mode = function (self)
	return self._training_mode
end

GameModeVersus.get_num_occupied_profile_enemy_role = function (self, profile_synchronizer, party, enemy_role)
	local num_enemy_role_occupied = 0
	local occupied_slots = party.occupied_slots

	for i = 1, #occupied_slots do
		local status = occupied_slots[i]
		local peer_id = status.peer_id
		local local_player_id = status.local_player_id
		local profile_index = profile_synchronizer:profile_by_peer(peer_id, local_player_id)

		if profile_index then
			local profile = SPProfiles[profile_index]

			if profile.enemy_role == enemy_role then
				num_enemy_role_occupied = num_enemy_role_occupied + 1
			end
		end
	end

	return num_enemy_role_occupied
end

GameModeVersus.get_end_screen_config = function (self, game_won, game_lost, player, reason)
	local screen_name, screen_config, params
	local ended_early = reason == "party_one_won_early" or reason == "party_two_won_early" or Development.parameter("versus_quick_match_end")

	if not ended_early and self._mechanism:should_start_next_set() then
		screen_name = "carousel_round_end"
		screen_config = {
			objectives_completed = self._objectives_completed,
			total_main_objectives = self._total_main_objectives,
			display_screen_delay = self._settings.end_of_match_view_display_screen_delay,
		}
	else
		screen_name = game_won and "victory" or game_lost and "defeat" or "draw"
		screen_config = {
			show_act_presentation = false,
			display_screen_delay = self._settings.end_of_match_view_display_screen_delay,
		}
		params = {
			reason = reason,
		}
	end

	return screen_name or "none", screen_config or {}, params
end

GameModeVersus.get_end_of_round_screen_settings = function (self)
	return "carousel_round_end", {}, {}
end

GameModeVersus.ended = function (self, reason)
	local all_peers_ingame = self._network_server:are_all_peers_ingame()

	if not all_peers_ingame then
		self._network_server:disconnect_joining_peers()
	end
end

GameModeVersus.get_player_wounds = function (self, profile)
	local affiliation = profile.affiliation
	local player_wounds = self._settings.player_wounds[affiliation]

	if self._mechanism:custom_settings_enabled() and affiliation == "heroes" then
		player_wounds = self._mechanism:get_custom_game_setting("wounds_amount")
	end

	fassert(player_wounds, "Couldn't find player wounds for affiliation (%s)", affiliation)

	return player_wounds
end

GameModeVersus.get_initial_inventory = function (self, healthkit, potion, grenade, additional_items, profile)
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

GameModeVersus.round_id = function (self)
	return self._round_id
end

GameModeVersus.allowed_interactions = function (self, unit, interaction_type)
	local side = Managers.state.side.side_by_unit[unit]
	local side_name = side:name()
	local allowed_interactions = GameModeSettings.versus.side_settings[side_name].allowed_interactions

	if not allowed_interactions then
		return true
	end

	if side_name == "dark_pact" then
		local ghost_mode = ScriptUnit.has_extension(unit, "ghost_mode_system")

		if ghost_mode and ghost_mode:is_in_ghost_mode() then
			return allowed_interactions.ghost_mode[interaction_type] ~= nil
		end

		return allowed_interactions.normal[interaction_type] ~= nil
	else
		return allowed_interactions[interaction_type] ~= nil
	end
end

GameModeVersus._disable_side_object_sets = function (self)
	local sides = Managers.state.side:sides()

	for i = 1, #sides do
		local side = sides[i]
		local object_set_name = string.format("versus_%s", side:name())

		Managers.state.game_mode:set_object_set_enabled(object_set_name, false)
	end
end

GameModeVersus.rpc_rejoin_parties = function (self, channel_id)
	if self._is_server then
		return
	end

	print("[GameModeVersus] Told to rejoin parties")

	self._transition_state = "versus_migration"
end

GameModeVersus.event_end_screen_ui_complete = function (self)
	return
end

GameModeVersus.play_sound = function (self, event)
	local wwise_world = Managers.world:wwise_world(self._world)

	WwiseWorld.trigger_event(wwise_world, event)
end

GameModeVersus._server_on_round_over = function (self, heroes_win)
	local audio_system = Managers.state.entity:system("audio_system")
	local round_over_sfx = heroes_win and "Play_versus_hud_round_end_heroes_win" or "Play_versus_hud_round_end_heroes_fail"

	audio_system:play_2d_audio_event(round_over_sfx)
end

GameModeVersus.pick_pactsworn_spawn_category = function (self, profile_synchronizer, party)
	local dark_pact_profile_rules = self._settings.dark_pact_profile_rules
	local available_roles = {}

	for role, max in pairs(dark_pact_profile_rules) do
		local cur = self:get_num_occupied_profile_enemy_role(profile_synchronizer, party, role)

		if cur < max then
			available_roles[#available_roles + 1] = role
		end
	end

	assert(#available_roles ~= 0, "unable to pick pactsworn spawn category, no categories available")

	return available_roles[Math.random(1, #available_roles)]
end

GameModeVersus._round_start_telemetry = function (self)
	local mechanism = Managers.mechanism:game_mechanism()
	local player = Managers.player:local_player()
	local local_player_unit = player.player_unit
	local game_round = mechanism:total_rounds_started()
	local match_id = mechanism:match_id()
	local player_id = player:telemetry_id()
	local slot_melee, slot_ranged, talents

	if Unit.alive(local_player_unit) and not Managers.state.side:versus_is_dark_pact(local_player_unit) then
		local player_loadouts = Managers.player:player_loadouts()
		local loadout = player_loadouts[player:unique_id()]

		if not loadout then
			return
		end

		slot_melee = loadout.slot_melee and loadout.slot_melee.key
		slot_ranged = loadout.slot_ranged and loadout.slot_ranged.key

		if ScriptUnit.has_extension(local_player_unit, "talent_system") then
			talents = ScriptUnit.extension(local_player_unit, "talent_system"):get_talent_names()
		end
	end

	Managers.telemetry_events:versus_round_started(player_id, game_round, match_id, slot_melee, slot_ranged, talents)
end

GameModeVersus._custom_settings_telemetry = function (self)
	local custom_settings_handler = self._mechanism:get_custom_game_settings_handler()
	local settings_hash_map, is_default_settings, modified_settings = custom_settings_handler:get_telemetry_data()
	local player = Managers.player:local_player()
	local player_id = player:telemetry_id()
	local match_id = self._mechanism:match_id()

	Managers.telemetry_events:versus_custom_game_settings(player_id, match_id, settings_hash_map, is_default_settings, modified_settings)
end

GameModeVersus._round_end_telemetry = function (self)
	local mechanism = Managers.mechanism:game_mechanism()
	local heroes_party_id = Managers.state.side:get_side_from_name("heroes").party.party_id
	local game_round = mechanism:total_rounds_started()
	local match_id = mechanism:match_id()
	local score = self._win_conditions:get_current_score(heroes_party_id)

	Managers.telemetry_events:versus_round_ended(score, game_round, match_id)
end

GameModeVersus._match_end_telemetry = function (self, results)
	local is_draw, winning_party
	local match_id = self._mechanism:match_id()
	local winning_party_id = (results == "party_one_won" or results == "party_one_won_early") and 1 or (results == "party_two_won" or results == "party_two_won_early") and 2
	local winning_party = {}

	if winning_party_id then
		local slots = Managers.party:get_party(winning_party_id).occupied_slots

		for i = 1, #slots do
			local peer_id = slots[i].peer_id
			local backend_id = peer_id and self._mechanism:get_peer_backend_id(peer_id)

			winning_party[i] = backend_id
		end
	else
		is_draw = true
	end

	Managers.telemetry_events:versus_match_ended(match_id, is_draw, winning_party)
end

GameModeVersus.activated_ability_telemetry = function (self, ability_name, player)
	local mechanism = Managers.mechanism:game_mechanism()
	local game_round = mechanism:total_rounds_started()
	local match_id = mechanism:match_id()
	local player_id = player:telemetry_id()

	Managers.telemetry_events:versus_activated_ability(match_id, game_round, player_id, ability_name)
end

GameModeVersus.menu_access_allowed_in_state = function (self)
	if self:is_in_round_state() then
		return true
	end

	return false
end

GameModeVersus.request_selectable_dark_pact_careers = function (self)
	self._network_transmit:send_rpc_server("rpc_selectable_careers_request")
end

local pre_match_states = {
	character_selection_state = true,
	initial_state = true,
	waiting_for_players_to_join = true,
}

GameModeVersus.is_in_pre_match_state = function (self)
	return pre_match_states[self._game_mode_state]
end

local round_states = {
	match_running_state = true,
	pre_start_round_state = true,
}

GameModeVersus.is_in_round_state = function (self)
	return round_states[self._game_mode_state]
end

GameModeVersus.match_is_running = function (self)
	return self._game_mode_state == "match_running_state"
end

GameModeVersus.match_in_round_over_state = function (self)
	return self._game_mode_state == "post_round_state"
end

GameModeVersus.game_mode_state = function (self)
	return self._game_mode_state
end

GameModeVersus.rpc_selectable_careers_request = function (self, channel_id)
	assert(self._is_server, "[GameModeVersus] 'rpc_selectable_careers_request' may only be received by the server")

	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if not peer_id then
		return
	end

	local profiles, enemy_role = self._dark_pact_career_delegator:request_careers(peer_id)
	local enemy_role_id = NetworkLookup.versus_dark_pact_profile_rules[enemy_role]

	for i = 1, #profiles do
		local profile_id = PROFILES_BY_NAME[profiles[i]].index

		profiles[i] = profile_id
	end

	self._network_transmit:send_rpc("rpc_selectable_careers_response", peer_id, enemy_role_id, profiles)
end

GameModeVersus.rpc_selectable_careers_response = function (self, channel_id, enemy_role_id, profile_ids)
	local enemy_role = NetworkLookup.versus_dark_pact_profile_rules[enemy_role_id]

	for i = 1, #profile_ids do
		local profile = SPProfiles[profile_ids[i]]

		profile_ids[i] = profile.display_name
	end

	Managers.state.event:trigger("versus_received_selectable_careers_response", enemy_role, profile_ids)
end

GameModeVersus.increment_num_picks_for_career = function (self)
	self._dark_pact_career_delegator:increment_num_picks_for_career()
end

GameModeVersus.decrement_num_picks_for_career = function (self)
	self._dark_pact_career_delegator:decrement_num_picks_for_career()
end

GameModeVersus.set_playable_boss_can_be_picked = function (self, bool)
	if self._boss_has_been_played then
		return
	end

	if self._is_server then
		printf("[VS BOSS] trigger playable boss")

		self._boss_has_been_played = true

		self._dark_pact_career_delegator:set_playable_boss_can_be_picked(bool)
	else
		printf("[VS BOSS] trigger playable boss")
		self._network_transmit:send_rpc_server("rpc_set_playable_boss_can_be_picked", bool)
	end
end

GameModeVersus.rpc_set_playable_boss_can_be_picked = function (self, bool)
	assert(self._is_server, "[Trying to set the boss to be pickable by client, it should only happen on server]")

	self._boss_has_been_played = true

	self._dark_pact_career_delegator:set_playable_boss_can_be_picked(bool)
end

GameModeVersus._get_parading_screen_duration = function (self)
	local duration = 0
	local parading_times = Managers.state.game_mode:setting("parading_times")

	for _, time in pairs(parading_times) do
		duration = duration + time
	end

	return duration
end

GameModeVersus.projectile_hit_character = function (self, attacker_player, source_attacker_unit, attacker_unit, hit_unit, hit_position, hit_breed, attack_direction, predicted_damage)
	attacker_unit = source_attacker_unit or attacker_unit

	if DamageUtils.is_player_unit(attacker_unit) then
		local is_enemy = Managers.state.side:is_enemy(attacker_unit, hit_unit)

		if not is_enemy then
			return
		end

		attacker_player = attacker_player or Managers.player:owner(attacker_unit)
		hit_breed = hit_breed or AiUtils.unit_breed(hit_unit)

		if hit_breed.is_player then
			local husk = not attacker_player.local_player

			DamageUtils.add_hit_reaction(hit_unit, hit_breed, husk, attack_direction, false)
		end

		local attacker_is_dark_pact = Managers.state.side:versus_is_dark_pact(attacker_unit)

		if attacker_is_dark_pact then
			local audio_system = Managers.state.entity:system("audio_system")
			local is_local_player = attacker_player.local_player

			predicted_damage = predicted_damage or 0

			audio_system:vs_play_pactsworn_hit_enemy(hit_position, is_local_player, attacker_player, predicted_damage, Managers.time:time("game"))
		end
	end
end

GameModeVersus._trigger_early_win_vo = function (self, winning_party_id)
	local party = Managers.party:get_party(winning_party_id)
	local side = Managers.state.side.side_by_party[party]
	local losing_party_id = winning_party_id == 1 and 2 or 1
	local losing_party = Managers.party:get_party(losing_party_id)
	local losing_side = Managers.state.side.side_by_party[losing_party]
	local dialogue_system = Managers.state.entity:system("dialogue_system")

	dialogue_system:trigger_mission_giver_event("vs_mg_early_win", nil, side:name())
	dialogue_system:trigger_mission_giver_event("vs_mg_early_loss", nil, losing_side:name())
end

GameModeVersus._trigger_draw_vo = function (self)
	local dialogue_system = Managers.state.entity:system("dialogue_system")

	dialogue_system:queue_mission_giver_event("vs_mg_match_draw")
end

local hero_rush_min_dist = 70
local hero_rush_grace_delay = 5
local hero_rush_unit_scratch = {}
local hero_rush_distance_scratch = {}

GameModeVersus._update_hero_rushing = function (self, t)
	if not self._is_server then
		return
	end

	local last_played_hero_rushed_t = self._last_played_hero_rushed_t or 0

	if t - last_played_hero_rushed_t < 60 then
		return
	end

	table.clear(hero_rush_unit_scratch)
	table.clear(hero_rush_distance_scratch)

	local num_info = 0
	local conflict_director = Managers.state.conflict
	local hero_side = Managers.state.side:get_side_from_name("heroes")
	local hero_units = hero_side.PLAYER_UNITS

	for i = 1, #hero_units do
		local hero_unit = hero_units[i]
		local info = conflict_director:get_main_path_player_data(hero_unit)

		if info and info.travel_dist and ScriptUnit.has_extension(hero_unit, "career_system") then
			num_info = num_info + 1
			hero_rush_unit_scratch[num_info] = hero_unit
			hero_rush_distance_scratch[hero_unit] = info.travel_dist
		end
	end

	if num_info > 1 then
		table.sort(hero_rush_unit_scratch, function (unit_a, unit_b)
			return hero_rush_distance_scratch[unit_a] < hero_rush_distance_scratch[unit_b]
		end)

		local ahead_unit, behind_unit = hero_rush_unit_scratch[num_info], hero_rush_unit_scratch[num_info - 1]
		local ahead_dist = hero_rush_distance_scratch[ahead_unit]
		local behind_dist = hero_rush_distance_scratch[behind_unit]

		if ahead_dist - behind_dist > hero_rush_min_dist then
			local grace_delay = self._hero_rush_grace_delay or t + hero_rush_grace_delay

			self._hero_rush_grace_delay = grace_delay

			if grace_delay < t then
				local career_extension = ScriptUnit.extension(ahead_unit, "career_system")
				local profile_index = career_extension:profile_index()
				local profile = SPProfiles[profile_index]
				local profile_name = profile.display_name
				local dialogue_system = Managers.state.entity:system("dialogue_system")

				dialogue_system:queue_mission_giver_event("vs_mg_hero_rushing", {
					target_name = profile_name,
				})

				self._last_played_hero_rushed_t = t
				self._hero_rush_grace_delay = nil
			end
		else
			self._hero_rush_grace_delay = nil
		end
	end
end

GameModeVersus._register_disabled_as_eliminiations = function (self)
	local players = Managers.player:players()
	local statistics_db = Managers.player:statistics_db()

	for _, player in pairs(players) do
		local credit_elim_to, breed_name
		local status_extension = ScriptUnit.has_extension(player.player_unit, "status_system")

		if status_extension then
			if status_extension:is_grabbed_by_pack_master() or status_extension:is_hanging_from_hook() then
				credit_elim_to = status_extension:query_pack_master_player()
				breed_name = "vs_packmaster"
			elseif status_extension:is_pounced_down() then
				credit_elim_to = Managers.player:owner(status_extension:get_pouncer_unit())
				breed_name = "vs_gutter_runner"
			elseif status_extension:is_disabled_by_pact_sworn() then
				-- Nothing
			end
		end

		if credit_elim_to then
			local stats_id = credit_elim_to:stats_id()

			if status_extension:is_knocked_down() then
				statistics_db:increment_stat(stats_id, "kills_per_breed", breed_name)
			else
				local killed_breed_name = Unit.get_data(player.player_unit, "breed").name

				statistics_db:increment_stat(stats_id, "vs_knockdowns_per_breed", killed_breed_name)
				statistics_db:increment_stat(stats_id, "eliminations_as_breed", breed_name)
			end
		end
	end
end
