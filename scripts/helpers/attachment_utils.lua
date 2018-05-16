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
		LODObject.set_orientation_node(attachment_lod_object, owner_unit, LODObject.node(owner_lod_object))
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

AttachmentUtils.hot_join_sync = function (sender, unit, slots)
	local unit_go_id = Managers.state.unit_storage:go_id(unit)

	for slot_name, slot_data in pairs(slots) do
		repeat
			local slot = InventorySettings.slots_by_name[slot_name]

			if slot.category ~= "attachment" then
				break
			end

			local slot_id = NetworkLookup.equipment_slots[slot_name]
			local attachment_id = NetworkLookup.item_names[slot_data.name]

			RPC.rpc_create_attachment(sender, unit_go_id, slot_id, attachment_id)
		until true
	end
end

return
