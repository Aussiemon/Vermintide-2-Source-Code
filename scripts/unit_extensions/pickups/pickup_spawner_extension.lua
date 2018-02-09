PickupSpawnerExtension = class(PickupSpawnerExtension)
PickupSpawnerExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.world = extension_init_context.world
	self.unit = unit

	return 
end
PickupSpawnerExtension.extensions_ready = function (self)
	return 
end
PickupSpawnerExtension.get_spawn_location_data = function (self)
	local position = Unit.world_position(self.unit, 0)
	local rotation = Unit.world_rotation(self.unit, 0)

	return position, rotation, true
end

return 
