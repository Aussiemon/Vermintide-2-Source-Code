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

	network_event_delegate:register(self, unpack(RPCS))
end

AttachmentSystem.update = function (self, context, t)
	AttachmentSystem.super.update(self, context, t)

	if self._delayed_create_attachment_params then
		local params = self._delayed_create_attachment_params
		local unit_storage = self.unit_storage
		local unit = unit_storage:unit(params.unit_go_id)

		if unit then
			print("[AttachmentSystem] Creating attachment through delayed means")
			self:create_attachment(params.unit_go_id, params.slot_id, params.item_name_id)

			self._delayed_create_attachment_params = nil
		end
	end

	if self._delayed_remove_attachment_params then
		local params = self._delayed_remove_attachment_params
		local unit_storage = self.unit_storage
		local unit = unit_storage:unit(params.unit_go_id)

		if unit then
			print("[AttachmentSystem] Removing attachment through delayed means")
			self:remove_attachment(params.unit_go_id, params.slot_id)

			self._delayed_remove_attachment_params = nil
		end
	end

	if self._delayed_add_attachment_buffs_params then
		local params = self._delayed_add_attachment_buffs_params
		local unit_storage = self.unit_storage
		local unit = unit_storage:unit(params.unit_go_id)

		if unit then
			print("[AttachmentSystem] Adding attachment buffs through delayed means")
			self:add_attachment_buffs(unit, params.slot_id, params.num_buffs, params.buff_ids, params.buff_value_type_ids, params.buff_values)

			self._delayed_add_attachment_buffs_params = nil
		end
	end
end

AttachmentSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
end

AttachmentSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	extension_init_data.is_server = self.is_server

	return AttachmentSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)
end

AttachmentSystem.create_attachment = function (self, unit, slot_id, item_name_id)
	local attachment_extension = ScriptUnit.extension(unit, "attachment_system")
	local slot_name = NetworkLookup.equipment_slots[slot_id]
	local item_name = NetworkLookup.item_names[item_name_id]
	local item_data = ItemMasterList[item_name]

	attachment_extension:create_attachment(slot_name, item_data)
end

AttachmentSystem.remove_attachment = function (self, unit, slot_id)
	local attachment_extension = ScriptUnit.extension(unit, "attachment_system")
	local slot_name = NetworkLookup.equipment_slots[slot_id]

	attachment_extension:remove_attachment(slot_name)
end

AttachmentSystem.add_attachment_buffs = function (self, unit, slot_id, num_buffs, buff_ids, buff_value_type_ids, buff_values)
	local slot_name = NetworkLookup.equipment_slots[slot_id]
	local buffs = BuffUtils.buffs_from_rpc_params(num_buffs, buff_ids, buff_value_type_ids, buff_values)
	local attachment_extension = ScriptUnit.extension(unit, "attachment_system")

	attachment_extension:set_buffs_to_slot(slot_name, buffs)
end

AttachmentSystem.rpc_create_attachment = function (self, channel_id, unit_go_id, slot_id, item_name_id)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_create_attachment", peer_id, unit_go_id, slot_id, item_name_id)
	end

	local unit_storage = self.unit_storage
	local unit = unit_storage:unit(unit_go_id)

	if unit then
		self:create_attachment(unit, slot_id, item_name_id)
	else
		print("[AttachmentSystem] Unit not found, delaying creation of attachment", unit)

		self._delayed_create_attachment_params = {
			unit_go_id = unit_go_id,
			slot_id = slot_id,
			item_name_id = item_name_id
		}
	end
end

AttachmentSystem.rpc_remove_attachment = function (self, channel_id, unit_go_id, slot_id)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_remove_attachment", peer_id, unit_go_id, slot_id)
	end

	local unit_storage = self.unit_storage
	local unit = unit_storage:unit(unit_go_id)

	if unit then
		self:remove_attachment(unit, slot_id)
	else
		print("[AttachmentSystem] Unit not found, delaying deletion of attachment", unit)

		self._delayed_remove_attachment_params = {
			unit_go_id = unit_go_id,
			slot_id = slot_id
		}
	end
end

AttachmentSystem.rpc_add_attachment_buffs = function (self, channel_id, go_id, slot_id, num_buffs, buff_ids, buff_value_type_ids, buff_values)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_add_attachment_buffs", peer_id, go_id, slot_id, num_buffs, buff_ids, buff_value_type_ids, buff_values)
	end

	local unit = self.unit_storage:unit(go_id)

	if unit then
		self:add_attachment_buffs(unit, slot_id, num_buffs, buff_ids, buff_value_type_ids, buff_values)
	else
		print("[AttachmentSystem] Unit not found, delaying addition of buffs to attachment", unit)

		self._delayed_add_attachment_buffs_params = {
			unit_go_id = go_id,
			slot_id = slot_id,
			num_buffs = num_buffs,
			buff_ids = buff_ids,
			buff_value_type_ids = buff_value_type_ids,
			buff_values = buff_values
		}
	end
end

return
