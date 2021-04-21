InteractionDefinitions._get_unlocks = function (achievement_name, statistics_db, stats_id)
	local achievement_data = AchievementTemplates.achievements[achievement_name]
	local completed = achievement_data.completed(statistics_db, stats_id)

	return completed
end

InteractionDefinitions._fulfill_requirements_for_weave = function ()
	if script_data.unlock_all_levels then
		return true
	end

	local player_manager = Managers.player
	local statistics_db = player_manager:statistics_db()
	local player = player_manager:local_player()
	local stats_id = player:stats_id()

	for _, level_key in pairs(MainGameLevels) do
		local level_settings = LevelSettings[level_key]

		if level_settings.game_mode == "adventure" and statistics_db:get_persistent_stat(stats_id, "completed_levels", level_key) < 1 then
			return false
		end
	end

	local scorpion_dlc_levels = GameActs.act_scorpion

	for _, level_key in pairs(scorpion_dlc_levels) do
		local level_settings = LevelSettings[level_key]

		if level_settings.game_mode == "adventure" and statistics_db:get_persistent_stat(stats_id, "completed_levels", level_key) < 1 then
			return false
		end
	end

	return true
end

InteractionDefinitions._fullfill_requirements_for_weave_leaderboards = function ()
	local weave_access = InteractionDefinitions._fulfill_requirements_for_weave()

	if not weave_access then
		return false
	end

	return not Managers.account:offline_mode()
end

InteractionDefinitions.weave_level_select_access = InteractionDefinitions.weave_level_select_access or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.weave_level_select_access.config.swap_to_3p = false

InteractionDefinitions.weave_level_select_access.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	data.start_time = nil

	if result == InteractionResult.SUCCESS and not data.is_husk then
		local dlc_name = "scorpion"
		local has_dlc = Managers.unlock:is_dlc_unlocked(dlc_name)

		if not has_dlc then
			Managers.state.event:trigger("ui_show_popup", dlc_name, "upsell")

			return
		end

		local twitch_connection = Managers.twitch and (Managers.twitch:is_connected() or Managers.twitch:is_activated())

		if twitch_connection then
			Managers.state.event:trigger("weave_tutorial_message", WeaveUITutorials.twitch_not_supported_for_weaves)

			return
		elseif not Managers.player.is_server then
			local lobby = Managers.state.network:lobby()

			if lobby:lobby_data("twitch_enabled") == "true" then
				Managers.state.event:trigger("weave_tutorial_message", WeaveUITutorials.twitch_not_supported_for_weaves_client)

				return
			end
		end

		local fulfill_requirements_for_weave_levels = InteractionDefinitions._fulfill_requirements_for_weave()

		if fulfill_requirements_for_weave_levels then
			local transition_params = {
				menu_sub_state_name = "weave_quickplay",
				menu_state_name = "play"
			}

			Managers.state.event:trigger("ui_event_transition_with_fade", "start_game_view_force", transition_params)
			Unit.flow_event(interactable_unit, "lua_interaction_success")
		else
			Managers.state.event:trigger("weave_tutorial_message", WeaveUITutorials.requirements_not_met)
		end
	end
end

InteractionDefinitions.weave_level_select_access.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	return true
end

InteractionDefinitions.weave_level_select_access.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), Unit.get_data(interactable_unit, "interaction_data", "hud_interaction_action")
end

InteractionDefinitions.weave_magic_forge_access = InteractionDefinitions.weave_magic_forge_access or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.weave_magic_forge_access.config.swap_to_3p = false

InteractionDefinitions.weave_magic_forge_access.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	data.start_time = nil

	if result == InteractionResult.SUCCESS and not data.is_husk then
		local dlc_name = "scorpion"
		local has_dlc = Managers.unlock:is_dlc_unlocked(dlc_name)

		if not has_dlc then
			Managers.state.event:trigger("ui_show_popup", dlc_name, "upsell")

			return
		end

		local fulfill_requirements_for_weave_forge = InteractionDefinitions._fulfill_requirements_for_weave()

		if fulfill_requirements_for_weave_forge then
			local transition_params = {
				menu_state_name = "weave_forge"
			}

			Managers.state.event:trigger("ui_event_transition_with_fade", "hero_view_force", transition_params)
			Unit.flow_event(interactable_unit, "lua_interaction_success")
		else
			Managers.state.event:trigger("weave_tutorial_message", WeaveUITutorials.requirements_not_met)
		end
	end
end

InteractionDefinitions.weave_magic_forge_access.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	return true
end

InteractionDefinitions.weave_magic_forge_access.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), Unit.get_data(interactable_unit, "interaction_data", "hud_interaction_action")
end

InteractionDefinitions.weave_leaderboard_access = InteractionDefinitions.weave_leaderboard_access or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.weave_leaderboard_access.config.swap_to_3p = false

InteractionDefinitions.weave_leaderboard_access.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	data.start_time = nil

	if result == InteractionResult.SUCCESS and not data.is_husk then
		local dlc_name = "scorpion"
		local has_dlc = Managers.unlock:is_dlc_unlocked(dlc_name)

		if not has_dlc then
			Managers.state.event:trigger("ui_show_popup", dlc_name, "upsell")

			return
		end

		local fulfill_requirements_for_leaderboard = InteractionDefinitions._fullfill_requirements_for_weave_leaderboards()

		if fulfill_requirements_for_leaderboard then
			local transition_params = {
				menu_state_name = "leaderboard"
			}

			Managers.state.event:trigger("ui_event_transition_with_fade", "start_game_view_force", transition_params)
			Unit.flow_event(interactable_unit, "lua_interaction_success")
		else
			Managers.state.event:trigger("weave_tutorial_message", WeaveUITutorials.requirements_not_met)
		end
	end
end

InteractionDefinitions.weave_leaderboard_access.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	if Managers.account:offline_mode() then
		return false, "status_offline"
	end

	return true
end

InteractionDefinitions.weave_leaderboard_access.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	if fail_reason == "status_offline" then
		return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), "status_offline"
	else
		return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), Unit.get_data(interactable_unit, "interaction_data", "hud_interaction_action"), nil, "test"
	end
end

return
