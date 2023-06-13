EventManager = class(EventManager)

EventManager.init = function (self)
	self._events = {}
	self._referenced_events = {}
end

EventManager.register = function (self, object, ...)
	for i = 1, select("#", ...), 2 do
		local event_name = select(i, ...)
		local callback_name = select(i + 1, ...)

		fassert(type(object) == "table" and type(object[callback_name]) == "function", "No function found with name %q on supplied object", callback_name)

		self._events[event_name] = self._events[event_name] or setmetatable({}, {
			__mode = "v"
		})
		self._events[event_name][object] = callback_name
	end
end

EventManager.unregister = function (self, event_name, object)
	local events = self._events[event_name]

	if events then
		events[object] = nil

		if table.is_empty(events) then
			self._events[event_name] = nil
		end
	end
end

EventManager.trigger = function (self, event_name, ...)
	local events = self._events[event_name]

	if events then
		for object, callback_name in pairs(self._events[event_name]) do
			object[callback_name](object, ...)
		end
	end
end

EventManager.register_referenced = function (self, reference, object, ...)
	local referenced_events = self._referenced_events
	local registered_events = referenced_events[reference] or {}
	referenced_events[reference] = registered_events

	for i = 1, select("#", ...), 2 do
		local event_name = select(i, ...)
		local callback_name = select(i + 1, ...)
		registered_events[event_name] = registered_events[event_name] or setmetatable({}, {
			__mode = "v"
		})
		registered_events[event_name][object] = callback_name
	end
end

EventManager.unregister_referenced = function (self, event_name, reference, object)
	local referenced_events = self._referenced_events[reference]

	if not referenced_events then
		return
	end

	local registered_objects = referenced_events[event_name]

	if not registered_objects then
		return
	end

	registered_objects[object] = nil

	if table.is_empty(registered_objects) then
		referenced_events[event_name] = nil
	end

	if table.is_empty(referenced_events) then
		self._referenced_events[reference] = nil
	end
end

EventManager.unregister_referenced_all = function (self, reference)
	self._referenced_events[reference] = nil
end

EventManager.trigger_referenced = function (self, reference, event_name, ...)
	local registered_events = self._referenced_events[reference]
	local registered_objects = registered_events and registered_events[event_name]

	if registered_objects then
		for object, callback_name in pairs(registered_objects) do
			object[callback_name](object, reference, ...)
		end
	end
end
