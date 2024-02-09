-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/ratling_gunner/ratling_gunner_state_reloading.lua

RatlingGunnerStateReloading = class(RatlingGunnerStateReloading, EnemyCharacterState)

RatlingGunnerStateReloading.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "ratling_gunner_reloading")

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

RatlingGunnerStateReloading.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	table.clear(self._temp_params)

	local breed = self.breed

	self._is_firing = false
	self._near_wall = false
	self._reload_canceled = false
	self._button_pressed = true

	local blackboard = BLACKBOARDS[unit]

	self._blackboard = blackboard

	local data = blackboard.attack_pattern_data or {}
	local action = BreedActions.vs_ratling_gunner.shoot_ratling_gun

	self._wind_up_movement_speed = breed.shoot_ratlinggun_wind_up_movement_speed
	self._reload_movement_speed = breed.shoot_ratlinggun_reload_movement_speed
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

	local first_person_extension = self._first_person_extension

	if first_person_extension then
		self._first_person_unit = first_person_extension:get_first_person_unit()
	end

	if first_person_extension then
		CharacterStateHelper.play_animation_event(self._unit, "no_anim_upperbody")
		CharacterStateHelper.play_animation_event(self._unit, "wind_up_start")
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, "wind_up_start")
		first_person_extension:play_hud_sound_event("Play_player_ratling_gunner_weapon_reload")
	end
end

RatlingGunnerStateReloading.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension
	local locomotion_extension = self._locomotion_extension

	RatlingGunnerStateWalking.super:debug_display_ratling_gunner_ammo(unit, self._current_ammo)

	local can_use = self._career_extension:can_use_activated_ability(2)
	local is_disabled = status_extension:is_disabled(2)

	if can_use then
		csm:change_state("standing")
	end

	local input_fire = input_extension:get("action_two")

	if input_fire then
		self._reload_canceled = true

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

	local interactor_extension = self._interactor_extension

	if CharacterStateHelper.is_starting_interaction(input_extension, interactor_extension) then
		interactor_extension:start_interaction("interacting")

		if interactor_extension:allow_movement_during_interaction() then
			return
		end

		local config = interactor_extension:interaction_config()
		local params = self._temp_params

		params.swap_to_3p = config.swap_to_3p
		params.show_weapons = config.show_weapons
		params.activate_block = config.activate_block
		params.allow_rotation_update = config.allow_rotation_update
		self._reload_canceled = true

		csm:change_state("interacting", params)

		return
	end

	self:_update_movement(unit, t, dt)
	CharacterStateHelper.look(input_extension, self._player.viewport_name, self._first_person_extension, status_extension, self._inventory_extension)
end

RatlingGunnerStateReloading._get_player_camera = function (self)
	local player = self._player
	local viewport_name = player.viewport_name
	local viewport = ScriptWorld.viewport(self._world, viewport_name)
	local camera = ScriptViewport.camera(viewport)

	return camera
end

RatlingGunnerStateReloading.on_exit = function (self, unit, input, dt, context, t, next_state)
	if not Managers.state.network:in_game_session() then
		return
	end

	local breed = self.breed

	self._finish_time = nil
	self._done_priming = false
	self._prime_time = nil
	self._anim_shoot_started = false

	self:set_breed_action("n/a")

	local data = self._blackboard.attack_pattern_data or {}

	if not self._reload_canceled then
		data.current_ammo = data.max_ammo
	else
		self._career_extension:reduce_activated_ability_cooldown_percent(1, 2)
		self._career_extension:reduce_activated_ability_cooldown_percent(1)
	end

	local first_person_extension = self._first_person_extension

	first_person_extension:play_hud_sound_event("Stop_player_ratling_gunner_weapon_reload")
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "cooldown_ready")
	CharacterStateHelper.play_animation_event(self._unit, "cooldown_ready")
end

RatlingGunnerStateReloading._update_movement = function (self, unit, t, dt, progress)
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

	local reload_progress = self._career_extension:current_ability_cooldown_percentage(self._reload_ability_id)
	local movement_speed = math.lerp(self._reload_movement_speed.finish, self._reload_movement_speed.start, reload_progress^self._reload_movement_speed.rate)
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

	CharacterStateHelper.move_on_ground(first_person_extension, input_extension, self._locomotion_extension, move_input_direction, final_move_speed, unit)
	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, self._status_extension, self._inventory_extension)

	self.current_movement_speed_scale = current_movement_speed_scale
end
