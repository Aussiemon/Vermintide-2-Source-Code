-- chunkname: @scripts/managers/events/xbox_event_manager.lua

XboxEventManager = class(XboxEventManager)

local TIME_BETWEEN_EVENTS = 2

XboxEventManager.init = function (self)
	self._events_to_write_queue = {}
	self._priority_events_queue = {}
	self._immediate_queue = {}
	self._timer = TIME_BETWEEN_EVENTS
end

XboxEventManager.write = function (self, event, event_data, debug_string, debug_print_func, prioritize, skip_wait_time)
	Application.warning("[XboxEventManager:write] No Stats are implemented yet")

	do return end

	Application.error(string.format("Adding%sEvent: %s", prioritize and " prioritized " or " ", event))

	if skip_wait_time then
		self._immediate_queue[#self._immediate_queue + 1] = {
			event = event,
			event_data = event_data,
			debug_string = string.format("Skipping wait time for event: %s", event),
			debug_print_func = Application.warning,
		}
	elseif prioritize then
		self._priority_events_queue[#self._priority_events_queue + 1] = {
			event = event,
			event_data = event_data,
			debug_string = debug_string,
			debug_print_func = debug_print_func,
		}
	else
		self._events_to_write_queue[#self._events_to_write_queue + 1] = {
			event = event,
			event_data = event_data,
			debug_string = debug_string,
			debug_print_func = debug_print_func,
		}
	end
end

XboxEventManager.update = function (self, dt)
	local priority_event = self._priority_events_queue[1]

	if not priority_event and self._timer > 0 then
		self:_handle_immediate_event()
	elseif self._timer <= 0 then
		if priority_event then
			self:_handle_priority_event(priority_event)
		else
			self:_handle_event()
		end

		self._timer = TIME_BETWEEN_EVENTS
	end

	self._timer = self._timer - dt
end

XboxEventManager._handle_priority_event = function (self, priority_event)
	Application.error(string.format("Writing Prioritized Event: %s", priority_event.event))
	Events.write(priority_event.event, priority_event.event_data)

	if priority_event.debug_string then
		local print_func = priority_event.debug_print_func or print

		print_func(priority_event.debug_string)
	end

	table.remove(self._priority_events_queue, 1)
end

XboxEventManager._handle_event = function (self)
	local current_event = self._events_to_write_queue[1]

	if current_event then
		Application.error(string.format("Writing Event: %s", current_event.event))
		Events.write(current_event.event, current_event.event_data)

		if current_event.debug_string then
			local print_func = current_event.debug_print_func or print

			print_func(current_event.debug_string)
		end

		table.remove(self._events_to_write_queue, 1)
	end
end

XboxEventManager._handle_immediate_event = function (self)
	local immediate_event = self._immediate_queue[1]

	if immediate_event then
		Application.error(string.format("Writing Event: %s", immediate_event.event))
		Events.write(immediate_event.event, immediate_event.event_data)

		if immediate_event.debug_string then
			local print_func = immediate_event.debug_print_func or print

			print_func(immediate_event.debug_string)
		end

		table.remove(self._immediate_queue, 1)
	end
end

XboxEventManager.flush = function (self)
	Application.warning("[XboxEventManager:flush] No Stats are implemented yet")

	do return end

	for _, current_priority_event in pairs(self._priority_events_queue) do
		Application.error(string.format("Writing Event: %s", current_priority_event.event))
		Events.write(current_priority_event.event, current_priority_event.event_data)

		if current_priority_event.debug_string then
			local print_func = current_priority_event.debug_print_func or print

			print_func(current_priority_event.debug_string)
		end
	end

	for _, current_event in pairs(self._events_to_write_queue) do
		Application.error(string.format("Writing Event: %s", current_event.event))
		Events.write(current_event.event, current_event.event_data)

		if current_event.debug_string then
			local print_func = current_event.debug_print_func or print

			print_func(current_event.debug_string)
		end
	end

	for _, immediate_event in pairs(self._immediate_queue) do
		Application.error(string.format("Writing Event: %s", immediate_event.event))
		Events.write(immediate_event.event, immediate_event.event_data)

		if immediate_event.debug_string then
			local print_func = immediate_event.debug_print_func or print

			print_func(immediate_event.debug_string)
		end
	end

	table.clear(self._events_to_write_queue)
	table.clear(self._priority_events_queue)
	table.clear(self._immediate_queue)
end

XboxEventManager.destroy = function (self)
	return
end
