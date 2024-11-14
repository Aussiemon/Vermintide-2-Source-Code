-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/gutter_runner/gutter_runner_state_pouncing.lua

GutterRunnerStatePouncing = class(GutterRunnerStatePouncing, EnemyCharacterState)

GutterRunnerStatePouncing.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "pouncing")
end

local position_lookup = POSITION_LOOKUP

GutterRunnerStatePouncing.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	table.clear(self._temp_params)

	local player = self._player
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local locomotion_extension = self._locomotion_extension
	local inventory_extension = self._inventory_extension
	local first_person_extension = self._first_person_extension
	local breed = Unit.get_data(unit, "breed")

	self._breed = breed
	self._physics_world = World.physics_world(self._world)

	local pounce_data = status_extension.do_pounce

	pounce_data.starting_pos = Vector3Box(POSITION_LOOKUP[unit])
	pounce_data.sfx_event_jump = "Play_versus_gutterrunner_jump_attack_release"
	pounce_data.sfx_event_land = "Play_versus_pactsworn_jump_land"
	pounce_data.sfx_event_jump_end = "Play_versus_gutterrunner_leap_stop"
	self._pounce_data = pounce_data
	status_extension.do_pounce = false

	local initial_velocity = pounce_data.initial_velocity:unbox()

	self:_start_pounce(unit, initial_velocity, t)
	CharacterStateHelper.ghost_mode(self._ghost_mode_extension, input_extension)
	CharacterStateHelper.look(input_extension, player.viewport_name, first_person_extension, status_extension, self._inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, self._health_extension)

	local position = POSITION_LOOKUP[unit]

	ScriptUnit.extension(unit, "whereabouts_system"):set_jumped()

	local start_jump_height = position_lookup[unit].z

	status_extension:set_falling_height(start_jump_height)
	status_extension:set_gutter_runner_leaping(true)

	self._entered_in_ghostmode = status_extension:get_in_ghost_mode()
	self._played_landing_event = nil

	CharacterStateHelper.play_animation_event(unit, "jump_start")
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "jump_start")

	local blackboard = BLACKBOARDS[unit]

	blackboard.starting_pos_boxed = Vector3Box(POSITION_LOOKUP[unit])
	blackboard.pounce_start_time = t

	self:set_breed_action("jump")
	self._ghost_mode_extension:set_external_no_spawn_reason("pouncing", true)
end

GutterRunnerStatePouncing.on_exit = function (self, unit, input, dt, context, t, next_state, is_destroy)
	local first_person_extension = self._first_person_extension
	local locomotion_extension = self._locomotion_extension
	local status_extension = self._status_extension

	locomotion_extension:reset_maximum_upwards_velocity()

	local career_extension = ScriptUnit.extension(unit, "career_system")
	local ability_id = career_extension:ability_id("pounce")

	career_extension:start_activated_ability_cooldown(ability_id)

	local jump_end_sfx = self._pounce_data.sfx_event_jump_end

	if jump_end_sfx then
		first_person_extension:play_unit_sound_event(jump_end_sfx, unit, 0)
	end

	if next_state == "walking" or next_state == "standing" then
		ScriptUnit.extension(unit, "whereabouts_system"):set_landed()
	elseif next_state and next_state ~= "falling" then
		ScriptUnit.extension(unit, "whereabouts_system"):set_no_landing()
	end

	if next_state and Managers.state.network:game() then
		if next_state == "pinning_enemy" then
			CharacterStateHelper.play_animation_event(unit, "jump_attack")
			CharacterStateHelper.play_animation_event_first_person(first_person_extension, "attack_finished")
		else
			CharacterStateHelper.play_animation_event(unit, "jump_fail")
			CharacterStateHelper.play_animation_event(unit, "to_combat")
			CharacterStateHelper.play_animation_event_first_person(first_person_extension, "attack_finished")
		end
	end

	CharacterStateHelper.play_animation_event(self._unit, "to_upright")
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "to_upright")
	first_person_extension:set_wanted_player_height("stand", t)
	locomotion_extension:set_active_mover("standing")
	self:set_breed_action("n/a")

	if is_destroy then
		return
	end

	self._ghost_mode_extension:set_external_no_spawn_reason("pouncing", nil)
	status_extension:set_gutter_runner_leaping(false)
end

GutterRunnerStatePouncing.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension
	local locomotion_extension = self._locomotion_extension
	local inventory_extension = self._inventory_extension
	local health_extension = self._health_extension
	local breed = self._breed

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
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

	if CharacterStateHelper.is_block_broken(status_extension) then
		status_extension:set_block_broken(false)

		local params = movement_settings_table.stun_settings.parry_broken

		params.hit_react_type = "medium_push"

		csm:change_state("stunned", params)

		return
	end

	if self:_update_movement(unit, dt, t) then
		self:_finish(unit, t)

		if self._pounce_target then
			local target_unit = self._pounce_target

			self._temp_params.target_unit = target_unit

			csm:change_state("pinning_enemy", self._temp_params)
			first_person_extension:change_state("pinning_enemy")

			return
		end

		if CharacterStateHelper.is_colliding_down(unit) then
			csm:change_state("walking", self._temp_params)
			first_person_extension:change_state("walking")

			return
		end

		if not self._csm.state_next and locomotion_extension:current_velocity().z <= 0 then
			csm:change_state("falling", self._temp_params)
			first_person_extension:change_state("falling")

			return
		end
	end

	local look_sense_override = breed.pounce_look_sense

	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, inventory_extension, look_sense_override)
end

GutterRunnerStatePouncing._update_movement = function (self, unit, dt, t)
	local locomotion_extension = self._locomotion_extension
	local previous_speed = self._previous_speed

	self._pounce_target = nil

	if not self._entered_in_ghostmode then
		local radius = self._breed.pounce_hit_radius
		local nearby_hero_units = FrameTable.alloc_table()
		local proximity_extension = Managers.state.entity:system("proximity_system")
		local position = POSITION_LOOKUP[unit]
		local broadphase = proximity_extension.player_units_broadphase

		Broadphase.query(broadphase, position, radius, nearby_hero_units)

		local closest_hero_distance

		for _, player_unit in pairs(nearby_hero_units) do
			local target_status_extension = ScriptUnit.extension(player_unit, "status_system")

			if player_unit ~= unit and CharacterStateHelper.is_viable_stab_target(unit, player_unit, target_status_extension) then
				local player_unit_pos = Unit.world_position(player_unit, Unit.node(player_unit, "j_spine"))
				local distance_to_hero = Vector3.distance(player_unit_pos, position)

				if (not closest_hero_distance or distance_to_hero < closest_hero_distance) and PerceptionUtils.is_position_in_line_of_sight(nil, position, player_unit_pos, self._physics_world) then
					closest_hero_distance = distance_to_hero
					self._pounce_target = player_unit
				end
			end
		end
	end

	if CharacterStateHelper.is_colliding_down(unit) or CharacterStateHelper.is_colliding_sides(unit) or self._pounce_target then
		return true
	end

	local current_speed = Vector3.length(locomotion_extension:current_velocity())

	self._previous_speed = current_speed

	local status_extension = self._status_extension
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local move_speed = current_speed

	move_speed = move_speed * movement_settings_table.player_air_speed_scale_pouncing

	self:_move_during_pounce(move_speed, unit, dt)
end

GutterRunnerStatePouncing._move_during_pounce = function (self, speed, unit, dt)
	local input_extension = self._input_extension
	local movement = CharacterStateHelper.get_movement_input(input_extension)

	if not movement then
		return
	end

	local locomotion_extension = self._locomotion_extension
	local first_person_extension = self._first_person_extension
	local breed = self._breed
	local move_direction = Vector3.normalize(movement)
	local unit_rotation = first_person_extension:current_rotation()
	local move_velocity = Vector3.normalize(Vector3.flat(Quaternion.rotate(unit_rotation, move_direction)))
	local prev_move_velocity = Vector3.flat(locomotion_extension:current_velocity())
	local current_velocity = locomotion_extension:current_velocity()
	local new_move_velocity = prev_move_velocity + move_velocity * speed
	local fall_speed = current_velocity.z

	fall_speed = fall_speed - breed.pounce_gravity * dt

	local new_move_speed = Vector3.length(new_move_velocity)

	new_move_speed = math.clamp(new_move_speed, 0, math.huge)

	local new_move_direction = Vector3.normalize(new_move_velocity)
	local wanted_velocity = new_move_direction * new_move_speed

	wanted_velocity.z = fall_speed

	locomotion_extension:set_forced_velocity(wanted_velocity)

	local camera_tweak_str = 0.5
	local new_vel_rot = Quaternion.look(wanted_velocity, Vector3.up())
	local new_vel_pitch = Quaternion.pitch(new_vel_rot)
	local current_pitch = Quaternion.pitch(unit_rotation)

	if new_vel_pitch < current_pitch then
		local old_vel_rot = Quaternion.look(current_velocity, Vector3.up())
		local old_vel_pitch = Quaternion.pitch(old_vel_rot)
		local new_vel_pitch_scaled = math.radian_lerp(old_vel_pitch, new_vel_pitch, camera_tweak_str)
		local look_right = Quaternion.right(unit_rotation)
		local new_vel_rot_clamped = Quaternion.axis_angle(look_right, new_vel_pitch_scaled - old_vel_pitch)
		local new_rot = Quaternion.multiply(new_vel_rot_clamped, unit_rotation)

		first_person_extension:set_rotation(new_rot)
	end
end

GutterRunnerStatePouncing._finish = function (self, unit, t)
	local world = self._world
	local locomotion_extension = self._locomotion_extension
	local first_person_extension = self._first_person_extension
	local velocity = Vector3(0, 0, 0)

	locomotion_extension:set_forced_velocity(velocity)
	first_person_extension:play_camera_effect_sequence("landed_hard", t)

	local land_sound_event = self._pounce_data.sfx_event_land

	if not self._pounce_target and land_sound_event and not self._played_landing_event then
		first_person_extension:play_unit_sound_event(land_sound_event, unit, 0)

		self._played_landing_event = true
	end

	CharacterStateHelper.play_animation_event(unit, "jump_land")
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "jump_land")

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)

	movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration
end

GutterRunnerStatePouncing._start_pounce = function (self, unit, velocity, t)
	local world = self._world
	local first_person_extension = self._first_person_extension
	local locomotion_extension = self._locomotion_extension

	self._previous_speed = 0

	first_person_extension:play_camera_effect_sequence("jump", t)

	local jump_sound_event = self._pounce_data.sfx_event_jump

	if jump_sound_event then
		first_person_extension:play_unit_sound_event(jump_sound_event, unit, 0)
	end

	local breed = self._breed
	local pounce_start_forward_offset = breed.pounce_start_forward_offset
	local pounce_start_up_offset = breed.pounce_start_up_offset
	local pos = POSITION_LOOKUP[unit]
	local unit_rotation = first_person_extension:current_rotation()
	local pounce_offset = Vector3.normalize(Vector3.flat(Quaternion.forward(unit_rotation))) * pounce_start_forward_offset

	pounce_offset.z = pounce_start_up_offset

	locomotion_extension:teleport_to(pos + pounce_offset)
	locomotion_extension:set_maximum_upwards_velocity(velocity.z)
	locomotion_extension:set_forced_velocity(velocity)
	locomotion_extension:set_wanted_velocity(velocity)

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)

	movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration_gutter_runner_pounce
end
