-- chunkname: @scripts/unit_extensions/default_player_unit/careers/career_ability_corruptor_teleport.lua

CareerAbilityCorruptorTeleport = class(CareerAbilityCorruptorTeleport)

CareerAbilityCorruptorTeleport.init = function (self, extension_init_context, unit, extension_init_data, ability_data)
	self._unit = unit
	self._world = extension_init_context.world
	self._wwise_world = Managers.world:wwise_world(self._world)
	self._ability_data = ability_data

	local player = extension_init_data.player

	self._player = player
	self._is_server = player.is_server
	self._local_player = player.local_player
	self._bot_player = player.bot_player
	self._network_manager = Managers.state.network
	self._input_manager = Managers.input
end

CareerAbilityCorruptorTeleport.extensions_ready = function (self, world, unit)
	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self._status_extension = ScriptUnit.extension(unit, "status_system")
	self._career_extension = ScriptUnit.extension(unit, "career_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
	self._input_extension = ScriptUnit.has_extension(unit, "input_system")
	self._inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")
	self._ghost_mode_extension = ScriptUnit.has_extension(unit, "ghost_mode_system")
	self._ability_input = self._ability_data.input_action

	if self._first_person_extension then
		self._first_person_unit = self._first_person_extension:get_first_person_unit()
	end
end

CareerAbilityCorruptorTeleport.destroy = function (self)
	return
end

CareerAbilityCorruptorTeleport._ability_available = function (self)
	local career_extension = self._career_extension
	local status_extension = self._status_extension
	local locomotion_extension = self._locomotion_extension
	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()

	return career_extension:can_use_activated_ability() and not status_extension:is_disabled() and locomotion_extension:is_on_ground() and not in_ghost_mode
end

CareerAbilityCorruptorTeleport.update = function (self, unit, input, dt, context, t)
	return
end

CareerAbilityCorruptorTeleport.was_triggered = function (self)
	if not self:_ability_available() then
		return false
	end

	local input_extension = self._input_extension

	if not input_extension then
		return false
	end

	if input_extension:get(self._ability_input) then
		self:_start()

		return true
	end

	return false
end

CareerAbilityCorruptorTeleport.finish = function (self, reason)
	return
end

CareerAbilityCorruptorTeleport.stop = function (self, reason)
	return
end

CareerAbilityCorruptorTeleport._start = function (self)
	return
end
