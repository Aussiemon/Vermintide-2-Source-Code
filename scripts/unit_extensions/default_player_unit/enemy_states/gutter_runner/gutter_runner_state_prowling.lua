-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/gutter_runner/gutter_runner_state_prowling.lua

GutterRunnerStateProwling = class(GutterRunnerStateProwling, EnemyCharacterState)

GutterRunnerStateProwling.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "gutter_runner_prowling")

	local context = character_state_init_context

	self.current_movement_speed_scale = 0
	self.latest_valid_navmesh_position = Vector3Box(math.huge, math.huge, math.huge)
	self.last_input_direction = Vector3Box(0, 0, 0)
end

GutterRunnerStateProwling.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	self._pounce_ready = false

	local unit = self._unit
	local input_extension = self._input_extension
	local first_person_extension = self._first_person_extension
	local status_extension = self._status_extension
	local inventory_extension = self._inventory_extension
	local health_extension = self._health_extension
	local locomotion_extension = self._locomotion_extension
	local current_velocity = locomotion_extension:current_velocity()
	local breed = Unit.get_data(unit, "breed")

	self._breed = breed

	local player = Managers.player:owner(unit)
	local is_bot = player and player.bot_player

	if previous_state == "standing" then
		self.current_movement_speed_scale = 0
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

	local move_anim_3p, move_anim_1p = CharacterStateHelper.get_move_animation(self._locomotion_extension, input_extension, status_extension, self.move_anim_3p)

	self.move_anim_3p = move_anim_3p
	self.move_anim_1p = move_anim_1p

	CharacterStateHelper.play_animation_event(unit, move_anim_3p)
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, move_anim_1p)
	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, health_extension)
	first_person_extension:play_unit_sound_event("Play_versus_gutterrunner_jump_attack_enter", unit, 0)

	self.is_bot = is_bot

	self:_start_priming(t)

	self._exit_with_priming = true

	self:set_breed_action("prepare_crazy_jump")

	self._left_wpn_particle_name = "fx/wpnfx_gutter_runner_enemy_in_range_1p"
	self._left_wpn_particle_node_name = "g_wpn_left_claw"
	self._right_wpn_particle_name = "fx/wpnfx_gutter_runner_enemy_in_range_1p"
	self._right_wpn_particle_node_name = "g_wpn_right_claw"

	self._ghost_mode_extension:set_external_no_spawn_reason("prowling", true)
end

GutterRunnerStateProwling.on_exit = function (self, unit, input, dt, context, t, next_state, is_destroy)
	EnemyCharacterState.on_exit(self, unit, input, dt, context, t, next_state)

	if is_destroy or not Managers.state.network:game() then
		return
	end

	self._pounce_ready = nil

	if not self._exit_with_priming then
		self:_stop_priming(t)
	end

	self:_set_priming_progress(0)
	self:set_breed_action("n/a")
	self._ghost_mode_extension:set_external_no_spawn_reason("prowling", nil)
end

GutterRunnerStateProwling.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local world = self._world
	local unit = self._unit
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension
	local locomotion_extension = self._locomotion_extension
	local health_extension = self._health_extension
	local inventory_extension = self._inventory_extension

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		self._exit_with_priming = false

		return
	end

	local exit = false
	local released = input_extension:get("dark_pact_action_one_release")

	if released then
		self:_update_priming(t, dt, true)

		if self._done_priming then
			self:_start_pounce()

			return
		else
			exit = true
		end

		self._pounce_ready = true
	else
		self:_update_priming(t, dt, false)
	end

	local canceled = input_extension:get("dark_pact_action_two")

	if canceled or exit then
		first_person_extension:play_hud_sound_event("Stop_versus_gutterrunner_jump_charge_loop")

		self._exit_with_priming = false

		csm:change_state("walking")

		return
	end

	local current_movement_speed_scale = self.current_movement_speed_scale
	local CharacterStateHelper = CharacterStateHelper

	if locomotion_extension:is_on_ground() then
		ScriptUnit.extension(unit, "whereabouts_system"):set_is_onground()
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

	if locomotion_extension:is_animation_driven() then
		return
	end

	local gamepad_active = Managers.input:is_device_active("gamepad")

	if not csm.state_next and not locomotion_extension:is_on_ground() then
		csm:change_state("falling", self._temp_params)
		first_person_extension:change_state("falling")

		return
	end

	local player = Managers.player:owner(unit)
	local move_input = CharacterStateHelper.get_movement_input(input_extension)
	local is_moving = CharacterStateHelper.has_move_input(input_extension)

	if not self.is_bot then
		local breed_move_acceleration_up = self._breed and self._breed.breed_move_acceleration_up
		local breed_move_acceleration_down = self._breed and self._breed.breed_move_acceleration_down
		local move_acceleration_up_dt = breed_move_acceleration_up * dt or movement_settings_table.move_acceleration_up * dt
		local move_acceleration_down_dt = breed_move_acceleration_down * dt or movement_settings_table.move_acceleration_down * dt

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

	local current_max_move_speed = movement_settings_table.crouch_move_speed
	local move_speed_multiplier = status_extension:current_move_speed_multiplier()
	local final_move_speed = current_max_move_speed * move_speed_multiplier * current_movement_speed_scale * movement_settings_table.player_speed_scale
	local move_input_direction = Vector3.normalize(move_input)

	if Vector3.length_squared(move_input) == 0 then
		move_input_direction = self.last_input_direction:unbox()
	else
		self.last_input_direction:store(move_input_direction)
	end

	CharacterStateHelper.move_on_ground(first_person_extension, input_extension, locomotion_extension, move_input_direction, final_move_speed, unit)
	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, inventory_extension)

	local move_anim_3p, move_anim_1p = CharacterStateHelper.get_move_animation(locomotion_extension, input_extension, status_extension, self.move_anim_3p)

	if move_anim_3p ~= self.move_anim_3p then
		CharacterStateHelper.play_animation_event(unit, move_anim_3p)

		self.move_anim_3p = move_anim_3p
	end

	if move_anim_1p ~= self.move_anim_1p then
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, move_anim_1p)

		self.move_anim_1p = move_anim_1p
	end

	self.current_movement_speed_scale = current_movement_speed_scale
end

GutterRunnerStateProwling._start_priming = function (self, t)
	local first_person_extension = self._first_person_extension

	first_person_extension:play_hud_sound_event("Play_versus_gutterrunner_jump_charge_loop")
	CharacterStateHelper.play_animation_event(self._unit, "to_crouch")
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "to_crouch")

	local locomotion_extension = self._locomotion_extension

	self._done_priming = false
	self._prime_time = t + self._breed.pounce_prime_time

	first_person_extension:set_wanted_player_height("crouch", t, self._breed.pounce_prime_time)
	locomotion_extension:set_active_mover("crouch")
end

GutterRunnerStateProwling._set_priming_progress = function (self, progress)
	local career_extension = self._career_extension
	local ability_name = "pounce"
	local ability_id = career_extension:ability_id(ability_name)
	local ability_data = career_extension:get_activated_ability_data(ability_id)

	ability_data.priming_progress = progress

	self._first_person_extension:animation_set_variable("pounce_charge", progress, true)
end

local grace_period = 0.025

GutterRunnerStateProwling._update_priming = function (self, t, dt, allow_grace_period)
	if t > self._prime_time or allow_grace_period and t > self._prime_time - grace_period then
		if not self._done_priming then
			self._first_person_extension:play_hud_sound_event("Play_versus_gutterrunner_jump_charge_end")
		end

		self._done_priming = true
	end

	local pounce_prime_time = self._breed.pounce_prime_time
	local time_past = math.min(pounce_prime_time - (self._prime_time - t), pounce_prime_time)
	local time_fraction = time_past / pounce_prime_time

	self:_set_priming_progress(time_fraction)
end

GutterRunnerStateProwling._stop_priming = function (self, t)
	local first_person_extension = self._first_person_extension

	CharacterStateHelper.play_animation_event(self._unit, "to_upright")
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "to_upright")

	local locomotion_extension = self._locomotion_extension

	first_person_extension:set_wanted_player_height("stand", t)
	locomotion_extension:set_active_mover("standing")
end

GutterRunnerStateProwling._start_pounce = function (self)
	if not self._locomotion_extension:is_on_ground() then
		return
	end

	local first_person_extension = self._first_person_extension
	local world = self._world
	local is_server = self._is_server
	local local_player = self.local_player
	local status_extension = self._status_extension
	local breed = self._breed
	local jump_speed = breed.pounce_speed
	local rotation = first_person_extension:current_rotation()
	local look_direction = Quaternion.forward(rotation)

	look_direction = Vector3.normalize(look_direction + Vector3(0, 0, breed.pounce_upwards_amount))

	local velocity = look_direction * jump_speed

	status_extension.do_pounce = {
		anim_start_event = "to_crouch",
		initial_velocity = Vector3Box(velocity),
	}

	local career_extension = self._career_extension
	local ability_id = career_extension:ability_id("pounce")
	local can_use = career_extension:can_use_activated_ability(ability_id)

	if can_use then
		self._csm:change_state("pouncing")
	end
end
