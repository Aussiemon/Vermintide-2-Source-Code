GenericTrailExtension = class(GenericTrailExtension)
GenericTrailExtension.init = function (self, extension_init_context, unit)
	self.unit = unit

	Unit.flow_event(unit, "lua_trail")

	return 
end

return 
