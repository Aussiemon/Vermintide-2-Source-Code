-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state_climbing.lua

EnemyCharacterStateClimbing = class(EnemyCharacterStateClimbing, EnemyCharacterStateAnimatedJump)

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

EnemyCharacterStateClimbing.init = function (self, character_state_init_context)
	EnemyCharacterStateClimbing.super.init(self, character_state_init_context, "climbing")
end

EnemyCharacterStateClimbing.setup_transition = function (self, unit, smart_object_data, entrance_pos, exit_pos)
	self.smart_object_data = smart_object_data

	local unit_position = POSITION_LOOKUP[unit]

	entrance_pos.z = unit_position.z

	local ledge_position = Vector3Aux.unbox(smart_object_data.ledge_position)

	self._ledge_position = Vector3Box(ledge_position)
	self._entrance_pos = Vector3Box(entrance_pos)
	self._exit_pos = Vector3Box(exit_pos)
	self._climb_upwards = true
	self.jump_ledge_lookat_direction = Vector3Box(Vector3.normalize(Vector3.flat(exit_pos - entrance_pos)))

	local correction_vector = entrance_pos - unit_position
	local correction_amount = Vector3.length(correction_vector)

	self._correction_dir = Vector3Box(correction_amount > 0 and Vector3.divide(correction_vector, correction_amount) or Vector3.zero())
	self._correction_amount = correction_amount

	if not smart_object_data.is_on_edge then
		if smart_object_data.ledge_position1 then
			local ledge_position1 = Vector3Aux.unbox(smart_object_data.ledge_position1)
			local ledge_position2 = Vector3Aux.unbox(smart_object_data.ledge_position2)
			local closest_ledge_position = Vector3.distance_squared(ledge_position1, entrance_pos) < Vector3.distance_squared(ledge_position2, entrance_pos) and ledge_position1 or ledge_position2

			self._climb_jump_height = closest_ledge_position.z - entrance_pos.z

			self._ledge_position:store(closest_ledge_position)
		else
			self._climb_jump_height = ledge_position.z - entrance_pos.z

			if self._climb_jump_height < 0 then
				smart_object_data.is_on_edge = true
			end
		end
	end

	if smart_object_data.is_on_edge then
		if entrance_pos.z > exit_pos.z then
			self._climb_jump_height = entrance_pos.z - exit_pos.z
			self._climb_upwards = false
		else
			self._climb_jump_height = exit_pos.z - entrance_pos.z
		end
	end

	self._sub_state = "moving_to_to_entrance"
end

EnemyCharacterStateClimbing.do_the_transition = function (self, unit, t, dt, locomotion_extension)
	local unit_position = POSITION_LOOKUP[unit]
	local blackboard = BLACKBOARDS[unit]
	local is_on_edge = self.smart_object_data.is_on_edge

	if self._sub_state == "moving_to_to_entrance" then
		local entrance_pos = self._entrance_pos:unbox()
		local exit_pos = self._exit_pos:unbox()

		locomotion_extension:enable_animation_driven_movement_entrance_and_exit_no_mover(entrance_pos, exit_pos)

		local look_direction_wanted = self.jump_ledge_lookat_direction:unbox()
		local wanted_rotation = Quaternion.look(look_direction_wanted)

		self._first_person_extension:set_rotation(wanted_rotation)

		local smart_object_settings = SmartObjectSettings.templates[self._breed.smart_object_template]

		if self._climb_upwards or not is_on_edge then
			local animation_translation_scale = 1
			local jump_anim_thresholds = smart_object_settings.jump_up_anim_thresholds
			local climb_jump_height = self._climb_jump_height

			for i = 1, #jump_anim_thresholds do
				local jump_anim_threshold = jump_anim_thresholds[i]

				if climb_jump_height < jump_anim_threshold.height_threshold then
					local jump_anim_name = is_on_edge and jump_anim_threshold.animation_edge or jump_anim_threshold.animation_fence

					Managers.state.network:anim_event(unit, randomize(jump_anim_name))

					local fence_vertical_length = jump_anim_threshold.fence_vertical_length or jump_anim_threshold.vertical_length
					local edge_vertical_length = jump_anim_threshold.vertical_length
					local anim_distance = is_on_edge and edge_vertical_length or fence_vertical_length

					animation_translation_scale = animation_translation_scale * climb_jump_height / anim_distance

					locomotion_extension:set_animation_translation_scale(Vector3(1, 1, animation_translation_scale))

					break
				end
			end

			locomotion_extension:set_wanted_velocity(Vector3.zero())

			self._sub_state = "waiting_for_finished_climb_anim"
		else
			local jump_anim_thresholds = smart_object_settings.jump_down_anim_thresholds
			local climb_jump_height = math.abs(self._climb_jump_height)

			for i = 1, #jump_anim_thresholds do
				local jump_anim_threshold = jump_anim_thresholds[i]

				if climb_jump_height < jump_anim_threshold.height_threshold then
					local jump_anim_name = is_on_edge and jump_anim_threshold.animation_edge or jump_anim_threshold.animation_fence

					Managers.state.network:anim_event(unit, randomize(jump_anim_name))

					local land_animations = jump_anim_threshold.animation_land or "jump_down_land"

					self._jump_down_land_animation = randomize(land_animations)

					break
				end
			end

			self._sub_state = "waiting_to_reach_ground"
		end
	end

	if self._sub_state == "waiting_for_finished_climb_anim" then
		self:_apply_position_correction(unit, unit_position, dt)

		if blackboard.jump_climb_finished then
			blackboard.jump_climb_finished = nil

			local exit_pos = self._exit_pos:unbox()
			local move_target = is_on_edge and exit_pos or self._ledge_position:unbox()

			if is_on_edge then
				self._sub_state = "done"
			else
				local jump_anim_thresholds = SmartObjectSettings.templates[self._breed.smart_object_template].jump_down_anim_thresholds
				local climb_jump_height = move_target.z - exit_pos.z

				for i = 1, #jump_anim_thresholds do
					local jump_anim_threshold = jump_anim_thresholds[i]

					if climb_jump_height < jump_anim_threshold.height_threshold then
						local ai_size_variation = 1
						local animation_length = jump_anim_threshold.fence_horizontal_length
						local flat_distance_to_jump = Vector3.length(Vector3.flat(unit_position - exit_pos))

						flat_distance_to_jump = flat_distance_to_jump - jump_anim_threshold.fence_land_length

						local animation_translation_scale = flat_distance_to_jump / (animation_length * ai_size_variation)

						locomotion_extension:set_animation_translation_scale(Vector3(animation_translation_scale, animation_translation_scale, 1))

						local jump_anim_name = jump_anim_threshold.animation_fence

						Managers.state.network:anim_event(unit, randomize(jump_anim_name))

						local land_animations = jump_anim_threshold.animation_land or "jump_down_land"

						self._jump_down_land_animation = randomize(land_animations)

						break
					end
				end

				self._sub_state = "waiting_to_reach_ground"
			end
		end
	end

	if self._sub_state == "waiting_to_reach_ground" then
		local move_target = self._exit_pos:unbox()
		local velocity = locomotion_extension:current_velocity()

		if unit_position.z + velocity.z * dt * 2 <= move_target.z then
			locomotion_extension:set_animation_translation_scale(Vector3(1, 1, 1))

			local land_animation = self._jump_down_land_animation

			Managers.state.network:anim_event(unit, land_animation)

			self._sub_state = "done"
		end
	end

	if self._sub_state == "done" or t > self._fail_timer then
		if t > self._fail_timer then
			Application.warning("Breed " .. Unit.get_data(unit, "breed").name .. " failed to climb at position %q", self._entrance_pos:unbox())
		end

		return true
	end
end

EnemyCharacterStateClimbing._apply_position_correction = function (self, unit, unit_position, dt)
	local correction_str = self._correction_amount * math.min(3 * dt, 1)

	self._correction_amount = self._correction_amount - correction_str

	local correction_amount = Vector3.multiply(self._correction_dir:unbox(), correction_str)
	local corrected_pos = unit_position + correction_amount
	local mover = Unit.mover(unit)

	if mover then
		Mover.set_position(mover, corrected_pos)
		Unit.set_local_position(unit, 0, corrected_pos)
	end
end
