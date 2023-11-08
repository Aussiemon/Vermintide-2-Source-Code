Vector3.flat = function (v)
	return Vector3(v[1], v[2], 0)
end

Vector3.step = function (start, target, step_size)
	local offset = target - start
	local distance = Vector3.length(offset)

	if distance < step_size then
		return target, true
	else
		return start + Vector3.normalize(offset) * step_size, false
	end
end

Vector3.smoothstep = function (t, v1, v2)
	local smoothstep = math.smoothstep(t, 0, 1)

	return Vector3.lerp(v1, v2, smoothstep)
end

Vector3.flat_angle = function (v1, v2)
	local a1 = math.atan2(v1.y, v1.x)
	local a2 = math.atan2(v2.y, v2.x)

	return (a2 - a1 + math.pi) % (2 * math.pi) - math.pi
end

Vector3.clamp = function (v, min, max)
	local x, y, z = Vector3.to_elements(v)
	local clamp = math.clamp

	return Vector3(clamp(x, min, max), clamp(y, min, max), clamp(z, min, max))
end

Vector3.clamp_3d = function (v, min, max)
	local x, y, z = Vector3.to_elements(v)

	return Vector3(math.clamp(x, min[1], max[1]), math.clamp(y, min[2], max[2]), math.clamp(z, min[3], max[3]))
end

Vector3.invalid_vector = function ()
	return Vector3(math.huge, math.huge, math.huge)
end

Vector3.copy = function (v)
	local x, y, z = Vector3.to_elements(v)

	return Vector3(x, y, z)
end

Vector3.deprecated_copy = function (vector)
	return Vector3(vector[1], vector[2], vector[3])
end

Vector3.project_on_plane = function (vector, normal)
	return vector - Vector3.dot(vector, normal) * normal
end

Vector3.reflect = function (vector, surface_normal)
	return vector - 2 * Vector3.dot(vector, surface_normal) * surface_normal
end

Vector3.rotate = function (vector, angle, optional_axis)
	optional_axis = optional_axis or Vector3.up()

	return Quaternion.rotate(Quaternion.axis_angle(optional_axis, angle), vector)
end

Vector3Aux = Vector3Aux or {}

Vector3Aux.box = function (destination, vector_3)
	destination = destination or {}
	destination[1], destination[2], destination[3] = Vector3.to_elements(vector_3)

	return destination
end

Vector3Aux.unbox = function (boxed_vector)
	return Vector3(boxed_vector[1], boxed_vector[2], boxed_vector[3])
end
