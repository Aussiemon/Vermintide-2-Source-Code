-- chunkname: @scripts/settings/dlcs/morris/deus_new_loadout_settings.lua

DeusNewLoadoutSettings = DeusNewLoadoutSettings or {
	coin_formula = function (progress)
		return math.round(progress * 600)
	end,
}
