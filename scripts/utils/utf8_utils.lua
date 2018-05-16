UTF8Utils = UTF8Utils or {}

UTF8Utils.string_length = function (text)
	local length = string.len(text)
	local index = 1
	local num_chars = 0
	local _ = nil

	while index <= length do
		_, index = Utf8.location(text, index)
		num_chars = num_chars + 1
	end

	return num_chars
end

UTF8Utils.sub_string = function (text, from, to)
	if to == 0 or text == "" then
		return ""
	end

	local length = string.len(text)
	local tmp_byte_from, tmp_byte_to, byte_from, byte_to = nil
	local index = 1
	local i = 1

	while length >= i do
		tmp_byte_from, tmp_byte_to = Utf8.location(text, i)

		if index == from then
			byte_from = tmp_byte_from
		end

		if index == to then
			byte_to = tmp_byte_to - 1
		end

		index = index + 1
		i = tmp_byte_to
	end

	if byte_from and byte_to then
		return string.sub(text, byte_from, byte_to)
	elseif byte_from then
		return string.sub(text, byte_from)
	else
		return ""
	end
end

return
