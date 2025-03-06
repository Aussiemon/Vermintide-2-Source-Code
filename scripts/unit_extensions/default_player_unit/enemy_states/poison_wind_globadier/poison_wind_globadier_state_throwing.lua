-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/poison_wind_globadier/poison_wind_globadier_state_throwing.lua

PoisonWindGlobadierStateThrowing = class(PoisonWindGlobadierStateThrowing, EnemyCharacterState)

PoisonWindGlobadierStateThrowing.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "globadier_throwing")

	self.current_movement_speed_scale = 0
	self.last_input_direction = Vector3Box(0, 0, 0)
	self._angle = 0
	self._position = Vector3Box()
	self._spline = nil
	self._num_segments = 0
	self._indicator_fx_unit_name = "fx/units/aoe_globadier"
	self._impact_data = {}
	self._right_wpn_particle_name = "fx/wpnfx_globadier_enemy_in_range_1p"
	self._right_wpn_particle_node_name = "e_globe"
end

local position_lookup = POSITION_LOOKUP

PoisonWindGlobadierStateThrowing.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	table.clear(self._temp_params)

	self._unit = unit
	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self._status_extension = ScriptUnit.extension(unit, "status_system")
	self._career_extension = ScriptUnit.extension(unit, "career_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
	self._input_extension = ScriptUnit.has_extension(unit, "input_system")
	self._inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")
	self._is_server = Managers.player.is_server

	local breed = Unit.get_data(unit, "breed")

	self._breed = breed
	self._previous_state = previous_state

	table.clear(self._impact_data)

	self._impact_data.position = Vector3Box()
	self._impact_data.direction = Vector3Box()
	self._impact_data.hit_normal = Vector3Box()
	self._wind_up_movement_speed = breed.wind_up_movement_speed

	local first_person_extension = self._first_person_extension

	first_person_extension:unhide_weapons("catapulted")
	CharacterStateHelper.show_inventory_3p(unit, true, false, self._is_server, self._inventory_extension)
	CharacterStateHelper.play_animation_event(unit, "globe_charge")
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "globe_charge")

	self._done_priming = false
	self._prime_time = t + breed.globe_throw_prime_time
	self._max_prime_time = breed.globe_throw_prime_time

	if self._first_person_extension then
		self._first_person_unit = self._first_person_extension:get_first_person_unit()
	end

	self:set_breed_action("throw_poison_globe")
end

PoisonWindGlobadierStateThrowing.on_exit = function (self, unit, input, dt, context, t, next_state)
	self._throw_ready = nil
	self._throw_time = nil
	self._finish_time = nil
	self._done_priming = false
	self._prime_time = nil

	self:set_breed_action("n/a")
	self:_set_priming_progress(0)
	self:_destroy_indicator_unit()
end

PoisonWindGlobadierStateThrowing.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension
	local locomotion_extension = self._locomotion_extension

	if not self._done_priming then
		self:_update_priming(unit, t, dt)
	end

	if t > self._prime_time then
		self._done_priming = true
	end

	if self._done_priming then
		if not self._throw_time then
			self:_calculate_trajectory()
			self:_update_indicator_unit()
		end

		self:_update_movement(unit, t, dt)
	end

	local done_throwing = false
	local ghost_mode_extension = ScriptUnit.extension(unit, "ghost_mode_system")
	local is_in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()

	if is_in_ghost_mode then
		self:_stop_priming()

		done_throwing = true
	elseif self._throw_time then
		done_throwing = self:_throw_anim_update(t)
	end

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		if not done_throwing then
			self:_stop_priming()
		end

		return
	end

	if done_throwing then
		if locomotion_extension:is_on_ground() then
			csm:change_state("walking")
			first_person_extension:change_state("walking")

			return
		end

		if locomotion_extension:current_velocity().z <= 0 then
			csm:change_state("falling", self._temp_params)
			first_person_extension:change_state("falling")

			return
		end

		first_person_extension:animation_set_variable("armed", 0)
		csm:change_state("standing")

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

	local input_extension = self._input_extension

	if not input_extension then
		return
	end

	local input_throw = input_extension:get("dark_pact_action_one_release")
	local abort_input_throw = false

	if input_throw then
		self._throw_ready = true
	end

	local input_cancel = input_extension:get("dark_pact_action_two")

	if abort_input_throw or input_cancel and not self._throw_time then
		self:_stop_priming()
		csm:change_state("standing")

		return
	end

	if self._throw_ready and not self._throw_time then
		self:_set_throw_start(t)
		self._career_extension:start_activated_ability_cooldown()
	end

	local breed = self._breed
	local look_sense_override = breed.globe_throw_look_sense

	CharacterStateHelper.look(self._input_extension, self._player.viewport_name, self._first_person_extension, self._status_extension, self._inventory_extension, look_sense_override)
end

PoisonWindGlobadierStateThrowing._calculate_trajectory = function (self)
	local first_person_unit = self._first_person_unit
	local breed = self._breed
	local rotation = Unit.local_rotation(first_person_unit, 0)
	local angle = ActionUtils.pitch_from_rotation(rotation)
	local throw_node_index = Unit.node(first_person_unit, "root_point")
	local initial_position = Unit.world_position(first_person_unit, throw_node_index)
	local current_position = initial_position
	local prev_position = self._position:unbox()

	if Vector3.equal(initial_position, prev_position) and angle == self._angle then
		return
	end

	self._position:store(initial_position)

	self._angle = angle

	local radians = math.degrees_to_radians(angle)
	local target_vector = Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))

	target_vector = Vector3.normalize(target_vector + Vector3(0, 0, breed.globe_throw_upwards_amount))

	local speed = breed.globe_throw_speed * 0.01
	local gravity = ProjectileGravitySettings.default
	local physics_world = self._physics_world
	local interval = 0.5
	local points = {
		WeaponHelper:position_on_trajectory(initial_position, target_vector, speed, radians, gravity, 0),
	}
	local radius = 0.05
	local max_hits = 5
	local network_manager = Managers.state.network

	for t = interval, 10, interval do
		local new_position = WeaponHelper:position_on_trajectory(initial_position, target_vector, speed, radians, gravity, t)
		local result = PhysicsWorld.linear_sphere_sweep(physics_world, current_position, new_position, radius, max_hits, "collision_filter", "filter_player_ray_projectile_static_only")
		local num_results = result and #result or 0

		if num_results > 0 then
			local done = false

			for i = 1, num_results do
				local hit = result[i]
				local position = hit.position
				local hit_normal = hit.normal
				local hit_actor = hit.actor
				local distance = hit.distance
				local direction = Vector3.normalize(position - current_position)

				if distance > 0 then
					local hit_unit = Actor.unit(hit_actor)

					if network_manager:level_object_id(hit_unit) then
						points[#points + 1] = position

						local next_position = WeaponHelper:position_on_trajectory(initial_position, target_vector, speed, radians, gravity, t + interval)
						local no_impact_delta = current_position - next_position
						local no_impact_length = Vector3.length(no_impact_delta)
						local buffer = 0.2
						local time = t - (interval - distance / no_impact_length * interval) + buffer
						local impact_data = self._impact_data

						impact_data.position:store(position)
						impact_data.hit_normal:store(hit_normal)
						impact_data.direction:store(direction)

						impact_data.hit_unit = hit_unit

						local num_actors = Unit.num_actors(hit_unit)
						local unit_actor = Unit.actor
						local actor_index

						for i = 0, num_actors - 1 do
							local actor = unit_actor(hit_unit, i)

							if hit_actor == actor then
								actor_index = i

								break
							end
						end

						impact_data.actor_index = actor_index
						impact_data.time = time
						done = true

						break
					end
				end
			end

			if done then
				break
			end
		end

		current_position = new_position
	end

	if #points > 1 then
		self._spline = SplineCurve:new(points, "Hermite", "SplineMovementMetered", "GlobadierProjectileTrajectory")
		self._num_segments = #points
	end
end

PoisonWindGlobadierStateThrowing._update_priming = function (self, unit, t, dt)
	if t > self._prime_time then
		self._done_priming = true

		self:_create_indicator_unit()

		local unit = self._unit
		local first_person_extension = self._first_person_extension

		if not self._thrown then
			CharacterStateHelper.play_animation_event(unit, "globe_charge_hold")
			CharacterStateHelper.play_animation_event_first_person(first_person_extension, "globe_charge_hold")
		end
	end

	local update_priming = not self._done_priming

	if update_priming then
		local prime_time = self._prime_time
		local max_prime_time = self._max_prime_time
		local time = max_prime_time - (prime_time - t)
		local progress = math.clamp(time / max_prime_time, 0, 1)

		self:_set_priming_progress(progress)
		self:_update_movement(unit, t, dt, progress)
	end
end

PoisonWindGlobadierStateThrowing._set_priming_progress = function (self, progress)
	local career_extension = self._career_extension
	local ability_name = "fire"
	local ability_id = career_extension:ability_id(ability_name)
	local ability_data = career_extension:get_activated_ability_data(ability_id)

	ability_data.priming_progress = progress
end

PoisonWindGlobadierStateThrowing._stop_priming = function (self)
	local unit = self._unit
	local first_person_extension = self._first_person_extension

	CharacterStateHelper.play_animation_event(unit, "globe_charge_cancel")
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "globe_charge_cancel")

	self._done_priming = false
end

PoisonWindGlobadierStateThrowing._set_throw_start = function (self, t)
	local unit = self._unit
	local breed = self._breed
	local first_person_unit = self._first_person_unit
	local first_person_extension = self._first_person_extension

	CharacterStateHelper.play_animation_event(unit, "globe_throw")
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "globe_throw")
	first_person_extension:animation_set_variable("armed", 0)

	self._throw_time = t + breed.globe_throw_spawn_globe_time
	self._finish_time = t + breed.globe_throw_finish_time
	self._thrown = false
	self._throw_rotation_box = QuaternionBox(Unit.local_rotation(first_person_unit, 0))

	local throw_node_index = Unit.node(first_person_unit, "j_rightweaponattach")
	local node_position = Unit.world_position(first_person_unit, throw_node_index)

	self._throw_position_box = Vector3Box(node_position)
end

PoisonWindGlobadierStateThrowing._throw_anim_update = function (self, t)
	local throw_time = self._throw_time

	if throw_time and not self._thrown and throw_time <= t then
		self:_throw()
	end

	local finish_time = self._finish_time

	if finish_time and finish_time <= t then
		return true
	end

	self._locomotion_extension:set_disable_rotation_update()

	return false
end

PoisonWindGlobadierStateThrowing._throw = function (self)
	local unit = self._unit
	local breed = self._breed
	local first_person_extension = self._first_person_extension

	first_person_extension:hide_weapons("catapulted")
	CharacterStateHelper.show_inventory_3p(unit, false, true, Managers.player.is_server, self._inventory_extension)
	self._status_extension:set_unarmed(true)

	local rotation = self._throw_rotation_box:unbox()
	local position = self._throw_position_box:unbox()
	local angle = ActionUtils.pitch_from_rotation(rotation)
	local speed = breed.globe_throw_speed
	local target_vector = Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))

	target_vector = Vector3.normalize(target_vector + Vector3(0, 0, breed.globe_throw_upwards_amount))

	local aoe_init_difficulty_damage = breed.globe_throw_impact_difficulty_damage
	local aoe_dot_difficulty_damage = breed.globe_throw_dot_difficulty_damage
	local aoe_dot_damage_interval = breed.globe_throw_dot_damage_interval
	local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
	local radius = breed.globe_throw_aoe_radius
	local initial_radius = breed.globe_throw_initial_radius
	local cloud_life_time = breed.globe_throw_aoe_life_time
	local damage_source = "vs_poison_wind_globadier"
	local aoe_dot_damage_table = aoe_dot_difficulty_damage[difficulty_rank] or aoe_dot_difficulty_damage[2] or 5
	local aoe_dot_damage = DamageUtils.calculate_damage(aoe_dot_damage_table)
	local aoe_init_damage_table = aoe_init_difficulty_damage[difficulty_rank] or aoe_init_difficulty_damage[2] or 7
	local aoe_init_damage = DamageUtils.calculate_damage(aoe_init_damage_table)
	local create_nav_tag_volume = true
	local instant_explosion = false
	local impact_data = self._impact_data
	local fixed_impact_data

	if impact_data.time then
		fixed_impact_data = table.clone(impact_data)
	end

	Managers.state.entity:system("projectile_system"):spawn_globadier_globe(position, target_vector, angle, speed, initial_radius, radius, cloud_life_time, unit, damage_source, aoe_dot_damage, aoe_init_damage, aoe_dot_damage_interval, create_nav_tag_volume, instant_explosion, fixed_impact_data)

	self._thrown = true
end

PoisonWindGlobadierStateThrowing._update_indicator_unit = function (self)
	if self._indicator_unit then
		local impact_data = self._impact_data
		local impact_position = impact_data.position:unbox()

		Unit.set_local_position(self._indicator_unit, 0, impact_position)

		local player_pos = POSITION_LOOKUP[Managers.player:local_player().player_unit]
		local desired_rot = Quaternion.multiply(Quaternion.axis_angle(Vector3.up(), math.pi * 0.5), Quaternion.look(player_pos - impact_position, Vector3.up()))

		Unit.set_local_rotation(self._indicator_unit, 0, desired_rot)
		self:check_enemies_in_range_vfx(impact_position)
	end
end

PoisonWindGlobadierStateThrowing._create_indicator_unit = function (self)
	local world = self._world
	local unit_name = self._indicator_fx_unit_name

	self._indicator_unit = World.spawn_unit(world, unit_name, Vector3.zero())

	local radius = self._breed.globe_throw_aoe_radius

	Unit.set_local_scale(self._indicator_unit, 0, Vector3(radius, radius, radius))
end

PoisonWindGlobadierStateThrowing._destroy_indicator_unit = function (self)
	local world = self._world

	if Unit.alive(self._indicator_unit) then
		World.destroy_unit(world, self._indicator_unit)

		self._indicator_unit = nil
	end
end

PoisonWindGlobadierStateThrowing._update_movement = function (self, unit, t, dt, progress)
	local input_extension = self._input_extension
	local buff_extension = self._buff_extension
	local first_person_extension = self._first_person_extension
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local move_input = CharacterStateHelper.get_movement_input(input_extension)
	local is_moving = CharacterStateHelper.has_move_input(input_extension)
	local current_movement_speed_scale = self.current_movement_speed_scale

	if not self.is_bot then
		local breed_move_acceleration_up = self._breed and self._breed.breed_move_acceleration_up
		local breed_move_acceleration_down = self._breed and self._breed.breed_move_acceleration_down
		local move_acceleration_up_dt = breed_move_acceleration_up * dt or movement_settings_table.move_acceleration_up * dt
		local move_acceleration_down_dt = breed_move_acceleration_down * dt or movement_settings_table.move_acceleration_down * dt

		if is_moving then
			current_movement_speed_scale = math.min(1, current_movement_speed_scale + move_acceleration_up_dt)
		else
			current_movement_speed_scale = math.max(0, current_movement_speed_scale - move_acceleration_down_dt)
		end
	else
		current_movement_speed_scale = is_moving and 1 or 0
	end

	local movement_speed = math.lerp(self._wind_up_movement_speed, 0.6, (progress or 1)^2)
	local current_max_move_speed = movement_speed
	local buffed_move_speed = buff_extension:apply_buffs_to_value(current_max_move_speed, "movement_speed")
	local final_move_speed = buffed_move_speed * current_movement_speed_scale * movement_settings_table.player_speed_scale
	local movement = Vector3(0, 0, 0)

	if move_input then
		movement = movement + move_input
	end

	local move_input_direction

	move_input_direction = Vector3.normalize(movement)

	if Vector3.length(move_input_direction) == 0 then
		move_input_direction = self.last_input_direction:unbox()
	else
		self.last_input_direction:store(move_input_direction)
	end

	local move_anim_3p = CharacterStateHelper.get_move_animation(self._locomotion_extension, input_extension, self._status_extension, self.move_anim_3p)

	if move_anim_3p ~= self.move_anim_3p then
		CharacterStateHelper.play_animation_event(unit, move_anim_3p)

		self.move_anim_3p = move_anim_3p
	end

	if (self._previous_state == "jumping" or self._previous_state == "falling") and not self._locomotion_extension:is_on_ground() then
		CharacterStateHelper.move_in_air_pactsworn(self._first_person_extension, input_extension, self._locomotion_extension, final_move_speed, unit)
	else
		CharacterStateHelper.move_on_ground(first_person_extension, input_extension, self._locomotion_extension, move_input_direction, final_move_speed, unit)
	end

	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, self._status_extension, self._inventory_extension)

	self.current_movement_speed_scale = current_movement_speed_scale
end
