-- chunkname: @scripts/unit_extensions/default_player_unit/states/player_character_state_charged.lua

PlayerCharacterStateCharged = class(PlayerCharacterStateCharged, PlayerCharacterState)

PlayerCharacterStateCharged.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "charged")

	local context = character_state_init_context

	self.inputs_to_buffer = {
		action_career = true,
		action_career_release = true,
		action_one = true,
		wield_1 = true,
		wield_2 = true,
		wield_3 = true,
		wield_4 = true,
		wield_4_alt = true,
		wield_5 = true,
		wield_switch = true,
	}
	self.movement_speed = 0
	self.movement_speed_limit = 1
	self.last_input_direction = Vector3Box(0, 0, 0)
	self.look_override = Vector3Box(0, 0, 0)
end

PlayerCharacterStateCharged.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	CharacterStateHelper.stop_weapon_actions(self.inventory_extension, "charged")
	CharacterStateHelper.stop_career_abilities(self.career_extension, "charged")
	CharacterStateHelper.play_animation_event_first_person(self.first_person_extension, params.first_person_anim_name)
	CharacterStateHelper.play_animation_event(unit, params.third_person_anim_name)

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local hit_react_type = params.hit_react_type or "light"

	assert(movement_settings_table.hit_react_settings[hit_react_type])

	local hit_react_settings = movement_settings_table.hit_react_settings[hit_react_type]
	local look_override_x, look_override_y = hit_react_settings.look_override_function()

	self.movement_speed = hit_react_settings.movement_speed_modifier
	self.movement_speed_modifier = hit_react_settings.movement_speed_modifier
	self.end_look_sense_override = hit_react_settings.end_look_sense_override
	self.start_look_sense_override = hit_react_settings.start_look_sense_override

	local duration = hit_react_settings.duration_function()
	local onscreen_particle = hit_react_settings.onscreen_particle_function(duration)
	local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

	if first_person_extension and onscreen_particle then
		self.onscreen_particle_id = first_person_extension:create_screen_particles(onscreen_particle)
	end

	if first_person_extension then
		first_person_extension:play_hud_sound_event("Play_enemy_bestigor_charge_impact")
		first_person_extension:set_wanted_player_height("charged", t, duration / 2)
	end

	self.last_input_direction:store(Vector3(0, 0, 0))

	if look_override_y and look_override_x then
		self.look_override:store(Vector3(look_override_x, look_override_y, 0))
	end

	self.duration = duration
	self.time_in_state = 0
	self.end_time = t + duration
	self.next_pulse = 0
	self.current_stagger_speed = 1
	self.last_stagger = Vector3Box(0, 0, 0)

	print("-----Enter charged")
end

PlayerCharacterStateCharged.on_exit = function (self, unit, input, dt, context, t, next_state)
	local input_extension = self.input_extension

	if input_extension:get("action_one_hold") then
		input_extension:add_stun_buffer("action_one_hold")
	end

	local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

	if first_person_extension and self.onscreen_particle_id then
		first_person_extension:stop_spawning_screen_particles(self.onscreen_particle_id)
	end

	if first_person_extension then
		first_person_extension:set_wanted_player_height("stand", t, 0.2)
	end

	self.status_extension:set_charged(false)

	if CharacterStateHelper.is_block_broken(self.status_extension) then
		self.status_extension:set_block_broken(false)
	end

	print("-----Exit charged")
end

PlayerCharacterStateCharged.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local unit = self.unit
	local input_extension = self.input_extension
	local inventory_extension = self.inventory_extension
	local status_extension = self.status_extension
	local locomotion_extension = self.locomotion_extension
	local world = self.world
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local first_person_extension = self.first_person_extension

	self.time_in_state = self.time_in_state + dt

	if first_person_extension then
		local reached_half_time = self.time_in_state >= self.duration / 2

		if reached_half_time then
			first_person_extension:set_wanted_player_height("stand", t, self.duration / 2)
		end
	end

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm, "charged") then
		return
	end

	if CharacterStateHelper.is_ledge_hanging(world, unit, self.temp_params) then
		csm:change_state("ledge_hanging", self.temp_params)

		return
	end

	if t > self.end_time then
		csm:change_state("standing")

		return
	end

	if CharacterStateHelper.is_overcharge_exploding(status_extension) then
		csm:change_state("overcharge_exploding")

		return
	end

	self:queue_input(input, input_extension, inventory_extension)

	local is_moving = CharacterStateHelper.has_move_input(input_extension)
	local inventory_extension = self.inventory_extension
	local player = Managers.player:owner(unit)

	if is_moving then
		self.movement_speed = math.min(0.75, self.movement_speed + movement_settings_table.move_acceleration_up * dt)
	elseif player and player.bot_player then
		self.movement_speed = 0
	else
		self.movement_speed = math.max(self.movement_speed_limit, self.movement_speed - movement_settings_table.move_acceleration_down * dt)
	end

	local walking = input_extension:get("walk")
	local move_speed = status_extension:is_crouching() and movement_settings_table.crouch_move_speed or walking and movement_settings_table.walk_move_speed or movement_settings_table.move_speed
	local move_speed_multiplier = status_extension:current_move_speed_multiplier()

	if walking ~= self.walking then
		status_extension:set_slowed(walking)
	end

	move_speed = move_speed * move_speed_multiplier
	move_speed = move_speed * movement_settings_table.player_speed_scale
	move_speed = move_speed * self.movement_speed

	local movement = Vector3(0, 0, 0)
	local move_input = input_extension:get("move")

	if move_input then
		movement = movement + move_input
	end

	local move_input_controller = input_extension:get("move_controller")

	if move_input_controller then
		local controller_length = Vector3.length(move_input_controller)

		if controller_length > 0 then
			move_speed = move_speed * controller_length
		end

		movement = movement + move_input_controller
	end

	local stagger

	if t > self.next_pulse then
		stagger = Vector3(2 * (math.random() - 0.5), 2 * (math.random() - 0.5), 0)

		local stagger_direction = Vector3.normalize(stagger)
		local stagger_speed = Vector3.length(stagger)

		self.next_pulse = t + 0.2

		self.last_stagger:store(stagger)

		self.current_stagger_speed = 1
	end

	movement = movement + self.last_stagger:unbox()
	self.current_stagger_speed = math.max(0, self.current_stagger_speed - movement_settings_table.move_acceleration_down * dt)
	move_speed = move_speed * self.current_stagger_speed * self.movement_speed_modifier

	local move_input_direction

	move_input_direction = Vector3.normalize(movement)

	if Vector3.length(move_input_direction) == 0 then
		move_input_direction = self.last_input_direction:unbox()
	else
		self.last_input_direction:store(move_input_direction)
	end

	CharacterStateHelper.move_on_ground(first_person_extension, input_extension, locomotion_extension, move_input_direction, move_speed, unit)

	self.walking = walking

	if not csm.state_next and not locomotion_extension:is_on_ground() then
		csm:change_state("falling")

		return
	end

	local look_override

	if self.look_override then
		look_override = self.look_override:unbox()
	end

	local percentage_done = self.time_in_state / self.duration
	local look_sense_override = math.min(self.end_look_sense_override, math.lerp(self.start_look_sense_override, 1, percentage_done))

	CharacterStateHelper.look(input_extension, self.player.viewport_name, self.first_person_extension, status_extension, self.inventory_extension, look_sense_override, look_override)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, self.health_extension)
	self.look_override:store(0, 0, 0)
end

PlayerCharacterStateCharged.queue_input = function (self, input, input_extension, inventory_extension)
	local wield_input = CharacterStateHelper.wield_input(input_extension, inventory_extension, "action_wield")

	if wield_input then
		input_extension:add_buffer(wield_input)
	end

	for input, buffer in pairs(self.inputs_to_buffer) do
		if input_extension:get(input) then
			input_extension:add_stun_buffer(input)

			break
		end
	end
end
