-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/ratling_gunner/ratling_gunner_state_firing.lua

RatlingGunnerStateFiring = class(RatlingGunnerStateFiring, EnemyCharacterState)

RatlingGunnerStateFiring.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "ratling_gunner_firing")

	self._reload_ability_id = self._career_extension:ability_id("reload")
	self._fire_ability_id = self._career_extension:ability_id("fire")
	self.current_movement_speed_scale = 0
	self.last_input_direction = Vector3Box(0, 0, 0)

	local breed = Unit.get_data(character_state_init_context.unit, "breed")

	self.breed = breed
	self._max_ammo = self.breed.max_ammo
	self._current_ammo = self._max_ammo
	self._is_reloading = false
end

local position_lookup = POSITION_LOOKUP
local PI = math.pi
local TWO_PI = PI * 2
local near_wall_length = 1.35

RatlingGunnerStateFiring.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	table.clear(self._temp_params)

	self._previous_state = previous_state

	local velocity = Vector3(0, 0, 0)
	local first_person_extension = self._first_person_extension

	CharacterStateHelper.play_animation_event(unit, "attack_shoot_start")
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "attack_shoot_start")

	local breed = self.breed

	self.unit = unit
	self._physics_world = World.get_data(self._world, "physics_world")
	self._prime_time = t + breed.shoot_ratlinggun_wind_up_time + breed.shoot_ratlinggun_pose_weapon_time
	self._is_priming = true
	self._done_priming = false
	self._wind_up_movement_speed = breed.shoot_ratlinggun_wind_up_movement_speed
	self._done_firing = false
	self._anim_shoot_started = false
	self._is_firing = false
	self._near_wall = false
	self._button_pressed = true

	local blackboard = BLACKBOARDS[unit]

	self._blackboard = blackboard

	self:set_breed_action("wind_up_ratling_gun")

	local data = blackboard.attack_pattern_data or {}
	local action = BreedActions.vs_ratling_gunner.shoot_ratling_gun

	data.shoot_start = nil
	data.shots_fired = nil
	data.time_between_shots_at_start = 1 / action.fire_rate_at_start
	data.time_between_shots_at_end = 1 / action.fire_rate_at_end
	data.max_fire_rate_at_percentage_modifier = 1 / action.max_fire_rate_at_percentage
	data.target_switch_distance_squared = AiUtils.random(action.target_switch_distance[1], action.target_switch_distance[2])^2
	data.target_obscured = false
	data.target_check = t + 0.2 + Math.random() * 0.1
	data.time_at_max_rate_of_fire = action.time_at_max_rate_of_fire
	data.peer_id = data.peer_id or Network.peer_id()
	data.aim_position_box = Vector3Box()
	self._current_ammo = data.current_ammo or self._max_ammo

	local ratling_gun_unit = blackboard.weapon_unit

	data.ratling_gun_unit = ratling_gun_unit
	blackboard.attack_pattern_data = data

	if first_person_extension then
		self._first_person_unit = first_person_extension:get_first_person_unit()
	end

	Managers.state.entity:system("weapon_system"):change_single_weapon_state(unit, "windup_start", data.peer_id)
end

RatlingGunnerStateFiring.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension
	local locomotion_extension = self._locomotion_extension

	RatlingGunnerStateWalking.super:debug_display_ratling_gunner_ammo(unit, self._current_ammo)

	if self._current_ammo <= 0 then
		self._career_extension:force_trigger_active_ability()

		self._is_reloading = true

		csm:change_state("ratling_gunner_reloading")

		return
	end

	if not self._done_priming then
		self:_update_priming(unit, t, dt)
	end

	if self._is_firing and t > self._end_firing_time then
		csm:change_state("standing")

		return
	end

	if self._is_firing and t < self._end_firing_time then
		self:_update_firing_loop(unit, t, dt)
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

	local input_cancel = input_extension:get("action_two") or input_extension:get("action_two_release") or input_extension:get("action_one_release")

	if input_cancel then
		csm:change_state("standing")

		return
	end

	if self._done_priming and not self._is_firing then
		self:_start_firing(self._unit, t)
		self:set_breed_action("shoot_ratling_gun")
	end

	self:_update_movement(unit, t, dt)
	CharacterStateHelper.look(input_extension, self._player.viewport_name, self._first_person_extension, status_extension, self._inventory_extension)
end

RatlingGunnerStateFiring._set_priming_progress = function (self, progress)
	local career_extension = self._career_extension
	local ability_name = "fire"
	local ability_id = career_extension:ability_id(ability_name)
	local ability_data = career_extension:get_activated_ability_data(ability_id)

	ability_data.priming_progress = progress
end

RatlingGunnerStateFiring._update_priming = function (self, unit, t, dt)
	local breed = self.breed
	local max_pose_time = breed.shoot_ratlinggun_wind_up_time + breed.shoot_ratlinggun_pose_weapon_time
	local time = max_pose_time - (self._prime_time - t)
	local progress = math.clamp(time / max_pose_time, 0, 1)

	self:_set_priming_progress(progress)
	self:_update_movement(unit, t, dt, progress)
end

RatlingGunnerStateFiring._start_firing = function (self, unit, t)
	self:_set_priming_progress(0)

	local breed = self.breed

	self._end_firing_time = t + breed.shoot_ratlinggun_max_firing_time

	local blackboard = self._blackboard
	local data = blackboard.attack_pattern_data

	data.is_shooting = true
	data.shoot_start = t
	data.shots_fired = 0
	data.state = "shoot_start"

	Managers.state.entity:system("weapon_system"):change_single_weapon_state(unit, "shoot_start", data.peer_id)
	CharacterStateHelper.play_animation_event_first_person(self._first_person_extension, "attack_shoot_fire")
	CharacterStateHelper.play_animation_event_first_person(self._first_person_extension, "barrel_spin")

	self._is_firing = true
end

RatlingGunnerStateFiring._update_firing_loop = function (self, unit, t, dt)
	local blackboard = self._blackboard
	local data = blackboard.attack_pattern_data
	local breed = self.breed
	local time_in_shoot_action = t - data.shoot_start
	local percentage_in_shoot_action = math.clamp(time_in_shoot_action / data.time_at_max_rate_of_fire * data.max_fire_rate_at_percentage_modifier, 0, 1)
	local current_time_between_shots = math.lerp(data.time_between_shots_at_start, data.time_between_shots_at_end, percentage_in_shoot_action)
	local shots_to_fire = math.floor(time_in_shoot_action / current_time_between_shots) + 1 - data.shots_fired
	local owner_peer_id = data.peer_id

	for i = 1, shots_to_fire do
		data.shots_fired = data.shots_fired + 1

		self:_shoot(unit, blackboard, owner_peer_id)
	end
end

RatlingGunnerStateFiring._get_player_camera = function (self)
	local player = self._player
	local viewport_name = player.viewport_name
	local viewport = ScriptWorld.viewport(self._world, viewport_name)
	local camera = ScriptViewport.camera(viewport)

	return camera
end

RatlingGunnerStateFiring._shoot = function (self, unit, blackboard, owner_peer_id)
	local data = blackboard.attack_pattern_data
	local light_weight_projectile_template_name = "ratling_gunner_vs"
	local light_weight_projectile_template = LightWeightProjectiles[light_weight_projectile_template_name]
	local ratling_gun_unit = data.ratling_gun_unit
	local fire_node = Unit.node(ratling_gun_unit, "p_fx")
	local from_position = Unit.world_position(ratling_gun_unit, fire_node)
	local first_person_extension = self._first_person_extension
	local look_rot = first_person_extension:current_rotation()
	local raycast_filter = "filter_in_line_of_sight_no_players_no_enemies"
	local camera_position = first_person_extension:current_position()
	local length = near_wall_length
	local direction = Quaternion.forward(look_rot)
	local _, _, distance = PhysicsWorld.raycast(self._physics_world, camera_position, direction, length, "all", "types", "both", "closest", "collision_filter", raycast_filter)
	local collision_filter = "filter_enemy_player_afro_ray_projectile"

	if distance == nil or length < distance then
		local normalized_direction = Vector3.normalize(direction)
		local spread_angle = Math.random() * light_weight_projectile_template.spread
		local dir_rot = Quaternion.look(normalized_direction, Vector3.up())
		local pitch = Quaternion(Vector3.right(), spread_angle)
		local roll = Quaternion(Vector3.forward(), Math.random() * TWO_PI)
		local spread_rot = Quaternion.multiply(Quaternion.multiply(dir_rot, roll), pitch)
		local spread_direction = Quaternion.forward(spread_rot)
		local breed = self.breed
		local action_data = {
			power_level = breed.shoot_ratlinggun_power_level,
			damage_profile = light_weight_projectile_template.damage_profile,
			hit_effect = light_weight_projectile_template.hit_effect,
			player_push_velocity = Vector3Box(normalized_direction * light_weight_projectile_template.impact_push_speed),
			projectile_linker = light_weight_projectile_template.projectile_linker,
			first_person_hit_flow_events = light_weight_projectile_template.first_person_hit_flow_events,
		}
		local projectile_system = Managers.state.entity:system("projectile_system")

		projectile_system:create_light_weight_projectile(breed.name, unit, from_position, spread_direction, light_weight_projectile_template.projectile_speed, nil, nil, light_weight_projectile_template.projectile_max_range, collision_filter, action_data, light_weight_projectile_template.light_weight_projectile_effect, owner_peer_id)

		if self._near_wall then
			self._near_wall = false

			first_person_extension:animation_set_variable("disable_shooting", 0)
			CharacterStateHelper.play_animation_event_first_person(first_person_extension, "near_wall_updated")
		end

		self._current_ammo = self._current_ammo - 1

		local blackboard = self._blackboard
		local data = blackboard.attack_pattern_data

		data.current_ammo = self._current_ammo
	elseif not self._near_wall then
		self._near_wall = true

		first_person_extension:animation_set_variable("disable_shooting", 1)
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, "near_wall_updated")
	end
end

RatlingGunnerStateFiring._stop_firing = function (self)
	local first_person_extension = self._first_person_extension
	local blackboard = self._blackboard
	local data = blackboard.attack_pattern_data
	local unit = self.unit

	if self._is_priming then
		Managers.state.entity:system("weapon_system"):change_single_weapon_state(unit, "windup_end", data.peer_id)
	end

	self._is_priming = false

	if self._is_firing then
		Managers.state.entity:system("weapon_system"):change_single_weapon_state(unit, "shoot_end", data.peer_id)
		CharacterStateHelper.play_animation_event_first_person(self._first_person_extension, "attack_finished")

		self._is_firing = false
	end

	CharacterStateHelper.play_animation_event_first_person(self._first_person_extension, "barrel_spin_finished")
	CharacterStateHelper.play_animation_event(unit, "no_anim_upperbody")
end

RatlingGunnerStateFiring.on_exit = function (self, unit, input, dt, context, t, next_state)
	if not Managers.state.network:in_game_session() then
		return
	end

	local breed = self.breed

	self:_stop_firing()

	self._finish_time = nil
	self._done_priming = false
	self._prime_time = nil
	self._anim_shoot_started = false

	self:set_breed_action("n/a")
	CharacterStateHelper.play_animation_event_first_person(self._first_person_extension, "attack_finished")
	CharacterStateHelper.play_animation_event_first_person(self._first_person_extension, "barrel_spin_finished")
	CharacterStateHelper.play_animation_event(unit, "no_anim_upperbody")

	local data = self._blackboard.attack_pattern_data or {}

	data.current_ammo = self._current_ammo

	self._first_person_extension:animation_set_variable("disable_shooting", 0)
	CharacterStateHelper.play_animation_event_first_person(self._first_person_extension, "near_wall_updated")
	self:_set_priming_progress(0)
end

RatlingGunnerStateFiring._update_movement = function (self, unit, t, dt, progress)
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

	wind_up_progress = self._is_firing and 1 or self._career_extension:get_activated_ability_data(self._fire_ability_id).priming_progress

	local movement_speed = math.lerp(self._wind_up_movement_speed.start, self._wind_up_movement_speed.finish, wind_up_progress^self._wind_up_movement_speed.rate)
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

	local move_anim_3p, move_anim_1p = CharacterStateHelper.get_move_animation(self._locomotion_extension, input_extension, self._status_extension)

	if move_anim_3p ~= self.move_anim_3p or move_anim_1p ~= self.move_anim_1p then
		CharacterStateHelper.play_animation_event(unit, move_anim_3p)

		self.move_anim_3p = move_anim_3p
		self.move_anim_1p = move_anim_1p
	end

	if self._locomotion_extension:is_on_ground() then
		CharacterStateHelper.move_on_ground(first_person_extension, input_extension, self._locomotion_extension, move_input_direction, final_move_speed, unit)
	else
		CharacterStateHelper.move_in_air_pactsworn(self._first_person_extension, input_extension, self._locomotion_extension, final_move_speed, unit)
	end

	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, self._status_extension, self._inventory_extension)

	self.current_movement_speed_scale = current_movement_speed_scale

	if t > self._prime_time then
		self._done_priming = true
		self._is_priming = false
	end
end
