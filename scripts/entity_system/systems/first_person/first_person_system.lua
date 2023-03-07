require("scripts/unit_extensions/default_player_unit/player_unit_first_person")
require("scripts/unit_extensions/human/player_bot_unit/player_bot_unit_first_person")

FirstPersonSystem = class(FirstPersonSystem, ExtensionSystemBase)
local RPCS = {
	"rpc_play_first_person_sound",
	"rpc_play_husk_sound_event",
	"rpc_play_husk_unit_sound_event",
	"rpc_first_person_flow_event"
}
local EXTENSIONS = {
	"PlayerUnitFirstPerson",
	"PlayerBotUnitFirstPerson"
}

FirstPersonSystem.init = function (self, entity_system_creation_context, system_name)
	FirstPersonSystem.super.init(self, entity_system_creation_context, system_name, EXTENSIONS)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
end

FirstPersonSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
end

FirstPersonSystem.rpc_play_first_person_sound = function (self, channel_id, unit_id, sound_id, position)
	local sound_event = NetworkLookup.sound_events[sound_id]
	local unit = self.unit_storage:unit(unit_id)

	if not unit then
		printf("unit from game_object_id %d is nil", unit_id)

		return
	end

	local fp_ext = ScriptUnit.extension(unit, "first_person_system")

	fp_ext:play_sound_event(sound_event, position)
end

FirstPersonSystem.rpc_play_husk_sound_event = function (self, channel_id, unit_id, event_id)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_play_husk_sound_event", peer_id, unit_id, event_id)
	end

	local unit = self.unit_storage:unit(unit_id)

	if not unit then
		printf("unit from game_object_id %d is nil", unit_id)

		return
	end

	local event = NetworkLookup.sound_events[event_id]
	local wwise_source_id, wwise_world = WwiseUtils.make_unit_auto_source(self.world, unit)

	WwiseWorld.set_switch(wwise_world, "husk", "true", wwise_source_id)
	WwiseWorld.trigger_event(wwise_world, event, wwise_source_id)
end

FirstPersonSystem.rpc_play_husk_unit_sound_event = function (self, channel_id, unit_id, node_id, event_id)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_play_husk_unit_sound_event", peer_id, unit_id, node_id, event_id)
	end

	local unit = self.unit_storage:unit(unit_id)

	if not unit then
		printf("unit from game_object_id %d is nil", unit_id)

		return
	end

	local event = NetworkLookup.sound_events[event_id]
	local wwise_source_id, wwise_world = WwiseUtils.make_unit_auto_source(self.world, unit, node_id)

	WwiseWorld.set_switch(wwise_world, "husk", "true", wwise_source_id)
	WwiseWorld.trigger_event(wwise_world, event, wwise_source_id)
end

FirstPersonSystem.rpc_first_person_flow_event = function (self, channel_id, unit_id, event_id)
	local unit = self.unit_storage:unit(unit_id)

	if not unit then
		printf("unit from game_object_id %d is nil", unit_id)

		return
	end

	local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

	if first_person_extension then
		local first_person_unit = first_person_extension:get_first_person_unit()
		local event_name = NetworkLookup.flow_events[event_id]

		Unit.flow_event(first_person_unit, event_name)
	end
end
