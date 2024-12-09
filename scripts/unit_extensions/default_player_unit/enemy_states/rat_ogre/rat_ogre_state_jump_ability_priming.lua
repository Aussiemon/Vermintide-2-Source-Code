-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/rat_ogre/rat_ogre_state_jump_ability_priming.lua

RatOgreStateJumpAbilityPriming = class(RatOgreStateJumpAbilityPriming, EnemyCharacterState)

RatOgreStateJumpAbilityPriming.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "ogre_jump_priming")

	self.wherabouts_extension = ScriptUnit.extension(self._unit, "whereabouts_system")
	self.current_movement_speed_scale = 0
	self.last_input_direction = Vector3Box(0, 0, 0)
end

RatOgreStateJumpAbilityPriming.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	self._locomotion_extension:set_forced_velocity(Vector3.zero())
	print("entered jump priming ")
end

RatOgreStateJumpAbilityPriming.on_exit = function (self, unit, input, dt, context, t, previous_state, params)
	print("on_exit")
end

RatOgreStateJumpAbilityPriming.update = function (self, unit, input, dt, context, t)
	local input_extension = self._input_extension
	local csm = self._csm
	local ability_id = self._career_extension:ability_id("ogre_jump")
	local ability_data = self._career_extension:get_activated_ability_data(ability_id)
	local cancel_input = input_extension:get("action_one") or input_extension:get("jump") or input_extension:get("jump_only") or input_extension:get("weapon_reload") or input_extension:get("action_two_release")

	if not ability_data.is_priming or cancel_input then
		csm:change_state("standing")
	end

	self:_update_movement(unit, t, dt)
	CharacterStateHelper.look(self._input_extension, self._player.viewport_name, self._first_person_extension, self._status_extension, self._inventory_extension)
end

RatOgreStateJumpAbilityPriming.common_state_changes = function (self)
	self:handle_disabled_ghost_mode()

	local csm = self._csm
	local unit = self._unit
	local input_extension = self._input_extension
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local status_extension = self._status_extension
	local locomotion_extension = self._locomotion_extension
	local CharacterStateHelper = CharacterStateHelper
	local first_person_extension = self._first_person_extension
	local inventory_extension = self._inventory_extension
	local career_data = self._career_extension:career_settings()

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

	local input_extension = self._input_extension

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

RatOgreStateJumpAbilityPriming._update_movement = function (self, unit, t, dt, progress)
	local input_extension = self._input_extension
	local buff_extension = self._buff_extension
	local first_person_extension = self._first_person_extension
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local move_input = CharacterStateHelper.get_movement_input(input_extension)
	local is_moving = CharacterStateHelper.has_move_input(input_extension)
	local current_movement_speed_scale = self.current_movement_speed_scale

	if not self.is_bot then
		local move_acceleration_up_dt = movement_settings_table.move_acceleration_up * dt
		local move_acceleration_down_dt = movement_settings_table.move_acceleration_down * dt

		if is_moving then
			current_movement_speed_scale = math.min(1, current_movement_speed_scale + move_acceleration_up_dt)
		else
			current_movement_speed_scale = math.max(0, current_movement_speed_scale - move_acceleration_down_dt)
		end
	else
		current_movement_speed_scale = is_moving and 1 or 0
	end

	local priming_move_speed = 1
	local movement_speed = math.lerp(0.6, priming_move_speed, (progress or 1)^2)
	local current_max_move_speed = movement_speed
	local buffed_move_speed = buff_extension:apply_buffs_to_value(current_max_move_speed, "movement_speed")
	local final_move_speed = buffed_move_speed * current_movement_speed_scale * movement_settings_table.player_speed_scale
	local movement = Vector3(0, 0, 0)

	if move_input then
		movement = movement + move_input
	end

	local move_input_direction

	move_input_direction = Vector3.normalize(movement)

	if Vector3.length(move_input_direction) == 0 then
		move_input_direction = self.last_input_direction:unbox()
	else
		self.last_input_direction:store(move_input_direction)
	end

	local move_anim_3p, move_anim_1p = CharacterStateHelper.get_move_animation(self._locomotion_extension, input_extension, self._status_extension, self.move_anim_3p)

	if move_anim_3p ~= self.move_anim_3p then
		CharacterStateHelper.play_animation_event(unit, move_anim_3p)

		self.move_anim_3p = move_anim_3p
	end

	if move_anim_1p ~= self.move_anim_1p then
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, move_anim_1p)

		self.move_anim_1p = move_anim_1p
	end

	if self._previous_state == "jumping" or self._previous_state == "falling" then
		CharacterStateHelper.move_in_air_pactsworn(self._first_person_extension, input_extension, self._locomotion_extension, final_move_speed, unit)
	else
		CharacterStateHelper.move_on_ground(first_person_extension, input_extension, self._locomotion_extension, move_input_direction, final_move_speed, unit)
	end

	self.current_movement_speed_scale = current_movement_speed_scale
end
