local format = string.format

local function sprintf(...)
	return format(...)
end

local debug_getinfo = debug.getinfo
local USE_ERROR = true
local error_func = nil

if USE_ERROR then
	function error_func(...)
		local success, s = pcall(sprintf, ...)

		if success then
			assert(false, s)
		else
			assert(false, "Failed to format text.")
		end
	end
else
	local function console_print(level, message)
		if Application.console_send then
			Application.console_send({
				system = "Lua",
				type = "message",
				level = level,
				message = message
			})
		else
			print(message)
		end
	end

	function error_func(...)
		console_print("error", sprintf(...))
	end
end

local rawget = rawget
local rawset = rawset

local function debug_info_string(info)
	local short_src = info.short_src or ""
	local line = info.currentline or -1
	local s = sprintf("short_src(%s), line(%d)", short_src, line)

	return s
end

StrictNil = StrictNil or {}

function MakeTableStrict(t)
	local declared_args = {}

	for k, v in pairs(t) do
		declared_args[k] = true

		if v == StrictNil then
			t[k] = nil
		end
	end

	local meta = {
		__declared = declared_args,
		__newindex = function (t, k, v)
			if not meta.__declared[k] then
				if not rawget(t, k) then
					local info = debug_getinfo(2, "Sl")

					if k ~= "to_console_line" and info and info.what ~= "main" and info.what ~= "C" then
						error_func("[ERROR] cannot assign undeclared member variable %q, %s", k, debug_info_string(info))
					end
				end

				meta.__declared[k] = true
			end

			rawset(t, k, v)
		end,
		__index = function (t, k)
			if not meta.__declared[k] and not rawget(t, k) then
				local info = debug_getinfo(2, "Sl")

				if k ~= "to_console_line" and info and info.what ~= "main" and info.what ~= "C" then
					error_func("[ERROR] cannot index undeclared member variable %q, %s", tostring(k), debug_info_string(info))
				end
			end
		end
	}

	setmetatable(t, meta)

	return t
end

function MakeTableFrozen(t)
	local declared_args = {}

	for k, v in pairs(t) do
		declared_args[k] = true

		if v == StrictNil then
			t[k] = nil
		end
	end

	local meta = {
		__declared = declared_args,
		__newindex = function (t, k, v)
			if not meta.__declared[k] then
				if not rawget(t, k) then
					local info = debug_getinfo(2, "Sl")

					if k ~= "to_console_line" and info and info.what ~= "main" and info.what ~= "C" then
						error_func("[ERROR] cannot assign undeclared member variable %q, %s", k, debug_info_string(info))
					end
				end

				meta.__declared[k] = true
			end

			rawset(t, k, v)
		end
	}

	setmetatable(t, meta)

	return t
end

function ProtectMetaTable(t)
	local meta = getmetatable(t)
	meta.__metatable = true

	return t
end

function MakeTableWeakValues(t)
	local meta = getmetatable(t) or {}
	meta.__mode = "v"

	setmetatable(t, meta)

	return t
end

function MakeTableWeakKeys(t)
	local meta = getmetatable(t) or {}
	meta.__mode = "k"

	setmetatable(t, meta)

	return t
end

if not rawget(_G, "STRICT_ENUM_INITIATED") then
	rawset(_G, "STRICT_ENUM_INITIATED", true)

	local strict_cmp_metatable = {
		__eq = function (lhs, rhs)
			assert(lhs._enum_table == rhs._enum_table, "Trying to compare incompatible enum types.")

			return lhs.my_index == rhs.my_index
		end,
		__tostring = function (val)
			return val._enum_table[val]
		end
	}

	function CreateStrictEnumTable(...)
		local my_enum_table = {}
		local num_args = select("#", ...)

		for i = 1, num_args, 1 do
			local current_value = select(i, ...)
			local my_object = setmetatable({
				_enum_table = my_enum_table,
				my_index = i,
				as_number = function ()
					return i
				end,
				__tostring = function ()
					return current_value
				end
			}, strict_cmp_metatable)
			my_enum_table[current_value] = my_object
			my_enum_table[my_object] = current_value
			my_enum_table[i] = my_object
		end

		return my_enum_table
	end
end

return
