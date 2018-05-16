require("scripts/unit_extensions/level/payload_extension")

PayloadSystem = class(PayloadSystem, ExtensionSystemBase)
local RPCS = {
	"rpc_payload_flow_event"
}
local extensions = {
	"PayloadExtension",
	"PayloadGizmoExtension"
}

PayloadSystem.init = function (self, entity_system_creation_context, system_name)
	PayloadSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self._payloads = {}
	self._payload_gizmos = {}
end

PayloadSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)
end

PayloadSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data, ...)
	local payload_gizmos = self._payload_gizmos
	local extension = nil

	if extension_name == "PayloadExtension" then
		self._payloads[#self._payloads + 1] = unit
		extension = PickupSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data, ...)
	elseif extension_name == "PayloadGizmoExtension" then
		local spline_name = Unit.get_data(unit, "spline_name")

		fassert(spline_name ~= "", "Spline Gizmo added to level without spline name at position %s", Unit.world_position(unit, 0))

		if not payload_gizmos[spline_name] then
			payload_gizmos[spline_name] = {}
		end

		local spline_specific_gizmos = payload_gizmos[spline_name]
		spline_specific_gizmos[#spline_specific_gizmos + 1] = unit
		extension = {}
	end

	return extension
end

PayloadSystem.init_payloads = function (self)
	local payloads = self._payloads
	local num_payloads = #payloads
	local payload_gizmos = self._payload_gizmos

	for i = 1, num_payloads, 1 do
		local payload = payloads[i]
		local spline_name = Unit.get_data(payload, "spline_name")
		local extension = ScriptUnit.extension(payload, "payload_system")
		local gizmos = payload_gizmos[spline_name]

		extension:init_payload(gizmos)
	end
end

PayloadSystem.rpc_payload_flow_event = function (self, sender, payload_unit_id, spline_index)
	local level = LevelHelper:current_level(self.world)
	local unit = Level.unit_by_index(level, payload_unit_id)
	local extension = ScriptUnit.extension(unit, "payload_system")

	extension:payload_flow_event(spline_index)
end

PayloadSystem.hot_join_sync = function (self)
	return
end

return
