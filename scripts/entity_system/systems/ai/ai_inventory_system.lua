require("scripts/settings/ai_inventory_templates")
require("scripts/entity_system/systems/ai/ai_inventory_extension")

local RPCS = {
	"rpc_ai_inventory_wield",
	"rpc_ai_drop_single_item",
	"rpc_ai_show_single_item"
}
local extensions = {
	"AIInventoryExtension"
}
AIInventorySystem = class(AIInventorySystem, ExtensionSystemBase)
AIInventorySystem.init = function (self, context, system_name)
	local entity_manager = context.entity_manager

	entity_manager.register_system(entity_manager, self, system_name, extensions)

	self.entity_manager = entity_manager
	self.is_server = context.is_server
	self.world = context.world
	self.unit_storage = context.unit_storage
	local network_event_delegate = context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	self.unit_extension_data = {}
	self.units_to_wield = {}
	self.units_to_wield_n = 0
	self.units_to_drop = {}
	self.units_to_drop_n = 0
	self.item_set_to_wield = {}

	return 
end
AIInventorySystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	return 
end
AIInventorySystem.drop_item = function (self, unit)
	self.units_to_drop_n = self.units_to_drop_n + 1
	self.units_to_drop[self.units_to_drop_n] = unit

	return 
end

local function link_unit(attachment_node_linking, world, target, source)
	for i, attachment_nodes in ipairs(attachment_node_linking) do
		local source_node = attachment_nodes.source
		local target_node = attachment_nodes.target
		local source_node_index = (type(source_node) == "string" and Unit.node(source, source_node)) or source_node
		local target_node_index = (type(target_node) == "string" and Unit.node(target, target_node)) or target_node

		World.link_unit(world, target, target_node_index, source, source_node_index)
	end

	return 
end

local dummy_input = {}
AIInventorySystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = nil

	fassert(next(extension_init_data) ~= nil, "AI's unit template specifies inventory extension but no init data was sent")

	extension_init_data.world = self.world
	extension_init_data.is_server = self.is_server
	extension = AIInventoryExtension:new(unit, extension_init_data)

	ScriptUnit.set_extension(unit, "ai_inventory_system", extension, dummy_input)

	self.unit_extension_data[unit] = extension

	return extension
end
AIInventorySystem.on_remove_extension = function (self, unit, extension_name)
	local units_to_wield = self.units_to_wield
	local units_to_wield_n = self.units_to_wield_n
	local i = 1

	while i <= units_to_wield_n do
		if unit == units_to_wield[i] then
			units_to_wield[i] = units_to_wield[units_to_wield_n]
			units_to_wield_n = units_to_wield_n - 1
		else
			i = i + 1
		end
	end

	self.units_to_wield_n = units_to_wield_n
	local units_to_drop = self.units_to_drop
	local units_to_drop_n = self.units_to_drop_n
	i = 1

	while i <= units_to_drop_n do
		if unit == units_to_drop[i] then
			units_to_drop[i] = units_to_drop[units_to_drop_n]
			units_to_drop_n = units_to_drop_n - 1
		else
			i = i + 1
		end
	end

	self.units_to_drop_n = units_to_drop_n

	ScriptUnit.remove_extension(unit, self.NAME)

	return 
end
AIInventorySystem.update = function (self, context, t, dt)
	local world = self.world
	local units_to_wield = self.units_to_wield
	local units_to_wield_n = self.units_to_wield_n

	for i = 1, units_to_wield_n, 1 do
		local unit = units_to_wield[i]
		local extension = self.unit_extension_data[unit]
		local start_index, end_index = nil
		local item_sets = extension.item_sets

		if item_sets then
			if extension.wielded then
				extension.unwield_set(extension, extension.current_item_set_index)
			end

			local set_index = self.item_set_to_wield[unit]
			extension.current_item_set_index = set_index
			local item_set = item_sets[set_index]
			slot18 = item_set.start_index

			if extension.dropped then
				end_index = 0
			else
				end_index = item_set.end_index
			end

			start_index = slot18
		else
			slot16 = 1

			if extension.dropped then
				end_index = 0
			else
				end_index = extension.inventory_items_n
			end

			start_index = slot16
		end

		extension.wielded = true
		local inventory_item_definitions = extension.inventory_item_definitions
		local inventory_item_units = extension.inventory_item_units
		local inventory_items_n = (extension.dropped and 0) or extension.inventory_items_n

		if script_data.ai_debug_inventory and extension.dropped then
			printf("[AIInventorySystem] unit[%s] wants to wield items, but have already been told to drop everything", tostring(unit))
		end

		for j = start_index, end_index, 1 do
			local item = inventory_item_definitions[j]
			local attachment_node_linking = item.attachment_node_linking
			local wielded = attachment_node_linking.wielded

			if wielded then
				local item_unit = inventory_item_units[j]

				link_unit(wielded, world, item_unit, unit)

				if script_data.ai_debug_inventory then
					printf("[AIInventorySystem] unit[%s] wielding %s", tostring(unit), tostring(item_unit))
				end
			end
		end
	end

	self.units_to_wield_n = 0
	local units_to_drop = self.units_to_drop
	local units_to_drop_n = self.units_to_drop_n

	for i = 1, units_to_drop_n, 1 do
		local unit = units_to_drop[i]
		local extension = self.unit_extension_data[unit]

		fassert(extension.dropped == nil)

		extension.dropped = true
		local inventory_item_definitions = extension.inventory_item_definitions
		local inventory_items_n = extension.inventory_items_n

		for j = 1, inventory_items_n, 1 do
			extension.drop_single_item(extension, j, "death")
		end

		if script_data.ai_debug_inventory then
			printf("[AIInventorySystem] unit[%s] dropping all items", tostring(unit))
		end
	end

	self.units_to_drop_n = 0

	return 
end
AIInventorySystem.rpc_ai_inventory_wield = function (self, sender, go_id, item_set_index)
	local unit = self.unit_storage:unit(go_id)

	if unit == nil then
		return 
	end

	self.units_to_wield_n = self.units_to_wield_n + 1
	self.units_to_wield[self.units_to_wield_n] = unit
	self.item_set_to_wield[unit] = item_set_index

	return 
end
AIInventorySystem.rpc_ai_drop_single_item = function (self, sender, unit_id, item_inventory_index, item_drop_reason_id)
	local unit = self.unit_storage:unit(unit_id)

	if unit == nil then
		return 
	end

	local ai_inventory_extension = ScriptUnit.extension(unit, "ai_inventory_system")

	ai_inventory_extension.drop_single_item(ai_inventory_extension, item_inventory_index, NetworkLookup.item_drop_reasons[item_drop_reason_id])

	return 
end
AIInventorySystem.rpc_ai_show_single_item = function (self, sender, unit_id, item_inventory_index, show)
	local unit = self.unit_storage:unit(unit_id)

	if unit == nil then
		return 
	end

	local ai_inventory_extension = ScriptUnit.extension(unit, "ai_inventory_system")

	ai_inventory_extension.show_single_item(ai_inventory_extension, item_inventory_index, show)

	return 
end
AIInventorySystem.hot_join_sync = function (self, sender)
	for unit, extension in pairs(self.unit_extension_data) do
		extension.hot_join_sync(extension, sender)
	end

	return 
end

return 
