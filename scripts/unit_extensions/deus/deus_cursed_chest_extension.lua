DeusCursedChestExtension = class(DeusCursedChestExtension)
local RPCS = {
	"rpc_deus_chest_looted"
}
local STATES = {
	OPEN = 3,
	HOTJOIN_OPEN = 4,
	WAITING = 1,
	INITIALIZING = 0,
	RUNNING = 2
}
local DIALOGUE_DELAY = 4
local SOUND_EVENTS = {
	trigger_cursed_chest = "trigger_cursed_chest",
	finish_cursed_chest = "finish_cursed_chest"
}
local OBJECTIVE_MARKER_TIMEOUT = 60

local function drop_pickup(pickup_system, chest_unit, pickup_name)
	local position = POSITION_LOOKUP[chest_unit] + Vector3(math.random(-0.5, 0.5), math.random(-0.5, 0.5), 2)

	pickup_system:spawn_pickup(pickup_name, position, true, Quaternion.identity(), true, "dropped")
end

DeusCursedChestExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self._is_server = Managers.player.is_server

	self:register_rpcs(extension_init_context.network_transmit.network_event_delegate)
end

DeusCursedChestExtension.game_object_initialized = function (self, unit, go_id)
	self:_set_state(STATES.WAITING)
end

DeusCursedChestExtension.destroy = function (self)
	if self._objective_unit then
		self:_clear_objective_unit()
	end

	self:unregister_rpcs()
end

DeusCursedChestExtension.register_rpcs = function (self, network_event_delegate)
	network_event_delegate:register(self, unpack(RPCS))

	self._network_event_delegate = network_event_delegate
end

DeusCursedChestExtension.unregister_rpcs = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil
end

DeusCursedChestExtension.update = function (self, unit, input, dt, context, t)
	local prev_state = self._prev_state
	local current_state = self:_get_state()

	if prev_state ~= current_state then
		if current_state == STATES.WAITING then
			Unit.flow_event(self._unit, "state_WAITING")
		elseif current_state == STATES.RUNNING then
			Unit.flow_event(self._unit, "state_RUNNING")

			if self._is_server then
				local seed = Managers.mechanism:get_level_seed()

				Managers.state.conflict:start_terror_event("cursed_chest_prototype", seed, unit)
			end

			local position = POSITION_LOOKUP[self._unit]

			WwiseUtils.trigger_position_event(context.world, SOUND_EVENTS.trigger_cursed_chest, position)
		elseif current_state == STATES.HOTJOIN_OPEN then
			Unit.flow_event(self._unit, "state_HOTJOIN_OPEN")

			self._reward_collected = true
		elseif current_state == STATES.OPEN then
			if self._is_server then
				local deus_run_controller = Managers.mechanism:game_mechanism():get_deus_run_controller()

				deus_run_controller:record_cursed_chest_purified()

				self._play_dialogue_at = t + DIALOGUE_DELAY
			end

			local position = POSITION_LOOKUP[self._unit]

			WwiseUtils.trigger_position_event(context.world, SOUND_EVENTS.finish_cursed_chest, position)

			local unit_name = "units/hub_elements/objective_unit"
			local objective_unit = Managers.state.unit_spawner:spawn_local_unit(unit_name, POSITION_LOOKUP[unit])

			Unit.set_data(objective_unit, "objective_server_only", true)
			Managers.state.unit_spawner:create_unit_extensions(Unit.world(objective_unit), objective_unit, "objective_unit")

			local objective_unit_extension = ScriptUnit.extension(objective_unit, "tutorial_system")

			objective_unit_extension:set_active(true)
			World.link_unit(Unit.world(unit), objective_unit, 0, unit, 0)

			self._objective_unit = objective_unit
			self._objective_unit_timeout = t + OBJECTIVE_MARKER_TIMEOUT
			self._objective_unit_astar = GwNavAStar.create()

			Unit.flow_event(self._unit, "state_OPEN")

			local player = Managers.player:local_player()

			Managers.state.event:trigger("player_cleansed_deus_cursed_chest", player)
		end

		if current_state == STATES.HOTJOIN_OPEN then
			self._prev_state = STATES.OPEN
		else
			self._prev_state = current_state
		end
	elseif current_state == STATES.RUNNING and self._is_server and not TerrorEventMixer.find_event("cursed_chest_prototype") then
		self:_set_state(STATES.OPEN)
	end

	if self._objective_unit then
		if self._objective_unit_timeout < t then
			self:_clear_objective_unit()
		elseif self._objective_unit_running_astar then
			if GwNavAStar.processing_finished(self._objective_unit_astar) then
				self._objective_unit_running_astar = false

				if not GwNavAStar.path_found(self._objective_unit_astar) then
					self:_set_objective_unit_activate(false)
				else
					self:_set_objective_unit_activate(true)
				end
			end
		else
			local chest_position = POSITION_LOOKUP[unit]
			local local_player = Managers.player:local_player()
			local local_player_unit = local_player and local_player.player_unit

			if local_player_unit then
				local player_position = POSITION_LOOKUP[local_player_unit]
				local bot_traverse_logic = Managers.state.bot_nav_transition:traverse_logic()
				local nav_world = Managers.state.entity:system("ai_system"):nav_world()

				GwNavAStar.start_with_propagation_box(self._objective_unit_astar, nav_world, player_position, chest_position, 30, bot_traverse_logic)

				self._objective_unit_running_astar = true
			end
		end
	end

	if self._play_dialogue_at and self._play_dialogue_at <= t then
		self._play_dialogue_at = nil
		local vo_unit = LevelHelper:find_dialogue_unit(context.world, "ferry_lady")

		if vo_unit then
			local dialogue_input = ScriptUnit.extension_input(vo_unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()

			dialogue_input:trigger_dialogue_event("cursed_chest_purified", event_data)
		end
	end
end

DeusCursedChestExtension.on_reward_collected = function (self)
	if self._objective_unit then
		self:_clear_objective_unit()
	end

	Unit.flow_event(self._unit, "state_LOOTED")

	self._reward_collected = true

	if not self._is_server then
		local go_id = Managers.state.unit_storage:go_id(self._unit)

		Managers.state.network.network_transmit:send_rpc_server("rpc_deus_chest_looted", go_id)
	end
end

DeusCursedChestExtension._clear_objective_unit = function (self)
	World.unlink_unit(Unit.world(self._objective_unit), self._objective_unit)
	Managers.state.unit_spawner:mark_for_deletion(self._objective_unit)

	self._objective_unit = nil
	self._objective_unit_timeout = nil

	if self._objective_unit_running_astar then
		GwNavAStar.cancel(self._objective_unit_astar)
	end

	GwNavAStar.destroy(self._objective_unit_astar)

	self._objective_unit_astar = nil
	self._objective_unit_running_astar = nil
end

DeusCursedChestExtension._set_objective_unit_activate = function (self, active)
	if self._objective_unit then
		local objective_unit_extension = ScriptUnit.extension(self._objective_unit, "tutorial_system")

		objective_unit_extension:set_active(active)
	end
end

DeusCursedChestExtension.can_interact = function (self)
	local state = self:_get_state()

	return (state == STATES.WAITING or state == STATES.OPEN) and not self._reward_collected
end

DeusCursedChestExtension.get_interaction_length = function (self)
	local state = self:_get_state()

	if state == STATES.WAITING then
		local unit = self._unit
		local duration = Unit.get_data(unit, "interaction_data", "interaction_length")

		fassert(duration, "Interacting with %q that has no interaction length", unit)

		return duration
	else
		return 0
	end
end

DeusCursedChestExtension.get_interaction_action = function (self)
	local state = self:_get_state()

	if state == STATES.OPEN then
		return "deus_cursed_chest_get_reward_hud_desc"
	else
		return "interaction_action_cursed_chest"
	end
end

DeusCursedChestExtension.on_server_interact = function (self, world, interactor_unit, interactable_unit, data, config, t, result)
	local state = self:_get_state()

	if state == STATES.WAITING then
		self:_set_state(STATES.RUNNING)
	end
end

DeusCursedChestExtension.on_client_interact = function (self, world, interactor_unit, interactable_unit, data, config, t, result)
	local state = self:_get_state()

	if state == STATES.OPEN then
		Managers.ui:handle_transition("deus_cursed_chest", {
			interactable_unit = interactable_unit
		})

		local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")

		inventory_extension:check_and_drop_pickups("deus_cursed_chest")
	end
end

DeusCursedChestExtension._get_state = function (self)
	local game_session = Managers.state.network:game()
	local go_id = Managers.state.unit_storage:go_id(self._unit)

	if not game_session or not go_id then
		return STATES.INITIALIZING
	end

	local collected_by_peers = GameSession.game_object_field(game_session, go_id, "collected_by_peers")
	local mechanism = Managers.mechanism:game_mechanism()
	local deus_run_controller = mechanism:get_deus_run_controller()
	local peer_id = deus_run_controller:get_own_peer_id()
	local reward_collected = self._reward_collected
	local new_reward_collected = table.contains(collected_by_peers, peer_id)

	if new_reward_collected ~= reward_collected and new_reward_collected == true then
		return STATES.HOTJOIN_OPEN
	end

	return GameSession.game_object_field(game_session, go_id, "deus_cursed_chest_state")
end

DeusCursedChestExtension._set_state = function (self, state)
	local game = Managers.state.network:game()
	local go_id = Managers.state.unit_storage:go_id(self._unit)

	fassert(game and go_id, "setting state without network setup done")
	GameSession.set_game_object_field(game, go_id, "deus_cursed_chest_state", state)
end

DeusCursedChestExtension.rpc_deus_chest_looted = function (self, channel_id, go_id)
	local own_go_id = Managers.state.unit_storage:go_id(self._unit)

	if go_id ~= own_go_id then
		return
	end

	local game = Managers.state.network:game()

	fassert(game and own_go_id, "setting state without network setup done")

	local collected_by_peers = GameSession.game_object_field(game, own_go_id, "collected_by_peers")
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	table.insert(collected_by_peers, peer_id)
	GameSession.set_game_object_field(game, own_go_id, "collected_by_peers", collected_by_peers)
end

return
