-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state_jump_across.lua

EnemyCharacterStateJumpAcross = class(EnemyCharacterStateJumpAcross, EnemyCharacterStateAnimatedJump)

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

EnemyCharacterStateJumpAcross.init = function (self, character_state_init_context)
	EnemyCharacterStateJumpAcross.super.init(self, character_state_init_context, "jump_across")
end

EnemyCharacterStateJumpAcross.setup_transition = function (self, unit, smart_object_data, entrance_pos, exit_pos)
	self.smart_object_data = smart_object_data

	local unit_position = POSITION_LOOKUP[unit]

	self._entrance_pos = Vector3Box(unit_position)
	self._exit_pos = Vector3Box(exit_pos)
	self._sub_state = "moving_to_to_entrance"

	self._locomotion_extension:set_animation_translation_scale(Vector3(1, 1, 1))

	self.jump_ledge_lookat_direction = Vector3Box(Vector3.normalize(Vector3.flat(exit_pos - unit_position)))
end

EnemyCharacterStateJumpAcross.do_the_transition = function (self, unit, t, dt, locomotion_extension)
	if self._sub_state == "moving_to_to_entrance" then
		local entrance_pos = self._entrance_pos:unbox()
		local exit_pos = self._exit_pos:unbox()

		locomotion_extension:enable_animation_driven_movement_entrance_and_exit_no_mover(entrance_pos, exit_pos)

		local look_direction_wanted = self.jump_ledge_lookat_direction:unbox()
		local wanted_rotation = Quaternion.look(look_direction_wanted)

		self._first_person_extension:set_rotation(wanted_rotation)

		local jump_vector = exit_pos - entrance_pos
		local horizontal_length = Vector3.length(Vector3.flat(jump_vector))
		local smart_object_settings = SmartObjectSettings.templates[self._breed.smart_object_template]
		local jump_across_anim_thresholds = smart_object_settings.jump_across_anim_thresholds

		for i = 1, #jump_across_anim_thresholds do
			local jump_anim_threshold = jump_across_anim_thresholds[i]

			if horizontal_length < jump_anim_threshold.horizontal_threshold then
				Managers.state.network:anim_event(unit, randomize(jump_anim_threshold.animation_jump))

				local animation_distance = jump_anim_threshold.horizontal_length
				local forward_factor = horizontal_length / animation_distance
				local height_factor = jump_vector.z

				locomotion_extension:set_animation_translation_scale(Vector3(forward_factor, forward_factor, height_factor))

				break
			end
		end

		local hit_reaction_extension = ScriptUnit.extension(unit, "hit_reaction_system")

		hit_reaction_extension.force_ragdoll_on_death = true
		self._sub_state = "waiting_for_finished_climb_anim"
	end

	if self._sub_state == "waiting_for_finished_climb_anim" then
		local blackboard = BLACKBOARDS[unit]

		if blackboard.jump_start_finished then
			self._sub_state = "done"
		end
	end

	if self._sub_state == "done" or t > self._fail_timer then
		if t > self._fail_timer then
			Application.warning("Breed " .. Unit.get_data(unit, "breed").name .. " failed to jump across at position %q", self._entrance_pos:unbox())
		end

		return true
	end
end
