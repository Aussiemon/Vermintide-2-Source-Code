PlayerHuskAttachmentExtension = class(PlayerHuskAttachmentExtension)
PlayerHuskAttachmentExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._world = extension_init_context.world
	self._unit = unit
	local profile = extension_init_data.profile
	local slots = extension_init_data.slots
	self._profile = profile
	self._slots = slots
	self._attachments = {
		slots = {}
	}
	self._slot_buffs = {}
	self.current_item_buffs = {}

	return 
end
PlayerHuskAttachmentExtension.extensions_ready = function (self, world, unit)
	self.buff_extension = ScriptUnit.extension(unit, "buff_system")

	return 
end
PlayerHuskAttachmentExtension.destroy = function (self)
	local slots = self._attachments.slots

	for slot_name, slot_data in pairs(slots) do
		AttachmentUtils.destroy_attachment(self._world, self._unit, slot_data)
	end

	return 
end
PlayerHuskAttachmentExtension.update = function (self, unit, input, dt, context, t)
	return 
end
PlayerHuskAttachmentExtension.hot_join_sync = function (self, sender)
	AttachmentUtils.hot_join_sync(sender, self._unit, self._attachments.slots)

	return 
end
PlayerHuskAttachmentExtension.create_attachment = function (self, slot_name, item_data)
	if not self._profile then
		return 
	end

	local attachments = self._attachments
	local old_slot_data = attachments.slots[slot_name]

	if old_slot_data then
		self.remove_attachment(self, slot_name)
	end

	local slot_data = AttachmentUtils.create_attachment(self._world, self._unit, attachments, slot_name, item_data, true)
	local item_template = BackendUtils.get_item_template(item_data)
	local show_attachments_event = item_template.show_attachments_event

	if show_attachments_event then
		Unit.flow_event(self._unit, show_attachments_event)
	end

	attachments.slots[slot_name] = slot_data
	local outline_extension = ScriptUnit.extension(self._unit, "outline_system")

	outline_extension.reapply_outline(outline_extension)

	return 
end
PlayerHuskAttachmentExtension.remove_attachment = function (self, slot_name)
	local slot_data = self._attachments.slots[slot_name]

	AttachmentUtils.destroy_attachment(self._world, self._unit, slot_data)

	if self.current_item_buffs[slot_name] then
		self._remove_buffs(self, slot_name)
	end

	self._attachments.slots[slot_name] = nil

	return 
end
PlayerHuskAttachmentExtension.attachments = function (self)
	return self._attachments
end
PlayerHuskAttachmentExtension.get_slot_data = function (self, slot_id)
	local attachments = self._attachments
	local slots = attachments.slots

	return slots[slot_id]
end
PlayerHuskAttachmentExtension.show_attachments = function (self, show)
	local slots = self._attachments.slots

	for slot_name, slot_data in pairs(slots) do
		local unit = slot_data.unit

		Unit.set_unit_visibility(unit, show)

		if show then
			Unit.flow_event(unit, "lua_attachment_unhidden")
		else
			Unit.flow_event(unit, "lua_attachment_hidden")
		end
	end

	return 
end
local params = {}
PlayerHuskAttachmentExtension._apply_buffs = function (self, buffs, slot_name)
	local buff_extension = ScriptUnit.extension(self._unit, "buff_system")
	local current_item_buffs = self.current_item_buffs[slot_name] or {}
	local index = 1

	for buff_name, variable_data in pairs(buffs) do
		table.clear(params)

		for data_type, data_value in pairs(variable_data) do
			params[data_type] = data_value
		end

		current_item_buffs[index] = buff_extension.add_buff(buff_extension, buff_name, params)
		index = index + 1
	end

	self.current_item_buffs[slot_name] = current_item_buffs

	return 
end
PlayerHuskAttachmentExtension._remove_buffs = function (self, slot_name)
	local buff_extension = ScriptUnit.extension(self._unit, "buff_system")
	local current_item_buffs = self.current_item_buffs[slot_name]

	for i = 1, #current_item_buffs, 1 do
		local buff_id = current_item_buffs[i]

		buff_extension.remove_buff(buff_extension, buff_id)
	end

	table.clear(current_item_buffs)

	return 
end
PlayerHuskAttachmentExtension.add_buffs_to_slot = function (self, slot_name, buff_name_1, buff_data_type_1, value_1, buff_name_2, buff_data_type_2, value_2, buff_name_3, buff_data_type_3, value_3, buff_name_4, buff_data_type_4, value_4)
	local slot_buffs = self._slot_buffs[slot_name] or {}

	if buff_name_1 ~= "n/a" then
		slot_buffs[buff_name_1] = {
			[buff_data_type_1] = value_1
		}
	end

	if buff_name_2 ~= "n/a" then
		slot_buffs[buff_name_2] = {
			[buff_data_type_2] = value_2
		}
	end

	if buff_name_3 ~= "n/a" then
		slot_buffs[buff_name_3] = {
			[buff_data_type_3] = value_3
		}
	end

	if buff_name_4 ~= "n/a" then
		slot_buffs[buff_name_4] = {
			[buff_data_type_4] = value_4
		}
	end

	self._slot_buffs[slot_name] = slot_buffs

	if Managers.player.is_server then
		self._apply_buffs(self, slot_buffs, slot_name)
	end

	return 
end

return 
