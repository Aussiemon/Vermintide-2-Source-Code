require("scripts/unit_extensions/generic/generic_unit_aim_extension")

local RPCS = {}
local extensions = {
	"GenericUnitAimExtension"
}
AimSystem = class(AimSystem, ExtensionSystemBase)
AimSystem.init = function (self, context, system_name)
	AimSystem.super.init(self, context, system_name, extensions)

	return 
end
AimSystem.destroy = function (self)
	return 
end
AimSystem.on_freeze_extension = function (self, unit, extension_name)
	ScriptUnit.destroy_extension(unit, self.NAME)
	self.on_remove_extension(self, unit, extension_name)

	return 
end
AimSystem.update = function (self, context, t)
	local dt = context.dt

	self.update_extension(self, "GenericUnitAimExtension", dt, context, t)

	return 
end

return 
