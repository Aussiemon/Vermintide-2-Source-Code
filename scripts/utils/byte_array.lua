﻿-- chunkname: @scripts/utils/byte_array.lua

local ByteArray = {
	write_int32 = function (array, value, index)
		fassert(value <= 2147483647 and value >= -2147483648 and value % 1 == 0, "number %f has to be within the 32bit signed range", value)

		index = index or #array + 1
		value = bit.tobit(value)

		local first_byte = bit.band(value, 255)
		local second_byte = bit.rshift(bit.band(value, 65280), 8)
		local third_byte = bit.rshift(bit.band(value, 16711680), 16)
		local fourth_byte = bit.rshift(bit.band(value, 4278190080), 24)

		array[index] = first_byte
		index = index + 1
		array[index] = second_byte
		index = index + 1
		array[index] = third_byte
		index = index + 1
		array[index] = fourth_byte
		index = index + 1

		return array, index
	end,
	read_int32 = function (array, index)
		index = index or 1

		local first_byte = array[index]

		index = index + 1

		local second_byte = bit.lshift(array[index], 8)

		index = index + 1

		local third_byte = bit.lshift(array[index], 16)

		index = index + 1

		local fourth_byte = bit.lshift(array[index], 24)

		index = index + 1

		return bit.bor(first_byte, second_byte, third_byte, fourth_byte), index
	end,
	read_string = function (array, start_index, end_index)
		start_index = start_index or 1
		end_index = end_index or #array

		local char_array = {}

		for i = start_index, end_index do
			char_array[#char_array + 1] = string.char(array[i])
		end

		return table.concat(char_array), end_index + 1
	end,
	write_string = function (array, str, start_index, str_start_index, str_end_index)
		start_index = start_index or 1
		str_start_index = str_start_index or 1
		str_end_index = str_end_index or #str

		for i = str_start_index, str_end_index do
			array[start_index + i - 1] = string.byte(str, i)
		end

		return array, str_end_index + 1
	end,
}

return ByteArray
