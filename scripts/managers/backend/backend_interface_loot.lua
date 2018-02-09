require("scripts/managers/backend/data_server_queue")

local function dprint(...)
	print("[BackendInterfaceLoot]", ...)

	return 
end

BackendInterfaceLoot = class(BackendInterfaceLoot)
local DB_ENTITY_TYPE = "item"
BackendInterfaceLoot.init = function (self)
	return 
end
BackendInterfaceLoot.setup = function (self, data_server_queue)
	self._register_executors(self, data_server_queue)

	self._queue = data_server_queue
	self.dirty = false
	self._attributes = {}

	return 
end
BackendInterfaceLoot._register_executors = function (self, queue)
	queue.register_executor(queue, "loot_chest_generated", callback(self, "_command_loot_chest_generated"))
	queue.register_executor(queue, "loot_chest_consumed", callback(self, "_command_loot_chest_consumed"))
	queue.register_executor(queue, "weapon_with_properties_generated", callback(self, "_command_weapon_with_properties_generated"))

	return 
end
BackendInterfaceLoot._command_loot_chest_generated = function (self, entity_id)
	dprint("_command_loot_chest_generated ")

	self.dirty = false
	local backend_item = Managers.backend:get_interface("items")
	self.last_generated_loot_chest = backend_item.get_item_from_id(backend_item, entity_id).key

	Backend.load_entities()
	self._refresh_attributes(self)

	return 
end
BackendInterfaceLoot._command_loot_chest_consumed = function (self, status_code)
	dprint("_command_loot_chest_consumed " .. status_code)

	self.dirty = false

	Backend.load_entities()

	return 
end
BackendInterfaceLoot._command_weapon_with_properties_generated = function (self, status_code)
	dprint("_command_weapon_with_properties_generated " .. status_code)

	self.dirty = false

	Backend.load_entities()
	self._refresh_attributes(self)

	return 
end
BackendInterfaceLoot.generate_loot_chest = function (self, hero_name, difficulty, num_tomes, num_grimoires, num_loot_dice, level_key)
	self._queue:add_item("generate_loot_chest_1", "hero_name", cjson.encode(hero_name), "difficulty", cjson.encode(difficulty), "tomes", cjson.encode(num_tomes), "grimoires", cjson.encode(num_grimoires), "loot_dice", cjson.encode(num_loot_dice), "level", cjson.encode(level_key))

	self.dirty = true

	return 
end
BackendInterfaceLoot.consume_loot_chest = function (self, backend_id, picked_item_key, properties)
	local serialized = ""

	fassert(picked_item_key, "Got nil item key to reward player")
	fassert(properties, "No properties found for item %s", picked_item_key)

	for _, property in pairs(properties) do
		serialized = serialized .. property.rune_slot .. ":" .. property.property_key .. ",empty,"
	end

	self._queue:add_item("consume_loot_chest_1", "entity_id", cjson.encode(backend_id), "item_key", cjson.encode(picked_item_key), "properties", cjson.encode(serialized))

	self.dirty = true

	return 
end
BackendInterfaceLoot.generate_weapon_with_properties = function (self, item_key, properties)
	self._queue:add_item("generate_property_weapon", "item_key", cjson.encode(item_key), "properties", cjson.encode(properties))

	self.dirty = true

	return 
end
BackendInterfaceLoot._refresh_attributes = function (self)
	Profiler.start("BackendInterfaceLoot:_refresh_attributes()")

	local entities = Backend.get_entities_with_attributes(DB_ENTITY_TYPE)
	local attributes_by_entity_id = {}

	for entity_id, entity in pairs(entities) do
		local attributes = entity.attributes

		if attributes then
			attributes_by_entity_id[entity_id] = attributes
		end
	end

	self._attributes = attributes_by_entity_id

	Profiler.stop("BackendInterfaceLoot:_refresh_attributes()")

	return 
end
BackendInterfaceLoot.on_authenticated = function (self)
	self._refresh_attributes(self)

	return 
end
BackendInterfaceLoot.get_loot = function (self, backend_id)
	self._refresh_attributes(self)

	local attributes = self._attributes[backend_id]

	fassert(attributes, "[BackendInterfaceLoot:get_loot] Tried to get attributes from an item with no attributes", "error")

	local loot = {}

	for _, attr in pairs(attributes) do
		local loot_data = {}
		local properties = {}

		for item_key, loot_type in string.gmatch(attr, "([%w_]+),*([%w_]*);") do
			loot_data.item_key = item_key
			loot_data.loot_type = loot_type
		end

		for rune_slot, property in string.gmatch(attr, "([%w_]+):([%w_]+)") do
			properties[#properties + 1] = {
				rune_value = "empty",
				rune_slot = rune_slot,
				property_key = property
			}
		end

		loot_data.properties = properties
		loot[#loot + 1] = loot_data
	end

	return loot
end
BackendInterfaceLoot.is_dirty = function (self)
	return self.dirty
end
BackendInterfaceLoot.get_last_generated_loot_chest = function (self)
	return self.last_generated_loot_chest
end

return 
