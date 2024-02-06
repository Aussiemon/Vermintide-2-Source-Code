-- chunkname: @scripts/settings/dlcs/belakor/belakor_interactions.lua

local base_locus_definition = table.clone(InteractionDefinitions.smartobject)

base_locus_definition.config = {
	activate_block = true,
	animation = "interaction_start",
	block_other_interactions = true,
	hold = true,
	hud_verb = "player_interaction",
	swap_to_3p = false,
}

base_locus_definition.server.start = function (world, interactor_unit, interactable_unit, data, config, t)
	local deus_belakor_locus_extension = ScriptUnit.has_extension(interactable_unit, "deus_belakor_locus_system")

	if deus_belakor_locus_extension then
		local duration = deus_belakor_locus_extension:get_interaction_length()

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

		deus_belakor_locus_extension:on_server_start_interact(world, interactor_unit, interactable_unit, data, config, t)
	end
end

base_locus_definition.server.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	if result == InteractionResult.SUCCESS then
		local deus_belakor_locus_extension = ScriptUnit.has_extension(interactable_unit, "deus_belakor_locus_system")

		if deus_belakor_locus_extension then
			deus_belakor_locus_extension:on_server_interact(world, interactor_unit, interactable_unit, data, config, t, result)
		end
	end
end

base_locus_definition.client.start = function (world, interactor_unit, interactable_unit, data, config, t)
	local deus_belakor_locus_extension = ScriptUnit.has_extension(interactable_unit, "deus_belakor_locus_system")

	if deus_belakor_locus_extension then
		data.start_time = t

		local duration = deus_belakor_locus_extension:get_interaction_length()

		data.duration = duration

		local interactor_animation_name = config.animation
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

		if not data.is_husk and config.rotate_toward_interactable then
			local direction = Unit.local_position(interactable_unit, 0) - POSITION_LOOKUP[interactor_unit]
			local rotation = Quaternion.look(direction, Vector3.up())
			local locomotion_extension = ScriptUnit.extension(interactor_unit, "locomotion_system")

			locomotion_extension:enable_script_driven_ladder_transition_movement()
			locomotion_extension:enable_rotation_towards_velocity(false, rotation, 0.25)
		end
	end
end

base_locus_definition.client.get_progress = function (data, config, t)
	local duration = data.duration or 0

	if duration == 0 then
		return 0
	end

	return data.start_time == nil and 0 or math.min(1, (t - data.start_time) / duration)
end

base_locus_definition.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	Unit.animation_event(interactor_unit, "interaction_end")

	if result == InteractionResult.SUCCESS and not data.is_husk then
		local deus_belakor_locus_extension = ScriptUnit.has_extension(interactable_unit, "deus_belakor_locus_system")

		if deus_belakor_locus_extension then
			deus_belakor_locus_extension:on_client_interact(world, interactor_unit, interactable_unit, data, config, t, result)
		end
	end

	if not data.is_husk and config.rotate_toward_interactable then
		local locomotion_extension = ScriptUnit.extension(interactor_unit, "locomotion_system")

		locomotion_extension:enable_script_driven_movement()
		locomotion_extension:enable_rotation_towards_velocity(true)
	end
end

base_locus_definition.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	local deus_belakor_locus_extension = ScriptUnit.has_extension(interactable_unit, "deus_belakor_locus_system")

	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), fail_reason or deus_belakor_locus_extension:get_interaction_action()
end

base_locus_definition.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	if Managers.mechanism:current_mechanism_name() ~= "deus" or Managers.mechanism:game_mechanism():get_state() ~= "ingame_deus" then
		return false
	end

	local deus_belakor_locus_extension = ScriptUnit.has_extension(interactable_unit, "deus_belakor_locus_system")

	if deus_belakor_locus_extension then
		return deus_belakor_locus_extension:can_interact()
	end

	return false
end

InteractionDefinitions.deus_belakor_locus_pre_crystal = base_locus_definition
InteractionDefinitions.deus_belakor_locus_with_crystal = table.clone(base_locus_definition)

InteractionDefinitions.deus_belakor_locus_with_crystal.server.update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
	local deus_belakor_locus_extension = ScriptUnit.has_extension(interactable_unit, "deus_belakor_locus_system")

	if not deus_belakor_locus_extension or not deus_belakor_locus_extension:can_interact_validate(interactor_unit) then
		return InteractionResult.FAILURE
	end

	if t > data.done_time then
		return InteractionResult.SUCCESS
	end

	return InteractionResult.ONGOING
end

InteractionDefinitions.deus_belakor_locus_with_crystal.config.swap_to_3p = true
InteractionDefinitions.deus_belakor_locus_with_crystal.config.allow_rotation_update = true
InteractionDefinitions.deus_belakor_locus_with_crystal.config.show_weapons = true
InteractionDefinitions.deus_belakor_locus_with_crystal.config.animation = "insert_locus_crystal"
InteractionDefinitions.deus_belakor_locus_with_crystal.config.rotate_toward_interactable = true
