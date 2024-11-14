-- chunkname: @scripts/unit_extensions/default_player_unit/versus_horde_ability_extension.lua

VersusHordeAbilityExtension = class(VersusHordeAbilityExtension)

local CLIENT_PAUSE_SYNC_DURATION = 2

VersusHordeAbilityExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.is_server = Managers.player.is_server
	self._horde_ability_system = Managers.state.entity:system("versus_horde_ability_system")
	self._settings = self._horde_ability_system:settings()
	self._unit = unit
	self.network_manager = Managers.state.network
	self._game = Managers.state.network:game()
	self._world = extension_init_context.world

	if self.is_server then
		self:create_ability_game_object()

		self._ability_charge = 0
		self._cooldown_mod = 0
		self._boost_mod = 0
	end

	self._audio_system = Managers.state.entity:system("audio_system")
	self._cooldown = self._horde_ability_system:cooldown()
	self._pause_sync_until = 0
	self._own_peer_id = Network.peer_id()
end

VersusHordeAbilityExtension._activate = function (self, t)
	self._horde_ability_system:activate_dark_pact_horde_ability()

	self._pause_sync_until = t + CLIENT_PAUSE_SYNC_DURATION
	self._fully_charged = false

	if self._unit and POSITION_LOOKUP[self._unit] then
		self._audio_system:play_audio_position_event("Play_versus_pactsworn_horde_ability", POSITION_LOOKUP[self._unit])
	end

	local game_mode = Managers.state.game_mode and Managers.state.game_mode:game_mode()
	local local_player = Managers.player:local_player()

	if local_player then
		game_mode:activated_ability_telemetry("versus_horde_ability", local_player)
	end
end

VersusHordeAbilityExtension.extensions_ready = function (self, world, unit)
	self._input_extension = ScriptUnit.has_extension(unit, "input_system")
	self._ghost_mode_extension = ScriptUnit.extension(unit, "ghost_mode_system")
end

VersusHordeAbilityExtension.update = function (self, t)
	if self._owner_peer_id ~= self._own_peer_id then
		return
	end

	if t < self._pause_sync_until then
		return
	end

	local cooldown_ready = self:get_ability_charge(t) >= self:cooldown()

	if cooldown_ready and not self._fully_charged then
		self._audio_system:play_sound_local("Play_versus_pactsworn_horde_ability_ready")

		self._fully_charged = true
	end

	local input_activated = self._input_extension and self._input_extension:get("versus_horde_ability")
	local is_in_ghost_mode = self._ghost_mode_extension:is_in_ghost_mode()
	local is_activation_allowed = cooldown_ready and self._horde_ability_system:is_activation_allowed(is_in_ghost_mode)

	if input_activated then
		if is_activation_allowed then
			self:_activate(t)
		else
			local wwise_world = Managers.world:wwise_world(self._world)

			WwiseWorld.trigger_event(wwise_world, "versus_hud_ability_not_ready")
		end
	end
end

VersusHordeAbilityExtension.destroy = function (self)
	if self.network_manager:game() and self.is_server then
		self.network_manager:destroy_game_object(self._ability_go_id)

		self._ability_go_id = nil
	end
end

VersusHordeAbilityExtension.create_ability_game_object = function (self)
	fassert(self.is_server, "Trying to create ability game object on a client")

	local unit = self._unit
	local go_id = self.network_manager:unit_game_object_id(unit)
	local game_object_data_table = {
		ability_charge = 0,
		boost_mod = 0,
		cooldown_mod = 0,
		go_type = NetworkLookup.go_types.dark_pact_horde_ability,
		unit_game_object_id = go_id,
	}
	local callback = callback(self, "cb_game_session_disconnect")
	local ability_object_id = self.network_manager:create_game_object("dark_pact_horde_ability", game_object_data_table, callback)

	self:set_ability_game_object_id(ability_object_id)
end

VersusHordeAbilityExtension.set_ability_game_object_id = function (self, id)
	self._ability_go_id = id
end

VersusHordeAbilityExtension.get_ability_charge = function (self, t)
	if self.is_server then
		return self._ability_charge
	end

	if t < self._pause_sync_until then
		return 0
	end

	if self._game and self._ability_go_id then
		local ability_charge = GameSession.game_object_field(self._game, self._ability_go_id, "ability_charge")

		return ability_charge
	end

	return 0
end

VersusHordeAbilityExtension.get_charge_modifiers = function (self)
	local cooldown_mod = 0
	local boost_mod = 0

	if self._game and self._ability_go_id then
		if self.is_server then
			cooldown_mod = self._cooldown_mod
			boost_mod = self._boost_mod
		else
			cooldown_mod = GameSession.game_object_field(self._game, self._ability_go_id, "cooldown_mod")
			boost_mod = GameSession.game_object_field(self._game, self._ability_go_id, "boost_mod")
		end
	end

	return cooldown_mod, boost_mod
end

VersusHordeAbilityExtension.server_set_ability_charge = function (self, ability_charge, cooldown_mod, boost_mod)
	cooldown_mod = cooldown_mod * 100
	boost_mod = boost_mod * 100

	if self._game and self._ability_go_id then
		GameSession.set_game_object_field(self._game, self._ability_go_id, "ability_charge", ability_charge)
		GameSession.set_game_object_field(self._game, self._ability_go_id, "cooldown_mod", cooldown_mod)
		GameSession.set_game_object_field(self._game, self._ability_go_id, "boost_mod", boost_mod)
	end

	if self.is_server then
		self._ability_charge = ability_charge
		self._cooldown_mod = cooldown_mod
		self._boost_mod = boost_mod
	end
end

VersusHordeAbilityExtension.cooldown = function (self)
	return self._cooldown
end

VersusHordeAbilityExtension.cb_game_session_disconnect = function (self)
	return
end

VersusHordeAbilityExtension.unit = function (self)
	return self._unit
end

VersusHordeAbilityExtension.game_object_initialized = function (self, unit, go_id)
	local game_session = Managers.state.network:game()

	self._go_id = go_id
	self._owner_peer_id = GameSession.game_object_field(game_session, go_id, "owner_peer_id")
end
