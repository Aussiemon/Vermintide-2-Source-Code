DeusNewLoadoutSettings = DeusNewLoadoutSettings or {
	coin_formula = function (progress)
		return math.round(progress * 600)
	end
}
