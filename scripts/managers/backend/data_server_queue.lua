BEQueueItem = class(BEQueueItem)

BEQueueItem.init = function (self, caller, queue_id, script_name, ...)
	fassert(caller and caller == "DataServerQueue", "Only poll BEQueueItem from DataServerQueue")

	self._queue_id = queue_id
	self._script_name = script_name
	self._data = {
		...
	}
end

BEQueueItem.disable_registered_commands = function (self)
	self._disable_registered_commands = true
end

BEQueueItem.submit_request = function (self, caller)
	fassert(caller and caller == "DataServerQueue", "Only poll BEQueueItem from DataServerQueue")
	BackendSession.item_server_script(self._script_name, "queue_id", self._queue_id, unpack(self._data))
end

BEQueueItem.poll_backend = function (self, caller)
	fassert(caller and caller == "DataServerQueue", "Only poll BEQueueItem from DataServerQueue")

	local items, parameters, error_message = BackendSession.poll_item_server()

	if items then
		if error_message or parameters.queue_id ~= self._queue_id then
			local error_string = "Backend data server error"
			error_string = error_string .. "\n script: " .. self._script_name
			error_string = error_string .. "\n error_message.details : " .. tostring(error_message.details)
			error_string = error_string .. "\n error_message.reason : " .. tostring(error_message.reason)
			error_string = error_string .. "\n queue_id: " .. tostring(self._queue_id) .. " (expected)"
			error_string = error_string .. "\n queue_id: " .. tostring(parameters.queue_id) .. " (actual)"
			error_string = error_string .. "\n parameters:"
			local num_parameters = #self._data

			if num_parameters > 0 then
				for ii = 1, 2, num_parameters do
					local key = self._data[ii]
					local value = self._data[ii + 1]
					error_string = error_string .. "\n  " .. tostring(key) .. ": " .. tostring(value)
				end
			end

			Crashify.print_exception("DataServerQueue", error_string)
		end

		self._is_done = true
		self._items = items
		self._parameters = parameters
		self._error_message = error_message

		for backend_id, _ in pairs(items) do
			ItemHelper.mark_backend_id_as_new(backend_id)
		end

		local backend_items = Managers.backend:get_interface("items")

		backend_items:__dirtify()
	end
end

BEQueueItem.items = function (self)
	fassert(self._is_done, "Request hasn't completed yet")

	return self._items
end

BEQueueItem.parameters = function (self)
	fassert(self._is_done, "Request hasn't completed yet")

	return self._parameters
end

BEQueueItem.error_message = function (self)
	fassert(self._is_done, "Request hasn't completed yet")

	return self._error_message
end

BEQueueItem.use_registered_commands = function (self)
	return not self._disable_registered_commands
end

BEQueueItem.is_done = function (self)
	return self._is_done
end

BECommands = class(BECommands)

BECommands.init = function (self)
	self._executors = {}

	self:register_executor("command_group", callback(self, "_command_group_executor"))
end

BECommands.register_executor = function (self, executor_name, executor)
	self._executors[executor_name] = executor
end

BECommands.unregister_executor = function (self, executor_name)
	self._executors[executor_name] = nil
end

BECommands.execute = function (self, queue_item)
	local commands = queue_item:parameters()

	for command, json_data in pairs(commands) do
		if command ~= "queue_id" then
			local data = cjson.decode(json_data)

			self:_execute(command, data)
		end
	end
end

BECommands._execute = function (self, command, data)
	local executor = self._executors[command]

	executor(data)
end

BECommands._command_group_executor = function (self, commands)
	for command, data in pairs(commands) do
		self:_execute(command, data)
	end
end

DataServerQueue = class(DataServerQueue)

DataServerQueue.init = function (self)
	self._queue_id = 0
	self._queue = {}
	self._error_items = {}
	self._command_executors = BECommands:new()
end

DataServerQueue._next_queue_id = function (self)
	self._queue_id = self._queue_id + 1

	return tostring(self._queue_id)
end

DataServerQueue.add_item = function (self, script_name, ...)
	local queue_id = self:_next_queue_id()
	local item = BEQueueItem:new("DataServerQueue", queue_id, script_name, ...)

	if #self._queue == 0 then
		item:submit_request("DataServerQueue")
	end

	table.insert(self._queue, item)

	return item
end

DataServerQueue.register_executor = function (self, executor_name, executor)
	self._command_executors:register_executor(executor_name, executor)
end

DataServerQueue.unregister_executor = function (self, executor_name)
	self._command_executors:unregister_executor(executor_name)
end

DataServerQueue.clear = function (self)
	self._queue = {}
end

DataServerQueue.update = function (self)
	local current = self._queue[1]

	if current then
		current:poll_backend("DataServerQueue")

		if current:is_done() then
			if current:error_message() then
				table.insert(self._error_items, current)
			elseif current:use_registered_commands() then
				self._command_executors:execute(current)
			end

			table.remove(self._queue, 1)

			local new_item = self._queue[1]

			if new_item then
				new_item:submit_request("DataServerQueue")
			end
		end
	end
end

DataServerQueue.check_for_errors = function (self)
	if #self._error_items > 0 then
		local error_item = table.remove(self._error_items, 1)
		local error_message = error_item:error_message()

		return {
			reason = "data_server_error",
			details = error_message.details
		}
	end
end

DataServerQueue.num_current_requests = function (self)
	return #self._queue
end
