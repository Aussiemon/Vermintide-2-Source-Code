KeystrokeHelper = KeystrokeHelper or {}

KeystrokeHelper.num_utf8chars = function (text)
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

KeystrokeHelper.parse_strokes = function (text, index, mode, keystrokes)
	local text_table = KeystrokeHelper._build_utf8_table(text)

	for _, stroke in ipairs(keystrokes) do
		if type(stroke) == "string" then
			index, mode = KeystrokeHelper._add_character(text_table, stroke, index, mode)
		elseif stroke == Keyboard.ENTER then
			break
		elseif KeystrokeHelper[stroke] then
			index, mode = KeystrokeHelper[stroke](text_table, index, mode)
		end
	end

	local new_text = ""

	for _, text_snippet in ipairs(text_table) do
		new_text = new_text .. text_snippet
	end

	return new_text, index, mode
end

KeystrokeHelper._build_utf8_table = function (text, external_table)
	local text_table = external_table or {}
	local character_index = 1
	local index = 1
	local length = string.len(text)

	while index <= length do
		local start_index, end_index = Utf8.location(text, index)
		text_table[character_index] = string.sub(text, index, end_index - 1)
		character_index = character_index + 1
		index = end_index
	end

	return text_table
end

KeystrokeHelper._add_character = function (text_table, text, index, mode)
	if mode == "insert" then
		table.insert(text_table, index, text)
	else
		text_table[index] = text
	end

	return index + 1, mode
end

KeystrokeHelper[Keyboard.LEFT] = function (text_table, index, mode)
	return math.max(index - 1, 1), mode
end

KeystrokeHelper[Keyboard.RIGHT] = function (text_table, index, mode)
	return math.min(index + 1, #text_table + 1), mode
end

KeystrokeHelper[Keyboard.UP] = nil
KeystrokeHelper[Keyboard.DOWN] = nil

KeystrokeHelper[Keyboard.INSERT] = function (text_table, index, mode)
	return index, (mode == "insert" and "overwrite") or "insert"
end

KeystrokeHelper[Keyboard.HOME] = function (text_table, index, mode)
	return 1, mode
end

KeystrokeHelper[Keyboard.END] = function (text_table, index, mode)
	return #text_table + 1, mode
end

KeystrokeHelper[Keyboard.BACKSPACE] = function (text_table, index, mode)
	local backspace_index = index - 1

	if backspace_index < 1 then
		return index, mode
	end

	table.remove(text_table, backspace_index)

	return backspace_index, mode
end

KeystrokeHelper[Keyboard.TAB] = function (text_table, index, mode)
	return KeystrokeHelper._add_character(text_table, "\t", index, mode)
end

KeystrokeHelper[Keyboard.PAGE_UP] = nil
KeystrokeHelper[Keyboard.PAGE_DOWN] = nil
KeystrokeHelper[Keyboard.ESCAPE] = nil

KeystrokeHelper[Keyboard.DELETE] = function (text_table, index, mode)
	if text_table[index] then
		table.remove(text_table, index)
	end

	return index, mode
end

return
