-- chunkname: @scripts/utils/loaded_dice.lua

LoadedDice = {}

LoadedDice.create = function (probabilities, normalized)
	local n = #probabilities
	local alias = {}
	local prob = {}

	if normalized then
		prob = table.clone(probabilities)
	else
		local sum = 0

		for i = 1, n do
			sum = sum + probabilities[i]
		end

		for i = 1, n do
			prob[i] = probabilities[i] / sum
		end
	end

	local small = {}
	local large = {}
	local average = 1 / n

	for i = 1, n do
		if average <= prob[i] then
			large[#large + 1] = i
		else
			small[#small + 1] = i
		end
	end

	while next(small) ~= nil and next(large) ~= nil do
		local less = small[#small]

		small[#small] = nil

		local more = large[#large]

		large[#large] = nil
		alias[less] = more
		prob[more] = prob[more] + prob[less] - average

		if average <= prob[more] then
			large[#large + 1] = more
		else
			small[#small + 1] = more
		end
	end

	while next(small) ~= nil do
		prob[small[#small]] = average
		small[#small] = nil
	end

	while next(large) ~= nil do
		prob[large[#large]] = average
		large[#large] = nil
	end

	for i = 1, n do
		prob[i] = prob[i] * n
	end

	return prob, alias
end

LoadedDice.roll = function (prob, alias)
	local column = math.random(1, #prob)
	local biased_coin_toss = math.random() < prob[column]

	return biased_coin_toss and column or alias[column]
end

LoadedDice.roll_seeded = function (prob, alias, seed)
	local seed, column = Math.next_random(seed, 1, #prob)
	local seed, random_value = Math.next_random(seed)
	local biased_coin_toss = random_value < prob[column]

	return seed, biased_coin_toss and column or alias[column]
end

local only_prob_table = {}

LoadedDice.create_from_mixed = function (mixed_table, normalized)
	local only_prob_table = only_prob_table
	local num_probabilities = #mixed_table / 2

	for i = num_probabilities, #only_prob_table do
		only_prob_table[i] = nil
	end

	for i = 1, num_probabilities do
		only_prob_table[i] = mixed_table[i * 2]
	end

	local p, a = LoadedDice.create(only_prob_table, normalized)

	return {
		p,
		a,
	}
end

LoadedDice.roll_easy = function (loaded_table)
	return LoadedDice.roll(loaded_table[1], loaded_table[2])
end

LoadedDice.roll_easy_seeded = function (loaded_table, seed)
	return LoadedDice.roll_seeded(loaded_table[1], loaded_table[2], seed)
end

LoadedDice.test = function ()
	local test = {
		10,
		5,
		3,
		2,
	}
	local p, a = LoadedDice.create(test, false)
	local tries = 100000
	local count = {
		0,
		0,
		0,
		0,
	}

	for i = 1, tries do
		local column = LoadedDice.roll(p, a)

		count[column] = count[column] + 1
	end

	local s = "Loaded Dice | "

	for i = 1, #test do
		s = s .. test[i] .. "->" .. count[i] .. "( " .. count[i] / tries .. "% ) | "
	end

	print(s)
end
