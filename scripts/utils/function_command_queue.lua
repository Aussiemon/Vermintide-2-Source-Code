-- chunkname: @scripts/utils/function_command_queue.lua

FunctionCommandQueue = class(FunctionCommandQueue)

FunctionCommandQueue.init = function (self, max_num_args)
	self._command_queue = {}
	self._next_command_index = 1
	self._command_stride = max_num_args + 1
end

FunctionCommandQueue.run_commands = function (self)
	local command_queue = self._command_queue
	local stride = self._command_stride

	for index = 1, self._next_command_index - 1 do
		local base_index = math.stride_index(index, stride)
		local function_call = command_queue[base_index]

		function_call(unpack_index[stride - 1](command_queue, base_index + 1))

		for j = 1, stride do
			command_queue[math.stride_index(index, stride, j)] = nil
		end
	end

	self._next_command_index = 1
end

FunctionCommandQueue.cleanup_destroyed_unit = function (self, unit)
	local command_queue = self._command_queue
	local stride = self._command_stride
	local unit_animation_event = Unit.animation_event
	local list_size = self._next_command_index - 1
	local i = 1

	while i <= list_size do
		local base_index = math.stride_index(i, stride)
		local function_call = command_queue[base_index]

		if function_call == unit_animation_event then
			local target_unit = command_queue[base_index + 1]

			if target_unit == unit then
				for j = 1, stride do
					local copy_index = math.stride_index(list_size, stride, j)

					command_queue[math.stride_index(i, stride, j)] = command_queue[copy_index]
					command_queue[copy_index] = nil
				end

				list_size = list_size - 1
			else
				i = i + 1
			end
		else
			i = i + 1
		end
	end

	self._next_command_index = list_size + 1
end

FunctionCommandQueue.queue_function_command = function (self, function_call, ...)
	local index = self._next_command_index
	local command_queue = self._command_queue
	local base_index = math.stride_index(index, self._command_stride)

	command_queue[base_index] = function_call

	local select = select
	local num_args = select("#", ...)

	for i = 1, num_args do
		command_queue[math.stride_index(index, self._command_stride, i + 1)] = select(i, ...)
	end

	self._next_command_index = index + 1
end
