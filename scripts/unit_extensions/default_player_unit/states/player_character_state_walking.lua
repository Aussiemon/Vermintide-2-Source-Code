﻿-- chunkname: @scripts/unit_extensions/default_player_unit/states/player_character_state_walking.lua

PlayerCharacterStateWalking = class(PlayerCharacterStateWalking, PlayerCharacterState)

PlayerCharacterStateWalking.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "walking")

	self.current_movement_speed_scale = 0
	self.latest_valid_navmesh_position = Vector3Box(math.huge, math.huge, math.huge)
	self.last_input_direction = Vector3Box(0, 0, 0)
end

PlayerCharacterStateWalking.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local input_extension = self.input_extension
	local first_person_extension = self.first_person_extension
	local status_extension = self.status_extension
	local inventory_extension = self.inventory_extension
	local health_extension = self.health_extension
	local locomotion_extension = self.locomotion_extension
	local current_velocity = locomotion_extension:current_velocity()
	local player = Managers.player:owner(unit)
	local is_bot = player and player.bot_player

	if previous_state == "standing" then
		self.current_movement_speed_scale = 0
	elseif not script_data.disable_nice_movement then
		local current_speed = Vector3.length(current_velocity)
		local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)

		self.current_movement_speed_scale = math.min(current_speed / movement_settings_table.move_speed, 1)
	else
		self.current_movement_speed_scale = 1
	end

	if not is_bot then
		local dir = Vector3.normalize(Vector3.flat(current_velocity))
		local look_rot = first_person_extension:current_rotation()
		local x = Vector3.dot(Quaternion.right(look_rot), dir)
		local y = Vector3.dot(Vector3.normalize(Vector3.flat(Quaternion.forward(look_rot))), dir)
		local local_move_vector = Vector3(x, y, 0)

		self.last_input_direction:store(local_move_vector)
	end

	local move_anim_3p, move_anim_1p = CharacterStateHelper.get_move_animation(self.locomotion_extension, input_extension, status_extension)

	self.move_anim_3p = move_anim_3p
	self.move_anim_1p = move_anim_1p

	CharacterStateHelper.play_animation_event(unit, move_anim_3p)
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, move_anim_1p)
	CharacterStateHelper.look(input_extension, self.player.viewport_name, first_person_extension, status_extension, inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, health_extension)

	self.walking = false
	self.is_bot = is_bot
end

PlayerCharacterStateWalking.on_exit = function (self, unit, input, dt, context, t, next_state)
	local first_person_extension = self.first_person_extension

	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "idle")
end

PlayerCharacterStateWalking._handle_ladder_collision = function (self, t, movement_settings_table)
	local unit = self.unit
	local status_extension = self.status_extension
	local first_person_extension = self.first_person_extension
	local locomotion_extension = self.locomotion_extension
	local colliding_with_ladder, ladder_unit = CharacterStateHelper.is_colliding_with_gameplay_collision_box(self.world, unit, "filter_ladder_collision")
	local looking_up = CharacterStateHelper.looking_up(first_person_extension, movement_settings_table.ladder.looking_up_threshold)
	local recently_left_ladder = CharacterStateHelper.recently_left_ladder(status_extension, t)

	if colliding_with_ladder then
		local above_align_cube = false
		local ladder_rot = Unit.local_rotation(ladder_unit, 0)
		local ladder_plane_inv_normal = Quaternion.forward(ladder_rot)
		local ladder_offset = Unit.local_position(ladder_unit, 0) - POSITION_LOOKUP[unit]
		local distance = Vector3.dot(ladder_plane_inv_normal, ladder_offset)
		local facing_correctly = false
		local close_enough = false
		local ladder_forward = Quaternion.forward(Unit.local_rotation(ladder_unit, 0))
		local facing = Quaternion.forward(first_person_extension:current_rotation())
		local facing_ladder = Vector3.dot(facing, ladder_forward) < 0
		local movement_in_ladder_direction = Vector3.dot(locomotion_extension.velocity_current:unbox(), ladder_forward)
		local top_node = Unit.node(ladder_unit, "c_platform")

		if POSITION_LOOKUP[unit].z > Vector3.z(Unit.world_position(ladder_unit, top_node)) then
			local looking_down = not looking_up

			if looking_down and facing_ladder and movement_in_ladder_direction < 0 then
				close_enough = distance > 0.5
				facing_correctly = true
			elseif looking_down and distance > 0 and not facing_ladder and movement_in_ladder_direction > 0.5 then
				close_enough = distance > 0.25
				facing_correctly = true
			end

			above_align_cube = true
		else
			local epsilon = 0.02

			close_enough = distance < 0.7 + epsilon and distance > 0
			facing_correctly = looking_up and not facing_ladder and movement_in_ladder_direction > 0
		end

		if facing_correctly and not recently_left_ladder and close_enough then
			local params = self.temp_params

			params.ladder_unit = ladder_unit

			if above_align_cube then
				return "enter_ladder_top"
			else
				return "climbing_ladder"
			end
		end
	end
end

PlayerCharacterStateWalking.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local world = self.world
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local input_extension = self.input_extension
	local status_extension = self.status_extension
	local first_person_extension = self.first_person_extension
	local locomotion_extension = self.locomotion_extension
	local health_extension = self.health_extension
	local inventory_extension = self.inventory_extension
	local interactor_extension = self.interactor_extension
	local buff_extension = self.buff_extension
	local current_movement_speed_scale = self.current_movement_speed_scale
	local CharacterStateHelper = CharacterStateHelper

	if locomotion_extension:is_on_ground() then
		ScriptUnit.extension(unit, "whereabouts_system"):set_is_onground()
	end

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return
	end

	if CharacterStateHelper.is_ledge_hanging(world, unit, self.temp_params) and not CharacterStateHelper.handle_bot_ledge_hanging_failsafe(unit, self.is_bot) then
		csm:change_state("ledge_hanging", self.temp_params)

		return
	end

	if CharacterStateHelper.is_overcharge_exploding(status_extension) then
		csm:change_state("overcharge_exploding")

		return
	end

	if CharacterStateHelper.is_using_transport(status_extension) then
		csm:change_state("using_transport")

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

	if locomotion_extension:is_animation_driven() then
		return
	end

	if not csm.state_next and status_extension.do_leap then
		csm:change_state("leaping")

		return
	end

	CharacterStateHelper.update_dodge_lock(unit, input_extension, status_extension)

	local start_dodge, dodge_direction = CharacterStateHelper.check_to_start_dodge(unit, input_extension, status_extension, t)

	if start_dodge then
		local params = self.temp_params

		params.dodge_direction = dodge_direction

		csm:change_state("dodging", params)

		return
	end

	local gamepad_active = Managers.input:is_device_active("gamepad")
	local is_crouching = status_extension:is_crouching()

	if not csm.state_next and (input_extension:get("jump") or input_extension:get("jump_only")) and (not is_crouching or CharacterStateHelper.can_uncrouch(unit)) and locomotion_extension:jump_allowed() then
		local movement_input = CharacterStateHelper.get_movement_input(input_extension)

		if is_crouching then
			CharacterStateHelper.uncrouch(unit, t, first_person_extension, status_extension)
		end

		if not input_extension:get("jump") and not gamepad_active or status_extension:can_override_dodge_with_jump(t) or Vector3.y(movement_input) >= 0 or Vector3.length(movement_input) <= input_extension.minimum_dodge_input then
			if Vector3.y(CharacterStateHelper.get_movement_input(input_extension)) < 0 then
				self.temp_params.backward_jump = true
			else
				self.temp_params.backward_jump = false
			end

			csm:change_state("jumping", self.temp_params)
			first_person_extension:change_state("jumping")

			return
		end
	end

	local is_moving = CharacterStateHelper.has_move_input(input_extension)

	if not csm.state_next and not is_moving and current_movement_speed_scale == 0 then
		local params = self.temp_params

		csm:change_state("standing", params)
		first_person_extension:change_state("standing")

		return
	end

	if not csm.state_next and not locomotion_extension:is_on_ground() then
		csm:change_state("falling", self.temp_params)
		first_person_extension:change_state("falling")

		return
	end

	local new_state = self:_handle_ladder_collision(t, movement_settings_table)

	if not csm.state_next and new_state then
		csm:change_state(new_state, self.temp_params)

		return
	end

	local toggle_crouch = input_extension.toggle_crouch

	CharacterStateHelper.check_crouch(unit, input_extension, status_extension, toggle_crouch, first_person_extension, t)

	local move_input = CharacterStateHelper.get_movement_input(input_extension)

	if not self.is_bot then
		local move_acceleration_up_dt = movement_settings_table.move_acceleration_up * dt
		local move_acceleration_down_dt = movement_settings_table.move_acceleration_down * dt

		if is_moving then
			current_movement_speed_scale = math.min(1, current_movement_speed_scale + move_acceleration_up_dt)

			if gamepad_active then
				current_movement_speed_scale = Vector3.length(move_input) * current_movement_speed_scale
			end
		else
			current_movement_speed_scale = math.max(0, current_movement_speed_scale - move_acceleration_down_dt)
		end
	else
		current_movement_speed_scale = is_moving and 1 or 0
	end

	local is_walking = input_extension:get("walk")

	is_crouching = status_extension:is_crouching()

	if is_walking ~= self.walking then
		status_extension:set_slowed(is_walking)
	end

	local current_max_move_speed = is_crouching and movement_settings_table.crouch_move_speed or is_walking and movement_settings_table.walk_move_speed or movement_settings_table.move_speed
	local move_speed_multiplier = status_extension:current_move_speed_multiplier()
	local final_move_speed = current_max_move_speed * move_speed_multiplier * current_movement_speed_scale * movement_settings_table.player_speed_scale
	local has_intoxication_stagger = buff_extension:has_buff_perk("intoxication_stagger")
	local has_drunk_stagger = buff_extension:has_buff_perk("drunk_stagger")
	local has_hungover_stagger = buff_extension:has_buff_perk("hungover_stagger")

	if has_intoxication_stagger or has_drunk_stagger or has_hungover_stagger then
		local intoxication_level = math.abs(status_extension:intoxication_level())
		local do_intoxication_stagger = has_intoxication_stagger and math.random() > 0.6 / intoxication_level
		local do_drunk_stagger = has_drunk_stagger and math.random() > 0.9 / intoxication_level
		local do_hungover_stagger = has_hungover_stagger
		local do_stagger = do_intoxication_stagger or do_drunk_stagger or do_hungover_stagger

		if not self._is_in_intoxication_stagger_cooldown and not self._is_intoxication_stagger and do_stagger then
			self._is_intoxication_stagger = true
			self._intoxication_stagger_start = t
			self._intoxication_stagger_duration = math.random() * 1.5 + math.random() * 0.5
			self._intoxication_stagger_time = self._intoxication_stagger_start + self._intoxication_stagger_duration

			local current_velocity = locomotion_extension:current_velocity()
			local current_dir = Vector3.normalize(current_velocity)
			local perpendicular_dir = Vector3.cross(current_dir, Vector3.up())
			local stagger_dir = math.sin(t * (math.pi * 0.5)) * math.sign(math.random() * 2 - 1) * perpendicular_dir

			self._intoxication_stagger_dir = Vector3Box(stagger_dir)
		end

		if self._is_intoxication_stagger and t <= self._intoxication_stagger_time then
			local time_left_in_intoxication_stagger = self._intoxication_stagger_time - t
			local time_in_intoxication_stagger = self._intoxication_stagger_duration - time_left_in_intoxication_stagger
			local percentage = time_in_intoxication_stagger / self._intoxication_stagger_duration
			local modified_dir = Vector3.lerp(move_input, self._intoxication_stagger_dir:unbox(), percentage)

			move_input = move_input + modified_dir

			if percentage < 0.5 then
				final_move_speed = math.lerp(final_move_speed, final_move_speed * 0.75, math.sin(percentage * 2 * math.pi * 0.5))
			else
				final_move_speed = math.lerp(final_move_speed * 0.75, final_move_speed, math.sin(percentage * 2 * math.pi * 0.5))
			end
		elseif self._is_intoxication_stagger and t > self._intoxication_stagger_time then
			self._is_intoxication_stagger = nil
			self._is_in_intoxication_stagger_cooldown = true
			self._intoxication_stagger_cooldown_time = t + math.random() * (1 / math.abs(intoxication_level))
		end

		if self._is_in_intoxication_stagger_cooldown and t > self._intoxication_stagger_cooldown_time then
			self._is_in_intoxication_stagger_cooldown = nil
			self._intoxication_stagger_cooldown_time = nil
		end
	end

	local move_input_direction = Vector3.normalize(move_input)

	if Vector3.length_squared(move_input) == 0 then
		move_input_direction = self.last_input_direction:unbox()
	else
		self.last_input_direction:store(move_input_direction)
	end

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

	if self.cosmetic_extension:get_queued_3p_emote() then
		local _, right_hand_weapon_extension, left_hand_weapon_extension = CharacterStateHelper.get_item_data_and_weapon_extensions(self.inventory_extension)
		local current_action_settings = CharacterStateHelper.get_current_action_data(left_hand_weapon_extension, right_hand_weapon_extension)

		if not current_action_settings then
			csm:change_state("emote")

			return
		end
	end

	CharacterStateHelper.move_on_ground(first_person_extension, input_extension, locomotion_extension, move_input_direction, final_move_speed, unit)
	CharacterStateHelper.look(input_extension, self.player.viewport_name, first_person_extension, status_extension, inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, health_extension)

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

	local move_anim_3p, move_anim_1p = CharacterStateHelper.get_move_animation(locomotion_extension, input_extension, status_extension)

	if move_anim_1p ~= self.move_anim_1p then
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, move_anim_1p)

		self.move_anim_1p = move_anim_1p
	end

	if move_anim_3p ~= self.move_anim_3p then
		CharacterStateHelper.play_animation_event(unit, move_anim_3p)

		self.move_anim_3p = move_anim_3p
	end

	self.current_movement_speed_scale = current_movement_speed_scale
	self.walking = is_walking
end
