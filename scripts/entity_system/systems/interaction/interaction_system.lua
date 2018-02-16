require("scripts/unit_extensions/generic/generic_unit_interactor_extension")
require("scripts/unit_extensions/generic/generic_husk_interactor_extension")

InteractionSystem = class(InteractionSystem, ExtensionSystemBase)
local RPCS = {
	"rpc_interaction_approved",
	"rpc_interaction_denied",
	"rpc_interaction_completed",
	"rpc_interaction_abort",
	"rpc_sync_interactable_used_state",
	"rpc_sync_interaction_state"
}
local extensions = {
	"GenericHuskInteractorExtension",
	"GenericUnitInteractorExtension"
}
InteractionSystem.init = function (self, entity_system_creation_context, system_name)
	InteractionSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	self.extension_init_context.dice_keeper = entity_system_creation_context.dice_keeper

	return 
end
InteractionSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	return 
end
InteractionSystem.rpc_interaction_approved = function (self, sender, interaction_id, interactor_go_id, interactable_go_id, is_level_unit)
	local interaction_type = NetworkLookup.interactions[interaction_id]
	local interactor_unit = self.unit_storage:unit(interactor_go_id)
	local interactable_unit = self.unit_storage:unit(interactable_go_id)

	if is_level_unit then
		local level = LevelHelper:current_level(self.world)
		interactable_unit = Level.unit_by_index(level, interactable_go_id)

		fassert(interactable_unit, "Couldn't find level unit to interact with.")
	end

	if not Unit.alive(interactable_unit) or not Unit.alive(interactor_unit) then
		return 
	end

	InteractionHelper.printf("rpc_interaction_approved(%s, %s, %s, %s, %s)", sender, interaction_type, tostring(interactor_go_id), tostring(interactable_go_id), tostring(is_level_unit))
	InteractionHelper:request_approved(interaction_type, interactor_unit, interactable_unit)

	return 
end
InteractionSystem.rpc_interaction_denied = function (self, sender, interactor_go_id)
	InteractionHelper.printf("rpc_interaction_denied(%s, %s)", sender, tostring(interactor_go_id))

	local interactor_unit = self.unit_storage:unit(interactor_go_id)

	InteractionHelper:request_denied(interactor_unit)

	return 
end
InteractionSystem.rpc_interaction_completed = function (self, sender, interactor_go_id, interaction_result)
	InteractionHelper.printf("rpc_interaction_completed(%s, %s, %s)", sender, tostring(interactor_go_id), InteractionResult[interaction_result])

	local interactor_unit = self.unit_storage:unit(interactor_go_id)

	if not Unit.alive(interactor_unit) then
		return 
	end

	local interactor_extension = ScriptUnit.extension(interactor_unit, "interactor_system")
	local is_interacting = interactor_extension.is_interacting(interactor_extension)

	if not is_interacting then
		InteractionHelper.printf("got rpc_interaction_completed but wasnt interacting (%s, %s, %s)", sender, tostring(interactor_go_id), InteractionResult[interaction_result])

		return 
	end

	local interactable_unit = interactor_extension.interactable_unit(interactor_extension)

	InteractionHelper:interaction_completed(interactor_unit, interactable_unit, interaction_result)

	return 
end
InteractionSystem.rpc_interaction_abort = function (self, sender, interactor_go_id)
	InteractionHelper.printf("rpc_interaction_abort(%s, %s)", sender, tostring(interactor_go_id))
	fassert(self.is_server or LEVEL_EDITOR_TEST, "Error, this should only be run on server!")

	local interactor_unit = self.unit_storage:unit(interactor_go_id)

	if Unit.alive(interactor_unit) then
		local interactor_extension = ScriptUnit.extension(interactor_unit, "interactor_system")

		if not interactor_extension.is_interacting(interactor_extension) or interactor_extension.is_stopping(interactor_extension) then
			InteractionHelper.printf("Got abort when interaction had already finished, ignore request")

			return 
		end

		local interactable_unit = interactor_extension.interactable_unit(interactor_extension)

		if Unit.alive(interactable_unit) then
			InteractionHelper:complete_interaction(interactor_unit, interactable_unit, InteractionResult.USER_ENDED)
			interactor_extension.interaction_completed(interactor_extension, InteractionResult.USER_ENDED)
		end
	end

	return 
end
InteractionSystem.rpc_sync_interaction_state = function (self, sender, unit_id, state_id, interaction_type_id, interactable_unit_id, start_time, duration, is_level_unit)
	local unit = self.unit_storage:unit(unit_id)
	local state = NetworkLookup.interaction_states[state_id]
	local interaction_type = NetworkLookup.interactions[interaction_type_id]
	local interactable_unit = Managers.state.network:game_object_or_level_unit(interactable_unit_id, is_level_unit)
	local interactor_extension = ScriptUnit.extension(unit, "interactor_system")

	interactor_extension.set_interaction_context(interactor_extension, state, interaction_type, interactable_unit, start_time, duration)

	return 
end
InteractionSystem.rpc_sync_interactable_used_state = function (self, sender, interactable_unit_id, is_level_object, is_used)
	local interactable_unit = Managers.state.network:game_object_or_level_unit(interactable_unit_id, is_level_object)

	Unit.set_data(interactable_unit, "interaction_data", "used", is_used)

	return 
end

return 
