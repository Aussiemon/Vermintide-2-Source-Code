-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/gutter_runner/gutter_runner_state_pinning.lua

GutterRunnerStatePinning = class(GutterRunnerStatePinning, EnemyCharacterState)

GutterRunnerStatePinning.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "pinning_enemy")

	self.lerp_target_position = Vector3Box()
	self.lerp_start_position = Vector3Box()
	self.breed = Unit.get_data(self._unit, "breed")
	self._foff_ability_id = self._career_extension:ability_id("foff")
end

GutterRunnerStatePinning.on_enter_animation = function (self)
	local unit = self._unit
end

GutterRunnerStatePinning.change_to_third_person_camera = function (self)
	CharacterStateHelper.change_camera_state(self._player, "follow_third_person")

	local first_person_extension = self._first_person_extension

	first_person_extension:set_first_person_mode(false)
end

GutterRunnerStatePinning.pounce_down = function (self, unit, target_unit, t)
	local locomotion_extension = self._locomotion_extension
	local target_position = POSITION_LOOKUP[target_unit]

	locomotion_extension:set_wanted_velocity(Vector3.zero())
	locomotion_extension:teleport_to(target_position)

	local mover = Unit.mover(unit)

	Mover.set_position(mover, target_position)
	LocomotionUtils.separate_mover_fallbacks(mover, 1)

	local mover_position = Mover.position(mover)

	Unit.set_local_position(unit, 0, mover_position)
	StatusUtils.set_pounced_down_network("pounced_down", target_unit, true, unit)

	local target_status_extension = ScriptUnit.extension(target_unit, "status_system")

	target_status_extension:set_pounced_down(true, unit)
	target_status_extension:add_pacing_intensity(CurrentIntensitySettings.intensity_add_pounced_down)

	local blackboard = self._blackboard
	local breed = blackboard.breed
	local in_air_time = t - blackboard.pounce_start_time
	local breed_name = breed.name
	local impact_damage_scaler = in_air_time / breed.pounce_max_damage_time
	local impact_damage = math.clamp(impact_damage_scaler * breed.max_pounce_damage, breed.min_pounce_damage, breed.max_pounce_damage)
	local hit_react_type

	DamageUtils.add_damage_network(target_unit, unit, impact_damage, "torso", "cutting", nil, Vector3(1, 0, 0), breed_name, nil, nil, nil, hit_react_type)

	local action = BreedActions.skaven_gutter_runner.target_pounced

	BTTargetPouncedAction.impact_pushback(unit, target_position, action.close_impact_radius, action.far_impact_radius, action.impact_speed_given, blackboard.target_unit)
end

GutterRunnerStatePinning.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local unit = self._unit
	local first_person_extension = self._first_person_extension
	local target_unit = params.target_unit

	self._blackboard = BLACKBOARDS[unit]
	self._blackboard.start_pouncing_time = t

	self:set_breed_action("target_pounced")
	first_person_extension:play_unit_sound_event("Play_versus_gutterrunner_jump_attack_hit", unit, 0)
	self:pounce_down(unit, target_unit, t)

	self.target_unit = target_unit
	self.target_status_extension = ScriptUnit.extension(target_unit, "status_system")

	CharacterStateHelper.stop_weapon_actions(self._inventory_extension, "pinning_enemy")
	CharacterStateHelper.stop_career_abilities(self._career_extension, "pinning_enemy")
	self._locomotion_extension:set_forced_velocity(Vector3:zero())
	self:on_enter_animation()
	self:change_to_third_person_camera()

	self._next_stab_time = t

	self._status_extension:set_pinning_enemy(true, target_unit)
end

GutterRunnerStatePinning.on_exit = function (self, unit, input, dt, context, t, next_state)
	CharacterStateHelper.change_camera_state(self._player, "follow")
	self._first_person_extension:toggle_visibility(CameraTransitionSettings.perspective_transition_time)

	if ALIVE[self.target_unit] then
		StatusUtils.set_pounced_down_network("pounced_down", self.target_unit, false, unit)
	else
		self._status_extension:set_pinning_enemy(false, self.target_unit)
	end

	self:set_breed_action("n/a")

	local current_cooldown = self._career_extension:current_ability_cooldown(self._foff_ability_id)

	if current_cooldown < 1 then
		self._career_extension:reduce_activated_ability_cooldown((1 - current_cooldown) * -1, self._foff_ability_id)
	end
end

GutterRunnerStatePinning.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local unit = self._unit
	local locomotion_extension = self._locomotion_extension
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension
	local target_unit = self.target_unit
	local target_status_extension = self.target_status_extension

	if not HEALTH_ALIVE[target_unit] then
		local params = self._temp_params

		csm:change_state("standing", params)

		return
	end

	if target_status_extension:is_knocked_down() then
		local params = self._temp_params

		csm:change_state("standing", params)

		return
	end

	local buff_extension = self._buff_extension
	local unmount_buff = buff_extension:has_buff_type("vs_gutter_runner_allow_dismount")

	if not CharacterStateHelper.is_viable_stab_target(unit, target_unit, target_status_extension) or (input_extension:get("jump") or input_extension:get("action_two")) and unmount_buff then
		target_status_extension:set_pounced_down(false, unit)

		local params = self._temp_params

		csm:change_state("standing", params)

		return
	end

	self:update_stabbing(t, dt, unit, target_unit)

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return
	end

	self._locomotion_extension:set_disable_rotation_update()
	CharacterStateHelper.look(input_extension, self._player.viewport_name, self._first_person_extension, status_extension, self._inventory_extension)
end

GutterRunnerStatePinning.update_stabbing = function (self, t, dt, unit, target_unit)
	local time_between_damage = 0.5

	if t > self._next_stab_time then
		local action = BreedActions.skaven_gutter_runner.target_pounced
		local pounced_time = (t - self._blackboard.start_pouncing_time - self.breed.time_before_ramping_damage) / self.breed.time_to_reach_max_damage
		local normalized_time = math.clamp(pounced_time, 0, 1)
		local base_damage = self.breed.base_damage
		local multiplier = 1 + normalized_time * self.breed.final_damage_multiplier
		local stab_damage = base_damage * multiplier

		AiUtils.damage_target(target_unit, unit, action, stab_damage)

		self._next_stab_time = t + time_between_damage
	end
end
