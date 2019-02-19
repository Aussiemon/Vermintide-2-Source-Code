table.is_empty = function (t)
	return next(t) == nil
end

table.size = function (t)
	local elements = 0

	for _ in pairs(t) do
		elements = elements + 1
	end

	return elements
end

table.clone = function (t)
	local clone = {}

	for key, value in pairs(t) do
		if type(value) == "table" then
			clone[key] = table.clone(value)
		else
			clone[key] = value
		end
	end

	return clone
end

table.shallow_copy = function (t)
	local copy = {}

	for key, value in pairs(t) do
		copy[key] = value
	end

	return copy
end

table.crop = function (t, index)
	local new_table = {}
	local new_table_size = 0

	for idx = index, #t, 1 do
		new_table_size = new_table_size + 1
		new_table[new_table_size] = t[idx]
	end

	return new_table, new_table_size
end

table.create_copy = function (copy, original)
	if not copy then
		return table.clone(original)
	else
		for key, value in pairs(original) do
			if type(value) == "table" then
				copy[key] = table.create_copy(copy[key], value)
			else
				copy[key] = value
			end
		end

		for key, _ in pairs(copy) do
			if original[key] == nil then
				copy[key] = nil
			end
		end

		return copy
	end
end

table.clone_instance = function (t)
	local clone = table.clone(t)

	setmetatable(clone, getmetatable(t))

	return clone
end

table.merge = function (dest, source)
	for key, value in pairs(source) do
		dest[key] = value
	end

	return dest
end

table.merge_recursive = function (dest, source)
	for key, value in pairs(source) do
		local is_table = type(value) == "table"

		if is_table and type(dest[key]) == "table" then
			table.merge_recursive(dest[key], value)
		elseif is_table then
			dest[key] = table.clone(value)
		else
			dest[key] = value
		end
	end
end

table.append = function (dest, source)
	local dest_size = #dest

	for i = 1, #source, 1 do
		dest_size = dest_size + 1
		dest[dest_size] = source[i]
	end
end

table.append_non_indexed = function (dest, source)
	local dest_size = #dest

	for _, value in pairs(source) do
		dest_size = dest_size + 1
		dest[dest_size] = value
	end
end

table.contains = function (t, element)
	for _, value in pairs(t) do
		if value == element then
			return true
		end
	end

	return false
end

table.find = function (t, element)
	for key, value in pairs(t) do
		if value == element then
			return key
		end
	end

	return false
end

table.index_of = function (t, element)
	for i = 1, #t, 1 do
		if t[i] == element then
			return i
		end
	end

	return -1
end

table.slice = function (t, start_index, length)
	local end_index = math.min((start_index + length) - 1, #t)
	local slice = {}

	for i = start_index, end_index, 1 do
		slice[#slice + 1] = t[i]
	end

	return slice
end

table.sorted = function (t, order_func, use_frame_table)
	local keys = (use_frame_table and FrameTable.alloc_table()) or {}

	for k, _ in pairs(t) do
		keys[#keys + 1] = k
	end

	if order_func then
		table.sort(keys, function (a, b)
			return order_func(t, a, b)
		end)
	else
		table.sort(keys)
	end

	local i = 0

	return function ()
		i = i + 1

		if keys[i] then
			return keys[i], t[keys[i]]
		end
	end
end

table.reverse = function (t)
	local size = #t

	for i = 1, math.floor(size / 2), 1 do
		t[size - i + 1] = t[i]
		t[i] = t[size - i + 1]
	end
end

table.clear = function (t)
	for key, _ in pairs(t) do
		t[key] = nil
	end
end

table.clear_array = function (t, n)
	for i = 1, n, 1 do
		t[i] = nil
	end
end

local function table_dump(key, value, depth, max_depth, print_func)
	if max_depth < depth then
		return
	end

	local prefix = string.rep("  ", depth) .. ((key == nil and "") or "[" .. tostring(key) .. "]")

	if type(value) == "table" then
		prefix = prefix .. ((key == nil and "") or " = ")

		print(prefix .. "table")

		if max_depth then
			for key, value in pairs(value) do
				table_dump(key, value, depth + 1, max_depth, print_func)
			end
		end

		local meta = getmetatable(value)

		if meta then
			print(prefix .. "metatable")

			if max_depth then
				for key, value in pairs(meta) do
					if key ~= "__index" and key ~= "super" then
						table_dump(key, value, depth + 1, max_depth, print_func)
					end
				end
			end
		end
	elseif type(value) == "function" or type(value) == "thread" or type(value) == "userdata" or value == nil then
		print_func(prefix .. " = " .. tostring(value))
	else
		print_func(prefix .. " = " .. tostring(value) .. " (" .. type(value) .. ")")
	end
end

table.dump = function (t, tag, max_depth, print_func)
	print_func = print_func or print

	if tag then
		print_func(string.format("<%s>", tag))
	end

	for key, value in pairs(t) do
		table_dump(key, value, 0, max_depth or 0, print_func)
	end

	if tag then
		print_func(string.format("</%s>", tag))
	end
end

function is_array(t)
	for key, _ in pairs(t) do
		if type(key) ~= "number" then
			return false
		end
	end

	return true
end

function array_dump_string(t, depth)
	local str = "{\n"

	for i, value in ipairs(t) do
		str = str .. string.rep("\t", depth) .. value_to_string(value, depth)

		if next(t, i) ~= nil then
			str = str .. ",\n"
		end
	end

	return str .. "\n" .. string.rep("\t", depth - 1) .. "}"
end

function value_to_string(v, depth)
	if type(v) == "table" and is_array(v) then
		return array_dump_string(v, depth + 1)
	elseif type(v) == "table" then
		return table_dump_string(v, depth + 1)
	elseif type(v) == "string" then
		return "\"" .. v .. "\""
	elseif type(v) == "boolean" then
		return tostring(v)
	else
		return v
	end
end

function table_dump_string(t, depth)
	local str = "{\n"

	for key, value in pairs(t) do
		str = str .. string.rep("\t", depth) .. key .. " = " .. value_to_string(value, depth)

		if next(t, key) ~= nil then
			str = str .. ",\n"
		end
	end

	return str .. "\n" .. string.rep("\t", depth - 1) .. "}"
end

table.dump_string = function (t, depth)
	if is_array(t) then
		return array_dump_string(t, depth or 1)
	else
		return table_dump_string(t, depth or 1)
	end
end

table.shuffle = function (source, seed)
	if seed then
		for ii = #source, 2, -1 do
			local swap = nil
			seed, swap = Math.next_random(seed, ii)
			source[ii] = source[swap]
			source[swap] = source[ii]
		end
	else
		for ii = #source, 2, -1 do
			local swap = Math.random(ii)
			source[ii] = source[swap]
			source[swap] = source[ii]
		end
	end

	return seed
end

table.max = function (t)
	local max_key, max_value = next(t)

	for key, value in pairs(t) do
		if max_value < value then
			max_value = value
			max_key = key
		end
	end

	return max_key, max_value
end

table.for_each = function (t, f)
	for key, value in pairs(t) do
		t[key] = f(value)
	end
end

function _add_tabs(str, tabs)
	for i = 1, tabs, 1 do
		str = str .. "\t"
	end

	return str
end

local random_indices = {}
local all = {}

table.get_random_array_indices = function (size, num_picks)
	assert(num_picks <= size, "Can't pick more elements than the size of the")
	assert(size < 128, "Don't use this for large arrays, since it will be inefficient. It creates large tables then.")

	for i = 1, size, 1 do
		all[i] = i
	end

	for i = 1, num_picks, 1 do
		local random_index = Math.random(1, size)
		random_indices[i] = all[random_index]
		all[random_index] = all[size]
		size = size - 1
	end

	return random_indices
end

table.tostring = function (t, tabs)
	tabs = tabs or 0
	local str = "{\n"

	for key, value in ipairs(t) do
		str = _add_tabs(str, tabs + 1)
		local value_type = type(value)

		if value_type == "table" then
			str = str .. table.tostring(value, tabs + 1) .. ",\n"
		elseif value_type == "string" then
			str = str .. "\"" .. value .. "\",\n"
		else
			str = str .. tostring(value) .. ",\n"
		end
	end

	for key, value in pairs(t) do
		if type(key) ~= "number" then
			str = _add_tabs(str, tabs + 1)
			local value_type = type(value)

			if value_type == "table" then
				str = str .. key .. "=" .. table.tostring(value, tabs + 1) .. ",\n"
			elseif value_type == "string" then
				str = str .. key .. "=" .. "\"" .. value .. "\",\n"
			else
				str = str .. key .. "=" .. tostring(value) .. ",\n"
			end
		end
	end

	return _add_tabs(str, tabs) .. "}"
end

table.set = function (list)
	local set = {}

	for _, l in ipairs(list) do
		set[l] = true
	end

	return set
end

table.mirror_table = function (source, dest)
	assert(source ~= dest)

	local result = dest or {}

	for k, v in pairs(source) do
		result[k] = v
		result[v] = k
	end

	return result
end

table.mirror_array = function (source, dest)
	assert(source ~= dest)

	local result = dest or {}

	for index, value in ipairs(source) do
		result[index] = value
		result[value] = index
	end

	return result
end

table.mirror_array_inplace = function (t)
	for index, value in ipairs(t) do
		t[value] = index
	end

	return t
end

local temp_weak_table = setmetatable({}, {
	__mode = "v"
})
local temp_weak_table_size = 0

table.unpack_map = function (t)
	local n = 0

	for value, _ in pairs(t) do
		n = n + 1
		temp_weak_table[n] = value
	end

	for i = n + 1, temp_weak_table_size, 1 do
		temp_weak_table[i] = nil
	end

	temp_weak_table_size = n

	return unpack(temp_weak_table)
end

table.keys = function (t, output)
	local n = 0
	local result = output or {}

	for key, _ in pairs(t) do
		n = n + 1
		result[n] = key
	end

	return result
end

table.append_varargs = function (t, ...)
	local num_varargs = select("#", ...)
	local t_size = #t

	for i = 1, num_varargs, 1 do
		t[t_size + i] = select(i, ...)
	end

	return t
end

table.array_to_table = function (array, array_n, out_table)
	for i = 1, array_n, 2 do
		local key = array[i]
		local value = array[i + 1]
		out_table[key] = value
	end
end

table.table_to_array = function (t, array_out)
	assert(#array_out == 0)

	local array_out_n = 0

	for key, value in pairs(t) do
		array_out[array_out_n + 1] = key
		array_out[array_out_n + 2] = value
		array_out_n = array_out_n + 2
	end

	return array_out_n
end

table.add_meta_logging = function (real_table, debug_enabled, debug_name)
	local real_table = real_table or {}

	if debug_enabled then
		local front_table = {
			__index = function (table, key)
				local value = rawget(real_table, key)

				print("meta getting", debug_name, key, value)

				return value
			end
		}

		setmetatable(front_table, front_table)

		front_table.__newindex = function (table, key, value)
			print("meta setting", debug_name, key, value)
			rawset(real_table, key, value)
		end

		return front_table
	else
		return real_table
	end
end

function ripairs(t)
	local function ripairs_it(t, i)
		i = i - 1
		local v = t[i]

		if v == nil then
			return v
		end

		return i, v
	end

	return ripairs_it, t, #t + 1
end

table.swap_delete = function (t, index)
	local table_length = #t
	t[index] = t[table_length]
	t[table_length] = nil
end

return
