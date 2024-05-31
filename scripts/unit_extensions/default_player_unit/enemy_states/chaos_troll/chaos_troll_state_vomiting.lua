-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/chaos_troll/chaos_troll_state_vomiting.lua

ChaosTrollStateVomiting = class(ChaosTrollStateVomiting, EnemyCharacterState)

ChaosTrollStateVomiting.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "troll_vomiting")

	self._vomit_ability_id = self._career_extension:ability_id("vomit")
	self.current_movement_speed_scale = 0
	self.last_input_direction = Vector3Box(0, 0, 0)
	self._vomit_ability_id = self._career_extension:ability_id("vomit")
end

ChaosTrollStateVomiting.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	table.clear(self._temp_params)

	self._unit = unit
	self._status_extension.is_vomiting = true

	local velocity = Vector3(0, 0, 0)

	self._locomotion_extension:set_forced_velocity(velocity)
	self._locomotion_extension:set_wanted_velocity(Vector3.zero())

	self._puke_direction = Vector3Box(0, 0, 0)
	self._state_end = t + 2.5

	local function safe_navigation_callback()
		if ALIVE[self._unit] then
			if self:_init_puke_attack(unit, t) then
				local attack_duration = 2.5

				self._vomit_time = t + 0.92
				self._vomit_end_time = t + attack_duration
				self._attack_duration = attack_duration

				Managers.state.conflict:freeze_intensity_decay(15)

				self._state = "init"
			else
				self._state = "fail"
			end
		end
	end

	local ai_navigation_system = Managers.state.entity:system("ai_navigation_system")

	ai_navigation_system:add_safe_navigation_callback(safe_navigation_callback)
end

ChaosTrollStateVomiting.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension
	local inventory_extension = self._inventory_extension
	local state = self._state

	Debug.text("PUKE STATE: %s", state)

	if state == "fail" then
		self._career_extension:reduce_activated_ability_cooldown_percent(1, self._vomit_ability_id)
		csm:change_state("standing")

		return
	elseif state == "init" then
		if t > self._vomit_time then
			local function safe_navigation_callback()
				if ALIVE[self._unit] then
					self:spawn_vomit(unit)

					self._state = "vomiting"
				end
			end

			local ai_navigation_system = Managers.state.entity:system("ai_navigation_system")

			ai_navigation_system:add_safe_navigation_callback(safe_navigation_callback)

			self._check_puke_time = t + 0.2
		end
	elseif state == "vomiting" then
		if t > self._check_puke_time then
			BTVomitAction.player_vomit_hit_check(unit, self._puke_position:unbox(), self._physics_world)
		end

		if t > self._vomit_end_time then
			self._state = "done"
		end
	elseif state == "done" then
		csm:change_state("standing")

		return
	end

	if t > self._state_end then
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

	if not input_extension then
		return
	end

	local look_sense_override = 0.33
	local max_radians = math.degrees_to_radians(20)
	local dir = self._puke_direction:unbox()
	local puke_rot = Quaternion.look(dir)

	CharacterStateHelper.look_limited_rotation_freedom(input_extension, self._player.viewport_name, first_person_extension, unit, puke_rot, max_radians, max_radians, status_extension, inventory_extension, look_sense_override)
end

ChaosTrollStateVomiting.on_exit = function (self, unit, input, dt, context, t, next_state)
	local status_extension = self._status_extension

	status_extension.is_vomiting = false
	self._throw_time = nil
	self._finish_time = nil
	self._done_priming = false
	self._vomit_time = nil
end

ChaosTrollStateVomiting._init_puke_attack = function (self, unit, t)
	local puke_position, puke_distance_sq, puke_direction = self:_get_vomit_position(unit)

	if not puke_position then
		return false
	end

	Managers.state.entity:system("surrounding_aware_system"):add_system_event(unit, "enemy_attack", DialogueSettings.pounced_down_broadcast_range, "attack_tag", "before_puke")

	local vomit_animation
	local down_dot = Vector3.dot(puke_direction, Vector3.down())
	local near_vomit_distance = 25
	local near_vomit_max_angle = 0.45
	local needs_to_crouch = false
	local use_near_vomit = near_vomit_max_angle <= down_dot and puke_distance_sq < near_vomit_distance and not needs_to_crouch

	if use_near_vomit then
		vomit_animation = "attack_vomit"
		self._near_vomit = true
	else
		vomit_animation = "attack_vomit_high"
	end

	Managers.state.network:anim_event(unit, vomit_animation)
	CharacterStateHelper.play_animation_event_first_person(self._first_person_extension, vomit_animation)

	self._attack_started_at_t = t
	self._puke_position = Vector3Box(puke_position)
	self._puke_direction = Vector3Box(puke_direction)

	print("INIT PUKE ATTACK DONE")

	return true
end

ChaosTrollStateVomiting.position_on_navmesh = function (position, nav_world, above, below)
	local success, z = GwNavQueries.triangle_from_position(nav_world, position, above or 1, below or 1)

	if success then
		position = Vector3.copy(position)
		position.z = z
	else
		position = GwNavQueries.inside_position_from_outside_position(nav_world, position, 1, 4, 3, 0.5)
	end

	return position
end

ChaosTrollStateVomiting._get_vomit_position = function (self, unit)
	local troll_head_node = Unit.node(unit, "j_head")
	local troll_head_pos = Unit.world_position(unit, troll_head_node)
	local local_player = Managers.player:local_player()
	local vp_name = local_player.viewport_name
	local vp = ScriptWorld.viewport(self._world, vp_name, true)
	local camera = ScriptViewport.camera(vp)
	local pos = ScriptCamera.position(camera)
	local rot = ScriptCamera.rotation(camera)
	local forward = Quaternion.forward(rot)
	local max_dist = self._breed.max_vomit_distance
	local result, hit_position, hit_distance, normal, actor = PhysicsWorld.immediate_raycast(self._physics_world, pos, forward, max_dist, "closest", "collision_filter", "filter_enemy_ray_projectile")
	local pos_to_test, puke_distance_sq, puke_direction, above, below

	if result then
		pos_to_test = hit_position
		below = 2.5
	elseif actor then
		local hit_unit = Actor.unit(actor)

		pos_to_test = Unit.local_position(hit_unit, 0)
		below = 2.5
	else
		local fp_unit = self._first_person_extension:get_first_person_unit()
		local position = Unit.world_position(fp_unit, 0)
		local rotation = Unit.local_rotation(fp_unit, 0)

		rotation = Quaternion.forward(rotation)
		pos_to_test = position + rotation * max_dist
		below = 30
		above = 1.5
	end

	local puke_pos = self.position_on_navmesh(pos_to_test, self._nav_world, above, below)
	local to_puke_pos

	if puke_pos then
		print("HIT NAVMESH")

		to_puke_pos = puke_pos - troll_head_pos
		puke_distance_sq = Vector3.length_squared(to_puke_pos)
		puke_direction = Vector3.normalize(to_puke_pos)
		self._above = above
		self._below = below
	end

	return puke_pos, puke_distance_sq, puke_direction
end

ChaosTrollStateVomiting.spawn_vomit = function (self, unit)
	local puke_pos = self._puke_position:unbox()

	puke_pos = self.position_on_navmesh(puke_pos, self._nav_world, self._above, self._below)

	if puke_pos then
		local dir = self._puke_direction:unbox()
		local puke_rot = Quaternion.look(dir)
		local state_int = self._near_vomit and 1 or 2

		Managers.state.unit_spawner:request_spawn_network_unit("troll_puke", puke_pos, puke_rot, unit, state_int)
	end
end
