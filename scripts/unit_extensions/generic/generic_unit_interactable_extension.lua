GenericUnitInteractableExtension = class(GenericUnitInteractableExtension)

GenericUnitInteractableExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self._is_level_object = Unit.level(unit) ~= nil
	self.interactable_type = Unit.get_data(unit, "interaction_data", "interaction_type") or "player_generic"
	self.interactor_unit = nil
	self._enabled = true
	self.num_times_successfully_completed = 0
	self.interaction_result = nil

	fassert(self.interactable_type, "Unit: %s missing interaction_type in its unit data, should it have an interaction extension?", unit)
end

GenericUnitInteractableExtension.destroy = function (self)
	return
end

GenericUnitInteractableExtension.interaction_type = function (self)
	return self.interactable_type
end

GenericUnitInteractableExtension.set_interactable_type = function (self, new_interactable_type)
	self.interactable_type = new_interactable_type
end

GenericUnitInteractableExtension.set_is_being_interacted_with = function (self, interactor_unit, interaction_result)
	local unit = self.unit
	local interaction_type = self.interactable_type

	if self.interactor_unit then
		fassert(interactor_unit == nil, "Interactor unit was already set.")

		local current_interactor_unit = self.interactor_unit
		local flow_event = "lua_interaction_stopped_" .. interaction_type .. "_" .. InteractionResult[interaction_result]

		Unit.flow_event(unit, flow_event)

		local is_interactor_network_unit = NetworkUnit.is_network_unit(current_interactor_unit)
		local is_interactor_husk = is_interactor_network_unit and NetworkUnit.is_husk_unit(current_interactor_unit)

		if not is_interactor_husk then
			local local_flow_event = "lua_interaction_stopped_local_interactor_" .. interaction_type .. "_" .. InteractionResult[interaction_result]

			Unit.flow_event(unit, local_flow_event)
		end
	else
		fassert(interactor_unit ~= nil, "Interactor unit was already nil.")
		Unit.set_flow_variable(unit, "lua_interaction_started_unit", interactor_unit)

		local flow_event = "lua_interaction_started_" .. interaction_type

		Unit.flow_event(unit, flow_event)
	end

	self.interactor_unit = interactor_unit
	self.interaction_result = interaction_result
end

GenericUnitInteractableExtension.is_being_interacted_with = function (self)
	return self.interactor_unit
end

GenericUnitInteractableExtension.hot_join_sync = function (self, sender)
	local interactable_unit = self.unit
	local only_once = Unit.get_data(interactable_unit, "interaction_data", "only_once")

	if only_once then
		local network_manager = Managers.state.network
		local interactable_unit_id = network_manager:game_object_or_level_id(self.unit)
		local used = Unit.get_data(interactable_unit, "interaction_data", "used") or false
		local individual_pickup = Unit.get_data(interactable_unit, "interaction_data", "individual_pickup") or false

		if not individual_pickup and used then
			local channel_id = PEER_ID_TO_CHANNEL[sender]

			RPC.rpc_sync_interactable_used_state(channel_id, interactable_unit_id, self._is_level_object, used)
		end
	end
end

GenericUnitInteractableExtension.is_enabled = function (self)
	return self._enabled
end

GenericUnitInteractableExtension.set_enabled = function (self, enabled)
	self._enabled = enabled
end
