local RPCS = {
	"rpc_add_controlled_unit",
	"rpc_remove_controlled_unit"
}
local extensions = {
	"AICommanderExtension"
}
AICommanderSystem = class(AICommanderSystem, ExtensionSystemBase)

AICommanderSystem.init = function (self, entity_system_creation_context, system_name)
	AICommanderSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	self._unit_storage = entity_system_creation_context.unit_storage
	self._network_transmit = entity_system_creation_context.network_transmit
	self._network_event_delegate = entity_system_creation_context.network_event_delegate

	self._network_event_delegate:register(self, unpack(RPCS))

	self._commanding_unit_lookup = {}
	self._extensions = {}
end

AICommanderSystem.destroy = function (self)
	self._network_event_delegate:unregister(self)
end

AICommanderSystem.register_commanding_unit = function (self, commanding_unit, controlled_unit)
	assert(self._commanding_unit_lookup[controlled_unit] == nil, "unit [%s] already has a commander [%s]", controlled_unit, self._commanding_unit_lookup[controlled_unit])

	self._commanding_unit_lookup[controlled_unit] = commanding_unit
end

AICommanderSystem.clear_commanding_unit = function (self, controlled_unit)
	self._commanding_unit_lookup[controlled_unit] = nil
end

AICommanderSystem.get_commander_unit = function (self, controlled_unit)
	return self._commanding_unit_lookup[controlled_unit]
end

AICommanderSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = AICommanderSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)
	self._extensions[unit] = extension

	return extension
end

AICommanderSystem.on_remove_extension = function (self, unit, extension_name)
	local extension = self._extensions[unit]

	self:_cleanup_extension(extension)

	self._extensions[unit] = nil

	AICommanderSystem.super.on_remove_extension(self, unit, extension_name)
end

AICommanderSystem._cleanup_extension = function (self, extension)
	local owned_units = extension:get_controlled_units()

	for controlled_unit in pairs(owned_units) do
		local skip_sync = true

		extension:remove_controlled_unit(controlled_unit, skip_sync)
	end
end

AICommanderSystem.rpc_add_controlled_unit = function (self, channel_id, commanding_unit_id, controlled_unit_id)
	local commanding_unit = self._unit_storage:unit(commanding_unit_id)
	local controlled_unit = self._unit_storage:unit(controlled_unit_id)

	if ALIVE[commanding_unit] and ALIVE[controlled_unit] then
		local extension = self._extensions[commanding_unit]
		local skip_sync = true

		extension:add_controlled_unit(controlled_unit, skip_sync)
	end
end

AICommanderSystem.rpc_remove_controlled_unit = function (self, channel_id, commanding_unit_id, controlled_unit_id)
	local commanding_unit = self._unit_storage:unit(commanding_unit_id)
	local controlled_unit = self._unit_storage:unit(controlled_unit_id)

	if ALIVE[commanding_unit] and ALIVE[controlled_unit] then
		local extension = self._extensions[commanding_unit]
		local skip_sync = true

		extension:remove_controlled_unit(controlled_unit, skip_sync)
	end
end
