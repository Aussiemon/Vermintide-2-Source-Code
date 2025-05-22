-- chunkname: @scripts/utils/byte_array.lua

local ByteArray

ByteArray = {
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
	write_uint8 = function (array, value, index)
		fassert(value % 1 == 0, "number %f must be an integer", value)
		fassert(value >= 0 and value <= 255, "number %d has to be within the 8bit unsigned range", value)

		index = index or #array + 1
		array[index] = value

		return array, index + 1
	end,
	read_uint8 = function (array, index)
		return array[index or 1], index + 1
	end,
	pack_uint8 = function (number, value, index)
		index = index or 1
		number = number or 0
		number = bit.bor(number, bit.lshift(value, (index - 1) * 8))

		return number, index + 1
	end,
	unpack_uint8 = function (number, index)
		index = index or 1

		local value = bit.rshift(number, (index - 1) * 8)

		value = bit.band(value, 255)

		return value, index + 1
	end,
	pack_uint16 = function (number, value, index)
		index = index or 1
		number = number or 0
		number = bit.bor(number, bit.lshift(value, (index - 1) * 16))

		return number, index + 1
	end,
	unpack_uint16 = function (number, index)
		index = index or 1

		fassert(index >= 1 and index <= 2, "unpacking uint16 out of bounds")

		local value = bit.rshift(number, (index - 1) * 16)

		value = bit.band(value, 65535)

		return value, index + 1
	end,
	write_uint16 = function (array, value, index)
		fassert(value % 1 == 0, "number %f must be an integer", value)
		fassert(value >= 0 and value <= 65535, "number %d has to be within the 8bit unsigned range", value)

		index = index or 1
		array[index] = ByteArray.unpack_uint8(value, 1)
		index = index + 1
		array[index] = ByteArray.unpack_uint8(value, 2)
		index = index + 1

		return array, index
	end,
	read_uint16 = function (array, index)
		index = index or 1

		local first_byte = ByteArray.pack_uint8(0, array[index], 1)

		index = index + 1

		local second_byte = ByteArray.pack_uint8(0, array[index], 2)

		index = index + 1

		return bit.bor(first_byte, second_byte), index
	end,
	write_hash = function (array, value, index)
		index = index or #array + 1

		for i = 1, 16, 2 do
			local byte = tonumber(value:sub(i, i + 1), 16)

			array[index] = byte
			index = index + 1
		end

		return array, index
	end,
	read_hash = function (array, index)
		return string.format("%02x%02x%02x%02x%02x%02x%02x%02x", array[index], array[index + 1], array[index + 2], array[index + 3], array[index + 4], array[index + 5], array[index + 6], array[index + 7]), index + 8
	end,
	read_string = function (array, start_index, end_index, out_array)
		start_index = start_index or 1
		end_index = end_index or #array
		out_array = out_array or {}

		for i = start_index, end_index do
			out_array[i] = string.char(array[i])
		end

		return table.concat(out_array, "", 1, end_index), end_index + 1
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
