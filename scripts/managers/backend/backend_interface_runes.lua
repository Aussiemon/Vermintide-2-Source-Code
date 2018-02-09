BackendInterfaceRunes = class(BackendInterfaceRunes)
local DB_ENTITY_NAME_PREFIX = "runes_"
local DB_ENTITY_TYPE = "runes"
local DB_ATTRIBUTE_NAME_PREFIX = "rune_"
BackendInterfaceRunes.init = function (self)
	return 
end
BackendInterfaceRunes._refresh_attributes = function (self)
	Profiler.start("BackendInterfaceRunes:_refresh_attributes()")

	local entities = Backend.get_entities_with_attributes(DB_ENTITY_TYPE)
	local runes_by_entity_name = {}

	for entity_id, entity in pairs(entities) do
		local entity_name = entity.entity_name
		local runes = entity.runes
		runes.entity_id = entity_id
		runes_by_entity_name[entity_name] = runes
	end

	self._runes = runes_by_entity_name

	Profiler.stop("BackendInterfaceRunes:_refresh_attributes()")

	return 
end
BackendInterfaceRunes.on_authenticated = function (self)
	self._refresh_attributes(self)

	return 
end
BackendInterfaceRunes.get = function (self, backend_id)
	local db_entity_name = DB_ENTITY_NAME_PREFIX .. backend_id
	local runes = self._runes[db_entity_name]
	local value_json = runes

	if not value_json then
		Application.warning(string.format("[BackendInterfaceRunes:get] Tried to get undefined rune %q", db_entity_name))

		return 
	end

	local value = cjson.decode(value_json)

	return value
end
BackendInterfaceRunes.set = function (self, backend_id, rune)
	local db_entity_name = DB_ENTITY_NAME_PREFIX .. backend_id
	local db_attribute_name = DB_ATTRIBUTE_NAME_PREFIX .. rune.rune_slot
	local runes = self._runes[db_entity_name]

	if rune == nil then
		Application.warning(string.format("[BackendInterfaceRunes:set] Tried to set runes %q for entity %q to nil", db_attribute_name, db_entity_name))

		return 
	end

	local entity_id = runes.entity_id
	local value_json = cjson.encode(rune)
	local error_code = Backend.set_entity_attribute(entity_id, db_attribute_name, value_json)

	fassert(not error_code or error_code == Backend.RES_NO_CHANGE, "[BackendInterfaceRunes:set] BackendItem.set_entity_attribute() returned an unexpected result: %d", error_code)
	self._refresh_attributes(self)

	return 
end

return 
