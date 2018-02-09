CareerAbilityDRSlayer = class(CareerAbilityDRSlayer)
local segment_list = {}

local function get_leap_data(physics_world, own_position, target_position)
	local gravity = -PlayerUnitMovementSettings.gravity_acceleration
	local jump_speed = nil
	local jump_angle = math.pi/6
	local sections = 8
	local in_los, velocity, time_of_flight, hit_pos = nil
	local target_velocity = Vector3.zero()
	local acceptable_accuracy = 0.1

	if jump_speed then
		jump_angle, hit_pos = WeaponHelper.angle_to_hit_moving_target(own_position, target_position, jump_speed, target_velocity, -gravity, acceptable_accuracy)
	else
		jump_speed, hit_pos = WeaponHelper.speed_to_hit_moving_target(own_position, target_position, jump_angle, target_velocity, -gravity, acceptable_accuracy)
	end

	in_los, velocity, time_of_flight = WeaponHelper.test_angled_trajectory(physics_world, own_position, target_position, gravity, jump_speed, jump_angle, segment_list, sections, nil, true)

	fassert(in_los, "no landing location for leap")

	return velocity, time_of_flight, hit_pos
end

CareerAbilityDRSlayer.init = function (self, extension_init_context, unit, extension_init_data)
	self._owner_unit = unit
	self._world = extension_init_context.world
	self._wwise_world = Managers.world:wwise_world(self._world)
	local player = extension_init_data.player
	self._player = player
	self._is_server = player.is_server
	self._local_player = player.local_player
	self._bot_player = player.bot_player
	self._network_manager = Managers.state.network
	self._input_manager = Managers.input
	self._effect_name = "fx/chr_slayer_jump"
	self._effect_id = nil
	self._is_priming = false
	self._last_valid_landing_position = nil

	return 
end
CareerAbilityDRSlayer.extensions_ready = function (self, world, unit)
	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self._status_extension = ScriptUnit.extension(unit, "status_system")
	self._career_extension = ScriptUnit.extension(unit, "career_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	if self._first_person_extension then
		self._first_person_unit = self._first_person_extension:get_first_person_unit()
	end

	return 
end
CareerAbilityDRSlayer.destroy = function (self)
	return 
end
CareerAbilityDRSlayer.update = function (self, unit, input, dt, context, t)
	local input_service = self._input_manager:get_service("Player")

	if not self._is_priming then
		if not self._ability_available(self) then
			return 
		end

		if input_service.get(input_service, "function_career") then
			self._start_priming(self)
		end
	elseif self._is_priming then
		local landing_position = self._update_priming(self)

		if input_service.get(input_service, "action_two") or input_service.get(input_service, "jump") or input_service.get(input_service, "jump_only") then
			self._stop_priming(self)

			return 
		end

		if landing_position then
			self._last_valid_landing_position = Vector3Box(landing_position)
		end

		if input_service.get(input_service, "function_career_release") then
			self._run_ability(self)
		end
	end

	return 
end
CareerAbilityDRSlayer._ability_available = function (self)
	local career_extension = self._career_extension
	local status_extension = self._status_extension
	local locomotion_extension = self._locomotion_extension
	local activated_ability_data = career_extension.get_activated_ability_data(career_extension)

	return self._local_player and not self._bot_player and career_extension.can_use_activated_ability(career_extension) and not status_extension.is_disabled(status_extension) and locomotion_extension.is_on_ground(locomotion_extension)
end
CareerAbilityDRSlayer._start_priming = function (self)
	local world = self._world
	local effect_name = self._effect_name
	self._effect_id = World.create_particles(world, effect_name, Vector3.zero())
	self._is_priming = true

	return 
end
CareerAbilityDRSlayer._update_priming = function (self)
	local effect_id = self._effect_id
	local owner_unit = self._owner_unit
	local world = self._world
	local game = Managers.state.network:game()
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local physics_world = World.get_data(world, "physics_world")
	local unit_id = network_manager.unit_game_object_id(network_manager, owner_unit)
	local first_person_extension = self._first_person_extension
	local player_position = first_person_extension.current_position(first_person_extension)
	local player_rotation = first_person_extension.current_rotation(first_person_extension)
	local player_direction = Vector3.normalize(Quaternion.forward(player_rotation))
	local player_direction_flat = Vector3.normalize(Vector3.flat(player_direction))
	local cross = Vector3.cross(player_direction, Vector3.forward())

	if cross.x < 0 and not player_direction_flat then
	end

	local landing_position = nil
	local collision_filter = "filter_geiser_check"
	local result, hit_position, hit_distance, normal = PhysicsWorld.immediate_raycast(physics_world, player_position, player_direction, 10, "closest", "collision_filter", collision_filter)

	if result then
		landing_position = hit_position

		if Vector3.dot(normal, Vector3.up()) < 0.75 then
			local step_back = Vector3.normalize(hit_position - player_position)*1
			local step_back_position = hit_position - step_back
			local new_result, new_hit_position, new_hit_distance, new_normal = PhysicsWorld.immediate_raycast(physics_world, step_back_position, Vector3.down(), 100, "closest", "collision_filter", collision_filter)

			if new_result then
				landing_position = new_hit_position
			end
		end
	else
		landing_position = hit_position
		local new_result, new_hit_position, new_hit_distance, new_normal = PhysicsWorld.immediate_raycast(physics_world, player_position + player_direction*10, Vector3.down(), 100, "closest", "collision_filter", collision_filter)

		if new_result then
			landing_position = new_hit_position
		end
	end

	if landing_position then
		World.move_particles(world, effect_id, landing_position)
	end

	return landing_position
end
CareerAbilityDRSlayer._stop_priming = function (self)
	if self._effect_id then
		World.destroy_particles(self._world, self._effect_id)

		self._effect_id = nil
	end

	self._is_priming = false

	return 
end
CareerAbilityDRSlayer._run_ability = function (self)
	self._stop_priming(self)

	local world = self._world
	local owner_unit = self._owner_unit
	local is_server = self._is_server
	local local_player = self._local_player
	local network_manager = self._network_manager
	local network_transmit = network_manager.network_transmit
	local status_extension = self._status_extension
	local career_extension = self._career_extension
	local buff_name_1 = "bardin_slayer_activated_ability"
	local buff_name_2 = nil
	local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	local buff_2 = talent_extension.has_talent(talent_extension, "bardin_slayer_activated_ability_uninterruptible", "dwarf_ranger", true) or talent_extension.has_talent(talent_extension, "bardin_slayer_activated_ability_movement", "dwarf_ranger", true)

	if talent_extension.has_talent(talent_extension, "bardin_slayer_activated_ability_uninterruptible", "dwarf_ranger", true) then
		buff_name_2 = "bardin_slayer_activated_ability_uninterruptible"
	end

	if talent_extension.has_talent(talent_extension, "bardin_slayer_activated_ability_movement", "dwarf_ranger", true) then
		buff_name_2 = "bardin_slayer_activated_ability_movement"
	end

	local unit_object_id = network_manager.unit_game_object_id(network_manager, owner_unit)
	local buff_template_name_id_1 = NetworkLookup.buff_templates[buff_name_1]
	local buff_template_name_id_2 = nil

	if buff_2 then
		buff_template_name_id_2 = NetworkLookup.buff_templates[buff_name_2]
	end

	if is_server then
		local buff_extension = self._buff_extension

		buff_extension.add_buff(buff_extension, buff_name_1, {
			attacker_unit = owner_unit
		})
		network_transmit.send_rpc_clients(network_transmit, "rpc_add_buff", unit_object_id, buff_template_name_id_1, unit_object_id, 0, false)

		if buff_2 then
			buff_extension.add_buff(buff_extension, buff_name_2, {
				attacker_unit = owner_unit
			})
			network_transmit.send_rpc_clients(network_transmit, "rpc_add_buff", unit_object_id, buff_template_name_id_2, unit_object_id, 0, false)
		end
	else
		network_transmit.send_rpc_server(network_transmit, "rpc_add_buff", unit_object_id, buff_template_name_id_1, unit_object_id, 0, true)

		if buff_2 then
			network_transmit.send_rpc_server(network_transmit, "rpc_add_buff", unit_object_id, buff_template_name_id_2, unit_object_id, 0, true)
		end
	end

	if local_player then
		local first_person_extension = self._first_person_extension

		first_person_extension.play_hud_sound_event(first_person_extension, "Play_career_ability_bardin_slayer_enter", nil, true)
		first_person_extension.play_hud_sound_event(first_person_extension, "Play_career_ability_bardin_slayer_loop")

		MOOD_BLACKBOARD.skill_slayer = true

		career_extension.set_state(career_extension, "bardin_activate_slayer")
	end

	status_extension.set_noclip(status_extension, true)

	local has_impact_damage_buff = talent_extension.has_talent(talent_extension, "bardin_slayer_activated_ability_impact_damage", "dwarf_ranger", true)
	local landing_position = self._last_valid_landing_position:unbox()
	local physics_world = World.get_data(world, "physics_world")
	local velocity, time_of_flight, hit_pos = get_leap_data(physics_world, POSITION_LOOKUP[owner_unit], landing_position)
	status_extension.do_leap = {
		sfx_event_jump = "Play_career_ability_bardin_slayer_jump",
		anim_start_event = "jump_fwd",
		sfx_event_land = "Play_career_ability_bardin_slayer_impact",
		initial_velocity = Vector3Box(velocity),
		time_of_flight = time_of_flight,
		projected_hit_pos = Vector3Box(hit_pos),
		leap_finish = function (owner_unit)
			local position = POSITION_LOOKUP[owner_unit]
			local rotation = Unit.local_rotation(owner_unit, 0)
			local explosion_template = "bardin_slayer_activated_ability_landing_stagger"
			local scale = 1
			local career_power_level = career_extension:get_career_power_level()
			local area_damage_system = Managers.state.entity:system("area_damage_system")

			area_damage_system.create_explosion(area_damage_system, owner_unit, position, rotation, explosion_template, scale, "career_ability", career_power_level)
			ScriptUnit.extension(owner_unit, "status_system"):set_noclip(false)

			return 
		end
	}

	career_extension.start_activated_ability_cooldown(career_extension)
	self._play_vo(self)

	return 
end
CareerAbilityDRSlayer._play_vo = function (self)
	local owner_unit = self._owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input.trigger_networked_dialogue_event(dialogue_input, "activate_ability", event_data)

	return 
end

return 
