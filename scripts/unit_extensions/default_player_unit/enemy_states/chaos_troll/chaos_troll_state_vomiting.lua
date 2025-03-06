-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/chaos_troll/chaos_troll_state_vomiting.lua

ChaosTrollStateVomiting = class(ChaosTrollStateVomiting, EnemyCharacterState)

ChaosTrollStateVomiting.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "troll_vomiting")

	self._vomit_ability_id = self._career_extension:ability_id("vomit")
	self.current_movement_speed_scale = 0
	self.last_input_direction = Vector3Box(0, 0, 0)
	self._vomit_ability_id = self._career_extension:ability_id("vomit")
	self._indicator_fx_unit_name = "fx/units/aoe_globadier"
	self._position = Vector3Box()
	self._angle = 0
	self._impact_data = {}

	self._safe_pos_puke_callback = function ()
		if ALIVE[self._unit] then
			local puke_position, puke_distance_sq, puke_direction = self:_get_vomit_position(self._unit)

			self._puke_position_on_nav = puke_position and Vector3Box(puke_position) or nil
			self._puke_direction = puke_direction and Vector3Box(puke_direction) or nil
			self._puke_distance_sq = puke_distance_sq and puke_distance_sq or nil
		end
	end
end

ChaosTrollStateVomiting.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	self._unit = unit
	self._status_extension.is_vomiting = true
	self._puke_direction = Vector3Box(0, 0, 0)
	self._state_end = t + 2.5
	self._state = "priming"

	local local_player = Managers.player:local_player()
	local vp_name = local_player.viewport_name
	local vp = ScriptWorld.viewport(self._world, vp_name, true)

	self._camera = ScriptViewport.camera(vp)
	self._max_dist = self._breed.max_vomit_distance
	self._troll_head_node = Unit.node(unit, "j_head")

	local vomit_animation = "attack_vomit_into"

	Managers.state.network:anim_event(unit, vomit_animation)
	CharacterStateHelper.play_animation_event_first_person(self._first_person_extension, vomit_animation)

	self._puke_position_on_nav = nil
	self._puke_direction = nil
	self._puke_distance_sq = nil
	self._ray_hit_pos = nil
	self._ray_hit_distance = nil

	table.clear(self._impact_data)

	self._impact_data.position = Vector3Box()
	self._impact_data.direction = Vector3Box()
	self._impact_data.hit_normal = Vector3Box()
end

ChaosTrollStateVomiting.handle_hit_indicator = function (self)
	local unit_name = self._indicator_fx_unit_name

	if self._impact_data.position and self._puke_position_on_nav then
		local impact_data = self._impact_data
		local impact_position = impact_data.position:unbox()

		if self._indicator_unit then
			Unit.set_local_position(self._indicator_unit, 0, impact_position)
		else
			self._indicator_unit = World.spawn_unit(self._world, unit_name, impact_position)

			local radius = self._breed.puke_in_face_indicator_raidus

			Unit.set_local_scale(self._indicator_unit, 0, Vector3(radius, radius, radius))
		end
	else
		self:destroy_indicator_unit()
	end
end

ChaosTrollStateVomiting.destroy_indicator_unit = function (self)
	if Unit.alive(self._indicator_unit) then
		World.destroy_unit(self._world, self._indicator_unit)

		self._indicator_unit = nil
	end
end

ChaosTrollStateVomiting.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension
	local inventory_extension = self._inventory_extension
	local state = self._state

	if not input_extension then
		return
	end

	Debug.text("PUKE STATE: %s", self._state)

	if self._state == "fail" then
		self:destroy_indicator_unit()
		self._career_extension:reduce_activated_ability_cooldown_percent(1, self._vomit_ability_id)
		Managers.state.network:anim_event(unit, "interrupt")
		CharacterStateHelper.play_animation_event_first_person(self._first_person_extension, "interrupt")
		csm:change_state("walking")

		return
	elseif self._state == "priming" then
		local input_cancel_vomit = input_extension:get("dark_pact_action_one_release")

		if input_cancel_vomit then
			self._state = "fail"

			return
		end

		self:_calculate_trajectory()

		local ai_navigation_system = Managers.state.entity:system("ai_navigation_system")

		ai_navigation_system:add_safe_navigation_callback(self._safe_pos_puke_callback)

		if self._impact_data.position and self._puke_position_on_nav then
			local impact_data = self._impact_data
			local impact_position = impact_data.position:unbox()

			if self._indicator_unit then
				local player_pos = POSITION_LOOKUP[Managers.player:local_player().player_unit]
				local desired_rot = Quaternion.multiply(Quaternion.axis_angle(Vector3.up(), math.pi * 0.5), Quaternion.look(player_pos - impact_position, Vector3.up()))

				Unit.set_local_rotation(self._indicator_unit, 0, desired_rot)
			end
		end

		local input_vomit_released = not input_extension:get("dark_pact_action_two_hold")

		if input_vomit_released then
			if ALIVE[self._unit] then
				if not self._puke_position_on_nav or not self._puke_direction then
					self._state = "fail"
				else
					self._state = "start_vomit"
				end
			end

			self._attack_started_at_t = t

			local attack_duration = 1.9

			self._vomit_end_time = t + attack_duration
		end

		self:handle_hit_indicator()
		self:_update_movement(unit, dt, t)
	elseif self._state == "start_vomit" then
		if not self:_init_puke_attack(unit, t) then
			self._state = "fail"
		else
			self._locomotion_extension:set_wanted_velocity(Vector3.zero())
			self:destroy_indicator_unit()

			if ALIVE[self._unit] then
				self:spawn_vomit(unit)

				self._state = "vomiting"

				local career_extension = self._career_extension

				career_extension:start_activated_ability_cooldown(self._vomit_ability_id)
			end

			self._do_sweep_for_heroes = true
			self._check_puke_time = t + 100
		end
	elseif self._state == "vomiting" then
		if self._do_sweep_for_heroes then
			self._do_sweep_for_heroes = false

			self:player_vomit_hit_check(unit, self._impact_data.position:unbox(), self._physics_world)
		end

		if t > self._vomit_end_time then
			self._state = "done"
		end
	elseif self._state == "done" or t > self._state_end then
		csm:change_state("standing")

		return
	end

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

	local look_sense_override = self._breed.look_sense_override

	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, inventory_extension, look_sense_override)
end

ChaosTrollStateVomiting.on_exit = function (self, unit, input, dt, context, t, next_state)
	local status_extension = self._status_extension

	status_extension.is_vomiting = false

	self:destroy_indicator_unit()
end

local TRAJECTORY_INTERVAL = 0.3

ChaosTrollStateVomiting._calculate_trajectory = function (self)
	local first_person_unit = self._first_person_unit
	local breed = self._breed
	local rotation = Unit.local_rotation(first_person_unit, 0)
	local angle = ActionUtils.pitch_from_rotation(rotation)
	local initial_position = Unit.world_position(first_person_unit, self._troll_head_node)
	local current_position = initial_position
	local prev_position = self._position:unbox()

	if Vector3.equal(initial_position, prev_position) and angle == self._angle then
		return
	end

	self._position:store(initial_position)

	self._angle = angle

	local radians = math.degrees_to_radians(angle)
	local target_vector = Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))

	target_vector = Vector3.normalize(target_vector + Vector3(0, 0, breed.vomit_upwards_amount))

	local speed = breed.vomit_projectile_speed
	local gravity = ProjectileGravitySettings.default
	local physics_world = self._physics_world
	local radius = 0.05
	local max_hits = 5
	local network_manager = Managers.state.network
	local pos_set = false

	self._impact_data.sweep_positions = {}

	local sweep_positions = self._impact_data.sweep_positions

	sweep_positions[1] = Vector3Box(initial_position)

	for t = TRAJECTORY_INTERVAL, 10, TRAJECTORY_INTERVAL do
		local new_position = WeaponHelper:position_on_trajectory(initial_position, target_vector, speed, radians, gravity, t)

		sweep_positions[#sweep_positions + 1] = Vector3Box(new_position)

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
						local impact_data = self._impact_data

						impact_data.position:store(position)

						pos_set = true

						impact_data.hit_normal:store(hit_normal)
						impact_data.direction:store(direction)

						impact_data.num_intervals = t
						impact_data.hit_unit = hit_unit
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

		if not pos_set then
			self._impact_data.position:store(Vector3(0, 0, 0))
		end
	end
end

ChaosTrollStateVomiting._sweep_trajectory_for_heroes = function (self)
	local heroes_hit = {}
	local physics_world = self._physics_world
	local radius = self._breed.puke_in_face_sweep_radius
	local max_hits = 10
	local sweep_positions = self._impact_data.sweep_positions

	for i = 1, #sweep_positions - 1 do
		local from_pos = sweep_positions[i]:unbox()
		local to_pos = sweep_positions[i + 1]:unbox()
		local result = PhysicsWorld.linear_sphere_sweep(physics_world, from_pos, to_pos, radius, max_hits, "collision_filter", "filter_player")
		local num_results = result and #result or 0

		if num_results > 0 then
			local hero_hit_index = 1

			for i = 1, num_results do
				local hit = result[i]
				local hit_actor = hit.actor
				local hit_unit = Actor.unit(hit_actor)
				local is_hero = Managers.state.side:versus_is_hero(hit_unit)

				if is_hero and not table.contains(heroes_hit, hit_unit) then
					heroes_hit[hero_hit_index] = hit_unit
					hero_hit_index = hero_hit_index + 1
				end
			end
		end
	end

	return heroes_hit
end

ChaosTrollStateVomiting._init_puke_attack = function (self, unit, t)
	if not self._puke_position_on_nav or not self._puke_distance_sq or not self._puke_direction then
		return false
	end

	local puke_position, puke_distance_sq, puke_direction = self._puke_position_on_nav:unbox(), self._puke_distance_sq, self._puke_direction:unbox()
	local down_dot = Vector3.dot(puke_direction, Vector3.down())
	local near_vomit_distance = 25
	local near_vomit_max_angle = 0.45
	local needs_to_crouch = false
	local use_near_vomit = near_vomit_max_angle <= down_dot and puke_distance_sq < near_vomit_distance and not needs_to_crouch
	local vomit_animation

	if use_near_vomit then
		vomit_animation = "attack_vomit"
		self._near_vomit = true
	else
		vomit_animation = "attack_vomit_high"
	end

	Managers.state.entity:system("surrounding_aware_system"):add_system_event(unit, "enemy_attack", DialogueSettings.pounced_down_broadcast_range, "attack_tag", "before_puke")
	Managers.state.network:anim_event(unit, vomit_animation)
	CharacterStateHelper.play_animation_event_first_person(self._first_person_extension, vomit_animation)

	self._attack_started_at_t = t

	return true
end

local MAX_HITS = 10

ChaosTrollStateVomiting.player_vomit_hit_check = function (self, unit, puke_pos, physics_world, blackboard)
	local troll_head_pos = Unit.world_position(unit, self._troll_head_node)
	local offset_dir = 2 * Vector3.normalize(puke_pos - POSITION_LOOKUP[unit]) + Vector3(0, 0, 1)
	local to_puke = puke_pos + offset_dir - troll_head_pos
	local puke_direction = Vector3.normalize(to_puke)
	local puke_distance = Vector3.length(to_puke)
	local sweep_radius = self._breed.vomit_in_face_sweep_radius
	local hit_heroes = self:_sweep_trajectory_for_heroes()

	if hit_heroes and not table.is_empty(hit_heroes) then
		local num_hits = #hit_heroes
		local buff_system = Managers.state.entity:system("buff_system")

		for i = 1, num_hits do
			local hit_unit = hit_heroes[i]
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			if not buff_extension:has_buff_type("vs_troll_bile_face") then
				buff_system:add_buff(hit_unit, "vs_bile_troll_vomit_face_base", unit)
				Managers.state.achievement:trigger_event("on_troll_vomit_hit", hit_unit, unit)
			end
		end
	end
end

ChaosTrollStateVomiting.position_on_navmesh = function (position, nav_world, above, below)
	local success, z = GwNavQueries.triangle_from_position(nav_world, position, above or 0.5, below or 1)

	if success then
		position = Vector3.copy(position)
		position.z = z
	else
		above = 1.5
		below = 4

		local horizontal = 4
		local dist_from_obstacle = 0.5

		position = GwNavQueries.inside_position_from_outside_position(nav_world, position, above, below, horizontal, dist_from_obstacle)
	end

	return position
end

ChaosTrollStateVomiting.spawn_vomit = function (self, unit)
	local puke_pos = self._puke_position_on_nav:unbox()

	if puke_pos then
		local dir = self._puke_direction:unbox()
		local puke_rot = Quaternion.look(dir)
		local state_int = self._near_vomit and 1 or 2

		Managers.state.unit_spawner:request_spawn_network_unit("troll_puke", puke_pos, puke_rot, unit, state_int)
	end
end

ChaosTrollStateVomiting._get_vomit_position = function (self, unit)
	local troll_head_pos = Unit.world_position(unit, self._troll_head_node)
	local pos = ScriptCamera.position(self._camera)
	local rot = ScriptCamera.rotation(self._camera)
	local forward = Quaternion.forward(rot)
	local max_dist = self._max_dist
	local pos_to_test, puke_distance_sq, puke_direction
	local above, below = 1, 5
	local puke_pos = ChaosTrollStateVomiting.position_on_navmesh(self._impact_data.position:unbox(), self._nav_world, above, below)
	local to_puke_pos

	if puke_pos then
		to_puke_pos = puke_pos - troll_head_pos
		puke_direction = Vector3.normalize(to_puke_pos)
		puke_distance_sq = Vector3.length_squared(to_puke_pos)
	end

	return puke_pos, puke_distance_sq, puke_direction
end

ChaosTrollStateVomiting._update_movement = function (self, unit, t, dt, progress)
	local input_extension = self._input_extension
	local buff_extension = self._buff_extension
	local first_person_extension = self._first_person_extension
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local move_input = CharacterStateHelper.get_movement_input(input_extension)
	local is_moving = CharacterStateHelper.has_move_input(input_extension)
	local current_movement_speed_scale = self.current_movement_speed_scale

	if not self.is_bot then
		local move_acceleration_up_dt = movement_settings_table.move_acceleration_up * dt
		local move_acceleration_down_dt = movement_settings_table.move_acceleration_down * dt

		if is_moving then
			current_movement_speed_scale = math.min(1, current_movement_speed_scale + move_acceleration_up_dt)
		else
			current_movement_speed_scale = math.max(0, current_movement_speed_scale - move_acceleration_down_dt)
		end
	else
		current_movement_speed_scale = is_moving and 1 or 0
	end

	local vomit_speed = self._breed.vomit_movement_speed
	local movement_speed = math.lerp(0.6, vomit_speed, (progress or 1)^2)
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

	local move_anim_3p, move_anim_1p = CharacterStateHelper.get_move_animation(self._locomotion_extension, input_extension, self._status_extension, self.move_anim_3p)

	if move_anim_3p ~= self.move_anim_3p then
		CharacterStateHelper.play_animation_event(unit, move_anim_3p)

		self.move_anim_3p = move_anim_3p
	end

	if move_anim_1p ~= self.move_anim_1p then
		self.move_anim_1p = move_anim_1p

		CharacterStateHelper.play_animation_event_first_person(first_person_extension, move_anim_1p)
	end

	if self._previous_state == "jumping" or self._previous_state == "falling" then
		CharacterStateHelper.move_in_air_pactsworn(self._first_person_extension, input_extension, self._locomotion_extension, final_move_speed, unit)
	else
		CharacterStateHelper.move_on_ground(first_person_extension, input_extension, self._locomotion_extension, move_input_direction, final_move_speed, unit)
	end

	self.current_movement_speed_scale = current_movement_speed_scale
end
