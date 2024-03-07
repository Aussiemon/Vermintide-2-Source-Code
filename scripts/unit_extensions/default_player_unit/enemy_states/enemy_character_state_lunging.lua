-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state_lunging.lua

local POSITION_LOOKUP = POSITION_LOOKUP

EnemyCharacterStateLunging = class(EnemyCharacterStateLunging, EnemyCharacterState)

EnemyCharacterStateLunging.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "lunging")

	self._direction = Vector3Box()
	self._last_position = Vector3Box()
end

EnemyCharacterStateLunging._on_enter_animation = function (self, unit, anim_event, variable_name, variable_value, first_person_anim_event)
	if variable_name then
		CharacterStateHelper.play_animation_event_with_variable_float(unit, anim_event, variable_name, variable_value)
	else
		CharacterStateHelper.play_animation_event(unit, anim_event)
	end

	local first_person_extension = self._first_person_extension

	CharacterStateHelper.play_animation_event_first_person(first_person_extension, first_person_anim_event or anim_event)
end

EnemyCharacterStateLunging.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local unit = self._unit
	local input_extension = self._input_extension
	local first_person_extension = self._first_person_extension
	local status_extension = self._status_extension
	local lunge_data = status_extension.do_lunge

	self._lunge_data = lunge_data
	status_extension.do_lunge = false
	self._career_extension = ScriptUnit.extension(unit, "career_system")

	local first_person_unit = first_person_extension:get_first_person_unit()

	self._first_person_unit = first_person_unit
	self.damage_start_time = lunge_data.damage_start_time and t + lunge_data.damage_start_time or t

	local forward_direction = Quaternion.forward(self._first_person_extension:current_rotation())

	Vector3.set_z(forward_direction, 0)

	forward_direction = Vector3.normalize(forward_direction)

	local flat_rotation = Quaternion.look(forward_direction, Vector3.up())

	Unit.set_local_rotation(unit, 0, flat_rotation)
	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, self._inventory_extension)
	self:_on_enter_animation(unit, lunge_data.animation_event, lunge_data.animation_variable_name, lunge_data.animation_variable_value, lunge_data.first_person_animation_event)

	self._num_impacts = 0
	self._amount_of_mass_hit = 0
	self._hit_units = {}
	self._start_time = t

	self._last_position:store(POSITION_LOOKUP[unit])
	self._direction:store(forward_direction)

	self._falling = false

	local lunge_events = lunge_data.lunge_events

	if lunge_events then
		local start_event_function = lunge_events.start

		if start_event_function then
			start_event_function(self)
		end
	end

	first_person_extension:disable_rig_movement()

	local damage_settings = lunge_data.damage

	if damage_settings then
		local career_power_level = self._career_extension:get_career_power_level()
		local power_level_multiplier = damage_settings.power_level_multiplier
		local damage_profile_name = damage_settings.damage_profile or "default"
		local damage_profile_id, power_level, hit_zone_id, ignore_shield, allow_backstab = self:_parse_attack_data(damage_settings)

		self.damage_profile_id = NetworkLookup.damage_profiles[damage_profile_name]

		local damage_profile = DamageProfileTemplates[damage_profile_name]

		self.damage_profile = damage_profile

		local difficulty_level = Managers.state.difficulty:get_difficulty()
		local cleave_power_level = ActionUtils.scale_power_levels(power_level, "cleave", unit, difficulty_level)
		local max_targets_attack, max_targets_impact = ActionUtils.get_max_targets(damage_profile, cleave_power_level)

		self.max_targets_attack = max_targets_attack
		self.max_targets_impact = max_targets_impact
		self.max_targets = max_targets_impact < max_targets_attack and max_targets_attack or max_targets_impact
	end

	if lunge_data.dodge and Managers.state.network:game() then
		status_extension:set_is_dodging(true)

		local network_manager = Managers.state.network
		local unit_id = network_manager:unit_game_object_id(unit)

		network_manager.network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.dodging, true, unit_id, 0)
	end
end

EnemyCharacterStateLunging.on_exit = function (self, unit, input, dt, context, t, next_state)
	local data = self._lunge_data
	local hit = self._hit
	local fp_anim_end_event = data.first_person_animation_end_event

	if fp_anim_end_event then
		CharacterStateHelper.play_animation_event_first_person(self._first_person_extension, fp_anim_end_event)
	end

	local anim_end_event = data.animation_end_event

	if anim_end_event then
		if data.animation_variable_name and data.animation_variable_value then
			CharacterStateHelper.play_animation_event_with_variable_float(unit, anim_end_event, data.animation_variable_name, data.animation_variable_value)
		else
			CharacterStateHelper.play_animation_event(unit, anim_end_event)
		end
	end

	local lunge_events = self._lunge_data.lunge_events

	if lunge_events then
		local finished_event_function = lunge_events.finished

		if finished_event_function then
			finished_event_function(self)
		end
	end

	if data.lunge_finish then
		data.lunge_finish(unit)
	end

	if data.dodge and Managers.state.network:game() then
		self._status_extension:set_is_dodging(false)

		local network_manager = Managers.state.network
		local unit_id = network_manager:unit_game_object_id(unit)

		network_manager.network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.dodging, false, unit_id, 0)
	end

	if self._falling and next_state ~= "falling" then
		ScriptUnit.extension(unit, "whereabouts_system"):set_no_landing()
	end

	self._lunge_data = nil
	self._hit = nil

	self._first_person_extension:enable_rig_movement()
end

EnemyCharacterStateLunging.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local unit = self._unit
	local first_person_unit = self._first_person_unit
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local whereabouts_extension = ScriptUnit.extension(unit, "whereabouts_system")
	local first_person_extension = self._first_person_extension
	local damage_start_time = self.damage_start_time
	local stop = false

	if CharacterStateHelper.is_colliding_down(unit) then
		if self._falling then
			self._falling = false

			whereabouts_extension:set_landed()
		end

		whereabouts_extension:set_is_onground()
	elseif not self._falling then
		self._falling = true

		whereabouts_extension:set_fell(self.name)
	end

	local lunge_data = self._lunge_data
	local lunge_events = lunge_data.lunge_events

	if lunge_events then
		local first_event_data = lunge_events[1]
		local start_time = self._start_time

		while first_event_data do
			if first_event_data.t < t - start_time then
				local event_function = first_event_data.event_function

				event_function(self)
				table.remove(lunge_events, 1)

				first_event_data = lunge_events[1]
			else
				break
			end
		end
	end

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return
	end

	if CharacterStateHelper.is_using_transport(status_extension) then
		csm:change_state("using_transport")

		return
	end

	if CharacterStateHelper.is_overcharge_exploding(status_extension) then
		csm:change_state("overcharge_exploding")

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

	if not stop then
		local damage_data = lunge_data.damage

		if damage_data and damage_start_time <= t then
			stop = self:_update_damage(unit, dt, t, damage_data)
		end

		local input_service = Managers.input:get_service("Player")

		if input_service:get("action_two", true) then
			local position = POSITION_LOOKUP[unit]
			local forward_direction = Quaternion.forward(first_person_extension:current_rotation())

			self:_do_blast(position, forward_direction)

			stop = true
		end

		if not self:_update_movement(unit, dt, t, lunge_data) and not stop then
			local position = POSITION_LOOKUP[unit]
			local forward_direction = Quaternion.forward(first_person_extension:current_rotation())

			self:_do_blast(position, forward_direction)

			stop = true
		end
	end

	if stop then
		if not self._csm.state_next and self._falling then
			csm:change_state("falling", self._temp_params)

			self._temp_params.hit = false

			first_person_extension:change_state("falling")

			return
		else
			csm:change_state("walking", self._temp_params)

			self._temp_params.hit = false

			first_person_extension:change_state("walking")

			return
		end
	end

	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, self._inventory_extension, 0.5)
end

EnemyCharacterStateLunging._update_movement = function (self, unit, dt, t, lunge_data)
	if self._falling then
		return self:_move_in_air(unit, dt, t, lunge_data)
	end

	return self:_move_on_ground(unit, dt, t, lunge_data)
end

EnemyCharacterStateLunging._move_on_ground = function (self, unit, dt, t, lunge_data)
	local locomotion_extension = self._locomotion_extension
	local first_person_extension = self._first_person_extension
	local duration = lunge_data.duration
	local lunge_time = t - self._start_time
	local move_direction

	if lunge_data.allow_rotation then
		local forward_direction = Quaternion.forward(first_person_extension:current_rotation())

		move_direction = Vector3.normalize(Vector3.flat(forward_direction))
	else
		move_direction = self._direction:unbox()
	end

	local speed_function = lunge_data.speed_function
	local speed

	if speed_function then
		speed = speed_function(lunge_time, duration)
	else
		local max_speed = lunge_data.initial_speed

		speed = math.lerp(lunge_data.initial_speed, lunge_data.falloff_to_speed, math.min(lunge_time / duration, 1))
	end

	local base_speed = 1

	if base_speed < speed then
		locomotion_extension:set_wanted_velocity(move_direction * base_speed)
		locomotion_extension:set_script_movement_time_scale(speed / base_speed)
	else
		locomotion_extension:set_wanted_velocity(move_direction * speed)
	end

	return lunge_time < duration
end

EnemyCharacterStateLunging._move_in_air = function (self, unit, dt, t, lunge_data)
	local locomotion_extension = self._locomotion_extension
	local first_person_extension = self._first_person_extension
	local duration = lunge_data.duration
	local lunge_time = t - self._start_time
	local move_direction

	if lunge_data.allow_rotation then
		local forward_direction = Quaternion.forward(first_person_extension:current_rotation())

		move_direction = Vector3.normalize(Vector3.flat(forward_direction))
	else
		move_direction = self._direction:unbox()
	end

	local speed_function = lunge_data.speed_function
	local speed

	if speed_function then
		speed = speed_function(lunge_time, duration)
	else
		local max_speed = lunge_data.initial_speed

		speed = math.lerp(lunge_data.initial_speed, lunge_data.falloff_to_speed, math.min(lunge_time / duration, 1))
	end

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local prev_move_velocity = Vector3.flat(locomotion_extension:current_velocity())
	local new_move_velocity = prev_move_velocity + move_direction * speed
	local new_move_speed = Vector3.length(new_move_velocity)
	local new_move_direction = Vector3.normalize(new_move_velocity)

	locomotion_extension:set_wanted_velocity(new_move_direction * speed)

	return lunge_time < duration
end

EnemyCharacterStateLunging._parse_attack_data = function (self, damage_settings)
	local career_power_level = self._career_extension:get_career_power_level()
	local power_level_multiplier = damage_settings.power_level_multiplier
	local power_level = career_power_level * power_level_multiplier
	local damage_profile_name = damage_settings.damage_profile or "default"
	local damage_profile_id = NetworkLookup.damage_profiles[damage_profile_name]
	local hit_zone_hit_name = damage_settings.hit_zone_hit_name
	local hit_zone_id = NetworkLookup.hit_zones[hit_zone_hit_name]

	return damage_profile_id, power_level, hit_zone_id, damage_settings.ignore_shield, damage_settings.allow_backstab
end

EnemyCharacterStateLunging._calculate_hit_mass = function (self, shield_blocked, current_action, hit_unit, breed)
	if breed and HEALTH_ALIVE[hit_unit] then
		local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
		local hit_mass_total = shield_blocked and (breed.hit_mass_counts_block and (breed.hit_mass_counts_block[difficulty_rank] or breed.hit_mass_counts_block[2]) or breed.hit_mass_count_block) or breed.hit_mass_counts and (breed.hit_mass_counts[difficulty_rank] or breed.hit_mass_counts[2]) or breed.hit_mass_count or 1
		local action_mass_override = current_action.hit_mass_count

		if action_mass_override and action_mass_override[breed.name] then
			local mass_cost_multiplier = current_action.hit_mass_count[breed.name]

			hit_mass_total = hit_mass_total * (mass_cost_multiplier or 1)
		end

		self._amount_of_mass_hit = self._amount_of_mass_hit + hit_mass_total
	else
		shield_blocked = false
	end

	return shield_blocked
end

EnemyCharacterStateLunging._update_damage = function (self, unit, dt, t, damage_data)
	local padding = damage_data.depth_padding
	local half_width = 0.5 * damage_data.width
	local half_height = 0.5 * damage_data.height
	local new_pos = POSITION_LOOKUP[unit]
	local old_pos = self._last_position:unbox()
	local delta_move = new_pos - old_pos
	local half_length = Vector3.length(delta_move) * 0.5 + padding
	local rot = Quaternion.look(delta_move, Vector3.up())
	local first_person_extension = self._first_person_extension
	local forward_direction = Quaternion.forward(first_person_extension:current_rotation())
	local mid_pos = (new_pos + old_pos) * 0.5 + Vector3(0, 0, half_height) + (damage_data.offset_forward or 0) * forward_direction
	local size = Vector3(half_width, half_length, half_height)
	local collision_filter = damage_data.collision_filter
	local actors, num_actors = PhysicsWorld.immediate_overlap(self._physics_world, "shape", "oobb", "position", mid_pos, "rotation", rot, "size", size, "collision_filter", collision_filter)
	local hit_units = self._hit_units
	local buff_extension = self._buff_extension
	local network_manager = Managers.state.network
	local attacker_unit_id = network_manager:unit_game_object_id(unit)
	local attack_direction = Vector3.normalize(delta_move)
	local weapon_system = Managers.state.entity:system("weapon_system")

	for i = 1, num_actors do
		local hit_actor = actors[i]
		local hit_unit = Actor.unit(hit_actor)

		if not hit_units[hit_unit] then
			hit_units[hit_unit] = true

			local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
			local hit_unit_pos = POSITION_LOOKUP[hit_unit]
			local shield_blocked = false
			local backstab_multiplier = 1
			local breed = Unit.get_data(hit_unit, "breed")
			local damage_profile_id, power_level, hit_zone_id, ignore_shield, allow_backstab = self:_parse_attack_data(damage_data)

			if breed and HEALTH_ALIVE[hit_unit] then
				shield_blocked = not ignore_shield and AiUtils.attack_is_shield_blocked(hit_unit, unit)

				if allow_backstab then
					local owner_to_hit_dir = Vector3.normalize(hit_unit_pos - new_pos)
					local hit_unit_direction = Quaternion.forward(Unit.local_rotation(hit_unit, 0))
					local hit_angle = Vector3.dot(hit_unit_direction, owner_to_hit_dir)
					local behind_target = hit_angle >= 0.55

					if behind_target then
						local procced = false

						backstab_multiplier, procced = buff_extension:apply_buffs_to_value(backstab_multiplier, "backstab_multiplier")
					end
				end

				shield_blocked = self:_calculate_hit_mass(shield_blocked, damage_data, hit_unit, breed)
			else
				shield_blocked = false
			end

			if breed and HEALTH_ALIVE[hit_unit] then
				local final_stagger_direction

				if damage_data.stagger_angles then
					local owner_to_hit_dir = Vector3.normalize(hit_unit_pos - new_pos)
					local cross = Vector3.cross(Vector3.flat(owner_to_hit_dir), Vector3.flat(forward_direction))
					local additional_stagger_angle = Math.random(damage_data.stagger_angles.min, damage_data.stagger_angles.max) * (cross.z < 0 and -1 or 1)
					local new_attack_direction = attack_direction

					new_attack_direction.x = math.cos(additional_stagger_angle) * attack_direction.x - math.sin(additional_stagger_angle) * attack_direction.y
					new_attack_direction.y = math.sin(additional_stagger_angle) * attack_direction.x + math.cos(additional_stagger_angle) * attack_direction.y
					final_stagger_direction = Vector3.normalize(new_attack_direction)
				else
					final_stagger_direction = attack_direction
				end

				local damage_source = "career_ability"
				local damage_source_id = NetworkLookup.damage_sources[damage_source]
				local actual_hit_target_index
				local shield_break_procc = false
				local boost_curve_multiplier = 0
				local is_critical_strike = false
				local can_damage = true
				local can_stagger = true

				weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, final_stagger_direction, damage_profile_id, "power_level", power_level, "hit_target_index", actual_hit_target_index, "blocking", shield_blocked, "shield_break_procced", shield_break_procc, "boost_curve_multiplier", boost_curve_multiplier, "is_critical_strike", is_critical_strike, "can_damage", can_damage, "can_stagger", can_stagger)

				self._num_impacts = self._num_impacts + 1

				local lunge_events = self._lunge_data.lunge_events

				if lunge_events then
					local impact_event_function = lunge_events.impact

					if impact_event_function then
						impact_event_function(self)
					end
				end

				if self._lunge_data.first_person_hit_animation_event then
					CharacterStateHelper.play_animation_event_first_person(first_person_extension, self._lunge_data.first_person_hit_animation_event)
				end

				local hit_mass_count_reached = self._amount_of_mass_hit >= self.max_targets or breed.armor_category == 2 or breed.armor_category == 3

				if HEALTH_ALIVE[hit_unit] and (damage_data.interrupt_on_first_hit or hit_mass_count_reached and damage_data.interrupt_on_max_hit_mass) then
					self:_do_blast(new_pos, forward_direction)

					return true
				end
			end
		end
	end

	self._last_position:store(new_pos)

	return false
end

local hit_units = {}

EnemyCharacterStateLunging._do_blast = function (self, new_pos, forward_direction)
	self._hit = true

	local lunge_data = self._lunge_data
	local damage_data = lunge_data.damage
	local blast_damage_data = damage_data and damage_data.on_interrupt_blast

	if blast_damage_data then
		local physics_world = self._physics_world
		local collision_filter = blast_damage_data.collision_filter
		local network_manager = Managers.state.network
		local weapon_system = Managers.state.entity:system("weapon_system")
		local unit = self._unit
		local attacker_unit_id = network_manager:unit_game_object_id(unit)
		local radius = blast_damage_data.radius
		local blast_pos = new_pos + forward_direction * radius
		local actors, num_actors = PhysicsWorld.immediate_overlap(physics_world, "shape", "sphere", "position", blast_pos, "size", radius, "collision_filter", collision_filter)

		table.clear(hit_units)

		for i = 1, num_actors do
			local hit_actor = actors[i]
			local hit_unit = Actor.unit(hit_actor)

			if not hit_units[hit_unit] then
				hit_units[hit_unit] = true

				local breed = Unit.get_data(hit_unit, "breed")

				if breed then
					local damage_profile_id, power_level, hit_zone_id, ignore_shield, allow_backstab = self:_parse_attack_data(blast_damage_data)
					local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
					local damage_source = "career_ability"
					local damage_source_id = NetworkLookup.damage_sources[damage_source]
					local attack_direction = Vector3.normalize(blast_pos - POSITION_LOOKUP[hit_unit])
					local boost_curve_multiplier = 0
					local actual_hit_target_index
					local shield_blocked = not ignore_shield and AiUtils.attack_is_shield_blocked(hit_unit, unit)
					local shield_break_procc = false
					local is_critical_strike = false
					local can_damage = true
					local can_stagger = true

					weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, attack_direction, damage_profile_id, "power_level", power_level, "hit_target_index", actual_hit_target_index, "blocking", shield_blocked, "shield_break_procced", shield_break_procc, "boost_curve_multiplier", boost_curve_multiplier, "is_critical_strike", is_critical_strike, "can_damage", can_damage, "can_stagger", can_stagger)
				end
			end
		end
	end
end
