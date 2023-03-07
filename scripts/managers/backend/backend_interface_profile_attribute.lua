BackendInterfaceProfileAttribute = class(BackendInterfaceProfileAttribute)

BackendInterfaceProfileAttribute.init = function (self)
	return
end

BackendInterfaceProfileAttribute.set = function (self, name, value)
	Backend.write_profile_attribute_as_number(name, value)
end

BackendInterfaceProfileAttribute.get = function (self, name)
	return Backend.read_profile_attribute_as_number(name)
end

BackendInterfaceProfileAttribute.set_string = function (self, name, value)
	Backend.write_profile_attribute_as_string(name, value)
end

BackendInterfaceProfileAttribute.get_string = function (self, name)
	return Backend.read_profile_attribute_as_string(name)
end
