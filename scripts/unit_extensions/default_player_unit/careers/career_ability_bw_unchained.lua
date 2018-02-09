CareerAbilityBWUnchained = class(CareerAbilityBWUnchained)
CareerAbilityBWUnchained.init = function (self, extension_init_context, unit, extension_init_data)
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
CareerAbilityBWUnchained.extensions_ready = function (self, world, unit)
	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self._status_extension = ScriptUnit.extension(unit, "status_system")
	self._career_extension = ScriptUnit.extension(unit, "career_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")

	if self._first_person_extension then
		self._first_person_unit = self._first_person_extension:get_first_person_unit()
	end

	return 
end
CareerAbilityBWUnchained.destroy = function (self)
	return 
end
CareerAbilityBWUnchained.update = function (self, unit, input, dt, context, t)
	if not self._ability_available(self) then
		return 
	end

	local input_service = self._input_manager:get_service("Player")

	if not self._is_priming then
		if input_service.get(input_service, "function_career") then
			self._start_priming(self)
		end
	elseif self._is_priming then
		self._update_priming(self, dt)

		if input_service.get(input_service, "action_two") then
			self._stop_priming(self)

			return 
		end

		if input_service.get(input_service, "function_career_release") then
			self._run_ability(self)
		end
	end

	return 
end
CareerAbilityBWUnchained._ability_available = function (self)
	local career_extension = self._career_extension
	local status_extension = self._status_extension
	local activated_ability_data = career_extension.get_activated_ability_data(career_extension)

	return self._local_player and not self._bot_player and career_extension.can_use_activated_ability(career_extension) and not status_extension.is_disabled(status_extension)
end
CareerAbilityBWUnchained._start_priming = function (self)
	local world = self._world
	local effect_name = self._priming_fx_name
	self._priming_fx_id = World.create_particles(world, effect_name, Vector3.zero())
	self._is_priming = true

	return 
end
CareerAbilityBWUnchained._update_priming = function (self, dt)
	local effect_id = self._priming_fx_id

	if effect_id then
		local world = self._world
		local owner_unit = self._owner_unit
		local owner_unit_position = POSITION_LOOKUP[owner_unit]

		World.move_particles(world, effect_id, owner_unit_position)
	end

	return 
end
CareerAbilityBWUnchained._stop_priming = function (self)
	local world = self._world
	local effect_id = self._priming_fx_id

	if effect_id then
		World.destroy_particles(world, effect_id)

		self._priming_fx_id = nil
	end

	self._is_priming = false

	return 
end
CareerAbilityBWUnchained._run_ability = function (self, new_initial_speed)
	self._stop_priming(self)

	local world = self._world
	local owner_unit = self._owner_unit
	local is_server = self._is_server
	local local_player = self._local_player
	local network_manager = self._network_manager
	local network_transmit = network_manager.network_transmit
	local status_extension = self._status_extension
	local career_extension = self._career_extension
	local buff_extension = self._buff_extension
	local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	local buff_name = "sienna_unchained_activated_ability"
	local unit_object_id = network_manager.unit_game_object_id(network_manager, owner_unit)
	local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

	buff_extension.add_buff(buff_extension, buff_name, {
		attacker_unit = owner_unit
	})

	if local_player then
		local overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")

		overcharge_extension.reset(overcharge_extension)
		career_extension.set_state(career_extension, "sienna_activate_unchained")
	end

	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input.trigger_networked_dialogue_event(dialogue_input, "activate_ability", event_data)

	local position = POSITION_LOOKUP[owner_unit]
	local rotation = Unit.local_rotation(owner_unit, 0)
	local explosion_template = "explosion_bw_unchained_ability"
	local scale = 1

	if talent_extension.has_talent(talent_extension, "sienna_unchained_activated_ability_radius", "bright_wizard", true) then
		explosion_template = "explosion_bw_unchained_ability_increased_radius"
	end

	local career_power_level = career_extension.get_career_power_level(career_extension)
	local area_damage_system = Managers.state.entity:system("area_damage_system")

	area_damage_system.create_explosion(area_damage_system, owner_unit, position, rotation, explosion_template, scale, "career_ability", career_power_level)
	career_extension.start_activated_ability_cooldown(career_extension)
	CharacterStateHelper.play_animation_event(owner_unit, "unchained_ability_explosion")

	if local_player then
		local first_person_extension = self._first_person_extension

		first_person_extension.animation_event(first_person_extension, "unchained_ability_explosion")
	end

	self._play_vo(self)

	return 
end
CareerAbilityBWUnchained._play_vo = function (self)
	local owner_unit = self._owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input.trigger_networked_dialogue_event(dialogue_input, "activate_ability", event_data)

	return 
end

return 
