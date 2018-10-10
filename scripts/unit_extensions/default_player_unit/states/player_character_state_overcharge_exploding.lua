PlayerCharacterStateOverchargeExploding = class(PlayerCharacterStateOverchargeExploding, PlayerCharacterState)

PlayerCharacterStateOverchargeExploding.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "overcharge_exploding")

	self.movement_speed = 0
	self.movement_speed_limit = 1
	self.last_input_direction = Vector3Box(0, 0, 0)
	self.inside_inn = global_is_inside_inn
end

PlayerCharacterStateOverchargeExploding.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	CharacterStateHelper.stop_weapon_actions(self.inventory_extension, "exploding")
	CharacterStateHelper.stop_career_abilities(self.career_extension, "exploding")

	local unit = self.unit
	local input_extension = self.input_extension
	local first_person_extension = self.first_person_extension
	local status_extension = self.status_extension
	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	self.damage_timer = t + 0.5
	self.movement_speed = 0.2
	local move_anim_3p, move_anim_1p = CharacterStateHelper.get_move_animation(self.locomotion_extension, input_extension, status_extension)

	CharacterStateHelper.play_animation_event(unit, "explode_start")
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "explode_start")

	self.move_anim_3p = move_anim_3p
	self.move_anim_1p = move_anim_1p

	self.last_input_direction:store(Vector3.zero())

	self.explosion_time = t + 3
	self.has_exploded = false
	local overcharge_extension = ScriptUnit.extension(unit, "overcharge_system")
	self.explosion_template = overcharge_extension.explosion_template
	self.walking = false
	self.falling = false
end

PlayerCharacterStateOverchargeExploding.on_exit = function (self, unit, input, dt, context, t, next_state)
	if not Managers.state.network:game() or not next_state then
		return
	end

	CharacterStateHelper.play_animation_event(unit, "cooldown_end")
	CharacterStateHelper.play_animation_event_first_person(self.first_person_extension, "cooldown_end")

	local career_extension = ScriptUnit.extension(unit, "career_system")
	local career_name = career_extension:career_name()

	if not self.has_exploded and (career_name ~= "bw_unchained" or career_extension:get_state() ~= "sienna_activate_unchained") then
		self:explode()
	end

	if self.falling and next_state ~= "falling" then
		ScriptUnit.extension(unit, "whereabouts_system"):set_no_landing()
	end
end

PlayerCharacterStateOverchargeExploding.explode = function (self)
	self.has_exploded = true
	local unit = self.unit

	StatusUtils.set_overcharge_exploding(unit, false)

	local overcharge_extension = ScriptUnit.extension(unit, "overcharge_system")

	overcharge_extension:reset()

	if not self.inside_inn then
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local self_damage = health_extension:get_max_health()
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local _, procced = buff_extension:apply_buffs_to_value(0, StatBuffIndex.OVERCHARGE_DAMAGE_IMMUNITY)

		if not procced then
			DamageUtils.add_damage_network(unit, unit, self_damage, "torso", "overcharge", nil, Vector3(0, 1, 0), "overcharge")
		end
	end

	local position = POSITION_LOOKUP[unit] + Vector3(0, 1.5, 0)
	local rotation = Unit.local_rotation(unit, 0)
	local explosion_template = self.explosion_template
	local scale = 1

	Managers.state.entity:system("area_damage_system"):create_explosion(unit, position, rotation, explosion_template, scale, "overcharge", nil, false)
end

PlayerCharacterStateOverchargeExploding.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local world = self.world
	local unit = self.unit
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local input_extension = self.input_extension
	local status_extension = self.status_extension
	local locomotion_extension = self.locomotion_extension
	local whereabouts_extension = ScriptUnit.extension(unit, "whereabouts_system")
	local first_person_extension = self.first_person_extension

	if locomotion_extension:is_on_ground() then
		if self.falling then
			self.falling = false

			whereabouts_extension:set_landed()
		end

		whereabouts_extension:set_is_onground()
	elseif not self.falling then
		self.falling = true

		whereabouts_extension:set_fell()
	end

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return
	end

	local params = self.temp_params

	if CharacterStateHelper.is_ledge_hanging(world, unit, params) then
		csm:change_state("ledge_hanging", params)

		return
	end

	if (self.explosion_time <= t and not self.has_exploded) or not status_extension:is_overcharge_exploding() then
		if status_extension:is_overcharge_exploding() then
			self:explode()
		end

		if locomotion_extension:is_on_ground() then
			local is_moving = CharacterStateHelper.has_move_input(input_extension)

			if is_moving then
				csm:change_state("walking", params)
				first_person_extension:change_state("walking")
			else
				csm:change_state("standing", params)
				first_person_extension:change_state("standing")
			end
		else
			csm:change_state("falling", params)
			first_person_extension:change_state("falling")
		end

		return
	end

	if self.damage_timer < t then
		self.damage_timer = t + 0.5

		if not self.inside_inn then
			DamageUtils.add_damage_network(unit, unit, 10, "torso", "overcharge", nil, Vector3(0, 0, 1), "overcharge")
		end

		Managers.state.controller_features:add_effect("rumble", {
			rumble_effect = "overcharge_rumble_crit"
		})

		local player_locomotion = ScriptUnit.extension(unit, "locomotion_system")
		local push_direction = Vector3.normalize(Vector3(2 * (math.random() - 0.5), 2 * (math.random() - 0.5), 0))

		player_locomotion:add_external_velocity(push_direction, 10)

		self.movement_speed = math.random() * 0.5 + 0.15
		self.movement_speed_limit = self.movement_speed

		first_person_extension:animation_event("overheat_indicator")
	end

	local is_moving = CharacterStateHelper.has_move_input(input_extension)
	local inventory_extension = self.inventory_extension
	local player = Managers.player:owner(unit)

	if is_moving then
		self.movement_speed = math.min(1, self.movement_speed + movement_settings_table.move_acceleration_up * dt)
	elseif player and player.bot_player then
		self.movement_speed = 0
	else
		self.movement_speed = math.max(self.movement_speed_limit, self.movement_speed - movement_settings_table.move_acceleration_down * dt)
	end

	local walking = input_extension:get("walk")
	local move_speed = (status_extension:is_crouching() and movement_settings_table.crouch_move_speed) or (walking and movement_settings_table.walk_move_speed) or movement_settings_table.move_speed
	local move_speed_multiplier = status_extension:current_move_speed_multiplier()

	if walking ~= self.walking then
		status_extension:set_slowed(walking)
	end

	move_speed = move_speed * move_speed_multiplier
	move_speed = move_speed * movement_settings_table.player_speed_scale
	move_speed = move_speed * self.movement_speed
	local movement = Vector3(0, 0.9, 0)
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

	local move_input_direction = nil
	move_input_direction = Vector3.normalize(movement)

	if Vector3.length(move_input_direction) == 0 then
		move_input_direction = self.last_input_direction:unbox()
	else
		self.last_input_direction:store(move_input_direction)
	end

	CharacterStateHelper.move_on_ground(first_person_extension, input_extension, locomotion_extension, move_input_direction, move_speed, unit)
	CharacterStateHelper.look(input_extension, self.player.viewport_name, first_person_extension, status_extension, self.inventory_extension)

	local move_anim_3p, move_anim_1p = CharacterStateHelper.get_move_animation(locomotion_extension, input_extension, status_extension)

	if move_anim_3p ~= self.move_anim_3p or move_anim_1p ~= self.move_anim_1p then
		CharacterStateHelper.play_animation_event(unit, move_anim_3p)

		self.move_anim_3p = move_anim_3p
	end

	self.walking = walking
end

return
