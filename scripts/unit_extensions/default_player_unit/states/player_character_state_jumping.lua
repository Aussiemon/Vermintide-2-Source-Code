PlayerCharacterStateJumping = class(PlayerCharacterStateJumping, PlayerCharacterState)

PlayerCharacterStateJumping.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "jumping")

	local context = character_state_init_context
end

local position_lookup = POSITION_LOOKUP

PlayerCharacterStateJumping.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	table.clear(self.temp_params)

	local player = self.player
	local input_extension = self.input_extension
	local status_extension = self.status_extension
	local locomotion_extension = self.locomotion_extension
	local inventory_extension = self.inventory_extension
	local first_person_extension = self.first_person_extension
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local jump_speed = movement_settings_table.jump.initial_vertical_speed

	if script_data.use_super_jumps then
		jump_speed = jump_speed * 2
	end

	locomotion_extension:set_maximum_upwards_velocity(jump_speed)
	locomotion_extension:force_on_ground(false)

	local velocity_current = locomotion_extension:current_velocity()
	local velocity_jump = nil

	if params.post_dodge_jump then
		velocity_current = velocity_current * PlayerUnitMovementSettings.post_dodge_jump_velocity_scale
		jump_speed = jump_speed * PlayerUnitMovementSettings.post_dodge_jump_speed_scale
	end

	if params.backward_jump then
		velocity_current = velocity_current * PlayerUnitMovementSettings.backwards_jump_velocity_scale
	end

	local speed_current = Vector3.length(velocity_current)

	if PlayerUnitMovementSettings.move_speed < speed_current then
		velocity_current = velocity_current * PlayerUnitMovementSettings.move_speed / speed_current
	end

	if previous_state == "climbing_ladder" then
		local ladder_unit = params.ladder_unit
		local ladder_rotation = Unit.world_rotation(ladder_unit, 0)
		local direction = Quaternion.forward(ladder_rotation)
		velocity_jump = direction * movement_settings_table.ladder.jump_backwards_force
		self.temp_params.ladder_shaking = params.ladder_shaking
	else
		velocity_jump = Vector3(velocity_current.x, velocity_current.y, jump_speed)
	end

	locomotion_extension:set_forced_velocity(velocity_jump)
	locomotion_extension:set_wanted_velocity(velocity_jump)

	local move_anim = nil
	local item_template = inventory_extension:get_wielded_slot_item_template()
	self._play_fp_anim = item_template and item_template.jump_anim_enabled_1p

	if CharacterStateHelper.has_move_input(input_extension) then
		move_anim = "jump_fwd"
	else
		move_anim = "jump_idle"
	end

	CharacterStateHelper.play_animation_event(unit, move_anim)

	if self._play_fp_anim then
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, move_anim)
	end

	first_person_extension:play_camera_effect_sequence("jump", t)
	CharacterStateHelper.look(input_extension, player.viewport_name, first_person_extension, status_extension, self.inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, self.health_extension)

	local position = POSITION_LOOKUP[unit]

	Managers.telemetry.events:player_jumped(player, position)
	ScriptUnit.extension(unit, "whereabouts_system"):set_jumped()

	local start_jump_height = position_lookup[unit].z
	local status_extension = self.status_extension

	status_extension:set_falling_height(start_jump_height)
	Unit.flow_event(unit, "sfx_player_jump")
end

PlayerCharacterStateJumping.on_exit = function (self, unit, input, dt, context, t, next_state)
	local input_extension = self.input_extension

	self.locomotion_extension:reset_maximum_upwards_velocity()

	if next_state == "walking" or next_state == "standing" then
		ScriptUnit.extension(unit, "whereabouts_system"):set_landed()
	elseif next_state and next_state ~= "falling" then
		ScriptUnit.extension(unit, "whereabouts_system"):set_no_landing()
	end

	if next_state and next_state ~= "falling" and Managers.state.network:game() then
		CharacterStateHelper.play_animation_event(unit, "land_still")
		CharacterStateHelper.play_animation_event(unit, "to_onground")

		if self._play_fp_anim then
			CharacterStateHelper.play_animation_event_first_person(self.first_person_extension, "to_onground")
		end
	end
end

PlayerCharacterStateJumping.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local input_extension = self.input_extension
	local status_extension = self.status_extension
	local first_person_extension = self.first_person_extension
	local locomotion_extension = self.locomotion_extension

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return
	end

	if CharacterStateHelper.is_overcharge_exploding(status_extension) then
		csm:change_state("overcharge_exploding")

		return
	end

	if CharacterStateHelper.is_pushed(status_extension) then
		status_extension:set_pushed(false)

		local params = movement_settings_table.stun_settings.pushed
		local hit_react_type = status_extension:hit_react_type()
		params.hit_react_type = hit_react_type .. "_push"

		csm:change_state("stunned", params)

		return
	end

	if CharacterStateHelper.is_charged(status_extension) then
		local params = movement_settings_table.charged_settings.charged
		params.hit_react_type = "charged"

		csm:change_state("charged", params)

		return
	end

	if CharacterStateHelper.is_block_broken(status_extension) then
		status_extension:set_block_broken(false)

		local params = movement_settings_table.stun_settings.parry_broken
		params.hit_react_type = "medium_push"

		csm:change_state("stunned", params)

		return
	end

	if locomotion_extension:is_on_ground() then
		csm:change_state("walking")
		first_person_extension:change_state("walking")

		return
	end

	if not csm.state_next and locomotion_extension:current_velocity().z <= 0 then
		csm:change_state("falling", self.temp_params)
		first_person_extension:change_state("falling")

		return
	end

	local inventory_extension = self.inventory_extension
	local move_speed = math.clamp(movement_settings_table.move_speed, 0, PlayerUnitMovementSettings.move_speed)
	local move_speed_multiplier = status_extension:current_move_speed_multiplier()
	move_speed = move_speed * move_speed_multiplier
	move_speed = move_speed * movement_settings_table.player_speed_scale
	move_speed = move_speed * movement_settings_table.player_air_speed_scale

	CharacterStateHelper.move_in_air(self.first_person_extension, input_extension, self.locomotion_extension, move_speed, unit)
	CharacterStateHelper.look(input_extension, self.player.viewport_name, self.first_person_extension, status_extension, self.inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, self.health_extension)

	local interactor_extension = self.interactor_extension

	if CharacterStateHelper.is_starting_interaction(input_extension, interactor_extension) then
		interactor_extension:start_interaction("interacting")

		if interactor_extension:allow_movement_during_interaction() then
			return
		end

		local config = interactor_extension:interaction_config()
		local params = self.temp_params
		params.swap_to_3p = config.swap_to_3p
		params.show_weapons = config.show_weapons
		params.activate_block = config.activate_block
		params.allow_rotation_update = config.allow_rotation_update

		csm:change_state("interacting", params)

		return
	end

	if CharacterStateHelper.is_interacting(interactor_extension) then
		if interactor_extension:allow_movement_during_interaction() then
			return
		end

		local config = interactor_extension:interaction_config()
		local params = self.temp_params
		params.swap_to_3p = config.swap_to_3p
		params.show_weapons = config.show_weapons
		params.activate_block = config.activate_block
		params.allow_rotation_update = config.allow_rotation_update

		csm:change_state("interacting", params)

		return
	end
end

return
