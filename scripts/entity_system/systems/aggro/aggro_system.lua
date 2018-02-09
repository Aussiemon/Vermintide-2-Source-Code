AggroSystem = class(AggroSystem, ExtensionSystemBase)
local extensions = {
	"GenericAggroableExtension"
}
AggroSystem.init = function (self, context, name)
	AggroSystem.super.init(self, context, name, extensions)

	self.aggroable_units = {}

	return 
end
AggroSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	self.aggroable_units[unit] = true
	local _, is_level_unit = Managers.state.network:game_object_or_level_id(unit)

	if is_level_unit then
		POSITION_LOOKUP[unit] = Unit.world_position(unit, 0)
	end

	return AggroSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)
end
AggroSystem.on_remove_extension = function (self, unit, extension_name)
	REMOVE_AGGRO_UNITS(unit)
	AggroSystem.super.on_remove_extension(self, unit, extension_name)

	self.aggroable_units[unit] = nil

	return 
end
AggroSystem.disable_aggro_for_unit = function (self, unit)
	self.aggroable_units[unit] = nil

	return 
end
AggroSystem.enable_aggro_for_unit = function (self, unit)
	self.aggroable_units[unit] = true

	return 
end
AggroSystem.destroy = function (self)
	AggroSystem.super.destroy(self)

	self.aggroable_units = nil

	return 
end

return 
