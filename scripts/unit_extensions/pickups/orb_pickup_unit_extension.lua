-- chunkname: @scripts/unit_extensions/pickups/orb_pickup_unit_extension.lua

local HIGHEST_Z_OFFSET = 1
local ANIMATION_DURATION = 1
local DEFAULT_PICKUP_ORB_SOUND = "boon_orb_pickup"

OrbPickupUnitExtension = class(OrbPickupUnitExtension, PickupUnitExtension)

OrbPickupUnitExtension.init = function (self, extension_init_context, unit, extension_init_data)
	OrbPickupUnitExtension.super.init(self, extension_init_context, unit, extension_init_data)

	self._is_server = Managers.player.is_server

	local side = Managers.state.side:get_side_from_name("heroes")

	self._hero_side = side
	self._pickup_settings = AllPickups[self.pickup_name]
	self._orb_flight_target_position = extension_init_data.flight_enabled and extension_init_data.orb_flight_target_position or nil

	if self._orb_flight_target_position then
		local orb_offset = self._pickup_settings.orb_offset

		if orb_offset then
			local target_pos = self._orb_flight_target_position

			target_pos:store(target_pos:unbox() + Vector3Aux.unbox(orb_offset))
		end
	end

	Unit.flow_event(unit, "update_visuals")

	self._hover = self._pickup_settings.hover_settings
	self._hover_from = self._orb_flight_target_position or Vector3Box(POSITION_LOOKUP[unit])
	self._magnetic = self._pickup_settings.magnetic_settings
	self._buff_params = {
		attacker_unit = unit,
	}
end

OrbPickupUnitExtension.game_object_initialized = function (self, unit, go_id)
	return
end

OrbPickupUnitExtension.extensions_ready = function (self, world, unit)
	return
end

OrbPickupUnitExtension.destroy = function (self)
	return
end

OrbPickupUnitExtension.update = function (self, unit, input, dt, context, t)
	if self._done then
		return
	end

	local side = self._hero_side
	local player_units = side.PLAYER_AND_BOT_UNITS
	local num_player_units = #player_units
	local positions = POSITION_LOOKUP
	local orb_position = Unit.world_position(unit, 0)
	local pickup_settings = self._pickup_settings
	local local_only = pickup_settings.local_only

	if self._is_server or local_only then
		for i = 1, num_player_units do
			local player_unit = player_units[i]

			if Unit.alive(player_unit) then
				local position = positions[player_unit]
				local delta_pos = position - orb_position

				if math.abs(delta_pos.z) < 2 then
					delta_pos.z = 0
				end

				local distance = Vector3.length(delta_pos)
				local status_extension = ScriptUnit.extension(player_unit, "status_system")
				local can_pickup = not status_extension:is_disabled() and (not pickup_settings.can_pickup_orb or pickup_settings.can_pickup_orb(pickup_settings, player_unit))

				if can_pickup then
					local pickup_radius = pickup_settings.pickup_radius or 1

					if distance < pickup_radius then
						local buff_system = Managers.state.entity:system("buff_system")

						if buff_system then
							local sync_type = pickup_settings.buff_sync_type or BuffSyncType.All

							buff_system:add_buff_synced(player_unit, pickup_settings.granted_buff, sync_type, self._buff_params)
						end

						local audio_system = Managers.state.entity:system("audio_system")

						if audio_system then
							local player = Managers.player:owner(player_unit)
							local peer_id = player:network_id()
							local pickup_sound = pickup_settings.pickup_sound or DEFAULT_PICKUP_ORB_SOUND

							audio_system:play_2d_audio_unit_event_for_peer(pickup_sound, peer_id)
						end

						Managers.state.unit_spawner:mark_for_deletion(unit)

						self._done = true

						break
					elseif self._magnetic and distance < self._magnetic.radius and not self._magnetic_target then
						self._magnetic_target = player_unit

						if not local_only then
							local target_id = Managers.state.unit_storage:go_id(player_unit)

							if target_id then
								local game = Managers.state.network:game()
								local go_id = Managers.state.unit_storage:go_id(unit)

								GameSession.set_game_object_field(game, go_id, "magnetic_target_id", target_id)
							end
						end
					end
				end
			end
		end
	elseif self._magnetic and not self._magnetic_target then
		local game = Managers.state.network:game()
		local go_id = Managers.state.unit_storage:go_id(unit)
		local target_go_id = GameSession.game_object_field(game, go_id, "magnetic_target_id")

		self._magnetic_target = Managers.state.unit_storage:unit(target_go_id)
	end

	if not self._flight_done and self._orb_flight_target_position then
		if not self._start_time then
			self._start_time = t
			self._orb_starting_position = Vector3Box(Unit.local_position(unit, 0))
		end

		local ratio = (t - self._start_time) / ANIMATION_DURATION

		if ratio > 1 then
			ratio = 1
			self._flight_done = true
		end

		local start = self._orb_starting_position:unbox()
		local destination = self._orb_flight_target_position:unbox()
		local next_position = Vector3.lerp(start, destination, ratio)
		local z_offset = math.sin(math.pi * math.pow(ratio, 0.8)) * HIGHEST_Z_OFFSET

		next_position.z = next_position.z + z_offset

		Unit.set_local_position(unit, 0, next_position)
	elseif ALIVE[self._magnetic_target] then
		local magnetic_settings = self._magnetic
		local max_speed = magnetic_settings.max_speed
		local time_to_max_speed = magnetic_settings.time_to_max_speed

		self._magnetic_start_t = self._magnetic_start_t or t

		local speed

		if time_to_max_speed < math.epsilon then
			speed = max_speed
		else
			speed = math.lerp_clamped(0, max_speed, (t - self._magnetic_start_t) / time_to_max_speed)
		end

		local target_pos = POSITION_LOOKUP[self._magnetic_target] + Vector3.up()
		local dir_to_target, dist_to_target = Vector3.direction_length(target_pos - POSITION_LOOKUP[unit])
		local dist_to_travel = math.min(dist_to_target, speed * dt)
		local next_position = POSITION_LOOKUP[unit] + dir_to_target * dist_to_travel

		Unit.set_local_position(unit, 0, next_position)
	elseif self._hover then
		local hover_frequency = self._hover.frequency
		local hover_amplitude = self._hover.amplitude

		self._hover_t_start = self._hover_t_start or t

		local hover_t = t - self._hover_t_start
		local hover_from = self._hover_from:unbox()
		local hover_to = hover_from + Vector3(0, 0, hover_amplitude)
		local z_scale = (math.cos(hover_t * math.tau * hover_frequency + math.pi) + 1) * 0.5 * hover_amplitude
		local next_position = Vector3.lerp(hover_from, hover_to, z_scale)

		Unit.set_local_position(unit, 0, next_position)
	end
end

OrbPickupUnitExtension.get_orb_flight_target_position = function (self)
	return self._orb_flight_target_position
end
