-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state_jumping.lua

EnemyCharacterStateJumping = class(EnemyCharacterStateJumping, EnemyCharacterState)

EnemyCharacterStateJumping.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "jumping")

	local context = character_state_init_context
end

local position_lookup = POSITION_LOOKUP

EnemyCharacterStateJumping.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	table.clear(self._temp_params)

	local player = self._player
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local locomotion_extension = self._locomotion_extension
	local inventory_extension = self._inventory_extension
	local first_person_extension = self._first_person_extension

	self._breed = Unit.get_data(unit, "breed")

	local breed = self._breed
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local jump_speed = movement_settings_table.jump.initial_vertical_speed

	if script_data.use_super_jumps then
		jump_speed = jump_speed * 2
	end

	locomotion_extension:set_maximum_upwards_velocity(jump_speed)
	locomotion_extension:force_on_ground(false)

	local velocity_current = locomotion_extension:current_velocity()
	local velocity_jump

	if params.post_dodge_jump then
		velocity_current = velocity_current * PlayerUnitMovementSettings.post_dodge_jump_velocity_scale
		jump_speed = jump_speed * PlayerUnitMovementSettings.post_dodge_jump_speed_scale
	end

	if params.backward_jump then
		velocity_current = velocity_current * PlayerUnitMovementSettings.backwards_jump_velocity_scale
	end

	local breed_multiplier = breed.movement_speed_multiplier
	local current_max_move_speed = movement_settings_table.move_speed
	local ghost_mode_extension = ScriptUnit.extension(unit, "ghost_mode_system")
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()

	if in_ghost_mode then
		current_max_move_speed = movement_settings_table.ghost_move_speed
	end

	current_max_move_speed = current_max_move_speed * breed_multiplier

	local speed_current = Vector3.length(velocity_current)

	if current_max_move_speed < speed_current then
		velocity_current = velocity_current * (current_max_move_speed / speed_current)
	end

	velocity_jump = Vector3(velocity_current.x * 0.5, velocity_current.y * 0.5, jump_speed)

	locomotion_extension:set_forced_velocity(velocity_jump)
	locomotion_extension:set_wanted_velocity(velocity_jump)

	local move_anim

	move_anim = CharacterStateHelper.has_move_input(input_extension) and "jump_fwd" or "jump_idle"

	CharacterStateHelper.play_animation_event(unit, move_anim)

	local item_template = inventory_extension:get_wielded_slot_item_template()

	self._play_fp_anim = item_template and item_template.jump_anim_enabled_1p

	if self._play_fp_anim then
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, move_anim)
	end

	first_person_extension:play_camera_effect_sequence("jump", t)
	CharacterStateHelper.ghost_mode(self._ghost_mode_extension, input_extension)
	CharacterStateHelper.look(input_extension, player.viewport_name, first_person_extension, status_extension, self._inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, self._health_extension)
	ScriptUnit.extension(unit, "whereabouts_system"):set_jumped()

	local start_jump_height = position_lookup[unit].z

	status_extension:set_falling_height(start_jump_height)
	Unit.flow_event(unit, "pactsworn_jump")
end

EnemyCharacterStateJumping.on_exit = function (self, unit, input, dt, context, t, next_state)
	if next_state == "walking" or next_state == "standing" then
		ScriptUnit.extension(unit, "whereabouts_system"):set_landed()
	elseif next_state and next_state ~= "falling" then
		ScriptUnit.extension(unit, "whereabouts_system"):set_no_landing()
	end
end

EnemyCharacterStateJumping.common_state_changes = function (self)
	self:handle_disabled_ghost_mode()

	local csm = self._csm
	local unit = self._unit
	local input_extension = self._input_extension
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local status_extension = self._status_extension
	local locomotion_extension = self._locomotion_extension
	local CharacterStateHelper = CharacterStateHelper

	if locomotion_extension:is_on_ground() then
		ScriptUnit.extension(unit, "whereabouts_system"):set_is_onground()
	end

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return true
	end

	if CharacterStateHelper.is_using_transport(status_extension) then
		csm:change_state("using_transport")

		return true
	end

	if CharacterStateHelper.is_pushed(status_extension) then
		status_extension:set_pushed(false)

		local params = movement_settings_table.stun_settings.pushed
		local hit_react_type = status_extension:hit_react_type()

		params.hit_react_type = hit_react_type .. "_push"

		csm:change_state("stunned", params)

		return true
	end

	if CharacterStateHelper.is_block_broken(status_extension) then
		status_extension:set_block_broken(false)

		local params = movement_settings_table.stun_settings.parry_broken

		params.hit_react_type = "medium_push"

		csm:change_state("stunned", params)

		return true
	end

	if locomotion_extension:is_animation_driven() then
		return true
	end

	local interactor_extension = self._interactor_extension

	if CharacterStateHelper.is_starting_interaction(input_extension, interactor_extension) then
		interactor_extension:start_interaction("interacting")

		if interactor_extension:allow_movement_during_interaction() then
			return
		end

		local config = interactor_extension:interaction_config()
		local params = self._temp_params

		params.swap_to_3p = config.swap_to_3p
		params.show_weapons = config.show_weapons
		params.activate_block = config.activate_block
		params.allow_rotation_update = config.allow_rotation_update

		csm:change_state("interacting", params)

		return true
	end

	if not csm.state_next and status_extension.do_leap then
		csm:change_state("leaping")

		return true
	end

	if input_extension:get("character_inspecting") then
		local _, right_hand_weapon_extension, left_hand_weapon_extension = CharacterStateHelper.get_item_data_and_weapon_extensions(self._inventory_extension)
		local current_action_settings = CharacterStateHelper.get_current_action_data(left_hand_weapon_extension, right_hand_weapon_extension)

		if not current_action_settings then
			csm:change_state("inspecting")

			return true
		end
	end

	return false
end

EnemyCharacterStateJumping.common_movement = function (self, in_ghost_mode, dt, unit)
	local csm = self._csm
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension
	local locomotion_extension = self._locomotion_extension
	local breed = self._breed

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
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

	if locomotion_extension:is_on_ground() then
		csm:change_state("walking")
		first_person_extension:change_state("walking")

		return
	end

	if not csm.state_next and locomotion_extension:current_velocity().z <= 0 then
		csm:change_state("falling", self._temp_params)
		first_person_extension:change_state("falling")

		return
	end

	local breed_multiplier = breed.movement_speed_multiplier
	local current_max_move_speed = movement_settings_table.move_speed

	if in_ghost_mode then
		current_max_move_speed = movement_settings_table.ghost_move_speed
	end

	current_max_move_speed = current_max_move_speed * breed_multiplier

	local buffed_move_speed = self._buff_extension:apply_buffs_to_value(current_max_move_speed, "movement_speed")
	local final_move_speed = buffed_move_speed * movement_settings_table.player_speed_scale

	CharacterStateHelper.move_in_air_pactsworn(self._first_person_extension, input_extension, self._locomotion_extension, final_move_speed, unit)
	CharacterStateHelper.ghost_mode(self._ghost_mode_extension, input_extension)
	CharacterStateHelper.look(input_extension, self._player.viewport_name, self._first_person_extension, status_extension, self._inventory_extension)
end

EnemyCharacterStateJumping.update = function (self, unit, input, dt, context, t)
	local handled = self:common_state_changes()

	if handled then
		return
	end

	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()

	handled = self:common_movement(in_ghost_mode, dt, unit)
end
