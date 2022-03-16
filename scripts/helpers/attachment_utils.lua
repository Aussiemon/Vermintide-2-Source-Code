AttachmentUtils = {}

AttachmentUtils.create_attachment = function (world, owner_unit, attachments, slot_name, item_data, show)
	assert(attachments.slots[slot_name] == nil, "Slot is not empty, remove attachment before creating a new one.")

	local item_template = BackendUtils.get_item_template(item_data)
	local unit = nil

	if item_data.unit then
		local item_units = BackendUtils.get_item_units(item_data)
		local unit_spawner = Managers.state.unit_spawner

		if item_units.unit and item_units.unit ~= "" then
			unit = unit_spawner:spawn_local_unit(item_units.unit)

			Unit.set_unit_visibility(unit, show)

			if not show then
				Unit.flow_event(unit, "lua_attachment_hidden")
			end
		end
	end

	if item_template.attachment_node_linking and item_template.attachment_node_linking[slot_name] then
		AttachmentUtils.link(world, owner_unit, unit, item_template.attachment_node_linking[slot_name])
	end

	if Unit.num_lod_objects(owner_unit) ~= 0 and unit and Unit.num_lod_objects(unit) ~= 0 then
		local owner_lod_object = Unit.lod_object(owner_unit, 0)
		local attachment_lod_object = Unit.lod_object(unit, 0)

		LODObject.set_bounding_volume(attachment_lod_object, LODObject.bounding_volume(owner_lod_object))
		World.link_unit(world, unit, LODObject.node(attachment_lod_object), owner_unit, LODObject.node(owner_lod_object))
	end

	local slot_data = {
		unit = unit,
		name = item_data.name,
		item_data = item_data
	}

	return slot_data
end

AttachmentUtils.create_weapon_visual_attachment = function (world, owner_unit, unit_to_spawn, attachment_node_linking)
	local unit_spawner = Managers.state.unit_spawner
	local unit = unit_spawner:spawn_local_unit(unit_to_spawn)

	AttachmentUtils.link(world, owner_unit, unit, attachment_node_linking)

	return unit
end

AttachmentUtils.destroy_attachment = function (world, owner_unit, slot_data)
	local unit = slot_data.unit
	local unit_spawner = Managers.state.unit_spawner

	if unit then
		unit_spawner:mark_for_deletion(unit)
	end
end

AttachmentUtils.link = function (world, source, target, node_linking)
	for _, link_data in ipairs(node_linking) do
		local source_node = link_data.source
		local target_node = link_data.target
		local source_node_index = (type(source_node) == "string" and Unit.node(source, source_node)) or source_node
		local target_node_index = (type(target_node) == "string" and Unit.node(target, target_node)) or target_node

		World.link_unit(world, target, target_node_index, source, source_node_index)
	end
end

AttachmentUtils.hot_join_sync = function (peer_id, unit, slots, synced_buffs)
	local unit_go_id = Managers.state.unit_storage:go_id(unit)

	for slot_name, slot_data in pairs(slots) do
		repeat
			local slot = InventorySettings.slots_by_name[slot_name]

			if slot.category ~= "attachment" then
				break
			end

			local slot_id = NetworkLookup.equipment_slots[slot_name]
			local attachment_id = NetworkLookup.item_names[slot_data.name]
			local channel_id = PEER_ID_TO_CHANNEL[peer_id]

			RPC.rpc_create_attachment(channel_id, unit_go_id, slot_id, attachment_id)

			local slot_synced_buffs = synced_buffs[slot_name]

			if slot_synced_buffs then
				local rpc_params = BuffUtils.buffs_to_rpc_params(slot_synced_buffs)
				local num_buffs, buff_ids, buff_value_type_ids, buff_values = unpack(rpc_params)

				RPC.rpc_add_attachment_buffs(channel_id, unit_go_id, slot_id, num_buffs, buff_ids, buff_value_type_ids, buff_values)
			end
		until true
	end
end

AttachmentUtils.get_syncable_buff_params = function (synced_buffs)
	local buff_name_1, buff_variable_data_1, buff_data_type_1, buff_value_1, buff_name_2, buff_variable_data_2, buff_data_type_2, buff_value_2, buff_name_3, buff_variable_data_3, buff_data_type_3, buff_value_3, buff_name_4, buff_variable_data_4, buff_data_type_4, buff_value_4 = nil
	buff_name_1, buff_variable_data_1 = next(synced_buffs)

	if buff_name_1 then
		buff_data_type_1, buff_value_1 = next(buff_variable_data_1)
		buff_name_2, buff_variable_data_2 = next(synced_buffs, buff_name_1)

		if buff_name_2 then
			buff_data_type_2, buff_value_2 = next(buff_variable_data_2)
			buff_name_3, buff_variable_data_3 = next(synced_buffs, buff_name_2)

			if buff_name_3 then
				buff_data_type_3, buff_value_3 = next(buff_variable_data_3)
				buff_name_4, buff_variable_data_4 = next(synced_buffs, buff_name_3)

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
	buff_value_1 = buff_value_1 or 1
	buff_value_2 = buff_value_2 or 1
	buff_value_3 = buff_value_3 or 1
	buff_value_4 = buff_value_4 or 1
	local params = {
		buff_1_id,
		buff_data_type_1_id,
		buff_value_1,
		buff_2_id,
		buff_data_type_2_id,
		buff_value_2,
		buff_3_id,
		buff_data_type_3_id,
		buff_value_3,
		buff_4_id,
		buff_data_type_4_id,
		buff_value_4
	}

	return params
end

return
