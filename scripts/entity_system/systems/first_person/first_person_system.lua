require("scripts/unit_extensions/default_player_unit/player_unit_first_person")
require("scripts/unit_extensions/human/player_bot_unit/player_bot_unit_first_person")

FirstPersonSystem = class(FirstPersonSystem, ExtensionSystemBase)
local RPCS = {
	"rpc_play_first_person_sound",
	"rpc_play_husk_sound_event"
}
local EXTENSIONS = {
	"PlayerUnitFirstPerson",
	"PlayerBotUnitFirstPerson"
}
FirstPersonSystem.init = function (self, entity_system_creation_context, system_name)
	FirstPersonSystem.super.init(self, entity_system_creation_context, system_name, EXTENSIONS)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	return 
end
FirstPersonSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil

	return 
end
FirstPersonSystem.rpc_play_first_person_sound = function (self, sender, unit_id, sound_id, position)
	local sound_event = NetworkLookup.sound_events[sound_id]
	local unit = self.unit_storage:unit(unit_id)

	if not unit then
		printf("unit from game_object_id %d is nil", unit_id)

		return 
	end

	local fp_ext = ScriptUnit.extension(unit, "first_person_system")

	fp_ext.play_sound_event(fp_ext, sound_event, position)

	return 
end
FirstPersonSystem.rpc_play_husk_sound_event = function (self, sender, unit_id, event_id)
	if self.is_server then
		self.network_transmit:send_rpc_clients_except("rpc_play_husk_sound_event", sender, unit_id, event_id)
	end

	local unit = self.unit_storage:unit(unit_id)

	if not unit then
		printf("unit from game_object_id %d is nil", unit_id)

		return 
	end

	local sound_position = POSITION_LOOKUP[unit]
	local event = NetworkLookup.sound_events[event_id]
	local wwise_source_id, wwise_world = WwiseUtils.make_position_auto_source(self.world, sound_position)

	WwiseWorld.set_switch(wwise_world, "husk", "true", wwise_source_id)
	WwiseWorld.trigger_event(wwise_world, event, wwise_source_id)

	return 
end

return 
