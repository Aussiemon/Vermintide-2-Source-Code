local math_round = math.round

local function scale_vector3(vec, scale, do_round)
	if do_round then
		return Vector3(math_round(vec[1] * scale), math_round(vec[2] * scale), vec[3] or 0)
	else
		return Vector3(vec[1] * scale, vec[2] * scale, vec[3] or 0)
	end
end

function UIScaleVectorToResolution(vec, pixel_snap)
	return scale_vector3(vec, RESOLUTION_LOOKUP.scale, pixel_snap)
end

function UIInverseScaleVectorToResolution(vec, pixel_snap)
	return scale_vector3(vec, RESOLUTION_LOOKUP.inv_scale, pixel_snap)
end

function UIScaleVectorToResolutionRealCoordinates(vec)
	local scale = RESOLUTION_LOOKUP.scale

	return Vector3(vec[1] * scale, vec[2] or 0, vec[3] * scale)
end
