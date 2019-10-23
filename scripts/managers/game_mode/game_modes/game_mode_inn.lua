require("scripts/managers/game_mode/game_modes/game_mode_base")
require("scripts/managers/game_mode/spawning_components/adventure_spawning")
require("scripts/managers/game_mode/adventure_profile_rules")

local COMPLETE_LEVEL_VAR = false
local FAIL_LEVEL_VAR = false
GameModeInn = class(GameModeInn, GameModeBase)

GameModeInn.init = function (self, settings, world, ...)
	GameModeInn.super.init(self, settings, world, ...)

	self._adventure_profile_rules = AdventureProfileRules:new(self._profile_synchronizer, self._network_server)
	local hero_side = Managers.state.side:get_side_from_name("heroes")
	self._adventure_spawning = AdventureSpawning:new(self._profile_synchronizer, hero_side, self._is_server, self._network_server)

	self:_register_player_spawner(self._adventure_spawning)

	self._objective_units = nil
	self._state = "_state_none"
	self._matchmaking_manager = Managers.matchmaking
	self._objective_markers = {}
	self._current_objective_id = nil
	self._current_waystone_type = 1
	self._show_tutorial = true
	self._waystone_is_active = false
	self._waystone_type = 0
	self._player_manager = Managers.player
	self._statistics_db = self._player_manager:statistics_db()
	local event_manager = Managers.state.event

	event_manager:register(self, "level_start_local_player_spawned", "event_local_player_spawned")

	self._local_player_spawned = false
end

GameModeInn.register_rpcs = function (self, network_event_delegate, network_transmit)
	GameModeInn.super.register_rpcs(self, network_event_delegate, network_transmit)
	self._adventure_spawning:register_rpcs(network_event_delegate, network_transmit)

	self._network_event_delegate = network_event_delegate

	self._network_event_delegate:register(self, "rpc_waystone_active")
end

GameModeInn.unregister_rpcs = function (self)
	self._adventure_spawning:unregister_rpcs()
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil

	GameModeInn.super.unregister_rpcs(self)
end

GameModeInn.update = function (self, t, dt)
	self:_update_objectives()
end

GameModeInn.server_update = function (self, t, dt)
	self._adventure_spawning:update(t, dt)
end

GameModeInn.evaluate_end_conditions = function (self, round_started)
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

	if self:update_end_level_areas() then
		return true, "start_game"
	elseif self._level_completed then
		return true, "start_game"
	else
		return false
	end
end

GameModeInn.event_local_player_spawned = function (self, is_initial_spawn)
	self._local_player_spawned = true
	self._is_initial_spawn = is_initial_spawn
end

GameModeInn.COMPLETE_LEVEL = function (self)
	COMPLETE_LEVEL_VAR = true
end

GameModeInn.FAIL_LEVEL = function (self)
	FAIL_LEVEL_VAR = true
end

GameModeInn.player_entered_game_session = function (self, peer_id, local_player_id)
	GameModeInn.super.player_entered_game_session(self, peer_id, local_player_id)

	local status = Managers.party:get_player_status(peer_id, local_player_id)

	if status.party_id ~= 1 then
		local party_id = 1

		Managers.party:assign_peer_to_party(peer_id, local_player_id, party_id)
	end

	self._adventure_profile_rules:handle_profile_delegation_for_joining_player(peer_id, local_player_id)
end

GameModeInn.flow_callback_add_spawn_point = function (self, unit)
	self._adventure_spawning:add_spawn_point(unit)
end

GameModeInn.respawn_unit_spawned = function (self, unit)
	self._adventure_spawning:respawn_unit_spawned(unit)
end

GameModeInn.force_respawn = function (self, peer_id, local_player_id)
	local status = Managers.party:get_player_status(peer_id, local_player_id)

	if status.party_id == 0 then
		local party_id = 1

		Managers.party:assign_peer_to_party(peer_id, local_player_id, party_id)
	end

	self._adventure_spawning:force_respawn(peer_id, local_player_id)
end

GameModeInn._update_objectives = function (self)
	if not self._objective_units then
		self._objective_units = Managers.state.entity:get_entities("ObjectiveUnitExtension")

		for unit, extension in pairs(self._objective_units) do
			local id = Unit.get_data(unit, "objective_id")

			if id then
				self._objective_markers[id] = unit
			end

			self:_deactivate_objective_marker(unit)
		end
	else
		self:_update_objective_marker()
	end
end

GameModeInn._update_objective_marker = function (self)
	local is_game_matchmaking = self._matchmaking_manager:is_game_matchmaking()

	if self._show_tutorial and not is_game_matchmaking then
		local show_tutorial, tutorial_step = self:_should_show_tutorial()

		if show_tutorial then
			self:_state_tutorial(tutorial_step)
		end

		self._show_tutorial = show_tutorial
	end

	if is_game_matchmaking then
		self:_state_game_is_matchmaking()
	elseif not is_game_matchmaking and not self._show_tutorial then
		self:_state_choose_map()
	end
end

local WAYSTONE_TYPE = {
	"waystone",
	"waystone",
	"waystone_weave"
}

GameModeInn._state_game_is_matchmaking = function (self)
	if self._is_server then
		local waystone_is_active, waystone_type = self._matchmaking_manager:waystone_is_active()

		if self._waystone_is_active ~= waystone_is_active then
			Managers.state.network.network_transmit:send_rpc_clients("rpc_waystone_active", waystone_type, waystone_is_active, self._current_waystone_type)

			self._waystone_is_active = waystone_is_active
			self._waystone_type = waystone_type
		end
	end

	local current_objective_id = self._current_objective_id

	if self._waystone_is_active then
		self._current_waystone_type = self._waystone_type
		local unit_id = WAYSTONE_TYPE[self._waystone_type]

		if unit_id ~= current_objective_id then
			self:_deactivate_objective_marker(current_objective_id)
			self:_activate_objective_marker(unit_id)
		end
	elseif current_objective_id then
		self:_deactivate_objective_marker(current_objective_id)
	end
end

local MAP_TYPE = {
	"map",
	"map",
	"wom_tutorial_weave_select"
}

GameModeInn._state_choose_map = function (self)
	local current_objective_id = self._current_objective_id
	local unit_id = MAP_TYPE[self._current_waystone_type]

	if self._is_server and self._waystone_is_active then
		Managers.state.network.network_transmit:send_rpc_clients("rpc_waystone_active", self._waystone_type, false, self._current_waystone_type)

		self._waystone_is_active = false
	end

	if unit_id ~= current_objective_id then
		self:_deactivate_objective_marker(current_objective_id)
		self:_activate_objective_marker(unit_id)
	end
end

GameModeInn._should_show_tutorial = function (self)
	local player = self._player_manager:local_player(1)

	if player then
		local stats_id = player:stats_id()
		local tutorial_step = self._statistics_db:get_persistent_stat(stats_id, "scorpion_onboarding_step")

		return tutorial_step > 0 and tutorial_step < 10, tutorial_step
	end

	return false
end

GameModeInn._state_tutorial = function (self, tutorial_step)
	local current_objective_id = self._current_objective_id
	local unit_id = nil

	if tutorial_step == 1 then
		unit_id = "wom_tutorial_mission_select"
	elseif tutorial_step == 3 then
		unit_id = "wom_tutorial_weave_area"
	elseif tutorial_step == 4 then
		unit_id = "wom_tutorial_athanor"
	elseif tutorial_step == 5 then
		unit_id = "wom_tutorial_weave_select"
	elseif tutorial_step == 6 then
		unit_id = "wom_tutorial_weave_select"
	elseif tutorial_step == 7 then
		unit_id = "wom_tutorial_athanor"
	elseif tutorial_step == 8 then
		unit_id = "wom_tutorial_weave_select"
	elseif tutorial_step == 9 then
		unit_id = "wom_tutorial_athanor"
	end

	if unit_id ~= current_objective_id then
		self:_deactivate_objective_marker(current_objective_id)
		self:_activate_objective_marker(unit_id)
	end
end

GameModeInn._activate_objective_marker = function (self, unit_id)
	local unit = self._objective_markers[unit_id]

	if unit then
		self._current_objective_id = unit_id
		local extension = ScriptUnit.extension(unit, "tutorial_system")

		extension:set_active(true)
	end
end

GameModeInn._deactivate_objective_marker = function (self, unit_id)
	local unit = self._objective_markers[unit_id]

	if unit then
		local extension = ScriptUnit.extension(unit, "tutorial_system")

		extension:set_active(false)
	end

	self._current_objective_id = nil
end

GameModeInn.rpc_waystone_active = function (self, sender, waystone_type, waystone_is_active, current_waystone_type)
	self._waystone_is_active = waystone_is_active
	self._waystone_type = waystone_type
	self._current_waystone_type = current_waystone_type
end

GameModeInn.hot_join_sync = function (self, sender)
	self._waystone_is_active = false
	self._waystone_type = 0

	RPC.rpc_waystone_active(sender, self._waystone_type, self._waystone_is_active, self._current_waystone_type)
end

GameModeInn.local_player_ready_to_start = function (self, player, loading_context)
	if not self._local_player_spawned then
		return false
	end

	return true
end

GameModeInn.local_player_game_starts = function (self, player, loading_context)
	local show_profile_on_startup = loading_context.show_profile_on_startup
	loading_context.show_profile_on_startup = nil

	if show_profile_on_startup and not LEVEL_EDITOR_TEST and not Development.parameter("skip-start-menu") then
		local platform = PLATFORM

		if platform == "ps4" or platform == "xb1" then
			local transition_params = {
				menu_state_name = "character"
			}
			local view = "initial_character_selection_force"

			Managers.state.event:trigger("ui_event_transition", view, transition_params)
		else
			local first_hero_selection_made = SaveData.first_hero_selection_made
			local backend_waiting_for_input = Managers.backend:is_waiting_for_user_input()
			local show_hero_selection = not backend_waiting_for_input and not first_hero_selection_made
			local transition_params = {
				menu_state_name = (show_hero_selection and "character") or "overview"
			}
			local view = "initial_start_menu_view_force"

			Managers.state.event:trigger("ui_event_transition", view, transition_params)
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

return
