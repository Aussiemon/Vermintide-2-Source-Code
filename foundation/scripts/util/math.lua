math.degrees_to_radians = function (degrees)
	return degrees * 0.0174532925
end

math.radians_to_degrees = function (radians)
	return radians * 57.2957795
end

math.sign = function (x)
	if x > 0 then
		return 1
	elseif x < 0 then
		return -1
	else
		return 0
	end
end

math.clamp = function (value, min, max)
	if max < value then
		return max
	elseif value < min then
		return min
	else
		return value
	end
end

math.lerp = function (a, b, p)
	return a * (1 - p) + b * p
end

math.radian_lerp = function (a, b, p)
	local pi = math.pi
	local half_pi = math.pi * 0.5

	return a + (((b - a) % pi + pi + half_pi) % pi - half_pi) * p
end

math.angle_lerp = function (a, b, p)
	return a + (((b - a) % 360 + 540) % 360 - 180) * p
end

math.radian_lerp = function (a, b, p)
	a = math.radians_to_degrees(a)
	b = math.radians_to_degrees(b)

	return math.degrees_to_radians(math.angle_lerp(a, b, p))
end

math.sirp = function (a, b, t)
	local p = 0.5 + 0.5 * math.cos((1 + t) * math.pi)

	return math.lerp(a, b, p)
end

math.auto_lerp = function (index_1, index_2, val_1, val_2, val)
	local t = (val - index_1) / (index_2 - index_1)

	return math.lerp(val_1, val_2, t)
end

math.round_with_precision = function (value, precision)
	local mul = 10^(precision or 0)

	return math.floor(value * mul + 0.5) / mul
end

math.round = function (value_in)
	local value = value_in

	return math.floor(value + 0.5)
end

math.smoothstep = function (value, min, max)
	local x = math.clamp((value - min) / (max - min), 0, 1)

	return x^3 * (x * (x * 6 - 15) + 10)
end

Math.random_range = function (min, max)
	return min + Math.random() * (max - min)
end

math.half_pi = math.pi * 0.5
math.inverse_sqrt_2 = 1 / math.sqrt(2)

math.point_is_inside_2d_box = function (pos, lower_left_corner, size)
	if lower_left_corner[1] < pos[1] and pos[1] < lower_left_corner[1] + size[1] and lower_left_corner[2] < pos[2] and pos[2] < lower_left_corner[2] + size[2] then
		return true
	else
		return false
	end
end

math.box_overlap_box = function (box_pos, box_extent, box2_pos, box2_extent)
	if box_pos[1] < box2_pos[1] + box2_extent[1] and box2_pos[1] < box_pos[1] + box_extent[1] and box_pos[2] < box2_pos[2] + box2_extent[2] and box2_pos[2] < box_pos[2] + box_extent[2] then
		return true
	else
		return false
	end
end

math.point_is_inside_aabb = function (pos, aabb_pos, aabb_half_extents)
	if pos.x < aabb_pos.x - aabb_half_extents.x then
		return false
	end

	if pos.x > aabb_pos.x + aabb_half_extents.x then
		return false
	end

	if pos.y < aabb_pos.y - aabb_half_extents.y then
		return false
	end

	if pos.y > aabb_pos.y + aabb_half_extents.y then
		return false
	end

	if pos.z < aabb_pos.z - aabb_half_extents.z then
		return false
	end

	if pos.z > aabb_pos.z + aabb_half_extents.z then
		return false
	end

	return true
end

math.point_is_inside_oobb = function (pos, oobb_pose, oobb_radius)
	local to_local_matrix = Matrix4x4.inverse(oobb_pose)
	local local_pos = Matrix4x4.transform(to_local_matrix, pos)

	if local_pos.x > -oobb_radius[1] and local_pos.x < oobb_radius[1] and local_pos.y > -oobb_radius[2] and local_pos.y < oobb_radius[2] and local_pos.z > -oobb_radius[3] and local_pos.z < oobb_radius[3] then
		return true
	else
		return false
	end
end

math.point_is_inside_2d_triangle = function (pos, p1, p2, p3)
	local pa = p1 - pos
	local pb = p2 - pos
	local pc = p3 - pos
	local pab_n = Vector3.cross(pa, pb)
	local pbc_n = Vector3.cross(pb, pc)

	if Vector3.dot(pab_n, pbc_n) < 0 then
		return false
	end

	local pca_n = Vector3.cross(pc, pa)
	local best_normal = (Vector3.dot(pbc_n, pbc_n) < Vector3.dot(pab_n, pab_n) and pab_n) or pbc_n
	local dot_product = Vector3.dot(best_normal, pca_n)

	if dot_product < 0 then
		return false
	elseif dot_product > 0 then
		return true
	else
		local min_p = Vector3.min(pa, Vector3.min(pb, pc))
		local max_p = Vector3.max(pa, Vector3.max(pb, pc))

		return min_p.x <= 0 and min_p.y <= 0 and max_p.x >= 0 and max_p.y >= 0
	end
end

math.cartesian_to_polar = function (x, y)
	fassert(x ~= 0 and y ~= 0, "Can't convert a zero vector to polar coordinates")

	local radius = math.sqrt(x * x + y * y)
	local theta = math.atan(y / x) * 180 / math.pi

	if x < 0 then
		theta = theta + 180
	elseif y < 0 then
		theta = theta + 360
	end

	return radius, theta
end

math.circular_to_square_coordinates = function (v)
	local u = v.x
	local v = v.y
	local uu = u * u
	local vv = v * v
	local sqrt = math.sqrt
	local max = math.max
	local sqrt_2 = sqrt(2)
	local x = 0.5 * (sqrt(max((2 + 2 * u * sqrt_2 + uu) - vv, 0)) - sqrt(max((2 - 2 * u * sqrt_2 + uu) - vv, 0)))
	local y = 0.5 * (sqrt(max((2 + 2 * v * sqrt_2) - uu + vv, 0)) - sqrt(max(2 - 2 * v * sqrt_2 - uu + vv, 0)))

	return Vector3(x, y, 0)
end

math.polar_to_cartesian = function (radius, theta)
	local theta_rad = theta * math.pi / 180
	local x = radius * math.cos(theta_rad)
	local y = radius * math.sin(theta_rad)

	return x, y
end

math.catmullrom = function (t, p0, p1, p2, p3)
	return 0.5 * (2 * p1 + (-p0 + p2) * t + ((2 * p0 - 5 * p1 + 4 * p2) - p3) * t * t + ((-p0 + 3 * p1) - 3 * p2 + p3) * t * t * t)
end

math.closest_position = function (p0, p1, p2)
	local p0_p1_dist_sq = Vector3.distance_squared(p0, p1)
	local p0_p2_dist_sq = Vector3.distance_squared(p0, p2)

	if p0_p1_dist_sq <= p0_p2_dist_sq then
		return p1
	else
		return p2
	end
end

Geometry = Geometry or {}

Geometry.is_point_inside_triangle = function (point_on_plane, tri_a, tri_b, tri_c)
	local pa = tri_a - point_on_plane
	local pb = tri_b - point_on_plane
	local pc = tri_c - point_on_plane
	local pab_n = Vector3.cross(pa, pb)
	local pbc_n = Vector3.cross(pb, pc)

	if Vector3.dot(pab_n, pbc_n) < 0 then
		return false
	end

	local pca_n = Vector3.cross(pc, pa)
	local best_normal = (Vector3.dot(pbc_n, pbc_n) < Vector3.dot(pab_n, pab_n) and pab_n) or pbc_n
	local dot_product = Vector3.dot(best_normal, pca_n)

	if dot_product < 0 then
		return false
	elseif dot_product > 0 then
		return true
	else
		local min_p = Vector3.min(pa, Vector3.min(pb, pc))
		local max_p = Vector3.max(pa, Vector3.max(pb, pc))

		return min_p.x <= 0 and min_p.y <= 0 and min_p.z <= 0 and max_p.x >= 0 and max_p.y >= 0 and max_p.z >= 0
	end
end

local Vector3_dot = Vector3 and Vector3.dot

Geometry.closest_point_on_line = function (p, p1, p2)
	local diff = p - p1
	local dir = p2 - p1
	local dot1 = Vector3_dot(diff, dir)

	if dot1 <= 0 then
		return p1
	end

	local dot2 = Vector3_dot(dir, dir)

	if dot2 <= dot1 then
		return p2
	end

	local t = dot1 / dot2

	return p1 + t * dir
end

Geometry.closest_point_on_line = EngineOptimized.closest_point_on_line

Geometry.closest_point_on_polyline = function (point, points, start_index, end_index)
	local vector3_distance_squared = Vector3.distance_squared
	local closest_point_on_line = Geometry.closest_point_on_line
	start_index = start_index or 1
	end_index = end_index or #points
	local shortest_distance = math.huge
	local result_position, result_index = nil

	for i = start_index, end_index - 1, 1 do
		local p1 = points[i]
		local p2 = points[i + 1]
		local projected_point = closest_point_on_line(point, p1, p2)
		local distance = vector3_distance_squared(projected_point, point)

		if distance < shortest_distance then
			shortest_distance = distance
			result_position = projected_point
			result_index = i
		end
	end

	return result_position, result_index
end

Intersect = Intersect or {}

Intersect.ray_line = function (ray_from, ray_direction, line_point_a, line_point_b)
	local distance_along_ray, normalized_distance_along_line = Intersect.line_line(ray_from, ray_from + ray_direction, line_point_a, line_point_b)

	if distance_along_ray == nil then
		return nil, nil
	elseif distance_along_ray < 0 then
		return nil, nil
	else
		return distance_along_ray, normalized_distance_along_line
	end
end

Intersect.ray_box = function (from, direction, pose, radius)
	local is_ray_origin_inside_box = Math.point_in_box(from, pose, radius)

	if is_ray_origin_inside_box then
		return 0
	end

	local distance_along_ray = Math.ray_box_intersection(from, direction, pose, radius)
	local is_box_missed_by_ray = distance_along_ray < 0

	if is_box_missed_by_ray then
		return nil
	end

	return distance_along_ray
end

Intersect.line_line = function (line_a_pt1, line_a_pt2, line_b_pt1, line_b_pt2)
	local line_a_vector = line_a_pt2 - line_a_pt1
	local line_b_vector = line_b_pt2 - line_b_pt1
	local a = Vector3.dot(line_a_vector, line_a_vector)
	local e = Vector3.dot(line_b_vector, line_b_vector)
	local b = Vector3.dot(line_a_vector, line_b_vector)
	local d = a * e - b * b

	if d < 0.001 then
		return nil, nil
	end

	local r = line_a_pt1 - line_b_pt1
	local c = Vector3.dot(line_a_vector, r)
	local f = Vector3.dot(line_b_vector, r)
	local normalized_distance_along_line_a = (b * f - c * e) / d
	local normalized_distance_along_line_b = (a * f - b * c) / d

	return normalized_distance_along_line_a, normalized_distance_along_line_b
end

Intersect.ray_segment = function (ray_from, ray_direction, segment_start, segment_end)
	local distance_along_ray, normalized_distance_along_line = Intersect.ray_line(ray_from, ray_direction, segment_start, segment_end)
	local is_line_parallel_to_or_behind_ray = distance_along_ray == nil

	if is_line_parallel_to_or_behind_ray then
		return nil
	end

	local is_intersection_inside_segment = normalized_distance_along_line >= 0 and normalized_distance_along_line <= 1

	if is_intersection_inside_segment then
		return distance_along_ray, normalized_distance_along_line
	else
		return nil, nil
	end
end

math.ease_exp = function (t)
	if t < 0.5 then
		return 0.5 * math.pow(2, 20 * (t - 0.5))
	end

	return 1 - 0.5 * math.pow(2, 20 * (0.5 - t))
end

math.ease_in_exp = function (t)
	return math.pow(2, 10 * (t - 1))
end

math.ease_out_exp = function (t)
	return 1 - math.pow(2, -10 * t)
end

math.easeCubic = function (t)
	t = t * 2

	if t < 1 then
		return 0.5 * t * t * t
	end

	t = t - 2

	return 0.5 * t * t * t + 1
end

math.easeInCubic = function (t)
	return t * t * t
end

math.easeOutCubic = function (t)
	t = t - 1

	return t * t * t + 1
end

math.ease_out_quad = function (t)
	return -1 * t * (t - 2)
end

local math_ease_cubic = math.easeCubic

math.ease_pulse = function (t)
	if t < 0.5 then
		return math_ease_cubic(2 * t)
	else
		return math_ease_cubic(2 - 2 * t)
	end
end

math.bounce = function (t)
	return math.abs(math.sin(6.28 * (t + 1) * (t + 1)) * (1 - t))
end

math.ease_out_elastic = function (t)
	local s = 1.70158
	local p = 0
	local a = 1

	if t == 0 then
		return 0
	end

	if t == 1 then
		return 1
	end

	if p == 0 then
		p = 0.3
	end

	if a < 1 then
		a = 1
		s = p / 4
	else
		s = p / (2 * math.pi) * math.asin(1 / a)
	end

	return a * math.pow(2, -10 * t) * math.sin(((t * 1 - s) * 2 * math.pi) / p) + 1
end

local function internal_rand_normal()
	local x1, x2, w, y1, y2 = nil

	repeat
		x1 = 2 * math.random() - 1
		x2 = 2 * math.random() - 1
		w = x1 * x1 + x2 * x2
	until w < 1

	w = math.sqrt((-2 * math.log(w)) / w)
	y1 = x1 * w
	y2 = x2 * w

	return y1, y2
end

math.rand_normal = function (min, max, variance, strict_min, strict_max)
	local average = (min + max) / 2

	if variance == nil then
		variance = 2.4
	end

	local escala = (max - average) / variance
	local x = escala * internal_rand_normal() + average

	if strict_min ~= nil then
		x = math.max(x, strict_min)
	end

	if strict_max ~= nil then
		x = math.min(x, strict_max)
	end

	return x
end

math.rand_utf8_string = function (string_length, ignore_chars)
	fassert(string_length > 0, "String length passed to math.rand_string has to be greater than 0")

	ignore_chars = ignore_chars or {
		"\"",
		"'",
		"\\",
		" "
	}
	local array = {}

	for i = 1, string_length, 1 do
		local char = nil

		while not char or table.contains(ignore_chars, char) do
			char = string.char(math.random(32, 126))
		end

		array[i] = char
	end

	return table.concat(array)
end

math.uuid = function ()
	local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"

	return string.gsub(template, "[xy]", function (c)
		local v = (c == "x" and math.random(0, 15)) or math.random(8, 11)

		return string.format("%x", v)
	end)
end

math.get_uniformly_random_point_inside_sector = function (radius1, radius2, angle1, angle2)
	local radius1_squared = radius1 * radius1
	local radius2_squared = radius2 * radius2
	local angle = angle1 + (angle2 - angle1) * Math.random()
	local r = math.sqrt(radius1_squared + (radius2_squared - radius1_squared) * Math.random())
	local dx = r * math.sin(angle)
	local dy = r * math.cos(angle)

	return dx, dy
end

math.clamp_direction = function (direction, clamp_direction, xy_angle, z_angle)
	local direction_xy_rotation = Quaternion.look(direction)
	local direction_xy_angle = Quaternion.angle(direction_xy_rotation)
	local clamp_direction_xy_rotation = Quaternion.look(clamp_direction)
	local clamp_direction_xy_angle = Quaternion.angle(clamp_direction_xy_rotation)
	local result = Vector3(math.cos(direction_xy_angle) * math.cos(z_angle), math.sin(direction_xy_angle) * math.cos(z_angle), math.sin(z_angle))

	return result
end

math.random_seed = function ()
	return Math.random(2147483647)
end

math.distance_2d = function (x1, y1, x2, y2)
	return ((x2 - x1)^2 + (y2 - y1)^2)^0.5
end

math.diststance_3d = function (x1, y1, z1, x2, y2, z2)
	return ((x2 - x1)^2 + (y2 - y1)^2 + (z2 - z1)^2)^0.5
end

math.angle = function (x1, y1, x2, y2)
	return math.atan2(y2 - y1, x2 - x1)
end

math.index_wrapper = function (index, max_index)
	return (index - 1) % max_index + 1
end

return
