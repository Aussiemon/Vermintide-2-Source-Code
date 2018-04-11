CareerAbilityWHZealot = class(CareerAbilityWHZealot)
CareerAbilityWHZealot.init = function (self, extension_init_context, unit, extension_init_data)
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
	self._decal_unit = nil
	self._decal_unit_name = "units/decals/decal_arrow_saltzpyre"
	self._fov_lerp_time = 0

	return 
end
CareerAbilityWHZealot.extensions_ready = function (self, world, unit)
	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self._status_extension = ScriptUnit.extension(unit, "status_system")
	self._career_extension = ScriptUnit.extension(unit, "career_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._input_extension = ScriptUnit.has_extension(unit, "input_system")

	if self._first_person_extension then
		self._first_person_unit = self._first_person_extension:get_first_person_unit()
	end

	return 
end
CareerAbilityWHZealot.destroy = function (self)
	return 
end
CareerAbilityWHZealot.update = function (self, unit, input, dt, context, t)
	if not self._ability_available(self) then
		return 
	end

	local input_extension = self._input_extension

	if not input_extension then
		return 
	end

	if not self._is_priming then
		if input_extension.get(input_extension, "action_career") then
			self._start_priming(self)
		end
	elseif self._is_priming then
		self._update_priming(self, dt)

		if input_extension.get(input_extension, "action_two") then
			self._stop_priming(self)

			return 
		end

		if input_extension.get(input_extension, "action_career_release") then
			self._run_ability(self)
		end
	end

	return 
end
CareerAbilityWHZealot._ability_available = function (self)
	local career_extension = self._career_extension
	local status_extension = self._status_extension

	return career_extension.can_use_activated_ability(career_extension) and not status_extension.is_disabled(status_extension)
end
CareerAbilityWHZealot._start_priming = function (self)
	if self._local_player then
		local decal_unit_name = self._decal_unit_name
		local unit_spawner = Managers.state.unit_spawner
		self._decal_unit = unit_spawner.spawn_local_unit(unit_spawner, decal_unit_name)
	end

	local buff_extension = self._buff_extension
	local buff_template_name = "planted_decrease_movement"
	local buff_params = {
		external_optional_multiplier = 0.3
	}
	self._buff_id = buff_extension.add_buff(buff_extension, buff_template_name, buff_params)
	self._is_priming = true

	return 
end
CareerAbilityWHZealot._update_priming = function (self, dt)
	if self._local_player then
		local first_person_extension = self._first_person_extension
		local player_position = Unit.local_position(self._owner_unit, 0)
		local player_rotation = first_person_extension.current_rotation(first_person_extension)
		local player_direction_flat = Vector3.flat(Vector3.normalize(Quaternion.forward(player_rotation)))
		local player_rotation_flat = Quaternion.look(player_direction_flat, Vector3.up())

		Unit.set_local_position(self._decal_unit, 0, player_position)
		Unit.set_local_rotation(self._decal_unit, 0, player_rotation_flat)

		local total_lerp_time = 1.9
		local lerp_value = self._fov_lerp_time / total_lerp_time
		local fov_multiplier = math.lerp(1, 1.07, lerp_value)
		self._fov_lerp_time = math.min(self._fov_lerp_time + dt, total_lerp_time)

		Managers.state.camera:set_additional_fov_multiplier(fov_multiplier)
	end

	return 
end
CareerAbilityWHZealot._stop_priming = function (self)
	if self._decal_unit then
		local unit_spawner = Managers.state.unit_spawner

		unit_spawner.mark_for_deletion(unit_spawner, self._decal_unit)
	end

	if self._buff_id then
		local buff_extension = self._buff_extension

		buff_extension.remove_buff(buff_extension, self._buff_id)

		self._buff_id = nil
	end

	if self._local_player then
		self._fov_lerp_time = 0

		Managers.state.camera:set_additional_fov_multiplier(1)
	end

	self._is_priming = false

	return 
end
CareerAbilityWHZealot._run_ability = function (self)
	self._stop_priming(self)

	local owner_unit = self._owner_unit
	local is_server = self._is_server
	local local_player = self._local_player
	local network_manager = self._network_manager
	local network_transmit = network_manager.network_transmit
	local status_extension = self._status_extension
	local career_extension = self._career_extension
	local buff_name = "victor_zealot_activated_ability"
	local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")

	if talent_extension.has_talent(talent_extension, "victor_zealot_activated_ability_heal", "witch_hunter", true) then
		buff_name = "victor_zealot_activated_ability_heal"
	end

	if talent_extension.has_talent(talent_extension, "victor_zealot_activated_ability_duration", "witch_hunter", true) then
		buff_name = "victor_zealot_activated_ability_duration"
	end

	local unit_object_id = network_manager.unit_game_object_id(network_manager, owner_unit)
	local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

	if is_server then
		local buff_extension = self._buff_extension

		buff_extension.add_buff(buff_extension, buff_name, {
			attacker_unit = owner_unit
		})
		network_transmit.send_rpc_clients(network_transmit, "rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
	else
		network_transmit.send_rpc_server(network_transmit, "rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
	end

	if local_player or (is_server and self._bot_player) then
		local first_person_extension = self._first_person_extension

		first_person_extension.play_hud_sound_event(first_person_extension, "Play_career_ability_victor_zealot_enter", nil, true)
		first_person_extension.play_hud_sound_event(first_person_extension, "Play_career_ability_victor_zealot_loop")

		if local_player then
			first_person_extension.animation_event(first_person_extension, "shade_stealth_ability")

			MOOD_BLACKBOARD.skill_zealot = true

			career_extension.set_state(career_extension, "victor_activate_zealot")

			local position = POSITION_LOOKUP[owner_unit]

			WwiseUtils.trigger_position_event(self._world, "Play_career_ability_zealot_charge", position)
		end
	end

	status_extension.set_noclip(status_extension, true)

	status_extension.do_lunge = {
		animation_end_event = "zealot_active_ability_charge_hit",
		allow_rotation = false,
		first_person_animation_end_event = "dodge_bwd",
		first_person_hit_animation_event = "charge_react",
		falloff_to_speed = 8,
		first_person_animation_event = "shade_stealth_ability",
		first_person_animation_end_event_hit = "dodge_bwd",
		duration = 0.75,
		initial_speed = 25,
		animation_event = "zealot_active_ability_charge_start",
		damage = {
			depth_padding = 0.4,
			height = 1.8,
			collision_filter = "filter_explosion_overlap_no_player",
			hit_zone_hit_name = "full",
			ignore_shield = true,
			interrupt_on_max_hit_mass = true,
			power_level_multiplier = 0.8,
			interrupt_on_first_hit = false,
			damage_profile = "heavy_slashing_linesman",
			width = 1.5,
			allow_backstab = true,
			stagger_angles = {
				max = 90,
				min = 45
			},
			on_interrupt_blast = {
				allow_backstab = false,
				radius = 3,
				power_level_multiplier = 1,
				hit_zone_hit_name = "full",
				damage_profile = "heavy_slashing_linesman",
				ignore_shield = false,
				collision_filter = "filter_explosion_overlap_no_player"
			}
		}
	}

	career_extension.start_activated_ability_cooldown(career_extension)
	self._play_vo(self)

	return 
end
CareerAbilityWHZealot._play_vo = function (self)
	local owner_unit = self._owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input.trigger_networked_dialogue_event(dialogue_input, "activate_ability", event_data)

	return 
end

return 
