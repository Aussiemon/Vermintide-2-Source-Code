local format = string.format
local gsub = string.gsub
local sub = string.sub

string.starts_with = function (str, start)
	return sub(str, 1, #start) == start
end

string.ends_with = function (str, ending)
	return ending == "" or sub(str, -(#ending)) == ending
end

string.insert = function (str1, str2, pos)
	return sub(str1, 1, pos) .. str2 .. sub(str1, pos + 1)
end

local _fields = nil

local function _split_helper(part)
	_fields[#_fields + 1] = part
end

string.split = function (str, sep, dest)
	_fields = dest or {}
	local pattern = format("([^%s]+)", sep or " ")

	gsub(str, pattern, _split_helper)

	return _fields
end

string.trim = function (str)
	return gsub(gsub(str, "^%s+", ""), "%s+$", "")
end

string.remove = function (str, i, j)
	return sub(str, 1, i - 1) .. sub(str, j + 1)
end

string.value_or_nil = function (str)
	if str == "" or str == false then
		return nil
	else
		return str
	end
end
