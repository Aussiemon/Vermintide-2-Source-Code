-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state_staggered.lua

local stagger_types = require("scripts/utils/stagger_types")

EnemyCharacterStateStaggered = class(EnemyCharacterStateStaggered, EnemyCharacterState)

EnemyCharacterStateStaggered.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "staggered")

	self._status_extension = nil
	self._stagger_time_scale = 1.5

	self:reset_stagger()

	self._last_stagger_anim = nil
end

EnemyCharacterStateStaggered.reset_stagger = function (self)
	self._accumulated_stagger = 0
	self._stagger_type = nil
	self._stagger_time = 0
end

EnemyCharacterStateStaggered._select_animation = function (self, unit, impact_vec, stagger_anims, action_data)
	local impact_dir = Vector3.normalize(impact_vec)
	local my_fwd = Quaternion.forward(Unit.local_rotation(unit, 0))
	local dot = Vector3.dot(my_fwd, impact_dir)

	dot = math.clamp(dot, -1, 1)

	local angle = math.acos(dot)
	local velocity = self._locomotion_extension:current_velocity()
	local velocy_my_fwd_dot = Vector3.dot(velocity, my_fwd)
	local moving_stagger_distance = action_data.moving_stagger_minimum_destination_distance
	local moving_stagger_threshold = action_data.action_data
	local in_moving_stagger_distane = moving_stagger_distance and moving_stagger_distance < blackboard.destination_dist
	local in_moving_stagger_velocity = moving_stagger_threshold and moving_stagger_threshold < velocy_my_fwd_dot
	local impact_rot, anim_table
	local always_stagger_suffered = self._status_extension:always_stagger_suffered()
	local moving_stagger = false

	if not always_stagger_suffered then
		moving_stagger = in_moving_stagger_distane and in_moving_stagger_velocity
	end

	self._status_extension:set_always_stagger_suffered(false)

	if impact_dir.z == -1 and stagger_anims.dwn then
		impact_dir.z = 0
		impact_rot = Quaternion.look(-impact_dir)
		anim_table = moving_stagger and stagger_anims.moving_dwn or stagger_anims.dwn
	else
		impact_dir.z = 0

		if angle > math.pi * 0.75 then
			impact_rot = Quaternion.look(-impact_dir)
			anim_table = moving_stagger and stagger_anims.moving_bwd or stagger_anims.bwd
		elseif angle < math.pi * 0.25 then
			impact_rot = Quaternion.look(impact_dir)
			anim_table = moving_stagger and stagger_anims.moving_fwd or stagger_anims.fwd
		elseif Vector3.cross(my_fwd, impact_dir).z > 0 then
			local dir = Vector3.cross(Vector3(0, 0, -1), impact_dir)

			impact_rot = Quaternion.look(dir)
			anim_table = moving_stagger and stagger_anims.moving_left or stagger_anims.left
		else
			local dir = Vector3.cross(Vector3(0, 0, 1), impact_dir)

			impact_rot = Quaternion.look(dir)
			anim_table = moving_stagger and stagger_anims.moving_right or stagger_anims.right
		end
	end

	local num_anims = #anim_table
	local index = Math.random(1, num_anims)
	local anim = anim_table[index]

	if anim == self._last_stagger_anim then
		anim = anim_table[index % num_anims + 1]
	end

	local yaw = Quaternion.yaw(impact_rot)
	local final_rotation = Quaternion(Vector3.up(), yaw)

	return anim, final_rotation
end

EnemyCharacterStateStaggered.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	MOOD_BLACKBOARD.staggered = true
	self._exit_anim_triggered = false

	CharacterStateHelper.move_on_ground(self._first_person_extension, input, self._locomotion_extension, Vector3(0, 0, 0), 0, unit)
	CharacterStateHelper.stop_weapon_actions(self._inventory_extension, "stunned")
	CharacterStateHelper.stop_career_abilities(self._career_extension, "stunned")
	CharacterStateHelper.play_animation_event_first_person(self._first_person_extension, "interrupt")

	self._status_extension = ScriptUnit.has_extension(unit, "status_system")

	local status_extension = self._status_extension
	local accumulated_stagger = status_extension:accumulated_stagger()
	local was_already_in_stagger = self._accumulated_stagger > 0 and self._accumulated_stagger ~= accumulated_stagger

	self._accumulated_stagger = accumulated_stagger
	self._stagger_type = status_extension:stagger_type()

	local breed = Unit.get_data(unit, "breed")
	local action_data = BreedActions[breed.name].stagger

	self:set_breed_action("stagger")
	status_extension:set_stagger_animation_done(false)

	self._stagger_hit_wall = nil
	self._stagger_ignore_anim_cb = breed.stagger_ignore_anim_cb

	status_extension:increase_stagger_count()

	self._stagger_time = status_extension:stagger_time()

	local idle_event = "idle"
	local stagger_anims = action_data.stagger_anims[self._stagger_type]
	local impact_direction = status_extension:stagger_direction()

	impact_direction = impact_direction:unbox()

	local push_anim, impact_rotation = self:_select_animation(unit, impact_direction, stagger_anims, action_data)

	Unit.set_local_rotation(unit, 0, impact_rotation)

	local network_manager = Managers.state.network

	if self._stagger_time_scale then
		local anim_scale = self._stagger_time_scale

		network_manager:anim_event_with_variable_float(unit, push_anim, "stagger_scale", anim_scale)
	else
		network_manager:anim_event(unit, push_anim)
	end

	network_manager:anim_event(unit, idle_event)

	if not was_already_in_stagger then
		self._locomotion_extension:enable_animation_driven_movement(false)
	end
end

EnemyCharacterStateStaggered.on_exit = function (self, unit, input, dt, context, t, next_state)
	self:reset_stagger()
	self._status_extension:set_stagger_values(stagger_types.none, Vector3(0, 0, 0), 0, 0, 0, 1, false, true)
	self._locomotion_extension:enable_script_driven_movement()
	self._first_person_extension:set_wanted_player_height("stand", t)
	self:set_breed_action("n/a")

	MOOD_BLACKBOARD.staggered = false
end

EnemyCharacterStateStaggered.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local status_extension = self._status_extension
	local locomotion_extension = self._locomotion_extension
	local accumulated_stagger = status_extension:accumulated_stagger()

	if self._accumulated_stagger ~= accumulated_stagger then
		self:on_enter(unit, input, dt, context, t, "staggered", nil)
	end

	local stagger_anim_done = status_extension:stagger_animation_done()
	local stagger_time = status_extension:stagger_time()
	local stagger_immune_time = status_extension:stagger_immune_time()
	local heavy_stagger_immune_time = status_extension:heavy_stagger_immune_time()
	local stagger_time_finished = stagger_time < t
	local stagger_exit_anim_time = t > stagger_time - 0.3333333333333333

	if stagger_immune_time and stagger_time_finished then
		status_extension:set_stagger_immune_time(nil)
	end

	if heavy_stagger_immune_time and stagger_time_finished then
		status_extension:set_heavy_stagger_immune_time(nil)
	end

	if stagger_time_finished and (self._stagger_ignore_anim_cb or stagger_anim_done) then
		if not csm.state_next and not locomotion_extension:is_on_ground() then
			csm:change_state("falling")
		else
			csm:change_state("standing")
		end

		return
	end

	if false then
		-- Nothing
	end

	locomotion_extension:set_disable_rotation_update()

	local look_sense_override = 0.5

	CharacterStateHelper.look(self._input_extension, self._player.viewport_name, self._first_person_extension, self._status_extension, self._inventory_extension, look_sense_override)
end
