﻿-- chunkname: @scripts/managers/room/room_handler.lua

require("scripts/settings/profiles/room_profiles")

RoomHandler = class(RoomHandler)

RoomHandler.init = function (self, world)
	self._world = world
	self._rooms = {}
	self._level_anchor_points = {}
	self._num_active_rooms = 0
end

RoomHandler.setup_level_anchor_points = function (self, level)
	local units = Level.units(level)

	for i, unit in ipairs(units) do
		if Unit.has_data(unit, "room_id") then
			local room_id = Unit.get_data(unit, "room_id")

			fassert(room_id ~= -1, "There exist a room_anchor_point without a room_id set in this level")
			fassert(self._rooms[room_id] == nil, "There are two room_anchor_points with the same room_id (room_id: %s)", tostring(room_id))

			local position = Unit.world_position(unit, 0)
			local rotation = Unit.world_rotation(unit, 0)
			local forward = Quaternion.forward(rotation)

			self._level_anchor_points[room_id] = {
				position = Vector3Box(position),
				normal = Vector3Box(forward),
			}
			self._rooms[room_id] = {
				available = true,
			}
		end
	end
end

RoomHandler.create_room = function (self, room_info, room_id)
	room_id = room_id or self:_available_room_id()

	fassert(self._rooms[room_id].available, "[RoomHandler]: room_id %q is not available", room_id)

	local room_anchor_point_info = self._level_anchor_points[room_id]
	local position = room_anchor_point_info.position:unbox()
	local normal = room_anchor_point_info.normal:unbox()
	local rotation = Quaternion.look(-normal)
	local world = self._world
	local level_name = room_info.level_name
	local level = World.spawn_level(world, level_name, position, rotation)
	local flow_event_name = "room_" .. tostring(room_id) .. "_spawned"

	LevelHelper:flow_event(world, flow_event_name)

	local room = {
		available = false,
		level = level,
	}

	self._rooms[room_id] = room

	printf("[RoomHandler]: Created room with room_id: %s at position: %s, %s, %s", tostring(room_id), tostring(position.x), tostring(position.y), tostring(position.z))

	return room_id
end

RoomHandler.destroy_room = function (self, room_id)
	printf("[RoomHandler]: Destroying room with room_id: %s", tostring(room_id))

	local world = self._world
	local flow_event_name = "room_" .. tostring(room_id) .. "_destroyed"

	LevelHelper:flow_event(world, flow_event_name)

	local room = self._rooms[room_id]

	ScriptWorld.destroy_level_from_reference(world, room.level)

	self._rooms[room_id] = {
		available = true,
	}
end

RoomHandler._available_room_id = function (self)
	local num_rooms = #self._rooms

	for i = 1, num_rooms do
		local room = self._rooms[i]

		if room.available then
			return i
		end
	end

	error("[RoomHandler]: There's no rooms available. Lobby size to big? Not enough anchor points?")
end

RoomHandler._debug_print = function (self)
	local occupied = ""
	local available = ""
	local num_rooms = #self._rooms

	for i = 1, num_rooms do
		local room = self._rooms[i]

		if not room.available then
			occupied = occupied .. i .. ", "
		else
			available = available .. i .. ", "
		end
	end

	Managers.state.debug_text:output_screen_text("Occupied: " .. occupied .. "\n" .. "Available: " .. available, 22, 5)
end

RoomHandler.room_from_id = function (self, room_id)
	return self._rooms[room_id]
end

RoomHandler.destroy = function (self)
	local num_rooms = self._num_active_rooms

	for i = 1, num_rooms do
		local room = self._rooms[i]

		ScriptWorld.destroy_level_from_reference(self._world, room.level)
	end
end
