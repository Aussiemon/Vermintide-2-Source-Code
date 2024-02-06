-- chunkname: @scripts/unit_extensions/generic/thorn_mutator_extension.lua

ThornMutatorExtension = class(ThornMutatorExtension)

local DESPAWN_ANIM_TIME = 1

ThornMutatorExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.spawn_time = extension_init_data.spawn_animation_time or 0
	self.despawn_time = extension_init_data.despawn_animation_time or 0
	self._spawn_timer = 0
	self._life_timer = 0
	self._is_server = Managers.state.network.is_server
	self._unit = unit

	local original_scale = Unit.local_scale(unit, 0)

	self._scale_x = original_scale.x
	self._scale_y = original_scale.y
	self._scale_z = original_scale.z

	local area_damage_extension = ScriptUnit.extension(unit, "area_damage_system")

	self._area_damage_extension = area_damage_extension
	self._life_time = area_damage_extension.life_time
	self._despawning = false
end

ThornMutatorExtension.current_progress = function (self)
	return self._spawn_timer
end

ThornMutatorExtension.get_spawn_time = function (self)
	return self.spawn_time
end

ThornMutatorExtension.setup_rpc_sync = function (self, spawn_time, progress)
	self.spawn_time = spawn_time
	self._spawn_timer = progress
end

ThornMutatorExtension.update = function (self, unit, input, dt, context, t)
	local spawn_time = self.spawn_time
	local spawn_timer = self._spawn_timer

	if spawn_timer < 1 then
		spawn_timer = math.clamp(spawn_timer + dt / spawn_time, 0, 1)

		if spawn_timer == 1 and self._is_server then
			local network_manager = Managers.state.network
			local unit_id = network_manager:unit_game_object_id(self._unit)

			network_manager.network_transmit:send_rpc_clients("rpc_thorn_bush_trigger_area_damage", unit_id)
			self:trigger_area_damage()
		end

		self._spawn_timer = spawn_timer
	end

	if self._spawn_timer == 1 and self._life_timer < 1 then
		local life_time = self._life_time - self.despawn_time
		local life_timer = self._life_timer

		if not self._despawning then
			life_timer = math.clamp(life_timer + dt / life_time, 0, 1)

			if life_timer == 1 and self._is_server then
				local network_manager = Managers.state.network
				local unit_id = network_manager:unit_game_object_id(self._unit)

				network_manager.network_transmit:send_rpc_clients("rpc_thorn_bush_trigger_despawn", unit_id)
				self:despawn()

				self._despawn_done_time = t + DESPAWN_ANIM_TIME
			end

			self._life_timer = life_timer
		end
	end

	if self._is_server then
		local num_hits = self._area_damage_extension.num_hits

		if num_hits > 0 and not self._despawning then
			local network_manager = Managers.state.network
			local unit_id = network_manager:unit_game_object_id(self._unit)

			network_manager.network_transmit:send_rpc_clients("rpc_thorn_bush_trigger_despawn", unit_id)
			WwiseUtils.trigger_unit_event(context.world, "Play_winds_life_gameplay_thorn_hit_player", unit, 0)
			self:despawn()

			self._despawn_done_time = t + DESPAWN_ANIM_TIME
		end
	end

	if self._is_server then
		self:_check_for_deletion(t)
	end
end

ThornMutatorExtension.trigger_area_damage = function (self)
	Unit.flow_event(self._unit, "set_static_material")

	local extension = ScriptUnit.extension(self._unit, "area_damage_system")

	extension:enable(true)
end

ThornMutatorExtension.despawn = function (self)
	Unit.flow_event(self._unit, "despawn")

	self._despawning = true

	local extension = ScriptUnit.extension(self._unit, "area_damage_system")

	extension:enable(false)
end

ThornMutatorExtension._check_for_deletion = function (self, t)
	local despawn_done = self._despawn_done_time and t > self._despawn_done_time

	if despawn_done then
		Managers.state.unit_spawner:mark_for_deletion(self._unit)
	end
end
