-- chunkname: @scripts/entity_system/systems/unit_flow_override_system/unit_flow_override_system.lua

require("scripts/entity_system/systems/unit_flow_override_system/unit_flow_event_override_settings")

UnitFlowOverrideSystem = class(UnitFlowOverrideSystem, ExtensionSystemBase)
UNIT_FLOW_EVENT = UNIT_FLOW_EVENT or Unit.flow_event

if not UNIT_FLOW_EVENT_OVERRIDDEN then
	Unit.flow_event = function (unit, event_name, params)
		local unit_flow_override_extension = ScriptUnit.has_extension(unit, "unit_flow_override_system")

		if unit_flow_override_extension and UnitFlowEventOverrideSettings[event_name] then
			unit_flow_override_extension.handle_flow_event(unit, event_name, params)
		else
			UNIT_FLOW_EVENT(unit, event_name, params)
		end
	end

	UNIT_FLOW_EVENT_OVERRIDDEN = true
end

local extensions = {
	"UnitFlowOverrideExtension",
}

UnitFlowOverrideSystem.init = function (self, entity_system_creation_context, system_name)
	UnitFlowOverrideSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	self._unit_extensions = {}
	self._unit_event_data = {}
	self._frozen_unit_extensions = {}
	self._dynamic_events = {}
	self._entity_system_creation_context = entity_system_creation_context
end

UnitFlowOverrideSystem.add_ext_functions = {
	UnitFlowOverrideExtension = function (self, extension)
		extension.handle_flow_event = callback(self, "handle_flow_event")
	end,
}

UnitFlowOverrideSystem.on_add_extension = function (self, world, unit, extension_name)
	local extension = {}
	local setup_func = UnitFlowOverrideSystem.add_ext_functions[extension_name]

	setup_func(self, extension)
	ScriptUnit.set_extension(unit, "unit_flow_override_system", extension)

	self._unit_extensions[unit] = extension
	self._unit_event_data[unit] = {}

	return extension
end

UnitFlowOverrideSystem.handle_flow_event = function (self, unit, event_name, params)
	local unit_data = self._unit_event_data[unit]

	unit_data[event_name] = unit_data[event_name] or {}

	local unit_event_data = unit_data[event_name]
	local override = UnitFlowEventOverrideSettings[event_name]

	override.init(self, unit_event_data, unit, event_name, params)

	if override.run_flow_event then
		local flow_event = override.flow_event_name or event_name

		UNIT_FLOW_EVENT(unit, flow_event, params)
	end

	if override.is_dynamic then
		self:_add_dynamic_event_data(unit, event_name, unit_event_data)
	end
end

UnitFlowOverrideSystem._add_dynamic_event_data = function (self, unit, event_name, event_data)
	local dynamic_events = self._dynamic_events
	local unit_dynamic_events = dynamic_events[unit] or {}

	unit_dynamic_events[event_name] = event_data
	dynamic_events[unit] = unit_dynamic_events
end

local EMPTY_TABLE = {}

UnitFlowOverrideSystem.destroy_data = function (self, unit, event_name)
	local unit_dynamic_events = self._dynamic_events[unit] or EMPTY_TABLE
	local unit_event_data = self._unit_event_data[unit]
	local current_event_unit_event_data = unit_event_data and unit_event_data[event_name]

	if current_event_unit_event_data then
		local override = UnitFlowEventOverrideSettings[event_name]

		if override.destroy then
			override.destroy(self, unit, event_name, current_event_unit_event_data)
		end
	end

	unit_dynamic_events[event_name] = nil
end

UnitFlowOverrideSystem.update = function (self, context, t)
	local dynamic_events = self._dynamic_events

	for unit, event_name_data in pairs(dynamic_events) do
		for event_name, event_data in pairs(event_name_data) do
			local override = UnitFlowEventOverrideSettings[event_name]

			if override.update(self, unit, event_name, event_data, t) then
				override.destroy(self, unit, event_name, event_data)

				event_name_data[event_name] = nil
			end
		end
	end
end

UnitFlowOverrideSystem.on_remove_extension = function (self, unit, extension_name)
	self._frozen_unit_extensions[unit] = nil

	self:_cleanup_extension(unit, extension_name)
	ScriptUnit.remove_extension(unit, self.NAME)
end

UnitFlowOverrideSystem.on_freeze_extension = function (self, unit, extension_name)
	local extension = self._unit_extensions[unit]

	fassert(extension, "Unit was already frozen.")

	self._frozen_unit_extensions[unit] = extension

	self:_cleanup_extension(unit, extension_name)
end

UnitFlowOverrideSystem.freeze = function (self, unit, extension_name, reason)
	local frozen_extensions = self._frozen_unit_extensions

	if frozen_extensions[unit] then
		return
	end

	local extension = self._unit_extensions[unit]

	fassert(extension, "Unit to freeze didn't have unfrozen extension")
	self:_cleanup_extension(unit, extension_name)

	self._unit_extensions[unit] = nil
	frozen_extensions[unit] = extension
end

UnitFlowOverrideSystem.unfreeze = function (self, unit)
	local extension = self._frozen_unit_extensions[unit]

	fassert(extension, "Unit to unfreeze didn't have frozen extension")

	self._frozen_unit_extensions[unit] = nil
	self._unit_extensions[unit] = extension
end

UnitFlowOverrideSystem._cleanup_extension = function (self, unit, extension_name)
	local extension = self._unit_extensions[unit]

	if extension == nil then
		return
	end

	local unit_event_data = self._unit_event_data[unit] or EMPTY_TABLE

	for event_name, event_data in pairs(unit_event_data) do
		local override = UnitFlowEventOverrideSettings[event_name]

		if override.destroy then
			override.destroy(self, unit, event_name, event_data)
		end
	end

	self._dynamic_events[unit] = nil
	self._unit_extensions[unit] = nil

	table.clear(self._unit_event_data[unit])
end
