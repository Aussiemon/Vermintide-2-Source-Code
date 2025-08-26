-- chunkname: @scripts/entity_system/systems/transportation/transportation_system.lua

require("scripts/unit_extensions/generic/linker_transportation_extension")

TransportationSystem = class(TransportationSystem, ExtensionSystemBase)

local extensions = {
	"LinkerTransportationExtension",
}
local RPCS = {
	"rpc_hot_join_sync_linker_transporting",
	"rpc_hot_join_sync_linker_transport_state",
	"rpc_hot_join_sync_linker_transport_generic_units",
	"rpc_add_transporting_ai_units",
	"rpc_add_transporting_generic_unit",
	"rpc_remove_transporting_ai_units",
}

TransportationSystem.init = function (self, context, system_name)
	TransportationSystem.super.init(self, context, system_name, extensions)

	local network_event_delegate = context.network_event_delegate

	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
end

TransportationSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
end

TransportationSystem.rpc_hot_join_sync_linker_transporting = function (self, channel_id, level_unit_id, game_object_id)
	local unit = Level.unit_by_index(LevelHelper:current_level(self.world), level_unit_id)

	ScriptUnit.extension(unit, "transportation_system"):rpc_hot_join_sync_linker_transporting(game_object_id)
end

TransportationSystem.rpc_hot_join_sync_linker_transport_state = function (self, channel_id, level_unit_id, state_id, story_time)
	local unit = Level.unit_by_index(LevelHelper:current_level(self.world), level_unit_id)

	ScriptUnit.extension(unit, "transportation_system"):rpc_hot_join_sync_linker_transport_state(state_id, story_time)
end

TransportationSystem.rpc_add_transporting_ai_units = function (self, channel_id, level_unit_id, game_object_ids, slot_ids)
	local unit = Level.unit_by_index(LevelHelper:current_level(self.world), level_unit_id)
	local extension = ScriptUnit.extension(unit, "transportation_system")
	local unit_storage = Managers.state.network.unit_storage

	for i = 1, #game_object_ids do
		local ai_unit = unit_storage:unit(game_object_ids[i])

		if ai_unit then
			extension:add_transporting_ai_unit(ai_unit, slot_ids[i])
		end
	end
end

TransportationSystem.rpc_remove_transporting_ai_units = function (self, channel_id, level_unit_id, game_object_ids)
	local unit = Level.unit_by_index(LevelHelper:current_level(self.world), level_unit_id)
	local extension = ScriptUnit.extension(unit, "transportation_system")
	local unit_storage = Managers.state.network.unit_storage

	for i = 1, #game_object_ids do
		local ai_unit = unit_storage:unit(game_object_ids[i])

		extension:remove_transporting_ai_unit(ai_unit)
	end
end

TransportationSystem.rpc_hot_join_sync_linker_transport_generic_units = function (self, channel_id, level_unit_id, unit_ids, is_level_unit_arr, positions, rotations)
	local unit = Level.unit_by_index(LevelHelper:current_level(self.world), level_unit_id)
	local extension = ScriptUnit.extension(unit, "transportation_system")
	local network_manager = Managers.state.network

	for i = 1, #unit_ids do
		local is_level_unit = is_level_unit_arr[i]
		local generic_unit = network_manager:game_object_or_level_unit(unit_ids[i], is_level_unit)

		if Unit.alive(generic_unit) then
			local matrix = Matrix4x4.from_quaternion_position(rotations[i], positions[i])

			extension:add_transporting_generic_unit(generic_unit, matrix, true)
		end
	end
end

TransportationSystem.rpc_add_transporting_generic_unit = function (self, channel_id, level_unit_id, generic_unit_id, is_level_unit, position, rotation)
	local generic_unit = Managers.state.network:game_object_or_level_unit(generic_unit_id, is_level_unit)

	if generic_unit then
		local unit = Level.unit_by_index(LevelHelper:current_level(self.world), level_unit_id)
		local matrix = Matrix4x4.from_quaternion_position(rotation, position)
		local extension = ScriptUnit.extension(unit, "transportation_system")

		extension:add_transporting_generic_unit(generic_unit, matrix, true)
	end
end
