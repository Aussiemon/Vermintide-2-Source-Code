Quaternion.yaw = function (q)
	local x, y, z, w = Quaternion.to_elements(q)

	return math.atan2((x*y + w*z)*2, (w*w + x*x) - y*y - z*z)
end
Quaternion.pitch = function (q)
	local x, y, z, w = Quaternion.to_elements(q)

	return math.atan2((y*z + w*x)*2, w*w - x*x - y*y + z*z)
end
Quaternion.roll = function (q)
	local x, y, z, w = Quaternion.to_elements(q)

	return math.asin((x*z - w*y)*-2)
end

return 
