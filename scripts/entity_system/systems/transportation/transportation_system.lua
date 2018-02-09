require("scripts/unit_extensions/generic/linker_transportation_extension")

TransportationSystem = class(TransportationSystem, ExtensionSystemBase)
local extensions = {
	"LinkerTransportationExtension"
}
local RPCS = {
	"rpc_hot_join_sync_linker_transporting",
	"rpc_hot_join_sync_linker_transport_state"
}
TransportationSystem.init = function (self, context, system_name)
	TransportationSystem.super.init(self, context, system_name, extensions)

	local network_event_delegate = context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	return 
end
TransportationSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil

	return 
end
TransportationSystem.rpc_hot_join_sync_linker_transporting = function (self, sender, level_unit_id, game_object_id)
	local unit = Level.unit_by_index(LevelHelper:current_level(self.world), level_unit_id)
	local ext = ScriptUnit.extension(unit, "transportation_system"):rpc_hot_join_sync_linker_transporting(game_object_id)

	return 
end
TransportationSystem.rpc_hot_join_sync_linker_transport_state = function (self, sender, level_unit_id, state_id, story_time)
	local unit = Level.unit_by_index(LevelHelper:current_level(self.world), level_unit_id)
	local ext = ScriptUnit.extension(unit, "transportation_system"):rpc_hot_join_sync_linker_transport_state(state_id, story_time)

	return 
end

return 
