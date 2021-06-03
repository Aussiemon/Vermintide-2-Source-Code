TalentSystem = class(TalentSystem, ExtensionSystemBase)
local RPCS = {
	"rpc_sync_talents"
}
local extension_list = {
	"TalentExtension",
	"HuskTalentExtension"
}

TalentSystem.init = function (self, entity_system_creation_context, system_name)
	TalentSystem.super.init(self, entity_system_creation_context, system_name, extension_list)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
end

TalentSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
end

TalentSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local talent_extension = TalentSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)

	return talent_extension
end

TalentSystem.rpc_sync_talents = function (self, channel_id, unit_game_object_id, talent_ids)
	fassert(self.is_server, "Server should be the only one receiving talent syncs")
	printf("TalentSystem:rpc_sync_talents %d %d", channel_id, unit_game_object_id)

	local unit = self.unit_storage:unit(unit_game_object_id)
	local talent_extension = ScriptUnit.extension(unit, "talent_system")

	talent_extension:set_talent_ids(talent_ids)
	talent_extension:apply_buffs_from_talents()
end

return
