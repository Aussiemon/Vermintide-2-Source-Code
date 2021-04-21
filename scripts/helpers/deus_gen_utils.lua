DeusGenUtils = DeusGenUtils or {}

DeusGenUtils.create_random_generator = function (seed)
	return function (first_bound, second_bound)
		local val = nil

		if first_bound then
			seed, val = Math.next_random(seed, first_bound, second_bound)
		else
			seed, val = Math.next_random(seed)
		end

		return val, seed
	end
end

return
