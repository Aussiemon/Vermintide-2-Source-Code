CareerAbilityWEShade = class(CareerAbilityWEShade)
CareerAbilityWEShade.init = function (self, extension_init_context, unit, extension_init_data)
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
	self._effect_id = nil

	return 
end
CareerAbilityWEShade.extensions_ready = function (self, world, unit)
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
CareerAbilityWEShade.destroy = function (self)
	return 
end
CareerAbilityWEShade.update = function (self, unit, input, dt, context, t)
	if not self._ability_available(self) then
		return 
	end

	local input_extension = self._input_extension

	if input_extension and input_extension.get(input_extension, "action_career") then
		self._run_ability(self)
	end

	return 
end
CareerAbilityWEShade._ability_available = function (self)
	local career_extension = self._career_extension
	local status_extension = self._status_extension

	return career_extension.can_use_activated_ability(career_extension) and not status_extension.is_disabled(status_extension)
end
CareerAbilityWEShade._run_ability = function (self)
	local owner_unit = self._owner_unit
	local local_player = self._local_player

	if self._effect_id then
		local world = self._world

		World.destroy_particles(world, self._effect_id)

		self._effect_id = nil
	end

	local network_manager = self._network_manager
	local network_transmit = network_manager.network_transmit
	local status_extension = self._status_extension
	local career_extension = self._career_extension
	local buff_extension = self._buff_extension
	local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	local buff_name = nil

	if talent_extension.has_talent(talent_extension, "kerillian_shade_activated_ability_duration", "wood_elf", true) then
		buff_name = "kerillian_shade_activated_ability_duration"
	else
		buff_name = "kerillian_shade_activated_ability"
	end

	buff_extension.add_buff(buff_extension, buff_name, {
		attacker_unit = owner_unit
	})

	if local_player then
		local first_person_extension = self._first_person_extension

		first_person_extension.play_hud_sound_event(first_person_extension, "Play_career_ability_kerillian_shade_enter", nil, true)
		first_person_extension.play_hud_sound_event(first_person_extension, "Play_career_ability_kerillian_shade_loop")
		first_person_extension.animation_event(first_person_extension, "shade_stealth_ability")

		MOOD_BLACKBOARD.skill_shade = true

		career_extension.set_state(career_extension, "kerillian_activate_shade")
	end

	status_extension.set_invisible(status_extension, true)
	status_extension.set_noclip(status_extension, true)
	career_extension.start_activated_ability_cooldown(career_extension)
	self._play_vo(self)

	return 
end
CareerAbilityWEShade._play_vo = function (self)
	local owner_unit = self._owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input.trigger_networked_dialogue_event(dialogue_input, "activate_ability", event_data)

	return 
end

return 
