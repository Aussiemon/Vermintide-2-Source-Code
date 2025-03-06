-- chunkname: @foundation/scripts/util/string.lua

local format = string.format
local gsub = string.gsub
local sub = string.sub

string.starts_with = function (str, start)
	return sub(str, 1, #start) == start
end

string.ends_with = function (str, ending)
	return ending == "" or sub(str, -#ending) == ending
end

string.insert = function (str1, str2, pos)
	return sub(str1, 1, pos) .. str2 .. sub(str1, pos + 1)
end

local _fields

local function _split_helper(part)
	_fields[#_fields + 1] = part
end

string.split_deprecated = function (str, sep, dest)
	_fields = dest or {}

	local pattern = format("([^%s]+)", sep or " ")

	gsub(str, pattern, _split_helper)

	return _fields
end

string.split = function (str, sep, dest, pattern)
	sep = sep or " "
	dest = dest or {}

	local count = 0

	if str == "" then
		return dest, count
	end

	if sep == "" then
		local len = #str

		for i = 1, len do
			dest[i] = string.sub(str, i, i)
		end

		return dest, len
	end

	local offset = 1
	local from, to = string.find(str, sep, offset, not pattern)

	while from do
		count = count + 1
		dest[count] = string.sub(str, offset, from - 1)
		offset = to + 1
		from, to = string.find(str, sep, offset, not pattern)
	end

	count = count + 1
	dest[count] = string.sub(str, offset, #str)

	return dest, count
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

string.is_snake_case = function (str)
	if string.ends_with(str, "_") then
		return false
	end

	local arr = string.split_deprecated(str, "_")

	for _, substr in pairs(arr) do
		if string.match(substr, "%w+") ~= substr or substr:lower() ~= substr then
			return false
		end
	end

	return true
end

string.levenshtein = function (str1, str2)
	local length1 = #str1
	local length2 = #str2

	if length1 == 0 then
		return length2
	end

	if length2 == 0 then
		return length1
	end

	if str1 == str2 then
		return 0
	end

	local matrix = {}
	local cost = 1
	local min = math.min

	for i = 0, length1 do
		matrix[i] = {}
		matrix[i][0] = i
	end

	for j = 0, length2 do
		matrix[0][j] = j
	end

	for i = 1, length1 do
		for j = 1, length2 do
			if str1:byte(i) == str2:byte(j) then
				cost = 0
			end

			matrix[i][j] = min(matrix[i - 1][j] + 1, matrix[i][j - 1] + 1, matrix[i - 1][j - 1] + cost)
		end
	end

	return matrix[length1][length2]
end

string.damerau_levenshtein_distance = function (s, t, lim)
	local s_len, t_len = #s, #t

	if lim and lim <= math.abs(s_len - t_len) then
		return lim
	end

	if type(s) == "string" then
		s = {
			string.byte(s, 1, s_len),
		}
	end

	if type(t) == "string" then
		t = {
			string.byte(t, 1, t_len),
		}
	end

	local min = math.min
	local num_columns = t_len + 1
	local d = {}

	for i = 0, s_len do
		d[i * num_columns] = i
	end

	for j = 0, t_len do
		d[j] = j
	end

	for i = 1, s_len do
		local i_pos = i * num_columns
		local best = lim

		for j = 1, t_len do
			local add_cost = s[i] ~= t[j] and 1 or 0
			local val = min(d[i_pos - num_columns + j] + 1, d[i_pos + j - 1] + 1, d[i_pos - num_columns + j - 1] + add_cost)

			d[i_pos + j] = val

			if i > 1 and j > 1 and s[i] == t[j - 1] and s[i - 1] == t[j] then
				d[i_pos + j] = min(val, d[i_pos - num_columns - num_columns + j - 2] + add_cost)
			end

			if lim and val < best then
				best = val
			end
		end

		if lim and lim <= best then
			return lim
		end
	end

	return d[#d]
end

string.pad_left = function (str, target_length, pad_str)
	local str_size = #str
	local pad_size = #pad_str

	for i = str_size + pad_size, target_length, pad_size do
		str = pad_str .. str
	end

	local rest = (target_length - str_size) % pad_size

	if rest ~= 0 then
		str = string.sub(pad_str, pad_size - rest + 1, pad_size) .. str
	end

	return str
end

string.pad_right = function (str, target_length, pad_str, cache)
	local str_size = #str
	local pad_size = #pad_str

	if cache then
		local slack = math.max(0, target_length - str_size)
		local cached = cache[slack]

		if cached then
			return str .. cached
		end

		cache[slack] = string.pad_right("", slack, pad_str)

		return str .. cache[slack]
	end

	local padding = ""

	for i = str_size + pad_size, target_length, pad_size do
		padding = padding .. pad_str
	end

	local rest = (target_length - str_size) % pad_size

	if rest ~= 0 then
		padding = padding .. string.sub(pad_str, 1, rest)
	end

	return str .. padding
end

string.rep = function (rep, n)
	local str = ""

	for i = 1, n do
		str = str .. rep
	end

	return str
end

local chunk_scratch = {}

string.chunk_from_right = function (str, step_n, sep)
	sep = sep or " "

	local str_len = #str
	local chunk_part_n = math.floor(str_len / step_n)
	local offset = 0
	local rest = str_len % step_n

	if rest > 0 then
		chunk_scratch[1] = string.sub(str, 1, rest)
		offset = 1
	end

	for i = 1, chunk_part_n do
		chunk_scratch[chunk_part_n - i + 1 + offset] = string.sub(str, -i * step_n, -(i - 1) * step_n - 1)
	end

	local res = table.concat(chunk_scratch, sep)

	table.clear(chunk_scratch)

	return res
end

local function hexchar(c)
	return format("%02x", string.byte(c))
end

string.tohex = function (str)
	return gsub(str, ".", hexchar)
end
