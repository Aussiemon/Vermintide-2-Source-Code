-- chunkname: @foundation/scripts/util/table.lua

require("foundation/scripts/util/class")

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

if pcall(require, "table.new") then
	Script.new_array = function (narr)
		return table.new(narr, 0)
	end

	Script.new_map = function (nrec)
		return table.new(0, nrec)
	end

	Script.new_table = table.new
end

table.clone = function (t, skip_metatable)
	local clone = {}

	assert(skip_metatable or getmetatable(t) == nil, "Metatables will be sliced off")

	for key, value in pairs(t) do
		if type(value) ~= "table" or is_class_instance(value) then
			clone[key] = value
		else
			clone[key] = table.clone(value, skip_metatable)
		end
	end

	return clone
end

table.shallow_copy = function (t, skip_metatable, out_t)
	local copy = out_t or {}

	assert(skip_metatable or getmetatable(t) == nil, "Metatables will be sliced off")

	for key, value in pairs(t) do
		copy[key] = value
	end

	return copy
end

table.crop = function (t, index)
	local new_table = {}
	local new_table_size = 0

	for idx = index, #t do
		new_table_size = new_table_size + 1
		new_table[new_table_size] = t[idx]
	end

	return new_table, new_table_size
end

table.compare = function (t1, t2, ignore_keys)
	ignore_keys = ignore_keys or {}

	for key_t1, value_t1 in pairs(t1) do
		if not table.contains(ignore_keys, key_t1) then
			for key_t2, value_t2 in pairs(t2) do
				if key_t1 == key_t2 and value_t1 ~= value_t2 then
					return false
				end
			end
		end
	end

	return true
end

table.create_copy = function (copy, original)
	if not copy then
		return table.clone(original)
	else
		assert(getmetatable(original) == nil, "Metatables will be sliced off")

		for key, value in pairs(original) do
			if type(value) ~= "table" or is_class_instance(value) then
				copy[key] = value
			else
				copy[key] = table.create_copy(copy[key], value)
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

table.merge_varargs = function (args, num_args, ...)
	local merged = {
		unpack(args, 1, num_args),
	}
	local num_varargs = select("#", ...)

	for i = 1, num_varargs do
		merged[num_args + i] = select(i, ...)
	end

	return merged, num_args + num_varargs
end

table.pack = function (...)
	return {
		...,
	}, select("#", ...)
end

table.append_recursive = function (dest, source)
	for key, value in pairs(source) do
		local is_table = type(value) == "table"

		if is_table and type(dest[key]) == "table" then
			table.append_recursive(dest[key], value)
		elseif dest[key] == nil then
			if is_table then
				dest[key] = table.clone(value)
			else
				dest[key] = value
			end
		end
	end
end

table.append = function (dest, source)
	local dest_size = #dest

	for i = 1, #source do
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

	return nil
end

table.find_by_key = function (t, search_key, search_value)
	for key, value in pairs(t) do
		if value[search_key] == search_value then
			return key, value
		end
	end

	return nil
end

table.index_of = function (t, element)
	for i = 1, #t do
		if t[i] == element then
			return i
		end
	end

	return -1
end

table.slice = function (t, start_index, length)
	local end_index = math.min(start_index + length - 1, #t)
	local slice = {}

	for i = start_index, end_index do
		slice[#slice + 1] = t[i]
	end

	return slice
end

table.sorted = function (t, order_func, use_frame_table)
	local keys = use_frame_table and FrameTable.alloc_table() or {}

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

	for i = 1, math.floor(size / 2) do
		t[i], t[size - i + 1] = t[size - i + 1], t[i]
	end
end

if pcall(require, "table.clear") then
	table.clear = require("table.clear")
else
	table.clear = function (t)
		for k in pairs(t) do
			t[k] = nil
		end
	end
end

table.clear_array = function (t, n)
	for i = 1, n or #t do
		t[i] = nil
	end
end

local function table_dump(key, value, depth, max_depth, print_func)
	if max_depth < depth then
		return
	end

	local prefix = string.rep("  ", depth + 1) .. (key == nil and "" or "[" .. tostring(key) .. "]")

	if type(value) == "table" then
		prefix = prefix .. (key == nil and "" or " = ")

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

	if t then
		for key, value in pairs(t) do
			table_dump(key, value, 0, max_depth or 0, print_func)
		end
	else
		print_func("no table!")
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

local _buffer = {}

table.minidump = function (t, name)
	local b, i = _buffer, 1

	if name then
		b[1] = "["
		b[2] = name
		b[3] = "] "
		i = 4
	end

	for key, value in pairs(t) do
		b[i] = key
		b[i + 1] = " = "
		b[i + 2] = tostring(value)
		b[i + 3] = "; "
		i = i + 4
	end

	local result = table.concat(b, 1, i - 2)

	table.clear(b)

	return result
end

table.shuffle = function (source, seed)
	if seed then
		for ii = #source, 2, -1 do
			local swap

			seed, swap = Math.next_random(seed, ii)
			source[swap], source[ii] = source[ii], source[swap]
		end
	else
		for ii = #source, 2, -1 do
			local swap = Math.random(ii)

			source[swap], source[ii] = source[ii], source[swap]
		end
	end

	return seed
end

table.max = function (t)
	local max_key, max_value = next(t)

	for key, value in pairs(t) do
		if max_value < value then
			max_key, max_value = key, value
		end
	end

	return max_key, max_value
end

table.min = function (t)
	local min_key, min_value = next(t)

	for key, value in pairs(t) do
		if value < min_value then
			min_key, min_value = key, value
		end
	end

	return min_key, min_value
end

table.for_each = function (t, f)
	for key, value in pairs(t) do
		t[key] = f(value)
	end
end

function _add_tabs(str, tabs)
	for i = 1, tabs do
		str = str .. "\t"
	end

	return str
end

local _value_to_string_array, _table_tostring_array

function _value_to_string_array(v, depth, max_depth, skip_private)
	if type(v) == "table" then
		if depth <= max_depth then
			return _table_tostring_array(v, depth + 1, max_depth, skip_private)
		else
			return {
				"(rec-limit)",
			}
		end
	elseif type(v) == "string" then
		return {
			"\"",
			v,
			"\"",
		}
	else
		return {
			tostring(v),
		}
	end
end

function _table_tostring_array(t, depth, max_depth, skip_private)
	local str = {
		"{\n",
	}
	local last_tabs = string.rep("\t", depth - 1)
	local tabs = last_tabs .. "\t"
	local len = #t

	for i = 1, len do
		str[#str + 1] = tabs

		table.append(str, _value_to_string_array(t[i], depth, max_depth, skip_private))

		str[#str + 1] = ",\n"
	end

	for key, value in pairs(t) do
		local is_number = type(key) == "number"

		if (is_number or not skip_private or key:sub(1, 1) ~= "_") and (not is_number or key < 1 or len < key) then
			local key_str

			if is_number then
				key_str = string.format("[%i]", key)
			else
				key_str = tostring(key)
			end

			str[#str + 1] = tabs
			str[#str + 1] = key_str
			str[#str + 1] = " = "

			table.append(str, _value_to_string_array(value, depth, max_depth, skip_private))

			str[#str + 1] = ",\n"
		end
	end

	str[#str + 1] = last_tabs
	str[#str + 1] = "}"

	return str
end

table.tostring = function (t, max_depth, skip_private)
	return table.concat(_table_tostring_array(t, 1, max_depth or 1, skip_private))
end

table.set = function (list, set)
	set = set or {}

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

table.keys = function (t, out)
	out = out or {}

	local n = 0

	for key in pairs(t) do
		n = n + 1
		out[n] = key
	end

	return out, n
end

table.keys_if = function (t, out, conditional_func)
	out = out or {}

	local n = 0

	for key, val in pairs(t) do
		if conditional_func(key, val) then
			n = n + 1
			out[n] = key
		end
	end

	return out, n
end

table.values = function (t, out)
	out = out or {}

	local n = 0

	for _, val in pairs(t) do
		n = n + 1
		out[n] = val
	end

	return out, n
end

table.append_varargs = function (t, ...)
	local num_varargs = select("#", ...)
	local t_size = #t

	for i = 1, num_varargs do
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
		local front_table = {}

		front_table.__index = function (table, key)
			local value = rawget(real_table, key)

			print("meta getting", debug_name, key, value)

			return value
		end

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

local function ripairs_iterator(t, i)
	i = i - 1

	local v = t[i]

	if v then
		return i, v
	end
end

function ripairs(t)
	return ripairs_iterator, t, #t + 1
end

table.swap_delete = function (t, index)
	local table_length = #t

	t[index] = t[table_length]
	t[table_length] = nil
end

table.array_remove_if = function (t, predicate)
	local i, v = 1

	for j = 1, #t do
		v, t[j] = t[j]

		if not predicate(v) then
			t[i], i = v, i + 1
		end
	end
end

table.remove_if = function (t, predicate)
	for k, v in pairs(t) do
		if predicate(k, v) then
			t[k] = nil
		end
	end
end

local _enum_index_metatable = {
	__index = function (_, k)
		return error("Don't know `" .. tostring(k) .. "` for enum.")
	end,
}

table.enum = function (...)
	local t = {}

	for i = 1, select("#", ...) do
		local v = select(i, ...)

		t[v] = v
	end

	return t
end

table.ordered_enum = function (...)
	local t = {}

	for i = 1, select("#", ...) do
		local v = select(i, ...)

		t[v] = v
		t[i] = v
	end

	return t
end

table.enum_safe = function (...)
	local t = {}

	for i = 1, select("#", ...) do
		local v = select(i, ...)

		t[v] = v
	end

	return t
end

table.map = function (t, func)
	local copy = {}

	for k, v in pairs(t) do
		copy[k] = func(v)
	end

	return copy
end

table.filter = function (t, func)
	local copy = {}

	for k, v in pairs(t) do
		if func(v) == true then
			copy[k] = v
		end
	end

	return copy
end

table.filter_to_array = function (t, func)
	local copy = {}

	for k, v in pairs(t) do
		if func(v) == true then
			copy[#copy + 1] = v
		end
	end

	return copy
end

table.get_value_or_last = function (t, index)
	return t[index] or t[#t]
end

table.autovivified = function (new)
	new = new or TNEW

	return setmetatable({}, {
		__index = function (self, key)
			local val = new(key)

			self[key] = val

			return val
		end,
	})
end

table.every = function (t, func)
	for key, value in pairs(t) do
		if not func(key, value) then
			return false
		end
	end

	return true
end

table.find_func = function (t, func)
	for key, value in pairs(t) do
		if func(key, value) then
			return key, value
		end
	end
end

table.random = function (t)
	local index = math.random(1, #t)

	return t[index]
end

table.recursive_readonlytable = function (t)
	setmetatable(t, {
		__newindex = function (table, key, value)
			error("Trying to modify read only table.")
		end,
	})

	for _, value in pairs(t) do
		local type = type(value)

		if type == "table" then
			table.recursive_readonlytable(value)
		end
	end
end

table.flat = function (t, max_depth, current_depth)
	max_depth = max_depth or 1
	current_depth = (current_depth or 0) + 1

	local out = {}

	for i = 1, #t do
		local value = t[i]

		if type(value) == "table" and current_depth <= max_depth then
			table.append(out, table.flat(value, max_depth, current_depth))
		else
			out[#out + 1] = value
		end
	end

	return out
end

table.make_strict = function (tab, interface, interface_name)
	assert(getmetatable(tab) == nil, "Cannot call make_strict on a table with a metatable")

	interface_name = interface_name or "strict table"

	return setmetatable(tab, {
		__class_name = interface_name,
		__index = function (t, k)
			if not interface[k] then
				ferror("Reading from key %q not in interface <%s>", k, interface_name)
			end

			return nil
		end,
		__newindex = function (t, k, v)
			if not interface[k] then
				ferror("Writing to key %q not in interface <%s>", k, interface_name)
			end

			return rawset(t, k, v)
		end,
	})
end

table.select_array = function (t, selector)
	local new_t = {}

	for i = 1, #t do
		new_t[#new_t + 1] = selector(new_t, t[i])
	end

	return new_t
end

table.remove_empty_values = function (t)
	if table.is_empty(t) then
		return nil
	end

	local result = {}

	for k, v in pairs(t) do
		if k ~= StrictNil then
			local value_type = type(v)

			if value_type == "table" then
				if not table.is_empty(v) then
					result[k] = table.remove_empty_values(v)
				end
			elseif value_type == "string" and v ~= "" then
				result[k] = v
			elseif value_type ~= "nil" then
				result[k] = v
			end
		end
	end

	if table.is_empty(result) then
		return nil
	else
		return result
	end
end

local function _qs_partition(arr, low, high, f)
	local pivot = arr[high]
	local i = low - 1

	for j = low, high - 1 do
		local less

		if f then
			less = f(arr[j], pivot)
		else
			less = pivot >= arr[j]
		end

		if less then
			i = i + 1
			arr[i], arr[j] = arr[j], arr[i]
		end
	end

	arr[i + 1], arr[high] = arr[high], arr[i + 1]

	return i + 1
end

local function _quicksort(arr, low, high, f)
	if low < high then
		local pivot = _qs_partition(arr, low, high, f)

		_quicksort(arr, low, pivot - 1, f)
		_quicksort(arr, pivot + 1, high, f)
	end
end

table.sort_span = function (t, start_index, end_index, sort_func)
	_quicksort(t, start_index, end_index, sort_func)
end

table.array_average = function (t, max_num, next_val)
	if next_val then
		local idx = math.index_wrapper((t.index or 0) + 1, max_num)

		t[idx] = next_val
		t.index = idx
	end

	local num_elements = #t
	local sum, min, max = 0, 0, 0

	for i = 1, num_elements do
		local d = t[i]

		sum = sum + d
		min = d < min and d or min
		max = max < d and d or max
	end

	return sum / num_elements, min, max
end

table.enum_lookup = function (...)
	local arr = {
		...,
	}
	local lookup = table.mirror_array(arr)
	local enum = table.ordered_enum(unpack(lookup))

	return enum, lookup
end

table.insert_unique = function (t, value, index)
	if not table.find(t, value) and (not index or not table.insert(t, index, value)) then
		local _ = table.insert(t, value)
	end
end

table.remove_array_value = function (t, value)
	local iter_i = 1
	local move_i = 1
	local n = #t

	while iter_i <= n do
		if t[iter_i] == value then
			t[iter_i] = nil
		else
			move_i = move_i + 1
		end

		iter_i = iter_i + 1
		t[move_i] = t[iter_i]
	end

	return t
end

table.fill = function (t, n, value)
	for i = 1, n do
		t[i] = value
	end

	return t
end

table.count_if = function (t, f)
	local count = 0

	for k, v in pairs(t) do
		if f(k, v) then
			count = count + 1
		end
	end

	return count
end
