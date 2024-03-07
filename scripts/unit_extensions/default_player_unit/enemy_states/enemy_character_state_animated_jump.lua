-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state_animated_jump.lua

EnemyCharacterStateAnimatedJump = class(EnemyCharacterStateAnimatedJump, EnemyCharacterState)

EnemyCharacterStateAnimatedJump.do_the_transition = function (self, unit, t, dt, locomotion_extension)
	return
end

EnemyCharacterStateAnimatedJump.setup_transition = function (self, unit, smart_object_data, entrance_pos, exit_pos)
	return
end

EnemyCharacterStateAnimatedJump.init = function (self, character_state_init_context, name)
	EnemyCharacterStateAnimatedJump.super.init(self, character_state_init_context, name)
end

EnemyCharacterStateAnimatedJump.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local input_extension = self._input_extension
	local first_person_extension = self._first_person_extension
	local status_extension = self._status_extension
	local inventory_extension = self._inventory_extension
	local health_extension = self._health_extension
	local locomotion_extension = self._locomotion_extension
	local breed = self._breed

	Managers.telemetry_events:node_climb(breed.name, POSITION_LOOKUP[unit])

	local is_climber = self._breed.climb_type == "climb"

	self.is_climber = is_climber
	self._camera_transitioned_back = nil
	self._control_back = nil

	local player = Managers.player:owner(unit)

	self._player = player

	if status_extension:get_unarmed() then
		CharacterStateHelper.play_animation_event(unit, "to_armed")
	end

	CharacterStateHelper.play_animation_event(unit, "climbing")
	CharacterStateHelper.change_camera_state(player, "follow_third_person_smart_climbing")

	local active = false
	local override
	local unarmed = false

	if status_extension:get_unarmed() then
		unarmed = true
	end

	first_person_extension:set_first_person_mode(active, override, unarmed)

	local jump_data = params.jump_data

	if not jump_data then
		error("Missing jump_data")
	end

	status_extension:set_should_climb(false)
	status_extension:set_is_climbing(true)

	local swap_entrance_exit = jump_data.swap_entrance_exit
	local jump_object_data = jump_data.jump_object_data
	local entrance_pos, exit_pos

	if swap_entrance_exit then
		entrance_pos = Vector3Aux.unbox(jump_object_data.pos1)
		exit_pos = Vector3Aux.unbox(jump_object_data.pos2)
	else
		entrance_pos = Vector3Aux.unbox(jump_object_data.pos2)
		exit_pos = Vector3Aux.unbox(jump_object_data.pos1)
	end

	if not is_climber then
		local look_direction_wanted = Vector3.normalize(Vector3.flat(exit_pos - entrance_pos))
		local look_rotation_wanted = Quaternion.look(look_direction_wanted)

		locomotion_extension:teleport_to(exit_pos, look_rotation_wanted)
	elseif is_climber then
		local smart_object_data = jump_object_data.data

		self:setup_transition(unit, smart_object_data, entrance_pos, exit_pos)

		self._fail_timer = t + 7

		local move_anim_3p, move_anim_1p = CharacterStateHelper.get_move_animation(self._locomotion_extension, input_extension, status_extension)

		self.move_anim_3p = move_anim_3p
		self.move_anim_1p = move_anim_1p

		CharacterStateHelper.play_animation_event(unit, move_anim_3p)
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, move_anim_1p)

		local blackboard = BLACKBOARDS[unit]

		blackboard.jump_start_finished = nil
	end

	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, health_extension)
	self:set_breed_action("climbing")
end

EnemyCharacterStateAnimatedJump.on_exit = function (self, unit, input, dt, context, t, next_state)
	local blackboard = BLACKBOARDS[unit]

	if blackboard then
		blackboard.jump_climb_finished = nil
		blackboard.jump_camera_transition = nil
		blackboard.jump_give_control = nil
	end

	local status_extension = self._status_extension

	status_extension:set_is_climbing(false)

	if status_extension:get_unarmed() then
		CharacterStateHelper.play_animation_event(unit, "to_unarmed")
	end

	if not self._camera_transitioned_back then
		self:start_camera_transition()
	end

	if not self._control_back then
		self:grant_control_to_player()
	end

	self:set_breed_action("n/a")

	local hit_reaction_extension = ScriptUnit.extension(unit, "hit_reaction_system")

	hit_reaction_extension.force_ragdoll_on_death = nil
end

EnemyCharacterStateAnimatedJump.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension
	local locomotion_extension = self._locomotion_extension
	local inventory_extension = self._inventory_extension
	local CharacterStateHelper = CharacterStateHelper

	if locomotion_extension:is_on_ground() then
		ScriptUnit.extension(unit, "whereabouts_system"):set_is_onground()
	end

	local health_extension = self._health_extension

	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, health_extension)

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return
	end

	if CharacterStateHelper.is_using_transport(status_extension) then
		csm:change_state("using_transport")

		return
	end

	if not self.is_climber then
		self:to_movement_state()

		return
	end

	local blackboard = BLACKBOARDS[unit]

	if blackboard.jump_camera_transition and not self._camera_transitioned_back then
		self:start_camera_transition()
	end

	if self:do_the_transition(unit, t, dt, locomotion_extension) then
		self:to_movement_state()
	elseif blackboard.jump_give_control and not self._control_back and self:has_movement_input() then
		self:to_movement_state()
	end

	if locomotion_extension:is_animation_driven() then
		return
	end

	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, inventory_extension)
end

EnemyCharacterStateAnimatedJump.grant_control_to_player = function (self)
	local locomotion_extension = self._locomotion_extension
	local wanted_pose = Unit.animation_wanted_root_pose(self._unit)

	locomotion_extension:teleport_to(Matrix4x4.translation(wanted_pose))
	locomotion_extension:set_wanted_velocity(Vector3.zero())
	locomotion_extension:enable_script_driven_movement()
	locomotion_extension:set_animation_translation_scale(Vector3(1, 1, 1))
	locomotion_extension:force_on_ground(true)

	self._control_back = true
end

EnemyCharacterStateAnimatedJump.start_camera_transition = function (self)
	local first_person_extension = self._first_person_extension

	CharacterStateHelper.change_camera_state(self._player, "follow")
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "idle")
	first_person_extension:toggle_visibility(0.4)

	self._camera_transitioned_back = true
end
