Quaternion.yaw = function (q)
	local x, y, z, w = Quaternion.to_elements(q)

	return math.atan2(2 * (x * y + w * z), (w * w + x * x) - y * y - z * z)
end

Quaternion.pitch = function (q)
	local x, y, z, w = Quaternion.to_elements(q)

	return math.atan2(2 * (y * z + w * x), w * w - x * x - y * y + z * z)
end

Quaternion.roll = function (q)
	local x, y, z, w = Quaternion.to_elements(q)

	return math.asin(-2 * (x * z - w * y))
end

return
