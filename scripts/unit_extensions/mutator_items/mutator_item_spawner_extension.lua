-- chunkname: @scripts/unit_extensions/mutator_items/mutator_item_spawner_extension.lua

MutatorItemSpawnerExtension = class(MutatorItemSpawnerExtension)

MutatorItemSpawnerExtension.init = function (self, extension_init_context, unit, extension_init_data, is_server)
	self.world = extension_init_context.world
	self.unit = unit
	self.is_server = is_server
end

MutatorItemSpawnerExtension.destroy = function (self)
	return
end
