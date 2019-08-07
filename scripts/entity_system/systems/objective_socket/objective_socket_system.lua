require("scripts/unit_extensions/objective_socket/objective_socket_unit_extension")

ObjectiveSocketSystem = class(ObjectiveSocketSystem, ExtensionSystemBase)
local RPCS = {
	"rpc_objective_entered_socket_zone"
}
local extensions = {
	"ObjectiveSocketUnitExtension"
}

ObjectiveSocketSystem.init = function (self, entity_system_creation_context, system_name)
	ObjectiveSocketSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self.network_event_delegate = network_event_delegate
	self.network_manager = Managers.state.network
	self.socket_extensions = {}

	self.objective_entered_zone_server = function (extension, unit)
		local socket, socket_id = extension:pick_socket(unit)

		if not socket then
			return
		end

		extension:objective_entered_zone_client(socket_id)

		if self.is_server then
			local network_manager = self.network_manager
			local unit_id = network_manager:game_object_or_level_id(extension.unit)

			self.network_manager.network_transmit:send_rpc_clients("rpc_objective_entered_socket_zone", unit_id, socket_id, extension.use_game_object_id or false)

			local limited_item_track_extension = ScriptUnit.has_extension(unit, "limited_item_track_system")

			if limited_item_track_extension then
				local spawner_unit = limited_item_track_extension.spawner_unit
				local limited_item_track_spawner_extension = ScriptUnit.has_extension(spawner_unit, "limited_item_track_system")

				limited_item_track_spawner_extension:socket_item(unit)
			end

			local unit_spawner = Managers.state.unit_spawner

			unit_spawner:mark_for_deletion(unit)
		end
	end

	self.objective_entered_zone_client = function (extension, socket_id)
		local socket = extension:socket_from_id(socket_id)

		fassert(socket.open == true, "Socket was already occupied.")

		socket.open = false
		local num_open_sockets = extension.num_open_sockets - 1
		local num_closed_sockets = extension.num_closed_sockets + 1
		extension.num_open_sockets = num_open_sockets
		extension.num_closed_sockets = num_closed_sockets
		local flow_event = "lua_" .. socket.socket_name .. "_occupied"

		Unit.flow_event(extension.unit, flow_event)

		if num_closed_sockets == extension.num_sockets then
			Unit.flow_event(extension.unit, "lua_all_sockets_occupied")
		end
	end
end

ObjectiveSocketSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
	self.network_manager = nil
	self.socket_extensions = nil
end

ObjectiveSocketSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = ObjectiveSocketSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data, self.is_server)

	if self.is_server then
		extension.objective_entered_zone_server = self.objective_entered_zone_server
	end

	extension.objective_entered_zone_client = self.objective_entered_zone_client

	fassert(self.socket_extensions[unit] == nil, "This unit already has a socket extension.")

	self.socket_extensions[unit] = extension

	return extension
end

ObjectiveSocketSystem.on_remove_extension = function (self, unit, extension_name)
	ObjectiveSocketSystem.super.on_remove_extension(self, unit, extension_name)

	self.socket_extensions[unit] = nil
end

ObjectiveSocketSystem.hot_join_sync = function (self, sender)
	for unit, extension in pairs(self.socket_extensions) do
		local sockets = extension.sockets
		local num_sockets = extension.num_sockets
		local unit_id = self.network_manager:game_object_or_level_id(unit)

		for socket_id = 1, num_sockets, 1 do
			local socket = sockets[socket_id]

			if not socket.open then
				RPC.rpc_objective_entered_socket_zone(sender, unit_id, socket_id, extension.use_game_object_id or false)
			end
		end
	end
end

ObjectiveSocketSystem.rpc_objective_entered_socket_zone = function (self, sender, unit_id, socket_id, is_game_object)
	fassert(not self.is_server, "Should only be called on the client")

	local level = LevelHelper:current_level(self.world)
	local unit = self.network_manager:game_object_or_level_unit(unit_id, not is_game_object)
	local objective_socket_extension = ScriptUnit.extension(unit, "objective_socket_system")

	objective_socket_extension:objective_entered_zone_client(socket_id)
end

return
