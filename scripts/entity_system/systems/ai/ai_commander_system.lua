require("scripts/unit_extensions/ai_commander/command_states")
require("scripts/unit_extensions/ai_commander/controlled_unit_templates")

local RPCS = {
	"rpc_add_controlled_unit",
	"rpc_remove_controlled_unit",
	"rpc_cancel_current_command",
	"rpc_command_stand_ground",
	"rpc_command_attack"
}
local extensions = {
	"AICommanderExtension"
}
AICommanderSystem = class(AICommanderSystem, ExtensionSystemBase)

AICommanderSystem.init = function (self, entity_system_creation_context, system_name)
	AICommanderSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	self._is_server = entity_system_creation_context.is_server
	self._unit_storage = entity_system_creation_context.unit_storage
	self._network_transmit = entity_system_creation_context.network_transmit
	self._network_event_delegate = entity_system_creation_context.network_event_delegate

	self._network_event_delegate:register(self, unpack(RPCS))

	self._commander_unit_lookup = {}
	self._extensions = {}
end

AICommanderSystem.destroy = function (self)
	self._network_event_delegate:unregister(self)
end

AICommanderSystem.register_commander_unit = function (self, commander_unit, controlled_unit)
	assert(self._commander_unit_lookup[controlled_unit] == nil, "unit [%s] already has a commander [%s]", controlled_unit, self._commander_unit_lookup[controlled_unit])

	self._commander_unit_lookup[controlled_unit] = commander_unit
end

AICommanderSystem.clear_commander_unit = function (self, controlled_unit)
	self._commander_unit_lookup[controlled_unit] = nil
end

AICommanderSystem.get_commander_unit = function (self, controlled_unit)
	return self._commander_unit_lookup[controlled_unit]
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

AICommanderSystem.rpc_add_controlled_unit = function (self, channel_id, commander_unit_id, controlled_unit_id, template_id)
	local commander_unit = self._unit_storage:unit(commander_unit_id)
	local controlled_unit = self._unit_storage:unit(controlled_unit_id)

	if ALIVE[commander_unit] and ALIVE[controlled_unit] then
		local extension = self._extensions[commander_unit]
		local template_name = NetworkLookup.controlled_unit_templates[template_id]
		local skip_sync = true
		local t = Managers.time:time("game")

		extension:add_controlled_unit(controlled_unit, template_name, t, skip_sync)
	end
end

AICommanderSystem.rpc_remove_controlled_unit = function (self, channel_id, commander_unit_id, controlled_unit_id)
	local commander_unit = self._unit_storage:unit(commander_unit_id)
	local controlled_unit = self._unit_storage:unit(controlled_unit_id)

	if ALIVE[commander_unit] and ALIVE[controlled_unit] then
		local extension = self._extensions[commander_unit]
		local skip_sync = true

		extension:remove_controlled_unit(controlled_unit, skip_sync)
	end
end

AICommanderSystem.rpc_cancel_current_command = function (self, channel_id, controlled_unit_id)
	local controlled_unit = self._unit_storage:unit(controlled_unit_id)
	local commander_unit = self:get_commander_unit(controlled_unit)

	if not commander_unit then
		return
	end

	local extension = self._extensions[commander_unit]

	if not extension then
		return
	end

	extension:cancel_current_command(controlled_unit)
end

AICommanderSystem.rpc_command_stand_ground = function (self, channel_id, controlled_unit_id, position, rotation)
	local controlled_unit = self._unit_storage:unit(controlled_unit_id)
	local commander_unit = self:get_commander_unit(controlled_unit)

	if not commander_unit then
		return
	end

	local extension = self._extensions[commander_unit]

	if not extension then
		return
	end

	extension:command_stand_ground(controlled_unit, position, rotation)
end

AICommanderSystem.rpc_command_attack = function (self, channel_id, controlled_unit_id, target_unit_id)
	local controlled_unit = self._unit_storage:unit(controlled_unit_id)
	local commander_unit = self:get_commander_unit(controlled_unit)

	if not commander_unit then
		return
	end

	local extension = self._extensions[commander_unit]

	if not extension then
		return
	end

	local target_unit = self._unit_storage:unit(target_unit_id)

	if not ALIVE[target_unit] then
		return
	end

	extension:command_attack(controlled_unit, target_unit)
end
