if rawget(_G, "G_GAME_PATCHES_RUN") then
	return
end

rawset(_G, "G_GAME_PATCHES_RUN", true)

if not ANIMATION_HAS_VARIABLE_OVERRIDDEN then
	local old_animation_has_variable = Unit.animation_has_variable

	Unit.animation_has_variable = function (...)
		local ret = old_animation_has_variable(...)

		return (ret or 0) ~= 0
	end

	ANIMATION_HAS_VARIABLE_OVERRIDDEN = true
end
