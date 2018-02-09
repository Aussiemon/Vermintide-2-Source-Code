require("scripts/managers/room/room_handler")

RoomManagerServer = class(RoomManagerServer)
RoomManagerServer.init = function (self, world)
	self._peer_rooms = {}
	self._room_order = {}
	self._room_handler = RoomHandler:new(world)

	return 
end
RoomManagerServer.setup_level_anchor_points = function (self, level)
	self._room_handler:setup_level_anchor_points(level)

	return 
end
RoomManagerServer.create_room = function (self, peer_id, local_player_id)
	local profile_index = Managers.state.spawn._profile_synchronizer:profile_by_peer(peer_id, local_player_id)
	local profile = SPProfiles[profile_index]
	local room_profile = profile.room_profile
	local room_id = self._room_handler:create_room(room_profile)
	self._peer_rooms[peer_id] = {
		room_id = room_id,
		profile_index = profile_index
	}
	self._room_order[room_id] = peer_id

	Managers.state.network.network_transmit:send_rpc_clients("rpc_inn_room_created", peer_id, room_id, profile_index)

	return 
end
RoomManagerServer.get_spawn_point_by_peer = function (self, peer_id)
	return self._peer_rooms[peer_id].room_id
end
RoomManagerServer.has_room = function (self, peer_id)
	return (self._peer_rooms[peer_id] and true) or false
end
RoomManagerServer.destroy_room = function (self, peer_id, move_other_players_from_room)
	local room_id = self._peer_rooms[peer_id].room_id

	if (move_other_players_from_room and move_other_players_from_room == true) or move_other_players_from_room == nil then
		self.move_players_from_room(self, room_id)
	end

	self._room_handler:destroy_room(room_id)

	self._room_order[room_id] = nil
	self._peer_rooms[peer_id] = nil

	Managers.state.network.network_transmit:send_rpc_clients("rpc_inn_room_destroyed", peer_id)

	return 
end
RoomManagerServer.move_players_from_room = function (self, room_id)
	local room = self._room_handler:room_from_id(room_id)
	local level = room.level
	local network_manager = Managers.state.network
	local spawn_points = Managers.state.spawn.spawn_points
	local player_manager = Managers.player
	local players = player_manager.human_players(player_manager)

	for _, player in pairs(players) do
		local player_unit = player.player_unit

		if not Unit.alive(player_unit) then
		else
			local unit_id = network_manager.unit_game_object_id(network_manager, player_unit)

			if not unit_id then
			else
				local position = POSITION_LOOKUP[player_unit]

				if Level.is_point_inside_volume(level, "room_volume", position) then
					local peer_id = player.peer_id
					local spawn_point_id = self.get_spawn_point_by_peer(self, peer_id)
					local spawn_point = spawn_points[spawn_point_id]
					local spawn_pos = spawn_point.pos:unbox()
					local spawn_rot = spawn_point.rot:unbox()

					if player.local_player then
						local locomotion_extension = ScriptUnit.extension(player_unit, "locomotion_system")

						locomotion_extension.teleport_to(locomotion_extension, spawn_pos, spawn_rot)
					else
						local unit_id = network_manager.unit_game_object_id(network_manager, player_unit)

						RPC.rpc_teleport_unit_to(peer_id, unit_id, spawn_pos, spawn_rot)
					end
				end
			end
		end
	end

	return 
end
RoomManagerServer.hot_join_sync = function (self, sender)
	for peer_id, room_info in pairs(self._peer_rooms) do
		local room_id = room_info.room_id
		local profile_index = room_info.profile_index

		RPC.rpc_inn_room_created(sender, peer_id, room_id, profile_index)
	end

	return 
end
RoomManagerServer.destroy = function (self)
	self._room_handler:destroy()

	self._room_handler = nil

	return 
end

return 
