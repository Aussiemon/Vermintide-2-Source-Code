if rawget(_G, "FrameTable") then
	return
end

FrameTable = {}
local frame_table_max_size = 256
local frame_table_buffer = Script.new_array(frame_table_max_size)
local frame_table_back_buffer = Script.new_array(frame_table_max_size)
local frame_table_count = 0
local frame_table_back_count = 0

for i = 1, frame_table_max_size, 1 do
	frame_table_buffer[i] = {}
	frame_table_back_buffer[i] = {}
end

FrameTable.alloc_table = function ()
	frame_table_count = frame_table_count + 1

	if frame_table_max_size < frame_table_count then
		local n = frame_table_max_size
		frame_table_max_size = 2 * n

		Application.warning("[FrameTable] WARNING: Expanding frame table size from %d to %d", n, frame_table_max_size)

		for i = n + 1, frame_table_max_size, 1 do
			frame_table_buffer[i] = {}
			frame_table_back_buffer[i] = {}
		end
	end

	return frame_table_buffer[frame_table_count]
end

FrameTable.swap_and_clear = function ()
	local table_clear = table.clear

	for i = 1, frame_table_back_count, 1 do
		table_clear(frame_table_back_buffer[i])
	end

	frame_table_back_buffer = frame_table_buffer
	frame_table_buffer = frame_table_back_buffer
	frame_table_back_count = frame_table_count
	frame_table_count = 0
end

FrameTable.init = function (use_ordinary_tables)
	if use_ordinary_tables then
		FrameTable.alloc_table = TABLE_NEW
		FrameTable.swap_and_clear = NOP
		frame_table_buffer = nil
		frame_table_back_buffer = nil
	end

	printf("[FrameTable] Initialized (use_ordinary_tables=%s)", use_ordinary_tables)
end

return
