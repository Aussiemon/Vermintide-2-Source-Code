-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state.lua

require("scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state_helper")

EnemyCharacterState = class(EnemyCharacterState)

EnemyCharacterState.init = function (self, character_state_init_context, name)
	local unit = character_state_init_context.unit
	local breed = Unit.get_data(unit, "breed")

	self.name = name
	self._world = character_state_init_context.world
	self._physics_world = World.get_data(self._world, "physics_world")
	self._wwise_world = Managers.world:wwise_world(self._world)
	self._unit = unit
	self._breed = breed
	self._csm = character_state_init_context.csm
	self._player = character_state_init_context.player
	self._network_transmit = character_state_init_context.network_transmit
	self._unit_storage = character_state_init_context.unit_storage
	self._nav_world = character_state_init_context.nav_world
	self._is_server = Managers.player.is_server
	self._temp_params = {}
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._input_extension = ScriptUnit.extension(unit, "input_system")
	self._interactor_extension = ScriptUnit.extension(unit, "interactor_system")
	self._inventory_extension = ScriptUnit.extension(unit, "inventory_system")
	self._career_extension = ScriptUnit.extension(unit, "career_system")
	self._health_extension = ScriptUnit.extension(unit, "health_system")
	self._locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
	self._first_person_extension = ScriptUnit.extension(unit, "first_person_system")
	self._status_extension = ScriptUnit.extension(unit, "status_system")
	self._ghost_mode_extension = ScriptUnit.extension(unit, "ghost_mode_system")
	self._overcharge_extension = ScriptUnit.extension(unit, "overcharge_system")
	self._first_person_unit = self._first_person_extension:get_first_person_unit()
	self._particle_ids = {}
	self._left_wpn_particle_name = nil
	self._left_wpn_particle_node_name = nil
	self._right_wpn_particle_name = nil
	self._right_wpn_particle_node_name = nil
	self._weighted_taunt_values = {}
	self._taunt_timer = 0
	self._max_taunt_distance = 30
	self._taunt_cooldown = 20
end

EnemyCharacterState.on_exit = function (self, unit, input, dt, context, t, next_state)
	self:destroy_particles()
end

EnemyCharacterState.handle_disabled_ghost_mode = function (self)
	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()

	if in_ghost_mode and Development.parameter("disable_ghost_mode") then
		local force_leave = true

		ghost_mode_extension:try_leave_ghost_mode(force_leave)
	end
end

EnemyCharacterState.set_breed_action = function (self, breed_action_name)
	local breed_name = Unit.get_data(self._unit, "breed").name

	if not Managers.state.network:game() then
		return
	end

	if self._is_server then
		self._status_extension:set_breed_action(breed_name, breed_action_name)
	else
		local breed_id = NetworkLookup.breeds[breed_name]
		local breed_action_id = NetworkLookup.bt_action_names[breed_action_name]
		local unit_go_id = Managers.state.unit_storage:go_id(self._unit)

		Managers.state.network.network_transmit:send_rpc_server("rpc_set_action_data", unit_go_id, breed_id, breed_action_id)
	end
end

EnemyCharacterState.has_move_input = function (self)
	local input_extension = self._input_extension

	return CharacterStateHelper.has_move_input(input_extension)
end

EnemyCharacterState.has_jump_input = function (self)
	local input_extension = self._input_extension

	return input_extension:get("jump") or input_extension:get("jump_only")
end

EnemyCharacterState.has_movement_input = function (self)
	local is_moving = false

	is_moving = is_moving or self:has_move_input()
	is_moving = is_moving or self:has_jump_input()

	return is_moving
end

EnemyCharacterState.to_movement_state = function (self)
	local csm = self._csm
	local locomotion_extension = self._locomotion_extension

	if self:has_move_input() then
		csm:change_state("walking")
	elseif self:has_jump_input() and locomotion_extension:jump_allowed() then
		local first_person_extension = self._first_person_extension

		csm:change_state("jumping")
		first_person_extension:change_state("jumping")
	else
		csm:change_state("standing")
	end
end

EnemyCharacterState.update_movement = function (self, unit, t, dt, movement_speed, play_3p_anim, play_1p_anim)
	local input_extension = self._input_extension
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local is_moving = CharacterStateHelper.has_move_input(input_extension)
	local current_movement_speed_scale = self.current_movement_speed_scale or 0

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

	local current_max_move_speed = movement_speed
	local buff_extension = self._buff_extension
	local buffed_move_speed = buff_extension:apply_buffs_to_value(current_max_move_speed, "movement_speed")
	local final_move_speed = buffed_move_speed * current_movement_speed_scale * movement_settings_table.player_speed_scale
	local movement = Vector3(0, 0, 0)
	local move_input = CharacterStateHelper.get_movement_input(input_extension)

	if move_input then
		movement = movement + move_input
	end

	local first_person_extension = self._first_person_extension
	local move_input_direction = Vector3.normalize(movement)

	CharacterStateHelper.move_on_ground(first_person_extension, input_extension, self._locomotion_extension, move_input_direction, final_move_speed, unit)
	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, self._status_extension, self._inventory_extension)

	if play_3p_anim or play_1p_anim then
		local move_anim_3p, move_anim_1p = CharacterStateHelper.get_move_animation(self._locomotion_extension, input_extension, self._status_extension, self.move_anim_3p)

		if play_3p_anim and move_anim_3p ~= self.move_anim_3p then
			CharacterStateHelper.play_animation_event(unit, move_anim_3p)

			self.move_anim_3p = move_anim_3p
		end

		if play_1p_anim and move_anim_1p ~= self.move_anim_1p then
			CharacterStateHelper.play_animation_event_first_person(first_person_extension, move_anim_1p)

			self.move_anim_1p = move_anim_1p
		end
	end

	self.current_movement_speed_scale = current_movement_speed_scale
end

EnemyCharacterState.create_particles = function (self)
	if #self._particle_ids == 0 then
		local lh_weapon_unit, rh_weapon_unit = self._inventory_extension:get_all_weapon_unit()

		if lh_weapon_unit and self._left_wpn_particle_name then
			self:_create_particle_for_weapon(lh_weapon_unit, self._left_wpn_particle_name, self._left_wpn_particle_node_name)
		end

		if rh_weapon_unit and self._right_wpn_particle_name then
			self:_create_particle_for_weapon(rh_weapon_unit, self._right_wpn_particle_name, self._right_wpn_particle_node_name)
		end
	end
end

EnemyCharacterState._create_particle_for_weapon = function (self, weapon_unit, particle_name, node_name)
	local node_id = node_name and Unit.node(weapon_unit, node_name) or 0
	local particle_id = ScriptWorld.create_particles_linked(self._world, particle_name, weapon_unit, node_id, "destroy")

	self._particle_ids[#self._particle_ids + 1] = particle_id
end

EnemyCharacterState.destroy_particles = function (self)
	local particle_ids = self._particle_ids

	for i = 1, #particle_ids do
		local id = particle_ids[i]

		World.stop_spawning_particles(self._world, id)
	end

	table.clear(particle_ids)
end

EnemyCharacterState.check_enemies_in_range_vfx = function (self, ...)
	local enemy_unit_in_range = EnemyCharacterStateHelper.get_enemies_in_line_of_sight(self._unit, self._first_person_unit, self._physics_world, ...)

	if enemy_unit_in_range then
		self:create_particles()
	else
		self:destroy_particles()
	end
end

EnemyCharacterState._update_taunt_dialogue = function (self, t)
	local ghost_mode_extension = self._ghost_mode_extension

	if ghost_mode_extension:is_in_ghost_mode() then
		return
	end

	if t <= self._taunt_timer then
		return
	end

	self._taunt_timer = t + self._taunt_cooldown

	local first_person_unit = self._first_person_unit
	local unit = self._unit
	local player_manager = Managers.player
	local player_position = POSITION_LOOKUP[first_person_unit]
	local player_rotation = Unit.world_rotation(first_person_unit, 0)
	local player_direction = Vector3.normalize(Quaternion.forward(player_rotation))
	local side = Managers.state.side.side_by_unit[unit]
	local enemy_units = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS
	local enemies_in_los = {}

	for enemy_unit, _ in pairs(enemy_units) do
		local enemy_position = Unit.world_position(enemy_unit, Unit.node(enemy_unit, "c_spine"))
		local target_distance = Vector3.distance(enemy_position, player_position)

		if target_distance <= self._max_taunt_distance and EnemyCharacterStateHelper.is_infront_player(player_position, player_direction, enemy_position) then
			local target_direction = Vector3.normalize(enemy_position - player_position)
			local hit, _, _, _, _ = PhysicsWorld.immediate_raycast(self._physics_world, player_position, target_direction, target_distance, "closest", "collision_filter", "filter_husk_in_line_of_sight")

			if not hit then
				enemies_in_los[#enemies_in_los + 1] = enemy_unit
			end
		end
	end

	local weights = {}

	for i, unit in ipairs(enemies_in_los) do
		local profile_name = player_manager:owner(unit):profile_display_name()
		local value = self._weighted_taunt_values[profile_name]

		if not value then
			value = 1
			self._weighted_taunt_values[profile_name] = value
		end

		weights[i] = 1 / value
	end

	if #weights > 0 then
		local p, a = LoadedDice.create(weights, false)
		local i = LoadedDice.roll(p, a)
		local unit = enemies_in_los[i]
		local profile_name = player_manager:owner(unit):profile_display_name()

		self._weighted_taunt_values[profile_name] = self._weighted_taunt_values[profile_name] + 1

		local dialogue_input = ScriptUnit.extension_input(self._unit, "dialogue_system")
		local event_name = "taunting_" .. profile_name
		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_networked_dialogue_event(event_name, event_data)
	end
end

EnemyCharacterState.debug_display_ratling_gunner_ammo = function (self, unit, current_ammo)
	Managers.state.event:trigger("on_dark_pact_ammo_changed", unit, current_ammo)
end
