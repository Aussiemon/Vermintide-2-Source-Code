-- chunkname: @scripts/unit_extensions/generic/shadow_flare_extension.lua

ShadowFlareExtension = class(ShadowFlareExtension)

ShadowFlareExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.owner_unit_id = extension_init_data.owner_unit_id
	self.glow_time = extension_init_data.glow_time or 10
	self.delete_time = extension_init_data.delete_time or 3
	self.initial_position = extension_init_data.initial_position
	self._timer = 0
	self._delete_timer = 0
	self._flare_done = false

	local owner_unit = Managers.state.unit_storage:unit(self.owner_unit_id)

	self._player = Managers.player:owner(owner_unit)
end

ShadowFlareExtension.flare_active = function (self)
	return not self._flare_done
end

ShadowFlareExtension.set_flare_done = function (self)
	self._flare_done = true
end

ShadowFlareExtension.update = function (self, unit, dt)
	if self._player.remote then
		return
	end

	local glow_time = self.glow_time
	local timer = self._timer

	if timer < 1 then
		timer = math.clamp(timer + dt / glow_time, 0, 1)

		if timer == 1 then
			local network_manager = Managers.state.network
			local unit_id = network_manager:unit_game_object_id(unit)

			if self._player.is_server then
				network_manager.network_transmit:send_rpc_clients("rpc_shadow_flare_done", unit_id)
			else
				network_manager.network_transmit:send_rpc_server("rpc_shadow_flare_done", unit_id)
			end

			self:set_flare_done()
		end

		self._timer = timer
	end

	if self._flare_done then
		self:delete_with_delay(unit, dt)
	end
end

ShadowFlareExtension.delete_with_delay = function (self, unit, dt)
	local deldete_time = self.delete_time
	local timer = self._delete_timer

	if timer < 1 then
		timer = math.clamp(timer + dt / deldete_time, 0, 1)

		if timer == 1 then
			Managers.state.unit_spawner:mark_for_deletion(unit)
		end
	end

	self._delete_timer = timer
end
