TrueFlightUtility = TrueFlightUtility or {}

TrueFlightUtility.sort_prioritize_specials = function (targets)
	local order = table.mirror_array(targets)

	local function _prioritize_specials(unit_a, unit_b)
		local breed_a = Unit.get_data(unit_a, "breed")
		local breed_b = Unit.get_data(unit_b, "breed")

		if not breed_b or not breed_a then
			return breed_a or not breed_b and order[unit_a] < order[unit_b]
		end

		local special_a = breed_a.special
		local special_b = breed_b.special

		if special_a ~= special_b then
			return special_a
		end

		local elite_a = breed_a.elite
		local elite_b = breed_b.elite

		if elite_a ~= elite_b then
			return elite_a
		end

		return order[unit_a] < order[unit_b]
	end

	table.sort(targets, _prioritize_specials)

	return targets
end
