GenericUnitInteractableExtension = class(GenericUnitInteractableExtension)

GenericUnitInteractableExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self._is_level_object = Unit.level(unit) ~= nil
	self.interactable_type = Unit.get_data(unit, "interaction_data", "interaction_type")
	self.interactor_unit = nil

	fassert(self.interactable_type, "Unit: %s missing interaction_type in its unit data, should it have an interaction extension?", unit)
end

GenericUnitInteractableExtension.destroy = function (self)
	return
end

GenericUnitInteractableExtension.interaction_type = function (self)
	return self.interactable_type
end

GenericUnitInteractableExtension.set_is_being_interacted_with = function (self, interactor_unit)
	if self.interactor_unit then
		fassert(interactor_unit == nil, "Interactor unit was already set.")
	else
		fassert(interactor_unit ~= nil, "Interactor unit was already nil.")
	end

	self.interactor_unit = interactor_unit
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

		if used then
			RPC.rpc_sync_interactable_used_state(sender, interactable_unit_id, self._is_level_object, used)
		end
	end
end

return
