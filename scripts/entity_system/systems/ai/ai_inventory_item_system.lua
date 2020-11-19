local RPCS = {}
local extensions = {
	"AIInventoryItemExtension"
}
AIInventoryItemSystem = class(AIInventoryItemSystem, ExtensionSystemBase)

AIInventoryItemSystem.init = function (self, context, system_name)
	local entity_manager = context.entity_manager

	entity_manager:register_system(self, system_name, extensions)

	self.entity_manager = entity_manager
	self.is_server = context.is_server
	self.world = context.world
	self.unit_storage = context.unit_storage
	local network_event_delegate = context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self.entities = {}
end

AIInventoryItemSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)
end

local dummy_input = {}

AIInventoryItemSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = {}

	ScriptUnit.set_extension(unit, "ai_inventory_item_system", extension, dummy_input)

	if extension_name == "AIInventoryItemExtension" then
		self.entities[unit] = extension
		extension.wielding_unit = extension_init_data.wielding_unit
	end

	return extension
end

AIInventoryItemSystem.on_remove_extension = function (self, unit, extension_name)
	self.entities[unit] = nil

	ScriptUnit.remove_extension(unit, self.NAME)
end

AIInventoryItemSystem.hot_join_sync = function (self, peer_id)
	return
end

AIInventoryItemSystem.update = function (self, context, t, dt)
	return
end

return
