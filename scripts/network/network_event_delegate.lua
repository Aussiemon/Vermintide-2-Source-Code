NetworkEventDelegate = class(NetworkEventDelegate)
local delegate_metatable = getmetatable(NetworkEventDelegate)

local function empty_function()
	return 
end

NetworkEventDelegate.init = function (self)
	self._registered_objects = {}
	local event_meta_table = {
		__index = function (t, key)
			visual_assert(false, "RPC not registered %q", key)

			return empty_function
		end
	}
	self.event_table = setmetatable({}, event_meta_table)

	return 
end
NetworkEventDelegate.register = function (self, object, ...)
	for i = 1, select("#", ...), 1 do
		local callback_name = select(i, ...)

		fassert(object[callback_name], "[NetworkEventDelegate]: No callback function with name %q specified in passed object", callback_name)

		self._registered_objects[callback_name] = self._registered_objects[callback_name] or {}
		self._registered_objects[callback_name][#self._registered_objects[callback_name] + 1] = object

		if rawget(self.event_table, callback_name) == nil then
			local function rpc_callback(event_table, ...)
				local registered_objects = self._registered_objects[callback_name]
				local num_registered_objects = #registered_objects

				for i = 1, num_registered_objects, 1 do
					local object = registered_objects[i]

					object[callback_name](object, ...)
				end

				return 
			end

			self.event_table[callback_name] = rpc_callback
		end
	end

	return 
end
NetworkEventDelegate.unregister = function (self, object)
	for callback_name, registered_objects in pairs(self._registered_objects) do
		local num_registered_objects = #registered_objects
		local found = nil

		for i = num_registered_objects, 1, -1 do
			local registered_object = registered_objects[i]

			if object == registered_object then
				table.remove(registered_objects, i)

				found = true
			end
		end

		if #registered_objects == 0 and found then
			assert(rawget(self.event_table, callback_name))

			self.event_table[callback_name] = nil
		end
	end

	return 
end
NetworkEventDelegate.unregister_callback = function (self, callback_name)
	self._registered_objects[callback_name] = nil

	return 
end
NetworkEventDelegate._cleanup = function (self)
	for callback_name, registered_objects in pairs(self._registered_objects) do
		local num_registered_objects = #registered_objects

		fassert(num_registered_objects == 0, "[NetworkEventDelegate]: Object(s) not unregistered at cleanup for callback_name: %q", callback_name)

		self.event_table[callback_name] = nil
	end

	self._registered_objects = nil

	return 
end
NetworkEventDelegate.destroy = function (self)
	self._cleanup(self)

	self.event_table = nil

	GarbageLeakDetector.register_object(self, "NetworkEventDelegate")

	return 
end

return 
