IrcUtils = {
	convert_steam_user_id_to_base_64 = function (steam_user_id)
		local base_64_table = {
			"0",
			"1",
			"2",
			"3",
			"4",
			"5",
			"6",
			"7",
			"8",
			"9",
			"A",
			"B",
			"C",
			"D",
			"E",
			"F",
			"G",
			"H",
			"I",
			"J",
			"K",
			"L",
			"M",
			"N",
			"O",
			"P",
			"Q",
			"R",
			"S",
			"T",
			"U",
			"V",
			"W",
			"X",
			"Y",
			"Z",
			"a",
			"b",
			"c",
			"d",
			"e",
			"f",
			"g",
			"h",
			"i",
			"j",
			"k",
			"l",
			"m",
			"n",
			"o",
			"p",
			"q",
			"r",
			"s",
			"t",
			"u",
			"v",
			"w",
			"x",
			"y",
			"z",
			"[",
			"]"
		}
		local steam_user_id_base_10 = Application.hex64_to_dec(steam_user_id)
		local values = Math.base_10_to_base(steam_user_id_base_10, 64)

		table.reverse(values)

		local str = ""

		for _, value in ipairs(values) do
			local index = tonumber(value) + 1
			str = str .. base_64_table[index]
		end

		return str
	end
}

return
