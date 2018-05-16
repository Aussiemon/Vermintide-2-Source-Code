require("scripts/helpers/attachment_utils")
require("scripts/managers/backend/backend_utils")

PlayerUnitAttachmentExtension = class(PlayerUnitAttachmentExtension)
script_data.attachment_debug = script_data.attachment_debug or Development.parameter("attachment_debug")

PlayerUnitAttachmentExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._world = extension_init_context.world
	self._unit = unit
	self._profile = extension_init_data.profile
	self._is_server = extension_init_data.is_server
	self._player = extension_init_data.player
	self._profile_index = FindProfileIndex(self._profile.display_name)
	self.current_item_buffs = {}
	self._attachments = {
		slots = {}
	}
end

PlayerUnitAttachmentExtension.extensions_ready = function (self, world, unit)
	self.buff_extension = ScriptUnit.extension(unit, "buff_system")
	self.career_extension = ScriptUnit.extension(unit, "career_system")
	self._cosmetic_extension = ScriptUnit.extension(unit, "cosmetic_system")
	local attachments = self._attachments
	local profile = self._profile
	local attachment_slots = InventorySettings.attachment_slots
	local slots_n = #attachment_slots
	local career_name = self.career_extension:career_name()

	for i = 1, slots_n, 1 do
		repeat
			local slot = attachment_slots[i]
			local slot_name = slot.name
			local item = BackendUtils.get_loadout_item(career_name, slot_name)

			if item then
				local item_data = table.clone(item.data)
				item_data.backend_id = item.backend_id

				self:create_attachment(slot_name, item_data)
			end
		until true
	end

	self:show_attachments(false)
end

PlayerUnitAttachmentExtension.game_object_initialized = function (self, unit, unit_go_id)
	local attachments = self._attachments
	local slots = attachments.slots
	local network_manager = Managers.state.network
	local is_server = self._is_server

	for slot_name, slot_data in pairs(slots) do
		local slot_id = NetworkLookup.equipment_slots[slot_name]
		local item_id = NetworkLookup.item_names[slot_data.item_data.name]

		if is_server then
			network_manager.network_transmit:send_rpc_clients("rpc_create_attachment", unit_go_id, slot_id, item_id)
		else
			network_manager.network_transmit:send_rpc_server("rpc_create_attachment", unit_go_id, slot_id, item_id)

			local backend_id = slot_data.item_data.backend_id

			self:_send_rpc_add_attachment_buffs(unit_go_id, slot_id, item_id, backend_id)
		end
	end
end

PlayerUnitAttachmentExtension.destroy = function (self)
	local slots = self._attachments.slots

	for slot_name, slot_data in pairs(slots) do
		AttachmentUtils.destroy_attachment(self._world, self._unit, slot_data)
	end
end

PlayerUnitAttachmentExtension.update = function (self, unit, input, dt, context, t)
	self:update_resync_loadout()
end

PlayerUnitAttachmentExtension.hot_join_sync = function (self, sender)
	AttachmentUtils.hot_join_sync(sender, self._unit, self._attachments.slots)
end

PlayerUnitAttachmentExtension.create_attachment = function (self, slot_name, item_data)
	local attachments = self._attachments
	local unit = self._unit
	local slot_data = AttachmentUtils.create_attachment(self._world, unit, attachments, slot_name, item_data, false)
	attachments.slots[slot_name] = slot_data
	local item_data = slot_data.item_data
	local item_template = BackendUtils.get_item_template(item_data)

	if not ScriptUnit.extension(unit, "first_person_system").first_person_mode then
		local show_attachments_event = item_template.show_attachments_event

		if show_attachments_event then
			Unit.flow_event(unit, show_attachments_event)
		end
	end

	local backend_id = item_data.backend_id
	local buffs = self:_get_property_and_trait_buffs(backend_id)

	self:_apply_buffs(buffs, item_data.name, slot_name, item_data.name)

	local cosmetic_extension = ScriptUnit.has_extension(unit, "cosmetic_system")

	if cosmetic_extension and slot_name == "slot_hat" then
		local character_material_changes = item_template.character_material_changes

		if character_material_changes then
			cosmetic_extension:change_skin_materials(character_material_changes)
		end
	end
end

PlayerUnitAttachmentExtension.remove_attachment = function (self, slot_name)
	local slot_data = self._attachments.slots[slot_name]

	if slot_data == nil then
		return
	end

	AttachmentUtils.destroy_attachment(self._world, self._unit, slot_data)
	self:_remove_buffs(slot_name)

	local item_data = slot_data.item_data
	self._attachments.slots[slot_name] = nil
	local network_manager = Managers.state.network
	local unit_go_id = network_manager:unit_game_object_id(self._unit)
	local slot_id = NetworkLookup.equipment_slots[slot_name]

	if self._is_server then
		network_manager.network_transmit:send_rpc_clients("rpc_remove_attachment", unit_go_id, slot_id)
	else
		network_manager.network_transmit:send_rpc_server("rpc_remove_attachment", unit_go_id, slot_id)
	end
end

PlayerUnitAttachmentExtension.attachments = function (self)
	return self._attachments
end

PlayerUnitAttachmentExtension.get_slot_data = function (self, slot_id)
	local attachments = self._attachments
	local slots = attachments.slots

	return slots[slot_id]
end

PlayerUnitAttachmentExtension._show_attachment = function (self, slot_name, slot_data, show)
	local should_show = show
	local always_hide = self._cosmetic_extension:always_hide_attachment_slot(slot_name)

	if always_hide then
		should_show = false
	end

	local unit = slot_data.unit

	Unit.set_unit_visibility(unit, should_show)

	if should_show then
		Unit.flow_event(unit, "lua_attachment_unhidden")

		local item_data = slot_data.item_data
		local item_template = BackendUtils.get_item_template(item_data)
		local show_attachments_event = item_template.show_attachments_event

		if show_attachments_event then
			Unit.flow_event(self._unit, show_attachments_event)
		end
	else
		Unit.flow_event(unit, "lua_attachment_hidden")
	end
end

PlayerUnitAttachmentExtension.show_attachments = function (self, show)
	local slots = self._attachments.slots

	for slot_name, slot_data in pairs(slots) do
		if slot_data.unit then
			self:_show_attachment(slot_name, slot_data, show)
		end
	end
end

PlayerUnitAttachmentExtension.create_attachment_in_slot = function (self, slot_name, backend_id)
	local item_data = BackendUtils.get_item_from_masterlist(backend_id)
	local slot_data = self._attachments.slots[slot_name]
	local attachment_already_equiped = slot_data and slot_data.item_data == item_data
	local item_name = item_data.name

	if attachment_already_equiped then
		return
	end

	self:remove_attachment(slot_name)

	self._item_to_spawn = {
		slot_id = slot_name,
		item_data = item_data
	}
	self.resync_loadout_needed = true
end

PlayerUnitAttachmentExtension.update_resync_loadout = function (self)
	local equipment_to_spawn = self._item_to_spawn

	if not equipment_to_spawn then
		return
	end

	if self.resync_loadout_needed then
		self.resync_id = self:resync_loadout(equipment_to_spawn)
		self.resync_loadout_needed = false
	end

	local resync_id = self.resync_id

	if resync_id and self:all_clients_loaded_resource(resync_id) then
		self:spawn_resynced_loadout(equipment_to_spawn)

		self._item_to_spawn = nil
		self.resync_id = nil
	end
end

PlayerUnitAttachmentExtension.resync_loadout = function (self, equipment_to_spawn)
	if not equipment_to_spawn then
		return
	end

	local career_index = self.career_extension:career_index()
	local network_manager = Managers.state.network
	local resync_id = network_manager.profile_synchronizer:resync_loadout(self._profile_index, career_index, self._player)

	return resync_id
end

PlayerUnitAttachmentExtension.all_clients_loaded_resource = function (self, resync_id)
	local profile_synchronizer = Managers.state.network.profile_synchronizer
	local all_clients_have_loaded_resources = profile_synchronizer:all_clients_have_loaded_sync_id(resync_id)

	return all_clients_have_loaded_resources
end

PlayerUnitAttachmentExtension.spawn_resynced_loadout = function (self, item_to_spawn)
	local slot_name = item_to_spawn.slot_id
	local item_data = item_to_spawn.item_data
	local network_manager = Managers.state.network
	local unit_object_id = Managers.state.unit_storage:go_id(self._unit)
	local slot_id = NetworkLookup.equipment_slots[slot_name]
	local item_id = NetworkLookup.item_names[item_data.name]
	local is_server = self._is_server

	if is_server then
		network_manager.network_transmit:send_rpc_clients("rpc_create_attachment", unit_object_id, slot_id, item_id)
	else
		network_manager.network_transmit:send_rpc_server("rpc_create_attachment", unit_object_id, slot_id, item_id)

		local backend_id = item_data.backend_id

		self:_send_rpc_add_attachment_buffs(unit_object_id, slot_id, item_id, backend_id)
	end

	self:create_attachment(slot_name, item_data)
end

PlayerUnitAttachmentExtension._send_rpc_add_attachment_buffs = function (self, unit_go_id, slot_id, item_id, backend_id)
	local buffs = self:_get_property_and_trait_buffs(backend_id)
	local server_buffs = {}
	server_buffs = table.merge(server_buffs, buffs.server)
	server_buffs = table.merge(server_buffs, buffs.both)
	local buff_name_1, buff_variable_data_1, buff_data_type_1, buff_value_1, buff_name_2, buff_variable_data_2, buff_data_type_2, buff_value_2, buff_name_3, buff_variable_data_3, buff_data_type_3, buff_value_3, buff_name_4, buff_variable_data_4, buff_data_type_4, buff_value_4 = nil
	buff_name_1, buff_variable_data_1 = next(server_buffs)

	if buff_name_1 then
		buff_data_type_1, buff_value_1 = next(buff_variable_data_1)
		buff_name_2, buff_variable_data_2 = next(server_buffs, buff_name_1)

		if buff_name_2 then
			buff_data_type_2, buff_value_2 = next(buff_variable_data_2)
			buff_name_3, buff_variable_data_3 = next(server_buffs, buff_name_2)

			if buff_name_3 then
				buff_data_type_3, buff_value_3 = next(buff_variable_data_3)
				buff_name_4, buff_variable_data_4 = next(server_buffs, buff_name_3)

				if buff_name_4 then
					buff_data_type_4, buff_value_4 = next(buff_variable_data_4)
				end
			end
		end
	end

	local default_buff_id = NetworkLookup.buff_templates["n/a"]
	local buff_1_id = (buff_name_1 and NetworkLookup.buff_templates[buff_name_1]) or default_buff_id
	local buff_2_id = (buff_name_2 and NetworkLookup.buff_templates[buff_name_2]) or default_buff_id
	local buff_3_id = (buff_name_3 and NetworkLookup.buff_templates[buff_name_3]) or default_buff_id
	local buff_4_id = (buff_name_4 and NetworkLookup.buff_templates[buff_name_4]) or default_buff_id
	local default_buff_data_type_id = NetworkLookup.buff_data_types["n/a"]
	local buff_data_type_1_id = (buff_name_1 and NetworkLookup.buff_data_types[buff_data_type_1]) or default_buff_data_type_id
	local buff_data_type_2_id = (buff_name_2 and NetworkLookup.buff_data_types[buff_data_type_2]) or default_buff_data_type_id
	local buff_data_type_3_id = (buff_name_3 and NetworkLookup.buff_data_types[buff_data_type_3]) or default_buff_data_type_id
	local buff_data_type_4_id = (buff_name_4 and NetworkLookup.buff_data_types[buff_data_type_4]) or default_buff_data_type_id

	if buff_name_1 then
		local network_manager = Managers.state.network
		local network_transmit = network_manager.network_transmit

		network_transmit:send_rpc_server("rpc_add_attachment_buffs", unit_go_id, slot_id, buff_1_id, buff_data_type_1_id, buff_value_1 or 1, buff_2_id, buff_data_type_2_id, buff_value_2 or 1, buff_3_id, buff_data_type_3_id, buff_value_3 or 1, buff_4_id, buff_data_type_4_id, buff_value_4 or 1)
	end
end

local buffs = {
	client = {},
	server = {},
	both = {}
}

PlayerUnitAttachmentExtension._get_property_and_trait_buffs = function (self, backend_id)
	local backend_items = Managers.backend:get_interface("items")

	table.clear(buffs.client)
	table.clear(buffs.server)
	table.clear(buffs.both)

	return GearUtils.get_property_and_trait_buffs(backend_items, backend_id, buffs)
end

local params = {}

PlayerUnitAttachmentExtension._apply_buffs = function (self, buffs_by_buffer, item_name, slot_name)
	local buff_extension = self.buff_extension
	local current_item_buffs = self.current_item_buffs[slot_name] or {}
	local index = 1

	for buffer, buffs in pairs(buffs_by_buffer) do
		if self._is_server or buffer == "client" or buffer == "both" then
			for buff_name, variable_data in pairs(buffs) do
				local buff_data = BuffTemplates[buff_name]

				fassert(buff_data, "buff name %s does not exist on item %s, typo?", buff_name, item_name)
				table.clear(params)

				for data_type, data_value in pairs(variable_data) do
					params[data_type] = data_value
				end

				current_item_buffs[index] = buff_extension:add_buff(buff_name, params)
				index = index + 1
			end
		end
	end

	self.current_item_buffs[slot_name] = current_item_buffs
end

PlayerUnitAttachmentExtension._remove_buffs = function (self, slot_name)
	local buff_extension = self.buff_extension
	local current_item_buffs = self.current_item_buffs[slot_name]

	if current_item_buffs then
		for i = 1, #current_item_buffs, 1 do
			local buff_id = current_item_buffs[i]

			buff_extension:remove_buff(buff_id)
		end

		table.clear(current_item_buffs)
	end
end

return
