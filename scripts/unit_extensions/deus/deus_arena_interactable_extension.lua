DeusArenaInteractableExtension = class(DeusArenaInteractableExtension)
local STATES = {
	INTERACTED = 2,
	WAITING = 1
}
local RPCS = {
	"rpc_deus_set_arena_interactable_state"
}

DeusArenaInteractableExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self._is_server = extension_init_context.is_server
	self.game = extension_init_data.game
	self._world = extension_init_context.world
	self._state = STATES.WAITING
	self._level_unit_id = Level.unit_index(LevelHelper:current_level(self._world), unit)

	self:register_rpcs(extension_init_context.network_transmit.network_event_delegate)
end

DeusArenaInteractableExtension.register_rpcs = function (self, network_event_delegate)
	self._network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
end

DeusArenaInteractableExtension.unregister_rpcs = function (self)
	if self._network_event_delegate then
		self._network_event_delegate:unregister(self)
	end

	self._network_event_delegate = nil
end

DeusArenaInteractableExtension.destroy = function (self)
	self:unregister_rpcs()
end

DeusArenaInteractableExtension.hot_join_sync = function (self, peer_id)
	local state = self:_get_state()

	Managers.state.network.network_transmit:send_rpc("rpc_deus_set_arena_interactable_state", peer_id, self._level_unit_id, state)
end

DeusArenaInteractableExtension.update = function (self, unit, input, dt, context, t)
	local prev_state = self._prev_state
	local current_state = self:_get_state()

	if prev_state ~= current_state then
		self:_on_state_changed(prev_state, current_state)

		self._prev_state = current_state
	end

	local timer = self._timer

	if timer and timer < t then
		timer = nil
		local end_game = Unit.get_data(self._unit, "arena_interactable_data", "end_game")

		if end_game then
			Managers.state.game_mode:complete_level()
		end

		local activate_end_zone = Unit.get_data(self._unit, "arena_interactable_data", "activate_end_zone")

		if activate_end_zone then
			local end_zone_name = Unit.get_data(self._unit, "arena_interactable_data", "end_zone_name")

			assert(end_zone_name, "[DeusArenaInteractableExtension] - [end_zone_name] is not set while [activate_end_zone]")

			local end_zone_system = Managers.state.entity:system("end_zone_system")

			end_zone_system:activate_end_zone_by_name(end_zone_name)
		end
	end

	self._timer = timer
end

DeusArenaInteractableExtension._on_state_changed = function (self, prev_state, current_state)
	if current_state == STATES.WAITING then
		Unit.flow_event(self._unit, "state_WAITING")
	elseif current_state == STATES.INTERACTED then
		Unit.flow_event(self._unit, "state_INTERACTED")
	end
end

DeusArenaInteractableExtension.rpc_deus_set_arena_interactable_state = function (self, sender, level_unit_id, new_state)
	if self._level_unit_id == level_unit_id then
		self._state = new_state
	end
end

DeusArenaInteractableExtension.can_interact = function (self)
	local state = self:_get_state()

	return state == STATES.WAITING
end

DeusArenaInteractableExtension.get_interact_hud_description = function (self)
	return "deus_altar_hud_desc"
end

DeusArenaInteractableExtension.on_server_interact = function (self, world, interactor_unit, interactable_unit, data, config, t, result)
	local state = self:_get_state()

	if state == STATES.WAITING then
		local health_extension = ScriptUnit.extension(interactor_unit, "health_system")

		if ALIVE[interactor_unit] and health_extension:is_alive() then
			local dialogue_input = ScriptUnit.extension_input(interactor_unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()
			local event_name = Unit.get_data(self._unit, "arena_interactable_data", "interactor_vo_line")

			dialogue_input:trigger_dialogue_event(event_name, event_data)
		end

		local delay = Unit.get_data(self._unit, "arena_interactable_data", "delay")
		self._timer = t + delay

		LevelHelper:flow_event(self._world, "on_arena_end_triggered")
		self:_set_state(STATES.INTERACTED)
	end
end

DeusArenaInteractableExtension.on_client_interact = function (self, world, interactor_unit, interactable_unit, data, config, t, result)
	if not self._is_server then
		self._state = STATES.INTERACTED
	end
end

DeusArenaInteractableExtension._get_state = function (self)
	return self._state
end

DeusArenaInteractableExtension._set_state = function (self, state)
	Managers.state.network.network_transmit:send_rpc_clients("rpc_deus_set_arena_interactable_state", self._level_unit_id, state)

	self._state = state
end

return
