PlayerCharacterStateWalking = class(PlayerCharacterStateWalking, PlayerCharacterState)
PlayerCharacterStateWalking.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "walking")

	local context = character_state_init_context
	self.current_movement_speed_scale = 0
	self.latest_valid_navmesh_position = Vector3Box(math.huge, math.huge, math.huge)
	self.last_input_direction = Vector3Box(0, 0, 0)

	return 
end
PlayerCharacterStateWalking.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local unit = self.unit
	local input_extension = self.input_extension
	local first_person_extension = self.first_person_extension
	local status_extension = self.status_extension
	local inventory_extension = self.inventory_extension
	local health_extension = self.health_extension
	local locomotion_extension = self.locomotion_extension
	local current_velocity = locomotion_extension.current_velocity(locomotion_extension)
	local player = Managers.player:owner(unit)
	local is_bot = player and player.bot_player

	if previous_state == "standing" then
		self.current_movement_speed_scale = 0
	elseif not script_data.disable_nice_movement then
		local current_speed = Vector3.length(current_velocity)
		local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
		self.current_movement_speed_scale = math.min(current_speed/movement_settings_table.move_speed, 1)
	else
		self.current_movement_speed_scale = 1
	end

	if not is_bot then
		local dir = Vector3.normalize(Vector3.flat(current_velocity))
		local look_rot = first_person_extension.current_rotation(first_person_extension)
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

	return 
end
PlayerCharacterStateWalking.on_exit = function (self, unit, input, dt, context, t, next_state)
	return 
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
		local facing = Quaternion.forward(first_person_extension.current_rotation(first_person_extension))
		local facing_ladder = Vector3.dot(facing, ladder_forward) < 0
		local movement_in_ladder_direction = Vector3.dot(locomotion_extension.velocity_current:unbox(), ladder_forward)
		local top_node = Unit.node(ladder_unit, "c_platform")

		if Vector3.z(Unit.world_position(ladder_unit, top_node)) < POSITION_LOOKUP[unit].z then
			local player = Managers.player:owner(unit)
			local is_bot = player and player.bot_player
			local threshold = (is_bot and movement_settings_table.ladder.bot_looking_down_threshold) or movement_settings_table.ladder.looking_down_threshold
			local looking_down = not looking_up

			if looking_down and facing_ladder and movement_in_ladder_direction < 0 then
				close_enough = 0.5 < distance
				facing_correctly = true
			elseif looking_down and 0 < distance and not facing_ladder and 0.5 < movement_in_ladder_direction then
				close_enough = 0.25 < distance
				facing_correctly = true
			end

			above_align_cube = true
		else
			local epsilon = 0.02
			close_enough = distance < epsilon + 0.7 and 0 < distance
			facing_correctly = looking_up and not facing_ladder and 0 < movement_in_ladder_direction
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

	return 
end
PlayerCharacterStateWalking.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local world = self.world
	local unit = self.unit
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local input_extension = self.input_extension
	local status_extension = self.status_extension
	local first_person_extension = self.first_person_extension
	local locomotion_extension = self.locomotion_extension
	local health_extension = self.health_extension
	local inventory_extension = self.inventory_extension
	local interactor_extension = self.interactor_extension
	local current_movement_speed_scale = self.current_movement_speed_scale
	local CharacterStateHelper = CharacterStateHelper

	if locomotion_extension.is_on_ground(locomotion_extension) then
		ScriptUnit.extension(unit, "whereabouts_system"):set_is_onground()
	end

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return 
	end

	if CharacterStateHelper.is_ledge_hanging(world, unit, self.temp_params) then
		csm.change_state(csm, "ledge_hanging", self.temp_params)

		return 
	end

	if CharacterStateHelper.is_overcharge_exploding(status_extension) then
		csm.change_state(csm, "overcharge_exploding")

		return 
	end

	if CharacterStateHelper.is_using_transport(status_extension) then
		csm.change_state(csm, "using_transport")

		return 
	end

	if CharacterStateHelper.is_pushed(status_extension) then
		status_extension.set_pushed(status_extension, false)

		local params = movement_settings_table.stun_settings.pushed
		local hit_react_type = status_extension.hit_react_type(status_extension)
		params.hit_react_type = hit_react_type .. "_push"

		csm.change_state(csm, "stunned", params)

		return 
	end

	if CharacterStateHelper.is_block_broken(status_extension) then
		status_extension.set_block_broken(status_extension, false)

		local params = movement_settings_table.stun_settings.parry_broken
		params.hit_react_type = "medium_push"

		csm.change_state(csm, "stunned", params)

		return 
	end

	if locomotion_extension.is_animation_driven(locomotion_extension) then
		return 
	end

	CharacterStateHelper.update_dodge_lock(unit, input_extension, status_extension)

	local start_dodge, dodge_direction = CharacterStateHelper.check_to_start_dodge(unit, input_extension, status_extension, t)

	if start_dodge then
		local params = self.temp_params
		params.dodge_direction = dodge_direction

		csm.change_state(csm, "dodging", params)

		return 
	end

	local gamepad_active = Managers.input:is_device_active("gamepad")
	local is_crouching = status_extension.is_crouching(status_extension)

	if not csm.state_next and (input_extension.get(input_extension, "jump") or input_extension.get(input_extension, "jump_only")) and (not is_crouching or CharacterStateHelper.can_uncrouch(unit)) and locomotion_extension.jump_allowed(locomotion_extension) then
		local movement_input = CharacterStateHelper.get_movement_input(input_extension)

		if is_crouching then
			CharacterStateHelper.uncrouch(unit, t, first_person_extension, status_extension)
		end

		if (not input_extension.get(input_extension, "jump") and not gamepad_active) or status_extension.can_override_dodge_with_jump(status_extension, t) or 0 <= Vector3.y(movement_input) or Vector3.length(movement_input) <= input_extension.minimum_dodge_input then
			if Vector3.y(CharacterStateHelper.get_movement_input(input_extension)) < 0 then
				self.temp_params.backward_jump = true
			else
				self.temp_params.backward_jump = false
			end

			csm.change_state(csm, "jumping", self.temp_params)
			first_person_extension.change_state(first_person_extension, "jumping")

			return 
		end
	end

	local is_moving = CharacterStateHelper.has_move_input(input_extension)

	if not csm.state_next and not is_moving and current_movement_speed_scale == 0 then
		local params = self.temp_params

		csm.change_state(csm, "standing", params)
		first_person_extension.change_state(first_person_extension, "standing")

		return 
	end

	if not csm.state_next and not locomotion_extension.is_on_ground(locomotion_extension) then
		csm.change_state(csm, "falling", self.temp_params)
		first_person_extension.change_state(first_person_extension, "falling")

		return 
	end

	local new_state = self._handle_ladder_collision(self, t, movement_settings_table)

	if not csm.state_next and new_state then
		csm.change_state(csm, new_state, self.temp_params)

		return 
	end

	local toggle_crouch = input_extension.toggle_crouch

	CharacterStateHelper.check_crouch(unit, input_extension, status_extension, toggle_crouch, first_person_extension, t)

	local player = Managers.player:owner(unit)
	local move_input = CharacterStateHelper.get_movement_input(input_extension)

	if not self.is_bot then
		local move_acceleration_up_dt = movement_settings_table.move_acceleration_up*dt
		local move_acceleration_down_dt = movement_settings_table.move_acceleration_down*dt

		if is_moving then
			current_movement_speed_scale = math.min(1, current_movement_speed_scale + move_acceleration_up_dt)
		else
			current_movement_speed_scale = math.max(0, current_movement_speed_scale - move_acceleration_down_dt)
		end
	elseif is_moving then
		current_movement_speed_scale = 1
	else
		current_movement_speed_scale = 0
	end

	local is_walking = input_extension.get(input_extension, "walk")
	local is_crouching = status_extension.is_crouching(status_extension)

	if is_walking ~= self.walking then
		status_extension.set_slowed(status_extension, is_walking)
	end

	local current_max_move_speed = (is_crouching and movement_settings_table.crouch_move_speed) or (is_walking and movement_settings_table.walk_move_speed) or movement_settings_table.move_speed
	local move_speed_multiplier = status_extension.current_move_speed_multiplier(status_extension)
	local final_move_speed = current_max_move_speed*move_speed_multiplier*current_movement_speed_scale*movement_settings_table.player_speed_scale
	local move_input_direction = Vector3.normalize(move_input)

	if Vector3.length_squared(move_input) == 0 then
		move_input_direction = self.last_input_direction:unbox()
	else
		self.last_input_direction:store(move_input_direction)
	end

	if CharacterStateHelper.is_starting_interaction(input_extension, interactor_extension) then
		local config = interactor_extension.interaction_config(interactor_extension)

		interactor_extension.start_interaction(interactor_extension, "interacting")

		if not config.allow_movement then
			local params = self.temp_params
			params.swap_to_3p = config.swap_to_3p
			params.show_weapons = config.show_weapons

			csm.change_state(csm, "interacting", params)
		end

		return 
	end

	CharacterStateHelper.move_on_ground(first_person_extension, input_extension, locomotion_extension, move_input_direction, final_move_speed, unit)
	CharacterStateHelper.look(input_extension, self.player.viewport_name, first_person_extension, status_extension, inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, health_extension)
	CharacterStateHelper.reload(input_extension, inventory_extension, status_extension)

	if CharacterStateHelper.is_interacting(interactor_extension) then
		local config = interactor_extension.interaction_config(interactor_extension)

		if not config.allow_movement then
			local params = self.temp_params
			params.swap_to_3p = config.swap_to_3p
			params.show_weapons = config.show_weapons

			csm.change_state(csm, "interacting", params)
		end

		return 
	end

	local move_anim_3p, move_anim_1p = CharacterStateHelper.get_move_animation(locomotion_extension, input_extension, status_extension)

	if move_anim_3p ~= self.move_anim_3p or move_anim_1p ~= self.move_anim_1p then
		CharacterStateHelper.play_animation_event(unit, move_anim_3p)
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, move_anim_1p)

		self.move_anim_3p = move_anim_3p
		self.move_anim_1p = move_anim_1p
	end

	self.current_movement_speed_scale = current_movement_speed_scale
	self.walking = is_walking

	return 
end

return 
