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
	self._synced_slot_buffs = {}
	self.current_item_buffs = {}
end

PlayerHuskAttachmentExtension.extensions_ready = function (self, world, unit)
	self.buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._cosmetic_extension = ScriptUnit.extension(unit, "cosmetic_system")
	self._tp_unit_mesh = self._cosmetic_extension:get_third_person_mesh_unit()

	Unit.flow_event(self._tp_unit_mesh, "lua_attachment_unhidden")
end

PlayerHuskAttachmentExtension.destroy = function (self)
	local slots = self._attachments.slots

	for slot_name, slot_data in pairs(slots) do
		AttachmentUtils.destroy_attachment(self._world, self._unit, slot_data)
	end
end

PlayerHuskAttachmentExtension.update = function (self, unit, input, dt, context, t)
	return
end

PlayerHuskAttachmentExtension.hot_join_sync = function (self, sender)
	AttachmentUtils.hot_join_sync(sender, self._unit, self._attachments.slots, self._synced_slot_buffs)
end

PlayerHuskAttachmentExtension.create_attachment = function (self, slot_name, item_data)
	if not self._profile then
		return
	end

	local unit = self._unit
	local attachments = self._attachments
	local old_slot_data = attachments.slots[slot_name]

	if old_slot_data then
		self:remove_attachment(slot_name)
	end

	local slot_data = AttachmentUtils.create_attachment(self._world, unit, attachments, slot_name, item_data, true)
	local item_template = BackendUtils.get_item_template(item_data)
	local show_attachments_event = item_template.show_attachments_event

	if show_attachments_event then
		Unit.flow_event(self._tp_unit_mesh, show_attachments_event)
		Unit.flow_event(unit, show_attachments_event)
	end

	self:_show_attachment(slot_name, slot_data, true)

	attachments.slots[slot_name] = slot_data

	if not DEDICATED_SERVER then
		local outline_extension = ScriptUnit.extension(unit, "outline_system")

		outline_extension:reapply_outline()
	end

	local cosmetic_extension = ScriptUnit.has_extension(unit, "cosmetic_system")

	if cosmetic_extension and slot_name == "slot_hat" then
		local character_material_changes = item_template.character_material_changes

		if character_material_changes then
			cosmetic_extension:change_skin_materials(character_material_changes)
		end
	end
end

PlayerHuskAttachmentExtension.remove_attachment = function (self, slot_name)
	local slot_data = self._attachments.slots[slot_name]

	AttachmentUtils.destroy_attachment(self._world, self._unit, slot_data)

	if self.current_item_buffs[slot_name] then
		self:_remove_buffs(slot_name)
	end

	self._attachments.slots[slot_name] = nil
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
	if self._show_attachments ~= show then
		local slots = self._attachments.slots

		for slot_name, slot_data in pairs(slots) do
			if slot_data.unit then
				self:_show_attachment(slot_name, slot_data, show)
			end
		end

		local attachment_event = show and "lua_attachment_unhidden" or "lua_attachment_hidden"

		Unit.flow_event(self._tp_unit_mesh, attachment_event)

		self._show_attachments = show
	end
end

PlayerHuskAttachmentExtension._show_attachment = function (self, slot_name, slot_data, show)
	local should_show = show
	local always_hide = self._cosmetic_extension:always_hide_attachment_slot(slot_name)

	if always_hide then
		should_show = false
	end

	local unit = slot_data.unit

	if unit then
		Unit.set_unit_visibility(unit, should_show)

		if should_show then
			Unit.flow_event(unit, "lua_attachment_unhidden")
			self._cosmetic_extension:trigger_equip_events(slot_name, unit)
		else
			Unit.flow_event(unit, "lua_attachment_hidden")
		end
	end
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

		current_item_buffs[index] = buff_extension:add_buff(buff_name, params)
		index = index + 1
	end

	self.current_item_buffs[slot_name] = current_item_buffs
end

PlayerHuskAttachmentExtension._remove_buffs = function (self, slot_name)
	local buff_extension = ScriptUnit.extension(self._unit, "buff_system")
	local current_item_buffs = self.current_item_buffs[slot_name]

	for i = 1, #current_item_buffs do
		local buff_id = current_item_buffs[i]

		buff_extension:remove_buff(buff_id)
	end

	table.clear(current_item_buffs)
end

PlayerHuskAttachmentExtension.set_buffs_to_slot = function (self, slot_name, buffs)
	local slot_buffs = self._synced_slot_buffs[slot_name] or {}

	table.clear(slot_buffs)

	self._synced_slot_buffs[slot_name] = buffs

	self:_apply_buffs(buffs, slot_name)
end
