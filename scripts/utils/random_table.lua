if _G.RandomTable_n == nil then
	RandomTable_n = 100
	RandomTable_0_1 = {}
	RandomTable_05_05 = {}

	for i = 1, RandomTable_n, 1 do
		RandomTable_0_1[i] = math.random()
		RandomTable_05_05[i] = math.random() - 0.5
	end
end

local math_huge = math.huge

function RandomTable_get_0_to_1(seed)
	assert(seed ~= math_huge)

	local index = math.floor(seed%RandomTable_n) + 1

	assert(1 <= index and index <= RandomTable_n)

	return RandomTable_0_1[index]
end

function RandomTable_get_05_to_05(seed)
	assert(seed ~= math_huge)

	local index = math.floor(seed%RandomTable_n) + 1

	assert(1 <= index and index <= RandomTable_n)

	return RandomTable_05_05[index]
end

return 
