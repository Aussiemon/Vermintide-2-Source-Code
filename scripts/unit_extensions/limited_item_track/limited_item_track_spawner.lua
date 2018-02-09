require("scripts/unit_extensions/limited_item_track/limited_item_track_spawner_templates")

LimitedItemTrackSpawner = class(LimitedItemTrackSpawner)
LimitedItemTrackSpawner.init = function (self, world, unit, extension_init_data)
	assert(Managers.player.is_server, "Spawner should only exist on server")
	assert(0 < extension_init_data.pool, "Can't have pool less than 1")

	self.world = world
	self.unit = unit
	self.num_items = 0
	self.items = {}
	self.pool = extension_init_data.pool
	self.template_name = extension_init_data.template_name
	self.time_between_spawns = 2
	self.time_to_spawn = 0
	self.pool_exhausted = false
	self.network_manager = extension_init_data.network_manager
	local template_name = self.template_name
	local init_func = LimitedItemTrackSpawnerTemplates[template_name].init_func
	self.spawn_data = init_func(world, unit, extension_init_data)

	return 
end
LimitedItemTrackSpawner.extensions_ready = function (self)
	Unit.flow_event(self.unit, "lua_spawner_initialized")

	return 
end
LimitedItemTrackSpawner.destroy = function (self)
	return 
end
LimitedItemTrackSpawner.update = function (self, unit, input, dt, context, t)
	return 
end
LimitedItemTrackSpawner.spawn_item = function (self)
	local self_unit = self.unit
	local id = self.find_empty_id(self)

	fassert(id, "Found no empty id")

	local spawn_data = self.spawn_data
	spawn_data.id = id
	local template_name = self.template_name
	local spawn_func = LimitedItemTrackSpawnerTemplates[template_name].spawn_func
	local unit = spawn_func(self.world, self_unit, self.spawn_data)
	self.items[id] = unit
	self.num_items = self.num_items + 1

	Unit.flow_event(self_unit, "lua_spawner_spawn_item")

	return 
end
LimitedItemTrackSpawner.find_empty_id = function (self)
	local pool = self.pool
	local items = self.items

	for i = 1, pool, 1 do
		local item = items[i]

		if not item then
			return i
		end
	end

	return 
end
LimitedItemTrackSpawner.remove = function (self, id)
	local items = self.items

	if items[id] then
		items[id] = nil
		self.num_items = self.num_items - 1
		self.pool_exhausted = false
	end

	return 
end
LimitedItemTrackSpawner.transform = function (self, id)
	local items = self.items

	if items[id] then
		items[id] = true
	end

	return 
end
LimitedItemTrackSpawner.is_transformed = function (self, id)
	local item = self.items[id]

	if type(item) == "boolean" then
		return true
	else
		return false
	end

	return 
end

return 
