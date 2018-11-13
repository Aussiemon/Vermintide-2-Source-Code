GarbageLeakDetector = GarbageLeakDetector or {
	enabled = false,
	object_callstack_map = setmetatable({}, {
		__mode = "k"
	})
}

GarbageLeakDetector.register_object = function (object, object_name)
	return
end

local debug_search = nil

local function debug_search_function(func, what, path, path_n)
	local up = 1

	while true do
		local k, v = debug.getupvalue(func, up)

		if k == nil then
			break
		end

		if k == what then
			path[path_n] = string.format("> upvalue key [value %s]", tostring(v))

			printf("Found leak at path: %s", table.concat(path))
		else
			path[path_n] = string.format("> upval name %q", tostring(k))

			debug_search(k, what, path, path_n + 1)
		end

		if v == what then
			path[path_n] = string.format("> upvalue %q", tostring(k))

			printf("Found leak at path: %s", table.concat(path))
		else
			path[path_n] = string.format("> upval %q", tostring(k))

			debug_search(v, what, path, path_n + 1)
		end

		path[path_n] = nil
		up = up + 1
	end
end

local function debug_search_table(tablet, what, path, path_n)
	for k, v in pairs(tablet) do
		path[path_n] = string.format("> key %s", tostring(k))

		if k == what then
			printf("Found leak at path: %s", table.concat(path))
		else
			debug_search(k, what, path, path_n + 1)
		end

		path[path_n] = string.format("> %s", tostring(k))

		if v == what then
			printf("Found leak at path: %s", table.concat(path))
		else
			debug_search(v, what, path, path_n + 1)
		end

		local metatable = debug.getmetatable(tablet)

		if metatable then
			path[path_n] = string.format("> metatable %s", tostring(metatable))

			if metatable == what then
				printf("Found leak at path: %s", table.concat(path))
			else
				debug_search(metatable, what, path, path_n + 1)
			end
		end

		path[path_n] = nil
	end
end

local seen_tables = nil

function debug_search(object, what, path, path_n)
	if object == what then
		printf("Found leak at path: %s", table.concat(path))
	end

	local t_type = type(object)

	if t_type == "function" then
		if seen_tables[object] then
			return
		end

		seen_tables[object] = true
		path[path_n] = "> function"

		debug_search_function(object, what, path, path_n + 1)

		path[path_n] = nil
	elseif t_type == "table" then
		if seen_tables[object] then
			return
		end

		seen_tables[object] = true
		path[path_n] = "> table "

		debug_search_table(object, what, path, path_n + 1)

		path[path_n] = nil
	else
		local metatable = getmetatable(object)

		if metatable and not seen_tables[metatable] then
			path[path_n] = string.format("> %s metatable", tostring(object))

			debug_search(metatable, what, path, path_n + 1)

			path[path_n] = nil
		end
	end
end

local function debug_search_stack(what, path, path_n)
	local stack_level = 3

	while true do
		local function_info = debug.getinfo(stack_level)

		if not function_info then
			break
		end

		path[path_n] = string.format("Stack function %s [%d]", function_info.name or "UNKNOWN", stack_level)
		local func = function_info.func

		if func then
			debug_search(func, what, path, path_n + 1)
		end

		local local_index = 1

		while true do
			local name, value = debug.getlocal(stack_level, local_index)

			if not name then
				break
			end

			path[path_n + 1] = string.format("> Stack variable %s:%q [name]", tostring(name), tostring(value))

			debug_search(name, what, path, path_n + 2)

			path[path_n + 1] = string.format("> Stack variable %s:%q [value]", tostring(name), tostring(value))

			debug_search(value, what, path, path_n + 2)

			path[path_n + 1] = nil
			local_index = local_index + 1
		end

		stack_level = stack_level + 1
		path[path_n] = nil
	end
end

local has_run = nil

GarbageLeakDetector.run_leak_detection = function (do_assert)
	return
end

return
