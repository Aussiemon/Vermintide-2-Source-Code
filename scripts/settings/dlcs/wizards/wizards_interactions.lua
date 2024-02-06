-- chunkname: @scripts/settings/dlcs/wizards/wizards_interactions.lua

local base_trail_light_urn_definition = table.clone(InteractionDefinitions.smartobject)

base_trail_light_urn_definition.config = {
	activate_block = true,
	allow_rotation_update = false,
	animation = "interaction_torch",
	block_other_interactions = true,
	hold = true,
	hud_verb = "player_interaction",
	rotate_toward_interactable = true,
	show_weapons = true,
	swap_to_3p = true,
}
InteractionDefinitions.trail_light_urn = base_trail_light_urn_definition

base_trail_light_urn_definition.server.start = function (world, interactor_unit, interactable_unit, data, config, t)
	local duration = Unit.get_data(interactable_unit, "interaction_data", "interaction_length")

	data.done_time = t + duration
	data.duration = duration
end

base_trail_light_urn_definition.client.start = function (world, interactor_unit, interactable_unit, data, config, t)
	local trail_urn_alignment_extension = ScriptUnit.extension(interactable_unit, "trail_urn_alignment_system")

	trail_urn_alignment_extension:on_client_start_interaction(interactor_unit, t)

	data.start_time = t

	local duration = Unit.get_data(interactable_unit, "interaction_data", "interaction_length")

	data.duration = duration

	local interactor_animation_name = Unit.get_data(interactable_unit, "interaction_data", "interactor_animation")
	local interactor_animation_time_variable = Unit.get_data(interactable_unit, "interaction_data", "interactor_animation_time_variable")
	local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")
	local career_extension = ScriptUnit.extension(interactor_unit, "career_system")

	CharacterStateHelper.stop_weapon_actions(inventory_extension, "interacting")
	CharacterStateHelper.stop_career_abilities(career_extension, "interacting")

	if interactor_animation_name then
		local interactor_animation_time_variable = Unit.animation_find_variable(interactor_unit, interactor_animation_time_variable)

		Unit.animation_set_variable(interactor_unit, interactor_animation_time_variable, duration)

		local interactor_animation_name = Unit.get_data(interactable_unit, "interaction_data", "interactor_animation")

		Unit.animation_event(interactor_unit, interactor_animation_name)
	end

	Unit.set_data(interactable_unit, "interaction_data", "being_used", true)
end

base_trail_light_urn_definition.server.update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
	local status_extension = ScriptUnit.extension(interactor_unit, "status_system")

	if status_extension:is_knocked_down() or not HEALTH_ALIVE[interactor_unit] then
		return InteractionResult.FAILURE
	end

	local trail_urn_alignment_extension = ScriptUnit.extension(interactable_unit, "trail_urn_alignment_system")

	if trail_urn_alignment_extension:is_state_aligned() and trail_urn_alignment_extension:is_unit_pushed_out_off_range(interactor_unit, interactable_unit) then
		return InteractionResult.FAILURE
	end

	if t > data.done_time then
		return InteractionResult.SUCCESS
	end

	return InteractionResult.ONGOING
end

base_trail_light_urn_definition.client.update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
	local trail_urn_alignment_extension = ScriptUnit.extension(interactable_unit, "trail_urn_alignment_system")

	trail_urn_alignment_extension:on_client_move_to_node(interactor_unit, interactable_unit, data.is_husk, t)
end

base_trail_light_urn_definition.server.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	if result == InteractionResult.SUCCESS then
		local interactable_system = ScriptUnit.extension(interactable_unit, "interactable_system")

		interactable_system.num_times_successfully_completed = interactable_system.num_times_successfully_completed + 1

		if Unit.get_data(interactable_unit, "interaction_data", "only_once") then
			Unit.set_data(interactable_unit, "interaction_data", "used", true)
		end
	end

	Unit.set_data(interactable_unit, "interaction_data", "being_used", false)
end

local function remove_torch(interactor_unit)
	local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")

	inventory_extension:destroy_slot("slot_level_event")
	inventory_extension:wield_previous_weapon()
end

base_trail_light_urn_definition.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	Unit.animation_event(interactor_unit, "interaction_end")

	if result == InteractionResult.SUCCESS then
		if Unit.get_data(interactable_unit, "interaction_data", "only_once") then
			Unit.set_data(interactable_unit, "interaction_data", "used", true)
		end

		if not data.is_husk then
			remove_torch(interactor_unit)
		end
	end

	if not data.is_husk and config.rotate_toward_interactable then
		local locomotion_extension = ScriptUnit.extension(interactor_unit, "locomotion_system")

		locomotion_extension:enable_script_driven_movement()
		locomotion_extension:enable_rotation_towards_velocity(true)
	end

	local trail_urn_alignment_extension = ScriptUnit.extension(interactable_unit, "trail_urn_alignment_system")

	trail_urn_alignment_extension:on_client_stop(result)
	Unit.set_data(interactable_unit, "interaction_data", "being_used", false)
end

base_trail_light_urn_definition.server.can_interact = function (interactor_unit, interactable_unit, data, config)
	local used = Unit.get_data(interactable_unit, "interaction_data", "used")
	local being_used = Unit.get_data(interactable_unit, "interaction_data", "being_used")

	if used or being_used then
		return not used and not being_used
	end

	local inventory_extension = ScriptUnit.has_extension(interactor_unit, "inventory_system")

	if not inventory_extension and not inventory_extension:has_inventory_item("slot_level_event", "shadow_torch") then
		return false
	end

	local custom_interaction_check_name = Unit.get_data(interactable_unit, "interaction_data", "custom_interaction_check_name")

	if custom_interaction_check_name then
		local interaction_custom_check_func = InteractionCustomChecks[custom_interaction_check_name]

		if interaction_custom_check_func and not InteractionCustomChecks[custom_interaction_check_name](interactor_unit, interactable_unit) then
			return false
		end
	end

	return not used and not being_used
end

base_trail_light_urn_definition.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	local trail_urn_alignment_extension = ScriptUnit.extension(interactable_unit, "trail_urn_alignment_system")

	if not trail_urn_alignment_extension:can_interact() then
		return false
	end

	local inventory_extension = ScriptUnit.has_extension(interactor_unit, "inventory_system")

	if inventory_extension == nil or not inventory_extension:has_inventory_item("slot_level_event", "shadow_torch") then
		return false
	end

	local used = Unit.get_data(interactable_unit, "interaction_data", "used")
	local being_used = Unit.get_data(interactable_unit, "interaction_data", "being_used")

	if used or being_used then
		return not used and not being_used
	end

	local custom_interaction_check_name = Unit.get_data(interactable_unit, "interaction_data", "custom_interaction_check_name")

	if custom_interaction_check_name then
		local interaction_custom_check_func = InteractionCustomChecks[custom_interaction_check_name]

		if interaction_custom_check_func and not InteractionCustomChecks[custom_interaction_check_name](interactor_unit, interactable_unit) then
			return false
		end
	end

	return not used and not being_used
end
