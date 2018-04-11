table_trap = table_trap or {}
table_trap.print = function (operation, key, value)
	print(table_trap._trap_information(operation, key, value))

	return 
end
table_trap.callstack = function (operation, key, value)
	print(table_trap._trap_information(operation, key, value) .. "\n" .. Script.callstack())

	return 
end
table_trap.assert = function (operation, key, value)
	print(table_trap._trap_information(operation, key, value))
	assert(false)

	return 
end
table_trap.noop = function ()
	return 
end
table_trap.trap_key = function (table_to_debug, key_to_inspect, read_func, write_func)
	if read_func == nil then
		read_func = table_trap.noop
	end

	if write_func == nil then
		write_func = table_trap.noop
	end

	local data_table = {}
	local old_metatable = getmetatable(table_to_debug)

	setmetatable(table_to_debug, nil)

	for k, v in pairs(table_to_debug) do
		data_table[k] = v
		table_to_debug[k] = nil
	end

	setmetatable(data_table, old_metatable)

	local new_metatable = {}

	table_trap._add_forwarding_metafunctions(new_metatable, data_table)

	new_metatable.__index = function (t, key)
		local value = data_table[key]

		if key == key_to_inspect then
			read_func("read", key, value)
		end

		return value
	end
	new_metatable.__newindex = function (t, key, value)
		if key == key_to_inspect then
			write_func("write", key, value)
		end

		data_table[key] = value

		return 
	end

	setmetatable(table_to_debug, new_metatable)

	return 
end
table_trap.trap_keys = function (table_to_debug, read_func, write_func)
	if read_func == nil then
		read_func = table_trap.noop
	end

	if write_func == nil then
		write_func = table_trap.noop
	end

	local data_table = {}
	local old_metatable = getmetatable(table_to_debug)

	setmetatable(table_to_debug, nil)

	for k, v in pairs(table_to_debug) do
		data_table[k] = v
		table_to_debug[k] = nil
	end

	setmetatable(data_table, old_metatable)

	local new_metatable = {}

	table_trap._add_forwarding_metafunctions(new_metatable, data_table)

	new_metatable.__index = function (t, key)
		local value = data_table[key]

		read_func("read", key, value)

		return value
	end
	new_metatable.__newindex = function (t, key, value)
		write_func("write", key, value)

		data_table[key] = value

		return 
	end

	setmetatable(table_to_debug, new_metatable)

	return 
end
table_trap._trap_information = function (operation, key, value)
	if operation == "read" then
		return string.format("Trap %s '%s':'%s'", operation, tostring(key), tostring(value))
	elseif operation == "write" then
		return string.format("Trap %s '%s'='%s'", operation, tostring(key), tostring(value))
	end

	return 
end
table_trap._add_forwarding_metafunctions = function (metatable, data_table)
	metatable.__unm = function (t)
		return -data_table
	end
	metatable.__add = function (lhs, rhs)
		local a, b = table_trap._replace_with_data_if_metatable_matches(lhs, rhs, metatable, data_table)

		return a + b
	end
	metatable.__sub = function (lhs, rhs)
		local a, b = table_trap._replace_with_data_if_metatable_matches(lhs, rhs, metatable, data_table)

		return a - b
	end
	metatable.__mul = function (lhs, rhs)
		local a, b = table_trap._replace_with_data_if_metatable_matches(lhs, rhs, metatable, data_table)

		return a * b
	end
	metatable.__div = function (lhs, rhs)
		local a, b = table_trap._replace_with_data_if_metatable_matches(lhs, rhs, metatable, data_table)

		return a / b
	end
	metatable.__mod = function (lhs, rhs)
		local a, b = table_trap._replace_with_data_if_metatable_matches(lhs, rhs, metatable, data_table)

		return a % b
	end
	metatable.__pow = function (lhs, rhs)
		local a, b = table_trap._replace_with_data_if_metatable_matches(lhs, rhs, metatable, data_table)

		return a^b
	end
	metatable.__concat = function (lhs, rhs)
		local a, b = table_trap._replace_with_data_if_metatable_matches(lhs, rhs, metatable, data_table)

		return a .. b
	end
	metatable.__eq = function (lhs, rhs)
		assert(false)

		return 
	end
	metatable.__lt = function (lhs, rhs)
		assert(false)

		return 
	end
	metatable.__le = function (lhs, rhs)
		assert(false)

		return 
	end
	metatable.__len = function (t)
		return #data_table
	end
	metatable.__call = function (f, ...)
		data_table(f, ...)

		return 
	end
	metatable.__tostring = function (s)
		return tostring(data_table)
	end

	return 
end
table_trap._replace_with_data_if_metatable_matches = function (lhs, rhs, metatable, data)
	local redir_lhs, redir_rhs = nil

	if getmetatable(lhs) == metatable then
		redir_lhs = data
	else
		redir_lhs = lhs
	end

	if getmetatable(rhs) == metatable then
		redir_rhs = data
	else
		redir_rhs = rhs
	end

	return redir_lhs, redir_rhs
end

return 
