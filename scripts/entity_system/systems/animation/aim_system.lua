require("scripts/unit_extensions/generic/generic_unit_aim_extension")

local RPCS = {}
local extensions = {
	"GenericUnitAimExtension"
}
AimSystem = class(AimSystem, ExtensionSystemBase)

AimSystem.init = function (self, context, system_name)
	AimSystem.super.init(self, context, system_name, extensions)

	self._extensions = {}
	self._frozen_extensions = {}
end

AimSystem.destroy = function (self)
	return
end

AimSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = ScriptUnit.add_extension(self.extension_init_context, unit, extension_name, self.NAME, extension_init_data)
	self._extensions[unit] = extension

	return extension
end

AimSystem.on_remove_extension = function (self, unit, extension_name)
	self._frozen_extensions[unit] = nil
	self._extensions[unit] = nil

	ScriptUnit.remove_extension(unit, self.NAME)
end

AimSystem.on_freeze_extension = function (self, unit, extension_name)
	local extension = self._extensions[unit]

	fassert(extension, "Unit was already frozen.")
	extension.template[extension.network_type].leave(extension.unit, extension.data)

	self._frozen_extensions[unit] = extension
	self._extensions[unit] = nil

	table.clear(extension.data)
end

AimSystem.freeze = function (self, unit, extension_name, reason)
	local frozen_extensions = self._frozen_extensions

	if frozen_extensions[unit] then
		return
	end

	local extension = self._extensions[unit]

	fassert(extension, "Unit to freeze didn't have unfrozen extension")

	self._extensions[unit] = nil
	frozen_extensions[unit] = extension

	table.clear(extension.data)
end

AimSystem.unfreeze = function (self, unit)
	local extension = self._frozen_extensions[unit]

	fassert(extension, "Unit to unfreeze didn't have frozen extension")

	self._frozen_extensions[unit] = nil
	self._extensions[unit] = extension
	extension.enabled = false

	extension.template[extension.network_type].init(extension.unit, extension.data)
end

AimSystem.update = function (self, context, t)
	local dt = context.dt

	for unit, extension in pairs(self._extensions) do
		extension:update(unit, nil, dt, context, t)
	end
end

return
