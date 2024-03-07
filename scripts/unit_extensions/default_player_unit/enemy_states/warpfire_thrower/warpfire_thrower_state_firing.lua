-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/warpfire_thrower/warpfire_thrower_state_firing.lua

WarpfireThrowerStateFiring = class(WarpfireThrowerStateFiring, EnemyCharacterState)

WarpfireThrowerStateFiring.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "warpfire_firing")

	self.current_movement_speed_scale = 0
	self.last_input_direction = Vector3Box(0, 0, 0)
end

local POSITION_LOOKUP = POSITION_LOOKUP

WarpfireThrowerStateFiring.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	table.clear(self._temp_params)

	self._unit_id = Managers.state.network.unit_storage:go_id(unit)

	local breed = Unit.get_data(unit, "breed")

	self._breed = breed

	local blackboard = BLACKBOARDS[unit]

	self._blackboard = blackboard

	local velocity = Vector3(0, 0, 0)

	CharacterStateHelper.play_animation_event(unit, "attack_shoot_start")
	CharacterStateHelper.play_animation_event_first_person(self._first_person_extension, "attack_shoot_start")

	self._done_priming = false
	self._prime_time = t + breed.shoot_warpfire_prime_time
	self._max_prime_time = breed.shoot_warpfire_prime_time
	self._max_flame_time = breed.shoot_warpfire_max_flame_time
	self._current_flame_time = 0
	self._wind_up_movement_speed = breed.shoot_warpfire_wind_up_movement_speed
	self.shoot_warpfire_movement_speed_mod = breed.shoot_warpfire_movement_speed_mod

	if self._first_person_extension then
		self.first_person_unit = self._first_person_extension:get_first_person_unit()
	end

	self.blackboard = BLACKBOARDS[self._unit]

	local data = self.blackboard.warpfire_data or {
		aim_rotation_dodge_multipler = 0.15,
		aim_rotation_override_distance = 3,
		aim_rotation_override_speed_multiplier = 1.5,
		buff_name_close = "vs_warpfire_thrower_short_distance_damage",
		buff_name_far = "vs_warpfire_thrower_long_distance_damage",
		muzzle_node = "p_fx",
		warpfire_follow_target_speed = 0.75,
		attack_range = breed.shoot_warpfire_attack_range,
		close_attack_range = breed.shoot_warpfire_close_attack_range,
		close_attack_cooldown = breed.shoot_warpfire_close_attack_cooldown,
		hit_radius = breed.shoot_warpfire_close_attack_hit_radius,
		target_position = Vector3Box(0, 0, 0),
	}

	data.is_firing = false
	self._is_firing = false
	data.peer_id = data.peer_id or Network.peer_id()
	self.blackboard.warpfire_data = data
	self._create_fire_time = 0
	self._gravity = -9.82
	self._speed = 17
	self._angle = math.degrees_to_radians(math.pi / 4)

	self:set_breed_action("shoot_warpfire_thrower")
	Managers.state.entity:system("weapon_system"):change_single_weapon_state(unit, "windup_start", data.peer_id)
end

WarpfireThrowerStateFiring.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension
	local locomotion_extension = self._locomotion_extension
	local inventory_extension = self._inventory_extension

	if not self._done_priming then
		self:_update_priming(unit, t, dt)
	end

	if self._is_firing then
		self:_update_warpfire_attack(unit, t, dt)
	end

	local max_time_reached = self._current_flame_time >= self._max_flame_time

	if max_time_reached then
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

	if not input_extension then
		return
	end

	local input_cancel = input_extension:get("action_one_release") or input_extension:get("action_two") or input_extension:get("action_two_release")

	if input_cancel then
		csm:change_state("standing")

		return
	end

	if self._done_priming and not self._is_firing then
		self:_start_firing(t)
	end

	self:_update_movement(unit, t, dt)
	CharacterStateHelper.look(self._input_extension, self._player.viewport_name, self._first_person_extension, self._status_extension, self._inventory_extension)
end

WarpfireThrowerStateFiring._set_priming_progress = function (self, progress)
	local career_extension = self._career_extension
	local ability_name = "fire"
	local ability_id = career_extension:ability_id(ability_name)
	local ability_data = career_extension:get_activated_ability_data(ability_id)

	ability_data.priming_progress = progress
end

WarpfireThrowerStateFiring._update_priming = function (self, unit, t, dt)
	local update_priming = not self._done_priming

	if t > self._prime_time then
		self._done_priming = true
	end

	if update_priming then
		local prime_time = self._prime_time
		local max_prime_time = self._max_prime_time
		local time = max_prime_time - (prime_time - t)
		local progress = math.clamp(time / max_prime_time, 0, 1)

		self:_set_priming_progress(progress)
		self:_update_movement(unit, t, dt, progress)
	end
end

WarpfireThrowerStateFiring._start_firing = function (self, t)
	self:_set_priming_progress(0)

	local unit = self._unit
	local blackboard = self.blackboard
	local warpfire_data = blackboard.warpfire_data

	if self:_create_warpfire_blob(unit, warpfire_data, blackboard, t) then
		blackboard.close_attack_cooldown = 0
	end

	local data = blackboard.warpfire_data

	data.is_firing = true
	self._is_firing = true
	data.state = "shoot_start"

	Managers.state.entity:system("weapon_system"):change_single_weapon_state(unit, "shoot_start", data.peer_id)
end

WarpfireThrowerStateFiring._stop_priming = function (self)
	local unit = self._unit
	local first_person_extension = self._first_person_extension

	CharacterStateHelper.play_animation_event(unit, "idle")
	CharacterStateHelper.play_animation_event(unit, "no_anim_upperbody")
end

WarpfireThrowerStateFiring._close_range_attack = function (self, unit, blackboard, warpfire_data, t)
	local blackboard = self.blackboard
	local warpfire_data = blackboard.warpfire_data
	local buff_system = Managers.state.entity:system("buff_system")
	local enemies_in_range = EnemyCharacterStateHelper.get_enemies_in_line_of_sight(unit, self.first_person_unit, self._physics_world)

	if not enemies_in_range then
		return
	end

	for i = 1, #enemies_in_range do
		local enemy_data = enemies_in_range[i]
		local hit_unit = enemy_data.unit

		if DamageUtils.is_enemy(unit, hit_unit) then
			local buff_name = enemy_data.distance <= warpfire_data.close_attack_range and warpfire_data.buff_name_close or warpfire_data.buff_name_far
			local params = {}

			params.attacker_unit = unit

			buff_system:add_buff_synced(hit_unit, buff_name, BuffSyncType.All, params)
			buff_system:add_buff_synced(hit_unit, "warpfire_thrower_fire_slowdown", BuffSyncType.All, params)
		end
	end
end

local function ballistic_raycast(physics_world, max_steps, max_time, position, velocity, gravity, collision_filter, visualize)
	local time_step = max_time / max_steps

	for i = 1, max_steps do
		local new_position = position + velocity * time_step
		local delta = new_position - position
		local direction = Vector3.normalize(delta)
		local distance = Vector3.length(delta)
		local result, hit_position, hit_distance, normal, actor = PhysicsWorld.immediate_raycast(physics_world, position, direction, distance, "closest", "collision_filter", collision_filter)

		if hit_position then
			return result, hit_position, hit_distance, normal, actor
		end

		velocity = velocity + gravity * time_step
		position = new_position
	end

	return false, position
end

WarpfireThrowerStateFiring._update_warpfire_attack = function (self, unit, t, dt)
	self._current_flame_time = self._current_flame_time + dt

	local blackboard = self.blackboard
	local warpfire_data = blackboard.warpfire_data

	if t > blackboard.close_attack_cooldown then
		self:_close_range_attack(unit, blackboard, warpfire_data, t)

		blackboard.close_attack_cooldown = t + warpfire_data.close_attack_cooldown
	end
end

local debug_draw = false

WarpfireThrowerStateFiring.hit_ground_at = function (self)
	local player_position = POSITION_LOOKUP[self._unit]
	local first_person_position = POSITION_LOOKUP[self.first_person_unit]
	local first_person_rotation = Unit.world_rotation(self.first_person_unit, 0)
	local position
	local max_steps = 10
	local max_time = 1.5
	local speed = self._speed
	local angle = self._angle
	local velocity = Quaternion.forward(Quaternion.multiply(first_person_rotation, Quaternion(Vector3.right(), angle))) * speed
	local gravity = Vector3(0, 0, self._gravity)
	local collision_filter = "filter_geiser_check"
	local result, hit_position, _, normal = ballistic_raycast(self._physics_world, max_steps, max_time, first_person_position, velocity, gravity, collision_filter, debug_draw)

	position = hit_position

	if result then
		local up = Vector3(0, 0, 1)

		if Vector3.dot(normal, up) < 0.75 then
			local half_step_back = 1 * Vector3.normalize(position - player_position)
			local new_position = position - half_step_back
			local _, new_hit_position, _, _ = PhysicsWorld.immediate_raycast(self._physics_world, new_position, Vector3(0, 0, -1), 5, "closest", "collision_filter", collision_filter)

			if new_hit_position then
				position = new_hit_position
			end
		end
	end

	return position, player_position
end

WarpfireThrowerStateFiring._move_warpfire_blob = function (self, unit, warpfire_data, blackboard, dt)
	local blob_unit = warpfire_data.blob_unit
	local blob_position = POSITION_LOOKUP[blob_unit]

	if blob_unit and blob_position then
		local unit_position = POSITION_LOOKUP[unit]
		local target_position = warpfire_data.target_position:unbox()
		local to_target = Vector3.flat(target_position - unit_position)
		local target_dist = Vector3.length(to_target)
		local lerp_value, wanted_position
		local close_attack_range = warpfire_data.close_attack_range
		local warpfire_follow_target_speed = warpfire_data.warpfire_follow_target_speed

		if close_attack_range < target_dist then
			lerp_value = math.min(dt * warpfire_follow_target_speed, 1)
			wanted_position = target_position
		else
			lerp_value = math.min(dt * warpfire_follow_target_speed * 6, 1)

			local unit_to_target = Vector3.normalize(target_position - unit_position)

			wanted_position = unit_position + unit_to_target * close_attack_range
		end

		local new_blob_position = Vector3.lerp(blob_position, wanted_position, lerp_value)

		Unit.set_local_position(blob_unit, 0, new_blob_position)
	end
end

WarpfireThrowerStateFiring._create_warpfire_blob = function (self, unit, warpfire_data, blackboard, t)
	local warpfire_data = blackboard.warpfire_data
	local warpfire_unit = blackboard.weapon_unit
	local target_position, my_position = self:hit_ground_at()

	if not target_position then
		return false
	end

	warpfire_data.target_position:store(target_position)

	local extension_init_data = {
		area_damage_system = {
			damage_blob_template_name = "warpfire_vs",
			source_unit = unit,
		},
	}
	local aoe_unit_name = "units/hub_elements/empty"
	local damage_blob_unit = Managers.state.unit_spawner:spawn_network_unit(aoe_unit_name, "damage_blob_unit", extension_init_data, target_position)
	local damage_blob_extension = ScriptUnit.extension(damage_blob_unit, "area_damage_system")

	warpfire_data.blob_unit = damage_blob_unit
	warpfire_data.blob_extension = damage_blob_extension

	local length = Vector3.length(target_position - my_position)
	local wait_time = length / 10

	damage_blob_extension:start_placing_blobs(wait_time, t)

	self._create_fire_time = t + 9999999

	return true
end

WarpfireThrowerStateFiring.on_exit = function (self, unit, input, dt, context, t, next_state)
	if not Managers.state.network:in_game_session() then
		return
	end

	local csm = self._csm
	local status_extension = self._status_extension
	local locomotion_extension = self._locomotion_extension
	local first_person_extension = self._first_person_extension

	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "attack_finished")
	CharacterStateHelper.play_animation_event(unit, "no_anim_upperbody")

	local warpfire_data = self.blackboard.warpfire_data

	if warpfire_data.is_firing then
		local refund_fraction = math.clamp((self._max_flame_time - self._current_flame_time) / self._max_flame_time - self._breed.shoot_warpfire_minimum_forced_cooldown, 0, 1)

		self._career_extension:start_activated_ability_cooldown(1, refund_fraction)
		Managers.state.entity:system("weapon_system"):change_single_weapon_state(unit, "shoot_end", warpfire_data.peer_id)

		warpfire_data.is_firing = false

		CharacterStateHelper.play_animation_event_first_person(first_person_extension, "wind_up_start")
		CharacterStateHelper.play_animation_event(unit, "wind_up_start")
		first_person_extension:play_hud_sound_event("player_enemy_warpfire_steam_after_flame_start")
	end

	if warpfire_data.blob_extension then
		warpfire_data.blob_extension:stop_placing_blobs(t)
	end

	self._max_flame_time = nil
	self._done_priming = false
	self._prime_time = nil
	self._current_flame_time = nil

	self:set_breed_action("n/a")
	self:_set_priming_progress(0)
end

WarpfireThrowerStateFiring._update_movement = function (self, unit, t, dt, progress)
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

	local wind_up_progress = 1

	wind_up_progress = self._is_firing and 1 or self._career_extension:get_activated_ability_data(1).priming_progress

	local movement_speed = math.lerp(self._wind_up_movement_speed.start, self._wind_up_movement_speed.finish, wind_up_progress^self._wind_up_movement_speed.rate)
	local current_max_move_speed = movement_speed
	local buffed_move_speed = buff_extension:apply_buffs_to_value(current_max_move_speed, "movement_speed")
	local final_move_speed = buffed_move_speed * current_movement_speed_scale * movement_settings_table.player_speed_scale * self.shoot_warpfire_movement_speed_mod
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

	local move_anim_3p, move_anim_1p = CharacterStateHelper.get_move_animation(self._locomotion_extension, input_extension, self._status_extension)

	if move_anim_3p ~= self.move_anim_3p or move_anim_1p ~= self.move_anim_1p then
		CharacterStateHelper.play_animation_event(unit, move_anim_3p)

		self.move_anim_3p = move_anim_3p
		self.move_anim_1p = move_anim_1p
	end

	if self._previous_state == "jumping" or self._previous_state == "falling" then
		CharacterStateHelper.move_in_air_pactsworn(self._first_person_extension, input_extension, self._locomotion_extension, final_move_speed, unit)
	else
		CharacterStateHelper.move_on_ground(first_person_extension, input_extension, self._locomotion_extension, move_input_direction, final_move_speed, unit)
	end

	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, self._status_extension, self._inventory_extension)

	self.current_movement_speed_scale = current_movement_speed_scale

	if t > self._prime_time then
		self._done_priming = true
		self._is_priming = false
	end
end
