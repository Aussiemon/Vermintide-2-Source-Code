require("scripts/unit_extensions/default_player_unit/attachment/player_unit_attachment_extension")
require("scripts/unit_extensions/default_player_unit/attachment/player_husk_attachment_extension")

AttachmentSystem = class(AttachmentSystem, ExtensionSystemBase)
local RPCS = {
	"rpc_create_attachment",
	"rpc_remove_attachment",
	"rpc_add_attachment_buffs"
}
local extension_list = {
	"PlayerUnitAttachmentExtension",
	"PlayerHuskAttachmentExtension"
}
AttachmentSystem.init = function (self, entity_system_creation_context, system_name)
	AttachmentSystem.super.init(self, entity_system_creation_context, system_name, extension_list)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	return 
end
AttachmentSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil

	return 
end
AttachmentSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	extension_init_data.is_server = self.is_server

	return AttachmentSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)
end
AttachmentSystem.rpc_create_attachment = function (self, sender, unit_go_id, slot_id, item_name_id)
	if self.is_server then
		self.network_transmit:send_rpc_clients_except("rpc_create_attachment", sender, unit_go_id, slot_id, item_name_id)
	end

	local unit_storage = self.unit_storage
	local unit = unit_storage.unit(unit_storage, unit_go_id)
	local attachment_extension = ScriptUnit.extension(unit, "attachment_system")
	local slot_name = NetworkLookup.equipment_slots[slot_id]
	local item_name = NetworkLookup.item_names[item_name_id]
	local item_data = ItemMasterList[item_name]

	attachment_extension.create_attachment(attachment_extension, slot_name, item_data)

	return 
end
AttachmentSystem.rpc_remove_attachment = function (self, sender, unit_go_id, slot_id)
	if self.is_server then
		self.network_transmit:send_rpc_clients_except("rpc_remove_attachment", sender, unit_go_id, slot_id)
	end

	local unit_storage = self.unit_storage
	local unit = unit_storage.unit(unit_storage, unit_go_id)
	local attachment_extension = ScriptUnit.extension(unit, "attachment_system")
	local slot_name = NetworkLookup.equipment_slots[slot_id]

	attachment_extension.remove_attachment(attachment_extension, slot_name)

	return 
end
AttachmentSystem.rpc_add_attachment_buffs = function (self, sender, go_id, slot_id, buff_1_id, buff_data_type_1_id, value_1, buff_2_id, buff_data_type_2_id, value_2, buff_3_id, buff_data_type_3_id, value_3, buff_4_id, buff_data_type_4_id, value_4)
	fassert(self.is_server, "attempting to add buffs as a client VIA rpc_add_attachment_buffs")

	local unit = self.unit_storage:unit(go_id)
	local slot_name = NetworkLookup.equipment_slots[slot_id]
	local buff_name_1 = NetworkLookup.buff_templates[buff_1_id]
	local buff_name_2 = NetworkLookup.buff_templates[buff_2_id]
	local buff_name_3 = NetworkLookup.buff_templates[buff_3_id]
	local buff_name_4 = NetworkLookup.buff_templates[buff_4_id]
	local buff_data_type_1 = NetworkLookup.buff_data_types[buff_data_type_1_id]
	local buff_data_type_2 = NetworkLookup.buff_data_types[buff_data_type_2_id]
	local buff_data_type_3 = NetworkLookup.buff_data_types[buff_data_type_3_id]
	local buff_data_type_4 = NetworkLookup.buff_data_types[buff_data_type_4_id]
	local attachment_extension = ScriptUnit.extension(unit, "attachment_system")

	attachment_extension.add_buffs_to_slot(attachment_extension, slot_name, buff_name_1, buff_data_type_1, value_1, buff_name_2, buff_data_type_2, value_2, buff_name_3, buff_data_type_3, value_3, buff_name_4, buff_data_type_4, value_4)

	return 
end

return 
