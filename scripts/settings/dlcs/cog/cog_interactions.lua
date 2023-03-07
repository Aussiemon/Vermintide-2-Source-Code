InteractionDefinitions.cog_missing_cog_pickup = InteractionDefinitions.cog_missing_cog_pickup or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.cog_missing_cog_pickup.config.swap_to_3p = false

InteractionDefinitions.cog_missing_cog_pickup.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	local player_manager = Managers.player
	local player = Managers.player:unit_owner(interactor_unit)
	local stats_id = player:stats_id()
	local statistics_db = player_manager:statistics_db()
	local has_cog = statistics_db:get_persistent_stat(stats_id, "cog_missing_cog")
	local dlc_manager = Managers.unlock
	local dlc_name = "cog"

	return has_cog < 1 and dlc_manager:is_dlc_unlocked(dlc_name)
end

InteractionDefinitions.cog_missing_cog_pickup.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	data.start_time = nil

	if result == InteractionResult.SUCCESS and not data.is_husk then
		local player = Managers.player:unit_owner(interactor_unit)

		if player and player.local_player and not player.bot_player then
			local statistics_db = Managers.player:statistics_db()
			local stats_id = player:stats_id()

			statistics_db:increment_stat(stats_id, "cog_missing_cog")
			Managers.backend:commit()
		end
	end

	local local_flow_event = "lua_interaction_stopped_smartobject_" .. InteractionResult[result]

	Unit.flow_event(interactable_unit, local_flow_event)
end

InteractionDefinitions.cog_missing_cog_pickup.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), Unit.get_data(interactable_unit, "interaction_data", "hud_interaction_action")
end
