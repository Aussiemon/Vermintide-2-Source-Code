if rawget(_G, "FrameTable") then
	return 
end

local DEBUG_FRAME_TABLES = false
local frame_table_collection_buffers = {
	{},
	{}
}
local frame_table_counters = {
	0,
	0
}
local frame_table_current_buffer = 1
local frame_table_max_size = 256
local allocation_stacks = nil

if DEBUG_FRAME_TABLES then
	allocation_stacks = {
		{},
		{}
	}
end

local callstack = (Script and Script.callstack) or debug.traceback()

for i = 1, frame_table_max_size, 1 do
	frame_table_collection_buffers[1][i] = {}
	frame_table_collection_buffers[2][i] = {}
end

local function alloc_table()
	local frame_table_counter = frame_table_counters[frame_table_current_buffer]
	frame_table_counter = frame_table_counter + 1
	frame_table_counters[frame_table_current_buffer] = frame_table_counter

	if frame_table_max_size <= frame_table_counter and DEBUG_FRAME_TABLES then
		local current_allocation_stack = allocation_stacks[frame_table_current_buffer]
		local temp_counter_map = {}

		for i = 1, frame_table_max_size - 1, 1 do
			local stack = current_allocation_stack[i]
			temp_counter_map[stack] = (temp_counter_map[stack] or 0) + 1
		end

		local yet_another_table = {}
		local index = 1

		for stack, count in pairs(temp_counter_map) do
			yet_another_table[index] = {
				stack = stack,
				count = count
			}
			index = index + 1
		end

		table.sort(yet_another_table, function (a, b)
			return a.count < b.count
		end)
		print("[frame_table] allocationstack begin.")
		print("")

		for _, stack_data in ipairs(yet_another_table) do
			local count = stack_data.count
			local stack = stack_data.stack

			print("---> " .. count .. " allocations at stack(below)")
			print(stack)
		end

		print("[frame_table] allocationstack end.")
		assert(false)
	end

	if frame_table_counter == frame_table_max_size then
		printf("Increasing frame table size to %d", frame_table_max_size*2)

		frame_table_max_size = frame_table_max_size*2

		for i = frame_table_counter, frame_table_max_size, 1 do
			frame_table_collection_buffers[1][i] = {}
			frame_table_collection_buffers[2][i] = {}
		end
	end

	if DEBUG_FRAME_TABLES then
		local cs = callstack()
		local callstack_string_cutoff = "local_variables:"
		local i = cs.find(cs, callstack_string_cutoff)

		if i then
			cs = cs.sub(cs, 1, i - 1)
		end

		allocation_stacks[frame_table_current_buffer][frame_table_counter] = cs
	end

	local current_frame_table = frame_table_collection_buffers[frame_table_current_buffer]

	return current_frame_table[frame_table_counter]
end

local function clear_tables()
	local current_frame_table = frame_table_collection_buffers[frame_table_current_buffer]
	local frame_table_counter = frame_table_counters[frame_table_current_buffer]

	for i = 1, frame_table_counter, 1 do
		local t = current_frame_table[i]

		for k, _ in pairs(t) do
			t[k] = nil
		end
	end

	frame_table_counters[frame_table_current_buffer] = 0

	return 
end

local function swap_tables()
	frame_table_current_buffer = frame_table_current_buffer - 3

	return 
end

local function frame_table_noop()
	return 
end

local function frame_table_ordinary_alloc()
	return {}
end

local function frame_table_init(use_ordinary_tables)
	if not use_ordinary_tables then
		return 
	end

	FrameTable.alloc_table = frame_table_ordinary_alloc
	FrameTable.clear_tables = frame_table_noop
	FrameTable.swap_tables = frame_table_noop

	return 
end

FrameTable = {
	init = frame_table_init,
	alloc_table = alloc_table,
	clear_tables = clear_tables,
	swap_tables = swap_tables
}

return 
