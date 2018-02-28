CareerAbilityWHCaptain = class(CareerAbilityWHCaptain)
CareerAbilityWHCaptain.init = function (self, extension_init_context, unit, extension_init_data)
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
	self._priming_fx_id = nil
	self._priming_fx_name = "fx/chr_ironbreaker_aoe_decal"

	return 
end
CareerAbilityWHCaptain.extensions_ready = function (self, world, unit)
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
CareerAbilityWHCaptain.destroy = function (self)
	return 
end
CareerAbilityWHCaptain.update = function (self, unit, input, dt, context, t)
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
CareerAbilityWHCaptain._ability_available = function (self)
	local career_extension = self._career_extension
	local status_extension = self._status_extension

	return career_extension.can_use_activated_ability(career_extension) and not status_extension.is_disabled(status_extension)
end
CareerAbilityWHCaptain._start_priming = function (self)
	local world = self._world
	local effect_name = self._priming_fx_name
	self._priming_fx_id = World.create_particles(world, effect_name, Vector3.zero())
	self._is_priming = true

	return 
end
CareerAbilityWHCaptain._update_priming = function (self, dt)
	local effect_id = self._priming_fx_id

	if effect_id then
		local world = self._world
		local owner_unit = self._owner_unit
		local owner_unit_position = POSITION_LOOKUP[owner_unit]

		World.move_particles(world, effect_id, owner_unit_position)
	end

	return 
end
CareerAbilityWHCaptain._stop_priming = function (self)
	local world = self._world
	local effect_id = self._priming_fx_id

	if effect_id then
		World.destroy_particles(world, effect_id)

		self._priming_fx_id = nil
	end

	self._is_priming = false

	return 
end
CareerAbilityWHCaptain._run_ability = function (self, new_initial_speed)
	self._stop_priming(self)

	local world = self._world
	local owner_unit = self._owner_unit
	local is_server = self._is_server
	local local_player = self._local_player
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	local buff_system = Managers.state.entity:system("buff_system")
	local buff_to_add = "victor_witchhunter_activated_ability_crit_buff"

	if talent_extension.has_talent(talent_extension, "victor_witchhunter_activated_ability_radius", "witch_hunter", true) then
		buff_to_add = "victor_witchhunter_activated_ability_duration"
	end

	if self._effect_id then
		World.destroy_particles(world, self._effect_id)

		self._effect_id = nil
	end

	self._is_priming = false
	local network_manager = self._network_manager
	local network_transmit = network_manager.network_transmit
	local player_manager = Managers.player
	local status_extension = self._status_extension
	local career_extension = self._career_extension

	CharacterStateHelper.play_animation_event(owner_unit, "witch_hunter_active_ability")

	local radius = 10

	if talent_extension.has_talent(talent_extension, "victor_witchhunter_activated_ability_radius", "witch_hunter", true) then
		radius = 15
	end

	local nearby_player_units = FrameTable.alloc_table()
	local proximity_extension = Managers.state.entity:system("proximity_system")
	local broadphase = proximity_extension.player_units_broadphase

	Broadphase.query(broadphase, POSITION_LOOKUP[owner_unit], radius, nearby_player_units)

	local heal_type_id = NetworkLookup.heal_types.buff
	local fatigue_type_id = NetworkLookup.fatigue_types.career_victor_captain
	local revivable_units = FrameTable.alloc_table()
	local owner_unit_go_id = network_manager.unit_game_object_id(network_manager, owner_unit)

	for _, player_unit in pairs(nearby_player_units) do
		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			if is_server then
				buff_system.add_buff(buff_system, player_unit, buff_to_add, owner_unit, true)
			else
				local buff_template_name_id = NetworkLookup.buff_templates[buff_to_add]
				local unit_object_id = network_manager.unit_game_object_id(network_manager, player_unit)

				network_transmit.send_rpc_server(network_transmit, "rpc_add_buff", unit_object_id, buff_template_name_id, owner_unit_go_id, 0, true)
			end
		end
	end

	local explosion_template_name = "victor_captain_activated_ability_stagger"
	local explosion_template = ExplosionTemplates[explosion_template_name]
	local scale = 1
	local damage_source = "career_ability"
	local is_husk = false
	local position = POSITION_LOOKUP[owner_unit]
	local rotation = Quaternion.identity()
	local career_power_level = career_extension.get_career_power_level(career_extension)

	DamageUtils.create_explosion(world, owner_unit, position, rotation, explosion_template, scale, damage_source, is_server, is_husk, owner_unit, career_power_level)

	local explosion_template_id = NetworkLookup.explosion_templates[explosion_template_name]
	local damage_source_id = NetworkLookup.damage_sources[damage_source]

	if is_server then
		network_transmit.send_rpc_clients(network_transmit, "rpc_create_explosion", owner_unit_go_id, false, position, rotation, explosion_template_id, scale, damage_source_id, career_power_level)
	else
		network_transmit.send_rpc_server(network_transmit, "rpc_create_explosion", owner_unit_go_id, false, position, rotation, explosion_template_id, scale, damage_source_id, career_power_level)
	end

	if local_player then
		local first_person_extension = self._first_person_extension

		first_person_extension.animation_event(first_person_extension, "ability_shout")
		WwiseUtils.trigger_position_event(self._world, "Play_career_ability_captain_shout_out", position)
	end

	self._play_vo(self)
	self._play_vfx(self)
	career_extension.start_activated_ability_cooldown(career_extension)

	return 
end
CareerAbilityWHCaptain._play_vo = function (self)
	local owner_unit = self._owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input.trigger_networked_dialogue_event(dialogue_input, "activate_ability", event_data)

	return 
end
CareerAbilityWHCaptain._play_vfx = function (self)
	local owner_unit = self._owner_unit
	local network_manager = self._network_manager
	local network_transmit = network_manager.network_transmit
	local owner_unit_id = network_manager.unit_game_object_id(network_manager, owner_unit)
	local effect_name = "fx/chr_kruber_shockwave"
	local effect_id = NetworkLookup.effects[effect_name]
	local game_object_id = owner_unit_id
	local node_id = 0
	local offset = Vector3(0, 0, 0)
	local rotation_offset = Quaternion.identity()
	local linked = false

	Managers.state.event:trigger("event_play_particle_effect", effect_name, owner_unit, node_id, offset, rotation_offset, linked)

	if Managers.player.is_server then
		network_transmit.send_rpc_clients(network_transmit, "rpc_play_particle_effect", effect_id, game_object_id, node_id, offset, rotation_offset, linked)
	else
		network_transmit.send_rpc_server(network_transmit, "rpc_play_particle_effect", effect_id, game_object_id, node_id, offset, rotation_offset, linked)
	end

	return 
end

return 
