﻿-- chunkname: @scripts/helpers/interaction_helper.lua

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
	control_panel = {},
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
	pictureframe = {},
	trophy = {},
	decoration = {},
	achievement_access = {},
	luckstone_access = {},
	difficulty_selection_access = {},
	weave_level_select_access = {},
	weave_magic_forge_access = {},
	weave_leaderboard_access = {},
	inn_door_transition = {},
	deus_door_transition = {},
	carousel_door_transition = {},
	loadout_access = {},
	handbook_access = {},
	active_event = {},
}

DLCUtils.map_list("interactions", function (interaction)
	InteractionHelper.interactions[interaction] = {}
end)

for _, config_table in pairs(InteractionHelper.interactions) do
	config_table.request_rpc = config_table.request_rpc or "rpc_generic_interaction_request"
end

InteractionHelper.printf = function (...)
	if script_data.debug_interactions then
		printf(...)
	end
end

local IS_LOCAL_HOST = "IS_LOCAL_HOST"

InteractionHelper.request = function (self, interaction_type, interactor_unit, interactable_unit, is_server, local_only)
	if LEVEL_EDITOR_TEST then
		return
	end

	if local_only then
		InteractionHelper:request_approved(interaction_type, interactor_unit, interactable_unit)

		return
	end

	local interactor_go_id = Managers.state.unit_storage:go_id(interactor_unit)
	local interactable_go_id, is_level_unit = Managers.state.network:game_object_or_level_id(interactable_unit)

	InteractionHelper.printf("InteractionHelper:request(%s, %s, %s, %s)", interaction_type, interactor_go_id, interactable_go_id, is_level_unit)

	if interactor_go_id == nil or interactable_go_id == nil then
		ferror("[GenericUnitInteractorExtension] start_interaction failed due to no id for interactor=%s or interactable=%s", tostring(self.unit), tostring(self.interaction_context.interactable_unit))

		return
	end

	local rpc_name = InteractionHelper.interactions[interaction_type].request_rpc
	local interaction_type_id = NetworkLookup.interactions[interaction_type]
	local network_manager = Managers.state.network

	if rpc_name == "rpc_generic_interaction_request" then
		if is_server then
			network_manager._event_delegate.event_table[rpc_name](Managers.state.network, IS_LOCAL_HOST, interactor_go_id, interactable_go_id, is_level_unit, interaction_type_id)
		else
			network_manager.network_transmit:send_rpc_server(rpc_name, interactor_go_id, interactable_go_id, is_level_unit, interaction_type_id)
		end
	elseif is_server then
		network_manager._event_delegate.event_table[rpc_name](Managers.state.network, IS_LOCAL_HOST, interactor_go_id, interactable_go_id, is_level_unit)
	else
		network_manager.network_transmit:send_rpc_server(rpc_name, interactor_go_id, interactable_go_id, is_level_unit)
	end
end

InteractionHelper.abort_authoritative = function (self, interactor_unit)
	local interactor_extension = ScriptUnit.has_extension(interactor_unit, "interactor_system")

	if interactor_extension and (not interactor_extension:is_interacting() or interactor_extension:is_stopping()) then
		InteractionHelper.printf("Got abort when interaction had already finished, ignore request")

		return
	end

	local interactable_unit = interactor_extension:interactable_unit()

	if Unit.alive(interactable_unit) then
		InteractionHelper:complete_interaction(interactor_unit, interactable_unit, InteractionResult.USER_ENDED)
	end
end

InteractionHelper.abort = function (self, interactor_unit, is_server)
	InteractionHelper.printf("InteractionHelper:abort(%s)", interactor_unit)

	local interactor_extension = ScriptUnit.extension(interactor_unit, "interactor_system")

	if interactor_extension:is_interacting_with_local_only_interact() then
		InteractionHelper:abort_authoritative(interactor_unit)

		return
	end

	if not Managers.state.network:game() then
		return
	end

	local interactor_go_id = Managers.state.unit_storage:go_id(interactor_unit)

	if not interactor_go_id then
		return
	end

	if is_server or LEVEL_EDITOR_TEST then
		Managers.state.network._event_delegate.event_table:rpc_interaction_abort(Network.peer_id(), interactor_go_id)
	else
		Managers.state.network.network_transmit:send_rpc_server("rpc_interaction_abort", interactor_go_id)
	end
end

InteractionHelper.approve_request = function (self, interaction_type, interactor_unit, interactable_unit)
	InteractionHelper.printf("InteractionHelper:approve_request(%s, %s, %s)", interaction_type, tostring(interactor_unit), tostring(interactable_unit))

	if LEVEL_EDITOR_TEST then
		return
	end

	local interactable_extension = ScriptUnit.extension(interactable_unit, "interactable_system")

	interactable_extension:set_is_being_interacted_with(interactor_unit)

	local interaction_id = NetworkLookup.interactions[interaction_type]
	local interactor_go_id = Managers.state.unit_storage:go_id(interactor_unit)
	local interactable_go_id, is_level_unit = Managers.state.network:game_object_or_level_id(interactable_unit)

	Managers.state.network.network_transmit:send_rpc_clients("rpc_interaction_approved", interaction_id, interactor_go_id, interactable_go_id, is_level_unit)
end

InteractionHelper.deny_request = function (self, peer_id, interactor_go_id)
	InteractionHelper.printf("InteractionHelper:deny_request(%s, %s)", tostring(peer_id), tostring(interactor_go_id))

	if Network.peer_id() == peer_id then
		local interactor_unit = Managers.state.unit_storage:unit(interactor_go_id)

		InteractionHelper:request_denied(interactor_unit)
	else
		local channel_id = PEER_ID_TO_CHANNEL[peer_id]

		RPC.rpc_interaction_denied(channel_id, interactor_go_id)
	end
end

InteractionHelper.request_approved = function (self, interaction_type, interactor_unit, interactable_unit)
	InteractionHelper.printf("InteractionHelper:request_approved(%s, %s, %s)", interaction_type, tostring(interactor_unit), tostring(interactable_unit))

	local interactor_extension = ScriptUnit.extension(interactor_unit, "interactor_system")

	interactor_extension:interaction_approved(interaction_type, interactable_unit)

	local interactable_extension = ScriptUnit.extension(interactable_unit, "interactable_system")

	interactable_extension:set_is_being_interacted_with(interactor_unit)
end

InteractionHelper.request_denied = function (self, interactor_unit)
	InteractionHelper.printf("InteractionHelper:request_denied(%s)", tostring(interactor_unit))

	local interactor_extension = ScriptUnit.extension(interactor_unit, "interactor_system")

	interactor_extension:interaction_denied()
end

InteractionHelper.complete_interaction = function (self, interactor_unit, interactable_unit, result)
	InteractionHelper.printf("InteractionHelper:complete_interaction(%s, %s, %s)", tostring(interactor_unit), tostring(interactable_unit), InteractionResult[result])
	InteractionHelper:interaction_completed(interactor_unit, interactable_unit, result)

	local interactable_extension = ScriptUnit.extension(interactable_unit, "interactable_system")

	if not interactable_extension:local_only() then
		local interactor_go_id = Managers.state.unit_storage:go_id(interactor_unit)

		if interactor_go_id then
			Managers.state.network.network_transmit:send_rpc_clients("rpc_interaction_completed", interactor_go_id, result)
		end
	end
end

InteractionHelper.interaction_completed = function (self, interactor_unit, interactable_unit, result)
	InteractionHelper.printf("InteractionHelper:interaction_completed(%s, %s, %s)", tostring(interactor_unit), tostring(interactable_unit), InteractionResult[result])

	local interactor_extension = ScriptUnit.has_extension(interactor_unit, "interactor_system")

	if interactor_extension then
		interactor_extension:interaction_completed(result)
	end

	if Unit.alive(interactable_unit) then
		local interactable_extension = ScriptUnit.extension(interactable_unit, "interactable_system")

		interactable_extension:set_is_being_interacted_with(nil, result)
	end
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

InteractionHelper.interaction_action_names = function (interactor_unit, optional_interactable_unit)
	local interactable_extension = ScriptUnit.has_extension(optional_interactable_unit, "interactable_system")

	if interactable_extension then
		local interact_action = interactable_extension:override_interactable_action()

		if interact_action then
			return interact_action
		end
	end

	local career_extension = ScriptUnit.has_extension(interactor_unit, "career_system")

	if career_extension then
		local profile = SPProfiles[career_extension:profile_index()]

		if profile and profile.affiliation == "dark_pact" then
			return "dark_pact_interact", "dark_pact_interacting"
		end
	end

	return "interact", "interacting"
end
