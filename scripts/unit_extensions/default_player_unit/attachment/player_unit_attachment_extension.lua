-- chunkname: @scripts/unit_extensions/default_player_unit/attachment/player_unit_attachment_extension.lua

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
		slots = {},
	}
	self._synced_slot_buffs = {}
end

PlayerUnitAttachmentExtension.extensions_ready = function (self, world, unit)
	self.buff_extension = ScriptUnit.extension(unit, "buff_system")
	self.career_extension = ScriptUnit.extension(unit, "career_system")
	self._cosmetic_extension = ScriptUnit.extension(unit, "cosmetic_system")
	self._tp_unit_mesh = self._cosmetic_extension:get_third_person_mesh_unit()

	local attachments = self._attachments
	local profile = self._profile
	local attachment_slots = InventorySettings.attachment_slots
	local slots_n = #attachment_slots
	local career_name = self.career_extension:career_name()

	for i = 1, slots_n do
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
		end

		local backend_id = slot_data.item_data.backend_id
		local buffs = self:_get_property_and_trait_buffs(backend_id)
		local synced_buffs = {}

		synced_buffs = table.merge(synced_buffs, buffs.server)
		synced_buffs = table.merge(synced_buffs, buffs.both)

		if table.size(synced_buffs) > 0 then
			self:_send_rpc_add_attachment_buffs(unit_go_id, slot_id, synced_buffs)

			self._synced_slot_buffs[slot_name] = synced_buffs
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
	AttachmentUtils.hot_join_sync(sender, self._unit, self._attachments.slots, self._synced_slot_buffs)
end

PlayerUnitAttachmentExtension.create_attachment = function (self, slot_name, item_data)
	local attachments = self._attachments
	local unit = self._unit
	local item_template = BackendUtils.get_item_template(item_data)
	local parent_unit = unit

	if item_template.link_to_skin then
		parent_unit = self._tp_unit_mesh
	end

	local slot_data = AttachmentUtils.create_attachment(self._world, parent_unit, attachments, slot_name, item_data, false)

	attachments.slots[slot_name] = slot_data

	local item_data = slot_data.item_data
	local item_template = BackendUtils.get_item_template(item_data)
	local first_player_mode = ScriptUnit.extension(unit, "first_person_system").first_person_mode
	local is_bot = self._player.bot_player

	if not first_player_mode or is_bot then
		local show_attachments_event = item_template.show_attachments_event

		if show_attachments_event then
			Unit.flow_event(self._tp_unit_mesh, show_attachments_event)
			Unit.flow_event(self._unit, show_attachments_event)

			if self._show_attachments then
				self:_show_attachment(slot_name, slot_data, true)
			end
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

	CosmeticUtils.update_cosmetic_slot(self._player, slot_name, item_data.name)

	local backend_interface_items = Managers.backend:get_interface("items")
	local item = backend_interface_items:get_item_from_id(backend_id)

	LoadoutUtils.sync_loadout_slot(self._player, slot_name, item)
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
			Unit.flow_event(self._tp_unit_mesh, show_attachments_event)
			Unit.flow_event(self._unit, show_attachments_event)
		end

		self._cosmetic_extension:trigger_equip_events(slot_name, unit)
	else
		Unit.flow_event(unit, "lua_attachment_hidden")
	end
end

PlayerUnitAttachmentExtension.show_attachments = function (self, show)
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

PlayerUnitAttachmentExtension.create_attachment_in_slot = function (self, slot_name, backend_id)
	local item_data = BackendUtils.get_item_from_masterlist(backend_id)

	if not item_data then
		Crashify.print_exception("PlayerUnitAttachmentExtension", "Tried to create attachment %q in slot %q but was unable to find item", backend_id, slot_name)

		return
	end

	local slot_data = self._attachments.slots[slot_name]
	local attachment_already_equiped = slot_data and slot_data.item_data == item_data
	local item_name = item_data.name

	if attachment_already_equiped then
		return
	end

	self:remove_attachment(slot_name)

	self._item_to_spawn = {
		slot_id = slot_name,
		item_data = item_data,
	}
	self.resync_loadout_needed = true
end

PlayerUnitAttachmentExtension.update_resync_loadout = function (self)
	local equipment_to_spawn = self._item_to_spawn

	if not equipment_to_spawn then
		return
	end

	local network_manager = Managers.state.network
	local profile_synchronizer = network_manager.profile_synchronizer
	local peer_id = self._player:network_id()
	local local_player_id = self._player:local_player_id()

	if self.resync_loadout_needed then
		profile_synchronizer:resync_loadout(peer_id, local_player_id)

		self.resync_loadout_needed = false
	end

	if profile_synchronizer:all_ingame_synced_for_peer(peer_id, local_player_id) then
		self:spawn_resynced_loadout(equipment_to_spawn)

		self._item_to_spawn = nil
	end
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
	end

	local backend_id = item_data.backend_id
	local buffs = self:_get_property_and_trait_buffs(backend_id)
	local synced_buffs = {}

	synced_buffs = table.merge(synced_buffs, buffs.server)
	synced_buffs = table.merge(synced_buffs, buffs.both)

	if table.size(synced_buffs) > 0 then
		self:_send_rpc_add_attachment_buffs(unit_object_id, slot_id, synced_buffs)

		self._synced_slot_buffs[slot_name] = synced_buffs
	end

	self:create_attachment(slot_name, item_data)
end

PlayerUnitAttachmentExtension._send_rpc_add_attachment_buffs = function (self, unit_object_id, slot_id, synced_buffs)
	local rpc_params = BuffUtils.buffs_to_rpc_params(synced_buffs)
	local num_buffs, buff_ids, buff_value_type_ids, buff_values = unpack(rpc_params)

	if #buff_ids ~= #buff_value_type_ids or #buff_value_type_ids ~= #buff_values then
		fassert(false, "[PlayerUnitAttachmentExtension] Length of arrays buff_names(%d) and buff_value_types(%d) and buff_values(%d) are not equal!", #buff_ids, #buff_value_type_ids, #buff_values)
	end

	if num_buffs > 0 then
		local network_manager = Managers.state.network
		local network_transmit = network_manager.network_transmit

		if self._is_server then
			network_transmit:send_rpc_clients("rpc_add_attachment_buffs", unit_object_id, slot_id, num_buffs, buff_ids, buff_value_type_ids, buff_values)
		else
			network_transmit:send_rpc_server("rpc_add_attachment_buffs", unit_object_id, slot_id, num_buffs, buff_ids, buff_value_type_ids, buff_values)
		end
	end
end

local buffs = {
	client = {},
	server = {},
	both = {},
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
		for i = 1, #current_item_buffs do
			local buff_id = current_item_buffs[i]

			buff_extension:remove_buff(buff_id)
		end

		table.clear(current_item_buffs)
	end
end
