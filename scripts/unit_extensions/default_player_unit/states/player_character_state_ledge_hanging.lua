PlayerCharacterStateLedgeHanging = class(PlayerCharacterStateLedgeHanging, PlayerCharacterState)

PlayerCharacterStateLedgeHanging.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "ledge_hanging")

	local context = character_state_init_context
	self.lerp_target_position = Vector3Box()
	self.lerp_start_position = Vector3Box()
end

PlayerCharacterStateLedgeHanging.on_enter_animation = function (self)
	local unit = self.unit

	CharacterStateHelper.play_animation_event_first_person(self.first_person_extension, "idle")
	CharacterStateHelper.play_animation_event(unit, "hanging")
end

PlayerCharacterStateLedgeHanging.change_to_third_person_camera = function (self)
	CharacterStateHelper.change_camera_state(self.player, "follow_third_person_ledge")

	local first_person_extension = self.first_person_extension

	first_person_extension:set_first_person_mode(false)

	local include_local_player = true

	CharacterStateHelper.show_inventory_3p(self.unit, false, include_local_player, self.is_server, self.inventory_extension)
end

PlayerCharacterStateLedgeHanging.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local unit = self.unit
	local ledge_unit = params.ledge_unit
	self.ledge_unit = ledge_unit

	CharacterStateHelper.stop_weapon_actions(self.inventory_extension, "ledge_hanging")
	CharacterStateHelper.stop_career_abilities(self.career_extension, "ledge_hanging")
	self.locomotion_extension:enable_script_driven_ladder_movement()
	self.locomotion_extension:set_forced_velocity(Vector3:zero())

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	self.fall_down_time = t + movement_settings_table.ledge_hanging.time_until_fall_down

	self:calculate_and_start_rotation_to_ledge()
	self:calculate_start_position()
	self:calculate_offset_rotation()
	self:on_enter_animation()
	self:change_to_third_person_camera()
	CharacterStateHelper.set_is_on_ledge(self.ledge_unit, unit, true, self.is_server, self.status_extension)
end

PlayerCharacterStateLedgeHanging.on_exit = function (self, unit, input, dt, context, t, next_state)
	self.rotate_timer_yaw = nil
	self.position_lerp_timer = nil
	self.start_rotation = nil

	if next_state ~= "leave_ledge_hanging_pull_up" then
		if next_state ~= "leave_ledge_hanging_falling" then
			CharacterStateHelper.change_camera_state(self.player, "follow")
			self.first_person_extension:toggle_visibility(CameraTransitionSettings.perspective_transition_time)
		end

		local status_extension = self.status_extension

		self.locomotion_extension:enable_script_driven_movement()

		local include_local_player = false

		CharacterStateHelper.show_inventory_3p(unit, true, include_local_player, self.is_server, self.inventory_extension)

		if Managers.state.network:game() then
			CharacterStateHelper.set_is_on_ledge(self.ledge_unit, unit, false, self.is_server, self.status_extension)
		end
	elseif next_state == "leave_ledge_hanging_pull_up" or next_state == "leave_ledge_hanging_falling" then
		CharacterStateHelper.change_camera_state(self.player, "follow_third_person")
	end
end

PlayerCharacterStateLedgeHanging.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local unit = self.unit
	local locomotion_extension = self.locomotion_extension
	local input_extension = self.input_extension
	local status_extension = self.status_extension
	local first_person_extension = self.first_person_extension

	if status_extension:is_pulled_up() or DebugKeyHandler.key_pressed("c", "pull up from ledge hanging", "player") then
		local params = self.temp_params
		params.ledge_unit = self.ledge_unit
		params.start_rotation_box = self.start_rotation_box

		csm:change_state("leave_ledge_hanging_pull_up", params)
	end

	if self.fall_down_time < t or CharacterStateHelper.is_knocked_down(status_extension) then
		local params = self.temp_params
		params.ledge_unit = self.ledge_unit

		csm:change_state("leave_ledge_hanging_falling", params)
		Unit.set_local_rotation(unit, 0, self.start_rotation_box:unbox())

		return
	end

	if self.position_lerp_timer then
		self.position_lerp_timer = self.position_lerp_timer + dt
		local percentage_in_lerp = math.clamp(self.position_lerp_timer / self.time_for_position_lerp, 0, 1)
		local start_position = self.lerp_start_position:unbox()
		local target_position = self.lerp_target_position:unbox()
		local new_position = start_position + (target_position - start_position) * percentage_in_lerp

		locomotion_extension:teleport_to(new_position)

		if percentage_in_lerp == 1 then
			self.time_for_position_lerp = nil
			self.position_lerp_timer = nil
		end
	end

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return
	end

	self.locomotion_extension:set_disable_rotation_update()
	CharacterStateHelper.look(input_extension, self.player.viewport_name, self.first_person_extension, status_extension, self.inventory_extension)
	self.locomotion_extension:set_forced_velocity(Vector3:zero())
end

PlayerCharacterStateLedgeHanging.calculate_start_position = function (self)
	local unit = self.unit
	local ledge_unit = self.ledge_unit
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local global_unit_scale = Unit.local_scale(ledge_unit, 0)
	local node = Unit.node(ledge_unit, "g_gameplay_ledge_trigger_box")
	local ledge_position = Unit.world_position(ledge_unit, node)
	local ledge_rotation = Unit.world_rotation(ledge_unit, node)
	local current_position = Unit.local_position(unit, 0)
	local ledge_right_vector = Quaternion.right(ledge_rotation)
	local direction = current_position - ledge_position
	local position_offset_amount = Vector3.dot(ledge_right_vector, direction)
	local node = Unit.node(ledge_unit, "g_gameplay_ledge_finger_box")
	local finger_box_position = Unit.world_position(ledge_unit, node)
	local finger_box_rotation = Unit.world_rotation(ledge_unit, node)
	local finger_box_scale = Unit.local_scale(ledge_unit, node)
	local finger_box_right_vector = Quaternion.right(finger_box_rotation)
	local player_hands_safe = 1 - 0.3 * 1 / global_unit_scale.x * 1 / finger_box_scale.x

	if player_hands_safe <= math.abs(position_offset_amount) then
		position_offset_amount = (position_offset_amount >= 0 and player_hands_safe) or -player_hands_safe
	end

	position_offset_amount = position_offset_amount * global_unit_scale.x * finger_box_scale.x
	local new_position = finger_box_position + finger_box_right_vector * position_offset_amount
	local distance = Vector3.distance(current_position, new_position)

	self.lerp_start_position:store(current_position)
	self.lerp_target_position:store(new_position)

	self.time_for_position_lerp = distance * movement_settings_table.ledge_hanging.attach_position_lerp_time_per_meter
	self.position_lerp_timer = 0
	local hang_ledge_spawn_offset = 0.5
	local hang_ledge_spawn_position = new_position - Quaternion.forward(ledge_rotation) * hang_ledge_spawn_offset

	ScriptUnit.extension(unit, "whereabouts_system"):set_new_hang_ledge_position(hang_ledge_spawn_position)
end

PlayerCharacterStateLedgeHanging.calculate_and_start_rotation_to_ledge = function (self)
	local unit = self.unit
	local ledge_unit = self.ledge_unit
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local node = Unit.node(ledge_unit, "g_gameplay_ledge_finger_box")
	local finger_box_rotation = Unit.world_rotation(ledge_unit, node)
	local finger_box_yaw = Quaternion.yaw(finger_box_rotation)
	local rotation = Quaternion(Vector3.up(), finger_box_yaw + math.pi)
	local to_player = Quaternion.forward(rotation)
	self.start_rotation_box = QuaternionBox(Quaternion.look(-to_player))

	Unit.set_local_rotation(unit, 0, rotation)
end

PlayerCharacterStateLedgeHanging.calculate_offset_rotation = function (self)
	local unit = self.unit
	local ledge_unit = self.ledge_unit
	local rotation = Unit.local_rotation(unit, 0)
	local to_player = Quaternion.forward(rotation)
	local ledge_position = self.lerp_target_position:unbox()
	local ray_origin_offset = Vector3.up() * 0.25
	local ray_origin_position = ledge_position + to_player * 0.25 + ray_origin_offset
	local physics_world = World.physics_world(self.world)
	local is_in_line_of_sight = PerceptionUtils.is_position_in_line_of_sight
	local below_player_position = ray_origin_position - Vector3.up() * 2.25
	local ray_1_succeded, ray_1_position = is_in_line_of_sight(unit, ray_origin_position, below_player_position, physics_world)

	if not ray_1_succeded then
		local ray_succeded, hit_position, ray_goal_position = nil
		local num_rays = 5

		for i = 1, num_rays, 1 do
			ray_goal_position = below_player_position + to_player * 0.5 * i
			ray_succeded, hit_position = is_in_line_of_sight(unit, ray_origin_position, ray_goal_position, physics_world)

			if ray_succeded then
				break
			end
		end

		if ray_succeded then
			local right_dir = Quaternion.right(rotation)
			local to_goal_position = Vector3.normalize(ray_goal_position - ledge_position)
			local cross_dir = Vector3.cross(right_dir, to_goal_position)
			local new_rotation = Quaternion.look(cross_dir)
			rotation = new_rotation
		elseif script_data.debug_hang_ledges then
		end
	end

	Unit.set_local_rotation(unit, 0, rotation)
end

return
