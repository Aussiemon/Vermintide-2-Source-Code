-- chunkname: @scripts/utils/hash_utils.lua

HashUtils = HashUtils or {}

HashUtils.fnv32_hash = function (text)
	local counter = 1
	local len = string.len(text)

	for i = 1, len, 3 do
		counter = math.fmod(counter * 8161, 4294967279) + string.byte(text, i) * 16776193 + (string.byte(text, i + 1) or len - i + 256) * 8372226 + (string.byte(text, i + 2) or len - i + 256) * 3932164
	end

	return math.fmod(counter, 4294967291)
end
