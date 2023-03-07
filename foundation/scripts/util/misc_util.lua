IDENTITY = IDENTITY or function (x)
	return x
end
NOP = NOP or function ()
	return
end
TABLE_NEW = TABLE_NEW or function ()
	return {}
end
CONST = CONST or setmetatable({}, {
	__call = function (self, x)
		return x == nil and NOP or self[x]
	end,
	__index = function (self, x)
		local function f()
			return x
		end

		self[x] = f

		return f
	end
})
local string_format = string.format

function printf(f, ...)
	print(string_format(f, ...))
end

function sprintf(f, ...)
	return string_format(f, ...)
end

function cprint(...)
	print(...)

	if IS_WINDOWS then
		CommandWindow.print(...)
	end
end

function cprintf(f, ...)
	local s = string_format(f, ...)

	print(s)

	if IS_WINDOWS and DEDICATED_SERVER then
		CommandWindow.print(s)
	end
end

function to_boolean(a)
	local t = type(a)

	if t == "number" then
		return a ~= 0
	elseif t == "string" then
		return a == "true"
	elseif t == "boolean" then
		return a
	elseif t == "nil" then
		return false
	elseif t == "table" then
		return true
	end

	ferror("unsupported type(%s)", type(a))

	return false
end

function bool_string(b)
	return to_boolean(b) and "true" or "false"
end

function vector_string(v)
	local x = v[1]
	local y = v[2]
	local z = v[3]

	return string.format("x(%.2f) y(%.2f) z(%.2f)", x, y, z)
end

function T(v1, v2)
	if v1 ~= nil then
		return v1
	else
		return v2
	end
end

varargs = varargs or {}

varargs.to_table = function (...)
	local values = {}
	local num_args = select("#", ...)

	for i = 1, num_args do
		local val = select(i, ...)

		table.insert(values, val)
	end

	return values, #values
end

varargs.join = function (delimiter, ...)
	local output = ""
	local num_args = select("#", ...)

	for i = 1, num_args - 1 do
		local val = select(i, ...)
		output = output .. tostring(val) .. delimiter
	end

	return output .. tostring(select(num_args, ...))
end

function split_string(s)
	local parts = {}

	for part in s:gmatch("(%S+)") do
		parts[#parts + 1] = part
	end

	return parts
end

function unpack_string(s)
	return unpack(split_string(s))
end

function ituple(t)
	return ituple_iterator, t, -1
end

function ituple_iterator(t, k)
	local k1 = k + 2
	local val1 = t[k1]

	if val1 == nil then
		return
	end

	return k1, val1, t[k + 3]
end
