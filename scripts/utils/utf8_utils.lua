-- chunkname: @scripts/utils/utf8_utils.lua

UTF8Utils = UTF8Utils or {}

local Utf8_location = Utf8.location

Utf8.length = function (text)
	local byte_length = #text
	local next_byte_index = 1

	for char_index = 1, byte_length do
		local _, byte_index = Utf8.location(text, next_byte_index)

		if byte_length < byte_index then
			return char_index
		end

		next_byte_index = byte_index
	end

	return 0
end

UTF8Utils.sub_string = function (text, char_from, char_to)
	local num_bytes = #text

	if num_bytes == 0 then
		return text
	end

	local byte_from = UTF8Utils.count_bytes(text, char_from - 1, 1) + 1
	local byte_to = UTF8Utils.count_bytes(text, char_to - char_from + 1, byte_from)

	return string.sub(text, byte_from, byte_to)
end

UTF8Utils.count_bytes = function (text, num_chars, start_byte)
	local num_bytes = #text
	local _

	for char_index = 1, num_chars do
		_, start_byte = Utf8_location(text, start_byte)

		if num_bytes < start_byte then
			break
		end
	end

	return start_byte - 1
end

UTF8Utils.clamp_byte_length = function (text, max_bytes)
	if max_bytes <= 0 then
		return ""
	end

	if max_bytes >= #text then
		return text
	end

	local next_byte_from = Utf8_location(text, max_bytes + 1)

	return string.sub(text, 1, next_byte_from - 1)
end
