-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
local LibDeflate = nil
local _VERSION = "1.0.2-release"
local _MAJOR = "LibDeflate"
local _MINOR = 3
local _COPYRIGHT = "LibDeflate " .. _VERSION .. " Copyright (C) 2018-2020 Haoqian He." .. " Licensed under the zlib License"
LibDeflate = {
	_VERSION = _VERSION,
	_MAJOR = _MAJOR,
	_MINOR = _MINOR,
	_COPYRIGHT = _COPYRIGHT
}
local assert = assert
local error = error
local pairs = pairs
local string_byte = string.byte
local string_char = string.char
local string_sub = string.sub
local table_concat = table.concat
local table_sort = table.sort
local tostring = tostring
local type = type
local _pow2 = {}
local _byte_to_char = {}
local _reverse_bits_tbl = {}
local _length_to_deflate_code = {}
local _length_to_deflate_extra_bits = {}
local _length_to_deflate_extra_bitlen = {}
local _dist256_to_deflate_code = {}
local _dist256_to_deflate_extra_bits = {}
local _dist256_to_deflate_extra_bitlen = {}
local _literal_deflate_code_to_base_len = {
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	10,
	11,
	13,
	15,
	17,
	19,
	23,
	27,
	31,
	35,
	43,
	51,
	59,
	67,
	83,
	99,
	115,
	131,
	163,
	195,
	227,
	258
}
local _literal_deflate_code_to_extra_bitlen = {
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	1,
	1,
	1,
	1,
	2,
	2,
	2,
	2,
	3,
	3,
	3,
	3,
	4,
	4,
	4,
	4,
	5,
	5,
	5,
	5,
	0
}
local _dist_deflate_code_to_base_dist = {
	[0] = 1,
	2,
	3,
	4,
	5,
	7,
	9,
	13,
	17,
	25,
	33,
	49,
	65,
	97,
	129,
	193,
	257,
	385,
	513,
	769,
	1025,
	1537,
	2049,
	3073,
	4097,
	6145,
	8193,
	12289,
	16385,
	24577
}
local _dist_deflate_code_to_extra_bitlen = {
	[0] = 0,
	0,
	0,
	0,
	1,
	1,
	2,
	2,
	3,
	3,
	4,
	4,
	5,
	5,
	6,
	6,
	7,
	7,
	8,
	8,
	9,
	9,
	10,
	10,
	11,
	11,
	12,
	12,
	13,
	13
}
local _rle_codes_huffman_bitlen_order = {
	16,
	17,
	18,
	0,
	8,
	7,
	9,
	6,
	10,
	5,
	11,
	4,
	12,
	3,
	13,
	2,
	14,
	1,
	15
}
local _fix_block_literal_huffman_code, _fix_block_literal_huffman_to_deflate_code, _fix_block_literal_huffman_bitlen, _fix_block_literal_huffman_bitlen_count, _fix_block_dist_huffman_code, _fix_block_dist_huffman_to_deflate_code, _fix_block_dist_huffman_bitlen, _fix_block_dist_huffman_bitlen_count = nil

for i = 0, 255, 1 do
	_byte_to_char[i] = string_char(i)
end

local pow = 1

for i = 0, 32, 1 do
	_pow2[i] = pow
	pow = pow * 2
end

for i = 1, 9, 1 do
	_reverse_bits_tbl[i] = {}

	for j = 0, _pow2[i + 1] - 1, 1 do
		local reverse = 0
		local value = j

		for _ = 1, i, 1 do
			reverse = reverse - reverse % 2 + (((reverse % 2 == 1 or value % 2 == 1) and 1) or 0)
			value = (value - value % 2) / 2
			reverse = reverse * 2
		end

		_reverse_bits_tbl[i][j] = (reverse - reverse % 2) / 2
	end
end

local a = 18
local b = 16
local c = 265
local bitlen = 1

for len = 3, 258, 1 do
	if len <= 10 then
		_length_to_deflate_code[len] = len + 254
		_length_to_deflate_extra_bitlen[len] = 0
	elseif len == 258 then
		_length_to_deflate_code[len] = 285
		_length_to_deflate_extra_bitlen[len] = 0
	else
		if a < len then
			a = a + b
			b = b * 2
			c = c + 4
			bitlen = bitlen + 1
		end

		local t = len - a - 1 + b / 2
		_length_to_deflate_code[len] = (t - t % (b / 8)) / (b / 8) + c
		_length_to_deflate_extra_bitlen[len] = bitlen
		_length_to_deflate_extra_bits[len] = t % (b / 8)
	end
end

_dist256_to_deflate_code[1] = 0
_dist256_to_deflate_code[2] = 1
_dist256_to_deflate_extra_bitlen[1] = 0
_dist256_to_deflate_extra_bitlen[2] = 0
local a = 3
local b = 4
local code = 2
local bitlen = 0

for dist = 3, 256, 1 do
	if b < dist then
		a = a * 2
		b = b * 2
		code = code + 2
		bitlen = bitlen + 1
	end

	_dist256_to_deflate_code[dist] = (dist <= a and code) or code + 1
	_dist256_to_deflate_extra_bitlen[dist] = (bitlen < 0 and 0) or bitlen

	if b >= 8 then
		_dist256_to_deflate_extra_bits[dist] = (dist - b / 2 - 1) % (b / 4)
	end
end

LibDeflate.Adler32 = function (self, str)
	if type(str) ~= "string" then
		error("Usage: LibDeflate:Adler32(str):" .. " 'str' - string expected got '%s'.":format(type(str)), 2)
	end

	local strlen = #str
	local i = 1
	local a = 1
	local b = 0

	while i <= strlen - 15 do
		local x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16 = string_byte(str, i, i + 15)
		b = (b + 16 * a + 16 * x1 + 15 * x2 + 14 * x3 + 13 * x4 + 12 * x5 + 11 * x6 + 10 * x7 + 9 * x8 + 8 * x9 + 7 * x10 + 6 * x11 + 5 * x12 + 4 * x13 + 3 * x14 + 2 * x15 + x16) % 65521
		a = (a + x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10 + x11 + x12 + x13 + x14 + x15 + x16) % 65521
		i = i + 16
	end

	while i <= strlen do
		local x = string_byte(str, i, i)
		a = (a + x) % 65521
		b = (b + a) % 65521
		i = i + 1
	end

	return (b * 65536 + a) % 4294967296.0
end

local function IsEqualAdler32(actual, expected)
	return actual % 4294967296.0 == expected % 4294967296.0
end

LibDeflate.CreateDictionary = function (self, str, strlen, adler32)
	if type(str) ~= "string" then
		error("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):" .. " 'str' - string expected got '%s'.":format(type(str)), 2)
	end

	if type(strlen) ~= "number" then
		error("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):" .. " 'strlen' - number expected got '%s'.":format(type(strlen)), 2)
	end

	if type(adler32) ~= "number" then
		error("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):" .. " 'adler32' - number expected got '%s'.":format(type(adler32)), 2)
	end

	if strlen ~= #str then
		error("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):" .. " 'strlen' does not match the actual length of 'str'." .. " 'strlen': %u, '#str': %u ." .. " Please check if 'str' is modified unintentionally.":format(strlen, #str))
	end

	if strlen == 0 then
		error("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):" .. " 'str' - Empty string is not allowed.", 2)
	end

	if strlen > 32768 then
		error("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):" .. " 'str' - string longer than 32768 bytes is not allowed." .. " Got %d bytes.":format(strlen), 2)
	end

	local actual_adler32 = self:Adler32(str)

	if not IsEqualAdler32(adler32, actual_adler32) then
		error("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):" .. " 'adler32' does not match the actual adler32 of 'str'." .. " 'adler32': %u, 'Adler32(str)': %u ." .. " Please check if 'str' is modified unintentionally.":format(adler32, actual_adler32))
	end

	local dictionary = {
		adler32 = adler32,
		hash_tables = {},
		string_table = {},
		strlen = strlen
	}
	local string_table = dictionary.string_table
	local hash_tables = dictionary.hash_tables
	string_table[1] = string_byte(str, 1, 1)
	string_table[2] = string_byte(str, 2, 2)

	if strlen >= 3 then
		local i = 1
		local hash = string_table[1] * 256 + string_table[2]

		while i <= strlen - 2 - 3 do
			local x1, x2, x3, x4 = string_byte(str, i + 2, i + 5)
			string_table[i + 2] = x1
			string_table[i + 3] = x2
			string_table[i + 4] = x3
			string_table[i + 5] = x4
			hash = (hash * 256 + x1) % 16777216
			local t = hash_tables[hash]

			if not t then
				t = {}
				hash_tables[hash] = t
			end

			t[#t + 1] = i - strlen
			i = i + 1
			hash = (hash * 256 + x2) % 16777216
			t = hash_tables[hash]

			if not t then
				t = {}
				hash_tables[hash] = t
			end

			t[#t + 1] = i - strlen
			i = i + 1
			hash = (hash * 256 + x3) % 16777216
			t = hash_tables[hash]

			if not t then
				t = {}
				hash_tables[hash] = t
			end

			t[#t + 1] = i - strlen
			i = i + 1
			hash = (hash * 256 + x4) % 16777216
			t = hash_tables[hash]

			if not t then
				t = {}
				hash_tables[hash] = t
			end

			t[#t + 1] = i - strlen
			i = i + 1
		end

		while i <= strlen - 2 do
			local x = string_byte(str, i + 2)
			string_table[i + 2] = x
			hash = (hash * 256 + x) % 16777216
			local t = hash_tables[hash]

			if not t then
				t = {}
				hash_tables[hash] = t
			end

			t[#t + 1] = i - strlen
			i = i + 1
		end
	end

	return dictionary
end

local function IsValidDictionary(dictionary)
	if type(dictionary) ~= "table" then
		return false, "'dictionary' - table expected got '%s'.":format(type(dictionary))
	end

	if type(dictionary.adler32) ~= "number" or type(dictionary.string_table) ~= "table" or type(dictionary.strlen) ~= "number" or dictionary.strlen <= 0 or dictionary.strlen > 32768 or dictionary.strlen ~= #dictionary.string_table or type(dictionary.hash_tables) ~= "table" then
		return false, "'dictionary' - corrupted dictionary.":format(type(dictionary))
	end

	return true, ""
end

local _compression_level_configs = {
	[0] = {
		false,
		nil,
		0,
		0,
		0
	},
	{
		false,
		nil,
		4,
		8,
		4
	},
	{
		false,
		nil,
		5,
		18,
		8
	},
	{
		false,
		nil,
		6,
		32,
		32
	},
	{
		true,
		4,
		4,
		16,
		16
	},
	{
		true,
		8,
		16,
		32,
		32
	},
	{
		true,
		8,
		16,
		128,
		128
	},
	{
		true,
		8,
		32,
		128,
		256
	},
	{
		true,
		32,
		128,
		258,
		1024
	},
	{
		true,
		32,
		258,
		258,
		4096
	}
}

local function IsValidArguments(str, check_dictionary, dictionary, check_configs, configs)
	if type(str) ~= "string" then
		return false, "'str' - string expected got '%s'.":format(type(str))
	end

	if check_dictionary then
		local dict_valid, dict_err = IsValidDictionary(dictionary)

		if not dict_valid then
			return false, dict_err
		end
	end

	if check_configs then
		local type_configs = type(configs)

		if type_configs ~= "nil" and type_configs ~= "table" then
			return false, "'configs' - nil or table expected got '%s'.":format(type(configs))
		end

		if type_configs == "table" then
			for k, v in pairs(configs) do
				if k ~= "level" and k ~= "strategy" then
					return false, "'configs' - unsupported table key in the configs: '%s'.":format(k)
				elseif k == "level" and not _compression_level_configs[v] then
					return false, "'configs' - unsupported 'level': %s.":format(tostring(v))
				elseif k == "strategy" and v ~= "fixed" and v ~= "huffman_only" and v ~= "dynamic" then
					return false, "'configs' - unsupported 'strategy': '%s'.":format(tostring(v))
				end
			end
		end
	end

	return true, ""
end

local _FLUSH_MODE_MEMORY_CLEANUP = 0
local _FLUSH_MODE_OUTPUT = 1
local _FLUSH_MODE_BYTE_BOUNDARY = 2
local _FLUSH_MODE_NO_FLUSH = 3

local function CreateWriter()
	local buffer_size = 0
	local cache = 0
	local cache_bitlen = 0
	local total_bitlen = 0
	local buffer = {}
	local result_buffer = {}

	local function WriteBits(value, bitlen)
		cache = cache + value * _pow2[cache_bitlen]
		cache_bitlen = cache_bitlen + bitlen
		total_bitlen = total_bitlen + bitlen

		if cache_bitlen >= 32 then
			buffer_size = buffer_size + 1
			buffer[buffer_size] = _byte_to_char[cache % 256] .. _byte_to_char[((cache - cache % 256) / 256) % 256] .. _byte_to_char[((cache - cache % 65536) / 65536) % 256] .. _byte_to_char[((cache - cache % 16777216) / 16777216) % 256]
			local rshift_mask = _pow2[32 - cache_bitlen + bitlen]
			cache = (value - value % rshift_mask) / rshift_mask
			cache_bitlen = cache_bitlen - 32
		end
	end

	local function WriteString(str)
		for _ = 1, cache_bitlen, 8 do
			buffer_size = buffer_size + 1
			buffer[buffer_size] = string_char(cache % 256)
			cache = (cache - cache % 256) / 256
		end

		cache_bitlen = 0
		buffer_size = buffer_size + 1
		buffer[buffer_size] = str
		total_bitlen = total_bitlen + #str * 8
	end

	local function FlushWriter(mode)
		if mode == _FLUSH_MODE_NO_FLUSH then
			return total_bitlen
		end

		if mode == _FLUSH_MODE_OUTPUT or mode == _FLUSH_MODE_BYTE_BOUNDARY then
			local padding_bitlen = (8 - cache_bitlen % 8) % 8

			if cache_bitlen > 0 then
				cache = cache - _pow2[cache_bitlen] + _pow2[cache_bitlen + padding_bitlen]

				for _ = 1, cache_bitlen, 8 do
					buffer_size = buffer_size + 1
					buffer[buffer_size] = _byte_to_char[cache % 256]
					cache = (cache - cache % 256) / 256
				end

				cache = 0
				cache_bitlen = 0
			end

			if mode == _FLUSH_MODE_BYTE_BOUNDARY then
				total_bitlen = total_bitlen + padding_bitlen

				return total_bitlen
			end
		end

		local flushed = table_concat(buffer)
		buffer = {}
		buffer_size = 0
		result_buffer[#result_buffer + 1] = flushed

		if mode == _FLUSH_MODE_MEMORY_CLEANUP then
			return total_bitlen
		else
			return total_bitlen, table_concat(result_buffer)
		end
	end

	return WriteBits, WriteString, FlushWriter
end

local function MinHeapPush(heap, e, heap_size)
	heap_size = heap_size + 1
	heap[heap_size] = e
	local value = e[1]
	local pos = heap_size
	local parent_pos = (pos - pos % 2) / 2

	while parent_pos >= 1 and value < heap[parent_pos][1] do
		local t = heap[parent_pos]
		heap[parent_pos] = e
		heap[pos] = t
		pos = parent_pos
		parent_pos = (parent_pos - parent_pos % 2) / 2
	end
end

local function MinHeapPop(heap, heap_size)
	local top = heap[1]
	local e = heap[heap_size]
	local value = e[1]
	heap[1] = e
	heap[heap_size] = top
	heap_size = heap_size - 1
	local pos = 1
	local left_child_pos = pos * 2
	local right_child_pos = left_child_pos + 1

	while left_child_pos <= heap_size do
		local left_child = heap[left_child_pos]

		if right_child_pos <= heap_size and heap[right_child_pos][1] < left_child[1] then
			local right_child = heap[right_child_pos]

			if right_child[1] < value then
				heap[right_child_pos] = e
				heap[pos] = right_child
				pos = right_child_pos
				left_child_pos = pos * 2
				right_child_pos = left_child_pos + 1
			else
				break
			end
		elseif left_child[1] < value then
			heap[left_child_pos] = e
			heap[pos] = left_child
			pos = left_child_pos
			left_child_pos = pos * 2
			right_child_pos = left_child_pos + 1
		else
			break
		end
	end

	return top
end

local function GetHuffmanCodeFromBitlen(bitlen_counts, symbol_bitlens, max_symbol, max_bitlen)
	local huffman_code = 0
	local next_codes = {}
	local symbol_huffman_codes = {}

	for bitlen = 1, max_bitlen, 1 do
		huffman_code = (huffman_code + (bitlen_counts[bitlen - 1] or 0)) * 2
		next_codes[bitlen] = huffman_code
	end

	for symbol = 0, max_symbol, 1 do
		local bitlen = symbol_bitlens[symbol]

		if bitlen then
			huffman_code = next_codes[bitlen]
			next_codes[bitlen] = huffman_code + 1

			if bitlen <= 9 then
				symbol_huffman_codes[symbol] = _reverse_bits_tbl[bitlen][huffman_code]
			else
				local reverse = 0

				for _ = 1, bitlen, 1 do
					reverse = reverse - reverse % 2 + (((reverse % 2 == 1 or huffman_code % 2 == 1) and 1) or 0)
					huffman_code = (huffman_code - huffman_code % 2) / 2
					reverse = reverse * 2
				end

				symbol_huffman_codes[symbol] = (reverse - reverse % 2) / 2
			end
		end
	end

	return symbol_huffman_codes
end

local function SortByFirstThenSecond(a, b)
	return a[1] < b[1] or (a[1] == b[1] and a[2] < b[2])
end

local function GetHuffmanBitlenAndCode(symbol_counts, max_bitlen, max_symbol)
	local heap_size = nil
	local max_non_zero_bitlen_symbol = -1
	local leafs = {}
	local heap = {}
	local symbol_bitlens = {}
	local symbol_codes = {}
	local bitlen_counts = {}
	local number_unique_symbols = 0

	for symbol, count in pairs(symbol_counts) do
		number_unique_symbols = number_unique_symbols + 1
		leafs[number_unique_symbols] = {
			count,
			symbol
		}
	end

	if number_unique_symbols == 0 then
		return {}, {}, -1
	elseif number_unique_symbols == 1 then
		local symbol = leafs[1][2]
		symbol_bitlens[symbol] = 1
		symbol_codes[symbol] = 0

		return symbol_bitlens, symbol_codes, symbol
	else
		table_sort(leafs, SortByFirstThenSecond)

		heap_size = number_unique_symbols

		for i = 1, heap_size, 1 do
			heap[i] = leafs[i]
		end

		while heap_size > 1 do
			local leftChild = MinHeapPop(heap, heap_size)
			heap_size = heap_size - 1
			local rightChild = MinHeapPop(heap, heap_size)
			heap_size = heap_size - 1
			local newNode = {
				leftChild[1] + rightChild[1],
				-1,
				leftChild,
				rightChild
			}

			MinHeapPush(heap, newNode, heap_size)

			heap_size = heap_size + 1
		end

		local number_bitlen_overflow = 0
		local fifo = {
			heap[1],
			0,
			0,
			0
		}
		local fifo_size = 1
		local index = 1
		heap[1][1] = 0

		while index <= fifo_size do
			local e = fifo[index]
			local bitlen = e[1]
			local symbol = e[2]
			local left_child = e[3]
			local right_child = e[4]

			if left_child then
				fifo_size = fifo_size + 1
				fifo[fifo_size] = left_child
				left_child[1] = bitlen + 1
			end

			if right_child then
				fifo_size = fifo_size + 1
				fifo[fifo_size] = right_child
				right_child[1] = bitlen + 1
			end

			index = index + 1

			if max_bitlen < bitlen then
				number_bitlen_overflow = number_bitlen_overflow + 1
				bitlen = max_bitlen
			end

			if symbol >= 0 then
				symbol_bitlens[symbol] = bitlen

				if max_non_zero_bitlen_symbol < symbol then
					max_non_zero_bitlen_symbol = symbol or max_non_zero_bitlen_symbol
				end

				bitlen_counts[bitlen] = (bitlen_counts[bitlen] or 0) + 1
			end
		end

		if number_bitlen_overflow > 0 then
			repeat
				local bitlen = max_bitlen - 1

				while not bitlen_counts[bitlen] do
					slot16 = 0

					if slot16 == 0 and true then
						bitlen = bitlen - 1
					end
				end

				bitlen_counts[bitlen] = bitlen_counts[bitlen] - 1
				bitlen_counts[bitlen + 1] = (bitlen_counts[bitlen + 1] or 0) + 2
				bitlen_counts[max_bitlen] = bitlen_counts[max_bitlen] - 1
				number_bitlen_overflow = number_bitlen_overflow - 2
			until number_bitlen_overflow <= 0

			index = 1

			for bitlen = max_bitlen, 1, -1 do
				local n = bitlen_counts[bitlen] or 0

				while n > 0 do
					local symbol = leafs[index][2]
					symbol_bitlens[symbol] = bitlen
					n = n - 1
					index = index + 1
				end
			end
		end

		symbol_codes = GetHuffmanCodeFromBitlen(bitlen_counts, symbol_bitlens, max_symbol, max_bitlen)

		return symbol_bitlens, symbol_codes, max_non_zero_bitlen_symbol
	end
end

local function RunLengthEncodeHuffmanBitlen(lcode_bitlens, max_non_zero_bitlen_lcode, dcode_bitlens, max_non_zero_bitlen_dcode)
	local rle_code_tblsize = 0
	local rle_codes = {}
	local rle_code_counts = {}
	local rle_extra_bits_tblsize = 0
	local rle_extra_bits = {}
	local prev = nil
	local count = 0

	if max_non_zero_bitlen_dcode < 0 then
		max_non_zero_bitlen_dcode = 0
	end

	local max_code = max_non_zero_bitlen_lcode + max_non_zero_bitlen_dcode + 1

	for code = 0, max_code + 1, 1 do
		local len = (code <= max_non_zero_bitlen_lcode and (lcode_bitlens[code] or 0)) or (code <= max_code and (dcode_bitlens[code - max_non_zero_bitlen_lcode - 1] or 0)) or nil

		if len == prev then
			count = count + 1

			if len ~= 0 and count == 6 then
				rle_code_tblsize = rle_code_tblsize + 1
				rle_codes[rle_code_tblsize] = 16
				rle_extra_bits_tblsize = rle_extra_bits_tblsize + 1
				rle_extra_bits[rle_extra_bits_tblsize] = 3
				rle_code_counts[16] = (rle_code_counts[16] or 0) + 1
				count = 0
			elseif len == 0 and count == 138 then
				rle_code_tblsize = rle_code_tblsize + 1
				rle_codes[rle_code_tblsize] = 18
				rle_extra_bits_tblsize = rle_extra_bits_tblsize + 1
				rle_extra_bits[rle_extra_bits_tblsize] = 127
				rle_code_counts[18] = (rle_code_counts[18] or 0) + 1
				count = 0
			end
		else
			if count == 1 then
				rle_code_tblsize = rle_code_tblsize + 1
				rle_codes[rle_code_tblsize] = prev
				rle_code_counts[prev] = (rle_code_counts[prev] or 0) + 1
			elseif count == 2 then
				rle_code_tblsize = rle_code_tblsize + 1
				rle_codes[rle_code_tblsize] = prev
				rle_code_tblsize = rle_code_tblsize + 1
				rle_codes[rle_code_tblsize] = prev
				rle_code_counts[prev] = (rle_code_counts[prev] or 0) + 2
			elseif count >= 3 then
				rle_code_tblsize = rle_code_tblsize + 1
				local rleCode = (prev ~= 0 and 16) or (count <= 10 and 17) or 18
				rle_codes[rle_code_tblsize] = rleCode
				rle_code_counts[rleCode] = (rle_code_counts[rleCode] or 0) + 1
				rle_extra_bits_tblsize = rle_extra_bits_tblsize + 1
				rle_extra_bits[rle_extra_bits_tblsize] = (count <= 10 and count - 3) or count - 11
			end

			prev = len

			if len and len ~= 0 then
				rle_code_tblsize = rle_code_tblsize + 1
				rle_codes[rle_code_tblsize] = len
				rle_code_counts[len] = (rle_code_counts[len] or 0) + 1
				count = 0
			else
				count = 1
			end
		end
	end

	return rle_codes, rle_extra_bits, rle_code_counts
end

local function LoadStringToTable(str, t, start, stop, offset)
	local i = start - offset

	while i <= stop - 15 - offset do
		t[i], t[i + 1], t[i + 2], t[i + 3], t[i + 4], t[i + 5], t[i + 6], t[i + 7], t[i + 8], t[i + 9], t[i + 10], t[i + 11], t[i + 12], t[i + 13], t[i + 14], t[i + 15] = string_byte(str, i + offset, i + 15 + offset)
		i = i + 16
	end

	while i <= stop - offset do
		t[i] = string_byte(str, i + offset, i + offset)
		i = i + 1
	end

	return t
end

local function GetBlockLZ77Result(level, string_table, hash_tables, block_start, block_end, offset, dictionary)
	local config = _compression_level_configs[level]
	local config_use_lazy = config[1]
	local config_good_prev_length = config[2]
	local config_max_lazy_match = config[3]
	local config_nice_length = config[4]
	local config_max_hash_chain = config[5]
	local config_max_insert_length = (not config_use_lazy and config_max_lazy_match) or 2147483646
	local config_good_hash_chain = config_max_hash_chain - config_max_hash_chain % 4 / 4
	local hash, dict_hash_tables, dict_string_table = nil
	local dict_string_len = 0

	if dictionary then
		dict_hash_tables = dictionary.hash_tables
		dict_string_table = dictionary.string_table
		dict_string_len = dictionary.strlen

		assert(block_start == 1)

		if block_start <= block_end and dict_string_len >= 2 then
			hash = dict_string_table[dict_string_len - 1] * 65536 + dict_string_table[dict_string_len] * 256 + string_table[1]
			local t = hash_tables[hash]

			if not t then
				t = {}
				hash_tables[hash] = t
			end

			t[#t + 1] = -1
		end

		if block_end >= block_start + 1 and dict_string_len >= 1 then
			hash = dict_string_table[dict_string_len] * 65536 + string_table[1] * 256 + string_table[2]
			local t = hash_tables[hash]

			if not t then
				t = {}
				hash_tables[hash] = t
			end

			t[#t + 1] = 0
		end
	end

	local dict_string_len_plus3 = dict_string_len + 3
	hash = (string_table[block_start - offset] or 0) * 256 + (string_table[(block_start + 1) - offset] or 0)
	local lcodes = {}
	local lcode_tblsize = 0
	local lcodes_counts = {}
	local dcodes = {}
	local dcodes_tblsize = 0
	local dcodes_counts = {}
	local lextra_bits = {}
	local lextra_bits_tblsize = 0
	local dextra_bits = {}
	local dextra_bits_tblsize = 0
	local match_available = false
	local prev_len, prev_dist = nil
	local cur_len = 0
	local cur_dist = 0
	local index = block_start
	local index_end = block_end + ((config_use_lazy and 1) or 0)

	while index <= index_end do
		local string_table_index = index - offset
		local offset_minus_three = offset - 3
		prev_len = cur_len
		prev_dist = cur_dist
		cur_len = 0
		hash = (hash * 256 + (string_table[string_table_index + 2] or 0)) % 16777216
		local chain_index, cur_chain = nil
		local hash_chain = hash_tables[hash]
		local chain_old_size = nil

		if not hash_chain then
			chain_old_size = 0
			hash_chain = {}
			hash_tables[hash] = hash_chain

			if dict_hash_tables then
				cur_chain = dict_hash_tables[hash]
				chain_index = (cur_chain and #cur_chain) or 0
			else
				chain_index = 0
			end
		else
			chain_old_size = #hash_chain
			cur_chain = hash_chain
			chain_index = chain_old_size
		end

		if index <= block_end then
			hash_chain[chain_old_size + 1] = index
		end

		if chain_index > 0 and block_end >= index + 2 and (not config_use_lazy or prev_len < config_max_lazy_match) then
			local depth = (config_use_lazy and config_good_prev_length <= prev_len and config_good_hash_chain) or config_max_hash_chain
			local max_len_minus_one = block_end - index

			if max_len_minus_one >= 257 then
				max_len_minus_one = 257
			end

			max_len_minus_one = max_len_minus_one + string_table_index
			local string_table_index_plus_three = string_table_index + 3

			while chain_index >= 1 and depth > 0 do
				local prev = cur_chain[chain_index]

				if index - prev > 32768 then
					break
				end

				if prev < index then
					local sj = string_table_index_plus_three

					if prev >= -257 then
						local pj = prev - offset_minus_three

						while sj <= max_len_minus_one and string_table[pj] == string_table[sj] do
							sj = sj + 1
							pj = pj + 1
						end
					else
						local pj = dict_string_len_plus3 + prev

						while sj <= max_len_minus_one and dict_string_table[pj] == string_table[sj] do
							sj = sj + 1
							pj = pj + 1
						end
					end

					local j = sj - string_table_index

					if cur_len < j then
						cur_len = j
						cur_dist = index - prev
					end

					if config_nice_length <= cur_len then
						break
					end
				end

				chain_index = chain_index - 1
				depth = depth - 1

				if chain_index == 0 and prev > 0 and dict_hash_tables then
					cur_chain = dict_hash_tables[hash]
					chain_index = (cur_chain and #cur_chain) or 0
				end
			end
		end

		if not config_use_lazy then
			prev_dist = cur_dist
			prev_len = cur_len
		end

		if (not config_use_lazy or match_available) and (prev_len > 3 or (prev_len == 3 and prev_dist < 4096)) and cur_len <= prev_len then
			local code = _length_to_deflate_code[prev_len]
			local length_extra_bits_bitlen = _length_to_deflate_extra_bitlen[prev_len]
			local dist_code, dist_extra_bits_bitlen, dist_extra_bits = nil

			if prev_dist <= 256 then
				dist_code = _dist256_to_deflate_code[prev_dist]
				dist_extra_bits = _dist256_to_deflate_extra_bits[prev_dist]
				dist_extra_bits_bitlen = _dist256_to_deflate_extra_bitlen[prev_dist]
			else
				dist_code = 16
				dist_extra_bits_bitlen = 7
				local a = 384
				local b = 512

				while true do
					if prev_dist <= a then
						dist_extra_bits = (prev_dist - b / 2 - 1) % (b / 4)

						break
					elseif prev_dist <= b then
						dist_extra_bits = (prev_dist - b / 2 - 1) % (b / 4)
						dist_code = dist_code + 1

						break
					else
						dist_code = dist_code + 2
						dist_extra_bits_bitlen = dist_extra_bits_bitlen + 1
						a = a * 2
						b = b * 2
					end
				end
			end

			lcode_tblsize = lcode_tblsize + 1
			lcodes[lcode_tblsize] = code
			lcodes_counts[code] = (lcodes_counts[code] or 0) + 1
			dcodes_tblsize = dcodes_tblsize + 1
			dcodes[dcodes_tblsize] = dist_code
			dcodes_counts[dist_code] = (dcodes_counts[dist_code] or 0) + 1

			if length_extra_bits_bitlen > 0 then
				local lenExtraBits = _length_to_deflate_extra_bits[prev_len]
				lextra_bits_tblsize = lextra_bits_tblsize + 1
				lextra_bits[lextra_bits_tblsize] = lenExtraBits
			end

			if dist_extra_bits_bitlen > 0 then
				dextra_bits_tblsize = dextra_bits_tblsize + 1
				dextra_bits[dextra_bits_tblsize] = dist_extra_bits
			end

			slot48 = index + 1
			slot49 = index + prev_len
			slot50 = (config_use_lazy and 2) or 1

			for i = slot48, slot49 - slot50, 1 do
				hash = (hash * 256 + (string_table[i - offset + 2] or 0)) % 16777216

				if prev_len <= config_max_insert_length then
					hash_chain = hash_tables[hash]

					if not hash_chain then
						hash_chain = {}
						hash_tables[hash] = hash_chain
					end

					hash_chain[#hash_chain + 1] = i
				end
			end

			index = (index + prev_len) - ((config_use_lazy and 1) or 0)
			match_available = false
		elseif not config_use_lazy or match_available then
			local code = string_table[(config_use_lazy and string_table_index - 1) or string_table_index]
			lcode_tblsize = lcode_tblsize + 1
			lcodes[lcode_tblsize] = code
			lcodes_counts[code] = (lcodes_counts[code] or 0) + 1
			index = index + 1
		else
			match_available = true
			index = index + 1
		end
	end

	lcode_tblsize = lcode_tblsize + 1
	lcodes[lcode_tblsize] = 256
	lcodes_counts[256] = (lcodes_counts[256] or 0) + 1

	return lcodes, lextra_bits, lcodes_counts, dcodes, dextra_bits, dcodes_counts
end

local function GetBlockDynamicHuffmanHeader(lcodes_counts, dcodes_counts)
	local lcodes_huffman_bitlens, lcodes_huffman_codes, max_non_zero_bitlen_lcode = GetHuffmanBitlenAndCode(lcodes_counts, 15, 285)
	local dcodes_huffman_bitlens, dcodes_huffman_codes, max_non_zero_bitlen_dcode = GetHuffmanBitlenAndCode(dcodes_counts, 15, 29)
	local rle_deflate_codes, rle_extra_bits, rle_codes_counts = RunLengthEncodeHuffmanBitlen(lcodes_huffman_bitlens, max_non_zero_bitlen_lcode, dcodes_huffman_bitlens, max_non_zero_bitlen_dcode)
	local rle_codes_huffman_bitlens, rle_codes_huffman_codes = GetHuffmanBitlenAndCode(rle_codes_counts, 7, 18)
	local HCLEN = 0

	for i = 1, 19, 1 do
		local symbol = _rle_codes_huffman_bitlen_order[i]
		local length = rle_codes_huffman_bitlens[symbol] or 0

		if length ~= 0 then
			HCLEN = i
		end
	end

	HCLEN = HCLEN - 4
	local HLIT = (max_non_zero_bitlen_lcode + 1) - 257
	local HDIST = (max_non_zero_bitlen_dcode + 1) - 1

	if HDIST < 0 then
		HDIST = 0
	end

	return HLIT, HDIST, HCLEN, rle_codes_huffman_bitlens, rle_codes_huffman_codes, rle_deflate_codes, rle_extra_bits, lcodes_huffman_bitlens, lcodes_huffman_codes, dcodes_huffman_bitlens, dcodes_huffman_codes
end

local function GetDynamicHuffmanBlockSize(lcodes, dcodes, HCLEN, rle_codes_huffman_bitlens, rle_deflate_codes, lcodes_huffman_bitlens, dcodes_huffman_bitlens)
	local block_bitlen = 17
	block_bitlen = block_bitlen + (HCLEN + 4) * 3

	for i = 1, #rle_deflate_codes, 1 do
		local code = rle_deflate_codes[i]
		block_bitlen = block_bitlen + rle_codes_huffman_bitlens[code]

		if code >= 16 then
			block_bitlen = block_bitlen + ((code == 16 and 2) or (code == 17 and 3) or 7)
		end
	end

	local length_code_count = 0

	for i = 1, #lcodes, 1 do
		local code = lcodes[i]
		local huffman_bitlen = lcodes_huffman_bitlens[code]
		block_bitlen = block_bitlen + huffman_bitlen

		if code > 256 then
			length_code_count = length_code_count + 1

			if code > 264 and code < 285 then
				local extra_bits_bitlen = _literal_deflate_code_to_extra_bitlen[code - 256]
				block_bitlen = block_bitlen + extra_bits_bitlen
			end

			local dist_code = dcodes[length_code_count]
			local dist_huffman_bitlen = dcodes_huffman_bitlens[dist_code]
			block_bitlen = block_bitlen + dist_huffman_bitlen

			if dist_code > 3 then
				local dist_extra_bits_bitlen = (dist_code - dist_code % 2) / 2 - 1
				block_bitlen = block_bitlen + dist_extra_bits_bitlen
			end
		end
	end

	return block_bitlen
end

local function CompressDynamicHuffmanBlock(WriteBits, is_last_block, lcodes, lextra_bits, dcodes, dextra_bits, HLIT, HDIST, HCLEN, rle_codes_huffman_bitlens, rle_codes_huffman_codes, rle_deflate_codes, rle_extra_bits, lcodes_huffman_bitlens, lcodes_huffman_codes, dcodes_huffman_bitlens, dcodes_huffman_codes)
	WriteBits((is_last_block and 1) or 0, 1)
	WriteBits(2, 2)
	WriteBits(HLIT, 5)
	WriteBits(HDIST, 5)
	WriteBits(HCLEN, 4)

	for i = 1, HCLEN + 4, 1 do
		local symbol = _rle_codes_huffman_bitlen_order[i]
		local length = rle_codes_huffman_bitlens[symbol] or 0

		WriteBits(length, 3)
	end

	local rleExtraBitsIndex = 1

	for i = 1, #rle_deflate_codes, 1 do
		local code = rle_deflate_codes[i]

		WriteBits(rle_codes_huffman_codes[code], rle_codes_huffman_bitlens[code])

		if code >= 16 then
			local extraBits = rle_extra_bits[rleExtraBitsIndex]

			WriteBits(extraBits, (code == 16 and 2) or (code == 17 and 3) or 7)

			rleExtraBitsIndex = rleExtraBitsIndex + 1
		end
	end

	local length_code_count = 0
	local length_code_with_extra_count = 0
	local dist_code_with_extra_count = 0

	for i = 1, #lcodes, 1 do
		local deflate_codee = lcodes[i]
		local huffman_code = lcodes_huffman_codes[deflate_codee]
		local huffman_bitlen = lcodes_huffman_bitlens[deflate_codee]

		WriteBits(huffman_code, huffman_bitlen)

		if deflate_codee > 256 then
			length_code_count = length_code_count + 1

			if deflate_codee > 264 and deflate_codee < 285 then
				length_code_with_extra_count = length_code_with_extra_count + 1
				local extra_bits = lextra_bits[length_code_with_extra_count]
				local extra_bits_bitlen = _literal_deflate_code_to_extra_bitlen[deflate_codee - 256]

				WriteBits(extra_bits, extra_bits_bitlen)
			end

			local dist_deflate_code = dcodes[length_code_count]
			local dist_huffman_code = dcodes_huffman_codes[dist_deflate_code]
			local dist_huffman_bitlen = dcodes_huffman_bitlens[dist_deflate_code]

			WriteBits(dist_huffman_code, dist_huffman_bitlen)

			if dist_deflate_code > 3 then
				dist_code_with_extra_count = dist_code_with_extra_count + 1
				local dist_extra_bits = dextra_bits[dist_code_with_extra_count]
				local dist_extra_bits_bitlen = (dist_deflate_code - dist_deflate_code % 2) / 2 - 1

				WriteBits(dist_extra_bits, dist_extra_bits_bitlen)
			end
		end
	end
end

local function GetFixedHuffmanBlockSize(lcodes, dcodes)
	local block_bitlen = 3
	local length_code_count = 0

	for i = 1, #lcodes, 1 do
		local code = lcodes[i]
		local huffman_bitlen = _fix_block_literal_huffman_bitlen[code]
		block_bitlen = block_bitlen + huffman_bitlen

		if code > 256 then
			length_code_count = length_code_count + 1

			if code > 264 and code < 285 then
				local extra_bits_bitlen = _literal_deflate_code_to_extra_bitlen[code - 256]
				block_bitlen = block_bitlen + extra_bits_bitlen
			end

			local dist_code = dcodes[length_code_count]
			block_bitlen = block_bitlen + 5

			if dist_code > 3 then
				local dist_extra_bits_bitlen = (dist_code - dist_code % 2) / 2 - 1
				block_bitlen = block_bitlen + dist_extra_bits_bitlen
			end
		end
	end

	return block_bitlen
end

local function CompressFixedHuffmanBlock(WriteBits, is_last_block, lcodes, lextra_bits, dcodes, dextra_bits)
	WriteBits((is_last_block and 1) or 0, 1)
	WriteBits(1, 2)

	local length_code_count = 0
	local length_code_with_extra_count = 0
	local dist_code_with_extra_count = 0

	for i = 1, #lcodes, 1 do
		local deflate_code = lcodes[i]
		local huffman_code = _fix_block_literal_huffman_code[deflate_code]
		local huffman_bitlen = _fix_block_literal_huffman_bitlen[deflate_code]

		WriteBits(huffman_code, huffman_bitlen)

		if deflate_code > 256 then
			length_code_count = length_code_count + 1

			if deflate_code > 264 and deflate_code < 285 then
				length_code_with_extra_count = length_code_with_extra_count + 1
				local extra_bits = lextra_bits[length_code_with_extra_count]
				local extra_bits_bitlen = _literal_deflate_code_to_extra_bitlen[deflate_code - 256]

				WriteBits(extra_bits, extra_bits_bitlen)
			end

			local dist_code = dcodes[length_code_count]
			local dist_huffman_code = _fix_block_dist_huffman_code[dist_code]

			WriteBits(dist_huffman_code, 5)

			if dist_code > 3 then
				dist_code_with_extra_count = dist_code_with_extra_count + 1
				local dist_extra_bits = dextra_bits[dist_code_with_extra_count]
				local dist_extra_bits_bitlen = (dist_code - dist_code % 2) / 2 - 1

				WriteBits(dist_extra_bits, dist_extra_bits_bitlen)
			end
		end
	end
end

local function GetStoreBlockSize(block_start, block_end, total_bitlen)
	assert(block_end - block_start + 1 <= 65535)

	local block_bitlen = 3
	total_bitlen = total_bitlen + 3
	local padding_bitlen = (8 - total_bitlen % 8) % 8
	block_bitlen = block_bitlen + padding_bitlen
	block_bitlen = block_bitlen + 32
	block_bitlen = block_bitlen + (block_end - block_start + 1) * 8

	return block_bitlen
end

local function CompressStoreBlock(WriteBits, WriteString, is_last_block, str, block_start, block_end, total_bitlen)
	assert(block_end - block_start + 1 <= 65535)
	WriteBits((is_last_block and 1) or 0, 1)
	WriteBits(0, 2)

	total_bitlen = total_bitlen + 3
	local padding_bitlen = (8 - total_bitlen % 8) % 8

	if padding_bitlen > 0 then
		WriteBits(_pow2[padding_bitlen] - 1, padding_bitlen)
	end

	local size = block_end - block_start + 1

	WriteBits(size, 16)

	local comp = 255 - size % 256 + (255 - (size - size % 256) / 256) * 256

	WriteBits(comp, 16)
	WriteString(str:sub(block_start, block_end))
end

local function Deflate(configs, WriteBits, WriteString, FlushWriter, str, dictionary)
	local string_table = {}
	local hash_tables = {}
	local is_last_block, block_start, block_end, bitlen_written = nil
	local total_bitlen = FlushWriter(_FLUSH_MODE_NO_FLUSH)
	local strlen = #str
	local offset, level, strategy = nil

	if configs then
		if configs.level then
			level = configs.level
		end

		if configs.strategy then
			strategy = configs.strategy
		end
	end

	level = level or (strlen < 2048 and 7) or (strlen > 65536 and 3) or 5

	while not is_last_block do
		if not block_start then
			block_start = 1
			block_end = 65535
			offset = 0
		else
			block_start = block_end + 1
			block_end = block_end + 32768
			offset = block_start - 32768 - 1
		end

		if strlen <= block_end then
			block_end = strlen
			is_last_block = true
		else
			is_last_block = false
		end

		local lcodes, lextra_bits, lcodes_counts, dcodes, dextra_bits, dcodes_counts, HLIT, HDIST, HCLEN, rle_codes_huffman_bitlens, rle_codes_huffman_codes, rle_deflate_codes, rle_extra_bits, lcodes_huffman_bitlens, lcodes_huffman_codes, dcodes_huffman_bitlens, dcodes_huffman_codes, dynamic_block_bitlen, fixed_block_bitlen, store_block_bitlen = nil

		if level ~= 0 then
			LoadStringToTable(str, string_table, block_start, block_end + 3, offset)

			if block_start == 1 and dictionary then
				local dict_string_table = dictionary.string_table
				local dict_strlen = dictionary.strlen
				slot39 = 0
				slot40 = (-dict_strlen + 1 < -257 and -257) or -dict_strlen + 1

				for i = slot39, slot40, -1 do
					string_table[i] = dict_string_table[dict_strlen + i]
				end
			end

			if strategy == "huffman_only" then
				lcodes = {}

				LoadStringToTable(str, lcodes, block_start, block_end, block_start - 1)

				lextra_bits = {}
				lcodes_counts = {}
				lcodes[block_end - block_start + 2] = 256

				for i = 1, block_end - block_start + 2, 1 do
					local code = lcodes[i]
					lcodes_counts[code] = (lcodes_counts[code] or 0) + 1
				end

				dcodes = {}
				dextra_bits = {}
				dcodes_counts = {}
			else
				lcodes, lextra_bits, lcodes_counts, dcodes, dextra_bits, dcodes_counts = GetBlockLZ77Result(level, string_table, hash_tables, block_start, block_end, offset, dictionary)
			end

			HLIT, HDIST, HCLEN, rle_codes_huffman_bitlens, rle_codes_huffman_codes, rle_deflate_codes, rle_extra_bits, lcodes_huffman_bitlens, lcodes_huffman_codes, dcodes_huffman_bitlens, dcodes_huffman_codes = GetBlockDynamicHuffmanHeader(lcodes_counts, dcodes_counts)
			dynamic_block_bitlen = GetDynamicHuffmanBlockSize(lcodes, dcodes, HCLEN, rle_codes_huffman_bitlens, rle_deflate_codes, lcodes_huffman_bitlens, dcodes_huffman_bitlens)
			fixed_block_bitlen = GetFixedHuffmanBlockSize(lcodes, dcodes)
		end

		store_block_bitlen = GetStoreBlockSize(block_start, block_end, total_bitlen)
		local min_bitlen = store_block_bitlen

		if fixed_block_bitlen and fixed_block_bitlen < min_bitlen then
			min_bitlen = fixed_block_bitlen or min_bitlen
		end

		if dynamic_block_bitlen and dynamic_block_bitlen < min_bitlen then
			min_bitlen = dynamic_block_bitlen or min_bitlen
		end

		if level == 0 or (strategy ~= "fixed" and strategy ~= "dynamic" and store_block_bitlen == min_bitlen) then
			CompressStoreBlock(WriteBits, WriteString, is_last_block, str, block_start, block_end, total_bitlen)

			total_bitlen = total_bitlen + store_block_bitlen
		elseif strategy ~= "dynamic" and (strategy == "fixed" or fixed_block_bitlen == min_bitlen) then
			CompressFixedHuffmanBlock(WriteBits, is_last_block, lcodes, lextra_bits, dcodes, dextra_bits)

			total_bitlen = total_bitlen + fixed_block_bitlen
		elseif strategy == "dynamic" or dynamic_block_bitlen == min_bitlen then
			CompressDynamicHuffmanBlock(WriteBits, is_last_block, lcodes, lextra_bits, dcodes, dextra_bits, HLIT, HDIST, HCLEN, rle_codes_huffman_bitlens, rle_codes_huffman_codes, rle_deflate_codes, rle_extra_bits, lcodes_huffman_bitlens, lcodes_huffman_codes, dcodes_huffman_bitlens, dcodes_huffman_codes)

			total_bitlen = total_bitlen + dynamic_block_bitlen
		end

		if is_last_block then
			bitlen_written = FlushWriter(_FLUSH_MODE_NO_FLUSH)
		else
			bitlen_written = FlushWriter(_FLUSH_MODE_MEMORY_CLEANUP)
		end

		assert(bitlen_written == total_bitlen)

		if not is_last_block then
			local j = nil

			if dictionary and block_start == 1 then
				j = 0

				while string_table[j] do
					string_table[j] = nil
					j = j - 1
				end
			end

			dictionary = nil
			j = 1

			for i = block_end - 32767, block_end, 1 do
				string_table[j] = string_table[i - offset]
				j = j + 1
			end

			for k, t in pairs(hash_tables) do
				local tSize = #t

				if tSize > 0 and (block_end + 1) - t[1] > 32768 then
					if tSize == 1 then
						hash_tables[k] = nil
					else
						local new = {}
						local newSize = 0

						for i = 2, tSize, 1 do
							j = t[i]

							if (block_end + 1) - j <= 32768 then
								newSize = newSize + 1
								new[newSize] = j
							end
						end

						hash_tables[k] = new
					end
				end
			end
		end
	end
end

local function CompressDeflateInternal(str, dictionary, configs)
	local WriteBits, WriteString, FlushWriter = CreateWriter()

	Deflate(configs, WriteBits, WriteString, FlushWriter, str, dictionary)

	local total_bitlen, result = FlushWriter(_FLUSH_MODE_OUTPUT)
	local padding_bitlen = (8 - total_bitlen % 8) % 8

	return result, padding_bitlen
end

local function CompressZlibInternal(str, dictionary, configs)
	local WriteBits, WriteString, FlushWriter = CreateWriter()
	local CM = 8
	local CINFO = 7
	local CMF = CINFO * 16 + CM

	WriteBits(CMF, 8)

	local FDIST = (dictionary and 1) or 0
	local FLEVEL = 2
	local FLG = FLEVEL * 64 + FDIST * 32
	local FCHECK = 31 - (CMF * 256 + FLG) % 31
	FLG = FLG + FCHECK

	WriteBits(FLG, 8)

	if FDIST == 1 then
		local adler32 = dictionary.adler32
		local byte0 = adler32 % 256
		adler32 = (adler32 - byte0) / 256
		local byte1 = adler32 % 256
		adler32 = (adler32 - byte1) / 256
		local byte2 = adler32 % 256
		adler32 = (adler32 - byte2) / 256
		local byte3 = adler32 % 256

		WriteBits(byte3, 8)
		WriteBits(byte2, 8)
		WriteBits(byte1, 8)
		WriteBits(byte0, 8)
	end

	Deflate(configs, WriteBits, WriteString, FlushWriter, str, dictionary)
	FlushWriter(_FLUSH_MODE_BYTE_BOUNDARY)

	local adler32 = LibDeflate:Adler32(str)
	local byte3 = adler32 % 256
	adler32 = (adler32 - byte3) / 256
	local byte2 = adler32 % 256
	adler32 = (adler32 - byte2) / 256
	local byte1 = adler32 % 256
	adler32 = (adler32 - byte1) / 256
	local byte0 = adler32 % 256

	WriteBits(byte0, 8)
	WriteBits(byte1, 8)
	WriteBits(byte2, 8)
	WriteBits(byte3, 8)

	local total_bitlen, result = FlushWriter(_FLUSH_MODE_OUTPUT)
	local padding_bitlen = (8 - total_bitlen % 8) % 8

	return result, padding_bitlen
end

LibDeflate.CompressDeflate = function (self, str, configs)
	local arg_valid, arg_err = IsValidArguments(str, false, nil, true, configs)

	if not arg_valid then
		error("Usage: LibDeflate:CompressDeflate(str, configs): " .. arg_err, 2)
	end

	return CompressDeflateInternal(str, nil, configs)
end

LibDeflate.CompressDeflateWithDict = function (self, str, dictionary, configs)
	local arg_valid, arg_err = IsValidArguments(str, true, dictionary, true, configs)

	if not arg_valid then
		error("Usage: LibDeflate:CompressDeflateWithDict" .. "(str, dictionary, configs): " .. arg_err, 2)
	end

	return CompressDeflateInternal(str, dictionary, configs)
end

LibDeflate.CompressZlib = function (self, str, configs)
	local arg_valid, arg_err = IsValidArguments(str, false, nil, true, configs)

	if not arg_valid then
		error("Usage: LibDeflate:CompressZlib(str, configs): " .. arg_err, 2)
	end

	return CompressZlibInternal(str, nil, configs)
end

LibDeflate.CompressZlibWithDict = function (self, str, dictionary, configs)
	local arg_valid, arg_err = IsValidArguments(str, true, dictionary, true, configs)

	if not arg_valid then
		error("Usage: LibDeflate:CompressZlibWithDict" .. "(str, dictionary, configs): " .. arg_err, 2)
	end

	return CompressZlibInternal(str, dictionary, configs)
end

local function CreateReader(input_string)
	local input = input_string
	local input_strlen = #input_string
	local input_next_byte_pos = 1
	local cache_bitlen = 0
	local cache = 0

	local function ReadBits(bitlen)
		local rshift_mask = _pow2[bitlen]
		local code = nil

		if bitlen <= cache_bitlen then
			code = cache % rshift_mask
			cache = (cache - code) / rshift_mask
			cache_bitlen = cache_bitlen - bitlen
		else
			local lshift_mask = _pow2[cache_bitlen]
			local byte1, byte2, byte3, byte4 = string_byte(input, input_next_byte_pos, input_next_byte_pos + 3)
			cache = cache + ((byte1 or 0) + (byte2 or 0) * 256 + (byte3 or 0) * 65536 + (byte4 or 0) * 16777216) * lshift_mask
			input_next_byte_pos = input_next_byte_pos + 4
			cache_bitlen = (cache_bitlen + 32) - bitlen
			code = cache % rshift_mask
			cache = (cache - code) / rshift_mask
		end

		return code
	end

	local function ReadBytes(bytelen, buffer, buffer_size)
		assert(cache_bitlen % 8 == 0)

		local byte_from_cache = (bytelen > cache_bitlen / 8 and cache_bitlen / 8) or bytelen

		for _ = 1, byte_from_cache, 1 do
			local byte = cache % 256
			buffer_size = buffer_size + 1
			buffer[buffer_size] = string_char(byte)
			cache = (cache - byte) / 256
		end

		cache_bitlen = cache_bitlen - byte_from_cache * 8
		bytelen = bytelen - byte_from_cache

		if (input_strlen - input_next_byte_pos - bytelen + 1) * 8 + cache_bitlen < 0 then
			return -1
		end

		for i = input_next_byte_pos, (input_next_byte_pos + bytelen) - 1, 1 do
			buffer_size = buffer_size + 1
			buffer[buffer_size] = string_sub(input, i, i)
		end

		input_next_byte_pos = input_next_byte_pos + bytelen

		return buffer_size
	end

	local function Decode(huffman_bitlen_counts, huffman_symbols, min_bitlen)
		local code = 0
		local first = 0
		local index = 0
		local count = nil

		if min_bitlen > 0 then
			if cache_bitlen < 15 and input then
				local lshift_mask = _pow2[cache_bitlen]
				local byte1, byte2, byte3, byte4 = string_byte(input, input_next_byte_pos, input_next_byte_pos + 3)
				cache = cache + ((byte1 or 0) + (byte2 or 0) * 256 + (byte3 or 0) * 65536 + (byte4 or 0) * 16777216) * lshift_mask
				input_next_byte_pos = input_next_byte_pos + 4
				cache_bitlen = cache_bitlen + 32
			end

			local rshift_mask = _pow2[min_bitlen]
			cache_bitlen = cache_bitlen - min_bitlen
			code = cache % rshift_mask
			cache = (cache - code) / rshift_mask
			code = _reverse_bits_tbl[min_bitlen][code]
			count = huffman_bitlen_counts[min_bitlen]

			if code < count then
				return huffman_symbols[code]
			end

			index = count
			first = count * 2
			code = code * 2
		end

		for bitlen = min_bitlen + 1, 15, 1 do
			local bit = nil
			bit = cache % 2
			cache = (cache - bit) / 2
			cache_bitlen = cache_bitlen - 1

			if bit == 1 then
				code = (code + 1) - code % 2
			end

			count = huffman_bitlen_counts[bitlen] or 0
			local diff = code - first

			if count > diff then
				return huffman_symbols[index + diff]
			end

			index = index + count
			first = first + count
			first = first * 2
			code = code * 2
		end

		return -10
	end

	local function ReaderBitlenLeft()
		return (input_strlen - input_next_byte_pos + 1) * 8 + cache_bitlen
	end

	local function SkipToByteBoundary()
		local skipped_bitlen = cache_bitlen % 8
		local rshift_mask = _pow2[skipped_bitlen]
		cache_bitlen = cache_bitlen - skipped_bitlen
		cache = (cache - cache % rshift_mask) / rshift_mask
	end

	return ReadBits, ReadBytes, Decode, ReaderBitlenLeft, SkipToByteBoundary
end

local function CreateDecompressState(str, dictionary)
	local ReadBits, ReadBytes, Decode, ReaderBitlenLeft, SkipToByteBoundary = CreateReader(str)
	local state = {
		buffer_size = 0,
		ReadBits = ReadBits,
		ReadBytes = ReadBytes,
		Decode = Decode,
		ReaderBitlenLeft = ReaderBitlenLeft,
		SkipToByteBoundary = SkipToByteBoundary,
		buffer = {},
		result_buffer = {},
		dictionary = dictionary
	}

	return state
end

local function GetHuffmanForDecode(huffman_bitlens, max_symbol, max_bitlen)
	local huffman_bitlen_counts = {}
	local min_bitlen = max_bitlen

	for symbol = 0, max_symbol, 1 do
		local bitlen = huffman_bitlens[symbol] or 0

		if bitlen > 0 and bitlen < min_bitlen then
			min_bitlen = bitlen or min_bitlen
		end

		huffman_bitlen_counts[bitlen] = (huffman_bitlen_counts[bitlen] or 0) + 1
	end

	if huffman_bitlen_counts[0] == max_symbol + 1 then
		return 0, huffman_bitlen_counts, {}, 0
	end

	local left = 1

	for len = 1, max_bitlen, 1 do
		left = left * 2
		left = left - (huffman_bitlen_counts[len] or 0)

		if left < 0 then
			return left
		end
	end

	local offsets = {
		0
	}

	for len = 1, max_bitlen - 1, 1 do
		offsets[len + 1] = offsets[len] + (huffman_bitlen_counts[len] or 0)
	end

	local huffman_symbols = {}

	for symbol = 0, max_symbol, 1 do
		local bitlen = huffman_bitlens[symbol] or 0

		if bitlen ~= 0 then
			local offset = offsets[bitlen]
			huffman_symbols[offset] = symbol
			offsets[bitlen] = offsets[bitlen] + 1
		end
	end

	return left, huffman_bitlen_counts, huffman_symbols, min_bitlen
end

local function DecodeUntilEndOfBlock(state, lcodes_huffman_bitlens, lcodes_huffman_symbols, lcodes_huffman_min_bitlen, dcodes_huffman_bitlens, dcodes_huffman_symbols, dcodes_huffman_min_bitlen)
	local buffer = state.buffer
	local buffer_size = state.buffer_size
	local ReadBits = state.ReadBits
	local Decode = state.Decode
	local ReaderBitlenLeft = state.ReaderBitlenLeft
	local result_buffer = state.result_buffer
	local dictionary = state.dictionary
	local dict_string_table, dict_strlen = nil
	local buffer_end = 1

	if dictionary and not buffer[0] then
		dict_string_table = dictionary.string_table
		dict_strlen = dictionary.strlen
		buffer_end = -dict_strlen + 1
		slot17 = 0
		slot18 = (-dict_strlen + 1 < -257 and -257) or -dict_strlen + 1

		for i = slot17, slot18, -1 do
			buffer[i] = _byte_to_char[dict_string_table[dict_strlen + i]]
		end
	end

	repeat
		local symbol = Decode(lcodes_huffman_bitlens, lcodes_huffman_symbols, lcodes_huffman_min_bitlen)

		if symbol < 0 or symbol > 285 then
			return -10
		elseif symbol < 256 then
			buffer_size = buffer_size + 1
			buffer[buffer_size] = _byte_to_char[symbol]
		elseif symbol > 256 then
			symbol = symbol - 256
			local bitlen = _literal_deflate_code_to_base_len[symbol]

			if symbol >= 8 then
				bitlen = bitlen + ReadBits(_literal_deflate_code_to_extra_bitlen[symbol]) or bitlen
			end

			symbol = Decode(dcodes_huffman_bitlens, dcodes_huffman_symbols, dcodes_huffman_min_bitlen)

			if symbol < 0 or symbol > 29 then
				return -10
			end

			local dist = _dist_deflate_code_to_base_dist[symbol]

			if dist > 4 then
				dist = dist + ReadBits(_dist_deflate_code_to_extra_bitlen[symbol]) or dist
			end

			local char_buffer_index = buffer_size - dist + 1

			if buffer_end > char_buffer_index then
				return -11
			end

			if char_buffer_index >= -257 then
				for _ = 1, bitlen, 1 do
					buffer_size = buffer_size + 1
					buffer[buffer_size] = buffer[char_buffer_index]
					char_buffer_index = char_buffer_index + 1
				end
			else
				char_buffer_index = dict_strlen + char_buffer_index

				for _ = 1, bitlen, 1 do
					buffer_size = buffer_size + 1
					buffer[buffer_size] = _byte_to_char[dict_string_table[char_buffer_index]]
					char_buffer_index = char_buffer_index + 1
				end
			end
		end

		if ReaderBitlenLeft() < 0 then
			return 2
		end

		if buffer_size >= 65536 then
			result_buffer[#result_buffer + 1] = table_concat(buffer, "", 1, 32768)

			for i = 32769, buffer_size, 1 do
				buffer[i - 32768] = buffer[i]
			end

			buffer_size = buffer_size - 32768
			buffer[buffer_size + 1] = nil
		end
	until symbol == 256

	state.buffer_size = buffer_size

	return 0
end

local function DecompressStoreBlock(state)
	local buffer = state.buffer
	local buffer_size = state.buffer_size
	local ReadBits = state.ReadBits
	local ReadBytes = state.ReadBytes
	local ReaderBitlenLeft = state.ReaderBitlenLeft
	local SkipToByteBoundary = state.SkipToByteBoundary
	local result_buffer = state.result_buffer

	SkipToByteBoundary()

	local bytelen = ReadBits(16)

	if ReaderBitlenLeft() < 0 then
		return 2
	end

	local bytelenComp = ReadBits(16)

	if ReaderBitlenLeft() < 0 then
		return 2
	end

	if bytelen % 256 + bytelenComp % 256 ~= 255 then
		return -2
	end

	if (bytelen - bytelen % 256) / 256 + (bytelenComp - bytelenComp % 256) / 256 ~= 255 then
		return -2
	end

	buffer_size = ReadBytes(bytelen, buffer, buffer_size)

	if buffer_size < 0 then
		return 2
	end

	if buffer_size >= 65536 then
		result_buffer[#result_buffer + 1] = table_concat(buffer, "", 1, 32768)

		for i = 32769, buffer_size, 1 do
			buffer[i - 32768] = buffer[i]
		end

		buffer_size = buffer_size - 32768
		buffer[buffer_size + 1] = nil
	end

	state.buffer_size = buffer_size

	return 0
end

local function DecompressFixBlock(state)
	return DecodeUntilEndOfBlock(state, _fix_block_literal_huffman_bitlen_count, _fix_block_literal_huffman_to_deflate_code, 7, _fix_block_dist_huffman_bitlen_count, _fix_block_dist_huffman_to_deflate_code, 5)
end

local function DecompressDynamicBlock(state)
	local ReadBits = state.ReadBits
	local Decode = state.Decode
	local nlen = ReadBits(5) + 257
	local ndist = ReadBits(5) + 1
	local ncode = ReadBits(4) + 4

	if nlen > 286 or ndist > 30 then
		return -3
	end

	local rle_codes_huffman_bitlens = {}

	for i = 1, ncode, 1 do
		rle_codes_huffman_bitlens[_rle_codes_huffman_bitlen_order[i]] = ReadBits(3)
	end

	local rle_codes_err, rle_codes_huffman_bitlen_counts, rle_codes_huffman_symbols, rle_codes_huffman_min_bitlen = GetHuffmanForDecode(rle_codes_huffman_bitlens, 18, 7)

	if rle_codes_err ~= 0 then
		return -4
	end

	local lcodes_huffman_bitlens = {}
	local dcodes_huffman_bitlens = {}
	local index = 0

	while index < nlen + ndist do
		local symbol, bitlen = nil
		symbol = Decode(rle_codes_huffman_bitlen_counts, rle_codes_huffman_symbols, rle_codes_huffman_min_bitlen)

		if symbol < 0 then
			return symbol
		elseif symbol < 16 then
			if index < nlen then
				lcodes_huffman_bitlens[index] = symbol
			else
				dcodes_huffman_bitlens[index - nlen] = symbol
			end

			index = index + 1
		else
			bitlen = 0

			if symbol == 16 then
				if index == 0 then
					return -5
				end

				if nlen > index - 1 then
					bitlen = lcodes_huffman_bitlens[index - 1]
				else
					bitlen = dcodes_huffman_bitlens[index - nlen - 1]
				end

				symbol = 3 + ReadBits(2)
			elseif symbol == 17 then
				symbol = 3 + ReadBits(3)
			else
				symbol = 11 + ReadBits(7)
			end

			if index + symbol > nlen + ndist then
				return -6
			end

			while symbol > 0 do
				symbol = symbol - 1

				if index < nlen then
					lcodes_huffman_bitlens[index] = bitlen
				else
					dcodes_huffman_bitlens[index - nlen] = bitlen
				end

				index = index + 1
			end
		end
	end

	if (lcodes_huffman_bitlens[256] or 0) == 0 then
		return -9
	end

	local lcodes_err, lcodes_huffman_bitlen_counts, lcodes_huffman_symbols, lcodes_huffman_min_bitlen = GetHuffmanForDecode(lcodes_huffman_bitlens, nlen - 1, 15)

	if lcodes_err ~= 0 and (lcodes_err < 0 or nlen ~= (lcodes_huffman_bitlen_counts[0] or 0) + (lcodes_huffman_bitlen_counts[1] or 0)) then
		return -7
	end

	local dcodes_err, dcodes_huffman_bitlen_counts, dcodes_huffman_symbols, dcodes_huffman_min_bitlen = GetHuffmanForDecode(dcodes_huffman_bitlens, ndist - 1, 15)

	if dcodes_err ~= 0 and (dcodes_err < 0 or ndist ~= (dcodes_huffman_bitlen_counts[0] or 0) + (dcodes_huffman_bitlen_counts[1] or 0)) then
		return -8
	end

	return DecodeUntilEndOfBlock(state, lcodes_huffman_bitlen_counts, lcodes_huffman_symbols, lcodes_huffman_min_bitlen, dcodes_huffman_bitlen_counts, dcodes_huffman_symbols, dcodes_huffman_min_bitlen)
end

local function Inflate(state)
	local ReadBits = state.ReadBits
	local is_last_block = nil

	while not is_last_block do
		is_last_block = ReadBits(1) == 1
		local block_type = ReadBits(2)
		local status = nil

		if block_type == 0 then
			status = DecompressStoreBlock(state)
		elseif block_type == 1 then
			status = DecompressFixBlock(state)
		elseif block_type == 2 then
			status = DecompressDynamicBlock(state)
		else
			return nil, -1
		end

		if status ~= 0 then
			return nil, status
		end
	end

	state.result_buffer[#state.result_buffer + 1] = table_concat(state.buffer, "", 1, state.buffer_size)
	local result = table_concat(state.result_buffer)

	return result
end

local function DecompressDeflateInternal(str, dictionary)
	local state = CreateDecompressState(str, dictionary)
	local result, status = Inflate(state)

	if not result then
		return nil, status
	end

	local bitlen_left = state.ReaderBitlenLeft()
	local bytelen_left = (bitlen_left - bitlen_left % 8) / 8

	return result, bytelen_left
end

LibDeflate.DecompressDeflate = function (self, str)
	local arg_valid, arg_err = IsValidArguments(str)

	if not arg_valid then
		error("Usage: LibDeflate:DecompressDeflate(str): " .. arg_err, 2)
	end

	return DecompressDeflateInternal(str)
end

_fix_block_literal_huffman_bitlen = {}

for sym = 0, 143, 1 do
	_fix_block_literal_huffman_bitlen[sym] = 8
end

for sym = 144, 255, 1 do
	_fix_block_literal_huffman_bitlen[sym] = 9
end

for sym = 256, 279, 1 do
	_fix_block_literal_huffman_bitlen[sym] = 7
end

for sym = 280, 287, 1 do
	_fix_block_literal_huffman_bitlen[sym] = 8
end

_fix_block_dist_huffman_bitlen = {}

for dist = 0, 31, 1 do
	_fix_block_dist_huffman_bitlen[dist] = 5
end

local status = nil
status, _fix_block_literal_huffman_bitlen_count, _fix_block_literal_huffman_to_deflate_code = GetHuffmanForDecode(_fix_block_literal_huffman_bitlen, 287, 9)

assert(status == 0)

status, _fix_block_dist_huffman_bitlen_count, _fix_block_dist_huffman_to_deflate_code = GetHuffmanForDecode(_fix_block_dist_huffman_bitlen, 31, 5)

assert(status == 0)

_fix_block_literal_huffman_code = GetHuffmanCodeFromBitlen(_fix_block_literal_huffman_bitlen_count, _fix_block_literal_huffman_bitlen, 287, 9)
_fix_block_dist_huffman_code = GetHuffmanCodeFromBitlen(_fix_block_dist_huffman_bitlen_count, _fix_block_dist_huffman_bitlen, 31, 5)

return LibDeflate
