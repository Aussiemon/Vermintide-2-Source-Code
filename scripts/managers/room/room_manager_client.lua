require("scripts/managers/room/room_handler")

RoomManagerClient = class(RoomManagerClient)
local RPCS = {
	"rpc_inn_room_created",
	"rpc_inn_room_destroyed"
}
RoomManagerClient.init = function (self, world, network_event_delegate)
	self._peer_rooms = {}
	self._room_order = {}
	self._room_handler = RoomHandler:new(world)

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	self._network_event_delegate = network_event_delegate

	return 
end
RoomManagerClient.setup_level_anchor_points = function (self, level)
	self._room_handler:setup_level_anchor_points(level)

	return 
end
RoomManagerClient.create_room = function (self, peer_id, room_id, profile_index)
	local profile = SPProfiles[profile_index]

	if self._peer_rooms[peer_id] then
		return 
	end

	local room_profile = profile.room_profile

	self._room_handler:create_room(room_profile, room_id)

	self._peer_rooms[peer_id] = {
		room_id = room_id
	}
	self._room_order[room_id] = peer_id

	return 
end
RoomManagerClient.destroy_room = function (self, peer_id)
	local room_info = self._peer_rooms[peer_id]

	self._room_handler:destroy_room(room_info.room_id)

	self._room_order[room_info.room_id] = nil
	self._peer_rooms[peer_id] = nil

	return 
end
RoomManagerClient.destroy = function (self)
	self._room_handler:destroy()

	self._room_handler = nil

	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil

	return 
end
RoomManagerClient.rpc_inn_room_created = function (self, sender, peer_id, room_id, profile_index)
	self.create_room(self, peer_id, room_id, profile_index)

	return 
end
RoomManagerClient.rpc_inn_room_destroyed = function (self, sender, peer_id)
	self.destroy_room(self, peer_id)

	return 
end
RoomManagerClient.get_spawn_point_by_peer = function (self, peer_id)
	return self._peer_rooms[peer_id].room_id
end

return 
