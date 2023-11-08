local SERVER_INTERACT = true
local CLIENT_INTERACT = false
InteractionDefinitions.geheimnisnacht_2021_altar = InteractionDefinitions.geheimnisnacht_2021_altar or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.geheimnisnacht_2021_altar.config = {
	only_once = true,
	hud_verb = "player_interaction",
	hold = true,
	swap_to_3p = false,
	activate_block = true,
	block_other_interactions = true
}

InteractionDefinitions.geheimnisnacht_2021_altar.server.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	local success = result == InteractionResult.SUCCESS

	if success then
		local seed = Managers.mechanism:get_level_seed()
		local altar_position = Unit.local_position(interactable_unit, 0)
		local nav_world = Managers.state.conflict.nav_world
		local origin_position = ConflictUtils.get_pos_towards_goal(nav_world, altar_position, 15, 1)
		local boxed_pos = origin_position and Vector3Box(origin_position) or nil

		Managers.state.conflict:start_terror_event("geheimnisnacht_2021_event", seed, nil, boxed_pos)
	end

	local altar_extension = ScriptUnit.extension(interactable_unit, "props_system")

	altar_extension:on_interact(SERVER_INTERACT, success)

	local local_flow_event = "lua_interaction_stopped_smartobject_" .. InteractionResult[result]

	Unit.flow_event(interactable_unit, local_flow_event)
end

InteractionDefinitions.geheimnisnacht_2021_altar.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	InteractionDefinitions.smartobject.client.stop(world, interactor_unit, interactable_unit, data, config, t, result)

	local altar_extension = ScriptUnit.has_extension(interactable_unit, "props_system")

	if altar_extension then
		altar_extension:on_interact(CLIENT_INTERACT)
	end
end

InteractionDefinitions.geheimnisnacht_2021_altar.server.can_interact = function (interactor_unit, interactable_unit)
	local altar_extension = ScriptUnit.extension(interactable_unit, "props_system")

	if not altar_extension:can_interact() then
		return
	end

	local custom_interaction_check_name = Unit.get_data(interactable_unit, "interaction_data", "custom_interaction_check_name")

	if custom_interaction_check_name and InteractionCustomChecks[custom_interaction_check_name] and not InteractionCustomChecks[custom_interaction_check_name](interactor_unit, interactable_unit) then
		return false
	end

	local used = Unit.get_data(interactable_unit, "interaction_data", "used")

	return not used
end

InteractionDefinitions.geheimnisnacht_2021_altar.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	local altar_extension = ScriptUnit.extension(interactable_unit, "props_system")

	if not altar_extension:can_interact() then
		return
	end

	local custom_interaction_check_name = Unit.get_data(interactable_unit, "interaction_data", "custom_interaction_check_name")

	if custom_interaction_check_name and InteractionCustomChecks[custom_interaction_check_name] and not InteractionCustomChecks[custom_interaction_check_name](interactor_unit, interactable_unit) then
		return false
	end

	local used = Unit.get_data(interactable_unit, "interaction_data", "used")
	local being_used = Unit.get_data(interactable_unit, "interaction_data", "being_used")

	return not used and not being_used
end

InteractionDefinitions.geheimnisnacht_2021_altar.client.start = function (world, interactor_unit, interactable_unit, data, config, t)
	InteractionDefinitions.smartobject.client.start(world, interactor_unit, interactable_unit, data, config, t)

	local altar_extension = ScriptUnit.has_extension(interactable_unit, "props_system")

	if altar_extension then
		altar_extension:on_interact_start(CLIENT_INTERACT)
	end
end

InteractionDefinitions.geheimnisnacht_2021_altar.server.start = function (world, interactor_unit, interactable_unit, data, config, t)
	InteractionDefinitions.smartobject.server.start(world, interactor_unit, interactable_unit, data, config, t)

	local altar_extension = ScriptUnit.has_extension(interactable_unit, "props_system")

	if altar_extension then
		altar_extension:on_interact_start(SERVER_INTERACT)
	end
end
