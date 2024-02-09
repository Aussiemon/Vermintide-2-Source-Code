-- chunkname: @scripts/settings/dlcs/carousel/carousel_interactions.lua

InteractionDefinitions.carousel_dark_pact_climb = {
	config = {
		duration = 0,
		hold = false,
		show_weapons = true,
		swap_to_3p = false,
		timeout_duration = 5,
	},
	server = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			data.interaction_timeout = t + config.timeout_duration
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			local status_extension = ScriptUnit.extension(interactor_unit, "status_system")
			local breed_action = status_extension:breed_action()

			if t > data.interaction_timeout or breed_action and breed_action.name == "climbing" then
				return InteractionResult.SUCCESS
			end

			return InteractionResult.ONGOING
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			return
		end,
		can_interact = function (interactor_unit, interactable_unit)
			local status_extension = ScriptUnit.extension(interactor_unit, "status_system")

			if not status_extension.breed_action then
				return
			end

			return not status_extension:breed_action()
		end,
	},
	client = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			local status_extension = ScriptUnit.extension(interactor_unit, "status_system")

			status_extension:set_should_climb(true)
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			local status_extension = ScriptUnit.extension(interactor_unit, "status_system")

			if status_extension:should_climb() then
				return InteractionResult.ONGOING
			end

			return InteractionResult.SUCCESS
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			return
		end,
		get_progress = function (data, config, t)
			return 0
		end,
		can_interact = function (interactor_unit, interactable_unit, data, config)
			if not Managers.state.side:versus_is_dark_pact(interactor_unit) then
				return false
			end

			local status_extension = ScriptUnit.extension(interactor_unit, "status_system")

			return not status_extension:breed_action() and not status_extension:should_climb()
		end,
		hud_description = function (interactable_unit, data, config)
			return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), Unit.get_data(interactable_unit, "interaction_data", "hud_interaction_action")
		end,
		in_range = function (interactor_unit, interactable_unit, data, config, world, is_in_range)
			if is_in_range then
				local wwise_world = Managers.world:wwise_world(world)

				WwiseWorld.trigger_event(wwise_world, "versus_climb_node_indicator")
			end
		end,
	},
}
InteractionDefinitions.carousel_dark_pact_tunnel = {
	config = {
		duration = 0,
		hold = false,
		show_weapons = true,
		swap_to_3p = false,
	},
	server = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			return
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			local status_extension = ScriptUnit.extension(interactor_unit, "status_system")
			local breed_action = status_extension:breed_action()

			if breed_action and breed_action.name == "tunneling" then
				return InteractionResult.SUCCESS
			end

			return InteractionResult.ONGOING
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			return
		end,
		can_interact = function (interactor_unit, interactable_unit)
			local status_extension = ScriptUnit.extension(interactor_unit, "status_system")

			if not status_extension.breed_action then
				return
			end

			return not status_extension:breed_action()
		end,
	},
	client = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			local status_extension = ScriptUnit.extension(interactor_unit, "status_system")

			status_extension:set_should_tunnel(true)
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			local status_extension = ScriptUnit.extension(interactor_unit, "status_system")

			if status_extension:should_tunnel() then
				return InteractionResult.ONGOING
			end

			return InteractionResult.SUCCESS
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			return
		end,
		get_progress = function (data, config, t)
			return 0
		end,
		can_interact = function (interactor_unit, interactable_unit, data, config)
			local status_extension = ScriptUnit.extension(interactor_unit, "status_system")

			if not status_extension.breed_action or not status_extension.should_tunnel then
				return
			end

			return not status_extension:breed_action() and not status_extension:should_tunnel()
		end,
		hud_description = function (interactable_unit, data, config)
			return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), Unit.get_data(interactable_unit, "interaction_data", "hud_interaction_action")
		end,
		in_range = function (interactor_unit, interactable_unit, data, config, world, is_in_range)
			return
		end,
	},
}
InteractionDefinitions.carousel_dark_pact_spawner = {
	config = {
		duration = 0,
		hold = false,
		show_weapons = true,
		swap_to_3p = false,
	},
	server = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			return
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			local status_extension = ScriptUnit.extension(interactor_unit, "status_system")
			local breed_action = status_extension:breed_action()

			if breed_action and breed_action.name == "spawning" then
				return InteractionResult.SUCCESS
			end

			return InteractionResult.ONGOING
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			return
		end,
		can_interact = function (interactor_unit, interactable_unit)
			local status_extension = ScriptUnit.extension(interactor_unit, "status_system")

			if not status_extension.breed_action then
				return
			end

			return not status_extension:breed_action()
		end,
	},
	client = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			local status_extension = ScriptUnit.extension(interactor_unit, "status_system")

			status_extension:set_should_spawn(true)
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			local status_extension = ScriptUnit.extension(interactor_unit, "status_system")

			if status_extension:should_spawn() then
				return InteractionResult.ONGOING
			end

			return InteractionResult.SUCCESS
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			return
		end,
		get_progress = function (data, config, t)
			return 0
		end,
		can_interact = function (interactor_unit, interactable_unit, data, config)
			local status_extension = ScriptUnit.extension(interactor_unit, "status_system")

			if not status_extension.breed_action then
				return
			end

			return not status_extension:breed_action() and not status_extension:should_spawn()
		end,
		hud_description = function (interactable_unit, data, config)
			return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), Unit.get_data(interactable_unit, "interaction_data", "hud_interaction_action")
		end,
		in_range = function (interactor_unit, interactable_unit, data, config, world, is_in_range)
			return
		end,
	},
}
InteractionDefinitions.carousel_start_versus = {
	config = {
		duration = 0,
		hold = true,
		show_weapons = true,
		swap_to_3p = false,
	},
	server = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			return
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			return InteractionResult.SUCCESS
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			if result == InteractionResult.SUCCESS then
				local vote_data = {
					level_key = "carousel_hub",
					mechanism_key = "versus",
				}
				local interaction_player = Managers.player:owner(interactor_unit)

				Managers.state.voting:request_vote("change_game_mode", vote_data, interaction_player.peer_id)

				local interactable_system = ScriptUnit.extension(interactable_unit, "interactable_system")

				interactable_system.num_times_successfully_completed = interactable_system.num_times_successfully_completed + 1
			end
		end,
		can_interact = function (interactor_unit, interactable_unit)
			local used = Unit.get_data(interactable_unit, "interaction_data", "used")
			local all_players_spawned = Managers.matchmaking:are_all_players_spawned()

			return not used and all_players_spawned
		end,
	},
	client = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			return
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			return InteractionResult.SUCCESS
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			data.start_time = nil

			Unit.animation_event(interactor_unit, "interaction_end")

			if result == InteractionResult.SUCCESS and Unit.get_data(interactable_unit, "interaction_data", "only_once") then
				Unit.set_data(interactable_unit, "interaction_data", "used", true)
			end

			Unit.set_data(interactable_unit, "interaction_data", "being_used", false)
		end,
		get_progress = function (data, config, t)
			return 0
		end,
		can_interact = function (interactor_unit, interactable_unit, data, config)
			local used = Unit.get_data(interactable_unit, "interaction_data", "used")
			local being_used = Unit.get_data(interactable_unit, "interaction_data", "being_used")
			local all_players_spawned = Managers.matchmaking:are_all_players_spawned()

			return not used and not being_used and all_players_spawned
		end,
		hud_description = function (interactable_unit, data, config)
			return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), Unit.get_data(interactable_unit, "interaction_data", "hud_interaction_action")
		end,
	},
}
InteractionDefinitions.carousel_door_transition = InteractionDefinitions.carousel_door_transition or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.carousel_door_transition.config.swap_to_3p = false

InteractionDefinitions.carousel_door_transition.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	if result == InteractionResult.SUCCESS and not data.is_husk then
		local variation_data = Managers.backend:get_level_variation_data()
		local vote_data = {
			level_key = "carousel_hub",
			mechanism = "versus",
			switch_mechanism = true,
		}

		Managers.state.voting:request_vote("game_settings_vote_switch_mechanism", vote_data, Network.peer_id())
	end
end

InteractionDefinitions.carousel_door_transition.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), "interaction_action_enter"
end

InteractionDefinitions.carousel_door_transition.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	if not DLCSettings.carousel then
		return false
	end

	local is_game_matchmaking = Managers.matchmaking:is_game_matchmaking()
	local is_vote_in_progress = Managers.state.voting:vote_in_progress()

	return not is_game_matchmaking and not is_vote_in_progress
end

InteractionDefinitions.versus_map_access = InteractionDefinitions.versus_map_access or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.versus_map_access.config.swap_to_3p = false

InteractionDefinitions.versus_map_access.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	data.start_time = nil

	if result == InteractionResult.SUCCESS and not data.is_husk then
		Managers.ui:handle_transition("start_game_view_force", {
			menu_state_name = "play",
			use_fade = true,
		})
	end
end

InteractionDefinitions.versus_map_access.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), "interaction_action_open"
end

InteractionDefinitions.versus_map_access.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	local is_game_matchmaking = Managers.matchmaking:is_game_matchmaking()

	return not is_game_matchmaking
end
