local HIGHEST_Z_OFFSET = 1
local ANIMATION_DURATION = 1
local PICKUP_ORB_SOUND = "boon_orb_pickup"
OrbPickupUnitExtension = class(OrbPickupUnitExtension, PickupUnitExtension)

OrbPickupUnitExtension.init = function (self, extension_init_context, unit, extension_init_data)
	OrbPickupUnitExtension.super.init(self, extension_init_context, unit, extension_init_data)

	self._is_server = Managers.player.is_server
	local side = Managers.state.side:get_side_from_name("heroes")
	self._hero_side = side
	self._orb_flight_target_position = (extension_init_data.flight_enabled and extension_init_data.orb_flight_target_position) or nil

	Unit.flow_event(unit, "update_visuals")

	self._pickup_settings = AllPickups[self.pickup_name]
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
	local player_units = side.PLAYER_UNITS
	local num_player_units = #player_units
	local positions = POSITION_LOOKUP
	local orb_position = Unit.world_position(unit, 0)
	local pickup_settings = self._pickup_settings

	if self._is_server then
		for i = 1, num_player_units, 1 do
			local player_unit = player_units[i]

			if Unit.alive(player_unit) then
				local position = positions[player_unit]
				local distance = Vector3.distance(position, orb_position)
				local status_extension = ScriptUnit.extension(player_unit, "status_system")

				if distance < 1 and not status_extension:is_disabled() and (not pickup_settings.can_pickup_orb or pickup_settings:can_pickup_orb(player_unit)) then
					local buff_system = Managers.state.entity:system("buff_system")

					if buff_system then
						buff_system:add_buff(player_unit, pickup_settings.granted_buff, unit)
					end

					local audio_system = Managers.state.entity:system("audio_system")

					if audio_system then
						local player = Managers.player:owner(player_unit)
						local peer_id = player:network_id()

						audio_system:play_2d_audio_unit_event_for_peer(PICKUP_ORB_SOUND, peer_id)
					end

					Managers.state.unit_spawner:mark_for_deletion(unit)

					self._done = true

					break
				end
			end
		end
	end

	if not self._flight_done and self._orb_flight_target_position then
		if not self._start_time then
			self._start_time = t
			self._orb_starting_position = Vector3Box(Unit.local_position(unit, 0))
		end

		local ratio = (t - self._start_time) / ANIMATION_DURATION

		if ratio > 1 then
			ratio = 1
		end

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
	end
end

OrbPickupUnitExtension.get_orb_flight_target_position = function (self)
	return self._orb_flight_target_position
end

return
