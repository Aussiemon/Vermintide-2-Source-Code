TalentSystem = class(TalentSystem, ExtensionSystemBase)
local RPCS = {
	"rpc_sync_talents"
}
local extension_list = {
	"TalentExtension",
	"HuskTalentExtension",
	"ClientHuskTalentExtension"
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
	printf("TalentSystem:rpc_sync_talents %d %d", channel_id, unit_game_object_id)

	local unit = self.unit_storage:unit(unit_game_object_id)
	local talent_extension = ScriptUnit.extension(unit, "talent_system")

	talent_extension:set_talent_ids(talent_ids)

	if self.is_server then
		talent_extension:apply_buffs_from_talents()

		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_sync_talents", peer_id, unit_game_object_id, talent_ids)
	end
end

TalentSystem.hot_join_sync = function (self, peer_id)
	if not self.is_server then
		return
	end

	local network_transmit = self.network_transmit
	local unit_storage = self.unit_storage

	for _, extension_name in ipairs(extension_list) do
		local entities = self.entity_manager:get_entities(extension_name)

		for unit, extension in pairs(entities) do
			local go_id = unit_storage:go_id(unit)
			local talent_ids = extension:get_talent_ids()

			network_transmit:send_rpc("rpc_sync_talents", peer_id, go_id, talent_ids)
		end
	end
end

return
