script_data.debug_interactions = script_data.debug_interactions or Development.parameter("debug_interactions")
InteractionHelper = InteractionHelper or {}
InteractionHelper.interactions = {
	player_generic = {},
	revive = {},
	pull_up = {},
	assisted_respawn = {},
	heal = {},
	linker_transportation_unit = {},
	release_from_hook = {},
	give_item = {},
	smartobject = {},
	pickup_object = {},
	chest = {},
	inventory_access = {},
	prestige_access = {},
	unlock_key_access = {},
	forge_access = {},
	altar_access = {},
	quest_access = {},
	journal_access = {},
	door = {},
	map_access = {},
	cosmetics_access = {},
	loot_access = {},
	characters_access = {},
	talents_access = {},
	pictureframe = {}
}

for interaction, config_table in pairs(InteractionHelper.interactions) do
	config_table.request_rpc = config_table.request_rpc or "rpc_generic_interaction_request"
end

InteractionHelper.printf = function (...)
	if script_data.debug_interactions then
		printf(...)
	end

	return 
end
InteractionHelper.request = function (self, interaction_type, interactor_go_id, interactable_go_id, is_level_unit, is_server)
	InteractionHelper.printf("InteractionHelper:request(%s, %s, %s, %s)", interaction_type, tostring(interactor_go_id), tostring(interactable_go_id), tostring(is_level_unit))

	if LEVEL_EDITOR_TEST then
		return 
	end

	local rpc_name = InteractionHelper.interactions[interaction_type].request_rpc
	local interaction_type_id = NetworkLookup.interactions[interaction_type]
	local network_manager = Managers.state.network

	if rpc_name == "rpc_generic_interaction_request" then
		if is_server then
			network_manager._event_delegate.event_table[rpc_name](Managers.state.network, Network.peer_id(), interactor_go_id, interactable_go_id, is_level_unit, interaction_type_id)
		else
			network_manager.network_transmit:send_rpc_server(rpc_name, interactor_go_id, interactable_go_id, is_level_unit, interaction_type_id)
		end
	elseif is_server then
		network_manager._event_delegate.event_table[rpc_name](Managers.state.network, Network.peer_id(), interactor_go_id, interactable_go_id, is_level_unit)
	else
		network_manager.network_transmit:send_rpc_server(rpc_name, interactor_go_id, interactable_go_id, is_level_unit)
	end

	return 
end
InteractionHelper.abort = function (self, interactor_go_id, is_server)
	InteractionHelper.printf("InteractionHelper:abort(%s)", tostring(interactor_go_id))

	if is_server or LEVEL_EDITOR_TEST then
		Managers.state.network._event_delegate.event_table:rpc_interaction_abort(Network.peer_id(), interactor_go_id)
	else
		Managers.state.network.network_transmit:send_rpc_server("rpc_interaction_abort", interactor_go_id)
	end

	return 
end
InteractionHelper.approve_request = function (self, interaction_type, interactor_unit, interactable_unit)
	InteractionHelper.printf("InteractionHelper:approve_request(%s, %s, %s)", interaction_type, tostring(interactor_unit), tostring(interactable_unit))

	if LEVEL_EDITOR_TEST then
		return 
	end

	local interactable_extension = ScriptUnit.extension(interactable_unit, "interactable_system")

	interactable_extension.set_is_being_interacted_with(interactable_extension, interactor_unit)

	local interaction_id = NetworkLookup.interactions[interaction_type]
	local interactor_go_id = Managers.state.unit_storage:go_id(interactor_unit)
	local interactable_go_id, is_level_unit = Managers.state.network:game_object_or_level_id(interactable_unit)

	Managers.state.network.network_transmit:send_rpc_clients("rpc_interaction_approved", interaction_id, interactor_go_id, interactable_go_id, is_level_unit)

	return 
end
InteractionHelper.deny_request = function (self, sender, interactor_go_id)
	InteractionHelper.printf("InteractionHelper:deny_request(%s, %s)", tostring(sender), tostring(interactor_go_id))

	if Network.peer_id() == sender then
		local interactor_unit = Managers.state.unit_storage:unit(interactor_go_id)

		InteractionHelper:request_denied(interactor_unit)
	else
		RPC.rpc_interaction_denied(sender, interactor_go_id)
	end

	return 
end
InteractionHelper.request_approved = function (self, interaction_type, interactor_unit, interactable_unit)
	InteractionHelper.printf("InteractionHelper:request_approved(%s, %s, %s)", interaction_type, tostring(interactor_unit), tostring(interactable_unit))

	local interactor_extension = ScriptUnit.extension(interactor_unit, "interactor_system")

	interactor_extension.interaction_approved(interactor_extension, interaction_type, interactable_unit)

	local interactable_extension = ScriptUnit.extension(interactable_unit, "interactable_system")

	interactable_extension.set_is_being_interacted_with(interactable_extension, interactor_unit)

	return 
end
InteractionHelper.request_denied = function (self, interactor_unit)
	InteractionHelper.printf("InteractionHelper:request_denied(%s)", tostring(interactor_unit))

	local interactor_extension = ScriptUnit.extension(interactor_unit, "interactor_system")

	interactor_extension.interaction_denied(interactor_extension)

	return 
end
InteractionHelper.complete_interaction = function (self, interactor_unit, interactable_unit, result)
	InteractionHelper.printf("InteractionHelper:complete_interaction(%s, %s, %s)", tostring(interactor_unit), tostring(interactable_unit), InteractionResult[result])

	if Unit.alive(interactable_unit) then
		local interactable_extension = ScriptUnit.extension(interactable_unit, "interactable_system")

		interactable_extension.set_is_being_interacted_with(interactable_extension, nil)
	end

	local interactor_go_id = Managers.state.unit_storage:go_id(interactor_unit)

	Managers.state.network.network_transmit:send_rpc_clients("rpc_interaction_completed", interactor_go_id, result)

	return 
end
InteractionHelper.interaction_completed = function (self, interactor_unit, interactable_unit, result)
	InteractionHelper.printf("InteractionHelper:interaction_completed(%s, %s, %s)", tostring(interactor_unit), tostring(interactable_unit), InteractionResult[result])

	local interactor_extension = ScriptUnit.extension(interactor_unit, "interactor_system")

	interactor_extension.interaction_completed(interactor_extension, result)

	if Unit.alive(interactable_unit) then
		local interactable_extension = ScriptUnit.extension(interactable_unit, "interactable_system")

		interactable_extension.set_is_being_interacted_with(interactable_extension, nil)
	end

	return 
end
InteractionHelper.choose_player_interaction = function (interactor_unit, interactable_unit)
	if InteractionDefinitions.release_from_hook.client.can_interact(interactor_unit, interactable_unit) then
		return "release_from_hook"
	elseif InteractionDefinitions.revive.client.can_interact(interactor_unit, interactable_unit) then
		return "revive"
	elseif InteractionDefinitions.pull_up.client.can_interact(interactor_unit, interactable_unit) then
		return "pull_up"
	elseif InteractionDefinitions.assisted_respawn.client.can_interact(interactor_unit, interactable_unit) then
		return "assisted_respawn"
	elseif InteractionDefinitions.heal.client.can_interact(interactor_unit, interactable_unit) then
		return "heal"
	elseif InteractionDefinitions.give_item.client.can_interact(interactor_unit, interactable_unit) then
		return "give_item"
	else
		return nil
	end

	return 
end
InteractionHelper.player_modify_interaction_type = function (interactor_unit, interactable_unit, interaction_type)
	if interaction_type == "player_generic" then
		local result = InteractionHelper.choose_player_interaction(interactor_unit, interactable_unit)

		if result then
			return result
		end
	end

	return interaction_type
end

return 
