-- chunkname: @scripts/unit_extensions/generic/local_interactable_extension.lua

LocalInteractableExtension = class(LocalInteractableExtension)

LocalInteractableExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self._is_level_object = Unit.level(unit) ~= nil
	self.interactable_type = Unit.get_data(unit, "interaction_data", "interaction_type") or "player_generic"
	self._override_interactable_action = Unit.get_data(unit, "override_interactable_action")
	self.interactor_unit = nil
	self._enabled = true
	self.num_times_successfully_completed = 0
	self.interaction_result = nil

	fassert(self.interactable_type, "Unit: %s missing interaction_type in its unit data, should it have an interaction extension?", unit)
	fassert(InteractionDefinitions[self.interactable_type], "Missing definition for interaction of type '%s'", self.interactable_type)
	fassert(not InteractionDefinitions[self.interactable_type].server, "Interactable of type '%s' contains server logic but is used in a local only interactable.", self.interactable_type)
end

LocalInteractableExtension.destroy = function (self)
	return
end

LocalInteractableExtension.interaction_type = function (self)
	return self.interactable_type
end

LocalInteractableExtension.local_only = function (self)
	return true
end

LocalInteractableExtension.set_interactable_type = function (self, new_interactable_type)
	self.interactable_type = new_interactable_type
end

LocalInteractableExtension.set_is_being_interacted_with = function (self, interactor_unit, interaction_result)
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

LocalInteractableExtension.is_being_interacted_with = function (self)
	return self.interactor_unit
end

LocalInteractableExtension.is_enabled = function (self)
	return self._enabled
end

LocalInteractableExtension.set_enabled = function (self, enabled)
	self._enabled = enabled
end

LocalInteractableExtension.override_interactable_action = function (self)
	return self._override_interactable_action
end
