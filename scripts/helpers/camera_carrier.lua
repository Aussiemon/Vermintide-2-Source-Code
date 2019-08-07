CameraCarrier = class(CameraCarrier)
CameraCarrier.CAMERA_CARRIER_REEVALUATE_PERIOD = 10

CameraCarrier.init = function (self)
	self._carrier_camera_unit = nil
	self._camera_carrier_unique_id = nil
	self._camera_carrier_linked = false
	self._time_since_reevaluate_camera_carrier = 0
end

CameraCarrier.destroy = function (self)
	if self._carrier_camera_unit ~= nil then
		self:_detach_carrier_camera()
		self:_destroy_carrier_camera()
	end
end

CameraCarrier.update = function (self, dt)
	if not DEDICATED_SERVER then
		return
	end

	self._time_since_reevaluate_camera_carrier = self._time_since_reevaluate_camera_carrier + dt

	if CameraCarrier.CAMERA_CARRIER_REEVALUATE_PERIOD < self._time_since_reevaluate_camera_carrier then
		self:_reevaluate_camera_carrier()
	end
end

CameraCarrier._reevaluate_camera_carrier = function (self)
	self._time_since_reevaluate_camera_carrier = 0

	if not DEDICATED_SERVER then
		return
	end

	local carrier_player = self:_best_suited_camera_carrier()

	if self._camera_carrier_linked then
		local player = Managers.player:player_from_unique_id(self._camera_carrier_unique_id)

		if player == carrier_player then
			return
		end

		self:_detach_carrier_camera()
	end

	if carrier_player == nil then
		return
	end

	print(string.format("Switching camera carrier to %s", carrier_player:name()))
	self:_attach_carrier_camera(carrier_player)
end

CameraCarrier._create_carrier_camera = function (self)
	assert(self._carrier_camera_unit == nil)
	assert(DEDICATED_SERVER)

	local unit_name = DefaultUnits.standard.backlit_camera
	local position = Vector3.zero()
	local rotation = Quaternion.identity()
	local camera_unit = Managers.state.unit_spawner:spawn_local_unit(unit_name, position, rotation)
	self._carrier_camera_unit = camera_unit
end

CameraCarrier._destroy_carrier_camera = function (self)
	assert(self._carrier_camera_unit ~= nil)
	assert(DEDICATED_SERVER)
	Managers.state.unit_spawner:mark_for_deletion(self._carrier_camera_unit)

	self._carrier_camera_unit = nil
	self._camera_carrier_unique_id = nil
end

CameraCarrier._attach_carrier_camera = function (self, player)
	assert(DEDICATED_SERVER)
	assert(player ~= nil)

	if player.player_unit == nil then
		print(string.format("Failed to switching camera carrier to %s since there is no unit", player:name()))

		return
	end

	if not Unit.alive(player.player_unit) then
		print(string.format("Failed to switching camera carrier to %s since the player unit is not alive", player:name()))

		return
	end

	if self._carrier_camera_unit == nil then
		self:_create_carrier_camera()
	end

	local world = Unit.world(player.player_unit)

	World.link_unit(world, self._carrier_camera_unit, player.player_unit)

	self._camera_carrier_unique_id = player:profile_id()
	self._camera_carrier_linked = true
end

CameraCarrier._detach_carrier_camera = function (self)
	assert(DEDICATED_SERVER)
	assert(self._carrier_camera_unit ~= nil)

	if not self._camera_carrier_linked then
		return
	end

	local world = Unit.world(self._carrier_camera_unit)

	World.unlink_unit(world, self._carrier_camera_unit)

	self._camera_carrier_linked = false
end

CameraCarrier._most_ahead_player = function (self)
	local conflict_director = Managers.state.conflict

	if conflict_director == nil then
		return nil
	end

	local ahead_unit = conflict_director.main_path_info.ahead_unit

	return Managers.player:unit_owner(ahead_unit)
end

CameraCarrier._best_suited_camera_carrier = function (self)
	local most_ahead = self:_most_ahead_player()

	if most_ahead ~= nil then
		return most_ahead
	end

	local leader_peer_id = Managers.party:leader()
	local players = Managers.player:players_at_peer(leader_peer_id)

	if players == nil then
		return nil
	end

	return players[1]
end

return
