-- chunkname: @scripts/unit_extensions/generic/generic_trail_extension.lua

GenericTrailExtension = class(GenericTrailExtension)

GenericTrailExtension.init = function (self, extension_init_context, unit)
	self.unit = unit

	Unit.flow_event(unit, "lua_trail")
end
