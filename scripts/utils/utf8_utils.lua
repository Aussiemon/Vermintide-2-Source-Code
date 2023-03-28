UTF8Utils = UTF8Utils or {}

UTF8Utils.string_length = function (text)
	local length = #text
	local index = 1
	local num_chars = 0
	local _ = nil

	while index <= length do
		_, index = Utf8.location(text, index)
		num_chars = num_chars + 1
	end

	return num_chars
end

UTF8Utils.sub_string = function (text, char_from, char_to)
	if char_to <= 0 or text == "" then
		return ""
	end

	local byte_index = 1
	local byte_count = #text
	local byte_from = -1
	local byte_to = -1
	local char_index = 1

	while byte_index <= byte_count do
		local tmp_byte_from, tmp_byte_to = Utf8.location(text, byte_index)

		if char_index == char_from then
			byte_from = tmp_byte_from
		end

		if char_index == char_to then
			byte_to = tmp_byte_to - 1

			break
		end

		char_index = char_index + 1
		byte_index = tmp_byte_to
	end

	if byte_from then
		return string.sub(text, byte_from, byte_to)
	else
		return ""
	end
end
