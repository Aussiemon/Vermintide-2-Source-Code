PositionLookupSystem = class(PositionLookupSystem, ExtensionSystemBase)
local extensions = {
	"PositionLookupExtension"
}

PositionLookupSystem.init = function (self, entity_system_creation_context, system_name)
	PositionLookupSystem.super.init(self, entity_system_creation_context, system_name, extensions)
end

PositionLookupSystem.update = function (self)
	return
end

PositionLookupSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	fassert(self.extensions[extension_name], "[PositionLookupSystem] There is no known extension called %s", extension_name)

	POSITION_LOOKUP[unit] = Unit.world_position(unit, 0)
	local extension = {
		position = POSITION_LOOKUP[unit]
	}

	ScriptUnit.set_extension(unit, self.NAME, extension)

	return extension
end

PositionLookupSystem.on_remove_extension = function (self, unit, extension_name)
	fassert(self.extensions[extension_name], "[PositionLookupSystem] There is no known extension called %s", extension_name)

	POSITION_LOOKUP[unit] = nil

	ScriptUnit.remove_extension(unit, self.NAME)
end

PositionLookupSystem.destroy = function (self)
	return
end

return
