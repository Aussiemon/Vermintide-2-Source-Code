-- chunkname: @scripts/unit_extensions/objectives/versus_interact_objective_extension_testify.lua

local VersusInteractObjectiveExtensionTestify = {
	versus_objective_simulate_interaction = function (versus_interact_objective_extension)
		local interactor_unit = Managers.player:local_player().player_unit
		local interactable_unit = versus_interact_objective_extension._unit
		local wanted_interaction_result = versus_interact_objective_extension._wanted_interaction_result
		local interactable_extension = ScriptUnit.extension(interactable_unit, "interactable_system")

		interactable_extension:set_is_being_interacted_with(interactor_unit, wanted_interaction_result)
		InteractionHelper:complete_interaction(interactor_unit, interactable_unit, wanted_interaction_result)
	end,
}

return VersusInteractObjectiveExtensionTestify
