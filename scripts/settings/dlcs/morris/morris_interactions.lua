InteractionDefinitions.deus_access = InteractionDefinitions.deus_access or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.deus_access.config.swap_to_3p = false

InteractionDefinitions.deus_access.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	if result == InteractionResult.SUCCESS and not data.is_husk then
		local transition_params = {
			menu_state_name = "play"
		}

		Managers.state.event:trigger("ui_event_transition_with_fade", "start_game_view_force", transition_params)
	end
end

InteractionDefinitions.deus_access.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), "interaction_action_open"
end

InteractionDefinitions.deus_access.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	local active = Unit.get_data(interactable_unit, "interaction_data", "active")
	local is_game_matchmaking = Managers.matchmaking:is_game_matchmaking()

	return active and not is_game_matchmaking
end

InteractionDefinitions.deus_weapon_chest = InteractionDefinitions.deus_weapon_chest or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.deus_weapon_chest.config.swap_to_3p = false

InteractionDefinitions.deus_weapon_chest.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	if result == InteractionResult.SUCCESS and not data.is_husk then
		local pickup_extension = ScriptUnit.extension(interactable_unit, "pickup_system")

		if pickup_extension:can_be_unlocked() then
			pickup_extension:open_chest()

			local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")

			inventory_extension:check_and_drop_pickups("deus_weapon_chest")
		else
			Managers.state.event:trigger("chest_unlock_failed", pickup_extension:get_chest_type())
		end
	end
end

InteractionDefinitions.deus_weapon_chest.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	local pickup_ext = ScriptUnit.extension(interactable_unit, "pickup_system")

	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), Unit.get_data(interactable_unit, "interaction_data", "hud_action"), pickup_ext:get_chest_type()
end

InteractionDefinitions.deus_weapon_chest.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	if Managers.mechanism:current_mechanism_name() ~= "deus" or Managers.mechanism:game_mechanism():get_state() ~= "ingame_deus" then
		return false
	end

	local deus_cursed_chest_extension = ScriptUnit.has_extension(interactable_unit, "pickup_system")

	return deus_cursed_chest_extension and deus_cursed_chest_extension:can_interact()
end

InteractionDefinitions.deus_cursed_chest = InteractionDefinitions.deus_cursed_chest or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.deus_cursed_chest.config = {
	block_other_interactions = true,
	hud_verb = "player_interaction",
	hold = true,
	swap_to_3p = false,
	activate_block = true
}

InteractionDefinitions.deus_cursed_chest.server.start = function (world, interactor_unit, interactable_unit, data, config, t)
	local deus_cursed_chest_extension = ScriptUnit.has_extension(interactable_unit, "deus_cursed_chest_system")

	if deus_cursed_chest_extension then
		local duration = deus_cursed_chest_extension:get_interaction_length()
		data.done_time = t + duration
		data.duration = duration
		local buff_template_name = Unit.get_data(interactable_unit, "interaction_data", "apply_buff")

		if buff_template_name then
			data.apply_buff = buff_template_name
		end

		local interactor_position = Unit.world_position(interactor_unit, 0)
		local interactable_position = Unit.world_position(interactable_unit, 0)
		local start_offset = interactor_position - interactable_position
		data.start_offset = Vector3Box(start_offset)
	end
end

InteractionDefinitions.deus_cursed_chest.server.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	if result == InteractionResult.SUCCESS then
		local deus_cursed_chest_extension = ScriptUnit.has_extension(interactable_unit, "deus_cursed_chest_system")

		if deus_cursed_chest_extension then
			deus_cursed_chest_extension:on_server_interact(world, interactor_unit, interactable_unit, data, config, t, result)
		end
	end
end

InteractionDefinitions.deus_cursed_chest.client.start = function (world, interactor_unit, interactable_unit, data, config, t)
	local deus_cursed_chest_extension = ScriptUnit.has_extension(interactable_unit, "deus_cursed_chest_system")

	if deus_cursed_chest_extension then
		data.start_time = t
		local duration = deus_cursed_chest_extension:get_interaction_length()
		data.duration = duration
		local interactor_animation_name = Unit.get_data(interactable_unit, "interaction_data", "interactor_animation")
		local interactor_animation_time_variable = Unit.get_data(interactable_unit, "interaction_data", "interactor_animation_time_variable")
		local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")
		local career_extension = ScriptUnit.extension(interactor_unit, "career_system")

		if interactor_animation_name then
			local interactor_animation_time_variable = Unit.animation_find_variable(interactor_unit, interactor_animation_time_variable)

			Unit.animation_set_variable(interactor_unit, interactor_animation_time_variable, duration)
			Unit.animation_event(interactor_unit, interactor_animation_name)
		end

		local interactable_animation_name = Unit.get_data(interactable_unit, "interaction_data", "interactable_animation")
		local interactable_animation_time_variable_name = Unit.get_data(interactable_unit, "interaction_data", "interactable_animation_time_variable")

		if interactable_animation_name then
			local interactable_animation_time_variable = Unit.animation_find_variable(interactable_unit, interactable_animation_time_variable_name)

			Unit.animation_set_variable(interactable_unit, interactable_animation_time_variable, duration)
			Unit.animation_event(interactable_unit, interactable_animation_name)
		end

		CharacterStateHelper.stop_weapon_actions(inventory_extension, "interacting")
		CharacterStateHelper.stop_career_abilities(career_extension, "interacting")
		Unit.set_data(interactable_unit, "interaction_data", "being_used", true)
	end
end

InteractionDefinitions.deus_cursed_chest.client.get_progress = function (data, config, t)
	local duration = data.duration or 0

	if duration == 0 then
		return 0
	end

	return (data.start_time == nil and 0) or math.min(1, (t - data.start_time) / duration)
end

InteractionDefinitions.deus_cursed_chest.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	if result == InteractionResult.SUCCESS and not data.is_husk then
		local deus_cursed_chest_extension = ScriptUnit.has_extension(interactable_unit, "deus_cursed_chest_system")

		if deus_cursed_chest_extension then
			deus_cursed_chest_extension:on_client_interact(world, interactor_unit, interactable_unit, data, config, t, result)
		end
	end
end

InteractionDefinitions.deus_cursed_chest.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	local deus_cursed_chest_extension = ScriptUnit.has_extension(interactable_unit, "deus_cursed_chest_system")

	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), deus_cursed_chest_extension:get_interaction_action()
end

InteractionDefinitions.deus_cursed_chest.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	if Managers.mechanism:current_mechanism_name() ~= "deus" or Managers.mechanism:game_mechanism():get_state() ~= "ingame_deus" then
		return false
	end

	local deus_cursed_chest_extension = ScriptUnit.has_extension(interactable_unit, "deus_cursed_chest_system")

	return deus_cursed_chest_extension and deus_cursed_chest_extension:can_interact()
end

InteractionDefinitions.deus_arena_interactable = InteractionDefinitions.deus_arena_interactable or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.deus_arena_interactable.config.swap_to_3p = false

InteractionDefinitions.deus_arena_interactable.server.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	if result == InteractionResult.SUCCESS then
		local deus_arena_interactable_extension = ScriptUnit.has_extension(interactable_unit, "deus_arena_interactable_system")

		if deus_arena_interactable_extension then
			deus_arena_interactable_extension:on_server_interact(world, interactor_unit, interactable_unit, data, config, t, result)
		end
	end
end

InteractionDefinitions.deus_arena_interactable.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	if result == InteractionResult.SUCCESS and not data.is_husk then
		local deus_arena_interactable_extension = ScriptUnit.has_extension(interactable_unit, "deus_arena_interactable_system")

		if deus_arena_interactable_extension then
			deus_arena_interactable_extension:on_client_interact(world, interactor_unit, interactable_unit, data, config, t, result)
		end
	end
end

InteractionDefinitions.deus_arena_interactable.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	local deus_arena_interactable_extension = ScriptUnit.has_extension(interactable_unit, "deus_arena_interactable_system")

	return (deus_arena_interactable_extension and deus_arena_interactable_extension:get_interact_hud_description()) or "deus_altar_hud_desc", "interaction_action_open"
end

InteractionDefinitions.deus_arena_interactable.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	if Managers.mechanism:current_mechanism_name() ~= "deus" or Managers.mechanism:game_mechanism():get_state() ~= "ingame_deus" then
		return false
	end

	local deus_arena_interactable_extension = ScriptUnit.has_extension(interactable_unit, "deus_arena_interactable_system")

	return deus_arena_interactable_extension and deus_arena_interactable_extension:can_interact()
end

InteractionDefinitions.deus_setup_rally_flag = {
	config = {
		block_other_interactions = true,
		hud_verb = "setup",
		hold = true,
		swap_to_3p = true,
		offset_flag = 0.5,
		duration = 3,
		activate_block = true
	},
	server = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			data.done_time = t + config.duration
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			if data.done_time < t then
				return InteractionResult.SUCCESS
			end

			return InteractionResult.ONGOING
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			if result == InteractionResult.SUCCESS then
				local player_position = POSITION_LOOKUP[interactor_unit]
				local player_rotation = Unit.local_rotation(interactor_unit, 0)
				local forward = Quaternion.forward(player_rotation)
				local position = player_position + forward * config.offset_flag
				local nav_world = Managers.state.entity:system("ai_system"):nav_world()
				local position_on_navmesh = nil
				local above = 1
				local below = 1
				local is_on_navmesh, altitude = GwNavQueries.triangle_from_position(nav_world, position, above, below)

				if is_on_navmesh then
					position_on_navmesh = Vector3.copy(position)
					position_on_navmesh.z = altitude
				else
					local horizontal_limit = 1
					local distance_from_nav_border = 0.05
					position_on_navmesh = GwNavQueries.inside_position_from_outside_position(nav_world, position, above, below, horizontal_limit, distance_from_nav_border) or Vector3.copy(position)
				end

				local extension_init_data = {
					buff_system = {
						breed = "n/a",
						initial_buff_names = {
							"deus_rally_flag_aoe_buff"
						}
					}
				}

				Managers.state.unit_spawner:spawn_network_unit("units/props/deus_rally_flag/deus_rally_flag", "buff_objective_unit", extension_init_data, position, player_rotation)
			end
		end,
		can_interact = function (interactor_unit, interactable_unit)
			return true
		end
	},
	client = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			data.start_time = t
			local interaction_duration_variable = Unit.animation_find_variable(interactor_unit, "interaction_duration")

			Unit.animation_set_variable(interactor_unit, interaction_duration_variable, config.duration)
			Unit.animation_event(interactor_unit, "interaction_rally_flag")

			local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")
			local wielded_slot_name = inventory_extension:get_wielded_slot_name()
			data.item_slot_name = wielded_slot_name
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			return
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			data.start_time = nil

			Unit.animation_event(interactor_unit, "interaction_end")

			local owner_player = Managers.player:unit_owner(interactor_unit)

			if not owner_player or owner_player.remote then
				return
			end

			if result == InteractionResult.SUCCESS then
				local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")
				local item_slot_name = data.item_slot_name
				local slot_data = inventory_extension:get_slot_data(item_slot_name)

				if slot_data then
					local buff_extension = ScriptUnit.extension(interactor_unit, "buff_system")
					local _, procced = buff_extension:apply_buffs_to_value(0, "not_consume_medpack")

					if procced then
						inventory_extension:wield_previous_weapon()
					else
						local ammo_extension = inventory_extension:get_item_slot_extension(item_slot_name, "ammo_system")

						ammo_extension:use_ammo(1)
					end
				end
			end
		end,
		get_progress = function (data, config, t)
			if config.duration == 0 then
				return 0
			end

			return (data.start_time == nil and 0) or math.min(1, (t - data.start_time) / config.duration)
		end,
		can_interact = function (interactor_unit, interactable_unit, data, config)
			return true
		end,
		hud_description = function (interactable_unit, data, config)
			return "deus_rally_flag", "interaction_action_deus_setup_rally_flag"
		end
	}
}
InteractionDefinitions.deus_debug_changelog = InteractionDefinitions.deus_debug_changelog or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.deus_debug_changelog.config.swap_to_3p = false

InteractionDefinitions.deus_debug_changelog.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	if result == InteractionResult.SUCCESS and not data.is_husk then
		local transition_params = {}

		Managers.state.event:trigger("ui_event_transition", "deus_debug_changelog_view", transition_params)
	end
end

InteractionDefinitions.deus_debug_changelog.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), "interaction_action_open"
end

InteractionDefinitions.deus_debug_changelog.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	return Unit.get_data(interactable_unit, "interaction_data", "active")
end

return
