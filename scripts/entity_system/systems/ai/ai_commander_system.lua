local RPCS = {}
local extensions = {
	"AICommanderExtension"
}
AICommanderSystem = class(AICommanderSystem, ExtensionSystemBase)

AICommanderSystem.init = function (self, entity_system_creation_context, system_name)
	AICommanderSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	self._network_event_delegate = entity_system_creation_context.network_event_delegate

	self._network_event_delegate:register(self, unpack(RPCS))

	self._commanding_unit_lookup = {}
	self._extensions = {}

	Managers.state.event:register(self, "on_unit_killed", "on_unit_killed")
end

AICommanderSystem.destroy = function (self)
	self._network_event_delegate:unregister(self)
	Managers.state.event:unregister("on_unit_killed", self)
end

AICommanderSystem.register_commanding_unit = function (self, unit, commander)
	assert(self._commanding_unit_lookup[unit] == nil, "unit [%s] already has a commander [%s]", unit, self._commanding_unit_lookup[unit])

	self._commanding_unit_lookup[unit] = commander
end

AICommanderSystem.clear_commanding_unit = function (self, unit)
	self._commanding_unit_lookup[unit] = nil
end

AICommanderSystem.get_commander_unit = function (self, unit)
	return self._commanding_unit_lookup[unit]
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

	for unit in pairs(owned_units) do
		self:clear_commanding_unit(unit)
	end
end

AICommanderSystem.on_unit_killed = function (self, unit, killer_unit, killing_blow)
	local commanding_unit = self._commanding_unit_lookup[unit]

	if commanding_unit then
		local extension = self._extensions[commanding_unit]

		extension:remove_unit(unit)
	end
end

return
