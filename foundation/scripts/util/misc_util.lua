require("foundation/scripts/util/spline")

function printf(f, ...)
	print(string.format(f, ...))

	return 
end

function sprintf(f, ...)
	return string.format(f, ...)
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

	assert(false, sprintf("unsupported type(%s)", type(a)))

	return false
end

function bool_string(b)
	return (to_boolean(b) and "true") or "false"
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

	return 
end

varargs = varargs or {}
varargs.to_table = function (...)
	local values = {}
	local num_args = select("#", ...)

	for i = 1, num_args, 1 do
		local val = select(i, ...)

		table.insert(values, val)
	end

	return values, #values
end
varargs.join = function (delimiter, ...)
	local output = ""
	local num_args = select("#", ...)

	for i = 1, num_args - 1, 1 do
		local val = select(i, ...)
		output = output .. tostring(val) .. delimiter
	end

	return output .. tostring(select(num_args, ...))
end

function unpack_string(s)
	local parts = {}

	for part in s.gmatch(s, "(%S+)") do
		parts[#parts + 1] = part
	end

	return unpack(parts)
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

ColorBox = QuaternionBox

return 
