Path = {
	normalize_path = function (string_path)
		string_path = string_path:gsub("\\", "/")
		string_path = string_path:gsub("//", "/")

		return string_path
	end
}

Path.path_from_string = function (string_path)
	string_path = Path.normalize_path(string_path)
	local path = {
		size = 0
	}
	local path_n = 0
	local string_path_len = #string_path
	local index = 0

	while index ~= nil do
		local next_slash_index = string_path:find("/", index)
		local path_part = string_path:sub(index, (next_slash_index and next_slash_index - 1) or nil)
		path_n = path_n + 1
		path[path_n] = path_part

		if next_slash_index == nil or next_slash_index == string_path_len then
			break
		end

		index = next_slash_index + 1
	end

	path.size = path_n

	return path
end

Path.path_from_parts = function (...)
	local path_n = select("#", ...)
	local path = {
		size = path_n
	}

	for i = 1, path_n, 1 do
		local part = select(i, ...)
		path[i] = part
	end

	return path
end

Path.copy = function (path)
	local path_new = {
		size = path.size
	}

	for i = 1, path.size, 1 do
		path_new[i] = path[i]
	end

	return path_new
end

Path.change_dir_up = function (path)
	assert(path.size > 0)

	path.size = path.size - 1
end

Path.add_path_part = function (path, path_part)
	path.size = path.size + 1
	path[path.size] = path_part
end

Path.join = function (path1, path2, result)
	result = result or {}
	result.size = 0

	for i = 1, path1.size, 1 do
		result.size = result.size + 1
		result[result.size] = path1[i]
	end

	for i = 1, path2.size, 1 do
		result.size = result.size + 1
		result[result.size] = path2[i]
	end

	return result
end

Path.tostring = function (path, separator)
	separator = separator or "/"
	local string_path = ""

	for i = 1, path.size - 1, 1 do
		string_path = string_path .. path[i] .. separator
	end

	string_path = string_path .. path[path.size]

	return string_path
end

local UNIT_TEST = true

if UNIT_TEST then
	local lols = math.random()
	local p1 = Path.path_from_string("hej")

	assert(p1.size == 1)

	local p2 = Path.path_from_string("hej/apa")

	assert(p2.size == 2)
	assert(p2[p2.size] == "apa")

	local p3 = Path.path_from_string("hej\\apa\\")

	assert(p3.size == 2)
	assert(p3[p3.size] == "apa")

	local p4 = Path.path_from_parts("hej", "apa")

	assert(p4.size == 2)
	Path.change_dir_up(p4)
	assert(p4.size == 1)
	Path.add_path_part(p4, "lols")
	assert(p4.size == 2)
	assert(p4[p4.size] == "lols")

	local p5 = Path.path_from_parts("anders", "isn't", "best")
	local result = {}

	Path.join(p4, p5, result)
	assert(result.size == p4.size + p5.size)
	assert(result[result.size] == "best")

	local string_path = Path.tostring(result)

	assert(string_path == "hej/lols/anders/isn't/best")

	local p6 = Path.path_from_string("C:\\trunk/lols/")

	assert(p6.size == 3)

	local p6_string_path = Path.tostring(p6)

	assert(p6_string_path == "C:/trunk/lols")
end

return
