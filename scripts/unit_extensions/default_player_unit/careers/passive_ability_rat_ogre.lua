-- chunkname: @scripts/unit_extensions/default_player_unit/careers/passive_ability_rat_ogre.lua

PassiveAbilityRatOgre = class(PassiveAbilityRatOgre)

local RPCS = {
	"rpc_start_leap",
	"rpc_stop_leap",
}

PassiveAbilityRatOgre.init = function (self, extension_init_context, unit, extension_init_data, ability_init_data)
	self._unit = unit
	self._is_server = extension_init_context.is_server
	self._is_remote_player = extension_init_data.player and extension_init_data.player.remote
	self._jump_from_pos = Vector3Box(0, 0, 0)
	self._jump_to_pos = Vector3Box(0, 0, 0)
	self._update_anim_variables = false
	self._network_event_delegate = Managers.state.network.network_transmit.network_event_delegate
	self._network_transmit = Managers.state.network.network_transmit

	self:register_rpcs(self._network_event_delegate)

	self._anim_value = 0
end

PassiveAbilityRatOgre.register_rpcs = function (self, network_event_delegate)
	self._network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
end

PassiveAbilityRatOgre.unregister_rpcs = function (self)
	if self._network_event_delegate then
		self._network_event_delegate:unregister(self)

		self._network_event_delegate = nil
	end
end

PassiveAbilityRatOgre.extensions_ready = function (self, world, unit)
	self._career_extension = ScriptUnit.extension(unit, "career_system")

	if not self._is_remote_player then
		self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	end
end

PassiveAbilityRatOgre.destroy = function (self)
	self:unregister_rpcs()
end

PassiveAbilityRatOgre.rpc_start_leap = function (self, channel_id, from_position, to_position)
	if self._is_server then
		if not DEDICATED_SERVER then
			self:set_leap_data(from_position, to_position)
		end

		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self._network_transmit:send_rpc_clients_except("rpc_start_leap", peer_id, from_position, to_position)
	else
		self:set_leap_data(from_position, to_position)
	end
end

PassiveAbilityRatOgre.rpc_stop_leap = function (self, channel_id)
	if self._is_server then
		if not DEDICATED_SERVER then
			self:stop()
		end

		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self._network_transmit:send_rpc_clients_except("rpc_stop_leap", peer_id)
	else
		self:stop()
	end
end

PassiveAbilityRatOgre.start_leap = function (self, from_position, to_position)
	if not self._is_server and not self._is_remote_player then
		self._network_transmit:send_rpc_server("rpc_start_leap", from_position, to_position)
		self:set_leap_data(from_position, to_position)
	elseif self._is_server and not DEDICATED_SERVER then
		self._network_transmit:send_rpc_clients("rpc_start_leap", from_position, to_position)
		self:set_leap_data(from_position, to_position)
	elseif self._is_server then
		self._network_transmit:send_rpc_clients("rpc_start_leap", from_position, to_position)
	end
end

PassiveAbilityRatOgre.set_leap_data = function (self, from_position, to_position)
	if not DEDICATED_SERVER then
		Vector3Box.store(self._jump_from_pos, from_position)
		Vector3Box.store(self._jump_to_pos, to_position)

		self._update_anim_variables = true

		local unit = self._unit

		if not self._is_remote_player then
			self._first_person_extension:play_animation_event("attack_jump_air")
		end

		Unit.animation_event(unit, "attack_jump_air")
	end
end

PassiveAbilityRatOgre.stop_leap = function (self)
	if not self._is_server and not self._is_remote_player then
		self._network_transmit:send_rpc_server("rpc_stop_leap")
		self:stop()
	elseif self._is_server and not DEDICATED_SERVER then
		self._network_transmit:send_rpc_clients("rpc_stop_leap")
		self:stop()
	elseif self._is_server then
		self._network_transmit:send_rpc_clients("rpc_stop_leap")
	end
end

PassiveAbilityRatOgre.stop = function (self)
	self._update_anim_variables = false

	local unit = self._unit

	if not Unit.alive(unit) then
		return
	end

	if self._anim_value and self._anim_value > 0.2 then
		if not self._is_remote_player then
			self._first_person_extension:play_animation_event("attack_jump_land")
		end

		Unit.animation_event(unit, "attack_jump_land")
	else
		if not self._is_remote_player then
			self._first_person_extension:play_animation_event("cancel_priming")
		end

		Unit.animation_event(unit, "cancel_priming")
	end
end

PassiveAbilityRatOgre.update = function (self, dt, t)
	if self._update_anim_variables then
		local unit = self._unit

		if not Unit.alive(unit) then
			self._update_anim_variables = false

			return
		end

		local current_position = POSITION_LOOKUP[unit]
		local starting_pos = self._jump_from_pos:unbox()
		local projected_hit_pos = self._jump_to_pos:unbox()
		local distance_travelled = Vector3.length(current_position - starting_pos)
		local percentage_done = distance_travelled / Vector3.length(projected_hit_pos - starting_pos)

		self._anim_value = math.clamp(percentage_done * 2, 0, 2)

		local anim_variable = "jump_rotation"
		local variable_index = Unit.animation_find_variable(unit, anim_variable)

		if self._is_remote_player then
			Unit.animation_set_variable(unit, variable_index, self._anim_value)
		else
			Unit.animation_set_variable(unit, variable_index, self._anim_value)
			self._first_person_extension:animation_set_variable(anim_variable, self._anim_value)
		end
	end
end
