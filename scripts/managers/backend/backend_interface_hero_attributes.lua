BackendInterfaceHeroAttributes = class(BackendInterfaceHeroAttributes)
local DB_ENTITY_NAME_PREFIX = "hero_attributes_"
local DB_ENTITY_TYPE = "hero_attributes"
local DB_ATTRIBUTE_NAME_PREFIX = "hero_attribute_"
BackendInterfaceHeroAttributes.init = function (self)
	return 
end
BackendInterfaceHeroAttributes._refresh_attributes = function (self)
	Profiler.start("BackendInterfaceHeroAttributes:_refresh_attributes()")

	local entities = Backend.get_entities_with_attributes(DB_ENTITY_TYPE)
	local attributes_by_entity_name = {}

	for entity_id, entity in pairs(entities) do
		local entity_name = entity.entity_name
		local attributes = entity.attributes
		attributes.entity_id = entity_id
		attributes_by_entity_name[entity_name] = attributes
	end

	self._attributes = attributes_by_entity_name

	Profiler.stop("BackendInterfaceHeroAttributes:_refresh_attributes()")

	return 
end
BackendInterfaceHeroAttributes.on_authenticated = function (self)
	self._refresh_attributes(self)

	return 
end
BackendInterfaceHeroAttributes.get = function (self, hero_name, attribute_name)
	local db_entity_name = DB_ENTITY_NAME_PREFIX .. hero_name
	local db_attribute_name = DB_ATTRIBUTE_NAME_PREFIX .. attribute_name
	local attributes = self._attributes[db_entity_name]
	local value_json = attributes and attributes[db_attribute_name]

	if not value_json then
		return 
	end

	local value = cjson.decode(value_json)

	return value
end
BackendInterfaceHeroAttributes.set = function (self, hero_name, attribute_name, value)
	local db_entity_name = DB_ENTITY_NAME_PREFIX .. hero_name
	local db_attribute_name = DB_ATTRIBUTE_NAME_PREFIX .. attribute_name
	local attributes = self._attributes[db_entity_name]

	if not attributes or not attributes[db_attribute_name] then
		return 
	end

	if value == nil then
		return 
	end

	local entity_id = attributes.entity_id
	local value_json = cjson.encode(value)
	local error_code = Backend.set_entity_attribute(entity_id, db_attribute_name, value_json)

	fassert(not error_code or error_code == Backend.RES_NO_CHANGE, "[BackendInterfaceHeroAttributes:set] BackendItem.set_entity_attribute() returned an unexpected result: %d", error_code)
	self._refresh_attributes(self)

	return 
end

return 
